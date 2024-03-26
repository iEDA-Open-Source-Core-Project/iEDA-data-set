
`timescale 1ns / 1ns

`define YSYX210340_ZERO_WORD  64'h00000000_00000000   
`define YSYX210340_PC_START   32'h30000000  
`define YSYX210340_REG_BUS    63 : 0   

`define YSYX210340_SIZE_B              2'b00
`define YSYX210340_SIZE_H              2'b01
`define YSYX210340_SIZE_W              2'b10
`define YSYX210340_SIZE_D              2'b11

`define YSYX210340_REQ_READ            1'b0
`define YSYX210340_REQ_WRITE           1'b1

// I instructin
`define YSYX210340_INST_ADDI   8'b00000001
`define YSYX210340_INST_SLTI   8'b00000010
`define YSYX210340_INST_SLTIU  8'b00000011
`define YSYX210340_INST_XORI   8'b00000100
`define YSYX210340_INST_ORI    8'b00000101
`define YSYX210340_INST_ANDI   8'b00000110
`define YSYX210340_INST_SLLI   8'b00000111
`define YSYX210340_INST_SRLI   8'b00001000
`define YSYX210340_INST_SRAI   8'b00001001
// ALU
`define YSYX210340_INST_ADD    8'b00001010
`define YSYX210340_INST_SUB    8'b00001011
`define YSYX210340_INST_SLL    8'b00001100
`define YSYX210340_INST_SLT    8'b00001101
`define YSYX210340_INST_SLTU   8'b00001110
`define YSYX210340_INST_XOR    8'b00001111
`define YSYX210340_INST_SRL    8'b00010000
`define YSYX210340_INST_SRA    8'b00010001
`define YSYX210340_INST_OR     8'b00010010
`define YSYX210340_INST_AND    8'b00010011
// Load store
`define YSYX210340_INST_LB    8'b00010100
`define YSYX210340_INST_LH    8'b00010101
`define YSYX210340_INST_LW    8'b00010110
`define YSYX210340_INST_LBU   8'b00010111
`define YSYX210340_INST_LHU   8'b00011000
`define YSYX210340_INST_SB    8'b00011001
`define YSYX210340_INST_SH    8'b00011010
`define YSYX210340_INST_SW    8'b00011011
// Branch
`define YSYX210340_INST_BEQ   8'b00011100
`define YSYX210340_INST_BNE   8'b00011101
`define YSYX210340_INST_BLT   8'b00011110
`define YSYX210340_INST_BGE   8'b00011111
`define YSYX210340_INST_BLTU  8'b00100000
`define YSYX210340_INST_BGEU  8'b00100001
// Lui Auipc
`define YSYX210340_INST_AUIPC 8'b00100010
`define YSYX210340_INST_LUI   8'b00100011
// Jal Jalr
`define YSYX210340_INST_JAL   8'b00100100
`define YSYX210340_INST_JALR  8'b00100101

// 64I
`define YSYX210340_INST_LWU   8'b00100110
`define YSYX210340_INST_LD    8'b00100111
`define YSYX210340_INST_SD    8'b00101000
`define YSYX210340_INST_ADDIW 8'b00101001
`define YSYX210340_INST_SLLIW 8'b00101010
`define YSYX210340_INST_SRLIW 8'b00101011
`define YSYX210340_INST_SRAIW 8'b00101100
`define YSYX210340_INST_ADDW  8'b00101101
`define YSYX210340_INST_SUBW  8'b00101110
`define YSYX210340_INST_SLLW  8'b00101111
`define YSYX210340_INST_SRLW  8'b00110000
`define YSYX210340_INST_SRAW  8'b00110001

//CSR
`define YSYX210340_INST_CSRRW  8'b00110010
`define YSYX210340_INST_CSRRS  8'b00110011
`define YSYX210340_INST_CSRRC  8'b00110100
`define YSYX210340_INST_CSRRWI 8'b00110101
`define YSYX210340_INST_CSRRSI 8'b00110110
`define YSYX210340_INST_CSRRCI 8'b00110111

//interrupt
`define YSYX210340_INST_ECALL  8'b00111000
`define YSYX210340_INST_EBREAK 8'b00111001
`define YSYX210340_INST_MRET   8'b00111010

//nop
`define YSYX210340_INST_NOP    8'b00111011

// Burst types
`define YSYX210340_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210340_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210340_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210340_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210340_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210340_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210340_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210340_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210340_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210340_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210340_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210340_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210340_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210340_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210340_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210340_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210340_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210340_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210340_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210340_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210340_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210340_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210340_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210340_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210340_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210340_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210340_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210340_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210340_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210340_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210340_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210340_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210340_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210340_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210340_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210340_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210340_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210340_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210340_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210340_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210340_AXI_SIZE_BYTES_128                                  3'b111

module ysyx_210340(
    input         clock,
    input         reset,
    input         io_interrupt,
    
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
);

    assign io_slave_awready = 1'b0;
    assign io_slave_wready  = 1'b0;
    assign io_slave_bvalid  = 1'b0;
    assign io_slave_bresp   = 2'd0;
    assign io_slave_bid     = 4'd0;
    assign io_slave_arready = 1'b0;
    assign io_slave_rvalid  = 1'b0;
    assign io_slave_rresp   = 2'd0;
    assign io_slave_rdata   = 64'd0;
    assign io_slave_rlast   = 1'b0;
    assign io_slave_rid     = 4'd0;
    
    wire        if_valid;
    wire        if_ready;
    wire        if_req;
    wire [63:0] if_data_read;
    wire [31:0] if_addr;
    wire [1 :0] if_size;
    wire [1 :0] if_resp; 

    wire        ram_valid;
    wire        ram_req;
    wire        ram_ready;
    wire [ 1:0] ram_size;
    wire [ 1:0] ram_resp;   
    wire [31:0] ram_addr;
    wire [63:0] ram_r_data;
    wire [63:0] ram_w_data;

    wire        rw_valid;
    wire        rw_ready;
    wire        rw_req;
    wire [63:0] data_read;
    wire [63:0] data_write;
    wire [31:0] rw_addr;
    wire [ 1:0] rw_size;
    wire [ 1:0] rw_resp;    

    wire        fetched_mem;
    wire [2:0]  req ;

    ysyx_210340_cpu u_cpu(
        .clock                          (clock),
        .reset                          (reset),

        .if_valid                       (if_valid),
        .if_ready                       (if_ready),
        .if_req                         (if_req),
        .if_data_read                   (if_data_read),
        .if_addr                        (if_addr),
        .if_size                        (if_size),
        .if_resp                        (if_resp),

        .ram_valid                      (ram_valid),
        .ram_req                        (ram_req),
        .ram_ready                      (ram_ready),
        .ram_size                       (ram_size),
        .ram_resp                       (ram_resp),
        .ram_addr                       (ram_addr),
        .ram_r_data                     (ram_r_data),
        .ram_w_data                     (ram_w_data),

        .fetched_mem                    (fetched_mem),
        .req                            (req)
    );

    ysyx_210340_axi_rw Axi_rw (
        .clock                          (clock),
        .reset                          (reset),

        .rw_valid_i                     (rw_valid),
        .rw_ready_o                     (rw_ready),
        .rw_req_i                       (rw_req),
        .data_read_o                    (data_read),
        .data_write_i                   (data_write),
        .rw_addr_i_r                    (rw_addr),
        .rw_size_i                      (rw_size),
        .rw_resp_o                      (rw_resp),

        .axi_aw_ready_i                 (io_master_awready),
        .axi_aw_valid_o                 (io_master_awvalid),
        .axi_aw_addr_o                  (io_master_awaddr),
        .axi_aw_id_o                    (io_master_awid),
        .axi_aw_len_o                   (io_master_awlen),
        .axi_aw_size_o                  (io_master_awsize),
        .axi_aw_burst_o                 (io_master_awburst),

        .axi_w_ready_i                  (io_master_wready),
        .axi_w_valid_o                  (io_master_wvalid),
        .axi_w_data_o                   (io_master_wdata),
        .axi_w_strb_o                   (io_master_wstrb),
        .axi_w_last_o                   (io_master_wlast),
        
        .axi_b_ready_o                  (io_master_bready),
        .axi_b_valid_i                  (io_master_bvalid),
        .axi_b_resp_i                   (io_master_bresp),
        .axi_b_id_i                     (io_master_bid),

        .axi_ar_ready_i                 (io_master_arready),
        .axi_ar_valid_o                 (io_master_arvalid),
        .axi_ar_addr_o                  (io_master_araddr),
        .axi_ar_id_o                    (io_master_arid),
        .axi_ar_len_o                   (io_master_arlen),
        .axi_ar_size_o                  (io_master_arsize),
        .axi_ar_burst_o                 (io_master_arburst),
        
        .axi_r_ready_o                  (io_master_rready),
        .axi_r_valid_i                  (io_master_rvalid),
        .axi_r_resp_i                   (io_master_rresp),
        .axi_r_data_i                   (io_master_rdata),
        .axi_r_last_i                   (io_master_rlast),
        .axi_r_id_i                     (io_master_rid)
    );

 ysyx_210340_arbiter Arbiter(   
        .clock                          (clock),
        .reset                          (reset),

        .m0_valid                       (if_valid), 
        .m0_ready                       (if_ready),
        .m0_req                         (if_req),        
        .m0_data_read                   (if_data_read),
        .m0_addr                        (if_addr),
        .m0_size                        (if_size),
        .m0_resp                        (if_resp),

        .m1_valid                       (ram_valid),
        .m1_req                         (ram_req),    
        .m1_ready                       (ram_ready),
        .m1_size                        (ram_size),
        .m1_resp                        (ram_resp),
        .m1_addr                        (ram_addr),
        .m1_r_data                      (ram_r_data),
        .m1_w_data                      (ram_w_data),

        .s0_rw_valid                    (rw_valid),
        .s0_rw_ready                    (rw_ready),
        .s0_rw_req                      (rw_req),
        .s0_data_read_o                 (data_read),
        .s0_data_write                  (data_write),
        .s0_rw_addr                     (rw_addr),
        .s0_rw_size                     (rw_size),
        .s0_rw_resp                     (rw_resp),
      
        .fetched_mem                    (fetched_mem),
        .req                            (req) 
);    

endmodule

module ysyx_210340_cpu(
    input                               clock,
    input                               reset,
    
    output                              if_valid,
    input                               if_ready,
    input  [63:0]                       if_data_read,
    output [31:0]                       if_addr,
    output [1:0]                        if_size,
    input  [1:0]                        if_resp,
    output                              if_req,

    output                              ram_valid,
    output                              ram_req,    
    input                               ram_ready,
    output [1:0]                        ram_size,
    input  [1:0]                        ram_resp,
    output [31:0]                       ram_addr,
    input  [63:0]                       ram_r_data,
    output [63:0]                       ram_w_data,

    input                               fetched_mem,
    input   [2:0]                       req                          

);

  //访存结果写回寄存器需要延迟1个周期（nemu对比）
  wire ram_wena = ram_valid & ram_ready;
  wire ram_wena_r;
  ysyx_210340_gnrl_dffr_1  ram_wena_dffr (ram_wena, ram_wena_r, clock, reset);    

  wire hs_reg = (if_valid & if_ready) | ram_wena_r; //握手成功时，写回寄存器
  wire if_hs  = (if_valid & if_ready) ;

  wire cmt_if_hs;  //if_hs
  wire id_if_hs;  
  wire ex_if_hs;  
  wire mem_if_hs;
  ysyx_210340_gnrl_dffr_1  cmt_if_hs_dffr (if_hs, cmt_if_hs, clock, reset);
  ysyx_210340_gnrl_dffr_1  id_if_hs_dffr  (cmt_if_hs, id_if_hs, clock, reset);  
  ysyx_210340_gnrl_dffr_1  ex_if_hs_dffr  (id_if_hs, ex_if_hs, clock, reset);
  ysyx_210340_gnrl_dffr_1  mem_if_hs_dffr (ex_if_hs, mem_if_hs, clock, reset); 

//流水线寄存器使能信号
  wire hold_id_ex_i ;
  wire hold_if_id_o ;
  wire hold_id_ex_o ;
  wire hold_ex_mem_o ;
  wire hold_mem_wb_o ;

// if_stage
  wire [31 : 0]              if_pc;
  wire [31 : 0]              if_inst;  
  wire [31 : 0]              id_pc;
  wire [31 : 0]              id_inst;  
  wire [31 : 0]              id_br_addr;
  wire                       id_rs1_r_ena; //id_stage
  wire [4 : 0]               id_rs1_r_addr;
  wire                       id_rs2_r_ena;
  wire [4 : 0]               id_rs2_r_addr;
  wire                       id_rd_w_ena;
  wire [4 : 0]               id_rd_w_addr;
  wire                       id_mem_w_ena;
  wire                       id_mem_r_ena;  
  wire                       id_br_en; 
  wire                       id_csr_r_ena;
  wire                       id_csr_w_ena;  
  wire [7 : 0]               id_inst_opcode;
  wire [`YSYX210340_REG_BUS] id_op1;
  wire [`YSYX210340_REG_BUS] id_op2;
  wire [`YSYX210340_REG_BUS] id_r_data2;	  //regfile
  wire [`YSYX210340_REG_BUS] id_r_data1;
  wire                       id_br_mux;    //branch_ctrl
  wire [`YSYX210340_REG_BUS] id_br_rd_data; 
  wire                       id_br_jar_jalr;
  wire [31 : 0]              id_rd_addr;
                
  wire [4 : 0]               ex_rd_w_addr;
  wire                       ex_mem_w_ena;
  wire                       ex_mem_r_ena;  
  wire                       ex_csr_r_ena;
  wire                       ex_csr_w_ena;    
  wire [7 : 0]               ex_inst_opcode;
  wire [`YSYX210340_REG_BUS] ex_op1;
  wire [`YSYX210340_REG_BUS] ex_op2;
  wire [`YSYX210340_REG_BUS] ex_r_data2;	
  wire [31 : 0]              ex_pc;
  wire [`YSYX210340_REG_BUS] ex_br_rd_data;  
  wire                       ex_br_jar_jalr;  
  wire [31 : 0]              ex_inst; 
  wire [31 : 0]              ex_rd_addr; 

  // id_stage
  wire [31:0] op1_addr = id_op1[31:0];
  wire [31:0] op2_addr = id_op2[31:0];
  assign      ram_addr = id_rd_addr;

  wire [`YSYX210340_REG_BUS] ex_rd_data;
  wire [`YSYX210340_REG_BUS] ex_rd_data_reg;

  wire [`YSYX210340_REG_BUS] mem_rd_csr;  
  wire [`YSYX210340_REG_BUS] mem_rd_data;
  wire [31 : 0]              mem_rd_addr;
  wire [`YSYX210340_REG_BUS] mem_r_data2;  
  wire                       mem_mem_w_ena;
  wire                       mem_mem_r_ena;
  wire                       mem_csr_r_ena; 
  wire                       mem_csr_w_ena;   
  wire [7 : 0]               mem_inst_opcode;   
  wire [`YSYX210340_REG_BUS] mem_op1;   
  wire [`YSYX210340_REG_BUS] mem_op2; 
  wire [4 : 0]               mem_rd_w_addr;   

  wire                       mret_ena;
  wire                       ecall_ena;
  wire [`YSYX210340_REG_BUS] mem_csr_rd_data;  

  wire [`YSYX210340_REG_BUS] mem_rd_data_r = mem_csr_w_ena ? mem_csr_rd_data : mem_rd_data;
  wire ecall_ena_r = ecall_ena & id_if_hs; //ecall触发的异常使能仅有效一个周期
  wire [31:0] csr_epc = if_pc;

  wire [`YSYX210340_REG_BUS] mem_mem_r_data;  //mem_stage
  wire [`YSYX210340_REG_BUS] mem_read_csr_dat;  //csr
  wire                       mem_status_mie_o;
  wire                       mem_mie_mtie_r;
  wire [31:0]                mem_csr_epc_r;
  wire [31:0]                mem_csr_mtvec_r;
  wire [`YSYX210340_REG_BUS] mem_clint_r_data;   //clint
  wire                       mem_int_irq_o; 
  wire [`YSYX210340_REG_BUS] mem_clint_mem_r_data;     //clint_ctrl
  wire                       mem_clint_r_en;
  wire                       mem_clint_w_en;
  wire [31 : 0]              mem_clint_addr;
  wire [`YSYX210340_REG_BUS] mem_clint_w_data;  
  wire [`YSYX210340_REG_BUS] mem_rd_wb_data;     

  wire                       wb_int_irq_o;
  wire [`YSYX210340_REG_BUS] wb_rd_wb_data; 
  wire [4:0]                 wb_rd_w_addr;

  wire irq_ena = wb_int_irq_o & cmt_if_hs;
  wire flush_if = id_br_mux ? 1'b1 : 1'b0 ; 

ysyx_210340_pipe_ctrl Pipe_ctrl(
    .clock            (clock),
    .reset            (reset), 
    .hold_id_ex_i     (hold_id_ex_i),
    
    .hold_if_id_o     (hold_if_id_o),
    .hold_id_ex_o     (hold_id_ex_o),
    .hold_ex_mem_o    (hold_ex_mem_o),
    .hold_mem_wb_o    (hold_mem_wb_o)    
);                                 

ysyx_210340_if_stage If_stage(
  .clock              (clock),
  .reset              (reset),
  .br_addr            (id_br_addr),
  .br_ena             (id_br_mux),
  .irq_ena            (irq_ena),
  .csr_mtvec_r        (mem_csr_mtvec_r),
  .req                (req),
  .cmt_if_hs          (cmt_if_hs),
  .if_ready           (if_ready),
  .if_data_read       (if_data_read),
  .if_resp            (if_resp),
  .flush              (flush_if),

  .pc                 (if_pc),
  .inst               (if_inst),
  .if_valid           (if_valid),
  .if_addr            (if_addr),
  .if_size            (if_size),
  .if_req             (if_req) 
);

ysyx_210340_if_id If_id(
  .clock              (clock),
  .reset              (reset),
  .if_id_ena          (hold_if_id_o),
  .if_pc              (if_pc),
  .if_inst            (if_inst),  

  .id_pc              (id_pc),
  .id_inst            (id_inst) 
);

ysyx_210340_branch_ctrl Branch_ctrl(
  .rs1_data           (id_r_data1),
  .rs2_data           (id_r_data2),
  .inst_opcode        (id_inst_opcode),
  .br_en              (id_br_en),
  .irq_ena            (irq_ena),
  .inst_addr          (id_pc),
  .op1                (op1_addr),
  .op2                (op2_addr),
  .csr_mtvec_r        (mem_csr_mtvec_r),
  .csr_epc_r          (mem_csr_epc_r),

  .br_jar_jalr        (id_br_jar_jalr),
  .rd_data            (id_br_rd_data),
  .br_addr            (id_br_addr),
  .br_mux             (id_br_mux)
);

ysyx_210340_id_stage Id_stage(
  .reset              (reset),
  .inst               (id_inst),
  .rs1_data           (id_r_data1),
  .rs2_data           (id_r_data2), 
  .fetched_r          (fetched_mem),
  .id_ex_ena          (hold_id_ex_o),
  .ex_mem_ena         (hold_ex_mem_o), 
  .mem_wb_ena         (hold_mem_wb_o),    
  .ex_rd_w_addr       (ex_rd_w_addr),
  .mem_rd_w_addr      (mem_rd_w_addr),
  .wb_rd_w_addr       (wb_rd_w_addr), 
  .ex_rd_data         (ex_rd_data),
  .mem_rd_wb_data     (mem_rd_wb_data),
  .wb_rd_wb_data      (wb_rd_wb_data),
  .ex_inst            (ex_inst),  
  .cmt_if_hs          (cmt_if_hs),

  .rs1_r_ena          (id_rs1_r_ena),
  .rs1_r_addr         (id_rs1_r_addr),
  .rs2_r_ena          (id_rs2_r_ena),
  .rs2_r_addr         (id_rs2_r_addr),
  .rd_w_ena           (id_rd_w_ena),
  .rd_w_addr          (id_rd_w_addr),
  .mem_w_ena          (id_mem_w_ena),
  .mem_r_ena          (id_mem_r_ena),
  .csr_r_ena          (id_csr_r_ena),
  .csr_w_ena          (id_csr_w_ena),
  .ecall_ena          (ecall_ena),
  .mret_ena           (mret_ena),
  .br_en              (id_br_en),
  .inst_opcode        (id_inst_opcode),
  .op1                (id_op1),
  .op2                (id_op2),
  .id_ex_ena_i        (hold_id_ex_i)   
);

ysyx_210340_regfile Regfile(
  .clock              (clock),
  .reset              (reset), 
  .hs_reg             (hs_reg), 
  .w_addr             (id_rd_w_addr),
  .w_data             (wb_rd_wb_data),
  .w_ena              (id_rd_w_ena),
  .r_addr1            (id_rs1_r_addr),
  .r_ena1             (id_rs1_r_ena),
  .r_addr2            (id_rs2_r_addr),
  .r_ena2             (id_rs2_r_ena),

  .r_data2            (id_r_data2),  
  .r_data1            (id_r_data1)
);

ysyx_210340_mem_load_store Mem_load_store(
  .reset              (reset),
  .inst_opcode        (id_inst_opcode),
  .op1                (op1_addr),
  .op2                (op2_addr),
  .mem_w_ena          (id_mem_w_ena),
  .mem_r_ena          (id_mem_r_ena),
  .mem_w_data         (id_r_data2),

  .rd_addr            (id_rd_addr),
  .ram_valid          (ram_valid),
  .ram_req            (ram_req),  
  .ram_size           (ram_size),
  .ram_w_data         (ram_w_data)  
);

ysyx_210340_id_ex Id_ex(
  .clock              (clock),
  .reset              (reset),
  .id_ex_ena          (hold_id_ex_o),
  .id_rd_w_addr       (id_rd_w_addr),
  .id_mem_w_ena       (id_mem_w_ena),
  .id_mem_r_ena       (id_mem_r_ena),  
  .id_csr_r_ena       (id_csr_r_ena),
  .id_csr_w_ena       (id_csr_w_ena),  
  .id_inst_opcode     (id_inst_opcode),
  .id_op1             (id_op1),
  .id_op2             (id_op2),
  .id_r_data2         (id_r_data2),	  //regfile
  .id_pc              (id_pc),        //pc
  .id_br_rd_data      (id_br_rd_data),
  .id_br_jar_jalr     (id_br_jar_jalr),
  .id_inst            (id_inst),  
  .id_rd_addr         (id_rd_addr), 

  .ex_rd_w_addr       (ex_rd_w_addr),
  .ex_mem_w_ena       (ex_mem_w_ena),
  .ex_mem_r_ena       (ex_mem_r_ena),  
  .ex_csr_r_ena       (ex_csr_r_ena),
  .ex_csr_w_ena       (ex_csr_w_ena),   
  .ex_inst_opcode     (ex_inst_opcode),
  .ex_op1             (ex_op1),
  .ex_op2             (ex_op2),
  .ex_r_data2         (ex_r_data2),	
  .ex_pc              (ex_pc),       //pc
  .ex_br_rd_data      (ex_br_rd_data),
  .ex_br_jar_jalr     (ex_br_jar_jalr),
  .ex_inst            (ex_inst),
  .ex_rd_addr         (ex_rd_addr)      
);     

// exe_stage
ysyx_210340_exe_stage Exe_stage(
  .reset              (reset),
  .inst_addr          (ex_pc),
  .inst_opcode        (ex_inst_opcode),
  .op1                (ex_op1),
  .op2                (ex_op2),

  .rd_data            (ex_rd_data)
);

//如果是jal、jalr指令，写回reg的数据为branch_ctrl计算出的结果
ysyx_210340_Mux2 Mux_2(
	.sel0	              (ex_br_jar_jalr),
	.data_0	            (ex_br_rd_data) ,
	.data_1	            (ex_rd_data), 
	.data_out	          (ex_rd_data_reg)
);

ysyx_210340_ex_mem Ex_mem( 
  .clock              (clock),
  .reset              (reset), 
  .ex_mem_ena         (hold_ex_mem_o),
  .ex_rd_data         (ex_rd_data_reg), 
  .ex_rd_addr         (ex_rd_addr),  
  .ex_r_data2         (ex_r_data2),
  .ex_mem_w_ena       (ex_mem_w_ena),
  .ex_mem_r_ena       (ex_mem_r_ena),
  .ex_csr_w_ena       (ex_csr_w_ena),
  .ex_csr_r_ena       (ex_csr_r_ena),
  .ex_inst_opcode     (ex_inst_opcode),   
  .ex_op1             (ex_op1),   
  .ex_op2             (ex_op2), 
  .ex_rd_w_addr       (ex_rd_w_addr),  

  .mem_rd_data        (mem_rd_data),
  .mem_rd_addr        (mem_rd_addr),
  .mem_r_data2        (mem_r_data2),
  .mem_mem_w_ena      (mem_mem_w_ena),
  .mem_mem_r_ena      (mem_mem_r_ena),
  .mem_csr_w_ena      (mem_csr_w_ena),  
  .mem_csr_r_ena      (mem_csr_r_ena),   
  .mem_inst_opcode    (mem_inst_opcode),
  .mem_op1            (mem_op1),
  .mem_op2            (mem_op2),   
  .mem_rd_w_addr      (mem_rd_w_addr) 
);

ysyx_210340_mem_stage Mem_stage(
  .reset              (reset),
  .inst_opcode        (mem_inst_opcode),
  .mem_r_ena          (mem_mem_r_ena),
  .ram_r_data         (ram_r_data),

  .mem_r_data         (mem_mem_r_data)
);

ysyx_210340_csr_exe Csr_exe(
  .reset              (reset),
  .inst_opcode        (mem_inst_opcode),
  .op1                (mem_op1),
  .csr_in             (mem_read_csr_dat),   

  .rd_csr             (mem_rd_csr),  
  .rd_data            (mem_csr_rd_data)
);  

ysyx_210340_csr Csr(
  .clock               (clock),
  .reset               (reset),
	.csr_wr_en           (mem_csr_w_ena),
	.csr_rd_en           (mem_csr_r_ena),
	.csr_addr	           (mem_op2),
  .wbck_csr_dat        (mem_rd_csr),
  .cmt_epc             (csr_epc),
  .ecall_i             (ecall_ena_r),
  .tmr_irq_r           (irq_ena),
  .cmt_mret_ena        (mret_ena),   
  .cmt_if_hs           (mem_if_hs),

	.read_csr_dat        (mem_read_csr_dat),
  .status_mie_o        (mem_status_mie_o),
  .mie_mtie_r          (mem_mie_mtie_r),
  .csr_epc_r           (mem_csr_epc_r),
  .csr_mtvec_r         (mem_csr_mtvec_r)  
);

ysyx_210340_clint Clint(
  .clock               (clock),
  .reset               (reset),
  .clint_w_data        (mem_clint_w_data),
  .clint_r_ena         (mem_clint_r_en),  
  .clint_rw_addr       (mem_clint_addr),
  .clint_w_ena         (mem_clint_w_en),
  .status_mie_r        (mem_status_mie_o),
  .mie_mtie_r          (mem_mie_mtie_r),

  .clint_r_data        (mem_clint_r_data),
	.int_irq_o	         (mem_int_irq_o)
);

ysyx_210340_clint_ctrl Clint_ctrl(
  .reset               (reset),
  .inst_opcode         (mem_inst_opcode),
  .mem_w_ena           (mem_mem_w_ena),
  .mem_r_ena           (mem_mem_r_ena),
  .mem_rw_addr         (mem_rd_addr),
  .mem_w_data          (mem_r_data2),
  .clint_r_data        (mem_clint_r_data),

  .mem_r_data          (mem_clint_mem_r_data),
  .clint_r_en          (mem_clint_r_en),
  .clint_w_en          (mem_clint_w_en),
  .clint_addr          (mem_clint_addr),
  .clint_w_data        (mem_clint_w_data)
);

ysyx_210340_Mux Mux2(
	.sel0		             (mem_clint_r_en),
	.sel1		             (mem_mem_r_ena),  
	.data_0	             (mem_clint_mem_r_data),
	.data_1              (mem_mem_r_data),
	.data_2	             (mem_rd_data_r),  
  
	.data_out	           (mem_rd_wb_data)
);

ysyx_210340_mem_wb Mem_wb(
  .clock               (clock),
  .reset               (reset),  
  .mem_wb_ena          (hold_mem_wb_o),
  .mem_int_irq_o       (mem_int_irq_o), 
  .mem_data_out        (mem_rd_wb_data),       
  .mem_rd_w_addr       (mem_rd_w_addr), 

  .wb_int_irq_o        (wb_int_irq_o),
  .wb_data_out         (wb_rd_wb_data),
  .wb_rd_w_addr        (wb_rd_w_addr)
);
 
endmodule

module ysyx_210340_pipe_ctrl(
    input wire clock,
    input wire reset,
    input wire hold_id_ex_i,

    output reg hold_if_id_o,
    output reg hold_id_ex_o,
    output reg hold_ex_mem_o,
    output reg hold_mem_wb_o        
    );

    always @(posedge clock) 
	  begin
		if (reset == 1'b1) 
		begin
        hold_if_id_o  <= 1'b0;
        hold_id_ex_o  <= 1'b0;
        hold_ex_mem_o <= 1'b0;
        hold_mem_wb_o <= 1'b0;
        end
        else begin
        hold_if_id_o  <= 1'b1;
        hold_id_ex_o  <= hold_id_ex_i;
        hold_ex_mem_o <= 1'b1;
        hold_mem_wb_o <= 1'b1;        
        end
    end
endmodule

module ysyx_210340_if_stage(
  input  wire            clock,
  input  wire            reset,
  input  wire [31 : 0]   br_addr,
  input  wire            br_ena,    //指令和中断引起的跳转
  input  wire            irq_ena,
  input  wire [31 : 0]   csr_mtvec_r,
  input  wire [2:0]      req,           //判断当前是访存操作还是普通操作
  input  wire            cmt_if_hs,     //指令改变时对应的时钟周期，比if_hs慢一个周期
	input  wire            if_ready,
  input  wire [63:0]     if_data_read,  
  input  wire [1:0]      if_resp,
  input  wire            flush,

  output reg  [31 : 0]   pc,
  output wire [31 : 0]   inst,  
	output wire            if_valid,
  output wire [31 : 0]   if_addr,
  output wire [1:0]      if_size,
  output wire            if_req
);

wire [31:0] pc_next_r;
reg  [31:0] pc_next;
wire [31:0] if_data_read_nxt; //将存储器读出的指令延迟一个周期，以便下一个if_hs有效时pc和inst再进行改变
reg  [31:0] inst_o;
assign if_valid = 1'b1;
assign if_size  = `YSYX210340_SIZE_W;
wire handshake_done = if_valid & if_ready;
wire [31:0] if_data_read_inst = if_data_read[31:0];
ysyx_210340_gnrl_dffr_32  if_data_read_dffr (if_data_read_inst, if_data_read_nxt, clock, reset);

//保证中断发生时，inst始终为0，跳转地址为中断入口地址.
//加总线后指令会维持很长时间，中断在这期间发生时并不立即有效，而是等下一个pc改变时（也就是cmt_if_hs==1）中断有效，因此irq_ena_hold为irq_ena的保持信号。
reg irq_ena_hold;
always @( posedge clock) begin
  if (reset) begin
    irq_ena_hold <= 1'b0; end
  else if (irq_ena == 1'b1)begin
    irq_ena_hold <= 1'b1;end
  else if (cmt_if_hs)begin
    irq_ena_hold <= 1'b0;end
  else
    irq_ena_hold <= irq_ena_hold;
end

//中断发生直到下一条指令提交时，跳转地址保持为中断入口地址
wire [31 : 0]  br_addr_r = (irq_ena | irq_ena_hold) ? csr_mtvec_r :br_addr;
assign inst = (irq_ena | (irq_ena_hold & (~cmt_if_hs))) ? 32'h00000013 : inst_o; //irq_ena_hold会在下一个pc改变时有效一个周期，此时应将其无效掉

//当前指令为32'h00000013且从存储器读出的指令不是nop指令（即nop指令手动添加，指令从load指令变为普通指令，inst还未正确读出，需要用到nop指令以防止寄存器的值发生改变）
assign if_addr = (irq_ena | irq_ena_hold) ? br_addr_r : ((inst == 32'h00000013) && (if_data_read_inst != 32'h00000013))? pc :(br_ena ? br_addr_r : pc_next);
assign pc_next_r = ((inst == 32'h00000013) && (if_data_read_nxt != 32'h00000013) && (~(irq_ena | irq_ena_hold)))? pc : pc_next;
assign if_req = `YSYX210340_REQ_READ;

//跳转指令，下一条指令为误取指令，使其为nop指令，且提交无效
wire [31:0] inst_r = ((req == 3'b110) | flush) ? 32'h00000013 :if_data_read_inst; //指令从load指令变为普通指令,下一条inst赋值为32'h00000013 
// fetch an instruction
always @( posedge clock ) begin
  if (reset) begin
        pc <= `YSYX210340_PC_START;
        pc_next <=`YSYX210340_PC_START ;
        inst_o  <= 32'h00000013;
  end else if(handshake_done) begin
      if(br_ena | irq_ena | irq_ena_hold)begin 
        pc <=  br_addr_r;
        pc_next <= br_addr_r+4;
        inst_o <= inst_r;      
      end
      else begin
        pc  <= pc_next_r;
        pc_next <= pc_next_r + 4;  
        inst_o <= inst_r;      
      end 
    end
end

endmodule

module ysyx_210340_if_id(
  input wire           clock,
  input wire           reset,
  input wire           if_id_ena,

  input wire  [31 : 0] if_pc,
  input wire  [31 : 0] if_inst,  

  output reg  [31 : 0] id_pc,
  output reg  [31 : 0] id_inst
);

localparam PC_START_RESET = `YSYX210340_PC_START - 4;

	always @(posedge clock) 
	begin
		if (reset == 1'b1) 
		begin
			id_pc       <= PC_START_RESET;
			id_inst     <= 32'd0;
		end
		else if(if_id_ena == 1'b1)
		begin
			id_pc       <= if_pc;
			id_inst     <= if_inst;         
		end
		else 
		begin
			id_pc       <= id_pc;
			id_inst     <= id_inst;
		end		
	end
endmodule

module ysyx_210340_branch_ctrl(
	input wire [`YSYX210340_REG_BUS] rs1_data,
	input wire [`YSYX210340_REG_BUS] rs2_data,
	input wire [7:0]                 inst_opcode,
  input wire                       irq_ena,	
	input wire                       br_en,
	input wire [31 : 0]              inst_addr,
  input wire [31 : 0]              op1,
  input wire [31 : 0]              op2,	
  input wire [31 : 0]              csr_mtvec_r,
  input wire [31 : 0]              csr_epc_r,
	                      
  output wire                      br_jar_jalr,
  output reg [31 : 0]              br_addr,
	output reg [`YSYX210340_REG_BUS] rd_data,
	output wire                      br_mux
);
	
	reg	 br_fetch;
	wire beq  = (rs1_data == rs2_data) ? 1'b1 :1'b0 ;
	wire bne  = (rs1_data != rs2_data) ? 1'b1 :1'b0 ;
	wire bltu = (rs1_data <  rs2_data) ? 1'b1 :1'b0 ;
	wire bgeu = (rs1_data >= rs2_data) ? 1'b1 :1'b0 ;	
	wire blt  = ($signed(rs1_data) <  $signed(rs2_data)) ? 1'b1 :1'b0 ;	
	wire bge  = ($signed(rs1_data) >= $signed(rs2_data)) ? 1'b1 :1'b0 ;	
	
	always @(*)begin
		case(inst_opcode)
		`YSYX210340_INST_BEQ  :begin  br_fetch=beq ;
		                              br_addr = inst_addr + op2;  
						                      rd_data = `YSYX210340_ZERO_WORD; end
		`YSYX210340_INST_BNE  :begin  br_fetch=bne ;
		                              br_addr = inst_addr + op2;   
						                      rd_data = `YSYX210340_ZERO_WORD; end 
		`YSYX210340_INST_BLT  :begin  br_fetch=blt ;
		                              br_addr = inst_addr + op2;  
						                      rd_data = `YSYX210340_ZERO_WORD; end 
		`YSYX210340_INST_BGE  :begin  br_fetch=bge;
		                              br_addr = inst_addr + op2;  
						                      rd_data = `YSYX210340_ZERO_WORD; end 
		`YSYX210340_INST_BLTU :begin  br_fetch=bltu;
		                              br_addr = inst_addr + op2;  
						                      rd_data = `YSYX210340_ZERO_WORD; end 
		`YSYX210340_INST_BGEU :begin  br_fetch=bgeu;
		                              br_addr = inst_addr + op2;   
						                      rd_data = `YSYX210340_ZERO_WORD; end 
		`YSYX210340_INST_JAL  :begin  br_fetch=1'b1;
		                              rd_data = {{32{1'b0}},{inst_addr + 4}}; 
		                              br_addr = inst_addr + op2;       end
		`YSYX210340_INST_JALR :begin  br_fetch=1'b1;
		                              rd_data = {{32{1'b0}},{inst_addr + 4}}; 
		                              br_addr = op1+ op2;              end
		`YSYX210340_INST_ECALL:begin  br_fetch=1'b1;
		                              br_addr = csr_mtvec_r;      
						                      rd_data = `YSYX210340_ZERO_WORD; end 
    `YSYX210340_INST_MRET :begin  br_fetch=1'b1;	
                                  br_addr = csr_epc_r;        
						                      rd_data = `YSYX210340_ZERO_WORD; end  
		default               :begin  br_fetch=1'b0;
		                              br_addr = `YSYX210340_PC_START;        
						                      rd_data = `YSYX210340_ZERO_WORD; end 
		endcase
	end
	
	assign br_mux      = irq_ena? 1'b1:(br_en? br_fetch:1'b0);
	assign br_jar_jalr = (inst_opcode == `YSYX210340_INST_JAL) | (inst_opcode == `YSYX210340_INST_JALR);	

endmodule

module ysyx_210340_id_stage(
  input  wire                       reset,
  input  wire [31 : 0]              inst,
  input  wire [`YSYX210340_REG_BUS] rs1_data,
  input  wire [`YSYX210340_REG_BUS] rs2_data,
  input  wire                       fetched_r,
  input  wire                       id_ex_ena,
  input  wire                       ex_mem_ena, 
  input  wire                       mem_wb_ena,  
  input  wire [4 : 0]               ex_rd_w_addr,
  input  wire [4 : 0]               mem_rd_w_addr,
  input  wire [4 : 0]               wb_rd_w_addr, 
  input  wire [`YSYX210340_REG_BUS] ex_rd_data,
  input  wire [`YSYX210340_REG_BUS] mem_rd_wb_data,
  input  wire [`YSYX210340_REG_BUS] wb_rd_wb_data, 
  input  wire [31 : 0]              ex_inst,  
  input  wire                       cmt_if_hs,

  output wire                       rs1_r_ena,
  output wire [4 : 0]               rs1_r_addr,
  output wire                       rs2_r_ena,
  output wire [4 : 0]               rs2_r_addr,
  output wire                       rd_w_ena,
  output wire [4 : 0]               rd_w_addr,
  output wire                       mem_w_ena,
  output wire                       mem_r_ena,  
  output wire                       br_en, 
  output wire                       csr_r_ena,
	output wire                       csr_w_ena,  
  output wire                       ecall_ena,
  output wire                       mret_ena,  
  output wire [7 : 0]               inst_opcode,
  output wire [`YSYX210340_REG_BUS] op1,
  output wire [`YSYX210340_REG_BUS] op2,
  output wire                       id_ex_ena_i
);

  wire [6:0]  opcode  = inst[6:0];
  wire [4:0]  rd      = inst[11:7];
  wire [2:0]  func3   = inst[14:12];
  wire [4:0]  rs1     = inst[19:15];
  wire [4:0]  rs2     = inst[24:20];
  wire [6:0]  func7   = inst[31:25];

  wire opcode_1_0_11  = (opcode[1:0] == 2'b11);//基本的都是11
  
  wire opcode_4_2_000 = (opcode[4:2] == 3'b000);
  wire opcode_4_2_001 = (opcode[4:2] == 3'b001);
  wire opcode_4_2_011 = (opcode[4:2] == 3'b011);
  wire opcode_4_2_100 = (opcode[4:2] == 3'b100);
  wire opcode_4_2_101 = (opcode[4:2] == 3'b101);
  wire opcode_4_2_110 = (opcode[4:2] == 3'b110);
  wire opcode_6_5_00  = (opcode[6:5] == 2'b00);
  wire opcode_6_5_01  = (opcode[6:5] == 2'b01);
  wire opcode_6_5_11  = (opcode[6:5] == 2'b11);

  wire func3_000      = (func3 == 3'b000);
  wire func3_001      = (func3 == 3'b001);
  wire func3_010      = (func3 == 3'b010);
  wire func3_011      = (func3 == 3'b011);
  wire func3_100      = (func3 == 3'b100);
  wire func3_101      = (func3 == 3'b101);
  wire func3_110      = (func3 == 3'b110);
  wire func3_111      = (func3 == 3'b111);

  wire func7_0000000 = (func7 == 7'b0000000);
  wire func7_0100000 = (func7 == 7'b0100000); 

  wire inst_rs1_x0   = (rs1 == 5'b00000);
  wire inst_rd_x0    = (rd  == 5'b00000);

  wire inst_op_imm   = opcode_6_5_00 & opcode_4_2_100 & opcode_1_0_11; 
  wire inst_op       = opcode_6_5_01 & opcode_4_2_100 & opcode_1_0_11; 

  wire inst_load     = opcode_6_5_00 & opcode_4_2_000 & opcode_1_0_11; 
  wire inst_store    = opcode_6_5_01 & opcode_4_2_000 & opcode_1_0_11; 
  wire inst_branch   = opcode_6_5_11 & opcode_4_2_000 & opcode_1_0_11; 

  wire inst_iw       = opcode_6_5_00 & opcode_4_2_110 & opcode_1_0_11;  //64I
  wire inst_w        = opcode_6_5_01 & opcode_4_2_110 & opcode_1_0_11;    

  wire inst_addi     = inst_op_imm & func3_000;
  wire inst_slti     = inst_op_imm & func3_010;
  wire inst_sltiu    = inst_op_imm & func3_011;
  wire inst_xori     = inst_op_imm & func3_100;
  wire inst_ori      = inst_op_imm & func3_110;
  wire inst_andi     = inst_op_imm & func3_111;
  wire inst_addiw    = inst_iw & func3_000;

  wire inst_slli     = inst_op_imm & func3_001 & (inst[31:26] == 6'b000000);
  wire inst_srli     = inst_op_imm & func3_101 & (inst[31:26] == 6'b000000);
  wire inst_srai     = inst_op_imm & func3_101 & (inst[31:26] == 6'b010000);

  wire inst_slliw    = inst_iw & func3_001 & (inst[31:26] == 6'b000000);
  wire inst_srliw    = inst_iw & func3_101 & (inst[31:26] == 6'b000000);
  wire inst_sraiw    = inst_iw & func3_101 & (inst[31:26] == 6'b010000);  

  wire inst_add      = inst_op     & func3_000 & func7_0000000;
  wire inst_sub      = inst_op     & func3_000 & func7_0100000;
  wire inst_sll      = inst_op     & func3_001 & func7_0000000;
  wire inst_slt      = inst_op     & func3_010 & func7_0000000;
  wire inst_sltu     = inst_op     & func3_011 & func7_0000000;
  wire inst_xor      = inst_op     & func3_100 & func7_0000000;
  wire inst_srl      = inst_op     & func3_101 & func7_0000000;
  wire inst_sra      = inst_op     & func3_101 & func7_0100000;
  wire inst_or       = inst_op     & func3_110 & func7_0000000;
  wire inst_and      = inst_op     & func3_111 & func7_0000000;

  wire inst_addw     = inst_w     & func3_000 & func7_0000000;
  wire inst_subw     = inst_w     & func3_000 & func7_0100000;
  wire inst_sllw     = inst_w     & func3_001 & func7_0000000;
  wire inst_srlw     = inst_w     & func3_101 & func7_0000000;
  wire inst_sraw     = inst_w     & func3_101 & func7_0100000;

  // Load/Store Instructions
  wire inst_lb       = inst_load   & func3_000;
  wire inst_lh       = inst_load   & func3_001;
  wire inst_lw       = inst_load   & func3_010;
  wire inst_lbu      = inst_load   & func3_100;
  wire inst_lhu      = inst_load   & func3_101;
  wire inst_lwu      = inst_load   & func3_110;
  wire inst_ld       = inst_load   & func3_011;

  wire inst_sb       = inst_store  & func3_000;
  wire inst_sh       = inst_store  & func3_001;
  wire inst_sw       = inst_store  & func3_010;
  wire inst_sd       = inst_store  & func3_011;  

  // Branch Instructions
  wire inst_beq      = inst_branch & func3_000;
  wire inst_bne      = inst_branch & func3_001;
  wire inst_blt      = inst_branch & func3_100;
  wire inst_bge      = inst_branch & func3_101;
  wire inst_bltu     = inst_branch & func3_110;
  wire inst_bgeu     = inst_branch & func3_111;

  // Lui auipc
  wire inst_auipc    = opcode_6_5_00 & opcode_4_2_101 & opcode_1_0_11; 
  wire inst_lui      = opcode_6_5_01 & opcode_4_2_101 & opcode_1_0_11; 

 //Jal Jalr
  wire inst_jal      = opcode_6_5_11 & opcode_4_2_011 & opcode_1_0_11; 
  wire inst_jalr     = opcode_6_5_11 & opcode_4_2_001 & opcode_1_0_11; 

 //CSR  
  wire inst_system   = opcode_6_5_11 & opcode_4_2_100 & opcode_1_0_11; 

  wire inst_csr      = inst_system & (~func3_000);

  wire inst_csrrw    = inst_system & func3_001; 
  wire inst_csrrs    = inst_system & func3_010; 
  wire inst_csrrc    = inst_system & func3_011; 
  wire inst_csrrwi   = inst_system & func3_101; 
  wire inst_csrrsi   = inst_system & func3_110; 
  wire inst_csrrci   = inst_system & func3_111; 

  // System Instructions
  wire inst_ecall    = inst_system & func3_000 & (inst[31:20] == 12'b0000_0000_0000);
  wire inst_ebreak   = inst_system & func3_000 & (inst[31:20] == 12'b0000_0000_0001);
  wire inst_mret     = inst_system & func3_000 & (inst[31:20] == 12'b0011_0000_0010);  

  wire inst_ecall_ebreak_ret = inst_system & func3_000;

  wire inst_nop      = inst_addi & inst_rs1_x0 & inst_rd_x0 & (~(|inst[31:20]));

  assign inst_opcode[7:0] = ({8{ inst_addi  }} & (`YSYX210340_INST_ADDI  ))
                          | ({8{ inst_slti  }} & (`YSYX210340_INST_SLTI  ))
                          | ({8{ inst_sltiu }} & (`YSYX210340_INST_SLTIU ))
                          | ({8{ inst_xori  }} & (`YSYX210340_INST_XORI  ))
                          | ({8{ inst_ori   }} & (`YSYX210340_INST_ORI   ))
                          | ({8{ inst_andi  }} & (`YSYX210340_INST_ANDI  ))
                          | ({8{ inst_slli  }} & (`YSYX210340_INST_SLLI  ))
                          | ({8{ inst_srli  }} & (`YSYX210340_INST_SRLI  ))
                          | ({8{ inst_srai  }} & (`YSYX210340_INST_SRAI  ))
                          | ({8{ inst_add   }} & (`YSYX210340_INST_ADD   ))
                          | ({8{ inst_sub   }} & (`YSYX210340_INST_SUB   ))
                          | ({8{ inst_sll   }} & (`YSYX210340_INST_SLL   ))
                          | ({8{ inst_slt   }} & (`YSYX210340_INST_SLT   ))
                          | ({8{ inst_sltu  }} & (`YSYX210340_INST_SLTU  ))
                          | ({8{ inst_xor   }} & (`YSYX210340_INST_XOR   ))
                          | ({8{ inst_srl   }} & (`YSYX210340_INST_SRL   ))
                          | ({8{ inst_sra   }} & (`YSYX210340_INST_SRA   ))
                          | ({8{ inst_or    }} & (`YSYX210340_INST_OR    ))
                          | ({8{ inst_and   }} & (`YSYX210340_INST_AND   ))
                          | ({8{ inst_lb    }} & (`YSYX210340_INST_LB    ))
                          | ({8{ inst_lh    }} & (`YSYX210340_INST_LH    ))
                          | ({8{ inst_lw    }} & (`YSYX210340_INST_LW    ))
                          | ({8{ inst_lbu   }} & (`YSYX210340_INST_LBU   ))
                          | ({8{ inst_lhu   }} & (`YSYX210340_INST_LHU   ))                          
                          | ({8{ inst_sb    }} & (`YSYX210340_INST_SB    ))
                          | ({8{ inst_sh    }} & (`YSYX210340_INST_SH    ))
                          | ({8{ inst_sw    }} & (`YSYX210340_INST_SW    ))
                          | ({8{ inst_beq   }} & (`YSYX210340_INST_BEQ   ))
                          | ({8{ inst_bne   }} & (`YSYX210340_INST_BNE   ))
                          | ({8{ inst_blt   }} & (`YSYX210340_INST_BLT   ))
                          | ({8{ inst_bge   }} & (`YSYX210340_INST_BGE   ))
                          | ({8{ inst_bltu  }} & (`YSYX210340_INST_BLTU  ))
                          | ({8{ inst_bgeu  }} & (`YSYX210340_INST_BGEU  ))                          
                          | ({8{ inst_auipc }} & (`YSYX210340_INST_AUIPC ))
                          | ({8{ inst_lui   }} & (`YSYX210340_INST_LUI   ))
                          | ({8{ inst_jal   }} & (`YSYX210340_INST_JAL   ))
                          | ({8{ inst_jalr  }} & (`YSYX210340_INST_JALR  ))
                          | ({8{ inst_lwu   }} & (`YSYX210340_INST_LWU   ))
                          | ({8{ inst_ld    }} & (`YSYX210340_INST_LD    ))
                          | ({8{ inst_sd    }} & (`YSYX210340_INST_SD    ))   
                          | ({8{ inst_addiw }} & (`YSYX210340_INST_ADDIW ))   
                          | ({8{ inst_slliw }} & (`YSYX210340_INST_SLLIW ))
                          | ({8{ inst_srliw }} & (`YSYX210340_INST_SRLIW ))
                          | ({8{ inst_sraiw }} & (`YSYX210340_INST_SRAIW ))  
                          | ({8{ inst_addw  }} & (`YSYX210340_INST_ADDW  ))
                          | ({8{ inst_subw  }} & (`YSYX210340_INST_SUBW  ))
                          | ({8{ inst_sllw  }} & (`YSYX210340_INST_SLLW  ))                          
                          | ({8{ inst_srlw  }} & (`YSYX210340_INST_SRLW  ))
                          | ({8{ inst_sraw  }} & (`YSYX210340_INST_SRAW  ))
                          | ({8{ inst_csrrw }} & (`YSYX210340_INST_CSRRW ))
                          | ({8{ inst_csrrs }} & (`YSYX210340_INST_CSRRS ))
                          | ({8{ inst_csrrc }} & (`YSYX210340_INST_CSRRC ))
                          | ({8{ inst_csrrwi}} & (`YSYX210340_INST_CSRRWI))                          
                          | ({8{ inst_csrrsi}} & (`YSYX210340_INST_CSRRSI)) 
                          | ({8{ inst_csrrci}} & (`YSYX210340_INST_CSRRCI)) 
                          | ({8{ inst_ecall }} & (`YSYX210340_INST_ECALL ))                          
                          | ({8{ inst_ebreak}} & (`YSYX210340_INST_EBREAK)) 
                          | ({8{ inst_mret  }} & (`YSYX210340_INST_MRET  ))  
                          | ({8{ inst_nop   }} & (`YSYX210340_INST_NOP   ))                          
                           ;


  // All the RV64IMA need RD register except the
  //   * Branch, Store
  //   * ecall, ebreak, mret
  //load指令握手成功时，允许写回寄存器,中断发生但数据尚未取回，写使能无效
  assign rd_w_ena = inst_load ? fetched_r :(( ~reset )
                  & (~inst_store) 
                  & (~inst_branch)
                  & (~inst_ecall_ebreak_ret))
                  ;  
  assign rd_w_addr  = ( reset == 1'b1 ) ? 0 : ({5{ rd_w_ena }} & (rd)) ;

  // All the RV64IMA need RS1 register except the
  //   * lui
  //   * auipc
  //   * jal
  //   * csrrwi
  //   * csrrsi
  //   * csrrci
  //   * ecall, ebreak, mret
  assign rs1_r_ena  = ( ~reset ) 
                    & (~inst_lui) 
                    & (~inst_auipc) 
                    & (~inst_jal) 
                    & (~inst_csrrwi)
                    & (~inst_csrrsi)
                    & (~inst_csrrci)
                    & (~inst_ecall_ebreak_ret)
                    ;  
  assign rs1_r_addr = ( reset == 1'b1 ) ? 0 : ({5{ rs1_r_ena }} & (rs1)) ;

  // Following RV64IMA instructions need RS2 register
  //   * branch
  //   * store
  //   * op
  assign rs2_r_ena  = (inst_op) 
                    | (inst_store) 
                    | (inst_branch) 
                    | (inst_w)
                    ;
  assign rs2_r_addr = ( reset == 1'b1 ) ? 0 : ({5{ rs2_r_ena }} & (rs2)) ;

  // memory write
  assign mem_w_ena = ( ~reset ) & (inst_store);   

  // memory read
  assign mem_r_ena = ( ~reset ) & (inst_load);  

  // CSR write
  assign csr_w_ena = ( ~reset ) & (inst_csr) & (inst[31:30]!= 2'b11);    

  // CSR read
  assign csr_r_ena = ( ~reset ) & (inst_csr);  

  // ecall mret
  assign ecall_ena = ( ~reset ) & (inst_ecall);
  assign mret_ena  = ( ~reset ) & (inst_mret);
  
  //branch eanble
  assign br_en = ( ~reset ) 
               & ((inst_branch) 
               | (inst_jal) 
               | (inst_jalr)
               | (inst_ecall)
               | (inst_mret))
               ;   

  wire [63:0]  inst_i_imm = { 
                               {52{inst[31]}} 
                              , inst[31:20]
                             };

  wire [63:0]  inst_s_imm = {
                               {52{inst[31]}} 
                              , inst[31:25] 
                              , inst[11:7]
                             };  

  wire [63:0]  inst_b_imm = {
                               {51{inst[31]}} 
                              , inst[31] 
                              , inst[7] 
                              , inst[30:25] 
                              , inst[11:8]
                              , 1'b0
                              };         
  wire [63:0]  inst_u_imm = {
                               {32{inst[31]}}
                              ,inst[31:12]
                              ,12'b0
                              };        
  
  wire [63:0]  inst_j_imm = {
                               {43{inst[31]}} 
                              , inst[31] 
                              , inst[19:12] 
                              , inst[20] 
                              , inst[30:21]
                              , 1'b0
                              };                

  wire [63:0]  inst_csr_zimm = {
                               59'd0
                              ,inst[19:15]
                              };        
  
  // It will select i-type immediate when
  //    * inst_op_imm
  //    * inst_iw
  //    * inst_jalr
  //    * inst_load
  wire inst_imm_sel_i = (inst_op_imm) 
                      | (inst_load) 
                      | (inst_jalr) 
                      | (inst_iw)
                      | (inst_csr) 
                      ;     
  // It will select s-type immediate when
  //    * inst_store
  wire inst_imm_sel_s = inst_store;

  // It will select b-type immediate when
  //    * inst_branch 
  wire inst_imm_sel_b = inst_branch;

  // It will select u-type immediate when
  //    * inst_lui, inst_auipc 
  wire inst_imm_sel_u = inst_auipc | inst_lui;

  // It will select j-type immediate when
  //    * inst_jal
  wire inst_imm_sel_j = inst_jal;

  // It will select CSR immediate when
  //   * csrrwi
  //   * csrrsi
  //   * csrrci
  wire inst_zimm_sel_csr = inst_csrrwi | inst_csrrsi | inst_csrrci;
                   
  wire inst_need_imm = 
                    inst_imm_sel_i
                  | inst_imm_sel_s 
                  | inst_imm_sel_b 
                  | inst_imm_sel_u
                  | inst_imm_sel_j
                  ;
  wire [63:0] inst_imm = 
                    ({64{inst_imm_sel_i}} & inst_i_imm)
                  | ({64{inst_imm_sel_s}} & inst_s_imm)
                  | ({64{inst_imm_sel_b}} & inst_b_imm)
                  | ({64{inst_imm_sel_u}} & inst_u_imm)
                  | ({64{inst_imm_sel_j}} & inst_j_imm)
                  ;

  wire rs1_hit_exe = id_ex_ena  && (rs1_r_addr == ex_rd_w_addr) && (rs1_r_addr != 5'b00000) && cmt_if_hs;
  wire rs1_hit_mem = ex_mem_ena && (rs1_r_addr == mem_rd_w_addr)&& (rs1_r_addr != 5'b00000) && cmt_if_hs;
  wire rs1_hit_wb  = mem_wb_ena && (rs1_r_addr == wb_rd_w_addr) && (rs1_r_addr != 5'b00000) && cmt_if_hs;  
  wire rs2_hit_exe = id_ex_ena  && (rs2_r_addr == ex_rd_w_addr) && (rs2_r_addr != 5'b00000) && cmt_if_hs;
  wire rs2_hit_mem = ex_mem_ena && (rs2_r_addr == mem_rd_w_addr)&& (rs2_r_addr != 5'b00000) && cmt_if_hs;
  wire rs2_hit_wb  = mem_wb_ena && (rs2_r_addr == wb_rd_w_addr) && (rs2_r_addr != 5'b00000) && cmt_if_hs; 

  wire ex_inst_load = (ex_inst[6:0] == 7'b0000011);
  wire ex_inst_ecall_ebreak_ret = ((ex_inst[6:0] == 7'b1110011) && (ex_inst[14:12] == 3'b000));

  wire [`YSYX210340_REG_BUS] rs1_val =  rs1_hit_exe ? ex_rd_data  :
                                    (rs1_hit_mem ? mem_rd_wb_data :
                                    (rs1_hit_wb  ? wb_rd_wb_data  : rs1_data )); 

  wire [`YSYX210340_REG_BUS] rs2_val =  rs2_hit_exe ? ex_rd_data  :
                                    (rs2_hit_mem ? mem_rd_wb_data :
                                    (rs2_hit_wb  ? wb_rd_wb_data  : rs2_data )); 

  assign op1 = ( reset == 1'b1 ) ? 0 : ( inst_zimm_sel_csr == 1'b1 ? inst_csr_zimm : rs1_val);
  assign op2 = ( reset == 1'b1 ) ? 0 : ( inst_need_imm == 1'b1 ? inst_imm: rs2_val);

  assign id_ex_ena_i = ~((rs1_hit_exe | rs2_hit_exe) && (ex_inst_load | ex_inst_ecall_ebreak_ret));  

endmodule

module ysyx_210340_regfile(
  input  wire                        clock,
	input  wire                        reset,
  input  wire                        hs_reg,
	input  wire  [4  : 0]              w_addr,
	input  wire  [`YSYX210340_REG_BUS] w_data,
	input  wire 		                   w_ena,
	input  wire  [4  : 0]              r_addr1,
	input  wire 		                   r_ena1,
	input  wire  [4  : 0]              r_addr2,
	input  wire 		                   r_ena2,

	output reg   [`YSYX210340_REG_BUS] r_data2,	
	output reg   [`YSYX210340_REG_BUS] r_data1
    );

  // 32 registers
	reg [`YSYX210340_REG_BUS] 	regs[0 : 31];
	always @(posedge clock) 
	begin
		if ( reset == 1'b1 ) 
		begin
			regs[ 0] <= `YSYX210340_ZERO_WORD;
			regs[ 1] <= `YSYX210340_ZERO_WORD;
			regs[ 2] <= `YSYX210340_ZERO_WORD;
			regs[ 3] <= `YSYX210340_ZERO_WORD;
			regs[ 4] <= `YSYX210340_ZERO_WORD;
			regs[ 5] <= `YSYX210340_ZERO_WORD;
			regs[ 6] <= `YSYX210340_ZERO_WORD;
			regs[ 7] <= `YSYX210340_ZERO_WORD;
			regs[ 8] <= `YSYX210340_ZERO_WORD;
			regs[ 9] <= `YSYX210340_ZERO_WORD;
			regs[10] <= `YSYX210340_ZERO_WORD;
			regs[11] <= `YSYX210340_ZERO_WORD;
			regs[12] <= `YSYX210340_ZERO_WORD;
			regs[13] <= `YSYX210340_ZERO_WORD;
			regs[14] <= `YSYX210340_ZERO_WORD;
			regs[15] <= `YSYX210340_ZERO_WORD;
			regs[16] <= `YSYX210340_ZERO_WORD;
			regs[17] <= `YSYX210340_ZERO_WORD;
			regs[18] <= `YSYX210340_ZERO_WORD;
			regs[19] <= `YSYX210340_ZERO_WORD;
			regs[20] <= `YSYX210340_ZERO_WORD;
			regs[21] <= `YSYX210340_ZERO_WORD;
			regs[22] <= `YSYX210340_ZERO_WORD;
			regs[23] <= `YSYX210340_ZERO_WORD;
			regs[24] <= `YSYX210340_ZERO_WORD;
			regs[25] <= `YSYX210340_ZERO_WORD;
			regs[26] <= `YSYX210340_ZERO_WORD;
			regs[27] <= `YSYX210340_ZERO_WORD;
			regs[28] <= `YSYX210340_ZERO_WORD;
			regs[29] <= `YSYX210340_ZERO_WORD;
			regs[30] <= `YSYX210340_ZERO_WORD;
			regs[31] <= `YSYX210340_ZERO_WORD;
		end
		else 
		begin
		//握手成功后进行写回
		//	if ((w_ena == 1'b1) && (w_addr != 5'h00))
            if ((w_ena == 1'b1) && (w_addr != 5'h00) && (hs_reg))			
				regs[w_addr] <= w_data;			 
		end
	end

		always @(*) begin
			if (reset == 1'b1)
			 	r_data1 = `YSYX210340_ZERO_WORD;
			else if (r_ena1 == 1'b1)
				r_data1 = regs[r_addr1];
			else
				r_data1 = `YSYX210340_ZERO_WORD;
		end
		
		always @(*) begin
			if (reset == 1'b1)
				r_data2 = `YSYX210340_ZERO_WORD;
			else if (r_ena2 == 1'b1)
				r_data2 = regs[r_addr2];
			else
				r_data2 = `YSYX210340_ZERO_WORD;
		end	
endmodule

module ysyx_210340_mem_load_store(
  input  wire                       reset,
  input  wire [7 : 0]               inst_opcode,
  input  wire [31: 0]               op1,
  input  wire [31: 0]               op2,
  input  wire                       mem_w_ena,
  input  wire                       mem_r_ena,	
  input  wire [`YSYX210340_REG_BUS] mem_w_data,    
   
  output reg  [31: 0]               rd_addr,
  output wire                       ram_valid,
  output wire                       ram_req,
  output reg  [1: 0]                ram_size,
  output reg  [`YSYX210340_REG_BUS] ram_w_data  
);
    //这样写为了保证arbiter.v中req=110为访存操作
    wire ram_w_en = reset ? 0 : mem_w_ena;
    wire ram_r_en = reset ? 0 : mem_r_ena;

    assign ram_valid = ram_r_en | ram_w_en ;
    assign ram_req   = ram_w_en ? `YSYX210340_REQ_WRITE : `YSYX210340_REQ_READ; 

    wire [`YSYX210340_REG_BUS] sb_ram_w_data ;
    wire [`YSYX210340_REG_BUS] sh_ram_w_data ;
    wire [`YSYX210340_REG_BUS] sw_ram_w_data ;
    wire [`YSYX210340_REG_BUS] sd_ram_w_data ;

    wire sb_signal = mem_w_ena & (inst_opcode == `YSYX210340_INST_SB);
    wire sh_signal = mem_w_ena & (inst_opcode == `YSYX210340_INST_SH);
    wire sw_signal = mem_w_ena & (inst_opcode == `YSYX210340_INST_SW);
    wire sd_signal = mem_w_ena & (inst_opcode == `YSYX210340_INST_SD);

    wire lb_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LB);
    wire lh_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LH);
    wire lw_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LW);
    wire lbu_signal= mem_r_ena & (inst_opcode == `YSYX210340_INST_LBU);
    wire lhu_signal= mem_r_ena & (inst_opcode == `YSYX210340_INST_LHU);
    wire lwu_signal= mem_r_ena & (inst_opcode == `YSYX210340_INST_LWU);    
    wire ld_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LD);

    assign sb_ram_w_data = sb_signal ? {56'd0,mem_w_data[7:0]} :`YSYX210340_ZERO_WORD;
    assign sh_ram_w_data = sh_signal ? {48'd0,mem_w_data[15:0]}:`YSYX210340_ZERO_WORD;
    assign sw_ram_w_data = sw_signal ? {32'd0,mem_w_data[31:0]}:`YSYX210340_ZERO_WORD;
    assign sd_ram_w_data = sd_signal ? mem_w_data :`YSYX210340_ZERO_WORD;

    // 写
    always @(*) begin
        if(reset)
            ram_w_data  = `YSYX210340_ZERO_WORD;
        else if (sb_signal)
                ram_w_data  = sb_ram_w_data;
            else if(sh_signal)
                ram_w_data  = sh_ram_w_data;
            else if(sw_signal)
                ram_w_data  = sw_ram_w_data;           
            else if(sd_signal)
                ram_w_data  = sd_ram_w_data;        
            else 
                ram_w_data  = `YSYX210340_ZERO_WORD;
    end

    always @(*) begin
        if(reset) 
            ram_size = 2'b00;
        else if(lb_signal | sb_signal | lbu_signal)
            ram_size = `YSYX210340_SIZE_B;
        else if(lh_signal | sh_signal | lhu_signal)
            ram_size = `YSYX210340_SIZE_H;
        else if(lw_signal | sw_signal | lwu_signal)
            ram_size = `YSYX210340_SIZE_W;          
        else if(ld_signal | sd_signal)
            ram_size = `YSYX210340_SIZE_D;
        else
            ram_size =  2'b00;
    end

always@(*)
begin
  if( reset == 1'b1 )
    begin
      rd_addr = `YSYX210340_PC_START;
    end
  else
  begin
    case( inst_opcode )
           
    `YSYX210340_INST_LB, `YSYX210340_INST_LH, `YSYX210340_INST_LW, `YSYX210340_INST_LBU, `YSYX210340_INST_LHU, `YSYX210340_INST_SB, `YSYX210340_INST_SH, `YSYX210340_INST_SW ,`YSYX210340_INST_LWU ,`YSYX210340_INST_LD ,`YSYX210340_INST_SD:begin 
                       rd_addr = op1 + op2;  end  
 
	  default   :begin rd_addr = `YSYX210340_PC_START;  end
	endcase
  end
end
endmodule

module ysyx_210340_id_ex(
  input wire                       clock,
  input wire                       reset,
  input wire                       id_ex_ena,
  input wire [4 : 0]               id_rd_w_addr,
  input wire                       id_mem_w_ena,
  input wire                       id_mem_r_ena,  
  input wire                       id_csr_r_ena,
  input wire                       id_csr_w_ena,  
  input wire [7 : 0]               id_inst_opcode,
  input wire [`YSYX210340_REG_BUS] id_op1,
  input wire [`YSYX210340_REG_BUS] id_op2,
  input wire [`YSYX210340_REG_BUS] id_r_data2,	  //regfile
  input wire [31: 0]               id_pc,
  input wire [`YSYX210340_REG_BUS] id_br_rd_data,
  input wire                       id_br_jar_jalr,  
  input wire [31: 0]               id_inst,    
  input wire [31: 0]               id_rd_addr,

  output reg [4 : 0]               ex_rd_w_addr,
  output reg                       ex_mem_w_ena,
  output reg                       ex_mem_r_ena,  
  output reg                       ex_csr_r_ena,
  output reg                       ex_csr_w_ena,  
  output reg  [7 : 0]              ex_inst_opcode,
  output wire [`YSYX210340_REG_BUS]ex_op1,
  output wire [`YSYX210340_REG_BUS]ex_op2,
  output reg  [`YSYX210340_REG_BUS]ex_r_data2,	
  output reg  [31: 0]              ex_pc,
  output reg  [`YSYX210340_REG_BUS]ex_br_rd_data,  
  output reg                       ex_br_jar_jalr,
  output wire [31: 0]              ex_inst,
  output reg  [31: 0]              ex_rd_addr     
);

    reg [31: 0] ex_inst_r;
    assign ex_inst  = id_ex_ena ? ex_inst_r : 32'h00000013;

    ysyx_210340_gnrl_dffr  id_op1_dffr (id_op1, ex_op1, clock, reset);
	  ysyx_210340_gnrl_dffr  id_op2_dffr (id_op2, ex_op2, clock, reset);

	always @(posedge clock) 
	begin
		if (reset == 1'b1) 
		begin
      ex_rd_w_addr    <= 5'd0;
      ex_mem_w_ena    <= 1'b0;
      ex_mem_r_ena    <= 1'b0; 
      ex_csr_r_ena    <= 1'b0;
      ex_csr_w_ena    <= 1'b0; 
      ex_inst_opcode  <= 8'd0 ;			
      ex_r_data2      <= `YSYX210340_ZERO_WORD;
      ex_pc           <= `YSYX210340_PC_START;   
			ex_br_rd_data   <= `YSYX210340_ZERO_WORD; 
			ex_br_jar_jalr  <= 1'd0 ; 
      ex_inst_r       <= 32'd0;  
      ex_rd_addr      <= `YSYX210340_PC_START;                        
		end 
		else if(id_ex_ena == 1'b1)
		begin
      ex_rd_w_addr    <= id_rd_w_addr;
      ex_mem_w_ena    <= id_mem_w_ena;
      ex_mem_r_ena    <= id_mem_r_ena; 
      ex_csr_r_ena    <= id_csr_r_ena;
      ex_csr_w_ena    <= id_csr_w_ena; 
      ex_inst_opcode  <= id_inst_opcode;
      ex_r_data2      <= id_r_data2;
      ex_pc           <= id_pc;       
			ex_br_rd_data   <= id_br_rd_data; 
			ex_br_jar_jalr  <= id_br_jar_jalr;     
      ex_inst_r       <= id_inst; 
      ex_rd_addr      <= id_rd_addr;                                  
		end
	end
endmodule

module ysyx_210340_exe_stage(
  input wire reset,
  input wire [31: 0]               inst_addr,
  input wire [7 : 0]               inst_opcode,
  input wire [`YSYX210340_REG_BUS] op1,
  input wire [`YSYX210340_REG_BUS] op2,

  output reg [`YSYX210340_REG_BUS] rd_data
);

wire [4:0] op2_4_0;
wire [5:0] op2_5_0;
wire       op1_63;
assign     op2_5_0 = op2[5:0];//取操作数2的低6位
assign     op2_4_0 = op2[4:0];//取操作数2的低5位
assign     op1_63  = op1[63]; //取操作数1的最高位

wire [`YSYX210340_REG_BUS ] rd_add_addi;
wire [`YSYX210340_REG_BUS ] rd_addw_addiw;
wire [`YSYX210340_REG_BUS ] rd_sub;
wire [`YSYX210340_REG_BUS ] rd_subw;
wire [`YSYX210340_REG_BUS ] rd_slt_slti;
wire [`YSYX210340_REG_BUS ] rd_sltu_sltiu;
wire [`YSYX210340_REG_BUS ] rd_xor_xori;
wire [`YSYX210340_REG_BUS ] rd_or_ori;
wire [`YSYX210340_REG_BUS ] rd_and_andi;
wire [`YSYX210340_REG_BUS ] rd_sll;
wire [`YSYX210340_REG_BUS ] rd_srl;
wire [`YSYX210340_REG_BUS ] rd_sra;
wire [`YSYX210340_REG_BUS ] rd_sllw_slliw;
wire [`YSYX210340_REG_BUS ] rd_srlw_srliw;
wire [`YSYX210340_REG_BUS ] rd_sraw_sraiw;
wire [`YSYX210340_REG_BUS ] sllw_slliw;
wire [`YSYX210340_REG_BUS ] rd_slli;
wire [`YSYX210340_REG_BUS ] rd_srli;
wire [`YSYX210340_REG_BUS ] rd_srai;

assign rd_add_addi         = op1 + op2;
assign rd_addw_addiw       = {{32{rd_add_addi[31]}},rd_add_addi[31:0]};
assign rd_sub              = op1 - op2;
assign rd_subw             = {{32{rd_sub[31]}},rd_sub[31:0]};
assign rd_slt_slti[63:1]   =63'd0;
assign rd_slt_slti[0]      = ($signed(op1) < $signed(op2))?1'b1:1'b0 ;	
assign rd_sltu_sltiu[63:1] = 63'd0;
assign rd_sltu_sltiu[0]    = ( op1 < op2) ? 1'b1:1'b0;
assign rd_xor_xori         = op1 ^ op2;   
assign rd_or_ori           = op1 | op2;                                           
assign rd_and_andi         = op1 & op2;  
assign rd_sll              = op1 << op2_5_0;  
assign rd_srl              = op1 >> op2_5_0;  
assign rd_sra              = ({ {63{op1_63}}, 1'b0 } << (~op2_5_0)) | ( op1 >> op2_5_0 ) ; 
assign sllw_slliw          = op1 << op2_4_0;
assign rd_sllw_slliw       = {{32{sllw_slliw[31]}},sllw_slliw[31:0]};  
wire   [31:0] srlw_srliw   = op1[31:0] >> op2_4_0;   
assign rd_srlw_srliw       = {{32{srlw_srliw[31]}},srlw_srliw[31:0]};   
wire   [31:0] sraw_sraiw   = ({ {31{op1[31]}}, 1'b0 } << (~op2_4_0)) | ( op1[31:0]  >> op2_4_0 ) ;  
assign rd_sraw_sraiw       = {{32{sraw_sraiw[31]}},sraw_sraiw[31:0]};                                 
assign rd_slli             = op1 << op2_5_0;  
assign rd_srli             = op1 >> op2_5_0;  
assign rd_srai             = ({ {63{op1_63}}, 1'b0 } << (~op2_5_0)) | ( op1 >> op2_5_0 ) ;

always@(*)
begin
  if( reset == 1'b1 )
    begin
      rd_data = `YSYX210340_ZERO_WORD;
    end
  else
  begin
    case( inst_opcode )
	  `YSYX210340_INST_ADDI, `YSYX210340_INST_ADD   : begin rd_data = rd_add_addi;               end
    `YSYX210340_INST_ADDW, `YSYX210340_INST_ADDIW : begin rd_data = rd_addw_addiw;             end         
    `YSYX210340_INST_SLT,  `YSYX210340_INST_SLTI  : begin rd_data = rd_slt_slti;               end
    `YSYX210340_INST_SLTU, `YSYX210340_INST_SLTIU : begin  rd_data = rd_sltu_sltiu;            end  
    `YSYX210340_INST_XOR,  `YSYX210340_INST_XORI  : begin rd_data = rd_xor_xori;               end
    `YSYX210340_INST_OR,   `YSYX210340_INST_ORI   : begin  rd_data = rd_or_ori;                end
    `YSYX210340_INST_AND , `YSYX210340_INST_ANDI  : begin  rd_data = rd_and_andi;              end    
    `YSYX210340_INST_SLLI                         : begin rd_data = rd_slli;                   end  
    `YSYX210340_INST_SRLI                         : begin rd_data = rd_srli;                   end      
    `YSYX210340_INST_SRAI                         : begin rd_data = rd_srai;                   end   
    `YSYX210340_INST_SLLW, `YSYX210340_INST_SLLIW : begin rd_data = rd_sllw_slliw;             end  
    `YSYX210340_INST_SRLW, `YSYX210340_INST_SRLIW : begin rd_data = rd_srlw_srliw;             end      
    `YSYX210340_INST_SRAW, `YSYX210340_INST_SRAIW : begin rd_data = rd_sraw_sraiw ;            end                            
    `YSYX210340_INST_SUB                          : begin rd_data = rd_sub;                    end  
    `YSYX210340_INST_SUBW                         : begin rd_data = rd_subw;                   end                             
    `YSYX210340_INST_SLL                          : begin rd_data = rd_sll;                    end                                                          
    `YSYX210340_INST_SRL                          : begin rd_data = rd_srl;                    end      
    `YSYX210340_INST_SRA                          : begin rd_data = rd_sra;                    end                
    `YSYX210340_INST_AUIPC                        : begin rd_data = {32'b0,{inst_addr}} + op2; end  
    `YSYX210340_INST_LUI                          : begin rd_data = op2;                       end               
	  default                                       : begin rd_data = `YSYX210340_ZERO_WORD;     end
	endcase
  end
end
endmodule

module ysyx_210340_Mux2(
	input wire sel0,	
	input wire [`YSYX210340_REG_BUS] data_0,
	input wire [`YSYX210340_REG_BUS] data_1,	

	output wire [`YSYX210340_REG_BUS] data_out
);

assign data_out = sel0 ? data_0 : data_1;

endmodule

module ysyx_210340_ex_mem(
  input wire                       clock,
  input wire                       reset,
  input wire                       ex_mem_ena,
 
  input wire [`YSYX210340_REG_BUS] ex_rd_data,
  input wire [31:0]                ex_rd_addr,  
  input wire [`YSYX210340_REG_BUS] ex_r_data2,
  input wire                       ex_mem_w_ena,
  input wire                       ex_mem_r_ena,
  input wire                       ex_csr_r_ena,
  input wire                       ex_csr_w_ena,
  input wire [7:0]                 ex_inst_opcode,  
  input wire [`YSYX210340_REG_BUS] ex_op1,   
  input wire [`YSYX210340_REG_BUS] ex_op2, 
  input wire [4 : 0]               ex_rd_w_addr,      
 
  output reg [`YSYX210340_REG_BUS] mem_rd_data,
  output reg [31:0]                mem_rd_addr,
  output reg [`YSYX210340_REG_BUS] mem_r_data2,
  output reg                       mem_mem_w_ena,
  output reg                       mem_mem_r_ena,
  output reg                       mem_csr_r_ena,  
  output reg                       mem_csr_w_ena, 
  output reg [7:0]                 mem_inst_opcode,
  output reg [`YSYX210340_REG_BUS] mem_op1,   
  output reg [`YSYX210340_REG_BUS] mem_op2, 
  output reg [4 : 0]               mem_rd_w_addr     
);  

	always @(posedge clock) 
	begin
		if (reset == 1'b1) 
		begin
         mem_rd_data     <= `YSYX210340_ZERO_WORD;
         mem_rd_addr     <= `YSYX210340_PC_START;   
         mem_r_data2     <= `YSYX210340_ZERO_WORD;   
         mem_mem_w_ena   <= 1'b0;     
         mem_mem_r_ena   <= 1'b0;   
         mem_csr_r_ena   <= 1'b0;   
         mem_csr_w_ena   <= 1'b0;   
         mem_inst_opcode <= 8'd0;  
         mem_op1         <= `YSYX210340_ZERO_WORD;            
         mem_op2         <= `YSYX210340_ZERO_WORD;    
         mem_rd_w_addr   <= 5'd0;                                                                                           
		end
		else if(ex_mem_ena == 1'b1)
		begin
         mem_rd_data     <= ex_rd_data;
         mem_rd_addr     <= ex_rd_addr; 
         mem_r_data2     <= ex_r_data2;      
         mem_mem_w_ena   <= ex_mem_w_ena;   
         mem_mem_r_ena   <= ex_mem_r_ena; 
         mem_csr_r_ena   <= ex_csr_r_ena ;    
         mem_csr_w_ena   <= ex_csr_w_ena ;    
         mem_inst_opcode <= ex_inst_opcode;   
         mem_op1         <= ex_op1;           
         mem_op2         <= ex_op2;   
         mem_rd_w_addr   <= ex_rd_w_addr;                                                                                                             
		end
	end
endmodule

module ysyx_210340_mem_stage(
	input  wire                       reset,
  input  wire [7:0]                 inst_opcode,
	input  wire                       mem_r_ena,	
	input  wire [`YSYX210340_REG_BUS] ram_r_data,

  output reg	[`YSYX210340_REG_BUS] mem_r_data
    );

    wire [`YSYX210340_REG_BUS] lb_ram_r_data ;
    wire [`YSYX210340_REG_BUS] lh_ram_r_data ;
    wire [`YSYX210340_REG_BUS] lw_ram_r_data ;
    wire [`YSYX210340_REG_BUS] ld_ram_r_data ;
    wire [`YSYX210340_REG_BUS] lbu_ram_r_data ;
    wire [`YSYX210340_REG_BUS] lhu_ram_r_data ;
    wire [`YSYX210340_REG_BUS] lwu_ram_r_data ;
  
    wire lb_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LB);
    wire lh_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LH);
    wire lw_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LW);
    wire lbu_signal= mem_r_ena & (inst_opcode == `YSYX210340_INST_LBU);
    wire lhu_signal= mem_r_ena & (inst_opcode == `YSYX210340_INST_LHU);
    wire lwu_signal= mem_r_ena & (inst_opcode == `YSYX210340_INST_LWU);    
    wire ld_signal = mem_r_ena & (inst_opcode == `YSYX210340_INST_LD);

   // 读
    always @(*) begin
        if(reset) 
            mem_r_data = `YSYX210340_ZERO_WORD;
        else if(lb_signal)
                mem_r_data = lb_ram_r_data;
        else if(lh_signal)
                mem_r_data = lh_ram_r_data;
        else if(lw_signal)
                mem_r_data = lw_ram_r_data;
        else if(lbu_signal)
                mem_r_data = lbu_ram_r_data;
        else if(lhu_signal)
                mem_r_data = lhu_ram_r_data;
        else if(lwu_signal)
                mem_r_data = lwu_ram_r_data;            
        else if(ld_signal)
                mem_r_data = ld_ram_r_data;
        else
                mem_r_data = `YSYX210340_ZERO_WORD;
    end

    assign lb_ram_r_data  = lb_signal  ? {{56{ram_r_data[ 7]}},ram_r_data[ 7: 0]} : `YSYX210340_ZERO_WORD;
    assign lh_ram_r_data  = lh_signal  ? {{48{ram_r_data[15]}},ram_r_data[15: 0]} : `YSYX210340_ZERO_WORD;
    assign lw_ram_r_data  = lw_signal  ? {{32{ram_r_data[31]}},ram_r_data[31: 0]} : `YSYX210340_ZERO_WORD;
    assign lbu_ram_r_data = lbu_signal ? {56'd0,ram_r_data[ 7: 0]} : `YSYX210340_ZERO_WORD;
    assign lhu_ram_r_data = lhu_signal ? {48'd0,ram_r_data[15: 0]} : `YSYX210340_ZERO_WORD;
    assign lwu_ram_r_data = lwu_signal ? {32'd0,ram_r_data[31: 0]} : `YSYX210340_ZERO_WORD;          
    assign ld_ram_r_data  = ld_signal  ? ram_r_data : `YSYX210340_ZERO_WORD; 

endmodule

module ysyx_210340_csr_exe(
  input wire                       reset,
  input wire [7 : 0]               inst_opcode,
  input wire [`YSYX210340_REG_BUS] op1,
  input wire [`YSYX210340_REG_BUS] csr_in,   

  output reg [`YSYX210340_REG_BUS] rd_csr,  
  output reg [`YSYX210340_REG_BUS] rd_data
);

always@(*)
begin
  if( reset == 1'b1 )
    begin
      rd_data = `YSYX210340_ZERO_WORD;
      rd_csr  =`YSYX210340_ZERO_WORD;
    end
  else
  begin
    case( inst_opcode )
    `YSYX210340_INST_CSRRW: begin rd_csr = op1;
                                  rd_data = csr_in; end  
    `YSYX210340_INST_CSRRS: begin rd_csr = op1 | csr_in;
                                  rd_data = csr_in; end 
    `YSYX210340_INST_CSRRC: begin rd_csr = (~op1) & csr_in;
                                  rd_data = csr_in; end  
    `YSYX210340_INST_CSRRWI:begin rd_csr = op1;
                                  rd_data = csr_in; end   
    `YSYX210340_INST_CSRRSI:begin rd_csr = op1 | csr_in;
                                  rd_data = csr_in; end   
    `YSYX210340_INST_CSRRCI:begin rd_csr = (~op1) & csr_in;
                                  rd_data = csr_in; end                  
	  default                :begin rd_data = `YSYX210340_ZERO_WORD;
                                  rd_csr  =`YSYX210340_ZERO_WORD; end
	endcase
  end
end
endmodule

module ysyx_210340_csr(
  input  wire                        clock,
  input  wire                        reset, 
  input  wire                        csr_wr_en,
  input  wire                        csr_rd_en,
  input  wire [`YSYX210340_REG_BUS]  csr_addr,
  input  wire [`YSYX210340_REG_BUS]  wbck_csr_dat,
  input  wire [31:0]                 cmt_epc,
  input  wire                        ecall_i,
  input  wire                        tmr_irq_r,
  input  wire                        cmt_mret_ena,
  input  wire                        cmt_if_hs,

  output wire  [`YSYX210340_REG_BUS] read_csr_dat, 
  output wire                        status_mie_o,
  output wire                        mie_mtie_r,
  output wire  [31:0]                csr_epc_r,
  output wire  [31:0]                csr_mtvec_r
  );

wire cmt_mret_ena_r = (cmt_mret_ena & cmt_if_hs);
wire irq_src_i      = tmr_irq_r; 
wire exp_src_i      = ecall_i;
wire csr_ena        = csr_wr_en | csr_rd_en;
wire [11:0] csr_idx;
assign csr_idx      = csr_addr[11:0];
wire wbck_csr_wen   = csr_wr_en & csr_ena;
wire read_csr_ena   = csr_rd_en & csr_ena;

//mstatus
wire cmt_status_ena = (exp_src_i | irq_src_i) ? 1'b1 : 1'b0;
wire sel_mstatus    = (csr_idx == 12'h300);
wire rd_mstatus     = sel_mstatus & read_csr_ena;
wire rd_mstatus_r   = sel_mstatus & read_csr_ena & cmt_if_hs;
wire wr_mstatus     = sel_mstatus & csr_wr_en  & cmt_if_hs;

// Implement MPIE field
wire status_mpie_r;
wire status_mie_r;
wire status_mpie_ena  = (wr_mstatus & wbck_csr_wen) |
                        cmt_mret_ena_r |
                        cmt_status_ena;
wire status_mpie_nxt  = cmt_status_ena ? status_mie_r : 
                        cmt_mret_ena_r  ? 1'b1 :
                        (wr_mstatus & wbck_csr_wen) ? wbck_csr_dat[7] : // MPIE is in field 7 of mstatus
                        status_mpie_r; 
ysyx_210340_gnrl_dfflr_1  status_mpie_dfflr (status_mpie_ena, status_mpie_nxt, status_mpie_r, clock, reset);

// Implement MIE field
wire status_mie_ena   = status_mpie_ena; 
wire status_mie_nxt   = cmt_status_ena ? 1'b0 :
                       cmt_mret_ena_r ? status_mpie_r :
                       (wr_mstatus & wbck_csr_wen) ? wbck_csr_dat[3] : 
                       status_mie_r; 
ysyx_210340_gnrl_dfflr_1  status_mie_dfflr (status_mie_ena, status_mie_nxt, status_mie_r, clock, reset);
assign status_mie_o       = status_mie_r;
// FS
wire [1:0] status_fs_r;
wire status_fs_ena        = (wr_mstatus & wbck_csr_wen) ;
wire [1:0] status_fs_nxt  = status_fs_ena ? wbck_csr_dat[14:13] : 2'b00; 
ysyx_210340_gnrl_dfflr_2  status_fs_dfflr (status_fs_ena, status_fs_nxt, status_fs_r, clock, reset);

// XS
wire [1:0] status_xs_r;
wire status_xs_ena        = (wr_mstatus & wbck_csr_wen) ;
wire [1:0] status_xs_nxt  = status_xs_ena ? wbck_csr_dat[16:15] : 2'b00; 
ysyx_210340_gnrl_dfflr_2  status_xs_dfflr (status_xs_ena, status_xs_nxt, status_xs_r, clock, reset);
wire status_sd_r          = (status_fs_r == 2'b11) | (status_xs_r == 2'b11);

//MPP
wire [1:0]status_mpp_r;
wire status_mpp_ena       = (wr_mstatus & wbck_csr_wen & cmt_if_hs);
wire [1:0]status_mpp_nxt  = status_mpp_ena ? wbck_csr_dat[12:11] :
                            cmt_mret_ena_r ? 2'b00 :
                            cmt_status_ena ? 2'b11 :
                            status_mpp_r;
ysyx_210340_gnrl_dffr_2  status_mpp_dffr (status_mpp_nxt, status_mpp_r, clock, reset);

wire [`YSYX210340_REG_BUS] status_r;
assign status_r[63]    = status_sd_r;
assign status_r[62:36] = 27'b0;
assign status_r[35:34] = 2'b0;
assign status_r[33:32] = 2'b0;
assign status_r[31:23] = 9'b0; 
assign status_r[22:17] = 6'b0;             
assign status_r[16:15] = status_xs_r;                    
assign status_r[14:13] = status_fs_r;                  
assign status_r[12:11] = status_mpp_r;          
assign status_r[10:9]  = 2'b0; 
assign status_r[8]     = 1'b0;           
assign status_r[7]     = status_mpie_r;  // MPIE
assign status_r[6]     = 1'b0; 
assign status_r[5]     = 1'b0;              
assign status_r[4]     = 1'b0;            
assign status_r[3]     = status_mie_r;   // MIE
assign status_r[2]     = 1'b0; 
assign status_r[1]     = 1'b0;            
assign status_r[0]     = 1'b0;          
wire [`YSYX210340_REG_BUS] csr_mstatus = status_r;

//MIE
wire sel_mie           = (csr_idx == 12'h304);
wire rd_mie_r          = sel_mie & read_csr_ena & cmt_if_hs;
wire rd_mie            = sel_mie & read_csr_ena ;
wire wr_mie            = sel_mie & csr_wr_en ;
wire mie_ena           = wr_mie & wbck_csr_wen & cmt_if_hs; //仅有效一个周期
wire [`YSYX210340_REG_BUS] mie_r;
wire [`YSYX210340_REG_BUS] mie_nxt;
assign mie_nxt[63:12]  = 52'd0;
assign mie_nxt[11]     = 1'b0;
assign mie_nxt[10:8]   = 3'b0;
assign mie_nxt[ 7]     = wbck_csr_dat[ 7];//MTIE
assign mie_nxt[6:4]    = 3'b0;
assign mie_nxt[ 3]     = 1'b0;
assign mie_nxt[2:0]    = 3'b0;
ysyx_210340_gnrl_dfflr mie_dfflr (mie_ena, mie_nxt, mie_r, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mie = mie_r;
assign mie_mtie_r      = csr_mie[ 7];
 
wire sel_mip           = (csr_idx == 12'h344);
wire rd_mip            = sel_mip & read_csr_ena;
wire rd_mip_r          = sel_mip & read_csr_ena & cmt_if_hs;

//mip强制为0
wire ip_o = 1'b0;
wire mip_nxt;
ysyx_210340_gnrl_dffr_1  mip_dffr (ip_o, mip_nxt, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mip = {64{mip_nxt}};

//mtvec 
wire sel_mtvec         = (csr_idx == 12'h305);
wire rd_mtvec          = read_csr_ena & sel_mtvec;
wire rd_mtvec_r        = read_csr_ena & sel_mtvec & cmt_if_hs;
wire wr_mtvec          = sel_mtvec & csr_wr_en;
wire mtvec_ena         = (wr_mtvec & wbck_csr_wen);
wire [`YSYX210340_REG_BUS] mtvec_r;
wire [`YSYX210340_REG_BUS] mtvec_nxt = {wbck_csr_dat[63:2], 2'b00};
ysyx_210340_gnrl_dfflr  mtvec_dfflr (mtvec_ena, mtvec_nxt, mtvec_r, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mtvec = mtvec_r;
assign csr_mtvec_r     = csr_mtvec[31:0];

//mcycle
wire sel_mcycle        = (csr_idx == 12'hb00);
wire rd_mcycle         = csr_rd_en & sel_mcycle   ;
wire rd_mcycle_r       = csr_rd_en & sel_mcycle & cmt_if_hs;
wire wr_mcycle         = csr_wr_en & sel_mcycle   ;
wire mcycle_wr_ena     = (wr_mcycle    & wbck_csr_wen);
wire [`YSYX210340_REG_BUS] mcycle_r ;
wire [`YSYX210340_REG_BUS] mcycle_nxt    = mcycle_wr_ena ? wbck_csr_dat : (mcycle_r + 1'b1);
ysyx_210340_gnrl_dffr  mcycle_dffr ( mcycle_nxt, mcycle_r, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mcycle    = mcycle_r;

// mepc 
wire cmt_epc_ena       = (irq_src_i | exp_src_i) ? 1'b1 : 1'b0;
wire sel_mepc          = (csr_idx == 12'h341);
wire rd_mepc           = sel_mepc & read_csr_ena;
wire rd_mepc_r         = sel_mepc & read_csr_ena & cmt_if_hs;
wire wr_mepc           = sel_mepc & csr_wr_en;
wire epc_ena           = (wr_mepc & wbck_csr_wen) | cmt_epc_ena;
wire [31:0] epc_r;
wire [31:0] epc_nxt;
assign epc_nxt[31:1]   = cmt_epc_ena ? cmt_epc[31:1] : wbck_csr_dat[31:1];
assign epc_nxt[0]      = 1'b0;
ysyx_210340_gnrl_dfflr_32  epc_dfflr (epc_ena, epc_nxt, epc_r, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mepc;
assign csr_mepc        = {{32{1'b0}},epc_r};
assign csr_epc_r       = csr_mepc[31:0];

//mcause 
wire [`YSYX210340_REG_BUS] exp_cause;
wire [`YSYX210340_REG_BUS] irq_cause;
assign exp_cause[63:5] = 59'b0;
assign exp_cause[4:0]  = 
      (ecall_i) ? 5'd11 
    : 5'h1F;
assign irq_cause[63]   = 1'b1;
assign irq_cause[62:4] = 59'b0;
assign irq_cause[3:0]  = 
      (irq_src_i) ? 4'd7 
    : 4'b0;
wire cmt_cause_ena     = (irq_src_i | exp_src_i) ? 1'b1 : 1'b0;
wire sel_mcause        = (csr_idx == 12'h342);
wire rd_mcause         = sel_mcause & read_csr_ena;
wire rd_mcause_r       = sel_mcause & read_csr_ena & cmt_if_hs;
wire wr_mcause         = sel_mcause & csr_wr_en;
wire cause_ena         = (wr_mcause & wbck_csr_wen) | cmt_cause_ena;
wire [`YSYX210340_REG_BUS] cause_r;
wire [`YSYX210340_REG_BUS] cause_nxt;
wire [`YSYX210340_REG_BUS] cause_exp_nxt;
wire [`YSYX210340_REG_BUS] cause_irq_nxt;
assign cause_exp_nxt[63]   = exp_src_i ? exp_cause[63] : wbck_csr_dat[63];
assign cause_exp_nxt[62:5] = 58'b0;
assign cause_exp_nxt[4:0]  = exp_src_i ? exp_cause[4:0] : wbck_csr_dat[4:0];
assign cause_irq_nxt[63]   = irq_src_i ? irq_cause[63] : wbck_csr_dat[63];
assign cause_irq_nxt[62:4] = 59'b0;
assign cause_irq_nxt[3:0]  = irq_src_i ? irq_cause[3:0] : wbck_csr_dat[3:0];
assign cause_nxt           = irq_src_i ? cause_irq_nxt : cause_exp_nxt;
ysyx_210340_gnrl_dfflr  cause_dfflr (cause_ena, cause_nxt, cause_r, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mcause = cause_r;

//mscratch 
wire sel_mscratch          = (csr_idx == 12'h340);
wire rd_mscratch           = sel_mscratch & read_csr_ena;
wire rd_mscratch_r         = sel_mscratch & read_csr_ena & cmt_if_hs;
wire wr_mscratch           = sel_mscratch & csr_wr_en;
wire mscratch_ena          = (wr_mscratch & wbck_csr_wen);
wire [63:0] mscratch_r;
wire [63:0] mscratch_nxt   = wbck_csr_dat;
ysyx_210340_gnrl_dfflr  mscratch_dfflr (mscratch_ena, mscratch_nxt, mscratch_r, clock, reset);
wire [63:0] csr_mscratch   = mscratch_r;

//minstret 
wire sel_minstret          = (csr_idx == 12'hB02);
wire rd_minstret           = read_csr_ena & sel_minstret ;
wire rd_minstret_r         = read_csr_ena & sel_minstret & cmt_if_hs;
wire wr_minstret           = csr_wr_en & sel_minstret ;
wire minstret_wr_ena       = (wr_minstret  & wbck_csr_wen);
wire [63:0] minstret_r ;
wire [63:0] minstret_nxt   = minstret_wr_ena  ? wbck_csr_dat : (minstret_r  + 1'b1);
ysyx_210340_gnrl_dfflr  minstret_dfflr (minstret_wr_ena, minstret_nxt, minstret_r , clock, reset);
wire [63:0] csr_minstret   = minstret_r;

//mtval
wire sel_mtval             = (csr_idx == 12'h343);
wire rd_mtval              = read_csr_ena & sel_mtval;
wire rd_mtval_r            = read_csr_ena & sel_mtval & cmt_if_hs;
wire wr_mtval              = sel_mtval & csr_wr_en;
wire mtval_ena             = (wr_mtval & wbck_csr_wen);
wire [`YSYX210340_REG_BUS] mtval_r;
wire [`YSYX210340_REG_BUS] mtval_nxt = wbck_csr_dat;
ysyx_210340_gnrl_dfflr  mtval_dfflr (mtval_ena, mtval_nxt, mtval_r, clock, reset);
wire [`YSYX210340_REG_BUS] csr_mtval = mtval_r;

wire [63:0] read_csr_dat_mstatus;
wire [63:0] read_csr_dat_mie;
wire [63:0] read_csr_dat_mtvec;
wire [63:0] read_csr_dat_mepc;
wire [63:0] read_csr_dat_mcause;
wire [63:0] read_csr_dat_mip;
wire [63:0] read_csr_dat_mscratch;
wire [63:0] read_csr_dat_minstret;
wire [63:0] read_csr_dat_mtval;
wire [63:0] read_csr_dat_mcycle;

wire [63:0] read_csr_dat_mstatus_o;
wire [63:0] read_csr_dat_mtvec_o;
wire [63:0] read_csr_dat_mepc_o;
wire [63:0] read_csr_dat_mcause_o;
wire [63:0] read_csr_dat_mip_o;
wire [63:0] read_csr_dat_mscratch_o;
wire [63:0] read_csr_dat_minstret_o;
wire [63:0] read_csr_dat_mtval_o;
wire [63:0] read_csr_dat_mcycle_o;

ysyx_210340_gnrl_dffr  rd_mstatus_dfflr (read_csr_dat_mstatus, read_csr_dat_mstatus_o , clock, reset);
ysyx_210340_gnrl_dfflr  rd_mie_dfflr    (rd_mie_r, csr_mie, read_csr_dat_mie, clock, reset);
ysyx_210340_gnrl_dffr  rd_mtvec_dfflr   (read_csr_dat_mtvec,read_csr_dat_mtvec_o, clock, reset);
ysyx_210340_gnrl_dffr  rd_mepc_dfflr    (read_csr_dat_mepc,read_csr_dat_mepc_o, clock, reset);
ysyx_210340_gnrl_dffr  rd_mcause_dfflr  (read_csr_dat_mcause,read_csr_dat_mcause_o, clock, reset);
ysyx_210340_gnrl_dffr  rd_mip_dfflr     (read_csr_dat_mip,read_csr_dat_mip_o, clock, reset);
ysyx_210340_gnrl_dffr  rd_mscratch_dfflr(read_csr_dat_mscratch,read_csr_dat_mscratch_o, clock, reset);
ysyx_210340_gnrl_dffr  rd_minstret_dfflr(read_csr_dat_minstret,read_csr_dat_minstret_o, clock, reset);
ysyx_210340_gnrl_dffr  rd_mtval_dfflr   (read_csr_dat_mtval, read_csr_dat_mtval_o,clock, reset);
ysyx_210340_gnrl_dffr  rd_mcycle_dfflr  (read_csr_dat_mcycle, read_csr_dat_mcycle_o,clock, reset);

assign read_csr_dat_mstatus  = rd_mstatus_r ? csr_mstatus :read_csr_dat_mstatus_o;
assign read_csr_dat_mtvec    = rd_mtvec_r ?  csr_mtvec :read_csr_dat_mtvec_o;
assign read_csr_dat_mepc     = rd_mepc_r ? csr_mepc :read_csr_dat_mepc_o;
assign read_csr_dat_mcause   = rd_mcause_r ? csr_mcause :read_csr_dat_mcause_o;
assign read_csr_dat_mip      = rd_mip_r ? csr_mip :read_csr_dat_mip_o;
assign read_csr_dat_mscratch = rd_mscratch_r ? csr_mscratch :read_csr_dat_mscratch_o;
assign read_csr_dat_minstret = rd_minstret_r ? csr_minstret :read_csr_dat_minstret_o;
assign read_csr_dat_mtval    = rd_mtval_r ? csr_mtval :read_csr_dat_mtval_o;
assign read_csr_dat_mcycle   = rd_mcycle_r ? csr_mcycle :read_csr_dat_mcycle_o;

//Read path
assign read_csr_dat = 64'b0 
               | ({64{rd_mstatus  }} & read_csr_dat_mstatus  )
               | ({64{rd_mie      }} & read_csr_dat_mie      )
               | ({64{rd_mtvec    }} & read_csr_dat_mtvec    )
               | ({64{rd_mepc     }} & read_csr_dat_mepc     )
               | ({64{rd_mcause   }} & read_csr_dat_mcause   )
               | ({64{rd_mip      }} & read_csr_dat_mip      )
               | ({64{rd_mcycle   }} & read_csr_dat_mcycle   )
               | ({64{rd_mscratch }} & read_csr_dat_mscratch )
               | ({64{rd_minstret }} & read_csr_dat_minstret )         
               | ({64{rd_mtval    }} & read_csr_dat_mtval    )                                       
               ;
endmodule

module ysyx_210340_clint(
  input  wire                       clock,
	input  wire                       reset,
	input  wire                       clint_w_ena,
	input  wire                       clint_r_ena,	
	input  wire [31:0]                clint_rw_addr,
	input  wire [`YSYX210340_REG_BUS] clint_w_data,
  input  wire                       mie_mtie_r,
  input  wire                       status_mie_r,

  output reg  [`YSYX210340_REG_BUS] clint_r_data, 
  output wire                       int_irq_o // 中断请求信号
    );

    localparam REG_MTIMECMP = 32'h0200_4000;
    localparam REG_MTIME   = 32'h0200_BFF8;

    reg[`YSYX210340_REG_BUS] timer_count;
    reg[`YSYX210340_REG_BUS] timer_cmp;

    assign int_irq_o = (timer_count >= timer_cmp) && ((mie_mtie_r == 1'b1) && (status_mie_r == 1'b1)) ? 1'b1 : 1'b0 ; 

    wire   timer_count_wen = (clint_w_ena== 1'b1) & (clint_rw_addr == 32'h0200_BFF8);

    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            timer_count <= `YSYX210340_ZERO_WORD;
        end else if (timer_count_wen == 1'b1) begin
            timer_count <= clint_w_data;
        end else begin
            timer_count <= timer_count + 1'b1;          
        end
    end

    wire timer_cmp_wen = (clint_w_ena== 1'b1) & (clint_rw_addr == 32'h0200_4000);

    // write regs
    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            timer_cmp <= 0;
        end else if (timer_cmp_wen == 1'b1) begin
            timer_cmp <= clint_w_data;
        end
    end

    // read regs
    always @ (posedge clock) begin
        if (reset == 1'b1) begin
            clint_r_data <= `YSYX210340_ZERO_WORD;
        end else if (clint_r_ena == 1'b1) begin
            case (clint_rw_addr)
                REG_MTIMECMP: begin
                    clint_r_data <= timer_cmp;
                end
                REG_MTIME: begin
                    clint_r_data <= timer_count;
                end
                default: begin
                    clint_r_data <= `YSYX210340_ZERO_WORD;
                end
            endcase
        end
    end

endmodule

module ysyx_210340_clint_ctrl(
	  input  wire                       reset,
    input  wire [7:0]                 inst_opcode,
	  input  wire                       mem_w_ena,
	  input  wire                       mem_r_ena,	
	  input  wire [31:0]                mem_rw_addr,
	  input  wire [`YSYX210340_REG_BUS] mem_w_data,
    input  wire [`YSYX210340_REG_BUS] clint_r_data,

    output reg	[`YSYX210340_REG_BUS] mem_r_data,
    output wire                       clint_r_en,
    output wire                       clint_w_en,
    output wire  [31:0]               clint_addr,
    output reg  [`YSYX210340_REG_BUS] clint_w_data
    );

    assign clint_w_en = reset ? 0 : ((mem_rw_addr[31:16] == 16'h0200) ? mem_w_ena : 0);
    assign clint_r_en = reset ? 0 : ((mem_rw_addr[31:16] == 16'h0200) ? mem_r_ena : 0);
    
    assign clint_addr = mem_rw_addr ;

    // 内存接口
    wire [`YSYX210340_REG_BUS] sb_clint_w_data ;
    wire [`YSYX210340_REG_BUS] sh_clint_w_data ;
    wire [`YSYX210340_REG_BUS] sw_clint_w_data ;
    wire [`YSYX210340_REG_BUS] sd_clint_w_data ;

    wire [`YSYX210340_REG_BUS] lb_clint_r_data ;
    wire [`YSYX210340_REG_BUS] lh_clint_r_data ;
    wire [`YSYX210340_REG_BUS] lw_clint_r_data ;
    wire [`YSYX210340_REG_BUS] ld_clint_r_data ;
    wire [`YSYX210340_REG_BUS] lbu_clint_r_data ;
    wire [`YSYX210340_REG_BUS] lhu_clint_r_data ;
    wire [`YSYX210340_REG_BUS] lwu_clint_r_data ;
 
    wire sb_signal = clint_w_en & (inst_opcode == `YSYX210340_INST_SB);
    wire sh_signal = clint_w_en & (inst_opcode == `YSYX210340_INST_SH);
    wire sw_signal = clint_w_en & (inst_opcode == `YSYX210340_INST_SW);
    wire sd_signal = clint_w_en & (inst_opcode == `YSYX210340_INST_SD);

    wire lb_signal = clint_r_en & (inst_opcode == `YSYX210340_INST_LB);
    wire lh_signal = clint_r_en & (inst_opcode == `YSYX210340_INST_LH);
    wire lw_signal = clint_r_en & (inst_opcode == `YSYX210340_INST_LW);
    wire lbu_signal= clint_r_en & (inst_opcode == `YSYX210340_INST_LBU);
    wire lhu_signal= clint_r_en & (inst_opcode == `YSYX210340_INST_LHU);
    wire lwu_signal= clint_r_en & (inst_opcode == `YSYX210340_INST_LWU);    
    wire ld_signal = clint_r_en & (inst_opcode == `YSYX210340_INST_LD);

    assign lb_clint_r_data  = lb_signal  ? {{56{clint_r_data[ 7]}},clint_r_data[ 7: 0]} : `YSYX210340_ZERO_WORD;
    assign lh_clint_r_data  = lh_signal  ? {{48{clint_r_data[15]}},clint_r_data[15: 0]} : `YSYX210340_ZERO_WORD;
    assign lw_clint_r_data  = lw_signal  ? {{32{clint_r_data[31]}},clint_r_data[31: 0]} : `YSYX210340_ZERO_WORD;
    assign lbu_clint_r_data = lbu_signal ? {56'd0,clint_r_data[ 7: 0]} : `YSYX210340_ZERO_WORD;
    assign lhu_clint_r_data = lhu_signal ? {48'd0,clint_r_data[15: 0]} : `YSYX210340_ZERO_WORD;
    assign lwu_clint_r_data = lwu_signal ? {32'd0,clint_r_data[31: 0]} : `YSYX210340_ZERO_WORD;          
    assign ld_clint_r_data  = ld_signal  ? clint_r_data : `YSYX210340_ZERO_WORD; 

    assign sb_clint_w_data  = sb_signal  ? {56'd0,mem_w_data[7:0]} :`YSYX210340_ZERO_WORD;
    assign sh_clint_w_data  = sh_signal  ? {48'd0,mem_w_data[15:0]}:`YSYX210340_ZERO_WORD;
    assign sw_clint_w_data  = sw_signal  ? {32'd0,mem_w_data[31:0]}:`YSYX210340_ZERO_WORD;
    assign sd_clint_w_data  = sd_signal  ? mem_w_data :`YSYX210340_ZERO_WORD;

    // 写
    always @(*) begin
        if(reset)
            clint_w_data  = `YSYX210340_ZERO_WORD;
        else if (sb_signal)
                clint_w_data  = sb_clint_w_data;
            else if(sh_signal)
                clint_w_data  = sh_clint_w_data;
            else if(sw_signal)
                clint_w_data  = sw_clint_w_data;           
            else if(sd_signal)
                clint_w_data  = sd_clint_w_data;        
            else 
                clint_w_data  = `YSYX210340_ZERO_WORD;
    end

   // 读
    always @(*) begin
        if(reset) 
            mem_r_data = `YSYX210340_ZERO_WORD;
        else if(lb_signal)
                mem_r_data = lb_clint_r_data;
        else if(lh_signal)
                mem_r_data = lh_clint_r_data;
        else if(lw_signal)
                mem_r_data = lw_clint_r_data;
        else if(lbu_signal)
                mem_r_data = lbu_clint_r_data;
        else if(lhu_signal)
                mem_r_data = lhu_clint_r_data;
        else if(lwu_signal)
                mem_r_data = lwu_clint_r_data;            
        else if(ld_signal)
                mem_r_data = ld_clint_r_data;
        else
                mem_r_data = `YSYX210340_ZERO_WORD;
    end

endmodule

module ysyx_210340_Mux(
	input wire                       sel0,
	input wire                       sel1,	
	input wire [`YSYX210340_REG_BUS] data_0,
	input wire [`YSYX210340_REG_BUS] data_1,
	input wire [`YSYX210340_REG_BUS] data_2,	

	output wire [`YSYX210340_REG_BUS] data_out
);

assign data_out = sel0 ? data_0 : (sel1 ? data_1 :data_2);

endmodule

module ysyx_210340_mem_wb(
  input wire                        clock,
  input wire                        reset,
  input wire                        mem_wb_ena,
  input wire                        mem_int_irq_o,     
  input wire  [`YSYX210340_REG_BUS] mem_data_out,   
  input wire  [4 : 0]               mem_rd_w_addr,    
                          
  output reg                        wb_int_irq_o,  
  output reg  [`YSYX210340_REG_BUS] wb_data_out,
  output reg  [4 : 0]               wb_rd_w_addr 
);  

	always @(posedge clock) 
	begin
		if (reset == 1'b1) 
		    begin
            wb_int_irq_o       <= 1'b0;      
            wb_data_out        <= `YSYX210340_ZERO_WORD;  
            wb_rd_w_addr       <= 5'd0;                                                          
		end
		else if(mem_wb_ena == 1'b1)
	    	begin
            wb_int_irq_o       <= mem_int_irq_o; 
            wb_data_out        <= mem_data_out; 
            wb_rd_w_addr       <= mem_rd_w_addr;        

		end
	end
endmodule

module ysyx_210340_gnrl_dfflr (
  input           lden, 
  input    [63:0] dnxt,
  output   [63:0] qout,

  input           clock,
  input           reset
);

reg [63:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= {64{1'b0}};
  else if (lden == 1'b1)
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dffr(
  input    [63:0] dnxt,
  output   [63:0] qout,

  input           clock,
  input           reset
);

reg [63:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= {64{1'b0}};
  else                  
    qout_r <= dnxt;
end
assign qout = qout_r;
endmodule


module ysyx_210340_gnrl_dffr_1(
  input           dnxt,
  output          qout,

  input           clock,
  input           reset
);

reg  qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= 1'b0;
  else                  
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dfflr_1 (
  input           lden, 
  input           dnxt,
  output          qout,

  input           clock,
  input           reset
);

reg  qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= 1'b0;
  else if (lden == 1'b1)
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dfflr_2 (
  input           lden, 
  input   [1:0]   dnxt,
  output  [1:0]   qout,

  input           clock,
  input           reset
);

reg  [1:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= 2'b00;
  else if (lden == 1'b1)
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dffr_2(
  input    [1:0]  dnxt,
  output   [1:0]  qout,

  input           clock,
  input           reset
);

reg [1:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= 2'b00;
  else                  
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dffr_3(
  input    [2:0]  dnxt,
  output   [2:0]  qout,

  input           clock,
  input           reset
);

reg [2:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= 3'b000;
  else                  
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dffr_32(
  input    [31:0]  dnxt,
  output   [31:0]  qout,

  input           clock,
  input           reset
);

reg [31:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= {32{1'b0}};
  else                  
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_gnrl_dfflr_32 (
  input           lden, 
  input    [31:0] dnxt,
  output   [31:0] qout,

  input           clock,
  input           reset
);

reg [31:0] qout_r;

always @(posedge clock)
begin 
  if (reset == 1'b1)
    qout_r <= {32{1'b0}};
  else if (lden == 1'b1)
    qout_r <= dnxt;
end

assign qout = qout_r;
endmodule

module ysyx_210340_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8   
)(
    input                               clock,
    input                               reset,

	  input                               rw_valid_i   ,
	  output                              rw_ready_o   ,
    input                               rw_req_i     ,
    output reg [RW_DATA_WIDTH-1:0]      data_read_o  ,
    input  [RW_DATA_WIDTH-1:0]          data_write_i ,
    input  [31:0]                       rw_addr_i_r  ,
    input  [1:0]                        rw_size_i    ,
    output [1:0]                        rw_resp_o    ,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,

    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,

    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i
);
  
    //保证源代码基本不变的情况下仅改变数据位宽
    wire [63:0] rw_addr_i = {32'b0,{rw_addr_i_r}};

    wire w_trans    = rw_req_i == `YSYX210340_REQ_WRITE;
    wire r_trans    = rw_req_i == `YSYX210340_REQ_READ;
    wire w_valid    = rw_valid_i & w_trans;
    wire r_valid    = rw_valid_i & r_trans;

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o ;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i ;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i ;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = w_trans ? b_hs : r_done;

    // ------------------State Machine------------------
    localparam [2:0] W_STATE_IDLE = 3'b000, W_STATE_ADDR = 3'b001, W_STATE_WRITE = 3'b010, W_STATE_RESP = 3'b011, W_STATE_DONE = 3'b100 ,W_STATE_DONE2 = 3'b101;
    localparam [2:0] R_STATE_IDLE = 3'b000, R_STATE_ADDR = 3'b001, R_STATE_READ  = 3'b010, R_STATE_DONE = 3'b011 , R_STATE_DONE2 = 3'b100;

    reg [2:0] w_state;
    reg [2:0] r_state;
    wire w_state_idle   = w_state == W_STATE_IDLE;
    wire w_state_addr   = w_state == W_STATE_ADDR;
    wire w_state_write  = w_state == W_STATE_WRITE;
    wire w_state_resp   = w_state == W_STATE_RESP; 
    wire r_state_idle   = r_state == R_STATE_IDLE;
    wire r_state_addr   = r_state == R_STATE_ADDR;
    wire r_state_read   = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (reset == 1'b1) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
                    W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_DONE;
                //    W_STATE_DONE:               w_state <= W_STATE_IDLE;
                    W_STATE_DONE:               w_state <= W_STATE_DONE2;
                    W_STATE_DONE2:               w_state <= W_STATE_IDLE;
                    default:;                
                endcase
            end
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (reset == 1'b1) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE:               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (r_done)   r_state <= R_STATE_DONE;
                    R_STATE_DONE:               r_state <= R_STATE_DONE2;
                    R_STATE_DONE2:              r_state <= R_STATE_IDLE;                    
                    default:;
                endcase
            end
        end
    end

    // ------------------Process Data------------------
    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);
    localparam AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
    localparam MASK_WIDTH    = AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / AXI_DATA_WIDTH;
    localparam BLOCK_TRANS   = TRANS_LEN > 1 ? 1'b1 : 1'b0;

    wire aligned             = BLOCK_TRANS | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b              = rw_size_i == `YSYX210340_SIZE_B;
    wire size_h              = rw_size_i == `YSYX210340_SIZE_H;
    wire size_w              = rw_size_i == `YSYX210340_SIZE_W;
    wire size_d              = rw_size_i == `YSYX210340_SIZE_D;
    wire [3:0] addr_op1      = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2      = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end      = addr_op1 + addr_op2;
    wire overstep            = addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len       = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    wire [2:0] axi_size      = AXI_SIZE[2:0];
    
    //wire [63:0] axi_addr          = {rw_addr_i[63:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}};
    wire [63:0] axi_addr          = rw_addr_i;
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    //wire [OFFSET_WIDTH-1:0] aligned_offset_h    = (AXI_DATA_WIDTH - aligned_offset_l);
    wire [OFFSET_WIDTH-1:0] aligned_offset_h    = (AXI_DATA_WIDTH[5:0] - aligned_offset_l);
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                    ) << aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] mask_l            = mask[AXI_DATA_WIDTH-1:0];
    wire [AXI_DATA_WIDTH-1:0] mask_h            = mask[MASK_WIDTH-1:AXI_DATA_WIDTH];

    wire [AXI_ID_WIDTH-1:0] axi_id              = {AXI_ID_WIDTH{1'b0}};

    reg  rw_ready;
    wire rw_ready_nxt = trans_done;
    wire rw_ready_en  = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
        end
    end
    assign rw_ready_o     = rw_ready;

    reg  [1:0] rw_resp;
    wire [1:0] rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i;
    wire resp_en = trans_done;
    always @(posedge clock) begin
        if (reset) begin
            rw_resp <= 2'b00;
        end
        else if (resp_en) begin
            rw_resp <= rw_resp_nxt;
        end
    end
    assign rw_resp_o    = rw_resp;

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
    // Write address channel signals
    assign axi_aw_valid_o   = w_state_addr & (~r_valid);
    assign axi_aw_addr_o    = axi_addr[31:0];
    assign axi_aw_id_o      = axi_id;
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = (rw_addr_i_r < 32'h80000000) ? 3'b010 :axi_size;
    assign axi_aw_burst_o   = `YSYX210340_AXI_BURST_TYPE_INCR; 
    assign axi_w_valid_o    = w_state_write;
    assign axi_w_last_o     = len == axi_len;

    assign axi_w_data_o     = BLOCK_TRANS 
                            ? data_write_i[len[$clog2(AXI_DATA_WIDTH)-1:0]*AXI_DATA_WIDTH+:AXI_DATA_WIDTH]
                            : (len == 0 ? (data_write_i << aligned_offset_l) : (data_write_i >> aligned_offset_h));
    
    localparam STRB_MASK_WIDTH      = AXI_STRB_WIDTH * 2;
    wire [STRB_MASK_WIDTH-1:0] strb = (({STRB_MASK_WIDTH{size_b}} & {{STRB_MASK_WIDTH-1{1'b0}}, 1'b1})
                                    | ({STRB_MASK_WIDTH{size_h}}  & {{STRB_MASK_WIDTH-2{1'b0}}, 2'b11})
                                    | ({STRB_MASK_WIDTH{size_w}}  & {{STRB_MASK_WIDTH-4{1'b0}}, 4'b1111})
                                    | ({STRB_MASK_WIDTH{size_d}}  & {{STRB_MASK_WIDTH-8{1'b0}}, 8'b11111111})
        ) << rw_addr_i[ALIGNED_WIDTH-1:0];
    wire [AXI_STRB_WIDTH-1:0] strb_l  = strb[AXI_STRB_WIDTH-1:0];
    wire [AXI_STRB_WIDTH-1:0] strb_h  = strb[STRB_MASK_WIDTH-1:AXI_STRB_WIDTH];   
    assign axi_w_strb_o               = BLOCK_TRANS ? {AXI_STRB_WIDTH{1'b1}} : (len == 0 ? strb_l : strb_h);

    // Write response channel signals
    assign axi_b_ready_o    = w_state_resp ;

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr & (~w_valid);
    assign axi_ar_addr_o    = axi_addr[31:0];
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = (rw_addr_i_r < 32'h80000000) ? 3'b010 :axi_size;
    assign axi_ar_burst_o   = `YSYX210340_AXI_BURST_TYPE_INCR;
    
    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;

    genvar i;
    generate
        for (i = 0; i < TRANS_LEN; i = i + 1) begin: r_axi
            always @(posedge clock) begin
                if (reset) begin
                    data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= 0;
                end
                else if ( r_hs ) begin
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

endmodule
    
module ysyx_210340_arbiter( 
    input  wire                             clock,
    input  wire                             reset,

    input  wire                             m0_valid,
    output reg                              m0_ready,
    output reg  [63:0]                      m0_data_read,
    input  wire [31:0]                      m0_addr,
    input  wire [1:0]                       m0_size,
    output reg  [1:0]                       m0_resp,
    input  wire                             m0_req,

    input  wire                             m1_valid,
    input  wire                             m1_req,    
    output reg                              m1_ready,
    input  wire [1:0]                       m1_size,
    output reg  [1:0]                       m1_resp,
    input  wire [31:0]                      m1_addr,
    output reg  [63:0]                      m1_r_data,
    input  wire [63:0]                      m1_w_data,

	  output reg                              s0_rw_valid,
	  input  wire                             s0_rw_ready,
    output reg                              s0_rw_req,
    input  wire [63:0]                      s0_data_read_o,
    output reg  [63:0]                      s0_data_write,
    output reg  [31:0]                      s0_rw_addr,
    output reg  [1:0]                       s0_rw_size,
    input  wire [1:0]                       s0_rw_resp,

    output wire                             fetched_mem, //当前load指令取回数值进行nemu对比，否则提交的指令无效 
    output wire [2:0]                       req          //判断当前指令为取指操作、load操作、store操作                    
);

    wire m1_w_trans    = m1_req == `YSYX210340_REQ_WRITE;
    wire m1_r_trans    = m1_req == `YSYX210340_REQ_READ;
    wire m1_w_valid    = m1_valid & m1_w_trans;
    wire m1_r_valid    = m1_valid & m1_r_trans;

    localparam  [1:0] grant0 = 2'b01; //主设备0(IF)
    localparam  [1:0] grant1 = 2'b10; //主设备1(MEM)
    reg [1:0] grant;
    // 主设备请求信号
    assign req = {m0_valid, m1_r_valid, m1_w_valid};

    wire [2:0] req_nxt ;
    ysyx_210340_gnrl_dffr_3  reg_dffr (req , req_nxt, clock, reset);
    //取出的指令为nop指令可以进行对比
    //普通指令变为load指令或load指令变为普通指令时，取回到inst为错误值，提交的指令无效
    wire invalid = (req_nxt != req) & ((req_nxt == 3'b110) | (req == 3'b110)) & (s0_data_read_o[31:0] != 32'h00000013);
    // 仲裁逻辑
    // 固定优先级仲裁机制
    // 优先级由高到低：主设备0(IF)，主设备1(MEM)

    wire if_hs    = m0_ready & m0_valid;
    wire mem_r_hs = m1_ready & m1_r_valid;
    wire mem_w_hs = m1_ready & m1_w_valid;

    reg ls;
    always @ (posedge clock) begin
        case(req)
            3'b100:
            begin
                grant <= grant0;
                ls    <= 1'b0;
            end     
            3'b110:
            begin
                case(ls)
                    1'b0:begin
                    grant <= grant1;
                    ls    <= mem_r_hs ? 1'b1 : 1'b0;end //load指令读出结果有效时跳出等待
                    1'b1:begin //load指令结束，进行取指操作，直到取到正确指令，跳出等待
                    grant <= grant0;
                    ls    <= if_hs ? 1'b0 : 1'b1;end  
                    default: begin 
                    grant <= grant0; 
                    ls    <= 1'b0; end                  
                endcase
            end

            3'b101:  //先写后读,store操作
            begin
                case(ls)
                    1'b0:begin //写数据成功后跳出，进行取指操作
                    grant <= grant1;
                    ls    <= mem_w_hs ? 1'b1 : 1'b0;end 
                    1'b1:begin  //store指令结束，进行取指操作，直到取到正确指令，跳出等待
                    grant <= grant0;
                    ls    <= if_hs ? 1'b0 : 1'b1;end   
                    default: begin 
                    grant <= grant0; 
                    ls    <= 1'b0; end    
                endcase                                             
            end  
            default: begin grant <= grant0; ls <= 1'b0; end
        endcase
    end

wire fetched_o;
wire fetched_r = (mem_r_hs & (req == 3'b110)) ? 1'b1 :1'b0; //当前load指令取回数值时进行nemu对比
ysyx_210340_gnrl_dffr_1  fetched_dffr (fetched_r, fetched_o, clock, reset);
assign fetched_mem = invalid ? 1'b0 :fetched_o; //延迟一个周期为了与cpu.v里提交给nemu的cmt_valid_i保持同步

    // 根据仲裁结果，选择(访问)对应的从设备
    always @ (*) begin
        case (grant)
            grant0: begin
                        s0_rw_valid  = m0_valid;
                        m0_ready     = s0_rw_ready;
                        s0_rw_req    = m0_req;
                        m0_data_read = s0_data_read_o;
                        s0_data_write= `YSYX210340_ZERO_WORD;
                        s0_rw_addr   = m0_addr;
                        s0_rw_size   = m0_size;
                        m0_resp      = s0_rw_resp;   

                        m1_ready     = 1'b0;    
                        m1_r_data    = `YSYX210340_ZERO_WORD;     
                        m1_resp      = 2'b00;                                    
                    end
            grant1: begin 
                        s0_rw_valid  = m1_valid;
                        m1_ready     = s0_rw_ready;
                        s0_rw_req    = m1_req;
                        m1_r_data    = s0_data_read_o;
                        s0_data_write= m1_w_data;
                        s0_rw_addr   = m1_addr;
                        s0_rw_size   = m1_size;
                        m1_resp      = s0_rw_resp;  

                        m0_ready     = 1'b0;   
                        m0_data_read = `YSYX210340_ZERO_WORD;     
                        m0_resp      = 2'b00;                                                    
                    end
            default:begin
                        m0_ready     = 1'b0;           
                        m0_data_read = `YSYX210340_ZERO_WORD;
                        m0_resp      = 2'b00; 

                        m1_ready     = 1'b0; 
                        m1_r_data    = `YSYX210340_ZERO_WORD;
                        m1_resp      = 2'b00; 

                        s0_rw_valid  = 1'b0; 
                        s0_rw_req    = 1'b0; 
                        s0_data_write= `YSYX210340_ZERO_WORD;
                        s0_rw_addr   = `YSYX210340_PC_START;
                        s0_rw_size   = 2'b00;
                    end        
        endcase
    end

endmodule

