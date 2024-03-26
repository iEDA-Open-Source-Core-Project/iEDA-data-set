
`timescale 1ns / 1ps

`define YSYX210456_ZERO_WORD  64'h00000000_00000000
`define YSYX210456_PC_START   64'h00000000_30000000  
//`define PC_START_RESET = (`PC_START - 4)
`define YSYX210456_REG_BUS    63 : 0     
`define YSYX210456_INST_ADD   8'h11

`define YSYX210456_AXI_ADDR_WIDTH      32
`define YSYX210456_AXI_DATA_WIDTH      64
`define YSYX210456_AXI_ID_WIDTH        4
`define YSYX210456_AXI_USER_WIDTH      1

//ALU_operation
`define YSYX210456_ALU_ADD   8'h11
`define YSYX210456_ALU_SUB   8'h12
`define YSYX210456_ALU_XOR   8'h21
`define YSYX210456_ALU_OR    8'h22
`define YSYX210456_ALU_AND   8'h23
`define YSYX210456_ALU_SLT   8'h31
`define YSYX210456_ALU_SLTU  8'h32
`define YSYX210456_ALU_SLL   8'h41
`define YSYX210456_ALU_SRL   8'h42
`define YSYX210456_ALU_SRA   8'h43

//branch_type
`define YSYX210456_B_EQ    3'b001
`define YSYX210456_B_NE    3'b010
`define YSYX210456_B_LT    3'b011
`define YSYX210456_B_GE    3'b100
`define YSYX210456_B_LTU   3'b101
`define YSYX210456_B_GEU   3'b110

`define YSYX210456_SIZE_B              2'b00
`define YSYX210456_SIZE_H              2'b01
`define YSYX210456_SIZE_W              2'b10
`define YSYX210456_SIZE_D              2'b11

`define YSYX210456_REQ_READ            1'b0
`define YSYX210456_REQ_WRITE           1'b1

`define YSYX210456_RISCV_PRIV_MODE_U   0
`define YSYX210456_RISCV_PRIV_MODE_S   1
`define YSYX210456_RISCV_PRIV_MODE_M   3

//`include "defines.v"
`define YSYX210456_AXI_TOP_INTERFACE(name) io_master_``name

module ysyx_210456(
    input                               clock,
    input                               reset,
    input                               io_interrupt,
    
    input         io_master_awready,
    output        io_master_awvalid,
    output [31:0] io_master_awaddr,
    output [3:0]  io_master_awid,
    output [7:0]  io_master_awlen,
    output [2:0]  io_master_awsize,
    output [1:0]  io_master_awburst,
    input         io_master_wready,
    output        io_master_wvalid,
    output [63:0] io_master_wdata,
    output [7:0]  io_master_wstrb,
    output        io_master_wlast,
    output        io_master_bready,
    input         io_master_bvalid,
    input  [1:0]  io_master_bresp,
    input  [3:0]  io_master_bid,
    input         io_master_arready,
    output        io_master_arvalid,
    output [31:0] io_master_araddr,
    output [3:0]  io_master_arid,
    output [7:0]  io_master_arlen,
    output [2:0]  io_master_arsize,
    output [1:0]  io_master_arburst,
    output        io_master_rready,
    input         io_master_rvalid,
    input  [1:0]  io_master_rresp,
    input  [63:0] io_master_rdata,
    input         io_master_rlast,
    input  [3:0]  io_master_rid,

    output        io_slave_awready,
    input         io_slave_awvalid,
    input  [31:0] io_slave_awaddr,
    input  [3:0]  io_slave_awid,
    input  [7:0]  io_slave_awlen,
    input  [2:0]  io_slave_awsize,
    input  [1:0]  io_slave_awburst,
    output        io_slave_wready,
    input         io_slave_wvalid,
    input  [63:0] io_slave_wdata,
    input  [7:0]  io_slave_wstrb,
    input         io_slave_wlast,
    input         io_slave_bready,
    output        io_slave_bvalid,
    output [1:0]  io_slave_bresp,
    output [3:0]  io_slave_bid,
    output        io_slave_arready,
    input         io_slave_arvalid,
    input  [31:0] io_slave_araddr,
    input  [3:0]  io_slave_arid,
    input  [7:0]  io_slave_arlen,
    input  [2:0]  io_slave_arsize,
    input  [1:0]  io_slave_arburst,
    input         io_slave_rready,
    output        io_slave_rvalid,
    output [1:0]  io_slave_rresp,
    output [63:0] io_slave_rdata,
    output        io_slave_rlast,
    output [3:0]  io_slave_rid

    //input  [63:0]                       io_logCtrl_log_begin,
    //input  [63:0]                       io_logCtrl_log_end,
    //input  [63:0]                       io_logCtrl_log_level,
    //input                               io_perfInfo_clean,
    //input                               io_perfInfo_dump,

    //output                              io_uart_out_valid,
    //output [7:0]                        io_uart_out_ch,
    //output                              io_uart_in_valid,
    //input  [7:0]                        io_uart_in_ch,
    /*
    
    input                               io_master_awready,
    output                              io_master_awvalid,
    output [`AXI_ADDR_WIDTH-1:0]        io_master_awaddr,
    //output [2:0]                        `AXI_TOP_INTERFACE(aw_bits_prot),
    output [`AXI_ID_WIDTH-1:0]          io_master_awid,
    //output [`AXI_USER_WIDTH-1:0]        `AXI_TOP_INTERFACE(aw_bits_user),
    output [7:0]                        io_master_awlen,
    output [2:0]                        io_master_awsize,
    output [1:0]                        io_master_awburst,
    //output                              `AXI_TOP_INTERFACE(aw_bits_lock),
    //output [3:0]                        `AXI_TOP_INTERFACE(aw_bits_cache),
    //output [3:0]                        `AXI_TOP_INTERFACE(aw_bits_qos),
    
    input                               io_master_wready,
    output                              io_master_wvalid,
    output [`AXI_DATA_WIDTH-1:0]        io_master_wdata,
    output [`AXI_DATA_WIDTH/8-1:0]      io_master_wstrb,
    output                              io_master_wlast,
    //output [`AXI_USER_WIDTH-1:0]        `AXI_TOP_INTERFACE(w_bits_user),
    
    output                              io_master_bready,
    input                               io_master_bvalid,
    input  [1:0]                        io_master_bresp,
    input  [`AXI_ID_WIDTH-1:0]          io_master_bid,
    //input  [`AXI_USER_WIDTH-1:0]        `AXI_TOP_INTERFACE(b_bits_user),

    input                               io_master_arready,
    output                              io_master_arvalid,
    output [`AXI_ADDR_WIDTH-1:0]        io_master_araddr,
    //output [2:0]                        `AXI_TOP_INTERFACE(ar_bits_prot),
    output [`AXI_ID_WIDTH-1:0]          io_master_arid,
    //output [`AXI_USER_WIDTH-1:0]        `AXI_TOP_INTERFACE(ar_bits_user),
    output [7:0]                        io_master_arlen,
    output [2:0]                        io_master_arsize,
    output [1:0]                        io_master_arburst,
    //output                              `AXI_TOP_INTERFACE(ar_bits_lock),
    //output [3:0]                        `AXI_TOP_INTERFACE(ar_bits_cache),
    //output [3:0]                        `AXI_TOP_INTERFACE(ar_bits_qos),
    
    output                              io_master_rready,
    input                               io_master_rvalid,
    input  [1:0]                        io_master_rresp,
    input  [`AXI_DATA_WIDTH-1:0]        io_master_rdata,
    input                               io_master_rlast,
    input  [`AXI_ID_WIDTH-1:0]          io_master_rid,
    //input  [`AXI_USER_WIDTH-1:0]        `AXI_TOP_INTERFACE(r_bits_user)

    */

);

    assign io_slave_awready = 0;
    assign io_slave_wready = 0;
    assign io_slave_bvalid = 0;
    assign io_slave_bresp = 0;
    assign io_slave_bid = 0;
    assign io_slave_arready = 0;
    assign io_slave_rvalid = 0;
    assign io_slave_rresp = 0;
    assign io_slave_rdata = 0;
    assign io_slave_rlast = 0;
    assign io_slave_rid = 0;



    ////////////////AXIRW/IO SIGNALS////////////////
    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210456_AXI_ADDR_WIDTH-1:0] aw_addr;
    //wire [2:0] aw_prot;
    wire [`YSYX210456_AXI_ID_WIDTH-1:0] aw_id;
    //wire [`AXI_USER_WIDTH-1:0] aw_user;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;
    //wire aw_lock;
    //wire [3:0] aw_cache;
    //wire [3:0] aw_qos;
    //wire [3:0] aw_region;

    wire w_ready;
    wire w_valid;
    wire [`YSYX210456_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210456_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
    //wire [`AXI_USER_WIDTH-1:0] w_user;
    
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;
    wire [`YSYX210456_AXI_ID_WIDTH-1:0] b_id;
    //wire [`AXI_USER_WIDTH-1:0] b_user;

    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210456_AXI_ADDR_WIDTH-1:0] ar_addr;
    //wire [2:0] ar_prot;
    wire [`YSYX210456_AXI_ID_WIDTH-1:0] ar_id;
    //wire [`AXI_USER_WIDTH-1:0] ar_user;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    //wire ar_lock;
    //wire [3:0] ar_cache;
    //wire [3:0] ar_qos;
    //wire [3:0] ar_region;
    
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210456_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210456_AXI_ID_WIDTH-1:0] r_id;
    //wire [`AXI_USER_WIDTH-1:0] r_user;


    ////////////////AXIRW/CROSSBAR/CPU INTERCONNECTION SIGNALS////////////////
    wire crossbar_valid;
    wire crossbar_req;  
    wire [63:0] crossbar_data_write;
    wire [63:0] crossbar_addr;
    wire [1:0] crossbar_size;

    wire axi_rw_ready;
    wire [63:0] axi_rw_data_read;
    wire [1:0] axi_rw_resp;

    wire axi_done;

    wire if_valid;
    wire [63:0] if_addr;
    wire [1:0] if_size;
    wire [31:0] if_data_read;
    wire [1:0] if_resp;

    wire mem_valid;
    wire [63:0] mem_addr;
    wire [1:0] mem_size;
    wire mem_load_en;
    wire mem_save_en;
    wire [63:0]mem_data_write;
    wire [63:0]mem_data_read;
    wire [1:0]mem_resp;

    //wire putch_en;
    //wire [7:0]a0;

    ////////////////AXIRW/IO LOGIC////////////////
    assign aw_ready = io_master_awready;
    assign io_master_awvalid = aw_valid;
    assign io_master_awaddr = aw_addr;
    //assign `AXI_TOP_INTERFACE(aw_bits_prot) = aw_prot;
    assign io_master_awid = aw_id;
    //assign `AXI_TOP_INTERFACE(aw_bits_user) = aw_user;
    assign io_master_awlen = aw_len;
    assign io_master_awsize = aw_size;
    assign io_master_awburst = aw_burst;
    //assign `AXI_TOP_INTERFACE(aw_bits_lock) = aw_lock;
    //assign `AXI_TOP_INTERFACE(aw_bits_cache) = aw_cache;
    //assign `AXI_TOP_INTERFACE(aw_bits_qos) = aw_qos;
    
    assign w_ready = io_master_wready;
    assign io_master_wvalid = w_valid;
    assign io_master_wdata = w_data;
    assign io_master_wstrb = w_strb;
    assign io_master_wlast = w_last;
    //assign `AXI_TOP_INTERFACE(w_bits_user) = w_user;
    
    assign io_master_bready = b_ready;
    assign b_valid = io_master_bvalid;
    assign b_resp = io_master_bresp;
    assign b_id = io_master_bid;
    //assign b_user = `AXI_TOP_INTERFACE(b_bits_user);

    assign ar_ready                                 = io_master_arready;
    assign io_master_arvalid             = ar_valid;
    assign io_master_araddr        = ar_addr;
    //assign `AXI_TOP_INTERFACE(ar_bits_prot)         = ar_prot;
    assign io_master_arid           = ar_id;
    //assign `AXI_TOP_INTERFACE(ar_bits_user)         = ar_user;
    assign io_master_arlen          = ar_len;
    assign io_master_arsize         = ar_size;
    assign io_master_arburst        = ar_burst;
    //assign `AXI_TOP_INTERFACE(ar_bits_lock)         = ar_lock;
    //assign `AXI_TOP_INTERFACE(ar_bits_cache)        = ar_cache;
    //assign `AXI_TOP_INTERFACE(ar_bits_qos)          = ar_qos;
    
    assign io_master_rready             = r_ready;
    assign r_valid                                  = io_master_rvalid;
    assign r_resp                                   = io_master_rresp;
    assign r_data                                   = io_master_rdata;
    assign r_last                                   = io_master_rlast;
    assign r_id                                     = io_master_rid;
    //assign r_user                                   = `AXI_TOP_INTERFACE(r_bits_user);



    ysyx_210456_axi_rw u_axi_rw (
        .clock                          (clock),
        .reset                          (reset),

        .rw_valid_i                     (crossbar_valid),
        .rw_req_i                       (crossbar_req),
        .data_write_i                   (crossbar_data_write),
        .rw_addr_i                      (crossbar_addr),
        .rw_size_i                      (crossbar_size),

        .rw_ready_o                     (axi_rw_ready),
        .data_read_o                    (axi_rw_data_read),
        .rw_resp_o                      (axi_rw_resp),

        .axi_aw_ready_i                 (aw_ready),
        .axi_aw_valid_o                 (aw_valid),
        .axi_aw_addr_o                  (aw_addr),
        //.axi_aw_prot_o                  (aw_prot),
        .axi_aw_id_o                    (aw_id),
        //.axi_aw_user_o                  (aw_user),
        .axi_aw_len_o                   (aw_len),
        .axi_aw_size_o                  (aw_size),
        .axi_aw_burst_o                 (aw_burst),
        //.axi_aw_lock_o                  (aw_lock),
        //.axi_aw_cache_o                 (aw_cache),
        //.axi_aw_qos_o                   (aw_qos),
        //.axi_aw_region_o                (aw_region),

        .axi_w_ready_i                  (w_ready),
        .axi_w_valid_o                  (w_valid),
        .axi_w_data_o                   (w_data),
        .axi_w_strb_o                   (w_strb),
        .axi_w_last_o                   (w_last),
        //.axi_w_user_o                   (w_user),
        
        .axi_b_ready_o                  (b_ready),
        .axi_b_valid_i                  (b_valid),
        .axi_b_resp_i                   (b_resp),
        .axi_b_id_i                     (b_id),
        //.axi_b_user_i                   (b_user),

        .axi_ar_ready_i                 (ar_ready),
        .axi_ar_valid_o                 (ar_valid),
        .axi_ar_addr_o                  (ar_addr),
        //.axi_ar_prot_o                  (ar_prot),
        .axi_ar_id_o                    (ar_id),
        //.axi_ar_user_o                  (ar_user),
        .axi_ar_len_o                   (ar_len),
        .axi_ar_size_o                  (ar_size),
        .axi_ar_burst_o                 (ar_burst),
        //.axi_ar_lock_o                  (ar_lock),
        //.axi_ar_cache_o                 (ar_cache),
        //.axi_ar_qos_o                   (ar_qos),
        //.axi_ar_region_o                (ar_region),
        
        .axi_r_ready_o                  (r_ready),
        .axi_r_valid_i                  (r_valid),
        .axi_r_resp_i                   (r_resp),
        .axi_r_data_i                   (r_data),
        .axi_r_last_i                   (r_last),
        .axi_r_id_i                     (r_id)
        //.axi_r_user_i                   (r_user)
    );

    ysyx_210456_crossbar crossbar(
        .clock (clock),
        .reset (reset),

        //to pipeline
        .axi_done                     (axi_done),

        //from if stage
        .if_valid_i                       (if_valid),
        .if_addr_i                        (if_addr),
        .if_size_i                        (if_size),
        //to if stage
        //.if_ready_o                       (if_ready),
        .if_data_read_o                   (if_data_read),
        .if_resp_o                        (if_resp),
        //from mem stage
        .mem_valid_i                       (mem_valid),
        .mem_addr_i                        (mem_addr),
        .mem_size_i                        (mem_size),
        .mem_load_en_i                      (mem_load_en),
        .mem_save_en_i                      (mem_save_en),
        .mem_data_write_i                  (mem_data_write),
        //to mem stage
        //.mem_ready_o                       (mem_ready),
        .mem_data_read_o                   (mem_data_read),
        .mem_resp_o                        (mem_resp),

        //to axi_rw
        .rw_valid_o                     (crossbar_valid),
        .rw_req_o                       (crossbar_req),
        .data_write_o                   (crossbar_data_write),
        .rw_addr_o                      (crossbar_addr),
        .rw_size_o                      (crossbar_size),
        
        //from axi_rw
        .rw_ready_i                     (axi_rw_ready),
        .data_read_i                    (axi_rw_data_read),
        .rw_resp_i                      (axi_rw_resp)

    );

    ysyx_210456_cpu u_cpu(
        .clock                          (clock),
        .reset                          (reset),
        .axi_done                      (axi_done),

        //from if
        .if_valid                       (if_valid),
        .if_addr                        (if_addr),
        .if_size                        (if_size),
        //to if
        //.if_ready                       (if_ready),   // move handshake to crossbar
        .if_data_read                   (if_data_read),
        .if_resp                        (if_resp),

        //from mem stage
        .mem_valid                       (mem_valid),
        .mem_addr                        (mem_addr),
        .mem_size                        (mem_size),
        .mem_load_en                     (mem_load_en),
        .mem_save_en                     (mem_save_en),
        .mem_data                        (mem_data_write),
        //to mem stage
        //.mem_ready                       (if_ready),
        .mem_data_read                   (mem_data_read),
        .mem_resp                        (mem_resp)

        //.putch_en  (),
        //.chara  ()
        //.putch_en  (io_uart_out_valid),
        //.chara  (io_uart_out_ch)

    );

endmodule


//`include "defines.v"

// Burst types
`define YSYX210456_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210456_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210456_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210456_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210456_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210456_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210456_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210456_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210456_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210456_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210456_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210456_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210456_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210456_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210456_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210456_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210456_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210456_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210456_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210456_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210456_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210456_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210456_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210456_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210456_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210456_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210456_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210456_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210456_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210456_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210456_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210456_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210456_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210456_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210456_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210456_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210456_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210456_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210456_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210456_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210456_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_210456_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    //parameter RW_ADDR_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4
    //parameter AXI_USER_WIDTH    = 1
)(
    input                               clock,
    input                               reset,

	input                               rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH-1:0]        data_read_o,   // add minus 1 to these three port
    input  [RW_DATA_WIDTH-1:0]            data_write_i,
    input  [AXI_DATA_WIDTH-1:0]           rw_addr_i,
    input  [1:0]                        rw_size_i,
    output [1:0]                        rw_resp_o,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,    //write address cpu -> axi
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    //output [2:0]                        axi_aw_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    //output [AXI_USER_WIDTH-1:0]         axi_aw_user_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    //output                              axi_aw_lock_o,
    //output [3:0]                        axi_aw_cache_o,
    //output [3:0]                        axi_aw_qos_o,
    //output [3:0]                        axi_aw_region_o,

    input                               axi_w_ready_i,     //write data cpu -> axi
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,       //7:0
    output                              axi_w_last_o,       //can be fixed to 1
    //output [AXI_USER_WIDTH-1:0]         axi_w_user_o,
    
    output                              axi_b_ready_o,    //write response  cpu <- axi
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
    //input  [AXI_USER_WIDTH-1:0]         axi_b_user_i,

    input                               axi_ar_ready_i,   //read address  cpu -> axi
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    //output [2:0]                        axi_ar_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    //output [AXI_USER_WIDTH-1:0]         axi_ar_user_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    //output                              axi_ar_lock_o,
    //output [3:0]                        axi_ar_cache_o,
    //output [3:0]                        axi_ar_qos_o,
    //output [3:0]                        axi_ar_region_o,
    
    output                              axi_r_ready_o,    //read data  cpu <- axi
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i
    //input  [AXI_USER_WIDTH-1:0]         axi_r_user_i
);

    //wire access_flash;
    //assign access_flash = (rw_addr_i[63:28] == 36'h000000003);

    wire w_trans    = rw_req_i == `YSYX210456_REQ_WRITE;     //write or read
    wire r_trans    = rw_req_i == `YSYX210456_REQ_READ;
    wire w_valid    = rw_valid_i & w_trans;
    wire r_valid    = rw_valid_i & r_trans;

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = w_trans ? b_hs : r_done;   //if read data, reading the last data means the transmission is done, otherwise, if write data, receicing the b response means the transmission is done

    
    // ------------------State Machine------------------
    localparam [1:0] W_STATE_IDLE_P = 2'b00, W_STATE_ADDR_P = 2'b01, W_STATE_WRITE_P = 2'b10, W_STATE_RESP_P = 2'b11;
    localparam [1:0] R_STATE_IDLE_P = 2'b00, R_STATE_ADDR_P = 2'b01, R_STATE_READ_P  = 2'b10;

    reg [1:0] w_state, r_state;
    wire w_state_idle = w_state == W_STATE_IDLE_P, w_state_addr = w_state == W_STATE_ADDR_P, w_state_write = w_state == W_STATE_WRITE_P, w_state_resp = w_state == W_STATE_RESP_P;
    wire r_state_idle = r_state == R_STATE_IDLE_P, r_state_addr = r_state == R_STATE_ADDR_P, r_state_read  = r_state == R_STATE_READ_P;


    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE_P;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE_P:  if ((rw_valid_i) && (~rw_ready_o))    w_state <= W_STATE_ADDR_P;  //idle
                    W_STATE_ADDR_P:  if (aw_hs)   w_state <= W_STATE_WRITE_P; //at this state, aw valid is 1
                    W_STATE_WRITE_P: if (w_done)  w_state <= W_STATE_RESP_P;  //at this state, w valid is 1
                    W_STATE_RESP_P:  if (b_hs)    w_state <= W_STATE_IDLE_P;  //at this state, b ready is 1
                endcase
            end
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE_P;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE_P: if ((rw_valid_i) && (~rw_ready_o))  r_state <= R_STATE_ADDR_P;   //idle. if r_valid, turn to addr state
                    R_STATE_ADDR_P: if (ar_hs)    r_state <= R_STATE_READ_P;   //if address valid from cpu & axi ready to receive address, means asuccessful address transmition, turn to read state
                    R_STATE_READ_P: if (r_done)   r_state <= R_STATE_IDLE_P;   //if read data is handshaking, and the last date is read, i.e. r_done, turn to idle state
                    default:;
                endcase
            end
        end
    end



    // ------------------Process Data------------------
    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);  //3
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);     //6
    //parameter AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);  //3
    localparam MASK_WIDTH    = AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / AXI_DATA_WIDTH; //1
    localparam BLOCK_TRANS   = TRANS_LEN > 1 ? 1'b1 : 1'b0;

    wire aligned            = BLOCK_TRANS | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210456_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210456_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210456_SIZE_W;     //the size from cpu
    wire size_d             = rw_size_i == `YSYX210456_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};    //the lowest 3 bits of address, pad a additional zero
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    //wire [2:0] axi_size     = AXI_SIZE[2:0];
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
    
    //wire [AXI_ADDR_WIDTH-1:0] axi_addr          = {rw_addr_i[AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}};
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    //wire [OFFSET_WIDTH:0] aligned_offset_h_7    = 6'd63 - aligned_offset_l + 1;//AXI_DATA_WIDTH - aligned_offset_l;
    wire [OFFSET_WIDTH:0] aligned_offset_h_7    = 7'd64 - aligned_offset_l;//AXI_DATA_WIDTH - aligned_offset_l;
    wire [OFFSET_WIDTH-1:0] aligned_offset_h    =  aligned_offset_h_7[OFFSET_WIDTH-1:0];

    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                    ) << aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] mask_l            = mask[AXI_DATA_WIDTH-1:0];
    wire [AXI_DATA_WIDTH-1:0] mask_h            = mask[MASK_WIDTH-1:AXI_DATA_WIDTH];

    wire [AXI_ID_WIDTH-1:0] axi_id              = {AXI_ID_WIDTH{1'b0}};
    //wire [AXI_USER_WIDTH-1:0] axi_user          = {AXI_USER_WIDTH{1'b0}};

    reg rw_ready;
    wire rw_ready_nxt = trans_done;
    wire rw_ready_en      = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
        end
    end
    assign rw_ready_o     = rw_ready;

    reg [1:0] rw_resp;
    wire [1:0]rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i;
    wire resp_en = trans_done;
    always @(posedge clock) begin
        if (reset) begin
            rw_resp <= 0;
        end
        else if (resp_en) begin
            rw_resp <= rw_resp_nxt;
        end
    end
    assign rw_resp_o      = rw_resp;


    // ------------------Write Transaction------------------
    /*
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [2:0]                        axi_aw_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [AXI_USER_WIDTH-1:0]         axi_aw_user_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    output                              axi_aw_lock_o,
    output [3:0]                        axi_aw_cache_o,
    output [3:0]                        axi_aw_qos_o,
    output [3:0]                        axi_aw_region_o,
    */
    assign axi_aw_valid_o = w_state_addr;
    assign axi_aw_addr_o = rw_addr_i[31:0];//axi_addr;   //the lowest 3 bits are set to zero. is this corresct?
    //assign axi_aw_prot_o = `AXI_PROT_UNPRIVILEGED_ACCESS | `AXI_PROT_SECURE_ACCESS | `AXI_PROT_DATA_ACCESS;
    assign axi_aw_id_o = axi_id;
    //assign axi_aw_user_o = axi_user;
    assign axi_aw_len_o = axi_len;   //is this corresct?
    assign axi_aw_size_o = {1'b0,rw_size_i};//axi_size;
    assign axi_aw_burst_o = `YSYX210456_AXI_BURST_TYPE_INCR;
    //assign axi_aw_lock_o = 1'b0;
    //assign axi_aw_cache_o = `AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    //assign axi_aw_qos_o = 4'h0;
    /*
    input                               axi_w_ready_i,     //write data cpu -> axi
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,       //7:0
    output                              axi_w_last_o,       //can be fixed to 1
    output [AXI_USER_WIDTH-1:0]         axi_w_user_o,
    */
    assign axi_w_valid_o = w_state_write;
    assign axi_w_data_o = data_write_i << aligned_offset_l;
    assign axi_w_strb_o = {mask[56],mask[48],mask[40],mask[32],mask[24],mask[16],mask[8],mask[0]};
    assign axi_w_last_o = 1'b1;
    //assign axi_w_user_o = axi_user;

    assign axi_b_ready_o = w_state_resp;

    
    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = rw_addr_i[31:0];//axi_addr;
    //assign axi_ar_prot_o    = `AXI_PROT_UNPRIVILEGED_ACCESS | `AXI_PROT_SECURE_ACCESS | `AXI_PROT_DATA_ACCESS;
    assign axi_ar_id_o      = axi_id;
    //assign axi_ar_user_o    = axi_user;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = {1'b0,rw_size_i};//axi_size;
    assign axi_ar_burst_o   = `YSYX210456_AXI_BURST_TYPE_INCR;
    //assign axi_ar_lock_o    = 1'b0;
    //assign axi_ar_cache_o   = `AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    //assign axi_ar_qos_o     = 4'h0;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;

    always @(posedge clock) begin
        if (reset) begin
            data_read_o[0+:AXI_DATA_WIDTH] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~aligned & overstep) begin
                if (len[0]) begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= data_read_o[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (len == 0) begin
                data_read_o[0+:AXI_DATA_WIDTH] <= axi_r_data_l;
            end
        end
    end

    /*
    generate
        for (genvar i = 0; i < TRANS_LEN; i += 1) begin    //
            always @(posedge clock) begin
                if (reset) begin
                    data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= 0;
                end
                else if (axi_r_ready_o & axi_r_valid_i) begin
                    if (~aligned & overstep) begin
                        if (len[0]) begin
                            data_read_o[AXI_DATA_WIDTH-1:0] <= data_read_o[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                        end
                        else begin
                            data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                        end
                    end
                    else if (len == i) begin
                        data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= axi_r_data_l;
                    end
                end
            end
        end
    endgenerate
    */

endmodule
//`include "defines.v"
module ysyx_210456_crossbar # (
    parameter RW_DATA_WIDTH     = 64,
    //parameter RW_ADDR_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64
    //parameter AXI_ADDR_WIDTH    = 32,
    //parameter AXI_ID_WIDTH      = 4,
    //parameter AXI_USER_WIDTH    = 1
)(
    input clock,
    input reset,
    
    //from if stage
    input if_valid_i,
    input [AXI_DATA_WIDTH-1:0]if_addr_i,
    input [1:0]if_size_i,
    //to if stage
    //output if_ready_o,
    output reg [31:0]if_data_read_o,
    output reg [1:0]if_resp_o,

    //from mem stage
    input mem_valid_i,
    input [AXI_DATA_WIDTH-1:0]mem_addr_i,
    input [1:0]mem_size_i,
    input mem_load_en_i,
    input mem_save_en_i,
    input [RW_DATA_WIDTH-1:0]mem_data_write_i,

    //to mem stage
    //output mem_ready_o,
    output reg [RW_DATA_WIDTH-1:0]mem_data_read_o,
    output reg [1:0]mem_resp_o,

    //to axi_rw
    output reg rw_valid_o,
    output reg rw_req_o,
    output wire [RW_DATA_WIDTH-1:0]data_write_o,
    output reg [AXI_DATA_WIDTH-1:0]rw_addr_o,
    output reg [1:0]rw_size_o,
        
    //from axi_rw
    input rw_ready_i,
    input [RW_DATA_WIDTH-1:0]data_read_i,
    input [1:0]rw_resp_i,

    //to pipeline
    output reg axi_done
);

    reg [2:0]current_state;
    wire handshake;
    assign handshake = rw_valid_o && rw_ready_i;
    assign data_write_o = mem_data_write_i;

    //state machine
    localparam [2:0] IDLE_STATE = 3'b000, SINGLE_TASK_STATE = 3'b001, TASK_ONE_STATE = 3'b010, TASK_TWO_STATE = 3'b011, PIPELINE_STATE = 3'b100;

    always@( posedge clock) 
    begin
        if( reset == 1'b1 ) begin
            current_state <= IDLE_STATE;
            rw_valid_o <= 1'b0;
            rw_req_o <= 1'b0;
            rw_addr_o <= {RW_DATA_WIDTH{1'b0}};
            rw_size_o <= 2'b11;
            axi_done <= 1'b0;
            if_data_read_o<=0;
            if_resp_o<=0;
            mem_data_read_o<=0;
            mem_resp_o<=0;
        end
        else begin
            //DEFAULT:
            //rw_valid_o <= 1'b0;
            //rw_req_o <= 1'b0;
            //rw_addr_o <= {RW_DATA_WIDTH{1'b0}};
            //rw_size_o <= 2'b11;
            //axi_done <= 1'b0;

            case( current_state )
            IDLE_STATE: begin 

                if (((if_valid_i == 1'b1) && (mem_valid_i == 1'b0)) || ((if_valid_i == 1'b0) && (mem_valid_i == 1'b1))) begin
                    if (if_valid_i == 1'b1) begin   //task from if_stage
                        rw_valid_o <= if_valid_i;
                        rw_req_o <= 1'b0;
                        rw_addr_o <= if_addr_i;
                        rw_size_o <= if_size_i;
                    end
                    else if ((mem_valid_i == 1'b1)) begin //if the task is from mem_stage
                        rw_valid_o <= mem_valid_i;
                        rw_addr_o <= mem_addr_i;
                        rw_size_o <= mem_size_i;
                        if (mem_save_en_i) begin
                            rw_req_o <= 1'b1;
                        end
                        else if (mem_load_en_i) begin
                            rw_req_o <= 1'b0;
                        end
                 
                    end
                    current_state <= SINGLE_TASK_STATE;
                end
                else if ((if_valid_i == 1'b1) && (mem_valid_i == 1'b1)) begin
                    rw_valid_o <= if_valid_i;
                    rw_req_o <= 1'b0;
                    rw_addr_o <= if_addr_i;
                    rw_size_o <= if_size_i;
                    current_state <= TASK_ONE_STATE;
                end
            end

            SINGLE_TASK_STATE: begin
                if (if_valid_i == 1'b1) begin   //task from if_stage
                    if (handshake==1'b1) begin
                        axi_done <= 1'b1;
                        rw_valid_o <= 0;
                        if_data_read_o <= data_read_i[31:0];
                        if_resp_o <= rw_resp_i;
                        current_state <= PIPELINE_STATE;
                    end
                end
                else if ((mem_valid_i == 1'b1)) begin //if the task is from mem_stage
                    if (handshake==1'b1) begin
                        axi_done <= 1'b1;
                        rw_valid_o <= 0;
                        mem_data_read_o <= data_read_i;
                        mem_resp_o <= rw_resp_i;
                        current_state <= PIPELINE_STATE;
                    end                   
                end

            end
            
            TASK_ONE_STATE: begin
                if (handshake==1'b1) begin
                    if_data_read_o <= data_read_i[31:0];
                    if_resp_o <= rw_resp_i;
                    rw_valid_o <= mem_valid_i;
                    rw_addr_o <= mem_addr_i;
                    rw_size_o <= mem_size_i;
                    if (mem_save_en_i) begin
                        rw_req_o <= 1'b1;
                    end
                    else if (mem_load_en_i) begin
                        rw_req_o <= 1'b0;
                    end
                    current_state <= TASK_TWO_STATE;
                end               
            end

            TASK_TWO_STATE: begin
                if (handshake==1'b1) begin
                    axi_done <= 1'b1;
                    rw_valid_o <= 0;
                    mem_data_read_o <= data_read_i;
                    mem_resp_o <= rw_resp_i;
                    current_state <= PIPELINE_STATE;
                end                
            end

            PIPELINE_STATE: begin
                axi_done <= 1'b0;
                rw_valid_o <= 0;
                if_data_read_o <= 32'b0;
                mem_data_read_o <= `YSYX210456_ZERO_WORD;
                if_resp_o <= 2'b00;
                mem_resp_o <= 2'b00;
                current_state <= IDLE_STATE;
            end

            default: begin
                rw_valid_o <= 0;
                current_state <= IDLE_STATE;
            end
            endcase


        end
    end


endmodule
//--xuezhen--

//`include "defines.v"

module ysyx_210456_cpu(
    input                               clock,
    input                               reset,
    input                               axi_done,
    
    //if
    output                              if_valid,
    output [63:0]                       if_addr,
    output [1:0]                        if_size,

    //input                               if_ready,
    input  [31:0]                       if_data_read,
    input  [1:0]                        if_resp,

    //mem
    output reg mem_valid,
    output reg [63:0]  mem_addr,
    output reg [1:0] mem_size,
    output reg mem_load_en,
    output reg mem_save_en,
    output reg [63:0] mem_data,

    input [63:0] mem_data_read,
    input [1:0] mem_resp

    //putch
    //output putch_en,
    //output [7:0]chara

);


////////////////PC_RESET////////////////
//parameter PC_START_RESET = `PC_START - 4;
localparam PC_START_RESET = `YSYX210456_PC_START;

////////////////PIPELINE SIGNAL////////////////
//if_stage_out
wire [31:0] if_inst;
wire [`YSYX210456_REG_BUS] if_pc;
//wire [`REG_BUS] if_inst_addr;
//wire if_inst_ena;

//if_stage -> id_stage
reg [31:0] if_id_inst;
reg [`YSYX210456_REG_BUS] if_id_pc;

////////////////
// id_stage_out
wire id_rd_w_ena;
wire [4 : 0]id_rd_w_addr;
//wire [4 : 0]id_inst_type;
wire [7 : 0]id_alu_opcode;
wire id_alu_single_word;
wire [`YSYX210456_REG_BUS]id_op1;
wire [`YSYX210456_REG_BUS]id_op2;
wire id_l_mem;
wire id_s_mem;
wire [1:0]id_datasize;
wire id_unsigned_load;
wire [`YSYX210456_REG_BUS]id_rs1_data;
wire [`YSYX210456_REG_BUS]id_rs2_data;
wire [2:0]id_branch_type;
wire [1:0]id_jump_type;
//wire [31:0] id_inst;
wire [`YSYX210456_REG_BUS]id_pc;
wire [11:0]id_csr_addr;
wire id_csr_ena;
wire [`YSYX210456_REG_BUS]id_csr_op;
wire [1:0]id_csr_mode;
//wire id_putch_en;
//wire [7:0]id_a0;
wire id_ecall;
wire id_mret;
//wire id_time_intr;

// id_stage -> exe_stage
reg id_exe_rd_w_ena;
reg [4 : 0]id_exe_rd_w_addr;
//reg [4 : 0]id_exe_inst_type;
reg [7 : 0]id_exe_alu_opcode;
reg id_exe_alu_single_word;
reg [`YSYX210456_REG_BUS]id_exe_op1;
reg [`YSYX210456_REG_BUS]id_exe_op2;
reg id_exe_l_mem;
reg id_exe_s_mem;
reg [1:0]id_exe_datasize;
reg id_exe_unsigned_load;
reg [`YSYX210456_REG_BUS]id_exe_rs1_data;
reg [`YSYX210456_REG_BUS]id_exe_rs2_data;
reg [2:0]id_exe_branch_type;
reg [1:0]id_exe_jump_type;
//reg [31:0]id_exe_inst;
reg [`YSYX210456_REG_BUS]id_exe_pc;
reg [11:0]id_exe_csr_addr;
reg id_exe_csr_ena;
reg [`YSYX210456_REG_BUS]id_exe_csr_op;
reg [1:0]id_exe_csr_mode;
//reg id_exe_putch_en;
//reg [7:0]id_exe_a0;
reg id_exe_ecall;
reg id_exe_mret;
//reg id_exe_time_intr;

////inserted interruption to exe
reg id_exe_time_intr_firstdetect;

////////////////
////id<-->reg
// id_stage -> regfile
wire rs1_r_ena;
wire [4 : 0]rs1_r_addr;
wire rs2_r_ena;
wire [4 : 0]rs2_r_addr;
// regfile -> id_stage
wire [`YSYX210456_REG_BUS] r_data1;
wire [`YSYX210456_REG_BUS] r_data2;



////////////////
//exe_stage_out
wire exe_rd_w_ena;
wire [4 : 0]exe_rd_w_addr;
//wire [4 : 0]exe_inst_type;
wire exe_l_mem;
wire exe_s_mem;
wire [1:0]exe_datasize;
wire exe_unsigned_load;
wire [`YSYX210456_REG_BUS]exe_rs2_data;
wire [`YSYX210456_REG_BUS]exe_alu_result;
//wire [31:0] exe_inst;
wire [`YSYX210456_REG_BUS]exe_pc;
wire [11:0]exe_csr_addr;
wire exe_csr_ena;
wire [`YSYX210456_REG_BUS]exe_csr_op;
wire [1:0]exe_csr_mode;
//wire exe_putch_en;
//wire [7:0]exe_a0;
wire exe_ecall;
wire exe_mret;
//wire exe_time_intr;
wire exe_time_intr_firstdetect;
//wire [`REG_BUS]exe_next_pc;

//exe_stage -> mem_stage
reg exe_mem_rd_w_ena;
reg [4 : 0]exe_mem_rd_w_addr;
//reg [4 : 0]exe_mem_inst_type;
reg exe_mem_l_mem;
reg exe_mem_s_mem;
reg [1:0]exe_mem_datasize;
reg exe_mem_unsigned_load;
reg [`YSYX210456_REG_BUS]exe_mem_rs2_data;
reg [`YSYX210456_REG_BUS]exe_mem_alu_result;
//reg [31:0] exe_mem_inst;
reg [`YSYX210456_REG_BUS]exe_mem_pc;
reg [11:0]exe_mem_csr_addr;
reg exe_mem_csr_ena;
reg [`YSYX210456_REG_BUS]exe_mem_csr_op;
reg [1:0]exe_mem_csr_mode;
//reg exe_mem_putch_en;
//reg [7:0]exe_mem_a0;
reg exe_mem_ecall;
reg exe_mem_mret;
//reg exe_mem_time_intr;
reg exe_mem_time_intr_firstdetect;
//reg [`REG_BUS]exe_mem_next_pc;

////////////////
////mem_stage_out
wire [`YSYX210456_REG_BUS]mem_rd_w_data;
//wire [4 : 0]mem_inst_type;
wire mem_rd_w_ena;
wire [4 : 0]mem_rd_w_addr;
//wire [31:0]mem_inst;
wire [`YSYX210456_REG_BUS]mem_pc;
wire [11:0]mem_csr_addr;
wire mem_csr_ena;
wire [`YSYX210456_REG_BUS]mem_csr_op;
wire [1:0]mem_csr_mode;
//wire mem_putch_en;
//wire [7:0]mem_a0;
wire mem_ecall;
wire mem_mret;
//wire mem_time_intr;
wire mem_time_intr_firstdetect;
//wire [`REG_BUS]mem_next_pc;
//wire mem_mmio_valid;

////mem_stage -> wb_stage
reg [`YSYX210456_REG_BUS]mem_wb_rd_w_data;
//reg [4 : 0]mem_wb_inst_type;
reg mem_wb_rd_w_ena;
reg [4 : 0]mem_wb_rd_w_addr;
//reg [31:0]mem_wb_inst;
reg [`YSYX210456_REG_BUS]mem_wb_pc;
reg [11:0]mem_wb_csr_addr;
reg mem_wb_csr_ena;
reg [`YSYX210456_REG_BUS]mem_wb_csr_op;
reg [1:0]mem_wb_csr_mode;
//reg mem_wb_putch_en;
//reg [7:0]mem_wb_a0;
reg mem_wb_ecall;
reg mem_wb_mret;
//reg mem_wb_time_intr;
reg mem_wb_time_intr_firstdetect;
//reg [`REG_BUS]mem_wb_next_pc;
//reg mem_wb_mmio_valid;

////////////////
////wb_stage_out
wire wb_rd_w_ena;
wire [4 : 0]wb_rd_w_addr;
//wire [4 : 0]wb_inst_type;
wire [`YSYX210456_REG_BUS]wb_rd_w_data;
//wire [31:0]wb_inst;
wire [`YSYX210456_REG_BUS]wb_pc;
//wire [`REG_BUS]wb_next_pc;
//wire wb_mmio_valid;
wire wb_csr_r_ena;
wire [11:0]wb_csr_r_addr;
wire wb_csr_w_ena;
wire [11:0]wb_csr_w_addr;
wire [`YSYX210456_REG_BUS]wb_csr_w_data;
//wire [11:0]wb_csr_addr;

//csrs ==> wb
wire [`YSYX210456_REG_BUS]csrs_csr_r_data;

////////////////
//interruption signals
wire wb_ecall;
wire wb_mret;
//wire wb_time_intr;   //signal that indicate a interruption should be raised from id
wire wb_time_intr_firstdetect;   //signal that raise a interruption from wb to csrs
wire csrs_mstatus_mie;
wire csrs_mie_mtie;
wire clint_raise_interruption;
wire time_interruption_confirmation;
wire ecall_en;
wire mret_en;
wire ok_to_insert;

////////////////
//clint/MMIO crossbar signals
//from mem_stage
wire mem_valid_origin;
wire [63:0] mem_addr_origin;
wire [1:0] mem_size_origin;
wire mem_load_en_origin;
wire mem_save_en_origin;
wire [63:0]mem_data_origin;
reg [63:0]data_loaded_origin;
reg data_valid_origin;

//to clint
reg mem_valid_mmio;
reg [63:0] mem_addr_mmio;
reg [1:0] mem_size_mmio;
reg mem_load_en_mmio;
reg mem_save_en_mmio;
reg [63:0]mem_data_mmio;
wire [63:0]clint_data_read_mmio;
//reg clint_done_mmio;

//to axi
//...

////////////////
////stall/axi_stall/flush signals
reg stall;
wire axi_stall;
wire flush;


////////////////
////jump signals/IF stage pc destination
wire exe_jump;
wire jump_en;
assign jump_en = exe_jump;
wire [`YSYX210456_REG_BUS]exe_pc_dest;
wire [`YSYX210456_REG_BUS]mtvec_dest;
wire [`YSYX210456_REG_BUS]mepc_dest;
reg [`YSYX210456_REG_BUS]pc_dest;

////////////////difftest<-->reg////////////////
// regfile -> difftest
//wire [`REG_BUS] regs[0 : 31];

////////////////INTERRUPTION////////////////
assign ecall_en = (csrs_mstatus_mie == 1'b1)? wb_ecall : 0;
assign mret_en = wb_mret;
assign time_interruption_confirmation = csrs_mstatus_mie && csrs_mie_mtie && clint_raise_interruption;
assign ok_to_insert = ((time_interruption_confirmation == 1'b1) && (if_id_inst != 32'b0) && (if_id_pc != PC_START_RESET) && (id_ecall!=1'b1) && (id_mret!=1'b1) && (id_csr_ena!=1'b1)) ; //indicate that the current inst in id stage is ok to insert interruption


////////////////CLINT/MMIO////////////////
ysyx_210456_clint clint(
  .clk(clock),
	.rst(reset),
  //input 
  .mem_valid(mem_valid_mmio),
  .mem_addr(mem_addr_mmio),
  .mem_size(mem_size_mmio),
  .mem_load_en(mem_load_en_mmio),
  .mem_save_en(mem_save_en_mmio),
  .mem_data(mem_data_mmio),
  //output 
  .clint_data_read(clint_data_read_mmio),
  //.clint_done(clint_done_mmio),

  .clint_raise_interruption(clint_raise_interruption)
);

//clint-ram crossbar
//reg mmio_valid;
always @(*) begin
  if ((mem_valid_origin == 1'b1) && ((mem_addr_origin == 64'h200bff8)||(mem_addr_origin == 64'h2004000))) begin   //if MMIO
    mem_valid_mmio = mem_valid_origin;
    mem_addr_mmio = mem_addr_origin;
    mem_size_mmio = mem_size_origin;
    mem_load_en_mmio = mem_load_en_origin;
    mem_save_en_mmio = mem_save_en_origin;
    mem_data_mmio = mem_data_origin;

    data_loaded_origin = clint_data_read_mmio;
    data_valid_origin = 1'b1;

    mem_valid = 0;
    mem_addr = 0;
    mem_size = 0;
    mem_load_en = 0;
    mem_save_en = 0;
    mem_data = 0;

    //mmio_valid = 1'b1;
  end
  else begin                                                          //if AXI
    mem_valid = mem_valid_origin;
    mem_addr = mem_addr_origin;
    mem_size = mem_size_origin;
    mem_load_en = mem_load_en_origin;
    mem_save_en = mem_save_en_origin;
    mem_data = mem_data_origin;

    data_loaded_origin = mem_data_read;
    data_valid_origin = axi_done;

    mem_valid_mmio = 0;
    mem_addr_mmio = 0;
    mem_size_mmio = 0;
    mem_load_en_mmio = 0;
    mem_save_en_mmio = 0;
    mem_data_mmio = 0;
    
    //mmio_valid = 1'b0;
  end
end


////////////////putch////////////////
//wire [7:0]a0;
//wire [7:0]ch;
//assign ch = (putch_en == 1'b1)? a0 : 0;

////////////////axi_stall////////////////
assign axi_stall = ((mem_valid || if_valid) && (axi_done != 1'b1));   //stall when there are axi requests and the task is not done

////////////////stall////////////////
always @(*) begin
  if ((rs1_r_ena == 1'b1) && (rs1_r_addr == exe_rd_w_addr) && (exe_rd_w_ena == 1'b1)) begin  
    stall = 1'b1;
  end
  else if ((rs1_r_ena == 1'b1) && (rs1_r_addr == mem_rd_w_addr) && (mem_rd_w_ena == 1'b1)) begin
    stall = 1'b1;
  end
  else if ((rs2_r_ena == 1'b1) && (rs2_r_addr == exe_rd_w_addr) && (exe_rd_w_ena == 1'b1)) begin  
    stall = 1'b1;
  end
  else if ((rs2_r_ena == 1'b1) && (rs2_r_addr == mem_rd_w_addr) && (mem_rd_w_ena == 1'b1)) begin
    stall = 1'b1;
  end
  else if (((id_ecall == 1'b1)||(id_mret == 1'b1))&&((exe_csr_ena==1'b1)||(mem_csr_ena==1'b1)||(wb_csr_w_ena==1'b1)||(wb_csr_r_ena==1'b1)))begin  //decode a ecall or mret but there are csr inst not been finished
    stall = 1'b1;
  end
  //else if ((exe_ecall == 1'b1)||(exe_mret ==1'b1)||(mem_ecall == 1'b1)||(mem_mret == 1'b1)) begin
    //stall = 1'b1;
  //end
  else if ((ok_to_insert == 1'b1)&&((exe_csr_ena==1'b1)||(mem_csr_ena==1'b1)||(wb_csr_r_ena==1'b1)||(wb_csr_w_ena==1'b1)||(exe_ecall==1'b1)||(exe_mret==1'b1)||(mem_ecall==1'b1)||(mem_mret==1'b1)||(wb_ecall==1'b1)||(wb_mret==1'b1))) begin
    stall = 1'b1;
  end
  else begin
    stall = 1'b0;
  end
end


////////////////flush////////////////
assign flush = exe_jump;
//wire flush_exception;
//assign flush_exception = ecall_en || mret_en;
//assign flush_exception = 0;

////////////////IF_stage_PC_destination////////////////
always @(*) begin
  if (exe_ecall==1'b1) begin
    pc_dest = mtvec_dest;
  end
  else if (exe_mret==1'b1) begin
    pc_dest = mepc_dest;
  end
  else if (exe_time_intr_firstdetect==1'b1)begin
    pc_dest = mtvec_dest;
  end
  else begin
    pc_dest = exe_pc_dest;
  end
end


////////////////if_stage////////////////
ysyx_210456_if_stage If_stage(
  .clk(clock),
  .rst(reset),

  .stall(stall),
  .axi_stall(axi_stall),
  .jump_en(jump_en),
  .pc_dest(pc_dest),

  //from axi
  .inst_i(if_data_read[31:0]),
  
  //to axi
  .inst_addr(if_addr),
  .inst_ena(if_valid),
  .inst_size(if_size),

  .pc_o(if_pc),
  .inst_o(if_inst)
);


//if_stage -> id_stage
always @(posedge clock) begin
  if (reset == 1'b1)  begin
    if_id_inst <= 32'b0;
    //if_id_pc <= `ZERO_WORD;
    if_id_pc <= PC_START_RESET;
  end
  else if (axi_stall == 1'b1) begin
    if_id_inst <= if_id_inst;
    if_id_pc <= if_id_pc;
  end
  else if (flush == 1'b1) begin
    if_id_inst <= 32'b0;
    //if_id_pc <= `ZERO_WORD;
    if_id_pc <= PC_START_RESET;
  end
  else if (stall == 1'b1) begin
      if_id_inst <= if_id_inst;
      if_id_pc <= if_id_pc;
  end
  else begin
    if_id_inst <= if_inst;
    if_id_pc <= if_pc;
  end

end



////////////////id_stage////////////////
ysyx_210456_id_stage Id_stage(
  //.clk(clk),
  .rst(reset),
  .inst_i(if_id_inst),
  .pc_i(if_id_pc),

  //from reg
  .rs1_data(r_data1),
  .rs2_data(r_data2),
  //.a0_i(a0),

  //interruption
  //.time_intr_confirm_i(time_interruption_confirmation),
  
  //to reg
  .rs1_r_ena(rs1_r_ena),
  .rs1_r_addr(rs1_r_addr),
  .rs2_r_ena(rs2_r_ena),
  .rs2_r_addr(rs2_r_addr),
  //pass
  .rd_w_ena(id_rd_w_ena),
  .rd_w_addr(id_rd_w_addr),
  //.inst_type(id_inst_type),
  .alu_opcode(id_alu_opcode),
  .alu_single_word(id_alu_single_word),
  .op1(id_op1),
  .op2(id_op2),
  .l_mem(id_l_mem),
  .s_mem(id_s_mem),
  .datasize(id_datasize),
  .unsigned_load(id_unsigned_load),
  .rs1_data_o(id_rs1_data),
  .rs2_data_o(id_rs2_data),
  .branch_type(id_branch_type),
  .jump_type(id_jump_type),
  //.inst_o(id_inst),   //for difftest
  .pc_o(id_pc),
  .csr_addr(id_csr_addr),
  .csr_ena(id_csr_ena),
  .csr_op(id_csr_op),
  .csr_mode(id_csr_mode),
  //.putch_en(id_putch_en),
  //.a0_o(id_a0),
  .ecall(id_ecall),
  .mret(id_mret)
  //.time_intr_o(id_time_intr)
);



/*
always @(posedge clock) begin
  if (reset == 1'b1) begin
    id_exe_rd_w_ena <= 1'b0;
    id_exe_rd_w_addr<=5'b00000;
    //id_exe_inst_type<=5'b00000;
    id_exe_alu_opcode<=8'b00000000;
    id_exe_alu_single_word <= 1'b0;
    id_exe_op1<=`ZERO_WORD;
    id_exe_op2<=`ZERO_WORD;
    id_exe_l_mem<=1'b0;
    id_exe_s_mem<=1'b0;
    id_exe_datasize<=2'b00;
    id_exe_unsigned_load<=1'b0; 
    id_exe_rs1_data<=`ZERO_WORD;
    id_exe_rs2_data<=`ZERO_WORD;
    id_exe_branch_type<=3'b000;
    id_exe_jump_type<=2'b00;
    //id_exe_inst<=32'b0;
    id_exe_pc<=PC_START_RESET;
    id_exe_csr_addr<=12'b000000000000;
    id_exe_csr_ena<=1'b0;
    id_exe_csr_op<=`ZERO_WORD;
    id_exe_csr_mode<=2'b00;
    //id_exe_putch_en<=1'b0;
    //id_exe_a0<=8'b0;
    id_exe_ecall<=1'b0;
    id_exe_mret<=1'b0;
    //id_exe_time_intr<=1'b0;
  end
  else if (axi_stall == 1'b1) begin
    id_exe_rd_w_ena <= id_exe_rd_w_ena;
    id_exe_rd_w_addr<=id_exe_rd_w_addr;
    //id_exe_inst_type<=id_exe_inst_type;
    id_exe_alu_opcode<=id_exe_alu_opcode;
    id_exe_alu_single_word <= id_exe_alu_single_word;
    id_exe_op1<=id_exe_op1;
    id_exe_op2<=id_exe_op2;
    id_exe_l_mem<=id_exe_l_mem;
    id_exe_s_mem<=id_exe_s_mem;
    id_exe_datasize<=id_exe_datasize;
    id_exe_unsigned_load<=id_exe_unsigned_load; 
    id_exe_rs1_data<=id_exe_rs1_data;
    id_exe_rs2_data<=id_exe_rs2_data;
    id_exe_branch_type<=id_exe_branch_type;
    id_exe_jump_type<=id_exe_jump_type;
    //id_exe_inst<=id_exe_inst;
    id_exe_pc<=id_exe_pc;
    id_exe_csr_addr<=id_exe_csr_addr;
    id_exe_csr_ena<=id_exe_csr_ena;
    id_exe_csr_op<=id_exe_csr_op;
    id_exe_csr_mode<=id_exe_csr_mode;
    //id_exe_putch_en<=id_exe_putch_en;
    //id_exe_a0<=id_exe_a0;
    id_exe_ecall<=id_exe_ecall;
    id_exe_mret<=id_exe_mret;
    //id_exe_time_intr<=id_exe_time_intr;
  end
  else if ((stall == 1'b1) || (flush == 1'b1)) begin
    id_exe_rd_w_ena <= 1'b0;
    id_exe_rd_w_addr<=5'b00000;
    //id_exe_inst_type<=5'b00000;
    id_exe_alu_opcode<=8'b00000000;
    id_exe_alu_single_word <= 1'b0;
    id_exe_op1<=`ZERO_WORD;
    id_exe_op2<=`ZERO_WORD;
    id_exe_l_mem<=1'b0;
    id_exe_s_mem<=1'b0;
    id_exe_datasize<=2'b00;
    id_exe_unsigned_load<=1'b0; 
    id_exe_rs1_data<=`ZERO_WORD;
    id_exe_rs2_data<=`ZERO_WORD;
    id_exe_branch_type<=3'b000;
    id_exe_jump_type<=2'b00;
    //id_exe_inst<=32'b0;
    id_exe_pc<=PC_START_RESET;
    id_exe_csr_addr<=12'b000000000000;
    id_exe_csr_ena<=1'b0;
    id_exe_csr_op<=`ZERO_WORD;
    id_exe_csr_mode<=2'b00;
    //id_exe_putch_en<=1'b0;
    //id_exe_a0<=8'b0;
    id_exe_ecall<=1'b0;
    id_exe_mret<=1'b0;
    ///////////id_exe_time_intr<=1'b0;  // this interruption flag will not be flush unless reset
  end
  else begin
    id_exe_rd_w_ena <= id_rd_w_ena;
    id_exe_rd_w_addr<=id_rd_w_addr;
    //id_exe_inst_type<=id_inst_type;
    id_exe_alu_opcode<=id_alu_opcode;
    id_exe_alu_single_word<=id_alu_single_word;
    id_exe_op1<=id_op1;
    id_exe_op2<=id_op2;
    id_exe_l_mem<=id_l_mem;
    id_exe_s_mem<=id_s_mem;
    id_exe_datasize<=id_datasize;
    id_exe_unsigned_load<=id_unsigned_load; 
    id_exe_rs1_data<=id_rs1_data;
    id_exe_rs2_data<=id_rs2_data;
    id_exe_branch_type<=id_branch_type;
    id_exe_jump_type<=id_jump_type;
    //id_exe_inst<=id_inst;
    id_exe_pc<=id_pc;
    id_exe_csr_addr<=id_csr_addr;
    id_exe_csr_ena<=id_csr_ena;
    id_exe_csr_op<=id_csr_op;
    id_exe_csr_mode<=id_csr_mode;
    //id_exe_putch_en<=id_putch_en;
    //id_exe_a0<=id_a0;
    id_exe_ecall<=id_ecall;
    id_exe_mret<=id_mret;
    //id_exe_time_intr<=id_time_intr;
  end
end
*/

// id_stage -> exe_stage
//time interruption state machine
//only if the current inst is not nop\csr\mret\ecall and there are no csr\ecall\mret inst are pending effect, insert a time interruption in the current inst
reg time_intr_state;
always @(posedge clock) begin
  if (reset == 1'b1) begin
    id_exe_rd_w_ena <= 1'b0;
    id_exe_rd_w_addr<=5'b00000;
    //id_exe_inst_type<=5'b00000;
    id_exe_alu_opcode<=8'b00000000;
    id_exe_alu_single_word <= 1'b0;
    id_exe_op1<=`YSYX210456_ZERO_WORD;
    id_exe_op2<=`YSYX210456_ZERO_WORD;
    id_exe_l_mem<=1'b0;
    id_exe_s_mem<=1'b0;
    id_exe_datasize<=2'b00;
    id_exe_unsigned_load<=1'b0; 
    id_exe_rs1_data<=`YSYX210456_ZERO_WORD;
    id_exe_rs2_data<=`YSYX210456_ZERO_WORD;
    id_exe_branch_type<=3'b000;
    id_exe_jump_type<=2'b00;
    //id_exe_inst<=32'b0;
    id_exe_pc<=PC_START_RESET;
    id_exe_csr_addr<=12'b000000000000;
    id_exe_csr_ena<=1'b0;
    id_exe_csr_op<=`YSYX210456_ZERO_WORD;
    id_exe_csr_mode<=2'b00;
    //id_exe_putch_en<=1'b0;
    //id_exe_a0<=8'b0;
    id_exe_ecall<=1'b0;
    id_exe_mret<=1'b0;

    time_intr_state <= 1'b0;
    id_exe_time_intr_firstdetect<=1'b0;
  end
  else begin
    if (axi_stall == 1'b1) begin
      id_exe_rd_w_ena <= id_exe_rd_w_ena;
      id_exe_rd_w_addr<=id_exe_rd_w_addr;
      //id_exe_inst_type<=id_exe_inst_type;
      id_exe_alu_opcode<=id_exe_alu_opcode;
      id_exe_alu_single_word <= id_exe_alu_single_word;
      id_exe_op1<=id_exe_op1;
      id_exe_op2<=id_exe_op2;
      id_exe_l_mem<=id_exe_l_mem;
      id_exe_s_mem<=id_exe_s_mem;
      id_exe_datasize<=id_exe_datasize;
      id_exe_unsigned_load<=id_exe_unsigned_load; 
      id_exe_rs1_data<=id_exe_rs1_data;
      id_exe_rs2_data<=id_exe_rs2_data;
      id_exe_branch_type<=id_exe_branch_type;
      id_exe_jump_type<=id_exe_jump_type;
      //id_exe_inst<=id_exe_inst;
      id_exe_pc<=id_exe_pc;
      id_exe_csr_addr<=id_exe_csr_addr;
      id_exe_csr_ena<=id_exe_csr_ena;
      id_exe_csr_op<=id_exe_csr_op;
      id_exe_csr_mode<=id_exe_csr_mode;
      //id_exe_putch_en<=id_exe_putch_en;
      //id_exe_a0<=id_exe_a0;
      id_exe_ecall<=id_exe_ecall;
      id_exe_mret<=id_exe_mret;

      time_intr_state<=time_intr_state;
      id_exe_time_intr_firstdetect<=id_exe_time_intr_firstdetect;
    end
    else begin   //if not reset or axistall, begin
      //DEFAULT operation
      if ((stall == 1'b1) || (flush == 1'b1)) begin
        id_exe_rd_w_ena <= 1'b0;
        id_exe_rd_w_addr<=5'b00000;
        //id_exe_inst_type<=5'b00000;
        id_exe_alu_opcode<=8'b00000000;
        id_exe_alu_single_word <= 1'b0;
        id_exe_op1<=`YSYX210456_ZERO_WORD;
        id_exe_op2<=`YSYX210456_ZERO_WORD;
        id_exe_l_mem<=1'b0;
        id_exe_s_mem<=1'b0;
        id_exe_datasize<=2'b00;
        id_exe_unsigned_load<=1'b0; 
        id_exe_rs1_data<=`YSYX210456_ZERO_WORD;
        id_exe_rs2_data<=`YSYX210456_ZERO_WORD;
        id_exe_branch_type<=3'b000;
        id_exe_jump_type<=2'b00;
        //id_exe_inst<=32'b0;
        id_exe_pc<=PC_START_RESET;
        id_exe_csr_addr<=12'b000000000000;
        id_exe_csr_ena<=1'b0;
        id_exe_csr_op<=`YSYX210456_ZERO_WORD;
        id_exe_csr_mode<=2'b00;
        //id_exe_putch_en<=1'b0;
        //id_exe_a0<=8'b0;
        id_exe_ecall<=1'b0;
        id_exe_mret<=1'b0;
        ///////////id_exe_time_intr<=1'b0;  // this interruption flag will not be flush unless reset
      end
      else begin
        id_exe_rd_w_ena <= id_rd_w_ena;
        id_exe_rd_w_addr<=id_rd_w_addr;
        //id_exe_inst_type<=id_inst_type;
        id_exe_alu_opcode<=id_alu_opcode;
        id_exe_alu_single_word<=id_alu_single_word;
        id_exe_op1<=id_op1;
        id_exe_op2<=id_op2;
        id_exe_l_mem<=id_l_mem;
        id_exe_s_mem<=id_s_mem;
        id_exe_datasize<=id_datasize;
        id_exe_unsigned_load<=id_unsigned_load; 
        id_exe_rs1_data<=id_rs1_data;
        id_exe_rs2_data<=id_rs2_data;
        id_exe_branch_type<=id_branch_type;
        id_exe_jump_type<=id_jump_type;
        //id_exe_inst<=id_inst;
        id_exe_pc<=id_pc;
        id_exe_csr_addr<=id_csr_addr;
        id_exe_csr_ena<=id_csr_ena;
        id_exe_csr_op<=id_csr_op;
        id_exe_csr_mode<=id_csr_mode;
        //id_exe_putch_en<=id_putch_en;
        //id_exe_a0<=id_a0;
        id_exe_ecall<=id_ecall;
        id_exe_mret<=id_mret;
        //id_exe_time_intr<=id_time_intr;
      end
      //INTERRUPT operation, overwrite some reg
      case( time_intr_state )
      1'b0: begin
        if (ok_to_insert == 1'b1) begin
          if ((axi_stall != 1'b1)&&((stall != 1'b1) && (flush != 1'b1))) begin
            //overwrite some reg, when insert a interruption
            id_exe_rd_w_ena <= 1'b0;
            id_exe_rd_w_addr<=5'b00000;
            //id_exe_inst_type<=5'b00000;
            id_exe_alu_opcode<=8'b00000000;
            id_exe_alu_single_word <= 1'b0;
            id_exe_op1<=`YSYX210456_ZERO_WORD;
            id_exe_op2<=`YSYX210456_ZERO_WORD;
            id_exe_l_mem<=1'b0;
            id_exe_s_mem<=1'b0;
            id_exe_datasize<=2'b00;
            id_exe_unsigned_load<=1'b0; 
            id_exe_rs1_data<=`YSYX210456_ZERO_WORD;
            id_exe_rs2_data<=`YSYX210456_ZERO_WORD;
            id_exe_branch_type<=3'b000;
            id_exe_jump_type<=2'b00;
            //id_exe_inst<=32'b0;
            //id_exe_pc<=PC_START_RESET;
            id_exe_csr_addr<=12'b000000000000;
            id_exe_csr_ena<=1'b0;
            id_exe_csr_op<=`YSYX210456_ZERO_WORD;
            id_exe_csr_mode<=2'b00;
            //id_exe_putch_en<=1'b0;
            //id_exe_a0<=8'b0;
            id_exe_ecall<=1'b0;
            id_exe_mret<=1'b0;

            id_exe_time_intr_firstdetect <= ok_to_insert;
            time_intr_state <= 1'b1;  //indicate that already sent a time instrruption in the pipeline
          end
          else begin
            id_exe_time_intr_firstdetect <= 1'b0;
          end
        end
        else begin
          id_exe_time_intr_firstdetect <= 1'b0;
        end
      end
      1'b1: begin
        id_exe_time_intr_firstdetect <= 1'b0;
        if (time_interruption_confirmation == 1'b0) begin
          time_intr_state <= 1'b0;   // wait for the next interruption
        end
      end
      endcase     
    end
  end
end



////////////////exe_stage////////////////
ysyx_210456_exe_stage Exe_stage(
  .rst(reset),
  .rd_w_ena_i(id_exe_rd_w_ena),
  .rd_w_addr_i(id_exe_rd_w_addr),
  //.inst_type_i(id_exe_inst_type),
  .alu_opcode(id_exe_alu_opcode),
  .alu_single_word(id_exe_alu_single_word),
  .op1(id_exe_op1),
  .op2(id_exe_op2),
  .l_mem_i(id_exe_l_mem),
  .s_mem_i(id_exe_s_mem),
  .datasize_i(id_exe_datasize),
  .unsigned_load_i(id_exe_unsigned_load),
  .rs1_data_i(id_exe_rs1_data),
  .rs2_data_i(id_exe_rs2_data),
  .branch_type(id_exe_branch_type),
  .jump_type(id_exe_jump_type),
  //.inst_i(id_exe_inst),
  .pc_i(id_exe_pc),
  .csr_addr_i(id_exe_csr_addr),
  .csr_ena_i(id_exe_csr_ena),
  .csr_op_i(id_exe_csr_op),
  .csr_mode_i(id_exe_csr_mode),
  //.putch_en_i(id_exe_putch_en),
  //.a0_i(id_exe_a0),
  .ecall_i(id_exe_ecall),
  .mret_i(id_exe_mret),
  //.time_intr_i(id_exe_time_intr),
  .time_intr_firstdetect_i(id_exe_time_intr_firstdetect),


  //result to out
  .alu_result_o(exe_alu_result),
  .jump(exe_jump),    //enable jump in pc!
  .pc_dest(exe_pc_dest),
  //.next_pc(exe_next_pc),
  
  //pass
  //.inst_type_o(exe_inst_type),
  .rd_w_ena_o(exe_rd_w_ena),
  .rd_w_addr_o(exe_rd_w_addr),
  .l_mem_o(exe_l_mem),
  .s_mem_o(exe_s_mem),
  .datasize_o(exe_datasize),
  .unsigned_load_o(exe_unsigned_load),
  .rs2_data_o(exe_rs2_data),
  //.inst_o(exe_inst),
  .pc_o(exe_pc),
  .csr_addr_o(exe_csr_addr),
  .csr_ena_o(exe_csr_ena),
  .csr_op_o(exe_csr_op),
  .csr_mode_o(exe_csr_mode),
  //.putch_en_o(exe_putch_en),
  //.a0_o(exe_a0),
  .ecall_o(exe_ecall),
  .mret_o(exe_mret),
  //.time_intr_o(exe_time_intr),
  .time_intr_firstdetect_o(exe_time_intr_firstdetect)
);

//exe_stage -> mem_stage
always @(posedge clock) begin
  if (reset == 1'b1) begin
    exe_mem_rd_w_ena<=1'b0;
    exe_mem_rd_w_addr<=5'b00000;
    //exe_mem_inst_type<=5'b00000;
    exe_mem_l_mem<=1'b0;
    exe_mem_s_mem<=1'b0;
    exe_mem_datasize<=2'b00;
    exe_mem_unsigned_load<=1'b0;
    exe_mem_rs2_data<=`YSYX210456_ZERO_WORD;
    exe_mem_alu_result<=`YSYX210456_ZERO_WORD;
    //exe_mem_inst<=32'b0;
    exe_mem_pc<=PC_START_RESET;
    exe_mem_csr_addr<=12'b000000000000;
    exe_mem_csr_ena<=1'b0;
    exe_mem_csr_op<=`YSYX210456_ZERO_WORD;
    exe_mem_csr_mode<=2'b00;
    //exe_mem_putch_en<=1'b0;
    //exe_mem_a0<=8'b0;
    exe_mem_ecall<=1'b0;
    exe_mem_mret<=1'b0;
    //exe_mem_time_intr<=1'b0;
    exe_mem_time_intr_firstdetect<=1'b0;
    //exe_mem_next_pc<=PC_START_RESET;
  end
  else if (axi_stall == 1'b1) begin
    exe_mem_rd_w_ena<=exe_mem_rd_w_ena;
    exe_mem_rd_w_addr<=exe_mem_rd_w_addr;
    //exe_mem_inst_type<=exe_mem_inst_type;
    exe_mem_l_mem<=exe_mem_l_mem;
    exe_mem_s_mem<=exe_mem_s_mem;
    exe_mem_datasize<=exe_mem_datasize;
    exe_mem_unsigned_load<=exe_mem_unsigned_load;
    exe_mem_rs2_data<=exe_mem_rs2_data;
    exe_mem_alu_result<=exe_mem_alu_result;
    //exe_mem_inst<=exe_mem_inst;
    exe_mem_pc<=exe_mem_pc;
    exe_mem_csr_addr<=exe_mem_csr_addr;
    exe_mem_csr_ena<=exe_mem_csr_ena;
    exe_mem_csr_op<=exe_mem_csr_op;
    exe_mem_csr_mode<=exe_mem_csr_mode;
    //exe_mem_putch_en<=exe_mem_putch_en;
    //exe_mem_a0<=exe_mem_a0;
    exe_mem_ecall<=exe_mem_ecall;
    exe_mem_mret<=exe_mem_mret;
    //exe_mem_time_intr<=exe_mem_time_intr;
    exe_mem_time_intr_firstdetect<=exe_mem_time_intr_firstdetect;
    //exe_mem_next_pc<=exe_mem_next_pc;
  end
  else begin
    exe_mem_rd_w_ena<=exe_rd_w_ena;
    exe_mem_rd_w_addr<=exe_rd_w_addr;
    //exe_mem_inst_type<=exe_inst_type;
    exe_mem_l_mem<=exe_l_mem;
    exe_mem_s_mem<=exe_s_mem;
    exe_mem_datasize<=exe_datasize;
    exe_mem_unsigned_load<=exe_unsigned_load;
    exe_mem_rs2_data<=exe_rs2_data;
    exe_mem_alu_result<=exe_alu_result;
    //exe_mem_inst<=exe_inst;
    exe_mem_pc<=exe_pc;
    exe_mem_csr_addr<=exe_csr_addr;
    exe_mem_csr_ena<=exe_csr_ena;
    exe_mem_csr_op<=exe_csr_op;
    exe_mem_csr_mode<=exe_csr_mode;
    //exe_mem_putch_en<=exe_putch_en;
    //exe_mem_a0<=exe_a0;
    exe_mem_ecall<=exe_ecall;
    exe_mem_mret<=exe_mret;
    //exe_mem_time_intr<=exe_time_intr;
    exe_mem_time_intr_firstdetect<=exe_time_intr_firstdetect;
    //exe_mem_next_pc<=exe_next_pc;
  end
  
end

////////////////mem_stage////////////////
ysyx_210456_mem_stage Mem_stage(
  //input
  .rst(reset),
  //.inst_type_i(exe_mem_inst_type),
  .rd_w_ena_i(exe_mem_rd_w_ena),
  .rd_w_addr_i(exe_mem_rd_w_addr),
  .l_mem_i(exe_mem_l_mem),
  .s_mem_i(exe_mem_s_mem),
  .datasize_i(exe_mem_datasize),
  .unsigned_load_i(exe_mem_unsigned_load),
  .rs2_data_i(exe_mem_rs2_data),
  .alu_result_i(exe_mem_alu_result),
  //.inst_i(exe_mem_inst),
  .pc_i(exe_mem_pc),
  //.next_pc_i(exe_mem_next_pc),
  .csr_addr_i(exe_mem_csr_addr),
  .csr_ena_i(exe_mem_csr_ena),
  .csr_op_i(exe_mem_csr_op),
  .csr_mode_i(exe_mem_csr_mode),
  //.putch_en_i(exe_mem_putch_en),
  //.a0_i(exe_mem_a0),
  .ecall_i(exe_mem_ecall),
  .mret_i(exe_mem_mret),
  //.time_intr_i(exe_mem_time_intr),
  .time_intr_firstdetect_i(exe_mem_time_intr_firstdetect),

  //from ram
  .data_loaded(data_loaded_origin),
  .data_valid(data_valid_origin),
  //.mmio_valid_i(mmio_valid),

  //output
  //to ram
  .mem_valid(mem_valid_origin),
  .datasize_2ram(mem_size_origin),
  .load_en_2ram(mem_load_en_origin),
  .save_en_2ram(mem_save_en_origin),
  .data_2ram(mem_data_origin),
  .addr_2ram(mem_addr_origin),

  //result
  .rd_w_data(mem_rd_w_data),
  //pass
  //.inst_type_o(mem_inst_type),
  .rd_w_ena_o(mem_rd_w_ena),
  .rd_w_addr_o(mem_rd_w_addr),
  //.inst_o(mem_inst),
  .pc_o(mem_pc),
  //.next_pc_o(mem_next_pc),
  .csr_addr_o(mem_csr_addr),
  .csr_ena_o(mem_csr_ena),
  .csr_op_o(mem_csr_op),
  .csr_mode_o(mem_csr_mode),
  //.putch_en_o(mem_putch_en),
  //.a0_o(mem_a0),
  .ecall_o(mem_ecall),
  .mret_o(mem_mret),
  //.time_intr_o(mem_time_intr),
  .time_intr_firstdetect_o(mem_time_intr_firstdetect)
  //.mmio_valid_o(mem_mmio_valid)
);


////mem_stage -> wb_stage
always @(posedge clock) begin
  if ((reset == 1'b1)||(axi_stall == 1'b1))  begin
    mem_wb_rd_w_ena <= 1'b0;
    mem_wb_rd_w_addr <= 5'b00000;
    //mem_wb_inst_type <= 5'b00000;
    mem_wb_rd_w_data <= `YSYX210456_ZERO_WORD;
    //mem_wb_inst<=32'b0;
    mem_wb_pc<=PC_START_RESET;
    //mem_wb_next_pc<=PC_START_RESET;
    mem_wb_csr_addr<=12'b000000000000;
    mem_wb_csr_ena<=1'b0;
    mem_wb_csr_op<=`YSYX210456_ZERO_WORD;
    mem_wb_csr_mode<=2'b00;
    //mem_wb_putch_en<=1'b0;
    //mem_wb_a0<=8'b0;
    mem_wb_ecall<=1'b0;
    mem_wb_mret<=1'b0;
    //mem_wb_time_intr<=1'b0;
    mem_wb_time_intr_firstdetect<=1'b0;
    //mem_wb_mmio_valid<=1'b0;
  end
  else begin
    mem_wb_rd_w_ena <= mem_rd_w_ena;
    mem_wb_rd_w_addr <= mem_rd_w_addr;
    //mem_wb_inst_type <= mem_inst_type;
    mem_wb_rd_w_data <= mem_rd_w_data; 
    //mem_wb_inst<=mem_inst;
    mem_wb_pc<=mem_pc; 
    //mem_wb_next_pc<=mem_next_pc; 
    mem_wb_csr_addr<=mem_csr_addr;
    mem_wb_csr_ena<=mem_csr_ena;
    mem_wb_csr_op<=mem_csr_op;
    mem_wb_csr_mode<=mem_csr_mode;
    //mem_wb_putch_en<=mem_putch_en;
    //mem_wb_a0<=mem_a0;
    mem_wb_ecall<=mem_ecall;
    mem_wb_mret<=mem_mret;
    //mem_wb_time_intr<=mem_time_intr;
    mem_wb_time_intr_firstdetect<=mem_time_intr_firstdetect;
    //mem_wb_mmio_valid<=mem_mmio_valid;
  end

end

////////////////wb_stage////////////////
ysyx_210456_wb_stage Wb_stage(
  .rst(reset),
  //.inst_type_i(mem_wb_inst_type),
  .rd_w_ena_i(mem_wb_rd_w_ena),
  .rd_w_addr_i(mem_wb_rd_w_addr),
  .rd_w_data_i(mem_wb_rd_w_data),
  //.inst_i(mem_wb_inst),
  .pc_i(mem_wb_pc),
  //.next_pc_i(mem_wb_next_pc),
  .csr_addr_i(mem_wb_csr_addr),
  .csr_ena_i(mem_wb_csr_ena),
  .csr_op_i(mem_wb_csr_op),
  .csr_mode_i(mem_wb_csr_mode),
  //.putch_en_i(mem_wb_putch_en),
  //.a0_i(mem_wb_a0),
  .ecall_i(mem_wb_ecall),
  .mret_i(mem_wb_mret),
  //.time_intr_i(mem_wb_time_intr),
  .time_intr_firstdetect_i(mem_wb_time_intr_firstdetect),
  //.mmio_valid_i(mem_wb_mmio_valid),

  //from CSRs
  .csr_r_data_i(csrs_csr_r_data),

  //to CSRs
	.csr_w_addr_o(wb_csr_w_addr),
	.csr_w_data_o(wb_csr_w_data),
	.csr_w_ena_o(wb_csr_w_ena),
	.csr_r_addr_o(wb_csr_r_addr),
	.csr_r_ena_o(wb_csr_r_ena),

  //to regfile
  .rd_w_ena_o(wb_rd_w_ena),
  .rd_w_addr_o(wb_rd_w_addr),
  .rd_w_data_o(wb_rd_w_data),
  
  //pass
  //.inst_type_o(),
  //.inst_o(wb_inst),
  .pc_o(wb_pc),
  //.next_pc_o(wb_next_pc),
  //.csr_addr_o(wb_csr_addr),
  //.putch_en_o(putch_en),
  //.a0_o(),
  .ecall_o(wb_ecall),
  .mret_o(wb_mret),
  //.time_intr_o(wb_time_intr),
  .time_intr_firstdetect_o(wb_time_intr_firstdetect)
  //.mmio_valid_o(wb_mmio_valid)
);




////////////////register////////////////
ysyx_210456_regfile Regfile(
  .clk(clock),
  .rst(reset),
  .w_addr(wb_rd_w_addr),
  .w_data(wb_rd_w_data),
  .w_ena(wb_rd_w_ena),
  
  .r_addr1(rs1_r_addr),
  .r_data1(r_data1),
  .r_ena1(rs1_r_ena),
  .r_addr2(rs2_r_addr),
  .r_data2(r_data2),
  .r_ena2(rs2_r_ena)

  //.regs_o(regs)

  //.a0(chara)
);

////////////////CSRs////////////////
ysyx_210456_csrs csrs(
  .clk(clock),
	.rst(reset),

  .ecall_en(ecall_en),
  .mret_en(mret_en),
  .time_intr_en(wb_time_intr_firstdetect),
  .wb_pc(wb_pc),
  //.wb_next_pc(wb_next_pc),
  .clint_raise_interruption(clint_raise_interruption),
  .mtvec_dest(mtvec_dest),
  .mepc_dest(mepc_dest),
  .mstatus_mie(csrs_mstatus_mie),
  .mie_mtie(csrs_mie_mtie),

  //difftest
  //.mstatus_o(csrs_mstatus),
  //.sstatus_o(csrs_sstatus),
  //.mtvec_o(csrs_mtvec),
  //.mepc_o(csrs_mepc),
  //.mcause_o(csrs_mcause),
  //.mip_o(csrs_mip),
  //.mie_o(csrs_mie),
  //.mscratch_o(csrs_mscratch),
	
	.csr_w_addr(wb_csr_w_addr),
	.csr_w_data(wb_csr_w_data),
	.csr_w_ena(wb_csr_w_ena),
	.csr_r_addr(wb_csr_r_addr),
	.csr_r_ena(wb_csr_r_ena),

  .csr_r_data(csrs_csr_r_data)
);


/*
// Difftest
reg cmt_wen;
reg [7:0] cmt_wdest;
reg [`REG_BUS] cmt_wdata;
reg [`REG_BUS] cmt_pc;
reg [31:0] cmt_inst;
reg cmt_valid;
reg trap;
reg [7:0] trap_code;
reg [63:0] cycleCnt;
reg [63:0] instrCnt;
reg [`REG_BUS] regs_diff [0 : 31];
reg [11:0]cmt_csr_addr;
reg cmt_time_intr_firstdetect;
reg cmt_wb_mmio_valid;



wire [`REG_BUS] csrs_mstatus;
wire [`REG_BUS] csrs_mtvec;
wire [`REG_BUS] csrs_mepc;
wire [`REG_BUS] csrs_mcause;
wire [`REG_BUS] csrs_mip;
wire [`REG_BUS] csrs_mie;
wire [`REG_BUS] csrs_mscratch;
wire [`REG_BUS] csrs_sstatus;



//wire inst_valid = (wb_pc != PC_START_RESET) && (wb_inst != 0) && (wb_time_intr_firstdetect != 1'b1);// && (wb_inst != 32'h7b);
wire inst_valid = (wb_inst != 0) && (wb_time_intr_firstdetect != 1'b1);// && (wb_inst != 32'h7b);
wire skip = cmt_valid && ((cmt_inst == 32'h7b) || (cmt_csr_addr == 12'hb00) || (cmt_wb_mmio_valid==1'b1));


always @(posedge clock) begin
  if (reset) begin
    {cmt_wen, cmt_wdest, cmt_wdata, cmt_pc, cmt_inst, cmt_valid, trap, trap_code, cycleCnt, instrCnt} <= 0;
  end
  else if (~trap) begin
    cmt_wen <= wb_rd_w_ena;
    cmt_wdest <= {3'd0, wb_rd_w_addr};
    cmt_wdata <= wb_rd_w_data;
    cmt_pc <= wb_pc;
    cmt_inst <= wb_inst;
    cmt_valid <= inst_valid;
    cmt_csr_addr<=wb_csr_addr;
    cmt_time_intr_firstdetect<=wb_time_intr_firstdetect;
    cmt_wb_mmio_valid<=wb_mmio_valid;

		regs_diff <= regs;

    trap <= wb_inst[6:0] == 7'h6b;
    trap_code <= regs[10][7:0];
    cycleCnt <= cycleCnt + 1;
    if (inst_valid == 1'b1) begin
      instrCnt <= instrCnt + 1;
    end
    else begin
      instrCnt <= instrCnt + 0;
    end
    //instrCnt <= instrCnt + inst_valid;
  end
end


DifftestInstrCommit DifftestInstrCommit(
  .clock              (clock),
  .coreid             (0),
  .index              (0),
  .valid              (cmt_valid),
  .pc                 (cmt_pc),
  .instr              (cmt_inst),
  .skip               (skip),
  .isRVC              (0),
  .scFailed           (0),
  .wen                (cmt_wen),
  .wdest              (cmt_wdest),
  .wdata              (cmt_wdata)
);

wire [`REG_BUS]exceptionPC;
wire [31:0]exceptionInst;
wire [31:0]intrNO;
assign exceptionPC = (cmt_time_intr_firstdetect == 1'b1)? cmt_pc : 0;
assign exceptionInst = (cmt_time_intr_firstdetect == 1'b1)? cmt_inst : 0;
assign intrNO = (cmt_time_intr_firstdetect == 1'b1)? 32'h7 : 0;

DifftestArchEvent DifftestArchEvent(
  .clock              (clock),
  .coreid             (0),
  .intrNO             (intrNO),
  .cause              (0),
  .exceptionPC        (exceptionPC)
  //.exceptionInst      (exceptionInst)
);



DifftestArchIntRegState DifftestArchIntRegState (
  .clock              (clock),
  .coreid             (0),
  .gpr_0              (regs_diff[0]),
  .gpr_1              (regs_diff[1]),
  .gpr_2              (regs_diff[2]),
  .gpr_3              (regs_diff[3]),
  .gpr_4              (regs_diff[4]),
  .gpr_5              (regs_diff[5]),
  .gpr_6              (regs_diff[6]),
  .gpr_7              (regs_diff[7]),
  .gpr_8              (regs_diff[8]),
  .gpr_9              (regs_diff[9]),
  .gpr_10             (regs_diff[10]),
  .gpr_11             (regs_diff[11]),
  .gpr_12             (regs_diff[12]),
  .gpr_13             (regs_diff[13]),
  .gpr_14             (regs_diff[14]),
  .gpr_15             (regs_diff[15]),
  .gpr_16             (regs_diff[16]),
  .gpr_17             (regs_diff[17]),
  .gpr_18             (regs_diff[18]),
  .gpr_19             (regs_diff[19]),
  .gpr_20             (regs_diff[20]),
  .gpr_21             (regs_diff[21]),
  .gpr_22             (regs_diff[22]),
  .gpr_23             (regs_diff[23]),
  .gpr_24             (regs_diff[24]),
  .gpr_25             (regs_diff[25]),
  .gpr_26             (regs_diff[26]),
  .gpr_27             (regs_diff[27]),
  .gpr_28             (regs_diff[28]),
  .gpr_29             (regs_diff[29]),
  .gpr_30             (regs_diff[30]),
  .gpr_31             (regs_diff[31])
);

DifftestTrapEvent DifftestTrapEvent(
  .clock              (clock),
  .coreid             (0),
  .valid              (trap),
  .code               (trap_code),
  .pc                 (cmt_pc),
  .cycleCnt           (cycleCnt),
  .instrCnt           (instrCnt)
);

DifftestCSRState DifftestCSRState(
  .clock              (clock),
  .coreid             (0),
  .priviledgeMode     (`RISCV_PRIV_MODE_M),
  .mstatus            (csrs_mstatus),
  .sstatus            (csrs_sstatus),
  .mepc               (csrs_mepc),
  .sepc               (0),
  .mtval              (0),
  .stval              (0),
  .mtvec              (csrs_mtvec),
  .stvec              (0),
  .mcause             (csrs_mcause),
  .scause             (0),
  .satp               (0),
  .mip                (csrs_mip),
  .mie                (csrs_mie),
  .mscratch           (csrs_mscratch),
  .sscratch           (0),
  .mideleg            (0),
  .medeleg            (0)
);

DifftestArchFpRegState DifftestArchFpRegState(
  .clock              (clock),
  .coreid             (0),
  .fpr_0              (0),
  .fpr_1              (0),
  .fpr_2              (0),
  .fpr_3              (0),
  .fpr_4              (0),
  .fpr_5              (0),
  .fpr_6              (0),
  .fpr_7              (0),
  .fpr_8              (0),
  .fpr_9              (0),
  .fpr_10             (0),
  .fpr_11             (0),
  .fpr_12             (0),
  .fpr_13             (0),
  .fpr_14             (0),
  .fpr_15             (0),
  .fpr_16             (0),
  .fpr_17             (0),
  .fpr_18             (0),
  .fpr_19             (0),
  .fpr_20             (0),
  .fpr_21             (0),
  .fpr_22             (0),
  .fpr_23             (0),
  .fpr_24             (0),
  .fpr_25             (0),
  .fpr_26             (0),
  .fpr_27             (0),
  .fpr_28             (0),
  .fpr_29             (0),
  .fpr_30             (0),
  .fpr_31             (0)
);
*/

endmodule

//--xuezhen--

//`include "defines.v"


module ysyx_210456_if_stage(
  input wire clk,
  input wire rst,

  input wire stall,
  input wire axi_stall,
  input wire jump_en,
  input wire [`YSYX210456_REG_BUS]pc_dest,

  //from i_mem
  input wire [31:0] inst_i,

  //to i_mem  
  output wire [63 : 0]inst_addr,
  output reg         inst_ena,
  output wire [1:0] inst_size,

  //pass
  //output wire [31:0] inst_o,
  //output reg [`REG_BUS]pc

  
  output wire [`YSYX210456_REG_BUS]pc_o,
  //output reg [31 : 0]inst
  output wire [31 : 0]inst_o
);

//parameter PC_START_RESET = `PC_START - 4;
localparam PC_START_RESET = `YSYX210456_PC_START;

// fetch an instruction
reg [`YSYX210456_REG_BUS]pc;
always@( posedge clk )
begin
  //pc <= {pc[63:2],2'b00};
  if( rst == 1'b1 )
  begin
    pc <= PC_START_RESET ;
  end
  else if ((axi_stall == 1'b1)||(inst_ena == 1'b0)) begin
    pc <= pc;
  end
  else begin
    if (jump_en == 1'b1) begin
      pc <= pc_dest;
    end
    else begin
      if (stall == 1'b1) begin     //what if stall and flush become 1 at same time?
        pc <= pc;
      end
      else begin
        pc <= pc + 4;
      end
    end 
  end
end
assign inst_addr = pc;
//assign inst_addr = {pc[63:2],2'b00};
assign pc_o = pc;
//assign inst_ena  = ( rst == 1'b1 ) ? 0 : ((pc == PC_START_RESET)? 0:1);
//assign inst_ena  = ( rst == 1'b1 ) ? 0 : 1;
always@( posedge clk )
begin
  if( rst == 1'b1 )begin
    inst_ena <= 0 ;
  end
  else begin
    inst_ena <= 1;
  end
end
assign inst_size = `YSYX210456_SIZE_W;
assign inst_o = inst_i;

/*
// Access memory
reg [63:0] rdata;
RAMHelper RAMHelper(
  .clk              (clk),
  .en               (1),
  .rIdx             ((pc - `PC_START) >> 3),   //right shift 3, equal to divide by 8
  .rdata            (rdata),
  .wIdx             (0),
  .wdata            (0),
  .wmask            (0),
  .wen              (0)
);
assign inst = pc[2] ? rdata[63 : 32] : rdata[31 : 0];   //read 64 from helper in one time
*/

endmodule

/* verilator lint_off UNDRIVEN */
/* verilator lint_off UNUSED */
//--xuezhen--

//`include "defines.v"

module ysyx_210456_id_stage(
  //input
  //input wire clk,  //added in 0407
  input wire rst,
  input wire [31 : 0]inst_i,   //instruction from instruction memory
  input wire [`YSYX210456_REG_BUS]pc_i,
  //from reg
  input wire [`YSYX210456_REG_BUS]rs1_data,
  input wire [`YSYX210456_REG_BUS]rs2_data,
  //input wire [7:0]a0_i,

  //interruption
  //input wire time_intr_confirm_i,
  
  //output
  //to reg
  output reg rs1_r_ena,
  output wire [4 : 0]rs1_r_addr,
  output reg rs2_r_ena,
  output wire [4 : 0]rs2_r_addr,
  //pass
  output reg rd_w_ena,
  output wire [4 : 0]rd_w_addr,
  output reg l_mem,
  output reg s_mem,
  //output reg [4 : 0]inst_type,
  output reg [7 : 0]alu_opcode,  //operation code to the ALU(exe module)
  output reg alu_single_word,  //enable if do 32bit arith
  output reg [`YSYX210456_REG_BUS]op1,
  output reg [`YSYX210456_REG_BUS]op2,
  output wire [`YSYX210456_REG_BUS]rs1_data_o,
  output wire [`YSYX210456_REG_BUS]rs2_data_o,
  output reg [1:0]datasize,
  output reg unsigned_load,
  output reg [2:0]branch_type,
  output reg [1:0]jump_type,   //00: not jump   10:JAL   11:JALR
  //output wire [31 : 0]inst_o,
  output wire [`YSYX210456_REG_BUS]pc_o,

  output reg [11:0]csr_addr,
  output reg csr_ena,
  output reg [`YSYX210456_REG_BUS]csr_op,
  output reg [1:0]csr_mode,

  //output reg putch_en,
  //output wire [7:0]a0_o,

  output reg ecall,
  output reg mret
  //output wire time_intr_o
);

wire [31 : 0]inst;
//assign inst = (time_intr_confirm_i == 1'b1)? 0 : inst_i;   //if pending time interruption, dont decode any inst
assign inst = inst_i;
//assign inst_o = inst_i;   // for difftest
assign pc_o = pc_i;

//assign a0_o = a0_i;
//assign time_intr_o = time_intr_i;

// I-type
wire [6  : 0]opcode;
wire [4  : 0]rd;
wire [2  : 0]func3;
wire [4  : 0]rs1;
wire [11 : 0]imm_I;
assign opcode = inst[6  :  0];
assign rd     = inst[11 :  7];
assign func3  = inst[14 : 12];
assign rs1    = inst[19 : 15];
assign imm_I    = inst[31 : 20];

//R-type   //added in 04 July
wire [6:0]func7;
wire [4:0]rs2;
assign func7 = inst[31:25];
assign rs2 = inst[24:20];

//S-type  
wire [11:0]imm_S;
assign imm_S[11:5] = inst[31:25];
assign imm_S[4:0] = inst[11 :  7];

//B-type  
wire [12:0]imm_B;
assign imm_B[12] = inst[31];
assign imm_B[10:5] = inst[30:25];
assign imm_B[4:1] = inst[11:8];
assign imm_B[11] = inst[7];
assign imm_B[0] = 1'b0;

//U-type  //added in 022 July
wire [19:0]imm_U;
assign imm_U = inst[31:12];

//J-type
wire [20:0]imm_J;
assign imm_J[20] = inst[31];
assign imm_J[10:1] = inst[30:21];
assign imm_J[11] = inst[20];
assign imm_J[19:12] = inst[19:12];
assign imm_J[0] = 1'b0;



/*
assign rs1_r_ena  = ( rst == 1'b1 ) ? 0 : inst_type[4];
assign rs1_r_addr = ( rst == 1'b1 ) ? 0 : ( inst_type[4] == 1'b1 ? rs1 : 0 );
assign rs2_r_ena  = 0;  
assign rs2_r_addr = 0;

assign rd_w_ena   = ( rst == 1'b1 ) ? 0 : inst_type[4];
assign rd_w_addr  = ( rst == 1'b1 ) ? 0 : ( inst_type[4] == 1'b1 ? rd  : 0 );

assign op1 = ( rst == 1'b1 ) ? 0 : ( inst_type[4] == 1'b1 ? rs1_data : 0 );   //data to be operate
assign op2 = ( rst == 1'b1 ) ? 0 : ( inst_type[4] == 1'b1 ? { {52{imm[11]}}, imm } : 0 );   //data to be operate
*/

assign rs1_r_addr = (rs1_r_ena == 1'b1) ? rs1 : 5'b00000 ;
assign rs2_r_addr = (rs2_r_ena == 1'b1) ? rs2 : 5'b00000 ;
assign rs1_data_o = (rs1_r_ena == 1'b1) ? rs1_data : `YSYX210456_ZERO_WORD;
assign rs2_data_o = (rs2_r_ena == 1'b1) ? rs2_data : `YSYX210456_ZERO_WORD;
assign rd_w_addr  = (rd_w_ena == 1'b1) ? rd  : 5'b00000 ;


always @(*)
begin
  /*
  if( rst == 1'b1 )
  begin
    alu_opcode = 8'b00000000;
    alu_single_word = 1'b0;
    //inst_type = 5'b00000;
    rs1_r_ena = 1'b0;
    rs2_r_ena  = 1'b0;  
    rd_w_ena  = 1'b0;
    op1 = `ZERO_WORD;   
    op2 = `ZERO_WORD; 
    l_mem = 0;
    s_mem = 0;
    datasize = 2'b00;  //00:byte 01:half word 10:word 11:double words
    unsigned_load = 1'b0;
    branch_type = 3'b000;
    jump_type = 2'b00;
    csr_addr = 12'b000000000000;    //imm
    csr_ena = 1'b0;
    csr_op = `ZERO_WORD;    //data from rs1
    csr_mode = 2'b00;     //00 for write;  01 for clear; 10 for set
    //putch_en = 1'b0;
    ecall = 1'b0;
    mret = 1'b0;

  end
  else begin */
    ////////DEFAULT////////
    
    alu_opcode = 8'b00000000;
    alu_single_word = 1'b0;
    //inst_type = 5'b00000;
    rs1_r_ena = 1'b0;
    rs2_r_ena  = 1'b0;  
    rd_w_ena  = 1'b0;
    op1 = `YSYX210456_ZERO_WORD;   
    op2 = `YSYX210456_ZERO_WORD; 
    l_mem = 0;
    s_mem = 0;
    datasize = 2'b00;  //00:byte 01:half word 10:word 11:double words
    unsigned_load = 1'b0;
    branch_type = 3'b000;
    jump_type = 2'b00;
    csr_addr = 12'b000000000000;    //imm
    csr_ena = 1'b0;
    csr_op = `YSYX210456_ZERO_WORD;    //data from rs1
    csr_mode = 2'b00;
    //putch_en = 1'b0;
    ecall = 1'b0;
    mret = 1'b0;  

    casez ({func7,func3,opcode[6:0]})  //7+3+7=17bit
      //arith
      ////////ADD////////
      17'b0000000_000_0110011 : 
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data;   
      end 
      ////////ADDI////////
      17'b???????_000_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SUB////////
      17'b0100000_000_0110011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SUB;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data;   
      end 
      ///////LUI////////
      17'b???????_???_0110111 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = `YSYX210456_ZERO_WORD;   
        op2 = {{32{imm_U[19]}},imm_U,{12{1'b0}}};   //is this correct?
      end 
      ///////AUIPC////////
      17'b???????_???_0010111 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = pc_i;   
        op2 = {{32{imm_U[19]}},imm_U,{12{1'b0}}};   //is this correct?
      end
      ///////ADDW////////
      17'b0000000_000_0111011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data; 
      end
      ////////ADDIW////////
      17'b???????_000_0011011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SUBW////////
      17'b0100000_000_0111011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SUB;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data;   
      end 

      //logic
      ///////XOR////////
      17'b0000000_100_0110011 :  
      begin
        alu_opcode = `YSYX210456_ALU_XOR;
        //inst_type = 5'b01000;  //logic
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data;   
      end
      ///////XORI////////
      17'b???????_100_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_XOR;
        //inst_type = 5'b01000;  //logic
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end
      ///////OR////////
      17'b0000000_110_0110011 :  
      begin
        alu_opcode = `YSYX210456_ALU_OR;
        //inst_type = 5'b01000;  //logic
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data;   
      end
      ///////ORI////////
      17'b???????_110_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_OR;
        //inst_type = 5'b01000;  //logic
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end  
      ///////AND////////
      17'b0000000_111_0110011 :  
      begin
        alu_opcode = `YSYX210456_ALU_AND;
        //inst_type = 5'b01000;  //logic
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data;   
      end
      ///////ANDI////////
      17'b???????_111_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_AND;
        //inst_type = 5'b01000;  //logic
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end   
      
      //compare
      ///////SLT////////
      17'b0000000_010_0110011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SLT;
        //inst_type = 5'b01000;  //what is the inst_type for compare?
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data; 
      end  
      ///////SLTI////////
      17'b???????_010_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SLT;
        //inst_type = 5'b01000;  
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end
      ///////SLTU////////
      17'b0000000_011_0110011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SLTU;
        //inst_type = 5'b01000;  
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = rs2_data; 
      end  
      ///////SLTIU////////
      17'b???????_011_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SLTU;
        //inst_type = 5'b01000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end

      ///////LB////////
      17'b???????_000_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b00;
        unsigned_load = 1'b0;
      end
      ///////LH////////
      17'b???????_001_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b01;
        //unsigned_load = 1'b0;
      end
      ///////LBU////////
      17'b???????_100_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b00;
        unsigned_load = 1'b1;
      end
      ///////LHU////////
      17'b???????_101_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b01;
        unsigned_load = 1'b1;
      end
      ///////LW////////
      17'b???????_010_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b10;
        //unsigned_load = 1'b0;
      end
      ///////LWU////////
      17'b???????_110_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b10;
        unsigned_load = 1'b1;
      end
      ///////LD////////
      17'b???????_011_0000011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };
        l_mem = 1;
        s_mem = 0;
        datasize = 2'b11;
        //unsigned_load = 1'b0;
      end
      ///////SB////////
      17'b???????_000_0100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = rs1_data;   
        op2 = { {52{imm_S[11]}}, imm_S };
        l_mem = 0;
        s_mem = 1;
        datasize = 2'b00;
      end
      ///////SH////////
      17'b???????_001_0100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = rs1_data;   
        op2 = { {52{imm_S[11]}}, imm_S };
        l_mem = 0;
        s_mem = 1;
        datasize = 2'b01;
      end
      ///////Sw////////
      17'b???????_010_0100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = rs1_data;   
        op2 = { {52{imm_S[11]}}, imm_S };
        l_mem = 0;
        s_mem = 1;
        datasize = 2'b10;
      end
      ///////SD////////
      17'b???????_011_0100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //inst_type = 5'b00100;  // load-store
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = rs1_data;   
        op2 = { {52{imm_S[11]}}, imm_S };
        l_mem = 0;
        s_mem = 1;
        datasize = 2'b11;
      end

      //shift
      ////////SLL////////
      17'b0000000_001_0110011 : 
      begin
        alu_opcode = `YSYX210456_ALU_SLL;
        //alu_single_word = 1'b0;
        //inst_type = 5'b10000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {58{1'b0}}, rs2_data[5:0] };   
      end 
      ////////SLLI////////
      17'b000000?_001_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SLL;
        //alu_single_word = 1'b0;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SLLW////////
      17'b0000000_001_0111011 : 
      begin
        alu_opcode = `YSYX210456_ALU_SLL;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {59{1'b0}}, rs2_data[4:0] };   
      end 
      ////////SLLIW////////
      17'b0000000_001_0011011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SLL;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SRL////////
      17'b0000000_101_0110011 : 
      begin
        alu_opcode = `YSYX210456_ALU_SRL;
        //alu_single_word = 1'b0;
        //inst_type = 5'b10000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {58{1'b0}}, rs2_data[5:0] };   
      end 
      ////////SRLI////////
      17'b000000?_101_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SRL;
        //alu_single_word = 1'b0;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SRLW////////
      17'b0000000_101_0111011 : 
      begin
        alu_opcode = `YSYX210456_ALU_SRL;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = {{32{1'b0}},rs1_data[31:0]};   //set zero to the top 32 bits,equal to single word right shift
        op2 = { {59{1'b0}}, rs2_data[4:0] };   
      end 
      ////////SRLIW////////
      17'b0000000_101_0011011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SRL;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = {{32{1'b0}},rs1_data[31:0]};   //set zero to the top 32 bits,equal to single word right shift
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SRA////////
      17'b0100000_101_0110011 : 
      begin
        alu_opcode = `YSYX210456_ALU_SRA;
        //alu_single_word = 1'b0;
        //inst_type = 5'b10000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {58{1'b0}}, rs2_data[5:0] };   
      end 
      ////////SRAI////////
      17'b010000?_101_0010011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SRA;
        //alu_single_word = 1'b0;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 
      ////////SRAW////////
      17'b0100000_101_0111011 : 
      begin
        alu_opcode = `YSYX210456_ALU_SRA;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000; 
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b1;
        op1 = {{32{rs1_data[31]}},rs1_data[31:0]};   //set sign to the top 32 bits, equal to single word right shift
        op2 = { {59{1'b0}}, rs2_data[4:0] };   
      end 
      ////////SRAIW////////
      17'b0100000_101_0011011 :  
      begin
        alu_opcode = `YSYX210456_ALU_SRA;
        alu_single_word = 1'b1;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = {{32{rs1_data[31]}},rs1_data[31:0]};   //set sign to the top 32 bits, equal to single word right shift
        op2 = { {52{imm_I[11]}}, imm_I };   
      end 

      ////////BEQ////////
      17'b???????_000_1100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = pc_i;   
        op2 = { {51{imm_B[12]}}, imm_B }; 
        branch_type = `YSYX210456_B_EQ;
        jump_type = 2'b00;
      end
      ////////BNE////////
      17'b???????_001_1100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = pc_i;   
        op2 = { {51{imm_B[12]}}, imm_B }; 
        branch_type = `YSYX210456_B_NE;
        jump_type = 2'b00;
      end
      ////////BLT////////
      17'b???????_100_1100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = pc_i;   
        op2 = { {51{imm_B[12]}}, imm_B }; 
        branch_type = `YSYX210456_B_LT;
        jump_type = 2'b00;
      end
      ////////BGE////////
      17'b???????_101_1100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = pc_i;   
        op2 = { {51{imm_B[12]}}, imm_B }; 
        branch_type = `YSYX210456_B_GE;
        jump_type = 2'b00;
      end
      ////////BLTU////////
      17'b???????_110_1100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = pc_i;   
        op2 = { {51{imm_B[12]}}, imm_B }; 
        branch_type = `YSYX210456_B_LTU;
        jump_type = 2'b00;
      end
      ////////BGEU////////
      17'b???????_111_1100011 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b1;  
        rd_w_ena  = 1'b0;
        op1 = pc_i;   
        op2 = { {51{imm_B[12]}}, imm_B }; 
        branch_type = `YSYX210456_B_GEU;
        jump_type = 2'b00;
      end


      ////////JAL////////
      17'b???????_???_1101111 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00010;
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = pc_i;   
        op2 = { {43{imm_J[20]}}, imm_J }; 
        branch_type = 3'b000;
        jump_type = 2'b10;
      end
      ////////JALR////////
      17'b???????_000_1100111 :  
      begin
        alu_opcode = `YSYX210456_ALU_ADD;
        //alu_single_word = 1'b0;
        //inst_type = 5'b00010;
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        op1 = rs1_data;   
        op2 = { {52{imm_I[11]}}, imm_I }; 
        branch_type = 3'b000;
        jump_type = 2'b11;
      end


      ////////CSRRW////////
      17'b???????_001_1110011 :  
      begin
        //alu_opcode = `ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        //op1 = rs1_data;   
        //op2 = { {52{imm_I[11]}}, imm_I };
        csr_ena = 1'b1;
        csr_addr = imm_I;    //imm
        csr_op = rs1_data;    //data from rs1   
        csr_mode = 2'b00;
      end 
      ////////CSRRWI////////
      17'b???????_101_1110011 :  
      begin
        //alu_opcode = `ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        //op1 = rs1_data;   
        //op2 = { {52{imm_I[11]}}, imm_I };
        csr_ena = 1'b1;
        csr_addr = imm_I;    //imm
        csr_op = {{59{1'b0}},rs1};    //data from rs1   
        csr_mode = 2'b00;
      end 
      ////////CSRRC////////
      17'b???????_011_1110011 :  
      begin
        //alu_opcode = `ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        //op1 = rs1_data;   
        //op2 = { {52{imm_I[11]}}, imm_I };
        csr_ena = 1'b1;
        csr_addr = imm_I;    //imm
        csr_op = rs1_data;    //data from rs1   
        csr_mode = 2'b01;
      end 
      ////////CSRRCI////////
      17'b???????_111_1110011 :  
      begin
        //alu_opcode = `ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        //op1 = rs1_data;   
        //op2 = { {52{imm_I[11]}}, imm_I };
        csr_ena = 1'b1;
        csr_addr = imm_I;    //imm
        csr_op = {{59{1'b0}},rs1};    //data from rs1   
        csr_mode = 2'b01;
      end 
      ////////CSRRS////////
      17'b???????_010_1110011 :  
      begin
        //alu_opcode = `ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b1;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        //op1 = rs1_data;   
        //op2 = { {52{imm_I[11]}}, imm_I };
        csr_ena = 1'b1;
        csr_addr = imm_I;    //imm
        csr_op = rs1_data;    //data from rs1   
        csr_mode = 2'b10;
      end 
      ////////CSRRSI////////
      17'b???????_110_1110011 :  
      begin
        //alu_opcode = `ALU_ADD;
        //inst_type = 5'b10000;  //arith
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b1;
        //op1 = rs1_data;   
        //op2 = { {52{imm_I[11]}}, imm_I };
        csr_ena = 1'b1;
        csr_addr = imm_I;    //imm
        csr_op = {{59{1'b0}},rs1};    //data from rs1   
        csr_mode = 2'b10;
      end 

      ////////0X7b////////
      //17'b0000000_000_1111011 :
      //begin
        //putch_en = 1'b1;
      //end

      ////////ecall////////
      17'b0000000_000_1110011 :
      begin
        if ((rs2 == 5'b00000) && (rs1 == 5'b00000) && (rd == 5'b00000)) begin
          ecall = 1'b1;
        end
      end

      ////////mret////////
      17'b0011000_000_1110011 :
      begin
        if ((rs2 == 5'b00010) && (rs1 == 5'b00000) && (rd == 5'b00000)) begin
          mret = 1'b1;
        end
      end

      ////////fenci////////
      //17'b




      ////////DEFAULT////////
      default :
      begin
        alu_opcode = 8'b00000000;
        alu_single_word = 1'b0;
        //inst_type = 5'b00000;
        rs1_r_ena = 1'b0;
        rs2_r_ena  = 1'b0;  
        rd_w_ena  = 1'b0;
        op1 = `YSYX210456_ZERO_WORD;   
        op2 = `YSYX210456_ZERO_WORD; 
        l_mem = 0;
        s_mem = 0;
        datasize = 2'b00;  //00:byte 01:half word 10:word 11:double words
        unsigned_load = 1'b0;
        branch_type = 3'b000;
        jump_type = 2'b00;
        csr_addr = 12'b000000000000;    //imm
        csr_ena = 1'b0;
        csr_op = `YSYX210456_ZERO_WORD;    //data from rs1
        csr_mode = 2'b00;
        //putch_en = 1'b0;
        ecall = 1'b0;
        mret = 1'b0;
      end
    endcase
  //end

end

/*
wire inst_addi =   ~opcode[2] & ~opcode[3] & opcode[4] & ~opcode[5] & ~opcode[5]   //where is opecode[6]
                 & ~func3[0] & ~func3[1] & ~func3[2];             

// arith inst: 10000; logic: 01000;
// load-store: 00100; j: 00010;  sys: 00001           
assign inst_type[4] = ( rst == 1'b1 ) ? 0 : inst_addi;

assign inst_opcode[0] = (  rst == 1'b1 ) ? 0 : inst_addi;
assign inst_opcode[1] = (  rst == 1'b1 ) ? 0 : 0;
assign inst_opcode[2] = (  rst == 1'b1 ) ? 0 : 0;
assign inst_opcode[3] = (  rst == 1'b1 ) ? 0 : 0;
assign inst_opcode[4] = (  rst == 1'b1 ) ? 0 : inst_addi;
assign inst_opcode[5] = (  rst == 1'b1 ) ? 0 : 0;
assign inst_opcode[6] = (  rst == 1'b1 ) ? 0 : 0;
assign inst_opcode[7] = (  rst == 1'b1 ) ? 0 : 0;
*/
endmodule







//`include "defines.v"

module ysyx_210456_exe_stage(
  //input wire clk,  //added in 0407
  input wire rst,
  input wire [7 : 0]alu_opcode,
  input wire alu_single_word,
  input wire [`YSYX210456_REG_BUS]op1,
  input wire [`YSYX210456_REG_BUS]op2,
  input wire [2:0]branch_type,
  input wire [1:0]jump_type,    //00: not jump   10:JAL   11:JALR
  input wire [`YSYX210456_REG_BUS]pc_i,     //used in exe stage 

  //pass
  //input wire [4 : 0]inst_type_i,
  input wire rd_w_ena_i,
  input wire [4 : 0]rd_w_addr_i,
  input wire l_mem_i,
  input wire s_mem_i,
  input wire [1:0]datasize_i,
  input wire unsigned_load_i,
  input wire [`YSYX210456_REG_BUS]rs1_data_i,
  input wire [`YSYX210456_REG_BUS]rs2_data_i,
  //input wire [31:0]inst_i,
  input wire [11:0]csr_addr_i,
  input wire csr_ena_i,
  input wire [`YSYX210456_REG_BUS]csr_op_i,
  input wire [1:0]csr_mode_i,
  //input wire putch_en_i,
  //input wire [7:0]a0_i,
  input wire ecall_i,
  input wire mret_i,
  //input wire time_intr_i,
  input wire time_intr_firstdetect_i,



  //result
  output reg  [`YSYX210456_REG_BUS]alu_result_o,
  output reg jump,    //flush to pc!
  output reg [`YSYX210456_REG_BUS]pc_dest,
  //output reg [`REG_BUS]next_pc,



  //pass
  //output wire [4 : 0]inst_type_o,
  output wire rd_w_ena_o,
  output wire [4 : 0]rd_w_addr_o,
  output wire l_mem_o,
  output wire s_mem_o,
  output wire [1:0]datasize_o,
  output wire unsigned_load_o,
  output wire [`YSYX210456_REG_BUS]rs2_data_o,
  //output wire [31:0]inst_o,
  output wire [`YSYX210456_REG_BUS]pc_o,
  output wire [11:0]csr_addr_o,
  output wire csr_ena_o,
  output wire [`YSYX210456_REG_BUS]csr_op_o,
  output wire [1:0]csr_mode_o,
  //output wire putch_en_o,
  //output wire [7:0]a0_o,
  output wire ecall_o,
  output wire mret_o,
  //output wire time_intr_o,
  output wire time_intr_firstdetect_o
);

//assign inst_type_o = inst_type_i;
//assign inst_o = inst_i;
assign pc_o = pc_i;
//assign putch_en_o = putch_en_i;
//assign a0_o = a0_i;
assign ecall_o= ecall_i;
assign mret_o= mret_i;
//assign time_intr_o = time_intr_i;
assign time_intr_firstdetect_o = time_intr_firstdetect_i;

//to be used in mem stage
assign l_mem_o = l_mem_i;
assign s_mem_o = s_mem_i;
assign datasize_o = datasize_i;
assign unsigned_load_o = unsigned_load_i;
assign rs2_data_o = rs2_data_i;

//to be used in wb stage
assign rd_w_ena_o = rd_w_ena_i;
assign rd_w_addr_o = rd_w_addr_i;

assign csr_addr_o = csr_addr_i;
assign csr_ena_o = csr_ena_i;
assign csr_op_o = csr_op_i;
assign csr_mode_o = csr_mode_i;



/*
always @(posedge clk)
begin
  inst_type_o <= inst_type_i;
end
*/
reg [`YSYX210456_REG_BUS]alu_result;
wire signed [`YSYX210456_REG_BUS]signed_op1;
wire signed [`YSYX210456_REG_BUS]signed_op2;
assign signed_op1 = op1;
assign signed_op2 = op2;

always@(*)  //originally *, changed in 0407
begin
  /*
  if( rst == 1'b1 ) begin
    alu_result = `ZERO_WORD;
  end
  else begin*/
    case( alu_opcode )
	  `YSYX210456_ALU_ADD: begin 
      alu_result = op1 + op2;  
    end
    `YSYX210456_ALU_SUB: begin
      alu_result = op1 - op2;
    end
    `YSYX210456_ALU_XOR: begin
      alu_result = op1 ^ op2;
    end
    `YSYX210456_ALU_OR : begin
      alu_result = op1 | op2;
    end
    `YSYX210456_ALU_AND: begin
      alu_result = op1 & op2;
    end
    `YSYX210456_ALU_SLT: begin
      alu_result[63:1] = {63{1'b0}};
      alu_result[0] = signed_op1 < signed_op2;
    end
    `YSYX210456_ALU_SLTU: begin
      alu_result[63:1] = {63{1'b0}};
      alu_result[0] = op1 < op2;
    end
    `YSYX210456_ALU_SLL: begin
      alu_result = op1 << op2[5:0];
    end
    `YSYX210456_ALU_SRL: begin
      alu_result = op1 >> op2[5:0];
    end
    `YSYX210456_ALU_SRA: begin
      alu_result = signed_op1 >>> op2[5:0];   //not signed_op2!!!
    end

	  default:   begin alu_result = `YSYX210456_ZERO_WORD; end
	  endcase
  //end
end


wire signed [`YSYX210456_REG_BUS]signed_rs1_data_i;
wire signed [`YSYX210456_REG_BUS]signed_rs2_data_i;
assign signed_rs1_data_i = rs1_data_i;
assign signed_rs2_data_i = rs2_data_i;

reg branch_condition;
always @(*) begin
  /*
  if( rst == 1'b1 ) begin
    branch_condition = 1'b0;
  end
  else begin*/
    //branch_condition = 1'b0;
    case(branch_type)
      `YSYX210456_B_EQ: begin
        branch_condition = (signed_rs1_data_i == signed_rs2_data_i);
      end
      `YSYX210456_B_NE: begin
        branch_condition = (signed_rs1_data_i != signed_rs2_data_i);
      end
      `YSYX210456_B_LT: begin
        branch_condition = (signed_rs1_data_i < signed_rs2_data_i);
      end
      `YSYX210456_B_GE: begin
        branch_condition = (signed_rs1_data_i >= signed_rs2_data_i);
      end
      `YSYX210456_B_LTU: begin
        branch_condition = (rs1_data_i < rs2_data_i);
      end
      `YSYX210456_B_GEU: begin
        branch_condition = (rs1_data_i >= rs2_data_i);
      end
      3'b000: begin    //not branch inst
        branch_condition = 1'b0;
      end
      default: branch_condition = 1'b0;
    endcase
  //end

end

//output pc_dest
always @(*) begin
  if ((ecall_i == 1'b1)||(mret_i == 1'b1)||(time_intr_firstdetect_i==1'b1)) begin
    pc_dest = `YSYX210456_ZERO_WORD;
    jump = 1'b1;
  end
  else begin
    if (jump_type == 2'b10) begin
      pc_dest = alu_result;
      jump = 1'b1;
    end
    else if(jump_type == 2'b11) begin
      pc_dest = alu_result & ~1;
      jump = 1'b1;
    end
    else begin
      if (branch_condition == 1'b1) begin
        pc_dest = alu_result;
        jump = 1'b1;
      end
      else begin
        pc_dest = `YSYX210456_ZERO_WORD;
        jump = 1'b0;
      end
    end
  end
end

//output single word or double words to mem_stage? If single, ext with sign; if jump inst, output pc+4 
wire [`YSYX210456_REG_BUS]pc_4;
assign pc_4 = pc_i + 4;
always @(*) begin
  if ((jump_type == 2'b10)||(jump_type == 2'b11)) begin
    alu_result_o = pc_4;
  end
  else if (alu_single_word == 1'b1) begin
    alu_result_o = { {32{alu_result[31]}}, alu_result[31:0] };
  end
  else begin
    alu_result_o = alu_result;
  end
end
/*
//next pc if no interruption
always @(*) begin
  if (jump_type == 2'b10) begin
    next_pc = alu_result;
  end
  else if(jump_type == 2'b11) begin
    next_pc = alu_result & ~1;
  end
  else begin
    if (branch_condition == 1'b1) begin
      next_pc = alu_result;
    end
    else begin
      next_pc = pc_4;
    end
  end
end
*/



endmodule


//`include "defines.v"

module ysyx_210456_mem_stage(
  //input wire rst,
  //input wire [4 : 0]inst_type_i,
  //input wire [7 : 0]inst_opcode,
  //input wire [`REG_BUS]alu_result,
  //input wire [`REG_BUS]op2,
  
  //output reg [4 : 0]inst_type_o,
  ///output reg  [`REG_BUS]rd_data,

  input wire rst,
  //input wire [4:0]inst_type_i,
  input wire rd_w_ena_i,
  input wire [4:0]rd_w_addr_i,
  input wire l_mem_i,
  input wire s_mem_i,
  input wire [1:0]datasize_i,
  input wire unsigned_load_i,
  input wire [`YSYX210456_REG_BUS]rs2_data_i,
  input [`YSYX210456_REG_BUS]alu_result_i,
  //input wire [31:0]inst_i,
  input wire [`YSYX210456_REG_BUS]pc_i,
  //input wire [`REG_BUS]next_pc_i,
  input wire [11:0]csr_addr_i,
  input wire csr_ena_i,
  input wire [`YSYX210456_REG_BUS]csr_op_i,
  input wire [1:0]csr_mode_i,
  //input wire putch_en_i,
  //input wire [7:0]a0_i,
  input wire ecall_i,
  input wire mret_i,
  //input wire time_intr_i,
  input wire time_intr_firstdetect_i,

  //from ram
  input wire [`YSYX210456_REG_BUS]data_loaded,
  input wire data_valid,
  //input wire mmio_valid_i,


  //to ram
  output wire mem_valid,
  output wire [1:0]datasize_2ram,
  output wire load_en_2ram,
  output wire save_en_2ram,
  output wire [`YSYX210456_REG_BUS]data_2ram,
  output wire [`YSYX210456_REG_BUS]addr_2ram,

  //pass
  //output wire [4:0]inst_type_o,
  output wire rd_w_ena_o,
  output wire [4:0]rd_w_addr_o,
  output reg [`YSYX210456_REG_BUS]rd_w_data,
  //output wire [31:0]inst_o,
  output wire [`YSYX210456_REG_BUS]pc_o,
  //output wire [`REG_BUS]next_pc_o,
  output wire [11:0]csr_addr_o,
  output wire csr_ena_o,
  output wire [`YSYX210456_REG_BUS]csr_op_o,
  output wire [1:0]csr_mode_o,
  //output wire putch_en_o,
  //output wire [7:0]a0_o,
  output wire ecall_o,
  output wire mret_o,
  //output wire time_intr_o,
  output wire time_intr_firstdetect_o
  //output wire mmio_valid_o
);

//assign inst_type_o = inst_type_i;
assign rd_w_ena_o = rd_w_ena_i;
assign rd_w_addr_o = rd_w_addr_i;
//assign inst_o = inst_i;
assign pc_o = pc_i;
//assign next_pc_o = next_pc_i;
assign mem_valid = s_mem_i || l_mem_i;
assign csr_addr_o = csr_addr_i;
assign csr_ena_o = csr_ena_i;
assign csr_op_o = csr_op_i;
assign csr_mode_o = csr_mode_i;
//assign putch_en_o = putch_en_i;
//assign a0_o = a0_i;
assign ecall_o= ecall_i;
assign mret_o= mret_i;
//assign time_intr_o = time_intr_i;
assign time_intr_firstdetect_o = time_intr_firstdetect_i;
//assign mmio_valid_o = mmio_valid_i;

always @(*) begin   //determine whether the data writen to register is from ram or alu
  /*
  if (rst==1'b1) begin
    rd_w_data = `ZERO_WORD;
  end
  else begin*/
    if ((l_mem_i==1'b1) && (data_valid==1'b1)) begin  //if load from ram
      //rd_w_data = (data_valid==1'b1)? data_loaded:0;
      if (unsigned_load_i == 1'b1) begin   //unsigned load
        case (datasize_i)
          2'b00: begin  //byte
            rd_w_data = {{56{1'b0}},data_loaded[7:0]};
          end
          2'b01: begin  //half word
            rd_w_data = {{48{1'b0}},data_loaded[15:0]};
          end
          2'b10: begin  //word
            rd_w_data = {{32{1'b0}},data_loaded[31:0]};
          end
          2'b11: begin   //double words
            rd_w_data = data_loaded;
          end
        endcase 
      end
      else begin   //signed load
        case (datasize_i)
          2'b00: begin  //byte
            rd_w_data = {{56{data_loaded[7]}},data_loaded[7:0]};
          end
          2'b01: begin  //half word
            rd_w_data = {{48{data_loaded[15]}},data_loaded[15:0]};
          end
          2'b10: begin  //word
            rd_w_data = {{32{data_loaded[31]}},data_loaded[31:0]};
          end
          2'b11: begin   //double words
            rd_w_data = data_loaded;
          end
        endcase
      end

    end
    else begin  //if not load from ram
      rd_w_data = alu_result_i;
    end
  //end
end

assign addr_2ram = alu_result_i;  //address to ram is always from alu
assign datasize_2ram = datasize_i;
assign data_2ram = rs2_data_i;  //data to ram is always form rs2
assign load_en_2ram = l_mem_i;
assign save_en_2ram = s_mem_i;

/*
always @(*) begin    //only whole byte save
  if (rst==1'b1) begin
    save_valid_2ram = 1'b0;
  end
  else begin
    if (s_mem_i==1'b1) begin
      save_valid_2ram = 1'b1;
    end
    else begin
      save_valid_2ram = 1'b0;
    end
  end
end
*/



endmodule


//`include "defines.v"

module ysyx_210456_wb_stage(
  input wire rst,
  //input wire [4:0]inst_type_i,
  input wire rd_w_ena_i,
  input wire [4:0]rd_w_addr_i,
  input wire [`YSYX210456_REG_BUS]rd_w_data_i,
  //input wire [31:0]inst_i,
  input wire [`YSYX210456_REG_BUS]pc_i,
  //input wire [`REG_BUS]next_pc_i,
  input wire [11:0]csr_addr_i,
  input wire csr_ena_i,
  input wire [`YSYX210456_REG_BUS]csr_op_i,
  input wire [1:0]csr_mode_i,
  //input wire putch_en_i,
  //input wire [7:0]a0_i,
  input wire ecall_i,
  input wire mret_i,
  //input wire mmio_valid_i,

  //input wire time_intr_i,
  input wire time_intr_firstdetect_i,

  //from CSRs
  input wire [`YSYX210456_REG_BUS]csr_r_data_i,

  //to CSRs
	output wire csr_w_ena_o,
	output wire [11:0]csr_w_addr_o,
	output reg [`YSYX210456_REG_BUS]csr_w_data_o,
	output wire csr_r_ena_o,
	output wire [11:0]csr_r_addr_o,

  //pass
  //output wire [4:0]inst_type_o,
  output wire rd_w_ena_o,
  output wire [4:0]rd_w_addr_o,
  output wire [`YSYX210456_REG_BUS]rd_w_data_o,
  //output wire [31:0]inst_o,
  output wire [`YSYX210456_REG_BUS]pc_o,
  //output wire [`REG_BUS]next_pc_o,
  //output wire [11:0]csr_addr_o,
  //output wire putch_en_o,
  //output wire [7:0]a0_o,
  output wire ecall_o,
  output wire mret_o,
  //output wire time_intr_o,
  output wire time_intr_firstdetect_o
  //output wire mmio_valid_o
);

  
//assign inst_type_o = inst_type_i;
assign rd_w_ena_o = rd_w_ena_i;
assign rd_w_addr_o = rd_w_addr_i;
assign rd_w_data_o = (csr_ena_i == 1'b1)? csr_r_data_i : rd_w_data_i;
//assign inst_o = inst_i;
assign pc_o = pc_i;
//assign next_pc_o = next_pc_i;
//assign csr_addr_o=csr_addr_i;  //for skip in difftest
//assign putch_en_o = putch_en_i;
//assign a0_o = a0_i;
assign ecall_o = ecall_i;
assign mret_o = mret_i;
//assign time_intr_o = time_intr_i;
assign time_intr_firstdetect_o = time_intr_firstdetect_i;
//assign mmio_valid_o = mmio_valid_i;

//csr
assign csr_r_ena_o =csr_ena_i;
assign csr_r_addr_o = (csr_ena_i == 1'b1)? csr_addr_i : 0;
assign csr_w_ena_o = csr_ena_i;
assign csr_w_addr_o = (csr_ena_i == 1'b1)? csr_addr_i : 0;
//assign csr_w_data_o = (rst == 1'b1)? 0 : csr_op_i;   //csrrs?
always @(*) begin
  if (csr_ena_i == 1'b0) begin
  //if (csr_ena_i == 1'b0) begin
    csr_w_data_o = `YSYX210456_ZERO_WORD;
  end
  else begin
    if (csr_mode_i == 2'b00) begin       //W
      csr_w_data_o = csr_op_i;   
    end
    else if (csr_mode_i == 2'b01) begin     //C
      csr_w_data_o = ~csr_op_i & csr_r_data_i;
    end
    else if (csr_mode_i == 2'b10) begin     //S
      csr_w_data_o = csr_op_i | csr_r_data_i;
    end
    else begin
      csr_w_data_o = `YSYX210456_ZERO_WORD;
    end
  end
end



endmodule

//`include "defines.v"

module ysyx_210456_regfile(
    input  wire clk,
	input  wire rst,
	
	input  wire  [4  : 0] w_addr,
	input  wire  [`YSYX210456_REG_BUS] w_data,
	input  wire 		  w_ena,
	
	input  wire  [4  : 0] r_addr1,
	output reg   [`YSYX210456_REG_BUS] r_data1,
	input  wire 		  r_ena1,
	
	input  wire  [4  : 0] r_addr2,
	output reg   [`YSYX210456_REG_BUS] r_data2,
	input  wire 		  r_ena2

	//output wire [`REG_BUS] regs_o[0 : 31]        // difftest
	
	//output wire [7:0] a0       //putch
    );

	//assign a0 = regs[10][7:0];
	
    // 32 registers
	reg [`YSYX210456_REG_BUS] 	regs[0 : 31];
	
	always @(posedge clk) 
	begin
		if ( rst == 1'b1 ) 
		begin
			regs[ 0] <= `YSYX210456_ZERO_WORD;
			regs[ 1] <= `YSYX210456_ZERO_WORD;
			regs[ 2] <= `YSYX210456_ZERO_WORD;
			regs[ 3] <= `YSYX210456_ZERO_WORD;
			regs[ 4] <= `YSYX210456_ZERO_WORD;
			regs[ 5] <= `YSYX210456_ZERO_WORD;
			regs[ 6] <= `YSYX210456_ZERO_WORD;
			regs[ 7] <= `YSYX210456_ZERO_WORD;
			regs[ 8] <= `YSYX210456_ZERO_WORD;
			regs[ 9] <= `YSYX210456_ZERO_WORD;
			regs[10] <= `YSYX210456_ZERO_WORD;
			regs[11] <= `YSYX210456_ZERO_WORD;
			regs[12] <= `YSYX210456_ZERO_WORD;
			regs[13] <= `YSYX210456_ZERO_WORD;
			regs[14] <= `YSYX210456_ZERO_WORD;
			regs[15] <= `YSYX210456_ZERO_WORD;
			regs[16] <= `YSYX210456_ZERO_WORD;
			regs[17] <= `YSYX210456_ZERO_WORD;
			regs[18] <= `YSYX210456_ZERO_WORD;
			regs[19] <= `YSYX210456_ZERO_WORD;
			regs[20] <= `YSYX210456_ZERO_WORD;
			regs[21] <= `YSYX210456_ZERO_WORD;
			regs[22] <= `YSYX210456_ZERO_WORD;
			regs[23] <= `YSYX210456_ZERO_WORD;
			regs[24] <= `YSYX210456_ZERO_WORD;
			regs[25] <= `YSYX210456_ZERO_WORD;
			regs[26] <= `YSYX210456_ZERO_WORD;
			regs[27] <= `YSYX210456_ZERO_WORD;
			regs[28] <= `YSYX210456_ZERO_WORD;
			regs[29] <= `YSYX210456_ZERO_WORD;
			regs[30] <= `YSYX210456_ZERO_WORD;
			regs[31] <= `YSYX210456_ZERO_WORD;
		end
		else 
		begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	
				regs[w_addr] <= w_data;
		end
	end
	
	/*
	always @(*) begin
		if (rst == 1'b1)
			r_data1 = `ZERO_WORD;
		else if (r_ena1 == 1'b1)
			r_data1 = regs[r_addr1];
		else
			r_data1 = `ZERO_WORD;
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data2 = `ZERO_WORD;
		else if (r_ena2 == 1'b1)
			r_data2 = regs[r_addr2];
		else
			r_data2 = `ZERO_WORD;
	end
	*/

	always @(*) begin
		/*
    if (rst == 1'b1)
			r_data1 = `ZERO_WORD;
		else*/ 
    if (r_ena1 == 1'b1) begin
			if (r_addr1 == w_addr)begin
				if (w_addr == 5'h00)    //midified in 0812
					r_data1 = `YSYX210456_ZERO_WORD;
				else
					r_data1 = w_data;   //forwarding added in 0722			
			end
			else
				r_data1 = regs[r_addr1];
		end
		else
			r_data1 = `YSYX210456_ZERO_WORD;
	end
	
	always @(*) begin
    /*
		if (rst == 1'b1)
			r_data2 = `ZERO_WORD;
		else */
    if (r_ena2 == 1'b1) begin
			if (r_addr2 == w_addr)begin
				if (w_addr == 5'b00)
					r_data2 = `YSYX210456_ZERO_WORD;  //midified in 0812
				else
					r_data2 = w_data;   //forwarding added in 0722				
			end
			else
				r_data2 = regs[r_addr2];
		end
		else
			r_data2 = `YSYX210456_ZERO_WORD;
	end

  /*
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin
			assign regs_o[i] = (w_ena & w_addr == i & i != 0) ? w_data : regs[i];
		end
	endgenerate
  */

endmodule

//`include "defines.v"

module ysyx_210456_csrs(
  input  wire clk,
	input  wire rst,

	input wire ecall_en,
	input wire mret_en,
	input wire time_intr_en,
	input wire [`YSYX210456_REG_BUS]wb_pc,
	//input wire [`REG_BUS]wb_next_pc,
	input wire clint_raise_interruption,
	output wire [`YSYX210456_REG_BUS]mtvec_dest, 
	output wire [`YSYX210456_REG_BUS]mepc_dest,
	output wire mstatus_mie,
	output wire mie_mtie,
	
	input  wire  [11  : 0] csr_w_addr,
	input  wire  [`YSYX210456_REG_BUS] csr_w_data,
	input  wire 		  csr_w_ena,
	
	input  wire  [11  : 0] csr_r_addr,
	output reg   [`YSYX210456_REG_BUS] csr_r_data,
	input  wire 		  csr_r_ena
	
	
	//difftest
	//output wire [`REG_BUS]mstatus_o,
	//output wire [`REG_BUS]sstatus_o,
	//output wire [`REG_BUS]mtvec_o,
	//output wire [`REG_BUS]mepc_o,
	//output wire [`REG_BUS]mcause_o,
	//output wire [`REG_BUS]mip_o,
	//output wire [`REG_BUS]mie_o,
	//output wire [`REG_BUS]mscratch_o

    );
	//wire writable = csr_w_ena && (csr_w_addr[11:10] != 2'b11);


	//assign mstatus_o = mstatus;
	//assign sstatus_o = sstatus;
	//assign mtvec_o = mtvec;
	//assign mepc_o = mepc;
	//assign mcause_o = mcause;
	//assign mip_o = mip;
	//assign mie_o = mie;
	//assign mscratch_o = mscratch;


	//mcycle
	reg [`YSYX210456_REG_BUS] 	mcycle;
	always @(posedge clk) 
	begin
		if ( rst == 1'b1 ) begin
			mcycle <= `YSYX210456_ZERO_WORD;
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'hb00)) begin	
			mcycle <= csr_w_data;
		end
		else begin
			mcycle <= mcycle + 1;
		end
	end

	//mstatus
	reg [62:0] mstatus_l;
	wire mstatus_sd;
	assign mstatus_sd = ((mstatus_l[16:15]==2'b11) || (mstatus_l[14:13]==2'b11));
	wire [`YSYX210456_REG_BUS] mstatus;
	assign mstatus = {mstatus_sd,mstatus_l};
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mstatus_l <= 0;
			mstatus_l[3] <= 1'b1;    //MIE
		end
		else if (ecall_en == 1'b1) begin
			mstatus_l[7] <= mstatus_l[3];  //MPIE<-MIE
			mstatus_l[3] <= 1'b0;
			mstatus_l[12:11] <= 2'b11;
		end
		else if (mret_en == 1'b1) begin
			mstatus_l[3] <= mstatus_l[7];
			mstatus_l[7] <= 1'b1;
			mstatus_l[12:11] <= 2'b00;
		end
		else if (time_intr_en == 1'b1) begin
			mstatus_l[7] <= mstatus_l[3];  //MPIE<-MIE
			mstatus_l[3] <= 1'b0;
			mstatus_l[12:11] <= 2'b11;
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h300)) begin
			mstatus_l <= csr_w_data[62:0];
		end
		else begin
			mstatus_l <= mstatus_l;
		end
		//mstatus[12:11] <= 2'b11;  //MPP
	end

	//sstatus
	wire [`YSYX210456_REG_BUS] 	sstatus;
	assign sstatus = {mstatus_sd,mstatus_l} & 64'h80000003000de112;

	//mtvec
	reg [`YSYX210456_REG_BUS] mtvec;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mtvec <= `YSYX210456_ZERO_WORD;
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h305)) begin
			mtvec <= csr_w_data;
		end
		else begin
			mtvec <= mtvec;
		end
		mtvec[1:0] <= 2'b00;  
	end

	//mepc
	reg [`YSYX210456_REG_BUS]mepc;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mepc <= `YSYX210456_ZERO_WORD;
		end
		else if (ecall_en == 1'b1) begin
			mepc <= wb_pc;
		end
		else if (time_intr_en == 1'b1) begin
			mepc <= wb_pc;
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h341)) begin
			mepc <= csr_w_data;
		end
		else begin
			mepc <= mepc;
		end
	end
	/*
	//mepc
	reg [61:0] mepc_h;
	wire [1:0] mepc_l;
	assign mepc_l  = 2'b0;
	wire [`REG_BUS]mepc;
	assign mepc = {mepc_h,mepc_l};
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mepc_h <= 62'b0;
		end
		else if (ecall_en == 1'b1) begin
			mepc_h <= wb_pc[63:2];
		end
		else if (time_intr_en == 1'b1) begin
			mepc_h <= wb_pc[63:2];
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h341)) begin
			mepc_h <= csr_w_data[63:2];
		end
		else begin
			mepc_h <= mepc_h;
		end
	end
	*/

	//mcause
	reg [`YSYX210456_REG_BUS] mcause;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mcause <= `YSYX210456_ZERO_WORD;
		end
		else if (ecall_en == 1'b1) begin
			mcause[63] <= 0;
			mcause[62:0] <= {{59{1'b0}},4'b1011};
		end
		else if (time_intr_en == 1'b1) begin
			mcause[63] <= 1;
			mcause[62:0] <= {{59{1'b0}},4'b0111};
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h342)) begin
			mcause <= csr_w_data;
		end
		else begin
			mcause <= mcause;
		end
	end

	//mip
	reg [`YSYX210456_REG_BUS] mip;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mip <= `YSYX210456_ZERO_WORD;
		end
		else begin
			if (time_intr_en == 1'b1) begin
				mip[7]<=1'b1;  //MTIP
			end	
			if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h344)) begin
			mip <= csr_w_data;
			end
			else begin
				mip <= mip;
			end
		end
	end

	//mie
	reg [`YSYX210456_REG_BUS] mie;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mie <= `YSYX210456_ZERO_WORD;
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h304)) begin
			mie <= csr_w_data;
		end
		else begin
			mie <= mie;
		end
	end

	//mscracth
	reg [`YSYX210456_REG_BUS] 	mscratch;
	always @(posedge clk) 
	begin
		if ( rst == 1'b1 ) begin
			mscratch <= `YSYX210456_ZERO_WORD;
		end
		else if ((csr_w_ena == 1'b1) && (csr_w_addr[11:10] != 2'b11) && (csr_w_addr == 12'h340)) begin	
			mscratch <= csr_w_data;
		end
		else begin
		end
	end

	//mhartid
	reg [`YSYX210456_REG_BUS] 	mhartid;
	always @(posedge clk) 
	begin
		mhartid <= `YSYX210456_ZERO_WORD;

	end

	//mimpid
	reg [`YSYX210456_REG_BUS] 	mimpid;
	always @(posedge clk) 
	begin
		mimpid <= 64'b0000000000000110111111111100101111011101011111011000111000010111;

	end

	assign mstatus_mie = mstatus_l[3];
	assign mie_mtie = mie[7];
	//read module, combinational
	assign mtvec_dest = {mtvec[63:2],2'b00};
	//assign mepc_dest = {mepc[63:2],2'b00};
	assign mepc_dest = mepc;

	always @(*) begin
		/*
    if (rst == 1'b1)
			csr_r_data = `ZERO_WORD;
		else */
    if (csr_r_ena == 1'b1) begin
			case (csr_r_addr)
				12'hb00:
				begin 
					csr_r_data = mcycle;
				end
				12'h300:
				begin
					csr_r_data = mstatus;
				end
				12'h100:
				begin
					csr_r_data = sstatus;
				end
				12'h305:
				begin
					csr_r_data = mtvec;
				end
				12'h341:
				begin
					csr_r_data = mepc;
				end
				12'h342:
				begin
					csr_r_data = mcause;
				end
				12'h344:
				begin
					csr_r_data = mip;
				end
				12'h304:
				begin
					csr_r_data = mie;
				end
				12'h340:
				begin
					csr_r_data = mscratch;
				end
				12'hf14:
				begin
					csr_r_data = mhartid;
				end
        12'hf13:
				begin
					csr_r_data = mimpid;
				end
				default :
				begin
					csr_r_data = `YSYX210456_ZERO_WORD;
				end
			endcase
		end
		else
			csr_r_data = `YSYX210456_ZERO_WORD;
	end


endmodule

//`include "defines.v"

module ysyx_210456_clint(
    input  wire clk,
	  input  wire rst,

    input mem_valid,
    input [63:0]  mem_addr,
    input [1:0] mem_size,
    input mem_load_en,
    input mem_save_en,
    input [63:0] mem_data,

    output reg [63:0] clint_data_read,
	//output clint_done,

	output wire clint_raise_interruption

    );
	//wire writable = csr_w_ena && (csr_w_addr[11:10] != 2'b11);
  /*
	reg [7:0]k;
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			k <= 8'd49;
		end
		else begin
			if (k == 8'd4) begin
				k <= 0;
			end
			else begin
				k <= k+1;
			end
		end
	end
	reg clk_d;
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			clk_d <= 1'b0;
		end
		else if (k == 8'd4) begin
			clk_d <= ~clk_d;
		end
	end
  */

	//mtime
	reg [`YSYX210456_REG_BUS] mtime;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mtime <= `YSYX210456_ZERO_WORD;
		end
		else if ((mem_valid == 1'b1) && (mem_save_en == 1'b1)) begin	
			if(mem_addr==64'h200bff8)begin
				if (mem_size == 2'b00) begin
					mtime[7:0] <= mem_data[7:0];
				end
				else if (mem_size == 2'b01) begin
					mtime[15:0] <= mem_data[15:0];
				end
				else if (mem_size == 2'b10) begin
					mtime[31:0] <= mem_data[31:0];
				end
				else if (mem_size == 2'b11) begin
					mtime[63:0] <= mem_data[63:0];
				end
			end
		end
		else begin
			mtime <= mtime + 1;
		end
	end

	//mtimecmp
	reg [`YSYX210456_REG_BUS] mtimecmp;
	always @(posedge clk)
	begin
		if (rst == 1'b1) begin
			mtimecmp <= `YSYX210456_ZERO_WORD;
		end
		else if ((mem_valid == 1'b1) && (mem_save_en == 1'b1)) begin	
			if(mem_addr==64'h2004000)begin
				if (mem_size == 2'b00) begin
					mtimecmp[7:0] <= mem_data[7:0];
				end
				else if (mem_size == 2'b01) begin
					mtimecmp[15:0] <= mem_data[15:0];
				end
				else if (mem_size == 2'b10) begin
					mtimecmp[31:0] <= mem_data[31:0];
				end
				else if (mem_size == 2'b11) begin
					mtimecmp[63:0] <= mem_data[63:0];
				end
			end
		end
		else begin
			mtimecmp <= mtimecmp;
		end
	end

	assign clint_raise_interruption = (mtime >= mtimecmp);
	//always @(posedge clk) begin
		//clint_raise_interruption <= (mtime >= mtimecmp);  //for efficiency
	//end
	//read module, combinational
	always @(*) begin
		/*
    if (rst == 1'b1) begin
			clint_data_read = `ZERO_WORD;
			//clint_done = 1'b0;
		end
		else */
    if ((mem_valid == 1'b1) && (mem_load_en == 1'b1)) begin
			if (mem_addr == 64'h200bff8) begin
				clint_data_read = mtime;
				//clint_done = 1'b1;
			end
			else if (mem_addr == 64'h2004000) begin
				clint_data_read = mtimecmp;
				//clint_done = 1'b1;
			end
			else begin
				clint_data_read = `YSYX210456_ZERO_WORD;
				//clint_done = 1'b0;
			end
		end
		else begin
			clint_data_read = `YSYX210456_ZERO_WORD;
			//clint_done = 1'b0;
		end
	end


endmodule
