`timescale 1ns/1ps

//----------Basic Parameters----------//
`define    YSYX210313_XLEN                                                64
`define    YSYX210313_MXLEN                                               64
`define    YSYX210313_DATABUSLEN                                          64
`define    YSYX210313_ADDRBUSLEN                                          32
`define    YSYX210313_INSTLEN                                             32
`define    YSYX210313_REGFILE_ADDR_LEN                                    5
`define    YSYX210313_CSR_ADDR_LEN                                        12
`define    YSYX210313_PC_START                                            32'h30000000 
`define    YSYX210313_ZERO_WORD                                           64'h00000000_00000000

//----------Instruction Types----------//
`define    YSYX210313_R_TYPE                                              5'b011?0
`define    YSYX210313_B_TYPE                                              5'b11000
`define    YSYX210313_S_TYPE                                              5'b01000
`define    YSYX210313_J_TYPE                                              5'b11011
`define    YSYX210313_U_TYPE                                              5'b0?101
`define    YSYX210313_PRIVILEGED                                          5'b11100

//----------Immediate Extension Types----------//
`define    YSYX210313_IMM_I_S_EXT                                         3'b000
`define    YSYX210313_IMM_I_S_W_EXT                                       3'b001 
`define    YSYX210313_IMM_I_NS_EXT                                        3'b010
`define    YSYX210313_IMM_B_EXT                                           3'b011
`define    YSYX210313_IMM_S_EXT                                           3'b100
`define    YSYX210313_IMM_U_EXT                                           3'b101 
`define    YSYX210313_IMM_J_EXT                                           3'b110
`define    YSYX210313_IMM_NOEXT                                           3'b111

//----------ALU Oprend A Sources----------//
`define    YSYX210313_PC                                                  2'b00
`define    YSYX210313_REGBUS_A                                            2'b01
`define    YSYX210313_ZEXT_BITSEL_REGBUS_A                                2'b10
`define    YSYX210313_SEXT_BITSEL_REGBUS_A                                2'b11

//----------ALU Oprend B Sources----------//
`define    YSYX210313_REGBUS_B                                            2'b10
`define    YSYX210313_IMM                                                 2'b00
`define    YSYX210313_CONST_4                                             2'b01
`define    YSYX210313_ZEXT_BITSEL_REGBUS_B                                2'b11

//----------ALU Operation Types----------//
`define    YSYX210313_ADD_OP                                              3'b000
`define    YSYX210313_SUB_OP                                              3'b001
`define    YSYX210313_AND_OP                                              3'b010
`define    YSYX210313_OR_OP                                               3'b011
`define    YSYX210313_XOR_OP                                              3'b100
`define    YSYX210313_SLL_OP                                              3'b101
`define    YSYX210313_SRL_OP                                              3'b110
`define    YSYX210313_SRA_OP                                              3'b111

//----------PSW Flags----------//
`define    YSYX210313_CF                                                  psw_flags[0]
`define    YSYX210313_SF                                                  psw_flags[1]
`define    YSYX210313_OF                                                  psw_flags[2]
`define    YSYX210313_ZF                                                  psw_flags[3]

//----------Branch Types----------//
`define    YSYX210313_NOTBRANCH                                           3'b010
`define    YSYX210313_EQ                                                  3'b000
`define    YSYX210313_NE                                                  3'b001
`define    YSYX210313_LT                                                  3'b100
`define    YSYX210313_GE                                                  3'b101
`define    YSYX210313_LTU                                                 3'b110
`define    YSYX210313_GEU                                                 3'b111

//----------Load Extension Types----------//
`define    YSYX210313_SEXT8                                               3'b000
`define    YSYX210313_SEXT16                                              3'b001
`define    YSYX210313_SEXT32                                              3'b010
`define    YSYX210313_ZEXT8                                               3'b100
`define    YSYX210313_ZEXT16                                              3'b101
`define    YSYX210313_ZEXT32                                              3'b110
`define    YSYX210313_NOEXT                                               3'b011

//----------Advanced eXtensible Interface----------//
// Width Parameters
`define    YSYX210313_AXI_ADDR_WIDTH                                      32
`define    YSYX210313_AXI_DATA_WIDTH                                      64
`define    YSYX210313_RW_DATA_WIDTH                                       64
`define    YSYX210313_AXI_ID_WIDTH                                        4

// Burst Types
`define    YSYX210313_AXI_BURST_TYPE_FIXED                                2'b00
`define    YSYX210313_AXI_BURST_TYPE_INCR                                 2'b01
`define    YSYX210313_AXI_BURST_TYPE_WRAP                                 2'b10

// Access Permissions
`define    YSYX210313_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define    YSYX210313_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define    YSYX210313_AXI_PROT_SECURE_ACCESS                              3'b000
`define    YSYX210313_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define    YSYX210313_AXI_PROT_DATA_ACCESS                                3'b000
`define    YSYX210313_AXI_PROT_INSTRUCTION_ACCESS                         3'b100

// Memory Types (AR)
`define    YSYX210313_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define    YSYX210313_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define    YSYX210313_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define    YSYX210313_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define    YSYX210313_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define    YSYX210313_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define    YSYX210313_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define    YSYX210313_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define    YSYX210313_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define    YSYX210313_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define    YSYX210313_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define    YSYX210313_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

// Memory Types (AW)
`define    YSYX210313_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define    YSYX210313_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define    YSYX210313_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define    YSYX210313_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define    YSYX210313_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define    YSYX210313_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define    YSYX210313_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define    YSYX210313_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define    YSYX210313_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define    YSYX210313_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define    YSYX210313_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define    YSYX210313_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

// Burst Length
`define    YSYX210313_AXI_SIZE_BYTES_1                                    3'b000
`define    YSYX210313_AXI_SIZE_BYTES_2                                    3'b001
`define    YSYX210313_AXI_SIZE_BYTES_4                                    3'b010
`define    YSYX210313_AXI_SIZE_BYTES_8                                    3'b011
`define    YSYX210313_AXI_SIZE_BYTES_16                                   3'b100
`define    YSYX210313_AXI_SIZE_BYTES_32                                   3'b101
`define    YSYX210313_AXI_SIZE_BYTES_64                                   3'b110
`define    YSYX210313_AXI_SIZE_BYTES_128                                  3'b111

// Burst Size
`define    YSYX210313_SIZE_B                                              2'b00
`define    YSYX210313_SIZE_H                                              2'b01
`define    YSYX210313_SIZE_W                                              2'b10
`define    YSYX210313_SIZE_D                                              2'b11

//----------Privileged Part----------//
// Priv Mode
`define    YSYX210313_RISCV_PRIV_MODE_U                                   0
`define    YSYX210313_RISCV_PRIV_MODE_S                                   1
`define    YSYX210313_RISCV_PRIV_MODE_M                                   3

// CSR Bits
`define    YSYX210313_MIP_MTIP                                            7
`define    YSYX210313_MIE_MTIE                                            7
`define    YSYX210313_MSTATUS_MIE                                         3
`define    YSYX210313_MSTATUS_MPIE                                        7
`define    YSYX210313_MSTATUS_MPP                                         12:11

// Mcause Exception Codes
`define    YSYX210313_ECALL_FROM_M_MODE                                   64'hb
`define    YSYX210313_MACHINE_TIMER_INTERRUPT                             64'h80000000_00000007

// CSR Address
`define    YSYX210313_MTIME_ADDR                                          32'h200BFF8
`define    YSYX210313_MTIMECMP_ADDR                                       32'h2004000
`define    YSYX210313_MHARTID_ADDR                                        12'hF14
`define    YSYX210313_MSTATUS_ADDR                                        12'h300
`define    YSYX210313_MIE_ADDR                                            12'h304
`define    YSYX210313_MTVEC_ADDR                                          12'h305
`define    YSYX210313_MSCRATCH_ADDR                                       12'h340
`define    YSYX210313_MEPC_ADDR                                           12'h341
`define    YSYX210313_MCAUSE_ADDR                                         12'h342
`define    YSYX210313_MTVAL_ADDR                                          12'h343                   /* Not Implemented */
`define    YSYX210313_MIP_ADDR                                            12'h344
`define    YSYX210313_MCYCLE_ADDR                                         12'hB00
`define    YSYX210313_MINSTRET_ADDR                                       12'hB02
`define    YSYX210313_MTIMEFREQ_ADDR                                      12'hBFF
`define    YSYX210313_NAME_CHAR1_ADDR                                     12'hFFD
`define    YSYX210313_NAME_CHAR2_ADDR                                     12'hFFE
`define    YSYX210313_NAME_CHAR3_ADDR                                     12'hFFF

module ysyx_210313 (
    input clock,
    input reset,
    input io_interrupt,

    // Advanced eXtensible Interface
    // Master
    input                io_master_awready,
    output               io_master_awvalid,
    output [31:0]        io_master_awaddr,
    output [3:0]         io_master_awid,
    output [7:0]         io_master_awlen,
    output [2:0]         io_master_awsize,
    output [1:0]         io_master_awburst,

    input                io_master_wready,
    output               io_master_wvalid,
    output [63:0]        io_master_wdata,
    output [7:0]         io_master_wstrb,
    output               io_master_wlast,

    output               io_master_bready,
    input                io_master_bvalid,
    input  [1:0]         io_master_bresp,
    input  [3:0]         io_master_bid,

    input                io_master_arready,
    output               io_master_arvalid,
    output [31:0]        io_master_araddr,
    output [3:0]         io_master_arid,
    output [7:0]         io_master_arlen,
    output [2:0]         io_master_arsize,
    output [1:0]         io_master_arburst,

    output               io_master_rready,
    input                io_master_rvalid,
    input  [1:0]         io_master_rresp,
    input  [63:0]        io_master_rdata,
    input                io_master_rlast,
    input  [3:0]         io_master_rid,

    // Slave
    output               io_slave_awready,
    input                io_slave_awvalid,
    input  [31:0]        io_slave_awaddr,
    input  [3:0]         io_slave_awid,
    input  [7:0]         io_slave_awlen,
    input  [2:0]         io_slave_awsize,
    input  [1:0]         io_slave_awburst,

    output               io_slave_wready,
    input                io_slave_wvalid,
    input  [63:0]        io_slave_wdata,
    input  [7:0]         io_slave_wstrb,
    input                io_slave_wlast,

    input                io_slave_bready,
    output               io_slave_bvalid,
    output [1:0]         io_slave_bresp,
    output [3:0]         io_slave_bid,

    output               io_slave_arready,
    input                io_slave_arvalid,
    input  [31:0]        io_slave_araddr,
    input  [3:0]         io_slave_arid,
    input  [7:0]         io_slave_arlen,
    input  [2:0]         io_slave_arsize,
    input  [1:0]         io_slave_arburst,

    input                io_slave_rready,
    output               io_slave_rvalid,
    output [1:0]         io_slave_rresp,
    output [63:0]        io_slave_rdata,
    output               io_slave_rlast,
    output [3:0]         io_slave_rid
);

    assign io_slave_awready   = 0;
    assign io_slave_wready    = 0;
    assign io_slave_bvalid    = 0;
    assign io_slave_bresp     = 0;
    assign io_slave_bid       = 0;
    assign io_slave_arready   = 0;
    assign io_slave_rvalid    = 0;
    assign io_slave_rresp     = 0;
    assign io_slave_rdata     = 0;
    assign io_slave_rlast     = 0;
    assign io_slave_rid       = 0;

    //----------Defs----------//
    wire                                    rs1_r_en;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs1_r_addr;
    wire [`YSYX210313_XLEN-1:0]             rs1_r_data;
    wire                                    rs2_r_en;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs2_r_addr;
    wire [`YSYX210313_XLEN-1:0]             rs2_r_data;
    wire                                    rd_w_en;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr;
    wire [`YSYX210313_XLEN-1:0]             rd_w_data;

    wire                                    inst_valid;
    wire                                    csr_r_en;
    wire [11: 0]                            csr_r_addr;
    wire [`YSYX210313_MXLEN-1:0]            csr_r_data;
    wire                                    csr_w_en;
    wire [11: 0]                            csr_w_addr;
    wire [`YSYX210313_MXLEN-1:0]            csr_w_data;
    wire                                    exception_jump_flag;
    wire [`YSYX210313_ADDRBUSLEN-1:0]       exception_jump_addr;
    wire [`YSYX210313_MXLEN-1:0]            mtimefreq;

    wire [`YSYX210313_ADDRBUSLEN-1:0]       inst_jump_or_branch_taken_addr;

    wire                                    pc_valid;

    wire                                    inst_ecall_mem;
    wire                                    inst_mret_mem;

    wire                                    o_pc_valid_if;
    wire [`YSYX210313_ADDRBUSLEN-1:0]       o_pc_if;
    wire [`YSYX210313_INSTLEN-1:0]          o_instruction_if;
    wire                                    i_pc_valid_id;
    wire [`YSYX210313_ADDRBUSLEN-1:0]       i_pc_id;
    wire [`YSYX210313_INSTLEN-1:0]          i_instruction_id;

    wire [`YSYX210313_XLEN-1:0]             o_regbus_A_id;
    wire [`YSYX210313_XLEN-1:0]             o_regbus_B_id;
    wire [`YSYX210313_XLEN-1:0]             o_imm_id;
    wire [ 1: 0]                            o_ALU_oprend_A_src_id;
    wire [ 1: 0]                            o_ALU_oprend_B_src_id;
    wire [ 2: 0]                            o_ALU_op_id;
    wire [ 2: 0]                            o_ALU_out_ext_type_id;
    wire                                    o_adder_src_id;
    wire [`YSYX210313_ADDRBUSLEN-1:0]       o_pc_id;
    wire                                    o_pc_valid_id;
    wire                                    o_mem_r_en_id;
    wire [ 2: 0]                            o_mem_r_ext_type_id;
    wire                                    o_mem_w_en_id;
    wire [ 1: 0]                            o_mem_w_size_id;
    wire                                    o_inst_jump_id;
    wire [ 2: 0]                            o_inst_branch_type_id;
    wire                                    o_is_system_inst_id;
    wire                                    o_inst_ecall_id;
    wire                                    o_inst_mret_id;
    wire                                    o_rd_w_en_id;
    wire                                    o_rd_w_src_id;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] o_rd_w_addr_id;
    wire                                    o_csr_w_en_id;
    wire [`YSYX210313_CSR_ADDR_LEN-1:0]     o_csr_w_addr_id;
    wire [`YSYX210313_XLEN-1:0]             i_regbus_A_ex;
    wire [`YSYX210313_XLEN-1:0]             i_regbus_B_ex;
    wire [`YSYX210313_XLEN-1:0]             i_imm_ex;
    wire [ 1: 0]                            i_ALU_oprend_A_src_ex;
    wire [ 1: 0]                            i_ALU_oprend_B_src_ex;
    wire [ 2: 0]                            i_ALU_op_ex;
    wire [ 2: 0]                            i_ALU_out_ext_type_ex;
    wire                                    i_adder_src_ex;
    wire [`YSYX210313_ADDRBUSLEN-1:0]       i_pc_ex;
    wire                                    i_pc_valid_ex;
    wire                                    i_mem_r_en_ex;
    wire [ 2: 0]                            i_mem_r_ext_type_ex;
    wire                                    i_mem_w_en_ex;
    wire [ 1: 0]                            i_mem_w_size_ex;
    wire                                    i_inst_jump_ex;
    wire [ 2: 0]                            i_inst_branch_type_ex;
    wire                                    i_is_system_inst_ex;
    wire                                    i_inst_ecall_ex;
    wire                                    i_inst_mret_ex;
    wire                                    i_rd_w_en_ex;
    wire                                    i_rd_w_src_ex;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] i_rd_w_addr_ex;
    wire                                    i_csr_w_en_ex;
    wire [`YSYX210313_CSR_ADDR_LEN-1:0]     i_csr_w_addr_ex;

    wire [`YSYX210313_ADDRBUSLEN-1:0]       o_pc_ex;
    wire [`YSYX210313_DATABUSLEN-1:0]       o_ALU_out_ex;
    wire [ 3: 0]                            o_psw_flags_ex;
    wire                                    o_mem_r_en_ex;
    wire [ 2: 0]                            o_mem_r_ext_type_ex;
    wire                                    o_mem_w_en_ex;
    wire [ 1: 0]                            o_mem_w_size_ex;
    wire [`YSYX210313_DATABUSLEN-1:0]       o_regbus_B_ex;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] o_rd_w_addr_ex;
    wire                                    o_rd_w_en_ex;
    wire                                    o_rd_w_src_ex;
    wire                                    o_csr_w_en_ex;
    wire [`YSYX210313_CSR_ADDR_LEN-1:0]     o_csr_w_addr_ex;
    wire                                    o_inst_jump_ex;
    wire [ 2: 0]                            o_inst_branch_type_ex;
    wire                                    o_is_system_inst_ex;
    wire                                    o_inst_ecall_ex;
    wire                                    o_inst_mret_ex;
    wire [`YSYX210313_ADDRBUSLEN-1:0]       i_branch_target_pc_mem;
    wire [`YSYX210313_DATABUSLEN-1:0]       i_ALU_out_mem;
    wire [ 3: 0]                            i_psw_flags_mem;
    wire                                    i_mem_r_en_mem;
    wire [ 2: 0]                            i_mem_r_ext_type_mem;
    wire                                    i_mem_w_en_mem;
    wire [ 1: 0]                            i_mem_w_size_mem;
    wire [`YSYX210313_DATABUSLEN-1:0]       i_regbus_B_mem;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] i_rd_w_addr_mem;
    wire                                    i_rd_w_en_mem;
    wire                                    i_rd_w_src_mem;
    wire                                    i_csr_w_en_mem;
    wire [`YSYX210313_CSR_ADDR_LEN-1:0]     i_csr_w_addr_mem;
    wire                                    i_inst_jump_mem;
    wire [ 2: 0]                            i_inst_branch_type_mem;
    wire                                    i_is_system_inst_mem;
    wire                                    i_inst_ecall_mem;
    wire                                    i_inst_mret_mem;

    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] o_rd_w_addr_mem;
    wire                                    o_rd_w_en_mem;
    wire                                    o_rd_w_src_mem;
    wire                                    o_csr_w_en_mem;
    wire [`YSYX210313_CSR_ADDR_LEN-1:0]     o_csr_w_addr_mem;
    wire [ 2: 0]                            o_mem_r_ext_type_mem;
    wire [`YSYX210313_DATABUSLEN-1:0]       o_regbus_C_mem;
    wire [`YSYX210313_DATABUSLEN-1:0]       o_regbus_D_mem;
    wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] i_rd_w_addr_wb;
    wire                                    i_rd_w_en_wb;
    wire                                    i_rd_w_src_wb;
    wire                                    i_csr_w_en_wb;
    wire [`YSYX210313_CSR_ADDR_LEN-1:0]     i_csr_w_addr_wb;
    wire [ 2: 0]                            i_mem_r_ext_type_wb;
    wire [`YSYX210313_DATABUSLEN-1:0]       i_regbus_C_wb;
    wire [`YSYX210313_DATABUSLEN-1:0]       i_regbus_D_wb;

    wire                                    mem_stall_req;
    wire                                    inst_fencei;
    wire                                    inst_wfi;
    wire                                    bubble;
    wire [3:0]                              stall;
    wire                                    inst_jump_or_branch_taken_flag;
    wire                                    flush;

    wire                                    forward_rs1_flag;
    wire                                    forward_rs2_flag;
    wire                                    forward_csr_flag;

    wire [`YSYX210313_XLEN-1:0]             forward_rs1_data;
    wire [`YSYX210313_XLEN-1:0]             forward_rs2_data;
    wire [`YSYX210313_MXLEN-1:0]            forward_csr_data;

    wire                                    intr;
    wire                                    clint_aw_ready;
    wire                                    clint_aw_valid;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   clint_aw_addr;
    wire [`YSYX210313_AXI_ID_WIDTH-1:0]     clint_aw_id;
    wire [7:0]                              clint_aw_len;
    wire                                    clint_w_ready;
    wire                                    clint_w_valid;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   clint_w_data;
    wire [`YSYX210313_AXI_DATA_WIDTH/8-1:0] clint_w_strb;
    wire                                    clint_w_last;
    wire                                    clint_b_ready;
    wire                                    clint_b_valid;
    wire [1:0]                              clint_b_resp;
    wire [3:0]                              clint_b_id;
    wire                                    clint_ar_ready;
    wire                                    clint_ar_valid;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   clint_ar_addr;
    wire [`YSYX210313_AXI_ID_WIDTH-1:0]     clint_ar_id;
    wire [7:0]                              clint_ar_len;
    wire                                    clint_r_ready;
    wire                                    clint_r_valid;
    wire [1:0]                              clint_r_resp;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   clint_r_data;
    wire                                    clint_r_last;
    wire [`YSYX210313_AXI_ID_WIDTH-1:0]     clint_r_id;

    wire                                    if_r_req;
    wire                                    if_r_okay;
    wire                                    if_r_handshaked;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   if_data_read;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   if_r_addr;
    wire [ 1: 0]                            if_r_size;
    wire [ 1: 0]                            if_r_response;

    wire                                    if_ar_ready;
    wire                                    if_ar_valid;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   if_ar_addr;
    wire [`YSYX210313_AXI_ID_WIDTH-3:0]     if_ar_id;
    wire [ 7: 0]                            if_ar_len;
    wire [ 2: 0]                            if_ar_size;
    wire [ 1: 0]                            if_ar_burst;

    wire                                    if_r_ready;
    wire                                    if_r_valid;
    wire [ 1: 0]                            if_r_resp;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   if_r_data;
    wire                                    if_r_last;

    wire                                    mem_r_req;
    wire                                    mem_r_okay;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   mem_data_read;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   mem_r_addr;
    wire [ 1: 0]                            mem_r_size;
    wire [ 1: 0]                            mem_r_response;

    wire                                    mem_w_req;
    wire                                    mem_w_okay;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   mem_data_write;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   mem_w_addr;
    wire [ 1: 0]                            mem_w_size;
    wire [ 1: 0]                            mem_w_response;

    wire                                    mem_aw_ready;
    wire                                    mem_aw_valid;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   mem_aw_addr;
    wire [`YSYX210313_AXI_ID_WIDTH-3:0]     mem_aw_id;
    wire [ 7: 0]                            mem_aw_len;
    wire [ 2: 0]                            mem_aw_size;
    wire [ 1: 0]                            mem_aw_burst;
    wire                                    mem_w_ready;
    wire                                    mem_w_valid;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   mem_w_data;
    wire [`YSYX210313_AXI_DATA_WIDTH/8-1:0] mem_w_strb;
    wire                                    mem_w_last;
    wire                                    mem_b_ready;
    wire                                    mem_b_valid;
    wire [ 1: 0]                            mem_b_resp;
    wire                                    mem_ar_ready;
    wire                                    mem_ar_valid;
    wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   mem_ar_addr;
    wire [`YSYX210313_AXI_ID_WIDTH-3:0]     mem_ar_id;
    wire [ 7: 0]                            mem_ar_len;
    wire [ 2: 0]                            mem_ar_size;
    wire [ 1: 0]                            mem_ar_burst;
    wire                                    mem_r_ready;
    wire                                    mem_r_valid;
    wire [ 1: 0]                            mem_r_resp;
    wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   mem_r_data;
    wire                                    mem_r_last;

    //----------Regfile----------//

    ysyx_210313_regfile ysyx_210313_regfile (
        .clock               (clock),
        .reset               (reset),

        .rs1_r_en            (rs1_r_en),
        .rs1_r_addr          (rs1_r_addr),
        .rs1_r_data          (rs1_r_data),

        .rs2_r_en            (rs2_r_en),
        .rs2_r_addr          (rs2_r_addr),
        .rs2_r_data          (rs2_r_data),

        .rd_w_en             (rd_w_en),
        .rd_w_addr           (rd_w_addr),
        .rd_w_data           (rd_w_data)
    );


    //----------Control and Status Register----------//

    assign csr_r_addr = o_csr_w_addr_id;

    ysyx_210313_CSR ysyx_210313_CSR(
        .clock                           (clock),
        .reset                           (reset),

        .inst_valid                      (inst_valid),
        .flush                           (flush),
        .bubble                          (bubble),
        .stall                           (stall),

        .inst_ecall                      (inst_ecall_mem),
        .inst_mret                       (inst_mret_mem),
        .intr                            (intr),
        .pc_valid                        (pc_valid),
        .inst_jump_or_branch_taken_flag  (inst_jump_or_branch_taken_flag),
        .epc_ex                          (i_pc_ex),
        .epc_mem                         (inst_jump_or_branch_taken_addr),
        .exception_jump_flag             (exception_jump_flag),
        .exception_jump_addr             (exception_jump_addr),
        .mem_r_req                       (mem_r_req),
        .mem_w_req                       (mem_w_req),

        .csr_r_en                        (csr_r_en),
        .csr_r_addr                      (csr_r_addr),
        .csr_r_data                      (csr_r_data),

        .csr_w_en                        (csr_w_en),
        .csr_w_addr                      (csr_w_addr),
        .csr_w_data                      (csr_w_data),

        .mtimefreq                       (mtimefreq)
    );


    //----------Pipeline----------//
    // Instruction Fetch

    ysyx_210313_IF_Stage ysyx_210313_Instruction_Fetch (
        .clock(clock),
        .reset(reset),

        .stall            (stall[0]),
        .flush            (flush),

        .exception_jump_flag                  (exception_jump_flag),
        .exception_jump_addr                  (exception_jump_addr),

        .inst_jump_or_branch_taken_flag       (inst_jump_or_branch_taken_flag),
        .inst_jump_or_branch_taken_addr       (inst_jump_or_branch_taken_addr),

        .inst                                 (o_instruction_if),
        .inst_valid                           (inst_valid),
        .pc                                   (o_pc_if),
        .pc_valid                             (o_pc_valid_if),

        .if_r_req                             (if_r_req),
        .if_r_okay                            (if_r_okay),
        .if_r_handshaked                      (if_r_handshaked),
        .if_data_read                         (if_data_read),
        .if_r_addr                            (if_r_addr),
        .if_r_size                            (if_r_size),
        .if_r_resp                            (if_r_response)
    );


    // Instruction Decode
    ysyx_210313_ID_Stage ysyx_210313_Instruction_Decode (
        .pc_i                            (i_pc_id),
        .pc_o                            (o_pc_id),
        .pc_valid_i                      (i_pc_valid_id),
        .pc_valid_o                      (o_pc_valid_id),
        .inst                            (i_instruction_id),

        .forward_rs1_flag                (forward_rs1_flag),
        .forward_rs2_flag                (forward_rs2_flag),
        .forward_csr_flag                (forward_csr_flag),
        .forward_rs1_data                (forward_rs1_data),
        .forward_rs2_data                (forward_rs2_data), 
        .forward_csr_data                (forward_csr_data),

        .rs1_data_i                      (rs1_r_data),
        .rs2_data_i                      (rs2_r_data),
        .csr_data_i                      (csr_r_data),

        .regbus_A                        (o_regbus_A_id),
        .regbus_B                        (o_regbus_B_id),
        .imm                             (o_imm_id),

        .ALU_oprend_A_src                (o_ALU_oprend_A_src_id),
        .ALU_oprend_B_src                (o_ALU_oprend_B_src_id),
        .ALU_op                          (o_ALU_op_id),
        .ALU_out_ext_type                (o_ALU_out_ext_type_id),

        .rs1_r_en                        (rs1_r_en),
        .rs1_r_addr                      (rs1_r_addr),
        .rs2_r_en                        (rs2_r_en),
        .rs2_r_addr                      (rs2_r_addr),

        .rd_w_en                         (o_rd_w_en_id),
        .rd_w_src                        (o_rd_w_src_id),
        .rd_w_addr                       (o_rd_w_addr_id),

        .csr_r_en                        (csr_r_en),
        .csr_w_en                        (o_csr_w_en_id),
        .csr_rw_addr                     (o_csr_w_addr_id),

        .mem_r_en                        (o_mem_r_en_id),
        .mem_r_ext_type                  (o_mem_r_ext_type_id),
        .mem_w_en                        (o_mem_w_en_id),
        .mem_w_size                      (o_mem_w_size_id),

        .adder_src                       (o_adder_src_id),
        .inst_jump                       (o_inst_jump_id),
        .inst_branch_type                (o_inst_branch_type_id),

        .is_system_inst                  (o_is_system_inst_id),
        .inst_ecall                      (o_inst_ecall_id),
        .inst_mret                       (o_inst_mret_id),
        .inst_fencei                     (inst_fencei),
        .inst_wfi                        (inst_wfi)
    );


    // Execute

    ysyx_210313_EX_Stage ysyx_210313_Execute (
        .pc_i                       (i_pc_ex),
        .pc_valid_i                 (i_pc_valid_ex),
        .pc_o                       (o_pc_ex),
        .pc_valid_o                 (pc_valid),

        .regbus_A                   (i_regbus_A_ex),
        .regbus_B                   (i_regbus_B_ex),
        .imm                        (i_imm_ex),
        .ALU_out                    (o_ALU_out_ex),
        .psw_flags                  (o_psw_flags_ex),

        .ALU_oprend_A_src           (i_ALU_oprend_A_src_ex),
        .ALU_oprend_B_src           (i_ALU_oprend_B_src_ex),
        .ALU_op                     (i_ALU_op_ex),
        .ALU_out_ext_type           (i_ALU_out_ext_type_ex),

        .mem_r_en_i                 (i_mem_r_en_ex),
        .mem_r_ext_type_i           (i_mem_r_ext_type_ex),
        .mem_w_en_i                 (i_mem_w_en_ex),
        .mem_w_size_i               (i_mem_w_size_ex),
        .mem_r_en_o                 (o_mem_r_en_ex),
        .mem_r_ext_type_o           (o_mem_r_ext_type_ex),
        .mem_w_en_o                 (o_mem_w_en_ex),
        .mem_w_size_o               (o_mem_w_size_ex),
        .regbus_B_o                 (o_regbus_B_ex),

        .rd_w_addr_i                (i_rd_w_addr_ex),
        .rd_w_en_i                  (i_rd_w_en_ex),
        .rd_w_src_i                 (i_rd_w_src_ex),
        .rd_w_addr_o                (o_rd_w_addr_ex),
        .rd_w_en_o                  (o_rd_w_en_ex),
        .rd_w_src_o                 (o_rd_w_src_ex),
        .csr_w_en_i                 (i_csr_w_en_ex),
        .csr_w_addr_i               (i_csr_w_addr_ex),
        .csr_w_en_o                 (o_csr_w_en_ex),
        .csr_w_addr_o               (o_csr_w_addr_ex),

        .adder_src                  (i_adder_src_ex),
        .inst_jump_i                (i_inst_jump_ex),
        .inst_branch_type_i         (i_inst_branch_type_ex),
        .inst_jump_o                (o_inst_jump_ex),
        .inst_branch_type_o         (o_inst_branch_type_ex),

        .is_system_inst_i           (i_is_system_inst_ex),
        .is_system_inst_o           (o_is_system_inst_ex),
        .inst_ecall_i               (i_inst_ecall_ex),
        .inst_mret_i                (i_inst_mret_ex),
        .inst_ecall_o               (o_inst_ecall_ex),
        .inst_mret_o                (o_inst_mret_ex)
    );


    // Memory

    ysyx_210313_MEM_Stage ysyx_210313_Memory (
        .inst_jump                             (i_inst_jump_mem),
        .inst_branch_type                      (i_inst_branch_type_mem),
        .psw_flags                             (i_psw_flags_mem),
        .branch_target_pc_i                    (i_branch_target_pc_mem),
        .inst_jump_or_branch_taken_flag        (inst_jump_or_branch_taken_flag),
        .branch_target_pc_o                    (inst_jump_or_branch_taken_addr),

        .rd_w_addr_i                           (i_rd_w_addr_mem),
        .rd_w_en_i                             (i_rd_w_en_mem),
        .rd_w_src_i                            (i_rd_w_src_mem),
        .rd_w_addr_o                           (o_rd_w_addr_mem),
        .rd_w_en_o                             (o_rd_w_en_mem),
        .rd_w_src_o                            (o_rd_w_src_mem),
        .csr_w_en_i                            (i_csr_w_en_mem),
        .csr_w_addr_i                          (i_csr_w_addr_mem),
        .csr_w_en_o                            (o_csr_w_en_mem),
        .csr_w_addr_o                          (o_csr_w_addr_mem),

        .mem_r_en                              (i_mem_r_en_mem),
        .mem_r_ext_type_i                      (i_mem_r_ext_type_mem),
        .mem_w_en                              (i_mem_w_en_mem),
        .mem_w_size_i                          (i_mem_w_size_mem),
        .ALU_out_i                             (i_ALU_out_mem),
        .regbus_B_i                            (i_regbus_B_mem),
        .mem_r_ext_type_o                      (o_mem_r_ext_type_mem),
        .regbus_C                              (o_regbus_C_mem),
        .regbus_D                              (o_regbus_D_mem),
        .mem_stall_req                         (mem_stall_req),

        .is_system_inst                        (i_is_system_inst_mem),
        .inst_ecall_i                          (i_inst_ecall_mem),
        .inst_mret_i                           (i_inst_mret_mem),
        .inst_ecall_o                          (inst_ecall_mem),
        .inst_mret_o                           (inst_mret_mem),

        .mem_r_req              (mem_r_req),
        .mem_r_okay             (mem_r_okay),
        .mem_data_read          (mem_data_read),
        .mem_r_addr             (mem_r_addr),
        .mem_r_size             (mem_r_size),
        .mem_r_resp             (mem_r_response),
        .mem_w_req              (mem_w_req),
        .mem_w_okay             (mem_w_okay),
        .mem_data_write         (mem_data_write),
        .mem_w_addr             (mem_w_addr),
        .mem_w_size             (mem_w_size),
        .mem_w_resp             (mem_w_response)
    );


    // Write Back
    ysyx_210313_WB_Stage ysyx_210313_Write_Back (
        .regbus_C               (i_regbus_C_wb),
        .regbus_D               (i_regbus_D_wb),
        .mem_r_ext_type         (i_mem_r_ext_type_wb),
        .rd_w_addr_i            (i_rd_w_addr_wb),
        .rd_w_en_i              (i_rd_w_en_wb),
        .rd_w_src               (i_rd_w_src_wb),
        .rd_w_addr_o            (rd_w_addr),
        .rd_w_en_o              (rd_w_en),
        .rd_w_data              (rd_w_data),
        .csr_w_en_i             (i_csr_w_en_wb),
        .csr_w_addr_i           (i_csr_w_addr_wb),
        .csr_w_en_o             (csr_w_en),
        .csr_w_addr_o           (csr_w_addr),
        .csr_data               (csr_w_data)
    );


    //----------Pipeline Regs----------//

    ysyx_210313_pipeline_regs ysyx_210313_pipeline_regs (
        .clock(clock),
        .reset(reset),

        .bubble(bubble),
        .flush(flush),
        .stall(stall),

        .o_pc_valid_if                 (o_pc_valid_if),
        .o_pc_if                       (o_pc_if),
        .o_instruction_if              (o_instruction_if),
        .i_pc_valid_id                 (i_pc_valid_id),
        .i_pc_id                       (i_pc_id),
        .i_instruction_id              (i_instruction_id),

        .o_regbus_A_id                 (o_regbus_A_id),
        .o_regbus_B_id                 (o_regbus_B_id),
        .o_imm_id                      (o_imm_id),
        .o_ALU_oprend_A_src_id         (o_ALU_oprend_A_src_id),
        .o_ALU_oprend_B_src_id         (o_ALU_oprend_B_src_id),
        .o_ALU_op_id                   (o_ALU_op_id),
        .o_ALU_out_ext_type_id         (o_ALU_out_ext_type_id),
        .o_adder_src_id                (o_adder_src_id),
        .o_pc_id                       (o_pc_id),
        .o_pc_valid_id                 (o_pc_valid_id),
        .o_mem_r_en_id                 (o_mem_r_en_id),
        .o_mem_r_ext_type_id           (o_mem_r_ext_type_id),
        .o_mem_w_en_id                 (o_mem_w_en_id),
        .o_mem_w_size_id               (o_mem_w_size_id),
        .o_inst_jump_id                (o_inst_jump_id),
        .o_inst_branch_type_id         (o_inst_branch_type_id),
        .o_is_system_inst_id           (o_is_system_inst_id),
        .o_inst_ecall_id               (o_inst_ecall_id),
        .o_inst_mret_id                (o_inst_mret_id),
        .o_rd_w_en_id                  (o_rd_w_en_id),
        .o_rd_w_src_id                 (o_rd_w_src_id),
        .o_rd_w_addr_id                (o_rd_w_addr_id),
        .o_csr_w_en_id                 (o_csr_w_en_id),
        .o_csr_w_addr_id               (o_csr_w_addr_id),        
        .i_regbus_A_ex                 (i_regbus_A_ex),
        .i_regbus_B_ex                 (i_regbus_B_ex),
        .i_imm_ex                      (i_imm_ex),
        .i_ALU_oprend_A_src_ex         (i_ALU_oprend_A_src_ex),
        .i_ALU_oprend_B_src_ex         (i_ALU_oprend_B_src_ex),
        .i_ALU_op_ex                   (i_ALU_op_ex),
        .i_ALU_out_ext_type_ex         (i_ALU_out_ext_type_ex),
        .i_adder_src_ex                (i_adder_src_ex),
        .i_pc_ex                       (i_pc_ex),
        .i_pc_valid_ex                 (i_pc_valid_ex),
        .i_mem_r_en_ex                 (i_mem_r_en_ex),
        .i_mem_r_ext_type_ex           (i_mem_r_ext_type_ex),
        .i_mem_w_en_ex                 (i_mem_w_en_ex),
        .i_mem_w_size_ex               (i_mem_w_size_ex),
        .i_inst_jump_ex                (i_inst_jump_ex),
        .i_inst_branch_type_ex         (i_inst_branch_type_ex),
        .i_is_system_inst_ex           (i_is_system_inst_ex),
        .i_inst_ecall_ex               (i_inst_ecall_ex),
        .i_inst_mret_ex                (i_inst_mret_ex),
        .i_rd_w_en_ex                  (i_rd_w_en_ex),
        .i_rd_w_src_ex                 (i_rd_w_src_ex),
        .i_rd_w_addr_ex                (i_rd_w_addr_ex),
        .i_csr_w_en_ex                 (i_csr_w_en_ex),
        .i_csr_w_addr_ex               (i_csr_w_addr_ex),

        .o_pc_ex                       (o_pc_ex),
        .o_ALU_out_ex                  (o_ALU_out_ex),
        .o_psw_flags_ex                (o_psw_flags_ex),
        .o_mem_r_en_ex                 (o_mem_r_en_ex),
        .o_mem_r_ext_type_ex           (o_mem_r_ext_type_ex),
        .o_mem_w_en_ex                 (o_mem_w_en_ex),
        .o_mem_w_size_ex               (o_mem_w_size_ex),
        .o_regbus_B_ex                 (o_regbus_B_ex),
        .o_rd_w_addr_ex                (o_rd_w_addr_ex),
        .o_rd_w_en_ex                  (o_rd_w_en_ex),
        .o_rd_w_src_ex                 (o_rd_w_src_ex),
        .o_csr_w_en_ex                 (o_csr_w_en_ex),
        .o_csr_w_addr_ex               (o_csr_w_addr_ex),
        .o_inst_jump_ex                (o_inst_jump_ex),
        .o_inst_branch_type_ex         (o_inst_branch_type_ex),
        .o_is_system_inst_ex           (o_is_system_inst_ex),
        .o_inst_ecall_ex               (o_inst_ecall_ex),
        .o_inst_mret_ex                (o_inst_mret_ex),
        .i_branch_target_pc_mem        (i_branch_target_pc_mem),
        .i_ALU_out_mem                 (i_ALU_out_mem),
        .i_psw_flags_mem               (i_psw_flags_mem),
        .i_mem_r_en_mem                (i_mem_r_en_mem),
        .i_mem_r_ext_type_mem          (i_mem_r_ext_type_mem),
        .i_mem_w_en_mem                (i_mem_w_en_mem),
        .i_mem_w_size_mem              (i_mem_w_size_mem),
        .i_regbus_B_mem                (i_regbus_B_mem),
        .i_rd_w_addr_mem               (i_rd_w_addr_mem),
        .i_rd_w_en_mem                 (i_rd_w_en_mem),
        .i_rd_w_src_mem                (i_rd_w_src_mem),
        .i_csr_w_en_mem                (i_csr_w_en_mem),
        .i_csr_w_addr_mem              (i_csr_w_addr_mem),
        .i_inst_jump_mem               (i_inst_jump_mem),
        .i_inst_branch_type_mem        (i_inst_branch_type_mem),
        .i_is_system_inst_mem          (i_is_system_inst_mem),
        .i_inst_ecall_mem              (i_inst_ecall_mem),
        .i_inst_mret_mem               (i_inst_mret_mem),

        .o_rd_w_addr_mem               (o_rd_w_addr_mem),
        .o_rd_w_en_mem                 (o_rd_w_en_mem),
        .o_rd_w_src_mem                (o_rd_w_src_mem),
        .o_csr_w_en_mem                (o_csr_w_en_mem),
        .o_csr_w_addr_mem              (o_csr_w_addr_mem),
        .o_mem_r_ext_type_mem          (o_mem_r_ext_type_mem),
        .o_regbus_C_mem                (o_regbus_C_mem),
        .o_regbus_D_mem                (o_regbus_D_mem),
        .i_rd_w_addr_wb                (i_rd_w_addr_wb),
        .i_rd_w_en_wb                  (i_rd_w_en_wb),
        .i_rd_w_src_wb                 (i_rd_w_src_wb),
        .i_csr_w_en_wb                 (i_csr_w_en_wb),
        .i_csr_w_addr_wb               (i_csr_w_addr_wb),
        .i_mem_r_ext_type_wb           (i_mem_r_ext_type_wb),
        .i_regbus_C_wb                 (i_regbus_C_wb),
        .i_regbus_D_wb                 (i_regbus_D_wb)
    );


    //---------- Hazard Detection ----------//

    ysyx_210313_Hazard_Detection ysyx_210313_Hazard_Detection(
        .rs1_addr                         (rs1_r_addr),
        .rs2_addr                         (rs2_r_addr),
        .rd_addr_ex                       (o_rd_w_addr_ex),
        .rd_addr_mem                      (o_rd_w_addr_mem),
        .rd_w_en_ex                       (o_rd_w_en_ex),
        .csr_w_en_ex                      (o_csr_w_en_ex),
        .rd_w_src_ex                      (o_rd_w_src_ex),
        .rd_w_src_mem                     (o_rd_w_src_mem),
        .mem_stall_req                    (mem_stall_req),
        .inst_fencei                      (inst_fencei),
        .inst_wfi                         (inst_wfi),
        .bubble                           (bubble),
        .stall                            (stall),
        .inst_jump_or_branch_taken_flag   (inst_jump_or_branch_taken_flag),
        .exception_jump_flag              (exception_jump_flag),
        .flush                            (flush)
    );


    //---------- Forwarding ----------//

    ysyx_210313_Forwarding ysyx_210313_Forwarding(
        .rs1_r_addr                  (rs1_r_addr),
        .rs2_r_addr                  (rs2_r_addr),
        .csr_r_addr                  (csr_r_addr),

        .rd_w_addr_ex                (o_rd_w_addr_ex),
        .rd_w_addr_mem               (o_rd_w_addr_mem),
        .rd_w_addr_wb                (rd_w_addr),
        .csr_w_addr_ex               (o_csr_w_addr_ex),
        .csr_w_addr_mem              (o_csr_w_addr_mem),
        .csr_w_addr_wb               (csr_w_addr),

        .rd_w_en_ex                  (o_rd_w_en_ex),
        .rd_w_en_mem                 (o_rd_w_en_mem),
        .rd_w_en_wb                  (rd_w_en),
        .rd_w_src_ex                 (o_rd_w_src_ex),
        .rd_w_src_mem                (o_rd_w_src_mem),
        .csr_w_en_ex                 (o_csr_w_en_ex),
        .csr_w_en_mem                (o_csr_w_en_mem),
        .csr_w_en_wb                 (csr_w_en),
        .forward_rs1_flag            (forward_rs1_flag),
        .forward_rs2_flag            (forward_rs2_flag),
        .forward_csr_flag            (forward_csr_flag),

        .rd_w_data_ex                (o_ALU_out_ex),
        .rd_w_data_mem               (o_regbus_D_mem),
        .rd_w_data_wb                (rd_w_data),
        .csr_w_data_ex               (o_ALU_out_ex),
        .csr_w_data_mem              (o_regbus_C_mem),
        .csr_w_data_wb               (csr_w_data),
        .forward_rs1_data            (forward_rs1_data),
        .forward_rs2_data            (forward_rs2_data),
        .forward_csr_data            (forward_csr_data)
    );


    //---------- Core-local Interrupter ----------//

    ysyx_210313_clint ysyx_210313_clint (
        .clock            (clock),
        .reset_n          (~reset),

        .intr             (intr),
        .mtimefreq        (mtimefreq),

        .clint_aw_ready   (clint_aw_ready),
        .clint_aw_valid   (clint_aw_valid),
        .clint_aw_addr    (clint_aw_addr),
        .clint_aw_id      (clint_aw_id),
        .clint_aw_len     (clint_aw_len),

        .clint_w_ready    (clint_w_ready),
        .clint_w_valid    (clint_w_valid),
        .clint_w_data     (clint_w_data),
        .clint_w_strb     (clint_w_strb),
        .clint_w_last     (clint_w_last),

        .clint_b_ready    (clint_b_ready),
        .clint_b_valid    (clint_b_valid),
        .clint_b_resp     (clint_b_resp),
        .clint_b_id       (clint_b_id),

        .clint_ar_ready   (clint_ar_ready),
        .clint_ar_valid   (clint_ar_valid),
        .clint_ar_addr    (clint_ar_addr),
        .clint_ar_id      (clint_ar_id),
        .clint_ar_len     (clint_ar_len),

        .clint_r_ready    (clint_r_ready),
        .clint_r_valid    (clint_r_valid),
        .clint_r_resp     (clint_r_resp),
        .clint_r_data     (clint_r_data),
        .clint_r_last     (clint_r_last),
        .clint_r_id       (clint_r_id)
    );


    //---------- AXI Interconnect ----------//

    ysyx_210313_axi_rw_if # (
        .AXI_ID(0)
    ) ysyx_210313_if_axi_rw (
        .clock            (clock),
        .reset_n          (~reset),

        .r_req            (if_r_req),
        .r_handshaked     (if_r_handshaked),
        .r_okay           (if_r_okay),
        .data_read        (if_data_read),
        .r_addr           (if_r_addr),
        .r_size           (if_r_size),
        .r_resp           (if_r_response),

        .axi_ar_ready_i   (if_ar_ready),
        .axi_ar_valid_o   (if_ar_valid),
        .axi_ar_addr_o    (if_ar_addr),
        .axi_ar_id_o      (if_ar_id),
        .axi_ar_len_o     (if_ar_len),
        .axi_ar_size_o    (if_ar_size),
        .axi_ar_burst_o   (if_ar_burst),

        .axi_r_ready_o    (if_r_ready),
        .axi_r_valid_i    (if_r_valid),
        .axi_r_resp_i     (if_r_resp),
        .axi_r_data_i     (if_r_data),
        .axi_r_last_i     (if_r_last)
    );


    ysyx_210313_axi_rw_mem # (
        .AXI_ID(1)
    ) ysyx_210313_mem_axi_rw (
        .clock            (clock),
        .reset_n          (~reset),

        .r_req            (mem_r_req),
        .r_okay           (mem_r_okay),
        .data_read        (mem_data_read),
        .r_addr           (mem_r_addr),
        .r_size           (mem_r_size),
        .r_resp           (mem_r_response),

        .w_req            (mem_w_req),
        .w_okay           (mem_w_okay),
        .data_write       (mem_data_write),
        .w_addr           (mem_w_addr),
        .w_size           (mem_w_size),
        .w_resp           (mem_w_response),

        .axi_aw_ready_i   (mem_aw_ready),
        .axi_aw_valid_o   (mem_aw_valid),
        .axi_aw_addr_o    (mem_aw_addr),
        .axi_aw_id_o      (mem_aw_id),
        .axi_aw_len_o     (mem_aw_len),
        .axi_aw_size_o    (mem_aw_size),
        .axi_aw_burst_o   (mem_aw_burst),

        .axi_w_ready_i    (mem_w_ready),
        .axi_w_valid_o    (mem_w_valid),
        .axi_w_data_o     (mem_w_data),
        .axi_w_strb_o     (mem_w_strb),
        .axi_w_last_o     (mem_w_last),

        .axi_b_ready_o    (mem_b_ready),
        .axi_b_valid_i    (mem_b_valid),
        .axi_b_resp_i     (mem_b_resp),

        .axi_ar_ready_i   (mem_ar_ready),
        .axi_ar_valid_o   (mem_ar_valid),
        .axi_ar_addr_o    (mem_ar_addr),
        .axi_ar_id_o      (mem_ar_id),
        .axi_ar_len_o     (mem_ar_len),
        .axi_ar_size_o    (mem_ar_size),
        .axi_ar_burst_o   (mem_ar_burst),

        .axi_r_ready_o    (mem_r_ready),
        .axi_r_valid_i    (mem_r_valid),
        .axi_r_resp_i     (mem_r_resp),
        .axi_r_data_i     (mem_r_data),
        .axi_r_last_i     (mem_r_last)
    );


    ysyx_210313_axi_interconnect ysyx_210313_axi_interconnect(
        .clock            (clock),
        .reset_n          (~reset),


        .if_ar_ready      (if_ar_ready),
        .if_ar_valid      (if_ar_valid),
        .if_ar_addr       (if_ar_addr),
        .if_ar_id         (if_ar_id),
        .if_ar_len        (if_ar_len),
        .if_ar_size       (if_ar_size),
        .if_ar_burst      (if_ar_burst),

        .if_r_ready       (if_r_ready),
        .if_r_valid       (if_r_valid),
        .if_r_resp        (if_r_resp),
        .if_r_data        (if_r_data),
        .if_r_last        (if_r_last),

        .mem_aw_ready     (mem_aw_ready),
        .mem_aw_valid     (mem_aw_valid),
        .mem_aw_addr      (mem_aw_addr),
        .mem_aw_id        (mem_aw_id),
        .mem_aw_len       (mem_aw_len),
        .mem_aw_size      (mem_aw_size),
        .mem_aw_burst     (mem_aw_burst),

        .mem_w_ready      (mem_w_ready),
        .mem_w_valid      (mem_w_valid),
        .mem_w_data       (mem_w_data),
        .mem_w_strb       (mem_w_strb),
        .mem_w_last       (mem_w_last),

        .mem_b_ready      (mem_b_ready),
        .mem_b_valid      (mem_b_valid),
        .mem_b_resp       (mem_b_resp),

        .mem_ar_ready     (mem_ar_ready),
        .mem_ar_valid     (mem_ar_valid),
        .mem_ar_addr      (mem_ar_addr),
        .mem_ar_id        (mem_ar_id),
        .mem_ar_len       (mem_ar_len),
        .mem_ar_size      (mem_ar_size),
        .mem_ar_burst     (mem_ar_burst),

        .mem_r_ready      (mem_r_ready),
        .mem_r_valid      (mem_r_valid),
        .mem_r_resp       (mem_r_resp),
        .mem_r_data       (mem_r_data),
        .mem_r_last       (mem_r_last),

        .clint_aw_ready   (clint_aw_ready),
        .clint_aw_valid   (clint_aw_valid),
        .clint_aw_addr    (clint_aw_addr),
        .clint_aw_id      (clint_aw_id),
        .clint_aw_len     (clint_aw_len),

        .clint_w_ready    (clint_w_ready),
        .clint_w_valid    (clint_w_valid),
        .clint_w_data     (clint_w_data),
        .clint_w_strb     (clint_w_strb),
        .clint_w_last     (clint_w_last),

        .clint_b_ready    (clint_b_ready),
        .clint_b_valid    (clint_b_valid),
        .clint_b_resp     (clint_b_resp),

        .clint_ar_ready   (clint_ar_ready),
        .clint_ar_valid   (clint_ar_valid),
        .clint_ar_addr    (clint_ar_addr),
        .clint_ar_id      (clint_ar_id),
        .clint_ar_len     (clint_ar_len),

        .clint_r_ready    (clint_r_ready),
        .clint_r_valid    (clint_r_valid),
        .clint_r_resp     (clint_r_resp),
        .clint_r_data     (clint_r_data),
        .clint_r_last     (clint_r_last),
        .clint_r_id       (clint_r_id),

        .axi_aw_ready     (io_master_awready),
        .axi_aw_valid     (io_master_awvalid),
        .axi_aw_addr      (io_master_awaddr),
        .axi_aw_id        (io_master_awid),
        .axi_aw_len       (io_master_awlen),
        .axi_aw_size      (io_master_awsize),
        .axi_aw_burst     (io_master_awburst),

        .axi_w_ready      (io_master_wready),
        .axi_w_valid      (io_master_wvalid),
        .axi_w_data       (io_master_wdata),
        .axi_w_strb       (io_master_wstrb),
        .axi_w_last       (io_master_wlast),

        .axi_b_ready      (io_master_bready),
        .axi_b_valid      (io_master_bvalid),
        .axi_b_resp       (io_master_bresp),

        .axi_ar_ready     (io_master_arready),
        .axi_ar_valid     (io_master_arvalid),
        .axi_ar_addr      (io_master_araddr),
        .axi_ar_id        (io_master_arid),
        .axi_ar_len       (io_master_arlen),
        .axi_ar_size      (io_master_arsize),
        .axi_ar_burst     (io_master_arburst),

        .axi_r_ready      (io_master_rready),
        .axi_r_valid      (io_master_rvalid),
        .axi_r_resp       (io_master_rresp),
        .axi_r_data       (io_master_rdata),
        .axi_r_last       (io_master_rlast),
        .axi_r_id         (io_master_rid)
    );


endmodule


//---------- Sub Modules ----------//

module ysyx_210313_regfile (
    input  wire                                    clock,
    input  wire                                    reset,
    
    //read port
	input  wire                                    rs1_r_en,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs1_r_addr,
    output wire [`YSYX210313_XLEN-1:0]             rs1_r_data,

	input  wire                                    rs2_r_en,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs2_r_addr,
    output wire [`YSYX210313_XLEN-1:0]             rs2_r_data,

    //write port
    input  wire                                    rd_w_en,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr,
    input  wire [`YSYX210313_XLEN-1:0]             rd_w_data
);

	reg [63: 0] rf [31: 0];
	//----------Write Port----------//
	always @(posedge clock) begin
	    if (reset) begin
	        rf[ 0] <= `YSYX210313_ZERO_WORD;
			rf[ 1] <= `YSYX210313_ZERO_WORD;
			rf[ 2] <= `YSYX210313_ZERO_WORD;
			rf[ 3] <= `YSYX210313_ZERO_WORD;
			rf[ 4] <= `YSYX210313_ZERO_WORD;
			rf[ 5] <= `YSYX210313_ZERO_WORD;
			rf[ 6] <= `YSYX210313_ZERO_WORD;
			rf[ 7] <= `YSYX210313_ZERO_WORD;
			rf[ 8] <= `YSYX210313_ZERO_WORD;
			rf[ 9] <= `YSYX210313_ZERO_WORD;
			rf[10] <= `YSYX210313_ZERO_WORD;
			rf[11] <= `YSYX210313_ZERO_WORD;
			rf[12] <= `YSYX210313_ZERO_WORD;
			rf[13] <= `YSYX210313_ZERO_WORD;
			rf[14] <= `YSYX210313_ZERO_WORD;
			rf[15] <= `YSYX210313_ZERO_WORD;
			rf[16] <= `YSYX210313_ZERO_WORD;
			rf[17] <= `YSYX210313_ZERO_WORD;
			rf[18] <= `YSYX210313_ZERO_WORD;
			rf[19] <= `YSYX210313_ZERO_WORD;
			rf[20] <= `YSYX210313_ZERO_WORD;
			rf[21] <= `YSYX210313_ZERO_WORD;
			rf[22] <= `YSYX210313_ZERO_WORD;
			rf[23] <= `YSYX210313_ZERO_WORD;
			rf[24] <= `YSYX210313_ZERO_WORD;
			rf[25] <= `YSYX210313_ZERO_WORD;
			rf[26] <= `YSYX210313_ZERO_WORD;
			rf[27] <= `YSYX210313_ZERO_WORD;
			rf[28] <= `YSYX210313_ZERO_WORD;
			rf[29] <= `YSYX210313_ZERO_WORD;
			rf[30] <= `YSYX210313_ZERO_WORD;
			rf[31] <= `YSYX210313_ZERO_WORD;
	    end
	    else if (rd_w_en & (|rd_w_addr)) rf[rd_w_addr] <= rd_w_data;
	end

	//----------Read Port----------//
	assign rs1_r_data = (reset | ~rs1_r_en)      ?  `YSYX210313_ZERO_WORD  :
	                    (rs1_r_addr == 5'b00000) ?  `YSYX210313_ZERO_WORD  :  rf[rs1_r_addr]  ;

	assign rs2_r_data = (reset | ~rs2_r_en)      ?  `YSYX210313_ZERO_WORD  :
	                    (rs2_r_addr == 5'b00000) ?  `YSYX210313_ZERO_WORD  :  rf[rs2_r_addr]  ;

endmodule


module ysyx_210313_CSR (
    input  wire                               clock,
    input  wire                               reset,

    input  wire                               inst_valid,
    input  wire                               flush,
    input  wire                               bubble,
    input  wire [3:0]                         stall,

    //exception
    input  wire                               inst_ecall,
    input  wire                               inst_mret,
    input  wire                               intr,
    input  wire                               pc_valid,
    input  wire                               inst_jump_or_branch_taken_flag,
    input  wire [`YSYX210313_ADDRBUSLEN-1: 0] epc_ex,
    input  wire [`YSYX210313_ADDRBUSLEN-1: 0] epc_mem,
    input  wire                               mem_r_req,
    input  wire                               mem_w_req,
    output wire                               exception_jump_flag,
    output wire [`YSYX210313_ADDRBUSLEN-1: 0] exception_jump_addr,

    //read port
    input  wire                               csr_r_en,
    input  wire [11: 0]                       csr_r_addr,
    output wire [`YSYX210313_MXLEN-1:0]       csr_r_data,

    //write port
    input  wire                               csr_w_en,
    input  wire [11: 0]                       csr_w_addr,
    input  wire [`YSYX210313_MXLEN-1:0]       csr_w_data,

    output reg  [`YSYX210313_MXLEN-1:0]       mtimefreq
);

    //Machine Information Registers
    reg [`YSYX210313_MXLEN-1:0] mhartid;
    reg [`YSYX210313_MXLEN-1:0] name_char1;
    reg [`YSYX210313_MXLEN-1:0] name_char2;
    reg [`YSYX210313_MXLEN-1:0] name_char3;
    
    //Machine Trap Setup
    reg [`YSYX210313_MXLEN-1:0] mstatus;
    reg [`YSYX210313_MXLEN-1:0] mie;
    reg [`YSYX210313_MXLEN-1:0] mtvec;
    
    //Machine Trap Handling
    reg [`YSYX210313_MXLEN-1:0] mscratch;
    reg [`YSYX210313_MXLEN-1:0] mepc;
    reg [`YSYX210313_MXLEN-1:0] mcause;
    reg [`YSYX210313_MXLEN-1:0] mip;
    
    //Machine Counter/Timers
    reg [`YSYX210313_MXLEN-1:0] mcycle;
    reg [`YSYX210313_MXLEN-1:0] minstret;

    //----------State Machine----------//
    localparam idle               = 3'b000;
    localparam env_call_operate   = 3'b011;
    localparam timer_intr_pre     = 3'b100;
    localparam timer_intr_operate = 3'b101;
    localparam mret_operate       = 3'b001;

    reg [2:0] csr_state;
    reg [2:0] next_state;
    reg [`YSYX210313_ADDRBUSLEN-1:0] mepc_pre;

    wire   t_intr = intr & mie[`YSYX210313_MIE_MTIE] & mstatus[`YSYX210313_MSTATUS_MIE] & ~inst_ecall & pc_valid;
    
    assign exception_jump_flag = t_intr & ~mem_w_req & ~mem_r_req | inst_ecall | inst_mret;
    assign exception_jump_addr = inst_mret ? {mepc[`YSYX210313_ADDRBUSLEN-1:2],2'b0} : {mtvec[`YSYX210313_ADDRBUSLEN-1:2],2'b0};

    always @(*) begin
        case(csr_state)
            idle               : next_state = inst_ecall                          ?  env_call_operate  :
                                              (t_intr & ~mem_w_req & ~mem_r_req)  ?  timer_intr_pre    : 
                                              inst_mret                           ?  mret_operate      :  idle  ;
            env_call_operate   : next_state = idle;
            timer_intr_pre     : next_state = timer_intr_operate;
            timer_intr_operate : next_state = idle;
            mret_operate       : next_state = idle;
            default            : next_state = idle;
        endcase
    end

    always @(posedge clock) begin
        if(reset) csr_state <= idle;
        else      csr_state <= next_state;
    end

    //----------Instret Count----------//
    reg  [3:0] inst_okay;

    always @(posedge clock) begin
        if(reset)      inst_okay      <= 0;
        else if(flush) begin
            inst_okay[3]   <= inst_okay[2];
            inst_okay[2:0] <= 0;
        end
        else begin
            if(~stall[2]) inst_okay[3] <= inst_okay[2];
            if(~stall[1]) inst_okay[2] <= inst_okay[1];
            if(~stall[0]) inst_okay[1] <= bubble ? 0 : inst_okay[0];
            if(~stall[0]) inst_okay[0] <= inst_valid;
        end
    end

    //----------Write Port----------//
    always @(posedge clock) begin
        if(reset) begin
            mhartid   <= 0;
            mstatus   <= 0;
            mie       <= 0;
            mtvec     <= 0;
            mscratch  <= 0;
            mepc_pre  <= 0;
            mepc      <= 0;
            mcause    <= 0;
            mip       <= 0;
            mcycle    <= 0;
            minstret  <= 0;
            mtimefreq <= 64'd9;
        end
        else begin
            if(csr_state == idle) mepc_pre <= (inst_ecall | inst_jump_or_branch_taken_flag) ? epc_mem : epc_ex;
            if(csr_w_en & (csr_state == idle | csr_state == timer_intr_pre)) begin
                if(csr_w_addr == `YSYX210313_MSTATUS_ADDR)   mstatus   <= {csr_w_data[14] & csr_w_data[13],csr_w_data[`YSYX210313_MXLEN-2:17],2'b0,csr_w_data[14:0]};
                if(csr_w_addr == `YSYX210313_MEPC_ADDR)      mepc      <= csr_w_data;
                if(csr_w_addr == `YSYX210313_MCAUSE_ADDR)    mcause    <= csr_w_data;
                if(csr_w_addr == `YSYX210313_MIE_ADDR)       mie       <= csr_w_data;
                if(csr_w_addr == `YSYX210313_MTVEC_ADDR)     mtvec     <= csr_w_data;
                if(csr_w_addr == `YSYX210313_MSCRATCH_ADDR)  mscratch  <= csr_w_data;
                if(csr_w_addr == `YSYX210313_MIP_ADDR)       mip       <= { csr_w_data[`YSYX210313_MXLEN-1:`YSYX210313_MIP_MTIP+1] , 1'b0 , csr_w_data[`YSYX210313_MIP_MTIP-1:0] };
                if(csr_w_addr == `YSYX210313_MCYCLE_ADDR)    mcycle    <= csr_w_data;
                else                                         mcycle    <= mcycle + 64'b1;
                if(csr_w_addr == `YSYX210313_MINSTRET_ADDR)  minstret  <= csr_w_data;
                if(csr_w_addr == `YSYX210313_MTIMEFREQ_ADDR) mtimefreq <= csr_w_data; 
            end
            else if(csr_state == env_call_operate | csr_state == timer_intr_operate | csr_state == mret_operate) begin
                mstatus[`YSYX210313_MSTATUS_MPP]  <= (csr_state == mret_operate) ?  2'b00  :  2'b11  ;
                mstatus[`YSYX210313_MSTATUS_MPIE] <= (csr_state == mret_operate) ?  1'b1  :  mstatus[`YSYX210313_MSTATUS_MIE]  ;
                mstatus[`YSYX210313_MSTATUS_MIE]  <= (csr_state == mret_operate) ?  mstatus[`YSYX210313_MSTATUS_MPIE]  :  1'b0  ;
                mepc   <= (csr_state == mret_operate) ?  mepc  :  { 32'b0 , mepc_pre}  ;
                mcause <= (csr_state == mret_operate) ?  mcause  :  (csr_state == env_call_operate) ?  `YSYX210313_ECALL_FROM_M_MODE  :  `YSYX210313_MACHINE_TIMER_INTERRUPT  ;
                mcycle <= mcycle + 64'b1;
                if(~stall[3] & inst_okay[3]) minstret <= minstret + 64'b1;
                mip[`YSYX210313_MIP_MTIP] <= 0;
            end
            else begin
                mcycle <= mcycle + 64'b1;
                if(~stall[3] & inst_okay[3]) minstret <= minstret + 64'b1;
                mip[`YSYX210313_MIP_MTIP] <= 0;
            end
        end
    end

    always @(posedge clock) begin
        if(reset) begin
            name_char1 <= 64'h738b;
            name_char2 <= 64'h6881;
            name_char3 <= 64'h8f89;
        end
    end


    //----------Read Port----------//
    assign csr_r_data = (reset | ~csr_r_en)                          ?  `YSYX210313_ZERO_WORD               : 
                        (csr_r_addr == `YSYX210313_MHARTID_ADDR)     ?  mhartid                             :
                        (csr_r_addr == `YSYX210313_MSTATUS_ADDR)     ?  mstatus                             :
                        (csr_r_addr == `YSYX210313_MIE_ADDR)         ?  mie                                 :
                        (csr_r_addr == `YSYX210313_MTVEC_ADDR)       ?  mtvec                               :
                        (csr_r_addr == `YSYX210313_MSCRATCH_ADDR)    ?  mscratch                            :
                        (csr_r_addr == `YSYX210313_MEPC_ADDR)        ?  {mepc[`YSYX210313_MXLEN-1:2],2'b0}  :
                        (csr_r_addr == `YSYX210313_MCAUSE_ADDR)      ?  mcause                              :
                        (csr_r_addr == `YSYX210313_MIP_ADDR)         ?  mip                                 :
                        (csr_r_addr == `YSYX210313_MCYCLE_ADDR)      ?  mcycle                              :
                        (csr_r_addr == `YSYX210313_MINSTRET_ADDR)    ?  minstret                            : 
                        (csr_r_addr == `YSYX210313_MTIMEFREQ_ADDR)   ?  mtimefreq                           :  
                        (csr_r_addr == `YSYX210313_NAME_CHAR1_ADDR)  ?  name_char1                          :
                        (csr_r_addr == `YSYX210313_NAME_CHAR2_ADDR)  ?  name_char2                          :
                        (csr_r_addr == `YSYX210313_NAME_CHAR3_ADDR)  ?  name_char3                          :  64'b0  ;

endmodule


module ysyx_210313_IF_Stage (
    input  wire                                  clock,
    input  wire                                  reset,

    input  wire                                  stall,
    input  wire                                  flush,

    input  wire                                  exception_jump_flag,
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]     exception_jump_addr,

    input  wire                                  inst_jump_or_branch_taken_flag,
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]     inst_jump_or_branch_taken_addr,

    output wire                                  pc_valid,
    output wire                                  inst_valid,
    output wire [`YSYX210313_INSTLEN-1:0]        inst,
    output reg  [`YSYX210313_ADDRBUSLEN-1:0]     pc,

    // To axi_rw
    output wire                                  if_r_req,
    input  wire                                  if_r_okay,
    input  wire                                  if_r_handshaked,
    input  wire [`YSYX210313_AXI_DATA_WIDTH-1:0] if_data_read,
    output wire [`YSYX210313_AXI_ADDR_WIDTH-1:0] if_r_addr,
    output wire [ 1: 0]                          if_r_size,
    input  wire [ 1: 0]                          if_r_resp
);

    //----------Instruction Fetching----------//
    wire inst_fetched;
    reg  inst_fetched_keep;
    reg  inst_prefetched;
    wire inst_fetched_keep_en;
    wire inst_fetched_keep_rst;
    wire inst_prefetched_en;
    wire inst_prefetched_rst;

    reg  prefetching_enable;
    reg  prefetching_enable_en;
    always @(posedge clock) begin
        if(reset) begin
            prefetching_enable <= 1'b0;
            prefetching_enable_en <= 1'b1;
        end
        else if(if_r_req & if_r_handshaked & prefetching_enable_en) begin
            prefetching_enable <= 0;
            prefetching_enable_en <= 1'b0;
        end
        else if(if_r_okay) begin
            prefetching_enable_en <= 1'b1;
        end
    end

    // Instruction Prefetch
    assign inst_prefetched_en  = (inst_fetched | inst_fetched_keep) & ~stall & prefetching_enable;
    assign inst_prefetched_rst = inst_prefetched & ~stall | flush;

    always @(posedge clock) begin
        if(reset) inst_prefetched <= 0;
        else if(inst_prefetched_rst) inst_prefetched <= 0;
        else if(inst_prefetched_en)  inst_prefetched <= 1'b1;
    end

    // Instruction Fetching
    assign inst_fetched_keep_en  = inst_fetched & stall & prefetching_enable;
    assign inst_fetched_keep_rst = inst_fetched_keep & ~stall | flush;
    
    always @(posedge clock) begin
        if(reset) inst_fetched_keep <= 0;
        else if(inst_fetched_keep_rst) inst_fetched_keep <= 0;
        else if(inst_fetched_keep_en)  inst_fetched_keep <= 1'b1;
    end

    assign if_r_req  = ~inst_fetched & ~inst_fetched_keep & ~inst_prefetched;
    assign if_r_addr = pc;
    assign if_r_size = pc[31] ?  `YSYX210313_SIZE_D  :  `YSYX210313_SIZE_W;

    // Instruction Fetched Discard Mechanism
    reg discard;

    always@(posedge clock) begin
        if(reset)          discard <= 1'b0;
        else if(if_r_okay) discard <= 1'b0;
        else if(flush)     discard <= if_r_handshaked;
        else               discard <= discard;
    end

    assign inst_fetched = if_r_okay & ~discard & (if_r_resp == 0);
    assign inst =  (inst_fetched | inst_fetched_keep)  ?  if_data_read[31:0]   :  
                   inst_prefetched                     ?  if_data_read[63:32]  :  32'h13  ;

    assign pc_valid = 1'b1;
    assign inst_valid = (inst_fetched | inst_fetched_keep | inst_prefetched) & ~stall;

    //----------PC Generation----------//
    wire [2:0] pc_src; /* 000:+4; 001:hold; 010:jump or branch taken; 100:exception; */

    assign pc_src[2] = exception_jump_flag;
    assign pc_src[1] = inst_jump_or_branch_taken_flag;
    assign pc_src[0] = stall | ~inst_fetched | (~inst_fetched_keep | ~inst_prefetched) & prefetching_enable;

    always@(posedge clock)
    begin
        if(reset) pc <=`YSYX210313_PC_START;
        else      pc <= pc_src[2] ?  exception_jump_addr             :
                        pc_src[1] ?  inst_jump_or_branch_taken_addr  :
                        pc_src[0] ?  pc                              :  pc + 32'h4 ;
    end

endmodule


module ysyx_210313_ID_Stage (
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]       pc_i,
    output wire [`YSYX210313_ADDRBUSLEN-1:0]       pc_o,
    input  wire                                    pc_valid_i,
    output wire                                    pc_valid_o,
    input  wire [`YSYX210313_INSTLEN-1:0]          inst,

    // ALU Oprends
    input  wire                                    forward_rs1_flag,
    input  wire                                    forward_rs2_flag,
    input  wire                                    forward_csr_flag,
    input  wire [`YSYX210313_XLEN-1:0]             forward_rs1_data,
    input  wire [`YSYX210313_XLEN-1:0]             forward_rs2_data, 
    input  wire [`YSYX210313_XLEN-1:0]             forward_csr_data,

    input  wire [`YSYX210313_XLEN-1:0]             rs1_data_i,
    input  wire [`YSYX210313_XLEN-1:0]             rs2_data_i,
    input  wire [`YSYX210313_XLEN-1:0]             csr_data_i,

    output reg  [`YSYX210313_XLEN-1:0]             regbus_A,
    output wire [`YSYX210313_XLEN-1:0]             regbus_B,
    output reg  [`YSYX210313_XLEN-1:0]             imm,

    // ALU Operation Control
    output wire [ 1: 0]                            ALU_oprend_A_src,
    output wire [ 1: 0]                            ALU_oprend_B_src,
    output reg  [ 2: 0]                            ALU_op,
    output wire [ 2: 0]                            ALU_out_ext_type,

    // Regfile/CSR R/W
    output wire                                    rs1_r_en,
    output wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs1_r_addr,
    output wire                                    rs2_r_en,
    output wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs2_r_addr,

    output wire                                    rd_w_en,
    output wire                                    rd_w_src,
    output wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr,

    output wire                                    csr_r_en,
    output wire                                    csr_w_en,
    output wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_rw_addr,

    // Memory Access
    output wire                                    mem_r_en,
    output wire [ 2: 0]                            mem_r_ext_type,
    output wire                                    mem_w_en,
    output wire [ 1: 0]                            mem_w_size,

    // Jump/Branch Signals
    output wire                                    adder_src,
    output wire                                    inst_jump,
    output wire [ 2: 0]                            inst_branch_type,

    // Privileged Instruction / Exception
    output wire                                    is_system_inst,
    output wire                                    inst_ecall,
    output wire                                    inst_mret,
    output wire                                    inst_fencei,
    output wire                                    inst_wfi
);

    wire [ 4: 0] opcode;
    wire [ 2: 0] funct3;
    wire [ 6: 0] funct7;
    wire [11: 0] funct12;
    wire [ 5: 0] shamt;

    assign opcode      = inst[ 6: 2];
    assign rd_w_addr   = inst[11: 7];
    assign funct3      = inst[14:12];
    assign rs1_r_addr  = inst[19:15];
    assign rs2_r_addr  = inst[24:20];
    assign funct7      = inst[31:25];
    assign shamt       = inst[25:20];
    assign csr_rw_addr = inst[31:20];
    assign funct12     = inst[31:20];

    //----------Regbus Mux----------//
    // Forwarding
    wire [`YSYX210313_XLEN-1:0] rs1_data;
    wire [`YSYX210313_XLEN-1:0] rs2_data;
    wire [`YSYX210313_XLEN-1:0] csr_data;

    assign rs1_data = (forward_rs1_flag & rs1_r_en)       ?  forward_rs1_data  :  rs1_data_i  ;
    assign rs2_data = (forward_rs2_flag & rs2_r_en)       ?  forward_rs2_data  :  rs2_data_i  ;
    assign csr_data = (forward_csr_flag & is_system_inst) ?  forward_csr_data  :  csr_data_i  ;

    // Regbus A
    wire [1:0] regbusA_src;

    assign regbusA_src[1] = is_system_inst & funct3[1] & funct3[0];
    assign regbusA_src[0] = is_system_inst & funct3[2];

    always@(*) begin
        case(regbusA_src)
            2'b00   : regbus_A = rs1_data;
            2'b01   : regbus_A = {59'b0,rs1_r_addr};
            2'b10   : regbus_A = ~rs1_data;
            2'b11   : regbus_A = ~{59'b0,rs1_r_addr};
            default : regbus_A = rs1_data;
        endcase
    end

    // Regbus B
    assign regbus_B = is_system_inst ?  csr_data  :  rs2_data  ;

    //----------Immediate Generate----------//
    wire [`YSYX210313_XLEN-1:0] imm_I_shift;
    wire [`YSYX210313_XLEN-1:0] imm_I_shift_w;
    wire [`YSYX210313_XLEN-1:0] imm_I_nonshift;
    wire [`YSYX210313_XLEN-1:0] imm_S;
    wire [`YSYX210313_XLEN-1:0] imm_B;
    wire [`YSYX210313_XLEN-1:0] imm_U;
    wire [`YSYX210313_XLEN-1:0] imm_J;
    reg  [ 2: 0] imm_extension_type;

    assign imm_I_shift    = { 58'b0 , shamt };
    assign imm_I_shift_w  = { 59'b0 , shamt[4:0] };
    assign imm_I_nonshift = { {52{inst[31]}} , inst[31:20] };
    assign imm_B          = { {51{inst[31]}} , inst[31] , inst[7] , inst[30:25] , inst[11:8] , 1'b0 };
    assign imm_S          = { {52{inst[31]}} , inst[31:25] , inst[11:7] };
    assign imm_U          = { {32{inst[31]}} , inst[31:12] , 12'b0 };
    assign imm_J          = { {44{inst[31]}} , inst[19:12] , inst[20] , inst[30:21] , 1'b0 };

    always@(*) begin
        casez(opcode)
            5'b001?0            : imm_extension_type = (~funct3[1] & funct3[0] & ~opcode[1]) ?  `YSYX210313_IMM_I_S_EXT    : 
                                                       (~funct3[1] & funct3[0] & opcode[1])  ?  `YSYX210313_IMM_I_S_W_EXT  :  `YSYX210313_IMM_I_NS_EXT  ;
            5'b00000            : imm_extension_type = `YSYX210313_IMM_I_NS_EXT;
            5'b11001            : imm_extension_type = `YSYX210313_IMM_I_NS_EXT;
            `YSYX210313_B_TYPE  : imm_extension_type = `YSYX210313_IMM_B_EXT;
            `YSYX210313_S_TYPE  : imm_extension_type = `YSYX210313_IMM_S_EXT;
            `YSYX210313_J_TYPE  : imm_extension_type = `YSYX210313_IMM_J_EXT;
            `YSYX210313_U_TYPE  : imm_extension_type = `YSYX210313_IMM_U_EXT;
            default             : imm_extension_type = `YSYX210313_IMM_NOEXT;
        endcase
    end

    always @(*) begin
        case (imm_extension_type)
            `YSYX210313_IMM_I_S_EXT   : imm = imm_I_shift;
            `YSYX210313_IMM_I_S_W_EXT : imm = imm_I_shift_w;
            `YSYX210313_IMM_I_NS_EXT  : imm = imm_I_nonshift;
            `YSYX210313_IMM_B_EXT     : imm = imm_B;
            `YSYX210313_IMM_S_EXT     : imm = imm_S;
            `YSYX210313_IMM_U_EXT     : imm = imm_U;
            `YSYX210313_IMM_J_EXT     : imm = imm_J;
            default                   : imm = 64'b0;
        endcase
    end

    //----------ALU----------//
    // ALU Oprend A
    /* 00:pc; 01:regbusA; 10:zext(bitsel[regbus_A]); 11:sext(bitsel[regbus_A]); */
    assign ALU_oprend_A_src[0] = ~((opcode[4] & opcode[3] & ~opcode[2] & opcode[0])                                          /* jal / jalr */
                               | (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0])                               /* auipc */
                               | (ALU_out_ext_type[0] & funct3[2] & ~funct3[1] & funct3[0] & ~funct7[5]));                     /* srlw / srliw */
    assign ALU_oprend_A_src[1] = ALU_out_ext_type[0] & funct3[2] & ~funct3[1] & funct3[0];                                 /* srlw / srliw / sraw / sraiw */
    assign rs1_r_en = (|ALU_oprend_A_src & ~opcode[0]) 
                    | (opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0]) ;
    
    // ALU Oprend B
    /* 00:imm; 01:const 4; 10:regbus_B; 11:zext(bitsel[regbus_B]); */
    assign ALU_oprend_B_src[0] = (ALU_out_ext_type[0] & opcode[3] & |funct3) 
                               | (opcode[4] & opcode[3] & ~opcode[2] & opcode[0])
                               | (~opcode[4] & opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0] & ~funct3[1] & funct3[0]);
    assign ALU_oprend_B_src[1] = (~(is_system_inst & ~funct3[1] & funct3[0]) | ~is_system_inst) 
                               & ((ALU_out_ext_type[0] & opcode[3]) | ~opcode[4] & opcode[3] & opcode[2] & ~opcode[0] | opcode[4] & opcode[3] & (opcode[2] | ~opcode[2] & ~opcode[1] & ~opcode[0]));
    assign rs2_r_en = ALU_oprend_B_src[1] 
                    | (~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]);
    
    // ALU Operation
    always@(*)begin
        casez({opcode,funct3})
            {5'b110?1,3'b???}               : ALU_op = `YSYX210313_ADD_OP;                             /* jal / jalr */
            {5'b0?101,3'b???}               : ALU_op = `YSYX210313_ADD_OP;                             /* U_type */
            {5'b0?000,3'b???}               : ALU_op = `YSYX210313_ADD_OP;                             /* load / store */
            {5'b001?0,3'b000}               : ALU_op = `YSYX210313_ADD_OP;                             /* addi(w) */
            {`YSYX210313_R_TYPE,3'b000}     : ALU_op = funct7[5] ? `YSYX210313_SUB_OP  :  `YSYX210313_ADD_OP  ;    /* R_add(w) / sub(w) */
            {`YSYX210313_B_TYPE,3'b???}     : ALU_op = `YSYX210313_SUB_OP;                             /* B_type */
            {5'b0?100,3'b01?}               : ALU_op = `YSYX210313_SUB_OP;                             /* slti / sltiu / slt / sltu */
            {5'b0?100,3'b111}               : ALU_op = `YSYX210313_AND_OP;
            {5'b0?100,3'b110}               : ALU_op = `YSYX210313_OR_OP;
            {5'b0?100,3'b100}               : ALU_op = `YSYX210313_XOR_OP;
            {5'b0?1?0,3'b001}               : ALU_op = `YSYX210313_SLL_OP;
            {5'b0?1?0,3'b101}               : ALU_op = funct7[5] ? `YSYX210313_SRA_OP  :  `YSYX210313_SRL_OP  ;
            {`YSYX210313_PRIVILEGED,3'b?10} : ALU_op = `YSYX210313_OR_OP;
            {`YSYX210313_PRIVILEGED,3'b?11} : ALU_op = `YSYX210313_AND_OP;
            default                         : ALU_op = `YSYX210313_ADD_OP; 
        endcase
    end

    // ALU Output Extension
    /* [0]:64bit; [1]:cmp type;(1 unsigned / 0 signed) [2]:is_cmp */
    assign ALU_out_ext_type[0] = opcode[2] & opcode[1] & ~opcode[0];
    assign ALU_out_ext_type[1] = funct3[0];
    assign ALU_out_ext_type[2] = ~opcode[4] & opcode[2] & ~opcode[1] & ~opcode[0] & ~funct3[2] & funct3[1];

    //----------Branch/Jump Signals----------//
    assign pc_o = pc_i;
    assign pc_valid_o = pc_valid_i;
    assign inst_jump = opcode[4] & opcode[3] & ~opcode [2] & opcode [0];
    assign adder_src = opcode[4] & opcode[3] & ~opcode [2] & ~opcode[1] & opcode [0];
    assign inst_branch_type = (opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) ? funct3 : `YSYX210313_NOTBRANCH ;

    //----------Privileged Instructions----------//
    assign is_system_inst = opcode[4] & opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
    assign inst_ecall     = is_system_inst & (funct12 == 12'h000);
    assign inst_mret      = is_system_inst & (funct12 == 12'h302);
    assign inst_fencei    = (~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0]);
    assign inst_wfi       = is_system_inst & ~(|funct3) & (funct12 == 12'b000100000101);


    //----------Memory/Regfile/CSR Access----------//
    // Memory
    assign mem_r_en = rd_w_en & rd_w_src;
    assign mem_r_ext_type = (rd_w_src & rd_w_en) ? funct3 : 3'b0 ;
    assign mem_w_en = ~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
    assign mem_w_size = funct3[1:0];                                            /* 00:byte;  01:half word;  10:word;  11:double word; */

    // Regfile
    assign rd_w_en = ~opcode[3] | opcode[2] | opcode[1] | opcode[0];
    assign rd_w_src = ~(|opcode);                                          /* 1:alu 0:csr (csr_related) else 1:mem 0:alu */

    // CSR
    assign csr_r_en = is_system_inst;
    assign csr_w_en = is_system_inst & ~inst_mret & ~inst_ecall;
    
endmodule


module ysyx_210313_EX_Stage (
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]       pc_i,
    input  wire                                    pc_valid_i,
    output wire [`YSYX210313_ADDRBUSLEN-1:0]       pc_o,
    output wire                                    pc_valid_o,

    // ALU Oprends
    input  wire [`YSYX210313_DATABUSLEN-1:0]       regbus_A,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       regbus_B,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       imm,
    output wire [`YSYX210313_DATABUSLEN-1:0]       ALU_out,
    output wire [ 3: 0]                            psw_flags,

    // ALU Operation Control
    input  wire [ 1: 0]                            ALU_oprend_A_src,
    input  wire [ 1: 0]                            ALU_oprend_B_src,
    input  wire [ 2: 0]                            ALU_op,
    input  wire [ 2: 0]                            ALU_out_ext_type,

    // Memory Access
    input  wire                                    mem_r_en_i,
    input  wire [ 2: 0]                            mem_r_ext_type_i,
    input  wire                                    mem_w_en_i,
    input  wire [ 1: 0]                            mem_w_size_i,

    output wire                                    mem_r_en_o,
    output wire [ 2: 0]                            mem_r_ext_type_o,
    output wire                                    mem_w_en_o,
    output wire [ 1: 0]                            mem_w_size_o,
    output wire [`YSYX210313_DATABUSLEN-1:0]       regbus_B_o,

    // Regfile/CSR R/W
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_i,
    input  wire                                    rd_w_en_i,
    input  wire                                    rd_w_src_i,

    output wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_o,
    output wire                                    rd_w_en_o,
    output wire                                    rd_w_src_o,

    input  wire                                    csr_w_en_i,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_i,

    output wire                                    csr_w_en_o,
    output wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_o,

    // Jump/Branch Signals
    input  wire                                    adder_src,
    input  wire                                    inst_jump_i,
    input  wire [ 2: 0]                            inst_branch_type_i,

    output wire                                    inst_jump_o,
    output wire [ 2: 0]                            inst_branch_type_o,

    // Privileged Instruction / Exception
    input  wire                                    is_system_inst_i,
    output wire                                    is_system_inst_o,

    input  wire                                    inst_ecall_i,
    input  wire                                    inst_mret_i,

    output wire                                    inst_ecall_o,
    output wire                                    inst_mret_o
);

    //----------ALU----------//
    // Oprends Generate
    reg  [`YSYX210313_XLEN-1:0] ALU_oprend_A;
    reg  [`YSYX210313_XLEN-1:0] ALU_oprend_B;
    reg  [`YSYX210313_XLEN:0]   ALU_out_ext;

    always @(*) begin
        case (ALU_oprend_A_src)
            `YSYX210313_PC                   : ALU_oprend_A = { 32'b0 , pc_i };
            `YSYX210313_REGBUS_A             : ALU_oprend_A = regbus_A;
            `YSYX210313_ZEXT_BITSEL_REGBUS_A : ALU_oprend_A = { 32'b0 , regbus_A[31:0] };
            `YSYX210313_SEXT_BITSEL_REGBUS_A : ALU_oprend_A = { {32{regbus_A[31]}} , regbus_A[31:0] };
            default               : ALU_oprend_A = regbus_A;
        endcase
    end

    always @(*) begin
        case (ALU_oprend_B_src)
            `YSYX210313_REGBUS_B             : ALU_oprend_B = regbus_B;
            `YSYX210313_IMM                  : ALU_oprend_B = imm;
            `YSYX210313_CONST_4              : ALU_oprend_B = 64'b0100;
            `YSYX210313_ZEXT_BITSEL_REGBUS_B : ALU_oprend_B = ALU_out_ext_type[0] ?  { 59'b0 , regbus_B[4:0]}  :  { 58'b0 , regbus_B[5:0] }  ;
            default               : ALU_oprend_B = regbus_B;
        endcase
    end

    // Operation Executation
    always @(*) begin
        case (ALU_op)
            `YSYX210313_ADD_OP : ALU_out_ext = { 1'b0 , ALU_oprend_A } + { 1'b0 , ALU_oprend_B };
            `YSYX210313_SUB_OP : ALU_out_ext = { 1'b0 , ALU_oprend_A } - { 1'b0 , ALU_oprend_B };
            `YSYX210313_AND_OP : ALU_out_ext = { 1'b0 , ALU_oprend_A } & { 1'b0 , ALU_oprend_B };
            `YSYX210313_OR_OP  : ALU_out_ext = { 1'b0 , ALU_oprend_A } | { 1'b0 , ALU_oprend_B };
            `YSYX210313_XOR_OP : ALU_out_ext = { 1'b0 , ALU_oprend_A } ^ { 1'b0 , ALU_oprend_B };
            `YSYX210313_SLL_OP : ALU_out_ext = { 1'b0 , ALU_oprend_A } << { 1'b0 , ALU_oprend_B };
            `YSYX210313_SRL_OP : ALU_out_ext = { 1'b0 , ALU_oprend_A } >> { 1'b0 , ALU_oprend_B };
            `YSYX210313_SRA_OP : ALU_out_ext = $signed({ ALU_oprend_A[63] , ALU_oprend_A }) >>> { 1'b0 , ALU_oprend_B };
            default : ALU_out_ext = { 1'b0 , ALU_oprend_A } + { 1'b0 , ALU_oprend_B };
        endcase
    end

    assign ALU_out = ALU_out_ext_type[2] ?  (ALU_out_ext_type[1] ?  { 63'b0 , `YSYX210313_CF }  :  { 63'b0 , `YSYX210313_SF^`YSYX210313_OF })     :
                     ALU_out_ext_type[0] ?  { {32{ALU_out_ext[31]}} , ALU_out_ext[31:0] }  :  ALU_out_ext[63:0]  ;

    // PSW Flags
    assign `YSYX210313_CF = ALU_out_ext[64];
    assign `YSYX210313_SF = ALU_out_ext[63];
    assign `YSYX210313_OF = (ALU_oprend_A[63] & ~ALU_oprend_B[63] & ~ALU_out_ext[63])|(~ALU_oprend_A[63] & ALU_oprend_B[63] & ALU_out_ext[63]);
    assign `YSYX210313_ZF = ~(|ALU_out_ext);

    //----------Adder----------//
    wire [`YSYX210313_ADDRBUSLEN-1:0] adder_oprendA;
    wire [`YSYX210313_ADDRBUSLEN-1:0] adder_oprendB;

    assign adder_oprendA = adder_src ?  regbus_A[`YSYX210313_ADDRBUSLEN-1:0]  :  pc_i  ;
    assign adder_oprendB = imm[`YSYX210313_ADDRBUSLEN-1:0];
    assign pc_o = adder_oprendA + adder_oprendB;

    //----------Branch/Jump Signals----------//
    assign pc_valid_o         = pc_valid_i;
    assign inst_jump_o        = inst_jump_i;
    assign inst_branch_type_o = inst_branch_type_i;

    //----------Privileged Instructions----------//
    assign is_system_inst_o = is_system_inst_i;
    assign inst_ecall_o     = inst_ecall_i;
    assign inst_mret_o      = inst_mret_i;

    //----------Memory/Regfile/CSR Access----------//
    // Memory
    assign mem_r_en_o       = mem_r_en_i;
    assign mem_r_ext_type_o = mem_r_ext_type_i;
    assign mem_w_en_o       = mem_w_en_i;
    assign mem_w_size_o     = mem_w_size_i;
    assign regbus_B_o       = regbus_B;
    
    // Regfile
    assign rd_w_en_o   = rd_w_en_i;
    assign rd_w_src_o  = rd_w_src_i;
    assign rd_w_addr_o = rd_w_addr_i;

    // CSR
    assign csr_w_en_o   = csr_w_en_i;
    assign csr_w_addr_o = csr_w_addr_i;
    
endmodule


module ysyx_210313_MEM_Stage (
    // Jump/Branch Signals
    input  wire                                    inst_jump,
    input  wire [ 2: 0]                            inst_branch_type,
    input  wire [ 3: 0]                            psw_flags,
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]       branch_target_pc_i,

    output wire                                    inst_jump_or_branch_taken_flag,
    output wire [`YSYX210313_ADDRBUSLEN-1:0]       branch_target_pc_o,

    // Regfile/CSR R/W
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_i,
    input  wire                                    rd_w_en_i,
    input  wire                                    rd_w_src_i,

    output wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_o,
    output wire                                    rd_w_en_o,
    output wire                                    rd_w_src_o,

    input  wire                                    csr_w_en_i,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_i,

    output wire                                    csr_w_en_o,
    output wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_o,

    // Memory Access
    input  wire                                    mem_r_en,
    input  wire [ 2: 0]                            mem_r_ext_type_i,
    input  wire                                    mem_w_en,
    input  wire [ 1: 0]                            mem_w_size_i,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       ALU_out_i,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       regbus_B_i,

    output wire [ 2: 0]                            mem_r_ext_type_o,
    output wire [`YSYX210313_DATABUSLEN-1:0]       regbus_C,
    output wire [`YSYX210313_DATABUSLEN-1:0]       regbus_D,

    output wire                                    mem_stall_req,

    // To axi_rw
    // Read
	output wire                                    mem_r_req,
	input  wire                                    mem_r_okay,
    input  wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   mem_data_read,
    output wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   mem_r_addr,
    output wire [1:0]                              mem_r_size,
    input  wire [ 1: 0]                            mem_r_resp,
    // Write
    output wire                                    mem_w_req,
    input  wire                                    mem_w_okay,
    output wire [`YSYX210313_AXI_DATA_WIDTH-1:0]   mem_data_write,
    output wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]   mem_w_addr,
    output wire [1:0]                              mem_w_size,
    input  wire [ 1: 0]                            mem_w_resp,

    // Privileged Instruction / Exception
    input  wire                                    is_system_inst,

    input  wire                                    inst_ecall_i,
    input  wire                                    inst_mret_i,

    output wire                                    inst_ecall_o,
    output wire                                    inst_mret_o
);

    assign regbus_C = is_system_inst ?  ALU_out_i   :  mem_data_read  ;
    assign regbus_D = is_system_inst ?  regbus_B_i  :  ALU_out_i  ;

    //----------Memory/Regfile/CSR Access----------//
    // Memory
    assign mem_stall_req    = (mem_r_req & ~mem_r_okay & (mem_r_resp == 2'b0) | mem_w_req & ~mem_w_okay & (mem_w_resp == 2'b0));
    assign mem_r_ext_type_o = mem_r_ext_type_i;

    // Regfile
    assign rd_w_en_o    = rd_w_en_i;
    assign rd_w_src_o   = rd_w_src_i;
    assign rd_w_addr_o  = rd_w_addr_i;

    // CSR
    assign csr_w_en_o   = csr_w_en_i;
    assign csr_w_addr_o = csr_w_addr_i;

    //----------To axi_rw----------//
    // Read
    assign mem_r_req  = mem_r_en & ~mem_r_okay;
    assign mem_r_addr = ALU_out_i[`YSYX210313_ADDRBUSLEN-1:0];
    assign mem_r_size = mem_r_ext_type_i[1:0];

    // Write
    assign mem_w_req      = mem_w_en & ~mem_w_okay;
    assign mem_w_addr     = ALU_out_i[`YSYX210313_ADDRBUSLEN-1:0];
    assign mem_data_write = regbus_B_i;
    assign mem_w_size     = mem_w_size_i;

    //----------Branch/Jump Signals----------//
    reg branch_taken;

    always @(*) begin
        case (inst_branch_type)
            `YSYX210313_NOTBRANCH : branch_taken = 1'b0;
            `YSYX210313_EQ        : branch_taken = `YSYX210313_ZF;
            `YSYX210313_NE        : branch_taken = ~`YSYX210313_ZF;
            `YSYX210313_LT        : branch_taken = `YSYX210313_SF^`YSYX210313_OF;
            `YSYX210313_GE        : branch_taken = `YSYX210313_SF^~`YSYX210313_OF | `YSYX210313_ZF;
            `YSYX210313_LTU       : branch_taken = `YSYX210313_CF;
            `YSYX210313_GEU       : branch_taken = ~`YSYX210313_CF | `YSYX210313_ZF;
            default    : branch_taken = 1'b0;
        endcase
    end

    assign inst_jump_or_branch_taken_flag = inst_jump | branch_taken;
    assign branch_target_pc_o             = branch_target_pc_i;

    //----------Privileged Instructions----------//
    assign inst_ecall_o = inst_ecall_i;
    assign inst_mret_o  = inst_mret_i;

endmodule


module ysyx_210313_WB_Stage (
    input  wire [`YSYX210313_DATABUSLEN-1:0]       regbus_C,
    input  wire [`YSYX210313_XLEN-1:0]             regbus_D,
    input  wire [ 2: 0]                            mem_r_ext_type,

    // Regfile W
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_i,
    input  wire                                    rd_w_en_i,
    input  wire                                    rd_w_src,

    output wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_o,
    output wire                                    rd_w_en_o,
    output wire [`YSYX210313_XLEN-1:0]             rd_w_data,

    // CSR W
    input  wire                                    csr_w_en_i,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_i,

    output wire                                    csr_w_en_o,
    output wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_o,
    output wire [`YSYX210313_MXLEN-1:0]            csr_data
);
    //----------Load Data Extension----------//
    reg  [`YSYX210313_XLEN-1:0] regbus_C_ext_data;

    always @(*) begin
        case (mem_r_ext_type)
            `YSYX210313_SEXT8  : regbus_C_ext_data = { {56{regbus_C[ 7]}} , regbus_C[ 7: 0] };
            `YSYX210313_SEXT16 : regbus_C_ext_data = { {48{regbus_C[15]}} , regbus_C[15: 0] };
            `YSYX210313_SEXT32 : regbus_C_ext_data = { {32{regbus_C[31]}} , regbus_C[31: 0] };
            `YSYX210313_ZEXT8  : regbus_C_ext_data = { 56'b0 , regbus_C[ 7: 0] };
            `YSYX210313_ZEXT16 : regbus_C_ext_data = { 48'b0 , regbus_C[15: 0] };
            `YSYX210313_ZEXT32 : regbus_C_ext_data = { 32'b0 , regbus_C[31: 0] };
            default : regbus_C_ext_data = regbus_C;
        endcase
    end

    //----------Regfile/CSR Access----------//
    // Regfile
    assign rd_w_en_o = rd_w_en_i;
    assign rd_w_addr_o  = rd_w_addr_i;
    assign rd_w_data = rd_w_src ?  regbus_C_ext_data  :  regbus_D  ;

    // CSR
    assign csr_w_en_o   = csr_w_en_i;
    assign csr_w_addr_o = csr_w_addr_i;
    assign csr_data     = regbus_C;

endmodule


module ysyx_210313_pipeline_regs (
    input  wire                                    clock,
    input  wire                                    reset,

    input  wire                                    bubble,
    input  wire                                    flush,
    input  wire [ 3: 0]                            stall,

    //IF->ID
    input  wire                                    o_pc_valid_if,
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]       o_pc_if,
    input  wire [`YSYX210313_INSTLEN-1:0]          o_instruction_if,

    output reg                                     i_pc_valid_id,
    output reg  [`YSYX210313_ADDRBUSLEN-1:0]       i_pc_id,
    output reg  [`YSYX210313_INSTLEN-1:0]          i_instruction_id,

    //ID->EX
    input  wire [`YSYX210313_XLEN-1:0]             o_regbus_A_id,
    input  wire [`YSYX210313_XLEN-1:0]             o_regbus_B_id,
    input  wire [`YSYX210313_XLEN-1:0]             o_imm_id,
    input  wire [ 1: 0]                            o_ALU_oprend_A_src_id,
    input  wire [ 1: 0]                            o_ALU_oprend_B_src_id,
    input  wire [ 2: 0]                            o_ALU_op_id,
    input  wire [ 2: 0]                            o_ALU_out_ext_type_id,
    input  wire                                    o_adder_src_id,
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]       o_pc_id,
    input  wire                                    o_pc_valid_id,

    input  wire                                    o_mem_r_en_id,
    input  wire [ 2: 0]                            o_mem_r_ext_type_id,
    input  wire                                    o_mem_w_en_id,
    input  wire [ 1: 0]                            o_mem_w_size_id,
    input  wire                                    o_inst_jump_id,
    input  wire [ 2: 0]                            o_inst_branch_type_id,
    input  wire                                    o_is_system_inst_id,
    input  wire                                    o_inst_ecall_id,
    input  wire                                    o_inst_mret_id,

    input  wire                                    o_rd_w_en_id,
    input  wire                                    o_rd_w_src_id,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] o_rd_w_addr_id,
    input  wire                                    o_csr_w_en_id,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     o_csr_w_addr_id,

    output reg  [`YSYX210313_XLEN-1:0]             i_regbus_A_ex,
    output reg  [`YSYX210313_XLEN-1:0]             i_regbus_B_ex,
    output reg  [`YSYX210313_XLEN-1:0]             i_imm_ex,
    output reg  [ 1: 0]                            i_ALU_oprend_A_src_ex,
    output reg  [ 1: 0]                            i_ALU_oprend_B_src_ex,
    output reg  [ 2: 0]                            i_ALU_op_ex,
    output reg  [ 2: 0]                            i_ALU_out_ext_type_ex,
    output reg                                     i_adder_src_ex,
    output reg  [`YSYX210313_ADDRBUSLEN-1:0]       i_pc_ex,
    output reg                                     i_pc_valid_ex,

    output reg                                     i_mem_r_en_ex,
    output reg  [ 2: 0]                            i_mem_r_ext_type_ex,
    output reg                                     i_mem_w_en_ex,
    output reg  [ 1: 0]                            i_mem_w_size_ex,
    output reg                                     i_inst_jump_ex,
    output reg  [ 2: 0]                            i_inst_branch_type_ex,
    output reg                                     i_is_system_inst_ex,
    output reg                                     i_inst_ecall_ex,
    output reg                                     i_inst_mret_ex,

    output reg                                     i_rd_w_en_ex,
    output reg                                     i_rd_w_src_ex,
    output reg  [`YSYX210313_REGFILE_ADDR_LEN-1:0] i_rd_w_addr_ex,
    output reg                                     i_csr_w_en_ex,
    output reg  [`YSYX210313_CSR_ADDR_LEN-1:0]     i_csr_w_addr_ex,

    //EX->MEM
    input  wire [`YSYX210313_ADDRBUSLEN-1:0]       o_pc_ex,

    input  wire [`YSYX210313_DATABUSLEN-1:0]       o_ALU_out_ex,
    input  wire [ 3: 0]                            o_psw_flags_ex,

    input  wire                                    o_mem_r_en_ex,
    input  wire [ 2: 0]                            o_mem_r_ext_type_ex,
    input  wire                                    o_mem_w_en_ex,
    input  wire [ 1: 0]                            o_mem_w_size_ex,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       o_regbus_B_ex,

    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] o_rd_w_addr_ex,
    input  wire                                    o_rd_w_en_ex,
    input  wire                                    o_rd_w_src_ex,
    input  wire                                    o_csr_w_en_ex,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     o_csr_w_addr_ex,

    input  wire                                    o_inst_jump_ex,
    input  wire [ 2: 0]                            o_inst_branch_type_ex,

    input  wire                                    o_is_system_inst_ex,
    input  wire                                    o_inst_ecall_ex,
    input  wire                                    o_inst_mret_ex,

    output reg  [`YSYX210313_ADDRBUSLEN-1:0]       i_branch_target_pc_mem,

    output reg  [`YSYX210313_DATABUSLEN-1:0]       i_ALU_out_mem,
    output reg  [ 3: 0]                            i_psw_flags_mem,

    output reg                                     i_mem_r_en_mem,
    output reg  [ 2: 0]                            i_mem_r_ext_type_mem,
    output reg                                     i_mem_w_en_mem,
    output reg  [ 1: 0]                            i_mem_w_size_mem,
    output reg  [`YSYX210313_DATABUSLEN-1:0]       i_regbus_B_mem,

    output reg  [`YSYX210313_REGFILE_ADDR_LEN-1:0] i_rd_w_addr_mem,
    output reg                                     i_rd_w_en_mem,
    output reg                                     i_rd_w_src_mem,
    output reg                                     i_csr_w_en_mem,
    output reg  [`YSYX210313_CSR_ADDR_LEN-1:0]     i_csr_w_addr_mem,

    output reg                                     i_inst_jump_mem,
    output reg  [ 2: 0]                            i_inst_branch_type_mem,

    output reg                                     i_is_system_inst_mem,
    output reg                                     i_inst_ecall_mem,
    output reg                                     i_inst_mret_mem,
    
    //MEM->WB
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] o_rd_w_addr_mem,
    input  wire                                    o_rd_w_en_mem,
    input  wire                                    o_rd_w_src_mem,
    input  wire                                    o_csr_w_en_mem,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     o_csr_w_addr_mem,
    input  wire [ 2: 0]                            o_mem_r_ext_type_mem,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       o_regbus_C_mem,
    input  wire [`YSYX210313_DATABUSLEN-1:0]       o_regbus_D_mem,

    output reg  [`YSYX210313_REGFILE_ADDR_LEN-1:0] i_rd_w_addr_wb,
    output reg                                     i_rd_w_en_wb,
    output reg                                     i_rd_w_src_wb,
    output reg                                     i_csr_w_en_wb,
    output reg  [`YSYX210313_CSR_ADDR_LEN-1:0]     i_csr_w_addr_wb,
    output reg  [ 2: 0]                            i_mem_r_ext_type_wb,
    output reg  [`YSYX210313_DATABUSLEN-1:0]       i_regbus_C_wb,
    output reg  [`YSYX210313_DATABUSLEN-1:0]       i_regbus_D_wb
);
    //---------- IF->ID ----------//
    always @(posedge clock) begin
        if(reset) begin
            i_pc_valid_id    <= 0;
            i_pc_id          <= 0;
            i_instruction_id <= 32'h13;
        end
        else if(flush) begin
            i_pc_valid_id    <= 0;
            i_pc_id          <= 0;
            i_instruction_id <= 32'h13;
        end
        else if(stall[0]) begin
            i_pc_valid_id    <= i_pc_valid_id;
            i_pc_id          <= i_pc_id;
            i_instruction_id <= i_instruction_id;
        end
        else begin
            i_pc_valid_id    <= o_pc_valid_if;
            i_pc_id          <= o_pc_if;
            i_instruction_id <= o_instruction_if;
        end
    end
    
    //---------- ID->EX ----------//
    always @(posedge clock) begin
        if(reset) begin
            i_regbus_A_ex         <= 0;
            i_regbus_B_ex         <= 0;
            i_imm_ex              <= 0;
            i_ALU_oprend_A_src_ex <= 0;
            i_ALU_oprend_B_src_ex <= 0;
            i_ALU_op_ex           <= 0;
            i_ALU_out_ext_type_ex <= 0;
            i_adder_src_ex        <= 0;
            i_pc_ex               <= 0;
            i_pc_valid_ex         <= 0;
            i_mem_r_en_ex         <= 0;
            i_mem_r_ext_type_ex   <= 0;
            i_mem_w_en_ex         <= 0;
            i_mem_w_size_ex       <= 0;
            i_inst_jump_ex        <= 0;
            i_inst_branch_type_ex <= 3'b010;
            i_is_system_inst_ex   <= 0;
            i_inst_ecall_ex       <= 0;
            i_inst_mret_ex        <= 0;
            i_rd_w_en_ex          <= 0;
            i_rd_w_src_ex         <= 0;
            i_rd_w_addr_ex        <= 0;
            i_csr_w_en_ex         <= 0;
            i_csr_w_addr_ex       <= 0;
        end
        else if(flush) begin
            i_regbus_A_ex         <= 0;
            i_regbus_B_ex         <= 0;
            i_imm_ex              <= 0;
            i_ALU_oprend_A_src_ex <= 0;
            i_ALU_oprend_B_src_ex <= 0;
            i_ALU_op_ex           <= 0;
            i_ALU_out_ext_type_ex <= 0;
            i_adder_src_ex        <= 0;
            i_pc_ex               <= 0;
            i_pc_valid_ex         <= 0;
            i_mem_r_en_ex         <= 0;
            i_mem_r_ext_type_ex   <= 0;
            i_mem_w_en_ex         <= 0;
            i_mem_w_size_ex       <= 0;
            i_inst_jump_ex        <= 0;
            i_inst_branch_type_ex <= 3'b010;
            i_is_system_inst_ex   <= 0;
            i_inst_ecall_ex       <= 0;
            i_inst_mret_ex        <= 0;
            i_rd_w_en_ex          <= 0;
            i_rd_w_src_ex         <= 0;
            i_rd_w_addr_ex        <= 0;
            i_csr_w_en_ex         <= 0;
            i_csr_w_addr_ex       <= 0;
        end
        else if(stall[1]) begin
            i_regbus_A_ex         <= i_regbus_A_ex;
            i_regbus_B_ex         <= i_regbus_B_ex;
            i_imm_ex              <= i_imm_ex;
            i_ALU_oprend_A_src_ex <= i_ALU_oprend_A_src_ex;
            i_ALU_oprend_B_src_ex <= i_ALU_oprend_B_src_ex;
            i_ALU_op_ex           <= i_ALU_op_ex;
            i_ALU_out_ext_type_ex <= i_ALU_out_ext_type_ex;
            i_adder_src_ex        <= i_adder_src_ex;
            i_pc_ex               <= i_pc_ex;
            i_pc_valid_ex         <= i_pc_valid_ex;
            i_mem_r_en_ex         <= i_mem_r_en_ex;
            i_mem_r_ext_type_ex   <= i_mem_r_ext_type_ex;
            i_mem_w_en_ex         <= i_mem_w_en_ex;
            i_mem_w_size_ex       <= i_mem_w_size_ex;
            i_inst_jump_ex        <= i_inst_jump_ex;
            i_inst_branch_type_ex <= i_inst_branch_type_ex;
            i_is_system_inst_ex   <= i_is_system_inst_ex;
            i_inst_ecall_ex       <= i_inst_ecall_ex;
            i_inst_mret_ex        <= i_inst_mret_ex;
            i_rd_w_en_ex          <= i_rd_w_en_ex;
            i_rd_w_src_ex         <= i_rd_w_src_ex;
            i_rd_w_addr_ex        <= i_rd_w_addr_ex;
            i_csr_w_en_ex         <= i_csr_w_en_ex;
            i_csr_w_addr_ex       <= i_csr_w_addr_ex;
        end
        else if(bubble) begin
            i_regbus_A_ex         <= 0;
            i_regbus_B_ex         <= 0;
            i_imm_ex              <= 0;
            i_ALU_oprend_A_src_ex <= 0;
            i_ALU_oprend_B_src_ex <= 0;
            i_ALU_op_ex           <= 0;
            i_ALU_out_ext_type_ex <= 0;
            i_adder_src_ex        <= 0;
            i_pc_ex               <= 0;
            i_pc_valid_ex         <= 0;
            i_mem_r_en_ex         <= 0;
            i_mem_r_ext_type_ex   <= 0;
            i_mem_w_en_ex         <= 0;
            i_mem_w_size_ex       <= 0;
            i_inst_jump_ex        <= 0;
            i_inst_branch_type_ex <= 3'b010;
            i_is_system_inst_ex   <= 0;
            i_inst_ecall_ex       <= 0;
            i_inst_mret_ex        <= 0;
            i_rd_w_en_ex          <= 0;
            i_rd_w_src_ex         <= 0;
            i_rd_w_addr_ex        <= 0;
            i_csr_w_en_ex         <= 0;
            i_csr_w_addr_ex       <= 0;
        end
        else begin
            i_regbus_A_ex         <= o_regbus_A_id;
            i_regbus_B_ex         <= o_regbus_B_id;
            i_imm_ex              <= o_imm_id;
            i_ALU_oprend_A_src_ex <= o_ALU_oprend_A_src_id;
            i_ALU_oprend_B_src_ex <= o_ALU_oprend_B_src_id;
            i_ALU_op_ex           <= o_ALU_op_id;
            i_ALU_out_ext_type_ex <= o_ALU_out_ext_type_id;
            i_adder_src_ex        <= o_adder_src_id;
            i_pc_ex               <= o_pc_id;
            i_pc_valid_ex         <= o_pc_valid_id;
            i_mem_r_en_ex         <= o_mem_r_en_id;
            i_mem_r_ext_type_ex   <= o_mem_r_ext_type_id;
            i_mem_w_en_ex         <= o_mem_w_en_id;
            i_mem_w_size_ex       <= o_mem_w_size_id;
            i_inst_jump_ex        <= o_inst_jump_id;
            i_inst_branch_type_ex <= o_inst_branch_type_id;
            i_is_system_inst_ex   <= o_is_system_inst_id;
            i_inst_ecall_ex       <= o_inst_ecall_id;
            i_inst_mret_ex        <= o_inst_mret_id;
            i_rd_w_en_ex          <= o_rd_w_en_id;
            i_rd_w_src_ex         <= o_rd_w_src_id;
            i_rd_w_addr_ex        <= o_rd_w_addr_id;
            i_csr_w_en_ex         <= o_csr_w_en_id;
            i_csr_w_addr_ex       <= o_csr_w_addr_id;
        end
    end
    
    //---------- EX->MEM ----------//
    always @(posedge clock) begin
        if(reset) begin
            i_branch_target_pc_mem <= 0;
            i_ALU_out_mem          <= 0;
            i_psw_flags_mem        <= 0;
            i_mem_r_en_mem         <= 0;
            i_mem_r_ext_type_mem   <= 0;
            i_mem_w_en_mem         <= 0;
            i_mem_w_size_mem       <= 0;
            i_regbus_B_mem         <= 0;
            i_rd_w_addr_mem        <= 0;
            i_rd_w_en_mem          <= 0;
            i_rd_w_src_mem         <= 0;
            i_csr_w_en_mem         <= 0;
            i_csr_w_addr_mem       <= 0;
            i_inst_jump_mem        <= 0;
            i_inst_branch_type_mem <= 3'b010;
            i_is_system_inst_mem   <= 0;
            i_inst_ecall_mem       <= 0;
            i_inst_mret_mem        <= 0;
        end
        else if(flush) begin
            i_branch_target_pc_mem <= 0;
            i_ALU_out_mem          <= 0;
            i_psw_flags_mem        <= 0;
            i_mem_r_en_mem         <= 0;
            i_mem_r_ext_type_mem   <= 0;
            i_mem_w_en_mem         <= 0;
            i_mem_w_size_mem       <= 0;
            i_regbus_B_mem         <= 0;
            i_rd_w_addr_mem        <= 0;
            i_rd_w_en_mem          <= 0;
            i_rd_w_src_mem         <= 0;
            i_csr_w_en_mem         <= 0;
            i_csr_w_addr_mem       <= 0;
            i_inst_jump_mem        <= 0;
            i_inst_branch_type_mem <= 3'b010;
            i_is_system_inst_mem   <= 0;
            i_inst_ecall_mem       <= 0;
            i_inst_mret_mem        <= 0;
        end
        else if(stall[2]) begin
            i_branch_target_pc_mem <= i_branch_target_pc_mem;
            i_ALU_out_mem          <= i_ALU_out_mem;
            i_psw_flags_mem        <= i_psw_flags_mem;
            i_mem_r_en_mem         <= i_mem_r_en_mem;
            i_mem_r_ext_type_mem   <= i_mem_r_ext_type_mem;
            i_mem_w_en_mem         <= i_mem_w_en_mem;
            i_mem_w_size_mem       <= i_mem_w_size_mem;
            i_regbus_B_mem         <= i_regbus_B_mem;
            i_rd_w_addr_mem        <= i_rd_w_addr_mem;
            i_rd_w_en_mem          <= i_rd_w_en_mem;
            i_rd_w_src_mem         <= i_rd_w_src_mem;
            i_csr_w_en_mem         <= i_csr_w_en_mem;
            i_csr_w_addr_mem       <= i_csr_w_addr_mem;
            i_inst_jump_mem        <= i_inst_jump_mem;
            i_inst_branch_type_mem <= i_inst_branch_type_mem;
            i_is_system_inst_mem   <= i_is_system_inst_mem;
            i_inst_ecall_mem       <= i_inst_ecall_mem;
            i_inst_mret_mem        <= i_inst_mret_mem;
        end
        else begin
            i_branch_target_pc_mem <= o_pc_ex;
            i_ALU_out_mem          <= o_ALU_out_ex;
            i_psw_flags_mem        <= o_psw_flags_ex;
            i_mem_r_en_mem         <= o_mem_r_en_ex;
            i_mem_r_ext_type_mem   <= o_mem_r_ext_type_ex;
            i_mem_w_en_mem         <= o_mem_w_en_ex;
            i_mem_w_size_mem       <= o_mem_w_size_ex;
            i_regbus_B_mem         <= o_regbus_B_ex;
            i_rd_w_addr_mem        <= o_rd_w_addr_ex;
            i_rd_w_en_mem          <= o_rd_w_en_ex;
            i_rd_w_src_mem         <= o_rd_w_src_ex;
            i_csr_w_en_mem         <= o_csr_w_en_ex;
            i_csr_w_addr_mem       <= o_csr_w_addr_ex;
            i_inst_jump_mem        <= o_inst_jump_ex;
            i_inst_branch_type_mem <= o_inst_branch_type_ex;
            i_is_system_inst_mem   <= o_is_system_inst_ex;
            i_inst_ecall_mem       <= o_inst_ecall_ex;
            i_inst_mret_mem        <= o_inst_mret_ex;
        end
    end

    //---------- MEM->WB ----------//
    always @(posedge clock) begin
        if(reset) begin
            i_rd_w_addr_wb         <= 0;
            i_rd_w_en_wb           <= 0;
            i_rd_w_src_wb          <= 0;
            i_csr_w_en_wb          <= 0;
            i_csr_w_addr_wb        <= 0;
            i_mem_r_ext_type_wb    <= 0;
            i_regbus_C_wb          <= 0;
            i_regbus_D_wb          <= 0;
        end
        else if(stall[3]) begin
            i_rd_w_addr_wb         <= i_rd_w_addr_wb;
            i_rd_w_en_wb           <= i_rd_w_en_wb;
            i_rd_w_src_wb          <= i_rd_w_src_wb;
            i_csr_w_en_wb          <= i_csr_w_en_wb;
            i_csr_w_addr_wb        <= i_csr_w_addr_wb;
            i_mem_r_ext_type_wb    <= i_mem_r_ext_type_wb;
            i_regbus_C_wb          <= i_regbus_C_wb;
            i_regbus_D_wb          <= i_regbus_D_wb;
        end
        else begin
            i_rd_w_addr_wb         <= o_rd_w_addr_mem;
            i_rd_w_en_wb           <= o_rd_w_en_mem;
            i_rd_w_src_wb          <= o_rd_w_src_mem;
            i_csr_w_en_wb          <= o_csr_w_en_mem;
            i_csr_w_addr_wb        <= o_csr_w_addr_mem;
            i_mem_r_ext_type_wb    <= o_mem_r_ext_type_mem;
            i_regbus_C_wb          <= o_regbus_C_mem;
            i_regbus_D_wb          <= o_regbus_D_mem;
        end
    end

endmodule


module ysyx_210313_Hazard_Detection (
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs1_addr,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs2_addr,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_addr_ex,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_addr_mem,
    input  wire                                    rd_w_en_ex,
    input  wire                                    csr_w_en_ex,
    input  wire                                    rd_w_src_ex,
    input  wire                                    rd_w_src_mem,
    input  wire                                    mem_stall_req,
    input  wire                                    inst_fencei,
    input  wire                                    inst_wfi,
    output wire [3:0]                              stall,
    output wire                                    bubble,

    input  wire                                    inst_jump_or_branch_taken_flag,
    input  wire                                    exception_jump_flag,
    output wire                                    flush
);
    //----------Pipeline Stall Mechanism----------//
    wire load_use_stall_ex;
    wire load_use_stall_mem;
    wire csr_to_regfile_data_hazard;

    assign load_use_stall_ex  = (rs1_addr == rd_addr_ex  || rs2_addr == rd_addr_ex)  && (|rd_addr_ex)  && rd_w_src_ex;
    assign load_use_stall_mem = (rs1_addr == rd_addr_mem || rs2_addr == rd_addr_mem) && (|rd_addr_mem) && rd_w_src_mem;
    assign csr_to_regfile_data_hazard = rd_w_en_ex && (|rd_addr_ex) && (~rd_w_src_ex) && csr_w_en_ex && (rd_addr_ex == rs1_addr || rd_addr_ex == rs2_addr);

    assign stall[3] = mem_stall_req;
    assign stall[2] = mem_stall_req;
    assign stall[1] = mem_stall_req;
    assign stall[0] = mem_stall_req | ~inst_fencei & bubble;

    //----------Pipeline Flush Mechanism----------//
    assign bubble = inst_fencei | inst_wfi | csr_to_regfile_data_hazard | load_use_stall_ex | load_use_stall_mem;
    assign flush  = inst_jump_or_branch_taken_flag | exception_jump_flag;

endmodule


module ysyx_210313_Forwarding (
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs1_r_addr,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rs2_r_addr,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_r_addr,

    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_ex,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_mem,
    input  wire [`YSYX210313_REGFILE_ADDR_LEN-1:0] rd_w_addr_wb,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_ex,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_mem,
    input  wire [`YSYX210313_CSR_ADDR_LEN-1:0]     csr_w_addr_wb,
    
    input  wire                                    rd_w_en_ex,
    input  wire                                    rd_w_en_mem,
    input  wire                                    rd_w_en_wb,
    input  wire                                    rd_w_src_ex,
    input  wire                                    rd_w_src_mem,
    input  wire                                    csr_w_en_ex,
    input  wire                                    csr_w_en_mem,
    input  wire                                    csr_w_en_wb,
    output wire                                    forward_rs1_flag,
    output wire                                    forward_rs2_flag,
    output wire                                    forward_csr_flag,

    input  wire [`YSYX210313_XLEN-1:0]             rd_w_data_ex,
    input  wire [`YSYX210313_XLEN-1:0]             rd_w_data_mem,
    input  wire [`YSYX210313_XLEN-1:0]             rd_w_data_wb,
    input  wire [`YSYX210313_MXLEN-1:0]            csr_w_data_ex,
    input  wire [`YSYX210313_MXLEN-1:0]            csr_w_data_mem,
    input  wire [`YSYX210313_MXLEN-1:0]            csr_w_data_wb,
    output wire [`YSYX210313_XLEN-1:0]             forward_rs1_data,
    output wire [`YSYX210313_XLEN-1:0]             forward_rs2_data,
    output wire [`YSYX210313_XLEN-1:0]             forward_csr_data
);
    //----------Forwarding Flags----------//
    wire forward_rs1_flag_ex;
    wire forward_rs1_flag_mem;
    wire forward_rs1_flag_wb;
    wire forward_rs2_flag_ex;
    wire forward_rs2_flag_mem;
    wire forward_rs2_flag_wb;
    wire forward_csr_flag_ex;
    wire forward_csr_flag_mem;
    wire forward_csr_flag_wb;

    assign forward_rs1_flag_ex = rd_w_en_ex && (rd_w_addr_ex == rs1_r_addr) && (|rd_w_addr_ex) && (~rd_w_src_ex);
    assign forward_rs2_flag_ex = rd_w_en_ex && (rd_w_addr_ex == rs2_r_addr) && (|rd_w_addr_ex) && (~rd_w_src_ex);
    assign forward_csr_flag_ex = csr_w_en_ex && (csr_w_addr_ex == csr_r_addr);

    assign forward_rs1_flag_mem = rd_w_en_mem && (rd_w_addr_mem == rs1_r_addr) && (|rd_w_addr_mem) && (~rd_w_src_mem);
    assign forward_rs2_flag_mem = rd_w_en_mem && (rd_w_addr_mem == rs2_r_addr) && (|rd_w_addr_mem) && (~rd_w_src_mem);
    assign forward_csr_flag_mem = csr_w_en_mem && (csr_w_addr_mem == csr_r_addr);

    assign forward_rs1_flag_wb = rd_w_en_wb && (rd_w_addr_wb == rs1_r_addr) && (|rd_w_addr_wb);
    assign forward_rs2_flag_wb = rd_w_en_wb && (rd_w_addr_wb == rs2_r_addr) && (|rd_w_addr_wb);
    assign forward_csr_flag_wb = csr_w_en_wb && (csr_w_addr_wb == csr_r_addr);

    assign forward_rs1_flag = forward_rs1_flag_ex | forward_rs1_flag_mem | forward_rs1_flag_wb;
    assign forward_rs2_flag = forward_rs2_flag_ex | forward_rs2_flag_mem | forward_rs2_flag_wb;
    assign forward_csr_flag = forward_csr_flag_ex | forward_csr_flag_mem | forward_csr_flag_wb;

    //----------Data Forwarding----------//
    assign forward_rs1_data = forward_rs1_flag_ex  ?  rd_w_data_ex   : 
                              forward_rs1_flag_mem ?  rd_w_data_mem  : 
                              forward_rs1_flag_wb  ?  rd_w_data_wb   :  64'h0  ;

    assign forward_rs2_data = forward_rs2_flag_ex  ?  rd_w_data_ex   :
                              forward_rs2_flag_mem ?  rd_w_data_mem  :
                              forward_rs2_flag_wb  ?  rd_w_data_wb   :  64'h0  ;

    assign forward_csr_data = forward_csr_flag_ex  ?  csr_w_data_ex   :
                              forward_csr_flag_mem ?  csr_w_data_mem  :
                              forward_csr_flag_wb  ?  csr_w_data_wb   :  64'h0  ;
                
endmodule


module ysyx_210313_clint (
    input  wire                                           clock,
    input  wire                                           reset_n,

    output wire                                           intr,
    input  wire [`YSYX210313_MXLEN-1:0]                   mtimefreq,

    output wire                                           clint_aw_ready,
    input  wire                                           clint_aw_valid,
    input  wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]          clint_aw_addr,
    input  wire [`YSYX210313_AXI_ID_WIDTH-1:0]            clint_aw_id,
    input  wire [7:0]                                     clint_aw_len,

    output wire                                           clint_w_ready,
    input  wire                                           clint_w_valid,
    input  wire [`YSYX210313_AXI_DATA_WIDTH-1:0]          clint_w_data,
    input  wire [`YSYX210313_AXI_DATA_WIDTH/8-1:0]        clint_w_strb,
    input  wire                                           clint_w_last,
    
    input  wire                                           clint_b_ready,
    output wire                                           clint_b_valid,
    output wire [1:0]                                     clint_b_resp,
    output wire [`YSYX210313_AXI_ID_WIDTH-1:0]            clint_b_id,

    output wire                                           clint_ar_ready,
    input  wire                                           clint_ar_valid,
    input  wire [`YSYX210313_AXI_ADDR_WIDTH-1:0]          clint_ar_addr,
    input  wire [`YSYX210313_AXI_ID_WIDTH-1:0]            clint_ar_id,
    input  wire [7:0]                                     clint_ar_len,
    
    input  wire                                           clint_r_ready,
    output wire                                           clint_r_valid,
    output wire [1:0]                                     clint_r_resp,
    output reg  [`YSYX210313_AXI_DATA_WIDTH-1:0]          clint_r_data,
    output wire                                           clint_r_last,
    output wire [`YSYX210313_AXI_ID_WIDTH-1:0]            clint_r_id
);

    reg [63: 0] mtime;
    reg [63: 0] mtimecmp;
    reg [63: 0] mtimediv;

    always @(posedge clock) begin
        if(~reset_n) mtimediv <= 0;
        else if(mtimediv < mtimefreq) mtimediv <= mtimediv + 64'b1;
        else mtimediv <= 0;
    end

    assign intr = mtime >= mtimecmp;

    //axi
    //handshake
    wire aw_hs      = clint_aw_ready & clint_aw_valid;
    wire w_hs       = clint_w_ready  & clint_w_valid;
    wire b_hs       = clint_b_ready  & clint_b_valid;
    wire ar_hs      = clint_ar_ready & clint_ar_valid;
    wire r_hs       = clint_r_ready  & clint_r_valid;

    wire w_done     = w_hs & clint_w_last;
    wire r_done     = r_hs & clint_r_last;
    wire b_done     = b_hs;

    //state machine
    localparam [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] w_state, r_state;
    wire w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
    wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (~reset_n) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            case (w_state)
                W_STATE_IDLE  :               w_state <= W_STATE_ADDR;
                W_STATE_ADDR  :  if (aw_hs)   w_state <= W_STATE_WRITE;
                W_STATE_WRITE :  if (w_done)  w_state <= W_STATE_RESP;
                W_STATE_RESP  :  if (b_hs)    w_state <= W_STATE_IDLE;
                default       :               w_state <= W_STATE_IDLE;
            endcase
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (~reset_n) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            case (r_state)
                R_STATE_IDLE :               r_state <= R_STATE_ADDR;
                R_STATE_ADDR : if (ar_hs)    r_state <= R_STATE_READ;
                R_STATE_READ : if (r_done)   r_state <= R_STATE_IDLE;
                default      :               r_state <= R_STATE_IDLE;
            endcase
        end
    end

    //------------------Number of transmission------------------
    //-------------------read----------------------
    reg [7:0] r_len;
    wire [7:0] axi_r_len;
    wire r_len_reset_n    = reset_n & ~r_state_idle;
    wire r_len_incr_en    = (r_len != axi_r_len) & r_hs;
    always @(posedge clock) begin
        if (~r_len_reset_n) begin
            r_len <= 0;
        end
        else if (r_len_incr_en) begin
            r_len <= r_len + 1;
        end
    end

    //-------------------write----------------------
    reg [7:0] w_len;
    wire [7:0] axi_w_len;
    wire w_len_reset_n    =reset_n & ~b_done;
    wire w_len_incr_en    = (w_len != axi_w_len) & w_hs;
    always @(posedge clock) begin
        if (~w_len_reset_n) begin
            w_len <= 0;
        end
        else if (w_len_incr_en) begin
            w_len <= w_len + 1;
        end
    end

    // ------------------Process Data------------------
    //-------------------read----------------------
    reg  [`YSYX210313_AXI_ID_WIDTH-1:0]   r_id;
    assign axi_r_len      = clint_ar_len;

    always @(posedge clock) begin
        if (~reset_n) begin
            r_id   <= 0;
        end
        else if (ar_hs) begin
            r_id   <= clint_ar_id;
        end
        else begin
            r_id   <= r_id;
        end
    end

    //-------------------write----------------------
    assign axi_w_len      = clint_aw_len;
    reg  [`YSYX210313_AXI_ADDR_WIDTH-1:0] w_addr;
    reg  [`YSYX210313_AXI_ID_WIDTH-1:0]   w_id;

    always @(posedge clock) begin
        if (~reset_n) begin
            w_addr <= 0;
            w_id   <= 0;
        end
        else if (aw_hs) begin
            w_addr <= clint_aw_addr;
            w_id   <= clint_aw_id;
        end
        else begin
            w_addr <= w_addr;
            w_id   <= w_id;
        end
    end

    // ------------------Write Transaction------------------
    // Write address channel signals
    assign clint_aw_ready = w_state_addr | w_state_write;

    // Write data channel signals
    assign clint_w_ready = w_state_addr | w_state_write;

    //Write response channel signals
    assign clint_b_valid   = w_state_resp;
    assign clint_b_resp    = 2'b00;
    assign clint_b_id      = w_id;

    always @(posedge clock) begin
        if (~reset_n) begin
            mtime <= 0;
            mtimecmp <= 0;
        end
        else if (clint_w_ready & clint_w_valid) begin
            if ({w_addr[31:3] , 3'b0 } == `YSYX210313_MTIME_ADDR) begin
                mtime[ 7: 0] <= clint_w_strb[0] ? clint_w_data[ 7: 0] : mtime[ 7: 0];
                mtime[15: 8] <= clint_w_strb[1] ? clint_w_data[15: 8] : mtime[15: 8];
                mtime[23:16] <= clint_w_strb[2] ? clint_w_data[23:16] : mtime[23:16];
                mtime[31:24] <= clint_w_strb[3] ? clint_w_data[31:24] : mtime[31:24];
                mtime[39:32] <= clint_w_strb[4] ? clint_w_data[39:32] : mtime[39:32];
                mtime[47:40] <= clint_w_strb[5] ? clint_w_data[47:40] : mtime[47:40];
                mtime[55:48] <= clint_w_strb[6] ? clint_w_data[55:48] : mtime[55:48];
                mtime[63:56] <= clint_w_strb[7] ? clint_w_data[63:56] : mtime[63:56];
            end
            else if ({w_addr[31:3] , 3'b0 } == `YSYX210313_MTIMECMP_ADDR) begin
                mtimecmp[ 7: 0] <= clint_w_strb[0] ? clint_w_data[ 7: 0] : mtimecmp[ 7: 0];
                mtimecmp[15: 8] <= clint_w_strb[1] ? clint_w_data[15: 8] : mtimecmp[15: 8];
                mtimecmp[23:16] <= clint_w_strb[2] ? clint_w_data[23:16] : mtimecmp[23:16];
                mtimecmp[31:24] <= clint_w_strb[3] ? clint_w_data[31:24] : mtimecmp[31:24];
                mtimecmp[39:32] <= clint_w_strb[4] ? clint_w_data[39:32] : mtimecmp[39:32];
                mtimecmp[47:40] <= clint_w_strb[5] ? clint_w_data[47:40] : mtimecmp[47:40];
                mtimecmp[55:48] <= clint_w_strb[6] ? clint_w_data[55:48] : mtimecmp[55:48];
                mtimecmp[63:56] <= clint_w_strb[7] ? clint_w_data[63:56] : mtimecmp[63:56];
            end
        end
        else    mtime <= (mtimediv == mtimefreq) ? (mtime + 64'b1) : mtime;
    end

    // ------------------Read Transaction------------------
    // Read address channel signals
    assign clint_ar_ready = r_state_addr;

    // Read data channel signals
    assign clint_r_valid  = r_state_read;
    assign clint_r_resp   = 2'b00;
    assign clint_r_last   = (clint_r_valid & axi_r_len == r_len);
    assign clint_r_id     = r_id;


    always @(posedge clock) begin
        if (~reset_n) begin
            clint_r_data[`YSYX210313_AXI_DATA_WIDTH-1:0] <= 0;
        end
        else if (clint_ar_ready & clint_ar_valid) begin
            clint_r_data[`YSYX210313_AXI_DATA_WIDTH-1:0] <= ({clint_ar_addr[31:3] , 3'b0 } == `YSYX210313_MTIME_ADDR)    ? mtime    : 
                                                            ({clint_ar_addr[31:3] , 3'b0 } == `YSYX210313_MTIMECMP_ADDR) ? mtimecmp : 0;
        end
    end


endmodule


module ysyx_210313_axi_rw_if # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 2,
    parameter AXI_ID            = 0
)(
    input  wire                              clock,
    input  wire                              reset_n,

	input                                    r_req,
    output wire                              r_handshaked,
	output reg                               r_okay,
    output reg  [RW_DATA_WIDTH-1:0]          data_read,
    input  wire [AXI_ADDR_WIDTH-1:0]         r_addr,
    input  wire [1:0]                        r_size,
    output reg  [1:0]                        r_resp,

    // Advanced eXtensible Interface
    input  wire                              axi_ar_ready_i,
    output wire                              axi_ar_valid_o,
    output wire [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output wire [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output wire [7:0]                        axi_ar_len_o,
    output wire [2:0]                        axi_ar_size_o,
    output wire [1:0]                        axi_ar_burst_o,
    
    output wire                              axi_r_ready_o,
    input  wire                              axi_r_valid_i,
    input  wire [1:0]                        axi_r_resp_i,
    input  wire [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input  wire                              axi_r_last_i
);

    //---------- Handshake ----------//
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire r_done     = r_hs & axi_r_last_i;

    //---------- State Machine ----------//
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] r_state;
    wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Read State Machine
    always @(posedge clock) begin
        if (~reset_n) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_req) begin
                case (r_state)
                    R_STATE_IDLE :               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR : if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ : if (r_done)   r_state <= R_STATE_IDLE;
                    default      :               r_state <= R_STATE_IDLE;
                endcase
            end
        end
    end


    //---------- Number Of Transmission ----------//
    // Read Counter
    reg [7:0] r_len;
    wire [7:0] axi_r_len;
    wire r_len_reset_n      = reset_n & ~(r_req & r_state_idle);
    wire r_len_incr_en    = (r_len != axi_r_len) & r_hs;
    always @(posedge clock) begin
        if (~r_len_reset_n) begin
            r_len <= 0;
        end
        else if (r_len_incr_en) begin
            r_len <= r_len + 1;
        end
    end

    //---------- Data Processing ----------//
    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);
    localparam MASK_WIDTH    = AXI_DATA_WIDTH ;

    // Read
    wire r_size_b             = r_size == `YSYX210313_SIZE_B;
    wire r_size_h             = r_size == `YSYX210313_SIZE_H;
    wire r_size_w             = r_size == `YSYX210313_SIZE_W;
    wire r_size_d             = r_size == `YSYX210313_SIZE_D;

    wire r_aligned            = ~((r_size_b & 1'b0)
                                | (r_size_h & r_addr[0])
                                | (r_size_w & r_addr[0] & r_addr[1])
                                | (r_size_d & r_addr[0] & r_addr[1] & r_addr[2]));

    wire [3:0] r_addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, r_addr[ALIGNED_WIDTH-1:0]};
    wire [3:0] r_addr_op2     = ({4{r_size_b}} & {4'b0})
                                | ({4{r_size_h}} & {4'b1})
                                | ({4{r_size_w}} & {4'b11})
                                | ({4{r_size_d}} & {4'b111})
                                ;
    wire [3:0] r_addr_end     = r_addr_op1 + r_addr_op2;
    wire [2:0] axi_r_addr_end = {(r_size_d ? 1'b0 : r_addr_end[2]) , (r_size_w ? 1'b0 : r_addr_end[1]) , (r_size_h ? 1'b0 : r_addr_end[0])};
    wire r_overstep           = r_addr_end[3:ALIGNED_WIDTH] != 0;

    assign axi_r_len      = { 7'b0 , ~r_aligned | r_overstep };
    wire [2:0] axi_r_size     = { 1'b0 , r_size };
    
    wire [AXI_ADDR_WIDTH-1:0] axi_r_addr  = {r_addr[AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], (r_size_d ? 1'b0 : r_addr[2]) , (r_size_w ? 1'b0 : r_addr[1]) , (r_size_h ? 1'b0 : r_addr[0]) };

    wire [OFFSET_WIDTH-1:0] r_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {r_addr[ALIGNED_WIDTH-1:0]}} << 3;
    wire [OFFSET_WIDTH-1:0] r_offset_h    = r_overstep ? ~r_offset_l + 1'b1 : r_offset_l ;

    wire [OFFSET_WIDTH-1:0] r_aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {axi_r_addr[ALIGNED_WIDTH-1:0]}} << 3;
    wire [OFFSET_WIDTH-1:0] r_aligned_offset_h    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {axi_r_addr_end[ALIGNED_WIDTH-1:0]}} << 3;

    wire [MASK_WIDTH-1:0] r_mask        = (({MASK_WIDTH{r_size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                          | ({MASK_WIDTH{r_size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                          | ({MASK_WIDTH{r_size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                          | ({MASK_WIDTH{r_size_d}} & 64'hffffffff_ffffffff));
    wire [MASK_WIDTH-1:0] r_mask_l      = r_mask << r_aligned_offset_l;
    wire [MASK_WIDTH-1:0] r_mask_h      = r_overstep ? r_mask << r_aligned_offset_h : r_mask >> r_aligned_offset_h ;
    
    wire [AXI_ID_WIDTH-1:0] axi_r_id              = AXI_ID;

    wire r_okay_nxt = r_done;
    wire r_okay_en      = r_done | r_okay;
    always @(posedge clock) begin
        if (~reset_n) begin
            r_okay <= 0;
        end
        else if (r_okay_en) begin
            r_okay <= r_okay_nxt;
        end
    end

    wire [1:0] r_resp_nxt = axi_r_resp_i;
    wire r_resp_en = r_done;
    always @(posedge clock) begin
        if (~reset_n) begin
            r_resp <= 0;
        end
        else if (r_resp_en) begin
            r_resp <= r_resp_nxt;
        end
    end
    assign r_handshaked = r_state_read | (ar_hs & r_req);

    //---------- Read Transaction ----------//
    // Read Address Channel Signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = axi_r_addr;
    assign axi_ar_id_o      = axi_r_id;
    assign axi_ar_len_o     = axi_r_len;
    assign axi_ar_size_o    = axi_r_size;
    assign axi_ar_burst_o   = `YSYX210313_AXI_BURST_TYPE_INCR;

    // Read Data Channel Signals
    assign axi_r_ready_o    = r_state_read;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & r_mask_l) >> r_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = r_overstep ? (axi_r_data_i & r_mask_h) << r_offset_h  :  (axi_r_data_i & r_mask_h) >> r_offset_h;


    always @(posedge clock) begin
        if (~reset_n) begin
            data_read[AXI_DATA_WIDTH-1:0] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~r_aligned | r_overstep) begin
                if (r_len[0]) begin
                    data_read[AXI_DATA_WIDTH-1:0] <= data_read[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    data_read[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (r_len == 0) begin
                data_read[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
            end
        end
    end

endmodule


module ysyx_210313_axi_rw_mem # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 2,
    parameter AXI_ID            = 0
)(
    input  wire                              clock,
    input  wire                              reset_n,

	input                                    r_req,
	output reg                               r_okay,
    output reg  [RW_DATA_WIDTH-1:0]          data_read,
    input  wire [AXI_ADDR_WIDTH-1:0]         r_addr,
    input  wire [1:0]                        r_size,
    output reg  [1:0]                        r_resp,

	input  wire                              w_req,
	output reg                               w_okay,
    input  wire [RW_DATA_WIDTH-1:0]          data_write,
    input  wire [AXI_ADDR_WIDTH-1:0]         w_addr,
    input  wire [1:0]                        w_size,
    output reg  [1:0]                        w_resp,



    // Advanced eXtensible Interface
    input  wire                              axi_aw_ready_i,
    output wire                              axi_aw_valid_o,
    output wire [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output wire [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output wire [7:0]                        axi_aw_len_o,
    output wire [2:0]                        axi_aw_size_o,
    output wire [1:0]                        axi_aw_burst_o,

    input  wire                              axi_w_ready_i,
    output wire                              axi_w_valid_o,
    output reg  [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output reg  [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output wire                              axi_w_last_o,
    
    output wire                              axi_b_ready_o,
    input  wire                              axi_b_valid_i,
    input  wire [1:0]                        axi_b_resp_i,

    input  wire                              axi_ar_ready_i,
    output wire                              axi_ar_valid_o,
    output wire [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output wire [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output wire [7:0]                        axi_ar_len_o,
    output wire [2:0]                        axi_ar_size_o,
    output wire [1:0]                        axi_ar_burst_o,
    
    output wire                              axi_r_ready_o,
    input  wire                              axi_r_valid_i,
    input  wire [1:0]                        axi_r_resp_i,
    input  wire [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input  wire                              axi_r_last_i
);

    //---------- Handshake ----------//
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;
    wire b_done     = b_hs;

    
    //---------- State Machine ----------//
    localparam [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] w_state, r_state;
    wire w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
    wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (~reset_n) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if (w_req) begin
                case (w_state)
                    W_STATE_IDLE  :               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR  :  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE :  if (w_done)  w_state <= W_STATE_RESP;
                    W_STATE_RESP  :  if (b_hs)    w_state <= W_STATE_IDLE;
                    default       :               w_state <= W_STATE_IDLE;
                endcase
            end
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (~reset_n) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_req) begin
                case (r_state)
                    R_STATE_IDLE :               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR : if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ : if (r_done)   r_state <= R_STATE_IDLE;
                    default      :               r_state <= R_STATE_IDLE;
                endcase
            end
        end
    end

    //---------- Number Of Transmission ----------//
    // Read Counter
    reg [7:0] r_len;
    wire [7:0] axi_r_len;
    wire r_len_reset_n      = reset_n & ~(r_req & r_state_idle);
    wire r_len_incr_en    = (r_len != axi_r_len) & r_hs;
    always @(posedge clock) begin
        if (~r_len_reset_n) begin
            r_len <= 0;
        end
        else if (r_len_incr_en) begin
            r_len <= r_len + 1;
        end
    end

    // Write Counter
    reg [7:0] w_len;
    wire [7:0] axi_w_len;
    wire w_len_reset_n      = reset_n & ~(w_req & b_done);
    wire w_len_incr_en    = (w_len != axi_w_len) & w_hs;
    always @(posedge clock) begin
        if (~w_len_reset_n) begin
            w_len <= 0;
        end
        else if (w_len_incr_en) begin
            w_len <= w_len + 1;
        end
    end

    //---------- Data Processing ----------//
    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);
    localparam MASK_WIDTH    = AXI_DATA_WIDTH;

    // Read
    wire r_size_b             = r_size == `YSYX210313_SIZE_B;
    wire r_size_h             = r_size == `YSYX210313_SIZE_H;
    wire r_size_w             = r_size == `YSYX210313_SIZE_W;
    wire r_size_d             = r_size == `YSYX210313_SIZE_D;

    wire r_aligned            = ~((r_size_b & 1'b0)
                                | (r_size_h & r_addr[0])
                                | (r_size_w & r_addr[0] & r_addr[1])
                                | (r_size_d & r_addr[0] & r_addr[1] & r_addr[2]));

    wire [3:0] r_addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, r_addr[ALIGNED_WIDTH-1:0]};
    wire [3:0] r_addr_op2     = ({4{r_size_b}} & {4'b0})
                                | ({4{r_size_h}} & {4'b1})
                                | ({4{r_size_w}} & {4'b11})
                                | ({4{r_size_d}} & {4'b111})
                                ;
    wire [3:0] r_addr_end     = r_addr_op1 + r_addr_op2;
    wire [2:0] axi_r_addr_end = {(r_size_d ? 1'b0 : r_addr_end[2]) , (r_size_w ? 1'b0 : r_addr_end[1]) , (r_size_h ? 1'b0 : r_addr_end[0])};
    wire r_overstep           = r_addr_end[3:ALIGNED_WIDTH] != 0;

    assign axi_r_len      = { 7'b0 , ~r_aligned | r_overstep };
    wire [2:0] axi_r_size     = { 1'b0 , r_size };
    
    wire [AXI_ADDR_WIDTH-1:0] axi_r_addr  = {r_addr[AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], (r_size_d ? 1'b0 : r_addr[2]) , (r_size_w ? 1'b0 : r_addr[1]) , (r_size_h ? 1'b0 : r_addr[0]) };

    wire [OFFSET_WIDTH-1:0] r_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {r_addr[ALIGNED_WIDTH-1:0]}} << 3;
    wire [OFFSET_WIDTH-1:0] r_offset_h    = r_overstep ? ~r_offset_l + 1'b1 : r_offset_l ;

    wire [OFFSET_WIDTH-1:0] r_aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {axi_r_addr[ALIGNED_WIDTH-1:0]}} << 3;
    wire [OFFSET_WIDTH-1:0] r_aligned_offset_h    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {axi_r_addr_end[ALIGNED_WIDTH-1:0]}} << 3;

    wire [MASK_WIDTH-1:0] r_mask        = (({MASK_WIDTH{r_size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                          | ({MASK_WIDTH{r_size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                          | ({MASK_WIDTH{r_size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                          | ({MASK_WIDTH{r_size_d}} & 64'hffffffff_ffffffff));
    wire [MASK_WIDTH-1:0] r_mask_l      = r_mask << r_aligned_offset_l;
    wire [MASK_WIDTH-1:0] r_mask_h      = r_overstep ? r_mask << r_aligned_offset_h : r_mask >> r_aligned_offset_h ;

    wire [AXI_ID_WIDTH-1:0] axi_r_id              = AXI_ID;

    wire r_okay_nxt = r_done;
    wire r_okay_en      = r_done | r_okay;
    always @(posedge clock) begin
        if (~reset_n) begin
            r_okay <= 0;
        end
        else if (r_okay_en) begin
            r_okay <= r_okay_nxt;
        end
    end

    wire [1:0] r_resp_nxt = axi_r_resp_i;
    wire r_resp_en = r_done;
    always @(posedge clock) begin
        if (~reset_n) begin
            r_resp <= 0;
        end
        else if (r_resp_en) begin
            r_resp <= r_resp_nxt;
        end
    end

    // Write
    wire w_size_b             = w_size == `YSYX210313_SIZE_B;
    wire w_size_h             = w_size == `YSYX210313_SIZE_H;
    wire w_size_w             = w_size == `YSYX210313_SIZE_W;
    wire w_size_d             = w_size == `YSYX210313_SIZE_D;

    wire w_aligned            = ~(w_size_b & 1'b0)
                                | (w_size_h & w_addr[0])
                                | (w_size_w & w_addr[0] & w_addr[1])
                                | (w_size_d & w_addr[0] & w_addr[1] & w_addr[2]);

    wire [3:0] w_addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, w_addr[ALIGNED_WIDTH-1:0]};
    wire [3:0] w_addr_op2     = ({4{r_size_b}} & {4'b0})
                                | ({4{r_size_h}} & {4'b1})
                                | ({4{r_size_w}} & {4'b11})
                                | ({4{r_size_d}} & {4'b111})
                                ;
    wire [3:0] w_addr_end     = w_addr_op1 + w_addr_op2;
    wire [2:0] axi_w_addr_end = {(w_size_d ? 1'b0 : w_addr_end[2]) , (w_size_w ? 1'b0 : w_addr_end[1]) , (w_size_h ? 1'b0 : w_addr_end[0])};
    wire w_overstep           = w_addr_end[3:ALIGNED_WIDTH] != 0;

    assign axi_w_len      = { 7'b0 , ~w_aligned | w_overstep };
    wire [2:0] axi_w_size     = { 1'b0 , w_size };

    wire [AXI_ADDR_WIDTH-1:0] axi_w_addr  = {w_addr[AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], (w_size_d ? 1'b0 : w_addr[2]) , (w_size_w ? 1'b0 : w_addr[1]) , (w_size_h ? 1'b0 : w_addr[0]) };

    wire [OFFSET_WIDTH-1:0] w_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {w_addr[ALIGNED_WIDTH-1:0]}} << 3;
    wire [OFFSET_WIDTH-1:0] w_offset_h    = w_overstep ? ~w_offset_l + 1'b1 : w_offset_l ;


    wire [OFFSET_WIDTH-1:0] w_aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {axi_w_addr[ALIGNED_WIDTH-1:0]}};
    wire [OFFSET_WIDTH-1:0] w_aligned_offset_h    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {axi_w_addr_end[ALIGNED_WIDTH-1:0]}};

    wire [AXI_DATA_WIDTH/8-1:0] w_mask            = (({AXI_DATA_WIDTH/8{w_size_b}} & {{AXI_DATA_WIDTH/8-1{1'b0}}, 1'b1})
                                                    | ({AXI_DATA_WIDTH/8{w_size_h}} & {{AXI_DATA_WIDTH/8-2{1'b0}}, 2'b11})
                                                    | ({AXI_DATA_WIDTH/8{w_size_w}} & {{AXI_DATA_WIDTH/8-4{1'b0}}, 4'b1111})
                                                    | ({AXI_DATA_WIDTH/8{w_size_d}} & 8'b1111_1111)) ;
    wire [AXI_DATA_WIDTH/8-1:0] w_strb_l = w_mask << w_aligned_offset_l;
    wire [AXI_DATA_WIDTH/8-1:0] w_strb_h = w_overstep ? w_mask << w_aligned_offset_h : w_mask >> w_aligned_offset_h ;

    wire [AXI_ID_WIDTH-1:0] axi_w_id              = AXI_ID;

    wire w_okay_nxt = b_done;
    wire w_okay_en      = b_done | w_okay;
    always @(posedge clock) begin
        if (~reset_n) begin
            w_okay <= 0;
        end
        else if (w_okay_en) begin
            w_okay <= w_okay_nxt;
        end
    end

    wire [1:0] w_resp_nxt = axi_b_resp_i;
    wire w_resp_en = b_done;
    always @(posedge clock) begin
        if (~reset_n) begin
            w_resp <= 0;
        end
        else if (w_resp_en) begin
            w_resp <= w_resp_nxt;
        end
    end

    //---------- Write Transaction ----------//
    // Write Address Channel Signals
    assign axi_aw_valid_o = w_state_addr;
    assign axi_aw_addr_o  = axi_w_addr;
    assign axi_aw_id_o    = axi_w_id;
    assign axi_aw_len_o   = axi_w_len;
    assign axi_aw_size_o  = axi_w_size;
    assign axi_aw_burst_o = `YSYX210313_AXI_BURST_TYPE_INCR;

    // Write Data Channel Signals
    assign axi_w_valid_o    = w_state_write;
    assign axi_w_last_o     = (axi_w_valid_o & axi_w_len == w_len);

    // Write Response Channel Signals
    assign axi_b_ready_o    = w_state_resp;

    wire [AXI_DATA_WIDTH-1:0] axi_w_data_l  = data_write << w_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_w_data_h  = w_overstep ? data_write >> w_offset_h : data_write << w_offset_h;

    always @(posedge clock) begin
        if (~reset_n) begin
            axi_w_data_o[AXI_DATA_WIDTH-1:0] <= 0;
            axi_w_strb_o <= 0;
        end
        else if (aw_hs | axi_w_ready_i & axi_w_valid_o) begin
            if (~w_aligned | w_overstep) begin
                if (w_len[0]) begin
                    axi_w_data_o <= axi_w_data_h;
                    axi_w_strb_o <= w_strb_h;
                end
                else begin
                    axi_w_data_o <= axi_w_data_l;
                    axi_w_strb_o <= w_strb_l;
                end
            end
            else if (w_len == 0) begin
                axi_w_data_o[AXI_DATA_WIDTH-1:0] <= axi_w_data_l;
                axi_w_strb_o <= w_strb_l;
            end
        end
    end


    //---------- Read Transaction ----------//

    // Read Address Channel Signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = axi_r_addr;
    assign axi_ar_id_o      = axi_r_id;
    assign axi_ar_len_o     = axi_r_len;
    assign axi_ar_size_o    = axi_r_size;
    assign axi_ar_burst_o   = `YSYX210313_AXI_BURST_TYPE_INCR;

    // Read Data Channel Signals
    assign axi_r_ready_o    = r_state_read;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & r_mask_l) >> r_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = r_overstep ? (axi_r_data_i & r_mask_h) << r_offset_h  :  (axi_r_data_i & r_mask_h) >> r_offset_h;


    always @(posedge clock) begin
        if (~reset_n) begin
            data_read[AXI_DATA_WIDTH-1:0] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~r_aligned | r_overstep) begin
                if (r_len[0]) begin
                    data_read[AXI_DATA_WIDTH-1:0] <= data_read[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    data_read[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (r_len == 0) begin
                data_read[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
            end
        end
    end

endmodule


module ysyx_210313_axi_interconnect # (
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4
)(
    input  wire                              clock,
    input  wire                              reset_n,

    // IF Port
    output wire                              if_ar_ready,
    input  wire                              if_ar_valid,
    input  wire [AXI_ADDR_WIDTH-1:0]         if_ar_addr,
    input  wire [AXI_ID_WIDTH-3:0]           if_ar_id,
    input  wire [7:0]                        if_ar_len,
    input  wire [2:0]                        if_ar_size,
    input  wire [1:0]                        if_ar_burst,
    
    input  wire                              if_r_ready,
    output wire                              if_r_valid,
    output wire [1:0]                        if_r_resp,
    output wire [AXI_DATA_WIDTH-1:0]         if_r_data,
    output wire                              if_r_last,

    // Mem Port
    output wire                              mem_aw_ready,
    input  wire                              mem_aw_valid,
    input  wire [AXI_ADDR_WIDTH-1:0]         mem_aw_addr,
    input  wire [AXI_ID_WIDTH-3:0]           mem_aw_id,
    input  wire [7:0]                        mem_aw_len,
    input  wire [2:0]                        mem_aw_size,
    input  wire [1:0]                        mem_aw_burst,

    output wire                              mem_w_ready,
    input  wire                              mem_w_valid,
    input  wire [AXI_DATA_WIDTH-1:0]         mem_w_data,
    input  wire [AXI_DATA_WIDTH/8-1:0]       mem_w_strb,
    input  wire                              mem_w_last,
    
    input  wire                              mem_b_ready,
    output wire                              mem_b_valid,
    output wire [1:0]                        mem_b_resp,

    output wire                              mem_ar_ready,
    input  wire                              mem_ar_valid,
    input  wire [AXI_ADDR_WIDTH-1:0]         mem_ar_addr,
    input  wire [AXI_ID_WIDTH-3:0]           mem_ar_id,
    input  wire [7:0]                        mem_ar_len,
    input  wire [2:0]                        mem_ar_size,
    input  wire [1:0]                        mem_ar_burst,

    input  wire                              mem_r_ready,
    output wire                              mem_r_valid,
    output wire [1:0]                        mem_r_resp,
    output wire [AXI_DATA_WIDTH-1:0]         mem_r_data,
    output wire                              mem_r_last,

    // Clint Port
    input  wire                              clint_aw_ready,
    output wire                              clint_aw_valid,
    output wire [AXI_ADDR_WIDTH-1:0]         clint_aw_addr,
    output wire [AXI_ID_WIDTH-1:0]           clint_aw_id,
    output wire [7:0]                        clint_aw_len,

    input  wire                              clint_w_ready,
    output wire                              clint_w_valid,
    output wire [AXI_DATA_WIDTH-1:0]         clint_w_data,
    output wire [AXI_DATA_WIDTH/8-1:0]       clint_w_strb,
    output wire                              clint_w_last,
    
    output wire                              clint_b_ready,
    input  wire                              clint_b_valid,
    input  wire [1:0]                        clint_b_resp,

    input  wire                              clint_ar_ready,
    output wire                              clint_ar_valid,
    output wire [AXI_ADDR_WIDTH-1:0]         clint_ar_addr,
    output wire [AXI_ID_WIDTH-1:0]           clint_ar_id,
    output wire [7:0]                        clint_ar_len,
    
    output wire                              clint_r_ready,
    input  wire                              clint_r_valid,
    input  wire [1:0]                        clint_r_resp,
    input  wire [AXI_DATA_WIDTH-1:0]         clint_r_data,
    input  wire                              clint_r_last,
    input  wire [AXI_ID_WIDTH-1:0]           clint_r_id,

    // Advanced eXtensible Interface
    input  wire                              axi_aw_ready,
    output wire                              axi_aw_valid,
    output wire [AXI_ADDR_WIDTH-1:0]         axi_aw_addr,
    output wire [AXI_ID_WIDTH-1:0]           axi_aw_id,
    output wire [7:0]                        axi_aw_len,
    output wire [2:0]                        axi_aw_size,
    output wire [1:0]                        axi_aw_burst,

    input  wire                              axi_w_ready,
    output wire                              axi_w_valid,
    output wire [AXI_DATA_WIDTH-1:0]         axi_w_data,
    output wire [AXI_DATA_WIDTH/8-1:0]       axi_w_strb,
    output wire                              axi_w_last,
    
    output wire                              axi_b_ready,
    input  wire                              axi_b_valid,
    input  wire [1:0]                        axi_b_resp,

    input  wire                              axi_ar_ready,
    output wire                              axi_ar_valid,
    output wire [AXI_ADDR_WIDTH-1:0]         axi_ar_addr,
    output wire [AXI_ID_WIDTH-1:0]           axi_ar_id,
    output wire [7:0]                        axi_ar_len,
    output wire [2:0]                        axi_ar_size,
    output wire [1:0]                        axi_ar_burst,
    
    output wire                              axi_r_ready,
    input  wire                              axi_r_valid,
    input  wire [1:0]                        axi_r_resp,
    input  wire [AXI_DATA_WIDTH-1:0]         axi_r_data,
    input  wire                              axi_r_last,
    input  wire [AXI_ID_WIDTH-1:0]           axi_r_id
);

    //----------Arbiter----------//
    wire                              arbiter_aw_ready;
    wire                              arbiter_aw_valid;
    wire [AXI_ADDR_WIDTH-1:0]         arbiter_aw_addr;
    wire [AXI_ID_WIDTH-1:0]           arbiter_aw_id;
    wire [7:0]                        arbiter_aw_len;
    wire [2:0]                        arbiter_aw_size;
    wire [1:0]                        arbiter_aw_burst;
    wire                              arbiter_w_ready;
    wire                              arbiter_w_valid;
    wire [AXI_DATA_WIDTH-1:0]         arbiter_w_data;
    wire [AXI_DATA_WIDTH/8-1:0]       arbiter_w_strb;
    wire                              arbiter_w_last;
    wire                              arbiter_b_ready;
    wire                              arbiter_b_valid;
    wire [1:0]                        arbiter_b_resp;
    wire                              arbiter_ar_ready;
    wire                              arbiter_ar_valid;
    wire [AXI_ADDR_WIDTH-1:0]         arbiter_ar_addr;
    wire [AXI_ID_WIDTH-1:0]           arbiter_ar_id;
    wire [7:0]                        arbiter_ar_len;
    wire [2:0]                        arbiter_ar_size;
    wire [1:0]                        arbiter_ar_burst;
    wire                              arbiter_r_ready;
    wire                              arbiter_r_valid;
    wire [1:0]                        arbiter_r_resp;
    wire [AXI_DATA_WIDTH-1:0]         arbiter_r_data;
    wire                              arbiter_r_last;
    wire [AXI_ID_WIDTH-1:0]           arbiter_r_id;

    // AW Channel
    assign mem_aw_ready             =           arbiter_aw_ready;
    assign arbiter_aw_valid         =           mem_aw_valid;
    assign arbiter_aw_addr          =           mem_aw_addr;
    assign arbiter_aw_id            =           { 2'b01 , mem_aw_id };
    assign arbiter_aw_len           =           mem_aw_len;
    assign arbiter_aw_size          =           mem_aw_size;
    assign arbiter_aw_burst         =           mem_aw_burst;

    // W Channel
    assign mem_w_ready              =           arbiter_w_ready;
    assign arbiter_w_valid          =           mem_w_valid;
    assign arbiter_w_data           =           mem_w_data;
    assign arbiter_w_strb           =           mem_w_strb;
    assign arbiter_w_last           =           mem_w_last;

    // B Channel
    assign arbiter_b_ready          =           mem_b_ready;
    assign mem_b_valid              =           arbiter_b_valid;
    assign mem_b_resp               =           arbiter_b_resp;

    // AR Channel
    assign mem_ar_ready             =           mem_ar_valid  ?  arbiter_ar_ready       :    0                     ;
    assign if_ar_ready              =           mem_ar_valid  ?  0                      :    arbiter_ar_ready      ;
    assign arbiter_ar_valid         =           mem_ar_valid  ?  mem_ar_valid           :    if_ar_valid           ;
    assign arbiter_ar_addr          =           mem_ar_valid  ?  mem_ar_addr            :    if_ar_addr            ;
    assign arbiter_ar_id            =           mem_ar_valid  ?  { 2'b01 , mem_ar_id }  :    { 2'b00 , if_ar_id }  ;
    assign arbiter_ar_len           =           mem_ar_valid  ?  mem_ar_len             :    if_ar_len             ;
    assign arbiter_ar_size          =           mem_ar_valid  ?  mem_ar_size            :    if_ar_size            ;
    assign arbiter_ar_burst         =           mem_ar_valid  ?  mem_ar_burst           :    if_ar_burst           ;

    // R Channel
    assign arbiter_r_ready          =           (arbiter_r_id[3:2] == 1)  ?  mem_r_ready       :    if_r_ready         ;
    assign mem_r_valid              =           (arbiter_r_id[3:2] == 1)  ?  arbiter_r_valid   :    0                  ;
    assign if_r_valid               =           (arbiter_r_id[3:2] == 1)  ?  0                 :    arbiter_r_valid    ;
    assign mem_r_resp               =           (arbiter_r_id[3:2] == 1)  ?  arbiter_r_resp    :    0                  ;
    assign if_r_resp                =           (arbiter_r_id[3:2] == 1)  ?  0                 :    arbiter_r_resp     ;
    assign mem_r_data               =           (arbiter_r_id[3:2] == 1)  ?  arbiter_r_data    :    0                  ;
    assign if_r_data                =           (arbiter_r_id[3:2] == 1)  ?  0                 :    arbiter_r_data     ;
    assign mem_r_last               =           (arbiter_r_id[3:2] == 1)  ?  arbiter_r_last    :    0                  ;
    assign if_r_last                =           (arbiter_r_id[3:2] == 1)  ?  0                 :    arbiter_r_last     ;


    //----------Router----------//
    reg  clint_r_access;
    wire clint_r_access_en  = arbiter_ar_valid & (({ arbiter_ar_addr[31:3] , 3'b0 } == `YSYX210313_MTIME_ADDR) | ( {arbiter_ar_addr[31:3] , 3'b0 } == `YSYX210313_MTIMECMP_ADDR));
    wire clint_r_access_rst = clint_r_valid & clint_r_ready & clint_r_last;

    always @(posedge clock) begin
        if(~reset_n)                clint_r_access <= 1'b0;
        else if(clint_r_access_rst) clint_r_access <= 1'b0;
        else if(clint_r_access_en)  clint_r_access <= 1'b1;
        else                        clint_r_access <= clint_r_access;
    end

    reg  clint_w_access;
    wire clint_w_access_en  = arbiter_aw_valid & (({ arbiter_aw_addr[31:3] , 3'b0 } == `YSYX210313_MTIME_ADDR) | ( {arbiter_aw_addr[31:3] , 3'b0 } == `YSYX210313_MTIMECMP_ADDR));
    wire clint_w_access_rst = clint_b_valid & clint_b_ready;

    always @(posedge clock) begin
        if(~reset_n)                clint_w_access <= 1'b0;
        else if(clint_w_access_rst) clint_w_access <= 1'b0;
        else if(clint_w_access_en)  clint_w_access <= 1'b1;
        else                        clint_w_access <= clint_w_access;
    end

    // Clint Port
    // AW Channel
    assign arbiter_aw_ready       =           clint_w_access_en  ?  clint_aw_ready    :  axi_aw_ready  ;
    assign clint_aw_valid         =           clint_w_access_en  ?  arbiter_aw_valid  :  0             ;
    assign clint_aw_addr          =           arbiter_aw_addr;
    assign clint_aw_id            =           arbiter_aw_id;
    assign clint_aw_len           =           arbiter_aw_len;

    // W Channel
    assign arbiter_w_ready        =           clint_w_access  ?  clint_w_ready    :  axi_w_ready  ;
    assign clint_w_valid          =           clint_w_access  ?  arbiter_w_valid  :  0            ;
    assign clint_w_data           =           arbiter_w_data;
    assign clint_w_strb           =           arbiter_w_strb;
    assign clint_w_last           =           arbiter_w_last;

    // B Channel
    assign clint_b_ready          =           clint_w_access ?  arbiter_b_ready  :  0            ;
    assign arbiter_b_valid        =           clint_w_access ?  clint_b_valid    :  axi_b_valid  ;
    assign arbiter_b_resp         =           clint_w_access ?  clint_b_resp     :  axi_b_resp   ;

    // AR Channel
    assign arbiter_ar_ready       =           clint_r_access_en  ?  clint_ar_ready    :  axi_ar_ready  ;
    assign clint_ar_valid         =           clint_r_access_en  ?  arbiter_ar_valid  :  0             ;
    assign clint_ar_addr          =           arbiter_ar_addr    ;
    assign clint_ar_id            =           arbiter_ar_id      ;
    assign clint_ar_len           =           arbiter_ar_len     ;

    // R Channel
    assign clint_r_ready          =           clint_r_access  ?  arbiter_r_ready  :  0            ;
    assign arbiter_r_valid        =           clint_r_access  ?  clint_r_valid    :  axi_r_valid  ;
    assign arbiter_r_resp         =           clint_r_access  ?  clint_r_resp     :  axi_r_resp   ;
    assign arbiter_r_data         =           clint_r_access  ?  clint_r_data     :  axi_r_data   ;
    assign arbiter_r_last         =           clint_r_access  ?  clint_r_last     :  axi_r_last   ;
    assign arbiter_r_id           =           clint_r_access  ?  clint_r_id       :  axi_r_id     ;

    // Advanced eXtensible Interface
    // AW Channel
    assign axi_aw_valid           =           clint_w_access_en  ?  0  :  arbiter_aw_valid  ;
    assign axi_aw_addr            =           arbiter_aw_addr;
    assign axi_aw_id              =           arbiter_aw_id;
    assign axi_aw_len             =           arbiter_aw_len;
    assign axi_aw_size            =           arbiter_aw_size;
    assign axi_aw_burst           =           arbiter_aw_burst;

    // W Channel
    assign axi_w_valid            =           clint_w_access     ?  0  :  arbiter_w_valid  ;
    assign axi_w_data             =           arbiter_w_data;
    assign axi_w_strb             =           arbiter_w_strb;
    assign axi_w_last             =           arbiter_w_last;

    // B Channel
    assign axi_b_ready            =           clint_w_access     ?  0  :  arbiter_b_ready  ;

    // AR Channel
    assign axi_ar_valid           =           clint_r_access_en  ?  0  :  arbiter_ar_valid  ;
    assign axi_ar_addr            =           arbiter_ar_addr    ;
    assign axi_ar_id              =           arbiter_ar_id      ;
    assign axi_ar_len             =           arbiter_ar_len     ;
    assign axi_ar_size            =           arbiter_ar_size    ;
    assign axi_ar_burst           =           arbiter_ar_burst   ;

    // R Channel
    assign axi_r_ready            =           clint_r_access     ?  0  :  arbiter_r_ready  ;

endmodule
