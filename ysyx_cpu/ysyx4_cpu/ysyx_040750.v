module ysyx_040750_alu(
    input I_sys_clk,
    input I_rst,
    input [63:0] I_op1,
    input [63:0] I_op2,
    input [14:0] I_alu_op_sel,
    input [1:0] I_alu_op_sext,
    input I_word_op_mask,
    input I_multicycle,
    input I_EX_MEM_ready,
    input [63:0] I_csr_data,
    input [4:0] I_uimm,
    input [5:0] I_csr_op_sel,
    output [63:0] O_result,
    //output [63:0] O_mem_addr,
    output [63:0] O_csr_data,
    output O_result_valid
);
    ysyx_040750_gpr_alu gpr_alu_e(
    .I_sys_clk(I_sys_clk),
    .I_rst(I_rst),
		.I_csr_data(I_csr_data),
		.I_op1(I_op1),
		.I_op2(I_op2),
		.I_alu_op_sel(I_alu_op_sel),
		.I_alu_op_sext(I_alu_op_sext),
		.I_word_op_mask(I_word_op_mask),
		.I_multicycle(I_multicycle),
		.I_EX_MEM_ready(I_EX_MEM_ready),
		//.O_mem_addr(O_mem_addr),
		.O_result(O_result),
		.O_result_valid(O_result_valid)
    );

    ysyx_040750_csr_alu csr_alu_e(
		.I_csr_data(I_csr_data),
		.I_rs_data(I_op1),
		.I_uimm(I_uimm),
		.I_csr_op_sel(I_csr_op_sel),
		.O_csr_data(O_csr_data)
	);
endmodule
module ysyx_040750_axi_crossbar(
    input I_clk,
    input I_rst,
    // to axi bus
    input [63:0] I_axi_rdata,
    input I_axi_rvalid,
    input I_axi_rlast,
    output O_axi_rready,
    output [31:0] O_axi_araddr,
    input I_axi_arready,
    output O_axi_arvalid,
    output [7:0] O_axi_arlen,
    output [2:0] O_axi_arsize,
    output [1:0] O_axi_arburst,
    // ch0
    output [63:0] O_ch0_rdata,
    output O_ch0_rvalid,
    output O_ch0_rlast,
    input I_ch0_rready,
    input [31:0] I_ch0_araddr,
    output O_ch0_arready,
    input I_ch0_arvalid,
    input [7:0] I_ch0_arlen,
    input [2:0] I_ch0_arsize,
    input [1:0] I_ch0_arburst,
    // ch1
    output [63:0] O_ch1_rdata,
    output O_ch1_rvalid,
    output O_ch1_rlast,
    input I_ch1_rready,
    input [31:0] I_ch1_araddr,
    output O_ch1_arready,
    input I_ch1_arvalid,
    input [7:0] I_ch1_arlen,
    input [2:0] I_ch1_arsize,
    input [1:0] I_ch1_arburst
);
    localparam CH0 = 1'b0;
    localparam CH1 = 1'b1;
    localparam IDLE = 'h0;
    localparam CH0_AR = 'h1;
    localparam CH1_AR = 'h2;
    localparam CH0_RD = 'h4;
    localparam CH1_RD = 'h8;
    reg [3:0] current_state, next_state;
    wire req0_only, req1_only, req_both;// current channel req state
    wire resp0, resp1;// channel should be responsed
    wire ch0_arhandshake, ch1_arhandshake;
    wire ch0_last_handshake, ch1_last_handshake;
    // reg ch0_process, ch1_process;
    wire ch0_ar_flag, ch1_ar_flag, ch0_rd_flag, ch1_rd_flag;
    reg priority_flag;
    // FSM
    always @(posedge I_clk)
        if(I_rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    always @(*) begin
        next_state = IDLE;
        case(current_state)
            IDLE: begin
                if(ch0_arhandshake)
                    next_state = CH0_RD;
                else if(ch1_arhandshake)
                    next_state = CH1_RD;
                else
                    next_state = resp0 ? CH0_AR : resp1 ? CH1_AR : current_state;
            end
            CH0_AR: next_state = ch0_arhandshake ? CH0_RD : current_state;
            CH1_AR: next_state = ch1_arhandshake ? CH1_RD : current_state;
            CH0_RD: next_state = ch0_last_handshake ? IDLE : current_state;
            CH1_RD: next_state = ch1_last_handshake ? IDLE : current_state;
        endcase
    end
    // ar/rd flag
    assign ch0_ar_flag = resp0 | (current_state == CH0_AR);
    assign ch0_rd_flag = (current_state == CH0_RD);
    assign ch1_ar_flag = resp1 | (current_state == CH1_AR);
    assign ch1_rd_flag = (current_state == CH1_RD);
    // req state, imply which channel is requesting memory data
    assign ch0_arhandshake = O_ch0_arready && I_ch0_arvalid;
    assign ch1_arhandshake = O_ch1_arready && I_ch1_arvalid;
    assign req0_only = I_ch0_arvalid && ~I_ch1_arvalid;
    assign req1_only = ~I_ch0_arvalid && I_ch1_arvalid;
    assign req_both = I_ch0_arvalid && I_ch1_arvalid;
    // ar response flag, imply which channel will be responsed at IDLE state
    // if ar handshake, FSM goto RD state, else goto AR state for certain channel
    // assign resp0 = (req0_only || (req_both && (priority_flag == CH0))) && ~(ch0_process || ch1_process);
    // assign resp1 = (req1_only || (req_both && (priority_flag == CH1))) && ~(ch0_process || ch1_process);
    assign resp0 = (req0_only || (req_both && (priority_flag == CH0))) && (current_state == IDLE);
    assign resp1 = (req1_only || (req_both && (priority_flag == CH1))) && (current_state == IDLE);
    // ar channel
    // assign O_ch0_arready = resp0 && I_axi_arready;
    // assign O_ch1_arready = resp1 && I_axi_arready;
    // assign O_axi_arvalid = resp0 ? I_ch0_arvalid : (resp1 ? I_ch1_arvalid : 0);
    // assign O_axi_araddr = resp0 ? I_ch0_araddr : (resp1 ? I_ch1_araddr : 0);
    // assign O_axi_arlen = resp0 ? I_ch0_arlen : (resp1 ? I_ch1_arlen : 0);
    // assign O_axi_arsize = resp0 ? I_ch0_arsize : (resp1 ? I_ch1_arsize : 0);
    // assign O_axi_arburst = resp0 ? I_ch0_arburst : (resp1 ? I_ch1_arburst : 0);
    assign O_ch0_arready = ch0_ar_flag && I_axi_arready;
    assign O_ch1_arready = ch1_ar_flag && I_axi_arready;
    assign O_axi_arvalid = ch0_ar_flag ? I_ch0_arvalid : (ch1_ar_flag ? I_ch1_arvalid : 0);
    assign O_axi_araddr = ch0_ar_flag ? I_ch0_araddr : (ch1_ar_flag ? I_ch1_araddr : 0);
    assign O_axi_arlen = ch0_ar_flag ? I_ch0_arlen : (ch1_ar_flag ? I_ch1_arlen : 0);
    assign O_axi_arsize = ch0_ar_flag ? I_ch0_arsize : (ch1_ar_flag ? I_ch1_arsize : 0);
    assign O_axi_arburst = ch0_ar_flag ? I_ch0_arburst : (ch1_ar_flag ? I_ch1_arburst : 0);
    // r channel
    assign ch0_last_handshake = O_ch0_rvalid && I_ch0_rready && O_ch0_rlast;
    assign ch1_last_handshake = O_ch1_rvalid && I_ch1_rready && O_ch1_rlast;
    assign O_axi_rready = ch0_rd_flag ? I_ch0_rready : (ch1_rd_flag ? I_ch1_rready : 0);
    assign O_ch0_rdata = ch0_rd_flag ? I_axi_rdata : 0;
    assign O_ch0_rvalid = ch0_rd_flag ? I_axi_rvalid : 0;
    assign O_ch0_rlast = ch0_rd_flag ? I_axi_rlast : 0;
    assign O_ch1_rdata = ch1_rd_flag ? I_axi_rdata : 0;
    assign O_ch1_rvalid = ch1_rd_flag ? I_axi_rvalid : 0;
    assign O_ch1_rlast = ch1_rd_flag ? I_axi_rlast : 0;
    // assign O_axi_rready = ch0_process ? I_ch0_rready : (ch1_process ? I_ch1_rready : 0);
    // assign O_ch0_rdata = ch0_process ? I_axi_rdata : 0;
    // assign O_ch0_rvalid = ch0_process ? I_axi_rvalid : 0;
    // assign O_ch0_rlast = ch0_process ? I_axi_rlast : 0;
    // assign O_ch1_rdata = ch1_process ? I_axi_rdata : 0;
    // assign O_ch1_rvalid = ch1_process ? I_axi_rvalid : 0;
    // assign O_ch1_rlast = ch1_process ? I_axi_rlast : 0;
    // always @(posedge I_clk)
    //     if(I_rst)
    //         ch0_process <= 0;
    //     else if(resp0 && ch0_arhandshake)
    //         ch0_process <= 1;
    //     else if(ch0_last_handshake)
    //         ch0_process <= 0;
    //     else
    //         ch0_process <= ch0_process;
    // always @(posedge I_clk)
    //     if(I_rst)
    //         ch1_process <= 0;
    //     else if(resp1 && ch1_arhandshake)
    //         ch1_process <= 1;
    //     else if(ch1_last_handshake)
    //         ch1_process <= 0;
    //     else
    //         ch1_process <= ch1_process;
    // default ch0, change flag when current prior channel is responsed
    always @(posedge I_clk)
        if(I_rst)
            priority_flag <= CH0;
        else if(resp0 && ~priority_flag)
            priority_flag <= CH1;
        else if(resp1 && priority_flag)
            priority_flag <= CH0;
        else
            priority_flag <= priority_flag;
    /*always @(posedge I_clk)
        if(I_rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    always @(*) begin
        next_state = IDLE;
        case(current_state)
            IDLE: next_state = resp0 ? RESP0 : (resp1 ? RESP1 : IDLE);
            RESP0:
            RESP1:
        endcase
    end*/
    
endmodule
module ysyx_040750_booth_mul_serial(
    input clk,
    input rst,
    input [63:0] mul1,
    input [63:0] mul2,
    //input is_signed,
    input [1:0] sext_flag,
    input mul_valid,
    output P_valid,
    output [127:0] P
    );
    // sign extention flag
    wire sgn_ext1,sgn_ext2;
    // radix 4 booth mul
    reg [66:0] booth_mul1;
    // normal mul
    reg [131:0] booth_mul2;
    // booth partial sum & product
    wire [131:0] partial_sum;
    wire partial_c;
    reg [131:0] mid_result;
    wire [2:0] booth;
    wire [131:0] S;// 132 bit addend A
    wire Ci;// 132 bit adder carry_in
    // wire end_flag;
    reg mul_process;
    reg [5:0] iter_cnt;
    // mul num
    //assign {sgn_ext1,sgn_ext2} = {mul1[63]&is_signed,mul2[63]&is_signed};
    assign {sgn_ext1, sgn_ext2} = {mul1[63] & sext_flag[1], mul2[63] & sext_flag[0]};
    always @(posedge clk)
        if(rst)
            booth_mul1 <= 0;
        else if(mul_valid)
            booth_mul1 <= {{2{sgn_ext1}},mul1,1'b0};
        else
            booth_mul1 <= {2'b0,booth_mul1[66:2]};
    always @(posedge clk)
        if(rst)
            booth_mul2 <= 0;
        else if(mul_valid)
            booth_mul2 <= {{68{sgn_ext2}},mul2};
        else
            booth_mul2 <= {booth_mul2[129:0],2'b0};
    assign booth = booth_mul1[2:0];
    // booth mul
    ysyx_040750_radix4_unit radix4_unit_e(booth,booth_mul2,partial_sum,partial_c);
    // mid sum
    always @(posedge clk)
        if(rst)
            mid_result <= 0;
        else if(mul_valid)
            mid_result <= 0;
        else
            mid_result <= S;
    // 132 bit adder
    assign Ci = partial_c;
    assign S = partial_sum + mid_result + {131'b0,Ci};
//    always @(posedge clk)
//        if(rst)
//            S <= 0;
//        else
//            S <= partial_sum + S + Ci;
    assign P = S[127:0];
    // output valid
    always @(posedge clk)
        if(rst)
            mul_process <= 0;
        else if(mul_valid)
            mul_process <= 1;
        else if(P_valid)
            mul_process <= 0;
        else
            mul_process <= mul_process;
    //assign P_valid = ~|booth_mul1[66:1] & mul_process;
    
    always @(posedge clk)
        if(rst)
            iter_cnt <= 0;
        else if(P_valid)
            iter_cnt <= 0;
        else if(mul_process)
            iter_cnt <= iter_cnt + 1;
        else
            iter_cnt <= 0;
    assign P_valid = (iter_cnt[5]) || (~|booth_mul1[66:1] & mul_process);
    //assign out_valid = (iter_cnt == 33);
//    assign end_flag = ~&booth_mul1 & mul_process;
//    always @(posedge clk)
//        if(rst)
//            P_valid <= 0;
//        else if(iter_cnt == 32)
//            P_valid <= 1;
//        else
//            P_valid <= 0;
endmodule
module ysyx_040750_cache(
    input I_clk,
    input I_rst,
    // pc & pc valid
    input [31:0] I_cpu_pc,
    input I_cpu_pc_valid,
    output O_cpu_pc_ready,
    output O_cpu_mem_ready,
    // fencei
    input I_inst_fencei,
    input I_mem_fencei,
    // cpu addr & w/r req
    input [31:0] I_cpu_addr,
    input [7:0] I_cpu_wmask,
    input I_cpu_rd_req,
    input I_cpu_wr_req,
    input [63:0] I_cpu_wdata,
    // cache w/r addr & req, low level valid en
    input [127:0] I_sram0_rdata,
    input [127:0] I_sram1_rdata,
    input [127:0] I_sram2_rdata,
    input [127:0] I_sram3_rdata,
    input [127:0] I_sram4_rdata,
    input [127:0] I_sram5_rdata,
    input [127:0] I_sram6_rdata,
    input [127:0] I_sram7_rdata,
    // ixxx -> icache, dxxx -> dcache
    output [5:0] O_sram_iaddr,
    output [5:0] O_sram_daddr,
    output [7:0] O_sram_cen,
    output [7:0] O_sram_wen,
    output [127:0] O_sram0_wdata,
    output [127:0] O_sram1_wdata,
    output [127:0] O_sram2_wdata,
    output [127:0] O_sram3_wdata,
    output [127:0] O_sram4_wdata,
    output [127:0] O_sram5_wdata,
    output [127:0] O_sram6_wdata,
    output [127:0] O_sram7_wdata,
    output [127:0] O_sram0_wmask,
    output [127:0] O_sram1_wmask,
    output [127:0] O_sram2_wmask,
    output [127:0] O_sram3_wmask,
    output [127:0] O_sram4_wmask,
    output [127:0] O_sram5_wmask,
    output [127:0] O_sram6_wmask,
    output [127:0] O_sram7_wmask,
    // mem data, w/r addr & req
    // axi interface(unused slave interface)
    input [63:0] I_mem_rdata,
    input I_mem_rvalid,
    output O_mem_rready,
    input I_mem_rlast,

    output [31:0] O_mem_araddr,
    input I_mem_arready,
    output O_mem_arvalid,
    output [7:0] O_mem_arlen,
    output [2:0] O_mem_arsize,
    output [1:0] O_mem_arburst,

    output [63:0] O_mem_wdata,
    output O_mem_wvalid,
    input I_mem_wready,
    output O_mem_wlast,
    output [7:0] O_mem_wstrb,

    output [31:0] O_mem_awaddr,
    output O_mem_awvalid,
    input I_mem_awready,
    output [7:0] O_mem_awlen,
    output [2:0] O_mem_awsize,
    output [1:0] O_mem_awburst,

    input I_mem_bvalid,
    output O_mem_bready,
     // data & valid flag to cpu
    output [63:0] O_cpu_rdata,
    output [31:0] O_cpu_inst,
    output O_cpu_inst_valid,
    output O_cpu_rvalid,
    output O_cpu_bvalid
);
    // fence.i
    wire dcache_clean;
    // sram data & ctrl signal
    // cen [7:0] for 8 bram, [3:0] for icache, [7:4] for dcache
    // 3-8 decoder produce one-hot cen, {isdcache_op, index[6:5]} -> cen[7:0]
    wire [3:0] icache_cen, icache_wen;
    wire [255:0] icache_way0_rdata, icache_way1_rdata;
    wire [255:0] icache_wdata, icache_wmask;
    wire [3:0] dcache_cen, dcache_wen;
    wire [255:0] dcache_way0_rdata, dcache_way1_rdata;
    wire [255:0] dcache_wdata, dcache_wmask;
    // axi data & ctrl signal
    // icache will not use w & aw & b channel
    // r channel
    wire [63:0] axi_icache_rdata, axi_dcache_rdata;
    wire axi_icache_rready, axi_dcache_rready;
    wire axi_icache_rvalid, axi_dcache_rvalid;
    wire axi_icache_rlast, axi_dcache_rlast;
    // ar channel
    wire [31:0] axi_icache_araddr, axi_dcache_araddr;
    wire axi_icache_arready, axi_dcache_arready;
    wire axi_icache_arvalid, axi_dcache_arvalid;
    wire [7:0] axi_icache_arlen, axi_dcache_arlen;
    wire [2:0] axi_icache_arsize, axi_dcache_arsize;
    wire [1:0] axi_icache_arburst, axi_dcache_arburst;
    // w channel
    wire [63:0] axi_dcache_wdata;
    wire axi_dcache_wvalid, axi_dcache_wready, axi_dcache_wlast;
    wire [7:0] axi_dcache_wstrb;
    // aw channel
    wire [31:0] axi_dcache_awaddr;
    wire axi_dcache_awvalid, axi_dcache_awready;
    wire [7:0] axi_dcache_awlen;
    wire [2:0] axi_dcache_awsize;
    wire [1:0] axi_dcache_awburst;
    // b channel
    wire axi_dcache_bvalid, axi_dcache_bready;

    assign O_sram_cen = {dcache_cen, icache_cen};
    assign O_sram_wen = {dcache_wen, icache_wen};
    assign icache_way0_rdata = {I_sram1_rdata, I_sram0_rdata};
    assign icache_way1_rdata = {I_sram3_rdata, I_sram2_rdata};
    assign dcache_way0_rdata = {I_sram5_rdata, I_sram4_rdata};
    assign dcache_way1_rdata = {I_sram7_rdata, I_sram6_rdata};
    // wdata & wmask is boardcasted to sram, enabled by wen/cen
    assign {O_sram1_wdata, O_sram0_wdata} = icache_wdata;
    assign {O_sram3_wdata, O_sram2_wdata} = icache_wdata;
    assign {O_sram1_wmask, O_sram0_wmask} = icache_wmask;
    assign {O_sram3_wmask, O_sram2_wmask} = icache_wmask;
    assign {O_sram5_wdata, O_sram4_wdata} = dcache_wdata;
    assign {O_sram7_wdata, O_sram6_wdata} = dcache_wdata;
    assign {O_sram5_wmask, O_sram4_wmask} = dcache_wmask;
    assign {O_sram7_wmask, O_sram6_wmask} = dcache_wmask;
    // mem w signal, used by dcache only
    assign O_mem_wdata = axi_dcache_wdata;
    assign O_mem_wvalid = axi_dcache_wvalid;
    assign axi_dcache_wready = I_mem_wready;
    assign O_mem_wlast = axi_dcache_wlast;
    assign O_mem_wstrb = axi_dcache_wstrb;
    assign O_mem_awaddr = axi_dcache_awaddr;
    assign O_mem_awvalid = axi_dcache_awvalid;
    assign axi_dcache_awready = I_mem_awready;
    assign O_mem_awlen = axi_dcache_awlen;
    assign O_mem_awsize = axi_dcache_awsize;
    assign O_mem_awburst = axi_dcache_awburst;
    assign axi_dcache_bvalid = I_mem_bvalid;
    assign O_mem_bready = axi_dcache_bready;
    // axi crossbar(simplified for ar & r ch only)
    ysyx_040750_axi_crossbar crossbar_e(
        .I_clk(I_clk),
        .I_rst(I_rst),
        // to axi bus
        .I_axi_rdata(I_mem_rdata),
        .I_axi_rvalid(I_mem_rvalid),
        .I_axi_rlast(I_mem_rlast),
        .O_axi_rready(O_mem_rready),
        .O_axi_araddr(O_mem_araddr),
        .I_axi_arready(I_mem_arready),
        .O_axi_arvalid(O_mem_arvalid),
        .O_axi_arlen(O_mem_arlen),
        .O_axi_arsize(O_mem_arsize),
        .O_axi_arburst(O_mem_arburst),
        // ch0: icache
        .O_ch0_rdata(axi_icache_rdata),
        .O_ch0_rvalid(axi_icache_rvalid),
        .O_ch0_rlast(axi_icache_rlast),
        .I_ch0_rready(axi_icache_rready),
        .I_ch0_araddr(axi_icache_araddr),
        .O_ch0_arready(axi_icache_arready),
        .I_ch0_arvalid(axi_icache_arvalid),
        .I_ch0_arlen(axi_icache_arlen),
        .I_ch0_arsize(axi_icache_arsize),
        .I_ch0_arburst(axi_icache_arburst),
        // ch1: dcache
        .O_ch1_rdata(axi_dcache_rdata),
        .O_ch1_rvalid(axi_dcache_rvalid),
        .O_ch1_rlast(axi_dcache_rlast),
        .I_ch1_rready(axi_dcache_rready),
        .I_ch1_araddr(axi_dcache_araddr),
        .O_ch1_arready(axi_dcache_arready),
        .I_ch1_arvalid(axi_dcache_arvalid),
        .I_ch1_arlen(axi_dcache_arlen),
        .I_ch1_arsize(axi_dcache_arsize),
        .I_ch1_arburst(axi_dcache_arburst)
    );
    // icache
    ysyx_040750_icachectrl icache_e(
        .I_clk(I_clk),
        .I_rst(I_rst),
        .I_cpu_addr(I_cpu_pc),
        .I_cpu_rd_req(I_cpu_pc_valid),
        .O_cpu_rd_ready(O_cpu_pc_ready),
        .I_cpu_fencei(I_inst_fencei),
        .I_dcache_clean(dcache_clean),
        .I_way0_rdata(icache_way0_rdata),
        .I_way1_rdata(icache_way1_rdata),
        .O_sram_addr(O_sram_iaddr),
        .O_sram_cen(icache_cen),
        .O_sram_wen(icache_wen),
        .O_sram_wdata(icache_wdata),
        .O_sram_wmask(icache_wmask),
        .I_mem_rdata(axi_icache_rdata),
        .I_mem_arready(axi_icache_arready),
        .I_mem_rvalid(axi_icache_rvalid),
        .I_mem_rlast(axi_icache_rlast),
        .O_mem_araddr(axi_icache_araddr),
        .O_mem_arvalid(axi_icache_arvalid),
        .O_mem_rready(axi_icache_rready),
        .O_mem_arlen(axi_icache_arlen),
        .O_mem_arsize(axi_icache_arsize),
        .O_mem_arburst(axi_icache_arburst),
        // data & valid flag to cpu
        .O_cpu_inst(O_cpu_inst),
        .O_cpu_rvalid(O_cpu_inst_valid)
    );
    // dcache
    ysyx_040750_dcachectrl dcache_e(
        .I_clk(I_clk),
        .I_rst(I_rst),
        .I_cpu_addr(I_cpu_addr),
        .I_cpu_data(I_cpu_wdata),
        .I_cpu_wmask(I_cpu_wmask),
        .I_cpu_rd_req(I_cpu_rd_req),
        .I_cpu_wr_req(I_cpu_wr_req),
        .I_cpu_fencei(I_mem_fencei),
        .O_dcache_clean(dcache_clean),
        .O_cpu_mem_ready(O_cpu_mem_ready),
        .I_way0_rdata(dcache_way0_rdata),
        .I_way1_rdata(dcache_way1_rdata),
        .O_sram_addr(O_sram_daddr),
        .O_sram_cen(dcache_cen),
        .O_sram_wen(dcache_wen),
        .O_sram_wdata(dcache_wdata),
        .O_sram_wmask(dcache_wmask),
        .I_mem_rdata(axi_dcache_rdata),
        .I_mem_arready(axi_dcache_arready),
        .I_mem_rvalid(axi_dcache_rvalid),
        .I_mem_rlast(axi_dcache_rlast),
        .O_mem_araddr(axi_dcache_araddr),
        .O_mem_arvalid(axi_dcache_arvalid),
        .O_mem_rready(axi_dcache_rready),
        .O_mem_arlen(axi_dcache_arlen),
        .O_mem_arsize(axi_dcache_arsize),
        .O_mem_arburst(axi_dcache_arburst),
        .I_mem_awready(axi_dcache_awready),
        .I_mem_wready(axi_dcache_wready),
        .I_mem_bvalid(axi_dcache_bvalid),
        .O_mem_wdata(axi_dcache_wdata),
        .O_mem_awaddr(axi_dcache_awaddr),
        .O_mem_awvalid(axi_dcache_awvalid),
        .O_mem_wvalid(axi_dcache_wvalid),
        .O_mem_bready(axi_dcache_bready),
        .O_mem_wlast(axi_dcache_wlast),
        .O_mem_awlen(axi_dcache_awlen),
        .O_mem_awsize(axi_dcache_awsize),
        .O_mem_awburst(axi_dcache_awburst),
        .O_mem_wstrb(axi_dcache_wstrb),
        // data & valid flag to cpu
        .O_cpu_data(O_cpu_rdata),
        .O_cpu_rvalid(O_cpu_rvalid),
        .O_cpu_bvalid(O_cpu_bvalid)
    );
endmodule
module ysyx_040750_clint(
    input I_clk,
    input I_rst,
    output O_mtip,
    output reg [63:0] O_clint_rdata, 
    output O_clint_rvalid, 
    input I_clint_rready, 
    input [31:0] I_clint_araddr, 
    output O_clint_arready, 
    input I_clint_arvalid, 
    input [63:0] I_clint_wdata, 
    input I_clint_wvalid, 
    output O_clint_wready, 
    input [7:0] I_clint_wstrb, 
    input [31:0] I_clint_awaddr, 
    input I_clint_awvalid, 
    output O_clint_awready, 
    output O_clint_bvalid, 
    input I_clint_bready
);
    parameter BASE_ADDR = 'h02000000;
    parameter MTIMECMP_ADDR = 'h4000 + BASE_ADDR;
    parameter MTIME_ADDR = 'hBFF8 + BASE_ADDR;
    // parameter TICKCNT = 12'h01;
    reg [63:0] mtime, mtimecmp;
    // reg [11:0] tick_cnt;
    wire [63:0] bitmask;
    // wire incr_en;
    wire ar_handshake, aw_handshake, r_handshake, w_handshake;
    reg wr_mtime, rd_mtime, wr_mtimecmp, rd_mtimecmp;
    genvar i;
    for (i=0;i<8;i=i+1) begin
        assign bitmask[8*i +: 8] = {8{I_clint_wstrb[i]}};
    end
    assign ar_handshake = I_clint_arvalid && O_clint_arready;
    assign aw_handshake = I_clint_awvalid && O_clint_awready;
    assign r_handshake = O_clint_rvalid && I_clint_rready;
    assign w_handshake = I_clint_wvalid && O_clint_wready;
    //axi const
    assign O_clint_arready = 1;
    assign O_clint_wready = 1;
    assign O_clint_awready = 1;
    assign O_clint_bvalid = w_handshake;// whandshake correspond reg writeback
    assign O_clint_rvalid = rd_mtime | rd_mtimecmp;
    assign O_mtip = (mtime >= mtimecmp);
    // assign incr_en = (tick_cnt == TICKCNT-1);
    always @(posedge I_clk)
        if(I_rst)
            {wr_mtime, wr_mtimecmp} <= 0;
        else if(aw_handshake)
            {wr_mtime, wr_mtimecmp} <= {(I_clint_awaddr == MTIME_ADDR), (I_clint_awaddr == MTIMECMP_ADDR)};
        else if(w_handshake)
            {wr_mtime, wr_mtimecmp} <= 0;
        else
            {wr_mtime, wr_mtimecmp} <= {wr_mtime, wr_mtimecmp};
    always @(posedge I_clk)
        if(I_rst)
            {rd_mtime, rd_mtimecmp} <= 0;
        else if(ar_handshake)
            {rd_mtime, rd_mtimecmp} <= {(I_clint_araddr == MTIME_ADDR), (I_clint_araddr == MTIMECMP_ADDR)};
        else if(r_handshake)
            {rd_mtime, rd_mtimecmp} <= 0;
        else
            {rd_mtime, rd_mtimecmp} <= {rd_mtime, rd_mtimecmp};
    // should mtime be read only?
    always @(posedge I_clk)
        if(I_rst)
            mtime <= 0;
        else if(wr_mtime && w_handshake)
            mtime <= (mtime & (~bitmask)) | (I_clint_wdata & bitmask);
        // else if(incr_en)
        //     mtime <= mtime + 1;
        else
            mtime <= mtime + 1;
    always @(posedge I_clk)
        if(I_rst)
            mtimecmp <= 0;
        else if(wr_mtimecmp  && w_handshake)
            mtimecmp <= (mtimecmp  & (~bitmask)) | (I_clint_wdata & bitmask);
        else
            mtimecmp <= mtimecmp;

    // always @(posedge I_clk)
    //     if(I_rst)
    //         tick_cnt <= 0;
    //     else
    //         tick_cnt <= incr_en ? 0 : tick_cnt + 1;

    always @(*)
        case({rd_mtime, rd_mtimecmp})
            'b10: O_clint_rdata = mtime;
            'b01: O_clint_rdata = mtimecmp;
            default: O_clint_rdata = 0;
        endcase
endmodule
module ysyx_040750_cpu_core(
    input I_sys_clk,
    input I_rst,
	input I_mtip,
    input [31:0] I_inst,
    input I_inst_valid,
	input I_pc_ready,
	input I_mem_ready,
    output [31:0] O_pc,
    output O_pc_valid,
    output [31:0] O_mem_addr,
    output O_mem_rd_en,
    output O_mem_wen,
    input [63:0] I_mem_rd_data,
    input I_mem_rd_data_valid,
	input I_mem_wr_data_valid,
    output [63:0] O_mem_wr_data,
    output [7:0] O_mem_wr_strb,
	output O_inst_fencei,// icache fence.i
	output O_mem_fencei
    //output O_sim_end
    );
    wire [31:0] current_pc,dnpc,snpc;
    wire [31:0] current_inst;
	//wire [31:0] mem_addr;
    wire [63:0] imm,wr_data,rs1_data,rs2_data,alu_op1,alu_op2,alu_out,mem_in,mem_out,csr_rd_data,alu_csr_data;
    wire [4:0] rs1_addr,rs2_addr,rd_addr;
    //wire [2:0] funct3;
    wire [3:0] dnpc_sel;
    wire [1:0] regin_sel;
    wire [2:0] opnum1_sel;
    wire [2:0] opnum2_sel;
    wire [14:0] alu_op_sel;
    wire [7:0] mem_wstrb;
    wire [8:0] mem_rstrb; // strb generated by inst(ignore addr offt)
    //wire [7:0] mem_rmask; // actual valid mask
    wire reg_wen,mem_wen;
    wire word_op_mask;
    wire [1:0] alu_op_sext;
	// csr
	wire [11:0] csr_addr;
	wire csr_wen, csr_intr, csr_mret;
	wire [5:0] csr_op_sel;
	wire [4:0] csr_uimm;
	wire [63:0] csr_intr_no;
    //IF_ID
    wire IF_valid;
    wire [31:0] IF_ID_pc;
    wire [31:0] IF_ID_inst;
	wire IF_ID_timer_intr;
    wire IF_ID_allowin;
    wire IF_ID_valid;
    wire IF_ID_stall;
    wire IF_ID_bubble;
    wire IF_ID_input_valid;
    //ID_EX
    wire [63:0] ID_EX_imm, ID_EX_rs1, ID_EX_rs2, ID_EX_csr;
    wire [31:0] ID_EX_pc;
	wire [4:0] ID_EX_rd_addr;
    wire [7:0] ID_EX_wstrb;
    wire [8:0] ID_EX_rstrb;
    wire [2:0] ID_EX_op2_sel,ID_EX_op1_sel;
    wire [1:0] ID_EX_alu_sext,ID_EX_regin_sel;
    wire [14:0] ID_EX_alu_op_sel;
    wire ID_EX_reg_wen, ID_EX_mem_wen;
    wire ID_EX_word_op_mask;
    wire ID_EX_valid;
    wire ID_EX_allowin;
    wire [1:0] ID_EX_stall;
    // wire [31:0] ID_EX_inst;
    // wire ID_EX_bubble;
    wire ID_EX_input_valid;
    wire ID_EX_alu_multicycle;
    wire alu_out_valid;
	wire [11:0] ID_EX_csr_addr;
	wire ID_EX_csr_wen, ID_EX_csr_intr, ID_EX_csr_mret;
	wire [5:0] ID_EX_csr_op_sel;
	wire [4:0] ID_EX_csr_uimm;
	wire [63:0] ID_EX_csr_intr_no;
    //EX_MEM
    wire EX_MEM_valid;
    wire [8:0] EX_MEM_rstrb;
    wire [7:0] EX_MEM_wstrb;
	wire [31:0] EX_MEM_mem_addr;
    wire [63:0] EX_MEM_alu_out, EX_MEM_rs2, EX_MEM_csr;
    // wire EX_MEM_mem_wen;// indicate mem wr stage, maybe multicycle
	wire EX_MEM_mem_rd_en, EX_MEM_mem_wr_en;// actual single cycle valid flag
    wire [31:0] EX_MEM_pc;
    //wire [63:0] EX_MEM_mem_data;
    wire EX_MEM_reg_wen;
    wire [4:0] EX_MEM_rd_addr;
    wire [1:0] EX_MEM_regin_sel;
    wire [2:0] EX_MEM_shamt;// mem wr shamt
    wire EX_MEM_allowin;
    wire [1:0] EX_MEM_stall;
    // wire [31:0] EX_MEM_inst;
    // wire EX_MEM_bubble;
    wire EX_MEM_input_valid;
    wire [11:0] EX_MEM_csr_addr;
	wire EX_MEM_csr_wen, EX_MEM_csr_intr, EX_MEM_csr_mret;
	//wire [6:0] EX_MEM_csr_op_sel;
	//wire [4:0] EX_MEM_csr_uimm;
	wire [63:0] EX_MEM_csr_intr_no;
    //MEM_WB
    wire [31:0] MEM_WB_pc;
    wire MEM_WB_valid;
    wire [63:0] MEM_WB_mem_data;
    wire [8:0] MEM_WB_mem_rstrb;
    wire [63:0] MEM_WB_alu_out;
	wire [63:0] MEM_WB_csr;
    wire MEM_WB_reg_wen;
    wire [4:0] MEM_WB_rd_addr;
    wire [1:0] MEM_WB_regin_sel;
    wire [2:0] MEM_WB_shamt;// mem rd shamt
    wire MEM_WB_allowin;
    // wire [31:0] MEM_WB_inst;
    // wire MEM_WB_bubble;
    wire MEM_WB_input_valid;
    wire [1:0] MEM_WB_stall;
    wire [11:0] MEM_WB_csr_addr;
	wire MEM_WB_csr_wen, MEM_WB_csr_intr, MEM_WB_csr_mret;
	//wire [6:0] MEM_WB_csr_op_sel;
	//wire [4:0] MEM_WB_csr_uimm;
	wire [63:0] MEM_WB_csr_intr_no;
    // pipeline stall & forward
    wire [1:0] stall_en;
    wire [63:0] rs1_forward_data, rs2_forward_data, csr_forward_data;
    // debug
    // wire EX_MEM_mem_op, MEM_WB_mem_op;
    // wire [31:0] MEM_WB_mem_addr;
	// timer intr
	wire timer_intr;// final intr
	wire csr_timer_intr;
	// fence.i
	wire fencei;
	reg fencei_d;
	wire ID_EX_fencei;
	wire EX_MEM_fencei;
	// wire ID_EX_mtip;
	// wire EX_MEM_mtip;
	// wire MEM_WB_mtip;
    // import "DPI-C" function void set_wb_ptr(input logic a []);
    // initial set_wb_ptr(MEM_WB_valid);
    // import "DPI-C" function void set_wb_bubble_ptr(input logic a []);
    // initial set_wb_bubble_ptr(MEM_WB_bubble);
    // import "DPI-C" function void set_wb_pc_ptr(input logic [31:0] a []);
    // initial set_wb_pc_ptr(MEM_WB_pc);
    // // import "DPI-C" function void set_skip_pc_ptr(input logic [31:0] a []);
    // // initial set_skip_pc_ptr(EX_MEM_pc);
    // import "DPI-C" function void set_wb_inst_ptr(input logic [31:0] a []);
    // initial set_wb_inst_ptr(MEM_WB_inst);
    // import "DPI-C" function void set_wb_memop_ptr(input logic a []);
    // initial set_wb_memop_ptr(MEM_WB_mem_op);
    // import "DPI-C" function void set_wb_memaddr_ptr(input logic [31:0] a []);
    // initial set_wb_memaddr_ptr(MEM_WB_mem_addr);
	// import "DPI-C" function void set_cpu_mem_addr(input logic [31:0] a []);
    // initial set_cpu_mem_addr(EX_MEM_mem_addr);
	// import "DPI-C" function void set_cpu_rd_data(input logic [63:0] a []);
    // initial set_cpu_rd_data(I_mem_rd_data);
	// import "DPI-C" function void set_cpu_wr_data(input logic [63:0] a []);
    // initial set_cpu_wr_data(O_mem_wr_data);
	// import "DPI-C" function void set_cpu_rd_valid(input logic a []);
    // initial set_cpu_rd_valid(I_mem_rd_data_valid);
	// import "DPI-C" function void set_cpu_wr_valid(input logic a []);
    // initial set_cpu_wr_valid(O_mem_wen);
    // import "DPI-C" function void sim_end();
    // always @(posedge I_sys_clk)
    // 	if ((MEM_WB_inst == 32'h00100073) && !I_rst)
    // 	    sim_end();
    //top layer signal
    assign snpc = current_pc + 4;
    //assign O_pc = current_pc;
    assign O_pc = dnpc;
    //assign mem_in = I_mem_rd_data;
    //assign O_mem_rd_en = EX_MEM_regin_sel[1];
    //assign O_mem_wr_data = mem_out;
    assign O_mem_addr = EX_MEM_mem_addr;
	assign EX_MEM_mem_addr = EX_MEM_alu_out[31:0];
    //assign O_mem_wen = EX_MEM_mem_wen & EX_MEM_valid;
	assign O_mem_wen = EX_MEM_mem_wr_en;
    assign O_mem_rd_en = EX_MEM_mem_rd_en;// single cycle rd_en generate internally
    assign EX_MEM_shamt = EX_MEM_mem_addr[2:0];
    assign O_mem_wr_strb = EX_MEM_wstrb << EX_MEM_shamt;
    //assign mem_rmask = mem_rstrb[7:0] << mem_addr[2:0];
    assign mem_out = EX_MEM_rs2;
	// fencei
	assign fencei = dnpc_sel[3];
	always @(posedge I_sys_clk)
		if(I_rst)
			fencei_d <= 0;
		else
			fencei_d <= fencei;
	assign O_inst_fencei = fencei & ~fencei_d;// from IF_ID, halt pc_ready
	assign O_mem_fencei = EX_MEM_fencei & EX_MEM_valid;// from EX_MEM, wb dcache
    
    ysyx_040750_npc npc_e(
		.I_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_pc_valid(O_pc_valid),
		.I_pc_ready(I_pc_ready),
		.I_IF_ID_valid(IF_ID_valid && !IF_ID_bubble),
    	// stall
    	//.I_rs1_data(rs1_data),
    	//.I_rs2_data(rs2_data),
    	// forward
    	.I_rs1_data(rs1_forward_data[31:0]),
    	// .I_rs2_data(rs2_forward_data[31:0]),
		.I_intr_pc(csr_forward_data[31:0]),
    	.I_imm(imm[31:0]),
    	.I_pc(IF_ID_pc),// for jal addr cal
    	.I_snpc(snpc),
    	.I_dnpc_sel(dnpc_sel),
    	.O_dnpc(dnpc)
    );
    
    //wire inst_ready; //indicate IMEM can receive pc
    //assign inst_ready = 1;
    ysyx_040750_pc pc_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_dnpc(dnpc),
		.I_inst(I_inst),
		.I_inst_valid(I_inst_valid),
		.I_inst_ready(I_pc_ready),
		.I_IF_ID_allowin(IF_ID_allowin),
		.I_fencei(O_inst_fencei),
		.O_IF_valid(IF_valid),
		.O_pc(current_pc),
		.O_inst(current_inst),
		.O_pc_valid(O_pc_valid)
    );
    
    ysyx_040750_IF_ID_reg IF_ID_reg_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_pc(current_pc),
		.I_inst(current_inst),
		.I_timer_intr(timer_intr),
		.I_ID_timer_intr(timer_intr & IF_ID_timer_intr),
		.I_IF_ID_valid(IF_valid),
		.I_IF_ID_allowout(ID_EX_allowin),
		.I_IF_ID_stall(IF_ID_stall),
		.I_IF_ID_jmp(!dnpc_sel[0]),
		.O_IF_ID_allowin(IF_ID_allowin),
		.O_pc(IF_ID_pc),
		.O_inst(IF_ID_inst),
		.O_timer_intr(IF_ID_timer_intr),
		.O_IF_ID_input_valid(IF_ID_input_valid),
		.O_IF_ID_valid(IF_ID_valid),
		.O_IF_ID_bubble_inst(IF_ID_bubble)
    );
    
    ysyx_040750_stall_unit stall_unit_e(
		.I_rs1_addr(rs1_addr),// from ID only
		.I_rs2_addr(rs2_addr),// from ID only
		.I_ID_valid(IF_ID_input_valid),// IF_ID input valid
		.I_EX_rd_addr(ID_EX_rd_addr),// 
		.I_EX_valid(ID_EX_input_valid),// ID_EX input valid
		.I_EX_mem_rd_en(ID_EX_regin_sel[1]),
		.I_EX_alu_multcycle(|ID_EX_alu_op_sel[13:10]),
		.I_MEM_rd_addr(EX_MEM_rd_addr),// 
		.I_MEM_valid(EX_MEM_input_valid),// EX_MEM input valid
		.I_MEM_mem_rd_en(EX_MEM_regin_sel[1]),
		.I_WB_rd_addr(MEM_WB_rd_addr),// 
		.I_WB_valid(MEM_WB_input_valid),// MEM_WB input valid
		.I_stall_en(stall_en),// [1] for rs1, [0] for rs2 enable
		.I_EX_intr(ID_EX_csr_mret | ID_EX_csr_intr),
		.I_MEM_intr(EX_MEM_csr_mret | EX_MEM_csr_intr),
		.I_WB_intr(MEM_WB_csr_mret | MEM_WB_csr_intr),
		.O_ID_stall(IF_ID_stall),
		.O_EX_stall(ID_EX_stall),
		.O_MEM_stall(EX_MEM_stall),
		.O_WB_stall(MEM_WB_stall)
	);
	
    ysyx_040750_forward_unit forward_unit_e(
    	.I_ID_rs1_data(rs1_data),// ID_EX out to alu
    	.I_ID_rs2_data(rs2_data),// ID_EX out to alu
    	.I_EX_data(alu_out),// alu out
    	.I_MEM_data(EX_MEM_alu_out),// also out only currently
    	.I_WB_data(wr_data),// wb port
    	// .I_stall_en(stall_en),
    	.I_EX_stall(ID_EX_stall),
    	.I_MEM_stall(EX_MEM_stall),
    	.I_WB_stall(MEM_WB_stall),
    	.I_EX_reg_wen(ID_EX_reg_wen),
    	.I_MEM_reg_wen(EX_MEM_reg_wen),
    	.I_WB_reg_wen(MEM_WB_reg_wen & MEM_WB_valid),
    	.O_ID_EX_rs1_data(rs1_forward_data),
    	.O_ID_EX_rs2_data(rs2_forward_data)
	);

	ysyx_040750_csr_foward csr_foward_e(
		.I_csr_ID(csr_rd_data),
		.I_csr_EX(ID_EX_csr),
		.I_csr_MEM(EX_MEM_csr),
		.I_csr_WB(MEM_WB_csr),
		.I_csr_addr_ID(csr_addr),
		.I_csr_addr_EX(ID_EX_csr_addr),
		.I_csr_addr_MEM(EX_MEM_csr_addr),
		.I_csr_addr_WB(MEM_WB_csr_addr),
		.I_csr_wen_ID(csr_wen),
		.I_csr_wen_EX(ID_EX_csr_wen),
		.I_csr_wen_MEM(EX_MEM_csr_wen),
		.I_csr_wen_WB(MEM_WB_csr_wen),
		.O_csr_foward_data(csr_forward_data)
	);
	
    ysyx_040750_decoder decoder_e(
		// .I_sys_clk(I_sys_clk),
		// .I_rst(I_rst),
		.I_inst(IF_ID_inst),
		.O_imm(imm),
		.I_timer_intr(IF_ID_timer_intr & timer_intr),
		// pipline stall
		//.I_rs1_data(rs1_data),
		// forward
		.I_rs1_data(rs1_forward_data),
		.O_rs1(rs1_addr),
		// pipline stall
		//.I_rs2_data(rs2_data),
		// forward
		.I_rs2_data(rs2_forward_data),
		.O_rs2(rs2_addr),
		.O_rd(rd_addr),
		.O_reg_wen(reg_wen),
		.O_mem_wen(mem_wen),
		.O_mem_wstrb(mem_wstrb),
		.O_mem_rstrb(mem_rstrb),
		.O_dnpc_sel(dnpc_sel),
		.O_regin_sel(regin_sel),
		.O_opnum1_sel(opnum1_sel),
		.O_opnum2_sel(opnum2_sel),
		.O_alu_op_sel(alu_op_sel),
		.O_alu_op_sext(alu_op_sext),
		.O_csr_op_sel(csr_op_sel),// EX
		.O_csr_imm(csr_uimm),// EX
		.O_csr_addr(csr_addr),// ID & WB
		.O_csr_wen(csr_wen),// WB
		.O_csr_intr(csr_intr),// ID & WB
		.O_csr_intr_no(csr_intr_no),// WB
		.O_csr_mret(csr_mret),// ID & WB
		.O_word_op_mask(word_op_mask),
		.O_stall_en(stall_en)
    );
    
    ysyx_040750_ID_EX_reg ID_EX_reg_e(
		// ctrl signal
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_ID_EX_valid(IF_ID_valid),
		.I_ID_EX_allowout(EX_MEM_allowin),
		.O_ID_EX_allowin(ID_EX_allowin),
		.O_ID_EX_valid(ID_EX_valid),
		.I_alu_output_valid(alu_out_valid),
		// ID_EX signal
		.I_imm(imm),
		// pipeline stall code
		//.I_rs1(rs1_data),
		//.I_rs2(rs2_data),
		// forward code
		.I_rs1(rs1_forward_data),
		.I_rs2(rs2_forward_data),
		.I_rd_addr(rd_addr),
		.I_reg_wen(reg_wen),
		.I_mem_wen(mem_wen),
		.I_wstrb(mem_wstrb),
		.I_rstrb(mem_rstrb),
		.I_regin_sel(regin_sel),
		.I_op1_sel(opnum1_sel),
		.I_op2_sel(opnum2_sel),
		.I_alu_sext(alu_op_sext),
		.I_alu_op_sel(alu_op_sel),
		.I_word_op_mask(word_op_mask),
		.I_csr_op_sel(csr_op_sel),
		.I_csr_imm(csr_uimm),
		.I_csr_addr(csr_addr),
		.I_csr_wen(csr_wen),
		.I_csr_intr(csr_intr),
		.I_csr_intr_no(csr_intr_no),
		.I_csr(csr_forward_data),
		.I_csr_mret(csr_mret),
		.I_fencei(fencei),
		.O_csr_op_sel(ID_EX_csr_op_sel),
		.O_csr_imm(ID_EX_csr_uimm),
		.O_csr_addr(ID_EX_csr_addr),
		.O_csr_wen(ID_EX_csr_wen),
		.O_csr_intr(ID_EX_csr_intr),
		// .O_csr_mtip(ID_EX_mtip),
		.O_csr_intr_no(ID_EX_csr_intr_no),
		.O_csr(ID_EX_csr),
		.O_csr_mret(ID_EX_csr_mret),
		.O_imm(ID_EX_imm),
		.O_rs1(ID_EX_rs1),
		.O_rs2(ID_EX_rs2),
		.O_rd_addr(ID_EX_rd_addr),
		.O_reg_wen(ID_EX_reg_wen),
		.O_mem_wen(ID_EX_mem_wen),
		.O_wstrb(ID_EX_wstrb),
		.O_rstrb(ID_EX_rstrb),
		.O_regin_sel(ID_EX_regin_sel),
		.O_op1_sel(ID_EX_op1_sel),
		.O_op2_sel(ID_EX_op2_sel),
		.O_alu_sext(ID_EX_alu_sext),
		.O_alu_op_sel(ID_EX_alu_op_sel),
		.O_word_op_mask(ID_EX_word_op_mask),
		.O_fencei(ID_EX_fencei),
		// IF_ID signal
		.I_pc(IF_ID_pc),
		.O_pc(ID_EX_pc),
		.O_ID_EX_input_valid(ID_EX_input_valid),
		.O_alu_multicycle(ID_EX_alu_multicycle)
		// .I_inst_debug(IF_ID_inst),
		// .O_inst_debug(ID_EX_inst),
		// .I_bubble_inst_debug(IF_ID_bubble),
		// .O_bubble_inst_debug(ID_EX_bubble)
    );
    
    ysyx_040750_mux_Nbit_Msel #(64, 3)
		alu_op1_64bit_3sel (
		.I_sel_data({64'b0,{32'b0, ID_EX_pc},ID_EX_rs1}),
		.I_sel(ID_EX_op1_sel),
		.O_sel_data(alu_op1)
    );
    
    ysyx_040750_mux_Nbit_Msel #(64, 3)
		alu_op2_64bit_3sel (
		.I_sel_data({64'd4,ID_EX_imm,ID_EX_rs2}),
		.I_sel(ID_EX_op2_sel),
		.O_sel_data(alu_op2)
    );
    
	ysyx_040750_alu alu_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_op1(alu_op1),
		.I_op2(alu_op2),
		.I_alu_op_sel(ID_EX_alu_op_sel),
		.I_alu_op_sext(ID_EX_alu_sext),
		.I_word_op_mask(ID_EX_word_op_mask),
		.I_multicycle(ID_EX_alu_multicycle),
		.I_EX_MEM_ready(EX_MEM_allowin),
		.I_csr_data(ID_EX_csr),
		.I_uimm(ID_EX_csr_uimm),
		.I_csr_op_sel(ID_EX_csr_op_sel),
		//.O_mem_addr(mem_addr),
		.O_result(alu_out),
		.O_csr_data(alu_csr_data),
		.O_result_valid(alu_out_valid)
	);

    // ysyx_040750_gpr_alu gpr_alu_e(
    // 	.I_sys_clk(I_sys_clk),
    // 	.I_rst(I_rst),
	// 	.I_csr_data(),
	// 	.I_op1(alu_op1),
	// 	.I_op2(alu_op2),
	// 	.I_alu_op_sel(ID_EX_alu_op_sel),
	// 	.I_alu_op_sext(ID_EX_alu_sext),
	// 	.I_word_op_mask(ID_EX_word_op_mask),
	// 	.I_multicycle(ID_EX_alu_multicycle),
	// 	.I_EX_MEM_ready(EX_MEM_allowin),
	// 	.O_mem_addr(mem_addr),
	// 	.O_result(alu_out),
	// 	.O_result_valid(alu_out_valid)
    // );

	// ysyx_040750_csr_alu csr_alu_e(
	// 	.I_csr_data(),
	// 	.I_rs_data(),
	// 	.I_uimm(),
	// 	.I_csr_op_sel(),
	// 	.O_csr_data()
	// );
    
    ysyx_040750_EX_MEM_reg EX_MEM_reg_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_EX_MEM_valid(ID_EX_valid),
		.I_EX_MEM_allowout(MEM_WB_allowin),
		.O_EX_MEM_allowin(EX_MEM_allowin),
		.O_EX_MEM_valid(EX_MEM_valid),
		.I_rstrb(ID_EX_rstrb),
		.I_wstrb(ID_EX_wstrb),
		.I_alu_out(alu_out),
		//.I_mem_addr(mem_addr),
		.I_mem_wen(ID_EX_mem_wen),
		.I_rs2_data(ID_EX_rs2),
		.I_pc(ID_EX_pc),
		.I_reg_wen(ID_EX_reg_wen),
		.I_rd_addr(ID_EX_rd_addr),
		.I_regin_sel(ID_EX_regin_sel),
		.I_mem_ready(I_mem_ready),
		.I_mem_data_rvalid(I_mem_rd_data_valid),
		.I_mem_data_bvalid(I_mem_wr_data_valid),
		//.I_csr_op_sel(),
		//.I_csr_imm(),
		.I_csr_addr(ID_EX_csr_addr),
		.I_csr_wen(ID_EX_csr_wen),
		.I_csr_intr(ID_EX_csr_intr),
		// .I_csr_mtip(ID_EX_mtip),
		.I_csr_intr_no(ID_EX_csr_intr_no),
		.I_csr_mret(ID_EX_csr_mret),
		.I_csr(alu_csr_data),
		.I_fencei(ID_EX_fencei),
		//.O_csr_op_sel(),
		//.O_csr_imm(),
		.O_csr_addr(EX_MEM_csr_addr),
		.O_csr_wen(EX_MEM_csr_wen),
		.O_csr_intr(EX_MEM_csr_intr),
		// .O_csr_mtip(EX_MEM_mtip),
		.O_csr_intr_no(EX_MEM_csr_intr_no),
		.O_csr_mret(EX_MEM_csr_mret),
		.O_csr(EX_MEM_csr),
		.O_rstrb(EX_MEM_rstrb),
		.O_wstrb(EX_MEM_wstrb),
		.O_alu_out(EX_MEM_alu_out),
		//.O_mem_addr(EX_MEM_mem_addr),
		// .O_mem_wen(EX_MEM_mem_wen),// mem wr stage flag, not actual mem wr valid flag
		.O_mem_rd_en(EX_MEM_mem_rd_en),
		.O_mem_wr_en(EX_MEM_mem_wr_en),
		.O_rs2_data(EX_MEM_rs2),
		.O_pc(EX_MEM_pc),
		.O_reg_wen(EX_MEM_reg_wen),
		.O_rd_addr(EX_MEM_rd_addr),
		.O_regin_sel(EX_MEM_regin_sel),
		.O_EX_MEM_input_valid(EX_MEM_input_valid),
		.O_fencei(EX_MEM_fencei)
		// .I_inst_debug(ID_EX_inst),
		// .O_inst_debug(EX_MEM_inst),
		// .I_bubble_inst_debug(ID_EX_bubble),
		// .O_bubble_inst_debug(EX_MEM_bubble)
    );
    
    // valid sd data from alu is aligned with EX_MEM_valid
    ysyx_040750_data_sd mem_sd_e(
		.I_data_in(mem_out),// EX_MEM_rs2
		.I_wr_strb(EX_MEM_wstrb),
		.O_sd_data(O_mem_wr_data)
    );
    
    // assign EX_MEM_mem_op = EX_MEM_regin_sel[1] | EX_MEM_mem_wen;
    ysyx_040750_MEM_WB_reg MEM_WB_reg_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
    	.I_MEM_WB_valid(EX_MEM_valid),
    	.O_MEM_WB_allowin(MEM_WB_allowin),
    	.O_MEM_WB_valid(MEM_WB_valid),
    	.I_pc(EX_MEM_pc),
    	.I_mem_data(I_mem_rd_data),
    	.I_mem_shamt(EX_MEM_shamt),
    	.I_mem_rstrb(EX_MEM_rstrb),
    	.I_alu_out(EX_MEM_alu_out),
    	.I_reg_wen(EX_MEM_reg_wen),
    	.I_rd_addr(EX_MEM_rd_addr),
    	.I_regin_sel(EX_MEM_regin_sel),
		//.I_csr_op_sel(),
		//.I_csr_imm(),
		.I_csr_addr(EX_MEM_csr_addr),
		.I_csr_wen(EX_MEM_csr_wen),
		.I_csr_intr(EX_MEM_csr_intr),
		// .I_csr_mtip(EX_MEM_mtip),
		.I_csr_intr_no(EX_MEM_csr_intr_no),
		.I_csr_mret(EX_MEM_csr_mret),
		.I_csr(EX_MEM_csr),
		//.O_csr_op_sel(),
		//.O_csr_imm(),
		.O_csr_addr(MEM_WB_csr_addr),
		.O_csr_wen(MEM_WB_csr_wen),
		.O_csr_intr(MEM_WB_csr_intr),
		// .O_csr_mtip(MEM_WB_mtip),
		.O_csr_intr_no(MEM_WB_csr_intr_no),
		.O_csr_mret(MEM_WB_csr_mret),
		.O_csr(MEM_WB_csr),
    	.O_pc(MEM_WB_pc),
    	.O_mem_data(MEM_WB_mem_data),
    	.O_mem_rstrb(MEM_WB_mem_rstrb),
    	.O_mem_shamt(MEM_WB_shamt),
    	.O_alu_out(MEM_WB_alu_out),
    	.O_reg_wen(MEM_WB_reg_wen),
    	.O_rd_addr(MEM_WB_rd_addr),
    	.O_regin_sel(MEM_WB_regin_sel),
    	.O_MEM_WB_input_valid(MEM_WB_input_valid)
    	// .I_inst_debug(EX_MEM_inst),
		// .O_inst_debug(MEM_WB_inst),
		// .I_bubble_inst_debug(EX_MEM_bubble),
		// .O_bubble_inst_debug(MEM_WB_bubble),
		// .I_mem_op_debug(EX_MEM_mem_op),
		// .O_mem_op_debug(MEM_WB_mem_op),
		// .I_mem_addr_debug(EX_MEM_mem_addr),
		// .O_mem_addr_debug(MEM_WB_mem_addr)
    );
    
    // valid ld data from mem is aligned with MEM_WB_valid
    ysyx_040750_data_ld mem_ld_e(
		.I_data_in(MEM_WB_mem_data),
		.I_rd_strb(MEM_WB_mem_rstrb),
		.I_rd_shamt(MEM_WB_shamt),// 
		.O_load_data(mem_in)
    );
    
    ysyx_040750_mux_Nbit_Msel #(64, 2)
    regin_64bit_2sel (
		.I_sel_data({mem_in,MEM_WB_alu_out}),
		.I_sel(MEM_WB_regin_sel),
		.O_sel_data(wr_data)
    );
    
    ysyx_040750_gpr gpr_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_wr_data(wr_data),
		.I_wen(MEM_WB_reg_wen & MEM_WB_valid),
		.I_rd_addr(MEM_WB_rd_addr),
		.I_rs1_addr(rs1_addr),
		.O_rs1_data(rs1_data),
		.I_rs2_addr(rs2_addr),
		.O_rs2_data(rs2_data)
    );

	// signal_rd from decoder directly
	// signal_wr from WB pipeline
	ysyx_040750_csr csr_e(
		.I_sys_clk(I_sys_clk),
		.I_rst(I_rst),
		.I_mtip(I_mtip),
		// .I_ID_intr(IF_ID_timer_intr),// from IF_ID, timer intr only, merge to csr_intr in decoder
    	// .I_EX_intr(ID_EX_csr_intr),// from ID_EX, timer & ecall
    	// .I_MEM_intr(EX_MEM_csr_intr),// from EX_MEM
    	// .I_WB_intr(MEM_WB_csr_intr),// from MEM_WB
		.I_MEM_WB_valid(MEM_WB_valid),
		.I_csr_wen(MEM_WB_csr_wen),
		.I_csr_intr_wr(MEM_WB_csr_intr),
		.I_csr_intr_rd(csr_intr),// from IF_ID
		.I_intr_pc(MEM_WB_pc),
		.I_csr_intr_no(MEM_WB_csr_intr_no),
		.I_csr_mret_wr(MEM_WB_csr_mret),
		.I_csr_mret_rd(csr_mret),
		.I_wr_addr(MEM_WB_csr_addr),
		.I_rd_addr(csr_addr),
		.I_wr_data(MEM_WB_csr),
		// .I_timer_intr_wb(MEM_WB_mtip),
		.O_rd_data(csr_rd_data),
		.O_timer_intr(csr_timer_intr)
	);

	ysyx_040750_timerintr timerintr_e(
    .I_EX_intr(ID_EX_csr_intr),// from ID_EX
    .I_MEM_intr(EX_MEM_csr_intr),// from EX_MEM
    .I_WB_intr(MEM_WB_csr_intr),// from MEM_WB
    .I_EX_csr_wen(ID_EX_csr_wen),
    .I_EX_csr_addr(ID_EX_csr_addr),
    .I_EX_csr_data({alu_csr_data[7], alu_csr_data[3]}),
    .I_MEM_csr_wen(EX_MEM_csr_wen),
    .I_MEM_csr_addr(EX_MEM_csr_addr),
    .I_MEM_csr_data({EX_MEM_csr[7], EX_MEM_csr[3]}),
    .I_WB_csr_wen(MEM_WB_csr_wen),
    .I_WB_csr_addr(MEM_WB_csr_addr),
    .I_WB_csr_data({MEM_WB_csr[7], MEM_WB_csr[3]}),
    .I_csr_intr(csr_timer_intr),
    .O_timer_intr(timer_intr)
);
endmodule
module ysyx_040750_csr_alu(
    input [63:0] I_csr_data,
    input [63:0] I_rs_data,
    input [4:0] I_uimm,
    input [5:0] I_csr_op_sel,
    output [63:0] O_csr_data
    //output O_csr_data_valid,
);
    wire direct_rs, direct_uimm, set_rs, set_uimm, clr_rs, clr_uimm;
    wire direct, set, clr;
    wire from_rs, from_uimm;
    wire [63:0] op;
    wire [63:0] direct_result, set_result, clr_result;
    
    assign direct = direct_rs | direct_uimm;
    assign set = set_rs | set_uimm;
    assign clr = clr_rs | clr_uimm;
    assign from_rs = |I_csr_op_sel[5:3];
    assign from_uimm = |I_csr_op_sel[2:0];
    assign {direct_rs, set_rs, clr_rs, direct_uimm, set_uimm, clr_uimm} = I_csr_op_sel;
    assign op = from_rs ? I_rs_data : from_uimm ? {59'b0, I_uimm} : 0;
    assign direct_result = op;
    assign set_result = I_csr_data | op;
    assign clr_result = I_csr_data & (~op);
    assign O_csr_data = (direct_result & {64{direct}})
                | (set_result & {64{set}})
                | (clr_result & {64{clr}});
    //assign O_csr_data_valid = |I_csr_op_sel;
endmodule
module ysyx_040750_csr_foward(
    input [63:0] I_csr_ID,
    input [63:0] I_csr_EX,
    input [63:0] I_csr_MEM,
    input [63:0] I_csr_WB,
    input [11:0] I_csr_addr_ID,
    input [11:0] I_csr_addr_EX,
    input [11:0] I_csr_addr_MEM,
    input [11:0] I_csr_addr_WB,
    input I_csr_wen_ID,
    input I_csr_wen_EX,
    input I_csr_wen_MEM,
    input I_csr_wen_WB,
    output reg [63:0] O_csr_foward_data
);
    wire EX_foward,MEM_foward,WB_foward;
    assign EX_foward = (I_csr_wen_ID & I_csr_wen_EX) & (I_csr_addr_ID == I_csr_addr_EX);
    assign MEM_foward = (I_csr_wen_ID & I_csr_wen_MEM) & (I_csr_addr_ID == I_csr_addr_MEM);
    assign WB_foward = (I_csr_wen_ID & I_csr_wen_WB) & (I_csr_addr_ID == I_csr_addr_WB);
    always @(*)
        if(EX_foward)
            O_csr_foward_data = I_csr_EX;
        else if(MEM_foward)
            O_csr_foward_data = I_csr_MEM;
        else if(WB_foward)
            O_csr_foward_data = I_csr_WB;
        else
            O_csr_foward_data = I_csr_ID;
endmodule
module ysyx_040750_csr(
    input I_sys_clk,
    input I_rst,
    // from clint, gen timer_intr with csr flag
    input I_mtip,
    // input I_ID_intr,
    // input I_EX_intr,// from ID_EX
    // input I_MEM_intr,// from EX_MEM
    // input I_WB_intr,// from MEM_WB
    input I_MEM_WB_valid,
    input I_csr_wen,
    input I_csr_intr_wr,
    input I_csr_intr_rd,
    input [31:0] I_intr_pc,
    input [63:0] I_csr_intr_no,
    input I_csr_mret_wr,
    input I_csr_mret_rd,
    input [11:0] I_wr_addr,
    input [11:0] I_rd_addr,
    input [63:0] I_wr_data,
    // input I_timer_intr_wb,
    output [63:0] O_rd_data,
    output O_timer_intr
);
    // localparam CSR_NUM = 1 << 12;
    localparam SATP = 12'h180;
    localparam MSTATUS = 12'h300;
    localparam MIE = 12'h304;
    localparam MTVEC = 12'h305;
    // localparam MSCRATCH = 12'h340;
    localparam MEPC = 12'h341;
    localparam MCAUSE = 12'h342;
    localparam MIP = 12'h344;
    
    reg [63:0] satp, mstatus, mie, mtvec, mepc, mcause, mip;
    reg [63:0] rd_data;
    wire mstatus_mie, mstatus_mpie;
    wire csr_wen, csr_intr_wr, csr_mret_wr;
    assign {csr_wen, csr_intr_wr, csr_mret_wr} = {I_csr_wen, I_csr_intr_wr, I_csr_mret_wr} & {3{I_MEM_WB_valid}};
    assign mstatus_mie = mstatus[3];
    assign mstatus_mpie = mstatus[7];
    assign O_rd_data = rd_data;
    // assign O_timer_intr = (mip[7] & mie[7] & mstatus_mie) & ~(I_ID_intr | I_EX_intr | I_MEM_intr | I_WB_intr);
    assign O_timer_intr = (mip[7] & mie[7] & mstatus_mie);
    //reg [63:0] mip, mie, mtime, mtimecmp; clint as mmio p
    always @(posedge I_sys_clk)
        if(I_rst)
            mip <= 0;
        else
            mip <= {mip[63:8],I_mtip,mip[6:0]};
    always @(posedge I_sys_clk)
        if(I_rst) begin
            {satp, mie, mtvec, mepc, mcause} <= 'h0;
            mstatus <= 64'ha00001800;
        end
        // these ena signals will not occur at the same time
        else if(csr_wen) 
            case(I_wr_addr)
                SATP: satp <= I_wr_data;
                MSTATUS: mstatus <= I_wr_data;
                MIE: mie <= I_wr_data;
                MTVEC: mtvec <= I_wr_data;
                MEPC: mepc <= I_wr_data;
                MCAUSE: mcause <= I_wr_data;
                // MIP: mip <= I_wr_data;
                // MSCRATCH: mscratch <= I_wr_data;
                default:;
            endcase
        else if(csr_intr_wr) begin
            satp <= satp;
            mstatus <= {mstatus[63:8],mstatus_mie,mstatus[6:4],1'b0,mstatus[2:0]};
            mie <= mie;
            mtvec <= mtvec;
            mepc <= {32'b0, I_intr_pc};
            mcause <= I_csr_intr_no;
            // mip <= mip;
            // mscratch <= mscratch;
        end
        else if(csr_mret_wr) begin
            satp <= satp;
            mstatus <= {mstatus[63:8],1'b1,mstatus[6:4],mstatus_mpie,mstatus[2:0]};
            mie <= mie;
            mtvec <= mtvec;
            mepc <= mepc;
            mcause <= mcause;
            // mip <= mip;
            // mscratch <= mscratch;
        end
        else begin
            satp <= satp;
            mstatus <= mstatus;
            mie <= mie;
            mtvec <= mtvec;
            mepc <= mepc;
            mcause <= mcause;
            // mie <= mie;
            // mscratch <= mscratch;
        end
    always @(*)
        case({I_csr_intr_rd, I_csr_mret_rd})
            2'b10: rd_data = mtvec;
            2'b01: rd_data = mepc;
            2'b00:
                case(I_rd_addr)
                    SATP: rd_data = satp;
                    MSTATUS: rd_data = mstatus;
                    MIE: rd_data = mie;
                    MTVEC: rd_data = mtvec;
                    MEPC: rd_data = mepc;
                    MCAUSE: rd_data = mcause;
                    MIP: rd_data = mip;
                    // MSCRATCH: rd_data = mscratch;
                    default: rd_data = 'h0;
                endcase
            default: rd_data = 'h0;// should not reach here!
        endcase
endmodule
module ysyx_040750_data_ld(
    input [63:0] I_data_in,
    input [8:0] I_rd_strb,
    input [2:0] I_rd_shamt,
    output [63:0] O_load_data
    );
    wire sext_flag;
    reg sext_bit;
    wire [7:0] sext_mask;
    wire [63:0] ld_data;
    assign ld_data = I_data_in >> {I_rd_shamt, 3'b0};
    assign sext_mask = ~I_rd_strb[7:0];
    assign sext_flag = I_rd_strb[8];
    always @(*)
    	if(sext_flag)
    	    case(I_rd_strb[7:0])
    	        //8'hff: sext_bit = I_mem_in[63];
    	        8'h0f: sext_bit = ld_data[31];
    	        8'h03: sext_bit = ld_data[15];
    	        8'h01: sext_bit = ld_data[7];
    	        default: sext_bit = 0;
    	    endcase
    	else
    	    sext_bit = 0;
    assign O_load_data = (ld_data & {{8{I_rd_strb[7]}}, {8{I_rd_strb[6]}}, {8{I_rd_strb[5]}}, {8{I_rd_strb[4]}}, {8{I_rd_strb[3]}}, {8{I_rd_strb[2]}}, {8{I_rd_strb[1]}}, {8{I_rd_strb[0]}}}) | ({64{sext_bit}} & {{8{sext_mask[7]}}, {8{sext_mask[6]}}, {8{sext_mask[5]}}, {8{sext_mask[4]}}, {8{sext_mask[3]}}, {8{sext_mask[2]}}, {8{sext_mask[1]}}, {8{sext_mask[0]}}});
endmodule
module ysyx_040750_data_sd(
    input [63:0] I_data_in,
    input [7:0] I_wr_strb,
    output [63:0] O_sd_data
    );
    // assign O_sd_data = I_wr_strb[7] ? I_data_in : I_wr_strb[3] ? {2{I_data_in[31:0]}} : I_wr_strb[1] ? {4{I_data_in[15:0]}} : {8{I_data_in[7:0]}};
    assign O_sd_data = &I_wr_strb[7:0] ? I_data_in : &I_wr_strb[3:0] ? {2{I_data_in[31:0]}} : &I_wr_strb[1:0] ? {4{I_data_in[15:0]}} : {8{I_data_in[7:0]}};
endmodule
module ysyx_040750_dcachectrl #(
    parameter BLOCK_SIZE = 32,
    parameter CACHE_SIZE = 4096,
    parameter GROUP_NUM = 2,
    parameter BLOCK_NUM = CACHE_SIZE / BLOCK_SIZE,//128
    parameter OFFT_LEN = $clog2(BLOCK_SIZE),//5
    parameter INDEX_LEN = $clog2(BLOCK_NUM/GROUP_NUM),//6
    parameter TAG_LEN = 32-OFFT_LEN-INDEX_LEN//21
)(
    input I_clk,
    input I_rst,
    // cpu addr & w/r req
    input [31:0] I_cpu_addr,
    input [63:0] I_cpu_data,
    input [7:0] I_cpu_wmask,
    input I_cpu_rd_req,
    input I_cpu_wr_req,
    output O_cpu_mem_ready,
    input I_cpu_fencei,
    output O_dcache_clean,
    // cache rd addr & req, low level valid en
    input [255:0] I_way0_rdata,
    input [255:0] I_way1_rdata,
    output [5:0] O_sram_addr,
    // msb-lsb: bram 7-4
    // wen=0 -> wr, wen=1 -> rd
    // wmask[i]=0 -> wvalid[i]
    output [3:0] O_sram_cen,
    output [3:0] O_sram_wen,
    output [255:0] O_sram_wdata,
    output [255:0] O_sram_wmask,
    // mem data, rd addr & req
    input [63:0] I_mem_rdata,
    input I_mem_arready,
    input I_mem_rvalid,
    input I_mem_rlast,
    output [31:0] O_mem_araddr,// addr to mem
    output O_mem_arvalid,
    output O_mem_rready,
    output [7:0] O_mem_arlen,
    output [2:0] O_mem_arsize,
    output [1:0] O_mem_arburst,
    // mem data, wr addr & req
    input I_mem_awready,
    input I_mem_wready,
    input I_mem_bvalid,
    output [63:0] O_mem_wdata,
    output [31:0] O_mem_awaddr,
    output O_mem_awvalid,
    output O_mem_wvalid,
    output O_mem_bready,
    output O_mem_wlast,
    output [7:0] O_mem_awlen,
    output [2:0] O_mem_awsize,
    output [1:0] O_mem_awburst,
    output [7:0] O_mem_wstrb,
    // data & valid flag to cpu
    output reg [63:0] O_cpu_data,
    output O_cpu_rvalid,
    output O_cpu_bvalid
);
    // FSM signal
    `define ysyx_040750_FSM_WIDTH 16
    localparam IDLE = `ysyx_040750_FSM_WIDTH'h1, RD_HIT = `ysyx_040750_FSM_WIDTH'h2, RD_MISS = `ysyx_040750_FSM_WIDTH'h4, RD_RELOAD = `ysyx_040750_FSM_WIDTH'h8, RD_WB = `ysyx_040750_FSM_WIDTH'h10, RD_ALLOCATE = `ysyx_040750_FSM_WIDTH'h20;
    localparam WR_HIT = `ysyx_040750_FSM_WIDTH'h40, WR_MISS = `ysyx_040750_FSM_WIDTH'h80, WR_RELOAD = `ysyx_040750_FSM_WIDTH'h100, WR_WB = `ysyx_040750_FSM_WIDTH'h200, WR_ALLOCATE = `ysyx_040750_FSM_WIDTH'h400;
    localparam MMIO_AR = `ysyx_040750_FSM_WIDTH'h800, MMIO_AW = `ysyx_040750_FSM_WIDTH'h1000, MMIO_RD = `ysyx_040750_FSM_WIDTH'h2000, MMIO_WR = `ysyx_040750_FSM_WIDTH'h4000;
    localparam FENCEI = `ysyx_040750_FSM_WIDTH'h8000;
    reg [`ysyx_040750_FSM_WIDTH-1:0] current_state, next_state;
    wire replace_dirty;
    wire rd_hit, rd_miss, rd_handshake, rd_reload, rd_wb, rd_allocate;
    wire wr_hit, wr_miss, wr_reload, wr_wb, wr_allocate;
    // compare tag signal(IDLE/MISS)
    wire [OFFT_LEN-1:0] offset,mem_offset;
    wire [INDEX_LEN-1:0] index,mem_index;
    wire [TAG_LEN-1:0] tag,mem_tag;
    reg [31:0] mem_addr;
    // cacheline & cpu_wb reg
    wire [7:0] sram_wmask;// cpu wmask;
    reg [31:0] sram_wmaskB;// Bytewise wmask
    reg [1:0] hit_flag;// rd_only, 01 for way0 hit, 10 for way1 hit;
    // final data rd src
    wire [255:0] mem_rdata;
    // cache hit data source
    wire [255:0] hit_rdata;
    reg [255:0] cacheline_reg;
    reg [63:0] cpu_reg;
    reg [7:0] cpu_mask_reg;
    reg [3:0] cen_dcache;
    reg [3:0] wen_dcache;
    wire sram_wflag, sram_rflag;
    // lookup table
    genvar i;
    reg [TAG_LEN-1:0] lookup_table [BLOCK_NUM-1:0];
    reg [BLOCK_NUM-1:0] valid_table, dirty_table;
    wire [BLOCK_NUM-1:0] lookup_table_index;
    wire [BLOCK_NUM-1:0] dirty_table_hit_index, dirty_table_miss_index, dirty_table_fencei_index;
    // signals below compare hit & miss(use in IDLE state)
    wire [TAG_LEN-1:0] way0_tag, way1_tag;
    wire way0_valid, way1_valid;
    wire way0_hit, way1_hit;
    wire hit;
    // signals below determine wb/allocate op(use in XX_RELOAD state)
    wire way0_dirty, way1_dirty;
    // cacheline sel signal at comp stage
    wire way1_op;
    reg isway0_op;// high indicate way0 op
    // wb fsm
    localparam WB_IDLE = 4'b0001, WB_HANDSHAKE = 4'b0010, WB_DATA = 4'b0100, WB_BVALID = 4'b1000;
    reg [3:0] wb_state, wb_next_state;
    // axi interface handshake && wdata cnt
    wire mem_ar_req, mem_aw_req;
    wire aw_handshake, wr_handshake;// awaddr/wdata handshake
    reg [1:0] wdata_cnt;
    wire [255:0] wdata;
    wire [63:0] cache_wdata, cache_rdata;
    wire [31:0] cache_awaddr;
    //wire cache_wvalid;
    // MMIO signal
    wire mmio_flag;
    reg mmio_process;
    wire [63:0] mmio_wdata, mmio_rdata;
    wire [31:0] mmio_awaddr;
    // fencei
    wire fencei_process;
    reg [INDEX_LEN:0] fencei_index;// index for cacheline in two groups
    wire [31:0] fencei_addr;
    wire [5:0] fencei_sram_addr;
    wire [3:0] fencei_sram_cen;
    wire fencei_group;
    assign fencei_sram_addr = fencei_index[INDEX_LEN:1];
    assign fencei_group = fencei_index[0];
    assign fencei_process = (current_state == FENCEI);
    assign fencei_addr = {lookup_table[fencei_index], fencei_index[INDEX_LEN:1], {OFFT_LEN{1'b0}}};
    assign fencei_sram_cen = fencei_group ? 4'b0011 : 4'b1100;
    always @(posedge I_clk)
        if(I_rst)
            fencei_index <= 0;
        else if(fencei_process & (~dirty_table[fencei_index] | I_mem_bvalid))
            fencei_index <= fencei_index + 1;
        else
            fencei_index <= fencei_index;
    // dcache clean: fencei_index incr to max(all 1) and (last cacheline clean or wb finish)
    assign O_dcache_clean = fencei_process && (&fencei_index) && (~dirty_table[fencei_index] | I_mem_bvalid);
    // // pending fence.i req
    // reg fencei_process;
    // always @(posedge I_clk)
    //     if(I_rst)
    //         fencei_process <= 0;
    //     else if(I_cpu_fencei)
    //         fencei_process <= 1;
    //     else if(O_dcache_clean)
    //         fencei_process <= 0;
    //     else
    //         fencei_process <= fencei_process;
    //wire mmio_wvalid;
    // data reg impl
    always @(posedge I_clk)
        if(I_rst)
            cacheline_reg <= 0;
        //else if(rd_hit)
        //    cacheline_reg <= way0_hit ? I_way0_rdata : I_way1_rdata;
        else if(wr_hit)
            cacheline_reg[{offset[OFFT_LEN-1:3],3'b0,3'b0} +: 64] <= I_cpu_data;
        else if(wr_allocate)
            cacheline_reg[{mem_offset[OFFT_LEN-1:3],3'b0,3'b0} +: 64] <= cpu_reg;
        else if((rd_reload || wr_reload) && I_mem_rvalid)
            cacheline_reg <= {I_mem_rdata, cacheline_reg[255 -: 192]};
        else
            cacheline_reg <= cacheline_reg;
    always @(posedge I_clk)
        if(I_rst)
            {cpu_mask_reg, cpu_reg} <= 0;
        else if(I_cpu_wr_req)
            {cpu_mask_reg, cpu_reg} <= {I_cpu_wmask, I_cpu_data};
        else
            {cpu_mask_reg, cpu_reg} <= {cpu_mask_reg, cpu_reg};
    // cpu interface impl
    assign O_cpu_rvalid = (current_state == RD_HIT) || rd_allocate || ((current_state == MMIO_RD) && I_mem_rvalid);
    always @(posedge I_clk)
        if(I_rst)
            hit_flag <= 2'b00;
        else if(rd_hit)
            hit_flag <= way0_hit ? 2'b01 : 2'b10;
        else
            hit_flag <= 2'b00;
    assign hit_rdata = (I_way0_rdata & {256{hit_flag[0]}}) | (I_way1_rdata & {256{hit_flag[1]}});
    assign mem_rdata = (current_state == RD_HIT) ? hit_rdata : cacheline_reg;
    assign cache_rdata = mem_rdata[{mem_offset[OFFT_LEN-1:3],3'b0,3'b0} +: 64];
    assign mmio_rdata = I_mem_rdata;
    assign O_cpu_data = mmio_process ? mmio_rdata : cache_rdata;
    assign O_cpu_bvalid = (current_state == WR_HIT) || ((current_state == MMIO_WR) && I_mem_bvalid);
    // mem interface impl
    assign aw_handshake = I_mem_awready && O_mem_awvalid;
    assign wr_handshake = I_mem_wready && O_mem_wvalid;
    assign mem_ar_req = (current_state == RD_MISS) || (current_state == WR_MISS) || (current_state == MMIO_AR);
    assign mem_aw_req = (wb_state == WB_HANDSHAKE) || (current_state == MMIO_AW);
    always @(posedge I_clk)
        if(I_rst)
            wdata_cnt <= 0;
        else if(wr_handshake)
            wdata_cnt <= O_mem_wlast ? 0 : wdata_cnt + 1;
        else
            wdata_cnt <= wdata_cnt;
    assign wdata = ((isway0_op & ~fencei_process) | (fencei_process & ~fencei_group)) ? I_way0_rdata : I_way1_rdata;
    assign O_mem_wlast = O_mem_wvalid && (wdata_cnt == O_mem_awlen[1:0]);
    assign O_mem_arvalid = mem_ar_req ? 1 : 0;
    assign O_mem_rready = 1;
    assign O_mem_arlen = mmio_process ? 0 : 3;// 32/8 - 1
    assign O_mem_arsize = mmio_process ? 3'b010 : 3'b011;// 8B
    assign O_mem_arburst = mmio_process ? 2'b00 : 2'b01;
    assign O_mem_araddr = mem_ar_req ? {mem_addr[31:OFFT_LEN],{{OFFT_LEN{mmio_process}} & mem_offset}} : 0;// 32B alignment
    // cache wb: cacheline tag + index + offt'b0
    assign cache_awaddr = ({32{fencei_process}} & fencei_addr) | ({32{~fencei_process}} & {lookup_table[{mem_index, ~isway0_op}],mem_index,{OFFT_LEN{1'b0}}});
    assign mmio_awaddr = mem_addr;
    assign O_mem_awaddr = mem_aw_req ? ((cache_awaddr & {32{~mmio_process}}) | (mmio_awaddr & {32{mmio_process}})) : 0;
    assign O_mem_awlen = mmio_process ? 0 : 3;// 32/8 - 1
    assign O_mem_awsize = mmio_process ? 3'b010 : 3'b011;// 8B
    assign O_mem_awburst = mmio_process ? 2'b00 : 2'b01;
    assign O_mem_awvalid = mem_aw_req ? 1 : 0;
    assign O_mem_wvalid = (wb_state == WB_DATA) ? 1 : 0;
    assign mmio_wdata = cpu_reg;
    assign cache_wdata = wdata[{wdata_cnt,3'b0,3'b0} +: 64];
    assign O_mem_wdata = mmio_process ? mmio_wdata : cache_wdata;
    assign O_mem_wstrb = mmio_process ? cpu_mask_reg : 8'hff;
    assign O_mem_bready = 1;
    // sram interface impl
    // sram wr_en happen at WR_HIT(cpu partial wr), XX_ALLOCATE(cacheline replacement)
    assign sram_wmask = ~cpu_mask_reg;// cpu wmask is high level valid
    assign sram_wflag = (current_state == WR_HIT) || rd_allocate || wr_allocate;
    assign sram_rflag = (I_mem_rlast && !mmio_process) || rd_wb || wr_wb;
    always @(*)
        if(current_state == WR_HIT)
            case(mem_offset[OFFT_LEN-1:3])
                2'b11: sram_wmaskB = {sram_wmask, 24'hffffff};
                2'b10: sram_wmaskB = {8'hff, sram_wmask, 16'hffff};
                2'b01: sram_wmaskB = {16'hffff, sram_wmask, 8'hff};
                2'b00: sram_wmaskB = {24'hffffff, sram_wmask};
            endcase
        else
            sram_wmaskB = (rd_allocate || wr_allocate) ? 0 : {32{1'b1}};
    assign O_sram_wdata = cacheline_reg;
    // only rd_hit case sram_op happen at IDLE
    assign O_sram_addr = fencei_process ? fencei_sram_addr : rd_hit ? index : mem_index;
    assign O_sram_cen = fencei_process ? fencei_sram_cen : cen_dcache;
    assign O_sram_wen = wen_dcache;
    for(i=0;i<32;i=i+1)
        assign O_sram_wmask[8*i +: 8] = {8{sram_wmaskB[i]}};
    // sram wen
    always @(*)
        if(sram_wflag)
            wen_dcache = isway0_op ? 4'b1100 : 4'b0011;
        else
            wen_dcache = 4'b1111;
    // sram cen
    always @(*)
        if(rd_hit)
            cen_dcache = way0_hit ? 4'b1100 : 4'b0011;
        else if(sram_rflag | sram_wflag)
            cen_dcache = isway0_op ? 4'b1100 : 4'b0011;
        else
            cen_dcache = 4'b1111;
    // fsm ctrl signal impl
    assign way0_tag = lookup_table[{index,1'b0}];
    assign way1_tag = lookup_table[{index,1'b1}];
    assign way0_valid = valid_table[{index,1'b0}];
    assign way1_valid = valid_table[{index,1'b1}];
    assign way0_hit = (tag == way0_tag) && way0_valid;
    assign way1_hit = (tag == way1_tag) && way1_valid;
    assign hit = way0_hit || way1_hit;
    assign rd_hit = hit && I_cpu_rd_req && ~mmio_flag;
    assign rd_miss = ~hit && I_cpu_rd_req && ~mmio_flag;
    assign wr_hit = hit && I_cpu_wr_req && ~mmio_flag;
    assign wr_miss = ~hit && I_cpu_wr_req && ~mmio_flag;
    assign rd_handshake = O_mem_arvalid && I_mem_arready;
    assign rd_reload = (current_state == RD_RELOAD) ? 1 : 0;
    assign wr_reload = (current_state == WR_RELOAD) ? 1 : 0;
    assign rd_wb = (current_state == RD_WB) ? 1 : 0;
    assign wr_wb = (current_state == WR_WB) ? 1 : 0;
    assign rd_allocate = (current_state == RD_ALLOCATE) ? 1 : 0;
    assign wr_allocate = (current_state == WR_ALLOCATE) ? 1 : 0;
    // if way1_hit, impl way1; else if miss && way0_valid && way1_empty, impl way1
    // else, impl way0
    assign way1_op = way1_hit || (~hit && valid_table[{index,1'b0}]) && ~(valid_table[{index,1'b1}]);
    // determine way to be replaced at comp stage
    always @(posedge I_clk)
        if(I_rst)
            isway0_op <= 0;
        else if(I_cpu_rd_req || I_cpu_wr_req)
            isway0_op <= way1_op ? 0 : 1;
        else
            isway0_op <= isway0_op;
    // check if replace dirty block at miss stage
    assign way0_dirty = dirty_table[{mem_index,1'b0}];
    assign way1_dirty = dirty_table[{mem_index,1'b1}];
    assign replace_dirty = (way0_dirty && isway0_op) || (way1_dirty && ~isway0_op);
    // lookup table impl
    generate for(i=0;i<BLOCK_NUM;i=i+1) begin
        assign lookup_table_index[i] = (i == {mem_index, ~isway0_op}) ? 1 : 0;
        assign dirty_table_hit_index[i] = (i == {index, way1_hit}) ? 1 : 0;
        assign dirty_table_miss_index[i] = (i == {mem_index, ~isway0_op}) ? 1 : 0;
        assign dirty_table_fencei_index[i] = (i == fencei_index) ? 1 : 0;
        always @(posedge I_clk)
            if(I_rst) begin
                lookup_table[i] <= 0;
                valid_table[i] <= 0;
            end
            // else if(rd_allocate || wr_allocate) begin
            //     lookup_table[{mem_index, ~isway0_op}] <= mem_tag;
            //     valid_table[{mem_index, ~isway0_op}] <= 1;
            // end
            else if((rd_allocate || wr_allocate) && lookup_table_index[i]) begin
                lookup_table[i] <= mem_tag;
                valid_table[i] <= 1;
            end
            else begin
                lookup_table[i] <= lookup_table[i];
                valid_table[i] <= valid_table[i];
            end
        always @(posedge I_clk)
            if(I_rst) begin
                dirty_table[i] <= 0;
            end
            // else if(wr_hit)
            //     dirty_table[{index, way1_hit}] <= 1;
            // else if(rd_wb && I_mem_bvalid)
            //     dirty_table[{mem_index, ~isway0_op}] <= 0;
            // else if(wr_allocate)
            //     dirty_table[{mem_index, ~isway0_op}] <= 1;
            // else if(fencei_process & I_mem_bvalid)
            //     dirty_table[fencei_index] <= 0;
            else if(wr_hit && dirty_table_hit_index[i])
                dirty_table[i] <= 1;
            else if(rd_wb && I_mem_bvalid && dirty_table_miss_index[i])
                dirty_table[i] <= 0;
            else if(wr_allocate && dirty_table_miss_index[i])
                dirty_table[i] <= 1;
            else if(fencei_process && I_mem_bvalid && dirty_table_fencei_index[i])
                dirty_table[i] <= 0;
            else begin
                dirty_table[i] <= dirty_table[i];
            end
        end
    endgenerate
    // FSM impl
    // wb
    always @(posedge I_clk)
        if(I_rst)
            wb_state <= WB_IDLE;
        else
            wb_state <= wb_next_state;
    always @(*) begin
        wb_next_state = WB_IDLE;
        case(wb_state)
            // cache wb and mmio wr, cache wb case must consider ~mmio_process
            // three case cause wb: replace dirty, mmio wr, fence.i
            WB_IDLE: wb_next_state = ((I_mem_rlast && replace_dirty && ~mmio_process) || (mmio_flag && I_cpu_wr_req) || (fencei_process && dirty_table[fencei_index])) ? WB_HANDSHAKE : wb_state;
            WB_HANDSHAKE: wb_next_state = aw_handshake ? WB_DATA : wb_state;
            WB_DATA: wb_next_state = (wr_handshake && O_mem_wlast) ? (I_mem_bvalid ? WB_IDLE : WB_BVALID) : wb_state;
            WB_BVALID: wb_next_state = I_mem_bvalid ? WB_IDLE : wb_state;
            default: wb_next_state = wb_state;
        endcase
    end
    // overall
    // mmio_flag: current mem range: 80000000-87ffffff, other addr means mmio_addr
    // simple impl: [31:24] 1000_0000-1000_0111, so cached addr must have addr[31:27] == 10000
    // this impl holds only at block mem query case!
    always @(posedge I_clk)
        if(I_rst)
            mmio_process <= 0;
        else if(mmio_flag)
            mmio_process <= 1;
        else if(I_mem_rlast | I_mem_bvalid)
            mmio_process <= 0;
        
    // assign mmio_flag = (I_cpu_addr[31:27] != 5'b10000) && (I_cpu_rd_req || I_cpu_wr_req);
    assign mmio_flag = !I_cpu_addr[31] && (I_cpu_rd_req || I_cpu_wr_req);
    assign O_cpu_mem_ready = (current_state == IDLE) || (current_state == RD_HIT) || (current_state == WR_HIT);
    always @(posedge I_clk)
        if(I_rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    always @(*) begin
        next_state = IDLE;
        case(current_state)
            IDLE, RD_HIT, WR_HIT: begin
                if(I_cpu_fencei)
                    next_state = FENCEI;
                else if(mmio_flag)
                    next_state = I_cpu_rd_req ? MMIO_AR : MMIO_AW;
                else if(rd_hit)
                    next_state = RD_HIT;
                else if(rd_miss)
                    next_state = RD_MISS;
                else if(wr_hit)
                    next_state = WR_HIT;
                else if(wr_miss)
                    next_state = WR_MISS;
                else
                    next_state = IDLE;
            end
            RD_MISS: next_state = rd_handshake ? RD_RELOAD : current_state;
            RD_RELOAD: next_state = I_mem_rlast ? (replace_dirty ? RD_WB : RD_ALLOCATE) : current_state;
            RD_WB: next_state = I_mem_bvalid ? RD_ALLOCATE : current_state;
            RD_ALLOCATE: next_state = IDLE;
            WR_MISS: next_state = rd_handshake ? WR_RELOAD : current_state;
            WR_RELOAD: next_state = I_mem_rlast ? (replace_dirty ? WR_WB : WR_ALLOCATE) : current_state;
            WR_WB: next_state = I_mem_bvalid ? WR_ALLOCATE : current_state;
            WR_ALLOCATE: next_state = WR_HIT;
            MMIO_AR: next_state = rd_handshake ? MMIO_RD : current_state;
            MMIO_AW: next_state = aw_handshake ? MMIO_WR : current_state;
            MMIO_RD: next_state = I_mem_rlast ? IDLE : current_state;
            MMIO_WR: next_state = I_mem_bvalid ? IDLE : current_state;
            FENCEI: next_state = O_dcache_clean ? IDLE : current_state;
            //MMIO_WR: next_state = (wr_handshake && O_mem_wlast) ? IDLE : current_state;
            default: next_state = current_state;
        endcase
    end
    // compare tag signal impl
    assign {tag, index, offset} = I_cpu_addr;
    assign {mem_tag, mem_index, mem_offset} = mem_addr;
    always @(posedge I_clk)
        if(I_rst)
            mem_addr <= 0;
        else if(I_cpu_rd_req | I_cpu_wr_req)
            mem_addr <= I_cpu_addr;
        else
            mem_addr <= mem_addr;
endmodule
module ysyx_040750_decoder(
    // input I_sys_clk,
    // input I_rst,
    input [31:0] I_inst,
    input I_timer_intr,
    output [63:0] O_imm,
    input [63:0] I_rs1_data,
    output [4:0] O_rs1,
    input [63:0] I_rs2_data,
    output [4:0] O_rs2,
    output [4:0] O_rd,
    output O_reg_wen,
    output O_mem_wen,
    output [7:0] O_mem_wstrb,
    output [8:0] O_mem_rstrb,// [8] for signed(1)/unsigned(0), [7:0]for real strb
    //output O_mem_ren,
    //output [2:0] O_funct3,
    //output [6:0] O_funct7,
    output [3:0] O_dnpc_sel,
    output [1:0] O_regin_sel,
    output [2:0] O_opnum1_sel,
    output [2:0] O_opnum2_sel,
    output [14:0] O_alu_op_sel,
    output [1:0] O_alu_op_sext,
    output O_word_op_mask,
    output [5:0] O_csr_op_sel,
    output [4:0] O_csr_imm,
    output [11:0] O_csr_addr,
    output O_csr_wen,
    output O_csr_intr,
    output [63:0] O_csr_intr_no,
    output O_csr_mret,
    output [1:0] O_stall_en// en[1] for rs1, en[2] for rs2
    //output O_sim_end
    );
    // import "DPI-C" function void set_inst_ptr(input logic [31:0] a []);
    // initial set_inst_ptr(I_inst);
    wire [31:0] decode_inst;
    wire [6:0] funct7;
    wire [6:0] opcode;
    wire [4:0] rs2,rs1,rd;
    wire [2:0] funct3;
    wire [11:0] immI,immS;
    wire [12:0] immB;
    wire [31:0] immU;
    wire [20:0] immJ;
    wire typeI, typeS, typeR, typeB, typeU, typeJ, typeC;
    // if timer intr happen, inst do nothing, but npc is chosen from mtvec
    assign decode_inst = I_timer_intr ? 32'h00000013 : I_inst;
    // inst pattern
    // type U
    wire LUI;
    assign LUI = (opcode == 7'b0110111);
    wire AUIPC;
    assign AUIPC = (opcode == 7'b0010111);
    // type J
    wire JAL;
    assign JAL = (opcode == 7'b1101111);
    // type I
    wire JALR;
    assign JALR = (opcode == 7'b1100111) && (funct3 == 3'b000);
    wire LD;
    assign LD = (opcode == 7'b0000011) && (funct3 == 3'b011);
    wire LW;
    assign LW = (opcode == 7'b0000011) && (funct3 == 3'b010);
    wire LWU;
    assign LWU = (opcode == 7'b0000011) && (funct3 == 3'b110);
    wire LH;
    assign LH = (opcode == 7'b0000011) && (funct3 == 3'b001);
    wire LHU;
    assign LHU = (opcode == 7'b0000011) && (funct3 == 3'b101);
    wire LB;
    assign LB = (opcode == 7'b0000011) && (funct3 == 3'b000);
    wire LBU;
    assign LBU = (opcode == 7'b0000011) && (funct3 == 3'b100);
    wire ADDI;
    assign ADDI = (opcode == 7'b0010011) && (funct3 == 3'b000);
    wire SLTI;
    assign SLTI = (opcode == 7'b0010011) && (funct3 == 3'b010);
    wire SLTIU;
    assign SLTIU = (opcode == 7'b0010011) && (funct3 == 3'b011);
    wire XORI;
    assign XORI = (opcode == 7'b0010011) && (funct3 == 3'b100);
    wire ORI;
    assign ORI = (opcode == 7'b0010011) && (funct3 == 3'b110);
    wire ANDI;
    assign ANDI = (opcode == 7'b0010011) && (funct3 == 3'b111);
    wire SLLI;
    assign SLLI = (funct7[6:1] == 6'b000000) && (opcode == 7'b0010011) && (funct3 == 3'b001);
    wire SRLI;
    assign SRLI = (funct7[6:1] == 6'b000000) && (opcode == 7'b0010011) && (funct3 == 3'b101);
    wire SRAI;
    assign SRAI = (funct7[6:1] == 6'b010000) && (opcode == 7'b0010011) && (funct3 == 3'b101);
    wire ADDIW;
    assign ADDIW = (opcode == 7'b0011011) && (funct3 == 3'b000);
    wire SLLIW;
    assign SLLIW = (funct7 == 7'b0000000) && (opcode == 7'b0011011) && (funct3 == 3'b001);
    wire SRLIW;
    assign SRLIW = (funct7 == 7'b0000000) && (opcode == 7'b0011011) && (funct3 == 3'b101);
    wire SRAIW;
    assign SRAIW = (funct7 == 7'b0100000) && (opcode == 7'b0011011) && (funct3 == 3'b101);
    // type R
    wire ADD;
    assign ADD = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b000);
    wire SUB;
    assign SUB = (funct7 == 7'b0100000) && (opcode == 7'b0110011) && (funct3 == 3'b000);
    wire SLL;
    assign SLL = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b001);
    wire SLT;
    assign SLT = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b010);
    wire SLTU;
    assign SLTU = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b011);
    wire XOR;
    assign XOR = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b100);
    wire SRL;
    assign SRL = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b101);
    wire SRA;
    assign SRA = (funct7 == 7'b0100000) && (opcode == 7'b0110011) && (funct3 == 3'b101);
    wire OR;
    assign OR = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b110);
    wire AND;
    assign AND = (funct7 == 7'b0000000) && (opcode == 7'b0110011) && (funct3 == 3'b111);
    wire MUL;
    assign MUL = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b000);
    wire MULH;
    assign MULH = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b001);
    wire MULHSU;
    assign MULHSU = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b010);
    wire MULHU;
    assign MULHU = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b011);
    wire DIV;
    assign DIV = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b100);
    wire DIVU;
    assign DIVU = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b101);
    wire REM;
    assign REM = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b110);
    wire REMU;
    assign REMU = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b111);
    wire ADDW;
    assign ADDW = (funct7 == 7'b0000000) && (opcode == 7'b0111011) && (funct3 == 3'b000);
    wire SUBW;
    assign SUBW = (funct7 == 7'b0100000) && (opcode == 7'b0111011) && (funct3 == 3'b000);
    wire SLLW;
    assign SLLW = (funct7 == 7'b0000000) && (opcode == 7'b0111011) && (funct3 == 3'b001);
    wire SRLW;
    assign SRLW = (funct7 == 7'b0000000) && (opcode == 7'b0111011) && (funct3 == 3'b101);
    wire SRAW;
    assign SRAW = (funct7 == 7'b0100000) && (opcode == 7'b0111011) && (funct3 == 3'b101);
    wire MULW;
    assign MULW = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b000);
    wire DIVW;
    assign DIVW = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b100);
    wire DIVUW;
    assign DIVUW = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b101);
    wire REMW;
    assign REMW = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b110);
    wire REMUW;
    assign REMUW = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b111);
    // type S
    wire SD;
    assign SD = (opcode == 7'b0100011) && (funct3 == 3'b011);
    wire SW;
    assign SW = (opcode == 7'b0100011) && (funct3 == 3'b010);
    wire SH;
    assign SH = (opcode == 7'b0100011) && (funct3 == 3'b001);
    wire SB;
    assign SB = (opcode == 7'b0100011) && (funct3 == 3'b000);
    // type B
    wire BEQ;
    assign BEQ = (opcode == 7'b1100011) && (funct3 == 3'b000);
    wire BNE;
    assign BNE = (opcode == 7'b1100011) && (funct3 == 3'b001);
    wire BLT;
    assign BLT = (opcode == 7'b1100011) && (funct3 == 3'b100);
    wire BGE;
    assign BGE = (opcode == 7'b1100011) && (funct3 == 3'b101);
    wire BLTU;
    assign BLTU = (opcode == 7'b1100011) && (funct3 == 3'b110);
    wire BGEU;
    assign BGEU = (opcode == 7'b1100011) && (funct3 == 3'b111);
    // ecall & ebreak
    wire ECALL;
    assign ECALL = (decode_inst == 32'h00000073);
    wire EBREAK;
    assign EBREAK = (decode_inst == 32'h00100073);
    // csr op
    wire CSRRW;
    assign CSRRW = (opcode == 7'b1110011) && (funct3 == 3'b001);
    wire CSRRS;
    assign CSRRS = (opcode == 7'b1110011) && (funct3 == 3'b010);
    wire CSRRC;
    assign CSRRC = (opcode == 7'b1110011) && (funct3 == 3'b011);
    wire CSRRWI;
    assign CSRRWI = (opcode == 7'b1110011) && (funct3 == 3'b101);
    wire CSRRSI;
    assign CSRRSI = (opcode == 7'b1110011) && (funct3 == 3'b110);
    wire CSRRCI;
    assign CSRRCI = (opcode == 7'b1110011) && (funct3 == 3'b111);
    wire MRET;
    assign MRET = (decode_inst == 32'h30200073);
    // fence.i
    wire FENCEI;
    assign FENCEI = (opcode == 7'b0001111) && (funct3 == 3'b001);
    // inst var parsing
    wire csr_rd_gpr;
    assign csr_rd_gpr = CSRRW | CSRRS | CSRRC | I_timer_intr;
    assign O_stall_en[1] = (typeI | typeS | typeR | typeB | csr_rd_gpr) && (rs1 != 0);
    assign O_stall_en[0] = (typeS | typeR | typeB) && (rs2 != 0);
    assign funct7 = decode_inst[31:25];
    assign opcode = decode_inst[6:0];
    assign rd = decode_inst[11:7];
    assign funct3 = decode_inst[14:12];
    assign rs1 = decode_inst[19:15];
    assign rs2 = decode_inst[24:20];
    assign immI = decode_inst[31:20];
    assign immS = {decode_inst[31:25], decode_inst[11:7]};
    assign immB = {decode_inst[31], decode_inst[7], decode_inst[30:25], decode_inst[11:8],1'b0};
    assign immU = {decode_inst[31:12],12'b0};
    assign immJ = {decode_inst[31],decode_inst[19:12],decode_inst[20],decode_inst[30:21],1'b0};
    // rs1, rs2, rd addr
    assign O_rs1 = rs1;
    assign O_rs2 = rs2;
    assign O_rd = rd;
    // csr data
    assign O_csr_addr = I_timer_intr ? 12'h305 : decode_inst[31:20];
    assign O_csr_imm = decode_inst[19:15];
    //assign O_csr_op_sel = decode_inst[14:12];
    //assign O_funct3 = funct3;
    //assign O_funct7 = funct7;
    // inst type
    assign typeI = (opcode == 7'b1100111) || (opcode == 7'b0000011) || (opcode == 7'b0010011) || (opcode == 7'b0011011);
    assign typeS = (opcode == 7'b0100011);
    assign typeB = (opcode == 7'b1100011);
    assign typeU = (opcode == 7'b0010111) || (opcode == 7'b0110111);
    assign typeJ = (opcode == 7'b1101111);
    assign typeR = (opcode == 7'b0110011) || (opcode == 7'b0111011);
    assign typeC = (opcode == 7'b1110011);
    
    // O_imm
    assign O_imm = ({64{typeI}} & {{52{immI[11]}},immI})
                    | ({64{typeS}} & {{52{immS[11]}},immS})
                    | ({64{typeB}} & {{51{immB[12]}},immB})
                    | ({64{typeU}} & {{32{immU[31]}},immU})
                    | ({64{typeJ}} & {{43{immJ[20]}},immJ});

    // ctrl signal gen
    // assign O_csr_op_sel[6] = ECALL | EBREAK | MRET;
    assign O_csr_op_sel = {CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI};
    // csr wr en
    wire [63:0] NO;
    assign NO = I_timer_intr ? 64'h8000_0000_0000_0007 : ECALL ? 64'hb : EBREAK ? 64'h3 : 64'h0;
    // assign NO = ({64{ECALL & ~}} & 64'hb) | ({64{EBREAK}}) | ();
    assign O_csr_wen = CSRRW | CSRRS | CSRRC | CSRRWI | CSRRSI | CSRRCI;
    assign O_csr_intr = ECALL | EBREAK | I_timer_intr;
    assign O_csr_intr_no = NO;
    assign O_csr_mret = MRET;
    // reg wr en
    wire regin_from_mem;
    assign regin_from_mem = (opcode == 7'b0000011);
    // O_regin_sel: 4 for reserved, 2 for memory in, 1 for alu in
    // csr data to gpr is merged into alu
    //assign O_regin_sel[2] = O_reg_wen & (JAL | JALR);
    //assign O_regin_sel[2] = 0;
    assign O_regin_sel[1] = O_reg_wen & regin_from_mem;
    assign O_regin_sel[0] = O_reg_wen & (~regin_from_mem);
    assign O_reg_wen = typeR | typeI | typeU | typeJ | O_csr_wen;
    assign O_mem_wen = typeS;
    assign O_mem_wstrb = ({8{SD}} & 8'b11111111)
    		       | ({8{SW}} & 8'b00001111)
    		       | ({8{SH}} & 8'b00000011)
    		       | ({8{SB}} & 8'b00000001);
    assign O_mem_rstrb[8] = LW | LH | LB; //sext
    assign O_mem_rstrb[7:4] = {4{LD}};
    assign O_mem_rstrb[3:2] = {2{LD | LW | LWU}};
    assign O_mem_rstrb[1] = LD | LW | LWU | LH | LHU;
    assign O_mem_rstrb[0] = LD | LW | LWU | LH | LHU | LB | LBU;
    //assign O_mem_ren = (opcode == 7'b0000011);
    // dnpc
    wire typeB_jr;
    wire csr_jr;
    wire eq, neq, lt, ge, ltu, geu;
    assign eq = I_rs1_data == I_rs2_data;
    assign neq = ~eq;
    assign ltu = I_rs1_data < I_rs2_data;
    assign geu = ~ltu;
    assign lt = ($signed(I_rs1_data)) < ($signed(I_rs2_data));
    assign ge = ~lt;
    assign typeB_jr = (BEQ&eq) | (BNE&neq) | (BLT&lt) | (BGE&ge) | (BLTU&ltu) | (BGEU&geu);
    assign csr_jr = ECALL | EBREAK | MRET | I_timer_intr;
    // assign O_dnpc_sel[4] = csr_jr;
    // assign O_dnpc_sel[3] = JALR;
    // assign O_dnpc_sel[2] = JAL;
    // assign O_dnpc_sel[1] = typeB_jr;
    assign O_dnpc_sel[3] = FENCEI;
    assign O_dnpc_sel[2] = csr_jr;
    assign O_dnpc_sel[1] = JALR;
    assign O_dnpc_sel[0] = ~(JALR | JAL | typeB_jr | csr_jr | FENCEI);
    // alu op
    localparam OP_ADD = 15'b000_0000_0000_0001;
    localparam OP_SUB = 15'b000_0000_0000_0010;
    localparam OP_SLT = 15'b000_0000_0000_0100;
    localparam OP_SLTU = 15'b000_0000_0000_1000;
    localparam OP_XOR = 15'b000_0000_0001_0000;
    localparam OP_OR = 15'b000_0000_0010_0000;
    localparam OP_AND = 15'b000_0000_0100_0000;
    localparam OP_SLL = 15'b000_0000_1000_0000;
    localparam OP_SRL = 15'b000_0001_0000_0000;
    localparam OP_SRA = 15'b000_0010_0000_0000;
    localparam OP_MUL = 15'b000_0100_0000_0000;
    localparam OP_MULH = 15'b000_1000_0000_0000;
    localparam OP_DIV = 15'b001_0000_0000_0000;
    //localparam OP_DIVU = 15'b001_0000_0000_0000;
    localparam OP_REM = 15'b010_0000_0000_0000;
    localparam OP_CSR = 15'b100_0000_0000_0000;
    assign O_word_op_mask = (opcode == 7'b0011011) || (opcode == 7'b0111011);
    assign O_alu_op_sext[1] = MUL | MULH | MULHSU | DIV | REM | MULW | DIVW | REMW;
    assign O_alu_op_sext[0] = MUL | MULH | DIV | REM | MULW | DIVW | REMW;
    wire add_flag;
    wire ld_flag;
    assign ld_flag = (opcode == 7'b0000011);
    assign add_flag = (typeU | typeB | typeS | ld_flag | JAL | JALR | ADDI | ADDIW | ADD | ADDW);
    wire sub_flag;
    assign sub_flag = SUB | SUBW;
    wire slt_flag;
    assign slt_flag = SLTI | SLT;
    wire sltu_flag;
    assign sltu_flag = SLTIU | SLTU;
    wire xor_flag;
    assign xor_flag = XORI | XOR;
    wire or_flag;
    assign or_flag = ORI | OR;
    wire and_flag;
    assign and_flag = ANDI | AND;
    wire sll_flag;
    assign sll_flag = SLLI | SLL | SLLIW | SLLW;
    wire srl_flag;
    assign srl_flag = SRLI | SRL | SRLIW | SRLW;
    wire sra_flag;
    assign sra_flag = SRAI | SRA | SRAIW | SRAW;
    wire mul_flag;
    assign mul_flag = MUL | MULW;
    wire mulh_flag;
    assign mulh_flag = MULH | MULHSU | MULHU;
    wire div_flag;
    assign div_flag = DIV | DIVU | DIVW | DIVUW;
    wire rem_flag;
    assign rem_flag = REM | REMU | REMW | REMUW;
    wire csr_flag;
    assign csr_flag = typeC;
    assign O_alu_op_sel = (OP_ADD & {15{add_flag}})
    			| (OP_SUB & {15{sub_flag}})
    			| (OP_SLT & {15{slt_flag}})
    			| (OP_SLTU & {15{sltu_flag}})
    			| (OP_XOR & {15{xor_flag}})
    			| (OP_OR & {15{or_flag}})
    			| (OP_AND & {15{and_flag}})
    			| (OP_SLL & {15{sll_flag}})
    			| (OP_SRL & {15{srl_flag}})
    			| (OP_SRA & {15{sra_flag}})
    			| (OP_MUL & {15{mul_flag}})
    			| (OP_MULH & {15{mulh_flag}})
    			| (OP_DIV & {15{div_flag}})
    			| (OP_REM & {15{rem_flag}})
                | (OP_CSR & {15{csr_flag}});
    // op_num1
    localparam OP1_RS1 = 3'd1;
    localparam OP1_PC = 3'd2;
    localparam OP1_ZERO = 3'd4;
    wire rs1_flag, pc_flag, zero_flag;
    assign rs1_flag = typeR | (typeI & (~JALR)) | typeS | typeC;
    assign pc_flag = typeB | typeJ | AUIPC | JALR;
    assign zero_flag = LUI;
    assign O_opnum1_sel = OP1_RS1 & {3{rs1_flag}}
                        | OP1_PC & {3{pc_flag}}
                        | OP1_ZERO & {3{zero_flag}};
    // op_num2
    localparam OP2_RS2 = 3'd1;
    localparam OP2_IMM = 3'd2;
    localparam OP2_FOUR = 3'd4;
    //TODO: add alu cal pc+4 datapath, also adjust wb sel
    wire rs2_flag, imm_flag, four_flag;
    assign rs2_flag = typeR;
    assign imm_flag = (typeI & (~JALR)) | typeS | typeB | typeU;
    assign four_flag = JALR | typeJ;
    assign O_opnum2_sel = OP2_RS2 & {3{rs2_flag}}
                        | OP2_IMM & {3{imm_flag}}
                        | OP2_FOUR & {3{four_flag}};
    // ebreak signal gen
    //always @(posedge I_sys_clk)
    //	if ((decode_inst == 32'h00100073) && !I_rst)
    //	    sim_end();
    //assign O_sim_end = (decode_inst == 32'h00100073) ? 1:0;
endmodule
module ysyx_040750_EX_MEM_reg(
    input I_sys_clk,
    input I_rst,
    input I_EX_MEM_valid,
    input I_EX_MEM_allowout,
    output reg O_EX_MEM_allowin,
    output O_EX_MEM_valid,
    //output reg O_EX_MEM_valid,
    input [8:0] I_rstrb,
    input [7:0] I_wstrb,
    input [63:0] I_alu_out,
    //input [63:0] I_mem_addr,
    input [63:0] I_rs2_data,// for ld inst
    input I_mem_wen,
    input [31:0] I_pc,
    input I_reg_wen,
    input [4:0] I_rd_addr,
    input [1:0] I_regin_sel,
    //input [63:0] I_mem_data,
	input I_mem_ready,
    input I_mem_data_rvalid,
	input I_mem_data_bvalid,
	//input [6:0] I_csr_op_sel,
	//input [4:0] I_csr_imm,
	input [11:0] I_csr_addr,
	input I_csr_wen,
	input I_csr_intr,
	// input I_csr_mtip,
	input [63:0] I_csr_intr_no,
	input I_csr_mret,
	input [63:0] I_csr,
	input I_fencei,
	// output reg [6:0] O_csr_op_sel,
	// output reg [4:0] O_csr_imm,
	output reg [11:0] O_csr_addr,
	output reg O_csr_wen,
	output reg O_csr_intr,
	// output reg O_csr_mtip,
	output reg [63:0] O_csr_intr_no,
	output reg O_csr_mret,
	output reg [63:0] O_csr,
    //input I_EX_MEM_block,
    output reg [8:0] O_rstrb,
    output reg [7:0] O_wstrb,
    output reg [63:0] O_alu_out,
    //output reg [63:0] O_mem_addr,
    output reg [63:0] O_rs2_data,
    output O_mem_rd_en,
	output O_mem_wr_en,
    // output reg O_mem_wen,
    output reg [31:0] O_pc,
    output reg O_reg_wen,
    output reg [4:0] O_rd_addr,
    output reg [1:0] O_regin_sel,
    output O_EX_MEM_input_valid,
	output reg O_fencei
    //output reg [63:0] O_mem_data,
    // input [31:0] I_inst_debug,
    // output reg [31:0] O_inst_debug,
    // input I_bubble_inst_debug,
    // output reg O_bubble_inst_debug
    );
    //wire mem_rd_en;
    reg mem_rd_en, mem_wr_en;
	reg mem_wstatus;
    reg input_valid;
    wire output_valid;
	wire rd_handshake, wr_handshake;
    //reg mem_data_valid;
    //assign mem_rd_en = O_regin_sel[1];
    //always @(posedge I_sys_clk)
    //	mem_rd_en_d <= mem_rd_en;
    //assign O_mem_rd_en = mem_rd_en & (!mem_rd_en_d);
    assign rd_handshake = mem_rd_en & I_mem_ready;
	assign wr_handshake = mem_wr_en & I_mem_ready;
	assign O_mem_rd_en = mem_rd_en;
	assign O_mem_wr_en = mem_wr_en;
    assign O_EX_MEM_input_valid = input_valid;
    //assign output_valid = (input_valid & ~mem_rd_en) | I_mem_data_rvalid;
	assign output_valid = (input_valid & ~O_regin_sel[1] & ~mem_wstatus) | I_mem_data_rvalid | I_mem_data_bvalid;
    /*always @(posedge I_sys_clk)
    	if(I_rst)
	    output_valid <= 0;
	else
	    output_valid <= ((I_EX_MEM_valid & ~mem_rd_en) | I_mem_data_rvalid);*/
    assign O_EX_MEM_allowin = !input_valid || (output_valid && I_EX_MEM_allowout);
    assign O_EX_MEM_valid = input_valid && output_valid;
    /*always @(posedge I_sys_clk)
	if(I_rst)
	    O_EX_MEM_valid <= 0;
	else
	    O_EX_MEM_valid <= input_valid && output_valid;*/
	// I_regin_sel[1] indicates mem rd op;
    always @(posedge I_sys_clk)
		if(I_rst)
			mem_wr_en <= 0;
		else if(wr_handshake)
			mem_wr_en <= 0;
		else if(I_EX_MEM_valid && O_EX_MEM_allowin && I_mem_wen)
			mem_wr_en <= 1;
		else
			mem_wr_en <= mem_wr_en;
	always @(posedge I_sys_clk)
		if(I_rst)
			mem_rd_en <= 0;
		else if(rd_handshake)
			mem_rd_en <= 0;
		else if(I_EX_MEM_valid && O_EX_MEM_allowin && I_regin_sel[1])
			mem_rd_en <= 1;
		else
			mem_rd_en <= mem_rd_en;
    always @(posedge I_sys_clk)
		if(I_rst)
			input_valid <= 0;
		else if(O_EX_MEM_allowin)
			input_valid <= I_EX_MEM_valid;
		else
			input_valid <= input_valid;
    always @(posedge I_sys_clk)
    	if(I_rst) begin
			O_reg_wen <= 0;
			O_rstrb <= 0;
			O_pc <= 0;
			O_wstrb <= 0;
			O_alu_out <= 0;
			//O_mem_addr <= 0;
			O_rs2_data <= 0;
			mem_wstatus <= 0;
			O_reg_wen <= 0;
			O_rd_addr <= 0;
			O_regin_sel <= 0;
			//O_mem_data <= 0;
			// O_inst_debug <= 0;
			// O_bubble_inst_debug <= 0;
			O_csr_addr <= 0;
			O_csr_wen <= 0;
			O_csr_intr <= 0;
			// O_csr_mtip <= 0;
			O_csr_intr_no <= 0;
			O_csr_mret <= 0;
			O_csr <= 0;
			O_fencei <= 0;
    	end
    	else if(I_EX_MEM_valid && O_EX_MEM_allowin) begin
			O_reg_wen <= I_reg_wen;
			O_rstrb <= I_rstrb;
			O_pc <= I_pc;
			O_wstrb <= I_wstrb;
			O_alu_out <= I_alu_out;
			//O_mem_addr <= I_mem_addr;
			O_rs2_data <= I_rs2_data;
			mem_wstatus <= I_mem_wen;
			O_reg_wen <= I_reg_wen;
			O_rd_addr <= I_rd_addr;
			O_regin_sel <= I_regin_sel;
			//O_mem_data <= I_mem_data;
			// O_inst_debug <= I_inst_debug;
			// O_bubble_inst_debug <= I_bubble_inst_debug;
			O_csr_addr <= I_csr_addr;
			O_csr_wen <= I_csr_wen;
			O_csr_intr <= I_csr_intr;
			// O_csr_mtip <= I_csr_mtip;
			O_csr_intr_no <= I_csr_intr_no;
			O_csr_mret <= I_csr_mret;
			O_csr <= I_csr;
			O_fencei <= I_fencei;
    	end
    	else begin
    	    O_reg_wen <= O_reg_wen;
    	    O_rstrb <= O_rstrb;
    	    O_pc <= O_pc;
    	    O_wstrb <= O_wstrb;
    	    O_alu_out <= O_alu_out;
    	    //O_mem_addr <= O_mem_addr;
    	    O_rs2_data <= O_rs2_data;
    	    mem_wstatus <= mem_wstatus;
    	    O_reg_wen <= O_reg_wen;
    	    O_rd_addr <= O_rd_addr;
    	    O_regin_sel <= O_regin_sel;
    	    //O_mem_data <= O_mem_data;
    	    // O_inst_debug <= O_inst_debug;
	    	// O_bubble_inst_debug <= O_bubble_inst_debug;
			O_csr_addr <= O_csr_addr;
			O_csr_wen <= O_csr_wen;
			O_csr_intr <= O_csr_intr;
			// O_csr_mtip <= O_csr_mtip;
			O_csr_intr_no <= O_csr_intr_no;
			O_csr_mret <= O_csr_mret;
			O_csr <= O_csr;
			O_fencei <= O_fencei;
    	end			
endmodule
module ysyx_040750_forward_unit(
    input [63:0] I_ID_rs1_data,// ID_EX out to alu
    input [63:0] I_ID_rs2_data,// ID_EX out to alu
    input [63:0] I_EX_data,// EX_MEM out
    input [63:0] I_MEM_data,// MEM_WB out
    input [63:0] I_WB_data,// reg rd port
    // input [1:0] I_stall_en,
    input [1:0] I_EX_stall,
    input [1:0] I_MEM_stall,
    input [1:0] I_WB_stall,
    input I_EX_reg_wen,
    input I_MEM_reg_wen,
    input I_WB_reg_wen,
    output reg [63:0] O_ID_EX_rs1_data,
    output reg [63:0] O_ID_EX_rs2_data
);
	always @(*)
		if(I_EX_stall[1] & I_EX_reg_wen)
			O_ID_EX_rs1_data = I_EX_data;
		else if(I_MEM_stall[1] & I_MEM_reg_wen)
			O_ID_EX_rs1_data = I_MEM_data;
		else if(I_WB_stall[1] & I_WB_reg_wen)
			O_ID_EX_rs1_data = I_WB_data;
		else
			O_ID_EX_rs1_data = I_ID_rs1_data;
	always @(*)
		if(I_EX_stall[0] & I_EX_reg_wen)
			O_ID_EX_rs2_data = I_EX_data;
		else if(I_MEM_stall[0] & I_MEM_reg_wen)
			O_ID_EX_rs2_data = I_MEM_data;
		else if(I_WB_stall[0] & I_WB_reg_wen)
			O_ID_EX_rs2_data = I_WB_data;
		else
			O_ID_EX_rs2_data = I_ID_rs2_data;
endmodule
module ysyx_040750_gpr_alu(
    input I_sys_clk,
    input I_rst,
    input [63:0] I_csr_data,
    input [63:0] I_op1,
    input [63:0] I_op2,
    input [14:0] I_alu_op_sel,
    input [1:0] I_alu_op_sext,
    input I_word_op_mask,
    input I_multicycle,// ID_EX input valid
    input I_EX_MEM_ready,// EX_MEM ready for multicycle result
    //output [63:0] O_mem_addr,
    output [63:0] O_result,
    output O_result_valid
    );
    // op
    wire op_add,op_sub,op_slt,op_sltu,op_xor,op_or,op_and,op_sll,op_srl,op_sra,op_mul,op_mulh,op_div,op_rem,op_csr;
    assign op_add = I_alu_op_sel[0];
    assign op_sub = I_alu_op_sel[1];
    assign op_slt = I_alu_op_sel[2];
    assign op_sltu = I_alu_op_sel[3];
    assign op_xor = I_alu_op_sel[4];
    assign op_or = I_alu_op_sel[5];
    assign op_and = I_alu_op_sel[6];
    assign op_sll = I_alu_op_sel[7];
    assign op_srl = I_alu_op_sel[8];
    assign op_sra = I_alu_op_sel[9];
    assign op_mul = I_alu_op_sel[10];
    assign op_mulh = I_alu_op_sel[11];
    assign op_div = I_alu_op_sel[12];
    //assign op_divu = I_alu_op_sel[12];
    assign op_rem = I_alu_op_sel[13];
    assign op_csr = I_alu_op_sel[14];
    // result
    wire [63:0] add_sub_result;
    wire [63:0] slt_result;
    wire [63:0] sltu_result;
    wire [63:0] xor_result;
    wire [63:0] or_result;
    wire [63:0] and_result;
    wire [63:0] sll_result;
    wire [63:0] srl_result;
    wire [63:0] sra_result;
    wire [63:0] mul_result;
    wire [63:0] mulh_result;
    wire [63:0] div_result;
    //wire [63:0] divu_result;
    wire [63:0] rem_result;
    wire [63:0] csr_result;
    //wire [64:0] op1_sext, op2_sext;
    wire [63:0] op1_sext, op2_sext;
    wire sign_bit1, sign_bit2;
    wire sext1, sext2;
    
    // reg mul_valid_d, div_valid_d;
    wire mul_flag, div_flag;
    wire mul_valid, div_valid;
    wire mul_out_valid, div_out_valid;
    reg [63:0] mulh_reg, mul_reg, div_reg, rem_reg;
    reg mul_reg_valid, div_reg_valid;
    wire [63:0] mulh_final, mul_final, div_final, rem_final;
    // if sext, use sign bit to extend bit[64](bit[64:32] for w case)
    // sign bit sel
    assign sign_bit1 = I_word_op_mask ? I_op1[31] : I_op1[63];
    assign sign_bit2 = I_word_op_mask ? I_op2[31] : I_op2[63];
    // sext bit sel : sign bit for signed, 0 for unsigned
    assign sext1 = I_alu_op_sext[1] ? sign_bit1 : 0;
    assign sext2 = I_alu_op_sext[0] ? sign_bit2 : 0;
    //assign op1_sext[64] = sext1;
    //assign op2_sext[64] = sext2;
    // DW/W sel
    //assign op1_sext[63:0] = I_word_op_mask ? {{32{sext1}}, I_op1[31:0]} : I_op1;
    //assign op2_sext[63:0] = I_word_op_mask ? {{32{sext2}}, I_op2[31:0]} : I_op2;
    assign op1_sext = I_word_op_mask ? {{32{sext1}}, I_op1[31:0]} : I_op1;
    assign op2_sext = I_word_op_mask ? {{32{sext2}}, I_op2[31:0]} : I_op2;
    //assign op1_sext[64] = I_alu_op_sext[1] ? sign_bit1 : 0;
    //assign op1_sext[63:0] = I_word_op_mask ? {{32{op1_sext[64]}}, I_op1[31:0]}: I_op1;
    //assign op2_sext[64] = I_alu_op_sext[0] ? sign_bit2 : 0;
    //assign op2_sext[63:0] = I_word_op_mask ? {{32{op2_sext[64]}}, I_op2[31:0]}: I_op2;
    assign and_result = I_op1 & I_op2;
    assign xor_result = I_op1 ^ I_op2;
    assign or_result = I_op1 | I_op2;
    
    // single cycle mul/div
    /*assign mul_out_valid = |I_alu_op_sel[11:10];
    assign div_out_valid = |I_alu_op_sel[13:12];
    assign {mulh_result, mul_result} = ($signed(op1_sext)) * ($signed(op2_sext));
    wire div_sink, rem_sink;
    assign {div_sink, div_result} = ($signed(op1_sext)) / ($signed(op2_sext));
    assign {rem_sink, rem_result} = ($signed(op1_sext)) % ($signed(op2_sext));*/
    
    // multicycle mul/div
    // select mul / div
    assign mul_flag = op_mul | op_mulh;
    assign div_flag = op_div | op_rem;
    assign mul_valid = mul_flag & I_multicycle;
    assign div_valid = div_flag & I_multicycle;

    // mul / div inst
    ysyx_040750_booth_mul_serial booth_mul_serial_e(
    	.clk(I_sys_clk),
    	.rst(I_rst),
    	// .mul1(op1_sext[63:0]),
    	// .mul2(op2_sext[63:0]),
        .mul1(op1_sext),
    	.mul2(op2_sext),
    	// .is_signed(sext1),
        .sext_flag(I_alu_op_sext),
    	.mul_valid(mul_valid),
    	.P_valid(mul_out_valid),
    	.P({mulh_result, mul_result})
    );
    ysyx_040750_radix2_div radix2_div_e(
		.clk(I_sys_clk),
		.rst(I_rst),
		// out = dividend / divisor
		// .dividend(op1_sext[63:0]),
		// .divisor(op2_sext[63:0]),
        .dividend(op1_sext),
		.divisor(op2_sext),
		// .is_signed(sext1),
        .is_signed(|I_alu_op_sext),
		.div_valid(div_valid),
		.quotient(div_result),
		.remainder(rem_result),
		.Q_valid(div_out_valid)
    );
    // if MEM & WB blocked, cache data & valid flag
    always @(posedge I_sys_clk)
    	if(I_rst)
    		{mulh_reg, mul_reg} <= 128'b0;
    	else if(mul_out_valid & ~I_EX_MEM_ready)
    		{mulh_reg, mul_reg} <= {mulh_result, mul_result};
    	else
    		{mulh_reg, mul_reg} <= {mulh_reg, mul_reg};
    always @(posedge I_sys_clk)
    	if(I_rst)
    		mul_reg_valid <= 0;
    	else if(mul_out_valid & ~I_EX_MEM_ready)
    		mul_reg_valid <= 1;
    	else if(mul_reg_valid & I_EX_MEM_ready)
    		mul_reg_valid <= 0;
    	else
    		mul_reg_valid <= mul_reg_valid;
    always @(posedge I_sys_clk)
    	if(I_rst)
    		{div_reg, rem_reg} <= 128'b0;
    	else if(div_out_valid & ~I_EX_MEM_ready)
    		{div_reg, rem_reg} <= {div_result, rem_result};
    	else
    		{div_reg, rem_reg} <= {div_reg, rem_reg};
    always @(posedge I_sys_clk)
    	if(I_rst)
    		div_reg_valid <= 0;
    	else if(div_out_valid & ~I_EX_MEM_ready)
    		div_reg_valid <= 1;
    	else if(div_reg_valid & I_EX_MEM_ready)
    		div_reg_valid <= 0;
    	else
    		div_reg_valid <= div_reg_valid;
    assign {mulh_final, mul_final} = mul_reg_valid ? {mulh_reg, mul_reg} : {mulh_result, mul_result};
    assign {div_final, rem_final} = div_reg_valid ? {div_reg, rem_reg} : {div_result, rem_result};
    // add, sub, slt, sltu
    wire [63:0] adder1, adder2, result;
    wire [63:0] cin;
    wire cout;
    //wire cout;
    assign adder1 = I_op1;
    assign adder2 = (op_sub | op_slt | op_sltu) ? ~I_op2 : I_op2;
    assign cin = (op_sub | op_slt | op_sltu) ? 1 : 0;
    assign {cout, result} = adder1+adder2+cin;
    //assign {cout, result} = adder1+adder2;
    assign add_sub_result = result;
    assign slt_result[63:1] = 0;
    assign slt_result[0] = (I_op1[63] & ~I_op2[63]) | (~(I_op1[63] ^ I_op2[63]) & result[63]);
    assign sltu_result[63:1] = 0;
    assign sltu_result[0] = ~cout;
    // sll, srl, sra
    wire [63:0] reverse_op1;
    generate for(genvar i = 0;i<64;i=i+1) begin
        assign reverse_op1[i] = I_op1[63-i];
    end
    endgenerate
    // sign for sra mask
    wire shift_sign;
    assign shift_sign = I_word_op_mask ? I_op1[31] : I_op1[63];
    // op for sll/srl
    wire [63:0] shift_op;
    assign shift_op = op_sll ? reverse_op1 : I_op1;
    // w/dw shamt
    wire [5:0] shamt;
    assign shamt = I_word_op_mask ?  {1'b0, I_op2[4:0]} : I_op2[5:0];
    // w/dw sra mask
    wire [63:0] sra_mask;
    assign sra_mask = I_word_op_mask ? ~(64'h0000_0000_ffff_ffff >> shamt) : ~(64'hffff_ffff_ffff_ffff >> shamt);
    // unified shift result
    wire [63:0] shift_result;
    // for W op
    wire [31:0] shift_opW;
    // sll op is on msb
    assign shift_opW = op_sll ? shift_op[63:32] : shift_op[31:0];
    // dw/w unified right shift op sel
    wire [63:0] srl_op;
    assign srl_op = I_word_op_mask ? {32'b0, shift_opW} : shift_op;
    assign shift_result = srl_op >> shamt;
    //assign shift_result = I_word_op_mask ? ({32'b0, shift_opW} >> shamt) : (shift_op >> shamt);
    assign srl_result = shift_result;
    assign sra_result = ({64{shift_sign}} & sra_mask) | shift_result;
    // w/dw sll result
    wire [63:0] sllw_result;
    wire [63:0] slldw_result;
    assign sll_result = I_word_op_mask ? sllw_result : slldw_result;
    assign sllw_result = {{32{shift_result[0]}}, slldw_result[63:32]};
    generate for(genvar i = 0;i<64;i=i+1) begin
        assign slldw_result[i] = shift_result[63-i];
    end
    endgenerate
    //assign O_mem_addr = add_sub_result;
    assign csr_result = I_csr_data;
    wire [63:0] dword_result, word_sext_result;
    assign dword_result = ({64{op_add | op_sub}} & add_sub_result)
                        | ({64{op_slt}} & slt_result)
                        | ({64{op_sltu}} & sltu_result)
                        | ({64{op_xor}} & xor_result)
                        | ({64{op_or}} & or_result)
                        | ({64{op_and}} & and_result)
                        | ({64{op_sll}} & sll_result)
                        | ({64{op_srl}} & srl_result)
                        | ({64{op_sra}} & sra_result)
                        | ({64{op_mul}} & mul_final)
                        | ({64{op_mulh}} & mulh_final)
                        | ({64{op_div}} & div_final)
                        //| ({64{op_divu}} & divu_result)
                        | ({64{op_rem}} & rem_final)
                        | ({64{op_csr}} & csr_result);
    // only divuw and remuw produce 0 sext
    wire word_sext;
    assign word_sext = ((op_div | op_rem) && (~|I_alu_op_sext)) ? 0 : dword_result[31];
    assign word_sext_result = {{32{word_sext}}, dword_result[31:0]};
    assign O_result = I_word_op_mask ? word_sext_result : dword_result;
    assign O_result_valid = |I_alu_op_sel[13:10] ? (div_out_valid | mul_out_valid | mul_reg_valid | div_reg_valid) : 1;
endmodule
module ysyx_040750_gpr(
    input I_sys_clk,
    input I_rst,
    input [63:0] I_wr_data,
    input I_wen,
    input [4:0] I_rd_addr,
    input [4:0] I_rs1_addr,
    output [63:0] O_rs1_data,
    input [4:0] I_rs2_addr,
    output [63:0] O_rs2_data
    );
    //export "DPI-C" function check;
    // import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
    reg [63:0] gpr [31:0];
    // initial set_gpr_ptr(gpr);
    wire wen [31:0];
    assign wen[0] = 0;
    generate for(genvar i=1;i<32;i=i+1) begin
        assign wen[i] = (i == I_rd_addr) ? I_wen : 0;
    end
    endgenerate
    generate for(genvar i=0;i<32;i=i+1) begin
        always @(posedge I_sys_clk)
            if(I_rst)
                gpr[i] <= 0;
            else if(wen[i])
                gpr[i] <= I_wr_data;
            else
                gpr[i] <= gpr[i];
    end
    endgenerate
    assign O_rs1_data = gpr[I_rs1_addr];
    assign O_rs2_data = gpr[I_rs2_addr];
    //function void check();
    //	$display("%d\n", gpr[10]);
    //endfunction
    
endmodule
module ysyx_040750_icachectrl #(
    parameter BLOCK_SIZE = 32,
    parameter CACHE_SIZE = 4096,
    parameter GROUP_NUM = 2,
    parameter BLOCK_NUM = CACHE_SIZE / BLOCK_SIZE,
    parameter OFFT_LEN = $clog2(BLOCK_SIZE),
    parameter INDEX_LEN = $clog2(BLOCK_NUM/GROUP_NUM),
    parameter TAG_LEN = 32-OFFT_LEN-INDEX_LEN
)(
    input I_clk,
    input I_rst,
    // cpu addr & rd req
    // pc 
    input [31:0] I_cpu_addr,
    input I_cpu_rd_req,
    output O_cpu_rd_ready,
    input I_cpu_fencei,// from cpu, fencei begin, disable pc_ready
    input I_dcache_clean,// from dcache, fencei end, enable pc_ready
    // cache rd addr & req, low level valid en
    input [255:0] I_way0_rdata,
    input [255:0] I_way1_rdata,
    output [5:0] O_sram_addr,
    // msb-lsb: bram 3-0
    // wen=0 -> wr, wen=1 -> rd
    // wmask[i]=0 -> wvalid[i]
    output [3:0] O_sram_cen,
    output [3:0] O_sram_wen,
    output [255:0] O_sram_wdata,
    output [255:0] O_sram_wmask,
    // mem data, rd addr & req
    input [63:0] I_mem_rdata,
    input I_mem_arready,
    input I_mem_rvalid,
    input I_mem_rlast,
    output [31:0] O_mem_araddr,// addr to mem
    output O_mem_arvalid,
    output O_mem_rready,
    //output O_mem_bready,
    output [7:0] O_mem_arlen,
    output [2:0] O_mem_arsize,
    output [1:0] O_mem_arburst,
    // data & valid flag to cpu
    output [31:0] O_cpu_inst,
    output O_cpu_rvalid
);
    // ctrl sram 0-3 only, 4-7 ctrled by dcachectrl
    // addr division
    // cpu IDLE info
    // wire [OFFT_LEN-1:0] offset;
    wire [INDEX_LEN-1:0] index;
    wire [TAG_LEN-1:0] tag;
    // cache miss mem info
    wire [OFFT_LEN-1:0] mem_offset;
    wire [INDEX_LEN-1:0] mem_index;
    wire [TAG_LEN-1:0] mem_tag;
    // mem addr reg
    reg [31:0] mem_addr;
    // lookup table
    // table index LSB indecates way num, remaining 7-bit MSB indicate cacheline index[6:0]
    genvar i;
    reg [TAG_LEN-1:0] lookup_table [BLOCK_NUM-1:0];
    reg [BLOCK_NUM-1:0] valid_table;
    wire [BLOCK_NUM-1:0] lookup_table_index;
    wire [TAG_LEN-1:0] way0_tag, way1_tag;
    wire way0_valid, way1_valid;
    wire way0_hit, way1_hit;
    wire way0_replace, way1_replace;
    reg [1:0] hit_flag;// 01 for way0 hit, 10 for way1 hit;
    // final data rd src
    wire [255:0] mem_rdata;
    // cache hit data source
    wire [255:0] hit_rdata;
    // mem wb reg
    reg [255:0] cacheline_reg;
    // ctrl signal
    wire rd_hit, rd_miss, rd_handshake, rd_reload, rd_allocate, pc_handshake;
    wire mmio_flag;
    reg mmio_process;
    wire mmio_rvalid;
    wire mem_ar_req;
    // mmio & cache inst
    wire [31:0] mmio_inst, cache_inst;
    wire fencei_ready, fencei_flag;
    reg fencei_reg;
    // FSM
    `define ysyx_040750_IFSM_WIDTH 7
    localparam IDLE = `ysyx_040750_IFSM_WIDTH'b000000; 
    localparam RD_HIT = `ysyx_040750_IFSM_WIDTH'b000001;
    localparam RD_MISS = `ysyx_040750_IFSM_WIDTH'b000010;
    localparam RD_RELOAD = `ysyx_040750_IFSM_WIDTH'b000100;
    localparam RD_ALLOCATE = `ysyx_040750_IFSM_WIDTH'b001000;
    localparam MMIO_AR = `ysyx_040750_IFSM_WIDTH'b010000;
    localparam MMIO_RD = `ysyx_040750_IFSM_WIDTH'b100000;
    localparam FENCEI = `ysyx_040750_IFSM_WIDTH'b1000000;
    reg [`ysyx_040750_IFSM_WIDTH-1:0] current_state, next_state;
    // cache addr cen gen
    reg [3:0] cen_icache; // TODO: add ctrl logic
    // fence.i
    assign fencei_ready = (current_state == IDLE) || (current_state == RD_HIT);// CPU_rd_ready actually
    always @(posedge I_clk)
        if(I_rst)
            fencei_reg <= 0;
        else if(~fencei_ready & I_cpu_fencei)
            fencei_reg <= 1;
        else if(fencei_ready & fencei_flag)
            fencei_reg <= 0;
        else
            fencei_reg <= fencei_reg;
    assign fencei_flag = I_cpu_fencei | fencei_reg;
    // axi constant
    assign O_mem_rready = 1;// always enable rdata
    //assign O_mem_bready = 0;// always disable wresp
    assign O_mem_arlen = mmio_process ? 0 : 3;// 32/8 - 1
    assign O_mem_arsize = mmio_process ? 3'b010 : 3'b011;// 8B
    assign O_mem_arburst = mmio_process ? 2'b00 : 2'b01;
    // cache addr/en logic
    assign O_sram_addr = rd_hit ? index : mem_index;// 64 depth ram index
    assign O_sram_cen = cen_icache;
    // tag & valid flag impl
    generate for(i=0;i<BLOCK_NUM;i=i+1) begin
        assign lookup_table_index[i] = (i == {mem_index, way1_replace}) ? 1 : 0;
        always @(posedge I_clk)
            if(I_rst) begin
                lookup_table[i] <= 0;
                valid_table[i] <= 0;
            end
            else if(I_cpu_fencei) begin
                lookup_table[i] <= 0;
                valid_table[i] <= 0;
            end
            // else if(rd_allocate) begin
            //     lookup_table[{mem_index, way1_replace}] <= mem_tag;
            //     valid_table[{mem_index, way1_replace}] <= 1;
            // end
            else if(rd_allocate && lookup_table_index[i]) begin
                lookup_table[i] <= mem_tag;
                valid_table[i] <= 1;
            end
            else begin
                lookup_table[i] <= lookup_table[i];
                valid_table[i] <= valid_table[i];
            end
        end
    endgenerate
    // cen impl: rd_hit impl cache rd, I_mem_rvalid impl cache reload
    always @(*)
        if(rd_hit)// rd_hit case, cacheline rd
            case({way0_hit, way1_hit})
                2'b10: cen_icache = 4'b1100; // way 0: sram 0-1
                2'b01: cen_icache = 4'b0011; // way 1: sram 2-3
                default: cen_icache = 4'b1111;// should not reach here!
            endcase
        else if(rd_allocate)// load cacheline case, cacheline wr
            case({way0_replace, way1_replace})
                2'b10: cen_icache = 4'b1100; // way 0: sram 0-1
                2'b01: cen_icache = 4'b0011; // way 1: sram 2-3
                default: cen_icache = 4'b1111;// should not reach here!
            endcase
        else
            cen_icache = 4'b1111;
    // icache rd hit/miss logic
    // assign {tag, index, offset} = I_cpu_addr;
    assign {tag, index} = I_cpu_addr[31:OFFT_LEN];
    assign {mem_tag, mem_index, mem_offset} = mem_addr;
    assign way0_tag = lookup_table[{index,1'b0}];
    assign way1_tag = lookup_table[{index,1'b1}];
    assign way0_valid = valid_table[{index,1'b0}];
    assign way1_valid = valid_table[{index,1'b1}];
    assign way0_hit = (tag == way0_tag) && way0_valid && pc_handshake;
    assign way1_hit = (tag == way1_tag) && way1_valid && pc_handshake;
    assign rd_hit = way0_hit || way1_hit;
    assign rd_miss = pc_handshake && ~rd_hit;
    // rd miss signal
    assign mem_ar_req = (current_state == RD_MISS) || (current_state == MMIO_AR);
    assign O_mem_arvalid = mem_ar_req ? 1 : 0;
    assign rd_handshake = I_mem_arready && O_mem_arvalid;
    assign pc_handshake = I_cpu_rd_req && O_cpu_rd_ready;
    // assign O_mem_araddr = {mem_addr[31:OFFT_LEN],{OFFT_LEN{1'b0}}};
    assign O_mem_araddr = mem_ar_req ? {mem_addr[31:OFFT_LEN],{{OFFT_LEN{mmio_process}} & mem_offset}} : 0;
    // latch mem addr
    always @(posedge I_clk)
        if(I_rst)
            mem_addr <= 0;
        else if(pc_handshake)
            mem_addr <= I_cpu_addr;
        else
            mem_addr <= mem_addr;
    // rd reload signal
    assign rd_reload = (current_state == RD_RELOAD);
    always @(posedge I_clk)
        if(I_rst)
            cacheline_reg <= 0;
        //else if(rd_hit)
        //    cacheline_reg <= way0_hit ? I_way0_rdata : I_way1_rdata;
        else if(rd_reload && I_mem_rvalid)
            cacheline_reg <= {I_mem_rdata, cacheline_reg[255 -: 192]};
        else
            cacheline_reg <= cacheline_reg;
    // rd allocate signal
    assign rd_allocate = (current_state == RD_ALLOCATE) ? 1 : 0;
    assign mmio_rvalid = (current_state == MMIO_RD) && I_mem_rvalid;
    assign O_cpu_rvalid = (current_state == RD_HIT) || rd_allocate || mmio_rvalid;
    always @(posedge I_clk)
        if(I_rst)
            hit_flag <= 2'b00;
        else if(rd_hit)
            hit_flag <= way0_hit ? 2'b01 : 2'b10;
        else
            hit_flag <= 2'b00;
    //assign hit_rdata = way0_hit ? I_way0_rdata : I_way1_rdata;
    assign hit_rdata = (I_way0_rdata & {256{hit_flag[0]}}) | (I_way1_rdata & {256{hit_flag[1]}});
    assign mem_rdata = (current_state == RD_HIT) ? hit_rdata : cacheline_reg;
    assign cache_inst = mem_rdata[{mem_offset[OFFT_LEN-1:2],2'b0,3'b0} +: 32];
    assign mmio_inst = I_mem_rdata[31:0];
    assign O_cpu_inst = mmio_process ? mmio_inst : cache_inst;
    // assign O_cpu_inst = mem_rdata[{mem_offset[OFFT_LEN-1:2],2'b0,3'b0} +: 32];
    //assign O_cpu_inst = cacheline_reg[{mem_offset[OFFT_LEN-1:2],2'b0,3'b0} +: 32];
    assign O_sram_wen = rd_allocate ? 4'b0 : 4'hf;
    assign O_sram_wmask = rd_allocate ? 0 : {256{1'b1}};
    assign O_sram_wdata = cacheline_reg;
    assign way0_replace = rd_allocate && ~way1_replace;
    assign way1_replace = rd_allocate && (valid_table[{mem_index,1'b0}]) && ~(valid_table[{mem_index,1'b1}]);
    // FSM impl
    // IDLE: wait for valid sig, if rd_en, check tag & valid
    // RD_HIT: return rdata & valid flag
    // RD_MISS: rd mem req
    // RD_RELOAD: get axi rdata
    // RD_ALLOCATE: reload cacheline & send data to cpu
    assign mmio_flag = !I_cpu_addr[31] && I_cpu_rd_req;
    always @(posedge I_clk)
        if(I_rst)
            mmio_process <= 0;
        else if(mmio_flag)
            mmio_process <= 1;
        else if(I_mem_rlast)
            mmio_process <= 0;

    assign O_cpu_rd_ready = (current_state == IDLE) || (current_state == RD_HIT);
    always @(posedge I_clk)
        if(I_rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    always @(*) begin
        next_state = IDLE;
        case(current_state)
            IDLE, RD_HIT: begin
                if(fencei_flag)
                    next_state = FENCEI;
                else if(mmio_flag)
                    next_state = MMIO_AR;
                else if(rd_hit)
                    next_state = RD_HIT;
                else if(rd_miss)
                    next_state = RD_MISS;
                else
                    next_state = IDLE;
            end
            RD_MISS: next_state = rd_handshake ? RD_RELOAD : current_state;
            RD_RELOAD: next_state = I_mem_rlast ? RD_ALLOCATE : current_state;
            RD_ALLOCATE: next_state = IDLE;
            MMIO_AR: next_state = rd_handshake ? MMIO_RD : current_state;
            MMIO_RD: next_state = I_mem_rlast ? IDLE : current_state;
            FENCEI: next_state = I_dcache_clean ? IDLE : current_state;
            default: next_state = IDLE;
        endcase
    end
endmodule
module ysyx_040750_ID_EX_reg(
    input I_sys_clk,
    input I_rst,
    input I_ID_EX_valid,// mem data valid
    input I_ID_EX_allowout,// receive EX_MEM input en
    output O_ID_EX_allowin,// send ID_EX input en
    output O_ID_EX_valid,
    input I_alu_output_valid,
    input [63:0] I_imm,
    input [63:0] I_rs1,
    input [63:0] I_rs2,
    input [4:0] I_rd_addr,
    input I_reg_wen,
    input I_mem_wen,
    input [7:0] I_wstrb,
    input [8:0] I_rstrb,
    //input [3:0] I_dnpc_sel,
    input [1:0] I_regin_sel,
    input [2:0] I_op1_sel,
    input [2:0] I_op2_sel,
    input [1:0] I_alu_sext,
    input [14:0] I_alu_op_sel,
    input I_word_op_mask,
	input [5:0] I_csr_op_sel,
	input [4:0] I_csr_imm,
	input [11:0] I_csr_addr,
	input I_csr_wen,
	input I_csr_intr,
	// input I_csr_mtip,
	input [63:0] I_csr_intr_no,
	input [63:0] I_csr,
	input I_csr_mret,
	input I_fencei,
    //input I_ID_EX_block,
	output reg [5:0] O_csr_op_sel,
	output reg [4:0] O_csr_imm,
	output reg [11:0] O_csr_addr,
	output reg O_csr_wen,
	output reg O_csr_intr,
	// output reg O_csr_mtip,
	output reg [63:0] O_csr_intr_no,
	output reg [63:0] O_csr,
	output reg O_csr_mret,

    output reg [63:0] O_imm,
    output reg [63:0] O_rs1,
    output reg [63:0] O_rs2,
    output reg [4:0] O_rd_addr,
    output reg O_reg_wen,
    output reg O_mem_wen,
    output reg [7:0] O_wstrb,
    output reg [8:0] O_rstrb,
    //output reg [3:0] O_dnpc_sel,
    output reg [1:0] O_regin_sel,
    output reg [2:0] O_op1_sel,
    output reg [2:0] O_op2_sel,
    output reg [1:0] O_alu_sext,
    output reg [14:0] O_alu_op_sel,
    output reg O_word_op_mask,
	output reg O_fencei,
    input [31:0] I_pc,
    output reg [31:0] O_pc,
    output O_ID_EX_input_valid,
    output reg O_alu_multicycle
    // input [31:0] I_inst_debug,
    // output reg [31:0] O_inst_debug,
    // input I_bubble_inst_debug,
    // output reg O_bubble_inst_debug
    );
    reg input_valid;
    wire output_valid;
    assign O_ID_EX_input_valid = input_valid;
    assign output_valid = I_alu_output_valid;// single cycle alu, for multicycle case, use alu_valid signal
    assign O_ID_EX_allowin = !input_valid || (output_valid && I_ID_EX_allowout);
    assign O_ID_EX_valid = input_valid && output_valid;
    always @(posedge I_sys_clk)
    	if(I_rst)
    		O_alu_multicycle <= 0;
    	else if(I_ID_EX_valid && O_ID_EX_allowin && (|I_alu_op_sel[13:10]))
    		O_alu_multicycle <= 1;
    	else
    		O_alu_multicycle <= 0;
    always @(posedge I_sys_clk)
    	if(I_rst)
    	    input_valid <= 0;
		else if(O_ID_EX_allowin)
			input_valid <= I_ID_EX_valid;
		else
			input_valid <= input_valid;
    always @(posedge I_sys_clk)
		if(I_rst) begin
			O_imm <= 0;
			O_rs1 <= 0;
			O_rs2 <= 0;
			O_rd_addr <= 0;
			O_reg_wen <= 0;
			O_mem_wen <= 0;
			O_wstrb <= 0;
			O_rstrb <= 0;
			O_regin_sel <= 0;
			O_op1_sel <= 0;
			O_op2_sel <= 0;
			O_alu_sext <= 0;
			O_alu_op_sel <= 0;
			O_word_op_mask <= 0;
			O_pc <= 0;
			// O_inst_debug <= 0;
			// O_bubble_inst_debug <= 0;
			O_csr <= 0;
			O_csr_op_sel <= 0;
			O_csr_imm <= 0;
			O_csr_addr <= 0;
			O_csr_wen <= 0;
			O_csr_intr <= 0;
			// O_csr_mtip <= 0;
			O_csr_intr_no <= 0;
			O_csr_mret <= 0;
			O_fencei <= 0;
		end
    	else if(I_ID_EX_valid && O_ID_EX_allowin) begin
			O_imm <= I_imm;
			O_rs1 <= I_rs1;
			O_rs2 <= I_rs2;
			O_rd_addr <= I_rd_addr;
			O_reg_wen <= I_reg_wen;
			O_mem_wen <= I_mem_wen;
			O_wstrb <= I_wstrb;
			O_rstrb <= I_rstrb;
			O_regin_sel <= I_regin_sel;
			O_op1_sel <= I_op1_sel;
			O_op2_sel <= I_op2_sel;
			O_alu_sext <= I_alu_sext;
			O_alu_op_sel <= I_alu_op_sel;
			O_word_op_mask <= I_word_op_mask;
			O_pc <= I_pc;
			// O_inst_debug <= I_inst_debug;
			// O_bubble_inst_debug <= I_bubble_inst_debug;
			O_csr <= I_csr;
			O_csr_op_sel <= I_csr_op_sel;
			O_csr_imm <= I_csr_imm;
			O_csr_addr <= I_csr_addr;
			O_csr_wen <= I_csr_wen;
			O_csr_intr <= I_csr_intr;
			// O_csr_mtip <= I_csr_mtip;
			O_csr_intr_no <= I_csr_intr_no;
			O_csr_mret <= I_csr_mret;
			O_fencei <= I_fencei;
		end
		else begin
			O_imm <= O_imm;
			O_rs1 <= O_rs1;
			O_rs2 <= O_rs2;
			O_rd_addr <= O_rd_addr;
			O_reg_wen <= O_reg_wen;
			O_mem_wen <= O_mem_wen;
			O_wstrb <= O_wstrb;
			O_rstrb <= O_rstrb;
			O_regin_sel <= O_regin_sel;
			O_op1_sel <= O_op1_sel;
			O_op2_sel <= O_op2_sel;
			O_alu_sext <= O_alu_sext;
			O_alu_op_sel <= O_alu_op_sel;
			O_word_op_mask <= O_word_op_mask;
			O_pc <= O_pc;
			// O_inst_debug <= O_inst_debug;
			// O_bubble_inst_debug <= O_bubble_inst_debug;
			O_csr <= O_csr;
			O_csr_op_sel <= O_csr_op_sel;
			O_csr_imm <= O_csr_imm;
			O_csr_addr <= O_csr_addr;
			O_csr_wen <= O_csr_wen;
			O_csr_intr <= O_csr_intr;
			// O_csr_mtip <= O_csr_mtip;
			O_csr_intr_no <= O_csr_intr_no;
			O_csr_mret <= O_csr_mret;
			O_fencei <= O_fencei;
		end
endmodule

module ysyx_040750_IF_ID_reg(
    input I_sys_clk,
    input I_rst,
    input [31:0] I_pc,
    input [31:0] I_inst,
    input I_timer_intr,// sys time intr
    input I_ID_timer_intr,// ID true timer intr
    input I_IF_ID_valid,// mem data valid
    input I_IF_ID_allowout,// receive ID_EX input en
    input I_IF_ID_stall,
    input I_IF_ID_jmp,
    output O_IF_ID_allowin,// send IF_ID input en
    output reg [31:0] O_pc,
    output reg [31:0] O_inst,
    output reg O_timer_intr,
    output reg O_IF_ID_bubble_inst,
    output O_IF_ID_input_valid,// data in IF_ID valid
    output O_IF_ID_valid// corresponding to pip1_to_pip2_valid
    );
    // storage PC for PC related calculation
    reg input_valid;// input data valid
    wire output_valid;// output data valid
    reg ID_tip_reg;
    assign output_valid = ~I_IF_ID_stall;// one cycle decoder
    assign O_IF_ID_input_valid = input_valid;
    assign O_IF_ID_allowin = !input_valid || (output_valid && I_IF_ID_allowout);// no valid input data or output data trans enable
    assign O_IF_ID_valid = input_valid && output_valid;
    always @(posedge I_sys_clk)
        if(I_rst)
            ID_tip_reg <= 0;
        else if(I_ID_timer_intr && ~(I_IF_ID_valid && O_IF_ID_allowin))
            ID_tip_reg <= 1;
        else if(I_IF_ID_valid && O_IF_ID_allowin)
            ID_tip_reg <= 0;
        else
            ID_tip_reg <= ID_tip_reg;
    always @(posedge I_sys_clk)
    	if(I_rst)
    	    input_valid <= 0;
    	else if(O_IF_ID_allowin)
    	    input_valid <= I_IF_ID_valid;
    	else
    	    input_valid <= input_valid;
    always @(posedge I_sys_clk)
        if(I_rst)
            {O_pc, O_inst} <= {32'h0, 32'h0};
            // if inst jump, induce a bubble
        else if(I_IF_ID_valid && O_IF_ID_allowin)
            {O_pc, O_inst} <= (I_IF_ID_jmp | I_ID_timer_intr | ID_tip_reg) ? {I_pc, 32'h00000013} : {I_pc, I_inst};
        else
            {O_pc, O_inst} <= {O_pc, O_inst};
    always @(posedge I_sys_clk)
        if(I_rst)
            O_timer_intr <= 0;
        else if(I_IF_ID_valid && O_IF_ID_allowin)// avoid latch bubble inst
            O_timer_intr <= ~I_IF_ID_jmp & I_timer_intr;
        else
            O_timer_intr <= O_timer_intr;
    always @(posedge I_sys_clk)
        if(I_rst)
            O_IF_ID_bubble_inst <= 0;
        else if(I_IF_ID_valid && O_IF_ID_allowin)
            O_IF_ID_bubble_inst <= I_IF_ID_jmp;
        else
            O_IF_ID_bubble_inst <= O_IF_ID_bubble_inst;
endmodule
module ysyx_040750_MEM_WB_reg(
    input I_sys_clk,
    input I_rst,
    input I_MEM_WB_valid,
    output reg O_MEM_WB_allowin,
    output O_MEM_WB_valid,
    input [31:0] I_pc,
    input [63:0] I_mem_data,
    input [8:0] I_mem_rstrb,
    input [2:0] I_mem_shamt,
    input [63:0] I_alu_out,
    input I_reg_wen,
    input [4:0] I_rd_addr,
    input [1:0] I_regin_sel,
	//input [6:0] I_csr_op_sel,
	//input [4:0] I_csr_imm,
	input [11:0] I_csr_addr,
	input I_csr_wen,
	input I_csr_intr,
	// input I_csr_mtip,
	input [63:0] I_csr_intr_no,
	input I_csr_mret,
	input [63:0] I_csr,

	// output reg [6:0] O_csr_op_sel,
	// output reg [4:0] O_csr_imm,
	output reg [11:0] O_csr_addr,
	output reg O_csr_wen,
	output reg O_csr_intr,
	// output reg O_csr_mtip,
	output reg [63:0] O_csr_intr_no,
	output reg O_csr_mret,
	output reg [63:0] O_csr,

    output reg [31:0] O_pc,
    output reg [63:0] O_mem_data,
    output reg [8:0] O_mem_rstrb,
    output reg [2:0] O_mem_shamt,
    output reg [63:0] O_alu_out,
    output reg O_reg_wen,
    output reg [4:0] O_rd_addr,
    output reg [1:0] O_regin_sel,
    output O_MEM_WB_input_valid
    // input [31:0] I_inst_debug,
    // output reg [31:0] O_inst_debug,
    // input I_bubble_inst_debug,
    // output reg O_bubble_inst_debug,
    // input I_mem_op_debug,
    // output reg O_mem_op_debug,
    // input [31:0] I_mem_addr_debug,
    // output reg [31:0] O_mem_addr_debug
    );
    // valid case: mem rd or non-mem rd
    // the second case contains reg wb or nop op
    // regin_sel[1] indicates data from mem
    reg input_valid;
    wire output_valid;
    assign O_MEM_WB_input_valid = input_valid;
    assign output_valid = input_valid;
    assign O_MEM_WB_valid = output_valid;
    assign O_MEM_WB_allowin = !input_valid || output_valid;// MEM_WB_allowout is always 1
    always @(posedge I_sys_clk)
    	if(I_rst)
    	    input_valid <= 0;
    	else if(O_MEM_WB_allowin)
    	    //input_valid <= I_MEM_WB_valid;
    	    input_valid <= I_MEM_WB_valid;
    	else
    	    input_valid <= input_valid;
    always @(posedge I_sys_clk)
        if(I_rst) begin
			O_pc <= 0;
			O_mem_data <= 0;
			O_mem_rstrb <= 0;
			O_mem_shamt <= 0;
			O_alu_out <= 0;
			O_reg_wen <= 0;
			O_rd_addr <= 0;
			O_regin_sel <= 0;
			// O_inst_debug <= 0;
			// O_bubble_inst_debug <= 0;
			O_csr_addr <= 0;
			O_csr_wen <= 0;
			O_csr_intr <= 0;
			// O_csr_mtip <= 0;
			O_csr_intr_no <= 0;
			O_csr_mret <= 0;
			O_csr <= 0;
			// O_mem_op_debug <= 0;
			// O_mem_addr_debug <= 0;
			
		end
		else if(O_MEM_WB_allowin && I_MEM_WB_valid) begin
			O_pc <= I_pc;
			O_mem_data <= I_mem_data;
			O_mem_rstrb <= I_mem_rstrb;
			O_mem_shamt <= I_mem_shamt;
			O_alu_out <= I_alu_out;
			O_reg_wen <= I_reg_wen;
			O_rd_addr <= I_rd_addr;
			O_regin_sel <= I_regin_sel;
			// O_inst_debug <= I_inst_debug;
			// O_bubble_inst_debug <= I_bubble_inst_debug;
			O_csr_addr <= I_csr_addr;
			O_csr_wen <= I_csr_wen;
			O_csr_intr <= I_csr_intr;
			// O_csr_mtip <= I_csr_mtip;
			O_csr_intr_no <= I_csr_intr_no;
			O_csr_mret <= I_csr_mret;
			O_csr <= I_csr;
			// O_mem_op_debug <= I_mem_op_debug;
			// O_mem_addr_debug <= I_mem_addr_debug;
		end
		else begin
			O_pc <= O_pc;
			O_mem_data <= O_mem_data;
			O_mem_rstrb <= O_mem_rstrb;
			O_mem_shamt <= O_mem_shamt;
			O_alu_out <= O_alu_out;
			O_reg_wen <= O_reg_wen;
			O_rd_addr <= O_rd_addr;
			O_regin_sel <= O_regin_sel;
			// O_inst_debug <= O_inst_debug;
			// O_bubble_inst_debug <= O_bubble_inst_debug;
			O_csr_addr <= O_csr_addr;
			O_csr_wen <= O_csr_wen;
			O_csr_intr <= O_csr_intr;
			// O_csr_mtip <= O_csr_mtip;
			O_csr_intr_no <= O_csr_intr_no;
			O_csr_mret <= O_csr_mret;
			O_csr <= O_csr;
			// O_mem_op_debug <= O_mem_op_debug;
			// O_mem_addr_debug <= O_mem_addr_debug;
		end
endmodule
module ysyx_040750_mux_Nbit_Msel#(
    parameter N = 64,
    parameter M = 4
    )(
    input [N*M-1:0] I_sel_data,
    input [M-1:0] I_sel,
    output reg [N-1:0] O_sel_data
    );
    // parameter N: in data bitwidth
    // parameter M: in data num(one_hot encoding)
    wire [N-1:0] sel_data [M-1:0];
    generate
    	for(genvar i = 0;i<M;i=i+1) begin
    	    assign sel_data[i] = I_sel_data[i*N +: N];  
    	end
    endgenerate
    always @(*) begin
    	O_sel_data = 0;
    	for (integer i=0;i<M;i=i+1) begin
    	    O_sel_data = O_sel_data | ({N{I_sel[i]}} & sel_data[i]);
    	end
    end
    //generate for(genvar i = 0;i<N;i=i+1) begin
    //    for(genvar j = 0;j<M;j=j+1) begin
    //        assign O_sel_data[i] = |(I_sel[j] & I_sel_data[N*j+i]);
    //    end
    //end
    //endgenerate
    
endmodule
module ysyx_040750_npc(
    input I_clk,
    input I_rst,
    input I_pc_valid,// dnpc valid
    input I_pc_ready,// dnpc ready
    input I_IF_ID_valid,// valid but not stored jmp dnpc
    input [31:0] I_rs1_data,
    // input [31:0] I_rs2_data,
    input [31:0] I_imm,
    input [31:0] I_intr_pc,
    input [31:0] I_pc,// IF_ID_pc actually, use for jmps cal
    input [31:0] I_snpc,// snpc
    input [3:0] I_dnpc_sel,
    output [31:0] O_dnpc
    );
    // I_dnpc_sel[3]: fence.i
    // I_dnpc_sel[2]: csr
    // I_dnpc_sel[1]: jalr
    // I_dnpc_sel[0]: snpc
    // fence.i & jal & typeB_jr addr cal here

    wire pc_handshake;
    wire [31:0] dnpc_src1,dnpc_src2, dnpc_sum, dnpc;
    reg [31:0] dnpc_reg;
    reg dnpc_reg_valid;
    wire dnpc_sel, intr_sel;
    wire store_dnpc;// indicate latch useful data
    assign dnpc_sel = ~(I_dnpc_sel[0] | I_dnpc_sel[2]);
    assign intr_sel = I_dnpc_sel[2];
    // assign dnpc_src1 = I_imm;
    assign dnpc_src1 = I_dnpc_sel[3] ? 4 : I_imm;// sel dnpc op1
    assign dnpc_src2 = I_dnpc_sel[1] ? I_rs1_data : I_pc;
    assign dnpc_sum = dnpc_src1 + dnpc_src2;
    assign pc_handshake = I_pc_ready && I_pc_valid;
    assign store_dnpc = (I_pc_valid && !I_pc_ready && !dnpc_reg_valid) || (I_IF_ID_valid && !pc_handshake && dnpc_sel) || (I_IF_ID_valid && (dnpc_sel | intr_sel) && (dnpc != O_dnpc));
    //assign store_dnpc = (I_pc_valid && !I_pc_ready && !dnpc_reg_valid) || (I_IF_ID_valid && dnpc_sel && (dnpc != O_dnpc));
    // case 2: dnpc is generated, but next reg wb flush valid dnpc
    //assign store_dnpc = (I_pc_valid && !I_pc_ready && !dnpc_reg_valid) || (I_IF_ID_valid && dnpc_sel && !I_pc_valid && !dnpc_reg_valid);
    //assign store_dnpc = (I_IF_ID_valid && (!I_pc_valid || !I_pc_ready)) || (dnpc_reg_valid && I_IF_ID_valid);
    ysyx_040750_mux_Nbit_Msel #(32, 3)
    nextpc_64bit_3sel (
	.I_sel_data({I_intr_pc,dnpc_sum,I_snpc}),
	.I_sel({intr_sel,dnpc_sel,I_dnpc_sel[0]}),
	.O_sel_data(dnpc)
    );
    always @(posedge I_clk)
        if(I_rst)
            dnpc_reg <= 0;
        else if(store_dnpc)
            dnpc_reg <= dnpc;
        else
            dnpc_reg <= dnpc_reg;
    always @(posedge I_clk)
        if(I_rst)
            dnpc_reg_valid <= 0;
        else if(store_dnpc)
            dnpc_reg_valid <= 1;
        else if(pc_handshake)
            dnpc_reg_valid <= 0;
        else
            dnpc_reg_valid <= dnpc_reg_valid;
    assign O_dnpc = dnpc_reg_valid ? dnpc_reg : {dnpc[31:1], dnpc[0]&(~I_dnpc_sel[1])};
    //assign dnpc = I_dnpc_sel[3] ? dnpc_sum : {dnpc_sum[63:1], 1'b0};
endmodule
module ysyx_040750_pc(
    input I_sys_clk,
    input I_rst,
    input [31:0] I_dnpc,
    input [31:0] I_inst,
    input I_inst_valid,
    input I_inst_ready,
    input I_IF_ID_allowin,// allow next inst rd
    input I_fencei,
    output O_IF_valid,
    output reg [31:0] O_pc,
    output [31:0] O_inst,
    output O_pc_valid
    );
    // import "DPI-C" function void set_pc_ptr(input logic [31:0] a []);
    // initial set_pc_ptr(O_pc);
    localparam PC_RESET = 32'h2FFFFFFC;
    wire IF_ready_go;
    wire IF_allow_in;
    wire IF_handshake;
    reg IF_valid;
    reg IF_en;
    //reg [63:0] pc_cache;
    reg [31:0] inst_cache;
    reg cache_valid;
    // latch data cannot be received by IF_ID
    always @(posedge I_sys_clk)
    	if(I_rst)
    		cache_valid <= 0;
    	else if(IF_ready_go && (!I_IF_ID_allowin))
    		cache_valid <= 1;
    	else if(cache_valid && I_IF_ID_allowin)
    		cache_valid <= 0;
    	else
    		cache_valid <= cache_valid;
    always @(posedge I_sys_clk)
    	if(I_rst)
    		inst_cache <= 32'b0;
    	//else if(IF_ready_go && (!I_IF_ID_allowin))
      else if(I_inst_valid && (!I_IF_ID_allowin))
    		inst_cache <= I_inst;
    	else
    		inst_cache <= inst_cache;
    assign O_pc_valid = IF_allow_in && IF_en;
    assign O_IF_valid = IF_ready_go && IF_valid;
    assign IF_ready_go = I_inst_valid || cache_valid;
    assign IF_allow_in = (!IF_valid) || (IF_ready_go && I_IF_ID_allowin);
    assign IF_handshake = O_pc_valid && I_inst_ready && ~I_fencei;
    assign O_inst = cache_valid ? inst_cache : I_inst;
    always @(posedge I_sys_clk)
    	if(I_rst)
    		IF_en <= 0;
    	else
    		IF_en <= 1;
    // inst is fetched by I_dnpc, so take I_dnpc when fetch an inst
    always @(posedge I_sys_clk)
    	if(I_rst)
    		O_pc <= PC_RESET;
    	else if(IF_handshake)
    		O_pc <= I_dnpc;
    	else
    		O_pc <= O_pc;
    // if valid data has gone && no valid ifetch, IF_valid <= 0;
    always @(posedge I_sys_clk)
    	if(I_rst)
    		IF_valid <= 0;
    	else if(IF_handshake)
    		IF_valid <= 1;
    	else if(O_IF_valid && I_IF_ID_allowin)
    		IF_valid <= 0;
    	else
    		IF_valid <= IF_valid;
endmodule
module ysyx_040750_radix2_div(
    input clk,
    input rst,
    // out = dividend / divisor
    input [63:0] dividend,
    input [63:0] divisor,
    input is_signed,
    input div_valid,
    output [63:0] quotient,
    output [63:0] remainder,
    output reg Q_valid
    );
    // dividend extention
    reg [127:0] abs_dividend;
    // divisor extention
    reg [127:0] abs_divisor;
    // current bit quotient
    wire [127:0] current_sub_result;
    wire current_q;
    // dividend & divisor sign flag, 1 indecate neg, 0 indicate pos
    wire dividend_flag, divisor_flag;
    // quotion & remainder sign flag, 1 indecate neg, 0 indicate pos
    wire q_flag, rem_flag;
    // abs_quotient
    reg [63:0] abs_quotient;
    // abs_remainder
//    reg [127:0] abs_remainder;
    // div process
    reg div_process;
    reg [5:0] iter_cnt;
    always @(posedge clk)
        if(rst)
            div_process <= 0;
        else if(div_valid)
            div_process <= 1;
        else if(Q_valid)
            div_process <= 0;
        else
            div_process <= div_process;
    always @(posedge clk)
        if(rst)
            iter_cnt <= 0;
        else if(div_process)
            iter_cnt <= iter_cnt + 1;
        else
            iter_cnt <= 0;
//    assign Q_valid = &iter_cnt;
    always @(posedge clk)
        if(rst)
            Q_valid <= 0;
        else
            Q_valid <= &iter_cnt ? 1 : 0;
    // dividend & divisor sign flag
    assign dividend_flag = dividend[63] & is_signed;
    assign divisor_flag = divisor[63] & is_signed;
    // quotient & reminder sign flag
    assign q_flag = dividend_flag ^ divisor_flag;
    assign rem_flag = dividend_flag;
    // get abs dividend & divisor
    always @(posedge clk)
        if(rst)
            abs_dividend <= 0;
        else if(div_valid)
            abs_dividend <= dividend_flag ? {64'b0,-dividend} : {64'b0,dividend};
        else
            abs_dividend <= current_q ? current_sub_result : abs_dividend;
    always @(posedge clk)
        if(rst)
            abs_divisor <= 0;
        else if(div_valid)
            abs_divisor <= divisor_flag ? {1'b0, -divisor, 63'b0} : {1'b0, divisor, 63'b0};
        else
            abs_divisor <= abs_divisor >> 1;
    assign current_sub_result = abs_dividend - abs_divisor;
    assign current_q = div_process ? ~current_sub_result[127] : 0;
    always @(posedge clk)
        if(rst)
            abs_quotient <= 0;
        else if(div_process)
            abs_quotient <= {abs_quotient[62:0],current_q};
        else
            abs_quotient <= 0;
//    always @(posedge clk)
//        if(rst)
//            abs_remainder <= 0;
//        else if(div_valid)
//            abs_remainder <= dividend_flag ? {64'b0,-dividend} : {64'b0,dividend};
//        else
//            abs_remainder <= current_q ? current_sub_result : abs_remainder;
    assign quotient = q_flag ? -abs_quotient : abs_quotient;
//    assign remainder = rem_flag ? -abs_remainder[63:0] : abs_remainder;
    assign remainder = rem_flag ? -abs_dividend[63:0] : abs_dividend[63:0];
endmodule
module ysyx_040750_radix4_unit(
    input [2:0] booth,
    //input [64:0] X,
    input [131:0] X,
    output [131:0] P,
    output c
    //output reg [65:0] Y
    );

//////// ysyx version
    wire y_add,y,y_sub;
    wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;
    assign {y_add,y,y_sub} = booth;
    assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
    assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
    assign sel_double_negative =  y_add & ~y & ~y_sub;
    assign sel_double_positive = ~y_add &  y &  y_sub;
    assign P = ~(~({132{sel_negative}} & ~X) & ~({132{sel_double_negative}} & {~X[130:0],1'b1}) 
           & ~({132{sel_positive}} & X ) & ~({132{sel_double_positive}} & {X[130:0],1'b0}));
    assign c = sel_double_negative | sel_negative;
endmodule
module ysyx_040750_slave_crossbar(
    input I_clk,
    input I_rst,
    // interface with cache
    output [63:0] O_cache_rdata,
    output O_cache_rvalid,
    output O_cache_rlast,
    input I_cache_rready,
    input [31:0] I_cache_araddr,
    output O_cache_arready,
    input I_cache_arvalid,
    input [7:0] I_cache_arlen,
    input [2:0] I_cache_arsize,
    input [1:0] I_cache_arburst,
    input [63:0] I_cache_wdata,
    input I_cache_wvalid,
    output O_cache_wready,
    input I_cache_wlast,
    input [7:0] I_cache_wstrb,
    input [31:0] I_cache_awaddr,
    input I_cache_awvalid,
    output O_cache_awready,
    input [7:0] I_cache_awlen,
    input [2:0] I_cache_awsize,
    input [1:0] I_cache_awburst,
    output O_cache_bvalid,
    input I_cache_bready,
    // with axi bus
    input [63:0] I_bus_rdata,
    input I_bus_rvalid,
    input I_bus_rlast,
    output O_bus_rready,
    output [31:0] O_bus_araddr,
    input I_bus_arready,
    output O_bus_arvalid,
    output [7:0] O_bus_arlen,
    output [2:0] O_bus_arsize,
    output [1:0] O_bus_arburst,
    output [63:0] O_bus_wdata,
    output O_bus_wvalid,
    input I_bus_wready,
    output O_bus_wlast,
    output [7:0] O_bus_wstrb,
    output [31:0] O_bus_awaddr,
    output O_bus_awvalid,
    input I_bus_awready,
    output [7:0] O_bus_awlen,
    output [2:0] O_bus_awsize,
    output [1:0] O_bus_awburst,
    input I_bus_bvalid,
    output O_bus_bready,
    // with clint
    // AXI4-Lite interface
    // rlast for cache equal to rvalid
    input [63:0] I_clint_rdata,
    input I_clint_rvalid,
    // input I_clint_rlast,
    output O_clint_rready,
    output [31:0] O_clint_araddr,
    input I_clint_arready,
    output O_clint_arvalid,
    // output [7:0] O_clint_arlen,
    // output [2:0] O_clint_arsize,
    // output [1:0] O_clint_arburst,
    output [63:0] O_clint_wdata,
    output O_clint_wvalid,
    input I_clint_wready,
    // output O_clint_wlast,
    output [7:0] O_clint_wstrb,
    output [31:0] O_clint_awaddr,
    output O_clint_awvalid,
    input I_clint_awready,
    // output [7:0] O_clint_awlen,
    // output [2:0] O_clint_awsize,
    // output [1:0] O_clint_awburst,
    input I_clint_bvalid,
    output O_clint_bready
);
    parameter CLINT_START  = 'h02000000;
    parameter CLINT_END = 'h0200C000;
    wire clint_ar_flag, clint_aw_flag, bus_ar_flag, bus_aw_flag;
    wire clint_ar_handshake, clint_aw_handshake, bus_ar_handshake, bus_aw_handshake;
    // indicate last rd data handshake from bus
    // clint only return single data beats
    wire bus_rlasthandshake, clint_rlasthandshake;
    reg clint_rd_process, bus_rd_process;
    reg clint_wr_process, bus_wr_process;
    assign clint_ar_flag = (I_cache_araddr >= CLINT_START) && (I_cache_araddr < CLINT_END);
    assign clint_aw_flag = (I_cache_awaddr >= CLINT_START) && (I_cache_awaddr < CLINT_END);
    assign bus_ar_flag = ~clint_ar_flag;
    assign bus_aw_flag = ~clint_aw_flag;
    assign clint_ar_handshake = I_clint_arready && O_clint_arvalid;
    assign clint_aw_handshake = I_clint_awready && O_clint_awvalid;
    assign bus_ar_handshake = I_bus_arready && O_bus_arvalid;
    assign bus_aw_handshake = I_bus_awready && O_bus_awvalid;
    assign clint_rlasthandshake = I_clint_rvalid && O_clint_rready;
    assign bus_rlasthandshake = I_bus_rvalid && O_bus_rready && I_bus_rlast;
    always @(posedge I_clk)
        if(I_rst)
            clint_rd_process <= 0;
        else if(clint_ar_handshake)
            clint_rd_process <= 1;
        else if(clint_rlasthandshake)// bready is always 1
            clint_rd_process <= 0;
        else
            clint_rd_process <= clint_rd_process;
    always @(posedge I_clk)
        if(I_rst)
            bus_rd_process <= 0;
        else if(bus_ar_handshake)
            bus_rd_process <= 1;
        else if(bus_rlasthandshake)// bready is always 1
            bus_rd_process <= 0;
        else
            bus_rd_process <= bus_rd_process;
    always @(posedge I_clk)
        if(I_rst)
            clint_wr_process <= 0;
        else if(clint_aw_handshake)
            clint_wr_process <= 1;
        else if(I_clint_bvalid)// bready is always 1
            clint_wr_process <= 0;
        else
            clint_wr_process <= clint_wr_process;
    always @(posedge I_clk)
        if(I_rst)
            bus_wr_process <= 0;
        else if(bus_aw_handshake)
            bus_wr_process <= 1;
        else if(I_bus_bvalid)// bready is always 1
            bus_wr_process <= 0;
        else
            bus_wr_process <= bus_wr_process;
    // always @(posedge I_clk)
    //     if(I_rst)
    //         clint_process <= 0;
    //     else if(clint_ar_handshake | clint_aw_handshake)
    //         clint_process <= 1;
    //     else if(clint_rlasthandshake | I_clint_bvalid)// bready is always 1
    //         clint_process <= 0;
    //     else
    //         clint_process <= clint_process;
    // always @(posedge I_clk)
    //     if(I_rst)
    //         bus_process <= 0;
    //     else if(bus_ar_handshake | bus_aw_handshake)
    //         bus_process <= 1;
    //     else if(bus_rlasthandshake | I_bus_bvalid)// bready is always 1
    //         bus_process <= 0;
    //     else
    //         bus_process <= bus_process;
    // signal boardcast, clint don't have last signal
    // ar process, notice flag here is combinational logic
    assign O_bus_araddr = bus_ar_flag ? I_cache_araddr : 0;
    assign O_bus_arburst = bus_ar_flag ? I_cache_arburst : 0;
    assign O_bus_arlen = bus_ar_flag ? I_cache_arlen : 0;
    assign O_bus_arsize = bus_ar_flag ? I_cache_arsize : 0;
    assign O_bus_arvalid = bus_ar_flag & I_cache_arvalid;
    assign O_clint_araddr = clint_ar_flag ? I_cache_araddr : 0;
    assign O_clint_arvalid = clint_ar_flag & I_cache_arvalid;
    assign O_cache_arready = clint_ar_flag ? I_clint_arready : I_bus_arready;
    // r process
    assign O_bus_rready = I_cache_rready & bus_rd_process;
    assign O_clint_rready = I_cache_rready & clint_rd_process;
    assign O_cache_rdata = ({64{clint_rd_process}} & I_clint_rdata) | ({64{bus_rd_process}} & I_bus_rdata);
    assign O_cache_rvalid = (clint_rd_process & I_clint_rvalid) | (bus_rd_process & I_bus_rvalid);
    assign O_cache_rlast = (clint_rd_process & I_clint_rvalid) | (bus_rd_process & I_bus_rlast);
    // aw process
    assign O_bus_awaddr = bus_aw_flag ? I_cache_awaddr : 0;
    assign O_bus_awburst = bus_aw_flag ? I_cache_awburst : 0;
    assign O_bus_awlen = bus_aw_flag ? I_cache_awlen : 0;
    assign O_bus_awsize = bus_aw_flag ? I_cache_awsize : 0;
    assign O_bus_awvalid = bus_aw_flag & I_cache_awvalid;
    assign O_clint_awaddr = clint_aw_flag ? I_cache_awaddr : 0;
    assign O_clint_awvalid = clint_aw_flag & I_cache_awvalid;
    assign O_cache_awready = clint_aw_flag ? I_clint_awready : I_bus_awready;
    // w process
    assign O_bus_wdata = bus_wr_process ? I_cache_wdata : 0;
    assign O_bus_wstrb = bus_wr_process ? I_cache_wstrb : 0;
    assign O_bus_wvalid = bus_wr_process & I_cache_wvalid;
    assign O_bus_wlast = bus_wr_process & I_cache_wlast;
    assign O_clint_wdata = clint_wr_process ? I_cache_wdata : 0;
    assign O_clint_wstrb = clint_wr_process ? I_cache_wstrb : 0;
    assign O_clint_wvalid = clint_wr_process & I_cache_wvalid;
    assign O_cache_wready = (clint_wr_process & I_clint_wready) | (bus_wr_process & I_bus_wready);
    // b process
    assign O_bus_bready = bus_wr_process & I_cache_bready;
    assign O_clint_bready = clint_wr_process & I_cache_bready;
    assign O_cache_bvalid = (clint_wr_process & I_clint_bvalid) | (bus_wr_process & I_bus_bvalid);
endmodule
module ysyx_040750_stall_unit(
    input [4:0] I_rs1_addr,// from ID only
    input [4:0] I_rs2_addr,// from ID only
    input I_ID_valid,// IF_ID input valid
    input [4:0] I_EX_rd_addr,// 
    input I_EX_valid,// ID_EX input valid
    input I_EX_mem_rd_en,
    input I_EX_alu_multcycle,
    input [4:0] I_MEM_rd_addr,// 
    input I_MEM_valid,// EX_MEM input valid
    input I_MEM_mem_rd_en,
    input [4:0] I_WB_rd_addr,// 
    input I_WB_valid,// MEM_WB input valid
    input [1:0] I_stall_en,// [1] for rs1, [0] for rs2 enable
    output O_ID_stall,
    // ecall & mret stall case
    // ecall & mret must finish csr change before next ID
    input I_EX_intr,
    input I_MEM_intr,
    input I_WB_intr,
    // stall signal
    /*output O_EX_stall,
    output O_MEM_stall,
    output O_WB_stall*/
    // forward signal
    output [1:0] O_EX_stall,
    output [1:0] O_MEM_stall,
    output [1:0] O_WB_stall
    );
    
    // pipeline stall code
    /*
    wire EX_stall, MEM_stall, WB_stall;
    assign O_ID_stall = (O_WB_stall | O_MEM_stall | O_EX_stall) & I_ID_valid;
    assign EX_stall = ((I_rs1_addr == I_EX_rd_addr) & I_stall_en[1]) | ((I_rs2_addr == I_EX_rd_addr) & I_stall_en[0]);
    assign MEM_stall = ((I_rs1_addr == I_MEM_rd_addr) & I_stall_en[1]) | ((I_rs2_addr == I_MEM_rd_addr) & I_stall_en[0]);
    assign WB_stall = ((I_rs1_addr == I_WB_rd_addr) & I_stall_en[1]) | ((I_rs2_addr == I_WB_rd_addr) & I_stall_en[0]);
    assign O_WB_stall = I_WB_valid ? WB_stall : 0;
    assign O_MEM_stall = I_MEM_valid ? MEM_stall : 0;
    assign O_EX_stall = I_EX_valid? EX_stall : 0;
    */
    // forward code
    wire [1:0] EX_stall, MEM_stall, WB_stall;
    // stall cause
    wire mem_rd, multicycle_alu_op, intr_op;
    assign intr_op = (I_EX_intr & I_EX_valid) | (I_MEM_intr & I_MEM_valid) | (I_WB_intr & I_WB_valid);
    assign mem_rd = (|O_EX_stall & I_EX_mem_rd_en) | (|O_MEM_stall & I_MEM_mem_rd_en);
    assign multicycle_alu_op = |O_EX_stall & I_EX_alu_multcycle;
    assign O_ID_stall = I_ID_valid & (mem_rd | multicycle_alu_op | intr_op);
    assign EX_stall = {((I_rs1_addr == I_EX_rd_addr) & I_stall_en[1]), ((I_rs2_addr == I_EX_rd_addr) & I_stall_en[0])};
    assign MEM_stall = {((I_rs1_addr == I_MEM_rd_addr) & I_stall_en[1]), ((I_rs2_addr == I_MEM_rd_addr) & I_stall_en[0])};
    assign WB_stall = {((I_rs1_addr == I_WB_rd_addr) & I_stall_en[1]), ((I_rs2_addr == I_WB_rd_addr) & I_stall_en[0])};
    assign O_WB_stall = I_WB_valid ? WB_stall : 0;
    assign O_MEM_stall = I_MEM_valid ? MEM_stall : 0;
    assign O_EX_stall = I_EX_valid? EX_stall : 0;
endmodule
module ysyx_040750_timerintr(
    // input I_ID_intr,
    input I_EX_intr,// from ID_EX
    input I_MEM_intr,// from EX_MEM
    input I_WB_intr,// from MEM_WB
    // input I_ID_csr_wen,
    // input [11:0] I_ID_csr_addr,
    // input [63:0] I_ID_csr_data,
    input I_EX_csr_wen,
    input [11:0] I_EX_csr_addr,
    input [1:0] I_EX_csr_data,// {mie, mstatus_mie}
    input I_MEM_csr_wen,
    input [11:0] I_MEM_csr_addr,
    input [1:0] I_MEM_csr_data,
    input I_WB_csr_wen,
    input [11:0] I_WB_csr_addr,
    input [1:0] I_WB_csr_data,
    input I_csr_intr,
    output O_timer_intr
);
    // data in this module indicates wdata
    localparam MSTATUS = 12'h300;
    localparam MIE = 12'h304;
    wire csr_intr;
    wire EX_intr_disable, MEM_intr_disable, WB_intr_disable;
    wire EX_mstatus_mie, MEM_mstatus_mie, WB_mstatus_mie;
    wire EX_mie, MEM_mie, WB_mie;
    wire EX_wr_mie, MEM_wr_mie, WB_wr_mie;
    wire EX_wr_mstatus, MEM_wr_mstatus, WB_wr_mstatus;
    assign csr_intr = I_csr_intr & ~(I_EX_intr | I_MEM_intr | I_WB_intr);
    assign {EX_mstatus_mie, MEM_mstatus_mie, WB_mstatus_mie} = {I_EX_csr_data[0], I_MEM_csr_data[0], I_WB_csr_data[0]};
    assign {EX_mie, MEM_mie, WB_mie} = {I_EX_csr_data[1], I_MEM_csr_data[1], I_WB_csr_data[1]};
    assign EX_wr_mie = I_EX_csr_wen && (I_EX_csr_addr == MIE);
    assign EX_wr_mstatus = I_EX_csr_wen && (I_EX_csr_addr == MSTATUS);
    assign EX_intr_disable = (EX_wr_mie & ~EX_mie) | (EX_wr_mstatus & ~EX_mstatus_mie);
    assign MEM_wr_mie = I_MEM_csr_wen && (I_MEM_csr_addr == MIE);
    assign MEM_wr_mstatus = I_MEM_csr_wen && (I_MEM_csr_addr == MSTATUS);
    assign MEM_intr_disable = (MEM_wr_mie & ~MEM_mie) | (MEM_wr_mstatus & ~MEM_mstatus_mie);
    assign WB_wr_mie = I_WB_csr_wen && (I_WB_csr_addr == MIE);
    assign WB_wr_mstatus = I_WB_csr_wen && (I_WB_csr_addr == MSTATUS);
    assign WB_intr_disable = (WB_wr_mie & ~WB_mie) | (WB_wr_mstatus & ~WB_mstatus_mie);
    assign O_timer_intr = csr_intr & ~(EX_intr_disable | MEM_intr_disable | WB_intr_disable);
endmodule
module ysyx_040750(
    input clock,
    input reset,

    input io_interrupt,

    input io_master_awready,
    output io_master_awvalid,
    output [3:0] io_master_awid,
    output [31:0] io_master_awaddr,
    output [7:0] io_master_awlen,
    output [2:0] io_master_awsize,
    output [1:0] io_master_awburst,
    input io_master_wready,
    output io_master_wvalid,
    output [63:0] io_master_wdata,
    output [7:0] io_master_wstrb,
    output io_master_wlast,
    output io_master_bready,
    input io_master_bvalid,
    input [3:0] io_master_bid,
    input [1:0] io_master_bresp,
    input io_master_arready,
    output io_master_arvalid,
    output [3:0] io_master_arid,
    output [31:0] io_master_araddr,
    output [7:0] io_master_arlen,
    output [2:0] io_master_arsize,
    output [1:0] io_master_arburst,
    output io_master_rready,
    input io_master_rvalid,
    input [3:0] io_master_rid,
    input [1:0] io_master_rresp,
    input [63:0] io_master_rdata,
    input io_master_rlast,

    output io_slave_awready,
    input io_slave_awvalid,
    input [3:0] io_slave_awid,
    input [31:0] io_slave_awaddr,
    input [7:0] io_slave_awlen,
    input [2:0] io_slave_awsize,
    input [1:0] io_slave_awburst,
    output io_slave_wready,
    input io_slave_wvalid,
    input [63:0] io_slave_wdata,
    input [7:0] io_slave_wstrb,
    input io_slave_wlast,
    input io_slave_bready,
    output io_slave_bvalid,
    output [3:0] io_slave_bid,
    output [1:0] io_slave_bresp,
    output io_slave_arready,
    input io_slave_arvalid,
    input [3:0] io_slave_arid,
    input [31:0] io_slave_araddr,
    input [7:0] io_slave_arlen,
    input [2:0] io_slave_arsize,
    input [1:0] io_slave_arburst,
    input io_slave_rready,
    output io_slave_rvalid,
    output [3:0] io_slave_rid,
    output [1:0] io_slave_rresp,
    output [63:0] io_slave_rdata,
    output io_slave_rlast,

    output [5:0] io_sram0_addr,
    output io_sram0_cen,
    output io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input [127:0] io_sram0_rdata,
    output [5:0] io_sram1_addr,
    output io_sram1_cen,
    output io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input [127:0] io_sram1_rdata,
    output [5:0] io_sram2_addr,
    output io_sram2_cen,
    output io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input [127:0] io_sram2_rdata,
    output [5:0] io_sram3_addr,
    output io_sram3_cen,
    output io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input [127:0] io_sram3_rdata,
    output [5:0] io_sram4_addr,
    output io_sram4_cen,
    output io_sram4_wen,
    output [127:0] io_sram4_wmask,
    output [127:0] io_sram4_wdata,
    input [127:0] io_sram4_rdata,
    output [5:0] io_sram5_addr,
    output io_sram5_cen,
    output io_sram5_wen,
    output [127:0] io_sram5_wmask,
    output [127:0] io_sram5_wdata,
    input [127:0] io_sram5_rdata,
    output [5:0] io_sram6_addr,
    output io_sram6_cen,
    output io_sram6_wen,
    output [127:0] io_sram6_wmask,
    output [127:0] io_sram6_wdata,
    input [127:0] io_sram6_rdata,
    output [5:0] io_sram7_addr,
    output io_sram7_cen,
    output io_sram7_wen,
    output [127:0] io_sram7_wmask,
    output [127:0] io_sram7_wdata,
    input [127:0] io_sram7_rdata
);
    // test cache signal begin, delete it when test in SoC
    /*
    wire [5:0] io_sram0_addr;
    wire io_sram0_cen;
    wire io_sram0_wen;
    wire [127:0] io_sram0_wmask;
    wire [127:0] io_sram0_wdata;
    wire [127:0] io_sram0_rdata;
    wire [5:0] io_sram1_addr;
    wire io_sram1_cen;
    wire io_sram1_wen;
    wire [127:0] io_sram1_wmask;
    wire [127:0] io_sram1_wdata;
    wire [127:0] io_sram1_rdata;
    wire [5:0] io_sram2_addr;
    wire io_sram2_cen;
    wire io_sram2_wen;
    wire [127:0] io_sram2_wmask;
    wire [127:0] io_sram2_wdata;
    wire [127:0] io_sram2_rdata;
    wire [5:0] io_sram3_addr;
    wire io_sram3_cen;
    wire io_sram3_wen;
    wire [127:0] io_sram3_wmask;
    wire [127:0] io_sram3_wdata;
    wire [127:0] io_sram3_rdata;
    wire [5:0] io_sram4_addr;
    wire io_sram4_cen;
    wire io_sram4_wen;
    wire [127:0] io_sram4_wmask;
    wire [127:0] io_sram4_wdata;
    wire [127:0] io_sram4_rdata;
    wire [5:0] io_sram5_addr;
    wire io_sram5_cen;
    wire io_sram5_wen;
    wire [127:0] io_sram5_wmask;
    wire [127:0] io_sram5_wdata;
    wire [127:0] io_sram5_rdata;
    wire [5:0] io_sram6_addr;
    wire io_sram6_cen;
    wire io_sram6_wen;
    wire [127:0] io_sram6_wmask;
    wire [127:0] io_sram6_wdata;
    wire [127:0] io_sram6_rdata;
    wire [5:0] io_sram7_addr;
    wire io_sram7_cen;
    wire io_sram7_wen;
    wire [127:0] io_sram7_wmask;
    wire [127:0] io_sram7_wdata;
    wire [127:0] io_sram7_rdata;
    */
    // test signal end
    wire [5:0] iaddr, daddr;
    wire [31:0] cpu_inst;
    wire [31:0] cpu_pc;
    wire cpu_inst_valid, cpu_pc_valid, cpu_pc_ready;
    wire [31:0] mem_addr;
    wire cpu_rreq, cpu_wreq;
    wire [63:0] mem_rdata, mem_wdata;
    wire mem_rvalid, mem_bvalid, cpu_mem_ready;
    wire [7:0] cpu_wmask;
    // cache interface
    wire [63:0] cache_rdata;
    wire cache_rvalid;
    wire cache_rlast;
    wire cache_rready;
    wire [31:0] cache_araddr;
    wire cache_arready;
    wire cache_arvalid;
    wire [7:0] cache_arlen;
    wire [2:0] cache_arsize;
    wire [1:0] cache_arburst;
    wire [63:0] cache_wdata;
    wire cache_wvalid;
    wire cache_wready;
    wire cache_wlast;
    wire [7:0] cache_wstrb;
    wire [31:0] cache_awaddr;
    wire cache_awvalid;
    wire cache_awready;
    wire [7:0] cache_awlen;
    wire [2:0] cache_awsize;
    wire [1:0] cache_awburst;
    wire cache_bvalid;
    wire cache_bready;
    // clint interface
    wire [63:0] clint_rdata;
    wire clint_rvalid;
    wire clint_rready;
    wire [31:0] clint_araddr;
    wire clint_arready;
    wire clint_arvalid;
    wire [63:0] clint_wdata;
    wire clint_wvalid;
    wire clint_wready;
    wire [7:0] clint_wstrb;
    wire [31:0] clint_awaddr;
    wire clint_awvalid;
    wire clint_awready;
    wire clint_bvalid;
    wire clint_bready;
    wire cpu_mtip;
    wire inst_fencei, mem_fencei;
    // axi const
    assign io_slave_awready = 0;
    assign io_slave_wready = 0;
    assign io_slave_bvalid = 0;
    assign io_slave_bid = 0;
    assign io_slave_bresp = 0;
    assign io_slave_arready = 0;
    assign io_slave_rvalid = 0;
    assign io_slave_rid = 0;
    assign io_slave_rresp = 0;
    assign io_slave_rdata = 0;
    assign io_slave_rlast = 0;
    assign io_master_awid = 0;
    assign io_master_arid = 0;
    // assign io_master_awburst = 0;
    // assign io_master_arburst = 0;

    assign io_sram3_addr = iaddr;
    assign io_sram2_addr = iaddr;
    assign io_sram1_addr = iaddr;
    assign io_sram0_addr = iaddr;
    assign io_sram7_addr = daddr;
    assign io_sram6_addr = daddr;
    assign io_sram5_addr = daddr;
    assign io_sram4_addr = daddr;
    ysyx_040750_cpu_core cpu_core_e(
        .I_sys_clk(clock),
        .I_rst(reset),
        .I_mtip(cpu_mtip),
        .I_inst(cpu_inst),
        .I_inst_valid(cpu_inst_valid),
        .I_pc_ready(cpu_pc_ready),
        .I_mem_ready(cpu_mem_ready),
        .O_pc(cpu_pc),
        .O_pc_valid(cpu_pc_valid),
        .O_mem_addr(mem_addr),
        .O_mem_rd_en(cpu_rreq),
        .O_mem_wen(cpu_wreq),
        .I_mem_rd_data(mem_rdata),
        .I_mem_rd_data_valid(mem_rvalid),
        .I_mem_wr_data_valid(mem_bvalid),
        .O_mem_wr_data(mem_wdata),
        .O_mem_wr_strb(cpu_wmask),
        .O_inst_fencei(inst_fencei),
        .O_mem_fencei(mem_fencei)
    );

    ysyx_040750_cache cache_e(
        .I_clk(clock),
        .I_rst(reset),
        // pc & inst
        .I_cpu_pc(cpu_pc),
        .I_cpu_pc_valid(cpu_pc_valid),
        .O_cpu_pc_ready(cpu_pc_ready),
        .O_cpu_mem_ready(cpu_mem_ready),
        .I_inst_fencei(inst_fencei),
        .I_mem_fencei(mem_fencei),
        .O_cpu_inst(cpu_inst),
        .O_cpu_inst_valid(cpu_inst_valid),
        // cpu addr & w/r req
        .I_cpu_addr(mem_addr),
        .I_cpu_wmask(cpu_wmask),
        .I_cpu_rd_req(cpu_rreq),
        .I_cpu_wr_req(cpu_wreq),
        .I_cpu_wdata(mem_wdata),
        .O_cpu_rdata(mem_rdata),
        .O_cpu_rvalid(mem_rvalid),
        .O_cpu_bvalid(mem_bvalid),
        // cache w/r addr & req, low level valid en
        .I_sram0_rdata(io_sram0_rdata),
        .I_sram1_rdata(io_sram1_rdata),
        .I_sram2_rdata(io_sram2_rdata),
        .I_sram3_rdata(io_sram3_rdata),
        .I_sram4_rdata(io_sram4_rdata),
        .I_sram5_rdata(io_sram5_rdata),
        .I_sram6_rdata(io_sram6_rdata),
        .I_sram7_rdata(io_sram7_rdata),
        // ixxx -> icache, dxxx -> dcache
        .O_sram_iaddr(iaddr),
        .O_sram_daddr(daddr),
        .O_sram_cen({io_sram7_cen,io_sram6_cen,io_sram5_cen,io_sram4_cen,io_sram3_cen,io_sram2_cen,io_sram1_cen,io_sram0_cen}),
        .O_sram_wen({io_sram7_wen,io_sram6_wen,io_sram5_wen,io_sram4_wen,io_sram3_wen,io_sram2_wen,io_sram1_wen,io_sram0_wen}),
        .O_sram0_wdata(io_sram0_wdata),
        .O_sram1_wdata(io_sram1_wdata),
        .O_sram2_wdata(io_sram2_wdata),
        .O_sram3_wdata(io_sram3_wdata),
        .O_sram4_wdata(io_sram4_wdata),
        .O_sram5_wdata(io_sram5_wdata),
        .O_sram6_wdata(io_sram6_wdata),
        .O_sram7_wdata(io_sram7_wdata),
        .O_sram0_wmask(io_sram0_wmask),
        .O_sram1_wmask(io_sram1_wmask),
        .O_sram2_wmask(io_sram2_wmask),
        .O_sram3_wmask(io_sram3_wmask),
        .O_sram4_wmask(io_sram4_wmask),
        .O_sram5_wmask(io_sram5_wmask),
        .O_sram6_wmask(io_sram6_wmask),
        .O_sram7_wmask(io_sram7_wmask),

        // axi interface(unused slave interface)
        .I_mem_rdata(cache_rdata),
        .I_mem_rvalid(cache_rvalid),
        .O_mem_rready(cache_rready),
        .I_mem_rlast(cache_rlast),
        //.I_mem_rid(cache_rid),
        //.I_mem_rresp(cache_rresp),

        .O_mem_araddr(cache_araddr),
        .I_mem_arready(cache_arready),
        .O_mem_arvalid(cache_arvalid),
        .O_mem_arlen(cache_arlen),
        .O_mem_arsize(cache_arsize),
        //.O_mem_arid(cache_arid),
        .O_mem_arburst(cache_arburst),

        .O_mem_wdata(cache_wdata),
        .O_mem_wvalid(cache_wvalid),
        .I_mem_wready(cache_wready),
        .O_mem_wlast(cache_wlast),
        .O_mem_wstrb(cache_wstrb),

        .O_mem_awaddr(cache_awaddr),
        .O_mem_awvalid(cache_awvalid),
        .I_mem_awready(cache_awready),
        .O_mem_awlen(cache_awlen),
        .O_mem_awsize(cache_awsize),
        //.O_mem_awid(cache_awid),
        .O_mem_awburst(cache_awburst),

        .I_mem_bvalid(cache_bvalid),
        .O_mem_bready(cache_bready)
        //.I_mem_bid(cache_bid),
        //.I_mem_bresp(cache_bresp),
    );

    ysyx_040750_slave_crossbar slave_crossbar_e(
        .I_clk(clock),
        .I_rst(reset),
        // interface with cache
        .O_cache_rdata(cache_rdata),
        .O_cache_rvalid(cache_rvalid),
        .O_cache_rlast(cache_rlast),
        .I_cache_rready(cache_rready),
        .I_cache_araddr(cache_araddr),
        .O_cache_arready(cache_arready),
        .I_cache_arvalid(cache_arvalid),
        .I_cache_arlen(cache_arlen),
        .I_cache_arsize(cache_arsize),
        .I_cache_arburst(cache_arburst),
        .I_cache_wdata(cache_wdata),
        .I_cache_wvalid(cache_wvalid),
        .O_cache_wready(cache_wready),
        .I_cache_wlast(cache_wlast),
        .I_cache_wstrb(cache_wstrb),
        .I_cache_awaddr(cache_awaddr),
        .I_cache_awvalid(cache_awvalid),
        .O_cache_awready(cache_awready),
        .I_cache_awlen(cache_awlen),
        .I_cache_awsize(cache_awsize),
        .I_cache_awburst(cache_awburst),
        .O_cache_bvalid(cache_bvalid),
        .I_cache_bready(cache_bready),
        // with axi bus
        .I_bus_rdata(io_master_rdata),
        .I_bus_rvalid(io_master_rvalid),
        .I_bus_rlast(io_master_rlast),
        .O_bus_rready(io_master_rready),
        .O_bus_araddr(io_master_araddr),
        .I_bus_arready(io_master_arready),
        .O_bus_arvalid(io_master_arvalid),
        .O_bus_arlen(io_master_arlen),
        .O_bus_arsize(io_master_arsize),
        .O_bus_arburst(io_master_arburst),
        .O_bus_wdata(io_master_wdata),
        .O_bus_wvalid(io_master_wvalid),
        .I_bus_wready(io_master_wready),
        .O_bus_wlast(io_master_wlast),
        .O_bus_wstrb(io_master_wstrb),
        .O_bus_awaddr(io_master_awaddr),
        .O_bus_awvalid(io_master_awvalid),
        .I_bus_awready(io_master_awready),
        .O_bus_awlen(io_master_awlen),
        .O_bus_awsize(io_master_awsize),
        .O_bus_awburst(io_master_awburst),
        .I_bus_bvalid(io_master_bvalid),
        .O_bus_bready(io_master_bready),
        // with clint
        // AXI4-Lite interface
        // rlast for cache equal to rvalid
        .I_clint_rdata(clint_rdata),
        .I_clint_rvalid(clint_rvalid),
        .O_clint_rready(clint_rready),
        .O_clint_araddr(clint_araddr),
        .I_clint_arready(clint_arready),
        .O_clint_arvalid(clint_arvalid),
        .O_clint_wdata(clint_wdata),
        .O_clint_wvalid(clint_wvalid),
        .I_clint_wready(clint_wready),
        .O_clint_wstrb(clint_wstrb),
        .O_clint_awaddr(clint_awaddr),
        .O_clint_awvalid(clint_awvalid),
        .I_clint_awready(clint_awready),
        .I_clint_bvalid(clint_bvalid),
        .O_clint_bready(clint_bready)
    );

    ysyx_040750_clint clint_e(
        .I_clk(clock),
        .I_rst(reset),
        .O_mtip(cpu_mtip),
        .O_clint_rdata(clint_rdata),
        .O_clint_rvalid(clint_rvalid),
        .I_clint_rready(clint_rready),
        .I_clint_araddr(clint_araddr),
        .O_clint_arready(clint_arready),
        .I_clint_arvalid(clint_arvalid),
        .I_clint_wdata(clint_wdata),
        .I_clint_wvalid(clint_wvalid),
        .O_clint_wready(clint_wready),
        .I_clint_wstrb(clint_wstrb),
        .I_clint_awaddr(clint_awaddr),
        .I_clint_awvalid(clint_awvalid),
        .O_clint_awready(clint_awready),
        .O_clint_bvalid(clint_bvalid),
        .I_clint_bready(clint_bready)
    );
    /*
    S011HD1P_X32Y2D128_BW sram0(
        .Q(io_sram0_rdata),
        .CLK(clock),
        .CEN(io_sram0_cen),
        .WEN(io_sram0_wen),
        .BWEN(io_sram0_wmask),
        .A(io_sram0_addr),
        .D(io_sram0_wdata)
    );
    S011HD1P_X32Y2D128_BW sram1(
        .Q(io_sram1_rdata),
        .CLK(clock),
        .CEN(io_sram1_cen),
        .WEN(io_sram1_wen),
        .BWEN(io_sram1_wmask),
        .A(io_sram1_addr),
        .D(io_sram1_wdata)
    );
    S011HD1P_X32Y2D128_BW sram2(
        .Q(io_sram2_rdata),
        .CLK(clock),
        .CEN(io_sram2_cen),
        .WEN(io_sram2_wen),
        .BWEN(io_sram2_wmask),
        .A(io_sram2_addr),
        .D(io_sram2_wdata)
    );
    S011HD1P_X32Y2D128_BW sram3(
        .Q(io_sram3_rdata),
        .CLK(clock),
        .CEN(io_sram3_cen),
        .WEN(io_sram3_wen),
        .BWEN(io_sram3_wmask),
        .A(io_sram3_addr),
        .D(io_sram3_wdata)
    );
    S011HD1P_X32Y2D128_BW sram4(
        .Q(io_sram4_rdata),
        .CLK(clock),
        .CEN(io_sram4_cen),
        .WEN(io_sram4_wen),
        .BWEN(io_sram4_wmask),
        .A(io_sram4_addr),
        .D(io_sram4_wdata)
    );
    S011HD1P_X32Y2D128_BW sram5(
        .Q(io_sram5_rdata),
        .CLK(clock),
        .CEN(io_sram5_cen),
        .WEN(io_sram5_wen),
        .BWEN(io_sram5_wmask),
        .A(io_sram5_addr),
        .D(io_sram5_wdata)
    );
    S011HD1P_X32Y2D128_BW sram6(
        .Q(io_sram6_rdata),
        .CLK(clock),
        .CEN(io_sram6_cen),
        .WEN(io_sram6_wen),
        .BWEN(io_sram6_wmask),
        .A(io_sram6_addr),
        .D(io_sram6_wdata)
    );
    S011HD1P_X32Y2D128_BW sram7(
        .Q(io_sram7_rdata),
        .CLK(clock),
        .CEN(io_sram7_cen),
        .WEN(io_sram7_wen),
        .BWEN(io_sram7_wmask),
        .A(io_sram7_addr),
        .D(io_sram7_wdata)
    );
    */
endmodule
