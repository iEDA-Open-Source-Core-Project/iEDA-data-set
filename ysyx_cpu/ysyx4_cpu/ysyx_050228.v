`define ysyx_050228_DIV_FREE 0
`define ysyx_050228_DIV_ON 1
`define ysyx_050228_DIV_END 2
`define ysyx_050228_DIV_MEET 3
`define ysyx_050228_ctrl_ysyx_050228_DIV_FREE 0
`define ysyx_050228_ctrl_div_working 1

`define ysyx_050228_ID_IF_Bus 33
`define ysyx_050228_IF_ID_Bus 32
`define ysyx_050228_EX_ID_Bus 70
`define ysyx_050228_MEM_ID_Bus 70
`define ysyx_050228_WB_ID_Bus 71
`define ysyx_050228_ID_EX_Bus 314
`define ysyx_050228_EX_MEM_Bus 115
`define ysyx_050228_MEM_WB_Bus 500

`define ysyx_050228_ctrlBus 3


`define ysyx_050228_WRITE_STATE_FREE 0
`define ysyx_050228_WRITE_STATE_LOAD_ADDR 1
`define ysyx_050228_WRITE_STATE_SEND_DATA 2
`define ysyx_050228_WRITE_STATE_WAIT_RESP 3
`define ysyx_050228_WRITE_STATE_WAIT_RECEIVE 7

`define ysyx_050228_READ_STATE_FREE 0
`define ysyx_050228_READ_STATE_LOAD_ADDR 1
`define ysyx_050228_READ_STATE_RECEIVE_DATA 2

module ysyx_050228_alu(
    input wire [13:0] alu_control,
    input wire [63:0] alu_src1,
    input wire [63:0] alu_src2,
    output wire [63:0] alu_result
);

    wire op_add;
    wire op_sub;
    wire op_slt;
    wire op_sltu;
    wire op_and;
    wire op_or;
    wire op_xor;
    wire op_sll;
    wire op_srl;
    wire op_sra;
    wire op_lui;
    wire op_sllw;
    wire op_srlw;
    wire op_sraw;
    assign {op_add, op_sub, op_slt, op_sltu,
            op_and, op_or, op_xor,
            op_sll, op_srl, op_sra, op_lui,op_sraw,op_sllw,op_srlw} = alu_control;
    
    wire [63:0] add_sub_result;
    wire [63:0] slt_result;
    wire [63:0] sltu_result;
    wire [63:0] and_result;
    wire [63:0] or_result;
    wire [63:0] xor_result;
    wire [63:0] sll_result;
    wire [63:0] srl_result;
    wire [63:0] sra_result;
    wire [63:0] lui_result;
    wire [63:0] sraw_result;
    wire [63:0] srlw_result;
    wire [63:0] sllw_result;
    assign and_result = alu_src1 & alu_src2;
    assign or_result = alu_src1 | alu_src2;
    assign xor_result = alu_src1 ^ alu_src2;
    assign lui_result = alu_src2;

    wire [63:0] adder_a;
    wire [63:0] adder_b;
    wire [63:0] adder_cin;
    wire [63:0] adder_result;
    wire        adder_cout;

    assign adder_a = alu_src1;
    assign adder_b = (op_sub | op_slt | op_sltu) ? ~alu_src2 : alu_src2;
    assign adder_cin = (op_sub | op_slt | op_sltu) ? 64'b1 : 64'b0;
    assign {adder_cout, adder_result} = adder_a + adder_b + adder_cin;

    assign add_sub_result = adder_result;

    assign slt_result[63:1] = 63'b0;
    assign slt_result[0] = (alu_src1[63] & ~alu_src2[63]) 
                         | (~(alu_src1[63]^alu_src2[63]) & adder_result[63]);
    
    assign sltu_result[63:1] = 63'b0;
    assign sltu_result[0] = ~adder_cout;

    assign sll_result = alu_src1 << alu_src2[5:0];
    assign sllw_result[31:0] = alu_src1[31:0] << alu_src2[4:0];
    assign sllw_result[63:32] = 32'd0;

    assign srl_result = alu_src1 >> alu_src2[5:0];
    assign srlw_result[31:0] = alu_src1[31:0] >> alu_src2[4:0];
    assign srlw_result[63:32] = 32'd0;

    assign sra_result = alu_src1 >>> alu_src2[5:0];
    assign sraw_result[31:0] = ($signed(alu_src1[31:0])) >>> alu_src2[4:0];
    assign sraw_result[63:32] = 32'd0;

    assign alu_result = ({64{op_add|op_sub  }} & add_sub_result)
                      | ({64{op_slt         }} & slt_result)
                      | ({64{op_sltu        }} & sltu_result)
                      | ({64{op_and         }} & and_result)
                      | ({64{op_or          }} & or_result)
                      | ({64{op_xor         }} & xor_result)
                      | ({64{op_sll         }} & sll_result)
                      | ({64{op_srl         }} & srl_result)
                      | ({64{op_srlw        }} & srlw_result)
                      | ({64{op_sllw        }} & sllw_result)
                      | ({64{op_sraw        }} & sraw_result)
                      | ({64{op_sra         }} & sra_result)
                      | ({64{op_lui         }} & lui_result);
                      
endmodule




module ysyx_050228_cache (
    input clock,
    input reset,

    input [31:0]    inst_addr,
    input           inst_en,
    output [31:0]   inst_data,
    
    output          stop_all,
    input [31:0]    ext_data_addr,
    input [7:0]     ext_data_be,
    input           ext_data_wen,  
    input [63:0]    ext_data_write_data,
     
    output [63:0]   ext_cache_read_data,
// the following will be replaced by AXI


    //output [1023:0] ext_out_data,

    input           inst_fence_i,
    output          fence_i_ready,
    //input           mmio_en_req,

    output          mmio_inst_ready,
    output          mmio_ext_ready,

    input           mmio_req_ext,
    input           mmio_req_inst,

    output  [63:0]  mmio_read_data,

    input [63:0]    mmio_write_data,
    input           mmio_wen,
    input [7:0]     mmio_be_n,
    input [31:0]    mmio_addr_ext,
    input [31:0]    mmio_addr_inst,

    output [3:0]    AWID,     
    output [31:0]   AWADDR,    
    output [7:0]    AWLEN,            
    output [2:0]    AWSIZE,             
    output [1:0]    AWBURST,           
    output          AWVALID,            
    
    input           AWREADY,           
    // w
    output [63:0]   WDATA,    
    output [7:0]    WSTRB,
    output          WLAST,            
    output          WVALID,          
    input           WREADY,            
    // b
    input  [3:0]    BID,     
    input  [1:0]    BRESP,          
    input           BVALID,        
    
    output          BREADY,  

    output  [31:0]  ARADDR,   
    output  [7:0]   ARLEN,          
    output  [2:0]   ARSIZE,            
    output  [1:0]   ARBURST,            
    output          ARVALID,     

    input           ARREADY,           
    // r

    input   [3:0]   RID,
    input   [63:0]  RDATA,   
    input   [1:0]   RRESP,                 
    input           RLAST,               
    input           RVALID,  

    output          RREADY,      
    output  [3:0]   ARID,

    output [5:0]    io_sram0_addr ,
    output          io_sram0_cen ,
    output          io_sram0_wen ,
    output [127:0]  io_sram0_wmask ,
    output [127:0]  io_sram0_wdata ,
    input [127:0]   io_sram0_rdata ,
    output [5:0]    io_sram1_addr ,
    output          io_sram1_cen ,
    output          io_sram1_wen ,
    output [127:0]  io_sram1_wmask ,
    output [127:0]  io_sram1_wdata ,
    input [127:0]   io_sram1_rdata ,
    output [5:0]    io_sram2_addr ,
    output          io_sram2_cen ,
    output          io_sram2_wen ,
    output [127:0]  io_sram2_wmask ,
    output [127:0]  io_sram2_wdata ,
    input [127:0]   io_sram2_rdata ,
    output [5:0]    io_sram3_addr ,
    output          io_sram3_cen ,
    output          io_sram3_wen ,
    output [127:0]  io_sram3_wmask ,
    output [127:0]  io_sram3_wdata ,
    input [127:0]   io_sram3_rdata ,
    output [5:0]    io_sram4_addr ,
    output          io_sram4_cen ,
    output          io_sram4_wen ,
    output [127:0]  io_sram4_wmask ,
    output [127:0]  io_sram4_wdata ,
    input [127:0]   io_sram4_rdata ,
    output [5:0]    io_sram5_addr ,
    output          io_sram5_cen ,
    output          io_sram5_wen ,
    output [127:0]  io_sram5_wmask ,
    output [127:0]  io_sram5_wdata ,
    input [127:0]   io_sram5_rdata ,
    output [5:0]    io_sram6_addr ,
    output          io_sram6_cen ,
    output          io_sram6_wen ,
    output [127:0]  io_sram6_wmask ,
    output [127:0]  io_sram6_wdata ,
    input [127:0]   io_sram6_rdata ,
    output [5:0]    io_sram7_addr ,
    output          io_sram7_cen ,
    output          io_sram7_wen ,
    output [127:0]  io_sram7_wmask ,
    output [127:0]  io_sram7_wdata ,
    input [127:0]   io_sram7_rdata


);
wire [31:0]     ext_read_addr;
wire [31:0]     ext_write_addr;
wire            ext_write_req;
wire            ext_read_req;
wire inst_read_req;

wire [31:0]   inst_read_addr;
wire [127:0]   inst_in_data;
wire [127:0]   ext_in_data;
wire read_shortcut_icache;
wire dcache_ready;
wire icache_ready;
wire icache_busy;


reg [63:0] rdata_buffer_data;
reg [31:0] AXI_read_addr;
reg [2:0] read_state;
reg [3:0] read_index;
reg [2:0] AXI_read_size; 
reg [1:0] AXI_read_target;
reg [7:0] AXI_read_len;

reg [1023:0] wdata_buffer_data;
reg [31:0] wdata_buffer_addr;
reg [31:0] AXI_write_addr;
reg [3:0] write_index;
reg [3:0] write_state;

reg [7:0] AXI_write_len;
reg [7:0] AXI_write_wstrb;
reg [2:0] AXI_write_size;

reg [1:0] read_data_send_state;
reg [2:0] shortcut_cnt_dcache;
reg not_skip_write_dcache_reg;

reg  shortcut_cnt_icache;
reg shortcut_or_quick_trans_valid;



wire dcache_busy = (ext_read_req )| 
                 //   (read_state != `ysyx_050228_READ_STATE_FREE && AXI_read_target == 2'b10)|
                    ( write_state != `ysyx_050228_WRITE_STATE_FREE);
assign icache_busy = read_state != `ysyx_050228_READ_STATE_FREE && AXI_read_target == 2'd1 ;  // overlap decache 
assign stop_all =   (read_state  != `ysyx_050228_READ_STATE_FREE) | dcache_busy | mmio_req_ext ;
/* rules :
ext_req has higher priority
if ext_write_req                stop icache 
if ext_req    && inst_req       stop icache
if inst_req already read data   disable dcache busy
all read and write              stop all

 */
wire icache_valid;
assign icache_valid = (RVALID && read_index[0] ==1'd1)  | read_shortcut_icache;
ysyx_050228_Icache ysyx_050228_Icache
(
    .clock(clock),
    .reset(reset),
    .dcache_busy(dcache_busy),
    .icache_valid(icache_valid),
    .inst_in_replace_data(inst_in_data),
    .inst_addr(inst_addr),
    .inst_en(inst_en),
    //input data_in_ready,
    .icache_ready(icache_ready),
    .inst_read_addr(inst_read_addr),
    .inst_read_req(inst_read_req),
    .inst_out_data(inst_data),
    .io_sram0_addr(io_sram0_addr),
    .io_sram0_cen(io_sram0_cen),
    .io_sram0_wen(io_sram0_wen),
    .io_sram0_wmask(io_sram0_wmask),
    .io_sram0_wdata(io_sram0_wdata),
    .io_sram0_rdata(io_sram0_rdata),
    .io_sram1_addr(io_sram1_addr),
    .io_sram1_cen(io_sram1_cen),
    .io_sram1_wen(io_sram1_wen),
    .io_sram1_wmask(io_sram1_wmask),
    .io_sram1_wdata(io_sram1_wdata),
    .io_sram1_rdata(io_sram1_rdata),
    .io_sram2_addr(io_sram2_addr),
    .io_sram2_cen(io_sram2_cen),
    .io_sram2_wen(io_sram2_wen),
    .io_sram2_wmask(io_sram2_wmask),
    .io_sram2_wdata(io_sram2_wdata),
    .io_sram2_rdata(io_sram2_rdata),
    .io_sram3_addr(io_sram3_addr),
    .io_sram3_cen(io_sram3_cen),
    .io_sram3_wen(io_sram3_wen),
    .io_sram3_wmask(io_sram3_wmask),
    .io_sram3_wdata(io_sram3_wdata),
    .io_sram3_rdata(io_sram3_rdata)
);
wire ext_en;
assign ext_en =  ext_data_be != 8'd0;
wire dcache_write_ready;
wire [1023:0] ext_out_write_data;
wire dcache_valid;
wire dcache_read_from_buffer_ready;
wire dcache_not_skip_write;

ysyx_050228_Dcache ysyx_050228_Dcache
(
    .clock(clock),
    .reset(reset),

    .inst_fence_i(inst_fence_i),
    .icache_busy(icache_busy),
    .ext_in_addr(ext_data_addr),
    .ext_data_be(ext_data_be),        
    .ext_en(ext_en),             //read enable
    .ext_wen(ext_data_wen),            //write enable
    .ext_cpu_write_data(ext_data_write_data),   //in cpu write data
    //input data_in_ready,
    // .dcache_write_busy(dcache_write_busy),
    // .dcache_read_busy(dcache_read_busy),
    .dcache_ready(dcache_ready),
    .dcache_write_ready(dcache_write_ready),
    .ext_in_read_data(ext_in_data),   //mem to cache data
    .dcache_valid(dcache_valid),
    .ext_out_read_data(ext_cache_read_data),      //cpu read date
    .not_skip_write(dcache_not_skip_write),
    .fence_i_ready(fence_i_ready),
    .dcache_read_from_buffer_ready(dcache_read_from_buffer_ready),
    .ext_out_write_data(ext_out_write_data),           //cache to mem data
    .ext_out_write_addr(ext_write_addr),     //cache to mem write addr
    .ext_out_read_addr(ext_read_addr),      //cache to mem read addr
    .ext_write_req(ext_write_req),          //cache to mem write enable
    .ext_read_req(ext_read_req),            //cache to mem read enable  caution: write enable could be called meanwhile read enable
    .io_sram4_addr(io_sram4_addr),
    .io_sram4_cen(io_sram4_cen),
    .io_sram4_wen(io_sram4_wen),
    .io_sram4_wmask(io_sram4_wmask),
    .io_sram4_wdata(io_sram4_wdata),
    .io_sram4_rdata(io_sram4_rdata),
    .io_sram5_addr(io_sram5_addr),
    .io_sram5_cen(io_sram5_cen),
    .io_sram5_wen(io_sram5_wen),
    .io_sram5_wmask(io_sram5_wmask),
    .io_sram5_wdata(io_sram5_wdata),
    .io_sram5_rdata(io_sram5_rdata),
    .io_sram6_addr(io_sram6_addr),
    .io_sram6_cen(io_sram6_cen),
    .io_sram6_wen(io_sram6_wen),
    .io_sram6_wmask(io_sram6_wmask),
    .io_sram6_wdata(io_sram6_wdata),
    .io_sram6_rdata(io_sram6_rdata),
    .io_sram7_addr(io_sram7_addr),
    .io_sram7_cen(io_sram7_cen),
    .io_sram7_wen(io_sram7_wen),
    .io_sram7_wmask(io_sram7_wmask),
    .io_sram7_wdata(io_sram7_wdata),
    .io_sram7_rdata(io_sram7_rdata)
);

wire read_req;

assign mmio_read_data = RDATA;
assign mmio_inst_ready = RLAST && RVALID && AXI_read_target == 2'd3 && read_state == `ysyx_050228_READ_STATE_RECEIVE_DATA;
assign mmio_ext_ready = (~mmio_wen && RLAST && RVALID && AXI_read_target == 2'd0 && read_state == `ysyx_050228_READ_STATE_RECEIVE_DATA)|
                        (write_state == `ysyx_050228_WRITE_STATE_WAIT_RESP && AXI_write_len == 8'd0 && BVALID);

wire wdata_shortcut_addr_256bits_offset;
wire wdata_shortcut_addr_512bits_offset;
wire wdata_shortcut_addr_768bits_offset;
assign wdata_shortcut_addr_256bits_offset = wdata_buffer_addr == inst_addr+32'd32;
assign wdata_shortcut_addr_512bits_offset = wdata_buffer_addr == inst_addr+32'd64;
assign wdata_shortcut_addr_768bits_offset = wdata_buffer_addr == inst_addr+32'd96;
wire [9:0] wdata_base_offset_bits;
assign wdata_base_offset_bits =     wdata_shortcut_addr_256bits_offset ? 10'd128 :
                                    wdata_shortcut_addr_512bits_offset ? 10'd256 :
                                    wdata_shortcut_addr_768bits_offset ? 10'd512 : 
                                                                 10'd0;

assign read_req =   (inst_read_req &&  (wdata_buffer_addr != inst_addr )) |
                    ((ext_read_req ) && !dcache_valid) |
                    (mmio_req_ext && ~mmio_wen)|
                    mmio_req_inst;
                  //  write_state != `ysyx_050228_WRITE_STATE_WAIT_RESP;  // keep write and read symmetry
assign read_shortcut_icache = wdata_buffer_addr == inst_addr;
reg [1023:0] rdata_buffer_data_1024;
always @(posedge clock) begin
    if(reset) begin
        rdata_buffer_data <= 64'd0;
        AXI_read_addr <= 32'd0;
        read_index <= 4'd0;
        AXI_read_size <= 3'd0;
        AXI_read_target <= 2'd0;
        rdata_buffer_data_1024 <= 1024'd0;
        AXI_read_len <= 8'd0;
    end
    else if(read_req && read_state==`ysyx_050228_READ_STATE_FREE) begin
        read_index <= 4'd0;
        AXI_read_addr <=    
                            ext_read_req                           ? ext_read_addr:
                            inst_read_req &&~read_shortcut_icache  ? inst_read_addr:
                            mmio_req_ext && ~mmio_wen               ? mmio_addr_ext:
                            mmio_req_inst                           ? mmio_addr_inst:
                            32'd0;
        AXI_read_size <=    
                            (ext_read_req )|
                            (inst_read_req &&~read_shortcut_icache)   ? 3'd3 :
                            mmio_req_inst|                             
                            (mmio_req_ext && ~mmio_wen)                ? 3'd0:
                            3'd0;
        AXI_read_len  <=    
                            ext_read_req                           ? 8'd15:
                            inst_read_req &&~read_shortcut_icache  ? 8'd3:
                            (mmio_req_ext &&~mmio_wen)| mmio_req_inst? 8'd0:
                            8'd0;
        AXI_read_target <=  
                            ext_read_req                            ? 2'd2:
                            inst_read_req &&~read_shortcut_icache   ? 2'd1:
                            mmio_req_ext                            ? 2'd0:
                            2'd3;
    end
    else if(read_state == `ysyx_050228_READ_STATE_RECEIVE_DATA && RVALID) begin
        rdata_buffer_data <= RDATA;
        read_index <= read_index + 4'd1;
        rdata_buffer_data_1024[({6'd0,read_index}+10'd1)*64-1-:64] <= RDATA;
    end
end

always @(posedge clock) begin
    if(reset) begin
        shortcut_cnt_icache <= 1'd0;
    end
    else if(read_shortcut_icache ) begin
        shortcut_cnt_icache <= shortcut_cnt_icache + 1'd1;
    end
end
assign dcache_write_ready = write_state == `ysyx_050228_WRITE_STATE_WAIT_RESP && BVALID;
assign ARADDR = AXI_read_addr;
assign ARLEN = AXI_read_len;
assign ARSIZE = AXI_read_size;
assign ARBURST = 2'd01;
assign ARVALID = read_state == `ysyx_050228_READ_STATE_LOAD_ADDR;
assign ARID = 4'd0;
assign  RREADY = read_state ==  `ysyx_050228_READ_STATE_RECEIVE_DATA;

reg [2:0] dcache_valid_cnt;
assign icache_ready = ((AXI_read_target == 2'd1 && RVALID && RLAST && read_state == `ysyx_050228_READ_STATE_RECEIVE_DATA) )|
                        (read_shortcut_icache && shortcut_cnt_icache == 1'b1);
assign inst_in_data =   inst_read_req && (inst_addr == wdata_buffer_addr)? 
                        wdata_buffer_data[({9'd0,shortcut_cnt_icache}+10'd1)*128+wdata_base_offset_bits-1-:128] :
                        {RDATA,rdata_buffer_data};

wire [10:0] in_data_index;
assign in_data_index = {1'b1,{shortcut_cnt_dcache,7'd0}} - 11'd1;

assign dcache_ready =   dcache_valid_cnt == 3'b111 && dcache_valid;
assign ext_in_data =    not_skip_write_dcache_reg ?rdata_buffer_data_1024[in_data_index[9:0]-:128]:
                        {RDATA,rdata_buffer_data};

assign dcache_valid = ~not_skip_write_dcache_reg ? (RVALID && 
				read_index[0] ==1'd1 
				&& AXI_read_len == 8'h0f)  : shortcut_or_quick_trans_valid;


always @(posedge clock) begin
    if(reset) begin
        read_data_send_state <= 2'd0;
    end
    else if(read_data_send_state == 2'd0 && dcache_read_from_buffer_ready) begin
        read_data_send_state <= 2'd1;
    end
    else if(dcache_valid_cnt == 3'b111 && dcache_valid ) begin
        read_data_send_state <=2'd0;
    end
end


always @(posedge clock) begin
    if(reset) begin
        dcache_valid_cnt <= 3'd0;
    end	
    else if(dcache_valid && read_data_send_state == 2'd1) begin
        dcache_valid_cnt <= dcache_valid_cnt + 3'd1;
    end
    else if(read_data_send_state == 2'd0) begin
    	dcache_valid_cnt <= 3'd0;
    end
end


always @(posedge clock) begin
    if(reset) begin
        not_skip_write_dcache_reg <= 1'd0;
    end
    else if(dcache_not_skip_write) begin
        not_skip_write_dcache_reg <= 1'd1;
    end
    else if(dcache_valid_cnt == 3'b111 && dcache_valid) begin
        not_skip_write_dcache_reg <= 1'd0;
    end
end
always @(posedge clock) begin
    if(reset) begin
        shortcut_cnt_dcache <= 3'd0;
        shortcut_or_quick_trans_valid <= 1'd0;
    end
    else if(read_data_send_state == 2'd1 && (({1'd0,shortcut_cnt_dcache}) < read_index>>1) ) begin  // consider that write take up at most 4 clock cycle,read_index can't overflow before shortcun_cnt reach 3'b111
        shortcut_cnt_dcache <= shortcut_cnt_dcache +3'd1;
        shortcut_or_quick_trans_valid <= 1'd1;
    end
    else if(read_data_send_state == 2'd1 && shortcut_cnt_dcache == 3'b111 && RVALID && RLAST ) begin
        shortcut_cnt_dcache <= shortcut_cnt_dcache + 3'd1;
        shortcut_or_quick_trans_valid <= 1'd1;
    end
    else begin
        shortcut_or_quick_trans_valid <= 1'd0;
    end
end

always @(posedge clock) begin
    if(reset) begin
        read_state <= 3'd0;
    end
    else begin
        case(read_state) 
            `ysyx_050228_READ_STATE_FREE:
                if(read_req)
                    read_state <= `ysyx_050228_READ_STATE_LOAD_ADDR;
            `ysyx_050228_READ_STATE_LOAD_ADDR:
                if(ARREADY)
                    read_state <= `ysyx_050228_READ_STATE_RECEIVE_DATA;
            `ysyx_050228_READ_STATE_RECEIVE_DATA:
                if(RVALID && RLAST)    
                    read_state <= `ysyx_050228_READ_STATE_FREE;
        endcase
    end
end



// not a typical FSM
// write the first data when load addr

always @(posedge clock) begin
    if(reset) begin 
        write_state <=4'd0;
    end
    else
    begin
        case(write_state)
            `ysyx_050228_WRITE_STATE_FREE:
                if(ext_write_req | (mmio_req_ext && mmio_wen))
                    write_state <= `ysyx_050228_WRITE_STATE_WAIT_RECEIVE;
                else ;
            `ysyx_050228_WRITE_STATE_WAIT_RECEIVE:
                if(read_state == `ysyx_050228_READ_STATE_FREE && !read_req)
                    write_state <= `ysyx_050228_WRITE_STATE_LOAD_ADDR;
                else ;
            `ysyx_050228_WRITE_STATE_LOAD_ADDR:
                if(AWREADY && WREADY && WLAST) 
                    write_state <= `ysyx_050228_WRITE_STATE_WAIT_RESP;
                else if(AWREADY && WREADY && ~WLAST)
                    write_state <= `ysyx_050228_WRITE_STATE_SEND_DATA;
                else if(AWREADY && ~WREADY)
                    write_state <= `ysyx_050228_WRITE_STATE_SEND_DATA;
            `ysyx_050228_WRITE_STATE_SEND_DATA:
                if(WREADY && WLAST)
                    write_state <= `ysyx_050228_WRITE_STATE_WAIT_RESP;
                else ;
            `ysyx_050228_WRITE_STATE_WAIT_RESP:
                if(BVALID)
                    write_state <= `ysyx_050228_WRITE_STATE_FREE;
                else ;
            default: write_state <= `ysyx_050228_WRITE_STATE_FREE;
        endcase
    end
end

always @(posedge clock) begin
    if(reset) begin
        wdata_buffer_data <= 1024'd0;
        wdata_buffer_addr <= 32'd0;
        write_index <= 4'd0;
        AXI_write_addr <= 32'd0;
        AXI_write_wstrb <= 8'd0;
        AXI_write_len <= 8'd0;
        AXI_write_size <= 3'd0;
    end
    else if((ext_write_req| (mmio_req_ext && mmio_wen)) && write_state == `ysyx_050228_WRITE_STATE_FREE) begin
        wdata_buffer_data <= mmio_wen ?  1024'd0 : ext_out_write_data;
        wdata_buffer_addr <= mmio_wen ?  32'd0 : ext_write_addr ;
        AXI_write_addr <= mmio_wen ? mmio_addr_ext : ext_write_addr;
        AXI_write_len <= mmio_wen ? 8'd0: 8'd15;
        AXI_write_wstrb <= mmio_wen ? mmio_addr_ext[2] ? {4'd0,mmio_be_n[3:0]}: mmio_be_n : 8'hff;
        AXI_write_size <= mmio_wen ? 3'd0: 3'd3;
        write_index <= 4'd0;
    end
    else if(write_state == `ysyx_050228_WRITE_STATE_LOAD_ADDR && WREADY && ~WLAST) 
        write_index <= 4'd1;
    else if(write_state == `ysyx_050228_WRITE_STATE_SEND_DATA && WREADY) begin
        write_index <= write_index + 4'd1;
    end
end
assign AWID = 4'd0;
assign AWADDR = AXI_write_addr;
assign AWLEN = AXI_write_len;
assign AWSIZE = AXI_write_size;
assign AWBURST =  2'd01;
assign AWVALID = write_state == `ysyx_050228_WRITE_STATE_LOAD_ADDR;

assign WDATA = mmio_wen?mmio_write_data:wdata_buffer_data[({6'd0,write_index}+1)*64-1-:64] ;
assign WSTRB = AXI_write_wstrb; //WSTRB ??? 
assign WLAST = mmio_wen ?write_index == 4'd0 : write_index == 4'd15;
assign WVALID =(write_state == `ysyx_050228_WRITE_STATE_SEND_DATA ) 
                | ((write_state == `ysyx_050228_WRITE_STATE_LOAD_ADDR) && WREADY);

assign BREADY = write_state == `ysyx_050228_WRITE_STATE_WAIT_RESP;

endmodule
module ysyx_050228_csr_map(
    input [11:0] csr_num,
    input csr_valid,
    output reg [3:0] csr_map_num
);

always @(*) begin
    case(csr_num) 
        //12'h0 :     assign csr_map_num =4'd0;
        12'h300:     csr_map_num =4'd1;   //mstatue
        12'h304:     csr_map_num =4'd2;      //mie 
        12'h305:     csr_map_num =4'd3; //mtvec      
        12'h341:     csr_map_num =4'd4; //mepc
        12'h342:     csr_map_num =4'd5; //mcause
        12'h344:     csr_map_num =4'd6;  //mip
        12'hf14:     csr_map_num =4'd7; //mhartid
        12'h340:     csr_map_num =4'd8;
        12'h343:     csr_map_num =4'd9; //mtval
        // 12'h4000:   assign csr_map_num =4'd7; //mtimecmp
        // 12'hbff8:   assign csr_map_num =4'd8; //mtime
        default:     begin
            csr_map_num =4'd15;
        end 
    endcase
end
endmodule

module ysyx_050228_csr(
    input clock,
    input reset,
    input[31:0] pc,
    input [31:0] inst,
    input clear_mip,
    input mem_arrive_flag,
    input pause_mem,
    input int_time,  //tiem clock in 
    input [63:0] src1,
    input [4:0] zimm,
    input [11:0] csr_num,
    input [7:0] csr_OneHot,
   // input msip,

    output clint_jump_en,
    output [63:0] csr_result 
);

reg [63:0] csr_reg [15:0];
wire time_interrupt;
wire [3:0] csr_map_num;
wire inst_csrrs,inst_csrrw,inst_mret,inst_ecall,inst_csrrc,inst_csrrsi,inst_csrrci,inst_csrrwi;
assign {inst_csrrs,inst_csrrw,inst_mret,inst_ecall,inst_csrrc,inst_csrrsi,inst_csrrci,inst_csrrwi} = csr_OneHot;
assign csr_result = inst_csrrw|inst_csrrs|inst_csrrc|
                    inst_csrrci|inst_csrrsi|inst_csrrwi ? csr_reg[csr_map_num]  :
                    inst_mret 		  	  ? csr_reg[4'd4] 	   :	
                   // inst_mret && time_interrupt_flag    ? csr_reg[4'd4]         : //back from time_int
                    inst_ecall|(time_interrupt)      ? csr_reg[4'd3]         : // jump to mtvec
                    64'h0; 
assign clint_jump_en = time_interrupt;

assign time_interrupt = int_time ==1 &&csr_reg[4'd1][3] ==1'b1 && csr_reg[4'd2][7] == 1'b1 && ~mem_arrive_flag && ~pause_mem;

ysyx_050228_csr_map ysyx_050228_csr_map(
    .csr_num(csr_num),
    .csr_valid(inst_csrrw|inst_csrrwi|inst_csrrs|inst_csrrsi|inst_csrrc|inst_csrrci),
    .csr_map_num(csr_map_num)
);

// always @(posedge clk) begin
//     if(csr_map_num == 4'd7) begin
//         $display("%x %x",src1,zimm);
//     end
// end

wire [63:0] write_data;
assign write_data = inst_csrrw ? src1 :
                    inst_csrrs ? src1 | csr_reg[csr_map_num]:
                    inst_csrrc ? (~src1) & csr_reg[csr_map_num]:
                    inst_csrrci? (~{59'd0,zimm}) & csr_reg[csr_map_num]:
                    inst_csrrwi? {59'd0,zimm}:
                    ({59'd0,zimm}) | csr_reg[csr_map_num];
always @(posedge clock)begin
    if(reset) begin
        for(int i=2;i<16;i++) begin
            csr_reg[i] <= 64'd0;
        end
        csr_reg[0] <= 64'd0;
        csr_reg[1] <= 64'ha0001800;
    end
    else if(inst_mret) begin
   	    csr_reg[1][12:11]<=2'b00;
        csr_reg[1][3]<=csr_reg[1][7];
        csr_reg[1][7]<=1'b1;
    end
    else if(inst_csrrw|inst_csrrs|inst_csrrc|inst_csrrci|inst_csrrwi|inst_csrrsi) begin
        //csr_reg[csr_map_num] <= (csr_map_num == 4'd7) ? 64'd0:write_data; 
        csr_reg[csr_map_num] <= write_data; 
    end
    else if(inst_ecall)begin    
        csr_reg [4] <= {32'd0,pc+32'd4};   //pc put in mepc
        csr_reg [5] <= 64'hb; 
        csr_reg[1][12:11]<=2'b11;
        csr_reg[1][7]<=csr_reg[1][3];
        csr_reg[1][3]<=1'b0; 
        csr_reg[9] <= {32'd0,inst+32'd4};   
    end
    else if(time_interrupt & pc!=0 && ~pause_mem) begin
        csr_reg [4] <= {32'd0,pc};   //pc put in mepc
        csr_reg [5] <= 64'h8000000000000007;   
        csr_reg [6][7] <= 1'd1;   
        csr_reg[1][12:11]<=2'b11;
        csr_reg[1][7]<=csr_reg[1][3];
        csr_reg[1][3]<=1'b0;  
        csr_reg[9] <= {32'd0,inst};  
    end
    else if(clear_mip)begin
        csr_reg [6][7] <= 1'd0;
    end
end
    
endmodule

module ysyx_050228_ctrl(
    input clock,
    input reset,

    input div_ready,
    input div_valid,

    input fence_i_ready,

    output div_stop

);
reg [1:0] ctrl_div_state;
always @(posedge clock) begin
    if(reset) begin
        ctrl_div_state <= `ysyx_050228_ctrl_ysyx_050228_DIV_FREE;
    end
    else if(`ysyx_050228_ctrl_ysyx_050228_DIV_FREE ==ctrl_div_state && (div_ready))begin
        ctrl_div_state <= `ysyx_050228_ctrl_div_working;
    end
    else if(`ysyx_050228_ctrl_div_working ==ctrl_div_state && (div_valid | fence_i_ready))begin
        ctrl_div_state <= `ysyx_050228_ctrl_ysyx_050228_DIV_FREE;
    end
end
assign div_stop = ctrl_div_state == `ysyx_050228_ctrl_div_working;
endmodule
module ysyx_050228_Dcache
(
    input clock,
    input reset,

    input [127:0]           ext_in_read_data,
    input [31:0]            ext_in_addr,
    input [7:0]             ext_data_be,
    input                   ext_en,
    input                   ext_wen,
    input [63:0]            ext_cpu_write_data,
    input                   inst_fence_i,
    input                   icache_busy,
    input                   dcache_valid,
    // output                  dcache_write_busy,
    // output                  dcache_read_busy,
    //input data_in_ready,
    input                   dcache_ready,
    input                   dcache_write_ready,
    //input                   dcache_write_ready,
    output                  not_skip_write,
    output [63:0]           ext_out_read_data,    
    output [16*64-1:0]      ext_out_write_data,
    output [31:0]           ext_out_write_addr,
    output [31:0]           ext_out_read_addr,
    output                  dcache_read_from_buffer_ready,
    output                  fence_i_ready,
    output                  ext_write_req,
    output                  ext_read_req,

    output [5:0]    io_sram4_addr ,
    output          io_sram4_cen ,
    output          io_sram4_wen ,
    output [127:0]  io_sram4_wmask ,
    output [127:0]  io_sram4_wdata ,
    input [127:0]   io_sram4_rdata ,
    output [5:0]    io_sram5_addr ,
    output          io_sram5_cen ,
    output          io_sram5_wen ,
    output [127:0]  io_sram5_wmask ,
    output [127:0]  io_sram5_wdata ,
    input [127:0]   io_sram5_rdata ,
    output [5:0]    io_sram6_addr ,
    output          io_sram6_cen ,
    output          io_sram6_wen ,
    output [127:0]  io_sram6_wmask ,
    output [127:0]  io_sram6_wdata ,
    input [127:0]   io_sram6_rdata ,
    output [5:0]    io_sram7_addr ,
    output          io_sram7_cen ,
    output          io_sram7_wen ,
    output [127:0]  io_sram7_wmask ,
    output [127:0]  io_sram7_wdata ,
    input [127:0]   io_sram7_rdata
);

//seems that the data forwarding and indata process waste lots of time



reg [15:0] dirty_flag_way0;
reg [15:0] dirty_flag_way1;
assign fence_i_ready = inst_fence_i && dirty_flag_way0 == 16'd0 && dirty_flag_way1 == 16'd0;
wire [63:0] total_shift;
wire hit_way0;
wire hit_way1;

reg [20:0] tag_way0 [15:0];         //total 16 index  therefore ,22 bits tag
reg [20:0] tag_way1 [15:0];

wire [3:0] offset_ext;
wire [3:0] index_ext;
wire [20:0] tag_ext;
wire [2:0] takeup_3;
assign {tag_ext,index_ext,offset_ext,takeup_3} = ext_in_addr;
// always @(posedge clock) begin
//     if(ext_in_addr == 32'h800004f0) begin
//         $display("%x %x",ext_cpu_write_data,ext_data_be);
//     end
// end

wire [63:0] bit_mask_64;
assign bit_mask_64 =    {{8{ext_data_be[7]}},
                        {8{ext_data_be[6]}},
                        {8{ext_data_be[5]}},
                        {8{ext_data_be[4]}},
                        {8{ext_data_be[3]}},
                        {8{ext_data_be[2]}},
                        {8{ext_data_be[1]}},
                        {8{ext_data_be[0]}}};

reg [63:0] bit_mask_64_reg;
wire [127:0] bit_mask_128;
assign bit_mask_128 = offset_ext[0] ? {~bit_mask_64,64'hffffffffffffffff}:{64'hffffffffffffffff,~bit_mask_64};

wire [9:0] total_shift_in;
assign total_shift_in = ext_data_be[0] ? 10'd0:
                        ext_data_be[1] ? 10'd8:
                        ext_data_be[2] ? 10'd16:
                        ext_data_be[3] ? 10'd24:
                        ext_data_be[4] ? 10'd32:
                        ext_data_be[5] ? 10'd40:
                        ext_data_be[6] ? 10'd48:
                        ext_data_be[7] ? 10'd56:10'd0;

wire [63:0] ext_cpu_data_write_64;
assign ext_cpu_data_write_64 =(ext_cpu_write_data << total_shift_in)& bit_mask_64;

reg [1:0] fence_i_replace_way;
reg [3:0] fence_i_replace_index;
reg [20:0] fence_i_replace_tag;
reg write_req_cacel;
wire [127:0] ext_in_data_after_write;
reg [2:0] replace_write_index;
reg [2:0] write_index;

assign ext_in_data_after_write =    write_index == offset_ext[3:1] && ext_wen?
                                    ext_in_read_data&bit_mask_128 | {ext_cpu_data_write_64,ext_cpu_data_write_64}&~bit_mask_128 :
                                    ext_in_read_data;


reg [7:0] ext_data_be_reg;

assign total_shift =    ext_data_be_reg[0] ? 64'd0:
                        ext_data_be_reg[1] ? 64'd8:
                        ext_data_be_reg[2] ? 64'd16:
                        ext_data_be_reg[3] ? 64'd24:
                        ext_data_be_reg[4] ? 64'd32:
                        ext_data_be_reg[5] ? 64'd40:
                        ext_data_be_reg[6] ? 64'd48:
                        ext_data_be_reg[7] ? 64'd56:64'd0;

assign hit_way0 = tag_way0[index_ext] == tag_ext;
assign hit_way1 = tag_way1[index_ext] == tag_ext;

reg [15:0] lru;

assign ext_out_write_addr = ~inst_fence_i?lru[index_ext]? {tag_way1[index_ext],index_ext,7'd0} ://lru = 1 means use way0 recently
                                        {tag_way0[index_ext],index_ext,7'd0} :
                                        {fence_i_replace_tag,fence_i_replace_index,7'd0}; 
/*not write yet*/
wire [127:0] ram_read_data;

reg [895:0] replace_write_data_buffer;

reg [2:0] dcache_state;  // read state
reg indata_target; //0 from read request 
                    //1 from write request 

reg select_from_write_data;
reg [63:0] read_when_write_data;
assign ext_out_write_data =  {ram_read_data,replace_write_data_buffer};

assign ext_out_read_addr = {ext_in_addr[31:7],7'd0};
assign ext_read_req = icache_busy ? 1'd0 : ~hit_way0 && ~hit_way1 && ext_en ;

wire lru_dirty_status;
assign lru_dirty_status = lru[index_ext] ?  dirty_flag_way1[index_ext] :
                                        dirty_flag_way0[index_ext] ;

assign ext_write_req = dcache_state == 3'd1 |icache_busy ? 1'd0 : (~hit_way0 && ~hit_way1 && 
                                            lru_dirty_status == 1 && ext_en && dcache_state == 3'd2 && ~write_req_cacel) |(dcache_state == 3'd4) ;

assign not_skip_write = dcache_state == 3'd1;
wire [3:0] index_dirty_way0;
wire [3:0] index_dirty_way1;
always @(posedge clock) begin      
    if(reset) begin
        for(int j=0;j<16;j++) begin
            tag_way0[j] <= 21'd0;
            tag_way1[j] <= 21'd0;
        end
        fence_i_replace_way <= 2'd0;
        fence_i_replace_index <= 4'd0;
        lru <= 16'h0;
        dirty_flag_way0 <= 16'd0;
        dirty_flag_way1 <= 16'd0;
        ext_data_be_reg <= 8'd0;
        write_index <= 3'd0;
        indata_target <= 1'd0;
        dcache_state <= 3'd0;
        select_from_write_data <= 1'd0;
        read_when_write_data <= 64'd0;
        bit_mask_64_reg <= 64'd0;
        write_req_cacel <= 1'd0; 
        fence_i_replace_tag <= 21'd0;
    end
    else if(icache_busy) begin
        
    end
    else if(dcache_state == 3'd0 ) begin
        write_req_cacel <= 1'd0;
        bit_mask_64_reg <= bit_mask_64;
        ext_data_be_reg <= ext_data_be;
        if(inst_fence_i) begin
            if(dirty_flag_way0 != 16'd0) begin
                fence_i_replace_way <= 2'd01;
                fence_i_replace_index <=  index_dirty_way0;
                fence_i_replace_tag <= tag_way0[index_dirty_way0];
                dcache_state <= 3'd3;
            end
            else if(dirty_flag_way1 != 16'd0) begin
                fence_i_replace_way <= 2'b10;
                fence_i_replace_index <=  index_dirty_way1;
                fence_i_replace_tag <= tag_way1[index_dirty_way1];
                dcache_state <= 3'd3;
            end
        end
        else begin
            fence_i_replace_way <= 2'd0;
            fence_i_replace_index <= 4'd0;
            if(ext_read_req ) begin
                write_index <= 3'd0;
                if(~ ext_wen) begin
                    dcache_state <= 3'd1;
                    indata_target <= 1'd0;
                    select_from_write_data <= 1'd1;
                    if(lru_dirty_status)
                        dcache_state <= 3'd1;   
                    else
                        dcache_state <= 3'd2;  
                end
                else begin
                    indata_target <= 1'd1;
                    if(lru_dirty_status)
                        dcache_state <= 3'd1;   
                    else
                        dcache_state <= 3'd2;  
                    select_from_write_data <= 1'd0;         
                end
            end
            else if(ext_wen && hit_way0) begin
                dirty_flag_way0[index_ext] <= 1'd1;
                lru[index_ext] <= 1'd1 ;
                select_from_write_data <= 1'd0;
            end
            else if(ext_wen && hit_way1) begin
                dirty_flag_way1[index_ext] <= 1'd1;
                lru[index_ext] <= 1'd0 ;
                select_from_write_data <= 1'd0;
            end
            else if(ext_en && (hit_way0|hit_way1 )&& ~ext_wen) begin
                lru[index_ext] <= hit_way0 ;
                select_from_write_data <= 1'd0;
            end
        end 
    end

    else if(dcache_state == 3'd1) begin
        if(replace_write_index == 3'b111) begin
            if(fence_i_replace_way != 2'd0) begin
                dcache_state <= 3'd4;
            end
            else begin
                dcache_state <= 3'd2;
            end
        end
    end
    else if(dcache_state == 3'd2 && ~dcache_valid) begin
        if(dcache_write_ready) begin
            write_req_cacel <= 1'd1;
        end
    end
    else if(dcache_state == 3'd2 && dcache_valid) begin
        if(dcache_write_ready) begin
            write_req_cacel <= 1'd1;
        end
        write_index <= write_index +3'd1;
        if(indata_target == 1'd0 && write_index == offset_ext[3:1]) begin
            read_when_write_data <= offset_ext[0] ? bit_mask_64 & ext_in_read_data[127:64] : bit_mask_64 & ext_in_read_data[63:0];
        end
        if(dcache_ready) begin
            dcache_state <= 3'd0;
            if(lru[index_ext]) begin  //recently use way0
                tag_way1[index_ext] <= tag_ext;  
            end
            else begin
                tag_way0[index_ext] <= tag_ext;  
            end
            if(indata_target == 1'd0) begin
                if(lru[index_ext]) begin  //recently use way0
                    dirty_flag_way1[index_ext] <= 1'd0;  
                end
                else begin
                    dirty_flag_way0[index_ext] <= 1'd0;  
                end
            end
            else if(indata_target == 1'd1) begin
                if(lru[index_ext]) begin  //recently use way0
                    dirty_flag_way1[index_ext] <= 1'd1;  
                end
                else begin
                    dirty_flag_way0[index_ext] <= 1'd1;  
                end
            end
        end
    end
    else if(dcache_state == 3'd3) begin  //wait for fence.i data ready
        dcache_state <= 3'd1;
    end
    else if(dcache_state == 3'd4 && dcache_write_ready) begin  //easier to enable write_req
        dcache_state <= 3'd0;

        if(fence_i_replace_way[0]) begin
            dirty_flag_way0[fence_i_replace_index] <= 1'd0;
        end
        else if(fence_i_replace_way[1]) begin
            dirty_flag_way1[fence_i_replace_index] <= 1'd0;            
        end
    end
end
always @(posedge clock) begin
    if(reset) begin
        replace_write_index <= 3'd0;
    end
    else if(dcache_state == 3'd1) begin
        replace_write_index <= replace_write_index + 3'd1;
        replace_write_data_buffer[{7'd0,(replace_write_index)}*128-1-:128] <= ram_read_data;//read_data;
    end
end
assign dcache_read_from_buffer_ready = dcache_state == 3'd2;

wire [127:0] bit_mask;
assign bit_mask = dcache_state == 3'd0 ? bit_mask_128 : 128'd0; // low valid
wire [127:0] ram_write_data;
assign ram_write_data = dcache_state == 3'd0 && ext_wen ? {ext_cpu_data_write_64,ext_cpu_data_write_64}:ext_in_data_after_write;

wire [3:0] dcahce_store_wen; // low valid
reg select_from_way0_high;
reg select_from_way1_high;
reg select_from_way0_low;
reg select_from_way1_low;
reg ext_addr_reg;
always @(posedge clock) begin
    if(reset) begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd0;
    end
    else if(hit_way0 && ~index_ext[3])begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd1;
        select_from_way1_low <= 1'd0;
    end
    else if(hit_way0 && index_ext[3])begin
        select_from_way0_high <= 1'd1;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd0;
    end
        else if(hit_way1 && ~index_ext[3])begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd1;
    end
    else if(hit_way1 && index_ext[3])begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd1;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd0;
    end
end
always @(posedge clock) begin
    if(reset) begin
        ext_addr_reg <= 1'd0;
    end
    else begin
        ext_addr_reg <= offset_ext[0];
    end
end

assign ram_read_data =      (fence_i_replace_way ==2'd0) && ~lru[index_ext] && (index_ext[3] == 1'd0) ? io_sram4_rdata:  //way 0 && ram low
                            (fence_i_replace_way ==2'd0) && ~lru[index_ext] && (index_ext[3] == 1'd1) ? io_sram5_rdata:  //way 0 && ram high
                            (fence_i_replace_way ==2'd0) && lru[index_ext] && (index_ext[3] == 1'd0) ? io_sram6_rdata:  //way 1 && ram low
                            (fence_i_replace_way ==2'd0) && lru[index_ext] && (index_ext[3] == 1'd1) ? io_sram7_rdata: 
                            (fence_i_replace_way !=2'd0) && fence_i_replace_way[0] && (fence_i_replace_index[3] == 1'd0) ? io_sram4_rdata:  //way 0 && ram low
                            (fence_i_replace_way !=2'd0) && fence_i_replace_way[0] && (fence_i_replace_index[3] == 1'd1) ? io_sram5_rdata:  //way 0 && ram high
                            (fence_i_replace_way !=2'd0) && ~fence_i_replace_way[0] && (fence_i_replace_index[3] == 1'd0) ? io_sram6_rdata:  //way 1 && ram low
                            (fence_i_replace_way !=2'd0) && ~fence_i_replace_way[0] && (fence_i_replace_index[3] == 1'd1) ? io_sram7_rdata: 128'd0; //way 1 && ram high                                 

assign ext_out_read_data =  ((select_from_write_data ? read_when_write_data :
                            select_from_way0_low?
                                    ext_addr_reg == 1'd0  ? io_sram4_rdata[63:0]: io_sram4_rdata[127:64]: 
                            select_from_way0_high?
                                    ext_addr_reg == 1'd0  ? io_sram5_rdata[63:0]: io_sram5_rdata[127:64]: 
                            select_from_way1_low?
                                    ext_addr_reg == 1'd0  ? io_sram6_rdata[63:0]: io_sram6_rdata[127:64]: 
                            select_from_way1_high?
                                    ext_addr_reg == 1'd0  ? io_sram7_rdata[63:0]: io_sram7_rdata[127:64]: 
                                                                64'd0) & bit_mask_64_reg) >> total_shift;
wire [5:0] read_addr;
assign read_addr =  dcache_state == 3'd1 && (fence_i_replace_way != 2'd0)?  {fence_i_replace_index[2:0],replace_write_index} :
                    dcache_state == 3'd1 && (fence_i_replace_way == 2'd0)?  {index_ext[2:0],replace_write_index} :
                    dcache_state == 3'd2 ?  {index_ext[2:0],write_index} :
                                            {index_ext[2:0],offset_ext[3:1]};
assign dcahce_store_wen =   dcache_state == 3'd4 |dcache_state == 3'd3 |dcache_state == 3'd1 | (~ext_wen && dcache_state == 3'd0)   ?4'b1111: 
                            ext_wen && dcache_state == 3'd0 ?
                            hit_way0 && index_ext[3] == 1'd0 ? 4'b1110:  //way 0 && ram low
                            hit_way0 && index_ext[3] == 1'd1 ? 4'b1101:  //way 0 && ram high
                            hit_way1 && index_ext[3] == 1'd0 ? 4'b1011:  //way 1 && ram low
                            hit_way1 && index_ext[3] == 1'd1 ? 4'b0111:  //way 1 && ram high   
                            4'b1111:
                            ~lru[index_ext] && index_ext[3] == 1'd0 ? 4'b1110:  //way 0 && ram low
                            ~lru[index_ext] && index_ext[3] == 1'd1 ? 4'b1101:  //way 0 && ram high
                            lru[index_ext] && index_ext[3] == 1'd0 ? 4'b1011:  //way 1 && ram low
                            lru[index_ext] && index_ext[3] == 1'd1 ? 4'b0111:  //way 1 && ram high         
                            4'b1111;                  


ysyx_050228_find_index  ysyx_050228_find_index_way0(
    .data(dirty_flag_way0),
    .index(index_dirty_way0)
);

ysyx_050228_find_index  ysyx_050228_find_index_way1(
    .data(dirty_flag_way1),
    .index(index_dirty_way1)
);



assign io_sram4_addr = read_addr;
assign io_sram4_cen = 1'b0;
assign io_sram4_wen = dcahce_store_wen[0];
assign io_sram4_wmask = bit_mask;
assign io_sram4_wdata = ram_write_data;

assign io_sram5_addr = read_addr;
assign io_sram5_cen = 1'b0;
assign io_sram5_wen = dcahce_store_wen[1];
assign io_sram5_wmask = bit_mask;
assign io_sram5_wdata = ram_write_data;

assign io_sram6_addr = read_addr;
assign io_sram6_cen = 1'b0;
assign io_sram6_wen = dcahce_store_wen[2];
assign io_sram6_wmask = bit_mask;
assign io_sram6_wdata = ram_write_data;

assign io_sram7_addr = read_addr;
assign io_sram7_cen = 1'b0;
assign io_sram7_wen = dcahce_store_wen[3];
assign io_sram7_wmask = bit_mask;
assign io_sram7_wdata = ram_write_data;

endmodule


module ysyx_050228_div(
    input clock,
    input reset,

    input sign,
    input [63:0] div_data,
    input [63:0] dived_data,
    input div_ready,
    input shorten,

    output div_valid_o,
    output [63:0] result_hi/* verilator split_var */,
    output [63:0] result_lo/* verilator split_var */

);
wire fast;
reg div_valid;
assign div_valid_o = fast ? 1'd1 : div_valid;

reg [127:0] remain_data;
reg [63:0] src2; 
reg [2:0] div_state;
reg [63:0] result;
reg [6:0] result_index;
wire [64:0] sub_data;

wire [63:0] div_data_abs;
wire [63:0] dived_data_abs;

wire div_sign_flag;
wire dived_sign_flag;

assign div_sign_flag =  shorten?sign & div_data[31]: sign & div_data[63];
assign dived_sign_flag = shorten?sign & dived_data[31]:sign &  dived_data[63];

wire [63:0] div_32_data;
assign div_32_data = div_sign_flag ? {32'd0,~div_data[31:0]+1} : {32'd0,div_data[31:0]};
assign div_data_abs = shorten? div_32_data: 
                        div_sign_flag ? ~div_data+1 : div_data;
wire [63:0] dived_32_data;
assign dived_32_data = dived_sign_flag ? {32'd0,~dived_data[31:0]+1} : {32'd0,dived_data[31:0]};
assign dived_data_abs = shorten? dived_32_data: 
                        dived_sign_flag ? ~dived_data+1 : dived_data;

wire takeup;
assign sub_data = remain_data[result_index+7'd64-:65] - {1'b0,src2};
wire [63:0] result_shift;
assign result_shift = result <<1;
wire [63:0] result_update;
assign result_update = {result_shift[63:1],~sub_data[64]};
reg [63:0] div_before;
reg [63:0] dived_before;
reg [63:0] result_lo_before;
reg [63:0] result_hi_before;
reg shorten_before;
reg sign_before;
always @(posedge clock) begin
    if(reset) begin
        src2 <= 64'd0;
        remain_data <= 128'd0;
        div_state <= 3'd0;
        result_index <= 7'd0;
        result <= 64'd0;
        div_valid <= 1'd0;
        div_before <= 64'd0;
        dived_before <= 64'd0;
        shorten_before <= 1'd0;
        sign_before <= 1'd0;
        result_hi_before <= 64'd0;
        result_lo_before <= 64'd0;
    end
    else if(div_state == `ysyx_050228_DIV_FREE) begin
        if(div_ready && ((div_before !=div_data) | (dived_before != dived_data )|(sign_before != sign)| (shorten != shorten_before) )) begin
            src2 <= dived_data_abs;
            div_state <= 3'd1;
            result_index <= 7'd63;
            remain_data <= {64'd0,div_data_abs};
            div_valid <= 1'd0;
        end
        else 
            div_valid <= 1'd0;
    end
    else if(div_state == `ysyx_050228_DIV_ON) begin
        remain_data[result_index+7'd64-:65] <= sub_data[64] ? remain_data[result_index+7'd64-:65] : sub_data;
        result <= result_update;
        result_index <= result_index - 7'd1;
        if(result_index == 7'd0) begin
            div_state  <= `ysyx_050228_DIV_END;
            div_valid <= 1'd1;
        end
    end
    else if(div_state == `ysyx_050228_DIV_END) begin
        div_state  <= `ysyx_050228_DIV_MEET;
    end
    else if(div_state == `ysyx_050228_DIV_MEET) begin
        div_state  <= `ysyx_050228_DIV_FREE;
        div_before <= div_data;
        dived_before <= dived_data;
        shorten_before <= shorten;
        sign_before <= sign;
        result_hi_before <= result_hi;
        result_lo_before <= result_lo;
    end
end
wire [31:0] rem32;
assign rem32 = ~remain_data[31:0] + 1;
wire [63:0] short_rem32;
assign short_rem32 = div_sign_flag ? {{32{rem32[31]}},rem32}: {{32{remain_data[31]}},remain_data[31:0]};
wire [31:0] result32;
assign result32 = ~result[31:0] +1;
wire [63:0] short_div32;
assign short_div32 = dived_sign_flag ^ div_sign_flag? {{32{result32[31]}},result32}: {{32{result[31]}},result[31:0]};
assign result_hi = fast ? result_hi_before : shorten? short_rem32 :
                     div_sign_flag ? ~remain_data[63:0] + 1: remain_data[63:0];
assign result_lo = fast ? result_lo_before :  shorten? short_div32 :
                    dived_sign_flag ^ div_sign_flag ?~result +1 :  result ;

assign fast = (div_before ==div_data) && (dived_before == dived_data ) && (sign_before == sign) &&  (shorten == shorten_before);
endmodule
   

module ysyx_050228_EX(
    input clock,
    input reset,
    
    input stop_all,
    input clint_jump_en,

    input div_stop,
    input wire [`ysyx_050228_ID_EX_Bus-1:0] ID_EX_Bus,
    output div_valid,
    output wire [`ysyx_050228_EX_MEM_Bus-1:0] EX_MEM_Bus,
    output wire [`ysyx_050228_EX_ID_Bus-1:0] EX_ID_Bus,
    output wire inst_fence_i,
    output wire[31:0] ext_ram_addr, //ExtRAM地址
    output wire[7:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�???0
    output wire ext_ram_wen,       //ExtRAM片�?�，低有�???
    output wire [63:0] ext_ram_write_data
);
reg [`ysyx_050228_ID_EX_Bus-1:0] ID_EX_Bus_Reg;

reg clint_second_inst;
always @(posedge clock) begin
    if(reset) begin
        ID_EX_Bus_Reg <= `ysyx_050228_ID_EX_Bus'd0;
        clint_second_inst <= 1'd0;
    end
    else if(stop_all|div_stop) begin
        
    end
    else if(clint_jump_en) begin
        ID_EX_Bus_Reg <= `ysyx_050228_ID_EX_Bus'd0;
        clint_second_inst <= 1'd1;
    end
    else if(clint_second_inst ) begin
        ID_EX_Bus_Reg <= `ysyx_050228_ID_EX_Bus'd0;
        clint_second_inst <= 1'd0;        
    end
    else begin
        ID_EX_Bus_Reg <= ID_EX_Bus;
    end
end
wire inst_ebreak;
wire [2:0] inst_Src1_Select;
wire [3:0] inst_Src2_Select;
wire mul_div_valid;
wire [2:0] inst_result_Select;
wire ID_we;
wire IF_we;
wire [4:0] ID_addr;
wire [63:0] ID_result;
wire [31:0] inst;
wire [31:0] inst_addr;
wire [63:0] Inst_Src2_forwarding,Inst_Src1_forwarding;
wire inst_lwu,inst_sh, inst_sd,inst_sw,inst_ld,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb,inst_sb;
wire [10:0] mem_OneHot;
wire [13:0] alu_OneHOt;
wire [12:0] mul_ysyx_050228_DIV_ONeHot;
wire valid;

assign {inst_fence_i,valid,mul_ysyx_050228_DIV_ONeHot,alu_OneHOt,mem_OneHot,inst_ebreak,IF_we,inst_addr,inst,ID_result,ID_addr,ID_we,inst_result_Select,inst_Src1_Select,inst_Src2_Select,Inst_Src2_forwarding,Inst_Src1_forwarding}=ID_EX_Bus_Reg;
assign {inst_lwu,inst_sh, inst_sd,inst_sw,inst_ld,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb,inst_sb} = mem_OneHot;
wire [63:0] alu_result;
wire [63:0] alu_src1,alu_src2;
wire [63:0] final_result;
assign alu_src1 =     inst_Src1_Select[0] ? {32'd0,inst_addr} :
                      inst_Src1_Select[1] ? Inst_Src1_forwarding : 
                      inst_Src1_Select[2] ? {32'b0,Inst_Src1_forwarding[31:0]}:64'd0;
assign alu_src2 =     inst_Src2_Select[0] ? {{32{inst[31]}},inst[31:12],12'b0} :
                      inst_Src2_Select[1] ? {{52{inst[31]}},inst[31:20]}:
                      inst_Src2_Select[2] ? {{52{inst[31]}},inst[31:25], inst[11:7]} :
                      inst_Src2_Select[3] ? Inst_Src2_forwarding :64'd0;


reg [7:0] lb_sb_be;
reg [7:0] lh_sh_be;
reg [7:0] lw_sw_be;
always @(*) begin
    case(alu_result[2:0])
        3'b000:  lb_sb_be = 8'b00000001;
        3'b001:  lb_sb_be = 8'b00000010;
        3'b010:  lb_sb_be = 8'b00000100;
        3'b011:  lb_sb_be = 8'b00001000;
        3'b100:  lb_sb_be = 8'b00010000;
        3'b101:  lb_sb_be = 8'b00100000;
        3'b110:  lb_sb_be = 8'b01000000;
        3'b111:  lb_sb_be = 8'b10000000;
        default:  lb_sb_be = 8'b00000000;
    endcase

    case(alu_result[2:0])
        3'b000:  lh_sh_be = 8'b00000011;
        3'b001:  lh_sh_be = 8'b00000011;
        3'b010:  lh_sh_be = 8'b00001100;
        3'b011:  lh_sh_be = 8'b00001100;
        3'b100:  lh_sh_be = 8'b00110000;
        3'b101:  lh_sh_be = 8'b00110000;
        3'b110:  lh_sh_be = 8'b11000000;
        3'b111:  lh_sh_be = 8'b11000000;
        default:  lh_sh_be = 8'b00000000;
    endcase

    case(alu_result[2:0])
        3'b000:  lw_sw_be = 8'b00001111;
        3'b001:  lw_sw_be = 8'b00001111;
        3'b010:  lw_sw_be = 8'b00001111;
        3'b011:  lw_sw_be = 8'b00001111;
        3'b100:  lw_sw_be = 8'b11110000;
        3'b101:  lw_sw_be = 8'b11110000;
        3'b110:  lw_sw_be = 8'b11110000;
        3'b111:  lw_sw_be = 8'b11110000;
        default:  lw_sw_be = 8'b00000000;
    endcase
end
assign ext_ram_addr[2:0] =  3'd0;
                            // inst_ld|inst_sd ?3'b0:
                            // inst_lh |inst_lhu |inst_sh ?{alu_result[2:1],1'b0}:
                            // inst_lwu|inst_lw  |inst_sw ?{alu_result[2],2'b0}:
                            // alu_result[2:0];
assign ext_ram_addr[31:3] = alu_result[31:3];


assign ext_ram_write_data = Inst_Src2_forwarding;
assign ext_ram_wen = inst_sw|inst_sb|inst_sh|inst_sd;
assign ext_ram_be_n = inst_ld |inst_sd ?8'b11111111:
                      inst_lwu|inst_lw |inst_sw ?lw_sw_be:
                      inst_lh |inst_lhu |inst_sh ?lh_sh_be:
                      inst_lb |inst_lbu |inst_sb ?lb_sb_be:
                      8'b00000000;
ysyx_050228_alu ysyx_050228_alu_1(
    .alu_control(alu_OneHOt),
    .alu_src1(alu_src1),
    .alu_src2(alu_src2),
    .alu_result(alu_result)
);
//wire mul_div_valid;
wire [63:0] mul_div_result;
ysyx_050228_mdu ysyx_050228_mdu(
    .clock(clock),
    .reset(reset),

    .mul_ysyx_050228_DIV_ONeHot(mul_ysyx_050228_DIV_ONeHot),
    .src1(Inst_Src1_forwarding),
    .src2(Inst_Src2_forwarding),
    
    .div_valid(div_valid),
    .mul_div_valid(mul_div_valid),
    .result(mul_div_result)
);
// verilator lint_on WIDTH
assign final_result = ID_addr == 5'd0 ? 0:
		            IF_we ?ID_result :
                    mul_div_valid ? mul_div_result :
                    inst_result_Select[0]?alu_result:
                    inst_result_Select[2]?{{32{alu_result[31]}},alu_result[31:0]}:
                    64'h00000000ffffffff;  //means error

assign  EX_ID_Bus= {ID_we,ID_addr,final_result};
assign  EX_MEM_Bus = {valid,mem_OneHot,inst_addr,inst_ebreak,ID_we,ID_addr,final_result};
endmodule

module ysyx_050228_find_index(

    input [15:0] data,
    output [3:0] index/* verilator split_var */
);


wire [7:0] data_8 /* verilator split_var */;
wire [3:0] data_4 /* verilator split_var */;
wire [1:0] data_2 /* verilator split_var */;

assign index[3] =  |data[15:8];
assign data_8= index[3] ?  data[15:8] :data[7:0]  ;
assign index[2] =  |data_8[7:4];
assign data_4= index[2] ? data_8[7:4] : data_8[3:0] ;
assign index[1] =  |data_4[3:2];
assign data_2 = index[1] ? data_4[3:2] : data_4[1:0];
assign index[0] = data_2[1];

endmodule

module ysyx_050228_Icache
(
    input clock,
    input reset,

    input icache_valid,
    input [127:0] inst_in_replace_data,
    input [31:0] inst_addr,
    input inst_en,
    //input data_in_ready,
    input dcache_busy,
    input icache_ready,
    output [31:0] inst_read_addr,
    output inst_read_req,
    output [31:0] inst_out_data,

    output [5:0]    io_sram0_addr ,
    output          io_sram0_cen ,
    output          io_sram0_wen ,
    output [127:0]  io_sram0_wmask ,
    output [127:0]  io_sram0_wdata ,
    input [127:0]   io_sram0_rdata ,
    output [5:0]    io_sram1_addr ,
    output          io_sram1_cen ,
    output          io_sram1_wen ,
    output [127:0]  io_sram1_wmask ,
    output [127:0]  io_sram1_wdata ,
    input [127:0]   io_sram1_rdata ,
    output [5:0]    io_sram2_addr ,
    output          io_sram2_cen ,
    output          io_sram2_wen ,
    output [127:0]  io_sram2_wmask ,
    output [127:0]  io_sram2_wdata ,
    input [127:0]   io_sram2_rdata ,
    output [5:0]    io_sram3_addr ,
    output          io_sram3_cen ,
    output          io_sram3_wen ,
    output [127:0]  io_sram3_wmask ,
    output [127:0]  io_sram3_wdata ,
    input [127:0]   io_sram3_rdata
);

wire hit_way0;
wire hit_way1;
reg [20:0] tag_way0 [63:0]   ;         //total 16 index  therefore ,22 bits tag
reg [20:0] tag_way1 [63:0]   ;   
reg [63:0] lru;
reg [1:0] icache_state;
reg [6:0] offset_addr;
reg [31:0] read_when_write_data;
reg ram_wen;
reg select_from_write_data;

reg [31:0] inst_addr_pre;
wire [31:0] inst_addr_sel;
wire [5:0] index_inst;
assign inst_addr_sel = icache_state == 2'd1|dcache_busy ?inst_addr_pre : inst_addr;
wire [2:0] offset_inst;
wire [20:0] tag_inst;
wire [1:0] take_up_2_bits;
assign {tag_inst,index_inst,offset_inst,take_up_2_bits} = inst_addr_sel;
//generated by script

assign hit_way0 = tag_way0[index_inst] == tag_inst;
assign hit_way1 = tag_way1[index_inst] == tag_inst;

assign inst_read_req = (~hit_way1 && ~hit_way0) && inst_en;
assign inst_read_addr = {tag_inst,index_inst,5'd0};

//The following is the replacement algorithm


always @(posedge clock) begin
    if(reset) begin
        for(int j=0;j<64;j=j+1) begin
            tag_way0[j] <= 21'd0;
            tag_way1[j] <= 21'd0;
        end
        lru <= 64'd0;
        icache_state <= 2'd0;
        inst_addr_pre <= 32'd0;
        offset_addr <= 7'd0;
        ram_wen <= 1'd0;
        read_when_write_data <= 32'd0;
        select_from_write_data <= 1'd0;
    end
    else if(icache_state == 2'd1 && icache_valid) begin
        offset_addr <= offset_addr +7'd1;
        if(icache_ready) begin
            icache_state <= 2'd0;
            ram_wen <= 1'd0;
            select_from_write_data <= 1'd1;
            if(lru[index_inst]) begin  //recently use way0
                tag_way1[index_inst] <= tag_inst;  
            end
            else begin
                tag_way0[index_inst] <= tag_inst;  
            end
        end
        if(offset_addr[5:0] == {index_inst[4:0],offset_inst[2]}) begin
            read_when_write_data <= inst_in_replace_data[32*({5'd0,inst_addr_sel[3:2]} + 1)-1-:32];
        end
    end
    else if(dcache_busy)begin 
    end
    else if(icache_state == 2'd0) begin //ready state
        if(inst_read_req)begin   //there should be a not busy
            icache_state <= 2'd1; // wait state
            inst_addr_pre <= inst_addr;
            offset_addr <= {index_inst,1'd0};
            ram_wen <= 1'd1;
        end
        else begin
            select_from_write_data <= 1'd0;
            lru[index_inst] <= hit_way0|hit_way1 ? hit_way0 : lru[index_inst] ;
            ram_wen <= 1'd0;
            inst_addr_pre <= inst_addr;
        end
    end
end
wire [127:0] bit_mask;
assign bit_mask = 128'h0; // low valid
wire [3:0] icahce_store_wen; // low valid
reg select_from_way0_high;
reg select_from_way1_high;
reg select_from_way0_low;
reg select_from_way1_low;
reg [1:0] inst_addr_sel_reg;
always @(posedge clock) begin
    if(reset) begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd0;
    end
    else if(hit_way0 && ~index_inst[5])begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd1;
        select_from_way1_low <= 1'd0;
    end
    else if(hit_way0 && index_inst[5])begin
        select_from_way0_high <= 1'd1;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd0;
    end
        else if(hit_way1 && ~index_inst[5])begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd0;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd1;
    end
    else if(hit_way1 && index_inst[5])begin
        select_from_way0_high <= 1'd0;
        select_from_way1_high <= 1'd1;
        select_from_way0_low <= 1'd0;
        select_from_way1_low <= 1'd0;
    end
end
always @(posedge clock) begin
    if(reset) begin
        inst_addr_sel_reg <= 2'd0;
    end
    else begin
        inst_addr_sel_reg <= inst_addr_sel[3:2];
    end
end
assign inst_out_data =  select_from_write_data ? read_when_write_data :
                        select_from_way0_low?
                                inst_addr_sel_reg == 2'b00 ? io_sram0_rdata[31:0]:
                                inst_addr_sel_reg == 2'b01 ? io_sram0_rdata[63:32]:
                                inst_addr_sel_reg == 2'b10 ? io_sram0_rdata[95:64]:
                                                              io_sram0_rdata[127:96]: 
                        select_from_way0_high?
                                inst_addr_sel_reg == 2'b00 ? io_sram1_rdata[31:0]:
                                inst_addr_sel_reg == 2'b01 ? io_sram1_rdata[63:32]:
                                inst_addr_sel_reg == 2'b10 ? io_sram1_rdata[95:64]:
                                                              io_sram1_rdata[127:96]:
                        select_from_way1_low?
                                inst_addr_sel_reg == 2'b00 ? io_sram2_rdata[31:0]:
                                inst_addr_sel_reg == 2'b01 ? io_sram2_rdata[63:32]:
                                inst_addr_sel_reg == 2'b10 ? io_sram2_rdata[95:64]:
                                                              io_sram2_rdata[127:96]:
                        select_from_way1_high?
                                inst_addr_sel_reg == 2'b00 ? io_sram3_rdata[31:0]:
                                inst_addr_sel_reg == 2'b01 ? io_sram3_rdata[63:32]:
                                inst_addr_sel_reg == 2'b10 ? io_sram3_rdata[95:64]:
                                                              io_sram3_rdata[127:96]:
                                                              32'd0;
wire [5:0] read_addr;
assign read_addr = ram_wen ?offset_addr[5:0]: {index_inst[4:0],offset_inst[2]};
assign icahce_store_wen =   ~ram_wen?4'b1111: 
                            ~lru[index_inst] && offset_addr[6] == 1'd0 ? 4'b1110:  //way 0 && ram low
                            ~lru[index_inst] && offset_addr[6] == 1'd1 ? 4'b1101:  //way 0 && ram high
                            lru[index_inst] && offset_addr[6] == 1'd0 ? 4'b1011:  //way 1 && ram low
                            lru[index_inst] && offset_addr[6] == 1'd1 ? 4'b0111:  //way 1 && ram high         
                            4'b1111;                  

assign io_sram0_addr = read_addr;
assign io_sram0_cen = 1'b0;
assign io_sram0_wen = icahce_store_wen[0];
assign io_sram0_wmask = bit_mask;
assign io_sram0_wdata = inst_in_replace_data;

assign io_sram1_addr = read_addr;
assign io_sram1_cen = 1'b0;
assign io_sram1_wen = icahce_store_wen[1];
assign io_sram1_wmask = bit_mask;
assign io_sram1_wdata = inst_in_replace_data;

assign io_sram2_addr = read_addr;
assign io_sram2_cen = 1'b0;
assign io_sram2_wen = icahce_store_wen[2];
assign io_sram2_wmask = bit_mask;
assign io_sram2_wdata = inst_in_replace_data;

assign io_sram3_addr = read_addr;
assign io_sram3_cen = 1'b0;
assign io_sram3_wen = icahce_store_wen[3];
assign io_sram3_wmask = bit_mask;
assign io_sram3_wdata = inst_in_replace_data;

endmodule


module ysyx_050228_ID(
    input wire clock,
    input wire reset,

    //debug
    //output [31:0] debug_inst_addr,
    output clint_jump_en,
    input mmio_mtimecmp_en,
    input int_time,
    input stop_all,
    input [31:0] inst_in,
    input div_stop,
    input wire [`ysyx_050228_IF_ID_Bus-1:0] IF2_ID_Bus,
    input wire [`ysyx_050228_EX_ID_Bus-1:0] EX_ID_Bus,
    input wire [`ysyx_050228_MEM_ID_Bus-1:0] MEM_ID_Bus,

    output [`ysyx_050228_ID_IF_Bus-1:0] ID_IF_Bus,
    output pause_mem,
    output pause_div_ID,
    output wire [`ysyx_050228_ID_EX_Bus-1:0] ID_EX_Bus
);
//assign debug_inst_addr = inst_addr;

//there use read data not the data selected because when you need to mem,not pause the ex stage

wire [63:0] Inst_Src1_Read,Inst_Src2_Read; 
wire [63:0] csr_result;
wire [4:0] EX_addr,MEM_addr,IF_addr;
wire [63:0] EX_data,MEM_data,IF_data;
wire MEM_we,EX_we,IF_we;
assign {EX_we,EX_addr,EX_data} = EX_ID_Bus;
assign {MEM_we,MEM_addr,MEM_data} = MEM_ID_Bus;
reg  [`ysyx_050228_IF_ID_Bus-1:0] IF_ID_Bus_Reg;
wire valid;
reg mem_arrive_flag,jump_arrive_flag,clint_flag;
wire jump_en;
always @(posedge clock) begin
    if(reset) begin
        IF_ID_Bus_Reg <= `ysyx_050228_IF_ID_Bus'd0;
        mem_arrive_flag <=1'd0;
        jump_arrive_flag <= 1'd0;
        clint_flag <= 1'd0;
    end
    else if(stop_all|div_stop)begin
    end
    else if(pause_mem|pause_div_ID)begin
        IF_ID_Bus_Reg <= IF2_ID_Bus;
        mem_arrive_flag <= 1'd1;
        jump_arrive_flag <= 1'd0;
        clint_flag <= 1'd0;
    end
    else if(jump_en) begin
        mem_arrive_flag <= 1'd0;
        jump_arrive_flag <= 1'd1;
        IF_ID_Bus_Reg <= `ysyx_050228_IF_ID_Bus'd0;
        clint_flag <= 1'd0;
    end
    else if(clint_flag) begin
        clint_flag <= 1'd0;
        IF_ID_Bus_Reg <= IF2_ID_Bus;
        jump_arrive_flag <= 1'd0;
        mem_arrive_flag <= 1'd0;
    end
    else if(clint_jump_en) begin
        clint_flag <= 1'd1;
        jump_arrive_flag <= 1'd0;
        IF_ID_Bus_Reg <= IF2_ID_Bus;
    end
    else begin
        jump_arrive_flag <= 1'd0;
        IF_ID_Bus_Reg <= IF2_ID_Bus;
        mem_arrive_flag <= 1'd0;
        clint_flag <= 1'd0;
    end
end
wire [31:0] inst_addr;
assign {inst_addr} = mem_arrive_flag|stop_all|jump_arrive_flag|div_stop ? `ysyx_050228_IF_ID_Bus'd0: IF_ID_Bus_Reg;  //not wrong  .please read clearly
wire [31:0] inst;
assign valid = |inst_addr;
assign inst = mem_arrive_flag|stop_all|jump_arrive_flag|div_stop|clint_flag ? 32'd0: inst_in;
wire ID_we;
wire [4:0] ID_addr;



wire[4:0] dest_addr;
wire [4:0] src1_addr;
wire [4:0] src2_addr;
wire [2:0] func3;
wire [6:0] opcode,func7;
wire [4:0] zimm;
assign opcode = inst[6:0];
assign dest_addr = inst[11:7];
assign func3 = inst[14:12];
assign src1_addr = inst[19:15];
assign src2_addr = inst[24:20];
assign func7 = inst[31:25];
assign zimm = inst[19:15];

wire [63:0] ID_result;
wire inst_auipc, inst_addi,inst_ebreak,inst_addiw,inst_addw,inst_add,inst_subw;
wire inst_lwu,inst_sh, inst_sb,inst_sd,inst_sw,inst_ld,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb;
wire inst_sub,inst_srli,inst_sllw,inst_slli,inst_sltiu,inst_srai,inst_sltu,
        inst_slt,inst_slliw,inst_sraiw,inst_sraw,inst_srliw,inst_srlw,
        inst_sll,inst_srl,inst_sra,inst_xor,inst_slti;
wire inst_or,inst_xori,inst_and,inst_andi,inst_lui,inst_ori;
wire inst_mulw,inst_divw,inst_remw,inst_mul,inst_divuw,inst_remuw,inst_div,inst_divu,inst_rem,inst_remu,inst_mulh,inst_mulhsu,inst_mulhu;
wire inst_csrrs,inst_csrrw,inst_mret,inst_ecall,inst_csrrc,inst_csrrsi,inst_csrrci,inst_csrrwi;
wire inst_fence_i;
assign inst_ecall = inst == 32'b0000000_00000_00000_000_00000_1110011;
assign inst_mret = inst == 32'b0011000_00010_00000_000_00000_1110011;
assign inst_csrrs = opcode == 7'b1110011 && func3 == 3'b010;
assign inst_csrrw = opcode == 7'b1110011 && func3 == 3'b001;
assign inst_csrrc = opcode == 7'b1110011 && func3 == 3'b011;
assign inst_csrrsi = opcode ==7'b1110011 && func3 == 3'b110;
assign inst_csrrci = opcode ==7'b1110011 && func3 == 3'b111;
assign inst_csrrwi = opcode ==7'b1110011 && func3 == 3'b101;

assign inst_ori = opcode == 7'b0010011 && func3 == 3'b110;
assign inst_mulh = opcode == 7'b0110011 && func3 == 3'b001 && func7 == 7'b0000001;
assign inst_mulhsu = opcode == 7'b0110011 && func3 == 3'b010 && func7 == 7'b0000001;
assign inst_mulhu = opcode == 7'b0110011 && func3 == 3'b011 && func7 ==  7'b0000001;
assign inst_remu = opcode == 7'b0110011 && func3 == 3'b111 && func7 == 7'b0000001;
assign inst_remw = opcode == 7'b0111011 && func3 == 3'b110 && func7 == 7'b0000001;
assign inst_rem = opcode == 7'b0110011 && func3 == 3'b110 && func7 == 7'b0000001;
assign inst_remuw = opcode == 7'b0111011 && func3 == 3'b111 && func7 == 7'b0000001;
assign inst_divuw = opcode == 7'b0111011 && func3 == 3'b101 && func7 == 7'b0000001;
assign inst_divw = opcode == 7'b0111011 &&func3 ==3'b100 && func7 == 7'b0000001;
assign inst_divu = opcode == 7'b0110011 && func3 == 3'b101 && func7 == 7'b0000001;
assign inst_div = opcode == 7'b0110011 && func3 == 3'b100 && func7 == 7'b0000001;

assign inst_srl = opcode == 7'b0110011 && func3 == 3'b101 && func7 == 7'b0000000;
assign inst_sra = opcode == 7'b0110011 && func3 == 3'b101 && func7 == 7'b0100000;
assign inst_xor = opcode == 7'b0110011 && func3 == 3'b100 && func7 == 7'b0000000;
assign inst_slti = opcode == 7'b0010011 && func3 == 3'b010;
assign inst_sll = opcode == 7'b0110011 && func3 == 3'b001 && func7 == 7'b0000000;

assign inst_lui = opcode == 7'b0110111;
assign inst_mul = opcode == 7'b0110011 && func3 == 3'b000 && func7 == 7'b0000001;
assign inst_sraw = opcode == 7'b0111011 && func3 == 3'b101 && func7 == 7'b0100000;
assign inst_srliw = opcode == 7'b0011011 && func3 == 3'b101 && func7[6:1] == 6'b000000;
assign inst_srlw = opcode == 7'b0111011 && func3 == 3'b101 && func7 == 7'b0000000;
assign inst_slliw = opcode == 7'b0011011 && func3 == 3'b001 && func7[6:1] == 6'b000000;
assign inst_sraiw = opcode == 7'b0011011 && func3 == 3'b101 && func7[6:1] == 6'b010000;
assign inst_slt = opcode == 7'b0110011 && func3 == 3'b010 && func7 == 7'b0000000;

assign inst_subw = opcode == 7'b0111011 && func3 == 3'b000 &&func7 == 7'b0100000;

assign inst_mulw = opcode == 7'b0111011 &&func3 ==3'b000 && func7 == 7'b0000001;
assign inst_and = opcode == 7'b0110011 && func3 == 3'b111 && func7 == 7'b0000000;
assign inst_andi = opcode == 7'b0010011 && func3 == 3'b111;
assign inst_sltu = opcode == 7'b0110011 && func3 == 3'b011 && func7 == 7'b0000000;
assign inst_srai = opcode == 7'b0010011 && func3 == 3'b101 && func7[6:1] == 6'b010000;
assign inst_add = opcode == 7'b0110011 && func3 == 3'b000 && func7 == 7'b0000000; 
assign inst_addw = opcode == 7'b0111011 && func3 == 3'b000 && func7 == 7'b0000000;
assign inst_lb = opcode == 7'b0000011 &&func3 == 3'b000;
assign inst_sltiu = opcode == 7'b0010011 && func3 == 3'b011;
assign inst_sub = opcode == 7'b0110011 && func3 == 3'b000 && func7 == 7'b0100000;
assign inst_srli = opcode == 7'b0010011 && func3 == 3'b101 && func7[6:1] == 6'b000000; //func7 when the is func7[0] is zeros will the inst works
assign inst_sllw = opcode == 7'b0111011 && func3 == 3'b001 && func7 == 7'b0000000; 
assign inst_slli = opcode == 7'b0010011 && func3 ==3'b001 && func7[6:1] == 6'b000000;
assign inst_sh = opcode == 7'b0100011 && func3 == 3'b001;
assign inst_sd = opcode == 7'b0100011 && func3 == 3'b011;
assign inst_sw = opcode == 7'b0100011 && func3 == 3'b010;
assign inst_or = opcode == 7'b0110011 && func3 == 3'b110 && func7 == 7'b0000000;
assign inst_xori = opcode == 7'b0010011 && func3 == 3'b100;
assign inst_lw = opcode == 7'b0000011 && func3 == 3'b010;
assign inst_lhu = opcode == 7'b0000011 && func3 == 3'b101;
assign inst_lh = opcode == 7'b0000011 && func3 ==3'b001;
assign inst_ld = opcode == 7'b0000011 && func3 == 3'b011;
assign inst_lbu = opcode == 7'b0000011 && func3 == 3'b100;
assign inst_sb =  opcode == 7'b0100011 && func3 == 3'b000;
assign inst_lwu = opcode == 7'b0000011 && func3 == 3'b110;
assign inst_auipc = opcode == 7'b0010111;
assign inst_addi = opcode == 7'b0010011 && func3 == 3'b000;
assign inst_addiw = opcode == 7'b0011011 && func3 == 3'b000;
assign inst_ebreak = inst==32'h00100073;

assign inst_fence_i = inst == 32'b00000000000000000001000000001111;
wire [2:0] inst_Src1_Select;
wire [3:0] inst_Src2_Select;
wire [2:0] inst_result_Select;
wire [10:0] mem_OneHot;
wire [13:0] alu_OneHOt;
wire [12:0] mul_ysyx_050228_DIV_ONeHot;
wire [7:0] csr_OneHot;
assign mem_OneHot={inst_lwu,inst_sh, inst_sd,inst_sw,inst_ld,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb,inst_sb};


assign inst_Src1_Select = inst_auipc?3'b001:
                            inst_sll|inst_srl|inst_sra|inst_xor|inst_slti|inst_slt|inst_subw|inst_and |inst_andi|inst_sltu|inst_add|inst_addi|inst_sd|inst_addiw|inst_ld|inst_lw|inst_lhu|inst_lh|inst_lbu|inst_lb|inst_sh|inst_sw|inst_sd|inst_sb|
                            inst_ori|inst_slliw|inst_srai|inst_sub|inst_srli|inst_sllw|inst_slli|inst_sltiu|inst_or|inst_xori|inst_lwu|inst_addw ?3'b010:
                            inst_sraiw |inst_sraw|inst_srlw|inst_srliw?3'b100:3'b000;

assign inst_Src2_Select = inst_lui|inst_auipc ? 4'b0001:
                            inst_ori|inst_slti|inst_slliw|inst_andi|inst_addi|inst_addiw|inst_srli|inst_slli|inst_sltiu |inst_ld|inst_lw|inst_lhu|inst_lh|
                            inst_sraiw|inst_srliw|inst_srai|inst_lbu|inst_lb|inst_xori|inst_lwu? 4'b0010:  //i_type
                            inst_sd |inst_sh|inst_sb|inst_sw? 4'b0100:   //s_type
                            inst_sll|inst_srl|inst_sra|inst_xor|inst_sraw|inst_srlw|inst_slt|inst_subw|inst_and|inst_sltu|inst_add|inst_sub|inst_sllw|inst_or|inst_addw? 4'b1000:4'b0000;

 
assign inst_result_Select = inst_ori|inst_sll|inst_srl|inst_sra|inst_xor|inst_slti|inst_lui|inst_slt|inst_and|inst_andi|inst_sltu|inst_srai|inst_auipc|inst_addi| inst_sub |inst_srli|inst_slli|inst_sltiu|inst_or|inst_xori|inst_add?3'b001:    //not turned
                            inst_sraiw |inst_sraw|inst_srlw|inst_srliw|inst_slliw|inst_subw|inst_sllw|inst_addiw|inst_addw?3'b100:3'b000;  //signed 32bit

wire op_add, op_sub, op_slt, op_sltu,op_and, op_or, op_xor,op_sll, op_srl, op_sra, op_lui,op_sraw,op_sllw,op_srlw;
assign op_add = inst_auipc|inst_addi|inst_addiw|inst_sd|inst_ld|inst_lwu|inst_sw|inst_lw| inst_lhu|inst_lh|inst_lbu|
                            inst_lb|inst_sb|inst_sh|inst_addw|inst_add;
assign op_sub = inst_sub|inst_subw;
assign op_sll = inst_slli|inst_sll;
assign op_or = inst_or|inst_ori;
assign op_xor = inst_xori|inst_xor;
assign op_srl = inst_srli|inst_srl;
assign op_slt = inst_slt|inst_slti;
assign op_sltu = inst_sltiu|inst_sltu;
assign op_sra = inst_srai|inst_sra;
assign op_and = inst_and|inst_andi;
assign op_lui = inst_lui;
assign op_sllw = inst_sllw|inst_slliw;
assign op_srlw = inst_srlw|inst_srliw;
assign op_sraw = inst_sraiw|inst_sraw;
//opOneHot is not defined
    
assign ID_we = inst_ori|inst_sll|inst_srl|inst_sra|inst_xor|inst_slti|inst_lui|inst_mul|inst_sraiw |inst_sraw|inst_srlw|inst_srliw|inst_slt|
inst_slliw|inst_remw|inst_subw|inst_divw|inst_mulw|inst_and|inst_andi|inst_sltu|inst_srai|inst_auipc | inst_addi|IF_we|inst_addiw|
inst_lwu|inst_ld|inst_lw|inst_lhu|inst_lh|inst_lbu|inst_lb|inst_sub|inst_srli|inst_sllw|inst_slli|inst_sltiu|inst_or|inst_xori|
inst_addw|inst_add|inst_divuw|inst_remuw|inst_div|inst_divu|inst_rem|inst_remu|inst_mulh|inst_mulhsu|inst_mulhu;
assign ID_result = IF_data;
assign ID_addr = IF_we ?IF_addr:dest_addr;

wire [63:0] Inst_Src1_forwarding,Inst_Src2_forwarding;	
//regfile
ysyx_050228_regfile ysyx_050228_regesiterfile(
    .clock(clock),
    .reset(reset),
    .dpra1(src1_addr),
    .dpo1(Inst_Src1_Read),
    .dpra2(src2_addr),
    .dpo2(Inst_Src2_Read),
    .we(MEM_we),
    .a(MEM_addr),
    .d(MEM_data)
);
ysyx_050228_csr ysyx_050228_csr(
    .clock(clock),
    .reset(reset),
    .int_time(int_time),
    .inst(inst),
    .pause_mem(pause_mem),
    .mem_arrive_flag(mem_arrive_flag),
    .clear_mip(mmio_mtimecmp_en),
    .pc(inst_addr),
    .zimm(zimm),
    .src1(Inst_Src1_forwarding),
    .csr_num(inst[31:20]),
    .csr_OneHot(csr_OneHot),

    .clint_jump_en(clint_jump_en),
    .csr_result(csr_result)

);
//Data forwarding


assign Inst_Src1_forwarding = 
(EX_we & (EX_addr == src1_addr)) ? EX_data :
                                 (MEM_we & (MEM_addr == src1_addr)) ? MEM_data :
                    
                                                    Inst_Src1_Read;
assign Inst_Src2_forwarding = 
(EX_we & (EX_addr == src2_addr)) ? EX_data :
                                 (MEM_we & (MEM_addr == src2_addr)) ? MEM_data :
                                                    Inst_Src2_Read;



wire [31:0] inst_addr_next,jump_addr_next_jal,jump_addr_next_jalr,jump_addr_next_beq,jump_addr_next_bltu,
    jump_addr_next_bne,jump_addr_next_blt,jump_addr_next_bge,jump_addr_next_bgeu;


    wire [20:0] j_type_imm;
    wire [12:0] b_type_imm;
    wire inst_jal,inst_jalr,inst_bne,inst_beq,inst_blt,inst_bge,inst_bgeu,inst_bltu;
    assign j_type_imm = {inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
    assign b_type_imm = {inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
    assign inst_bgeu = inst[6:0] == 7'b1100011 && inst[14:12] == 3'b111;
    assign inst_jal = inst[6:0] == 7'b1101111;
    assign inst_jalr = inst[6:0] == 7'b1100111 && func3 == 3'b000;
    assign inst_bne = inst[6:0] == 7'b1100011 && inst[14:12] == 3'b001;
    assign inst_beq = inst[6:0] == 7'b1100011 && inst[14:12] == 3'b000;
    assign inst_blt = inst[6:0] == 7'b1100011 && inst[14:12] == 3'b100;
    assign inst_bge = inst[6:0] == 7'b1100011 && inst[14:12] == 3'b101;
    assign inst_bltu = inst[6:0] == 7'b1100011 && inst[14:12] == 3'b110;
    
    assign jump_addr_next_bltu = Inst_Src1_forwarding <Inst_Src2_forwarding ?inst_addr + {{19{b_type_imm[12]}},b_type_imm}: inst_addr +32'd4;
    assign jump_addr_next_bgeu = Inst_Src1_forwarding>= Inst_Src2_forwarding?inst_addr + {{19{b_type_imm[12]}},b_type_imm}: inst_addr +32'd4;
    assign jump_addr_next_bge =  (Inst_Src1_forwarding[63] == 0 && Inst_Src2_forwarding[63] == 1)| (~(Inst_Src1_forwarding[63]  ^ Inst_Src2_forwarding[63]) && Inst_Src1_forwarding>=Inst_Src2_forwarding) ?
                                inst_addr + {{19{b_type_imm[12]}},b_type_imm}: inst_addr +32'd4;

    assign jump_addr_next_blt = (Inst_Src1_forwarding[63] == 1 && Inst_Src2_forwarding[63] == 0)| (~(Inst_Src1_forwarding[63]  ^ Inst_Src2_forwarding[63] ) && Inst_Src1_forwarding<Inst_Src2_forwarding)?
                                inst_addr + {{19{b_type_imm[12]}},b_type_imm}: inst_addr +32'd4;

    assign jump_addr_next_beq = Inst_Src1_forwarding == Inst_Src2_forwarding? inst_addr + {{19{b_type_imm[12]}},b_type_imm} : inst_addr +32'd4;
    assign jump_addr_next_jal = inst_addr + {{11{j_type_imm[20]}},j_type_imm};
    assign jump_addr_next_jalr = Inst_Src1_forwarding[31:0] + {{20{inst[31]}},inst[31:20]};
    assign jump_addr_next_bne = Inst_Src1_forwarding != Inst_Src2_forwarding? inst_addr + {{19{b_type_imm[12]}},b_type_imm} : inst_addr +32'd4;
    assign inst_addr_next = 
                inst_mret |inst_ecall|clint_jump_en? csr_result[31:0]:
                inst_jal ?jump_addr_next_jal :
				inst_bltu ? jump_addr_next_bltu :
                inst_bne ? jump_addr_next_bne :
                inst_beq ? jump_addr_next_beq :
                inst_bge ? jump_addr_next_bge :
                inst_blt ? jump_addr_next_blt :
                inst_bgeu ? jump_addr_next_bgeu:
				inst_jalr?{jump_addr_next_jalr[31:1],1'b0}:
				inst_addr+ 32'h4;
    assign IF_we = inst_jal |inst_jalr |inst_csrrs|inst_csrrw|inst_csrrc|inst_csrrci|inst_csrrsi|inst_csrrwi;
    assign IF_data =    inst_jal |inst_jalr                                         ?{32'd0,inst_addr +32'h4}:
                        inst_csrrs|inst_csrrw|inst_csrrc|inst_csrrci|inst_csrrsi|inst_csrrwi    ?csr_result :
                        64'd0;
    assign IF_addr = inst[11:7];

assign jump_en =inst_ecall|inst_mret|inst_jal|inst_jalr|inst_bne|inst_beq|inst_blt|inst_bge|inst_bgeu|inst_bltu;
assign ID_IF_Bus = {jump_en|clint_jump_en,inst_addr_next};
assign mul_ysyx_050228_DIV_ONeHot = {inst_mulh,inst_mulhsu,inst_mulhu,inst_rem,inst_remu,inst_div,inst_divu,inst_remuw,inst_divuw,inst_mul,inst_remw,inst_divw,inst_mulw} ;
assign csr_OneHot = {inst_csrrs,inst_csrrw,inst_mret,inst_ecall,inst_csrrc,inst_csrrsi,inst_csrrci,inst_csrrwi};
assign alu_OneHOt = {op_add, op_sub, op_slt, op_sltu,op_and, op_or, op_xor,op_sll, op_srl, op_sra, op_lui,op_sraw,op_sllw,op_srlw};
assign ID_EX_Bus = {inst_fence_i,valid,mul_ysyx_050228_DIV_ONeHot,alu_OneHOt,mem_OneHot,inst_ebreak,IF_we,inst_addr,inst,ID_result,ID_addr,ID_we,inst_result_Select,inst_Src1_Select,inst_Src2_Select,Inst_Src2_forwarding,Inst_Src1_forwarding};
assign pause_mem = |mem_OneHot;//inst_ld|inst_lw|inst_lhu|inst_lh|inst_lbu|inst_lwu|inst_lb; //for the convience of the icache fetch operation
assign pause_div_ID = inst_div|inst_divw|inst_divu|inst_divuw|inst_rem|inst_remw|inst_remu|inst_remuw|inst_fence_i;
endmodule


module ysyx_050228_IF(
    input clock,
    input reset,

    input stop_all,
    input pause_div_ID,
    input div_stop,
    input [`ysyx_050228_ID_IF_Bus-1:0] ID_IF_Bus,
    input pause_mem,
    output [`ysyx_050228_IF_ID_Bus-1:0] IF_ID_Bus
);
    reg [31:0] inst_addr;
    wire [31:0] inst_addr_next;
    wire [31:0] jump_next;
    wire jump_en;
    assign {jump_en,jump_next} = ID_IF_Bus;
    assign inst_addr_next = jump_en?jump_next:inst_addr+32'd4;

    always @(posedge clock) begin
        if(reset) begin
                inst_addr <= 32'h30000000;
        end
        else if(pause_mem|stop_all|pause_div_ID|div_stop)
        begin 
        end
        else begin
            inst_addr <= inst_addr_next;
        end
    end
	
    // always @(posedge clock) begin
	// if(reset) begin
	//     jalr_pause <=1'b0;
	// end
	// else if(inst_jalr && jalr_pause ==1'b0)begin
	//     jalr_pause <= 1'b1;
	// end
	// else
	//     jalr_pause <= 1'b0;
    // end
    assign IF_ID_Bus = {inst_addr};
endmodule


module ysyx_050228_mdu(
    input clock,
    input reset,

    input [12:0] mul_ysyx_050228_DIV_ONeHot,
    input [63:0] src1,
    input [63:0] src2,

    output  div_valid,
    output  mul_div_valid,
    output  [63:0] result
);
wire inst_mulh,inst_mulhsu,inst_mulhu,inst_rem,inst_remu,inst_div,inst_divu,inst_remuw,inst_divuw,inst_mul,inst_remw,inst_divw,inst_mulw;
assign {inst_mulh,inst_mulhsu,inst_mulhu,inst_rem,inst_remu,inst_div,inst_divu,inst_remuw,inst_divuw,inst_mul,inst_remw,inst_divw,inst_mulw} = mul_ysyx_050228_DIV_ONeHot;


wire [63:0] re_hi,re_lo;
wire [1:0] mul_signed;
assign mul_signed = inst_mulh|inst_mul|inst_mulw ? 2'b11:
                    inst_mulhsu ? 2'b01:2'b00;
//wire [63:0] mul_src1 = inst_mulh|inst_mul|inst_mulw|inst_mulhsu|inst_mulhu ?src1:64'd0 ;
//wire [63:0] mul_src2 = inst_mulh|inst_mul|inst_mulw|inst_mulhsu|inst_mulhu ?src2:64'd0 ;
ysyx_050228_mul ysyx_050228_mul(
    .src1(src1),
    .src2(src2),
    
    .mul_signed(mul_signed),  // bit 0 induce the src1 signed  1 is signed
    .re_hi(re_hi),
    .re_lo(re_lo)
);
wire div_sign;
assign div_sign = inst_rem|inst_remw |inst_divw|inst_div;
wire div_ready;
assign div_ready = inst_div|inst_divw|inst_divu|inst_divuw|inst_rem|inst_remw|inst_remu|inst_remuw;
wire shorten;
assign shorten = inst_remw|inst_remuw|inst_divw|inst_divuw;
wire [63:0] div_result /* verilator split_var */;
wire [63:0] rem_result /* verilator split_var */;
ysyx_050228_div ysyx_050228_div(
    .clock(clock),
    .reset(reset),

    .sign(div_sign),
    .div_data(src1),
    .dived_data(src2),
    .div_ready(div_ready),
    .shorten(shorten),
    
    .div_valid_o(div_valid),
    .result_hi(rem_result),
    .result_lo(div_result)

);
// always @(posedge clock) begin
//     if(inst_remw) begin
//         $display("%x %x",src1,src2);
//     end
// end
//verilator lint_off WIDTH
// assign mul_result = src2 * src1;
// assign mulh_result = $signed (src1) * $signed( src2);
// assign mulhsu_result = $signed (src1) * src2;
// assign mulw_result =  {{32{mul_result[31]}},mul_result[31:0]};

// assign rem_result = $signed (src1) % $signed (src2);
// assign remu_result = src1 % src2;
// wire [31:0] remw_32;
// assign remw_32 = $signed( src1[31:0] )% $signed (src2[31:0]);
// assign remw_result = {{32{remw_32[31]}},remw_32};
// wire [31:0] remuw_32;
// assign remuw_32 = (src1[31:0] %  src2[31:0]);
// assign remuw_result =  {{32{remuw_32[31]}},remuw_32};

// assign divu_result = src1 /src2;
// assign div_result = $signed(src1 )/ $signed(src2);

// wire [31:0] devidew_32;
// assign devidew_32 =  src1[31:0] / src2[31:0] ;
// assign divuw_result =  {{32{devidew_32[31]}},devidew_32};

// wire [31:0] devide_32 ; 
// assign devide_32 = $signed( src1[31:0]) / $signed (src2[31:0]) ;
// assign divw_result =  {{32{devide_32[31]}} , devide_32};  //

assign mul_div_valid = mul_ysyx_050228_DIV_ONeHot != 13'd0;

assign result =     
                    inst_mul  ? re_lo:
                    inst_mulh ? re_hi:
                    inst_mulhsu? re_hi:
                    inst_mulhu? re_hi :
                    inst_mulw ? {{32{re_lo[31]}},re_lo[31:0]}:
                    // inst_mul  ? mul_result[63:0]:
                    // inst_mulh ? mulh_result[127:64]:
                    // inst_mulhsu? mulhsu_result[127:64]:
                    // inst_mulhu? mul_result[127:64] :
                    // inst_mulw ? mulw_result:
                    inst_rem ? rem_result :
                    inst_remu ? rem_result:
                    inst_remuw ? rem_result:
                    inst_remw ? rem_result:
                    inst_divw ? div_result:
                    inst_div ? div_result:
                    inst_divu ? div_result:
                    inst_divuw ? div_result: 64'd0;
endmodule


module ysyx_050228_MEM(
    input wire clock,
    input wire reset,
    input stop_all,
    input div_stop,
    input [63:0]    ext_ram_read_data,
    input wire [`ysyx_050228_EX_MEM_Bus-1:0] EX_MEM_Bus,
    output wire [`ysyx_050228_MEM_ID_Bus-1:0] MEM_ID_Bus
);
reg [`ysyx_050228_EX_MEM_Bus-1:0] EX_MEM_Bus_Reg;
wire inst_lwu,inst_sh, inst_sd,inst_sw,inst_ld,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb,inst_sb;
wire [10:0] mem_OneHot;
wire [63:0] EX_result,final_result;
wire [4:0] ID_addr;
wire ID_we;
wire [31:0] inst_addr;
wire valid ,inst_ebreak;
always @(posedge clock) begin
    if(reset) begin
        EX_MEM_Bus_Reg <= `ysyx_050228_EX_MEM_Bus'd0;
    end
    else if(stop_all|div_stop)begin
        EX_MEM_Bus_Reg <= `ysyx_050228_EX_MEM_Bus'd0;
    end
    else begin
        EX_MEM_Bus_Reg <=EX_MEM_Bus;
    end
end
assign {valid,mem_OneHot,inst_addr,inst_ebreak,ID_we,ID_addr,EX_result} = EX_MEM_Bus_Reg;
assign {inst_lwu,inst_sh, inst_sd,inst_sw,inst_ld,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb,inst_sb} = mem_OneHot;
    
assign final_result = inst_ld ?ext_ram_read_data:
        inst_lw ?{{32{ext_ram_read_data[31]}},{ext_ram_read_data[31:0]}}:
        inst_lh ?{{48{ext_ram_read_data[15]}},{ext_ram_read_data[15:0]}}:
        inst_lb ?{{56{ext_ram_read_data[7]}},{ext_ram_read_data[7:0]}}:
        inst_lwu ?{{32{1'b0}},{ext_ram_read_data[31:0]}} :
        inst_lhu ?{{48{1'b0}},{ext_ram_read_data[15:0]}}:
        inst_lbu ?{{56{1'b0}},{ext_ram_read_data[7:0]}}:
        EX_result;
assign MEM_ID_Bus = {ID_we,ID_addr,final_result};
endmodule

/* there is protection from software which restrict that the data width is up to 32 bits*/


module ysyx_050228_mmio(
    input clock,
    input reset,
    output          clint,

    input [31:0]    inst_addr,

    input [31:0]    ext_addr,
    input [63:0]    ext_data,
    
    input [7:0]     ext_ram_be_n,
    input           ext_ram_wen, 
    input [63:0]    mmio_in_data,
    input           stop_all,
    input           mmio_ext_ready,
    input           mmio_inst_ready,
    output reg [63:0]   mmio_read_data_ext,
    output reg [63:0]   mmio_read_data_inst,
    output          mmio_en_inst,
    output          mmio_en_ext,
    output          mmio_clint_en,
    output          mmio_mtimecmp_en,

    output          mmio_req_inst,
    output          mmio_req_ext,

    output reg      mmio_en_ext_cpu_enable,
    output [63:0]   mmio_write_data,
    output          mmio_wen,
    output [31:0]   mmio_addr_ext,
    output [31:0]   mmio_addr_inst,
    output [7:0]    mmio_be_n
    
);
reg [63:0] mtimecmp;
reg [63:0] mtime;
reg [2:0] mtime_cnt;
wire mmio_mtime_en;
wire [63:0] total_shift;
assign total_shift =    ext_ram_be_n[0] ? 64'd0:
                        ext_ram_be_n[1] ? 64'd8:
                        ext_ram_be_n[2] ? 64'd16:
                        ext_ram_be_n[3] ? 64'd24:
                        ext_ram_be_n[4] ? 64'd32:
                        ext_ram_be_n[5] ? 64'd40:
                        ext_ram_be_n[6] ? 64'd48:
                        ext_ram_be_n[7] ? 64'd56: 64'd0;
wire [63:0] mask_data;
assign mask_data =  {{8{ext_ram_be_n[7]}},
                    {8{ext_ram_be_n[6]}},
                    {8{ext_ram_be_n[5]}},
                    {8{ext_ram_be_n[4]}},
                    {8{ext_ram_be_n[3]}},
                    {8{ext_ram_be_n[2]}},
                    {8{ext_ram_be_n[1]}},
                    {8{ext_ram_be_n[0]}}};
reg [31:0] mmio_addr_already_read_ext;
reg [7:0] mmio_be_n_already_read_ext;
reg mmio_wen_already_read_ext;
always @(posedge clock) begin
    if(reset) begin
        mmio_en_ext_cpu_enable <= 1'd0;
    end
    else if(mmio_ext_ready|mmio_mtime_en|mmio_mtimecmp_en) begin
        mmio_en_ext_cpu_enable <= 1'd1;
    end
    else if(mmio_en_ext == 1'd0 && ext_ram_be_n != 8'd0)begin
        mmio_en_ext_cpu_enable <= 1'd0;
    end
end

always @(posedge clock) begin
    if(reset) begin
        mmio_addr_already_read_ext <= 32'd0;
        mmio_be_n_already_read_ext <= 8'd0;
        mmio_wen_already_read_ext <= 1'd0;
    end
    else if(mmio_ext_ready) begin
        mmio_be_n_already_read_ext <= ext_ram_be_n;
        mmio_addr_already_read_ext <= ext_addr;
        mmio_wen_already_read_ext <= ext_ram_wen;
    end
    else if(~stop_all) begin
        mmio_addr_already_read_ext <= 32'd0;
        mmio_be_n_already_read_ext <= 8'd0;
        mmio_wen_already_read_ext <= 1'd0;        
    end
end
assign mmio_req_ext = mmio_en_ext &&    ((ext_addr != mmio_addr_already_read_ext)| 
                                        (ext_ram_be_n != mmio_be_n_already_read_ext)|
                                        (ext_ram_wen !=  mmio_wen_already_read_ext)) ;
reg [1:0] lock_pc_state;
reg [31:0] mmio_addr_already_read_inst;
wire [31:0] inst_addr_sel;
always @(posedge clock) begin
    if(reset) begin
        lock_pc_state <= 2'd0;
        mmio_addr_already_read_inst <= 32'd0;
    end     
    else if(lock_pc_state == 2'd0 && mmio_req_inst) begin
        lock_pc_state <= 2'd1;
    end
    else if(lock_pc_state == 2'd1 && mmio_inst_ready) begin
        lock_pc_state <= 2'd0; 
        mmio_addr_already_read_inst <= inst_addr_sel;
    end
end
reg [31:0] inst_addr_pre;
always @(posedge clock) begin
    if(reset) begin
        inst_addr_pre <= 32'h0;
    end
    else if(lock_pc_state == 2'd0) begin
        inst_addr_pre <= inst_addr;
    end  
end

assign inst_addr_sel = lock_pc_state == 2'd1 | (mmio_req_ext &&~ mmio_wen) ? inst_addr_pre : inst_addr;
assign mmio_req_inst = mmio_en_inst && (inst_addr_sel != mmio_addr_already_read_inst);


always @(posedge clock)begin
    if(reset) begin
        mmio_read_data_ext <= 64'd0;
        mmio_read_data_inst <= 64'd0;
    end
    else if(mmio_ext_ready && mmio_en_ext) begin
        mmio_read_data_ext <= (mmio_in_data & mask_data) >> total_shift;
    end
    else if(mmio_inst_ready && mmio_en_inst) begin
        mmio_read_data_inst <= mmio_in_data >> (inst_addr[2] * 32);
    end
    else if(mmio_mtimecmp_en && ~ext_ram_wen) begin
        mmio_read_data_ext <= ( mtimecmp& mask_data) >>> total_shift;
    end    
    else if(mmio_mtime_en && ~ext_ram_wen) begin
        mmio_read_data_ext <= ( mtime& mask_data) >>> total_shift ;
    end    
end

assign mmio_clint_en = mmio_mtimecmp_en | mmio_mtime_en;

assign mmio_mtimecmp_en = ext_addr == 32'h02004000 && |ext_ram_be_n;
assign mmio_mtime_en = ext_addr == 32'h0200bff8 && |ext_ram_be_n;

assign mmio_en_inst = (inst_addr_sel >= 32'h201_0000 && inst_addr_sel <= 32'h7fff_ffff) ;
assign mmio_en_ext = (ext_addr >= 32'h201_0000 && ext_addr <= 32'h7fff_ffff)   && ext_ram_be_n != 8'd0;
wire [31:0] least_1_be_n;
wire mmio_high;
assign mmio_high = |ext_ram_be_n[7:4];
wire [63:0] write_data_cp;
assign mmio_wen =  mmio_en_ext ? ext_ram_wen:0;
assign mmio_be_n = mmio_en_ext ?   ext_ram_be_n : mmio_en_inst? 8'hff: 8'd0;
assign mmio_write_data = write_data_cp;
assign mmio_addr_ext = mmio_en_ext ?   ext_addr +least_1_be_n:32'd0;
assign mmio_addr_inst =  mmio_en_inst? inst_addr_sel : 32'd0;

assign clint =  mtime >= mtimecmp && mtimecmp != 64'd0;




wire [7:0] be_n_sel;
assign be_n_sel = mmio_high ? {4'd0,ext_ram_be_n[7:4]} : {4'd0,ext_ram_be_n[3:0]};
assign write_data_cp =      be_n_sel[3:0] == 4'b1111 ? {2{ext_data[31:0]}} :
                            be_n_sel[3:0] == 4'b0001 ? {8{ext_data[7:0]}} :
                            be_n_sel[3:0] == 4'b0010 ? {8{ext_data[7:0]}} :
                            be_n_sel[3:0] == 4'b0100 ? {8{ext_data[7:0]}} :
                            be_n_sel[3:0] == 4'b1000 ? {8{ext_data[7:0]}} :
                            be_n_sel[3:0] == 4'b0011 ? {4{ext_data[15:0]}} :
                            be_n_sel[3:0] == 4'b1100 ? {4{ext_data[15:0]}} : 64'd0;

wire [63:0] mtime_write_data;
assign  mtime_write_data =    be_n_sel[3:0] == 4'b1111 ? {32'd0,ext_data[31:0]} :
                            be_n_sel[3:0] == 4'b0001 ? {32'd0,{4{ext_data[7:0]}}} :
                            be_n_sel[3:0] == 4'b0010 ? {32'd0,{4{ext_data[7:0]}}} :
                            be_n_sel[3:0] == 4'b0100 ? {32'd0,{4{ext_data[7:0]}}} :
                            be_n_sel[3:0] == 4'b1000 ? {32'd0,{4{ext_data[7:0]}}} :
                            be_n_sel[3:0] == 4'b0011 ? {32'd0,{2{ext_data[15:0]}}} :
                            be_n_sel[3:0] == 4'b1100 ? {32'd0,{2{ext_data[15:0]}}} : 64'd0;


assign least_1_be_n =   ext_ram_be_n[0] ? 32'd0:
                        ext_ram_be_n[1] ? 32'd1:
                        ext_ram_be_n[2] ? 32'd2:
                        ext_ram_be_n[3] ? 32'd3:
                        ext_ram_be_n[4] ? 32'd4:
                        ext_ram_be_n[5] ? 32'd5:
                        ext_ram_be_n[6] ? 32'd6:
                        ext_ram_be_n[7] ? 32'd7:
                        32'd0;


reg [63:0] rtc;
always @(posedge clock) begin
    if(reset) begin
        rtc <= 64'd0;
    end
    else begin
        rtc <= rtc +64'd1;
    end
end



always @(posedge clock) begin
    if(reset) begin
    	mtime_cnt <= 3'd0;
    end
    else if(mtime_cnt != 3'd2)begin
    	mtime_cnt <= mtime_cnt + 3'd1;
    end
    else if(mtime_cnt == 3'd2) begin
    	mtime_cnt <= 3'd0;
    end
end


always @(posedge clock) begin
    if(reset) begin
        mtime <= 64'd0;
    end
    else if(mmio_mtime_en && ext_ram_wen) begin
        mtime <= ((mtime_write_data <<total_shift)&
                {{8{ext_ram_be_n[7]}},
                {8{ext_ram_be_n[6]}},
                {8{ext_ram_be_n[5]}},
                {8{ext_ram_be_n[4]}},
                {8{ext_ram_be_n[3]}},
                {8{ext_ram_be_n[2]}},
                {8{ext_ram_be_n[1]}},
                {8{ext_ram_be_n[0]}}});
    end
    else if(mtime_cnt == 3'd0) begin
        mtime <= mtime +64'd1;
    end
end

always @(posedge clock) begin
    if(reset) begin
        mtimecmp <= 64'd0;
    end
    else if(mmio_mtimecmp_en && ext_ram_wen) begin
        mtimecmp <=  ((mtime_write_data <<total_shift)&
                                                {{8{ext_ram_be_n[7]}},
                                                {8{ext_ram_be_n[6]}},
                                                {8{ext_ram_be_n[5]}},
                                                {8{ext_ram_be_n[4]}},
                                                {8{ext_ram_be_n[3]}},
                                                {8{ext_ram_be_n[2]}},
                                                {8{ext_ram_be_n[1]}},
                                                {8{ext_ram_be_n[0]}}});
    end
end

endmodule





//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/11 10:38:58
// Design Name: 
// Module Name: mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ysyx_050228_mul(
    input [63:0] src1,
    input [63:0] src2,
    
    input [1:0] mul_signed,  // bit 0 induce the src1 signed  1 is signed
    output [63:0] re_hi,
    output [63:0] re_lo
    );
    

    wire src1_abs_flag;
    wire src2_abs_flag;

    assign src1_abs_flag = src1[63] && mul_signed[0];
    assign src2_abs_flag = src2[63] && mul_signed[1];

    wire [63:0] src1_mul; 
    wire [63:0] src2_mul;

    assign src1_mul = src1_abs_flag   ? ~src1 + 1 : src1;
    assign src2_mul = src2_abs_flag   ? ~src2 + 1 : src2;

//    wire [127:0] result_abs;
//    assign  result_abs = src1_mul * src2_mul;
    wire  [127:0] booth [63:0];

    genvar i;
    generate
    for(i=0;i<64;i=i+1) begin
        assign booth[i] = {64'd0,(src1_mul[i] ? src2_mul : 64'd0)} << i ;
    end
    endgenerate

    // add like tree

    wire [127:0] tree_32 [31:0];
    generate
    for(i=0;i<64;i=i+2) begin
    assign tree_32[i>>1] = booth[i] + booth[i+1]  ;
    end
    endgenerate
       
    wire [127:0] tree_16 [15:0];
    generate
    for(i=0;i<32;i=i+2) begin
    assign tree_16[i>>1] = tree_32[i] + tree_32[i+1]  ;
    end
    endgenerate
    
    wire [127:0] tree_8 [7:0];
    generate
    for(i=0;i<16;i=i+2) begin
    assign tree_8[i>>1] = tree_16[i] + tree_16[i+1]  ;
    end
    endgenerate
   
    wire [127:0] tree_4 [3:0];
    generate
    for(i=0;i<8;i=i+2) begin
    assign tree_4[i>>1] = tree_8[i] + tree_8[i+1]  ;
    end
    endgenerate
    
     wire [127:0] result_abs;
    assign result_abs = tree_4[0] + tree_4[1] +tree_4[2] + tree_4[3];


     wire signed_flag ;
     assign signed_flag = (src1_abs_flag ^ src2_abs_flag) && (mul_signed ==2'b11);


     wire [127:0] result;
     assign result = signed_flag ? ~result_abs +1 : result_abs; 

    assign re_hi = result[127:64];
    assign re_lo = result[63:0] ;
endmodule


module ysyx_050228(
    input  clock,  
    input  reset,


    input           io_interrupt,

    input 	        io_master_awready, 			
	output 	        io_master_awvalid ,			
	output [3:0] 	io_master_awid,	
	output [31:0] 	io_master_awaddr,			
	output [7:0] 	io_master_awlen,			
	output [2:0] 	io_master_awsize,			
	output [1:0] 	io_master_awburst,			
	input 	        io_master_wready,	
	output 	        io_master_wvalid,	
	output [63:0] 	io_master_wdata,			
	output [7:0] 	io_master_wstrb,			
	output 	        io_master_wlast,	
	output 	        io_master_bready,	
	input 	        io_master_bvalid,	
	input [3:0] 	io_master_bid,	
	input [1:0] 	io_master_bresp,		
	input 	        io_master_arready,	
	output 	        io_master_arvalid,	
	output [3:0] 	io_master_arid,		
	output [31:0] 	io_master_araddr,			
	output [7:0] 	io_master_arlen,			
	output [2:0] 	io_master_arsize,			
	output [1:0] 	io_master_arburst,			
	output 	        io_master_rready,		
	input 	        io_master_rvalid,		
	input [3:0] 	io_master_rid,		
	input [1:0] 	io_master_rresp,			
	input [63:0] 	io_master_rdata,		
	input 	        io_master_rlast,

    output          io_slave_awready ,
    input           io_slave_awvalid ,
    input [3:0]     io_slave_awid ,
    input [31:0]    io_slave_awaddr ,
    input [7:0]     io_slave_awlen ,
    input [2:0]     io_slave_awsize ,
    input [1:0]     io_slave_awburst ,
    output          io_slave_wready ,
    input           io_slave_wvalid ,
    input [63:0]    io_slave_wdata ,
    input [7:0]     io_slave_wstrb ,
    input           io_slave_wlast ,
    input           io_slave_bready ,
    output          io_slave_bvalid ,
    output [3:0]    io_slave_bid ,
    output [1:0]    io_slave_bresp ,
    output          io_slave_arready ,
    input           io_slave_arvalid ,
    input [3:0]     io_slave_arid ,
    input [31:0]    io_slave_araddr ,
    input [7:0]     io_slave_arlen ,
    input [2:0]     io_slave_arsize ,
    input [1:0]     io_slave_arburst ,
    input           io_slave_rready ,
    output          io_slave_rvalid ,
    output [3:0]    io_slave_rid ,
    output [1:0]    io_slave_rresp ,
    output [63:0]   io_slave_rdata ,
    output          io_slave_rlast ,
    
    output [5:0]    io_sram0_addr ,
    output          io_sram0_cen ,
    output          io_sram0_wen ,
    output [127:0]  io_sram0_wmask ,
    output [127:0]  io_sram0_wdata ,
    input [127:0]   io_sram0_rdata ,
    output [5:0]    io_sram1_addr ,
    output          io_sram1_cen ,
    output          io_sram1_wen ,
    output [127:0]  io_sram1_wmask ,
    output [127:0]  io_sram1_wdata ,
    input [127:0]   io_sram1_rdata ,
    output [5:0]    io_sram2_addr ,
    output          io_sram2_cen ,
    output          io_sram2_wen ,
    output [127:0]  io_sram2_wmask ,
    output [127:0]  io_sram2_wdata ,
    input [127:0]   io_sram2_rdata ,
    output [5:0]    io_sram3_addr ,
    output          io_sram3_cen ,
    output          io_sram3_wen ,
    output [127:0]  io_sram3_wmask ,
    output [127:0]  io_sram3_wdata ,
    input [127:0]   io_sram3_rdata ,
    output [5:0]    io_sram4_addr ,
    output          io_sram4_cen ,
    output          io_sram4_wen ,
    output [127:0]  io_sram4_wmask ,
    output [127:0]  io_sram4_wdata ,
    input [127:0]   io_sram4_rdata ,
    output [5:0]    io_sram5_addr ,
    output          io_sram5_cen ,
    output          io_sram5_wen ,
    output [127:0]  io_sram5_wmask ,
    output [127:0]  io_sram5_wdata ,
    input [127:0]   io_sram5_rdata ,
    output [5:0]    io_sram6_addr ,
    output          io_sram6_cen ,
    output          io_sram6_wen ,
    output [127:0]  io_sram6_wmask ,
    output [127:0]  io_sram6_wdata ,
    input [127:0]   io_sram6_rdata ,
    output [5:0]    io_sram7_addr ,
    output          io_sram7_cen ,
    output          io_sram7_wen ,
    output [127:0]  io_sram7_wmask ,
    output [127:0]  io_sram7_wdata ,
    input [127:0]   io_sram7_rdata

    );

assign io_slave_awready =   1'd0;
assign io_slave_wready  =   1'd0;
assign io_slave_bvalid  =   1'd0;
assign io_slave_bid     =   4'd0;
assign io_slave_bresp   =   2'd0;
assign io_slave_arready =   1'd0;
assign io_slave_rvalid  =   1'd0;
assign io_slave_rid     =   4'd0;
assign io_slave_rresp   =   2'd0;
assign io_slave_rdata   =   64'd0;
assign io_slave_rlast   =   1'd0;





    wire[63:0] ext_ram_read_data;
    wire[31:0] ext_ram_addr; //ExtRAM地址
    wire[7:0] ext_ram_be_n;  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�?0  
    wire ext_ram_wen;       //ExtRAM片�?�，低有�?
    wire [63:0] ext_ram_write_data;
      
    wire [31:0]     inst;

    //wire inst_ebreak;
   // wire[31:0] ext_ram_addr;
wire clint;
//assign base_ram_be_n = 4'b0; // to be check 
wire [`ysyx_050228_ID_IF_Bus-1:0] ID_IF_Bus;
wire [`ysyx_050228_IF_ID_Bus-1:0] IF_ID_Bus;
wire [`ysyx_050228_EX_ID_Bus-1:0] EX_ID_Bus;
wire [`ysyx_050228_MEM_ID_Bus-1:0] MEM_ID_Bus;
wire [`ysyx_050228_ID_EX_Bus-1:0] ID_EX_Bus;
wire [`ysyx_050228_EX_MEM_Bus-1:0] EX_MEM_Bus;

wire pause_mem,pause_div_ID,div_valid,div_stop;
wire fence_i_ready;
//wire mmio_vga_ctl_en;
//wire mmio_serial_en;
// wire [7:0] mmio_be_n;
// wire mmio_wen;
wire [63:0] mmio_in_data;
wire [63:0] mmio_read_data_ext;
wire [63:0] mmio_read_data_inst;
wire mmio_en_ext;
wire [63:0] mmio_write_data;
wire mmio_wen;
wire [7:0] mmio_be_n;
wire [31:0]   mmio_addr_inst;
wire [31:0]   mmio_addr_ext;
wire stop_all;
wire mmio_en_inst;
wire mmio_req_ext;
wire mmio_req_inst;
wire mmio_ext_ready,mmio_inst_ready;
wire mmio_clint_en;
wire mmio_en_ext_cpu_enable;
wire mmio_mtimecmp_en;
ysyx_050228_mmio ysyx_050228_mmio(
    .clock(clock),
    .reset(reset),
    .clint(clint),

    .inst_addr(IF_ID_Bus),
    .mmio_mtimecmp_en(mmio_mtimecmp_en),
    .ext_addr(ext_ram_addr),
    .ext_data(ext_ram_write_data),
    .ext_ram_be_n(ext_ram_be_n),
    .ext_ram_wen(ext_ram_wen), 

    .mmio_req_ext(mmio_req_ext),
    .mmio_req_inst(mmio_req_inst),    
    .stop_all(stop_all),
    // .mmio_serial_data(mmio_serial_data),
    .mmio_in_data(mmio_in_data),

    .mmio_ext_ready(mmio_ext_ready),
    .mmio_inst_ready(mmio_inst_ready),
    .mmio_clint_en(mmio_clint_en),

    .mmio_read_data_ext(mmio_read_data_ext),
    .mmio_read_data_inst(mmio_read_data_inst),

    .mmio_en_ext_cpu_enable(mmio_en_ext_cpu_enable),
    .mmio_en_inst(mmio_en_inst),
    .mmio_en_ext(mmio_en_ext),
    .mmio_write_data(mmio_write_data),
    .mmio_wen(mmio_wen),
    .mmio_addr_ext(mmio_addr_ext),
    .mmio_addr_inst(mmio_addr_inst),
    .mmio_be_n(mmio_be_n)
);

wire [7:0]dcache_be_n;
wire dcache_wen;
wire [63:0] dcache_read_out_data;
wire inst_fence_i;
wire clint_jump_en;
assign dcache_be_n = mmio_en_ext|mmio_clint_en?8'd0:ext_ram_be_n;
assign dcache_wen =  mmio_en_ext|mmio_clint_en?1'd0:ext_ram_wen;
assign ext_ram_read_data = mmio_en_ext_cpu_enable ? mmio_read_data_ext :
                            dcache_read_out_data;
wire [31:0] inst_sel_from_mmio;
assign inst_sel_from_mmio = mmio_en_inst  ?mmio_read_data_inst[31:0] :inst;

wire [31:0] icache_addr;

assign icache_addr = mmio_en_inst ? 32'd0 :IF_ID_Bus ;
ysyx_050228_ctrl ysyx_050228_ctrl
(
    .clock(clock),
    .reset(reset),
    .div_ready(pause_div_ID),
    .div_valid(div_valid),
    .fence_i_ready(fence_i_ready),

    .div_stop(div_stop)
);

ysyx_050228_IF ysyx_050228_IF(
    .clock(clock),
    .reset(reset),
    .stop_all(stop_all),
    .div_stop(div_stop),
    .pause_mem(pause_mem),
    .pause_div_ID(pause_div_ID),
    .ID_IF_Bus(ID_IF_Bus),
    .IF_ID_Bus(IF_ID_Bus)
);

ysyx_050228_ID ysyx_050228_ID(
    .clock(clock),
    .reset(reset),

    .mmio_mtimecmp_en(mmio_mtimecmp_en),
    .clint_jump_en(clint_jump_en),
    .stop_all(stop_all),
    .div_stop(div_stop),
    .pause_div_ID(pause_div_ID),
    .int_time(clint),
    .inst_in(inst_sel_from_mmio),
    .pause_mem(pause_mem),
    .ID_IF_Bus(ID_IF_Bus),
    .IF2_ID_Bus(IF_ID_Bus),
    .EX_ID_Bus(EX_ID_Bus),
    .MEM_ID_Bus(MEM_ID_Bus),


    .ID_EX_Bus(ID_EX_Bus)
);

ysyx_050228_EX ysyx_050228_EX(
    .clock(clock),
    .reset(reset),

    .clint_jump_en(clint_jump_en),
    .stop_all(stop_all),
    .div_stop(div_stop),
    .div_valid(div_valid),
    .ID_EX_Bus(ID_EX_Bus),
    .EX_MEM_Bus(EX_MEM_Bus),
    .EX_ID_Bus(EX_ID_Bus),
    .inst_fence_i(inst_fence_i),

    .ext_ram_addr(ext_ram_addr), //ExtRAM地址
    .ext_ram_be_n(ext_ram_be_n),  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�?0
    .ext_ram_wen(ext_ram_wen),       //ExtRAM片�?�，低有�?
    .ext_ram_write_data(ext_ram_write_data)
);


ysyx_050228_MEM ysyx_050228_MEM(
    .clock(clock),
    .reset(reset),
    .stop_all(stop_all),
    .div_stop(div_stop),
    .ext_ram_read_data(ext_ram_read_data),
    .EX_MEM_Bus(EX_MEM_Bus),
    .MEM_ID_Bus(MEM_ID_Bus)
);


ysyx_050228_cache ysyx_050228_cache
(
    .clock(clock),
    .reset(reset),
    
    .inst_addr(icache_addr),
    .inst_en(1'b1),
    .inst_data(inst),
    .stop_all(stop_all),
    .ext_data_addr(ext_ram_addr),
    .ext_data_be(dcache_be_n),
    .ext_data_wen(dcache_wen),   
    .ext_data_write_data(ext_ram_write_data),
// the following will be replaced by AXI
    .ext_cache_read_data(dcache_read_out_data),
    //.ext_out_data(),
    .inst_fence_i(inst_fence_i),
    .fence_i_ready(fence_i_ready),

    .mmio_ext_ready(mmio_ext_ready),
    .mmio_inst_ready(mmio_inst_ready),

    .mmio_read_data(mmio_in_data),

    .mmio_req_ext(mmio_req_ext),
    .mmio_req_inst(mmio_req_inst),
    
    .mmio_write_data(mmio_write_data),
    .mmio_wen(mmio_wen),
    .mmio_be_n(mmio_be_n),
    .mmio_addr_inst(mmio_addr_inst),
    .mmio_addr_ext(mmio_addr_ext),

    .AWID(io_master_awid),     
    .AWADDR(io_master_awaddr),    
    .AWLEN(io_master_awlen),            
    .AWSIZE(io_master_awsize),             
    .AWBURST(io_master_awburst),           
    .AWVALID(io_master_awvalid),            
    
    .AWREADY(io_master_awready),           
    // w
    .WDATA(io_master_wdata),    
    .WSTRB(io_master_wstrb),
    .WLAST(io_master_wlast),            
    .WVALID(io_master_wvalid),          
    .WREADY(io_master_wready),            
    // b
    .BID(io_master_bid),     
    .BRESP(io_master_bresp),          
    .BVALID(io_master_bvalid),        
    
    .BREADY(io_master_bready),  

    .ARADDR(io_master_araddr),   
    .ARLEN(io_master_arlen),          
    .ARSIZE(io_master_arsize),            
    .ARBURST(io_master_arburst),            
    .ARVALID(io_master_arvalid),     

    .ARREADY(io_master_arready),           
    // r

    .RID(io_master_rid),
    .RDATA(io_master_rdata),   
    .RRESP(io_master_rresp),                 
    .RLAST(io_master_rlast),               
    .RVALID(io_master_rvalid),  

    .RREADY(io_master_rready),      
    .ARID(io_master_arid),

    .io_sram0_addr(io_sram0_addr),
    .io_sram0_cen(io_sram0_cen),
    .io_sram0_wen(io_sram0_wen),
    .io_sram0_wmask(io_sram0_wmask),
    .io_sram0_wdata(io_sram0_wdata),
    .io_sram0_rdata(io_sram0_rdata),
    .io_sram1_addr(io_sram1_addr),
    .io_sram1_cen(io_sram1_cen),
    .io_sram1_wen(io_sram1_wen),
    .io_sram1_wmask(io_sram1_wmask),
    .io_sram1_wdata(io_sram1_wdata),
    .io_sram1_rdata(io_sram1_rdata),
    .io_sram2_addr(io_sram2_addr),
    .io_sram2_cen(io_sram2_cen),
    .io_sram2_wen(io_sram2_wen),
    .io_sram2_wmask(io_sram2_wmask),
    .io_sram2_wdata(io_sram2_wdata),
    .io_sram2_rdata(io_sram2_rdata),
    .io_sram3_addr(io_sram3_addr),
    .io_sram3_cen(io_sram3_cen),
    .io_sram3_wen(io_sram3_wen),
    .io_sram3_wmask(io_sram3_wmask),
    .io_sram3_wdata(io_sram3_wdata),
    .io_sram3_rdata(io_sram3_rdata),
    .io_sram4_addr(io_sram4_addr),
    .io_sram4_cen(io_sram4_cen),
    .io_sram4_wen(io_sram4_wen),
    .io_sram4_wmask(io_sram4_wmask),
    .io_sram4_wdata(io_sram4_wdata),
    .io_sram4_rdata(io_sram4_rdata),
    .io_sram5_addr(io_sram5_addr),
    .io_sram5_cen(io_sram5_cen),
    .io_sram5_wen(io_sram5_wen),
    .io_sram5_wmask(io_sram5_wmask),
    .io_sram5_wdata(io_sram5_wdata),
    .io_sram5_rdata(io_sram5_rdata),
    .io_sram6_addr(io_sram6_addr),
    .io_sram6_cen(io_sram6_cen),
    .io_sram6_wen(io_sram6_wen),
    .io_sram6_wmask(io_sram6_wmask),
    .io_sram6_wdata(io_sram6_wdata),
    .io_sram6_rdata(io_sram6_rdata),
    .io_sram7_addr(io_sram7_addr),
    .io_sram7_cen(io_sram7_cen),
    .io_sram7_wen(io_sram7_wen),
    .io_sram7_wmask(io_sram7_wmask),
    .io_sram7_wdata(io_sram7_wdata),
    .io_sram7_rdata(io_sram7_rdata)

);
endmodule


module ysyx_050228_regfile (
    input [4:0] a,
    input [63:0] d,
    input [4:0] dpra1,
    input [4:0] dpra2,
    input clock,
    input reset,
    input we,
    output [63:0] dpo1,
    output [63:0] dpo2
);
  reg [63:0] rf [31:0];
  integer i;
  always @(posedge clock) begin
    if(reset) begin
    	for(i=0;i<32;i++) begin
    	    rf[i] <=64'd0;
    	end
    end
    else if (we) rf[a] <= d;
  end

  assign dpo1 = rf[dpra1];
  assign dpo2 = rf[dpra2];
endmodule


