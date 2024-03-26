module ysyx_210191(
    input clock,
    input reset,
    input io_interrupt,

    //Master
    input                    io_master_awready,
    output                   io_master_awvalid,
    output [31:0]            io_master_awaddr,
    output [3:0]             io_master_awid,
    output [7:0]             io_master_awlen,
    output [2:0]             io_master_awsize,
    output [1:0]             io_master_awburst,
    input                    io_master_wready,
    output                   io_master_wvalid,
    output [63:0]            io_master_wdata,
    output [7:0]             io_master_wstrb,
    output                   io_master_wlast,
    output                   io_master_bready,
    input                    io_master_bvalid,
    input  [1:0]             io_master_bresp,
    input  [3:0]             io_master_bid,
    input                    io_master_arready,
    output                   io_master_arvalid,
    output [31:0]            io_master_araddr,
    output [3:0]             io_master_arid,
    output [7:0]             io_master_arlen,
    output [2:0]             io_master_arsize,
    output [1:0]             io_master_arburst,
    output                   io_master_rready,
    input                    io_master_rvalid,
    input  [1:0]             io_master_rresp,
    input  [63:0]            io_master_rdata,
    input                    io_master_rlast,
    input  [3:0]             io_master_rid,

    //Slave
    output                   io_slave_awready,
    input                    io_slave_awvalid,
    input  [31:0]            io_slave_awaddr,
    input  [3:0]             io_slave_awid,
    input  [7:0]             io_slave_awlen,
    input  [2:0]             io_slave_awsize,
    input  [1:0]             io_slave_awburst,
    output                   io_slave_wready,
    input                    io_slave_wvalid,
    input  [63:0]            io_slave_wdata,
    input  [7:0]             io_slave_wstrb,
    input                    io_slave_wlast,
    input                    io_slave_bready,
    output                   io_slave_bvalid,
    output [1:0]             io_slave_bresp,
    output [3:0]             io_slave_bid,
    output                   io_slave_arready,
    input                    io_slave_arvalid,
    input  [31:0]            io_slave_araddr,
    input  [3:0]             io_slave_arid,
    input  [7:0]             io_slave_arlen,
    input  [2:0]             io_slave_arsize,
    input  [1:0]             io_slave_arburst,
    input                    io_slave_rready,
    output                   io_slave_rvalid,
    output [1:0]             io_slave_rresp,
    output [63:0]            io_slave_rdata,
    output                   io_slave_rlast,
    output [3:0]             io_slave_rid  
);

    wire flush;
    wire data_r_valid;
    wire data_w_valid;
    wire [63:0] data_r_data;
    wire [31:0] inst_r_data;
    wire inst_r_valid;
    wire inst_r_ena;
    wire [31:0] inst_addr;
    wire [31:0] data_w_addr;
    wire [63:0] data_w_data;
    wire data_w_ena;
    wire data_r_ena;
    wire [31:0] data_r_addr;
    wire [7:0] mem_mask;
    wire [2:0] arsize;
    wire [2:0] awsize;

  ysyx_210191_mycpu CPU(
      .clock(clock), 
      .reset(reset), 
      .data_r_valid(data_r_valid), 
      .data_w_valid(data_w_valid), 
      .data_r_data(data_r_data), 
      .inst_r_data(inst_r_data), 
      .inst_r_valid(inst_r_valid),
      .inst_r_ena(inst_r_ena), 
      .inst_addr(inst_addr), 
      .data_w_addr(data_w_addr), 
      .data_w_data(data_w_data), 
      .data_w_ena(data_w_ena), 
      .data_r_ena(data_r_ena), 
      .data_r_addr(data_r_addr), 
      .mem_mask(mem_mask),
      .flush(flush),
      .arsize(arsize),
      .awsize(awsize),
      .ext_int(io_interrupt));

    ysyx_210191_axi4_crtl AXI(
      .ACLK(clock), 
      .ARESETn(reset),
      .flush(flush), 
      .inst_r_ena(inst_r_ena), 
      .inst_addr(inst_addr), 
      .inst_r(inst_r_data),
      .data_r_ena(data_r_ena), 
      .data_w_ena(data_w_ena), 
      .data_w(data_w_data), 
      .data_addr(data_r_addr), 
      .data_w_addr(data_w_addr),
      .data_w_mask(mem_mask),
      .data_r(data_r_data), 
      .ARID(io_master_arid),
      .ARADDR(io_master_araddr), 
      .ARLEN(io_master_arlen),
      .ARSIZE(io_master_arsize),
      .ARBURST(io_master_arburst),
      .ARVALID(io_master_arvalid), 
      .ARREADY(io_master_arready), 
      .RID(io_master_rid), 
      .RDATA(io_master_rdata), 
      .RVALID(io_master_rvalid), 
      .RREADY(io_master_rready), 
      .RLAST(io_master_rlast),
      .RRESP(io_master_rresp),
      .AWID(io_master_awid), 
      .AWADDR(io_master_awaddr), 
      .AWLEN(io_master_awlen),
      .AWSIZE(io_master_awsize),
      .AWBURST(io_master_awburst),
      .AWVALID(io_master_awvalid), 
      .AWREADY(io_master_awready), 
      .WDATA(io_master_wdata), 
      .WSTRB(io_master_wstrb), 
      .WVALID(io_master_wvalid), 
      .WREADY(io_master_wready),
      .WLAST(io_master_wlast), 
      .BID(io_master_bid), 
      .BVALID(io_master_bvalid), 
      .BREADY(io_master_bready),
      .BRESP(io_master_bresp),
      .data_r_valid(data_r_valid),
      .data_w_valid(data_w_valid),
      .inst_r_valid(inst_r_valid),
      .cpu_arsize(arsize),
      .cpu_awsize(awsize));

endmodule

module ysyx_210191_ALU(
    input [63:0] data1,
    input [63:0] data2,
    input [16:0] ALUControl,

    output reg [63:0] res
);

    wire [63:0] sum = data1 + data2;
    wire [63:0] sub = data1 - data2;
    wire [63:0] sll = data1 << data2[5:0];
    wire [31:0] sllw = data1[31:0] << data2[4:0];
    wire [63:0] srl = data1 >> data2[5:0];
    wire [31:0] srlw = data1[31:0] >> data2[4:0];
    wire [63:0] sra = $signed(data1) >>> data2[5:0];
    wire [31:0] sraw = $signed(data1[31:0]) >>> data2[4:0];
    wire is_less = data1[63] == 0 ? (data2[63] == 1 ? 0 : data1 < data2) : (data2[63] == 0 ? 1 : data1 < data2);

    always @(*) begin
        case(ALUControl)
            17'b10000000000000000: begin //add
                res = sum;
            end
            17'b01000000000000000 : begin //addw
                res = {{32{sum[31]}}, sum[31:0]};
            end
            17'b00100000000000000: begin //sub
                res = sub;
            end
            17'b00010000000000000: begin //subw
                res = {{32{sub[31]}}, sub[31:0]};
            end
            17'b00001000000000000: begin //lui
                res = {data2[51:0], 12'd0};
            end
            17'b00000100000000000: begin //auipc
                res = sum;
            end
            17'b00000010000000000: begin //xor
                res = data1 ^ data2;
            end
            17'b00000001000000000: begin //or
                res = data1 | data2;
            end
            17'b00000000100000000: begin //and
                res = data1 & data2;
            end
            17'b00000000010000000: begin //slt
                res = (data1 < data2) ? 64'd1 : 64'd0;
            end
            17'b00000000001000000: begin //sll
                res = sll;
            end
            17'b00000000000100000: begin //sllw
                res = {{32{sllw[31]}}, sllw[31:0]};
            end
            17'b00000000000010000: begin //srl
                res = srl;
            end
            17'b00000000000001000: begin //srlw
                res = {{32{srlw[31]}}, srlw[31:0]};
            end
            17'b00000000000000100: begin //sra
                res = sra;
            end
            17'b00000000000000010: begin //sra
                res = {{32{sraw[31]}}, sraw[31:0]};
            end
            17'b00000000000000001: begin //sra
                res = is_less ? 64'd1 : 64'd0;
            end
            default : begin
                res = 64'd0;
            end
        endcase
    end

endmodule
`define YSYX210191_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210191_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210191_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210191_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210191_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210191_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210191_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210191_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210191_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210191_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210191_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210191_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210191_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210191_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210191_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210191_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210191_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210191_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210191_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210191_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210191_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210191_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210191_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210191_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210191_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210191_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210191_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210191_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210191_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210191_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210191_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210191_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210191_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210191_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210191_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210191_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210191_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210191_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210191_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210191_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210191_AXI_SIZE_BYTES_128                                  3'b111

module ysyx_210191_axi4_crtl # (
    parameter RW_DATA_WIDTH = 64,
    parameter RW_ADDR_WIDTH = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_ADDR_WIDTH = 32,
    parameter IDEL               = 3'b000,	//空闲
	parameter INST_SEND_RADDR    = 3'b001,	//指令cache发读地址
	parameter INST_RECEIVE_RDATA = 3'b010,	//指令cache接收读数据
	parameter DATA_SEND_RADDR    = 3'b011,	//数据cache发读地址
	parameter DATA_RECEIVE_RDATA = 3'b100,	//数据cache接收读数据
	parameter DATA_SEND_WADDR    = 3'b001,	//数据cache发写地址
	parameter DATA_SEND_WDATA    = 3'b010,	//数据cache发写数据
	parameter DATA_RECEIVE_B     = 3'b011	//数据cache写响应
)(
    input ACLK,
    input ARESETn,
    input flush,

    input inst_r_ena,
    input [RW_ADDR_WIDTH - 1:0] inst_addr,
    output reg [31:0] inst_r,
    input data_r_ena,
    input data_w_ena,
    input [RW_ADDR_WIDTH - 1:0] data_addr,
    input [63:0] data_w,
    input [RW_ADDR_WIDTH - 1:0] data_w_addr,
    input [7:0] data_w_mask,
    output reg [63:0] data_r,

    output [3:0] ARID,
    output [RW_ADDR_WIDTH - 1:0] ARADDR,
    output [7:0] ARLEN,
    output [2:0] ARSIZE,
    output [1:0] ARBURST,
    output ARVALID,
    input ARREADY,

    input [3:0] RID,
    input [63:0] RDATA,
    input RVALID,
    output RREADY,
    input RLAST,
    input [1:0] RRESP,

    output [3:0] AWID,
    output [RW_ADDR_WIDTH - 1:0] AWADDR,
    output [7:0] AWLEN,
    output [2:0] AWSIZE,
    output [1:0] AWBURST,
    output AWVALID,
    input AWREADY,

    output [63:0] WDATA,
    output [7:0] WSTRB,
    output WVALID,
    input WREADY,
    output WLAST,

    input [3:0] BID,
    input BVALID,
    output BREADY,
    input [1:0] BRESP,

    output reg data_r_valid,
    output reg data_w_valid,
    output reg inst_r_valid,

    input [2:0] cpu_arsize,
    input [2:0] cpu_awsize
);

    wire ar_hs = ARREADY & ARVALID;
    wire r_hs = RREADY & RVALID;
    wire aw_hs = AWREADY & AWVALID;
    wire w_hs = WREADY & WVALID;
    wire b_hs = BREADY & BVALID;
    wire r_done = r_hs & RLAST;
    wire w_done = w_hs & WLAST;
	
	reg [2:0] axi_read_state;
    reg [2:0] axi_write_state;

    always @(posedge ACLK) begin
        if(ARESETn) begin
            axi_read_state <= 3'b000;
            data_r <= 64'd0;
            data_r_valid <= 1'b0;
            inst_r_valid <= 1'b0;
            inst_r <= 32'd0;
        end else begin
            case(axi_read_state)
                IDEL: begin
                    if(flush) begin
                        axi_read_state <= IDEL;
                        inst_r_valid <= 1'b0;
                        data_r_valid <= 1'b0;
                    end else if(inst_r_ena) begin
                        axi_read_state <= INST_SEND_RADDR;
                        inst_r_valid <= 1'b0;
                        data_r_valid <= 1'b0;
                    end else if(data_r_ena) begin
                        axi_read_state <= DATA_SEND_RADDR;
                        inst_r_valid <= 1'b0;
                        data_r_valid <= 1'b0;
                    end
                end
                INST_SEND_RADDR : begin
                    if(ar_hs) begin
                        axi_read_state <= INST_RECEIVE_RDATA;
                    end
                end
                INST_RECEIVE_RDATA : begin
                    if(r_done) begin
                        axi_read_state <= IDEL;
                        inst_r <= inst_addr[2] ? RDATA[63:32] : RDATA[31:0];
                        inst_r_valid <= 1'b1;
                    end
                end
                DATA_SEND_RADDR : begin
                    if(ar_hs) begin
                        axi_read_state <= DATA_RECEIVE_RDATA;
                    end
                end
                DATA_RECEIVE_RDATA : begin
                    if(r_done) begin
                        axi_read_state <= IDEL;
                        data_r <= RDATA;
                        data_r_valid <= 1'b1;
                    end
                end
                default : begin
                    axi_read_state <= 3'b000;
                    data_r <= 64'd0;
                    data_r_valid <= 1'b0;
                    inst_r_valid <= 1'b0;
                    inst_r <= 32'd0;
                end
            endcase
        end
    end

    always @(posedge ACLK) begin
        if(ARESETn) begin
            axi_write_state <= 3'b000;
            data_w_valid <= 1'b0;
        end else begin
            case(axi_write_state)
                IDEL: begin
                    data_w_valid <= 1'b0;
                    if(flush) begin
                        axi_write_state <= IDEL;
                    end else if(data_w_ena) begin
                        axi_write_state <= DATA_SEND_WADDR;
                    end
                end
                DATA_SEND_WADDR : begin
                    data_w_valid <= 1'b0;
                    if(aw_hs) begin
                        axi_write_state <= DATA_SEND_WDATA;
                    end
                end
                DATA_SEND_WDATA : begin
                    data_w_valid <= 1'b0;
                    if(w_done) begin
                        axi_write_state <= DATA_RECEIVE_B;
                    end
                end
                DATA_RECEIVE_B : begin
                    if(b_hs) begin
                        axi_write_state <= IDEL;
                        data_w_valid <= 1'b1;
                    end
                end
                default : begin
                    axi_write_state <= 3'b000;
                    data_w_valid <= 1'b0;
                end
            endcase    
        end
    end
    
    ///////////////////////////////////////////////////

    assign ARID = 4'b0000;
    assign ARADDR = (axi_read_state == INST_SEND_RADDR || axi_read_state == INST_RECEIVE_RDATA) ? (inst_addr <= 32'h7777ffff ? inst_addr : {inst_addr[31:2], {2{1'b0}}}) : ((axi_read_state == DATA_SEND_RADDR || axi_read_state == DATA_RECEIVE_RDATA) ? (data_addr <= 32'h7777ffff ? data_addr : {data_addr[31:2], {2{1'b0}}}) : 32'd0);
    assign ARVALID = (axi_read_state == INST_SEND_RADDR || axi_read_state == DATA_SEND_RADDR) ? 1'b1 : 1'b0;
    assign ARLEN = 8'd0;
    assign ARSIZE = (axi_read_state == INST_SEND_RADDR || axi_read_state == INST_RECEIVE_RDATA) ? `YSYX210191_AXI_SIZE_BYTES_4 : cpu_arsize;
    assign ARBURST = `YSYX210191_AXI_BURST_TYPE_INCR;

    assign RREADY = (axi_read_state == INST_RECEIVE_RDATA || axi_read_state == DATA_RECEIVE_RDATA) ? 1'b1 : 1'b0;

    assign AWID = 4'b0000;
    assign AWADDR = (axi_write_state == DATA_SEND_WADDR || axi_write_state == DATA_SEND_WDATA) ? (data_w_addr <= 32'h7777ffff ? data_w_addr : {data_w_addr[31:3], {3{1'b0}}}) : 32'd0;
    assign AWLEN = 8'd0;
    assign AWSIZE = cpu_awsize;
    assign AWBURST = `YSYX210191_AXI_BURST_TYPE_INCR;
    assign AWVALID = (axi_write_state == DATA_SEND_WADDR) ? 1'b1 : 1'b0;

    assign WDATA = (axi_write_state == DATA_SEND_WDATA) ? data_w : 64'd0;
    assign WSTRB = (axi_write_state == DATA_SEND_WDATA) ? data_w_mask : 8'b00000000;
    assign WVALID = (axi_write_state == DATA_SEND_WDATA) ? 1'b1 : 1'b0;
    assign WLAST = 1'b1;

    assign BREADY = (axi_write_state == DATA_RECEIVE_B) ? 1'b1 : 1'b0;
endmodule

module ysyx_210191_CLINT(
    input clk,
    input reset,
    input [63:0] wdata,
    input mtimecmp_ena,
    input mtime_ena,

    output mtime_int,
    output [63:0] mtime_data,
    output [63:0] mtimecmp_data
);

    reg [63:0] mtime;
    reg [63:0] mtimecmp;

    always @(posedge clk) begin
        if(reset) begin
            mtime <= 64'd0;
        end else begin
            if(mtime_ena) begin
                mtime <= wdata;
            end else begin
                mtime <= mtime + 64'd1;
            end
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mtimecmp <= 64'd0;
        end else if(mtimecmp_ena) begin
            mtimecmp <= wdata;
        end
    end

    assign mtime_int = mtime >= mtimecmp;
    assign mtime_data = mtime;
    assign mtimecmp_data = mtimecmp;

endmodule

module ysyx_210191_csr(
    input clk,
    input reset,
    input [63:0] csr_wdata,
    input [11:0] i_r_csr,
    input [11:0] i_w_csr,
    input write_ena,
    input except_ena,
    input ext_int,
    input [63:0] i_addr,
    input [63:0] i_addr2,
    input [63:0] i_excode,
    input ret,
    input mtime_int,
    output reg [63:0] o_csr_data,
    output [63:0] mtvec_pc,
    output [63:0] epc,
    output time_int,
    output ecall
);

    reg [63:0] mimpid;
    reg [63:0] mhartid;
    reg [63:0] mstatus;
    reg [63:0] mtvec;
    reg [63:0] mepc;
    reg [63:0] mcause;
    reg [63:0] mie;
    reg [63:0] mip;
    reg [63:0] mscratch;
    reg [63:0] mcycle;

    assign time_int = mtime_int && mstatus[3] && mie[7];
    assign ecall = mstatus[3] && except_ena;

    always @(posedge clk) begin
        if(reset) begin
            mimpid <= 64'h000096485b50822a;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mhartid <= 64'd0;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mstatus <= {51'd0, 2'b11, 3'b000, 1'b0, 3'b000, 1'b1, 3'b000};
        end else if((except_ena || mtime_int && mie[7] == 1'b1) && mstatus[3] == 1'b1) begin
            mstatus <= {mstatus[63:13], 2'b11, 3'b000, mstatus[3], 3'b000, 1'b0, 3'b000};
        end else if(write_ena && i_w_csr == 12'h300) begin
            mstatus <= {csr_wdata[14:13] == 2'b11 || csr_wdata[16:15] == 2'b11, csr_wdata[62:0]};
        end else if(ret) begin
            mstatus <= {mstatus[63:13], 2'b00, 3'b000, 1'b1, 3'b000, mstatus[7], 3'b000};
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mtvec <= 64'd0;
        end else if(write_ena && i_w_csr == 12'h305) begin
            mtvec <= csr_wdata;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mepc <= 64'd0;
        end else if(mtime_int && mstatus[3] == 1'b1 && mie[7] == 1'b1) begin
            mepc <= {i_addr2[63:2], 2'b00};
        end else if(except_ena) begin
            mepc <= {i_addr[63:2], 2'b00};
        end else if(write_ena && i_w_csr == 12'h341) begin
            mepc <= csr_wdata;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mcause <= 64'd0;
        end else if(ext_int) begin
            mcause <= {1'b1, 63'd11};
        end else if(mtime_int && mstatus[3] == 1'b1 && mie[7] == 1'b1) begin
            mcause <= {1'b1, 63'd7};
        end else if(except_ena) begin
            mcause <= i_excode;
        end else if(write_ena && i_w_csr == 12'h342) begin
            mcause <= csr_wdata;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mie <= {52'd0, 1'b0, 3'b000, 1'b0, 3'b000, 1'b0, 3'b000};
        end else if(write_ena && i_w_csr == 12'h304) begin
            mie <= csr_wdata;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mip <= {52'd0, 1'b0, 3'b000, 1'b0, 3'b000, 1'b0, 3'b000};
        end else if(write_ena && i_w_csr == 12'h344) begin
            mip <= csr_wdata;
        end else begin
            if(ext_int) begin
                mip[11] <= 1'b1;
            end else begin
                mip[11] <= 1'b0;
            end
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            mscratch <= 64'd0;
        end else if(write_ena && i_w_csr == 12'h340) begin
            mscratch <= csr_wdata;
        end
    end


    always @(posedge clk) begin
        if(reset) begin
            mcycle <= 64'd0;
        end else if(write_ena && i_w_csr == 12'hb00) begin
            mcycle <= csr_wdata;
        end
        mcycle <= mcycle + 64'd1;
    end

    assign mtvec_pc = mtvec[1:0] == 2'b00 ? {mtvec[63:2], 2'b00} : (mcause[63] == 0 ? {mtvec[63:2], 2'b00} + mcause[62:0] >> 2 : (mcause[63] == 1 ? {mtvec[63:2], 2'b00} : 64'd0));
    assign epc = mepc;
    
    always @(*) begin
        case(i_r_csr)
            12'hf13 : begin
                o_csr_data = mimpid;
            end
            12'h300 : begin
                o_csr_data = mstatus;
            end
            12'h304 : begin
                o_csr_data = mie;
            end
            12'h305 : begin
                o_csr_data = mtvec;
            end
            12'h340 : begin
                o_csr_data = mscratch;
            end
            12'h341 : begin
                o_csr_data = mepc;
            end
            12'h342 : begin
                o_csr_data = mcause;
            end
            12'h344 : begin
                o_csr_data = mip;
            end
            12'hf14 : begin
                o_csr_data = mhartid;
            end
            12'hb00 : begin
                o_csr_data = mcycle;
            end
            default : begin
                o_csr_data = 64'd0;
            end
        endcase
    end

endmodule

module ysyx_210191_ctrl(
    input clk,
    input reset,
    input [63:0] mtvec_pc,
    input [63:0] epc,
    input ret,
    input stall_from_if,
    input stall_from_mem,
    input inst_r_valid,
    input time_int,
    input ecall,
    input stall_from_id,
    
    output reg [63:0] new_pc,
    output reg flush,
    output reg [5:0] stall,
    output reg keep
);

    always @(posedge clk) begin
        if(reset) begin
            keep <= 1'b0;
        end else begin
            if(ret || time_int || ecall) begin
                keep <= 1'b1;
            end
            if(keep == 1'b1 && inst_r_valid == 1'b1) begin
                keep <= 1'b0;
            end
        end
    end

    always @(*) begin
        if(reset) begin
            stall = 6'b000000;
            flush = 1'b0;
            new_pc = 64'd0;
        end else if(ecall || time_int) begin
            new_pc = mtvec_pc;
            stall = 6'b000000;
            flush = 1'b1;
        end else if(ret) begin
            new_pc = epc;
            flush = 1'b1;
            stall = 6'b000000;
        end else if(stall_from_mem) begin
            flush = 1'b0;
            stall = 6'b011111;
            new_pc = epc;
        end else if(stall_from_id) begin
            flush = 1'b0;
            stall = 6'b000111;
            new_pc = epc;
        end else if(stall_from_if) begin
            flush = 1'b0;
            stall = 6'b000111;
            new_pc = epc;
        end else begin
            stall = 6'b000000;
            flush = 1'b0;
            new_pc = epc;
        end
    end
    
endmodule

module ysyx_210191_decode(
    input clk,
    input reset,

    input [31:0] inst,
    input [63:0] inst_addr,

    input [63:0] rdata1,
    input [63:0] rdata2,

    input [4:0] exe_out_addr,
    input [63:0] exe_out,
    input [4:0] mem_out_addr,
    input [63:0] mem_out_1,
    input [63:0] mem_out_2,
    input exe_write_to_regfile,
    input mem_write_to_regfile,
    input exe_mem_to_regfile,
    input mem_mem_to_regfile,

    output write_to_regfile,
    output [4:0] reg_addr,
    output [16:0] ALUControl,
    output [63:0] b_j_pc,
    output pcsource,
    output [63:0] sext_imm,
    output aluimm,
    output [63:0] data1,
    output [63:0] data2,
    output is_jump,
    output [3:0] mem_control,
    output mem_to_regfile,
    output [11:0] csr,
    output [63:0] csr_wdata,
    output [2:0] csr_control,
    output [63:0] o_excode,
    output o_except_ena,
    output flush_if_id,
    output ret,
    output shift,
    output [63:0] shamt_ext,
    output stall
);
////////////////////////////////////////////////////////U指令
    wire inst_lui;
    wire inst_auipc;
////////////////////////////////////////////////////////
    wire inst_jal;
    wire inst_jalr;
////////////////////////////////////////////////////////B指令
    wire inst_beq;
    wire inst_bne;
    wire inst_blt;
    wire inst_bge;
    wire inst_bltu;
    wire inst_bgeu;
////////////////////////////////////////////////////////I指令
    wire inst_lb;
    wire inst_lh;
    wire inst_lw;
    wire inst_lbu;
    wire inst_lhu;
    wire inst_lwu;
    wire inst_ld;

    wire inst_addi;
    wire inst_addiw;
    wire inst_slti;
    wire inst_sltiu;
    wire inst_xori;
    wire inst_ori;
    wire inst_andi;
    wire inst_slli;
    wire inst_srli;
    wire inst_srai;

    wire inst_fence;
    wire inst_fence_i;
    wire inst_ecall;
    wire inst_ebreak;
    wire inst_csrrw;
    wire inst_csrrs;
    wire inst_csrrc;
    wire inst_csrrwi;
    wire inst_csrrsi;
    wire inst_csrrci;

    wire inst_sret;
    wire inst_mret;
    wire inst_wfi;
    wire inst_sfence_vma;
////////////////////////////////////////////////////////S指令
    wire inst_sb;
    wire inst_sh;
    wire inst_sw;
    wire inst_sd;
////////////////////////////////////////////////////////R指令
    wire inst_add;
    wire inst_addw;
    wire inst_sub;
    wire inst_subw;
    wire inst_sll;
    wire inst_slt;
    wire inst_sltu;
    wire inst_sllw;
    wire inst_slliw;
    wire inst_xor;
    wire inst_srl;
    wire inst_srlw;
    wire inst_srliw;
    wire inst_sra;
    wire inst_sraw;
    wire inst_sraiw;
    wire inst_or;
    wire inst_and;
////////////////////////////////////////////////////////
    wire shift_op;
    wire arithmetic_op;
    wire logic_op;
    wire compare_op;
    wire branch_op;
    wire synch_op;
    wire jumplink_op;
    wire environment_op;
    wire CSR_op;
    wire load_op;
    wire store_op;
////////////////////////////////////////////////////////
    wire [6:0] op;
    wire [4:0] rd;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [2:0] func_3;
    wire [6:0] func_7;
    wire [5:0] func_6;
    wire [11:0] imm_11_0;
    wire [11:0] imm_11_5_4_0;

    assign op = inst[6:0];
    assign rd = inst[11:7];
    assign rs1 = inst[19:15];
    assign rs2 = inst[24:20];
    assign func_3 = inst[14:12];
    assign func_7 = inst[31:25];
    assign func_6 = inst[31:26];
    assign imm_11_0 = inst[31:20];
    assign imm_11_5_4_0 = {inst[31:25], inst[11:7]};
    assign csr = inst[31:20];
////////////////////////////////////////////////////////
    wire inst_decode;

    assign inst_decode = 
     inst_lui   | inst_auipc   |
     inst_jal   | inst_jalr    |
     inst_beq   | inst_bne     | inst_blt   | inst_bge    | inst_bltu  |  inst_bgeu |
     inst_lb    | inst_lh      | inst_lw    | inst_lbu    | inst_lhu   |  inst_lwu  | inst_ld    |
     inst_sb    | inst_sh      | inst_sw    | inst_sd     |
     inst_addi  | inst_slti    | inst_sltiu | inst_xori   | inst_ori   | inst_andi  | inst_slli  | inst_srli   | inst_srai    | inst_addiw  |
     inst_add   | inst_sub     | inst_sll   | inst_slt    | inst_sltu  | inst_xor   | inst_srl   | inst_sra    | inst_or      | inst_and    | inst_sllw | inst_slliw | inst_srlw | inst_srliw | inst_sraw | inst_sraiw | inst_addw | inst_subw |
     inst_fence | inst_fence_i | inst_ecall | inst_ebreak | inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi  | inst_csrrci |
     inst_sret  | inst_mret    | inst_wfi   | inst_sfence_vma;

    assign inst_lui = op == 7'b0110111;
    assign inst_auipc = op == 7'b0010111;

    assign inst_jal = op == 7'b1101111;
    assign inst_jalr = op == 7'b1100111;

    assign inst_beq = op == 7'b1100011 && func_3 == 3'b000;
    assign inst_bne = op == 7'b1100011 && func_3 == 3'b001;
    assign inst_blt = op == 7'b1100011 && func_3 == 3'b100;
    assign inst_bge = op == 7'b1100011 && func_3 == 3'b101;
    assign inst_bltu = op == 7'b1100011 && func_3 == 3'b110;
    assign inst_bgeu = op == 7'b1100011 && func_3 == 3'b111;

    assign inst_lb = op == 7'b0000011 && func_3 == 3'b000;
    assign inst_lh = op == 7'b0000011 && func_3 == 3'b001;
    assign inst_lw = op == 7'b0000011 && func_3 == 3'b010;
    assign inst_lbu = op == 7'b0000011 && func_3 == 3'b100;
    assign inst_lhu = op == 7'b0000011 && func_3 == 3'b101;
    assign inst_lwu = op == 7'b0000011 && func_3 == 3'b110;
    assign inst_ld = op == 7'b0000011 && func_3 == 3'b011;

    assign inst_sb = op == 7'b0100011 && func_3 == 3'b000;
    assign inst_sh = op == 7'b0100011 && func_3 == 3'b001;
    assign inst_sw = op == 7'b0100011 && func_3 == 3'b010;
    assign inst_sd = op == 7'b0100011 && func_3 == 3'b011;

    assign inst_addi = op == 7'b0010011 && func_3 == 3'b000;
    assign inst_addiw = op == 7'b0011011 && func_3 == 3'b000;
    assign inst_slti = op == 7'b0010011 && func_3 == 3'b010;
    assign inst_sltiu = op == 7'b0010011 && func_3 == 3'b011;
    assign inst_xori = op == 7'b0010011 && func_3 == 3'b100;
    assign inst_ori = op == 7'b0010011 && func_3 == 3'b110;
    assign inst_andi = op == 7'b0010011 && func_3 == 3'b111;
    assign inst_slli = op == 7'b0010011 && func_3 == 3'b001 && func_6 == 6'b000000;
    assign inst_slliw = op == 7'b0011011 && func_3 == 3'b001 && func_6 == 6'b000000;
    assign inst_srli = op == 7'b0010011 && func_3 == 3'b101 && func_6 == 6'b000000;
    assign inst_srliw = op == 7'b0011011 && func_3 == 3'b101 && func_6 == 6'b000000;
    assign inst_srai = op == 7'b0010011 && func_3 == 3'b101 && func_6 == 6'b010000;
    assign inst_sraiw = op == 7'b0011011 && func_3 == 3'b101 && func_6 == 6'b010000;
    
    assign inst_add = op == 7'b0110011 && func_3 == 3'b000 && func_7 == 7'b0000000;
    assign inst_addw = op == 7'b0111011 && func_3 == 3'b000 && func_7 == 7'b0000000;
    assign inst_sub = op == 7'b0110011 && func_3 == 3'b000 && func_7 == 7'b0100000;
    assign inst_subw = op == 7'b0111011 && func_3 == 3'b000 && func_7 == 7'b0100000;
    assign inst_sll = op == 7'b0110011 && func_3 == 3'b001 && func_7 == 7'b0000000;
    assign inst_sllw = op == 7'b0111011 && func_3 == 3'b001 && func_7 == 7'b0000000;
    assign inst_slt = op == 7'b0110011 && func_3 == 3'b010 && func_7 == 7'b0000000;
    assign inst_sltu = op == 7'b0110011 && func_3 == 3'b011 && func_7 == 7'b0000000;
    assign inst_xor = op == 7'b0110011 && func_3 == 3'b100 && func_7 == 7'b0000000;
    assign inst_srl = op == 7'b0110011 && func_3 == 3'b101 && func_7 == 7'b0000000;
    assign inst_srlw = op == 7'b0111011 && func_3 == 3'b101 && func_7 == 7'b0000000;
    assign inst_sra = op == 7'b0110011 && func_3 == 3'b101 && func_7 == 7'b0100000;
    assign inst_sraw = op == 7'b0111011 && func_3 == 3'b101 && func_7 == 7'b0100000;
    assign inst_or = op == 7'b0110011 && func_3 == 3'b110 && func_7 == 7'b0000000;
    assign inst_and = op == 7'b0110011 && func_3 == 3'b111 && func_7 == 7'b0000000;

    assign inst_fence = op == 7'b0001111 && func_3 == 3'b000;
    assign inst_fence_i = op == 7'b0001111 && func_3 == 3'b001;

    assign inst_ecall = op == 7'b1110011 && func_3 == 3'b000 && imm_11_0 == 12'b000000000000;
    assign inst_ebreak = op == 7'b1110011 && func_3 == 3'b000 && imm_11_0 == 12'b000000000001;

    assign inst_csrrw = op == 7'b1110011 && func_3 == 3'b001;
    assign inst_csrrs = op == 7'b1110011 && func_3 == 3'b010;
    assign inst_csrrc = op == 7'b1110011 && func_3 == 3'b011;
    assign inst_csrrwi = op == 7'b1110011 && func_3 == 3'b101;
    assign inst_csrrsi = op == 7'b1110011 && func_3 == 3'b110;
    assign inst_csrrci = op == 7'b1110011 && func_3 == 3'b111;

    assign inst_sret = op == 7'b1110011 && func_7 == 7'b0001000 && rs2 == 5'b00010;
    assign inst_mret = op == 7'b1110011 && func_7 == 7'b0011000 && rs2 == 5'b00010;
    assign inst_wfi = op == 7'b1110011 && func_7 == 7'b0001000 && rs2 == 5'b00101;
    assign inst_sfence_vma = op == 7'b1110011 && func_7 == 7'b0001001;

    assign shift_op       = inst_sll   | inst_slli  | inst_srl   | inst_srli   | inst_sra    | inst_srai | inst_sllw | inst_slliw | inst_srlw | inst_srliw | inst_sraw | inst_sraiw;
    assign arithmetic_op  = inst_add   | inst_addi  | inst_sub   | inst_lui    | inst_auipc  | inst_addw | inst_subw | inst_addiw;
    assign logic_op       = inst_xor   | inst_xori  | inst_or    | inst_ori    | inst_and    | inst_andi;
    assign compare_op     = inst_slt   | inst_slti  | inst_sltu  | inst_sltiu;
    assign branch_op      = inst_beq   | inst_bne   | inst_blt   | inst_bge    | inst_bltu   | inst_bgeu;
    assign jumplink_op    = inst_jal   | inst_jalr;
    assign synch_op       = inst_fence | inst_fence_i;
    assign environment_op = inst_ecall | inst_ebreak;
    assign CSR_op         = inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi | inst_csrrci;
    assign load_op        = inst_lb    | inst_lh    | inst_lbu   | inst_lhu    | inst_lw     | inst_lwu  | inst_ld;
    assign store_op       = inst_sb    | inst_sh    | inst_sw    | inst_sd;
////////////////////////////////////////////////////////
    assign write_to_regfile = inst_sll   | inst_slli   | inst_srl  | inst_srli  | inst_srai | inst_add   | inst_addi   | inst_sub   | inst_lui   |
                              inst_auipc | inst_xor    | inst_xori | inst_or    | inst_ori  | inst_and   | inst_andi   | inst_slt   | inst_slti  |
                              inst_sltu  | inst_sltiu  | inst_jalr | inst_lb    | inst_lh   | inst_lbu   | inst_lw     | inst_sllw  | inst_srlw  |
                              inst_slliw | inst_srliw  | inst_sraw | inst_sraiw | inst_addw | inst_addiw | inst_subw   | inst_lwu   | inst_ld    |
                              inst_csrrw | inst_csrrwi | inst_jal  | inst_lhu   | inst_sra  | inst_csrrc | inst_csrrci | inst_csrrs | inst_csrrsi;
    assign reg_addr = rd;
////////////////////////////////////////////////////////控制寄存器堆
    //wire [63:0] rdata1;
    //wire [63:0] rdata2;

    //regfile Regfile(.clk(clk), .reset(reset), .en(wb_write_to_regfile), .raddr1(inst[19:15]), .raddr2(inst[24:20]), .waddr(waddr), .wdata(wdata), .rdata1(rdata1), .rdata2(rdata2));


////////////////////////////////////////////////////////
    assign ALUControl = {
        inst_addi | inst_add  | inst_sb | inst_sh | inst_sw | inst_sd | inst_lb | inst_lh | inst_lbu | inst_lhu | inst_lw | inst_lwu | inst_ld,
        inst_addw | inst_addiw ,
        inst_sub,
        inst_subw,
        inst_lui,
        inst_auipc,
        inst_xor  | inst_xori,
        inst_or   | inst_ori,
        inst_and  | inst_andi,
        inst_sltu | inst_sltiu,
        inst_sll  | inst_slli,
        inst_sllw | inst_slliw,
        inst_srl  | inst_srli,
        inst_srlw | inst_srliw,
        inst_sra  | inst_srai,
        inst_sraw | inst_sraiw,
        inst_slt  | inst_slti
    };
////////////////////////////////////////////////////////
    wire is_branch = inst_beq  & (data1 == data2) |
                     inst_bne  & (data1 != data2) |
                     inst_blt  & (data1[63] == 0 ? (data2[63] == 1 ? 0 : data1 < data2) : (data2[63] == 0 ? 1 : data1 < data2)) |
                     inst_bge  & (data1[63] == 0 ? (data2[63] == 1 ? 1 : data1 >= data2) : (data2[63] == 0 ? 0 : data1 >= data2)) |
                     inst_bltu & (data1 <  data2) |
                     inst_bgeu & (data1 >= data2);
    assign is_jump = inst_jalr | inst_jal;

    wire [63:0] jump_pc;
    wire [63:0] branch_pc;
    wire [63:0] jalr_pc;
    
    assign jalr_pc = data1 + {{52{inst[31]}}, inst[31:20]};

    assign jump_pc = inst_jal ? inst_addr + {{(43){inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0} : {jalr_pc[63:1], 1'b0};
    assign branch_pc = inst_addr + {{(51){inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};

    assign shift = inst_slli | inst_slliw | inst_srli | inst_srliw | inst_srai | inst_sraiw;
    assign shamt_ext = {58'd0, inst[25:20]};
    
    assign pcsource = is_jump | (is_branch & branch_op);
    assign b_j_pc = is_jump ? jump_pc : (is_branch & branch_op ? branch_pc : 64'd0);

    assign sext_imm = inst_auipc ? {{32{inst[31]}}, inst[31:12], 12'd0} : (inst_sb | inst_sh | inst_sw | inst_sd) ? {{52{imm_11_5_4_0[11]}}, imm_11_5_4_0[11:0]} : (inst_lui ? {{44{inst[31]}}, inst[31:12]} : {{53{imm_11_0[11]}}, imm_11_0[10:0]});
    assign aluimm = inst_lui | inst_auipc | inst_addi | inst_slti | inst_sltiu | inst_xori | inst_ori | inst_andi | inst_addiw | inst_lb | inst_lh | inst_lbu | inst_lhu | inst_lw | inst_lwu | inst_ld | inst_sb | inst_sh | inst_sw | inst_sd;

    assign mem_to_regfile = load_op;
    assign mem_control = inst_lb ? 4'b0001 : (inst_lh ? 4'b0010 : (inst_lbu ? 4'b0011 : (inst_lhu ? 4'b0100 : (inst_lw ? 4'b0101 : (inst_lwu ? 4'b0110 : (inst_ld ? 4'b0111 : (inst_sb ? 4'b1000 : (inst_sh ? 4'b1001 : (inst_sw ? 4'b1010 : (inst_sd ? 4'b1011 : 4'b0000))))))))));

    assign csr_wdata = (inst_csrrci | inst_csrrwi | inst_csrrsi) ? {59'd0, rs1} : rdata1;
    assign csr_control = {
        inst_csrrw | inst_csrrwi,
        inst_csrrs | inst_csrrsi,
        inst_csrrc | inst_csrrci
    };

    assign o_except_ena = inst_ecall;
    assign o_excode = inst_ecall ? {1'b0, 63'd11} : 64'd0;

    assign flush_if_id = is_branch | is_jump;
    assign ret = inst_mret;

    assign stall = (exe_mem_to_regfile && exe_out_addr == rs1 && write_to_regfile) || (exe_mem_to_regfile && exe_out_addr == rs2 && write_to_regfile) || (mem_mem_to_regfile && mem_out_addr == rs1 && write_to_regfile) || (mem_mem_to_regfile && mem_out_addr == rs2 && write_to_regfile) ||
                   ((inst_sb | inst_sh | inst_sw | inst_sd) && mem_out_addr == rs1 && mem_mem_to_regfile) || ((inst_sb | inst_sh | inst_sw | inst_sd) && mem_out_addr == rs2 && mem_mem_to_regfile) ? 1'b1 : 1'b0;

////////////////////////////////////////////////////////
    reg [1:0] fwda;
    reg [1:0] fwdb;

    always@(*) begin
        fwda = 2'b00;
        if(reset) begin
            fwda = 2'b00;
        end else begin
            if(exe_write_to_regfile && (exe_out_addr != 0) && (rs1 == exe_out_addr) && ~exe_mem_to_regfile) begin
            fwda = 2'b01;
        end else begin
            if(mem_write_to_regfile && (mem_out_addr != 0) && (mem_out_addr == rs1) && ~mem_mem_to_regfile) begin
                fwda = 2'b10;
            end else begin
                if(mem_write_to_regfile && (mem_out_addr != 0) && (mem_out_addr == rs1) && mem_mem_to_regfile) begin
                    fwda = 2'b11;
                end
            end
        end
        end
    end

    always@(*) begin
        fwdb = 2'b00;
        if(reset) begin
            fwdb = 2'b00;
        end else begin
            if(exe_write_to_regfile && (exe_out_addr != 0) && (rs2 == exe_out_addr) && ~exe_mem_to_regfile) begin
            fwdb = 2'b01;
        end else begin
            if(mem_write_to_regfile && (mem_out_addr != 0) && (mem_out_addr == rs2) && ~mem_mem_to_regfile) begin
                fwdb = 2'b10;
            end else begin
                if(mem_write_to_regfile && (mem_out_addr != 0) && (mem_out_addr == rs2) && mem_mem_to_regfile) begin
                    fwdb = 2'b11;
                end
            end
        end
        end
    end

    ysyx_210191_mux4x64 mux1(.control(fwda), .a0(rdata1), .a1(exe_out), .a2(mem_out_1), .a3(mem_out_2), .out(data1));
    ysyx_210191_mux4x64 mux2(.control(fwdb), .a0(rdata2), .a1(exe_out), .a2(mem_out_1), .a3(mem_out_2), .out(data2));
////////////////////////////////////////////////////////
endmodule
module ysyx_210191_exe(
    input [63:0] sext_imm,
    input aluimm,
    input [63:0] data1,
    input [63:0] data2,
    input is_jump,
    input [16:0] ALUControl,
    input [2:0] csr_control,
    input [63:0] csr_wdata,
    input [63:0] csr_data,
    input [63:0] i_pc,
    input shift,
    input [63:0] shamt_ext,

    output [63:0] data,
    output [63:0] csr_data_res,
    output write_ena

);

    wire [63:0] alu_data1;
    wire [63:0] alu_data2;
    wire [63:0] res;
    wire [63:0] csrrci;
    assign csrrci = csr_data & ~csr_wdata;

    assign alu_data1 = ALUControl == 17'b00000100000000000 ? i_pc : data1;
    assign alu_data2 =  aluimm ? sext_imm : (shift ? shamt_ext : data2);
    assign csr_data_res = csr_control == 3'b100 ? csr_wdata :
                        (csr_control == 3'b010 ? csr_data | csr_wdata :
                        (csr_control == 3'b001 ? {csr_data[63:5], csrrci[4:0]} : 64'd0));
    assign write_ena = csr_control[2] | csr_control[1] | csr_control[0];

    ysyx_210191_ALU alu(.data1(alu_data1), .data2(alu_data2), .ALUControl(ALUControl), .res(res));

    assign data = is_jump ? i_pc + 4 : ((csr_control[0] | csr_control[1] | csr_control[2]) ? csr_data : res);

endmodule
module ysyx_210191_exe_mem(
    input clk,
    input reset,
    input [5:0] stall,

    input i_write_to_regfile,
    input [4:0] i_reg_addr,
    input [63:0] i_data1,
    input [63:0] i_data2,
    input [3:0] i_mem_control,
    input i_mem_to_regfile,
    input [63:0] i_pc,
    input [63:0] i_excode,
    input i_except_ena,
    input flush,
    input i_ret,
    input i_csr_write_ena,
    input [63:0] i_csr_data_res,
    input [11:0] i_csr,
    input i_mtime_int,

    output reg o_write_to_regfile,
    output reg [4:0] o_reg_addr,
    output reg [63:0] o_data1,
    output reg [63:0] o_data2,
    output reg [3:0] o_mem_control,
    output reg o_mem_to_regfile,
    output reg [63:0] o_pc,
    output reg [63:0] o_excode,
    output reg o_except_ena,
    output reg o_ret,
    output reg o_csr_write_ena,
    output reg [63:0] o_csr_data_res,
    output reg [11:0] o_csr,
    output reg o_mtime_int
);

    always @(posedge clk) begin
        if(reset) begin
            o_write_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_data1 <= 64'd0;
            o_data2 <= 64'd0;
            o_mem_control <= 4'd0;
            o_mem_to_regfile <= 1'b0;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_csr_data_res <= 64'd0;
            o_csr_write_ena <= 1'b0;
            o_csr <= 12'd0;
            o_mtime_int <= 1'b0;
        end else if(flush) begin
            o_write_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_data1 <= 64'd0;
            o_data2 <= 64'd0;
            o_mem_control <= 4'd0;
            o_mem_to_regfile <= 1'b0;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_csr_data_res <= 64'd0;
            o_csr_write_ena <= 1'b0;
            o_csr <= 12'd0;
            o_mtime_int <= 1'b0;
        end else if(stall[3] == 1'b0 && stall[4] == 1'b0) begin
            o_write_to_regfile <= i_write_to_regfile;
            o_reg_addr <= i_reg_addr;
            o_data1 <= i_data1;
            o_data2 <= i_data2;
            o_mem_control <= i_mem_control;
            o_mem_to_regfile <= i_mem_to_regfile;
            o_excode <= i_excode;
            o_except_ena <= i_except_ena;
            o_ret <= i_ret;
            o_csr_data_res <= i_csr_data_res;
            o_csr_write_ena <= i_csr_write_ena;
            o_csr <= i_csr;
            o_mtime_int <= i_mtime_int;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            o_pc <= 64'h0000000030000000;
        end else if(stall[3] == 1'b1 && stall[4] == 1'b0) begin
            o_pc <= 64'h0000000030000000;
        end else if(stall[3] == 1'b0 && stall[4] == 1'b0) begin
            o_pc <= i_pc;
        end
    end

endmodule
module ysyx_210191_id_exe(
    input clk,
    input reset,
    input [5:0] stall,

    input i_write_to_regfile,
    input [4:0] i_reg_addr,
    input [16:0] i_ALUControl,
    input [63:0] i_sext_imm,
    input i_aluimm,
    input [63:0] i_data1,
    input [63:0] i_data2,
    input i_is_jump,
    input [3:0] i_mem_control,
    input i_mem_to_regfile,
    input [63:0] i_pc,
    input [11:0] i_csr,
    input [63:0] i_csr_wdata,
    input [2:0] i_csr_control,
    input [63:0] i_excode,
    input i_except_ena,
    input flush,
    input i_ret,
    input i_shift,
    input [63:0] i_shamt_ext,
    input i_mtime_int,

    output reg o_write_to_regfile,
    output reg [4:0] o_reg_addr, //回到control_unit
    output reg [16:0] o_ALUControl,
    output reg [63:0] o_sext_imm,
    output reg o_aluimm,
    output reg [63:0] o_data1,
    output reg [63:0] o_data2,
    output reg o_is_jump,
    output reg [3:0] o_mem_control,
    output reg o_mem_to_regfile,
    output reg [63:0] o_pc,
    output reg [11:0] o_csr,
    output reg [63:0] o_csr_wdata,
    output reg [2:0] o_csr_control,
    output reg [63:0] o_excode,
    output reg o_except_ena,
    output reg o_ret,
    output reg o_shift,
    output reg [63:0] o_shamt_ext,
    output reg o_mtime_int
);

    always@(posedge clk) begin
        if(reset) begin
            o_write_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_ALUControl <= 17'd0;
            o_sext_imm <= 64'd0;
            o_aluimm <= 1'b0;
            o_data1 <= 64'd0;
            o_data2 <= 64'd0;
            o_is_jump <= 1'b0;
            o_mem_control <= 4'b0000;
            o_mem_to_regfile <= 1'b0;
            o_csr <= 12'd0;
            o_csr_wdata <= 64'd0;
            o_csr_control <= 3'b000;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_shift <= 1'b0;
            o_shamt_ext <= 64'd0;
            o_mtime_int <= 1'b0;
        end else if(flush) begin
            o_write_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_ALUControl <= 17'd0;
            o_sext_imm <= 64'd0;
            o_aluimm <= 1'b0;
            o_data1 <= 64'd0;
            o_data2 <= 64'd0;
            o_is_jump <= 1'b0;
            o_mem_control <= 4'b0000;
            o_mem_to_regfile <= 1'b0;
            o_csr <= 12'd0;
            o_csr_wdata <= 64'd0;
            o_csr_control <= 3'b000;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_shift <= 1'b0;
            o_shamt_ext <= 64'd0;
            o_mtime_int <= 1'b0;
        end else if(stall[2] == 1'b1 && stall[3] == 1'b0) begin
            o_write_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_ALUControl <= 17'd0;
            o_sext_imm <= 64'd0;
            o_aluimm <= 1'b0;
            o_data1 <= 64'd0;
            o_data2 <= 64'd0;
            o_is_jump <= 1'b0;
            o_mem_control <= 4'b0000;
            o_mem_to_regfile <= 1'b0;
            o_csr <= 12'd0;
            o_csr_wdata <= 64'd0;
            o_csr_control <= 3'b000;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_shift <= 1'b0;
            o_shamt_ext <= 64'd0;
            o_mtime_int <= 1'b0;
        end else if(stall[2] == 1'b0 && stall[3] == 1'b0) begin
            o_write_to_regfile <= i_write_to_regfile;
            o_reg_addr <= i_reg_addr;
            o_ALUControl <= i_ALUControl;
            o_sext_imm <= i_sext_imm;
            o_aluimm <= i_aluimm;
            o_data1 <= i_data1;
            o_data2 <= i_data2;
            o_is_jump <= i_is_jump;
            o_mem_control <= i_mem_control;
            o_mem_to_regfile <= i_mem_to_regfile;
            o_csr <= i_csr;
            o_csr_wdata <= i_csr_wdata;
            o_csr_control <= i_csr_control;
            o_excode <= i_excode;
            o_except_ena <= i_except_ena;
            o_ret <= i_ret;
            o_shift <= i_shift;
            o_shamt_ext <= i_shamt_ext;
            o_mtime_int <= i_mtime_int;
        end
    end

    always@(posedge clk) begin
        if(reset) begin
            o_pc <= 64'h0000000030000000;
        end else if(stall[2] == 1'b0 && stall[3] == 1'b0) begin
            o_pc <= i_pc;
        end
    end

endmodule
module ysyx_210191_If(
    input clk,
    input reset,
    input inst_r_valid,
    input stall_from_mem,
    input flush_if_id,

    output stall_o,
    output inst_r_ena
);
    assign stall_o = ~inst_r_valid;
    
    assign inst_r_ena = stall_from_mem ? 1'b0 : 1'b1;

endmodule
module ysyx_210191_if_id(
    input clk,
    input reset,
    input [5:0] stall,

    input [31:0] i_inst,
    input [63:0] i_inst_addr,
    input i_inst_r_valid,
    input flush_if_id,
    input flush,
    input keep,
    input [63:0] new_pc,
    input [63:0] b_j_pc,
    input pcsource,
    input ret,

    output reg [31:0] o_inst,
    output reg [63:0] o_inst_addr
);

    always @(posedge clk) begin
        if(reset) begin
            o_inst <= 32'd0;
            o_inst_addr <= 64'h0000000030000000;
        end else if(keep) begin
            o_inst <= o_inst;
            o_inst_addr <= o_inst_addr;
        end else if(flush | ret) begin
            o_inst <= 32'd0;
            o_inst_addr <= new_pc;
        end else if(stall[1] == 1'b0 && stall[2] == 1'b0) begin
            if(flush_if_id) begin
                o_inst <= 32'd0;
                o_inst_addr <= pcsource ? b_j_pc : 64'd0;
            end else begin
                o_inst_addr <= i_inst_addr;
                o_inst <= i_inst;
            end
        end
    end
endmodule
module ysyx_210191_mem(
    input [63:0] mem_data_i,
    input [3:0] mem_control,
    input [63:0] mem_addr,
    input data_w_valid,
    input data_r_valid,
    input [63:0] mem_wdata,

    output reg [63:0] mem_data_o,
    output reg [7:0] mem_mask,
    output data_r_ena,
    output data_w_ena,
    output [31:0] data_w_addr,
    output stall_o,
    output [63:0] data_w_data,
    output [31:0] data_r_addr,

    output mtime_ena,
    output mtimecmp_ena,
    output [63:0] time_wdata,
    input [63:0] mtime_data,
    input [63:0] mtimecmp_data,
    output [2:0] awsize,
    output [2:0] arsize
);

    assign data_w_addr = mem_addr[31:0];
    assign data_r_addr = mem_addr[31:0];
    assign data_w_data = mem_control == 4'b1000 ? {mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0]} : (mem_control == 4'b1001 ? {mem_wdata[15:0], mem_wdata[15:0], mem_wdata[15:0], mem_wdata[15:0]} : (mem_control == 4'b1010 ? {mem_wdata[31:0], mem_wdata[31:0]} : (mem_control == 4'b1011 ? mem_wdata : 64'd0)));
    assign stall_o = ((~data_r_valid && (mem_control == 4'b0001 | mem_control == 4'b0010 | mem_control == 4'b0011 | mem_control == 4'b0100 | mem_control == 4'b0101 | mem_control == 4'b0110 | mem_control == 4'b0111)) || (~data_w_valid && (mem_control == 4'b1000 | mem_control == 4'b1001 | mem_control == 4'b1010 | mem_control == 4'b1011))) && mem_addr != 64'h0000000002004000 && mem_addr != 64'h000000000200bff8;
    assign data_r_ena = ~data_r_valid && (mem_control == 4'b0001 | mem_control == 4'b0010 | mem_control == 4'b0011 | mem_control == 4'b0100 | mem_control == 4'b0101 | mem_control == 4'b0110 | mem_control == 4'b0111) && mem_addr != 64'h0000000002004000 && mem_addr != 64'h000000000200bff8;
    assign data_w_ena = ~data_w_valid && (mem_control == 4'b1000 | mem_control == 4'b1001 | mem_control == 4'b1010 | mem_control == 4'b1011) && mem_addr != 64'h0000000002004000 && mem_addr != 64'h000000000200bff8;
    assign mtime_ena = (mem_control == 4'b1000 | mem_control == 4'b1001 | mem_control == 4'b1010 | mem_control == 4'b1011) && mem_addr == 64'h000000000200bff8;
    assign mtimecmp_ena = (mem_control == 4'b1000 | mem_control == 4'b1001 | mem_control == 4'b1010 | mem_control == 4'b1011) && mem_addr == 64'h0000000002004000;
    assign time_wdata = data_w_data;

    assign awsize = data_w_addr <= 32'h80000000 ? mem_control == 4'b1000 ? 3'b000 : (mem_control == 4'b1001 ? 3'b001 : (mem_control == 4'b1010 ? 3'b010 : (mem_control == 4'b1011 ? 3'b011 : 3'b000))) : 3'b011;
    assign arsize = data_r_addr <= 32'h80000000 ? mem_control == 4'b0001 || mem_control == 4'b0011 ? 3'b000 : (mem_control == 4'b0010 || mem_control == 4'b0100 ? 3'b001 : (mem_control == 4'b0101 || mem_control == 4'b0110 ? 3'b010 : mem_control == 4'b0111 ? 3'b011 : 3'b000)) : 3'b011;

    wire [63:0] mem_r_data;
    assign mem_r_data = mem_addr == 64'h0000000002004000 ? mtimecmp_data : (mem_addr == 64'h000000000200bff8 ? mtime_data : mem_data_i);

    always @(*) begin
        case (mem_control)
            4'b0001 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_data_o = {{56{mem_r_data[7]}}, mem_r_data[7:0]};
                        mem_mask = 8'b00000000;
                    end
                    3'b001 : begin
                        mem_data_o = {{56{mem_r_data[15]}}, mem_r_data[15:8]};
                        mem_mask = 8'b00000000;
                    end
                    3'b010 : begin
                        mem_data_o = {{56{mem_r_data[23]}}, mem_r_data[23:16]};
                        mem_mask = 8'b00000000;
                    end
                    3'b011 : begin
                        mem_data_o = {{56{mem_r_data[31]}}, mem_r_data[31:24]};
                        mem_mask = 8'b00000000;
                    end
                    3'b100 : begin
                        mem_data_o = {{56{mem_r_data[39]}}, mem_r_data[39:32]};
                        mem_mask = 8'b00000000;
                    end
                    3'b101 : begin
                        mem_data_o = {{56{mem_r_data[47]}}, mem_r_data[47:40]};
                        mem_mask = 8'b00000000;
                    end
                    3'b110 : begin
                        mem_data_o = {{56{mem_r_data[55]}}, mem_r_data[55:48]};
                        mem_mask = 8'b00000000;
                    end
                    3'b111 : begin
                        mem_data_o = {{56{mem_r_data[63]}}, mem_r_data[63:56]};
                        mem_mask = 8'b00000000;
                    end
                    default : begin
                        mem_data_o = 64'd0;
                        mem_mask = 8'b00000000;
                    end
                endcase
            end
            4'b0010 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_data_o = {{48{mem_r_data[15]}}, mem_r_data[15:0]};
                        mem_mask = 8'b00000000;
                    end
                    3'b010 : begin
                        mem_data_o = {{48{mem_r_data[31]}}, mem_r_data[31:16]};
                        mem_mask = 8'b00000000;
                    end
                    3'b100 : begin
                        mem_data_o = {{48{mem_r_data[47]}}, mem_r_data[47:32]};
                        mem_mask = 8'b00000000;
                    end
                    3'b110 : begin
                        mem_data_o = {{48{mem_r_data[63]}}, mem_r_data[63:48]};
                        mem_mask = 8'b00000000;
                    end
                    default : begin
                        mem_data_o = 64'd0;
                        mem_mask = 8'b00000000;
                    end
                endcase
            end
            4'b0011 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_data_o = {56'd0, mem_r_data[7:0]};
                        mem_mask = 8'b00000000;
                    end
                    3'b001 : begin
                        mem_data_o = {56'd0, mem_r_data[15:8]};
                        mem_mask = 8'b00000000;
                    end
                    3'b010 : begin
                        mem_data_o = {56'd0, mem_r_data[23:16]};
                        mem_mask = 8'b00000000;
                    end
                    3'b011 : begin
                        mem_data_o = {56'd0, mem_r_data[31:24]};
                        mem_mask = 8'b00000000;
                    end
                    3'b100 : begin
                        mem_data_o = {56'd0, mem_r_data[39:32]};
                        mem_mask = 8'b00000000;
                    end
                    3'b101 : begin
                        mem_data_o = {56'd0, mem_r_data[47:40]};
                        mem_mask = 8'b00000000;
                    end
                    3'b110 : begin
                        mem_data_o = {56'd0, mem_r_data[55:48]};
                        mem_mask = 8'b00000000;
                    end
                    3'b111 : begin
                        mem_data_o = {56'd0, mem_r_data[63:56]};
                        mem_mask = 8'b00000000;
                    end
                    default : begin
                        mem_data_o = 64'd0;
                        mem_mask = 8'b00000000;
                    end
                endcase
            end
            4'b0100 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_data_o = {48'd0, mem_r_data[15:0]};
                        mem_mask = 8'b00000000;
                    end
                    3'b010 : begin
                        mem_data_o = {48'd0, mem_r_data[31:16]};
                        mem_mask = 8'b00000000;
                    end
                    3'b100 : begin
                        mem_data_o = {48'd0, mem_r_data[47:32]};
                        mem_mask = 8'b00000000;
                    end
                    3'b110 : begin
                        mem_data_o = {48'd0, mem_r_data[63:48]};
                        mem_mask = 8'b00000000;
                    end
                    default : begin
                        mem_data_o = 64'd0;
                        mem_mask = 8'b00000000;
                    end
                endcase
            end
            4'b0101 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_data_o = {{32{mem_r_data[31]}}, mem_r_data[31:0]};
                        mem_mask = 8'b00000000;
                    end
                    3'b100 : begin
                        mem_data_o = {{32{mem_r_data[63]}}, mem_r_data[63:32]};
                        mem_mask = 8'b00000000;
                    end
                    default : begin
                        mem_data_o = 64'd0;
                        mem_mask = 8'b00000000;
                    end
                endcase
            end
            4'b0110 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_data_o = {32'd0, mem_r_data[31:0]};
                        mem_mask = 8'b00000000;
                    end
                    3'b100 : begin
                        mem_data_o = {32'd0, mem_r_data[63:32]};
                        mem_mask = 8'b00000000;
                    end
                    default : begin
                        mem_data_o = 64'd0;
                        mem_mask = 8'b00000000;
                    end
                endcase
            end
            4'b0111 : begin
                mem_data_o = mem_r_data;
                mem_mask = 8'b00000000;
            end
            4'b1000 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_mask = 8'b00000001;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0], mem_wdata[7:0]};
                    end
                    3'b001 : begin
                        mem_mask = 8'b00000010;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[15:8], mem_wdata[15:8], mem_wdata[15:8], mem_wdata[15:8], mem_wdata[15:8], mem_wdata[15:8], mem_wdata[15:8], mem_wdata[15:8]};
                    end
                    3'b010 : begin
                        mem_mask = 8'b00000100;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[23:16], mem_wdata[23:16], mem_wdata[23:16], mem_wdata[23:16], mem_wdata[23:16], mem_wdata[23:16], mem_wdata[23:16], mem_wdata[23:16]};
                    end
                    3'b011 : begin
                        mem_mask = 8'b00001000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[31:24], mem_wdata[31:24], mem_wdata[31:24], mem_wdata[31:24], mem_wdata[31:24], mem_wdata[31:24], mem_wdata[31:24], mem_wdata[31:24]};
                    end
                    3'b100 : begin
                        mem_mask = 8'b00010000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[39:32], mem_wdata[39:32], mem_wdata[39:32], mem_wdata[39:32], mem_wdata[39:32], mem_wdata[39:32], mem_wdata[39:32], mem_wdata[39:32]};
                    end
                    3'b101 : begin
                        mem_mask = 8'b00100000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[47:40], mem_wdata[47:40], mem_wdata[47:40], mem_wdata[47:40], mem_wdata[47:40], mem_wdata[47:40], mem_wdata[47:40], mem_wdata[47:40]};
                    end
                    3'b110 : begin
                        mem_mask = 8'b01000000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[55:48], mem_wdata[55:48], mem_wdata[55:48], mem_wdata[55:48], mem_wdata[55:48], mem_wdata[55:48], mem_wdata[55:48], mem_wdata[55:48]};
                    end
                    3'b111 : begin
                        mem_mask = 8'b10000000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[63:56], mem_wdata[63:56], mem_wdata[63:56], mem_wdata[63:56], mem_wdata[63:56], mem_wdata[63:56], mem_wdata[63:56], mem_wdata[63:56]};
                    end
                    default : begin
                        mem_mask = 8'b00000000;
                        mem_data_o = 64'd0;
                    end
                endcase
            end
            4'b1001 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_mask = 8'b00000011;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[15:0], mem_wdata[15:0], mem_wdata[15:0], mem_wdata[15:0]};
                    end
                    3'b010 : begin
                        mem_mask = 8'b00001100;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[31:16], mem_wdata[31:16], mem_wdata[31:16], mem_wdata[31:16]};
                    end
                    3'b100 : begin
                        mem_mask = 8'b00110000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[47:32], mem_wdata[47:32], mem_wdata[47:32], mem_wdata[47:32]};
                    end
                    3'b110 : begin
                        mem_mask = 8'b11000000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[63:48], mem_wdata[63:48], mem_wdata[63:48], mem_wdata[63:48]};
                    end
                    default : begin
                        mem_mask = 8'b00000000;
                        mem_data_o = 64'd0;
                    end
                endcase
            end
            4'b1010 : begin
                case(mem_addr[2:0])
                    3'b000 : begin
                        mem_mask = 8'b00001111;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[31:0], mem_wdata[31:0]};
                    end
                    3'b100 : begin
                        mem_mask = 8'b11110000;
                        mem_data_o = 64'd0;
                        //data_w_data = {mem_wdata[63:32], mem_wdata[63:32]};
                    end
                    default : begin
                        mem_mask = 8'b00000000;
                        mem_data_o = 64'd0;
                    end
                endcase
            end
            4'b1011 : begin
                mem_mask = 8'b11111111;
                mem_data_o = 64'd0;
                //data_w_data = mem_wdata[63:0];
            end
            default : begin
                mem_mask = 8'b00000000;
                mem_data_o = 64'd0;
            end
        endcase
    end    

endmodule
module ysyx_210191_mem_wb(
    input clk,
    input reset,
    input [5:0] stall,

    input i_write_to_regfile,//回id
    input i_mem_to_regfile,
    input [4:0] i_reg_addr,//回id
    input [63:0] i_alu_data,
    input [63:0] i_mem_data,
    input [63:0] i_pc,
    input [63:0] i_excode,
    input i_except_ena,
    input flush,
    input i_ret,
    input i_csr_write_ena,
    input [63:0] i_csr_data_res,
    input [11:0] i_csr,
    input i_mtime_int,

    output reg o_write_to_regfile,
    output reg o_mem_to_regfile,
    output reg [4:0] o_reg_addr,
    output reg [63:0] o_alu_data,
    output reg [63:0] o_mem_data,
    output reg [63:0] o_pc,
    output reg [63:0] o_excode,
    output reg o_except_ena,
    output reg o_ret,
    output reg o_csr_write_ena,
    output reg [63:0] o_csr_data_res,
    output reg [11:0] o_csr,
    output reg o_mtime_int
);

    always @(posedge clk) begin
        if(reset) begin
            o_write_to_regfile <= 1'b0;
            o_mem_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_alu_data <= 64'd0;
            o_mem_data <= 64'd0;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_csr_data_res <= 64'd0;
            o_csr_write_ena <= 1'b0;
            o_csr <= 12'd0;
            o_mtime_int <= 1'b0;
        end else if(flush) begin
            o_write_to_regfile <= 1'b0;
            o_mem_to_regfile <= 1'b0;
            o_reg_addr <= 5'd0;
            o_alu_data <= 64'd0;
            o_mem_data <= 64'd0;
            o_excode <= 64'd0;
            o_except_ena <= 1'b0;
            o_ret <= 1'b0;
            o_csr_data_res <= 64'd0;
            o_csr_write_ena <= 1'b0;
            o_csr <= 12'd0;
            o_mtime_int <= 1'b0;
        end else if(stall[4] == 1'b0 && stall[5] == 1'b0) begin
            o_write_to_regfile <= i_write_to_regfile;
            o_mem_to_regfile <= i_mem_to_regfile;
            o_reg_addr <= i_reg_addr;
            o_alu_data <= i_alu_data;
            o_mem_data <= i_mem_data;
            o_excode <= i_excode;
            o_except_ena <= i_except_ena;
            o_ret <= i_ret;
            o_csr_data_res <= i_csr_data_res;
            o_csr_write_ena <= i_csr_write_ena;
            o_csr <= i_csr;
            o_mtime_int <= i_mtime_int;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            o_pc <= 64'h0000000030000000;
        end else if(stall[4] == 1'b0 && stall[5] == 1'b0) begin
            o_pc <= i_pc;
        end
    end
endmodule
module ysyx_210191_mux4x64(
    input  [1:0] control,
    input  [63:0] a0,
    input  [63:0] a1,
    input  [63:0] a2,
    input  [63:0] a3,
    output [63:0] out
);
    assign out = control == 2'b00 ? a0 : (control == 2'b01 ? a1 : (control == 2'b10 ? a2 : a3));
endmodule
module ysyx_210191_mycpu(
    input clock,
    input reset,

    input data_r_valid,
    input data_w_valid,
    input [63:0] data_r_data,
    input [31:0] inst_r_data,
    input inst_r_valid,
    input ext_int,

    output inst_r_ena,
    output [31:0] inst_addr,
    output [31:0] data_w_addr,
    output [63:0] data_w_data,
    output data_w_ena,
    output data_r_ena,
    output [31:0] data_r_addr,
    output [7:0] mem_mask,
    output flush,
    output [2:0] awsize,
    output [2:0] arsize
);

    wire [63:0] inst_r_addr;
    wire [5:0] stall;
    wire [63:0] npc;
    wire [63:0] pc;
    wire [31:0] if_id_o_inst;
    wire [63:0] if_id_o_inst_addr;
    wire id_write_to_regfile;
    wire [4:0] id_reg_addr;
    wire [16:0] id_ALUControl;
    wire id_pcsource;
    wire [63:0] b_j_pc;
    wire [63:0] id_sext_imm;
    wire id_aluimm;
    wire [63:0] id_data1;
    wire [63:0] id_data2;
    wire id_is_jump;
    wire [3:0] id_mem_control;
    wire id_mem_to_regfile;
    wire [11:0] id_csr;
    wire [63:0] id_csr_wdata;
    wire [2:0] id_csr_control;
    wire [63:0] id_o_excode;
    wire id_o_except_ena;
    wire id_o_ret;
    wire id_o_shift;
    wire [63:0] id_o_shamt_ext;
    wire exe_write_to_regfile;
    wire [4:0] exe_reg_addr;
    wire [16:0] exe_ALUControl;
    wire [63:0] exe_sext_imm;
    wire exe_aluimm;
    wire [63:0] exe_data1;
    wire [63:0] exe_data2;
    wire [63:0] exe_jump_pc;
    wire exe_is_jump;
    wire [3:0] exe_mem_control;
    wire exe_mem_to_regfile;
    wire [63:0] exe_data;
    wire [63:0] exe_pc;
    wire [11:0] exe_csr;
    wire [63:0] exe_csr_wdata;
    wire [2:0] exe_csr_control;
    wire [63:0] exe_excode;
    wire exe_except_ena;
    wire exe_ret;
    wire [63:0] exe_o_csr_data_res;
    wire exe_o_write_ena;
    wire exe_shift;
    wire [63:0] exe_shamt_ext;
    wire exe_mtime_int;
    wire mem_write_to_regfile;
    wire [4:0] mem_reg_addr;
    wire [63:0] mem_data1;
    wire [63:0] mem_data2;
    wire [3:0] mem_mem_control;
    wire mem_mem_to_regfile;
    wire [63:0] mem_data_o;
    wire [63:0] mem_pc;
    wire [63:0] mem_excode;
    wire mem_except_ena;
    wire mem_wb_except_ena;
    wire mem_ret;
    wire mem_csr_write_ena;
    wire [63:0] mem_csr_data_res;
    wire [11:0] mem_csr;
    wire wb_write_to_regfile;
    wire wb_mem_to_regfile;
    wire [4:0] wb_reg_addr;
    wire [63:0] wb_alu_data;
    wire [63:0] wb_mem_data;
    wire [63:0] wb_data_out;
    wire [63:0] wb_pc;
    wire [63:0] wb_excode;
    wire wb_except_ena;
    wire wb_ret;
    wire wb_csr_write_ena;
    wire [63:0] wb_csr_data_res;
    wire [11:0] wb_csr;
    wire wb_mtime_int;
    wire [63:0] rdata1;
    wire [63:0] rdata2;
    wire [63:0] csr_data;
    wire [63:0] csr_wdata;
    wire csr_write_ena;

    wire flush_if_id;
    wire [63:0] new_pc;
    wire ret;
    wire [63:0] mtvec_pc;
    wire [63:0] epc;
    wire stall_from_if;
    wire stall_from_mem;
    wire [63:0] time_wdata;
    wire mtimecmp_ena;
    wire mtime_ena;
    wire mem_mtime_int;
    wire [63:0] mtime_data;
    wire [63:0] mtimecmp_data;
    wire keep;
    wire clint_mtime_int;
    wire time_int;
    wire ecall;
    wire stall_from_id;

    ysyx_210191_pc PC(.clk(clock), .reset(reset), .stall(stall), .b_j_pc(b_j_pc), .pcsource(id_pcsource), .new_pc(new_pc), .flush(flush), .ret(wb_ret), .flush_if_id(flush_if_id), .o_inst_addr(inst_r_addr), .keep(keep), .inst_addr(inst_addr));

    ysyx_210191_If IF(.clk(clock), .reset(reset), .inst_r_valid(inst_r_valid), .stall_from_mem(stall_from_mem), .flush_if_id(flush_if_id), .stall_o(stall_from_if), .inst_r_ena(inst_r_ena));

    ysyx_210191_regfile Regfile(.clk(clock), .reset(reset), .en(wb_write_to_regfile), .raddr1(if_id_o_inst[19:15]), .raddr2(if_id_o_inst[24:20]), .waddr(wb_reg_addr), .wdata(wb_data_out), .rdata1(rdata1), .rdata2(rdata2), .time_int(time_int));

    ysyx_210191_if_id IF_ID(.clk(clock), .reset(reset), .stall(stall), .i_inst(inst_r_data), .i_inst_addr(inst_r_addr), .flush_if_id(flush_if_id), .flush(flush), .i_inst_r_valid(inst_r_valid), .keep(keep),
                .new_pc(new_pc), .pcsource(id_pcsource), .b_j_pc(b_j_pc), .o_inst(if_id_o_inst), .o_inst_addr(if_id_o_inst_addr), .ret(wb_ret));

    ysyx_210191_decode DECODE(.clk(clock), .reset(reset), .inst(if_id_o_inst), .inst_addr(if_id_o_inst_addr), .rdata1(rdata1), .rdata2(rdata2), .exe_out_addr(exe_reg_addr), .exe_out(exe_data), .mem_out_addr(mem_reg_addr),
                  .mem_out_1(mem_data1), .mem_out_2(mem_data_o), .exe_write_to_regfile(exe_write_to_regfile), .mem_write_to_regfile(mem_write_to_regfile), .exe_mem_to_regfile(exe_mem_to_regfile), .mem_mem_to_regfile(mem_mem_to_regfile),
                  .stall(stall_from_id),
                  .write_to_regfile(id_write_to_regfile), .reg_addr(id_reg_addr), .ALUControl(id_ALUControl), .b_j_pc(b_j_pc), .pcsource(id_pcsource),
                  .sext_imm(id_sext_imm), .aluimm(id_aluimm), .data1(id_data1), .data2(id_data2), .is_jump(id_is_jump), .mem_control(id_mem_control), .mem_to_regfile(id_mem_to_regfile), .csr(id_csr), .csr_wdata(id_csr_wdata),
                  .csr_control(id_csr_control), .o_excode(id_o_excode), .o_except_ena(id_o_except_ena), .flush_if_id(flush_if_id), .ret(id_o_ret), .shift(id_o_shift), .shamt_ext(id_o_shamt_ext));
    
    ysyx_210191_id_exe ID_EXE(.clk(clock), .reset(reset), .stall(stall), .i_write_to_regfile(id_write_to_regfile), .i_reg_addr(id_reg_addr), .i_ALUControl(id_ALUControl),
                  .i_sext_imm(id_sext_imm), .i_aluimm(id_aluimm), .i_data1(id_data1), .i_data2(id_data2), .i_is_jump(id_is_jump), .i_mem_control(id_mem_control), .i_mem_to_regfile(id_mem_to_regfile),
                  .i_pc(if_id_o_inst_addr), .i_csr(id_csr), .i_csr_wdata(id_csr_wdata), .i_csr_control(id_csr_control), .i_excode(id_o_excode), .i_except_ena(id_o_except_ena),
                  .flush(flush), .i_ret(id_o_ret), .i_shift(id_o_shift), .i_shamt_ext(id_o_shamt_ext), .i_mtime_int(clint_mtime_int),
                  .o_write_to_regfile(exe_write_to_regfile), .o_reg_addr(exe_reg_addr), .o_ALUControl(exe_ALUControl), .o_sext_imm(exe_sext_imm),
                  .o_aluimm(exe_aluimm), .o_data1(exe_data1), .o_data2(exe_data2), .o_is_jump(exe_is_jump), .o_mem_control(exe_mem_control), .o_mem_to_regfile(exe_mem_to_regfile),
                  .o_pc(exe_pc), .o_csr(exe_csr), .o_csr_wdata(exe_csr_wdata), .o_csr_control(exe_csr_control), .o_excode(exe_excode), .o_except_ena(exe_except_ena), .o_ret(exe_ret),
                  .o_shift(exe_shift), .o_shamt_ext(exe_shamt_ext), .o_mtime_int(exe_mtime_int));
    
    ysyx_210191_exe EXE(.sext_imm(exe_sext_imm), .aluimm(exe_aluimm), .data1(exe_data1), .data2(exe_data2), .is_jump(exe_is_jump), .ALUControl(exe_ALUControl), .csr_control(exe_csr_control),
            .csr_wdata(exe_csr_wdata), .csr_data(csr_data), .i_pc(exe_pc), .shift(exe_shift), .shamt_ext(exe_shamt_ext), .data(exe_data), .csr_data_res(exe_o_csr_data_res), .write_ena(exe_o_write_ena));
    
    ysyx_210191_exe_mem EXE_MEM(.clk(clock), .reset(reset), .stall(stall), .i_write_to_regfile(exe_write_to_regfile), .i_reg_addr(exe_reg_addr), .i_data1(exe_data), .i_data2(exe_data2),
                    .i_mem_control(exe_mem_control), .i_mem_to_regfile(exe_mem_to_regfile), .i_pc(exe_pc), .i_csr_write_ena(exe_o_write_ena), .i_csr_data_res(exe_o_csr_data_res),
                    .i_excode(exe_excode), .i_except_ena(exe_except_ena), .flush(flush), .i_ret(exe_ret), .i_csr(exe_csr), .i_mtime_int(exe_mtime_int),
                    .o_write_to_regfile(mem_write_to_regfile), .o_reg_addr(mem_reg_addr), .o_data1(mem_data1), .o_data2(mem_data2),
                    .o_mem_control(mem_mem_control), .o_mem_to_regfile(mem_mem_to_regfile), .o_pc(mem_pc), .o_csr(mem_csr), .o_mtime_int(mem_mtime_int),
                    .o_excode(mem_excode), .o_except_ena(mem_except_ena), .o_ret(mem_ret), .o_csr_write_ena(mem_csr_write_ena), .o_csr_data_res(mem_csr_data_res));
    
    ysyx_210191_CLINT clint(.clk(clock), .reset(reset), .wdata(time_wdata), .mtimecmp_ena(mtimecmp_ena), .mtime_ena(mtime_ena), .mtime_int(clint_mtime_int), .mtime_data(mtime_data), .mtimecmp_data(mtimecmp_data));

    ysyx_210191_mem MEM(.mem_data_i(data_r_data), .mem_addr(mem_data1), .mem_control(mem_mem_control), .data_w_valid(data_w_valid), .data_r_valid(data_r_valid), .mem_wdata(mem_data2),
            .mem_data_o(mem_data_o), .mem_mask(mem_mask), .data_r_ena(data_r_ena), .data_w_ena(data_w_ena), .data_w_addr(data_w_addr), .stall_o(stall_from_mem),
            .data_w_data(data_w_data), .data_r_addr(data_r_addr), .mtime_ena(mtime_ena), .mtimecmp_ena(mtimecmp_ena), .time_wdata(time_wdata), .mtime_data(mtime_data), .mtimecmp_data(mtimecmp_data), .awsize(awsize), .arsize(arsize));

    ysyx_210191_mem_wb MEM_WB(.clk(clock), .reset(reset), .stall(stall), .i_write_to_regfile(mem_write_to_regfile), .i_mem_to_regfile(mem_mem_to_regfile), .i_reg_addr(mem_reg_addr), .i_alu_data(mem_data1), .i_mem_data(mem_data_o),
                  .i_pc(mem_pc), .i_excode(mem_excode), .i_except_ena(mem_except_ena), .flush(flush), .i_ret(mem_ret), .i_mtime_int(mem_mtime_int),
                  .i_csr_write_ena(mem_csr_write_ena), .i_csr_data_res(mem_csr_data_res), .i_csr(mem_csr), .o_write_to_regfile(wb_write_to_regfile), .o_mem_to_regfile(wb_mem_to_regfile), .o_reg_addr(wb_reg_addr), .o_alu_data(wb_alu_data), 
                  .o_mem_data(wb_mem_data), .o_pc(wb_pc), .o_excode(wb_excode), .o_except_ena(wb_except_ena), .o_ret(wb_ret), .o_mtime_int(wb_mtime_int),
                  .o_csr_write_ena(wb_csr_write_ena), .o_csr_data_res(wb_csr_data_res), .o_csr(wb_csr));
    
    ysyx_210191_wb WB(.mem_to_regfile(wb_mem_to_regfile), .alu_data(wb_alu_data), .mem_data(wb_mem_data), .data_out(wb_data_out));

    ysyx_210191_csr CSR(.clk(clock), .reset(reset), .csr_wdata(wb_csr_data_res), .i_w_csr(wb_csr), .i_r_csr(exe_csr), .write_ena(wb_csr_write_ena), .except_ena(wb_except_ena), .i_addr(exe_pc), .i_addr2(wb_pc), .i_excode(wb_excode),
            .ret(wb_ret), .mtime_int(wb_mtime_int), .o_csr_data(csr_data), .mtvec_pc(mtvec_pc), .epc(epc), .time_int(time_int), .ecall(ecall), .ext_int(ext_int));

    ysyx_210191_ctrl CTRL(.clk(clock), .reset(reset), .mtvec_pc(mtvec_pc), .epc(epc), .ret(wb_ret), .stall_from_if(stall_from_if), .stall_from_mem(stall_from_mem), .new_pc(new_pc), .flush(flush), .stall(stall), .inst_r_valid(inst_r_valid),
              .keep(keep), .time_int(time_int), .ecall(ecall), .stall_from_id(stall_from_id));

                   
endmodule

module ysyx_210191_pc(
    input clk,
    input reset,
    input [5:0] stall,
    input [63:0] b_j_pc,
    input pcsource,
    input [63:0] new_pc,
    input flush,
    input ret,
    input flush_if_id,
    input keep,

    output reg [63:0] o_inst_addr,
    output reg [31:0] inst_addr
);

    always @(posedge clk) begin
        if(reset) begin
            o_inst_addr <= 64'h0000000030000000;
            inst_addr <= 32'h30000000;
        end else if(flush | ret) begin
            o_inst_addr <= new_pc;
            inst_addr <= new_pc[31:0];
        end else if(keep) begin
            o_inst_addr <= o_inst_addr;
            inst_addr <= inst_addr;
        end else if(stall[0] == 1'b0) begin
            if(pcsource) begin
                o_inst_addr <= b_j_pc;
                inst_addr <= b_j_pc[31:0];
            end else begin
                o_inst_addr <= o_inst_addr + 64'd4;
                inst_addr <= inst_addr + 32'd4;
            end
        end
    end

endmodule
module ysyx_210191_regfile(
    input clk,
    input reset,
    input en,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [63:0] wdata,
    input time_int,

    output [63:0] rdata1,
    output [63:0] rdata2
);

    reg [63:0] regfile[0:31];
    
    assign rdata1 = raddr1 == 5'b00000 ? 64'd0 : regfile[raddr1];
    assign rdata2 = raddr2 == 5'b00000 ? 64'd0 : regfile[raddr2];

    always@(posedge clk) begin : output_value
        if(reset) begin : RESETN
            integer i;
            for(i = 0;i < 32;i = i + 1) begin
                regfile[i] <= 64'd0;
            end
        end else if(en && (waddr != 5'b00000) && ~time_int) begin
            regfile[waddr] <= wdata;
        end
    end

endmodule
module ysyx_210191_wb(
    input mem_to_regfile,
    input [63:0] alu_data,
    input [63:0] mem_data,

    output [63:0] data_out
);

    assign data_out = mem_to_regfile ? mem_data : alu_data;

endmodule
