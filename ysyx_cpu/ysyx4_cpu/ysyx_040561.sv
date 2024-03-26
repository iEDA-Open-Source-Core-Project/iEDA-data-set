
// 1. for soc sys://////////////////////////////////////////////////////////////////////////////////////////
`define YSYX04561_RISCV_PRIV_MODE_U   0
`define YSYX04561_RISCV_PRIV_MODE_S   1
`define YSYX04561_RISCV_PRIV_MODE_M   3

// 2. for cache:////////////////////////////////////////////////////////////////////////////////////////////

`define YSYX04561_TAG_W          `YSYX04561_ADR_WIDTH-11
`define YSYX04561_VLD_W           1
`define YSYX04561_DRT_W           1
`define YSYX04561_dTARY_W         `YSYX04561_TAG_W+`YSYX04561_VLD_W+`YSYX04561_DRT_W // tag + valid + dirty.
`define YSYX04561_iTARY_W         `YSYX04561_TAG_W+`YSYX04561_VLD_W

`define YSYX04561_TAG_BIT        `YSYX04561_TAG_W-1:0
`define YSYX04561_VLD_BIT        `YSYX04561_TAG_W
`define YSYX04561_DRT_BIT        `YSYX04561_TAG_W+`YSYX04561_VLD_W

// 3. for cpu core://///////////////////////////////////////////////////////////////////////////////////////

// cpu width define:
`define YSYX04561_CPU_WIDTH 64
`define YSYX04561_ADR_WIDTH 32
`define YSYX04561_INS_WIDTH 32
`define YSYX04561_REG_COUNT (1<<`YSYX04561_REG_ADDRW)
`define YSYX04561_REG_ADDRW 5

// opcode -> ins type:
`define YSYX04561_TYPE_R          7'b0110011  //  R type for add/sub/sll/srl/sra/mul/mulh/mulhsu/mulhu/div/divu/rem/remu
`define YSYX04561_TYPE_R_W        7'b0111011  //  R type for addw/subw/sllw/srlw/sraw/mulw/divw/divuw/remw/remuw 
`define YSYX04561_TYPE_S          7'b0100011  //  S type
`define YSYX04561_TYPE_B          7'b1100011  //  B type
`define YSYX04561_TYPE_I          7'b0010011  //  I type for addi/slli/srli/srai/xori/ori/andi
`define YSYX04561_TYPE_I_W        7'b0011011  //  I type for addiw/slliw/srliw/sraiw
`define YSYX04561_TYPE_I_LOAD     7'b0000011  //  I type for lb/lh/lw/lbu/lhu
`define YSYX04561_TYPE_I_JALR     7'b1100111  //  I type for jalr
`define YSYX04561_TYPE_U_LUI      7'b0110111  //  U type for lui
`define YSYX04561_TYPE_U_AUIPC    7'b0010111  //  U type for auipc
`define YSYX04561_TYPE_J          7'b1101111  //  J type for jal
`define YSYX04561_TYPE_SYS        7'b1110011  //  SYS type for ecall/ebreak/csrrw/csrrs/csrrc
`define YSYX04561_TYPE_FENCE      7'b0001111  //  FENCE type for fence.i

// function3:
`define YSYX04561_FUNC3_ADD_SUB_MUL       3'b000        //ADDI ADDIW ADD ADDW SUB SUBW MUL MULW
`define YSYX04561_FUNC3_SLL_MULH          3'b001        //SLL SLLI SLLW SLLIW MULH
`define YSYX04561_FUNC3_SLT_MULHSU        3'b010        //SLT SLTI MULHSU
`define YSYX04561_FUNC3_SLTU_MULHU        3'b011        //STLU STLUI MULHU
`define YSYX04561_FUNC3_XOR_DIV           3'b100        //XOR XORI DIV DIVW
`define YSYX04561_FUNC3_SRL_SRA_DIVU      3'b101        //SRL SRLI SRA SRAI SRLW SRLIW SRAW SRAIW DIVU DIVUW
`define YSYX04561_FUNC3_OR_REM            3'b110        //OR ORI REM REMW
`define YSYX04561_FUNC3_AND_REMU          3'b111        //AND ANDI REMU REMUW

`define YSYX04561_FUNC3_BEQ               3'b000
`define YSYX04561_FUNC3_BNE               3'b001
`define YSYX04561_FUNC3_BLT               3'b100
`define YSYX04561_FUNC3_BGE               3'b101
`define YSYX04561_FUNC3_BLTU              3'b110
`define YSYX04561_FUNC3_BGEU              3'b111

`define YSYX04561_FUNC3_LB_SB             3'b000
`define YSYX04561_FUNC3_LH_SH             3'b001
`define YSYX04561_FUNC3_LW_SW             3'b010
`define YSYX04561_FUNC3_LD_SD             3'b011
`define YSYX04561_FUNC3_LBU               3'b100
`define YSYX04561_FUNC3_LHU               3'b101
`define YSYX04561_FUNC3_LWU               3'b110

// EXU source selection:
`define YSYX04561_EXU_SEL_WIDTH   2
`define YSYX04561_EXU_SEL_REG     `YSYX04561_EXU_SEL_WIDTH'b00
`define YSYX04561_EXU_SEL_IMM     `YSYX04561_EXU_SEL_WIDTH'b01
`define YSYX04561_EXU_SEL_PC4     `YSYX04561_EXU_SEL_WIDTH'b10
`define YSYX04561_EXU_SEL_PCI     `YSYX04561_EXU_SEL_WIDTH'b11

// EXU opreator:
`define YSYX04561_EXU_OPT_WIDTH   6
`define YSYX04561_EXU_NOP         `YSYX04561_EXU_OPT_WIDTH'h0
`define YSYX04561_EXU_ADD         `YSYX04561_EXU_OPT_WIDTH'h1
`define YSYX04561_EXU_SUB         `YSYX04561_EXU_OPT_WIDTH'h2
`define YSYX04561_EXU_ADDW        `YSYX04561_EXU_OPT_WIDTH'h3
`define YSYX04561_EXU_SUBW        `YSYX04561_EXU_OPT_WIDTH'h4
`define YSYX04561_EXU_AND         `YSYX04561_EXU_OPT_WIDTH'h5
`define YSYX04561_EXU_OR          `YSYX04561_EXU_OPT_WIDTH'h6
`define YSYX04561_EXU_XOR         `YSYX04561_EXU_OPT_WIDTH'h7
`define YSYX04561_EXU_SLL         `YSYX04561_EXU_OPT_WIDTH'h8
`define YSYX04561_EXU_SRL         `YSYX04561_EXU_OPT_WIDTH'h9
`define YSYX04561_EXU_SRA         `YSYX04561_EXU_OPT_WIDTH'h10
`define YSYX04561_EXU_SLLW        `YSYX04561_EXU_OPT_WIDTH'h11
`define YSYX04561_EXU_SRLW        `YSYX04561_EXU_OPT_WIDTH'h12
`define YSYX04561_EXU_SRAW        `YSYX04561_EXU_OPT_WIDTH'h13
`define YSYX04561_EXU_MUL         `YSYX04561_EXU_OPT_WIDTH'h14
`define YSYX04561_EXU_MULH        `YSYX04561_EXU_OPT_WIDTH'h15
`define YSYX04561_EXU_MULHSU      `YSYX04561_EXU_OPT_WIDTH'h16
`define YSYX04561_EXU_MULHU       `YSYX04561_EXU_OPT_WIDTH'h17
`define YSYX04561_EXU_DIV         `YSYX04561_EXU_OPT_WIDTH'h18
`define YSYX04561_EXU_DIVU        `YSYX04561_EXU_OPT_WIDTH'h19
`define YSYX04561_EXU_REM         `YSYX04561_EXU_OPT_WIDTH'h20
`define YSYX04561_EXU_REMU        `YSYX04561_EXU_OPT_WIDTH'h21
`define YSYX04561_EXU_MULW        `YSYX04561_EXU_OPT_WIDTH'h22
`define YSYX04561_EXU_DIVW        `YSYX04561_EXU_OPT_WIDTH'h23
`define YSYX04561_EXU_DIVUW       `YSYX04561_EXU_OPT_WIDTH'h24
`define YSYX04561_EXU_REMW        `YSYX04561_EXU_OPT_WIDTH'h25
`define YSYX04561_EXU_REMUW       `YSYX04561_EXU_OPT_WIDTH'h26
`define YSYX04561_EXU_SLT         `YSYX04561_EXU_OPT_WIDTH'h27
`define YSYX04561_EXU_SLTU        `YSYX04561_EXU_OPT_WIDTH'h28


// 4. for cpu csr ://////////////////////////////////////////////////////////////////////////////////////////

// csr regfile define:
`define YSYX04561_M_MODE          2'b11
`define YSYX04561_CSR_COUNT       (1<<`CSR_ADDRW)
`define YSYX04561_CSR_ADDRW       12
`define YSYX04561_ADDR_MSTATUS    `YSYX04561_CSR_ADDRW'h300
`define YSYX04561_ADDR_MTVEC      `YSYX04561_CSR_ADDRW'h305
`define YSYX04561_ADDR_MEPC       `YSYX04561_CSR_ADDRW'h341
`define YSYX04561_ADDR_MCAUSE     `YSYX04561_CSR_ADDRW'h342
`define YSYX04561_ADDR_MCYCLE     `YSYX04561_CSR_ADDRW'hb00
`define YSYX04561_ADDR_MIP        `YSYX04561_CSR_ADDRW'h344
`define YSYX04561_ADDR_MIE        `YSYX04561_CSR_ADDRW'h304
`define YSYX04561_ADDR_MSCRATCH   `YSYX04561_CSR_ADDRW'h340

// csr_file bit define:
`define YSYX04561_M_STATUS_MIE    3      // machine level interrupt enable.
`define YSYX04561_M_STATUS_MPIE   7      // machine level previous interrupt enable.
`define YSYX04561_M_STATUS_MPP    12:11  // machine level previous privilege mode
`define YSYX04561_M_STATUS_VS     10:9   // machine level previous privilege mode
`define YSYX04561_M_STATUS_FS     14:13  // machine level previous privilege mode
`define YSYX04561_M_STATUS_XS     16:15  // machine level previous privilege mode
`define YSYX04561_M_STATUS_SD     63

`define YSYX04561_M_MIE_MTIE      7      // machine interrupt enable, machine timer interrupt enable.
`define YSYX04561_M_MIP_MTIP      7      // machine interrupt pending, machine timer interrupt pending.

// csr fun3:
`define YSYX04561_FUNC3_ECL_EBRK  3'b000  //for ecall, ebreak.
`define YSYX04561_FUNC3_CSRRW     3'b001
`define YSYX04561_FUNC3_CSRRS     3'b010
`define YSYX04561_FUNC3_CSRRC     3'b011
`define YSYX04561_FUNC3_CSRRWI    3'b101
`define YSYX04561_FUNC3_CSRRSI    3'b110
`define YSYX04561_FUNC3_CSRRCI    3'b111

// csr opreator for exu:
`define YSYX04561_CSR_OPT_WIDTH   2
`define YSYX04561_CSR_NOP         `YSYX04561_CSR_OPT_WIDTH'b00
`define YSYX04561_CSR_RW          `YSYX04561_CSR_OPT_WIDTH'b01
`define YSYX04561_CSR_RS          `YSYX04561_CSR_OPT_WIDTH'b10
`define YSYX04561_CSR_RC          `YSYX04561_CSR_OPT_WIDTH'b11

`define YSYX04561_CSR_SEL_REG     1'b0
`define YSYX04561_CSR_SEL_IMM     1'b1

// clint define:
`define YSYX04561_CLINT_BASE_ADDR `YSYX04561_ADR_WIDTH'h02000000
`define YSYX04561_CLINT_END_ADDR  `YSYX04561_ADR_WIDTH'h0200ffff
`define YSYX04561_UART_BASE_ADDR  `YSYX04561_ADR_WIDTH'h10000000
`define YSYX04561_UART_END_ADDR   `YSYX04561_ADR_WIDTH'h10000fff
`define YSYX04561_MSIP_ADDR       `YSYX04561_CLINT_BASE_ADDR+`YSYX04561_ADR_WIDTH'h0000
`define YSYX04561_MTIMECMP_ADDR   `YSYX04561_CLINT_BASE_ADDR+`YSYX04561_ADR_WIDTH'h4000
`define YSYX04561_MTIME_ADDR      `YSYX04561_CLINT_BASE_ADDR+`YSYX04561_ADR_WIDTH'hBFF8

// intr define:
`define YSYX04561_IRQ_TIMER       `YSYX04561_CPU_WIDTH'h80000000_00000007
`define YSYX04561_IRQ_ECALL       `YSYX04561_CPU_WIDTH'd11


// 5. for axi bus://////////////////////////////////////////////////////////////////////////////////////////

`define YSYX04561_SIZE_B              2'b00
`define YSYX04561_SIZE_H              2'b01
`define YSYX04561_SIZE_W              2'b10
`define YSYX04561_SIZE_D              2'b11

`define YSYX04561_REQ_READ            1'b0
`define YSYX04561_REQ_WRITE           1'b1

// AXI interface ysyx_040561_signals define://////////////////////////////////////////////////////////////
// Burst types
`define YSYX04561_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX04561_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX04561_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX04561_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX04561_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX04561_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX04561_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX04561_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX04561_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX04561_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX04561_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX04561_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX04561_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX04561_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX04561_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX04561_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX04561_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX04561_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX04561_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX04561_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX04561_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX04561_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX04561_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX04561_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX04561_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX04561_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX04561_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX04561_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX04561_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX04561_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX04561_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX04561_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX04561_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

module ysyx_040561_stl_rst(
  input   i_clk        ,
  input   i_rst_n      , 
  output  o_rst_n_sync
);

  reg rst_n_r1,rst_n_r2;

  always @ (posedge i_clk or negedge i_rst_n) begin
    if (~i_rst_n) begin
        rst_n_r1 <= 1'b0 ; 
        rst_n_r2 <= 1'b0 ;
    end 
    else begin
        rst_n_r1 <= 1'b1  ; 
        rst_n_r2 <= rst_n_r1; 
    end
  end

  assign o_rst_n_sync = rst_n_r2 ;

endmodule

module ysyx_040561_stl_reg #(
  WIDTH = 1,
  RESET_VAL = 0
)(
  input                     i_clk   ,
  input                     i_rst_n ,
  input                     i_wen   ,
  input         [WIDTH-1:0] i_din   ,
  output logic  [WIDTH-1:0] o_dout
);

  always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
      o_dout <= RESET_VAL;
    end else if(i_wen) begin
      o_dout <= i_din;
    end
  end

endmodule

interface ysyx_040561_axi4_if;
  parameter ADDR_W = 32;
  parameter DATA_W = 64;
  parameter ID_W   = 4;
  parameter USER_W = 1;

  localparam STRB_W = DATA_W/8;

  // 1. addr write channel:
  logic                   aw_ready  ;
  logic                   aw_valid  ;
  logic   [ADDR_W-1:0]    aw_addr   ;
  logic   [2:0]           aw_prot   ;
  logic   [7:0]           aw_len    ;
  logic   [2:0]           aw_size   ;
  logic   [1:0]           aw_burst  ;
  logic                   aw_lock   ;
  logic   [3:0]           aw_cache  ;
  logic   [3:0]           aw_qos    ;
  logic   [ID_W-1:0]      aw_id     ;
  logic   [USER_W-1:0]    aw_user   ;
  logic   [3:0]           aw_region ;

  // 2. data write channel:
  logic                   w_valid   ;
  logic   [DATA_W-1:0]    w_data    ;
  logic   [STRB_W-1:0]    w_strb    ;
  logic                   w_last    ;
  logic                   w_ready   ;
  logic   [USER_W-1:0]    w_user    ; // duo le yige.

  // 3. write response channel:
  logic   [1:0]           b_resp    ;
  logic   [ID_W-1:0]      b_id      ;
  logic                   b_ready   ;
  logic                   b_valid   ;
  logic   [USER_W-1:0]    b_user    ;

  // 4. addr read channel:
  logic                   ar_ready  ;
  logic                   ar_valid  ;
  logic   [ADDR_W-1:0]    ar_addr   ;
  logic   [2:0]           ar_prot   ;
  logic   [7:0]           ar_len    ;
  logic   [2:0]           ar_size   ;
  logic   [1:0]           ar_burst  ;
  logic                   ar_lock   ;
  logic   [3:0]           ar_cache  ;
  logic   [3:0]           ar_qos    ;
  logic   [ID_W-1:0]      ar_id     ;
  logic   [USER_W-1:0]    ar_user   ;
  logic   [3:0]           ar_region ;

  // 5. data read channel:
  logic   [DATA_W-1:0]    r_data    ;
  logic   [1:0]           r_resp    ;
  logic                   r_last    ;
  logic   [ID_W-1:0]      r_id      ;
  logic                   r_ready   ;
  logic                   r_valid   ;
  logic   [USER_W-1:0]    r_user    ;

  modport Master
  (
    output aw_valid, output aw_addr, output aw_prot,  output aw_region,
    output aw_len,   output aw_size, output aw_burst, output aw_lock,
    output aw_cache, output aw_qos,  output aw_id,    output aw_user,
    input  aw_ready,

    output ar_valid, output ar_addr, output ar_prot,  output ar_region,
    output ar_len,   output ar_size, output ar_burst, output ar_lock,
    output ar_cache, output ar_qos,  output ar_id,    output ar_user,
    input  ar_ready,

    output w_valid,  output w_data,  output w_strb,   output w_last,
    output w_user,   input  w_ready,

    input  r_valid,  input  r_data,  input  r_resp,   input  r_last,
    input  r_id,     input  r_user,  output r_ready,

    input  b_valid,  input  b_resp,  input  b_id,     input  b_user,
    output b_ready
  );

  modport Slave
  (
    input  aw_valid, input  aw_addr, input  aw_prot,  input  aw_region,
    input  aw_len,   input  aw_size, input  aw_burst, input  aw_lock,
    input  aw_cache, input  aw_qos,  input  aw_id,    input  aw_user,
    output aw_ready,

    input  ar_valid, input  ar_addr, input  ar_prot,  input  ar_region,
    input  ar_len,   input  ar_size, input  ar_burst, input  ar_lock,
    input  ar_cache, input  ar_qos,  input  ar_id,    input  ar_user,
    output ar_ready,

    input  w_valid,  input  w_data,  input  w_strb,   input  w_last,
    input  w_user,   output w_ready,

    output r_valid,  output r_data,  output r_resp,   output r_last,
    output r_id,     output r_user,  input  r_ready,

    output b_valid,  output b_resp,  output b_id,     output b_user,
    input  b_ready
  );

endinterface

interface ysyx_040561_uni_if;
  parameter ADDR_W = 32;
  parameter DATA_W = 64;

  logic               valid ;
  logic               ready ;
  logic               reqtyp;
  logic [ADDR_W-1:0]  addr  ;
  logic [DATA_W-1:0]  wdata ;
  logic [DATA_W-1:0]  rdata ;
  logic               cachable;
  logic [1:0]         size  ;

  modport Master(
    output valid, input ready, output reqtyp,   output addr,
    output wdata, input rdata, output cachable, output size
  );

  modport Slave(
    input valid, output ready, input reqtyp,   input addr,
    input wdata, output rdata, input cachable, input size
  );

  // size : 00->byte, 01->half byte, 10->word, 11->double word.

endinterface

interface ysyx_040561_sram_if;
  parameter ADDR_W = 6  ;
  parameter DATA_W = 128;

  logic [ADDR_W-1:0]  addr  ;
  logic               cen   ;
  logic               wen   ;
  logic [DATA_W-1:0]  wmask ;
  logic [DATA_W-1:0]  wdata ;
  logic [DATA_W-1:0]  rdata ;


  modport Master(
    output cen  , output wen  , output addr ,
    output wmask, output wdata, input  rdata
  );

  modport Slave(
    input  cen  , input  wen  , input  addr ,
    input  wmask, input  wdata, output rdata
  );

endinterface


module ysyx_040561_stl_mux_default #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  ysyx_040561_stl_mux_internal #(NR_KEY, KEY_LEN, DATA_LEN, 1) i0 (out, key, default_out, lut);

  // always @(*) begin          |         ysyx_040561_stl_mux_default #(4, 2, 1) i0 (y, s, 1'b0, {
  //  case (s)                  |           2'b00, a[0],
  //    2'b00: y = a[0];        |           2'b01, a[1],
  //    2'b01: y = a[1];        |  ===>     2'b10, a[2],
  //    2'b10: y = a[2];        |           2'b11, a[3]
  //    2'b11: y = a[3];        |         });
  //    default: y = 1'b0;      |
  //  endcase                   |
  // end                        |

endmodule

module ysyx_040561_stl_mux #(
  NR_KEY = 2,
  KEY_LEN = 1,
  DATA_LEN = 1
) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  ysyx_040561_stl_mux_internal #(NR_KEY, KEY_LEN, DATA_LEN, 0) i0 (out, key, {DATA_LEN{1'b0}}, lut);

  // always @(*) begin      |         stl_mux #(2, 1, 1) i0 (y, s, {
  //  case (s)              |           1'b0, a,
  //    1'b0: y = a;        |  ====>    1'b1, b
  //    1'b1: y = b;        |         });
  //  endcase               |
  // end                    |

endmodule

module ysyx_040561_stl_mux_internal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1, HAS_DEFAULT = 0) (
  output reg [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  localparam PAIR_LEN = KEY_LEN + DATA_LEN;
  wire [PAIR_LEN-1:0] pair_list [NR_KEY-1:0];
  wire [KEY_LEN-1:0] key_list [NR_KEY-1:0];
  wire [DATA_LEN-1:0] data_list [NR_KEY-1:0];

  generate
    for (genvar n = 0; n < NR_KEY; n = n + 1) begin
      assign pair_list[n] = lut[PAIR_LEN*(n+1)-1 : PAIR_LEN*n];
      assign data_list[n] = pair_list[n][DATA_LEN-1:0];
      assign key_list[n]  = pair_list[n][PAIR_LEN-1:DATA_LEN];
    end
  endgenerate

  reg [DATA_LEN-1 : 0] lut_out;
  reg hit;
  integer i;
  always @(*) begin
    lut_out = 0;
    hit = 0;
    for (i = 0; i < NR_KEY; i = i + 1) begin
      lut_out = lut_out | ({DATA_LEN{key == key_list[i]}} & data_list[i]);
      hit = hit | (key == key_list[i]);
    end
    if (!HAS_DEFAULT) out = lut_out;
    else out = (hit ? lut_out : default_out);
  end
endmodule

module ysyx_040561(               // top wrapper
  input             clock             ,
  input             reset             ,
  input             io_interrupt      ,
  input             io_master_awready ,
  output            io_master_awvalid ,
  output  [31:0]    io_master_awaddr  ,
  output  [3:0]     io_master_awid    ,
  output  [7:0]     io_master_awlen   ,
  output  [2:0]     io_master_awsize  ,
  output  [1:0]     io_master_awburst ,
  input             io_master_wready  ,
  output            io_master_wvalid  ,
  output  [63:0]    io_master_wdata   ,
  output  [7:0]     io_master_wstrb   ,
  output            io_master_wlast   ,
  output            io_master_bready  ,
  input             io_master_bvalid  ,
  input   [1:0]     io_master_bresp   ,
  input   [3:0]     io_master_bid     ,
  input             io_master_arready ,
  output            io_master_arvalid ,
  output  [31:0]    io_master_araddr  ,
  output  [3:0]     io_master_arid    ,
  output  [7:0]     io_master_arlen   ,
  output  [2:0]     io_master_arsize  ,
  output  [1:0]     io_master_arburst ,
  output            io_master_rready  ,
  input             io_master_rvalid  ,
  input   [1:0]     io_master_rresp   ,
  input   [63:0]    io_master_rdata   ,
  input             io_master_rlast   ,
  input   [3:0]     io_master_rid     ,
  output            io_slave_awready  ,
  input             io_slave_awvalid  ,
  input   [31:0]    io_slave_awaddr   ,
  input   [3:0]     io_slave_awid     ,
  input   [7:0]     io_slave_awlen    ,
  input   [2:0]     io_slave_awsize   ,
  input   [1:0]     io_slave_awburst  ,
  output            io_slave_wready   ,
  input             io_slave_wvalid   ,
  input   [63:0]    io_slave_wdata    ,
  input   [7:0]     io_slave_wstrb    ,
  input             io_slave_wlast    ,
  input             io_slave_bready   ,
  output            io_slave_bvalid   ,
  output  [1:0]     io_slave_bresp    ,
  output  [3:0]     io_slave_bid      ,
  output            io_slave_arready  ,
  input             io_slave_arvalid  ,
  input   [31:0]    io_slave_araddr   ,
  input   [3:0]     io_slave_arid     ,
  input   [7:0]     io_slave_arlen    ,
  input   [2:0]     io_slave_arsize   ,
  input   [1:0]     io_slave_arburst  ,
  input             io_slave_rready   ,
  output            io_slave_rvalid   ,
  output  [1:0]     io_slave_rresp    ,
  output  [63:0]    io_slave_rdata    ,
  output            io_slave_rlast    ,
  output  [3:0]     io_slave_rid      ,
  output  [5:0]     io_sram0_addr     ,
  output            io_sram0_cen      ,
  output            io_sram0_wen      ,
  output  [127:0]   io_sram0_wmask    ,
  output  [127:0]   io_sram0_wdata    ,
  input   [127:0]   io_sram0_rdata    ,
  output  [5:0]     io_sram1_addr     ,
  output            io_sram1_cen      ,
  output            io_sram1_wen      ,
  output  [127:0]   io_sram1_wmask    ,
  output  [127:0]   io_sram1_wdata    ,
  input   [127:0]   io_sram1_rdata    ,
  output  [5:0]     io_sram2_addr     ,
  output            io_sram2_cen      ,
  output            io_sram2_wen      ,
  output  [127:0]   io_sram2_wmask    ,
  output  [127:0]   io_sram2_wdata    ,
  input   [127:0]   io_sram2_rdata    ,
  output  [5:0]     io_sram3_addr     ,
  output            io_sram3_cen      ,
  output            io_sram3_wen      ,
  output  [127:0]   io_sram3_wmask    ,
  output  [127:0]   io_sram3_wdata    ,
  input   [127:0]   io_sram3_rdata    ,
  output  [5:0]     io_sram4_addr     ,
  output            io_sram4_cen      ,
  output            io_sram4_wen      ,
  output  [127:0]   io_sram4_wmask    ,
  output  [127:0]   io_sram4_wdata    ,
  input   [127:0]   io_sram4_rdata    ,
  output  [5:0]     io_sram5_addr     ,
  output            io_sram5_cen      ,
  output            io_sram5_wen      ,
  output  [127:0]   io_sram5_wmask    ,
  output  [127:0]   io_sram5_wdata    ,
  input   [127:0]   io_sram5_rdata    ,
  output  [5:0]     io_sram6_addr     ,
  output            io_sram6_cen      ,
  output            io_sram6_wen      ,
  output  [127:0]   io_sram6_wmask    ,
  output  [127:0]   io_sram6_wdata    ,
  input   [127:0]   io_sram6_rdata    ,
  output  [5:0]     io_sram7_addr     ,
  output            io_sram7_cen      ,
  output            io_sram7_wen      ,
  output  [127:0]   io_sram7_wmask    ,
  output  [127:0]   io_sram7_wdata    ,
  input   [127:0]	  io_sram7_rdata
);

  ysyx_040561_axi4_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(`YSYX04561_CPU_WIDTH), .ID_W(4), .USER_W(1)) AxiIf();
  ysyx_040561_sram_if #(.ADDR_W(6), .DATA_W(128)) SramIf[7:0]();

  ysyx_040561_top u_top(
    .i_clk    (clock   ),
    .i_rst_n  (!reset  ),
    .AxiIf_M  (AxiIf   ),
    .SramIf_M (SramIf  )
  );

  // assign AxiIf to wrapper: //////////////////////////////////////////////////////

  assign io_master_awvalid  = AxiIf.aw_valid    ;
  assign io_master_awaddr   = AxiIf.aw_addr     ;
  assign io_master_awid     = AxiIf.aw_id       ;
  assign io_master_awlen    = AxiIf.aw_len      ;
  assign io_master_awsize   = AxiIf.aw_size     ;
  assign io_master_awburst  = AxiIf.aw_burst    ;
  assign AxiIf.aw_ready     = io_master_awready ;
  // no use : aw_user, aw_prot, aw_lock, aw_cache, aw_qos, aw_region;

  assign io_master_wvalid   = AxiIf.w_valid     ;
  assign io_master_wdata    = AxiIf.w_data      ;
  assign io_master_wstrb    = AxiIf.w_strb      ;
  assign io_master_wlast    = AxiIf.w_last      ;
  assign AxiIf.w_ready      = io_master_wready  ;
  // no use : w_user, aw_cache, aw_qos, aw_region, aw_user, aw_prot;

  assign AxiIf.b_valid      = io_master_bvalid  ;
  assign AxiIf.b_resp       = io_master_bresp   ;
  assign AxiIf.b_id         = io_master_bid     ;
  assign io_master_bready   = AxiIf.b_ready     ;
  // no use : b_user;

  assign io_master_arvalid  = AxiIf.ar_valid    ;
  assign io_master_araddr   = AxiIf.ar_addr     ;
  assign io_master_arid     = AxiIf.ar_id       ;
  assign io_master_arlen    = AxiIf.ar_len      ;
  assign io_master_arsize   = AxiIf.ar_size     ;
  assign io_master_arburst  = AxiIf.ar_burst    ;
  assign AxiIf.ar_ready     = io_master_arready ;
  // no use: ar_user, ar_prot, ar_lock, ar_cache, ar_qos, ar_region;

  assign AxiIf.r_valid      = io_master_rvalid  ;
  assign AxiIf.r_resp       = io_master_rresp   ;
  assign AxiIf.r_data       = io_master_rdata   ;
  assign AxiIf.r_last       = io_master_rlast   ;
  assign AxiIf.r_id         = io_master_rid     ;
  assign io_master_rready   = AxiIf.r_ready     ;
  // no use : r_user;

  // no use : axi_slave:
  assign io_slave_awready   = 0                 ;
  assign io_slave_wready    = 0                 ;
  assign io_slave_bvalid    = 0                 ;
  assign io_slave_bresp     = 0                 ;
  assign io_slave_bid       = 0                 ;
  assign io_slave_arready   = 0                 ;
  assign io_slave_rvalid    = 0                 ;
  assign io_slave_rresp     = 0                 ;
  assign io_slave_rdata     = 0                 ;
  assign io_slave_rlast     = 0                 ;
  assign io_slave_rid       = 0                 ;

  // assign SramIf to wrapper: //////////////////////////////////////////////////////
  
  assign io_sram0_addr      = SramIf[0].addr  ;
  assign io_sram0_cen       = SramIf[0].cen   ;
  assign io_sram0_wen       = SramIf[0].wen   ;
  assign io_sram0_wmask     = SramIf[0].wmask ;
  assign io_sram0_wdata     = SramIf[0].wdata ;
  assign SramIf[0].rdata    = io_sram0_rdata  ;

  assign io_sram1_addr      = SramIf[1].addr  ;
  assign io_sram1_cen       = SramIf[1].cen   ;
  assign io_sram1_wen       = SramIf[1].wen   ;
  assign io_sram1_wmask     = SramIf[1].wmask ;
  assign io_sram1_wdata     = SramIf[1].wdata ;
  assign SramIf[1].rdata    = io_sram1_rdata  ;

  assign io_sram2_addr      = SramIf[2].addr  ;
  assign io_sram2_cen       = SramIf[2].cen   ;
  assign io_sram2_wen       = SramIf[2].wen   ;
  assign io_sram2_wmask     = SramIf[2].wmask ;
  assign io_sram2_wdata     = SramIf[2].wdata ;
  assign SramIf[2].rdata    = io_sram2_rdata  ;

  assign io_sram3_addr      = SramIf[3].addr  ;
  assign io_sram3_cen       = SramIf[3].cen   ;
  assign io_sram3_wen       = SramIf[3].wen   ;
  assign io_sram3_wmask     = SramIf[3].wmask ;
  assign io_sram3_wdata     = SramIf[3].wdata ;
  assign SramIf[3].rdata    = io_sram3_rdata  ;

  assign io_sram4_addr      = SramIf[4].addr  ;
  assign io_sram4_cen       = SramIf[4].cen   ;
  assign io_sram4_wen       = SramIf[4].wen   ;
  assign io_sram4_wmask     = SramIf[4].wmask ;
  assign io_sram4_wdata     = SramIf[4].wdata ;
  assign SramIf[4].rdata    = io_sram4_rdata  ;

  assign io_sram5_addr      = SramIf[5].addr  ;
  assign io_sram5_cen       = SramIf[5].cen   ;
  assign io_sram5_wen       = SramIf[5].wen   ;
  assign io_sram5_wmask     = SramIf[5].wmask ;
  assign io_sram5_wdata     = SramIf[5].wdata ;
  assign SramIf[5].rdata    = io_sram5_rdata  ;

  assign io_sram6_addr      = SramIf[6].addr  ;
  assign io_sram6_cen       = SramIf[6].cen   ;
  assign io_sram6_wen       = SramIf[6].wen   ;
  assign io_sram6_wmask     = SramIf[6].wmask ;
  assign io_sram6_wdata     = SramIf[6].wdata ;
  assign SramIf[6].rdata    = io_sram6_rdata  ;

  assign io_sram7_addr      = SramIf[7].addr  ;
  assign io_sram7_cen       = SramIf[7].cen   ;
  assign io_sram7_wen       = SramIf[7].wen   ;
  assign io_sram7_wmask     = SramIf[7].wmask ;
  assign io_sram7_wdata     = SramIf[7].wdata ;
  assign SramIf[7].rdata    = io_sram7_rdata  ;

endmodule

module ysyx_040561_top(
  input  logic                      i_clk           ,
  input  logic                      i_rst_n         ,
  ysyx_040561_axi4_if.Master        AxiIf_M         ,
  ysyx_040561_sram_if.Master        SramIf_M  [7:0]
);

  // 1.rst : ////////////////////////////////////////////////////////
  logic rst_n_sync;
  ysyx_040561_stl_rst u_stl_rst(
    .i_clk        (i_clk      ),
    .i_rst_n      (i_rst_n    ),
    .o_rst_n_sync (rst_n_sync )
  );

  // 2.cpu core:///////////////////////////////////////////////////
  logic invalidIChe, cleanDChe;
  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(`YSYX04561_INS_WIDTH)) iCacheIf();  // 32bit, ins.
  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(`YSYX04561_CPU_WIDTH)) dCacheIf();  // 64bit, data.

  ysyx_040561_core_top u_core_top(
    .i_clk            (i_clk            ),
    .i_rst_n          (rst_n_sync       ),
    .iCacheIf_M       (iCacheIf         ),
    .dCacheIf_M       (dCacheIf         ),
    .o_invalidIChe    (invalidIChe      ),
    .o_cleanDChe      (cleanDChe        )
  );

  // 3.cache: /////////////////////////////////////////////////////
  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(128)) dMemIf();
  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(128)) iMemIf();

  ysyx_040561_iCache_wrapper u_iCache_wrapper(
    .i_clk      (i_clk        ),
    .i_rst_n    (rst_n_sync   ),
    .i_invalid  (invalidIChe  ),
    .iCacheIf_S (iCacheIf     ),
    .iMemIf_M   (iMemIf       ),
    .iSramIf_M  (SramIf_M[3:0]) // used to connect sram on SoC chip. 
  );

  ysyx_040561_dCache_wrapper u_dCache_wrapper(
    .i_clk      (i_clk        ),
    .i_rst_n    (rst_n_sync   ),
    .i_clean    (cleanDChe    ),
    .dCacheIf_S (dCacheIf     ),
    .dMemIf_M   (dMemIf       ),
    .dSramIf_M  (SramIf_M[7:4]) // used to connect sram on SoC chip. 
  );

  // 4.arbite UniIf://////////////////////////////////////////////
  logic uniID;  // 1: dMemIf, 0: iMemIf. 

  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(128)) UniIf();

  wire dMemIfFree = dMemIf.valid & dMemIf.ready | !dMemIf.valid;
  wire iMemIfFree = iMemIf.valid & iMemIf.ready | !iMemIf.valid;

  ysyx_040561_stl_reg #(
    .WIDTH      (1   ),                                                                  // always_ff @(posedge i_clk or negedge i_rst_n) begin
    .RESET_VAL  (1'b0)                                                                   //   if(!i_rst_n)begin
  ) reg_unid (                                                                           //     uniID <= 1'b0;
    .i_clk      (i_clk      ),                                                           //   end else if(dMemIf.valid & iMemIfFree)begin
    .i_rst_n    (rst_n_sync ),                                                  // <==>  //     uniID <= 1'b1;
    .i_wen      ((iMemIf.valid & dMemIfFree) | (dMemIf.valid & iMemIfFree)),             //   end else if(iMemIf.valid & dMemIfFree)begin
    .i_din      ((dMemIf.valid & iMemIfFree)),                                           //     uniID <= 1'b0;
    .o_dout     (uniID      )                                                            //   end
  );                                                                                     // end

  assign UniIf.valid    = uniID ? dMemIf.valid    : iMemIf.valid    ;
  assign UniIf.reqtyp   = uniID ? dMemIf.reqtyp   : iMemIf.reqtyp   ;
  assign UniIf.addr     = uniID ? dMemIf.addr     : iMemIf.addr     ;
  assign UniIf.wdata    = uniID ? dMemIf.wdata    : iMemIf.wdata    ;
  assign UniIf.size     = uniID ? dMemIf.size     : iMemIf.size     ;
  assign UniIf.cachable = uniID ? dMemIf.cachable : iMemIf.cachable ;

  assign dMemIf.ready = uniID ? UniIf.ready : 0;
  assign dMemIf.rdata = uniID ? UniIf.rdata : 0;

  assign iMemIf.ready = uniID ? 0 : UniIf.ready;
  assign iMemIf.rdata = uniID ? 0 : UniIf.rdata;

  // 5.UniIf 2 AxiIf : //////////////////////////////////////////

  ysyx_040561_uni2axi #(
    .UNI_ADDR_WIDTH (`YSYX04561_ADR_WIDTH ),
    .UNI_DATA_WIDTH (128        ),
    .AXI_ADDR_WIDTH (`YSYX04561_ADR_WIDTH ),
    .AXI_DATA_WIDTH (`YSYX04561_CPU_WIDTH ),
    .AXI_ID_WIDTH   (4          ),
    .AXI_USER_WIDTH (1          )
  ) u_uni2axi (
    .i_clk   (i_clk     ),
    .i_rst_n (rst_n_sync),
    .UniIf_S (UniIf     ),
    .AxiIf_M (AxiIf_M   )
  );

endmodule

module ysyx_040561_uni2axi # (
    parameter UNI_ADDR_WIDTH    = 32,                   // addr width for uni if
    parameter UNI_DATA_WIDTH    = 128,                  // data width for uni if
    parameter AXI_ADDR_WIDTH    = 64,                   // addr width for axi if
    parameter AXI_DATA_WIDTH    = 64,                   // data width for axi if
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8,     // strb width for axi if
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_USER_WIDTH    = 1
)(
  input                               i_clk   ,
  input                               i_rst_n ,
  ysyx_040561_uni_if.Slave            UniIf_S ,
  ysyx_040561_axi4_if.Master          AxiIf_M
);

  wire w_trans    = UniIf_S.reqtyp == `YSYX04561_REQ_WRITE;
  wire r_trans    = UniIf_S.reqtyp == `YSYX04561_REQ_READ ;
  wire w_valid    = UniIf_S.valid & w_trans;
  wire r_valid    = UniIf_S.valid & r_trans;

  // handshake
  wire aw_hs      = AxiIf_M.aw_valid & AxiIf_M.aw_ready;
  wire w_hs       = AxiIf_M.w_valid  & AxiIf_M.w_ready ;
  wire b_hs       = AxiIf_M.b_valid  & AxiIf_M.b_ready ;
  wire ar_hs      = AxiIf_M.ar_valid & AxiIf_M.ar_ready;
  wire r_hs       = AxiIf_M.r_valid  & AxiIf_M.r_ready ;

  wire w_done     = w_hs & AxiIf_M.w_last;
  wire r_done     = r_hs & AxiIf_M.r_last;
  wire trans_done = w_trans ? b_hs : r_done;

  // ------------------State Machine------------------
  localparam [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
  localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

  reg [1:0] w_state, r_state;
  wire w_state_idle = w_state == W_STATE_IDLE, w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
  wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

  // Wirte State Machine
  always @(posedge i_clk or negedge i_rst_n) begin
      if (!i_rst_n) begin
          w_state <= W_STATE_IDLE;
      end
      else begin
          if (w_valid) begin
              case (w_state)
                  W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                  W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                  W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
                  W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_IDLE;
              endcase
          end
      end
  end

  // Read State Machine
  always @(posedge i_clk or negedge i_rst_n) begin
      if (!i_rst_n) begin
          r_state <= R_STATE_IDLE;
      end
      else begin
          if (r_valid) begin
              case (r_state)
                  R_STATE_IDLE:               r_state <= R_STATE_ADDR;
                  R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                  R_STATE_READ: if (r_done)   r_state <= R_STATE_IDLE;
                  default:;
              endcase
          end
      end
  end

  // ------------------Number of transmission------------------
  logic [7:0] len, axi_len;
  always @(posedge i_clk or negedge i_rst_n) begin
      if (!i_rst_n) begin
          len <= 0;
      end else if ((w_trans & w_state_idle) | (r_trans & r_state_idle)) begin
          len <= 0;
      end else if ((len != axi_len) & (w_hs | r_hs)) begin    // axi_len == total write/read len.
          len <= len + 1;
      end
  end

  // ------------------Process Data------------------
  localparam TRANS_LEN = UNI_DATA_WIDTH / AXI_DATA_WIDTH;  // 2

  wire        is_uart = (UniIf_S.addr & {{(`YSYX04561_ADR_WIDTH-12){1'b1}},12'b0}) == `YSYX04561_UART_BASE_ADDR;
  wire [1:0]  offset  = UniIf_S.addr[1:0];

  wire        size_b  = (UniIf_S.size == 2'b00);
  wire        size_h  = (UniIf_S.size == 2'b01);
  wire        size_w  = (UniIf_S.size == 2'b10);

  wire [AXI_STRB_WIDTH-1:0] dev_strb = (({AXI_STRB_WIDTH{size_b}} & {8'b0000_0001})
                                      | ({AXI_STRB_WIDTH{size_h}} & {8'b0000_0011})
                                      | ({AXI_STRB_WIDTH{size_w}} & {8'b0000_1111})) << offset;

  assign                    axi_len  = UniIf_S.cachable ? (TRANS_LEN - 1) : 0;
  wire [2:0]                axi_size = {1'b0,UniIf_S.size};
  wire [AXI_ADDR_WIDTH-1:0] axi_addr = {{(AXI_ADDR_WIDTH-UNI_ADDR_WIDTH){1'b0}},UniIf_S.addr[UNI_ADDR_WIDTH-1:2], is_uart ? UniIf_S.addr[1:0]: 2'b00};

  wire [AXI_ID_WIDTH-1:0]   axi_id   = {AXI_ID_WIDTH{1'b0}};
  wire [AXI_USER_WIDTH-1:0] axi_user = {AXI_USER_WIDTH{1'b0}};

  always @(posedge i_clk or negedge i_rst_n) begin
      if (!i_rst_n) begin
          UniIf_S.ready <= 0;
      end
      else if (trans_done | UniIf_S.ready) begin
          UniIf_S.ready <= trans_done;
      end
  end

  // ------------------Write Transaction------------------

  // write addr channel:
  assign AxiIf_M.aw_valid   = w_state_addr & w_valid;
  assign AxiIf_M.aw_addr    = axi_addr;
  assign AxiIf_M.aw_len     = axi_len;
  assign AxiIf_M.aw_size    = axi_size;
  assign AxiIf_M.aw_burst   = `YSYX04561_AXI_BURST_TYPE_INCR;
  assign AxiIf_M.aw_id      = axi_id;                                                                           // no use.
  assign AxiIf_M.aw_user    = axi_user;                                                                         // no use.
  assign AxiIf_M.aw_prot    = `YSYX04561_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX04561_AXI_PROT_SECURE_ACCESS | `YSYX04561_AXI_PROT_DATA_ACCESS;  // no use.
  assign AxiIf_M.aw_cache   = `YSYX04561_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE;                                  // no use.
  assign AxiIf_M.aw_lock    = 1'b0;                                                                             // no use.
  assign AxiIf_M.aw_qos     = 4'h0;                                                                             // no use.
  assign AxiIf_M.aw_region  = 4'h0;                                                                             // no use.

  // write response channel:
  assign AxiIf_M.b_ready    = w_state_resp;

  // write data channel:
  assign AxiIf_M.w_valid    = w_state_write;
  assign AxiIf_M.w_last     = w_hs & (len == axi_len);
  assign AxiIf_M.w_user     = axi_user;                                                                         // no use.
  assign AxiIf_M.w_strb     = UniIf_S.cachable ? {AXI_STRB_WIDTH{1'b1}} : dev_strb;
  assign AxiIf_M.w_data     = UniIf_S.wdata[len*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] << {offset,3'b0};

  // ------------------Read Transaction------------------

  // Read address channel signals
  assign AxiIf_M.ar_valid   = r_state_addr & r_valid;
  assign AxiIf_M.ar_addr    = axi_addr;
  assign AxiIf_M.ar_prot    = `YSYX04561_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX04561_AXI_PROT_SECURE_ACCESS | `YSYX04561_AXI_PROT_DATA_ACCESS;
  assign AxiIf_M.ar_id      = axi_id;
  assign AxiIf_M.ar_user    = axi_user;
  assign AxiIf_M.ar_len     = axi_len;
  assign AxiIf_M.ar_size    = axi_size;
  assign AxiIf_M.ar_burst   = `YSYX04561_AXI_BURST_TYPE_INCR;
  assign AxiIf_M.ar_lock    = 1'b0;
  assign AxiIf_M.ar_cache   = `YSYX04561_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
  assign AxiIf_M.ar_qos     = 4'h0;

  // Read data channel signals
  assign AxiIf_M.r_ready    = r_state_read;

  for(genvar i=0; i<TRANS_LEN; i=i+1)begin
    always @(posedge i_clk or negedge i_rst_n) begin
      if (!i_rst_n) begin
        UniIf_S.rdata[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= 0;
      end else if (AxiIf_M.r_valid & AxiIf_M.r_ready & (i==len)) begin
        UniIf_S.rdata[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= (AxiIf_M.r_data >> {offset,3'b0});
      end
    end
  end

endmodule


module ysyx_040561_core_top(
  input                       i_clk         ,
  input                       i_rst_n       ,
  ysyx_040561_uni_if.Master   iCacheIf_M    ,
  ysyx_040561_uni_if.Master   dCacheIf_M    ,
  output                      o_invalidIChe ,
  output                      o_cleanDChe
);

  // control signals:
  logic [`YSYX04561_CPU_WIDTH-1:0]  pre_pc, ifu_pc, idu_pc, exu_pc, lsu_pc, wbu_pc, iru_pc;
  logic [`YSYX04561_INS_WIDTH-1:0]  ifu_ins;
  logic                   idu_nop,   exu_nop,   lsu_nop,   wbu_nop  ;
  logic                   idu_ecall, exu_ecall, lsu_ecall, wbu_ecall;
  logic                   idu_mret,  exu_mret,  lsu_mret,  wbu_mret ;

  logic                   clint_ren  , clint_wen  , clint_mtip;
  logic [`YSYX04561_ADR_WIDTH-1:0]  clint_raddr, clint_waddr;
  logic [`YSYX04561_CPU_WIDTH-1:0]  clint_rdata, clint_wdata;

  logic                   ifid_nop;               // for branch adventure
  logic                   ifid_stall, idex_nop;   // for data adventure
  logic                   ifu_valid , ifu_ready;  // pipeline shakehands: pc/if -> if/id
  logic                   idu_valid , idu_ready;  // pipeline shakehands: if/id -> id/ex
  logic                   exu_valid , exu_ready;  // pipeline shakehands: id/ex -> ex/ls
  logic                   lsu_valid , lsu_ready;  // pipeline shakehands: ex/ls -> ls/wb
  logic                   wbu_valid , wbu_ready;  // pipeline shakehands: ls/wb -> wb/reg.
  logic                   iru_excp  , iru_intr;
  logic                   unif_trans_done, iru_flush, fence_flush, lsu_fencei;
  logic                   ifu_flush, idu_flush, exu_flush, lsu_flush, wbu_flush;

  assign unif_trans_done = (iCacheIf_M.valid & iCacheIf_M.ready | !iCacheIf_M.valid);
  assign wbu_ready = (iru_excp | iru_intr) ? unif_trans_done: 1'b1;         // if excp/intr, waiting for unif done.
  assign iru_flush = (iru_excp | iru_intr) & (wbu_valid & wbu_ready);       // iru_intr not commit.

  assign fence_flush = dCacheIf_M.valid & dCacheIf_M.ready & lsu_fencei;
  assign ifu_flush = fence_flush | iru_flush;
  assign idu_flush = fence_flush | iru_flush;
  assign exu_flush = fence_flush | iru_flush;
  assign lsu_flush = fence_flush | iru_flush;
  assign wbu_flush = iru_flush;

  assign o_cleanDChe = lsu_fencei;
  assign o_invalidIChe = fence_flush;

  // 2.1 ifu ////////////////////////////////////////////////////////

  ysyx_040561_ifu u_ifu(
    .i_clk        (i_clk      ),
    .i_rst_n      (i_rst_n    ),
    .iCacheIf_M   (iCacheIf_M ),
    .i_flush      (ifu_flush  ),
    .o_post_valid (ifu_valid  ),
    .i_post_ready (ifu_ready  ),
    .i_next_pc    (pre_pc     ),
    .o_ifu_pc     (ifu_pc     ),
    .o_ifu_ins    (ifu_ins    )
  );

  // 2.2 idu ////////////////////////////////////////////////////////

  // for bypass to get reg value.
  logic [`YSYX04561_REG_ADDRW-1:0]      idu_rs1id, idu_rs2id;
  logic [`YSYX04561_CSR_ADDRW-1:0]      idu_csrsid  ;
  logic                       idu_csrsren ;
  // get rs value from bypass: 
  logic [`YSYX04561_CPU_WIDTH-1:0]      idu_rs1, idu_rs2;
  logic [`YSYX04561_CPU_WIDTH-1:0]      idu_csrs    ;
  // for exu:
  logic                       idu_sysins  ;
  logic [`YSYX04561_CPU_WIDTH-1:0]      idu_imm     ;
  logic [`YSYX04561_EXU_SEL_WIDTH-1:0]  idu_exsrc   ;
  logic [`YSYX04561_EXU_OPT_WIDTH-1:0]  idu_exopt   ;
  logic                       idu_excsrsrc;
  logic [`YSYX04561_CSR_OPT_WIDTH-1:0]  idu_excsropt;
  // for lsu:
  logic [2:0]                 idu_lsfunc3 ;
  logic                       idu_lden    ;
  logic                       idu_sten    ;
  logic                       idu_fencei  ;
  // for wbu:
  logic [`YSYX04561_REG_ADDRW-1:0]      idu_rdid    ;
  logic                       idu_rdwen   ;
  logic [`YSYX04561_CSR_ADDRW-1:0]      idu_csrdid  ;
  logic                       idu_csrdwen ; 

  // for bru:
  logic                       idu_jal,idu_jalr,idu_brch;
  logic [2:0]                 idu_bfun3;

  ysyx_040561_idu u_idu(
    .i_clk          (i_clk        ),
    .i_rst_n        (i_rst_n      ),
    .i_flush        (idu_flush    ),
    .i_pre_nop      (ifid_nop     ),
    .i_pre_stall    (ifid_stall   ),
    .i_pre_valid    (ifu_valid    ),
    .o_pre_ready    (ifu_ready    ),
    .o_post_valid   (idu_valid    ),
    .i_post_ready   (idu_ready    ),
    .i_ifu_ins      (ifu_ins      ),
    .i_ifu_pc       (ifu_pc       ),
    .o_idu_rs1id    (idu_rs1id    ),
    .o_idu_rs2id    (idu_rs2id    ),
    .o_idu_csrsid   (idu_csrsid   ),
    .o_idu_csrsren  (idu_csrsren  ),
    .o_idu_sysins   (idu_sysins   ),
    .o_idu_imm      (idu_imm      ),
    .o_idu_exsrc    (idu_exsrc    ),
    .o_idu_exopt    (idu_exopt    ),
    .o_idu_excsrsrc (idu_excsrsrc ),
    .o_idu_excsropt (idu_excsropt ),
    .o_idu_lsfunc3  (idu_lsfunc3  ),
    .o_idu_lden     (idu_lden     ),
    .o_idu_sten     (idu_sten     ),
    .o_idu_fencei   (idu_fencei   ),
    .o_idu_rdid     (idu_rdid     ),
    .o_idu_rdwen    (idu_rdwen    ),
    .o_idu_csrdid   (idu_csrdid   ),
    .o_idu_csrdwen  (idu_csrdwen  ),
    .o_idu_jal      (idu_jal      ),
    .o_idu_jalr     (idu_jalr     ),
    .o_idu_brch     (idu_brch     ),
    .o_idu_bfun3    (idu_bfun3    ),
    .o_idu_pc       (idu_pc       ),
    .o_idu_ecall    (idu_ecall    ),
    .o_idu_mret     (idu_mret     ),
    .o_idu_nop      (idu_nop      )
);

  // 2.3 exu ///////////////////////////////////////////////

  // generate exu output value:
  logic [`YSYX04561_CPU_WIDTH-1:0]      exu_exres   ; // for lsu addr, or for wbu rd.
  // for lsu:
  logic                       exu_lden    ; // for lsu load en.
  logic                       exu_sten    ; // for lsu store en.
  logic                       exu_fencei  ; // for lsu fence.i.
  logic [`YSYX04561_CPU_WIDTH-1:0]      exu_rs2     ; // for lsu data.
  logic [2:0]                 exu_lsfunc3 ; // for lsu func3
  // for wbu:
  logic [`YSYX04561_REG_ADDRW-1:0]      exu_rdid    ;
  logic                       exu_rdwen   ;
  logic [`YSYX04561_CSR_ADDRW-1:0]      exu_csrdid  ;
  logic                       exu_csrdwen ;
  logic [`YSYX04561_CPU_WIDTH-1:0]      exu_csrd    ;

  ysyx_040561_exu u_exu(
    .i_clk          (i_clk          ),
    .i_rst_n        (i_rst_n        ),
    .i_flush        (exu_flush      ),
    .i_pre_nop      (idex_nop       ),
    .i_pre_valid    (idu_valid      ),
    .o_pre_ready    (idu_ready      ),
    .o_post_valid   (exu_valid      ),
    .i_post_ready   (exu_ready      ),
    .i_idu_sysins   (idu_sysins     ),
    .i_idu_imm      (idu_imm        ),
    .i_idu_csrs     (idu_csrs       ),
    .i_idu_rs1      (idu_rs1        ),
    .i_idu_rs2      (idu_rs2        ),
    .i_idu_exsrc    (idu_exsrc      ),
    .i_idu_exopt    (idu_exopt      ),
    .i_idu_excsrsrc (idu_excsrsrc   ),
    .i_idu_excsropt (idu_excsropt   ),
    .i_idu_lsfunc3  (idu_lsfunc3    ),
    .i_idu_lden     (idu_lden       ),
    .i_idu_sten     (idu_sten       ),
    .i_idu_fencei   (idu_fencei     ),
    .i_idu_rdid     (idu_rdid       ),
    .i_idu_rdwen    (idu_rdwen      ),
    .i_idu_csrdid   (idu_csrdid     ),
    .i_idu_csrdwen  (idu_csrdwen    ),
    .i_idu_pc       (idu_pc         ),
    .i_idu_ecall    (idu_ecall      ),
    .i_idu_mret     (idu_mret       ),
    .i_idu_nop      (idu_nop        ),
    .o_exu_rs2      (exu_rs2        ),
    .o_exu_lsfunc3  (exu_lsfunc3    ),
    .o_exu_lden     (exu_lden       ),
    .o_exu_sten     (exu_sten       ),
    .o_exu_fencei   (exu_fencei     ),
    .o_exu_rdid     (exu_rdid       ),
    .o_exu_rdwen    (exu_rdwen      ),
    .o_exu_res      (exu_exres      ),
    .o_exu_csrdid   (exu_csrdid     ),
    .o_exu_csrdwen  (exu_csrdwen    ),
    .o_exu_csrd     (exu_csrd       ),
    .o_exu_pc       (exu_pc         ),
    .o_exu_ecall    (exu_ecall      ),
    .o_exu_mret     (exu_mret       ),
    .o_exu_nop      (exu_nop        )
  );

  // 2.4 lsu ///////////////////////////////////////////////

  logic [`YSYX04561_CPU_WIDTH-1:0]      lsu_exres  ;
  logic [`YSYX04561_CPU_WIDTH-1:0]      lsu_lsres  ;
  logic                       lsu_lden   ;
  logic [`YSYX04561_REG_ADDRW-1:0]      lsu_rdid   ;
  logic                       lsu_rdwen  ;
  logic [`YSYX04561_CSR_ADDRW-1:0]      lsu_csrdid ;
  logic                       lsu_csrdwen;
  logic [`YSYX04561_CPU_WIDTH-1:0]      lsu_csrd   ;

  ysyx_040561_lsu u_lsu(
    .i_clk         (i_clk         ),
    .i_rst_n       (i_rst_n       ),
    .i_flush       (lsu_flush     ),
    .dCacheIf_M    (dCacheIf_M    ),
    .i_pre_valid   (exu_valid     ),
    .o_pre_ready   (exu_ready     ),
    .o_post_valid  (lsu_valid     ),
    .i_post_ready  (lsu_ready     ),
    .i_exu_exres   (exu_exres     ),
    .i_exu_rs2     (exu_rs2       ),
    .i_exu_lsfunc3 (exu_lsfunc3   ),
    .i_exu_lden    (exu_lden      ),
    .i_exu_sten    (exu_sten      ),
    .i_exu_fencei  (exu_fencei    ),
    .i_exu_rdid    (exu_rdid      ),
    .i_exu_rdwen   (exu_rdwen     ),
    .i_exu_csrdid  (exu_csrdid    ),
    .i_exu_csrdwen (exu_csrdwen   ),
    .i_exu_csrd    (exu_csrd      ),
    .i_exu_pc      (exu_pc        ),
    .i_exu_ecall   (exu_ecall     ),
    .i_exu_mret    (exu_mret      ),
    .i_exu_nop     (exu_nop       ),
    .i_iru_excp    (iru_excp      ),
    .i_iru_intr    (iru_intr      ),
    .o_clint_ren   (clint_ren     ),
    .o_clint_raddr (clint_raddr   ),
    .i_clint_rdata (clint_rdata   ),
    .o_clint_wen   (clint_wen     ),
    .o_clint_waddr (clint_waddr   ),
    .o_clint_wdata (clint_wdata   ),
    .o_lsu_lsres   (lsu_lsres     ),
    .o_lsu_exres   (lsu_exres     ),
    .o_lsu_lden    (lsu_lden      ),
    .o_lsu_fencei  (lsu_fencei    ),
    .o_lsu_rdid    (lsu_rdid      ),
    .o_lsu_rdwen   (lsu_rdwen     ),
    .o_lsu_csrdid  (lsu_csrdid    ),
    .o_lsu_csrdwen (lsu_csrdwen   ),
    .o_lsu_csrd    (lsu_csrd      ),
    .o_lsu_pc      (lsu_pc        ),
    .o_lsu_ecall   (lsu_ecall     ),
    .o_lsu_mret    (lsu_mret      ),
    .o_lsu_nop     (lsu_nop       )
  );

  // 2.5 wbu ///////////////////////////////////////////////

  logic [`YSYX04561_REG_ADDRW-1:0]      wbu_rdid   ;
  logic                       wbu_rdwen  ;
  logic [`YSYX04561_CPU_WIDTH-1:0]      wbu_rd     ;
  logic [`YSYX04561_CSR_ADDRW-1:0]      wbu_csrdid ;
  logic                       wbu_csrdwen;
  logic [`YSYX04561_CPU_WIDTH-1:0]      wbu_csrd   ;

  ysyx_040561_wbu u_wbu(
    .i_clk         (i_clk        ),
    .i_rst_n       (i_rst_n      ),
    .i_flush       (wbu_flush    ),
    .i_pre_valid   (lsu_valid    ),
    .o_pre_ready   (lsu_ready    ),
    .o_post_valid  (wbu_valid    ),
    .i_post_ready  (wbu_ready    ),
    .i_lsu_exres   (lsu_exres    ),
    .i_lsu_lsres   (lsu_lsres    ),
    .i_lsu_lden    (lsu_lden     ),
    .i_lsu_rdid    (lsu_rdid     ),
    .i_lsu_rdwen   (lsu_rdwen    ),
    .i_lsu_csrdid  (lsu_csrdid   ),
    .i_lsu_csrdwen (lsu_csrdwen  ),
    .i_lsu_csrd    (lsu_csrd     ),
    .i_lsu_pc      (lsu_pc       ),
    .i_lsu_ecall   (lsu_ecall    ),
    .i_lsu_mret    (lsu_mret     ),
    .i_iru_intr    (iru_intr     ),
    .i_lsu_nop     (lsu_nop      ),
    .o_wbu_rdid    (wbu_rdid     ),
    .o_wbu_rdwen   (wbu_rdwen    ),
    .o_wbu_rd      (wbu_rd       ),
    .o_wbu_csrdid  (wbu_csrdid   ),
    .o_wbu_csrdwen (wbu_csrdwen  ),
    .o_wbu_csrd    (wbu_csrd     ),
    .o_wbu_pc      (wbu_pc       ),
    .o_wbu_ecall   (wbu_ecall    ),
    .o_wbu_mret    (wbu_mret     ),
    .o_wbu_nop     (wbu_nop      )
  );

  logic [`YSYX04561_CPU_WIDTH-1:0]  mie           ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mip           ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mtvec         ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mepc          ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mstatus       ;
  logic                   mepc_wen      ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mepc_wdata    ;
  logic                   mcause_wen    ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mcause_wdata  ;
  logic                   mstatus_wen   ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  mstatus_wdata ;

  ysyx_040561_iru u_iru(
    .i_wbu_valid     (wbu_valid       ),
    .i_wbu_ready     (wbu_ready       ),
    .i_wbu_pc        (wbu_pc          ),
    .i_wbu_ecall     (wbu_ecall       ),
    .i_wbu_mret      (wbu_mret        ),
    .i_wbu_nop       (wbu_nop         ),
    .o_iru_excp      (iru_excp        ),
    .o_iru_intr      (iru_intr        ),
    .o_iru_pc        (iru_pc          ),
    .i_mie           (mie             ),
    .i_mip           (mip             ),
    .i_mtvec         (mtvec           ),
    .i_mepc          (mepc            ),
    .i_mstatus       (mstatus         ),
    .o_mepc_wen      (mepc_wen        ),
    .o_mepc_wdata    (mepc_wdata      ),
    .o_mcause_wen    (mcause_wen      ),
    .o_mcause_wdata  (mcause_wdata    ),
    .o_mstatus_wen   (mstatus_wen     ),
    .o_mstatus_wdata (mstatus_wdata   )
  );

  ysyx_040561_clint u_clint(
    .i_clk         (i_clk         ),
    .i_rst_n       (i_rst_n       ),
    .i_clint_ren   (clint_ren     ),
    .i_clint_raddr (clint_raddr   ),
    .o_clint_rdata (clint_rdata   ),
    .i_clint_wen   (clint_wen     ),
    .i_clint_waddr (clint_waddr   ),
    .i_clint_wdata (clint_wdata   ),
    .o_clint_mtip  (clint_mtip    )
  );

  // 2.6 bypass, regfile read/write. ///////////////////////
  ysyx_040561_bypass u_bypass(
    .i_clk        (i_clk        ),
    .i_rst_n      (i_rst_n      ),
    .i_idu_rs1id  (idu_rs1id    ),
    .i_idu_rs2id  (idu_rs2id    ),
    .i_exu_lden   (exu_lden     ),
    .i_exu_rdwen  (exu_rdwen    ),
    .i_exu_rdid   (exu_rdid     ),
    .i_exu_exres  (exu_exres    ),
    .i_lsu_lden   (lsu_lden     ),
    .i_lsu_rdwen  (lsu_rdwen    ),
    .i_lsu_rdid   (lsu_rdid     ),
    .i_lsu_exres  (lsu_exres    ),
    .i_lsu_lsres  (lsu_lsres    ),
    .i_wbu_rdwen  (wbu_rdwen    ),
    .i_wbu_rdid   (wbu_rdid     ),
    .i_wbu_rd     (wbu_rd       ),
    .o_idu_rs1    (idu_rs1      ),
    .o_idu_rs2    (idu_rs2      ),
    .o_idex_nop   (idex_nop     ),
    .o_ifid_stall (ifid_stall   )
  );

  ysyx_040561_csrfile u_csrfile(
    .i_clk           (i_clk          ),
    .i_rst_n         (i_rst_n        ),
    .i_ren           (idu_csrsren    ),
    .i_raddr         (idu_csrsid     ),
    .o_rdata         (idu_csrs       ),
    .i_wen           (wbu_csrdwen    ),
    .i_waddr         (wbu_csrdid     ),
    .i_wdata         (wbu_csrd       ),
    .i_mepc_wen      (mepc_wen       ),
    .i_mepc_wdata    (mepc_wdata     ),
    .i_mcause_wen    (mcause_wen     ),
    .i_mcause_wdata  (mcause_wdata   ),
    .i_mstatus_wen   (mstatus_wen    ),
    .i_mstatus_wdata (mstatus_wdata  ),
    .o_mtvec         (mtvec          ),
    .o_mstatus       (mstatus        ),
    .o_mepc          (mepc           ),
    .o_mip           (mip            ),
    .o_mie           (mie            ),
    .i_clint_mtip    (clint_mtip     )
  );

  // 2.7 bru ///////////////////////////////////////////////

  ysyx_040561_bru u_bru(
    .i_clk        (i_clk        ),
    .i_rst_n      (i_rst_n      ),
    .i_idu_valid  (idu_valid    ),
    .i_idu_rs1id  (idu_rs1id    ),
    .i_exu_rdid   (exu_rdid     ),
    .i_jal        (idu_jal      ),
    .i_jalr       (idu_jalr     ),
    .i_brch       (idu_brch     ),
    .i_bfun3      (idu_bfun3    ),
    .i_rs1        (idu_rs1      ),
    .i_rs2        (idu_rs2      ),
    .i_imm        (idu_imm      ),
    .i_ifupc      (ifu_pc       ),
    .i_idupc      (idu_pc       ),
    .i_iru_jump   (iru_excp | iru_intr ),
    .i_iru_pc     (iru_pc       ),
    .i_fence_jump (lsu_fencei   ),
    .i_fence_pc   (lsu_pc+4     ),
    .o_next_pc    (pre_pc       ),
    .o_ifid_nop   (ifid_nop     )
  );

endmodule

module ysyx_040561_ifu (
  input                           i_clk       ,
  input                           i_rst_n     ,

  // 1. cache interface ysyx_040561_to get data from cache/ddr:
  ysyx_040561_uni_if.Master       iCacheIf_M  ,

  // 2. signal to pipe shake hands:
  input                           i_flush     ,
  output                          o_post_valid,   //  to  post-stage
  input                           i_post_ready,   // from post-stage

  // 3. input signal from pre stage:
  input         [`YSYX04561_CPU_WIDTH-1:0]  i_next_pc   ,

  // 4. output signal to post stage:
  output logic  [`YSYX04561_CPU_WIDTH-1:0]  o_ifu_pc    ,
  output logic  [`YSYX04561_INS_WIDTH-1:0]  o_ifu_ins
);

  // 1. shake hands to reg pre stage signals://///////////////////////////////////////////////////////////////
  // remind: there is no shake hands signals from pre stage for ifu, so just use post stage signals to shank hands.

  logic  [`YSYX04561_CPU_WIDTH-1:0]  next_pc_r;

  wire post_sh = o_post_valid & i_post_ready;

  ysyx_040561_stl_reg #(
    .WIDTH     (`YSYX04561_CPU_WIDTH          ),
    .RESET_VAL (`YSYX04561_CPU_WIDTH'h30000000)
  ) prereg (
    .i_clk   (i_clk       ),
    .i_rst_n (i_rst_n     ),
    .i_wen   (post_sh | i_flush    ),
    .i_din   (i_next_pc   ),
    .o_dout  (next_pc_r   )
  );

  // 2. use interface to read ins ://////////////////////////////////////////

  // ⌈‾‾‾‾⌉              ⌈‾‾‾‾⌉ ready --> | --> o_post_valid
  // |REG|              |UNIF|          | 
  // ⌊____⌋    --> valid ⌊____⌋           | <-- i_post_ready
  
  logic wait_post_ready;
  logic [`YSYX04561_INS_WIDTH-1:0] unif_rdata, unif_rdata_r;

  assign iCacheIf_M.valid  = !wait_post_ready ;
  assign iCacheIf_M.size   = 2'b10        ; // 32 bit.
  assign iCacheIf_M.reqtyp = `YSYX04561_REQ_READ    ;
  assign iCacheIf_M.wdata  = `YSYX04561_INS_WIDTH'b0; // no use.
  assign iCacheIf_M.addr   = next_pc_r[`YSYX04561_ADR_WIDTH-1:0];
  assign unif_rdata = iCacheIf_M.rdata[`YSYX04561_INS_WIDTH-1:0];

  // 3. use one register to save data/valid for post stage :///////////////////

  wire UniIf_Sh = iCacheIf_M.valid & iCacheIf_M.ready;

  ysyx_040561_stl_reg #(
    .WIDTH      (`YSYX04561_INS_WIDTH   ),
    .RESET_VAL  (`YSYX04561_INS_WIDTH'b0)
  ) unidatareg (
    .i_clk      (i_clk        ),
    .i_rst_n    (i_rst_n      ),
    .i_wen      (UniIf_Sh     ),
    .i_din      (unif_rdata   ),
    .o_dout     (unif_rdata_r )
  );

  ysyx_040561_stl_reg #(
    .WIDTH      (1   ),                                       //  always_ff @(posedge i_clk or negedge i_rst_n) begin
    .RESET_VAL  (1'b0)                                        //    if(!i_rst_n)begin
  ) unireadyreg (                                             //      wait_post_ready <= 1'b0;
    .i_clk      (i_clk                ),            // <==>   //    end else if(i_flush | post_sh)begin
    .i_rst_n    (i_rst_n              ),                      //      wait_post_ready <= 1'b0;
    .i_wen      (i_flush | post_sh | UniIf_Sh),               //    end else if(UniIf_Sh)begin
    .i_din      (!(i_flush | post_sh) ),                      //      wait_post_ready <= 1'b1;
    .o_dout     (wait_post_ready      )                       //    end
  );                                                          //  end

  // 4. use pre stage signals to generate comb logic for post stage://////////////////////////////////////////

  assign o_post_valid = UniIf_Sh | wait_post_ready; 
  assign o_ifu_pc     = next_pc_r;
  assign o_ifu_ins    = UniIf_Sh ? unif_rdata : unif_rdata_r;

endmodule

module ysyx_040561_idu (
  // 1. signal to pipe shake hands:
  input  logic                      i_clk         ,
  input  logic                      i_rst_n       ,
  input  logic                      i_flush       ,
  input  logic                      i_pre_nop     ,
  input  logic                      i_pre_stall   ,
  input  logic                      i_pre_valid   ,   // from pre-stage
  output logic                      o_pre_ready   ,   //  to  pre-stage
  output logic                      o_post_valid  ,   //  to  post-stage
  input  logic                      i_post_ready  ,   // from post-stage

  // 2. input comb signal from pre stage:
  input  logic [`YSYX04561_INS_WIDTH-1:0]     i_ifu_ins     ,
  input  logic [`YSYX04561_CPU_WIDTH-1:0]     i_ifu_pc      ,

  // 3. output comb signal to post stage:

  // 3.1 for bypass to get reg value.
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_idu_rs1id   ,
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_idu_rs2id   ,
  output logic [`YSYX04561_CSR_ADDRW-1:0]     o_idu_csrsid  ,
  output logic                      o_idu_csrsren , // csr source read enable.
  // 3.2 for exu:
  output logic                      o_idu_sysins  ,
  output logic [`YSYX04561_CPU_WIDTH-1:0]     o_idu_imm     ,
  output logic [`YSYX04561_EXU_SEL_WIDTH-1:0] o_idu_exsrc   ,
  output logic [`YSYX04561_EXU_OPT_WIDTH-1:0] o_idu_exopt   ,
  output logic                      o_idu_excsrsrc,
  output logic [`YSYX04561_CSR_OPT_WIDTH-1:0] o_idu_excsropt,
  // 3.3 for exu, dealy to use for lsu:
  output logic [2:0]                o_idu_lsfunc3 ,
  output logic                      o_idu_lden    ,
  output logic                      o_idu_sten    ,
  output logic                      o_idu_fencei  ,
  // 3.4 for exu, dealy to use for wbu:
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_idu_rdid    ,
  output logic                      o_idu_rdwen   ,
  output logic [`YSYX04561_CSR_ADDRW-1:0]     o_idu_csrdid  ,
  output logic                      o_idu_csrdwen , // csr dest write enable.
  // 3.5 for bru:
  output logic                      o_idu_jal     ,
  output logic                      o_idu_jalr    ,
  output logic                      o_idu_brch    ,
  output logic [2:0]                o_idu_bfun3   ,
  // 3.6 for next stage to pipe:
  output logic [`YSYX04561_CPU_WIDTH-1:0]     o_idu_pc      ,
  output logic                      o_idu_ecall   ,
  output logic                      o_idu_mret    ,
  output logic                      o_idu_nop     
);

  // 1. shake hands to reg pre stage signals://///////////////////////////////////////////////////////////////

  // i_pre_valid --> ⌈‾‾‾‾⌉ --> o_post_valid
  //                 |REG|
  // o_pre_ready <-- ⌊____⌋ <-- i_post_ready

  wire pre_sh;
  assign o_pre_ready =  o_post_valid & i_post_ready & (!i_pre_stall) | !o_post_valid ;
  assign pre_sh = i_pre_valid & o_pre_ready;

  logic [`YSYX04561_CPU_WIDTH-1:0] ifu_pc , ifu_pc_r;
  logic [`YSYX04561_INS_WIDTH-1:0] ifu_ins, ifu_ins_r;
  logic                  ifu_nop_r;

  assign ifu_pc     = i_ifu_pc;
  assign ifu_ins    = i_pre_nop ? `YSYX04561_INS_WIDTH'h13 : i_ifu_ins;  // 0x13 == ADDI x0,x0,0 == nop.

  ysyx_040561_stl_reg #(
    .WIDTH      (`YSYX04561_CPU_WIDTH+`YSYX04561_INS_WIDTH+1),
    .RESET_VAL  (0                    )
  ) prereg (
    .i_clk      (i_clk                ),
    .i_rst_n    (i_rst_n              ),
    .i_wen      (i_flush | pre_sh     ),
    .i_din      (i_flush ? 0: {ifu_ins  , ifu_pc  , i_pre_nop}),
    .o_dout     (             {ifu_ins_r, ifu_pc_r, ifu_nop_r})
  );

  // 2. generate valid signals for post stage://////////////////////////////////////////////////////////////////

  ysyx_040561_stl_reg #(
    .WIDTH      (1            ), 
    .RESET_VAL  (0            )
  ) postvalid (
    .i_clk      (i_clk        ), 
    .i_rst_n    (i_rst_n      ), 
    .i_wen      (i_flush | o_pre_ready), 
    .i_din      (i_flush ? 1'b0 : i_pre_valid), 
    .o_dout     (o_post_valid )
  );

  // 3. use pre stage signals to generate comb logic for post stage://////////////////////////////////////////

  //                        normal decode:  system decode:
  logic [`YSYX04561_REG_ADDRW-1:0]     nom_rs1id    , sys_rs1id   ;
  logic [`YSYX04561_REG_ADDRW-1:0]     nom_rs2id    ; 
  logic [`YSYX04561_CSR_ADDRW-1:0]                    sys_csrsid  ; 
  logic                                     sys_csrsren ; 
  logic [`YSYX04561_CPU_WIDTH-1:0]     nom_imm      , sys_imm     ;
  logic [`YSYX04561_EXU_SEL_WIDTH-1:0] nom_exsrc    ;  
  logic [`YSYX04561_EXU_OPT_WIDTH-1:0] nom_exopt    ;  
  logic                                     sys_excsrsel;
  logic [`YSYX04561_CSR_OPT_WIDTH-1:0]                sys_excsropt;
  logic [2:0]                nom_lsu_func3;
  logic                      nom_lsu_lden ;
  logic                      nom_lsu_sten ;
  logic [`YSYX04561_REG_ADDRW-1:0]     nom_rdid     , sys_rdid    ;
  logic                      nom_rdwen    , sys_rdwen   ;
  logic [`YSYX04561_CSR_ADDRW-1:0]                    sys_csrdid  ;
  logic                                     sys_csrdwen ;
  logic                      nom_jal      ;
  logic                      nom_jalr     ;
  logic                      nom_brch     ;
  logic [2:0]                nom_bfun3    ;

  ysyx_040561_idu_normal u_idu_normal(
    .i_ins       (ifu_ins_r     ),
    .o_rs1id     (nom_rs1id     ),
    .o_rs2id     (nom_rs2id     ),
    .o_imm       (nom_imm       ),
    .o_src_sel   (nom_exsrc     ),
    .o_exopt     (nom_exopt     ),
    .o_lsu_func3 (nom_lsu_func3 ),
    .o_lsu_lden  (nom_lsu_lden  ),
    .o_lsu_sten  (nom_lsu_sten  ),
    .o_rdid      (nom_rdid      ),
    .o_rdwen     (nom_rdwen     ),
    .o_jal       (nom_jal       ),
    .o_jalr      (nom_jalr      ),
    .o_brch      (nom_brch      ),
    .o_bfun3     (nom_bfun3     )
  );

  ysyx_040561_idu_system u_idu_system(
    .i_ins       (ifu_ins_r     ),
    .o_rs1id     (sys_rs1id     ),
    .o_csrsid    (sys_csrsid    ),
    .o_csrsren   (sys_csrsren   ),
    .o_imm       (sys_imm       ),
    .o_excsrsrc  (sys_excsrsel  ),
    .o_excsropt  (sys_excsropt  ),
    .o_rdid      (sys_rdid      ),
    .o_rdwen     (sys_rdwen     ),
    .o_csrdid    (sys_csrdid    ),
    .o_csrdwen   (sys_csrdwen   )
  );
  
  wire [2:0] func3  = ifu_ins_r[14:12];
  wire [6:0] opcode = ifu_ins_r[ 6: 0];

  assign o_idu_sysins  = (opcode == `YSYX04561_TYPE_SYS);

  assign o_idu_rs1id    = o_idu_sysins ? sys_rs1id      : nom_rs1id     ;
  assign o_idu_rs2id    = o_idu_sysins ? `YSYX04561_REG_ADDRW'b0  : nom_rs2id     ;
  assign o_idu_csrsid   = o_idu_sysins ? sys_csrsid     : `YSYX04561_CSR_ADDRW'b0 ;
  assign o_idu_csrsren  = o_idu_sysins ? sys_csrsren    : 1'b0          ;
  assign o_idu_imm      = o_idu_sysins ? sys_imm        : nom_imm       ;
  assign o_idu_exsrc    = o_idu_sysins ? `YSYX04561_EXU_SEL_IMM   : nom_exsrc     ;
  assign o_idu_exopt    = o_idu_sysins ? `YSYX04561_EXU_NOP       : nom_exopt     ;
  assign o_idu_excsropt = o_idu_sysins ? sys_excsropt   : `YSYX04561_CSR_NOP      ;
  assign o_idu_excsrsrc = o_idu_sysins ? sys_excsrsel   : `YSYX04561_CSR_SEL_IMM  ;
  assign o_idu_lsfunc3  = o_idu_sysins ? 3'b0           : nom_lsu_func3 ;
  assign o_idu_lden     = o_idu_sysins ? 1'b0           : nom_lsu_lden  ;
  assign o_idu_sten     = o_idu_sysins ? 1'b0           : nom_lsu_sten  ;
  assign o_idu_rdid     = o_idu_sysins ? sys_rdid       : nom_rdid      ;
  assign o_idu_rdwen    = o_idu_sysins ? sys_rdwen      : nom_rdwen     ;
  assign o_idu_csrdid   = o_idu_sysins ? sys_csrdid     : `YSYX04561_CSR_ADDRW'b0 ;
  assign o_idu_csrdwen  = o_idu_sysins ? sys_csrdwen    : 1'b0          ;
  assign o_idu_jal      = o_idu_sysins ? 1'b0           : nom_jal       ;
  assign o_idu_jalr     = o_idu_sysins ? 1'b0           : nom_jalr      ;
  assign o_idu_brch     = o_idu_sysins ? 1'b0           : nom_brch      ;
  assign o_idu_bfun3    = o_idu_sysins ? 3'b0           : nom_bfun3     ;
  assign o_idu_pc       = ifu_pc_r     ;
  assign o_idu_nop      = ifu_nop_r    ;

  assign o_idu_fencei   = (opcode == `YSYX04561_TYPE_FENCE) & (func3 == 3'b001);
  assign o_idu_ecall    = o_idu_sysins & !(|ifu_ins_r[31:7]);
  assign o_idu_mret     = o_idu_sysins & !(|ifu_ins_r[31:30]) & (&ifu_ins_r[29:28]) & !(|ifu_ins_r[27:22]) & ifu_ins_r[21] & !(|ifu_ins_r[20:7]);


endmodule


module ysyx_040561_idu_normal(
  input        [`YSYX04561_INS_WIDTH-1:0]     i_ins         ,
  // 1. for reg:
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_rs1id       ,
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_rs2id       ,
  // 2. for exu:
  output logic [`YSYX04561_CPU_WIDTH-1:0]     o_imm         ,
  output logic [`YSYX04561_EXU_SEL_WIDTH-1:0] o_src_sel     ,
  output logic [`YSYX04561_EXU_OPT_WIDTH-1:0] o_exopt       ,
  // 3. for lsu:
  output logic [2:0]                o_lsu_func3   , //for lsu.
  output logic                      o_lsu_lden    , //for lsu.
  output logic                      o_lsu_sten    , //for lsu.  
  // 4. for wbu:
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_rdid        , //for wbu.
  output logic                      o_rdwen       , //for wbu.
  // 5. for bru:
  output logic                      o_jal         , //for bru.
  output logic                      o_jalr        , //for bru.
  output logic                      o_brch        , //for bru.
  output logic [2:0]                o_bfun3         //for bru.
);

  wire [6:0] func7  = i_ins[31:25];
  wire [4:0] rs2id  = i_ins[24:20];
  wire [4:0] rs1id  = i_ins[19:15];
  wire [2:0] func3  = i_ins[14:12];
  wire [4:0] rdid   = i_ins[11: 7];
  wire [6:0] opcode = i_ins[ 6: 0];

  //1.reg info, imm info:  ///////////////////////////////////////////////////////////////////////////
  always@(*)begin
    o_imm   = `YSYX04561_CPU_WIDTH'b0;
    o_rs1id = `YSYX04561_REG_ADDRW'b0;
    o_rs2id = `YSYX04561_REG_ADDRW'b0;
    o_rdid  = `YSYX04561_REG_ADDRW'b0;
    o_rdwen = 1'b0;
    case(opcode) 
      `YSYX04561_TYPE_R:        begin o_rs2id = rs2id;  o_rs1id = rs1id;  o_rdid = rdid;  o_rdwen = 1'b1; o_imm = `YSYX04561_CPU_WIDTH'b0;                                              end
      `YSYX04561_TYPE_R_W:      begin o_rs2id = rs2id;  o_rs1id = rs1id;  o_rdid = rdid;  o_rdwen = 1'b1; o_imm = `YSYX04561_CPU_WIDTH'b0;                                              end
      `YSYX04561_TYPE_S:        begin o_rs2id = rs2id;  o_rs1id = rs1id;                                  o_imm = {{52{i_ins[31]}},i_ins[31:25],i_ins[11:7]};                 end
      `YSYX04561_TYPE_B:        begin o_rs2id = rs2id;  o_rs1id = rs1id;                                  o_imm = {{52{i_ins[31]}},i_ins[7],i_ins[30:25],i_ins[11:8],1'b0};   end
      `YSYX04561_TYPE_I:        begin                   o_rs1id = rs1id;  o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{52{i_ins[31]}},i_ins[31:20]};                             end
      `YSYX04561_TYPE_I_W:      begin                   o_rs1id = rs1id;  o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{52{i_ins[31]}},i_ins[31:20]};                             end
      `YSYX04561_TYPE_I_LOAD:   begin                   o_rs1id = rs1id;  o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{52{i_ins[31]}},i_ins[31:20]};                             end
      `YSYX04561_TYPE_I_JALR:   begin                   o_rs1id = rs1id;  o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{52{i_ins[31]}},i_ins[31:20]};                             end
      `YSYX04561_TYPE_U_LUI:    begin                   o_rs1id = 0  ;    o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{32{i_ins[31]}},i_ins[31:12],12'b0};                       end //LUI: rdid = x0 + imm;
      `YSYX04561_TYPE_U_AUIPC:  begin                                     o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{32{i_ins[31]}},i_ins[31:12],12'b0};                       end
      `YSYX04561_TYPE_J:        begin                                     o_rdid = rdid;  o_rdwen = 1'b1; o_imm = {{44{i_ins[31]}},i_ins[19:12],i_ins[20],i_ins[30:21],1'b0}; end
      default: ;
    endcase
    if(o_rdid  == `YSYX04561_REG_ADDRW'b0) o_rdwen = 1'b0;  // x[0] can not be written.
  end

  //2.exu info:  /////////////////////////////////////////////////////////////////////////////////////
  always @(*) begin
    o_exopt   = `YSYX04561_EXU_NOP;
    o_src_sel = `YSYX04561_EXU_SEL_IMM;
    case (opcode)
      `YSYX04561_TYPE_S:        begin o_exopt = `YSYX04561_EXU_ADD;  o_src_sel = `YSYX04561_EXU_SEL_IMM; end // M[rs1+imm] = rs2
      `YSYX04561_TYPE_I_LOAD:   begin o_exopt = `YSYX04561_EXU_ADD;  o_src_sel = `YSYX04561_EXU_SEL_IMM; end // rdid = M[rs1+imm]
      `YSYX04561_TYPE_I_JALR:   begin o_exopt = `YSYX04561_EXU_ADD;  o_src_sel = `YSYX04561_EXU_SEL_PC4; end // rdid = PC+4
      `YSYX04561_TYPE_J:        begin o_exopt = `YSYX04561_EXU_ADD;  o_src_sel = `YSYX04561_EXU_SEL_PC4; end // rdid = PC+4
      `YSYX04561_TYPE_U_LUI:    begin o_exopt = `YSYX04561_EXU_ADD;  o_src_sel = `YSYX04561_EXU_SEL_IMM; end // rdid = x0 + imm
      `YSYX04561_TYPE_U_AUIPC:  begin o_exopt = `YSYX04561_EXU_ADD;  o_src_sel = `YSYX04561_EXU_SEL_PCI; end // rdid = pc + imm
      `YSYX04561_TYPE_B:        begin                                                end // no use for exu, idu return. nop for type_b.
      `YSYX04561_TYPE_I:
        begin
          o_src_sel = `YSYX04561_EXU_SEL_IMM;
          case (func3)
            `YSYX04561_FUNC3_ADD_SUB_MUL:   o_exopt = `YSYX04561_EXU_ADD; 
            `YSYX04561_FUNC3_SLL_MULH:      o_exopt = `YSYX04561_EXU_SLL;
            `YSYX04561_FUNC3_SRL_SRA_DIVU:  case (func7[6:1]) 6'b000000: o_exopt = `YSYX04561_EXU_SRL; 6'b010000:o_exopt = `YSYX04561_EXU_SRA; default: ; endcase
            `YSYX04561_FUNC3_XOR_DIV:       o_exopt = `YSYX04561_EXU_XOR;
            `YSYX04561_FUNC3_OR_REM:        o_exopt = `YSYX04561_EXU_OR ;
            `YSYX04561_FUNC3_AND_REMU:      o_exopt = `YSYX04561_EXU_AND;
            `YSYX04561_FUNC3_SLT_MULHSU:    o_exopt = `YSYX04561_EXU_SLT;
            `YSYX04561_FUNC3_SLTU_MULHU:    o_exopt = `YSYX04561_EXU_SLTU;
            default:              ;
          endcase
        end
      `YSYX04561_TYPE_I_W:
        begin
          o_src_sel = `YSYX04561_EXU_SEL_IMM;
          case (func3)
            `YSYX04561_FUNC3_ADD_SUB_MUL:   o_exopt = `YSYX04561_EXU_ADDW;
            `YSYX04561_FUNC3_SLL_MULH:      o_exopt = `YSYX04561_EXU_SLLW;
            `YSYX04561_FUNC3_SRL_SRA_DIVU:  case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_SRLW; 7'b0100000: o_exopt = `YSYX04561_EXU_SRAW;  default: ; endcase
            default:              ;
          endcase
        end
      `YSYX04561_TYPE_R:
        begin
          o_src_sel = `YSYX04561_EXU_SEL_REG;
          case (func3)
            `YSYX04561_FUNC3_ADD_SUB_MUL:  case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_ADD ; 7'b0000001: o_exopt = `YSYX04561_EXU_MUL   ; 7'b0100000: o_exopt = `YSYX04561_EXU_SUB; default: ; endcase
            `YSYX04561_FUNC3_SRL_SRA_DIVU: case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_SRL ; 7'b0000001: o_exopt = `YSYX04561_EXU_DIVU  ; 7'b0100000: o_exopt = `YSYX04561_EXU_SRA; default: ; endcase
            `YSYX04561_FUNC3_SLL_MULH:     case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_SLL ; 7'b0000001: o_exopt = `YSYX04561_EXU_MULH  ; default: ; endcase
            `YSYX04561_FUNC3_XOR_DIV:      case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_XOR ; 7'b0000001: o_exopt = `YSYX04561_EXU_DIV   ; default: ; endcase
            `YSYX04561_FUNC3_OR_REM:       case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_OR  ; 7'b0000001: o_exopt = `YSYX04561_EXU_REM   ; default: ; endcase
            `YSYX04561_FUNC3_AND_REMU:     case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_AND ; 7'b0000001: o_exopt = `YSYX04561_EXU_REMU  ; default: ; endcase
            `YSYX04561_FUNC3_SLT_MULHSU:   case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_SLT ; 7'b0000001: o_exopt = `YSYX04561_EXU_MULHSU; default: ; endcase
            `YSYX04561_FUNC3_SLTU_MULHU:   case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_SLTU; 7'b0000001: o_exopt = `YSYX04561_EXU_MULHU ; default: ; endcase
            default:             ;
          endcase
        end
      `YSYX04561_TYPE_R_W:
        begin
          o_src_sel = `YSYX04561_EXU_SEL_REG;
          case (func3)
            `YSYX04561_FUNC3_ADD_SUB_MUL:   case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_ADDW; 7'b0100000: o_exopt = `YSYX04561_EXU_SUBW; 7'b0000001: o_exopt = `YSYX04561_EXU_MULW ; default: ; endcase
            `YSYX04561_FUNC3_SRL_SRA_DIVU:  case (func7) 7'b0000000:o_exopt = `YSYX04561_EXU_SRLW; 7'b0100000: o_exopt = `YSYX04561_EXU_SRAW; 7'b0000001: o_exopt = `YSYX04561_EXU_DIVUW; default: ; endcase
            `YSYX04561_FUNC3_XOR_DIV:       o_exopt  = `YSYX04561_EXU_DIVW;
            `YSYX04561_FUNC3_OR_REM:        o_exopt  = `YSYX04561_EXU_REMW;
            `YSYX04561_FUNC3_AND_REMU:      o_exopt  = `YSYX04561_EXU_REMUW;
            `YSYX04561_FUNC3_SLL_MULH:      o_exopt  = `YSYX04561_EXU_SLLW;
            default:              ; //func3_err
          endcase
        end
      default:  ; //opc_err
    endcase
  end

  // 3.lsu:  /////////////////////////////////////////////////////////////////////////////////////////
  assign o_lsu_func3 = func3;
  assign o_lsu_lden = (opcode == `YSYX04561_TYPE_I_LOAD) ? 1'b1 : 1'b0;
  assign o_lsu_sten = (opcode == `YSYX04561_TYPE_S)      ? 1'b1 : 1'b0;

  // 4.bru: o_jump, o_jalr.  ////////////////////////////////////////////////////////////////////
  assign o_jal  = (opcode == `YSYX04561_TYPE_J)? 1:0;
  assign o_jalr = (opcode == `YSYX04561_TYPE_I_JALR)? 1:0;
  assign o_brch = (opcode == `YSYX04561_TYPE_B)? 1:0;
  assign o_bfun3 = func3;

endmodule


module ysyx_040561_idu_system(
  input        [`YSYX04561_INS_WIDTH-1:0]     i_ins         ,
  // 1. for csr:
  output logic [`YSYX04561_CSR_ADDRW-1:0]     o_csrsid      ,
  output logic                      o_csrsren     , // csr source read enable.
  // 2. for reg:
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_rs1id       ,
  // 3. for exu:
  output logic [`YSYX04561_CPU_WIDTH-1:0]     o_imm         ,
  output logic [`YSYX04561_CSR_OPT_WIDTH-1:0] o_excsropt    , //exu csr option.
  output logic                      o_excsrsrc    , //exu csr source.
  // 4. for wbu:
  output logic [`YSYX04561_REG_ADDRW-1:0]     o_rdid        ,
  output logic                      o_rdwen       ,
  output logic [`YSYX04561_CSR_ADDRW-1:0]     o_csrdid      ,
  output logic                      o_csrdwen       // csr dest write enable.
);

  // when reach here, opcode must be `YSYX04561_TYPE_SYS, so it is senseless to case opcode.

  wire [2:0] func3;
  wire [4:0] uimm ;

  assign o_csrsid = i_ins[31:20];
  assign o_csrdid = i_ins[31:20];
  assign o_rs1id  = i_ins[19:15];
  assign uimm     = i_ins[19:15];
  assign func3    = i_ins[14:12];
  assign o_rdid   = i_ins[11: 7];

  wire csrrw  = (func3 == `YSYX04561_FUNC3_CSRRW );
  wire csrrs  = (func3 == `YSYX04561_FUNC3_CSRRS );
  wire csrrc  = (func3 == `YSYX04561_FUNC3_CSRRC );
  wire csrrwi = (func3 == `YSYX04561_FUNC3_CSRRWI);
  wire csrrsi = (func3 == `YSYX04561_FUNC3_CSRRSI);
  wire csrrci = (func3 == `YSYX04561_FUNC3_CSRRCI);
  wire rdneq0 = |o_rdid ;     // rd id not qual to zero.
  wire rsneq0 = |o_rs1id;     // rs id not qual to zero.

  assign o_csrsren =  ((csrrw | csrrwi) & rdneq0) | (csrrs | csrrsi | csrrc | csrrci);

  assign o_csrdwen =  (csrrw | csrrwi) | (rsneq0 & (csrrs | csrrsi | csrrc | csrrci));

  assign o_rdwen = o_csrsren & (o_rdid!=0);

  assign o_excsropt = func3[1:0];   // please read the riscv-pri and riscv-spec manual, 00 for mret,ecall,ebreak... 01,10,11 for rw/rs/rc.

  assign o_excsrsrc = (csrrwi|csrrsi|csrrci) ? `YSYX04561_CSR_SEL_IMM : `YSYX04561_CSR_SEL_REG;

  assign o_imm = (o_excsrsrc == `YSYX04561_CSR_SEL_IMM) ? {{(`YSYX04561_CPU_WIDTH-5){ 1'b0 }} , uimm} : `YSYX04561_CPU_WIDTH'b0;

endmodule


module ysyx_040561_exu (
  // 1. signal to pipe shake hands:
  input  logic                       i_clk         ,
  input  logic                       i_rst_n       ,
  input  logic                       i_flush       ,
  input  logic                       i_pre_nop     ,
  input  logic                       i_pre_valid   ,   // from pre-stage
  output logic                       o_pre_ready   ,   //  to  pre-stage
  output logic                       o_post_valid  ,   //  to  post-stage
  input  logic                       i_post_ready  ,   // from post-stage

  // 2. input comb signal from pre stage:
  input  logic                       i_idu_sysins  ,
  // 2.1 use in exu.
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]     i_idu_imm     ,
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]     i_idu_csrs    ,
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]     i_idu_rs1     ,
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]     i_idu_rs2     ,
  input  logic  [`YSYX04561_EXU_SEL_WIDTH-1:0] i_idu_exsrc   ,
  input  logic  [`YSYX04561_EXU_OPT_WIDTH-1:0] i_idu_exopt   ,
  input  logic                       i_idu_excsrsrc,
  input  logic  [`YSYX04561_CSR_OPT_WIDTH-1:0] i_idu_excsropt,
  // 2.2 dealy for lsu:
  input  logic  [2:0]                i_idu_lsfunc3 ,
  input  logic                       i_idu_lden    ,
  input  logic                       i_idu_sten    ,
  input  logic                       i_idu_fencei  ,
  // 2.3 dealy for wbu:
  input  logic  [`YSYX04561_REG_ADDRW-1:0]     i_idu_rdid    ,
  input  logic                       i_idu_rdwen   ,
  input  logic  [`YSYX04561_CSR_ADDRW-1:0]     i_idu_csrdid  ,
  input  logic                       i_idu_csrdwen , // csr dest write enable.
  // 2.4 dealy for bru/wbu:
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]     i_idu_pc      ,
  input  logic                       i_idu_ecall   ,
  input  logic                       i_idu_mret    ,
  input  logic                       i_idu_nop     ,

  // 3. output comb signal to post stage:
  // 3.1 for lsu: 
  output logic  [`YSYX04561_CPU_WIDTH-1:0]     o_exu_rs2     ,
  output logic  [2:0]                o_exu_lsfunc3 ,
  output logic                       o_exu_lden    ,
  output logic                       o_exu_sten    ,
  output logic                       o_exu_fencei  ,
  // 3.2 for lsu, dealy to use for wbu:
  output logic  [`YSYX04561_REG_ADDRW-1:0]     o_exu_rdid    ,
  output logic                       o_exu_rdwen   ,
  output logic  [`YSYX04561_CPU_WIDTH-1:0]     o_exu_res     ,
  output logic  [`YSYX04561_CSR_ADDRW-1:0]     o_exu_csrdid  ,
  output logic                       o_exu_csrdwen , // csr dest write enable.
  output logic  [`YSYX04561_CPU_WIDTH-1:0]     o_exu_csrd    ,
  output logic  [`YSYX04561_CPU_WIDTH-1:0]     o_exu_pc      ,
  output logic                       o_exu_ecall   ,
  output logic                       o_exu_mret    ,
  output logic                       o_exu_nop
);

  // 1. shake hands://///////////////////////////////////////////////////////////////////////////////////////

  // for one cycle alu, such as + - >> <<:
  // i_pre_valid --> ⌈‾‾‾‾⌉ --> o_post_valid
  //                 |REG|
  // o_pre_ready <-- ⌊____⌋ <-- i_post_ready

  // for more cycles alu, such as / % :

  // i_pre_valid -->⌈‾‾‾‾⌉-->pre_valid_r -->div_start-->⌈‾‾‾‾⌉-->div_end_valid |  --> o_post_valid
  //                |REG|                        ↑     |DIV |                 |  
  // o_pre_ready <--⌊____⌋                   div_busy<--⌊____⌋<--div_end_ready |  <-- i_post_ready

  logic alu_int, alu_mul, alu_div;
  logic pre_valid_r, div_end_valid, div_end_ready;
  wire pre_sh;
  assign o_pre_ready = o_post_valid & i_post_ready | !pre_valid_r ;
  assign pre_sh = i_pre_valid & o_pre_ready;

  ysyx_040561_stl_reg #(
    .WIDTH      (1            ), 
    .RESET_VAL  (0            )
  ) postvalid ( 
    .i_clk      (i_clk        ), 
    .i_rst_n    (i_rst_n      ), 
    .i_wen      (i_flush | o_pre_ready  ), 
    .i_din      (i_flush ? 1'b0: i_pre_valid  ), 
    .o_dout     (pre_valid_r  )
  );

  assign div_end_ready = alu_div ? i_post_ready : 1'b0;
  assign o_post_valid = alu_div ? div_end_valid : pre_valid_r;

 //  2. reg pre stage signals: ///////////////////////////////////////////////////////////////////////////////

  logic                        idu_sysins_r  ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]      idu_imm_r     ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]      idu_csrs_r    ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]      idu_rs1_r     ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]      idu_rs2_r     ;
  logic  [`YSYX04561_EXU_SEL_WIDTH-1:0]  idu_exsrc_r   ;
  logic  [`YSYX04561_EXU_OPT_WIDTH-1:0]  idu_exopt_r   ;
  logic                        idu_excsrsrc_r;
  logic  [`YSYX04561_CSR_OPT_WIDTH-1:0]  idu_excsropt_r;
  logic  [2:0]                 idu_lsfunc3_r ;
  logic                        idu_lden_r    ;
  logic                        idu_sten_r    ;
  logic                        idu_fencei_r  ;
  logic  [`YSYX04561_REG_ADDRW-1:0]      idu_rdid_r    ;
  logic                        idu_rdwen_r   ;
  logic  [`YSYX04561_CSR_ADDRW-1:0]      idu_csrdid_r  ;
  logic                        idu_csrdwen_r ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]      idu_pc_r      ;
  logic                        idu_ecall_r   ;
  logic                        idu_mret_r    ;
  logic                        idu_nop_r     ;

  localparam EXREG_WIDTH = 5*`YSYX04561_CPU_WIDTH+`YSYX04561_REG_ADDRW+13+`YSYX04561_EXU_SEL_WIDTH+`YSYX04561_EXU_OPT_WIDTH+`YSYX04561_CSR_OPT_WIDTH+`YSYX04561_CSR_ADDRW;

  logic [EXREG_WIDTH-1:0] reg_din, reg_dout;

  assign reg_din = {i_flush | i_pre_nop ? {(EXREG_WIDTH-1){1'b0}} : {i_idu_sysins, i_idu_imm, i_idu_rs1, i_idu_rs2, i_idu_csrs, i_idu_exsrc, i_idu_exopt, i_idu_excsrsrc,
                     i_idu_excsropt, i_idu_lsfunc3, i_idu_lden, i_idu_sten, i_idu_fencei, i_idu_rdid, i_idu_rdwen, i_idu_csrdid, i_idu_csrdwen, i_idu_pc, i_idu_ecall, i_idu_mret},
                    i_flush ? 1'b0 : {i_pre_nop | i_idu_nop} };

  assign {idu_sysins_r, idu_imm_r, idu_rs1_r, idu_rs2_r, idu_csrs_r, idu_exsrc_r, idu_exopt_r, idu_excsrsrc_r, idu_excsropt_r, idu_lsfunc3_r,
          idu_lden_r, idu_sten_r, idu_fencei_r, idu_rdid_r, idu_rdwen_r, idu_csrdid_r, idu_csrdwen_r, idu_pc_r, idu_ecall_r, idu_mret_r, idu_nop_r} = reg_dout;

  ysyx_040561_stl_reg #(
    .WIDTH      (EXREG_WIDTH),
    .RESET_VAL  (0        )
  ) regs(
    .i_clk      (i_clk    ),
    .i_rst_n    (i_rst_n  ),
    .i_wen      (i_flush | pre_sh  ),
    .i_din      (reg_din  ),
    .o_dout     (reg_dout )
  );

  // 3. use pre stage system signals to generate comb logic for post stage://////////////////////////////////////////

  logic [`YSYX04561_CPU_WIDTH-1:0] sys_rs1, sys_csr, sys_csrres, sys_rdres;

  assign sys_rs1 = (idu_excsrsrc_r == `YSYX04561_CSR_SEL_IMM) ? idu_imm_r : idu_rs1_r;
  assign sys_csr = idu_csrs_r;

  // cal sys_rdres :
  ysyx_040561_stl_mux_default #(1<<`YSYX04561_CSR_OPT_WIDTH, `YSYX04561_CSR_OPT_WIDTH, `YSYX04561_CPU_WIDTH) mux_sys_rdres  (sys_rdres, idu_excsropt_r, `YSYX04561_CPU_WIDTH'b0, {
    `YSYX04561_CSR_NOP, `YSYX04561_CPU_WIDTH'b0 ,
    `YSYX04561_CSR_RW , sys_csr ,
    `YSYX04561_CSR_RS , sys_csr ,
    `YSYX04561_CSR_RC , sys_csr       
  });

  // cal sys_csrres :
  ysyx_040561_stl_mux_default #(1<<`YSYX04561_CSR_OPT_WIDTH, `YSYX04561_CSR_OPT_WIDTH, `YSYX04561_CPU_WIDTH) mux_sys_csrres (sys_csrres, idu_excsropt_r, `YSYX04561_CPU_WIDTH'b0, {
    `YSYX04561_CSR_NOP, `YSYX04561_CPU_WIDTH'b0       ,
    `YSYX04561_CSR_RW ,             sys_rs1 ,
    `YSYX04561_CSR_RS ,  sys_csr |  sys_rs1 ,
    `YSYX04561_CSR_RC ,  sys_csr & ~sys_rs1   
  });

  // 4. use pre stage normal signals to generate comb logic for post stage://////////////////////////////////////////
  // 4.1 select src in and result: ///////////////////////////////////////////////////////////////////////////

  logic [`YSYX04561_CPU_WIDTH-1:0] src1,src2;

  ysyx_040561_stl_mux_default #(1<<`YSYX04561_EXU_SEL_WIDTH, `YSYX04561_EXU_SEL_WIDTH, `YSYX04561_CPU_WIDTH) mux_src1 (src1, idu_exsrc_r, `YSYX04561_CPU_WIDTH'b0, {
    `YSYX04561_EXU_SEL_REG, idu_rs1_r,
    `YSYX04561_EXU_SEL_IMM, idu_rs1_r,
    `YSYX04561_EXU_SEL_PC4, idu_pc_r,
    `YSYX04561_EXU_SEL_PCI, idu_pc_r
  });

  ysyx_040561_stl_mux_default #(1<<`YSYX04561_EXU_SEL_WIDTH, `YSYX04561_EXU_SEL_WIDTH, `YSYX04561_CPU_WIDTH) mux_src2 (src2, idu_exsrc_r, `YSYX04561_CPU_WIDTH'b0, {
    `YSYX04561_EXU_SEL_REG, idu_rs2_r,
    `YSYX04561_EXU_SEL_IMM, idu_imm_r,
    `YSYX04561_EXU_SEL_PC4, `YSYX04561_CPU_WIDTH'h4,
    `YSYX04561_EXU_SEL_PCI, idu_imm_r
  });

  // 请记住：硬件中不区分有符号和无符号，全部按照补码进行运算！
  // 所以 src1 - src2 得到是补码！ 如果src1和src2是有符号数，通过输出最高位就可以判断正负！
  // 如果src1和src2是无符号数，那么就在最高位补0，拓展为有符号数再减法，通过最高位判断正负！

  logic [`YSYX04561_CPU_WIDTH-1:0] int_res, mul_res, div_res;

  // 4.2 generate integer alu result: ////////////////////////////////////////////////////////////////////////////////////////
  wire [63:0]   add_result  = src1 + src2;
  wire [63:0]   sub_result  = src1 - src2;
  wire [127:0]  sra_intern  = {{{64{src1[63]}},src1} >> src2[5:0]};
  wire [63:0]   sra_result  = sra_intern[63:0];
  wire [63:0]   slt_result  = {63'b0, sub_result[63]};
  wire [64:0]   sltu_intern = {1'b0,src1} - {1'b0,src2};
  wire [63:0]   sltu_result = {63'b0 , sltu_intern[64]};     

  always @(*) begin
    alu_int = 1'b1;
    case (idu_exopt_r)
      `YSYX04561_EXU_ADD:   int_res = add_result;
      `YSYX04561_EXU_SUB:   int_res = sub_result;
      `YSYX04561_EXU_ADDW:  begin int_res[31:0] = src1[31:0] + src2[31:0];               int_res[63:32] = {32{int_res[31]}};  end
      `YSYX04561_EXU_SUBW:  begin int_res[31:0] = src1[31:0] - src2[31:0];               int_res[63:32] = {32{int_res[31]}};  end
      `YSYX04561_EXU_AND:   int_res = src1 & src2;
      `YSYX04561_EXU_OR:    int_res = src1 | src2;
      `YSYX04561_EXU_XOR:   int_res = src1 ^ src2;
      `YSYX04561_EXU_SLL:   int_res = src1 << src2[5:0];
      `YSYX04561_EXU_SRL:   int_res = src1 >> src2[5:0];
      `YSYX04561_EXU_SRA:   int_res = sra_result;
      `YSYX04561_EXU_SLLW:  begin int_res[31:0] = src1[31:0] << src2[4:0];               int_res[63:32] = {32{int_res[31]}};  end
      `YSYX04561_EXU_SRLW:  begin int_res[31:0] = src1[31:0] >> src2[4:0];               int_res[63:32] = {32{int_res[31]}};  end
      `YSYX04561_EXU_SRAW:  begin int_res = {{32{src1[31]}}, src1[31:0]} >> src2[4:0];   int_res[63:32] = {32{int_res[31]}};  end
      `YSYX04561_EXU_SLT:   int_res = slt_result;
      `YSYX04561_EXU_SLTU:  int_res = sltu_result;
      default:    begin int_res = `YSYX04561_CPU_WIDTH'b0; alu_int = 1'b0; end
    endcase
  end

  // 4.3 generate multi alu result: ////////////////////////////////////////////////////////////////////////////////////////
  logic mulw, mul1_signed, mul2_signed;
  logic [`YSYX04561_CPU_WIDTH-1:0] mul_src1, mul_src2, mul_hires, mul_lwres;

  assign mul_src1 = alu_mul ? src1 : `YSYX04561_CPU_WIDTH'b0; // if not mul, close input to save power.
  assign mul_src2 = alu_mul ? src2 : `YSYX04561_CPU_WIDTH'b0; // if not mul, close input to save power.

  ysyx_040561_mult #(.W(`YSYX04561_CPU_WIDTH)) u_mult(
    .i_mulw   (mulw       ),
    .i_x_sign (mul1_signed),
    .i_y_sign (mul2_signed),
    .i_x      (mul_src1   ),
    .i_y      (mul_src2   ),
    .o_hi_res (mul_hires  ),
    .o_lw_res (mul_lwres  )
  );

  always @(*) begin
    case (idu_exopt_r)
      `YSYX04561_EXU_MUL:   begin alu_mul  = 1'b1; mulw = 1'b0; mul1_signed = 1'b1; mul2_signed = 1'b1;  mul_res = mul_lwres    ; end
      `YSYX04561_EXU_MULH:  begin alu_mul  = 1'b1; mulw = 1'b0; mul1_signed = 1'b1; mul2_signed = 1'b1;  mul_res = mul_hires    ; end
      `YSYX04561_EXU_MULHSU:begin alu_mul  = 1'b1; mulw = 1'b0; mul1_signed = 1'b1; mul2_signed = 1'b0;  mul_res = mul_hires    ; end
      `YSYX04561_EXU_MULHU: begin alu_mul  = 1'b1; mulw = 1'b0; mul1_signed = 1'b0; mul2_signed = 1'b0;  mul_res = mul_hires    ; end
      `YSYX04561_EXU_MULW:  begin alu_mul  = 1'b1; mulw = 1'b1; mul1_signed = 1'b1; mul2_signed = 1'b1;  mul_res = mul_lwres    ; end
      default:    begin alu_mul  = 1'b0; mulw = 1'b0; mul1_signed = 1'b0; mul2_signed = 1'b0;  mul_res = `YSYX04561_CPU_WIDTH'b0; end
    endcase
  end

  // 4.4 generate div alu result: ////////////////////////////////////////////////////////////////////////////////////////

  logic divw,div_signed;
  logic [`YSYX04561_CPU_WIDTH-1:0] dividend, divisor, quotient, remainder;
  
  logic div_busy;
  wire div_start = (alu_div & pre_valid_r) & !div_busy;

  ysyx_040561_div #(.WIDTH (`YSYX04561_CPU_WIDTH )) u_div(
    .i_clk          (i_clk         ),
    .i_rst_n        (i_rst_n       ),
    .i_flush        (i_flush       ),
    .i_divw         (divw          ),
    .i_start        (div_start     ),
    .o_busy         (div_busy      ),
    .o_end_valid    (div_end_valid ),
    .i_end_ready    (div_end_ready ),
    .i_signed       (div_signed    ),
    .i_dividend     (dividend      ),
    .i_divisor      (divisor       ),
    .o_quotient     (quotient      ),
    .o_remainder    (remainder     )
  );

  assign dividend = alu_div ? src1 : `YSYX04561_CPU_WIDTH'b0; // if not div/rem, close input to save power.
  assign divisor  = alu_div ? src2 : `YSYX04561_CPU_WIDTH'b0; // if not div/rem, close input to save power.

  always @(*) begin
    case (idu_exopt_r)
      `YSYX04561_EXU_DIV:   begin alu_div = 1'b1; divw = 1'b0; div_signed = 1'b1; div_res = quotient     ; end
      `YSYX04561_EXU_DIVU:  begin alu_div = 1'b1; divw = 1'b0; div_signed = 1'b0; div_res = quotient     ; end
      `YSYX04561_EXU_DIVW:  begin alu_div = 1'b1; divw = 1'b1; div_signed = 1'b1; div_res = quotient     ; end
      `YSYX04561_EXU_DIVUW: begin alu_div = 1'b1; divw = 1'b1; div_signed = 1'b0; div_res = quotient     ; end
      `YSYX04561_EXU_REM:   begin alu_div = 1'b1; divw = 1'b0; div_signed = 1'b1; div_res = remainder    ; end
      `YSYX04561_EXU_REMU:  begin alu_div = 1'b1; divw = 1'b0; div_signed = 1'b0; div_res = remainder    ; end
      `YSYX04561_EXU_REMW:  begin alu_div = 1'b1; divw = 1'b1; div_signed = 1'b1; div_res = remainder    ; end
      `YSYX04561_EXU_REMUW: begin alu_div = 1'b1; divw = 1'b1; div_signed = 1'b0; div_res = remainder    ; end
      default:    begin alu_div = 1'b0; divw = 1'b0; div_signed = 1'b0; div_res = `YSYX04561_CPU_WIDTH'b0; end
    endcase
  end

  // 5. select output result: ////////////////////////////////////////////////////////////////////////////////////////

  assign o_exu_rs2     = idu_rs2_r    ;
  assign o_exu_lsfunc3 = idu_lsfunc3_r;
  assign o_exu_lden    = idu_lden_r   ;
  assign o_exu_sten    = idu_sten_r   ;
  assign o_exu_fencei  = idu_fencei_r ;
  assign o_exu_rdid    = idu_rdid_r   ;
  assign o_exu_rdwen   = idu_rdwen_r  ;
  assign o_exu_res     = idu_sysins_r ? sys_rdres :
                          (alu_div    ? div_res   :
                          (alu_mul    ? mul_res   :
                          (alu_int    ? int_res   : `YSYX04561_CPU_WIDTH'b0)));
  assign o_exu_csrdid  = idu_csrdid_r ;
  assign o_exu_csrdwen = idu_csrdwen_r;
  assign o_exu_csrd    = sys_csrres   ;
  assign o_exu_pc      = idu_pc_r     ;
  assign o_exu_ecall   = idu_ecall_r  ;
  assign o_exu_mret    = idu_mret_r   ;
  assign o_exu_nop     = idu_nop_r    ;

endmodule

module ysyx_040561_mult #(
  parameter W = 64          // width should not be changed, only support 64 now.
)(
  input             i_mulw  ,
  input             i_x_sign,
  input             i_y_sign,
  input 	[W-1:0]   i_x     ,
  input 	[W-1:0]   i_y     ,
  output 	[W-1:0]   o_hi_res,
  output 	[W-1:0]   o_lw_res
);

  localparam TOTAL_W = W + 2 ; // 2 for signed extension, 66 totally.
  localparam PNUM = TOTAL_W/2;

  logic	[TOTAL_W-1:0]   x  ;
  logic	[TOTAL_W-1:0]   y  ;
  logic [2*TOTAL_W-1:0] res;

  assign x = i_mulw ? {{(2+W/2){i_x[W/2-1]}}, i_x[W/2-1:0]} : {i_x_sign ? {2{i_x[W-1]}} : 2'b0, i_x[W-1:0]};
  assign y = i_mulw ? {{(2+W/2){i_y[W/2-1]}}, i_y[W/2-1:0]} : {i_y_sign ? {2{i_y[W-1]}} : 2'b0, i_y[W-1:0]};

  // 1. generate partial product://///////////////////////////////////////////////////////////
  wire  [TOTAL_W:0] p[PNUM-1:0];
  wire  c [PNUM-1:0];

  ysyx_040561_booth #(.WIDTH (TOTAL_W)) B_0(.x (x),.s ({y[1:0], 1'b0}),.p (p[0]),.c (c[0]));
  for(genvar i=1; i<PNUM; i=i+1)begin:Booths
    ysyx_040561_booth #(.WIDTH (TOTAL_W)) B_(.x (x),.s (y[2*i+1 : 2*i-1]),.p (p[i]),.c (c[i]));
  end

  // 2. use wallace tree to generate result://////////////////////////////////////////////////
  wire [2*TOTAL_W-1:0] tree_in [PNUM-1:0];	// with modified sign extension
  wire [2*TOTAL_W-1:0] tree_out [1:0];
  assign tree_in[ 0] = {{(TOTAL_W-1){c[0]}} , p[0]	};
  for(genvar i=1; i<PNUM; i=i+1)begin:gen_tree_in
    assign tree_in[i] = {{(TOTAL_W-1-2*i){c[i]}}, p[i], 1'b0, c[i-1], {(2*i-2){1'b0}}};
  end

  ysyx_040561_wallace_tree_33 #(2*TOTAL_W) wallace_tree (.in(tree_in),.out(tree_out));

  // 3. full connect adder://///////////////////////////////////////////////////////////////////
  logic carry;
  ysyx_040561_rca_nbit #(.N (2*TOTAL_W)) u_rca_nbit(.i_a (tree_out[1]),.i_b (tree_out[0]), .i_c (1'b0),.o_s (res), .o_c(carry));
  assign {o_hi_res, o_lw_res} = res[2*W-1:0];

endmodule

module ysyx_040561_booth #(parameter WIDTH=32) (
  input [WIDTH-1:0] x,
  input [2:0] s,
  output wire [WIDTH:0] p,
  output wire c
);

  wire y_add,y,y_sub; // y+1,y,y-1
  wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;

  assign {y_add,y,y_sub} = s;

  assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_double_negative =  y_add & ~y & ~y_sub;
  assign sel_double_positive = ~y_add &  y &  y_sub;

  assign p = sel_double_negative ? ~{x, 1'b0} : 
            (sel_double_positive ? {x, 1'b0} :
            (sel_negative ? ~{1'b0,x}:
            (sel_positive ?  {1'b0,x} : {(WIDTH+1){1'b0}})));
  assign c = sel_double_negative | sel_negative ? 1'b1 : 1'b0;

endmodule

module ysyx_040561_csa_nbit#(
  parameter N = 64
)(
  input  [N-1:0] i_a, 
  input  [N-1:0] i_b, 
  input  [N-1:0] i_c, 
  output [N-1:0] o_s, 
  output [N-1:0] o_c
);

  wire [N-1:0] p;
  wire [N-1:0] g;

  genvar i;
  generate
    for(i=0; i<N; i=i+1)begin:csa
      assign g[i] = i_a[i] & i_b[i];
      assign p[i] = i_a[i] ^ i_b[i];
      assign o_s[i] = p[i] ^ i_c[i];
      assign o_c[i] = i_c[i] & p[i] | g[i] ;
    end
  endgenerate

endmodule

module ysyx_040561_rca_nbit#(
  parameter N = 64
)(
  input  [N-1:0] i_a, 
  input  [N-1:0] i_b, 
  input          i_c, 
  output [N-1:0] o_s, 
  output         o_c
);

  wire [N-1:0] p;
  wire [N-1:0] g;
  // verilator lint_off UNOPTFLAT
  wire [N:0] c;
  // verilator lint_on UNOPTFLAT

  for(genvar i=0; i<N; i=i+1)begin:csa
    assign g[i]   = i_a[i] & i_b[i];
    assign p[i]   = i_a[i] ^ i_b[i];
    assign c[i+1] = c[i] & p[i] | g[i];
    assign o_s[i] = p[i] ^ c[i];
  end

  assign c[0] = i_c;
  assign o_c = c[N];

endmodule

module ysyx_040561_wallace_tree_33 #(
  parameter WIDTH=132
) (
  input  [WIDTH-1:0] in [32:0],
  output [WIDTH-1:0] out[1:0]
);

  wire  [WIDTH-1:0] s_row1[11:0];
  wire  [WIDTH-1:0] c_row1[11:0];
  wire  [WIDTH-1:0] c_row1_shift[11:0];

  wire  [WIDTH-1:0] s_row2[6:0];
  wire  [WIDTH-1:0] c_row2[6:0];
  wire  [WIDTH-1:0] c_row2_shift[6:0];
  
  wire  [WIDTH-1:0] s_row3[4:0];
  wire  [WIDTH-1:0] c_row3[4:0];
  wire  [WIDTH-1:0] c_row3_shift[4:0];

  wire  [WIDTH-1:0] s_row4[2:0];
  wire  [WIDTH-1:0] c_row4[2:0];
  wire  [WIDTH-1:0] c_row4_shift[2:0];

  wire  [WIDTH-1:0] s_row5[1:0];
  wire  [WIDTH-1:0] c_row5[1:0];
  wire  [WIDTH-1:0] c_row5_shift[1:0];

  wire  [WIDTH-1:0] s_row6, c_row6, c_row6_shift;
  wire  [WIDTH-1:0] s_row7, c_row7, c_row7_shift;
  wire  [WIDTH-1:0] s_row8, c_row8, c_row8_shift;

  // 1. first level, 11 csa, 33p -> 22p://////////////////////////////////////////////////////////////
  for(genvar i=0; i<11; i=i+1)begin: csa_row1
    ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row1  (in[3*i] , in[3*i+1] , in[3*i+2] , s_row1[i], c_row1[i]);
    assign c_row1_shift[i] = {c_row1[i][WIDTH-2:0], 1'b0};
  end

  // 2. second level, 7 csa, 22p -> 15p (2*7+1):///////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_0  (s_row1[0]      , c_row1_shift[0],  s_row1[1]      ,  s_row2[0], c_row2[0]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_1  (c_row1_shift[1], s_row1[2]      ,  c_row1_shift[2],  s_row2[1], c_row2[1]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_2  (s_row1[3]      , c_row1_shift[3],  s_row1[4]      ,  s_row2[2], c_row2[2]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_3  (c_row1_shift[4], s_row1[5]      ,  c_row1_shift[5],  s_row2[3], c_row2[3]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_4  (s_row1[6]      , c_row1_shift[6],  s_row1[7]      ,  s_row2[4], c_row2[4]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_5  (c_row1_shift[7], s_row1[8]      ,  c_row1_shift[8],  s_row2[5], c_row2[5]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row2_6  (s_row1[9]      , c_row1_shift[9],  s_row1[10]     ,  s_row2[6], c_row2[6]);
  for(genvar i=0; i<7; i=i+1)begin: csa_row2_shift
    assign c_row2_shift[i] = {c_row2[i][WIDTH-2:0], 1'b0};
  end

  // 3. third level, 5 csa, 15p -> 10p: ///////////////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row3_0  (c_row1_shift[10], s_row2[0]      , c_row2_shift[0], s_row3[0], c_row3[0]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row3_1  (s_row2[1]       , c_row2_shift[1], s_row2[2]      , s_row3[1], c_row3[1]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row3_2  (c_row2_shift[2] , s_row2[3]      , c_row2_shift[3], s_row3[2], c_row3[2]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row3_3  (s_row2[4]       , c_row2_shift[4], s_row2[5]      , s_row3[3], c_row3[3]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row3_4  (c_row2_shift[5] , s_row2[6]      , c_row2_shift[6], s_row3[4], c_row3[4]);
  for(genvar i=0; i<5; i=i+1)begin: csa_row3_shift
    assign c_row3_shift[i] = {c_row3[i][WIDTH-2:0], 1'b0};
  end

  // 4. fourth level, 3 csa, 10p -> 7p (2*3+1): ////////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row4_0  (s_row3[0]       , c_row3_shift[0], s_row3[1]      , s_row4[0], c_row4[0]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row4_1  (c_row3_shift[1] , s_row3[2]      , c_row3_shift[2], s_row4[1], c_row4[1]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row4_2  (s_row3[3]       , c_row3_shift[3], s_row3[4]      , s_row4[2], c_row4[2]);
  for(genvar i=0; i<3; i=i+1)begin: csa_row4_shift
    assign c_row4_shift[i] = {c_row4[i][WIDTH-2:0], 1'b0};
  end

  // 5. fifth level, 2 csa, 7p -> 5p (2*2+1): //////////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row5_0  (c_row3_shift[4], s_row4[0]      , c_row4_shift[0], s_row5[0], c_row5[0]);
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row5_1  (s_row4[1]      , c_row4_shift[1], s_row4[2]      , s_row5[1], c_row5[1]);
  for(genvar i=0; i<2; i=i+1)begin: csa_row5_shift
    assign c_row5_shift[i] = {c_row5[i][WIDTH-2:0], 1'b0};
  end

  // 6. sixth level, 1 csa, 5p -> 4p (2+2): ////////////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row6    (c_row4_shift[2], s_row5[0], c_row5_shift[0], s_row6, c_row6);
  assign c_row6_shift = {c_row6[WIDTH-2:0], 1'b0};

  // 7. seventh level, 1 csa, 4p -> 3p (2+1): //////////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row7    (s_row5[1], c_row5_shift[1], s_row6, s_row7, c_row7);
  assign c_row7_shift = {c_row7[WIDTH-2:0], 1'b0};

  // 8. eighth level, 1 csa, 3p -> 2p: ////////////////////////////////////////////////////////////////////
  ysyx_040561_csa_nbit #(.N(WIDTH)) csa_row8    (c_row6_shift, s_row7, c_row7_shift, s_row8, c_row8);
  assign c_row8_shift = {c_row8[WIDTH-2:0], 1'b0};

  // 9. output 2p :////////////////////////////////////////////////////////////////////////////////////////
  assign out[1] = c_row8_shift;
  assign out[0] = s_row8;

endmodule

module ysyx_040561_div#(
  parameter WIDTH = 64
)(
  input                     i_clk         ,
  input                     i_rst_n       ,
  input                     i_flush       ,
  input                     i_divw        ,
  input                     i_start       ,
  output                    o_busy        ,
  output logic              o_end_valid   ,
  input                     i_end_ready   ,
  input                     i_signed      ,
  input  logic [WIDTH-1:0]  i_dividend    ,
  input  logic [WIDTH-1:0]  i_divisor     ,
  output logic [WIDTH-1:0]  o_quotient    ,
  output logic [WIDTH-1:0]  o_remainder
);

  // 1. control signal:///////////////////////////////////////////////////////////////////////
  localparam CNT_W = $clog2(WIDTH);
  
  logic [CNT_W-1:0] cnt;

  wire cntneq0 = |cnt;
  
  assign o_busy = (cntneq0) | o_end_valid;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      cnt <= {CNT_W{1'b0}};
    end else if(i_flush) begin
      cnt <= {CNT_W{1'b0}};
    end else if(i_start) begin
      cnt <= i_divw ? {1'b0,{(CNT_W-1){1'b1}}} : {CNT_W{1'b1}}; // 31, 63.
    end else if(cntneq0) begin // cnt != 0
      cnt <= cnt - 1;
    end
  end

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      o_end_valid <= 1'b0;
    end else if(i_flush)begin
      o_end_valid <= 1'b0;
    end else if(cnt == {{(CNT_W-1){1'b0}},1'b1}) begin
      o_end_valid <= 1'b1;
    end else if(i_end_ready) begin
      o_end_valid <= 1'b0;
    end
  end

  // 2. deal input signals://///////////////////////////////////////////////////////////////////
  wire [WIDTH-1:0] i_dividend_wrapper = i_divw ? {{(WIDTH/2){i_dividend[WIDTH/2-1]}}, i_dividend[WIDTH/2-1:0]} : i_dividend;
  wire [WIDTH-1:0] i_divisor_wrapper  = i_divw ? {{(WIDTH/2){i_divisor [WIDTH/2-1]}}, i_divisor [WIDTH/2-1:0]} : i_divisor ;

  wire dividend_positive = i_signed ? ~i_dividend_wrapper[WIDTH-1] : 1;
  wire divisor_positive  = i_signed ? ~i_divisor_wrapper [WIDTH-1] : 1;

  wire [WIDTH-1:0] i_dividend_abs = dividend_positive ? i_dividend_wrapper : ~i_dividend_wrapper + 1'b1;
  wire [WIDTH-1:0] i_divisor_abs  = divisor_positive  ? i_divisor_wrapper  : ~i_divisor_wrapper  + 1'b1;

  // 3. div:///////////////////////////////////////////////////////////////////////////////////
  logic [WIDTH-1  :0] divisor_r;
  logic [2*WIDTH-1:0] dividend , dividend_r , dividend_r_shift ;
  logic [WIDTH-1  :0] quotient , quotient_r ;

  always@(posedge i_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
      dividend_r  <= {2*WIDTH{1'b0}};
      divisor_r   <= {  WIDTH{1'b0}};
      quotient_r  <= {  WIDTH{1'b0}};
    end else if(i_flush) begin
      dividend_r  <= {2*WIDTH{1'b0}};
      divisor_r   <= {  WIDTH{1'b0}};
      quotient_r  <= {  WIDTH{1'b0}};
    end else if(i_start) begin
      dividend_r  <= {{WIDTH{1'b0}}, i_dividend_abs};
      divisor_r   <= i_divisor_abs;
      quotient_r  <= {WIDTH{1'b0}};
    end else if(cntneq0) begin
      dividend_r  <= dividend ;
      quotient_r  <= quotient ;
    end
  end

  logic [WIDTH-1:0] div_sub, mask;
  logic sub_positive, sub_negative;

  assign dividend_r_shift = {dividend_r >> cnt};
  assign {sub_negative,div_sub} = dividend_r_shift[WIDTH:0] - {1'b0,divisor_r};
  assign sub_positive = ~sub_negative;

  assign mask = ~({WIDTH{1'b1}} << cnt); // low bit mask.
  assign dividend = sub_negative ? dividend_r : {{WIDTH{1'b0}}, {(div_sub<<cnt) | (dividend_r[WIDTH-1:0] & mask)}};

  for(genvar i=0; i<WIDTH; i++)begin
    assign quotient[i]  = (i == cnt) ? sub_positive : quotient_r[i];
  end

  // 4. output:
  assign o_quotient  = cntneq0 ? {WIDTH{1'b0}} : (~(dividend_positive^divisor_positive) ? quotient : ~quotient + 1'b1)  ;
  assign o_remainder = cntneq0 ? {WIDTH{1'b0}} : (dividend_positive ? dividend[WIDTH-1:0] : ~dividend[WIDTH-1:0] + 1'b1);

endmodule

module ysyx_040561_lsu (
  input  logic                    i_clk         ,
  input  logic                    i_rst_n       ,
  input  logic                    i_flush       ,

  // 1. axi interface ysyx_040561_to get data from mem:
  ysyx_040561_uni_if.Master       dCacheIf_M    ,

  // 2. signal to pipe shake hands:
  input  logic                    i_pre_valid   ,   // from pre-stage
  output logic                    o_pre_ready   ,   //  to  pre-stage
  output logic                    o_post_valid  ,   //  to  post-stage
  input  logic                    i_post_ready  ,   // from post-stage

  // 3. input comb signal from pre stage:
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]  i_exu_exres   ,
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]  i_exu_rs2     ,
  input  logic  [2:0]             i_exu_lsfunc3 ,
  input  logic                    i_exu_lden    ,
  input  logic                    i_exu_sten    ,
  input  logic                    i_exu_fencei  ,
  input  logic  [`YSYX04561_REG_ADDRW-1:0]  i_exu_rdid    ,
  input  logic                    i_exu_rdwen   ,
  input  logic  [`YSYX04561_CSR_ADDRW-1:0]  i_exu_csrdid  ,
  input  logic                    i_exu_csrdwen , // csr dest write enable.
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]  i_exu_csrd    ,
  input  logic  [`YSYX04561_CPU_WIDTH-1:0]  i_exu_pc      ,
  input  logic                    i_exu_ecall   ,
  input  logic                    i_exu_mret    ,
  input  logic                    i_exu_nop     ,

  // 4. iru signals:
  input  logic                    i_iru_excp    ,
  input  logic                    i_iru_intr    ,

  // 4. clint signals:
  output  logic                   o_clint_ren   ,
  output  logic [`YSYX04561_ADR_WIDTH-1:0]  o_clint_raddr ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_clint_rdata ,
  output  logic                   o_clint_wen   ,
  output  logic [`YSYX04561_ADR_WIDTH-1:0]  o_clint_waddr ,
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_clint_wdata ,

  // 5. output comb signal to post stage:
  output logic  [`YSYX04561_CPU_WIDTH-1:0]  o_lsu_lsres   ,
  output logic  [`YSYX04561_CPU_WIDTH-1:0]  o_lsu_exres   ,
  output logic                    o_lsu_lden    ,
  output logic                    o_lsu_fencei  ,
  output logic  [`YSYX04561_REG_ADDRW-1:0]  o_lsu_rdid    ,
  output logic                    o_lsu_rdwen   ,
  output logic  [`YSYX04561_CSR_ADDRW-1:0]  o_lsu_csrdid  ,
  output logic                    o_lsu_csrdwen , // csr dest write enable.
  output logic  [`YSYX04561_CPU_WIDTH-1:0]  o_lsu_csrd    ,
  output logic  [`YSYX04561_CPU_WIDTH-1:0]  o_lsu_pc      ,
  output logic                    o_lsu_ecall   ,
  output logic                    o_lsu_mret    ,
  output logic                    o_lsu_nop
);

  // 1. shake hands to reg pre stage signals:////////////////////////////////s/////////////////////////////////

  // i_pre_valid --> ⌈‾‾‾‾⌉ --> o_post_valid
  //                 |REG|
  // o_pre_ready <-- ⌊____⌋ <-- i_post_ready

  wire pre_valid_r;
  ysyx_040561_stl_reg #(
    .WIDTH      (1           ), 
    .RESET_VAL  (0           )
  ) postvalid (
    .i_clk      (i_clk       ), 
    .i_rst_n    (i_rst_n     ), 
    .i_wen      (i_flush | o_pre_ready ), 
    .i_din      (i_flush ? 1'b0: i_pre_valid ), 
    .o_dout     (pre_valid_r )
  );

  wire ldst_en, en_axi, exu_fencei_r, pre_sh;
  assign o_post_valid = (exu_fencei_r | ldst_en & en_axi) ? dCacheIf_M.ready : pre_valid_r;
  assign o_pre_ready  = o_post_valid & i_post_ready | !pre_valid_r ;
  assign pre_sh       = i_pre_valid & o_pre_ready;

  logic  [`YSYX04561_CPU_WIDTH-1:0]  exu_exres_r    ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]  exu_rs2_r      ;
  logic  [2:0]             exu_lsfunc3_r  ;
  logic                    exu_lden_r     ;
  logic                    exu_sten_r     ;
  logic  [`YSYX04561_REG_ADDRW-1:0]  exu_rdid_r     ;
  logic                    exu_rdwen_r    ;
  logic  [`YSYX04561_CSR_ADDRW-1:0]  exu_csrdid_r   ;
  logic                    exu_csrdwen_r  ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]  exu_csrd_r     ;
  logic  [`YSYX04561_CPU_WIDTH-1:0]  exu_pc_r       ;
  logic                    exu_ecall_r    ;
  logic                    exu_mret_r     ;
  logic                    exu_nop_r      ;
  
  ysyx_040561_stl_reg #(
    .WIDTH      (4*`YSYX04561_CPU_WIDTH+`YSYX04561_REG_ADDRW+`YSYX04561_CSR_ADDRW+11),
    .RESET_VAL  (0       )
  ) prereg (
    .i_clk      (i_clk   ),
    .i_rst_n    (i_rst_n ),
    .i_wen      (i_flush | pre_sh ),
    .i_din      (i_flush ? 0: {i_exu_exres, i_exu_rs2, i_exu_lsfunc3, i_exu_lden, i_exu_sten, i_exu_rdid, i_exu_rdwen, i_exu_fencei, i_exu_csrdid, i_exu_csrdwen, i_exu_csrd, i_exu_pc, i_exu_ecall, i_exu_mret, i_exu_nop} ),
    .o_dout     (             {exu_exres_r, exu_rs2_r, exu_lsfunc3_r, exu_lden_r, exu_sten_r, exu_rdid_r, exu_rdwen_r, exu_fencei_r, exu_csrdid_r, exu_csrdwen_r, exu_csrd_r, exu_pc_r, exu_ecall_r, exu_mret_r, exu_nop_r} )
  );

  // 2. deal with device :///////////////////////////////////////////////////////////////////////////////////////

  wire load_en, stor_en, en_clint;
  wire [`YSYX04561_ADR_WIDTH-1:0] lsu_addr;

  assign load_en  = pre_valid_r & exu_lden_r;
  assign stor_en  = pre_valid_r & exu_sten_r;
  assign ldst_en  = load_en | stor_en ;
  assign lsu_addr = exu_exres_r[`YSYX04561_ADR_WIDTH-1:0];

  // `YSYX04561_CLINT_BASE_ADDR == 32'h02000000, `YSYX04561_CLINT_END_ADDR == 32'h0200ffff
  assign en_clint = (lsu_addr & {{(`YSYX04561_ADR_WIDTH-16){1'b1}},16'b0}) == `YSYX04561_CLINT_BASE_ADDR;
  assign en_axi   = !en_clint;

  // 3. deal with clint :///////////////////////////////////////////////////////////////////////////////////////

  assign o_clint_ren    = en_clint & load_en;
  assign o_clint_raddr  = lsu_addr  ;

  assign o_clint_wen    = en_clint & stor_en;
  assign o_clint_waddr  = lsu_addr  ;
  assign o_clint_wdata  = exu_rs2_r ;

  // 4. use interface to read/write, generate valid signals for post stage:////////////////////////////////////

  assign dCacheIf_M.valid  = (exu_fencei_r | en_axi & ldst_en) & ~(i_iru_excp | i_iru_intr);
  assign dCacheIf_M.reqtyp = stor_en           ;
  assign dCacheIf_M.addr   = lsu_addr          ;
  assign dCacheIf_M.wdata  = exu_rs2_r         ;
  assign dCacheIf_M.size   = exu_lsfunc3_r[1:0];

  logic [`YSYX04561_CPU_WIDTH-1:0] dCache_rdata;
  
  ysyx_040561_stl_mux_default #(7, 3, `YSYX04561_CPU_WIDTH) mux_rdata (dCache_rdata, exu_lsfunc3_r, `YSYX04561_CPU_WIDTH'b0, {
    `YSYX04561_FUNC3_LB_SB, {{56{dCacheIf_M.rdata[ 7]}}, dCacheIf_M.rdata[ 7:0]},
    `YSYX04561_FUNC3_LH_SH, {{48{dCacheIf_M.rdata[15]}}, dCacheIf_M.rdata[15:0]},
    `YSYX04561_FUNC3_LW_SW, {{32{dCacheIf_M.rdata[31]}}, dCacheIf_M.rdata[31:0]},
    `YSYX04561_FUNC3_LD_SD, dCacheIf_M.rdata                                    ,
    `YSYX04561_FUNC3_LBU  , {56'b0, dCacheIf_M.rdata[ 7:0]}                     ,
    `YSYX04561_FUNC3_LHU  , {48'b0, dCacheIf_M.rdata[15:0]}                     ,
    `YSYX04561_FUNC3_LWU  , {32'b0, dCacheIf_M.rdata[31:0]}                     
  });

  // 5. use pre stage signals to generate comb logic for post stage://////////////////////////////////////////

  assign o_lsu_lsres   = en_clint ? i_clint_rdata : dCache_rdata;
  assign o_lsu_exres   = exu_exres_r  ;
  assign o_lsu_lden    = exu_lden_r   ;
  assign o_lsu_fencei  = exu_fencei_r ;
  assign o_lsu_rdid    = exu_rdid_r   ;
  assign o_lsu_rdwen   = exu_rdwen_r  & pre_valid_r; // &pre_valid_r is used for bypass, to indicate lsu is valid.
  assign o_lsu_csrdid  = exu_csrdid_r ;
  assign o_lsu_csrdwen = exu_csrdwen_r& pre_valid_r; // &pre_valid_r is used for bypass, to indicate lsu is valid.
  assign o_lsu_csrd    = exu_csrd_r   ;
  assign o_lsu_pc      = exu_pc_r     ;
  assign o_lsu_ecall   = exu_ecall_r  ;
  assign o_lsu_mret    = exu_mret_r   ;
  assign o_lsu_nop     = exu_nop_r    ;

endmodule

module ysyx_040561_wbu (
  // 1. signal to pipe shake hands:
  input   logic                   i_clk         ,
  input   logic                   i_rst_n       ,
  input  logic                    i_flush       ,
  input   logic                   i_pre_valid   ,   // from pre-stage
  output  logic                   o_pre_ready   ,   //  to  pre-stage
  output  logic                   o_post_valid  ,   //  to  post-stage
  input   logic                   i_post_ready  ,   // from post-stage
  
  // 2. input comb signal from pre stage:
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_lsu_exres   ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_lsu_lsres   ,
  input   logic                   i_lsu_lden    ,
  input   logic [`YSYX04561_REG_ADDRW-1:0]  i_lsu_rdid    ,
  input   logic                   i_lsu_rdwen   ,
  input   logic [`YSYX04561_CSR_ADDRW-1:0]  i_lsu_csrdid  ,
  input   logic                   i_lsu_csrdwen ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_lsu_csrd    ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_lsu_pc      ,
  input  logic                    i_lsu_ecall   ,
  input  logic                    i_lsu_mret    ,
  input   logic                   i_lsu_nop     ,
  input   logic                   i_iru_intr    ,

  // 3. output comb signal to post stage:
  output  logic [`YSYX04561_REG_ADDRW-1:0]  o_wbu_rdid    ,
  output  logic                   o_wbu_rdwen   ,
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_wbu_rd      ,

  output  logic [`YSYX04561_CSR_ADDRW-1:0]  o_wbu_csrdid  ,
  output  logic                   o_wbu_csrdwen ,
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_wbu_csrd    ,
  
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_wbu_pc      ,
  output logic                    o_wbu_ecall   ,
  output logic                    o_wbu_mret    ,
  output  logic                   o_wbu_nop
);

  // 1. shake hands to reg pre stage signals:///////////////////////////////////////////////////////////////////

  // i_pre_valid --> ⌈‾‾‾‾⌉ --> o_post_valid
  //                 |REG|
  // o_pre_ready <-- ⌊____⌋ <-- i_post_ready

  assign o_pre_ready = o_post_valid & i_post_ready | !o_post_valid;

  wire pre_sh,commit;

  assign pre_sh = i_pre_valid & o_pre_ready;
  assign commit = !i_iru_intr & (o_post_valid & i_post_ready);

  logic [`YSYX04561_CPU_WIDTH-1:0]  lsu_exres_r  ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  lsu_lsres_r  ;
  logic                   lsu_lden_r   ;
  logic [`YSYX04561_REG_ADDRW-1:0]  lsu_rdid_r   ;
  logic                   lsu_rdwen_r  ;
  logic [`YSYX04561_CSR_ADDRW-1:0]  lsu_csrdid_r ;
  logic                   lsu_csrdwen_r;
  logic [`YSYX04561_CPU_WIDTH-1:0]  lsu_csrd_r   ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  lsu_pc_r     ;
  logic                   lsu_ecall_r  ;
  logic                   lsu_mret_r   ;
  logic                   lsu_nop_r    ;

  ysyx_040561_stl_reg #(
    .WIDTH      (4*`YSYX04561_CPU_WIDTH+`YSYX04561_REG_ADDRW+`YSYX04561_CSR_ADDRW+6),
    .RESET_VAL  (0       )
  ) regs(
    .i_clk      (i_clk   ),
    .i_rst_n    (i_rst_n ),
    .i_wen      (i_flush | pre_sh ),
    .i_din      (i_flush ? 0 : {i_lsu_exres, i_lsu_lsres, i_lsu_lden, i_lsu_rdid, i_lsu_rdwen, i_lsu_csrdid, i_lsu_csrdwen, i_lsu_csrd, i_lsu_pc, i_lsu_ecall, i_lsu_mret, i_lsu_nop} ),
    .o_dout     (              {lsu_exres_r, lsu_lsres_r, lsu_lden_r, lsu_rdid_r, lsu_rdwen_r, lsu_csrdid_r, lsu_csrdwen_r, lsu_csrd_r, lsu_pc_r, lsu_ecall_r, lsu_mret_r, lsu_nop_r} )
  );

  // 2. generate valid signals for post stage://////////////////////////////////////////////////////////////////

  ysyx_040561_stl_reg #(
    .WIDTH      (1            ), 
    .RESET_VAL  (0            )
  ) postvalid (
    .i_clk      (i_clk        ), 
    .i_rst_n    (i_rst_n      ), 
    .i_wen      (i_flush | o_pre_ready  ), 
    .i_din      (i_flush ? 1'b0: i_pre_valid  ), 
    .o_dout     (o_post_valid )
  );

  // 4. use pre stage signals to generate comb logic for post stage://////////////////////////////////////////
  
  assign o_wbu_rdid    = lsu_rdid_r   ;
  assign o_wbu_rdwen   = commit & lsu_rdwen_r;
  assign o_wbu_rd      = lsu_lden_r ? lsu_lsres_r : lsu_exres_r;
  assign o_wbu_csrdid  = lsu_csrdid_r ;
  assign o_wbu_csrdwen = commit & lsu_csrdwen_r;
  assign o_wbu_csrd    = lsu_csrd_r   ;
  assign o_wbu_pc      = lsu_pc_r     ;
  assign o_wbu_ecall   = lsu_ecall_r  ;
  assign o_wbu_mret    = lsu_mret_r   ;
  assign o_wbu_nop     = lsu_nop_r    ;

endmodule

module ysyx_040561_iru (
  // wbu:
  input   logic                   i_wbu_valid   ,
  input   logic                   i_wbu_ready   ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_wbu_pc      ,
  input   logic                   i_wbu_ecall   ,
  input   logic                   i_wbu_mret    ,
  input   logic                   i_wbu_nop     ,

  // for bru:
  output  logic                   o_iru_excp   ,
  output  logic                   o_iru_intr   ,
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_iru_pc     ,

  // csr_file:
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_mie          ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_mip          ,
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_mtvec        ,  // ecall.
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_mepc         ,  // mret.
  input   logic [`YSYX04561_CPU_WIDTH-1:0]  i_mstatus      ,  // ecall.
  output  logic                   o_mepc_wen     ,  // ecall.
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_mepc_wdata   ,  // ecall.
  output  logic                   o_mcause_wen   ,  // ecall.
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_mcause_wdata ,  // ecall.
  output  logic                   o_mstatus_wen  ,  // ecall.
  output  logic [`YSYX04561_CPU_WIDTH-1:0]  o_mstatus_wdata   // ecall.
);

  // i_wbu_valid & (!i_wbu_nop) is used for waitting next correct pc!
  wire timer = i_wbu_valid & (!i_wbu_nop) & i_mip[`YSYX04561_M_MIP_MTIP] & i_mstatus[`YSYX04561_M_STATUS_MIE] & i_mie[`YSYX04561_M_MIE_MTIE]; // timer irq pending.

  assign o_iru_excp = i_wbu_ecall | i_wbu_mret;  // trap.
  assign o_iru_intr = timer;                     // interrupt.

  assign o_iru_pc = (i_wbu_ecall | timer) ? i_mtvec : (i_wbu_mret ? i_mepc : `YSYX04561_CPU_WIDTH'b0);

  assign o_mepc_wen = i_wbu_ready & (timer | i_wbu_ecall);
  assign o_mepc_wdata = i_wbu_pc;

  assign o_mcause_wen = i_wbu_ready & (timer | i_wbu_ecall);
  assign o_mcause_wdata = timer ? `YSYX04561_IRQ_TIMER : (i_wbu_ecall ? `YSYX04561_IRQ_ECALL : `YSYX04561_CPU_WIDTH'b0);

  assign o_mstatus_wen = i_wbu_ready & (o_iru_excp | o_iru_intr);

  logic [`YSYX04561_CPU_WIDTH-1:0] ecall_intr_mstatus_wdata;
  assign ecall_intr_mstatus_wdata[63:13]          = i_mstatus[63:13];
  assign ecall_intr_mstatus_wdata[`YSYX04561_M_STATUS_MPP]  = `YSYX04561_M_MODE;
  assign ecall_intr_mstatus_wdata[10:8]           = i_mstatus[10:8];
  assign ecall_intr_mstatus_wdata[`YSYX04561_M_STATUS_MPIE] = i_mstatus[`YSYX04561_M_STATUS_MIE];
  assign ecall_intr_mstatus_wdata[6:4]            = i_mstatus[6:4];
  assign ecall_intr_mstatus_wdata[`YSYX04561_M_STATUS_MIE]  = 1'b0;
  assign ecall_intr_mstatus_wdata[2:0]            = i_mstatus[2:0];

  logic [`YSYX04561_CPU_WIDTH-1:0] mret_mstatus_wdata;
  assign mret_mstatus_wdata[63:13]          = i_mstatus[63:13];
  assign mret_mstatus_wdata[`YSYX04561_M_STATUS_MPP]  = 2'b0;
  assign mret_mstatus_wdata[10:8]           = i_mstatus[10:8];
  assign mret_mstatus_wdata[`YSYX04561_M_STATUS_MPIE] = 1'b1;
  assign mret_mstatus_wdata[6:4]            = i_mstatus[6:4];
  assign mret_mstatus_wdata[`YSYX04561_M_STATUS_MIE]  = i_mstatus[`YSYX04561_M_STATUS_MPIE];
  assign mret_mstatus_wdata[2:0]            = i_mstatus[2:0];

  assign o_mstatus_wdata =  o_iru_intr | i_wbu_ecall  ? ecall_intr_mstatus_wdata :
                            (  i_wbu_mret    ? mret_mstatus_wdata  : `YSYX04561_CPU_WIDTH'b0);

endmodule


module ysyx_040561_clint (
  input logic                   i_clk         ,
  input logic                   i_rst_n       ,

  // from cpu lsu:
  input  logic                  i_clint_ren   ,
  input  logic [`YSYX04561_ADR_WIDTH-1:0] i_clint_raddr ,
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_clint_rdata ,
  input  logic                  i_clint_wen   ,
  input  logic [`YSYX04561_ADR_WIDTH-1:0] i_clint_waddr ,
  input  logic [`YSYX04561_CPU_WIDTH-1:0] i_clint_wdata ,
  
  // to csr_file:
  output logic                  o_clint_mtip
);

  reg [63:0] mtime, mtimecmp; // for both 32bit/64bit arch.

  // read:
  wire ren_mtimecmp, ren_mtime;
  assign ren_mtimecmp = i_clint_ren & (i_clint_raddr == `YSYX04561_MTIMECMP_ADDR);
  assign ren_mtime    = i_clint_ren & (i_clint_raddr == `YSYX04561_MTIME_ADDR   );
  assign o_clint_rdata = ren_mtime ? mtime : (ren_mtimecmp ? mtimecmp : 64'b0);

  // write:
  wire lsu_wen_mtime, cnt_wen_mtime, wen_mtimecmp, wen_mtime;
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mtimecmp, wdata_mtime;

  assign wen_mtimecmp   = i_clint_wen & (i_clint_waddr == `YSYX04561_MTIMECMP_ADDR);
  assign wdata_mtimecmp = i_clint_wdata;

  assign lsu_wen_mtime  = i_clint_wen & (i_clint_waddr == `YSYX04561_MTIME_ADDR   );
  assign cnt_wen_mtime  = !o_clint_mtip;
  assign wen_mtime      = lsu_wen_mtime | cnt_wen_mtime;
  assign wdata_mtime    = lsu_wen_mtime ? i_clint_wdata : (mtime + 1);

  ysyx_040561_stl_reg #(
    .WIDTH     (64    ),
    .RESET_VAL (64'b0 )
  ) reg_mtime (
    .i_clk     (i_clk         ),
    .i_rst_n   (i_rst_n       ),
    .i_wen     (wen_mtime     ),
    .i_din     (wdata_mtime   ),
    .o_dout    (mtime         )
  );

  ysyx_040561_stl_reg #(
    .WIDTH     (64    ),
    .RESET_VAL (64'b0 )
  ) reg_mtimcmp (
    .i_clk     (i_clk         ),
    .i_rst_n   (i_rst_n       ),
    .i_wen     (wen_mtimecmp  ),
    .i_din     (wdata_mtimecmp),
    .o_dout    (mtimecmp      )
  );

  assign o_clint_mtip = (mtime >= mtimecmp);

endmodule


module ysyx_040561_bru (
  input                         i_clk         ,
  input                         i_rst_n       ,
  input                         i_idu_valid   , // use for jalr, to fix bug with: jalr x[n],x[n],imm
  input     [`YSYX04561_REG_ADDRW-1:0]    i_idu_rs1id   , // use for jalr, to fix bug with: jalr x[n],x[n],imm
  input     [`YSYX04561_REG_ADDRW-1:0]    i_exu_rdid    , // use for jalr, to fix bug with: jalr x[n],x[n],imm
  input                         i_jal         ,
  input                         i_jalr        ,
  input                         i_brch        ,
  input     [2:0]               i_bfun3       ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_rs1         ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_rs2         ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_imm         ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_ifupc       ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_idupc       ,
  input                         i_iru_jump    ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_iru_pc      ,
  input                         i_fence_jump  ,
  input     [`YSYX04561_CPU_WIDTH-1:0]    i_fence_pc    ,
  output    [`YSYX04561_CPU_WIDTH-1:0]    o_next_pc     ,
  output                        o_ifid_nop
);

  // 0. use reg to save rs1 for alr x[n],x[n],imm. means rs1id == rdid:
  logic [`YSYX04561_CPU_WIDTH-1:0] i_rs1_r, rs1;

  wire jalr_rs1id_eq_rdid = i_jalr & (i_exu_rdid == i_idu_rs1id);

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) jalr_save (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (i_idu_valid & jalr_rs1id_eq_rdid ),
    .i_din    (i_rs1        ),
    .o_dout   (i_rs1_r      )
  );

  assign rs1 = (!i_idu_valid & jalr_rs1id_eq_rdid) ? i_rs1_r : i_rs1;

  // 1. generate bjump: ///////////////////////////////////////////////
  logic bjump, supersub_resbit;
  logic [`YSYX04561_CPU_WIDTH-1:0] sub_res, no_use;

  assign sub_res = i_rs1 - i_rs2;
  assign {supersub_resbit, no_use} = {1'b0,i_rs1} - {1'b0,i_rs2};

  ysyx_040561_stl_mux_default #(6,3,1) mux_branch (bjump, i_bfun3, 1'b0, {
    `YSYX04561_FUNC3_BEQ ,   ~(|sub_res)           ,
    `YSYX04561_FUNC3_BNE ,    (|sub_res)           ,
    `YSYX04561_FUNC3_BLT ,    sub_res[`YSYX04561_CPU_WIDTH-1],
    `YSYX04561_FUNC3_BGE ,   ~sub_res[`YSYX04561_CPU_WIDTH-1],
    `YSYX04561_FUNC3_BLTU,    supersub_resbit      ,
    `YSYX04561_FUNC3_BGEU,   ~supersub_resbit
  });

  wire jump = (i_brch ? bjump : 1'b0) ||  i_jal || i_jalr;

  // 2. set next_pc:///////////////////////////////////////////////
  logic [`YSYX04561_CPU_WIDTH-1:0] seq_pc, jump_pc;

  assign seq_pc  = i_ifupc + 4;
  assign jump_pc = i_jalr ? (rs1 + i_imm) : (i_idupc + i_imm);  //means 1 for jalr , 0 for jal || bjump.
  assign o_next_pc = i_iru_jump ? i_iru_pc :(i_fence_jump ? i_fence_pc : (jump ? jump_pc : seq_pc));
  assign o_ifid_nop = jump;

  // 3. update pc in ifu - pipe_pc_if, use next_pc to update pc.

endmodule

module ysyx_040561_regfile (
  input                         i_clk   ,
  input                         i_rst_n ,

  // from wbu:
  input                         i_wen   ,
  input        [`YSYX04561_REG_ADDRW-1:0] i_waddr ,
  input        [`YSYX04561_CPU_WIDTH-1:0] i_wdata ,

  // from idu:
  input        [`YSYX04561_REG_ADDRW-1:0] i_raddr1,
  input        [`YSYX04561_REG_ADDRW-1:0] i_raddr2,
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_rdata1,
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_rdata2
);

  logic [`YSYX04561_CPU_WIDTH-1:0] rf [`YSYX04561_REG_COUNT-1:0];
  logic [`YSYX04561_REG_COUNT-1:1] rfwen;

  assign rf[0] = `YSYX04561_CPU_WIDTH'b0; // x[0] connect to GND.

  generate                      // x[1]-x[31]:
    for(genvar i=1; i<`YSYX04561_REG_COUNT; i=i+1 )begin: regfile
      assign rfwen[i] = i_wen && i_waddr == i;
      ysyx_040561_stl_reg #(
        .WIDTH     (`YSYX04561_CPU_WIDTH   ),
        .RESET_VAL (`YSYX04561_CPU_WIDTH'b0)
      ) u_stl_reg (
        .i_clk   (i_clk   ),
        .i_rst_n (i_rst_n ),
        .i_wen   (rfwen[i]),
        .i_din   (i_wdata ),
        .o_dout  (rf[i]   )
      );
    end
  endgenerate

  assign o_rdata1 = rf[i_raddr1];
  assign o_rdata2 = rf[i_raddr2];

endmodule

module ysyx_040561_bypass (
  input                            i_clk         ,
  input                            i_rst_n       ,

  // 1. from exu/lsu/wbu to generate rs1/rs2 for idu:
  // from idu:
  input         [`YSYX04561_REG_ADDRW-1:0]   i_idu_rs1id   ,
  input         [`YSYX04561_REG_ADDRW-1:0]   i_idu_rs2id   ,
  // from exu:
  input                            i_exu_lden    ,
  input                            i_exu_rdwen   ,
  input         [`YSYX04561_REG_ADDRW-1:0]   i_exu_rdid    ,
  input         [`YSYX04561_CPU_WIDTH-1:0]   i_exu_exres   ,
  // from lsu:
  input                            i_lsu_lden    ,
  input                            i_lsu_rdwen   ,
  input         [`YSYX04561_REG_ADDRW-1:0]   i_lsu_rdid    ,
  input         [`YSYX04561_CPU_WIDTH-1:0]   i_lsu_exres   ,
  input         [`YSYX04561_CPU_WIDTH-1:0]   i_lsu_lsres   ,
  // from wbu:
  input                            i_wbu_rdwen   ,
  input         [`YSYX04561_REG_ADDRW-1:0]   i_wbu_rdid    ,
  input         [`YSYX04561_CPU_WIDTH-1:0]   i_wbu_rd      ,
  // to id/ex:
  output logic  [`YSYX04561_CPU_WIDTH-1:0]   o_idu_rs1     ,
  output logic  [`YSYX04561_CPU_WIDTH-1:0]   o_idu_rs2     ,
  // to pc if/id id/ex:
  output                           o_idex_nop    ,
  output                           o_ifid_stall
);

  // 1. from exu/lsu/wbu to generate rs1/rs2 for idu: /////////////////////////////////////////////////////
  
  logic [`YSYX04561_CPU_WIDTH-1:0] regfile_rs1,regfile_rs2;

  ysyx_040561_regfile u_regfile(
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (i_wbu_rdwen  ),
    .i_waddr  (i_wbu_rdid   ),
    .i_wdata  (i_wbu_rd     ),
    .i_raddr1 (i_idu_rs1id  ),
    .i_raddr2 (i_idu_rs2id  ),
    .o_rdata1 (regfile_rs1  ),
    .o_rdata2 (regfile_rs2  )
  );

  always @(*) begin // 存在优先级!!
    if(!i_exu_lden && i_exu_rdwen && (i_exu_rdid == i_idu_rs1id))begin
      o_idu_rs1 = i_exu_exres;
    end else if(i_lsu_rdwen && (i_lsu_rdid == i_idu_rs1id))begin
      o_idu_rs1 = i_lsu_lden ? i_lsu_lsres : i_lsu_exres;
    end else if(i_wbu_rdwen && (i_wbu_rdid == i_idu_rs1id))begin
      o_idu_rs1 = i_wbu_rd;
    end else begin
      o_idu_rs1 = regfile_rs1;
    end
  end

  always @(*) begin // 存在优先级!!
    if(!i_exu_lden && i_exu_rdwen && (i_exu_rdid == i_idu_rs2id))begin
      o_idu_rs2 = i_exu_exres;
    end else if(i_lsu_rdwen && (i_lsu_rdid == i_idu_rs2id))begin
      o_idu_rs2 = i_lsu_lden ? i_lsu_lsres : i_lsu_exres;
    end else if(i_wbu_rdwen && (i_wbu_rdid == i_idu_rs2id))begin
      o_idu_rs2 = i_wbu_rd;
    end else begin
      o_idu_rs2 = regfile_rs2;
    end
  end

  assign o_idex_nop =  i_exu_lden && i_exu_rdwen && ( i_exu_rdid == i_idu_rs1id || i_exu_rdid == i_idu_rs2id );
  assign o_ifid_stall = o_idex_nop;

endmodule


module ysyx_040561_csrfile (
  input logic                   i_clk   ,
  input logic                   i_rst_n ,

  // from idu, for csrrw/csrrs/csrrc:
  input  logic                  i_ren   , 
  input  logic [`YSYX04561_CSR_ADDRW-1:0] i_raddr ,
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_rdata ,

  // from wbu, for csrrw/csrrs/csrrc:
  input  logic                  i_wen   ,
  input  logic [`YSYX04561_CSR_ADDRW-1:0] i_waddr ,
  input  logic [`YSYX04561_CPU_WIDTH-1:0] i_wdata ,

  // connect excp/intr:
  input  logic                  i_mepc_wen      ,   // ecall / iru.
  input  logic [`YSYX04561_CPU_WIDTH-1:0] i_mepc_wdata    ,   // ecall / iru.
  input  logic                  i_mcause_wen    ,   // ecall / iru.
  input  logic [`YSYX04561_CPU_WIDTH-1:0] i_mcause_wdata  ,   // ecall / iru.
  input  logic                  i_mstatus_wen   ,   // ecall / iru.
  input  logic [`YSYX04561_CPU_WIDTH-1:0] i_mstatus_wdata ,   // ecall / iru.
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_mtvec         ,   // ecall / iru.
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_mstatus       ,   // ecall / iru.
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_mepc          ,   // mret.
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_mip           ,
  output logic [`YSYX04561_CPU_WIDTH-1:0] o_mie           ,

  // connect clint:
  input  logic                  i_clint_mtip
);

  // 1. csr reg file: //////////////////////////////////////////////////////////////////
  logic [`YSYX04561_CPU_WIDTH-1:0] mepc     ; // Machine exception program counter
  logic [`YSYX04561_CPU_WIDTH-1:0] mtvec    ; // Machine trap-handler base address
  logic [`YSYX04561_CPU_WIDTH-1:0] mcause   ; // Machine trap cause
  logic [`YSYX04561_CPU_WIDTH-1:0] mstatus  ; // Machine status register
  logic [`YSYX04561_CPU_WIDTH-1:0] mcycle   ; // Machine cycle.
  logic [`YSYX04561_CPU_WIDTH-1:0] mie      ; // Machine interrupt eanble reg
  logic [`YSYX04561_CPU_WIDTH-1:0] mip      ; // Machine interrupt pending reg
  logic [`YSYX04561_CPU_WIDTH-1:0] mscratch ; // Scratch register for machine trap handlers.

  // 2. read csr  reg file: ////////////////////////////////////////////////////////////
  wire ren_mepc     = i_ren & (i_raddr == `YSYX04561_ADDR_MEPC     );
  wire ren_mtvec    = i_ren & (i_raddr == `YSYX04561_ADDR_MTVEC    );
  wire ren_mcause   = i_ren & (i_raddr == `YSYX04561_ADDR_MCAUSE   );
  wire ren_mstatus  = i_ren & (i_raddr == `YSYX04561_ADDR_MSTATUS  );
  wire ren_mcycle   = i_ren & (i_raddr == `YSYX04561_ADDR_MCYCLE   );
  wire ren_mie      = i_ren & (i_raddr == `YSYX04561_ADDR_MIE      );
  wire ren_mip      = i_ren & (i_raddr == `YSYX04561_ADDR_MIP      );
  wire ren_mscratch = i_ren & (i_raddr == `YSYX04561_ADDR_MSCRATCH );

  assign o_rdata =  ren_mepc     ? mepc     : 
                  ( ren_mtvec    ? mtvec    : 
                  ( ren_mcause   ? mcause   : 
                  ( ren_mstatus  ? mstatus  : 
                  ( ren_mcycle   ? mcycle   : 
                  ( ren_mie      ? mie      :
                  ( ren_mip      ? mip      : 
                  ( ren_mscratch ? mscratch : `YSYX04561_CPU_WIDTH'b0 )))))));

  assign o_mtvec   = mtvec    ;
  assign o_mepc    = mepc     ;
  assign o_mstatus = mstatus  ;
  assign o_mie     = mie      ;
  assign o_mip     = mip      ;

  // 3. write csr  reg file: ////////////////////////////////////////////////////////////
  // 3.1 mepc: //////////////////////////////////////////////////////////////////////////
  wire wen_mepc = (i_wen & (i_waddr == `YSYX04561_ADDR_MEPC)) | i_mepc_wen ;
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mepc  = i_mepc_wen  ? i_mepc_wdata : i_wdata;
  
  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) reg_mepc (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (wen_mepc     ),
    .i_din    (wdata_mepc   ),
    .o_dout   (mepc         )
  );

  // 3.2 mcause: //////////////////////////////////////////////////////////////////////////
  wire wen_mcause = (i_wen & (i_waddr == `YSYX04561_ADDR_MCAUSE )) | i_mcause_wen ;
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mcause = i_mcause_wen ? i_mcause_wdata : i_wdata;

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) reg_mcause (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (wen_mcause   ),
    .i_din    (wdata_mcause ),
    .o_dout   (mcause       )
  );

  // 3.3 mtvec: //////////////////////////////////////////////////////////////////////////
  wire wen_mtvec = (i_wen & (i_waddr == `YSYX04561_ADDR_MTVEC));
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mtvec = i_wdata;

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) reg_mtvec (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (wen_mtvec    ),
    .i_din    (wdata_mtvec  ),
    .o_dout   (mtvec        )
  );

  // 3.4 mstatus: //////////////////////////////////////////////////////////////////////////
  wire wen_mstatus = (i_wen & (i_waddr == `YSYX04561_ADDR_MSTATUS)) | i_mstatus_wen;
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mstatus = i_mstatus_wen ? i_mstatus_wdata : i_wdata;

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) reg_mstatus (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (wen_mstatus  ),
    .i_din    (wdata_mstatus),
    .o_dout   (mstatus      )
  );

  // 3.5 mcycle: //////////////////////////////////////////////////////////////////////////
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mcycle = (i_wen & (i_waddr == `YSYX04561_ADDR_MCYCLE)) ? i_wdata : mcycle+1;

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) reg_mcycle (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (1'b1         ),
    .i_din    (wdata_mcycle ),
    .o_dout   (mcycle       )
  );

  // 3.6 mie: //////////////////////////////////////////////////////////////////////////
  wire wen_mie = (i_wen & (i_waddr == `YSYX04561_ADDR_MIE));
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mie = i_wdata;

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH   ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0)
  ) reg_mie (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (wen_mie      ),
    .i_din    (wdata_mie    ),
    .o_dout   (mie          )
  );

  // 3.7 mip: //////////////////////////////////////////////////////////////////////////
  assign mip[`YSYX04561_M_MIP_MTIP] = i_clint_mtip;

  wire wen_mip = (i_wen & (i_waddr == `YSYX04561_ADDR_MIP )) ;
  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH-1 ),
    .RESET_VAL(0)
  ) reg_mip (
    .i_clk    (i_clk        ),
    .i_rst_n  (i_rst_n      ),
    .i_wen    (wen_mip      ),
    .i_din    ({i_wdata[`YSYX04561_CPU_WIDTH-1:`YSYX04561_M_MIP_MTIP+1], i_wdata[`YSYX04561_M_MIP_MTIP-1:0]}),
    .o_dout   ({    mip[`YSYX04561_CPU_WIDTH-1:`YSYX04561_M_MIP_MTIP+1],     mip[`YSYX04561_M_MIP_MTIP-1:0]})
  );

  // 3.8 mscratch: //////////////////////////////////////////////////////////////////////////
  wire wen_mscratch = (i_wen & (i_waddr == `YSYX04561_ADDR_MSCRATCH));
  wire [`YSYX04561_CPU_WIDTH-1:0] wdata_mscratch = i_wdata;

  ysyx_040561_stl_reg #(
    .WIDTH    (`YSYX04561_CPU_WIDTH     ),
    .RESET_VAL(`YSYX04561_CPU_WIDTH'b0  )
  ) reg_mscratch (
    .i_clk    (i_clk          ),
    .i_rst_n  (i_rst_n        ),
    .i_wen    (wen_mscratch   ),
    .i_din    (wdata_mscratch ),
    .o_dout   (mscratch       )
  );

endmodule

module ysyx_040561_data_ary(
  input                       i_clk   ,
  input                       i_rst_n ,
  input                       i_ren   ,
  input                       i_wen   ,
  input   [ 15:0]             i_wstrb ,
  input   [  6:0]             i_addr  , // 7 bit, 128 depth.
  input   [127:0]             i_wdata ,
  output  [127:0]             o_rdata ,
  ysyx_040561_sram_if.Master  SramIf_M[1:0]
);

  // 1. control signals:///////////////////////////////////////////////////////////////////
  logic [1:0] wen_exten, ren_exten;

  assign wen_exten = {i_addr[6], ~i_addr[6]} & {2{i_wen}};
  assign ren_exten = {i_addr[6], ~i_addr[6]} & {2{i_ren}};

  logic [127:0] wmask;

  for (genvar i=0; i<16 ; i=i+1 ) begin
    assign wmask[8*i+7 : 8*i] = {8{~i_wstrb[i]}};
  end

  // 2. change sinals to SramIf_M: ////////////////////////////////////////////////////////

  for(genvar i=0; i<2; i++)begin
    assign SramIf_M[i].addr  = i_addr[5:0]    ;
    assign SramIf_M[i].cen   = ~{ren_exten[i] | wen_exten[i]};
    assign SramIf_M[i].wen   = ~ wen_exten[i] ;
    assign SramIf_M[i].wmask =   wmask        ;
    assign SramIf_M[i].wdata = i_wdata        ;
  end

  // 3. get rdata://///////////////////////////////////////////////////////////////////////

  logic [1:0] ren_exten_r;

  ysyx_040561_stl_reg #(
    .WIDTH      (2          ), 
    .RESET_VAL  (2'b00      )
  ) reg_ren (
    .i_clk      (i_clk      ), 
    .i_rst_n    (i_rst_n    ), 
    .i_wen      (1'b1       ), 
    .i_din      (ren_exten  ), 
    .o_dout     (ren_exten_r)
  );

  assign o_rdata = ren_exten_r[1] ? SramIf_M[1].rdata : (ren_exten_r[0] ? SramIf_M[0].rdata : 128'b0);

endmodule

module ysyx_040561_iCache_tag_ary#(
  DATA_WIDTH = 64
)(
  input                         i_clk     ,
  input                         i_rst_n   ,
  input                         i_invalid ,
  input                         i_wen     ,
  input       [  6:0]           i_addr    , // 7 bit, 128 depth.
  input       [DATA_WIDTH-1:0]  i_din     ,
  output      [DATA_WIDTH-1:0]  o_dout
);

  logic [DATA_WIDTH-1:0] tag_array [127:0];
  logic [DATA_WIDTH-1:0] wdata     [127:0];
  logic [127:0] wen;

  for (genvar i=0; i<128; i=i+1) begin
    assign wen  [i]           = i_invalid | (i_wen & (i_addr == i));
    assign wdata[i][`YSYX04561_VLD_BIT] = i_invalid ? 1'b0                   : i_din[`YSYX04561_VLD_BIT];
    assign wdata[i][`YSYX04561_TAG_BIT] = i_invalid ? tag_array[i][`YSYX04561_TAG_BIT] : i_din[`YSYX04561_TAG_BIT];

    ysyx_040561_stl_reg #(
      .WIDTH      (DATA_WIDTH   ),
      .RESET_VAL  (0            )
    ) u_reg (
      .i_clk      (i_clk        ),
      .i_rst_n    (i_rst_n      ),
      .i_wen      (wen[i]       ),
      .i_din      (wdata[i]     ),
      .o_dout     (tag_array[i] )
    );
  end

  assign o_dout = tag_array[i_addr];

endmodule

module ysyx_040561_dCache_tag_ary#(
  DATA_WIDTH = 64
)(
  input                         i_clk  ,
  input                         i_rst_n,
  input                         i_wen  ,
  input       [  6:0]           i_addr , // 7 bit, 128 depth.
  input       [DATA_WIDTH-1:0]  i_din  ,
  output      [DATA_WIDTH-1:0]  o_dout
);

  logic [DATA_WIDTH-1:0] tag_array [127:0];
  logic [127:0] wen;

  for (genvar i=0; i<128; i=i+1) begin
    assign wen[i] = i_wen & (i_addr == i);
    ysyx_040561_stl_reg #(
      .WIDTH      (DATA_WIDTH   ),
      .RESET_VAL  (0            )
    ) u_reg (
      .i_clk      (i_clk        ),
      .i_rst_n    (i_rst_n      ),
      .i_wen      (wen[i]       ),
      .i_din      (i_din        ),
      .o_dout     (tag_array[i] )
    );
  end

  assign o_dout = tag_array[i_addr];

endmodule


module ysyx_040561_dCache_wrapper (
  input                       i_clk       ,
  input                       i_rst_n     ,
  input                       i_clean     ,
  ysyx_040561_uni_if.Slave    dCacheIf_S  ,  //  64 bit width
  ysyx_040561_uni_if.Master   dMemIf_M    ,  // 128 bit width
  ysyx_040561_sram_if.Master  dSramIf_M [3:0]
);

/*    device                    address
      reserve             0x0000_0000~0x01ff_ffff
       CLINT              0x0200_0000~0x0200_ffff
      reserve             0x0201_0000~0x0fff_ffff
     UART16550            0x1000_0000~0x1000_0fff
    SPI controller        0x1000_1000~0x1000_1fff
        SPI	              0x1000_1000~0x1000_1fff
        VGA	              0x1000_2000~0x1000_2fff
        PS2	              0x1000_3000~0x1000_3fff
      Ethernet	          0x1000_4000~0x1000_4fff
      Reserve	            0x1000_5000~0x2fff_ffff
  SPI-flash XIP mode      0x3000_0000~0x3fff_ffff
    ChipLink MMIO         0x4000_0000~0x7fff_ffff
       MEM	              0x8000_0000~0xfbff_ffff
      SDRAM	              0xfc00_0000~0xffff_ffff
*/

  // in this module, choose cachable memory, or uncachable device.
  // only cachable interface can read dCache, otherwise dCacheIf_S connect dMemIf_M directly.

  wire cachable = dCacheIf_S.addr[31] | i_clean;

  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(`YSYX04561_CPU_WIDTH)) dCachableCacheIf();
  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(128)) dCachableMemIf();

  assign dCachableCacheIf.valid    = dCacheIf_S.valid & cachable;
  assign dCachableCacheIf.reqtyp   = dCacheIf_S.reqtyp   ;
  assign dCachableCacheIf.addr     = dCacheIf_S.addr     ;
  assign dCachableCacheIf.wdata    = dCacheIf_S.wdata    ;
  assign dCachableCacheIf.size     = dCacheIf_S.size     ;

  assign dCachableMemIf.ready      = dMemIf_M.ready & cachable;
  assign dCachableMemIf.rdata      = dMemIf_M.rdata;

  ysyx_040561_dCache u_dCache(
    .i_clk      (i_clk            ),
    .i_rst_n    (i_rst_n          ),
    .i_clean    (i_clean          ),
    .dCacheIf_S (dCachableCacheIf ),
    .dMemIf_M   (dCachableMemIf   ),
    .dSramIf_M  (dSramIf_M[3:0]   )
  );

  assign dCacheIf_S.ready  = cachable ? dCachableCacheIf.ready  : dMemIf_M.ready    ;
  assign dCacheIf_S.rdata  = cachable ? dCachableCacheIf.rdata  : dMemIf_M.rdata[`YSYX04561_CPU_WIDTH-1:0];

  assign dMemIf_M.valid    = cachable ? dCachableMemIf.valid    : dCacheIf_S.valid  ;
  assign dMemIf_M.reqtyp   = cachable ? dCachableMemIf.reqtyp   : dCacheIf_S.reqtyp ;
  assign dMemIf_M.addr     = cachable ? dCachableMemIf.addr     : dCacheIf_S.addr   ;
  assign dMemIf_M.wdata    = cachable ? dCachableMemIf.wdata    : {{(128-`YSYX04561_CPU_WIDTH){1'b0}},dCacheIf_S.wdata};
  assign dMemIf_M.size     = cachable ? dCachableMemIf.size     : dCacheIf_S.size   ;

  assign dMemIf_M.cachable = cachable ; // use for uni2axi size/len.

endmodule

module ysyx_040561_dCache (
  input                       i_clk       ,
  input                       i_rst_n     ,
  input                       i_clean     ,
  ysyx_040561_uni_if.Slave    dCacheIf_S  ,  //  64 bit width
  ysyx_040561_uni_if.Master   dMemIf_M    ,  // 128 bit width
  ysyx_040561_sram_if.Master  dSramIf_M [3:0]
);

  //1. dCache : ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //          |<------16 bytes---->|                |<------16 bytes---->|
  //   ⌈‾‾‾‾‾⌉ ⌈‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾⌉         ⌈‾‾‾‾‾⌉ ⌈‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾⌉ ——
  //   |    | |                    |        |     | |                   |  ↑
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |Tag0| |    Cacheline0      |        |Tag1 | |    Cacheline1     |  |128 sets.
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  ↓
  //   ⌊_____⌋ ⌊____________________⌋         ⌊_____⌋ ⌊____________________⌋ ——

  // tag array signal:
  logic                  tary_wen   [1:0];
  logic [6:0]            tary_addr  [1:0];
  logic [`YSYX04561_dTARY_W-1:0]   tary_wdata [1:0];
  logic [`YSYX04561_dTARY_W-1:0]   tary_rdata [1:0];

  // data array signal:
  logic                  dary_ren   [1:0];
  logic                  dary_wen   [1:0];
  logic [6:0]            dary_addr  [1:0];
  logic [15:0]           dary_wstrb [1:0];
  logic [127:0]          dary_wdata [1:0];
  logic [127:0]          dary_rdata [1:0];

  for (genvar i=0; i<2 ; i=i+1) begin
    ysyx_040561_dCache_tag_ary #(
      .DATA_WIDTH (`YSYX04561_dTARY_W)
    ) u_tag_ary(
      .i_clk   (i_clk         ),
      .i_rst_n (i_rst_n       ),
      .i_wen   (tary_wen  [i] ),
      .i_addr  (tary_addr [i] ),
      .i_din   (tary_wdata[i] ),
      .o_dout  (tary_rdata[i] )
    );
    ysyx_040561_data_ary u_data_ary(
      .i_clk   (i_clk               ),
      .i_rst_n (i_rst_n             ),
      .i_ren   (dary_ren  [i]       ),
      .i_wen   (dary_wen  [i]       ),
      .i_wstrb (dary_wstrb[i]       ),
      .i_addr  (dary_addr [i]       ),
      .i_wdata (dary_wdata[i]       ),
      .o_rdata (dary_rdata[i]       ),
      .SramIf_M(dSramIf_M[2*i+1:2*i])
    );
  end

  logic [127:0] recent, recent_wen;
  logic recent_wdata;

  for (genvar i=0; i<128 ; i=i+1) begin
    ysyx_040561_stl_reg #(
      .WIDTH      (1            ),
      .RESET_VAL  (1'b0         )
    ) reg_recent (
      .i_clk      (i_clk        ),
      .i_rst_n    (i_rst_n      ),
      .i_wen      (recent_wen[i]),
      .i_din      (recent_wdata ),
      .o_dout     (recent[i]    )
    );
  end

  wire [`YSYX04561_TAG_BIT] tag    = dCacheIf_S.addr[`YSYX04561_ADR_WIDTH-1:11];
  wire [6:0]      index  = dCacheIf_S.addr[ 10:4];
  wire [3:0]      offset = dCacheIf_S.addr[  3:0];

  // 2. state machine: /////////////////////////////////////////////////////////////////////////////////////////////////////

  // signals used for dch_state_n logic:
  // signals for hit:
  wire [1:0]      hit;
  // signals for miss, replace victim block:
  wire            victimblk_wayid, victimblk_dirty, victimblk_valid;
  wire [`YSYX04561_TAG_BIT] victimblk_tag;
  // signals for fence.i:
  wire            clean_hit_dirtyline;
  wire [7:0]      clean_cnt ;

  enum logic[2:0] {IDLE, WBUS, RBUS, HIT, CLEAN_CUNT, CLEAN_WBUS} state;
  logic [2:0] dch_state, dch_state_n;

  ysyx_040561_stl_reg #(
    .WIDTH      (3          ),
    .RESET_VAL  (IDLE       )
  ) reg_status (
    .i_clk      (i_clk      ),
    .i_rst_n    (i_rst_n    ),
    .i_wen      (1'b1       ),
    .i_din      (dch_state_n),
    .o_dout     (dch_state  )
  );

  always @(*) begin
    case (dch_state)
      IDLE:       if(dCacheIf_S.valid)begin
                    if(i_clean) begin
                      dch_state_n = CLEAN_CUNT;
                    end else if(|hit) begin
                      dch_state_n = HIT;
                    end else if (victimblk_valid & victimblk_dirty) begin
                      dch_state_n = WBUS;
                    end else begin
                      dch_state_n = RBUS;
                    end
                  end else begin
                    dch_state_n = IDLE;
                  end
      WBUS:       if(dMemIf_M.ready)
                    dch_state_n = RBUS;
                  else
                    dch_state_n = WBUS;
      RBUS:       if(dMemIf_M.ready)
                    dch_state_n = IDLE;
                  else
                    dch_state_n = RBUS;
      HIT:        dch_state_n = IDLE;
      CLEAN_CUNT: if(clean_hit_dirtyline)
                    dch_state_n = CLEAN_WBUS;
                  else if(clean_cnt == 8'hff)
                    dch_state_n = IDLE;
                  else
                    dch_state_n = CLEAN_CUNT;
      CLEAN_WBUS: if(dMemIf_M.ready)begin
                    if(clean_cnt == 8'hff)
                      dch_state_n = IDLE;
                    else
                      dch_state_n = CLEAN_CUNT;
                  end else begin
                    dch_state_n = CLEAN_WBUS;
                  end
      default:    dch_state_n = IDLE;
    endcase
  end

  // 3. hit, read/write data array, update recent/dirty, update dCacheIf_S signal: ///////////////////////////////////////////

  for (genvar i=0; i<2 ; i=i+1) begin
    assign hit[i] = (tary_rdata[i][`YSYX04561_TAG_BIT] == tag) & tary_rdata[i][`YSYX04561_VLD_BIT];
  end

  logic                 tary_hit_wen   [1:0];
  logic [`YSYX04561_dTARY_W-1:0]  tary_hit_wdata [1:0];
  logic                 dary_hit_ren   [1:0];
  logic                 dary_hit_wen   [1:0];
  logic [15:0]          dary_hit_wstrb [1:0];
  logic [127:0]         dary_hit_wdata [1:0];

  // 3.1 update recent://////////////////////////////////////////////////////////////////////////////////////////////////////
  for (genvar i=0; i<128; i=i+1 ) begin
    assign recent_wen[i] = (dch_state == HIT) & (index == i);
  end
  assign recent_wdata = hit[1];

  // 3.2 read data array: ///////////////////////////////////////////////////////////////////////////////////////////////////
  for (genvar i=0; i<2 ; i=i+1) begin
    assign dary_hit_ren  [i] = (dch_state_n == HIT) & hit[i] & (dCacheIf_S.reqtyp == `YSYX04561_REQ_READ);
  end

  wire [127:0] hit_cacheline = hit[1] ? dary_rdata[1] : (hit[0] ? dary_rdata[0] : 128'b0);

  // 3.3 write data array, update tag array dirty bit: ///////////////////////////////////////////////////////////////////////
  wire [7:0] wstrb;
  ysyx_040561_stl_mux_default #(4, 2, 8) mux_size (wstrb, dCacheIf_S.size, 8'b0, {
    2'b00 , 8'b0000_0001, // 1 byte.
    2'b01 , 8'b0000_0011, // 2 byte.
    2'b10 , 8'b0000_1111, // 4 byte.
    2'b11 , 8'b1111_1111  // 8 byte.
  });

  for (genvar i=0; i<2 ; i=i+1) begin
    assign tary_hit_wen   [i] = (dCacheIf_S.reqtyp == `YSYX04561_REQ_WRITE) & (dch_state == HIT) & hit[i];
    assign tary_hit_wdata [i] = {1'b1,tary_rdata[i][`YSYX04561_dTARY_W-2:0]};       // dirty bit <= 1;
    assign dary_hit_wen   [i] = (dCacheIf_S.reqtyp == `YSYX04561_REQ_WRITE) & (dch_state == HIT) & hit[i];
    assign dary_hit_wstrb [i] = {8'b0, wstrb} << offset;                    // bytes.
    assign dary_hit_wdata [i] = {64'b0, dCacheIf_S.wdata} << {offset,3'b0}; // bits. {offset,3'b0} means (offset*8)
  end

  // 3.4 update dCacheIf_S signal: ///////////////////////////////////////////////////////////////////////////////////////////
  logic                     dCacheIf_miss_ready;
  logic [`YSYX04561_CPU_WIDTH-1:0]    dCacheIf_miss_rdata;
  logic [2*`YSYX04561_CPU_WIDTH-1:0]  hit_cacheline_shift;

  assign dCacheIf_miss_ready = (dch_state == HIT);
  assign hit_cacheline_shift = hit_cacheline >> {offset,3'b0};
  assign dCacheIf_miss_rdata = hit_cacheline_shift[`YSYX04561_CPU_WIDTH-1:0];

  // 4. miss, write dirty cacheline to bus, read new cacheline from bus : ///////////////////////////////////////////////////
  assign victimblk_wayid = ~recent[index];
  assign victimblk_dirty = tary_rdata[victimblk_wayid][`YSYX04561_DRT_BIT];
  assign victimblk_valid = tary_rdata[victimblk_wayid][`YSYX04561_VLD_BIT];
  assign victimblk_tag   = tary_rdata[victimblk_wayid][`YSYX04561_TAG_BIT];

  logic                 tary_miss_wen   [1:0];
  logic [`YSYX04561_dTARY_W-1:0]  tary_miss_wdata [1:0];
  logic                 dary_miss_ren   [1:0];
  logic                 dary_miss_wen   [1:0];
  logic [15:0]          dary_miss_wstrb [1:0];
  logic [127:0]         dary_miss_wdata [1:0];

  // 4.1 read dirty victim block, write bus: ///////////////////////////////////////////////////////////////////////////////
  for (genvar i=0; i<2 ; i=i+1) begin
    assign dary_miss_ren  [i] = (dch_state_n == WBUS) & (i == victimblk_wayid);
  end

  // 4.2 read bus, write to victim block: //////////////////////////////////////////////////////////////////////////////////
  for (genvar i=0; i<2 ; i=i+1) begin
    // assign tary_miss_wen    [i] = dMemIf_miss_valid & dMemIf_M.ready & (i == victimblk_wayid);
    // assign tary_miss_wdata  [i] = (dch_state == WBUS) ? {1'b0, victimblk_valid, victimblk_tag}: {1'b0, 1'b1, tag};  //{dirty,valid,tag};
    assign tary_miss_wen    [i] = (dch_state == RBUS) & dMemIf_M.ready & (i == victimblk_wayid);
    assign tary_miss_wdata  [i] = {1'b0, 1'b1, tag};  //{dirty,valid,tag};
    assign dary_miss_wen    [i] = (dch_state == RBUS) & dMemIf_M.ready & (i == victimblk_wayid);
    assign dary_miss_wstrb  [i] = 16'hffff;
    assign dary_miss_wdata  [i] = dMemIf_M.rdata;
  end

  // 4.3 update dMemIf_M signal: //////////////////////////////////////////////////////////////////////////////////////////
  logic                   dMemIf_miss_valid  ;
  logic                   dMemIf_miss_reqtyp ;
  logic [`YSYX04561_ADR_WIDTH-1:0]  dMemIf_miss_addr   ;
  logic [127:0]           dMemIf_miss_wdata  ;

  assign dMemIf_miss_valid  =  (dch_state == WBUS) | (dch_state == RBUS) ;
  assign dMemIf_miss_reqtyp =  (dch_state == WBUS) ? `YSYX04561_REQ_WRITE : `YSYX04561_REQ_READ;
  assign dMemIf_miss_addr   =  (dch_state == WBUS) ? {victimblk_tag, index, 4'b0} : {tag, index, 4'b0};
  assign dMemIf_miss_wdata  =  (dch_state == WBUS) ? dary_rdata[victimblk_wayid] : 128'b0;

  // 5. clean dCache signals.///////////////////////////////////////////////////////////////////////////////////////////////

  // 5.1 count cacheline times. ////////////////////////////////////////////////////////////////////////////////////////////
  // clean_cnt[7] means way, clean_cnt[6:0] means index of set.
  ysyx_040561_stl_reg #(
    .WIDTH      (8              ),
    .RESET_VAL  (8'hff          ) // full.
  ) reg_count (
    .i_clk      (i_clk          ),
    .i_rst_n    (i_rst_n        ),
    .i_wen      (dch_state_n == CLEAN_CUNT),
    .i_din      (clean_cnt+1'b1 ),
    .o_dout     (clean_cnt      )
  );

  // 5.2 read dirty cacheline, write bus: //////////////////////////////////////////////////////////////////////////////////
  logic                 cleanblk_wayid, cleanblk_dirty, cleanblk_valid;
  logic [6:0]           cleanblk_index;
  logic [`YSYX04561_TAG_W-1:0]    cleanblk_tag;

  logic                 tary_clean_wen   [1:0];
  logic [`YSYX04561_dTARY_W-1:0]  tary_clean_wdata [1:0];
  logic                 dary_clean_ren   [1:0];

  assign cleanblk_index = clean_cnt[6:0];
  assign cleanblk_wayid = clean_cnt[7];
  assign cleanblk_dirty = tary_rdata[cleanblk_wayid][`YSYX04561_DRT_BIT];
  assign cleanblk_valid = tary_rdata[cleanblk_wayid][`YSYX04561_VLD_BIT];
  assign cleanblk_tag   = tary_rdata[cleanblk_wayid][`YSYX04561_TAG_BIT];

  assign clean_hit_dirtyline = cleanblk_valid & cleanblk_dirty;

  for (genvar i=0; i<2 ; i=i+1) begin
    assign tary_clean_wen   [i] = (i == clean_cnt[7]) & (dch_state == CLEAN_WBUS) & dMemIf_M.ready;
    assign tary_clean_wdata [i] = {1'b0, cleanblk_valid, cleanblk_tag};  //{dirty,valid,tag};
    assign dary_clean_ren   [i] = (i == clean_cnt[7]) & (dch_state_n == CLEAN_WBUS);
  end

  // 5.4 update dMemIf_M signal: //////////////////////////////////////////////////////////////////////////////////////////
  logic                   dMemIf_clean_valid  ;
  logic                   dMemIf_clean_reqtyp ;
  logic [`YSYX04561_ADR_WIDTH-1:0]  dMemIf_clean_addr   ;
  logic [127:0]           dMemIf_clean_wdata  ;

  assign dMemIf_clean_valid  = (dch_state == CLEAN_WBUS);
  assign dMemIf_clean_reqtyp = `YSYX04561_REQ_WRITE;
  assign dMemIf_clean_addr   = {cleanblk_tag, cleanblk_index, 4'b0};
  assign dMemIf_clean_wdata  = dary_rdata[cleanblk_wayid];

  // 5.5 update dCacheIf_S signal: /////////////////////////////////////////////////////////////////////////////////////////

  logic                   dCacheIf_clean_ready  ;
  logic [`YSYX04561_CPU_WIDTH-1:0]  dCacheIf_clean_rdata  ;

  assign dCacheIf_clean_ready = (dch_state == CLEAN_CUNT | dch_state == CLEAN_WBUS) & (dch_state_n == IDLE);
  assign dCacheIf_clean_rdata = `YSYX04561_CPU_WIDTH'b0;

  // 6. all signals combination ://////////////////////////////////////////////////////////////////////////////////////////

  for (genvar i=0; i<2 ; i=i+1) begin
    assign tary_wen    [i] = tary_miss_wen[i] | tary_hit_wen   [i] | tary_clean_wen[i];
    assign tary_addr   [i]=  i_clean ? cleanblk_index : index;
    assign tary_wdata  [i] = tary_miss_wen[i] ? tary_miss_wdata[i] : (tary_hit_wen [i] ? tary_hit_wdata[i] : tary_clean_wdata [i]);
    assign dary_ren    [i] = dary_miss_ren[i] | dary_hit_ren   [i] | dary_clean_ren[i];
    assign dary_wen    [i] = dary_miss_wen[i] | dary_hit_wen   [i] ;
    assign dary_addr   [i]=  i_clean ? cleanblk_index : index;
    assign dary_wstrb  [i] = dary_miss_wen[i] ? dary_miss_wstrb[i] : dary_hit_wstrb[i];
    assign dary_wdata  [i] = dary_miss_wen[i] ? dary_miss_wdata[i] : dary_hit_wdata[i];
  end

  // dMemIf_M signal: input: ready, rdata; output: valid, reqtyp, addr, wdata, size;
  assign dMemIf_M.valid  =  dMemIf_clean_valid | dMemIf_miss_valid;
  assign dMemIf_M.reqtyp =  dMemIf_clean_valid ? dMemIf_clean_reqtyp : dMemIf_miss_reqtyp ;
  assign dMemIf_M.addr   =  dMemIf_clean_valid ? dMemIf_clean_addr   : dMemIf_miss_addr   ;
  assign dMemIf_M.wdata  =  dMemIf_clean_valid ? dMemIf_clean_wdata  : dMemIf_miss_wdata  ;
  assign dMemIf_M.size   =  2'b11;

  // dCacheIf_S signal: input:  valid, addr, reqtyp, wdata, size; output: ready, rdata;
  assign dCacheIf_S.ready = dCacheIf_clean_ready | dCacheIf_miss_ready ;
  assign dCacheIf_S.rdata = dCacheIf_clean_ready ? dCacheIf_clean_rdata : dCacheIf_miss_rdata ;

endmodule

module ysyx_040561_iCache_wrapper (
  input                       i_clk       ,
  input                       i_rst_n     ,
  input                       i_invalid   ,
  ysyx_040561_uni_if.Slave    iCacheIf_S  ,  //  32 bit width
  ysyx_040561_uni_if.Master   iMemIf_M    ,  // 128 bit width
  ysyx_040561_sram_if.Master  iSramIf_M [3:0]
);

/*    device                    address
      reserve             0x0000_0000~0x01ff_ffff
       CLINT              0x0200_0000~0x0200_ffff
      reserve             0x0201_0000~0x0fff_ffff
     UART16550            0x1000_0000~0x1000_0fff
    SPI controller        0x1000_1000~0x1000_1fff
        SPI	              0x1000_1000~0x1000_1fff
        VGA	              0x1000_2000~0x1000_2fff
        PS2	              0x1000_3000~0x1000_3fff
      Ethernet	          0x1000_4000~0x1000_4fff
      Reserve	            0x1000_5000~0x2fff_ffff
  SPI-flash XIP mode      0x3000_0000~0x3fff_ffff
    ChipLink MMIO         0x4000_0000~0x7fff_ffff
       MEM	              0x8000_0000~0xfbff_ffff
      SDRAM	              0xfc00_0000~0xffff_ffff
*/

  // in this module, choose cachable memory, or uncachable device.
  // only cachable interface can read iCache, otherwise iCacheIf_S connect iMemIf_M directly.

  wire cachable = iCacheIf_S.addr[31];

  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(`YSYX04561_INS_WIDTH)) iCachableCacheIf();
  ysyx_040561_uni_if #(.ADDR_W(`YSYX04561_ADR_WIDTH), .DATA_W(128)) iCachableMemIf();

  assign iCachableCacheIf.valid    = iCacheIf_S.valid & cachable;
  assign iCachableCacheIf.reqtyp   = iCacheIf_S.reqtyp   ;
  assign iCachableCacheIf.addr     = iCacheIf_S.addr     ;
  assign iCachableCacheIf.wdata    = iCacheIf_S.wdata    ;
  assign iCachableCacheIf.size     = iCacheIf_S.size     ;

  assign iCachableMemIf.ready      = iMemIf_M.ready & cachable;
  assign iCachableMemIf.rdata      = iMemIf_M.rdata;

  ysyx_040561_iCache u_iCache(
    .i_clk      (i_clk            ),
    .i_rst_n    (i_rst_n          ),
    .i_invalid  (i_invalid        ),
    .iCacheIf_S (iCachableCacheIf ),
    .iMemIf_M   (iCachableMemIf   ),
    .iSramIf_M  (iSramIf_M[3:0]   )
  );

  assign iCacheIf_S.ready  = cachable ? iCachableCacheIf.ready  : iMemIf_M.ready    ;
  assign iCacheIf_S.rdata  = cachable ? iCachableCacheIf.rdata  : iMemIf_M.rdata[`YSYX04561_INS_WIDTH-1:0];

  assign iMemIf_M.valid    = cachable ? iCachableMemIf.valid    : iCacheIf_S.valid  ;
  assign iMemIf_M.reqtyp   = cachable ? iCachableMemIf.reqtyp   : iCacheIf_S.reqtyp ;
  assign iMemIf_M.addr     = cachable ? iCachableMemIf.addr     : iCacheIf_S.addr   ;
  assign iMemIf_M.wdata    = cachable ? iCachableMemIf.wdata    : {{(128-`YSYX04561_INS_WIDTH){1'b0}},iCacheIf_S.wdata};
  assign iMemIf_M.size     = cachable ? iCachableMemIf.size     : iCacheIf_S.size   ;

  assign iMemIf_M.cachable = cachable ; // use for uni2axi size/len.

endmodule

module ysyx_040561_iCache (
  input                       i_clk       ,
  input                       i_rst_n     ,
  input                       i_invalid   ,
  ysyx_040561_uni_if.Slave    iCacheIf_S  ,  //  32 bit width
  ysyx_040561_uni_if.Master   iMemIf_M    ,  // 128 bit width
  ysyx_040561_sram_if.Master  iSramIf_M [3:0]
);

  //1. iCache : ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //          |<------16 bytes---->|                |<------16 bytes---->|
  //   ⌈‾‾‾‾‾⌉ ⌈‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾⌉         ⌈‾‾‾‾‾⌉ ⌈‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾⌉ ——
  //   |    | |                    |        |     | |                   |  ↑
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |Tag0| |    Cacheline0      |        |Tag1 | |    Cacheline1     |  |128 sets.
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  |
  //   |    | |                    |        |     | |                   |  ↓
  //   ⌊_____⌋ ⌊____________________⌋         ⌊_____⌋ ⌊____________________⌋ ——


  // tag array signal:
  logic                  tary_wen   [1:0];
  logic [6:0]            tary_addr  [1:0];
  logic [`YSYX04561_iTARY_W-1:0]   tary_wdata [1:0];
  logic [`YSYX04561_iTARY_W-1:0]   tary_rdata [1:0];

  // data array signal:
  logic                  dary_ren   [1:0];
  logic                  dary_wen   [1:0];
  logic [6:0]            dary_addr  [1:0];
  logic [15:0]           dary_wstrb [1:0];
  logic [127:0]          dary_wdata [1:0];
  logic [127:0]          dary_rdata [1:0];

  for (genvar i=0; i<2 ; i=i+1) begin
    ysyx_040561_iCache_tag_ary #(
      .DATA_WIDTH (`YSYX04561_iTARY_W)
    ) u_tag_ary(
      .i_clk   (i_clk         ),
      .i_rst_n (i_rst_n       ),
      .i_invalid(i_invalid    ),
      .i_wen   (tary_wen  [i] ),
      .i_addr  (tary_addr [i] ),
      .i_din   (tary_wdata[i] ),
      .o_dout  (tary_rdata[i] )
    );
    ysyx_040561_data_ary u_data_ary(
      .i_clk   (i_clk               ),
      .i_rst_n (i_rst_n             ),
      .i_ren   (dary_ren  [i]       ),
      .i_wen   (dary_wen  [i]       ),
      .i_wstrb (dary_wstrb[i]       ),
      .i_addr  (dary_addr [i]       ),
      .i_wdata (dary_wdata[i]       ),
      .o_rdata (dary_rdata[i]       ),
      .SramIf_M(iSramIf_M[2*i+1:2*i])
    );
  end

  logic [127:0] recent, recent_wen;
  logic recent_wdata;

  for (genvar i=0; i<128 ; i=i+1) begin
    ysyx_040561_stl_reg #(
      .WIDTH      (1            ),
      .RESET_VAL  (1'b0         )
    ) reg_recent (
      .i_clk      (i_clk        ),
      .i_rst_n    (i_rst_n      ),
      .i_wen      (recent_wen[i]),
      .i_din      (recent_wdata ),
      .o_dout     (recent[i]    )
    );
  end

  // 2. control signals: ///////////////////////////////////////////////////////////////////////////////////////////////////
  wire [`YSYX04561_TAG_BIT] tag    = iCacheIf_S.addr[`YSYX04561_ADR_WIDTH-1:11];
  wire [6:0]      index  = iCacheIf_S.addr[ 10:4];
  wire [3:0]      offset = iCacheIf_S.addr[  3:0];

  wire [1:0] hit;
  for (genvar i=0; i<2 ; i=i+1) begin
    assign hit[i] = (tary_rdata[i][`YSYX04561_TAG_BIT] == tag) & tary_rdata[i][`YSYX04561_VLD_BIT];
  end

  wire victim_blkid = ~recent[index];

  // 3. state machine: /////////////////////////////////////////////////////////////////////////////////////////////////////

  enum logic[1:0] {IDLE, BUS, HIT} state;
  logic [1:0] ich_state, ich_state_n;

  ysyx_040561_stl_reg #(
    .WIDTH      (2          ),
    .RESET_VAL  (IDLE       )
  ) reg_status (
    .i_clk      (i_clk      ),
    .i_rst_n    (i_rst_n    ),
    .i_wen      (1'b1       ),
    .i_din      (ich_state_n),
    .o_dout     (ich_state  )
  );

  always @(*) begin
    case (ich_state)
      IDLE:     if(iCacheIf_S.valid)begin
                  if(|hit)begin
                    ich_state_n = HIT;
                  end else begin
                    ich_state_n = BUS;
                  end
                end else begin
                  ich_state_n = IDLE;
                end
      BUS:      if(iMemIf_M.ready)
                  ich_state_n = IDLE;
                else
                  ich_state_n = BUS;
      HIT:      ich_state_n = IDLE;
      default:  ich_state_n = IDLE;
    endcase 
  end

  // 4. hit, read data array, update recent: /////////////////////////////////////////////////////////////////////////////////

  for (genvar i=0; i<128; i=i+1 ) begin
    assign recent_wen[i] = (ich_state == HIT) & (index == i);
  end

  assign recent_wdata = hit[1] ? 1'b1 : 1'b0;

  for (genvar i=0; i<2 ; i=i+1) begin
    assign dary_ren  [i] = (ich_state_n == HIT) & hit[i];
  end

  wire [127:0] hit_cacheline = hit[1] ? dary_rdata[1] : (hit[0] ? dary_rdata[0] : 128'b0);

  // 5. hit, iCacheIf_S signal: //////////////////////////////////////////////////////////////////////////////////////////////
  // input:  valid, addr, reqtyp(awlays `YSYX04561_REQ_READ) , wdata(always 0), size(always 2'b10);
  // output: ready, rdata;

  assign iCacheIf_S.ready = (ich_state == HIT);

  ysyx_040561_stl_mux_default #(4, 4, `YSYX04561_ADR_WIDTH) mux_size (iCacheIf_S.rdata, offset, {`YSYX04561_ADR_WIDTH'b0}, {
    4'd0  , hit_cacheline[`YSYX04561_ADR_WIDTH-1:0],
    4'd4  , hit_cacheline[`YSYX04561_ADR_WIDTH-1+32:32],
    4'd8  , hit_cacheline[`YSYX04561_ADR_WIDTH-1+64:64],
    4'd12 , hit_cacheline[`YSYX04561_ADR_WIDTH-1+96:96]
  });

  // 6. iMemIf_M signal: ////////////////////////////////////////////////////////////////////////////////////////////////////
  // input:  ready, rdata;
  // output: valid, reqtyp(awlays `YSYX04561_REQ_READ), addr, wdata(always 0), size(always 2'b11);

  assign iMemIf_M.valid  =  (ich_state == BUS);
  assign iMemIf_M.reqtyp =  `YSYX04561_REQ_READ;
  assign iMemIf_M.addr   =  {tag,index,4'b0};
  assign iMemIf_M.wdata  =  128'b0;
  assign iMemIf_M.size   =  2'b11;

  // 7. update tag_arry & data_array:///////////////////////////////////////////////////////////////////////////////////////
  for (genvar i=0; i<2 ; i=i+1) begin
    assign tary_wen    [i] = iMemIf_M.valid & iMemIf_M.ready & (i == victim_blkid);
    assign tary_addr   [i] = index;
    assign tary_wdata  [i] = {1'b1,tag};
    assign dary_wen    [i] = iMemIf_M.valid & iMemIf_M.ready & (i == victim_blkid);
    assign dary_addr   [i] = index;
    assign dary_wstrb  [i] = 16'hffff;
    assign dary_wdata  [i] = iMemIf_M.rdata;
  end

endmodule

