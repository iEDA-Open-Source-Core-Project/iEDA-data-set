
/* verilator lint_off EOFNEWLINE */
`timescale 1ns / 1ps

`define YSYX210247_ZERO_WORD       64'h00000000_00000000
`define YSYX210247_PC_START        64'h00000000_2ffffffc  
`define YSYX210247_CLINT_MTIMECMP  64'h00000000_02004000
`define YSYX210247_CLINT_MTIME     64'h00000000_0200bff8
`define YSYX210247_REG_BUS         63 : 0  
`define YSYX210247_DST_BUS          4 : 0 

`define YSYX210247_IF_TO_ID_BUS    96 
`define YSYX210247_ID_TO_EXE_BUS  540
`define YSYX210247_EXE_TO_MEM_BUS 403
`define YSYX210247_MEM_TO_WB_BUS  403 

`define YSYX210247_AXI_ADDR_WIDTH      64
`define YSYX210247_AXI_DATA_WIDTH      64
`define YSYX210247_AXI_ID_WIDTH        4
`define YSYX210247_AXI_USER_WIDTH      1

`define YSYX210247_BR_BUS        65 : 0

`define YSYX210247_INST_ADDI_OP  8'h13
`define YSYX210247_INST_LUI_OP   8'h37
`define YSYX210247_INST_AUIPC_OP 8'h17
`define YSYX210247_INST_JAL_OP   8'h6f
`define YSYX210247_INST_LW_OP    8'h03
`define YSYX210247_INST_LWU_OP   8'h03
`define YSYX210247_INST_ADDW_OP  8'h3b
`define YSYX210247_INST_SLT_OP   8'h33
`define YSYX210247_INST_SLTI_OP  8'h13
`define YSYX210247_INST_SLTU_OP  8'h33
`define YSYX210247_INST_SLTIU_OP 8'h13
`define YSYX210247_INST_BEQ_OP   8'h63
`define YSYX210247_INST_JALR_OP  8'h67
`define YSYX210247_INST_BNE_OP   8'h63
`define YSYX210247_INST_BGE_OP   8'h63
`define YSYX210247_INST_BLT_OP   8'h63
`define YSYX210247_INST_BLTU_OP  8'h63
`define YSYX210247_INST_BGEU_OP  8'h63
`define YSYX210247_INST_SUB_OP   8'h33
`define YSYX210247_INST_ADD_OP   8'h33
`define YSYX210247_INST_ADDIW_OP 8'h1b
`define YSYX210247_INST_LD_OP    8'h03
`define YSYX210247_INST_LH_OP    8'h03
`define YSYX210247_INST_LHU_OP   8'h03
`define YSYX210247_INST_SD_OP    8'h23
`define YSYX210247_INST_SRAI_OP  8'h13
`define YSYX210247_INST_SLLI_OP  8'h13
`define YSYX210247_INST_SRLI_OP  8'h13
`define YSYX210247_INST_SRLIW_OP 8'h1b
`define YSYX210247_INST_SRAIW_OP 8'h1b
`define YSYX210247_INST_SLLIW_OP 8'h1b
`define YSYX210247_INST_LB_OP    8'h03
`define YSYX210247_INST_LBU_OP   8'h03
`define YSYX210247_INST_SB_OP    8'h23
`define YSYX210247_INST_SH_OP    8'h23
`define YSYX210247_INST_SW_OP    8'h23
`define YSYX210247_INST_SLLW_OP  8'h3b
`define YSYX210247_INST_SRAW_OP  8'h3b
`define YSYX210247_INST_SRLW_OP  8'h3b
`define YSYX210247_INST_SUBW_OP  8'h3b
`define YSYX210247_INST_AND_OP   8'h33
`define YSYX210247_INST_OR_OP    8'h33
`define YSYX210247_INST_XOR_OP   8'h33
`define YSYX210247_INST_SLL_OP   8'h33
`define YSYX210247_INST_SRL_OP   8'h33
`define YSYX210247_INST_SRA_OP   8'h33
`define YSYX210247_INST_ANDI_OP  8'h13
`define YSYX210247_INST_XORI_OP  8'h13
`define YSYX210247_INST_ORI_OP   8'h13
`define YSYX210247_INST_CSRRS_OP 8'h73
`define YSYX210247_INST_CSRRW_OP 8'h73
`define YSYX210247_INST_ECALL_OP 8'h73
`define YSYX210247_INST_MRET_OP  8'h73
`define YSYX210247_INST_CSRRSI_OP 8'h73
`define YSYX210247_INST_CSRRCI_OP 8'h73
`define YSYX210247_INST_CSRRC_OP  8'h73

`define YSYX210247_MCYCLE       12'hb00
`define YSYX210247_MTEVC        12'h305
`define YSYX210247_MEPC         12'h341
`define YSYX210247_MSTATUS      12'h300
`define YSYX210247_MCAUSE       12'h342
`define YSYX210247_MIE          12'h304
`define YSYX210247_MIP          12'h344
`define YSYX210247_MSCRATCH     12'h340

`define YSYX210247_U_type     6'b100000
`define YSYX210247_I_type     6'b010000
`define YSYX210247_R_type     6'b001000
`define YSYX210247_S_type     6'b000100
`define YSYX210247_J_type     6'b000010
`define YSYX210247_B_type     6'b000001


`define YSYX210247_SIZE_B              3'b000
`define YSYX210247_SIZE_H              3'b001
`define YSYX210247_SIZE_W              3'b010
`define YSYX210247_SIZE_D              3'b011

`define YSYX210247_REQ_READ            1'b0
`define YSYX210247_REQ_WRITE           1'b1

module ysyx_210247(
    input                               clock,
    input                               reset,

    input                               io_interrupt,

    input                               io_master_awready,
    output                              io_master_awvalid,
    output [31:0]                       io_master_awaddr,
    output [3:0]                        io_master_awid,
    output [7:0]                        io_master_awlen,
    output [2:0]                        io_master_awsize,
    output [1:0]                        io_master_awburst,

    input                               io_master_wready,
    output                              io_master_wvalid,
    output [63:0]                       io_master_wdata,
    output [7:0]                        io_master_wstrb,
    output                              io_master_wlast,
    
    output                              io_master_bready,
    input                               io_master_bvalid,
    input  [1:0]                        io_master_bresp,
    input  [3:0]                        io_master_bid,

    input                               io_master_arready,
    output                              io_master_arvalid,
    output [31:0]                       io_master_araddr,
    output [3:0]                        io_master_arid,
    output [7:0]                        io_master_arlen,
    output [2:0]                        io_master_arsize,
    output [1:0]                        io_master_arburst,

    output                              io_master_rready,
    input                               io_master_rvalid,
    input  [1:0]                        io_master_rresp,
    input  [63:0]                       io_master_rdata,
    input                               io_master_rlast,
    input  [3:0]                        io_master_rid,

    output                              io_slave_awready,
    input                               io_slave_awvalid,
    input [31:0]                        io_slave_awaddr,
    input [3:0]                         io_slave_awid,
    input [7:0]                         io_slave_awlen,
    input [2:0]                         io_slave_awsize,
    input [1:0]                         io_slave_awburst,

    output                              io_slave_wready,
    input                               io_slave_wvalid,
    input [63:0]                        io_slave_wdata,
    input [7:0]                         io_slave_wstrb,
    input                               io_slave_wlast,
    
    input                               io_slave_bready,
    output                              io_slave_bvalid,
    output  [1:0]                       io_slave_bresp,
    output  [3:0]                       io_slave_bid,

    output                              io_slave_arready,
    input                               io_slave_arvalid,
    input [31:0]                        io_slave_araddr,
    input [3:0]                         io_slave_arid,
    input [7:0]                         io_slave_arlen,
    input [2:0]                         io_slave_arsize,
    input [1:0]                         io_slave_arburst,

    input                               io_slave_rready,
    output                              io_slave_rvalid,
    output  [1:0]                       io_slave_rresp,
    output  [63:0]                      io_slave_rdata,
    output                              io_slave_rlast,
    output  [3:0]                       io_slave_rid
);

    wire aw_ready;
    wire aw_valid;
    wire [63:0] aw_addr;
    wire [2:0] aw_prot;
    wire [3:0] aw_id;
    wire [`YSYX210247_AXI_USER_WIDTH-1:0] aw_user;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;
    wire aw_lock;
    wire [3:0] aw_cache;
    wire [3:0] aw_qos;

    wire w_ready;
    wire w_valid;
    wire [`YSYX210247_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210247_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
    
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;
    wire [`YSYX210247_AXI_ID_WIDTH-1:0] b_id;
    wire [`YSYX210247_AXI_USER_WIDTH-1:0] b_user;

    wire ar_ready;
    wire ar_valid;
    wire [63:0] ar_addr;
    wire [`YSYX210247_AXI_ID_WIDTH-1:0] ar_id;
    wire [`YSYX210247_AXI_USER_WIDTH-1:0] ar_user;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    wire ar_lock;
    wire [3:0] ar_cache;
    wire [3:0] ar_qos;
    
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210247_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210247_AXI_ID_WIDTH-1:0] r_id;

    wire inst_req = `YSYX210247_REQ_READ;
    wire inst_valid;
    wire inst_ready;
    wire [63:0] inst_read;
    wire [63:0] inst_addr;
    wire [ 2:0] inst_size;

    wire        data_wen;
    wire data_req = data_wen ? `YSYX210247_REQ_WRITE : `YSYX210247_REQ_READ;
    wire data_valid;
    wire data_ready;
    wire [63:0] data_read;
    wire [63:0] data_write;
    wire [63:0] data_addr;
    wire [ 2:0] data_size;
    wire [ 7:0] data_strb;

    wire int_i;

    assign io_slave_rvalid  = 1'd0;
    assign io_slave_rresp   = 2'd0;
    assign io_slave_rdata   = 64'd0;
    assign io_slave_rlast   = 1'd0;
    assign io_slave_rid     = 4'd0;
    assign io_slave_arready = 1'd0;
    assign io_slave_bvalid  = 1'd0;
    assign io_slave_bresp   = 2'd0;
    assign io_slave_bid     = 4'd0;
    assign io_slave_awready = 1'd0;
    assign io_slave_wready  = 1'd0;

    wire                               slave_awvalid;
    wire [31:0]                        slave_awaddr;
    wire [3:0]                         slave_awid;
    wire [7:0]                         slave_awlen;
    wire [2:0]                         slave_awsize;
    wire [1:0]                         slave_awburst;
    wire                               slave_wvalid;
    wire [63:0]                        slave_wdata;
    wire [7:0]                         slave_wstrb;
    wire                               slave_wlast;
    wire                               slave_bready;
    wire                               slave_arvalid;
    wire [31:0]                        slave_araddr;
    wire [3:0]                         slave_arid;
    wire [7:0]                         slave_arlen;
    wire [2:0]                         slave_arsize;
    wire [1:0]                         slave_arburst;
    wire                               slave_rready;

    assign slave_awvalid    = io_slave_awvalid;
    assign slave_awaddr     = io_slave_awaddr;
    assign slave_awid       = io_slave_awid;
    assign slave_awlen      = io_slave_awlen;
    assign slave_awsize     = io_slave_awsize;
    assign slave_awburst    = io_slave_awburst;
    assign slave_wvalid     = io_slave_wvalid;
    assign slave_wdata      = io_slave_wdata;
    assign slave_wstrb      = io_slave_wstrb;
    assign slave_wlast      = io_slave_wlast;
    assign slave_bready     = io_slave_bready;
    assign slave_arvalid    = io_slave_arvalid;
    assign slave_araddr     = io_slave_araddr;
    assign slave_arid       = io_slave_arid;
    assign slave_arlen      = io_slave_arlen;
    assign slave_arsize     = io_slave_arsize;
    assign slave_arburst    = io_slave_arburst;
    assign slave_rready     = io_slave_rready;
    
    assign aw_ready             = io_master_awready;
    assign io_master_awvalid    = aw_valid;
    assign io_master_awaddr     = aw_addr[31:0];
    assign io_master_awid       = aw_id;
    assign io_master_awlen      = aw_len;
    assign io_master_awsize     = aw_size;
    assign io_master_awburst    = aw_burst;

    assign w_ready              = io_master_wready;
    assign io_master_wvalid     = w_valid;
    assign io_master_wdata      = w_data;
    assign io_master_wstrb      = w_strb;
    assign io_master_wlast      = w_last;
    
    assign io_master_bready     = b_ready;
    assign b_valid              = io_master_bvalid;
    assign b_resp               = io_master_bresp;
    assign b_id                 = io_master_bid;
    assign b_user               = 0;

    assign ar_ready             = io_master_arready;
    assign io_master_arvalid    = ar_valid;
    assign io_master_araddr     = ar_addr[31:0];
    assign io_master_arid       = ar_id;
    assign io_master_arlen      = ar_len;
    assign io_master_arsize     = ar_size;
    assign io_master_arburst    = ar_burst;
    
    assign io_master_rready     = r_ready;
    assign r_valid              = io_master_rvalid;
    assign r_resp               = io_master_rresp;
    assign r_data               = io_master_rdata;
    assign r_last               = io_master_rlast;
    assign r_id                 = io_master_rid;
/*
    reg [`YSYX210247_REG_BUS] cnt;
    wire           rst;
    assign         rst = cnt <= 64'd1;
    always @(posedge clock) begin
        if(reset) begin
          cnt <= cnt + 64'd1;
        end
    end
*/
ysyx_210247_axi u_ysyx_210247_axi(
    .clock          ( clock          ),
    .reset          ( reset          ),
    .inst_valid     ( inst_valid     ),
    .inst_ready     ( inst_ready     ),
    .inst_req       ( inst_req       ),
    .inst_read      ( inst_read      ),
    .inst_addr      ( inst_addr      ),
    .inst_size      ( inst_size      ),
    .data_valid     ( data_valid     ),
    .data_ready     ( data_ready     ),
    .data_req       ( data_req       ),
    .data_read      ( data_read      ),
    .data_write     ( data_write     ),
    .data_addr      ( data_addr      ),
    .data_size      ( data_size      ),
    .data_strb      ( data_strb      ),
    .axi_aw_ready_i ( aw_ready       ),
    .axi_aw_valid_o ( aw_valid       ),
    .axi_aw_addr_o  ( aw_addr        ),
    .axi_aw_prot_o  ( aw_prot        ),
    .axi_aw_id_o    ( aw_id          ),
    .axi_aw_user_o  ( aw_user        ),
    .axi_aw_len_o   ( aw_len         ),
    .axi_aw_size_o  ( aw_size        ),
    .axi_aw_burst_o ( aw_burst       ),
    .axi_aw_lock_o  ( aw_lock        ),
    .axi_aw_cache_o ( aw_cache       ),
    .axi_aw_qos_o   ( aw_qos         ),
    .axi_w_ready_i  ( w_ready        ),
    .axi_w_valid_o  ( w_valid        ),
    .axi_w_data_o   ( w_data         ),
    .axi_w_strb_o   ( w_strb         ),
    .axi_w_last_o   ( w_last         ),   
    .axi_b_ready_o  ( b_ready        ),
    .axi_b_valid_i  ( b_valid        ),
    .axi_b_resp_i   ( b_resp         ),
    .axi_b_id_i     ( b_id           ),
    .axi_b_user_i   ( b_user         ),
    .axi_ar_ready_i ( ar_ready       ),
    .axi_ar_valid_o ( ar_valid       ),
    .axi_ar_addr_o  ( ar_addr        ),
    .axi_ar_id_o    ( ar_id          ),
    .axi_ar_user_o  ( ar_user        ),
    .axi_ar_len_o   ( ar_len         ),
    .axi_ar_size_o  ( ar_size        ),
    .axi_ar_burst_o ( ar_burst       ),
    .axi_ar_lock_o  ( ar_lock        ),
    .axi_ar_cache_o ( ar_cache       ),
    .axi_ar_qos_o   ( ar_qos         ),   
    .axi_r_ready_o  ( r_ready        ),
    .axi_r_valid_i  ( r_valid        ),
    .axi_r_resp_i   ( r_resp         ),
    .axi_r_data_i   ( r_data         ),
    .axi_r_last_i   ( r_last         ),
    .axi_r_id_i     ( r_id           )
);

assign int_i = io_interrupt;

ysyx_210247_cpu u_ysyx_210247_cpu(
    .clock      ( clock      ),
    .reset      ( reset      ),
    .inst_valid ( inst_valid ),
    .inst_ready ( inst_ready ),
    .inst_read  ( inst_read  ),
    .inst_addr  ( inst_addr  ),
    .inst_size  ( inst_size  ),
    .data_valid ( data_valid ),
    .data_ready ( data_ready ),
    .data_read  ( data_read  ),
    .data_addr  ( data_addr  ),
    .data_size  ( data_size  ),
    .data_write ( data_write ),
    .data_wen   ( data_wen   ),
    .data_strb  ( data_strb  )
);

wire _unused_ok = &{1'b0,
                    slave_awvalid,
                    slave_awaddr,
                    slave_awid,
                    slave_awlen,
                    slave_awsize,
                    slave_awburst,
                    slave_wvalid,
                    slave_wdata,
                    slave_wstrb,
                    slave_wlast,
                    slave_bready,
                    slave_arvalid,
                    slave_araddr,
                    slave_arid,
                    slave_arlen,
                    slave_arsize,
                    slave_arburst,
                    slave_rready,
                    int_i,
                    ar_qos,
                    ar_cache,
                    ar_lock,
                    ar_user,
                    ar_addr,
                    aw_qos,
                    aw_cache,
                    aw_lock,
                    aw_user,
                    aw_prot,
                    aw_addr,
                    1'b0};

endmodule

// Burst types
`define YSYX210247_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210247_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210247_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210247_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210247_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210247_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210247_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210247_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210247_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210247_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210247_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210247_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210247_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210247_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210247_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210247_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210247_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210247_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210247_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210247_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210247_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210247_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210247_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210247_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210247_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210247_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210247_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210247_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210247_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210247_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210247_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210247_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210247_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210247_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210247_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210247_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210247_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210247_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210247_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210247_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210247_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_210247_axi(
    input                               clock,
    input                               reset,

	input                               inst_valid,
	output                              inst_ready,
    input                               inst_req,
    output reg [63:0]      inst_read,  
    input  [`YSYX210247_AXI_DATA_WIDTH-1:0]         inst_addr,   
    input  [2:0]                        inst_size,

    input                               data_valid,
	output                              data_ready,
    input                               data_req,
    output reg [63:0]      data_read,  
    input  [63:0]          data_write,
    input  [`YSYX210247_AXI_DATA_WIDTH-1:0]         data_addr,
    input  [2:0]                        data_size,
    input  [7:0]                        data_strb,

    // Advanced eXtensible Interface

    //write aquire channel
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [`YSYX210247_AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [2:0]                        axi_aw_prot_o,
    output [`YSYX210247_AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [`YSYX210247_AXI_USER_WIDTH-1:0]         axi_aw_user_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    output                              axi_aw_lock_o,
    output [3:0]                        axi_aw_cache_o,
    output [3:0]                        axi_aw_qos_o,

    //write data channel
    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [`YSYX210247_AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [`YSYX210247_AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    
    //write back channel
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [`YSYX210247_AXI_ID_WIDTH-1:0]           axi_b_id_i,
    input  [`YSYX210247_AXI_USER_WIDTH-1:0]         axi_b_user_i,

    //read aquire channel
    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [`YSYX210247_AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [`YSYX210247_AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [`YSYX210247_AXI_USER_WIDTH-1:0]         axi_ar_user_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    output                              axi_ar_lock_o,
    output [3:0]                        axi_ar_cache_o,
    output [3:0]                        axi_ar_qos_o,
    
    //read back channel
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [`YSYX210247_AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [`YSYX210247_AXI_ID_WIDTH-1:0]           axi_r_id_i
);

    wire w_trans    = inst_req == `YSYX210247_REQ_WRITE | data_req == `YSYX210247_REQ_WRITE;
    wire r_trans    = inst_req == `YSYX210247_REQ_READ  | data_req == `YSYX210247_REQ_READ;
    wire w_valid    = data_valid & w_trans;
    wire r_valid    = (inst_valid | data_valid) & r_trans;

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;

    
    // ------------------State Machine------------------
    parameter [2:0] W_STATE_IDLE  = 3'b000;
    parameter [2:0] W_STATE_ADDR  = 3'b001; 
    parameter [2:0] W_STATE_WRITE = 3'b010; 
    parameter [2:0] W_STATE_RESP  = 3'b011;
    parameter [2:0] W_STATE_DONE  = 3'b100;

    parameter [2:0] R_STATE_IDLE      = 3'b000;
    parameter [2:0] R_STATE_INST_ADDR = 3'b001;
    parameter [2:0] R_STATE_INST_READ = 3'b010;
    parameter [2:0] R_STATE_DATA_ADDR = 3'b011;
    parameter [2:0] R_STATE_DATA_READ = 3'b100;
    parameter [2:0] R_STATE_INST_DONE = 3'b101;
    parameter [2:0] R_STATE_DATA_DONE = 3'b110;

    reg [2:0] w_state;
    reg [2:0] r_state;
    wire w_state_idle  = w_state == W_STATE_IDLE;
    wire w_state_addr  = w_state == W_STATE_ADDR;
    wire w_state_write = w_state == W_STATE_WRITE; 

    wire r_state_idle = r_state == R_STATE_IDLE;
    wire r_state_addr = (r_state == R_STATE_INST_ADDR | r_state == R_STATE_DATA_ADDR);
    wire r_state_read = (r_state == R_STATE_INST_READ | r_state == R_STATE_DATA_READ);


    wire inst_ren;
    wire data_ren;
    assign inst_ren = inst_valid & inst_req == `YSYX210247_REQ_READ;
    assign data_ren = data_valid & data_req == `YSYX210247_REQ_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
                    W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_DONE;
                    W_STATE_DONE:               w_state <= W_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE: begin
                      if(inst_ren) begin
                        r_state <= R_STATE_INST_ADDR;
                      end
                    end
                    R_STATE_INST_ADDR: if (ar_hs)    r_state <= R_STATE_INST_READ;
                    R_STATE_INST_READ: if (r_done)   r_state <= R_STATE_INST_DONE;
                    R_STATE_DATA_ADDR: if (ar_hs)    r_state <= R_STATE_DATA_READ;
                    R_STATE_DATA_READ: if (r_done)   r_state <= R_STATE_DATA_DONE;
                    R_STATE_INST_DONE: if(data_ren) begin
                      r_state <= R_STATE_DATA_ADDR;
                    end
                    else begin
                      r_state <= R_STATE_IDLE;
                    end
                    R_STATE_DATA_DONE: r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end

    // ------------------Process Data------------------
    parameter ALIGNED_WIDTH = $clog2(`YSYX210247_AXI_DATA_WIDTH / 8);
    parameter OFFSET_WIDTH  = $clog2(`YSYX210247_AXI_DATA_WIDTH);
  //  parameter AXI_SIZE      = $clog2(`YSYX210247_AXI_DATA_WIDTH / 8);
    parameter MASK_WIDTH    = `YSYX210247_AXI_DATA_WIDTH * 2;
    parameter TRANS_LEN     = 1;

    wire aligned            = TRANS_LEN != 1 | (inst_addr[ALIGNED_WIDTH-1:0] == 0) | (data_addr[ALIGNED_WIDTH-1:0] == 0);
    wire size_b             = inst_size == `YSYX210247_SIZE_B | (data_size == `YSYX210247_SIZE_B & data_req == `YSYX210247_REQ_READ);
    wire size_h             = inst_size == `YSYX210247_SIZE_H | (data_size == `YSYX210247_SIZE_H & data_req == `YSYX210247_REQ_READ);
    wire size_w             = inst_size == `YSYX210247_SIZE_W | (data_size == `YSYX210247_SIZE_W & data_req == `YSYX210247_REQ_READ);
    wire size_d             = inst_size == `YSYX210247_SIZE_D | (data_size == `YSYX210247_SIZE_D & data_req == `YSYX210247_REQ_READ);
    wire [3:0] addr_op1     = r_state == R_STATE_INST_READ ? {{4-ALIGNED_WIDTH{1'b0}}, inst_addr[ALIGNED_WIDTH-1:0]} : 
                              r_state == R_STATE_DATA_READ ? {{4-ALIGNED_WIDTH{1'b0}}, data_addr[ALIGNED_WIDTH-1:0]} : 0;
    wire [3:0] addr_op2     =     ({4{size_b}} & {4'b0000})
                                | ({4{size_h}} & {4'b0001})
                                | ({4{size_w}} & {4'b0011})
                                | ({4{size_d}} & {4'b0111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    wire [2:0] axi_size     = r_state == R_STATE_INST_ADDR ? inst_size :
                              r_state == R_STATE_DATA_ADDR ? data_size :
                                                             3'b010;
    wire [`YSYX210247_AXI_ADDR_WIDTH-1:0] axi_addr    = r_state == R_STATE_INST_ADDR ? inst_addr :
                                            r_state == R_STATE_DATA_ADDR ? data_addr :
                                                                           `YSYX210247_ZERO_WORD;
    wire [`YSYX210247_AXI_ADDR_WIDTH-1:0] axi_waddr   = data_addr;
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = r_state == R_STATE_INST_READ ? {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {inst_addr[ALIGNED_WIDTH-1:0]}} << 3 : 
                                                  r_state == R_STATE_DATA_READ ? {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {data_addr[ALIGNED_WIDTH-1:0]}} << 3 : 0;
    wire [OFFSET_WIDTH-1:0] aligned_offset_h    = 6'b111111;
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH- 8{1'b0}},  8'hff})
                                                 | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                 | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                 | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                  ) << aligned_offset_l;
    wire [`YSYX210247_AXI_DATA_WIDTH-1:0] mask_l      = mask[`YSYX210247_AXI_DATA_WIDTH-1:0];
    wire [`YSYX210247_AXI_DATA_WIDTH-1:0] mask_h      = mask[MASK_WIDTH-1:`YSYX210247_AXI_DATA_WIDTH];

    wire [`YSYX210247_AXI_ID_WIDTH-1:0] axi_id        = {`YSYX210247_AXI_ID_WIDTH{1'b0}};
    wire [`YSYX210247_AXI_USER_WIDTH-1:0] axi_user    = {`YSYX210247_AXI_USER_WIDTH{1'b0}};

    reg r_ready;
    wire r_ready_nxt = r_done;
    wire r_ready_en      = r_done | r_ready;
    always @(posedge clock) begin
        if (reset) begin
            r_ready <= 0;
        end
        else if (r_ready_en) begin
            r_ready <= r_ready_nxt;
        end
    end

    reg w_ready;
    wire w_ready_nxt = b_hs;
    wire w_ready_en      = b_hs | w_ready;
    always @(posedge clock) begin
        if (reset) begin
            w_ready <= 0;
        end
        else if (w_ready_en) begin
            w_ready <= w_ready_nxt;
        end
    end

    assign inst_ready     = r_state == R_STATE_INST_DONE & r_ready;
    assign data_ready     = ( r_state == R_STATE_DATA_DONE & data_ren ) ? r_ready : w_ready;

    // ------------------Number of transmission------------------
    reg [7:0] len;
    wire len_reset      = reset | (w_trans & w_state_idle) | (r_trans & r_state_idle);
    wire len_incr_en    = (len != axi_len) & (w_hs | r_hs);
    always @(posedge clock) begin
        if (len_reset) begin
            len <= 0;
        end
        else if (len_incr_en) begin
            len <= len + 1;
        end
    end


    // ------------------Write Transaction------------------

    // write address channel signals
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = axi_waddr;
    assign axi_aw_prot_o    = `YSYX210247_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210247_AXI_PROT_SECURE_ACCESS | `YSYX210247_AXI_PROT_DATA_ACCESS;
    assign axi_aw_id_o      = axi_id;
    assign axi_aw_user_o    = axi_user;
    assign axi_aw_len_o     = 8'd0;
    assign axi_aw_size_o    = data_size;
    assign axi_aw_burst_o   = `YSYX210247_AXI_BURST_TYPE_INCR;
    assign axi_aw_lock_o    = 1'b0;
    assign axi_aw_cache_o   = `YSYX210247_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_aw_qos_o     = 4'h0;


    // write data channel signals
    assign axi_b_ready_o    = 1'b1;

    assign axi_w_valid_o    = w_state_write;
    assign axi_w_data_o     = data_write;
    assign axi_w_strb_o     = data_strb;
    assign axi_w_last_o     = 1'b1;
    
    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = axi_addr;
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_user_o    = axi_user;
    assign axi_ar_len_o     = 8'd0;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210247_AXI_BURST_TYPE_INCR;
    assign axi_ar_lock_o    = 1'b0;
    assign axi_ar_cache_o   = `YSYX210247_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_ar_qos_o     = 4'h0;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    wire [`YSYX210247_AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [`YSYX210247_AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;

    always @(posedge clock) begin
        if (reset) begin
            inst_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~aligned & overstep) begin
                if (len[0]) begin
                    inst_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= inst_read[`YSYX210247_AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    inst_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (len == 0) begin
                inst_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
            end
        end
    end

    always @(posedge clock) begin
        if (reset) begin
            data_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~aligned & overstep) begin
                if (len[0]) begin
                    data_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= data_read[`YSYX210247_AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    data_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (len == 0) begin
                data_read[`YSYX210247_AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
            end
        end
    end

    wire _unused_ok = &{1'b0,
                    axi_r_id_i,
                    axi_r_resp_i,  // To be fixed
                    axi_b_user_i,
                    axi_b_id_i,
                    axi_b_resp_i,
                    addr_end,
                    1'b0};

endmodule



//--zhuyuhan 20210247--

module ysyx_210247_clint(
    input  wire             clk,
    input  wire             rst,

    input  wire [`YSYX210247_REG_BUS]  mstatus_i,
    input  wire [`YSYX210247_REG_BUS]  mie_i,

    input  wire             cmp_ren,
    input  wire [`YSYX210247_REG_BUS]  cmp_addr,
    input  wire             cmp_wen,
    output wire [`YSYX210247_REG_BUS]  cmp_rdata,
    input  wire [`YSYX210247_REG_BUS]  cmp_wdata,

    output                  time_int
);

reg [`YSYX210247_REG_BUS] mtime;
reg [`YSYX210247_REG_BUS] mtimecmp;

assign time_int = mtime >= mtimecmp && mstatus_i[3] == 1'b1 && mie_i[7] == 1'b1;

reg tick;
always @ (posedge clk) begin
    if(rst) begin
        tick <= 1'b0;
        mtime <= `YSYX210247_ZERO_WORD;
    end
    else begin
        tick <= ~tick;
    end

    if(tick) begin
        mtime <= mtime + 1'b1;
    end
end

always @(posedge clk) begin
    if(rst) begin
      mtimecmp <= 700000;
    end

    else if(cmp_wen) begin
      mtimecmp <= cmp_wdata;
    end
end

assign cmp_rdata = cmp_ren ? (cmp_addr == `YSYX210247_CLINT_MTIMECMP ? mtimecmp : 
                              cmp_addr == `YSYX210247_CLINT_MTIME    ? mtime    : 
                                                            `YSYX210247_ZERO_WORD) : `YSYX210247_ZERO_WORD;

wire _unused_ok = &{1'b0,
                    mstatus_i,
                    mie_i,  // To be fixed
                    1'b0};

endmodule


module ysyx_210247_cpu(
    input                               clock,
    input                               reset,
    
    output                              inst_valid,
    input                               inst_ready,
    input  [63:0]                       inst_read,
    output [63:0]                       inst_addr,
    output [2:0]                        inst_size,

    output                              data_valid,
    input                               data_ready,
    input  [63:0]                       data_read,
    output [63:0]                       data_addr,
    output [2:0]                        data_size,
    output [63:0]                       data_write,
    output                              data_wen,
    output [ 7:0]                       data_strb
);

//PIPE REGFILE
wire [`YSYX210247_BR_BUS            ] br_bus;
wire [`YSYX210247_IF_TO_ID_BUS-1  :0] if_to_id_bus_i;
wire [`YSYX210247_IF_TO_ID_BUS-1  :0] if_to_id_bus_o;
wire [`YSYX210247_ID_TO_EXE_BUS-1 :0] id_to_exe_bus_i;
wire [`YSYX210247_ID_TO_EXE_BUS-1 :0] id_to_exe_bus_o;
wire [`YSYX210247_EXE_TO_MEM_BUS-1:0] exe_to_mem_bus_i;
wire [`YSYX210247_EXE_TO_MEM_BUS-1:0] exe_to_mem_bus_o;
wire [`YSYX210247_MEM_TO_WB_BUS-1 :0] mem_to_wb_bus_i;
wire [`YSYX210247_MEM_TO_WB_BUS-1 :0] mem_to_wb_bus_o;

//write information
wire            wb_wen;
wire [`YSYX210247_DST_BUS] wb_wdest;
wire [`YSYX210247_REG_BUS] wb_wdata;  

//REGFILE
wire            rs1_r_ena;
wire [`YSYX210247_DST_BUS] rs1_r_addr;
wire            rs2_r_ena;
wire [`YSYX210247_DST_BUS] rs2_r_addr;
wire [`YSYX210247_REG_BUS] r_data1;
wire [`YSYX210247_REG_BUS] r_data2;

// CSR REGFILE
wire            csr_ren;
wire            csr_wen;
wire [11  :  0] csr_addr;
wire [11  :  0] csr_waddr;
wire [`YSYX210247_REG_BUS] csr_wdata;
wire [`YSYX210247_REG_BUS] csr_rdata;
wire            flush;      //ex/int signal
wire [`YSYX210247_REG_BUS] new_pc;     //ex/int next pc
wire [`YSYX210247_REG_BUS] exc_type;   //ex/int type, equal to mcause regfile   
wire [`YSYX210247_REG_BUS] exc_addr;   //ex/int current address
wire [31  :  0] exc_op;     
wire [`YSYX210247_REG_BUS] mstatus_o;
wire [`YSYX210247_REG_BUS] mepc_o;
wire [`YSYX210247_REG_BUS] mtvec_o;
wire [`YSYX210247_REG_BUS] mie_o;

//PIPE HANDSHAKE 
wire            if_valid_out;
wire            if_allow_out;
wire            id_valid_in;
wire            id_valid_out;
wire            id_allow_in;
wire            id_allow_out;
wire            exe_valid_in;
wire            exe_valid_out;
wire            exe_allow_in;
wire            exe_allow_out;
wire            mem_valid_in;
wire            mem_valid_out;
wire            mem_allow_in;
wire            mem_allow_out;
wire            wb_valid_in;
wire            wb_allow_in;

//DATA CONFLICT
wire [`YSYX210247_DST_BUS] EXE_wdest;
wire [`YSYX210247_REG_BUS] EXE_result;
wire [`YSYX210247_DST_BUS] MEM_wdest;
wire [`YSYX210247_REG_BUS] MEM_result;
wire [`YSYX210247_DST_BUS] WB_wdest;
wire [`YSYX210247_REG_BUS] WB_result;

//CLINT
wire            cmp_ren;
wire            cmp_wen;
wire [`YSYX210247_REG_BUS] cmp_addr;
wire [`YSYX210247_REG_BUS] cmp_rdata;
wire [`YSYX210247_REG_BUS] cmp_wdata;

//TIME INTERRUPT
wire            time_int;       //from clint to id_stage
wire            mem_stall;
wire            br_stall;

ysyx_210247_if_stage    u_ysyx_210247_if_stage(
    .clk            ( clock          ),
    .rst            ( reset          ),
    .if_allow_out   ( if_allow_out   ),
    .if_valid_out   ( if_valid_out   ),
    .br_bus         ( br_bus         ),
    .if_to_id_bus_o ( if_to_id_bus_o ),
    .inst_valid     ( inst_valid     ),
    .inst_ready     ( inst_ready     ),
    .inst_read      ( inst_read      ),
    .inst_addr      ( inst_addr      ),
    .inst_size      ( inst_size      ),
    .br_stall       ( br_stall       ),
    .new_pc         ( new_pc         ),
    .flush          ( flush          )
);

ysyx_210247_reg_if_id   u_ysyx_210247_reg_if_id(
    .clk            ( clock          ),
    .rst            ( reset          ),
    .flush          ( flush          ),
    .if_valid_out   ( if_valid_out   ),
    .if_to_id_bus_o ( if_to_id_bus_o ),
    .id_valid_in    ( id_valid_in    ),
    .if_to_id_bus_i ( if_to_id_bus_i ),
    .if_allow_out   ( if_allow_out   ),
    .id_allow_in    ( id_allow_in    )
);

ysyx_210247_id_stage    u_ysyx_210247_id_stage(
    .rst            ( reset          ),
    .br_bus         ( br_bus         ),
    .id_valid_in    ( id_valid_in    ),
    .id_allow_out   ( id_allow_out   ),
    .id_valid_out   ( id_valid_out   ),
    .id_allow_in    ( id_allow_in    ),
    .rs1_r_ena      ( rs1_r_ena      ),
    .rs1_r_addr     ( rs1_r_addr     ),
    .rs2_r_ena      ( rs2_r_ena      ),
    .rs2_r_addr     ( rs2_r_addr     ),
    .rs1_data       ( r_data1        ),
    .rs2_data       ( r_data2        ),
    .EXE_wdest      ( EXE_wdest      ),
    .EXE_result     ( EXE_result     ),
    .MEM_wdest      ( MEM_wdest      ),
    .MEM_result     ( MEM_result     ),
    .WB_wdest       ( WB_wdest       ),
    .WB_result      ( WB_result      ),
    .time_int       ( time_int       ),
    .mem_stall      ( mem_stall      ),
    .br_stall       ( br_stall       ),
    .if_to_id_bus_i ( if_to_id_bus_i ),
    .id_to_exe_bus_o( id_to_exe_bus_o)
);

ysyx_210247_reg_id_exe  u_ysyx_210247_reg_id_exe(
    .clk             ( clock           ),
    .rst             ( reset           ),
    .flush           ( flush           ),
    .id_valid_out    ( id_valid_out    ),
    .id_to_exe_bus_o ( id_to_exe_bus_o ),
    .exe_valid_in    ( exe_valid_in    ),
    .id_to_exe_bus_i ( id_to_exe_bus_i ),
    .id_allow_out    ( id_allow_out    ),
    .exe_allow_in    ( exe_allow_in    )
);

ysyx_210247_exe_stage   u_ysyx_210247_exe_stage(
    .rst             ( reset           ),
    .exe_valid_in    ( exe_valid_in    ),
    .exe_allow_out   ( exe_allow_out   ),
    .exe_valid_out   ( exe_valid_out   ),
    .exe_allow_in    ( exe_allow_in    ),
    .data_valid      ( data_valid      ),
    .data_ready      ( data_ready      ),
    .data_read       ( data_read       ),
    .data_addr       ( data_addr       ),
    .data_size       ( data_size       ),
    .data_write      ( data_write      ),
    .data_wen        ( data_wen        ),
    .data_strb       ( data_strb       ),
    .cmp_ren         ( cmp_ren         ),
    .cmp_wen         ( cmp_wen         ),
    .cmp_addr        ( cmp_addr        ),
    .cmp_rdata       ( cmp_rdata       ),
    .cmp_wdata       ( cmp_wdata       ),
    .EXE_wdest       ( EXE_wdest       ),
    .EXE_result      ( EXE_result      ),
    .csr_ren         ( csr_ren         ),
    .csr_addr        ( csr_addr        ),
    .csr_rdata       ( csr_rdata       ),
    .mem_stall       ( mem_stall       ),
    .id_to_exe_bus_i ( id_to_exe_bus_i ),
    .exe_to_mem_bus_o( exe_to_mem_bus_o)
);

ysyx_210247_reg_exe_mem u_ysyx_210247_reg_exe_mem(
    .clk              ( clock            ),
    .rst              ( reset            ),
    .flush            ( flush            ),
    .exe_valid_out    ( exe_valid_out    ),
    .exe_to_mem_bus_o ( exe_to_mem_bus_o ),
    .mem_valid_in     ( mem_valid_in     ),
    .exe_to_mem_bus_i ( exe_to_mem_bus_i ),
    .exe_allow_out    ( exe_allow_out    ),
    .mem_allow_in     ( mem_allow_in     )
);

ysyx_210247_mem_stage   u_ysyx_210247_mem_stage(
    .mem_valid_in     ( mem_valid_in     ),
    .mem_allow_out    ( mem_allow_out    ),
    .mem_valid_out    ( mem_valid_out    ),
    .mem_allow_in     ( mem_allow_in     ),
    .MEM_wdest        ( MEM_wdest        ),
    .MEM_result       ( MEM_result       ),
    .exe_to_mem_bus_i ( exe_to_mem_bus_i ),
    .mem_to_wb_bus_o  ( mem_to_wb_bus_o  )
);

ysyx_210247_reg_mem_wb  u_ysyx_210247_reg_mem_wb(
    .clk             ( clock           ),
    .rst             ( reset           ),
    .flush           ( flush           ),
    .mem_valid_out   ( mem_valid_out   ),
    .mem_to_wb_bus_o ( mem_to_wb_bus_o ),
    .wb_valid_in     ( wb_valid_in     ),
    .mem_to_wb_bus_i ( mem_to_wb_bus_i ),
    .mem_allow_out   ( mem_allow_out   ),
    .wb_allow_in     ( wb_allow_in     )
);

ysyx_210247_wb_stage    u_ysyx_210247_wb_stage(
    .wb_valid_in     ( wb_valid_in     ),
    .wb_allow_in     ( wb_allow_in     ),
    .mem_to_wb_bus_i ( mem_to_wb_bus_i ),
    .wb_wen          ( wb_wen          ),
    .wb_wdest        ( wb_wdest        ),
    .wb_wdata        ( wb_wdata        ),
    .flush           ( flush           ),
    .WB_wdest        ( WB_wdest        ),
    .WB_result       ( WB_result       ),
    .csr_wen         ( csr_wen         ),
    .csr_waddr       ( csr_waddr       ),
    .csr_wdata       ( csr_wdata       ),
    .exc_type        ( exc_type        ),
    .exc_addr        ( exc_addr        ),
    .exc_op          ( exc_op          )
);

ysyx_210247_regfile     u_ysyx_210247_regfile(
    .clk     ( clock      ),
    .rst     ( reset      ),
    .w_addr  ( wb_wdest   ),
    .w_data  ( wb_wdata   ),
    .w_ena   ( wb_wen     ),
    .r_addr1 ( rs1_r_addr ),
    .r_data1 ( r_data1    ),
    .r_ena1  ( rs1_r_ena  ),
    .r_addr2 ( rs2_r_addr ),
    .r_data2 ( r_data2    ),
    .r_ena2  ( rs2_r_ena  )
);

ysyx_210247_csr_regfile u_ysyx_210247_csr_regfile(
    .clk        ( clock      ),
    .rst        ( reset      ),
    .ren        ( csr_ren    ),
    .wen        ( csr_wen    ),
    .addr       ( csr_addr   ),
    .waddr      ( csr_waddr  ),
    .wdata      ( csr_wdata  ),
    .rdata      ( csr_rdata  ),
    .mstatus_o  ( mstatus_o  ),
    .mepc_o     ( mepc_o     ),
    .mtvec_o    ( mtvec_o    ),
    .mie_o      ( mie_o      ),
    .exc_type   ( exc_type   ),
    .exc_addr   ( exc_addr   ),
    .flush      ( flush      )
);

ysyx_210247_ctrl        u_ysyx_210247_ctrl(
    .rst       ( reset    ),
    .exc_op    ( exc_op   ),
    .csr_mepc  ( mepc_o   ),
    .csr_mtvec ( mtvec_o  ),
    .new_pc    ( new_pc   )
);

ysyx_210247_clint       u_ysyx_210247_clint(
    .clk       ( clock     ),
    .rst       ( reset     ),
    .mstatus_i ( mstatus_o ),
    .mie_i     ( mie_o     ),
    .cmp_ren   ( cmp_ren   ),
    .cmp_addr  ( cmp_addr  ),
    .cmp_wen   ( cmp_wen   ),
    .cmp_rdata ( cmp_rdata ),
    .cmp_wdata ( cmp_wdata ),
    .time_int  ( time_int  )
);


endmodule


//--zhuyuhan 20210247--


module ysyx_210247_csr_regfile(
    input  wire             clk,
    input  wire             rst,
    input  wire             ren,
    input  wire             wen,            
    input  wire [11  :  0]  addr,   
    input  wire [11  :  0]  waddr,      
    input  wire [`YSYX210247_REG_BUS]  wdata,                 
    
    output wire [`YSYX210247_REG_BUS]  rdata,

    output wire [`YSYX210247_REG_BUS]  mstatus_o,
    output wire [`YSYX210247_REG_BUS]  mepc_o,
    output wire [`YSYX210247_REG_BUS]  mtvec_o,
    output wire [`YSYX210247_REG_BUS]  mie_o,

    input  wire [`YSYX210247_REG_BUS]  exc_type,
    input  wire [`YSYX210247_REG_BUS]  exc_addr,
    input  wire             flush
);
    
reg  [`YSYX210247_REG_BUS]  mstatus;
reg  [`YSYX210247_REG_BUS]  mcause;
reg  [`YSYX210247_REG_BUS]  mepc;
reg  [`YSYX210247_REG_BUS]  mtvec;
reg  [`YSYX210247_REG_BUS]  mcycle;
reg  [`YSYX210247_REG_BUS]  mie;
reg  [`YSYX210247_REG_BUS]  mip;
reg  [`YSYX210247_REG_BUS]  mscratch;

wire mret_flush;
wire wb_ex;
assign mret_flush = exc_type == 64'd666;
assign wb_ex      = flush & ~mret_flush;

reg tick;
always @ (posedge clk) begin
    if(rst) begin
        tick <= 1'b0;
        mcycle <= `YSYX210247_ZERO_WORD;
    end
    else begin
        tick <= ~tick;
    end

    if(wen && waddr == `YSYX210247_MCYCLE) begin
        mcycle <= wdata;
    end
    else if(tick) begin
        mcycle <= mcycle + 1'b1;
    end
end

always @(posedge clk) begin
    if(rst) begin
        mtvec <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MTEVC) begin
        mtvec <= wdata;
    end
end

always @(posedge clk) begin
    if(rst) begin
        mepc <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MEPC) begin
        mepc <= wdata;
    end

    if(wb_ex) begin
        mepc <= exc_addr;
    end

end

always @(posedge clk) begin
    if(rst) begin
        mcause <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MCAUSE) begin
        mcause <= wdata;
    end

    if(wb_ex) begin
        mcause <= exc_type;
    end
end


always @(posedge clk) begin
    if(rst) begin
        mstatus <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MSTATUS) begin
        mstatus[62:0] <= wdata[62:0];
        mstatus[63]   <= (wdata[16] & wdata[15]) || (wdata[14] & wdata[13]);
    end

    if(wb_ex) begin
        mstatus[7] <= mstatus[3];
        mstatus[12:11] <= 2'b11;
        mstatus[3] <= 1'b0;
    end

    if(mret_flush) begin
        mstatus[7] <= 1'b1;
        mstatus[12:11] <= 2'b00;
        mstatus[3] <= mstatus[7];
    end 
end

always @(posedge clk) begin
    if(rst) begin
        mie <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MIE) begin
        mie <= wdata;
    end
end

always @(posedge clk) begin
    if(rst) begin
        mip <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MIP) begin
        mip <= wdata;
    end
end


always @(posedge clk) begin
    if(rst) begin
        mscratch <= `YSYX210247_ZERO_WORD;
    end

    if(wen && waddr == `YSYX210247_MSCRATCH) begin
        mscratch <= wdata;
    end
end

assign rdata = (rst == 1'b1 & ren == 1'b1) ? `YSYX210247_ZERO_WORD : (addr == `YSYX210247_MCYCLE  ? mcycle  : 
                                                           addr == `YSYX210247_MSTATUS ? mstatus : 
                                                           addr == `YSYX210247_MCAUSE  ? mcause  : 
                                                           addr == `YSYX210247_MEPC    ? mepc    : 
                                                                              `YSYX210247_ZERO_WORD);



generate
	assign mstatus_o    =  wb_ex        ? {mstatus[63:13], 2'b11, mstatus[10:8], mstatus[3], mstatus[6:4], 1'b0, mstatus[2:0]} : 
                           mret_flush   ? {mstatus[63:13], 2'b00, mstatus[10:8], 1'b1, mstatus[6:4], mstatus[7], mstatus[2:0]} : 
                          (wen && waddr == `YSYX210247_MSTATUS) ? {(wdata[16] & wdata[15]) || (wdata[14] & wdata[13]), wdata[62:0]}       : mstatus;
    assign mepc_o       = wb_ex ? exc_addr : (wen && waddr == `YSYX210247_MEPC    ) ? wdata : mepc;
    assign mtvec_o      = (wen && waddr == `YSYX210247_MTEVC   ) ? wdata : mtvec;
    assign mie_o        = (wen && waddr == `YSYX210247_MIE     ) ? wdata : mie;
endgenerate


wire _unused_ok = &{1'b0,
                    mip,
                    mscratch,
                    1'b0};



endmodule


//--zhuyuhan 20210247--


module ysyx_210247_ctrl(
    input wire        rst,
    input wire [31:0] exc_op,
    input [`YSYX210247_REG_BUS]  csr_mepc,
    input [`YSYX210247_REG_BUS]  csr_mtvec,
    output wire [`YSYX210247_REG_BUS] new_pc
    );

    assign new_pc = ( rst == 1'b1 ) ? 0 : (exc_op == 32'h00000001 ? csr_mtvec : 
                                           exc_op == 32'h00000002 ? csr_mepc  :  
                                           exc_op == 32'h00000003 ? csr_mtvec : 
                                                                    `YSYX210247_ZERO_WORD);                                                                   
endmodule

//--zhuyuhan 20210247--

module ysyx_210247_exe_stage(
  input wire rst,

  input  wire exe_valid_in, 
  input  wire exe_allow_out,
  output wire exe_valid_out,
  output wire exe_allow_in,

  output wire            data_valid,
  input  wire            data_ready,
  input  wire [`YSYX210247_REG_BUS] data_read,  
  output wire [`YSYX210247_REG_BUS] data_addr,   
  output wire [ 2  :  0] data_size,
  output wire [`YSYX210247_REG_BUS] data_write,
  output wire            data_wen,
  output wire [ 7  :  0] data_strb,

  output wire             cmp_ren,
  output wire             cmp_wen,
  output wire [`YSYX210247_REG_BUS]  cmp_addr,
  input  wire [`YSYX210247_REG_BUS]  cmp_rdata,
  output wire [`YSYX210247_REG_BUS]  cmp_wdata,

  output wire [`YSYX210247_DST_BUS] EXE_wdest,
  output wire [`YSYX210247_REG_BUS] EXE_result,

  output wire            csr_ren,
  output wire [11  :  0] csr_addr,
  input  wire [`YSYX210247_REG_BUS] csr_rdata,

  output wire            mem_stall,

  input  wire [`YSYX210247_ID_TO_EXE_BUS -1:0] id_to_exe_bus_i,
  output wire [`YSYX210247_EXE_TO_MEM_BUS-1:0] exe_to_mem_bus_o
);
/*
wire debug_4448;
assign debug_4448 = exe_valid && (data_addr >= 64'h00000000_80004440 && data_addr < 64'h00000000_80004450); 
*/
wire [`YSYX210247_REG_BUS] id_pc;
wire [31  :  0] id_inst;
wire            id_wen;
wire [`YSYX210247_DST_BUS] id_wdest;
wire [2   :  0] func3;
wire [6   :  0] func7;
wire [7   :  0] inst_opcode;
wire [`YSYX210247_REG_BUS] op1;
wire [`YSYX210247_REG_BUS] op2;
wire [`YSYX210247_REG_BUS] rs2_data;
wire            store_op;
wire            load_op;
wire            rcsr_op; 
wire            wcsr_op;
wire [`YSYX210247_REG_BUS] csr_op1;
wire [`YSYX210247_REG_BUS] exc_type;
wire [`YSYX210247_REG_BUS] exc_addr;
wire [31  :  0] exc_op;

wire [`YSYX210247_REG_BUS] exe_pc;
wire [31  :  0] exe_inst;
wire            exe_wen;
wire [`YSYX210247_DST_BUS] exe_wdest;
wire [`YSYX210247_REG_BUS] exe_wdata;
wire            csr_wen;
wire [11  :  0] csr_waddr;
wire [`YSYX210247_REG_BUS] csr_wdata;

wire inst_is_addi;
wire inst_is_addiw;
wire inst_is_srliw;
wire inst_is_sraiw;
wire inst_is_slliw;
wire inst_is_auipc;
wire inst_is_lui;
wire inst_is_jal;
wire inst_is_addw;
wire inst_is_subw;
wire inst_is_sllw;
wire inst_is_sraw;
wire inst_is_srlw;
wire inst_is_slt;
wire inst_is_sltu;
wire inst_is_slti;
wire inst_is_sltiu;
wire inst_is_lh;
wire inst_is_lhu;
wire inst_is_lw;
wire inst_is_lwu;
wire inst_is_ld;
wire inst_is_jalr;
wire inst_is_sub;
wire inst_is_add;
wire inst_is_sw;
wire inst_is_sd;
wire inst_is_sh;
wire inst_is_sb;
wire inst_is_srai;
wire inst_is_slli;
wire inst_is_srli;
wire inst_is_lb;
wire inst_is_lbu;
wire inst_is_and;
wire inst_is_or;
wire inst_is_srl;
wire inst_is_sll;
wire inst_is_sra;
wire inst_is_andi;
wire inst_is_xori;
wire inst_is_ori;
wire inst_is_xor;
wire inst_is_csrrs;
wire inst_is_csrrw;
wire inst_is_csrrc;
wire inst_is_csrrsi;
wire inst_is_csrrci;


assign cmp_ren    = load_op  & (data_addr == `YSYX210247_CLINT_MTIMECMP | data_addr == `YSYX210247_CLINT_MTIME);
assign cmp_wen    = store_op & (data_addr == `YSYX210247_CLINT_MTIMECMP | data_addr == `YSYX210247_CLINT_MTIME);
assign cmp_addr   = data_addr;
assign cmp_wdata  = data_write;

wire hs_done;
wire exe_valid;
wire exe_ready_go;
wire [`YSYX210247_REG_BUS] data_rdata;

assign exe_valid      = exe_valid_in;
assign exe_ready_go   = exe_valid & ( (!load_op & !store_op) | hs_done | cmp_ren | cmp_wen);
assign exe_valid_out  = exe_ready_go;
assign exe_allow_in   = !exe_valid || exe_valid_out && exe_allow_out; 

assign hs_done    = data_valid & data_ready;
assign mem_stall  = load_op && !hs_done;

assign data_rdata = cmp_ren ? cmp_rdata : data_read;
assign data_wen   = ( |store_op );
assign data_valid = (load_op | store_op) & (exe_valid & exe_allow_out) & (!cmp_ren & !cmp_wen);
assign data_addr  = op1 + op2;
assign data_size  = inst_is_lw  | inst_is_sw ? `YSYX210247_SIZE_W :
                    inst_is_lwu              ? `YSYX210247_SIZE_W :
                    inst_is_lb  | inst_is_sb ? `YSYX210247_SIZE_B :
                    inst_is_lbu              ? `YSYX210247_SIZE_B :
                    inst_is_lh  | inst_is_sh ? `YSYX210247_SIZE_H :
                    inst_is_lhu              ? `YSYX210247_SIZE_H :
                    inst_is_ld  | inst_is_sd ? `YSYX210247_SIZE_D : 0;

assign data_strb  = inst_is_sw  ? (data_addr[2]   == 1'b0 ? 8'b00001111 : 
                                                            8'b11110000
                                 ) :
                   inst_is_sh  ? (data_addr[2:1] == 2'b00 ? 8'b00000011 :
                                  data_addr[2:1] == 2'b01 ? 8'b00001100 :
                                  data_addr[2:1] == 2'b10 ? 8'b00110000 :
                                                            8'b11000000
                                 ) :
                   inst_is_sb  ? (data_addr[2:0] == 3'b000 ? 8'b00000001 :
                                  data_addr[2:0] == 3'b001 ? 8'b00000010 :
                                  data_addr[2:0] == 3'b010 ? 8'b00000100 :
                                  data_addr[2:0] == 3'b011 ? 8'b00001000 :
                                  data_addr[2:0] == 3'b100 ? 8'b00010000 :
                                  data_addr[2:0] == 3'b101 ? 8'b00100000 :
                                  data_addr[2:0] == 3'b110 ? 8'b01000000 :
                                                             8'b10000000
                                 ) :
                   inst_is_sd  ? 8'b11111111 : 8'b00000000;
assign data_write = inst_is_sw  ? (data_addr[2]   == 1'b0 ? {32'd0, rs2_data[31:0]       } : 
                                                            {rs2_data[31:0], 32'd0       }
                                 ) :
                   inst_is_sh  ? (data_addr[2:1] == 2'b00 ? {48'd0, rs2_data[15:0]       } :
                                  data_addr[2:1] == 2'b01 ? {32'd0, rs2_data[15:0], 16'd0} :
                                  data_addr[2:1] == 2'b10 ? {16'd0, rs2_data[15:0], 32'd0} :
                                                            {rs2_data[15:0],        48'd0}
                                 ) :
                   inst_is_sb  ? (data_addr[2:0] == 3'b000 ? {56'd0, rs2_data[7:0]       } :
                                  data_addr[2:0] == 3'b001 ? {48'd0, rs2_data[7:0],  8'd0} :
                                  data_addr[2:0] == 3'b010 ? {40'd0, rs2_data[7:0], 16'd0} :
                                  data_addr[2:0] == 3'b011 ? {32'd0, rs2_data[7:0], 24'd0} :
                                  data_addr[2:0] == 3'b100 ? {24'd0, rs2_data[7:0], 32'd0} :
                                  data_addr[2:0] == 3'b101 ? {16'd0, rs2_data[7:0], 40'd0} :
                                  data_addr[2:0] == 3'b110 ? { 8'd0, rs2_data[7:0], 48'd0} :
                                                             {rs2_data[7:0],        56'd0}
                                 ) :              
                   inst_is_sd  ? rs2_data : `YSYX210247_ZERO_WORD;

assign csr_ren   = ( |rcsr_op );
assign csr_addr  = op2[11:0];

assign inst_is_addi  = inst_opcode == `YSYX210247_INST_ADDI_OP  & func3 == 3'b000;
assign inst_is_andi  = inst_opcode == `YSYX210247_INST_ANDI_OP  & func3 == 3'b111;
assign inst_is_xori  = inst_opcode == `YSYX210247_INST_XORI_OP  & func3 == 3'b100;
assign inst_is_ori   = inst_opcode == `YSYX210247_INST_ORI_OP   & func3 == 3'b110;
assign inst_is_addiw = inst_opcode == `YSYX210247_INST_ADDIW_OP & func3 == 3'b000;
assign inst_is_auipc = inst_opcode == `YSYX210247_INST_AUIPC_OP;
assign inst_is_lui   = inst_opcode == `YSYX210247_INST_LUI_OP;
assign inst_is_jal   = inst_opcode == `YSYX210247_INST_JAL_OP;
assign inst_is_addw  = inst_opcode == `YSYX210247_INST_ADDW_OP  & func3 == 3'b000 & func7 == 7'b0000000;
assign inst_is_subw  = inst_opcode == `YSYX210247_INST_SUBW_OP  & func3 == 3'b000 & func7 == 7'b0100000;
assign inst_is_sllw  = inst_opcode == `YSYX210247_INST_SLLW_OP  & func3 == 3'b001 & func7 == 7'b0000000;
assign inst_is_sraw  = inst_opcode == `YSYX210247_INST_SRAW_OP  & func3 == 3'b101 & func7 == 7'b0100000;
assign inst_is_srlw  = inst_opcode == `YSYX210247_INST_SRLW_OP  & func3 == 3'b101 & func7 == 7'b0000000;
assign inst_is_slt   = inst_opcode == `YSYX210247_INST_SLT_OP   & func3 == 3'b010 & func7 == 7'b0000000;
assign inst_is_sltu  = inst_opcode == `YSYX210247_INST_SLTU_OP  & func3 == 3'b011 & func7 == 7'b0000000;
assign inst_is_slti  = inst_opcode == `YSYX210247_INST_SLTI_OP  & func3 == 3'b010;
assign inst_is_sltiu = inst_opcode == `YSYX210247_INST_SLTIU_OP & func3 == 3'b011;
assign inst_is_lh    = inst_opcode == `YSYX210247_INST_LH_OP    & func3 == 3'b001;
assign inst_is_lhu   = inst_opcode == `YSYX210247_INST_LHU_OP   & func3 == 3'b101;
assign inst_is_lwu   = inst_opcode == `YSYX210247_INST_LWU_OP   & func3 == 3'b110;
assign inst_is_lw    = inst_opcode == `YSYX210247_INST_LW_OP    & func3 == 3'b010;
assign inst_is_ld    = inst_opcode == `YSYX210247_INST_LD_OP    & func3 == 3'b011;
assign inst_is_jalr  = inst_opcode == `YSYX210247_INST_JALR_OP  & func3 == 3'b000;
assign inst_is_sub   = inst_opcode == `YSYX210247_INST_SUB_OP   & func3 == 3'b000 & func7 == 7'b0100000;
assign inst_is_add   = inst_opcode == `YSYX210247_INST_ADD_OP   & func3 == 3'b000 & func7 == 7'b0000000;
assign inst_is_and   = inst_opcode == `YSYX210247_INST_AND_OP   & func3 == 3'b111 & func7 == 7'b0000000;
assign inst_is_or    = inst_opcode == `YSYX210247_INST_OR_OP    & func3 == 3'b110 & func7 == 7'b0000000;
assign inst_is_sll   = inst_opcode == `YSYX210247_INST_SLL_OP   & func3 == 3'b001 & func7 == 7'b0000000;
assign inst_is_srl   = inst_opcode == `YSYX210247_INST_SRL_OP   & func3 == 3'b101 & func7 == 7'b0000000;
assign inst_is_sra   = inst_opcode == `YSYX210247_INST_SRA_OP   & func3 == 3'b101 & func7 == 7'b0100000;
assign inst_is_xor   = inst_opcode == `YSYX210247_INST_XOR_OP   & func3 == 3'b100 & func7 == 7'b0000000;
assign inst_is_sw    = inst_opcode == `YSYX210247_INST_SW_OP    & func3 == 3'b010;
assign inst_is_sd    = inst_opcode == `YSYX210247_INST_SD_OP    & func3 == 3'b011;
assign inst_is_sh    = inst_opcode == `YSYX210247_INST_SH_OP    & func3 == 3'b001;
assign inst_is_sb    = inst_opcode == `YSYX210247_INST_SB_OP    & func3 == 3'b000;
assign inst_is_srai  = inst_opcode == `YSYX210247_INST_SRAI_OP  & func3 == 3'b101 & func7[6:1] == 6'b010000;
assign inst_is_slli  = inst_opcode == `YSYX210247_INST_SLLI_OP  & func3 == 3'b001 & func7[6:1] == 6'b000000;
assign inst_is_srli  = inst_opcode == `YSYX210247_INST_SRLI_OP  & func3 == 3'b101 & func7[6:1] == 6'b000000;
assign inst_is_srliw = inst_opcode == `YSYX210247_INST_SRLIW_OP & func3 == 3'b101 & func7[6:1] == 6'b000000;
assign inst_is_sraiw = inst_opcode == `YSYX210247_INST_SRAIW_OP & func3 == 3'b101 & func7[6:1] == 6'b010000;
assign inst_is_slliw = inst_opcode == `YSYX210247_INST_SLLIW_OP & func3 == 3'b001 & func7[6:1] == 6'b000000;
assign inst_is_lb    = inst_opcode == `YSYX210247_INST_LB_OP    & func3 == 3'b000;
assign inst_is_lbu   = inst_opcode == `YSYX210247_INST_LBU_OP   & func3 == 3'b100;
assign inst_is_csrrs = inst_opcode == `YSYX210247_INST_CSRRS_OP & func3 == 3'b010;
assign inst_is_csrrw = inst_opcode == `YSYX210247_INST_CSRRW_OP & func3 == 3'b001;
assign inst_is_csrrc = inst_opcode == `YSYX210247_INST_CSRRC_OP & func3 == 3'b011;
assign inst_is_csrrsi= inst_opcode == `YSYX210247_INST_CSRRSI_OP& func3 == 3'b110;
assign inst_is_csrrci= inst_opcode == `YSYX210247_INST_CSRRCI_OP& func3 == 3'b111;


wire [`YSYX210247_REG_BUS] op64;
wire [`YSYX210247_REG_BUS] op32;
wire [`YSYX210247_REG_BUS] jalr_res;
wire [`YSYX210247_REG_BUS] load_res;
wire [`YSYX210247_REG_BUS] sub_res;
wire [`YSYX210247_REG_BUS] add_res;
wire [`YSYX210247_REG_BUS] and_res;
wire [`YSYX210247_REG_BUS] or_res; 
wire [`YSYX210247_REG_BUS] sll_res;
wire [`YSYX210247_REG_BUS] srl_res;
wire [`YSYX210247_REG_BUS] sra_res; 
wire [`YSYX210247_REG_BUS] xor_res; 
wire [`YSYX210247_REG_BUS] andi_res;
wire [`YSYX210247_REG_BUS] xori_res;
wire [`YSYX210247_REG_BUS] ori_res;
wire [127 :  0] sr128_res;
wire [`YSYX210247_REG_BUS] sr_res;
wire [`YSYX210247_REG_BUS] slli_res;
wire [`YSYX210247_REG_BUS] srli_res;
wire [`YSYX210247_REG_BUS] sraiw_res;
wire [31  :  0] srliw_res;
wire [31  :  0] slliw_res;
wire [`YSYX210247_REG_BUS] subw_res;
wire [`YSYX210247_REG_BUS] sllw_res;
wire [`YSYX210247_REG_BUS] sraw_res;
wire [`YSYX210247_REG_BUS] srlw_res;
wire [`YSYX210247_REG_BUS] slti_res;
wire [`YSYX210247_REG_BUS] sltiu_res;
wire [`YSYX210247_REG_BUS] sltu_res;
wire [`YSYX210247_REG_BUS] slt_res;
wire [`YSYX210247_REG_BUS] csrrs_res;
wire [`YSYX210247_REG_BUS] csrrw_res;
wire [`YSYX210247_REG_BUS] csrrc_res;
wire [`YSYX210247_REG_BUS] csrrsi_res;
wire [`YSYX210247_REG_BUS] csrrci_res;
wire [`YSYX210247_REG_BUS] op1_sub_op2;
wire            op1ltop2;
wire            op1ltuop2;
assign          op1_sub_op2 = op1 + ~op2 + 1;
assign          op1ltop2 = (op1[63]  & ~op2[63]) || (~(op1[63] ^ op2[63]) && op1_sub_op2[63]);
assign          op1ltuop2= (~op1[63] &  op2[63]) || (~(op1[63] ^ op2[63]) && op1_sub_op2[63]);
assign          op64     = op1 + op2;
assign          op32     = {{32{op64[31]}}, op64[31:0]};
assign          jalr_res = exe_pc + 64'd4;
assign          sub_res  = op1 + (~op2 + 1);
assign          add_res  = op1 + op2;
assign          and_res  = op1 & op2;
assign          or_res   = op1 | op2;
assign          xor_res  = op1 ^ op2;
assign          andi_res = op1 & op2;
assign          xori_res = op1 ^ op2;
assign          ori_res  = op1 | op2;
assign          srl_res  = op1 >> op2[5:0];
assign          sll_res  = op1 << op2[5:0];
assign          sra_res  = sr128_res[63:0];
assign          sr128_res= {{64{op1[63]}}, op1} >> op2[5:0];
assign          sr_res   = sr128_res[63:0];
assign          slli_res = op1 << op2[5:0];
assign          srli_res = op1 >> op2[5:0];
assign          srliw_res= op1[31:0] >> op2[5:0];
assign          sraiw_res= {{32{op1[31]}}, op1[31:0]} >> op2[5:0];
assign          slliw_res= op1[31:0] << op2[5:0];
assign          subw_res = op1 + (~op2 + 1);
assign          sllw_res = op1 << op2[4:0];
assign          sraw_res = {{32{op1[31]}}, op1[31:0]} >> op2[4:0];
assign          srlw_res = {32'd0, op1[31:0]} >> op2[4:0];
assign          slti_res = {63'd0, op1ltop2};
assign          sltiu_res= {63'd0, op1ltuop2};
assign          sltu_res = {63'd0, op1ltuop2};
assign          slt_res  = {63'd0, op1ltop2};
assign          csrrs_res = csr_rdata;
assign          csrrw_res = csr_rdata;
assign          csrrc_res = csr_rdata;
assign          csrrsi_res= csr_rdata;
assign          csrrci_res= csr_rdata;

assign load_res =     {64{inst_is_lb }} & {{56{data_rdata[ 7]}}, data_rdata[ 7:0]}
                    | {64{inst_is_lbu}} & { 56'd0              , data_rdata[ 7:0]}
                    | {64{inst_is_lh }} & {{48{data_rdata[15]}}, data_rdata[15:0]}
                    | {64{inst_is_lhu}} & { 48'd0              , data_rdata[15:0]}
                    | {64{inst_is_lw }} & {{32{data_rdata[31]}}, data_rdata[31:0]}
                    | {64{inst_is_lwu}} & { 32'd0              , data_rdata[31:0]}
                    | {64{inst_is_ld }} &                        data_rdata;


assign exe_wdata = (rst == 1'b1) ? `YSYX210247_ZERO_WORD : (inst_is_addi  ? op64 :
                                               inst_is_auipc ? op64 :
                                               inst_is_lui   ? op2  :
                                               inst_is_jal   ? op64 :
                                               inst_is_addw  ? op32 :
                                               inst_is_jalr  ? jalr_res :
                                               inst_is_sub   ? sub_res  :
                                               inst_is_add   ? add_res  :
                                               inst_is_and   ? and_res  :
                                               inst_is_or    ? or_res   :
                                               inst_is_xor   ? xor_res  :
                                               inst_is_andi  ? andi_res :
                                               inst_is_xori  ? xori_res :
                                               inst_is_ori   ? ori_res  :
                                               inst_is_srai  ? sr_res   :
                                               inst_is_slli  ? slli_res :
                                               inst_is_srli  ? srli_res :
                                               inst_is_srl   ? srl_res  :
                                               inst_is_sll   ? sll_res  :
                                               inst_is_sra   ? sra_res  :
                                               inst_is_srliw ? {{32{srliw_res[31]}}, srliw_res}:
                                               inst_is_sraiw ? {{32{sraiw_res[31]}}, sraiw_res[31:0]}:
                                               inst_is_slliw ? {{32{slliw_res[31]}}, slliw_res}:
                                               inst_is_subw  ? {{32{subw_res[31]}}, subw_res[31:0]} :
                                               inst_is_sllw  ? {{32{sllw_res[31]}}, sllw_res[31:0]} :
                                               inst_is_sraw  ? {{32{sraw_res[31]}}, sraw_res[31:0]} :
                                               inst_is_srlw  ? {{32{srlw_res[31]}}, srlw_res[31:0]} :
                                               inst_is_slti  ? slti_res  : 
                                               inst_is_sltiu ? sltiu_res : 
                                               inst_is_sltu  ? sltu_res  :
                                               inst_is_slt   ? slt_res   :
                                               inst_is_addiw ? op32      :
                                               inst_is_csrrs ? csrrs_res :
                                               inst_is_csrrw ? csrrw_res :
                                               inst_is_csrrc ? csrrc_res :
                                               inst_is_csrrsi? csrrsi_res:
                                               inst_is_csrrci? csrrci_res:
                                               load_op       ? load_res  :
                                               `YSYX210247_ZERO_WORD);


assign {
        csr_op1,
        exc_type,   
        exc_addr,   
        exc_op,
        store_op,   
        load_op,    
        rcsr_op,    
        wcsr_op,   
        rs2_data,
        op1,          
        op2,         
        func3,      
        func7,        
        inst_opcode,  
        id_pc,
        id_inst,
        id_wen,
        id_wdest
        } = id_to_exe_bus_i;


assign exe_pc       = id_pc;
assign exe_inst     = id_inst;
assign exe_wen      = id_wen;
assign exe_wdest    = id_wdest; 
assign csr_wen      = ( |wcsr_op );
assign csr_waddr    = op2[11:0];
assign csr_wdata    = inst_is_csrrs ? (csr_op1 | csr_rdata) : 
                      inst_is_csrrw ? (csr_op1            ) : 
                      inst_is_csrrsi? ({csr_rdata[63:5], csr_rdata[4:0] |  csr_op1[4:0]}) : 
                      inst_is_csrrci? ({csr_rdata[63:5], csr_rdata[4:0] &~ csr_op1[4:0]}) : 
                      inst_is_csrrc ? (csr_rdata &~ csr_op1) : 
                                      `YSYX210247_ZERO_WORD;

assign exe_to_mem_bus_o = {
    exc_type,   //402:339
    exc_addr,   //338:275
    exc_op,     //274:243
    csr_wen,    //242:242
    csr_waddr,  //241:230
    csr_wdata,  //229:166
    exe_pc,     //165:102
    exe_inst,   //101:70
    exe_wen,    // 69:69
    exe_wdest,  // 68:64
    exe_wdata   // 63: 0
};       

assign EXE_wdest  = exe_wdest & {5{exe_valid}};
assign EXE_result = exe_wdata;

wire _unused_ok = &{1'b0,
                    srlw_res[63:32],
                    sraw_res[63:32], 
                    sllw_res[63:32],
                    subw_res[63:32],
                    sraiw_res[63:32],
                    sr128_res[127:64],
                    op1_sub_op2[62:0],
                    1'b0};

endmodule

//--zhuyuhan 20210247--

module ysyx_210247_id_stage(
  input wire rst,

  output wire [`YSYX210247_BR_BUS] br_bus,  

  input  wire id_valid_in, 
  input  wire id_allow_out,
  output wire id_valid_out,
  output wire id_allow_in,

  output wire             rs1_r_ena,
  output wire [`YSYX210247_DST_BUS]  rs1_r_addr,
  output wire             rs2_r_ena,
  output wire [`YSYX210247_DST_BUS]  rs2_r_addr,
  input  wire [`YSYX210247_REG_BUS]  rs1_data,
  input  wire [`YSYX210247_REG_BUS]  rs2_data,

  input  wire [`YSYX210247_DST_BUS]  EXE_wdest,
  input  wire [`YSYX210247_REG_BUS]  EXE_result,
  input  wire [`YSYX210247_DST_BUS]  MEM_wdest,
  input  wire [`YSYX210247_REG_BUS]  MEM_result,
  input  wire [`YSYX210247_DST_BUS]  WB_wdest,
  input  wire [`YSYX210247_REG_BUS]  WB_result,

  input  wire             time_int,
  input  wire             mem_stall,
  output wire             br_stall,

  input  wire [`YSYX210247_IF_TO_ID_BUS -1:0] if_to_id_bus_i,
  output wire [`YSYX210247_ID_TO_EXE_BUS-1:0] id_to_exe_bus_o
);

// I-type or U-type
wire [6  :  0]opcode;
wire [4  :  0]rd;
//wire [2  :  0]func3;
wire [4  :  0]rs1;
wire [11 :  0]imm;
wire [19 :  0]U_imm;
//R-type 
wire [4  :  0]rs2;
// J-type
wire [20 : 0]J_imm;
//B-type
wire [12 : 0]B_imm;
//S-type
wire [11 : 0]S_imm;
wire [`YSYX210247_REG_BUS] id_pc;
wire [31  :  0] id_inst;
wire            id_wen;
wire [`YSYX210247_DST_BUS] id_wdest;
wire [2   :  0] func3;
wire [6   :  0] func7;
wire [7   :  0] inst_opcode;
wire [`YSYX210247_REG_BUS] op1;
wire [`YSYX210247_REG_BUS] op2;
wire            store_op;
wire            load_op;
wire            rcsr_op; 
wire            wcsr_op;
wire [`YSYX210247_REG_BUS] csr_op1;
wire [`YSYX210247_REG_BUS] exc_type;
wire [`YSYX210247_REG_BUS] exc_addr;
wire [31  :  0] exc_op;
wire            rs1_forward;
wire            rs2_forward;
wire [`YSYX210247_REG_BUS] rs1_value;
wire [`YSYX210247_REG_BUS] rs2_value;

//jump adress
wire             br_taken;
wire [`YSYX210247_REG_BUS]  br_target;

wire id_valid;
wire id_ready_go;

assign id_valid     = id_valid_in;
assign id_ready_go  = id_valid && !br_stall;
assign id_valid_out = id_ready_go;
assign id_allow_in  = !id_valid || id_valid_out && id_allow_out;

assign br_stall = mem_stall && (rs1 != 5'd0) & (rs1 == EXE_wdest) & rs1_r_ena;

wire [5 : 0]inst_type;

//I-type
wire inst_addi  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];
wire inst_lh    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                &  func3[0] & ~func3[1] &  ~func3[2];
wire inst_lhu   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                &  func3[0] & ~func3[1] &   func3[2];                
wire inst_lw    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] &  func3[1] &  ~func3[2];
wire inst_lwu   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] &  func3[1] &   func3[2];                
wire inst_ld    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                &  func3[0] &  func3[1] &  ~func3[2];
wire inst_slti  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] &  func3[1] &  ~func3[2];                 
wire inst_sltiu = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                &  func3[0] &  func3[1] &  ~func3[2];     
wire inst_jalr  = opcode[0] & opcode[1] &  opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];       
wire inst_addiw = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];   
wire inst_srliw = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func7[1] & ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];  
wire inst_sraiw = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func7[1] & ~func7[2] &  ~func7[3] &  ~func7[4] &   func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];                
wire inst_slliw = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func7[1] & ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &  ~func3[2];                                
wire inst_srai  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func7[1] & ~func7[2] &  ~func7[3] &  ~func7[4] &   func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];    
wire inst_slli  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func7[1] & ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &  ~func3[2];  
wire inst_srli  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func7[1] & ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];    
wire inst_lb    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];                                            
wire inst_lbu   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] & ~func3[1] &   func3[2];  
wire inst_andi  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                &  func3[0] &  func3[1] &   func3[2];                                                           
wire inst_xori  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] & ~func3[1] &   func3[2];  
wire inst_ori   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6]
                & ~func3[0] &  func3[1] &   func3[2];    
wire inst_csrrs = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                & ~func3[0] &  func3[1] &  ~func3[2];     
wire inst_csrrw = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                &  func3[0] & ~func3[1] &  ~func3[2]; 
wire inst_csrrc = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                &  func3[0] &  func3[1] &  ~func3[2];                 
wire inst_csrrci= opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                &  func3[0] &  func3[1] &   func3[2];     
wire inst_csrrsi= opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                & ~func3[0] &  func3[1] &   func3[2];                   
wire inst_ecall = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];   
wire inst_mret  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] &  opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &   func7[3] &   func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &  ~func3[2] & rs2 == 5'b00010;                                                                                        

//U-type
wire inst_auipc = opcode[0] & opcode[1] &  opcode[2] & ~opcode[3] &  opcode[4] & ~opcode[5] & ~opcode[6];  
wire inst_lui   = opcode[0] & opcode[1] &  opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6];  

//R-type
wire inst_addw  = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];
wire inst_subw  = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &   func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];                
wire inst_sllw  = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &  ~func3[2];    
wire inst_sraw  = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &   func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];  
wire inst_srlw  = opcode[0] & opcode[1] & ~opcode[2] &  opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];   
wire inst_sll   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &  ~func3[2];                    
wire inst_srl   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2]; 
wire inst_sra   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &   func7[5] &  ~func7[6]
                &  func3[0] & ~func3[1] &   func3[2];                                                                          
wire inst_sub   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &   func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];
wire inst_add   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &  ~func3[2];    
wire inst_and   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] &  func3[1] &   func3[2]; 
wire inst_or    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] &  func3[1] &   func3[2];   
wire inst_xor   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] & ~func3[1] &   func3[2];                   
wire inst_slt   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                & ~func3[0] &  func3[1] &  ~func3[2];                               
wire inst_sltu  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] &  opcode[4] &  opcode[5] & ~opcode[6]
                & ~func7[0] & ~func7[1] &  ~func7[2] &  ~func7[3] &  ~func7[4] &  ~func7[5] &  ~func7[6]
                &  func3[0] &  func3[1] &  ~func3[2];                                             

//J-type
wire inst_jal   = opcode[0] & opcode[1] &  opcode[2] &  opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6];  

//B-type
wire inst_beq   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                & ~func3[0] & ~func3[1] & ~func3[2]; 
wire inst_bne   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                &  func3[0] & ~func3[1] & ~func3[2]; 
wire inst_bge   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                &  func3[0] & ~func3[1] &  func3[2];  
wire inst_blt   = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                & ~func3[0] & ~func3[1] &  func3[2];  
wire inst_bltu  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                & ~func3[0] &  func3[1] &  func3[2];                
wire inst_bgeu  = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] &  opcode[6]
                &  func3[0] &  func3[1] &  func3[2];                                                

//S-type
wire inst_sd    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] & ~opcode[6]
                &  func3[0] &  func3[1] & ~func3[2]; 
wire inst_sh    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] & ~opcode[6]
                &  func3[0] & ~func3[1] & ~func3[2];  
wire inst_sb    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] & ~opcode[6]
                & ~func3[0] & ~func3[1] & ~func3[2];  
wire inst_sw    = opcode[0] & opcode[1] & ~opcode[2] & ~opcode[3] & ~opcode[4] &  opcode[5] & ~opcode[6]
                & ~func3[0] &  func3[1] & ~func3[2];                                                             

assign exc_type = ( rst == 1'b1 ) ? 0 : (inst_ecall ? 64'd11  : 
                                         inst_mret  ? 64'd666 : 
                                         time_int   ? 64'h8000000000000007 :
                                                      `YSYX210247_ZERO_WORD);
assign exc_addr = ( rst == 1'b1 ) ? 0 : (inst_ecall | time_int ? id_pc : 0);
assign exc_op   = ( rst == 1'b1 ) ? 0 : (inst_ecall ? 32'h00000001 : 
                                         inst_mret  ? 32'h00000002 :  
                                         time_int   ? 32'h00000003 :
                                                      32'd0);

assign load_op  = inst_lw | inst_lwu | inst_ld | inst_lb | inst_lbu | inst_lh | inst_lhu;
assign store_op = inst_sd | inst_sh  | inst_sb | inst_sw;
assign wcsr_op  = inst_csrrs | inst_csrrw | inst_csrrci | inst_csrrsi | inst_csrrc;
assign rcsr_op  = inst_csrrs | inst_csrrw | inst_csrrci | inst_csrrsi | inst_csrrc;


assign inst_type      = (  rst == 1'b1 ) ? 0 : ( {6{inst_auipc| inst_lui}} & `YSYX210247_U_type |
                                                 {6{inst_addi | inst_lw   | inst_sltiu | inst_jalr | 
                                                   inst_addiw | inst_ld   | inst_srai  | inst_lbu  |
                                                   inst_andi  | inst_xori | inst_lh    | inst_lhu  | 
                                                   inst_slli  | inst_srli | inst_srliw | inst_slliw|
                                                   inst_sraiw | inst_ori  | inst_slti  | inst_lb   |
                                                   inst_lwu   | inst_csrrs| inst_csrrw | inst_csrrci | 
                                                   inst_csrrsi| inst_csrrc}} & `YSYX210247_I_type |
                                                 {6{inst_addw | inst_sub  | inst_add | inst_sllw |
                                                    inst_and  | inst_sltu | inst_or  | inst_subw |
                                                    inst_sraw | inst_srlw | inst_slt | inst_xor  |
                                                    inst_srl  | inst_sra  | inst_sll}} & `YSYX210247_R_type |
                                                 {6{inst_sd   | inst_sh   | inst_sb  | inst_sw}} & `YSYX210247_S_type |
                                                 {6{inst_jal  }} & `YSYX210247_J_type |
                                                 {6{inst_beq | inst_bne   | inst_bge | inst_blt | inst_bgeu | inst_bltu}} & `YSYX210247_B_type
                                                );

assign inst_opcode = (  rst == 1'b1 ) ? 0 : {1'b0,opcode};

assign opcode = id_inst[6  :  0];
assign rd     = id_inst[11 :  7];
assign func3  = id_inst[14 : 12];
assign rs1    = id_inst[19 : 15];
assign imm    = id_inst[31 : 20];
assign U_imm  = id_inst[31 : 12];
assign rs2    = id_inst[24 : 20];
assign func7  = id_inst[31:25];
assign J_imm  = {id_inst[31], id_inst[19:12], id_inst[20], id_inst[30:21], 1'b0};
assign B_imm  = {id_inst[31], id_inst[7], id_inst[30:25], id_inst[11:8], 1'b0};
assign S_imm     = {id_inst[31:25], id_inst[11:7]};

//jump conditions
wire op1eqop2;
wire op1neop2;
wire op1geop2;
wire op1geuop2;
wire op1ltop2;
wire op1ltuop2;
wire [`YSYX210247_REG_BUS] op1_sub_op2;
assign op1_sub_op2 = op1 + ~op2 + 1;
assign op1eqop2  = op1 == op2;
assign op1neop2  = op1 != op2;
assign op1geop2  = (op1 == op2) || (~op1[63] & op2[63]) || (~(op1[63] ^ op2[63]) && ~op1_sub_op2[63]);
assign op1ltop2  = ( op1[63]  & ~op2[63]) || (~(op1[63] ^ op2[63]) && op1_sub_op2[63]);
assign op1ltuop2 = (~op1[63]  &  op2[63]) || (~(op1[63] ^ op2[63]) && op1_sub_op2[63]);
assign op1geuop2 = ~op1ltuop2;

assign           br_taken  = (  rst == 1'b1 ) ? 0 :(inst_jal  |
                                                    inst_jalr |
                                                   (inst_bne  & op1neop2)  |
                                                   (inst_bge  & op1geop2)  |
                                                   (inst_bgeu & op1geuop2) |
                                                   (inst_blt  & op1ltop2)  |
                                                   (inst_bltu & op1ltuop2) |
                                                   (inst_beq  & op1eqop2) );
assign           br_target = inst_jal  ? {{43{J_imm[20]}}, J_imm} + id_pc : 
                             inst_bne  ? {{51{B_imm[12]}}, B_imm} + id_pc :
                             inst_bge  ? {{51{B_imm[12]}}, B_imm} + id_pc :
                             inst_bgeu ? {{51{B_imm[12]}}, B_imm} + id_pc :
                             inst_blt  ? {{51{B_imm[12]}}, B_imm} + id_pc :
                             inst_bltu ? {{51{B_imm[12]}}, B_imm} + id_pc :
                             inst_beq  ? {{51{B_imm[12]}}, B_imm} + id_pc :
                             inst_jalr ? op1 + op2 :
                            `YSYX210247_ZERO_WORD;
assign           br_bus    = {id_ready_go, br_taken, br_target};

//read
assign rs1_r_ena  = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_I_type | inst_type == `YSYX210247_B_type | inst_type == `YSYX210247_R_type | inst_type == `YSYX210247_S_type);
assign rs1_r_addr = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_I_type | inst_type == `YSYX210247_B_type | inst_type == `YSYX210247_R_type | inst_type == `YSYX210247_S_type ? rs1 : 0 );
assign rs2_r_ena  = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_R_type | inst_type == `YSYX210247_B_type | inst_type == `YSYX210247_S_type);
assign rs2_r_addr = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_R_type | inst_type == `YSYX210247_B_type | inst_type == `YSYX210247_S_type ? rs2 : 0 );

//write
assign id_wen   = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_I_type | 
                                         inst_type == `YSYX210247_U_type | 
                                         inst_type == `YSYX210247_R_type | 
                                         inst_type == `YSYX210247_J_type
                                        );

assign id_wdest  = ( rst == 1'b1 ) ? 0 : ( (inst_type == `YSYX210247_I_type | 
                                            inst_type == `YSYX210247_U_type | 
                                            inst_type == `YSYX210247_R_type | 
                                            inst_type == `YSYX210247_J_type) ? rd  : 0 );

assign op1 = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_I_type ? rs1_value : 
                                    inst_type == `YSYX210247_R_type ? rs1_value : 
                                    inst_type == `YSYX210247_B_type ? rs1_value :
                                    inst_type == `YSYX210247_S_type ? rs1_value : 
                                    inst_type == `YSYX210247_U_type ? id_pc :
                                    inst_type == `YSYX210247_J_type ? id_pc : 0 );

assign op2 = ( rst == 1'b1 ) ? 0 : (inst_type == `YSYX210247_I_type ? { {52{imm[11]}}, imm } : 
                                    inst_type == `YSYX210247_R_type ? rs2_value : 
                                    inst_type == `YSYX210247_B_type ? rs2_value :
                                    inst_type == `YSYX210247_S_type ? { {52{S_imm[11]}}, S_imm }  : 
                                    inst_type == `YSYX210247_U_type ? { {32{U_imm[19]}}, {U_imm, 12'd0} } : 
                                    inst_type == `YSYX210247_J_type ? 64'd4 : 0 );

wire [`YSYX210247_REG_BUS] if_pc;
wire [31  :  0] if_inst;

assign {
        if_pc,
        if_inst
        } = if_to_id_bus_i;

assign id_pc       = if_pc;
assign id_inst     = if_inst;
assign csr_op1  =  {64{inst_csrrs }} & op1
                 | {64{inst_csrrw }} & op1
                 | {64{inst_csrrci}} & {59'd0, rs1}
                 | {64{inst_csrrsi}} & {59'd0, rs1}
                 | {64{inst_csrrc }} & op1;                                                  

assign id_to_exe_bus_o = {
    csr_op1,      // 539:476
    exc_type,     // 475:412
    exc_addr,     // 411:348
    exc_op,       // 347:316
    store_op,     // 315:315
    load_op,      // 314:314
    rcsr_op,      // 313:313
    wcsr_op,      // 312:312
    rs2_value,    // 311:248
    op1,          // 247:184
    op2,          // 183:120
    func3,        // 119:117
    func7,        // 116:110
    inst_opcode,  // 109:102
    id_pc,        // 101: 38
    id_inst,      //  37:  6
    id_wen,       //   5:  5
    id_wdest      //   4:  0
}; 

assign rs1_forward = (rs1 != 5'd0) & (rs1 == EXE_wdest | rs1 == MEM_wdest | rs1 == WB_wdest) & rs1_r_ena;
assign rs2_forward = (rs2 != 5'd0) & (rs2 == EXE_wdest | rs2 == MEM_wdest | rs2 == WB_wdest) & rs2_r_ena;

assign rs1_value = rs1_forward ? (rs1 == EXE_wdest ? EXE_result : 
                                  rs1 == MEM_wdest ? MEM_result :
                                  rs1 ==  WB_wdest ?  WB_result : 
                                                     `YSYX210247_ZERO_WORD)  : rs1_data;
assign rs2_value = rs2_forward ? (rs2 == EXE_wdest ? EXE_result : 
                                  rs2 == MEM_wdest ? MEM_result :
                                  rs2 ==  WB_wdest ?  WB_result : 
                                                     `YSYX210247_ZERO_WORD)  : rs2_data;                                                     

wire _unused_ok = &{1'b0,
                    op1_sub_op2[62:0],
                    1'b0};

endmodule

//--xuezhen--

module ysyx_210247_if_stage(
  input wire clk,
  input wire rst,

  input  wire if_allow_out,
  output wire if_valid_out,
  
  input  wire [`YSYX210247_BR_BUS] br_bus,
  output wire [`YSYX210247_IF_TO_ID_BUS-1:0] if_to_id_bus_o,

  output wire             inst_valid,
  input  wire             inst_ready,
  input  wire [63  :  0]  inst_read,    //inst
  output wire [`YSYX210247_REG_BUS]  inst_addr,    //inst_addr
  output wire [ 2  :  0]  inst_size,

  input  wire             br_stall,
  input  wire [`YSYX210247_REG_BUS]  new_pc,
  input  wire             flush
);
/*
wire debug_valid;
assign debug_valid = if_inst == 32'h0086b583;
always @(posedge clk) begin
    if(debug_valid && if_valid) begin
      $write("debug success!!\n");
    end
end
*/
wire handshake_done = inst_valid & inst_ready;
wire [`YSYX210247_REG_BUS] next_pc;

reg [`YSYX210247_REG_BUS] if_pc;
reg [31  :  0] if_inst;
reg [`YSYX210247_REG_BUS] waite_pc;
reg [`YSYX210247_REG_BUS] flush_pc;
reg            waite_valid;
reg            flush_valid;
reg            flush_wait;

//jump adress
wire             branch_valid;
wire             br_valid;
wire             br_taken;
wire [`YSYX210247_REG_BUS]  br_target;
assign {br_valid, br_taken, br_target} = br_bus;
assign branch_valid = br_valid & br_taken;        //wait for load

wire preif_valid;
wire preif_ready_go;
wire preif_valid_out; 
wire preif_allow_out;

reg  if_valid_in;
wire if_valid;
wire if_ready_go;
wire if_allow_in;

assign preif_valid      = !rst;
assign preif_ready_go   = preif_valid & handshake_done & !flush_valid && !br_stall;
assign preif_valid_out  = preif_ready_go; 
assign preif_allow_out  = if_allow_in;

always @ (posedge clk) begin
  if (rst) begin
    if_valid_in <= 1'b0;
  end
  else if (if_allow_in) begin
    if_valid_in <= preif_valid_out;
  end
end

assign if_valid     = if_valid_in;
assign if_ready_go  = if_valid;
assign if_valid_out = if_ready_go;
assign if_allow_in  = !if_valid || if_valid_out && if_allow_out;

assign inst_valid = preif_valid && preif_allow_out;
assign inst_addr  = next_pc;
assign inst_size  = `YSYX210247_SIZE_W;

always @ (posedge clk) begin
  if (rst)begin
    if_pc   <= `YSYX210247_PC_START;
    if_inst <= 32'd0;
  end
  else if (if_allow_in && preif_valid_out)begin
    if_pc   <= next_pc;
    if_inst <= inst_read[31:0];
  end
end

always@(posedge clk) begin
  if(rst) begin
    flush_pc <= `YSYX210247_PC_START;
  end
  else
  if(flush) begin 
    flush_pc <= new_pc;
  end
end

always@(posedge clk) begin
  if(rst) begin
    waite_pc <= `YSYX210247_PC_START;
  end
  else
  if(branch_valid) begin 
    waite_pc <= br_target;
  end
end

always@(posedge clk) begin
  if(rst) begin
    flush_valid <= 1'b0;
  end
  if(flush && !handshake_done) begin
    flush_valid <= 1'b1;
  end
  else if(handshake_done) begin
    flush_valid <= 1'b0;
  end
end

always@(posedge clk) begin
  if(rst) begin
    waite_valid <= 1'b0;
  end
  if(branch_valid) begin
    waite_valid <= 1'b1;
  end
  if(if_ready_go) begin
    waite_valid <= 1'b0;
  end
end

always @(posedge clk) begin
  if(rst) begin
    flush_wait <= 1'b0;
  end
  if(flush_valid & handshake_done) begin
    flush_wait <= 1'b1;
  end
  else if(handshake_done) begin
    flush_wait <= 1'b0;
  end
end

reg br_pc_valid;
always @(posedge clk) begin
    if(rst) begin
      br_pc_valid <= 1'b0;
    end
    if(branch_valid & handshake_done) begin
      br_pc_valid <= 1'b1;
    end
    else if(!waite_valid) begin
    br_pc_valid <= 1'b0;
  end
end

assign next_pc =  flush_valid   ?   flush_pc  :
                  flush_wait    ?   flush_pc  :
                  flush         ?   new_pc    :
                  br_pc_valid   ?   if_pc + 4 :
                  waite_valid   ?   waite_pc  :
                  branch_valid  ?   br_target : 
                                    if_pc + 4;


assign if_to_id_bus_o = {
    if_pc,    // 95:32
    if_inst   // 31: 0
}; 

wire _unused_ok = &{1'b0,
                    inst_read[63:32],
                    1'b0};

endmodule


//--zhuyuhan 20210247--

module ysyx_210247_mem_stage(                 
    input  wire mem_valid_in, 
    input  wire mem_allow_out,
    output wire mem_valid_out,
    output wire mem_allow_in,

    output wire [`YSYX210247_DST_BUS] MEM_wdest,
    output wire [`YSYX210247_REG_BUS] MEM_result,

    input  wire [`YSYX210247_EXE_TO_MEM_BUS-1:0] exe_to_mem_bus_i,
    output wire [`YSYX210247_MEM_TO_WB_BUS -1:0] mem_to_wb_bus_o
);

wire mem_valid;
wire mem_ready_go; 

assign mem_valid     = mem_valid_in; 
assign mem_ready_go  = mem_valid;
assign mem_valid_out = mem_ready_go;
assign mem_allow_in  = !mem_valid || mem_valid_out && mem_allow_out;


wire [`YSYX210247_REG_BUS] exe_pc;
wire [31  :  0] exe_inst;
wire            exe_wen;
wire [`YSYX210247_DST_BUS] exe_wdest;
wire [`YSYX210247_REG_BUS] exe_wdata;

wire [`YSYX210247_REG_BUS] mem_pc;
wire [31  :  0] mem_inst;
wire            mem_wen;
wire [`YSYX210247_DST_BUS] mem_wdest;
wire [`YSYX210247_REG_BUS] mem_wdata;
wire [`YSYX210247_REG_BUS] exc_type;
wire [`YSYX210247_REG_BUS] exc_addr;
wire [31  :  0] exc_op;
wire            csr_wen;
wire [11  :  0] csr_waddr;
wire [`YSYX210247_REG_BUS] csr_wdata;

assign {
        exc_type,   
        exc_addr,  
        exc_op,   
        csr_wen, 
        csr_waddr,  
        csr_wdata, 
        exe_pc,
        exe_inst,
        exe_wen,
        exe_wdest,
        exe_wdata
        } = exe_to_mem_bus_i;


assign mem_pc       = exe_pc;
assign mem_inst     = exe_inst;
assign mem_wen      = exe_wen;
assign mem_wdest    = exe_wdest;
assign mem_wdata    = exe_wdata;

assign mem_to_wb_bus_o = {
    exc_type,   //402:339
    exc_addr,   //338:275
    exc_op,     //274:243
    csr_wen,    //242:242
    csr_waddr,  //241:230
    csr_wdata,  //229:166
    mem_pc,     //165:102
    mem_inst,   //101:70
    mem_wen,    // 69:69
    mem_wdest,  // 68:64
    mem_wdata   // 63: 0
};

assign MEM_wdest  = mem_wdest & {5{mem_valid}};
assign MEM_result = mem_wdata;
            

endmodule


//--zhuyuhan 20210247--

module ysyx_210247_reg_exe_mem(    
    input                         clk,  
    input                         rst,
    input                         flush,

    input                         exe_valid_out,
    input  [`YSYX210247_EXE_TO_MEM_BUS-1:0]  exe_to_mem_bus_o,

    output                        mem_valid_in,     
    output [`YSYX210247_EXE_TO_MEM_BUS-1:0]  exe_to_mem_bus_i,

    output                        exe_allow_out,
    input                         mem_allow_in
); 

reg                         exe_to_mem_valid;    //valid of Pipeline register
reg [`YSYX210247_EXE_TO_MEM_BUS-1:0]   exe_to_mem_data;     //Pipeline register


assign mem_valid_in                 = exe_to_mem_valid;
assign exe_to_mem_bus_i             = exe_to_mem_data;
assign exe_allow_out                = mem_allow_in;
 
always @ (posedge clk) begin
    if (rst || flush) begin
        exe_to_mem_valid <= 1'b0;
    end
    else if (mem_allow_in) begin
        exe_to_mem_valid <= exe_valid_out;
    end
end

always @ (posedge clk) begin
    if (rst || flush) begin
        exe_to_mem_data <= {`YSYX210247_EXE_TO_MEM_BUS{1'b0}}; 
    end
    else if (mem_allow_in && exe_valid_out) begin
        exe_to_mem_data <= exe_to_mem_bus_o;
    end
end
endmodule

module ysyx_210247_regfile(
    input  wire clk,
	input  wire rst,
	
	input  wire  [4  : 0] w_addr,
	input  wire  [`YSYX210247_REG_BUS] w_data,
	input  wire 		  w_ena,
	
	input  wire  [4  : 0] r_addr1,
	output reg   [`YSYX210247_REG_BUS] r_data1,
	input  wire 		  r_ena1,
	
	input  wire  [4  : 0] r_addr2,
	output reg   [`YSYX210247_REG_BUS] r_data2,
	input  wire 		  r_ena2
    );

    // 32 registers
	reg [`YSYX210247_REG_BUS] 	regs[0 : 31];
	
	always @(posedge clk) 
	begin
		if ( rst == 1'b1 ) 
		begin
			regs[ 0] <= `YSYX210247_ZERO_WORD;
			regs[ 1] <= `YSYX210247_ZERO_WORD;
			regs[ 2] <= `YSYX210247_ZERO_WORD;
			regs[ 3] <= `YSYX210247_ZERO_WORD;
			regs[ 4] <= `YSYX210247_ZERO_WORD;
			regs[ 5] <= `YSYX210247_ZERO_WORD;
			regs[ 6] <= `YSYX210247_ZERO_WORD;
			regs[ 7] <= `YSYX210247_ZERO_WORD;
			regs[ 8] <= `YSYX210247_ZERO_WORD;
			regs[ 9] <= `YSYX210247_ZERO_WORD;
			regs[10] <= `YSYX210247_ZERO_WORD;
			regs[11] <= `YSYX210247_ZERO_WORD;
			regs[12] <= `YSYX210247_ZERO_WORD;
			regs[13] <= `YSYX210247_ZERO_WORD;
			regs[14] <= `YSYX210247_ZERO_WORD;
			regs[15] <= `YSYX210247_ZERO_WORD;
			regs[16] <= `YSYX210247_ZERO_WORD;
			regs[17] <= `YSYX210247_ZERO_WORD;
			regs[18] <= `YSYX210247_ZERO_WORD;
			regs[19] <= `YSYX210247_ZERO_WORD;
			regs[20] <= `YSYX210247_ZERO_WORD;
			regs[21] <= `YSYX210247_ZERO_WORD;
			regs[22] <= `YSYX210247_ZERO_WORD;
			regs[23] <= `YSYX210247_ZERO_WORD;
			regs[24] <= `YSYX210247_ZERO_WORD;
			regs[25] <= `YSYX210247_ZERO_WORD;
			regs[26] <= `YSYX210247_ZERO_WORD;
			regs[27] <= `YSYX210247_ZERO_WORD;
			regs[28] <= `YSYX210247_ZERO_WORD;
			regs[29] <= `YSYX210247_ZERO_WORD;
			regs[30] <= `YSYX210247_ZERO_WORD;
			regs[31] <= `YSYX210247_ZERO_WORD;
		end
		else 
		begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	
				regs[w_addr] <= w_data;
		end
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data1 = `YSYX210247_ZERO_WORD;
		else if (r_ena1 == 1'b1)
			r_data1 = regs[r_addr1];
		else
			r_data1 = `YSYX210247_ZERO_WORD;
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data2 = `YSYX210247_ZERO_WORD;
		else if (r_ena2 == 1'b1)
			r_data2 = regs[r_addr2];
		else
			r_data2 = `YSYX210247_ZERO_WORD;
	end

endmodule


//--zhuyuhan 20210247--

module ysyx_210247_reg_id_exe(    
    input                         clk,  
    input                         rst,
    input                         flush,

    input                         id_valid_out,
    input  [`YSYX210247_ID_TO_EXE_BUS-1:0]   id_to_exe_bus_o,

    output                        exe_valid_in,     
    output [`YSYX210247_ID_TO_EXE_BUS-1:0]   id_to_exe_bus_i,

    output                        id_allow_out,
    input                         exe_allow_in
); 

reg                         id_to_exe_valid;    //valid of Pipeline register
reg [`YSYX210247_ID_TO_EXE_BUS-1:0]    id_to_exe_data;     //Pipeline register


assign exe_valid_in                 = id_to_exe_valid;
assign id_to_exe_bus_i              = id_to_exe_data;
assign id_allow_out                 = exe_allow_in;
 
always @ (posedge clk) begin
    if (rst || flush) begin
        id_to_exe_valid <= 1'b0;
    end
    else if (exe_allow_in) begin
        id_to_exe_valid <= id_valid_out;
    end
end

always @ (posedge clk) begin
    if (rst || flush) begin
        id_to_exe_data <= {`YSYX210247_ID_TO_EXE_BUS{1'b0}}; 
    end
    else if (exe_allow_in && id_valid_out) begin
        id_to_exe_data <= id_to_exe_bus_o;
    end
end
endmodule

//--zhuyuhan 20210247--

module ysyx_210247_reg_if_id(    
    input                         clk,  
    input                         rst,
    input                         flush,

    input                         if_valid_out,
    input  [`YSYX210247_IF_TO_ID_BUS-1:0]    if_to_id_bus_o,

    output                        id_valid_in,     
    output [`YSYX210247_IF_TO_ID_BUS-1:0]    if_to_id_bus_i,

    output                        if_allow_out,
    input                         id_allow_in
); 

reg                         if_to_id_valid;    //valid of Pipeline register
reg [`YSYX210247_IF_TO_ID_BUS-1:0]    if_to_id_data;     //Pipeline register


assign id_valid_in              = if_to_id_valid;
assign if_to_id_bus_i           = if_to_id_data;
assign if_allow_out             = id_allow_in;
 
always @ (posedge clk) begin
    if (rst || flush) begin
        if_to_id_valid <= 1'b0;
    end
    else if (id_allow_in) begin
        if_to_id_valid <= if_valid_out;
    end
end

always @ (posedge clk) begin
    if (rst || flush) begin
        if_to_id_data <= {`YSYX210247_IF_TO_ID_BUS{1'b0}}; 
    end
    else if (id_allow_in && if_valid_out) begin
        if_to_id_data <= if_to_id_bus_o;
    end
end
endmodule

//--zhuyuhan 20210247--

module ysyx_210247_reg_mem_wb(    
    input                         clk,  
    input                         rst,
    input                         flush,

    input                         mem_valid_out,
    input  [`YSYX210247_MEM_TO_WB_BUS-1:0]   mem_to_wb_bus_o,

    output                        wb_valid_in,     
    output [`YSYX210247_MEM_TO_WB_BUS-1:0]   mem_to_wb_bus_i,

    output                        mem_allow_out,
    input                         wb_allow_in
); 

reg                         mem_to_wb_valid;    //valid of Pipeline register
reg [`YSYX210247_MEM_TO_WB_BUS-1:0]    mem_to_wb_data;     //Pipeline register


assign wb_valid_in              = mem_to_wb_valid;
assign mem_to_wb_bus_i          = mem_to_wb_data;
assign mem_allow_out            = wb_allow_in;
 
always @ (posedge clk) begin
    if (rst || flush) begin
        mem_to_wb_valid <= 1'b0;
    end
    else if (wb_allow_in) begin
        mem_to_wb_valid <= mem_valid_out;
    end
end

always @ (posedge clk) begin
    if (rst || flush) begin
        mem_to_wb_data <= {`YSYX210247_MEM_TO_WB_BUS{1'b0}}; 
    end
    else if (wb_allow_in && mem_valid_out) begin
        mem_to_wb_data <= mem_to_wb_bus_o;
    end
end
endmodule


//--zhuyuhan 20210247--

module ysyx_210247_wb_stage(    
    input  wire wb_valid_in,
    output wire wb_allow_in,

    input wire [`YSYX210247_MEM_TO_WB_BUS-1 :0] mem_to_wb_bus_i,

    output wire            wb_wen,
    output wire [`YSYX210247_DST_BUS] wb_wdest,
    output wire [`YSYX210247_REG_BUS] wb_wdata,

    output wire            flush,

    output wire [`YSYX210247_DST_BUS] WB_wdest,
    output wire [`YSYX210247_REG_BUS] WB_result,

    output wire            csr_wen,            
    output wire [11  :  0] csr_waddr,        
    output wire [`YSYX210247_REG_BUS] csr_wdata, 
    output wire [`YSYX210247_REG_BUS] exc_type,
    output wire [`YSYX210247_REG_BUS] exc_addr,
    output wire [31  :  0] exc_op
);
wire [`YSYX210247_REG_BUS] wb_pc;
wire [31  :  0] wb_inst; 
wire wen;
wire wb_valid;
wire wb_ready_go; 

assign wb_valid     = wb_valid_in;
assign wb_ready_go  = wb_valid; 
assign wb_allow_in  = !wb_valid || wb_ready_go;
assign flush        = ( |exc_op );
assign wb_wen       = wen & !exc_type[63];

assign {
        exc_type,  
        exc_addr,
        exc_op,   
        csr_wen,   
        csr_waddr,   
        csr_wdata, 
        wb_pc,
        wb_inst,
        wen,
        wb_wdest,
        wb_wdata
        } = mem_to_wb_bus_i; 

assign WB_wdest  = wb_wdest & {5{wb_valid}};
assign WB_result = wb_wdata;

wire _unused_ok = &{1'b0,
                    wb_pc,
                    wb_inst,  // To be fixed
                    1'b0};

endmodule
