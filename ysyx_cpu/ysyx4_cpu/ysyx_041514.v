`define ysyx_041514_YSYX_SOC
// 仅仅用于仿真加快速度，替换多周期乘除法
//  
// `define MUL_SLOW
// 
//`define ysyx_041514_YSYX_SOC          // ysyxSOC 仿真环境

`define ysyx_041514_XLEN 64             //cpu 位数
`define ysyx_041514_INST_LEN 32         //指令长度
`define ysyx_041514_IMM_LEN 64          //立即数长度
`define ysyx_041514_REG_NUM 32          //寄存器个数
`define ysyx_041514_REG_ADDRWIDTH 5     //寄存器地址宽度

`ifndef ysyx_041514_YSYX_SOC  // 不同仿真环境下 PC 的初始值不同
`define ysyx_041514_PC_RESET_ADDR `ysyx_041514_XLEN'h0000_0000_8000_0000
`else
`define ysyx_041514_PC_RESET_ADDR `ysyx_041514_XLEN'h0000_0000_3000_0000
`endif


`define ysyx_041514_NPC_ADDR_LEN 32
`define ysyx_041514_NPC_ADDR_BUS `ysyx_041514_NPC_ADDR_LEN-1:0

`define ysyx_041514_INST_NOP 32'h00000013           //ADDI x0, x0, 0
`define ysyx_041514_TRUE 1'b1
`define ysyx_041514_FALSE 1'b0


`define ysyx_041514_MMIO_BASE 32'h0000_0000_a000_0000

/* BUS */
`define ysyx_041514_XLEN_BUS `ysyx_041514_XLEN-1:0


/* exc 操作码 */
`define ysyx_041514_EXCOP_LEN 13

`define ysyx_041514_EXCOP_NONE 'd0
`define ysyx_041514_EXCOP_AUIPC 'd1
`define ysyx_041514_EXCOP_LUI 'd2
`define ysyx_041514_EXCOP_JAL 'd3
`define ysyx_041514_EXCOP_JALR 'd4
`define ysyx_041514_EXCOP_LOAD 'd5
`define ysyx_041514_EXCOP_STORE 'd6
`define ysyx_041514_EXCOP_BRANCH 'd7
`define ysyx_041514_EXCOP_OPIMM 'd8
`define ysyx_041514_EXCOP_OPIMM32 'd9
`define ysyx_041514_EXCOP_OP 'd10
`define ysyx_041514_EXCOP_OP32 'd11
`define ysyx_041514_EXCOP_CSR 'd12



/* ALU 操作码 */
`define ysyx_041514_ALUOP_LEN 33

`define ysyx_041514_ALUOP_NONE 'd0
`define ysyx_041514_ALUOP_ADD 'd1
`define ysyx_041514_ALUOP_SUB 'd2
/* 逻辑操作 */
`define ysyx_041514_ALUOP_XOR 'd3
`define ysyx_041514_ALUOP_OR 'd4
`define ysyx_041514_ALUOP_AND 'd5
/* 移位操作 */
`define ysyx_041514_ALUOP_SLL 'd6
`define ysyx_041514_ALUOP_SRL 'd7
`define ysyx_041514_ALUOP_SRA 'd8
//忽略高32位的移位操作
`define ysyx_041514_ALUOP_SLLW 'd9
`define ysyx_041514_ALUOP_SRLW 'd10
`define ysyx_041514_ALUOP_SRAW 'd11
/* 比较操作 */
`define ysyx_041514_ALUOP_SLT 'd12
`define ysyx_041514_ALUOP_SLTU 'd13

`define ysyx_041514_ALUOP_BEQ 'd14
`define ysyx_041514_ALUOP_BNE 'd15
`define ysyx_041514_ALUOP_BLT 'd16
`define ysyx_041514_ALUOP_BGE 'd17
`define ysyx_041514_ALUOP_BLTU 'd18
`define ysyx_041514_ALUOP_BGEU 'd19

/* 乘除法 */
`define ysyx_041514_ALUOP_MUL 'd20
`define ysyx_041514_ALUOP_MULH 'd21
`define ysyx_041514_ALUOP_MULHSU 'd22
`define ysyx_041514_ALUOP_MULHU 'd23
`define ysyx_041514_ALUOP_MULW 'd24

`define ysyx_041514_ALUOP_DIV 'd25
`define ysyx_041514_ALUOP_DIVU 'd26
`define ysyx_041514_ALUOP_REM 'd27
`define ysyx_041514_ALUOP_REMU 'd28
`define ysyx_041514_ALUOP_DIVW 'd29
`define ysyx_041514_ALUOP_DIVUW 'd30
`define ysyx_041514_ALUOP_REMW 'd31
`define ysyx_041514_ALUOP_REMUW 'd32

/* mem操作码 */
`define ysyx_041514_MEMOP_LEN 13

/* 读取 */

`define ysyx_041514_MEMOP_NONE 'd0 //空操作

`define ysyx_041514_MEMOP_LB 'd1
`define ysyx_041514_MEMOP_LH 'd2
`define ysyx_041514_MEMOP_LW 'd3
`define ysyx_041514_MEMOP_LBU 'd4
`define ysyx_041514_MEMOP_LHU 'd5
`define ysyx_041514_MEMOP_LD 'd6
`define ysyx_041514_MEMOP_LWU 'd7

/* 写入 */
`define ysyx_041514_MEMOP_SB 'd8
`define ysyx_041514_MEMOP_SH 'd9
`define ysyx_041514_MEMOP_SW 'd10
`define ysyx_041514_MEMOP_SD 'd11

`define ysyx_041514_MEMOP_FENCEI 'd12


/* writeback 操作码 */
`define ysyx_041514_WBOP_LEN 2

/* 读取 */
`define ysyx_041514_WBOP_RD 'd0
`define ysyx_041514_WBOP_NONE 'd1

/* PC操作码 */
`define ysyx_041514_PCOP_LEN 6

`define ysyx_041514_PCOP_NONE 'd0 //空操作
`define ysyx_041514_PCOP_BRANCH 'd1
`define ysyx_041514_PCOP_JAL 'd2
`define ysyx_041514_PCOP_JALR 'd3
`define ysyx_041514_PCOP_INC4 'd4
`define ysyx_041514_PCOP_TRAP 'd5


/*************CSR************/

`define ysyx_041514_CSROP_LEN 5

`define ysyx_041514_CSROP_NONE 'd0
`define ysyx_041514_CSROP_READ 'd1
`define ysyx_041514_CSROP_WRITE 'd2
`define ysyx_041514_CSROP_SET 'd3
`define ysyx_041514_CSROP_CLEAR 'd4


//寄存器地址
`define ysyx_041514_CSR_REG_ADDRWIDTH 12
//Machine Trap Setup
`define ysyx_041514_CSR_MSTATUS 12'h300
`define ysyx_041514_CSR_MISA 12'h301
`define ysyx_041514_CSR_MEDELEG 12'h302
`define ysyx_041514_CSR_MIDELEG 12'h303
`define ysyx_041514_CSR_MIE 12'h304
`define ysyx_041514_CSR_MTVEC 12'h305
`define ysyx_041514_CSR_MCOUNTEREN 12'h306
//Machine Trap Handling
`define ysyx_041514_CSR_MSCRATCH 12'h340
`define ysyx_041514_CSR_MEPC 12'h341
`define ysyx_041514_CSR_MCAUSE 12'h342
`define ysyx_041514_CSR_MTVAL 12'h343
`define ysyx_041514_CSR_MIP 12'h344
`define ysyx_041514_CSR_MTINST 12'h34a
`define ysyx_041514_CSR_MTVAL2 12'h34b


`define ysyx_041514_CSR_MSTATUS_DEFAULT `ysyx_041514_XLEN'ha00001800 


`define ysyx_041514_MTIMECMP_ADDR 32'h2004000
`define ysyx_041514_MTIME_ADDR 32'h200BFF8

/**********tarp**********/




`define ysyx_041514_TRAP_INST_ADDR_MISALIGNED 0
`define ysyx_041514_TRAP_INST_ACCESS_FAULT 1
`define ysyx_041514_TRAP_ILLEGAL_INST 2
`define ysyx_041514_TRAP_BREAKPOINT 3
`define ysyx_041514_TRAP_LOAD_ADDR_MISALIGNED 4
`define ysyx_041514_TRAP_LOAD_ACCESS_FAULT 5
`define ysyx_041514_TRAP_STORE_ADDR_MISALIGNED 6
`define ysyx_041514_TRAP_STORE_ACCESS_FAULT 7
`define ysyx_041514_TRAP_ECALL_U 8
`define ysyx_041514_TRAP_ECALL_S 9 
`define ysyx_041514_TRAP_RESERVED0 10 
`define ysyx_041514_TRAP_ECALL_M 11
`define ysyx_041514_TRAP_INST_PAGE_FAULT 12
`define ysyx_041514_TRAP_LOAD_PAGE_FAULT 13
`define ysyx_041514_TRAP_RESERVED1 14
`define ysyx_041514_TRAP_STORE_PAGE_FAULT 15


`define ysyx_041514_TRAP_MRET 16 // 把 MRET 当成 trap
`define ysyx_041514_TRAP_EBREAK 17 // 把 EBREAK 当成 trap
`define ysyx_041514_TRAP_FENCEI 18 // 把 fencei 当成 trap,复用线路
`define ysyx_041514_TRAP_LEN 19
`define ysyx_041514_TRAP_BUS `ysyx_041514_TRAP_LEN-1:0



//PC,IF_ID, ID_EX, EX_MEM, MEM_WB
`define ysyx_041514_CTRLBUS_PC 0
`define ysyx_041514_CTRLBUS_IF_ID 1
`define ysyx_041514_CTRLBUS_ID_EX 2
`define ysyx_041514_CTRLBUS_EX_MEM 3
`define ysyx_041514_CTRLBUS_MEM_WB 4



// Burst types
`define ysyx_041514_AXI_BURST_TYPE_FIXED 2'b00               //突发类型  FIFO
`define ysyx_041514_AXI_BURST_TYPE_INCR 2'b01               //ram  
`define ysyx_041514_AXI_BURST_TYPE_WRAP 2'b10
// Access permissions
`define ysyx_041514_AXI_PROT_UNPRIVILEGED_ACCESS 3'b000
`define ysyx_041514_AXI_PROT_PRIVILEGED_ACCESS 3'b001
`define ysyx_041514_AXI_PROT_SECURE_ACCESS 3'b000
`define ysyx_041514_AXI_PROT_NON_SECURE_ACCESS 3'b010
`define ysyx_041514_AXI_PROT_DATA_ACCESS 3'b000
`define ysyx_041514_AXI_PROT_INSTRUCTION_ACCESS 3'b100
// Memory types (AR)
`define ysyx_041514_AXI_ARCACHE_DEVICE_NON_BUFFERABLE 4'b0000
`define ysyx_041514_AXI_ARCACHE_DEVICE_BUFFERABLE 4'b0001
`define ysyx_041514_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE 4'b0010
`define ysyx_041514_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE 4'b0011
`define ysyx_041514_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE 4'b1010
`define ysyx_041514_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE 4'b1110
`define ysyx_041514_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE 4'b1010
`define ysyx_041514_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE 4'b1110
`define ysyx_041514_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE 4'b1011
`define ysyx_041514_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE 4'b1111
`define ysyx_041514_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE 4'b1011
`define ysyx_041514_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE 4'b1111
// Memory types (AW)
`define ysyx_041514_AXI_AWCACHE_DEVICE_NON_BUFFERABLE 4'b0000
`define ysyx_041514_AXI_AWCACHE_DEVICE_BUFFERABLE 4'b0001
`define ysyx_041514_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE 4'b0010
`define ysyx_041514_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE 4'b0011
`define ysyx_041514_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE 4'b0110
`define ysyx_041514_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE 4'b0110
`define ysyx_041514_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE 4'b1110
`define ysyx_041514_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE 4'b1110
`define ysyx_041514_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE 4'b0111
`define ysyx_041514_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE 4'b0111
`define ysyx_041514_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE 4'b1111
`define ysyx_041514_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE 4'b1111

`define ysyx_041514_AXI_SIZE_BYTES_1 3'b000                //突发宽度一个数据的宽度
`define ysyx_041514_AXI_SIZE_BYTES_2 3'b001
`define ysyx_041514_AXI_SIZE_BYTES_4 3'b010
`define ysyx_041514_AXI_SIZE_BYTES_8 3'b011
`define ysyx_041514_AXI_SIZE_BYTES_16 3'b100
`define ysyx_041514_AXI_SIZE_BYTES_32 3'b101
`define ysyx_041514_AXI_SIZE_BYTES_64 3'b110
`define ysyx_041514_AXI_SIZE_BYTES_128 3'b111








 


module ysyx_041514_bpu_top (
    input [`ysyx_041514_XLEN_BUS] inst_data_i,
    input [`ysyx_041514_XLEN_BUS] pc_if_i,
    // output [`ysyx_041514_XLEN_BUS] bpu_pc_o,
    output [`ysyx_041514_XLEN_BUS] bpu_pc_op1_o,
    output [`ysyx_041514_XLEN_BUS] bpu_pc_op2_o,
    output bpu_pc_valid_o
);


  wire [`ysyx_041514_XLEN_BUS] _inst = inst_data_i;
  // wire [4:0] _rd = _inst[11:7];
  // wire [2:0] _func3 = _inst[14:12];
  wire [4:0] _rs1 = _inst[19:15];
  // wire [4:0] _rs2 = _inst[24:20];
  // wire [6:0] _func7 = _inst[31:25];
  wire rs1_idx_zero = _rs1 == 'b0;

  // 不同指令类型的立即数
  wire [`ysyx_041514_IMM_LEN-1:0] _immI = {{21 + 32{_inst[31]}}, _inst[30:20]};
  wire [`ysyx_041514_IMM_LEN-1:0] _immB = {
    {20 + 32{_inst[31]}}, _inst[7], _inst[30:25], _inst[11:8], 1'b0
  };
  wire [`ysyx_041514_IMM_LEN-1:0] _immJ = {
    {12 + 32{_inst[31]}}, _inst[19:12], _inst[20], _inst[30:25], _inst[24:21], 1'b0
  };


  /* 分解_opcode */
  wire [6:0] _opcode = _inst[6:0];
  wire _opcode_1_0_11 = (_opcode[1:0] == 2'b11);
  wire _opcode_4_2_000 = (_opcode[4:2] == 3'b000);
  wire _opcode_4_2_001 = (_opcode[4:2] == 3'b001);
  wire _opcode_4_2_011 = (_opcode[4:2] == 3'b011);
  wire _opcode_6_5_11 = (_opcode[6:5] == 2'b11);

  wire _type_branch = _opcode_6_5_11 & _opcode_4_2_000 & _opcode_1_0_11;
  wire _type_jalr = _opcode_6_5_11 & _opcode_4_2_001 & _opcode_1_0_11;
  wire _type_jal = _opcode_6_5_11 & _opcode_4_2_011 & _opcode_1_0_11;


  // 向后跳转跳转，向前跳转不跳转BTFN (Backward Taken，Forward Not-taken) rs1+imm
  wire branch_jump_valid = ((_immB[`ysyx_041514_XLEN-1]) & _type_branch);
  // wire branch_jump_valid = 1'b1;

  // jal 指令，跳转地址在地址中得到 pc+imm
  wire jal_jump_valid = _type_jal;

  // jalr 指令，rs1 为 x0 时，可以直接得到跳转地址 rs1+imm
  wire jalr_pc_valid = _type_jalr & rs1_idx_zero;


  wire [`ysyx_041514_XLEN_BUS] bpu_pc_op1 = ({`ysyx_041514_XLEN{_type_branch|_type_jal}}&pc_if_i)
                                          | ({`ysyx_041514_XLEN{_type_jalr}}&64'b0);

  wire [`ysyx_041514_XLEN_BUS] bpu_pc_op2=({`ysyx_041514_XLEN{_type_branch}}&_immB)
                                          | ({`ysyx_041514_XLEN{_type_jalr}}&_immI)
                                          | ({`ysyx_041514_XLEN{_type_jal}}&_immJ);

  // wire [`ysyx_041514_XLEN_BUS] bpu_pc = bpu_pc_op1 + bpu_pc_op2;

  wire bpu_pc_valid = branch_jump_valid & _type_branch
                    | jal_jump_valid & _type_jal
                    | jalr_pc_valid&_type_jalr;


  // assign bpu_pc_o = bpu_pc;
  assign bpu_pc_op1_o   = bpu_pc_op1;
  assign bpu_pc_op2_o   = bpu_pc_op2;
  assign bpu_pc_valid_o = bpu_pc_valid;


endmodule



 
/* 与 mem 位于同一阶段 */
module ysyx_041514_clint (
    input wire clk,
    input wire rst,

    input [`ysyx_041514_XLEN-1:0] pc_from_mem_i, // from mem
    input [`ysyx_041514_XLEN-1:0] pc_from_exe_i, // from exe
    input [`ysyx_041514_INST_LEN-1:0] inst_data_i,

    /* clint 接口 */
    input [         `ysyx_041514_NPC_ADDR_BUS] clint_addr_i,
    input                          clint_valid_i,
    input                          clint_write_valid_i,
    input [             `ysyx_041514_XLEN_BUS] clint_wdata_i,
    output  [             `ysyx_041514_XLEN_BUS] clint_rdata_o,

    /* TARP 总线 */
    input wire [`ysyx_041514_TRAP_BUS] trap_bus_i,
    /* ----- stall request from other modules 各个阶段请求流水线暂停请求 --------*/
    input wire ram_stall_valid_if_i, // if 阶段访存暂停
    input wire ram_stall_valid_mem_i,// mem 访存暂停
    input wire load_use_valid_id_i,  //load-use data hazard from id
    input wire jump_valid_ex_i,  // branch hazard from ex
    input wire alu_mul_div_valid_ex_i, // mul div stall from ex

    /* trap 所需寄存器，来自于 csr (读)*/
    input wire [`ysyx_041514_XLEN-1:0] csr_mstatus_readdata_i,
    input wire [`ysyx_041514_XLEN-1:0] csr_mepc_readdata_i,
    //input wire [`ysyx_041514_XLEN-1:0] csr_mcause_readdata_i,
    //input wire [`ysyx_041514_XLEN-1:0] csr_mtval_readdata_i,
    input wire [`ysyx_041514_XLEN-1:0] csr_mtvec_readdata_i,
    input wire [`ysyx_041514_XLEN-1:0] csr_mip_readdata_i,
    input wire [`ysyx_041514_XLEN-1:0] csr_mie_readdata_i,
    /* trap 所需寄存器，来自于 csr (写)*/
    output wire [`ysyx_041514_XLEN-1:0] csr_mstatus_writedata_o,
    output wire [`ysyx_041514_XLEN-1:0] csr_mepc_writedata_o,
    output wire [`ysyx_041514_XLEN-1:0] csr_mcause_writedata_o,
    output wire [`ysyx_041514_XLEN-1:0] csr_mtval_writedata_o,
    //output wire [`ysyx_041514_XLEN-1:0] csr_mtvec_writedata_o,
    output wire [`ysyx_041514_XLEN-1:0] csr_mip_writedata_o,
    //output wire [`ysyx_041514_XLEN-1:0] csr_mie_writedata_o,

    output wire csr_mstatus_write_valid_o,
    output wire csr_mepc_write_valid_o,
    output wire csr_mcause_write_valid_o,
    output wire csr_mtval_write_valid_o,
    //output wire csr_mtvec_write_valid_o,
    output wire csr_mip_write_valid_o,
    //output wire csr_mie_write_valid_o,

    /* 输出至取指阶段 */
    output  [`ysyx_041514_XLEN-1:0] clint_pc_o,
    output  clint_pc_valid_o,
    output clint_pc_plus4_valid_o,

    /* ---signals to other stages of the pipeline  ----*/
    output reg[5:0]              stall_o,   // stall request to PC,IF_ID, ID_EX, EX_MEM, MEM_WB， one bit for one stage respectively
    output reg [5:0] flush_o  // flush the whole pipleline, exception or interrupt happens
);

  /* --------------------- handle the stall request -------------------*/
  // assign flush_o = trap_valid;
  wire trap_valid;
  wire Machine_timer_interrupt;
  wire trap_mret;
  wire trap_fencei;


  //stall request to PC,IF_ID, ID_EX, EX_MEM, MEM_WB
  localparam load_use_flush = 6'b000100;
  localparam load_use_stall = 6'b000011;
  localparam jump_flush = 6'b000110;
  localparam jump_stall = 6'b000000;
  localparam mul_div_flush = 6'b001000;
  localparam mul_div_stall = 6'b000111;
  localparam trap_flush = 6'b001110;
  localparam trap_stall = 6'b000000;
  localparam ram_if_flush = 6'b010000;
  localparam ram_if_stall = 6'b001111;
  localparam ram_mem_flush = 6'b010000;
  localparam ram_mem_stall = 6'b001111;
  // localparam mutiple_alu_inst_flush = 6'b000011;
  // localparam mutiple_alu_inst_stall = 6'b000000;


/* 流水线越往后,优先级越高 */
  always @(*) begin
    if (rst) begin
      stall_o = 6'b000000;
      flush_o = 6'b011111;
    // 访存时阻塞所有流水线
    end else if (ram_stall_valid_mem_i) begin // TODO ,if mem 访存合并
      stall_o = ram_mem_stall;
      flush_o = ram_mem_flush;
    // 访存时阻塞所有流水线
    end else if (ram_stall_valid_if_i) begin
      stall_o = ram_if_stall;
      flush_o = ram_if_flush;
    // 中断|异常,(发生在 mem 阶段)
    end else if (trap_valid | trap_mret| trap_fencei) begin
      stall_o = trap_stall; 
      flush_o = trap_flush;
    // 跳转指令,(发生在 ex 阶段)
    end else if (jump_valid_ex_i) begin
      stall_o = jump_stall;
      flush_o = jump_flush;
    // 乘法和除法
    end else if (alu_mul_div_valid_ex_i) begin
      stall_o = mul_div_stall;
      flush_o = mul_div_flush;
    // load use data 冲突,(发生在 id 阶段)
    end else if (load_use_valid_id_i) begin
      stall_o = load_use_stall;
      flush_o = load_use_flush;
    // 没有异常情况,正常执行
    end else begin
      stall_o = 6'b000000;
      flush_o = 6'b000000;
    end
  end



/******************************handle the trap request**************************************/
  /* type of trap */
  // wire _trap_ecall = trap_bus_i[`ysyx_041514_TRAP_ECALL]; // 11
  // wire _trap_ebreak = trap_bus_i[`ysyx_041514_TRAP_EBREAK];
  // wire trap_breakpoint = trap_bus_i[`ysyx_041514_TRAP_BREAKPOINT]; // 3
  // wire trap_inst_page_fault = trap_bus_i[`ysyx_041514_TRAP_INST_PAGE_FAULT]; // 12
  // wire trap_inst_access_fault = trap_bus_i[`ysyx_041514_TRAP_INST_ACCESS_FAULT]; // 1
  // wire trap_illegal_inst = trap_bus_i[`ysyx_041514_TRAP_INST_ACCESS_FAULT]; // 1

  assign trap_mret = trap_bus_i[`ysyx_041514_TRAP_MRET];
  assign trap_fencei = trap_bus_i[`ysyx_041514_TRAP_FENCEI];
  // wire [`ysyx_041514_XLEN_BUS]_fencei_pc = pc_from_mem_i+'d4; // TODO 加 4 操作，统一到 pc 自增上，节省一个加法器


  assign trap_valid = (|trap_bus_i[15:0])| Machine_timer_interrupt; // 0 - 15 表示 trap 发生

  reg [`ysyx_041514_XLEN_BUS]mcause_switch;
  always @(*) begin
    if (Machine_timer_interrupt) begin
      mcause_switch={1'b1,63'd7};
      end
    else if (trap_bus_i[`ysyx_041514_TRAP_BREAKPOINT]) begin
      mcause_switch={1'b0,63'd3};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_INST_PAGE_FAULT]) begin
      mcause_switch={1'b0,63'd12};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_INST_ACCESS_FAULT]) begin
      mcause_switch={1'b0,63'd1};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_ILLEGAL_INST]) begin
      mcause_switch={1'b0,63'd2};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_INST_ADDR_MISALIGNED]) begin
      mcause_switch={1'b0,63'd0};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_ECALL_M]) begin
      mcause_switch={1'b0,63'd11};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_ECALL_U]) begin
      mcause_switch={1'b0,63'd8};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_ECALL_S]) begin
      mcause_switch={1'b0,63'd9};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_EBREAK]) begin
      mcause_switch={1'b0,63'd3};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_LOAD_ADDR_MISALIGNED]) begin
      mcause_switch={1'b0,63'd4};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_STORE_ADDR_MISALIGNED]) begin
      mcause_switch={1'b0,63'd6};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_LOAD_PAGE_FAULT]) begin
      mcause_switch={1'b0,63'd13};
    end
        else if (trap_bus_i[`ysyx_041514_TRAP_STORE_PAGE_FAULT]) begin
      mcause_switch={1'b0,63'd15};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_LOAD_ACCESS_FAULT]) begin
      mcause_switch={1'b0,63'd5};
    end
    else if (trap_bus_i[`ysyx_041514_TRAP_STORE_ACCESS_FAULT]) begin
      mcause_switch={1'b0,63'd7};
    end
    else begin
      mcause_switch=0;
    end
  end



  


  /* set the csr register and new pc if traps happened */
  // step 1: save current pc 
  assign csr_mepc_writedata_o   = Machine_timer_interrupt?pc_from_exe_i:pc_from_mem_i; // trap or int，int 保存前一条指令，trap 保存当前指令
  assign csr_mepc_write_valid_o = trap_valid;
  // step 2: set the trap pc
  wire [`ysyx_041514_XLEN-1:0]_trap_pc_o = csr_mtvec_readdata_i;  // TODO:now only suppot direct mode,need to add vector mode
  wire _trap_pc_valid_o = trap_valid;
  // step 3: save trap cuase to mcause
  assign csr_mcause_writedata_o = mcause_switch; 
  assign csr_mcause_write_valid_o = trap_valid;
  // step 4: save inst_data to mtval
  assign csr_mtval_writedata_o = {32'b0, inst_data_i};
  assign csr_mtval_write_valid_o = trap_valid;
  // step 5 ： mstatus
  wire  [`ysyx_041514_XLEN_BUS] trap_mstatus_wdata = {csr_mstatus_readdata_i[63:13],
                                   1'b0,1'b0,csr_mstatus_readdata_i[10:8],
                                   csr_mstatus_readdata_i[3],csr_mstatus_readdata_i[6:4],
                                   1'b0,csr_mstatus_readdata_i[2:0]};

  wire trap_mstatus_valid = trap_valid;


  /* restore pc and csr register if mret happened*/
  wire [`ysyx_041514_XLEN-1:0] _mret_pc_o = csr_mepc_readdata_i; // TODO mstatus
  wire _mret_pc_valid_o = trap_mret;
  
  wire mret_mstatus_valid = trap_mret;
  wire  [`ysyx_041514_XLEN_BUS] mret_mstatus_wdata = {csr_mstatus_readdata_i[63:13],1'b1,1'b1,
                                          csr_mstatus_readdata_i[10:8],1'b1,
                                          csr_mstatus_readdata_i[6:4],
                                          csr_mstatus_readdata_i[7],
                                          csr_mstatus_readdata_i[2:0]};



  /* mstatus mux */
  // `ifndef ysyx_041514_YSYX_SOC
  //   assign csr_mstatus_write_valid_o = `ysyx_041514_FALSE;
  // `else
  //   assign csr_mstatus_write_valid_o = mret_mstatus_valid|trap_mstatus_valid;
  // `endif 
  assign csr_mstatus_write_valid_o = mret_mstatus_valid|trap_mstatus_valid;
  assign csr_mstatus_writedata_o = ({`ysyx_041514_XLEN{mret_mstatus_valid}}&mret_mstatus_wdata)|
                                   ({`ysyx_041514_XLEN{trap_mstatus_valid}}&trap_mstatus_wdata);



  /* fencei pc */
  wire [`ysyx_041514_XLEN_BUS]_fencei_pc = pc_from_mem_i; // +4 操作统一到 pc 阶段
  assign clint_pc_plus4_valid_o = trap_fencei;
  
  /* pc mux TODO 是否应该考虑优先级问题？同一时刻有多个跳转如何考虑？ */
  // 1. trap 发生，包括中断和异常
  // 2. mret 指令
  // 3. fencei 指令
  assign clint_pc_o = ({`ysyx_041514_XLEN{_mret_pc_valid_o}}&_mret_pc_o)|
                      ({`ysyx_041514_XLEN{_trap_pc_valid_o}}&_trap_pc_o)|
                      ({`ysyx_041514_XLEN{trap_fencei}}&_fencei_pc);
                  
  assign clint_pc_valid_o = trap_valid | trap_mret|trap_fencei;



  /* mip TODO: 暂时只支持 mtime 中断 */
  assign csr_mip_write_valid_o = Machine_timer_interrupt;
  assign csr_mip_writedata_o = {csr_mip_readdata_i[63:8],1'b1,csr_mip_readdata_i[6:0]};


  /*********************************clint******************************************/
  wire csr_mstatus_mie_valid = csr_mstatus_readdata_i[3]; // 全局中断
  wire csr_mie_mtie_valid = csr_mie_readdata_i[7];        // 定时器中断

  reg [`ysyx_041514_XLEN_BUS] mtime,mtimecmp;
  wire mtime_ge_mtime = (mtime >= mtimecmp); // mtime >= mtimecmp


  wire pc_from_exe_valid = (|pc_from_exe_i[31:0]); // exe 阶段为有效指令时，才能进入中断，不然中断返回找不到返回地址
  assign Machine_timer_interrupt = mtime_ge_mtime&csr_mstatus_mie_valid&csr_mie_mtie_valid&pc_from_exe_valid;

  
  wire [`ysyx_041514_NPC_ADDR_BUS] clint_waddr = clint_addr_i;
  wire [`ysyx_041514_NPC_ADDR_BUS] clint_raddr = clint_addr_i;
  wire clint_waddr_valid = clint_write_valid_i & clint_valid_i; // 写有效
  wire [`ysyx_041514_XLEN_BUS]clint_wdata = clint_wdata_i;  // 写数据
  reg [`ysyx_041514_XLEN_BUS]clint_rdata;

  assign clint_rdata_o = clint_rdata; // 读数据


  wire [`ysyx_041514_XLEN_BUS] mtime_plus1 = mtime+64'b1;

   // 写 mtime
  always @(posedge clk) begin
    if (rst) begin
      mtime <=0;
    end
    else if (clint_waddr_valid & (clint_waddr==`ysyx_041514_MTIME_ADDR)) begin
      mtime <=clint_wdata;
    end
    else begin
      mtime<=mtime_plus1;
    end
  end
  // 写 mtimecmp
  always @(posedge clk) begin
    if (rst) begin
      mtimecmp <=0;
    end
    else if (clint_waddr_valid & (clint_waddr==`ysyx_041514_MTIMECMP_ADDR)) begin
      mtimecmp <=clint_wdata;
    end
    else begin :keep
      mtimecmp<=mtimecmp;
    end
  end
 // 读 mtime mtimecmp
  always @(*) begin
    case (clint_raddr)
      `ysyx_041514_MTIMECMP_ADDR: begin 
        clint_rdata=mtimecmp;
      end
      `ysyx_041514_MTIME_ADDR: begin 
        clint_rdata=mtime;
      end
      default: begin 
        clint_rdata=0;
      end
    endcase
  end 

  /*************ebreak仿真使用**************************/

`ifndef ysyx_041514_YSYX_SOC
  wire _trap_ebreak = trap_bus_i[`ysyx_041514_TRAP_EBREAK];
  always @(*) begin
    if (_trap_ebreak) begin
      $finish;
    end
  end
`endif 

endmodule
 

`ifndef ysyx_041514_YSYX_SOC
module ysyx_041514_writeback (
    input                             clk,
    /* from MEM/WB */
    input [    `ysyx_041514_XLEN_BUS] pc_wb_i,
    input [`ysyx_041514_INST_LEN-1:0] inst_data_wb_i
);
  /***************difftest 使用****************/
  // 向仿真环境传递指令提交信息
  // 当指令有效时：pc_wb_i = 当前指令 PC ，_commit_valid = 1
  // 当指令无效时：pc_wb_i = 0 ，_commit_valid = 0；
  wire _commit_valid = (pc_wb_i != `ysyx_041514_XLEN'b0);
  import "DPI-C" function void inst_commit(
    input longint pc,
    input int inst,
    input bit commit_valid
  );
  always @(posedge clk) begin
    // 延时一个周期，让寄存器写入有效
    inst_commit(pc_wb_i, inst_data_wb_i, _commit_valid);
  end
endmodule

`endif 
 

module ysyx_041514_rv64_gpr_regfile (
    input clk,
    input rst,
    /* 读取数据 */
    input wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rs1_idx_i,
    input wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rs2_idx_i,
    output wire [`ysyx_041514_XLEN-1:0] rs1_data_o,
    output wire [`ysyx_041514_XLEN-1:0] rs2_data_o,
    /* 写入数据 */
    input wire [`ysyx_041514_REG_ADDRWIDTH-1:0] write_idx_i,
    input wire [`ysyx_041514_XLEN-1:0] write_data_i,
    input wire write_data_valid_i
);

  /* 寄存器组 */
  reg [`ysyx_041514_XLEN-1:0] rf[`ysyx_041514_REG_NUM-1:0];

  /* 写入数据,若目的寄存器为 x0,写入数据永远为0 */
  wire _isX0 = (write_idx_i == `ysyx_041514_REG_ADDRWIDTH'b0);
  wire [`ysyx_041514_XLEN-1:0] _write_data = (_isX0) ? `ysyx_041514_XLEN'b0 : write_data_i;  // x0 恒为0
  /* 写入使能 */
  wire _wen = write_data_valid_i;
  integer i;
  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < 32; i = i + 1) begin
        rf[i] <= 0;
      end
    end else if (_wen) rf[write_idx_i] <= _write_data;
  end

  /* 读取数据 */
  wire _rs1_bypass_valid = rs1_idx_i == write_idx_i;
  wire _rs2_bypass_valid = rs2_idx_i == write_idx_i;

  assign rs1_data_o = _rs1_bypass_valid ? _write_data : rf[rs1_idx_i];
  assign rs2_data_o = _rs2_bypass_valid ? _write_data : rf[rs2_idx_i];


  /************仿真使用：传递二维数组指针************/
`ifndef ysyx_041514_YSYX_SOC
  import "DPI-C" function void set_gpr_ptr(input logic [63:0] a[]);
  initial set_gpr_ptr(rf);  // rf为通用寄存器的二维数组变量
`endif

endmodule


 


module ysyx_041514_dcode (
    /* from if/id */
    input [`ysyx_041514_XLEN_BUS] inst_addr_i,
    input [`ysyx_041514_INST_LEN-1:0] inst_data_i,
    input [`ysyx_041514_TRAP_BUS] trap_bus_i,
    /* from gpr regs */
    input [`ysyx_041514_XLEN_BUS] rs1_data_i,
    input [`ysyx_041514_XLEN_BUS] rs2_data_i,
    /* from csr regs */
    input [`ysyx_041514_XLEN_BUS] csr_data_i,
    /* from id/ex stage */
    input [`ysyx_041514_EXCOP_LEN-1:0] id_ex_exc_op_i, // 上一条指令的类型，用于判断上一条指令是否是访存指令
    /* from exc bypass */
    input [`ysyx_041514_XLEN_BUS] ex_rd_data_i,
    input [`ysyx_041514_REG_ADDRWIDTH-1:0] ex_rd_addr_i,
    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] ex_csr_writeaddr_i,  // TODO 用于 csr bypass
    input [`ysyx_041514_XLEN_BUS] ex_csr_writedata_i,
    /* from mem bypass */
    input [`ysyx_041514_XLEN_BUS] mem_rd_data_i,
    input [`ysyx_041514_REG_ADDRWIDTH-1:0] mem_rd_addr_i,


    /*通用寄存器译码结果：to id/ex */
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rs1_idx_o,
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rs2_idx_o,
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_o,
    output [             `ysyx_041514_XLEN_BUS] rs1_data_o,
    output [             `ysyx_041514_XLEN_BUS] rs2_data_o,
    output [          `ysyx_041514_IMM_LEN-1:0] imm_data_o,
    /* CSR 译码结果：to id/ex*/
    output [          `ysyx_041514_IMM_LEN-1:0] csr_imm_o,
    output                                      csr_imm_valid_o,
    output [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_idx_o,
    output [             `ysyx_041514_XLEN_BUS] csr_readdata_o,

    output [`ysyx_041514_ALUOP_LEN-1:0] alu_op_o,  // alu 操作码
    output [`ysyx_041514_MEMOP_LEN-1:0] mem_op_o,  // mem 操作码
    output [`ysyx_041514_EXCOP_LEN-1:0] exc_op_o,  // exc 操作码
    // output [ `ysyx_041514_PCOP_LEN-1:0] pc_op_o,   // pc 操作码
    output [`ysyx_041514_CSROP_LEN-1:0] csr_op_o,  // csr 操作码


    output [`ysyx_041514_XLEN_BUS] inst_addr_o,
    output [`ysyx_041514_INST_LEN-1:0] inst_data_o,
    // 请求暂停流水线
    output _load_use_valid_o,
    /* TARP 总线 */
    output wire [`ysyx_041514_TRAP_BUS] trap_bus_o

);
  assign inst_addr_o = inst_addr_i;
  assign inst_data_o = inst_data_i;





  wire [`ysyx_041514_INST_LEN-1:0] _inst = inst_data_i;
  /* 指令分解 */
  wire [4:0] _rd = _inst[11:7];
  wire [2:0] _func3 = _inst[14:12];
  wire [4:0] _rs1 = _inst[19:15];
  wire [4:0] _rs2 = _inst[24:20];
  wire [6:0] _func7 = _inst[31:25];
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr = _inst[31:20];  // CSR 地址

  // 不同指令类型的立即数
  wire [`ysyx_041514_IMM_LEN-1:0] _immI = {{21 + 32{_inst[31]}}, _inst[30:20]};
  wire [`ysyx_041514_IMM_LEN-1:0] _immS = {
    {21 + 32{_inst[31]}}, _inst[30:25], _inst[11:8], _inst[7]
  };
  wire [`ysyx_041514_IMM_LEN-1:0] _immB = {
    {20 + 32{_inst[31]}}, _inst[7], _inst[30:25], _inst[11:8], 1'b0
  };
  wire [`ysyx_041514_IMM_LEN-1:0] _immU = {
    {1 + 32{_inst[31]}}, _inst[30:20], _inst[19:12], 12'b0
  };
  wire [`ysyx_041514_IMM_LEN-1:0] _immJ = {
    {12 + 32{_inst[31]}}, _inst[19:12], _inst[20], _inst[30:25], _inst[24:21], 1'b0
  };
  wire [`ysyx_041514_IMM_LEN-1:0] _immCSR = {59'b0, _inst[19:15]};



  /* 分解_opcode */
  wire [6:0] _opcode = _inst[6:0];
  /* 1:0 */
  // wire _opcode_1_0_00 = (_opcode[1:0] == 2'b00);
  // wire _opcode_1_0_01 = (_opcode[1:0] == 2'b01);
  // wire _opcode_1_0_10 = (_opcode[1:0] == 2'b10);
  wire _opcode_1_0_11 = (_opcode[1:0] == 2'b11);
  /* 4:2 */
  wire _opcode_4_2_000 = (_opcode[4:2] == 3'b000);
  wire _opcode_4_2_001 = (_opcode[4:2] == 3'b001);
  // wire _opcode_4_2_010 = (_opcode[4:2] == 3'b010);
  wire _opcode_4_2_011 = (_opcode[4:2] == 3'b011);
  wire _opcode_4_2_100 = (_opcode[4:2] == 3'b100);
  wire _opcode_4_2_101 = (_opcode[4:2] == 3'b101);
  wire _opcode_4_2_110 = (_opcode[4:2] == 3'b110);
  // wire _opcode_4_2_111 = (_opcode[4:2] == 3'b111);
  /* 6:5 */
  wire _opcode_6_5_00 = (_opcode[6:5] == 2'b00);
  wire _opcode_6_5_01 = (_opcode[6:5] == 2'b01);
  // wire _opcode_6_5_10 = (_opcode[6:5] == 2'b10);
  wire _opcode_6_5_11 = (_opcode[6:5] == 2'b11);
  /* 分解 func3 */
  wire _func3_000 = (_func3 == 3'b000);
  wire _func3_001 = (_func3 == 3'b001);
  wire _func3_010 = (_func3 == 3'b010);
  wire _func3_011 = (_func3 == 3'b011);
  wire _func3_100 = (_func3 == 3'b100);
  wire _func3_101 = (_func3 == 3'b101);
  wire _func3_110 = (_func3 == 3'b110);
  wire _func3_111 = (_func3 == 3'b111);

  /* 分解func7 */
  wire _func7_0000000 = (_func7 == 7'b0000000);
  wire _func7_0100000 = (_func7 == 7'b0100000);
  wire _func7_0000001 = (_func7 == 7'b0000001);
  // wire _func7_0000101 = (_func7 == 7'b0000101);
  // wire _func7_0001001 = (_func7 == 7'b0001001);
  // wire _func7_0001101 = (_func7 == 7'b0001101);
  // wire _func7_0010101 = (_func7 == 7'b0010101);
  // wire _func7_0100001 = (_func7 == 7'b0100001);
  // wire _func7_0010001 = (_func7 == 7'b0010001);
  // wire _func7_0101101 = (_func7 == 7'b0101101);
  // wire _func7_1111111 = (_func7 == 7'b1111111);
  // wire _func7_0000100 = (_func7 == 7'b0000100);
  // wire _func7_0001000 = (_func7 == 7'b0001000);
  // wire _func7_0001100 = (_func7 == 7'b0001100);
  // wire _func7_0101100 = (_func7 == 7'b0101100);
  // wire _func7_0010000 = (_func7 == 7'b0010000);
  // wire _func7_0010100 = (_func7 == 7'b0010100);
  // wire _func7_1100000 = (_func7 == 7'b1100000);
  // wire _func7_1110000 = (_func7 == 7'b1110000);
  // wire _func7_1010000 = (_func7 == 7'b1010000);
  // wire _func7_1101000 = (_func7 == 7'b1101000);
  // wire _func7_1111000 = (_func7 == 7'b1111000);
  // wire _func7_1010001 = (_func7 == 7'b1010001);
  // wire _func7_1110001 = (_func7 == 7'b1110001);
  // wire _func7_1100001 = (_func7 == 7'b1100001);
  // wire _func7_1101001 = (_func7 == 7'b1101001);

  /* 指令类型,具体参考手册 */
  /* 000 */
  wire _type_load = _opcode_6_5_00 & _opcode_4_2_000 & _opcode_1_0_11;
  wire _type_store = _opcode_6_5_01 & _opcode_4_2_000 & _opcode_1_0_11;
  //wire _type_madd = _opcode_6_5_10 & _opcode_4_2_000 & _opcode_1_0_11;
  wire _type_branch = _opcode_6_5_11 & _opcode_4_2_000 & _opcode_1_0_11;
  /* 001 */
  // wire _type_load_fp = _opcode_6_5_00 & _opcode_4_2_001 & _opcode_1_0_11;
  // wire _type_store_fp = _opcode_6_5_01 & _opcode_4_2_001 & _opcode_1_0_11;
  // wire _type_msub = _opcode_6_5_10 & _opcode_4_2_001 & _opcode_1_0_11;
  wire _type_jalr = _opcode_6_5_11 & _opcode_4_2_001 & _opcode_1_0_11;
  /* 010 */
  // wire _type_custom0 = _opcode_6_5_00 & _opcode_4_2_010 & _opcode_1_0_11;
  // wire _type_custom1 = _opcode_6_5_01 & _opcode_4_2_010 & _opcode_1_0_11;
  // wire _type_nmsub = _opcode_6_5_10 & _opcode_4_2_010 & _opcode_1_0_11;
  // wire _type_resved0 = _opcode_6_5_11 & _opcode_4_2_010 & _opcode_1_0_11;
  /* 011 */
  wire _type_miscmem = _opcode_6_5_00 & _opcode_4_2_011 & _opcode_1_0_11;
  // wire _type_amo = _opcode_6_5_01 & _opcode_4_2_011 & _opcode_1_0_11;
  // wire _type_nmadd = _opcode_6_5_10 & _opcode_4_2_011 & _opcode_1_0_11;
  wire _type_jal = _opcode_6_5_11 & _opcode_4_2_011 & _opcode_1_0_11;
  /* 100 */
  wire _type_op_imm = _opcode_6_5_00 & _opcode_4_2_100 & _opcode_1_0_11;
  wire _type_op = _opcode_6_5_01 & _opcode_4_2_100 & _opcode_1_0_11;
  // wire _type_op_fp = _opcode_6_5_10 & _opcode_4_2_100 & _opcode_1_0_11;
  wire _type_system = _opcode_6_5_11 & _opcode_4_2_100 & _opcode_1_0_11;
  /* 101 */
  wire _type_auipc = _opcode_6_5_00 & _opcode_4_2_101 & _opcode_1_0_11;
  wire _type_lui = _opcode_6_5_01 & _opcode_4_2_101 & _opcode_1_0_11;
  // wire _type_resved1 = _opcode_6_5_10 & _opcode_4_2_101 & _opcode_1_0_11;
  // wire _type_resved2 = _opcode_6_5_11 & _opcode_4_2_101 & _opcode_1_0_11;
  /* 110 */
  wire _type_op_imm_32 = _opcode_6_5_00 & _opcode_4_2_110 & _opcode_1_0_11;
  wire _type_op_32 = _opcode_6_5_01 & _opcode_4_2_110 & _opcode_1_0_11;
  // wire _type_custom2 = _opcode_6_5_10 & _opcode_4_2_110 & _opcode_1_0_11;
  // wire _type_custom3 = _opcode_6_5_11 & _opcode_4_2_110 & _opcode_1_0_11;

  /******************************RV64I Base Instruction************************************/
  /* _type_lui */
  wire _inst_lui = _type_lui;
  /* _type_auipc */
  wire _inst_auipc = _type_auipc;
  /* _type_jal */
  wire _inst_jal = _type_jal;
  /* _type_jalr */
  wire _inst_jalr = _type_jalr & _func3_000;
  /* _type_branch */
  wire _inst_beq = _type_branch & _func3_000;
  wire _inst_bne = _type_branch & _func3_001;
  wire _inst_blt = _type_branch & _func3_100;
  wire _inst_bge = _type_branch & _func3_101;
  wire _inst_bltu = _type_branch & _func3_110;
  wire _inst_bgeu = _type_branch & _func3_111;

  /* _type_load */
  wire _inst_lb = _type_load & _func3_000;
  wire _inst_lh = _type_load & _func3_001;
  wire _inst_lw = _type_load & _func3_010;
  wire _inst_lbu = _type_load & _func3_100;
  wire _inst_lhu = _type_load & _func3_101;

  // rv64 only
  wire _inst_lwu = _type_load & _func3_110;
  wire _inst_ld = _type_load & _func3_011;

  /* _type_store */
  wire _inst_sb = _type_store & _func3_000;
  wire _inst_sh = _type_store & _func3_001;
  wire _inst_sw = _type_store & _func3_010;

  // rv64 only
  wire _inst_sd = _type_store & _func3_011;


  /*_type_op_imm*/
  wire _inst_addi = _type_op_imm & _func3_000;
  wire _inst_slti = _type_op_imm & _func3_010;
  wire _inst_sltiu = _type_op_imm & _func3_011;
  wire _inst_xori = _type_op_imm & _func3_100;
  wire _inst_ori = _type_op_imm & _func3_110;
  wire _inst_andi = _type_op_imm & _func3_111;

  // rv64 only 
  wire _inst_slli = _type_op_imm & _func3_001 & (_func7[6:1] == 6'b000000);
  wire _inst_srli = _type_op_imm & _func3_101 & (_func7[6:1] == 6'b000000);
  wire _inst_srai = _type_op_imm & _func3_101 & (_func7[6:1] == 6'b010000);

  // // rv32 
  // wire _inst_slli = _type_op_imm & _func3_001 & _func7_0000000;
  // wire _inst_srli = _type_op_imm & _func3_101 & _func7_0000000;
  // wire _inst_srai = _type_op_imm & _func3_101 & _func7_0100000;

  /* _type_op */
  wire _inst_add = _type_op & _func3_000 & _func7_0000000;
  wire _inst_sub = _type_op & _func3_000 & _func7_0100000;
  wire _inst_sll = _type_op & _func3_001 & _func7_0000000;
  wire _inst_slt = _type_op & _func3_010 & _func7_0000000;
  wire _inst_sltu = _type_op & _func3_011 & _func7_0000000;
  wire _inst_xor = _type_op & _func3_100 & _func7_0000000;
  wire _inst_srl = _type_op & _func3_101 & _func7_0000000;
  wire _inst_sra = _type_op & _func3_101 & _func7_0100000;
  wire _inst_or = _type_op & _func3_110 & _func7_0000000;
  wire _inst_and = _type_op & _func3_111 & _func7_0000000;
  /* _type_op_32 */
  // rv64 only  
  wire _inst_addw = _type_op_32 & _func3_000 & _func7_0000000;
  wire _inst_subw = _type_op_32 & _func3_000 & _func7_0100000;
  wire _inst_sllw = _type_op_32 & _func3_001 & _func7_0000000;
  wire _inst_srlw = _type_op_32 & _func3_101 & _func7_0000000;
  wire _inst_sraw = _type_op_32 & _func3_101 & _func7_0100000;

  /* _type_op_imm_32 */
  // rv64 only
  wire _inst_addiw = _type_op_imm_32 & _func3_000;
  wire _inst_slliw = _type_op_imm_32 & _func3_001 & _func7_0000000;
  wire _inst_srliw = _type_op_imm_32 & _func3_101 & _func7_0000000;
  wire _inst_sraiw = _type_op_imm_32 & _func3_101 & _func7_0100000;


  /* _type_system */

  wire _inst_ecall = _type_system & _func3_000 & (_inst[31:20] == 12'b0000_0000_0000);
  wire _inst_ebreak = _type_system & _func3_000 & (_inst[31:20] == 12'b0000_0000_0001);


  // CSR
  wire _inst_csrrw = _type_system & _func3_001;
  wire _inst_csrrs = _type_system & _func3_010;
  wire _inst_csrrc = _type_system & _func3_011;
  wire _inst_csrrwi = _type_system & _func3_101;
  wire _inst_csrrsi = _type_system & _func3_110;
  wire _inst_csrrci = _type_system & _func3_111;

  wire _inst_mret = _type_system & _func3_000 & (_inst[31:20] == 12'b0011_0000_0010);
  // wire _inst_dret = _type_system & _func3_000 & (_inst[31:20] == 12'b0111_1011_0010);
  // wire _inst_wfi = _type_system & _func3_000 & (_inst[31:20] == 12'b0001_0000_0101);

  /*_type_miscmem*/
  // wire _inst_fence = _type_miscmem & _func3_000;
  wire _inst_fence_i = _type_miscmem & _func3_001;


  /******************************RV64M Instruction************************************/
  /* _type_op */
  wire _inst_mul = _type_op & _func3_000 & _func7_0000001;
  wire _inst_mulh = _type_op & _func3_001 & _func7_0000001;
  wire _inst_mulhsu = _type_op & _func3_010 & _func7_0000001;
  wire _inst_mulhu = _type_op & _func3_011 & _func7_0000001;
  wire _inst_div = _type_op & _func3_100 & _func7_0000001;
  wire _inst_divu = _type_op & _func3_101 & _func7_0000001;
  wire _inst_rem = _type_op & _func3_110 & _func7_0000001;
  wire _inst_remu = _type_op & _func3_111 & _func7_0000001;

  /* _type_op_32 */
  // rv64 only
  wire _inst_mulw = _type_op_32 & _func3_000 & _func7_0000001;
  wire _inst_divw = _type_op_32 & _func3_100 & _func7_0000001;
  wire _inst_divuw = _type_op_32 & _func3_101 & _func7_0000001;
  wire _inst_remw = _type_op_32 & _func3_110 & _func7_0000001;
  wire _inst_remuw = _type_op_32 & _func3_111 & _func7_0000001;

  /* 将指令分为 R I S B U J 六类，便于获得操作数 TODO:还有一些没有添加*/
  wire _R_type = _type_op | _type_op_32;
  wire _I_type = _type_load | _type_op_imm | _type_op_imm_32 | _type_jalr | _type_system;
  wire _S_type = _type_store;
  wire _B_type = _type_branch;
  wire _U_type = _type_auipc | _type_lui;
  wire _J_type = _type_jal;
  // 无效指令_type_miscmem
  wire _NONE_type = ~(_R_type | _I_type | _S_type | _U_type | _J_type | _B_type | _type_miscmem);

  /*获取操作数  */  //TODO:一些特殊指令没有归类ecall,ebreak
  // wire _isNeed_imm = (_I_type | _S_type | _B_type | _U_type | _J_type);
  wire _csr_imm_valid = (_inst_csrrci | _inst_csrrsi | _inst_csrrwi);

  // I 型指令中, CSR 立即数占了 rs1 的位置
  wire _isNeed_rs1 = (_R_type | _I_type | _S_type | _B_type) & (~_csr_imm_valid);
  wire _isNeed_rs2 = (_R_type | _S_type | _B_type);
  wire _isNeed_rd = (_R_type | _I_type | _U_type | _J_type);
  wire _isNeed_csr = (_inst_csrrc|_inst_csrrci|_inst_csrrs|_inst_csrrsi|_inst_csrrw|_inst_csrrwi);

  wire [4:0] _rs1_idx = (_isNeed_rs1) ? _rs1 : 5'b0;
  wire [4:0] _rs2_idx = (_isNeed_rs2) ? _rs2 : 5'b0;
  wire [4:0] _rd_idx = (_isNeed_rd) ? _rd : 5'b0;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_idx = (_isNeed_csr) ? _csr : `ysyx_041514_CSR_REG_ADDRWIDTH'b0;


  /* assign 实现多路选择器：根据指令类型选立即数 */
  wire [`ysyx_041514_IMM_LEN-1:0] _imm_data = ({`ysyx_041514_IMM_LEN{_I_type}}&_immI) |
                                  ({`ysyx_041514_IMM_LEN{_S_type}}&_immS) |
                                  ({`ysyx_041514_IMM_LEN{_B_type}}&_immB) |
                                  ({`ysyx_041514_IMM_LEN{_U_type}}&_immU) |
                                  ({`ysyx_041514_IMM_LEN{_J_type}}&_immJ);

  /* 输出指定 */
  assign rs1_idx_o = _rs1_idx;
  assign rs2_idx_o = _rs2_idx;
  assign rd_idx_o = _rd_idx;
  assign csr_idx_o = _csr_idx;
  assign imm_data_o = _imm_data;

  // CSR 中的立即数 特殊处理
  assign csr_imm_valid_o = _csr_imm_valid;
  assign csr_imm_o = _immCSR;

  /******************************************通用寄存器 bypass ***************************************************/


  // 0 号寄存器特殊处理，不然出错
  wire _rs1_idx_not_zero = (_rs1_idx != `ysyx_041514_REG_ADDRWIDTH'b0);
  wire _rs2_idx_not_zero = (_rs2_idx != `ysyx_041514_REG_ADDRWIDTH'b0);

  // exc stage bypass
  wire _rs1_exc_bypass_valid = (_rs1_idx == ex_rd_addr_i) && (_rs1_idx_not_zero);
  wire _rs2_exc_bypass_valid = (_rs2_idx == ex_rd_addr_i) && (_rs2_idx_not_zero);
  // mem stage bypass
  wire _rs1_mem_bypass_valid = (_rs1_idx == mem_rd_addr_i) && (_rs1_idx_not_zero);
  wire _rs2_mem_bypass_valid = (_rs2_idx == mem_rd_addr_i) && (_rs2_idx_not_zero);
  // wb stage bypass was enabled in gpr


  // 优先级选择权 ex > mem > wb > gpr (wb 和 gpr 的优先级在通用寄存器堆中实现)
  wire [`ysyx_041514_XLEN_BUS] _rs1_data = (_rs1_exc_bypass_valid)?ex_rd_data_i:
                                (_rs1_mem_bypass_valid)?mem_rd_data_i:
                                rs1_data_i;
  // 优先级选择权 ex > mem > wb > gpr
  wire [`ysyx_041514_XLEN_BUS] _rs2_data = (_rs2_exc_bypass_valid)?ex_rd_data_i:
                                (_rs2_mem_bypass_valid)?mem_rd_data_i:
                                rs2_data_i;


  /* load-use hazard: 前一条指令为 load 类型，且下一条 rs1、rs2 为 load 指令的 rd，*/
  // https://courses.cs.vt.edu/cs2506/Spring2013/Notes/L12.PipelineStalls.pdf
  wire _pre_inst_is_load = id_ex_exc_op_i[`ysyx_041514_EXCOP_LOAD];
  wire _load_use_data_hazard_valid = _pre_inst_is_load & (_rs1_exc_bypass_valid | _rs2_exc_bypass_valid);


  // 输出指定
  assign rs1_data_o = _rs1_data;
  assign rs2_data_o = _rs2_data;
  assign _load_use_valid_o = _load_use_data_hazard_valid;


  /***************CSR 寄存器冲突处理*****************/
  // TODO 添加 csr 数据旁路
  assign csr_readdata_o = csr_data_i;

  /******************************************×××××××***************************************************/

  /* CSR_OP */
  wire _csr_write = (_inst_csrrw | _inst_csrrwi);
  wire _csr_set = (_inst_csrrs | _inst_csrrsi) & _rs1_idx_not_zero;
  wire _csr_clear = (_inst_csrrc | _inst_csrrci) & _rs1_idx_not_zero;
  // CSRRSI/CSRRCI must not write 0 to CSRs (uimm[4:0]=='0)
  // CSRRS/CSRRC must not write from x0 to CSRs (rs1=='0)
  wire _csr_read = (_csr_set | _csr_clear) & (~_rs1_idx_not_zero);
  wire _csr_none = ~(_csr_write | _csr_set | _csr_clear | _csr_read);
  // read 优先级高
  // wire [`ysyx_041514_CSROP_LEN-1:0]_csr_op = (_csr_read)?`ysyx_041514_CSROP_READ:(
  //                ({`ysyx_041514_CSROP_LEN{_csr_write}}&`ysyx_041514_CSROP_WRITE)|
  //                ({`ysyx_041514_CSROP_LEN{_csr_set}}&`ysyx_041514_CSROP_SET)|
  //                ({`ysyx_041514_CSROP_LEN{_csr_clear}}&`ysyx_041514_CSROP_CLEAR));
  wire [`ysyx_041514_CSROP_LEN-1:0] _csr_op;
  assign _csr_op[`ysyx_041514_CSROP_NONE] = _csr_none;
  assign _csr_op[`ysyx_041514_CSROP_READ] = _csr_read;
  assign _csr_op[`ysyx_041514_CSROP_WRITE] = _csr_write;
  assign _csr_op[`ysyx_041514_CSROP_SET] = _csr_set;
  assign _csr_op[`ysyx_041514_CSROP_CLEAR] = _csr_clear;

  assign csr_op_o = _csr_op;

  /* ALU_OP */
  //加减和逻辑
  wire _alu_add = _inst_add |_inst_addw |_inst_addi |_inst_addiw| _type_load 
                  | _type_store | _inst_jal |_inst_jalr |_inst_auipc | _inst_lui|_isNeed_csr;
  wire _alu_sub = _inst_sub | _inst_subw;
  wire _alu_xor = _inst_xor | _inst_xori;
  wire _alu_and = _inst_and | _inst_andi;
  wire _alu_or = _inst_or | _inst_ori;
  //移位
  wire _alu_sll = _inst_sll | _inst_slli;
  wire _alu_srl = _inst_srl | _inst_srli;
  wire _alu_sra = _inst_sra | _inst_srai;
  wire _alu_sllw = _inst_slliw | _inst_sllw;
  wire _alu_srlw = _inst_srliw | _inst_srlw;
  wire _alu_sraw = _inst_sraiw | _inst_sraw;
  //比较
  wire _alu_slt = _inst_slt | _inst_slti;
  wire _alu_sltu = _inst_sltu | _inst_sltiu;
  wire _alu_beq = _inst_beq;
  wire _alu_bne = _inst_bne;
  wire _alu_blt = _inst_blt;
  wire _alu_bge = _inst_bge;
  wire _alu_bltu = _inst_bltu;
  wire _alu_bgeu = _inst_bgeu;
  //定点乘法
  wire _alu_mul = _inst_mul;
  wire _alu_mulh = _inst_mulh;
  wire _alu_mulhsu = _inst_mulhsu;
  wire _alu_mulhu = _inst_mulhu;
  wire _alu_mulw = _inst_mulw;
  //定点除法
  wire _alu_div = _inst_div;
  wire _alu_divu = _inst_divu;
  wire _alu_rem = _inst_rem;
  wire _alu_remu = _inst_remu;
  wire _alu_divw = _inst_divw;
  wire _alu_divuw = _inst_divuw;
  wire _alu_remw = _inst_remw;
  wire _alu_remuw = _inst_remuw;



  // // ALU 计算结果是否需要符号扩展,放在 execute 下实现
  // wire _alu_sext = _type_op_imm_32 | _type_op_32;

  /* alu_op */
  wire [`ysyx_041514_ALUOP_LEN-1:0] _alu_op;
  assign _alu_op[`ysyx_041514_ALUOP_NONE] = 'b0;  // TODO 以后处理
  assign _alu_op[`ysyx_041514_ALUOP_ADD] = _alu_add;
  assign _alu_op[`ysyx_041514_ALUOP_SUB] = _alu_sub;
  assign _alu_op[`ysyx_041514_ALUOP_XOR] = _alu_xor;
  assign _alu_op[`ysyx_041514_ALUOP_OR] = _alu_or;
  assign _alu_op[`ysyx_041514_ALUOP_AND] = _alu_and;
  assign _alu_op[`ysyx_041514_ALUOP_SLL] = _alu_sll;
  assign _alu_op[`ysyx_041514_ALUOP_SRL] = _alu_srl;
  assign _alu_op[`ysyx_041514_ALUOP_SRA] = _alu_sra;
  assign _alu_op[`ysyx_041514_ALUOP_SLLW] = _alu_sllw;
  assign _alu_op[`ysyx_041514_ALUOP_SRLW] = _alu_srlw;
  assign _alu_op[`ysyx_041514_ALUOP_SRAW] = _alu_sraw;
  assign _alu_op[`ysyx_041514_ALUOP_SLT] = _alu_slt;
  assign _alu_op[`ysyx_041514_ALUOP_SLTU] = _alu_sltu;
  assign _alu_op[`ysyx_041514_ALUOP_BEQ] = _alu_beq;
  assign _alu_op[`ysyx_041514_ALUOP_BNE] = _alu_bne;
  assign _alu_op[`ysyx_041514_ALUOP_BLT] = _alu_blt;
  assign _alu_op[`ysyx_041514_ALUOP_BGE] = _alu_bge;
  assign _alu_op[`ysyx_041514_ALUOP_BLTU] = _alu_bltu;
  assign _alu_op[`ysyx_041514_ALUOP_BGEU] = _alu_bgeu;
  assign _alu_op[`ysyx_041514_ALUOP_MUL] = _alu_mul;
  assign _alu_op[`ysyx_041514_ALUOP_MULH] = _alu_mulh;
  assign _alu_op[`ysyx_041514_ALUOP_MULHSU] = _alu_mulhsu;
  assign _alu_op[`ysyx_041514_ALUOP_MULHU] = _alu_mulhu;
  assign _alu_op[`ysyx_041514_ALUOP_MULW] = _alu_mulw;
  assign _alu_op[`ysyx_041514_ALUOP_DIV] = _alu_div;
  assign _alu_op[`ysyx_041514_ALUOP_DIVU] = _alu_divu;
  assign _alu_op[`ysyx_041514_ALUOP_REM] = _alu_rem;
  assign _alu_op[`ysyx_041514_ALUOP_REMU] = _alu_remu;
  assign _alu_op[`ysyx_041514_ALUOP_DIVW] = _alu_divw;
  assign _alu_op[`ysyx_041514_ALUOP_DIVUW] = _alu_divuw;
  assign _alu_op[`ysyx_041514_ALUOP_REMW] = _alu_remw;
  assign _alu_op[`ysyx_041514_ALUOP_REMUW] = _alu_remuw;


  assign alu_op_o = _alu_op;

  /* EXC_OP */

  wire [`ysyx_041514_EXCOP_LEN-1:0] _exc_op;
  assign _exc_op[`ysyx_041514_EXCOP_NONE] = 'b0;  // TODO 以后处理
  assign _exc_op[`ysyx_041514_EXCOP_AUIPC] = _type_auipc;
  assign _exc_op[`ysyx_041514_EXCOP_LUI] = _type_lui;
  assign _exc_op[`ysyx_041514_EXCOP_JAL] = _type_jal;
  assign _exc_op[`ysyx_041514_EXCOP_JALR] = _type_jalr;
  assign _exc_op[`ysyx_041514_EXCOP_LOAD] = _type_load;
  assign _exc_op[`ysyx_041514_EXCOP_STORE] = _type_store;
  assign _exc_op[`ysyx_041514_EXCOP_BRANCH] = _type_branch;
  assign _exc_op[`ysyx_041514_EXCOP_OPIMM] = _type_op_imm;
  assign _exc_op[`ysyx_041514_EXCOP_OPIMM32] = _type_op_imm_32;
  assign _exc_op[`ysyx_041514_EXCOP_OP] = _type_op;
  assign _exc_op[`ysyx_041514_EXCOP_OP32] = _type_op_32;
  assign _exc_op[`ysyx_041514_EXCOP_CSR] = _isNeed_csr;


  assign exc_op_o = _exc_op;


  /* MEM_OP */

  wire [`ysyx_041514_MEMOP_LEN-1:0] _mem_op;
  assign _mem_op[`ysyx_041514_MEMOP_NONE] = 'b0;
  assign _mem_op[`ysyx_041514_MEMOP_LB] = _inst_lb;
  assign _mem_op[`ysyx_041514_MEMOP_LBU] = _inst_lbu;
  assign _mem_op[`ysyx_041514_MEMOP_LH] = _inst_lh;
  assign _mem_op[`ysyx_041514_MEMOP_LW] = _inst_lw;
  assign _mem_op[`ysyx_041514_MEMOP_LHU] = _inst_lhu;
  assign _mem_op[`ysyx_041514_MEMOP_SB] = _inst_sb;
  assign _mem_op[`ysyx_041514_MEMOP_SH] = _inst_sh;
  assign _mem_op[`ysyx_041514_MEMOP_SW] = _inst_sw;
  assign _mem_op[`ysyx_041514_MEMOP_LWU] = _inst_lwu;
  assign _mem_op[`ysyx_041514_MEMOP_LD] = _inst_ld;
  assign _mem_op[`ysyx_041514_MEMOP_SD] = _inst_sd;
  assign _mem_op[`ysyx_041514_MEMOP_FENCEI] = _inst_fence_i;


  assign mem_op_o = _mem_op;



  /* trap_bus TODO:add more*/

  wire _Illegal_instruction = _NONE_type;


  reg [`ysyx_041514_TRAP_BUS] _decode_trap_bus;
  integer i;
  always @(*) begin
    for (i = 0; i < `ysyx_041514_TRAP_LEN; i = i + 1) begin
      if (i == `ysyx_041514_TRAP_MRET) begin
        _decode_trap_bus[i] = _inst_mret;
      end else if (i == `ysyx_041514_TRAP_EBREAK) begin
        _decode_trap_bus[i] = _inst_ebreak;
      end else if (i == `ysyx_041514_TRAP_ECALL_M) begin  // TODO 权限设置
        _decode_trap_bus[i] = _inst_ecall;
      end else if (i == `ysyx_041514_TRAP_ILLEGAL_INST) begin
        _decode_trap_bus[i] = _Illegal_instruction;
      end else begin
        _decode_trap_bus[i] = trap_bus_i[i];
      end
    end
  end
  assign trap_bus_o = _decode_trap_bus;

endmodule

 
/**
* 取指模块
* 组合逻辑电路,仅仅起到传递作用,PC寄存器位于 IF/ID 
*/
module ysyx_041514_fetch (
    //指令地址
    // input rst,
    input [`ysyx_041514_XLEN_BUS] inst_addr_i,  // from pc_reg
    input if_rdata_valid_i,  // 读数据是否准备好
    input [`ysyx_041514_XLEN_BUS] if_rdata_i,

    /* bru */
    // output [`ysyx_041514_XLEN_BUS] bpu_pc_o,
    output [`ysyx_041514_XLEN_BUS] bpu_pc_op1_o,
    output [`ysyx_041514_XLEN_BUS] bpu_pc_op2_o,
    output bpu_pc_valid_o,
    /* stall req */
    output ram_stall_valid_if_o,  // if 阶段访存暂停
    /* to if/id */
    output [`ysyx_041514_XLEN_BUS] inst_addr_o,
    output [`ysyx_041514_INST_LEN-1:0] inst_data_o,
    output [`ysyx_041514_TRAP_BUS] trap_bus_o
);


  assign inst_addr_o = inst_addr_i;

  // 选择读取数据
  //wire [`ysyx_041514_NPC_ADDR_BUS] _inst_data = (if_rdata_valid_i) ? if_rdata_i[31:0] : `ysyx_041514_INST_NOP;
  wire [`ysyx_041514_NPC_ADDR_BUS] _inst_data = if_rdata_i[31:0];

  // 若 icache 数据没有准备好,发出 stall 请求,暂停流水线
  wire _ram_stall = (!if_rdata_valid_i);

  assign ram_stall_valid_if_o = _ram_stall;
  assign inst_data_o = _inst_data;


  /* bru */

  ysyx_041514_bpu_top u_ysyx_041514_bru_top (
      .inst_data_i   ({32'b0, _inst_data}),
      .pc_if_i       (inst_addr_i),
      .bpu_pc_op1_o  (bpu_pc_op1_o),
      .bpu_pc_op2_o  (bpu_pc_op2_o),
      .bpu_pc_valid_o(bpu_pc_valid_o)
  );

  /***********************TRAP**********************/
  wire _Instruction_address_misaligned = `ysyx_041514_FALSE;
  wire _Instruction_access_fault = `ysyx_041514_FALSE;
  wire _Instruction_page_fault = `ysyx_041514_FALSE;

  reg [`ysyx_041514_TRAP_BUS] _if_trap_bus;
  integer i;
  always @(*) begin
    for (i = 0; i < `ysyx_041514_TRAP_LEN; i = i + 1) begin
      if (i == `ysyx_041514_TRAP_INST_ADDR_MISALIGNED) begin
        _if_trap_bus[i] = _Instruction_address_misaligned;
      end else if (i == `ysyx_041514_TRAP_INST_ACCESS_FAULT) begin
        _if_trap_bus[i] = _Instruction_access_fault;
      end else if (i == `ysyx_041514_TRAP_INST_PAGE_FAULT) begin
        _if_trap_bus[i] = _Instruction_page_fault;
      end else begin
        _if_trap_bus[i] = `ysyx_041514_FALSE;
      end
    end
  end
  assign trap_bus_o = _if_trap_bus;


endmodule
 


module ysyx_041514_icache_data #(
    IDX_LEN = 6,  // 组号 长度
    BLK_LEN = 6   // 块内地址 长度
    // TAG_NUM = 64  // tag 个数
) (
    // input                          clk,
    // input                          rst,
    input  [          IDX_LEN-1:0] icache_index_i,       // index
    input  [          BLK_LEN-1:0] icache_blk_addr_i,
    input  [              128-1:0] icache_line_wdata_i,
    input  [              128-1:0] icache_wmask,
    input  [                  2:0] burst_count_i,
    input                          icache_wen_i,
    output [`ysyx_041514_XLEN_BUS] icache_rdata_o,
    /* sram */
    output [                  5:0] io_sram4_addr,
    output                         io_sram4_cen,
    output                         io_sram4_wen,
    output [                127:0] io_sram4_wmask,
    output [                127:0] io_sram4_wdata,
    input  [                127:0] io_sram4_rdata,
    output [                  5:0] io_sram5_addr,
    output                         io_sram5_cen,
    output                         io_sram5_wen,
    output [                127:0] io_sram5_wmask,
    output [                127:0] io_sram5_wdata,
    input  [                127:0] io_sram5_rdata,
    output [                  5:0] io_sram6_addr,
    output                         io_sram6_cen,
    output                         io_sram6_wen,
    output [                127:0] io_sram6_wmask,
    output [                127:0] io_sram6_wdata,
    input  [                127:0] io_sram6_rdata,
    output [                  5:0] io_sram7_addr,
    output                         io_sram7_cen,
    output                         io_sram7_wen,
    output [                127:0] io_sram7_wmask,
    output [                127:0] io_sram7_wdata,
    input  [                127:0] io_sram7_rdata
);


  wire WEN00 = ~(burst_count_i[2:1] == 2'b00 && icache_wen_i);  // 片选信号，低电平有效
  wire WEN01 = ~(burst_count_i[2:1] == 2'b01 && icache_wen_i);
  wire WEN10 = ~(burst_count_i[2:1] == 2'b10 && icache_wen_i);
  wire WEN11 = ~(burst_count_i[2:1] == 2'b11 && icache_wen_i);


  wire CEN00 = ~(icache_blk_addr_i[5:4] == 2'b00);
  wire CEN01 = ~(icache_blk_addr_i[5:4] == 2'b01);
  wire CEN10 = ~(icache_blk_addr_i[5:4] == 2'b10);
  wire CEN11 = ~(icache_blk_addr_i[5:4] == 2'b11);

  wire [127:0] Q00, Q01, Q10, Q11;  // 读数据

  wire [127:0] BWEN = ~icache_wmask;  // 写掩码
  wire [5:0] A = icache_index_i;
  wire [127:0] D = icache_line_wdata_i;

  wire [127:0] icache_ram_data = ({128{~CEN00}}&Q00)
                                 | ({128{~CEN01}}&Q01)
                                 | ({128{~CEN10}}&Q10)
                                 | ({128{~CEN11}}&Q11);


  wire [`ysyx_041514_XLEN_BUS] _icache_rdata_o = {
    32'b0, icache_ram_data[icache_blk_addr_i[3:0]*8+:32]
  };
  assign icache_rdata_o = _icache_rdata_o;


  assign io_sram4_cen = 1'b0;
  assign io_sram4_wmask = BWEN;
  assign io_sram4_addr = A;
  assign io_sram4_wdata = D;
  assign io_sram4_wen = WEN00;
  assign Q00 = io_sram4_rdata;

  assign io_sram5_cen = 1'b0;
  assign io_sram5_wmask = BWEN;
  assign io_sram5_addr = A;
  assign io_sram5_wdata = D;
  assign io_sram5_wen = WEN01;
  assign Q01 = io_sram5_rdata;

  assign io_sram6_cen = 1'b0;
  assign io_sram6_wmask = BWEN;
  assign io_sram6_addr = A;
  assign io_sram6_wdata = D;
  assign io_sram6_wen = WEN10;
  assign Q10 = io_sram6_rdata;

  assign io_sram7_cen = 1'b0;
  assign io_sram7_wmask = BWEN;
  assign io_sram7_addr = A;
  assign io_sram7_wdata = D;
  assign io_sram7_wen = WEN11;
  assign Q11 = io_sram7_rdata;

endmodule
 


module ysyx_041514_uncache_check (
    input [`ysyx_041514_NPC_ADDR_BUS] addr_check_i,
    output uncache_valid_o
);

`ifndef ysyx_041514_YSYX_SOC
  assign uncache_valid_o = addr_check_i >= `ysyx_041514_MMIO_BASE;
`else
  assign uncache_valid_o = addr_check_i < 32'h80000000;
`endif

  //   assign uncache_valid_o = 1'b1;
endmodule
 

// 写入一个周期
// 读取立即返回
module ysyx_041514_dcache_tag #(
    TAG_LEN = 20,  // tag 长度
    IDX_LEN = 6,   // 组号 长度
    TAG_NUM = 64   // tag 个数
) (
    input                clk,
    input                rst,
    input  [TAG_LEN-1:0] dcache_tag_i,       // tag
    input  [IDX_LEN-1:0] dcache_index_i,     // index
    input                dirty_bit_write_i,  //
    input                dirty_flush_i,      //
    output               dirty_bit_read_o,   //
    output [TAG_LEN-1:0] dcache_tag_o,       // 当前的 tag
    input                write_valid_i,      // 写使能
    output               dcache_hit_o
);
// 寄存器已复位
  reg [TAG_LEN-1+1:0] dcache_tag_regs[TAG_NUM-1:0];  // 最高位为脏位

  wire [TAG_LEN-1:0] read_tag;
  wire read_dirty_bit;
  assign {read_dirty_bit, read_tag} = dcache_tag_regs[dcache_index_i];

  wire _dcache_hit = (dcache_tag_i == read_tag);  // hit
  wire _dirty_bit_read = read_dirty_bit;

  assign dcache_hit_o = _dcache_hit;
  assign dcache_tag_o = read_tag;
  assign dirty_bit_read_o = _dirty_bit_read;


  /* 写入逻辑，一个周期写入 */
  integer i;
  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < TAG_NUM; i = i + 1) begin
        dcache_tag_regs[i][19:0] <= 'b0;
      end
    end else if (write_valid_i) begin
      dcache_tag_regs[dcache_index_i][19:0] <= dcache_tag_i;
    end
  end

  integer j;
  always @(posedge clk) begin
    if (rst| dirty_flush_i) begin
      for (j = 0; j < TAG_NUM; j = j + 1) begin
        dcache_tag_regs[j][20] <= 'b0;
      end
    end else if (write_valid_i) begin
      dcache_tag_regs[dcache_index_i][20] <= dirty_bit_write_i;
    end
  end


  //else 保持不变
endmodule
 


module ysyx_041514_dcache_data #(
    IDX_LEN = 6,  // 组号 长度
    BLK_LEN = 6   // 块内地址 长度
    // TAG_NUM = 64  // tag 个数
) (
    // input clk,
    // input rst,
    input [IDX_LEN-1:0] dcache_index_i,  // index
    input [BLK_LEN-1:0] dcache_blk_addr_i,
    input [128-1:0] dcache_line_wdata_i,
    input  [128-1:0] dcache_wmask,
    input [2:0] burst_count_i,
    input dcache_allocate_valid_i,
    input dcache_writeback_valid_i,
    input dcache_wen_i,
    output [`ysyx_041514_XLEN_BUS] dcache_writeback_data_o,
    output [`ysyx_041514_XLEN_BUS]    dcache_rdata_o,


    /* sram */
    output [  5:0] io_sram0_addr,
    output         io_sram0_cen,
    output         io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input  [127:0] io_sram0_rdata,
    output [  5:0] io_sram1_addr,
    output         io_sram1_cen,
    output         io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input  [127:0] io_sram1_rdata,
    output [  5:0] io_sram2_addr,
    output         io_sram2_cen,
    output         io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input  [127:0] io_sram2_rdata,
    output [  5:0] io_sram3_addr,
    output         io_sram3_cen,
    output         io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input  [127:0] io_sram3_rdata

);

  wire [127:0] Q00, Q01, Q10, Q11;  // 读数据

  wire [127:0] BWEN = ~dcache_wmask;  // 写掩码
  wire [5:0] A = dcache_index_i;  // 写地址
  wire [127:0] D = dcache_line_wdata_i;  // 写数据

  reg [`ysyx_041514_XLEN_BUS] dcache_wb_data;
  assign dcache_writeback_data_o = dcache_wb_data;
  always @(*) begin
    case (burst_count_i)
      3'd0: dcache_wb_data = Q00[63:0];
      3'd1: dcache_wb_data = Q00[127:64];
      3'd2: dcache_wb_data = Q01[63:0];
      3'd3: dcache_wb_data = Q01[127:64];
      3'd4: dcache_wb_data = Q10[63:0];
      3'd5: dcache_wb_data = Q10[127:64];
      3'd6: dcache_wb_data = Q11[63:0];
      3'd7: dcache_wb_data = Q11[127:64];
    endcase
  end


  // allocate 分配 cache line 时候片选 高点平有效
  wire allocate_CEN00 = (burst_count_i[2:1] == 2'b00 && dcache_allocate_valid_i);
  wire allocate_CEN01 = (burst_count_i[2:1] == 2'b01 && dcache_allocate_valid_i);
  wire allocate_CEN10 = (burst_count_i[2:1] == 2'b10 && dcache_allocate_valid_i);
  wire allocate_CEN11 = (burst_count_i[2:1] == 2'b11 && dcache_allocate_valid_i);


  // hit 时候 的片选 高点平有效
  wire hit_CEN00 = (dcache_blk_addr_i[5:4] == 2'b00 && ~dcache_allocate_valid_i && ~dcache_writeback_valid_i);
  wire hit_CEN01 = (dcache_blk_addr_i[5:4] == 2'b01 && ~dcache_allocate_valid_i&& ~dcache_writeback_valid_i);
  wire hit_CEN10 = (dcache_blk_addr_i[5:4] == 2'b10 && ~dcache_allocate_valid_i&& ~dcache_writeback_valid_i);
  wire hit_CEN11 = (dcache_blk_addr_i[5:4] == 2'b11 && ~dcache_allocate_valid_i&& ~dcache_writeback_valid_i);


  // 写信号 低电平有效
  wire WEN00 = ~((allocate_CEN00 | hit_CEN00) & dcache_wen_i);
  wire WEN01 = ~((allocate_CEN01 | hit_CEN01) & dcache_wen_i);
  wire WEN10 = ~((allocate_CEN10 | hit_CEN10) & dcache_wen_i);
  wire WEN11 = ~((allocate_CEN11 | hit_CEN11) & dcache_wen_i);




  wire [127:0] dcache_ram_data = ({128{hit_CEN00}}&Q00)
                                 | ({128{hit_CEN01}}&Q01)
                                 | ({128{hit_CEN10}}&Q10)
                                 | ({128{hit_CEN11}}&Q11);

  wire [`ysyx_041514_XLEN_BUS] _dcache_rdata_o = {dcache_ram_data[dcache_blk_addr_i[3:0]*8+:64]};
  assign dcache_rdata_o = _dcache_rdata_o;


  assign io_sram0_cen = 1'b0;
  assign io_sram0_wmask = BWEN;
  assign io_sram0_addr = A;
  assign io_sram0_wdata = D;
  assign io_sram0_wen = WEN00;
  assign Q00 = io_sram0_rdata;

  assign io_sram1_cen = 1'b0;
  assign io_sram1_wmask = BWEN;
  assign io_sram1_addr = A;
  assign io_sram1_wdata = D;
  assign io_sram1_wen = WEN01;
  assign Q01 = io_sram1_rdata;

  assign io_sram2_cen = 1'b0;
  assign io_sram2_wmask = BWEN;
  assign io_sram2_addr = A;
  assign io_sram2_wdata = D;
  assign io_sram2_wen = WEN10;
  assign Q10 = io_sram2_rdata;

  assign io_sram3_cen = 1'b0;
  assign io_sram3_wmask = BWEN;
  assign io_sram3_addr = A;
  assign io_sram3_wdata = D;
  assign io_sram3_wen = WEN11;
  assign Q11 = io_sram3_rdata;


endmodule
 
// 地址位宽 32,dcache<->cpu (数据64位) mem<-->dcache(数据128位)
// 连接方式 ram<-->cache<-->cpu
// cache<-->cpu : 地址线宽度:32 数据线宽度:64
/* 改造后的 dcache */
// 1. cache 总容量: 4KB (4096Byte)
// 2. cache 块大小: 64Byte
// 3. cache 块个数: 64个 (64*64Byte==4096Byte)
// 4. 映射方式 直接映射
// 5. 块内地址: 6bit(2^6==64)
// 6. 组号: 6bit（2^6==64）
// 6. tag: 32-6-6 == 20 bit 

module ysyx_041514_dcache_top (
    input clk,
    input rst,
    input mem_fencei_valid_i,
    output mem_fencei_ready_o,
    /* cpu<-->cache 端口 */
    input [`ysyx_041514_NPC_ADDR_BUS] mem_addr_i,  // CPU 的访存信息 
    input [7:0] mem_mask_i,  // 访存掩码
    input [3:0] mem_size_i,
    input mem_addr_valid_i,  // 地址是否有效，无效时，停止访问 cache
    input mem_write_valid_i,  // 1'b1,表示写;1'b0 表示读 
    input [`ysyx_041514_XLEN_BUS] mem_wdata_i,  // 写数据
    output [`ysyx_041514_XLEN_BUS] mem_rdata_o,  // dcache 返回读数据
    output mem_data_ready_o,  // dcache 读数据是否准备好(未准备好需要暂停流水线)

    /* dcache<-->mem 端口 */
    // 读端口
    output [`ysyx_041514_NPC_ADDR_BUS] ram_raddr_dcache_o,
    output                             ram_raddr_valid_dcache_o,
    output [                      7:0] ram_rmask_dcache_o,
    output [                      3:0] ram_rsize_dcache_o,
    output [                      7:0] ram_rlen_dcache_o,
    input                              ram_rdata_ready_dcache_i,
    input  [    `ysyx_041514_XLEN_BUS] ram_rdata_dcache_i,
    // 写端口
    output [`ysyx_041514_NPC_ADDR_BUS] ram_waddr_dcache_o,        // 地址
    output                             ram_waddr_valid_dcache_o,  // 地址是否准备好
    output [                      7:0] ram_wmask_dcache_o,        // 数据掩码,写入多少位
    output [                      3:0] ram_wsize_dcache_o,
    output [                      7:0] ram_wlen_dcache_o,         // 突发传输的长度
    input                              ram_wdata_ready_dcache_i,  // 数据是否已经写入
    output [    `ysyx_041514_XLEN_BUS] ram_wdata_dcache_o,        // 写入的数据


    /* sram */
    output [  5:0] io_sram0_addr,
    output         io_sram0_cen,
    output         io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input  [127:0] io_sram0_rdata,
    output [  5:0] io_sram1_addr,
    output         io_sram1_cen,
    output         io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input  [127:0] io_sram1_rdata,
    output [  5:0] io_sram2_addr,
    output         io_sram2_cen,
    output         io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input  [127:0] io_sram2_rdata,
    output [  5:0] io_sram3_addr,
    output         io_sram3_cen,
    output         io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input  [127:0] io_sram3_rdata
);
  // 寄存器已复位

`ifndef ysyx_041514_YSYX_SOC
  import "DPI-C" function void dcache_hit_count();
  import "DPI-C" function void dcache_unhit_count();
`endif


  // uncache 检查
  wire uncache;
  ysyx_041514_uncache_check u_ysyx_041514_uncache_check1 (
      .addr_check_i   (mem_addr_i),
      .uncache_valid_o(uncache)
  );


  wire fencei_valid = mem_fencei_valid_i;

  wire [5:0] cache_blk_addr;
  wire [5:0] cache_line_idx;
  wire [19:0] cache_line_tag;
  assign {cache_line_tag, cache_line_idx, cache_blk_addr} = mem_addr_i;


  wire dcache_hit;
  wire [63:0] wmask_bit;
  wire dirty_bit_read;
  wire [19:0] dcache_tag_read;
  wire [`ysyx_041514_XLEN_BUS] dcache_writeback_data;

  /* cache 命中 */
  localparam CACHE_RST = 4'd0;
  localparam CACHE_IDLE = 4'd1;
  localparam CACHE_FENCEI = 4'd2;
  localparam CACHE_MISS_ALLOCATE = 4'd3;
  localparam CACHE_WRITE_BACK = 4'd4;
  localparam CACHE_FENCEI_WRITE_BACK = 4'd5;
  localparam CACHE_FENCEI_WAIT = 4'd6;
  localparam CACHE_WRITE_MISS = 4'd7;
  localparam UNCACHE_READ = 4'd8;
  localparam UNCACHE_WRITE = 4'd9;

  reg [3:0] dcache_state;


  reg [5:0] blk_addr_reg;

  // reg [19:0] line_tag_reg;
  reg dcache_tag_wen;


  reg dcache_data_ready;
  // cache<-->mem 端口 
  reg [`ysyx_041514_NPC_ADDR_BUS] _ram_raddr_dcache_o;
  reg _ram_raddr_valid_dcache_o;
  reg [7:0] _ram_rmask_dcache_o;
  reg [3:0] _ram_rsize_dcache_o;
  reg [7:0] _ram_rlen_dcache_o;

  reg [`ysyx_041514_NPC_ADDR_BUS] _ram_waddr_dcache_o;
  reg _ram_waddr_valid_dcache_o;
  reg [7:0] _ram_wmask_dcache_o;
  reg [3:0] _ram_wsize_dcache_o;
  reg [7:0] _ram_wlen_dcache_o;
  reg [`ysyx_041514_XLEN_BUS] _ram_wdata_dcache_o;


  reg [127:0] dcache_wdata_writehit;
  reg [`ysyx_041514_XLEN_BUS] uncache_rdata;
  reg dcache_data_wen;
  reg _dirty_bit_write;
  reg dcache_write_hit_valid;
  reg fencei_ready;

  reg [127:0] dcache_wmask_writehit;


  reg [3:0] burst_count;
  wire [3:0] burst_count_plus1 = burst_count + 1;
  reg [6:0] fencei_count;
  wire [5:0] fencei_line_idx = fencei_count[5:0];
  wire [6:0] fencei_count_plus1 = fencei_count + 1;
  reg _dirty_flush;
  wire ram_r_handshake = _ram_raddr_valid_dcache_o & ram_rdata_ready_dcache_i;
  wire ram_w_handshake = _ram_waddr_valid_dcache_o & ram_wdata_ready_dcache_i;

  always @(posedge clk) begin
    if (rst) begin
      dcache_state <= CACHE_RST;
      burst_count <= 0;
      fencei_count <= 0;
      blk_addr_reg <= 0;
      //line_tag_reg <= 0;
      dcache_tag_wen <= 0;
      dcache_data_wen <= 0;
      _dirty_bit_write <= 0;
      _dirty_flush <= 0;
      fencei_ready <= 0;
      dcache_write_hit_valid <= 0;
      dcache_wdata_writehit <= 0;
      _ram_rsize_dcache_o <= 0;
      _ram_wsize_dcache_o <= 0;
      _ram_rlen_dcache_o <= 0;
      _ram_wlen_dcache_o <= 0;
      uncache_rdata <= 0;
      _ram_wdata_dcache_o <= 0;
      _ram_waddr_dcache_o <= 0;
      _ram_rmask_dcache_o <= 0;
      dcache_data_ready <= 0;
      _ram_raddr_valid_dcache_o <= `ysyx_041514_FALSE;
      _ram_waddr_valid_dcache_o <= `ysyx_041514_FALSE;
      dcache_wmask_writehit <= 0;
      _ram_raddr_dcache_o <= 0;
      _ram_wmask_dcache_o <= 0;

    end else begin
      case (dcache_state)
        CACHE_RST: begin
          dcache_state <= CACHE_IDLE;
        end
        CACHE_IDLE: begin
          blk_addr_reg <= cache_blk_addr;
          // line_tag_reg <= cache_line_tag;
          fencei_ready <= 0;
          _dirty_flush <= `ysyx_041514_FALSE;
          //dcache_wmask <= 0;
          // cache data 为单端口 ram,不能同时读写, uncache 直接访问内存
          if (mem_addr_valid_i && ~dcache_data_wen && ~uncache && ~dcache_tag_wen) begin
            case ({
              dcache_hit, mem_write_valid_i
            })
              2'b11: begin : write_hit  // TODO : 只写入 cache ，不写入内存
`ifndef ysyx_041514_YSYX_SOC
                dcache_hit_count();
`endif
                dcache_state <= CACHE_IDLE;
                //写 cache
                dcache_data_wen <= `ysyx_041514_TRUE;
                dcache_data_ready <= `ysyx_041514_TRUE;  // 完成信号
                dcache_tag_wen <= `ysyx_041514_TRUE;
                _dirty_bit_write <= `ysyx_041514_TRUE;  // 标记为脏
                dcache_write_hit_valid <= `ysyx_041514_TRUE;  //写信号
                dcache_wdata_writehit <= (mem_addr_i[3]) ? {mem_wdata_i, 64'b0} : {64'b0, mem_wdata_i};
                dcache_wmask_writehit <= (mem_addr_i[3]) ? {wmask_bit, 64'b0} : {64'b0, wmask_bit};
              end
              2'b10: begin : read_hit
`ifndef ysyx_041514_YSYX_SOC
                dcache_hit_count();
`endif
                dcache_data_ready <= `ysyx_041514_TRUE;
                dcache_state <= CACHE_IDLE;
              end
              2'b00, 2'b01: begin : miss_allocate  // miss 时 分配 cache，需要考虑脏位
`ifndef ysyx_041514_YSYX_SOC
                dcache_unhit_count();
`endif
                if (dirty_bit_read) begin  // 需要写回
                  dcache_state <= CACHE_WRITE_BACK;
                  dcache_data_ready <= `ysyx_041514_FALSE;
                  _ram_waddr_dcache_o <= {dcache_tag_read, cache_line_idx, 6'b0};  // 写地址
                  _ram_waddr_valid_dcache_o <= `ysyx_041514_TRUE;  // 地址有效
                  _ram_wmask_dcache_o <= 8'b1111_1111;  // 写掩码
                  _ram_wdata_dcache_o <= dcache_writeback_data;  // 写数据
                  _ram_wsize_dcache_o <= 4'b1000;  //写大小 8byte
                  _ram_wlen_dcache_o <= 8'd7;  // 突发 7 次
                  burst_count <= 0;  // 清空计数器
                end else begin  // 不需要写回
                  dcache_state              <= CACHE_MISS_ALLOCATE;
                  dcache_data_ready         <= `ysyx_041514_FALSE;
                  _ram_raddr_dcache_o       <= {cache_line_tag, cache_line_idx, 6'b0};  // 读地址
                  _ram_raddr_valid_dcache_o <= `ysyx_041514_TRUE;  // 地址有效
                  _ram_rmask_dcache_o       <= 8'b1111_1111;  // 读掩码
                  _ram_rsize_dcache_o       <= 4'b1000;  //读大小 8byte
                  _ram_rlen_dcache_o        <= 8'd7;  // 突发 7 次
                  burst_count               <= 0;  // 清空计数器
                end
              end
            endcase
          end else if (mem_addr_valid_i && uncache) begin : uncache_rw
            // 判断是读还是写
            if (mem_write_valid_i) begin
              dcache_state              <= UNCACHE_WRITE;
              dcache_data_ready         <= `ysyx_041514_FALSE;
              _ram_waddr_dcache_o       <= mem_addr_i;  // 写地址
              _ram_waddr_valid_dcache_o <= `ysyx_041514_TRUE;  // 地址有效
              _ram_wmask_dcache_o       <= 8'b1111_1111;  // 写掩码
              _ram_wdata_dcache_o       <= mem_wdata_i;  // 写数据
              _ram_wsize_dcache_o       <= mem_size_i;  //写大小
              _ram_wlen_dcache_o        <= 8'd0;  // 不突发
            end else begin
              dcache_state              <= UNCACHE_READ;
              dcache_data_ready         <= `ysyx_041514_FALSE;
              _ram_raddr_dcache_o       <= mem_addr_i;  // 读地址
              _ram_raddr_valid_dcache_o <= `ysyx_041514_TRUE;  // 地址有效
              _ram_rmask_dcache_o       <= 8'b1111_1111;  // 读掩码
              _ram_rsize_dcache_o       <= mem_size_i;  //读大小
              _ram_rlen_dcache_o        <= 8'd0;  // 不突发
            end

          end else if (fencei_valid) begin
            dcache_data_ready <= `ysyx_041514_FALSE;
            dcache_state <= CACHE_FENCEI_WAIT;
            fencei_count <= 0;
          end else begin
            dcache_data_ready <= `ysyx_041514_FALSE;
            _ram_raddr_valid_dcache_o <= `ysyx_041514_FALSE;
            _ram_waddr_valid_dcache_o <= `ysyx_041514_FALSE;
            dcache_tag_wen <= `ysyx_041514_FALSE;
            dcache_data_wen <= 0;
            _dirty_bit_write <= `ysyx_041514_FALSE;
            dcache_wdata_writehit <= 0;
            dcache_write_hit_valid <= `ysyx_041514_FALSE;  //写信号
          end
        end

        CACHE_MISS_ALLOCATE: begin
          if (ram_r_handshake) begin  // 在 handshake 时，向 ram 写入数据
            if (burst_count[3:0] == _ram_rlen_dcache_o[3:0]) begin  // 突发传输最后一个数据
              dcache_state              <= CACHE_IDLE;
              dcache_tag_wen            <= `ysyx_041514_TRUE;  // 写 tag 
              _dirty_bit_write          <= `ysyx_041514_FALSE;
              _ram_raddr_valid_dcache_o <= `ysyx_041514_FALSE;  // 传输结束
              burst_count               <= 0;
            end else begin
              burst_count <= burst_count_plus1;
            end
          end
        end

        CACHE_WRITE_MISS: begin
          if (_ram_waddr_valid_dcache_o & ram_wdata_ready_dcache_i) begin

            _ram_waddr_valid_dcache_o <= `ysyx_041514_FALSE;
            dcache_data_ready <= `ysyx_041514_TRUE;  // 完成信号
            dcache_state <= CACHE_IDLE;
          end
        end

        CACHE_WRITE_BACK: begin
          if (ram_w_handshake) begin
            if (burst_count == 4'd7) begin  // 收到最后一个写响应
              _ram_waddr_valid_dcache_o <= `ysyx_041514_FALSE;  // 传输结束

              // 写入 cache 中
              dcache_state              <= CACHE_MISS_ALLOCATE;
              dcache_data_ready         <= `ysyx_041514_FALSE;
              _ram_raddr_dcache_o       <= {cache_line_tag, cache_line_idx, 6'b0};  // 读地址
              _ram_raddr_valid_dcache_o <= `ysyx_041514_TRUE;  // 地址有效
              _ram_rmask_dcache_o       <= 8'b1111_1111;  // 读掩码
              _ram_rsize_dcache_o       <= 4'b1000;  //读大小 8byte
              _ram_rlen_dcache_o        <= 8'd7;  // 突发 7 次
              burst_count               <= 0;  // 清空计数器
            end else begin
              burst_count <= burst_count_plus1;
              _ram_wdata_dcache_o <= dcache_writeback_data;  // 更新写数据
            end
          end
        end
        UNCACHE_READ: begin
          if (_ram_raddr_valid_dcache_o & ram_rdata_ready_dcache_i) begin
            _ram_raddr_valid_dcache_o <= `ysyx_041514_FALSE;
            dcache_data_ready <= `ysyx_041514_TRUE;  // 完成信号
            uncache_rdata <= ram_rdata_dcache_i >> {blk_addr_reg[2:0], 3'b0};  // 数据返回
            dcache_state <= CACHE_IDLE;
          end
        end
        UNCACHE_WRITE: begin
          if (_ram_waddr_valid_dcache_o & ram_wdata_ready_dcache_i) begin
            _ram_waddr_valid_dcache_o <= `ysyx_041514_FALSE;
            dcache_data_ready         <= `ysyx_041514_TRUE;  // 完成信号
            dcache_state              <= CACHE_IDLE;
          end
        end

        CACHE_FENCEI: begin
          if (dirty_bit_read) begin
            dcache_state <= CACHE_FENCEI_WRITE_BACK;
            dcache_data_ready <= `ysyx_041514_FALSE;
            _ram_waddr_dcache_o <= {dcache_tag_read, fencei_line_idx, 6'b0};  // 写地址
            _ram_waddr_valid_dcache_o <= `ysyx_041514_TRUE;  // 地址有效
            _ram_wmask_dcache_o <= 8'b1111_1111;  // 写掩码
            _ram_wdata_dcache_o <= dcache_writeback_data;  // 写数据
            _ram_wsize_dcache_o <= 4'b1000;  //写大小 8byte
            _ram_wlen_dcache_o <= 8'd7;  // 突发 7 次
            burst_count <= 0;  // 清空计数器
          end else begin
            fencei_count <= fencei_count_plus1;
            dcache_state <= CACHE_FENCEI_WAIT;
          end
        end
        CACHE_FENCEI_WRITE_BACK: begin
          if (ram_w_handshake) begin
            if (burst_count == 4'd7) begin  // 收到最后一个写响应
              _ram_waddr_valid_dcache_o <= `ysyx_041514_FALSE;  // 传输结束
              dcache_state              <= CACHE_FENCEI_WAIT;
              fencei_count              <= fencei_count_plus1;

            end else begin
              burst_count <= burst_count_plus1;
              _ram_wdata_dcache_o <= dcache_writeback_data;  // 更新写数据
            end
          end
        end
        CACHE_FENCEI_WAIT: begin
          dcache_tag_wen <= `ysyx_041514_FALSE;  // 写 tag 
          if (fencei_count == 'd64) begin
            dcache_state <= CACHE_IDLE;
            _dirty_flush <= `ysyx_041514_TRUE;
            fencei_ready <= `ysyx_041514_TRUE;
            fencei_count <= 0;
          end else begin
            dcache_state <= CACHE_FENCEI;
          end
        end
        default: begin
        end
      endcase
    end
  end



  assign wmask_bit = {
    {8{mem_mask_i[7]}},
    {8{mem_mask_i[6]}},
    {8{mem_mask_i[5]}},
    {8{mem_mask_i[4]}},
    {8{mem_mask_i[3]}},
    {8{mem_mask_i[2]}},
    {8{mem_mask_i[1]}},
    {8{mem_mask_i[0]}}
  };



  wire [127:0] dcache_wmask_readmiss = ~burst_count[0]?{64'b0,64'hffff_ffff_ffff_ffff}:{64'hffff_ffff_ffff_ffff,64'b0};
  wire [127:0] dcache_wdate_readmiss = ~burst_count[0]?{64'b0,ram_rdata_dcache_i}:{ram_rdata_dcache_i,64'b0};

  wire state_readmiss = dcache_state == CACHE_MISS_ALLOCATE;
  wire state_writehit = dcache_write_hit_valid;
  wire state_writeback = dcache_state == CACHE_WRITE_BACK;

  wire [127:0] dcache_wmask = ({128{state_readmiss}}&dcache_wmask_readmiss)
                            | ({128{state_writehit}}&dcache_wmask_writehit);

  wire [127:0] dcache_wdata = ({128{state_readmiss}}&dcache_wdate_readmiss)
                            | ({128{state_writehit}}&dcache_wdata_writehit);


  wire dcache_wwen = (state_readmiss & ram_r_handshake) | (state_writehit & dcache_data_wen);


  wire dirty_bit_write = _dirty_bit_write;
  wire [19:0] dcache_tag_write = cache_line_tag;

  wire dirty_flush = _dirty_flush;

  wire dcache_allocate_valid = state_readmiss;
  wire dcache_writeback_valid = state_writeback | mem_fencei_valid_i;
  wire dcache_fencei_valid = mem_fencei_valid_i;

  wire [5:0] dcache_index = dcache_fencei_valid ? fencei_line_idx : cache_line_idx;

  wire [`ysyx_041514_XLEN_BUS] dcache_rdata;
  ysyx_041514_dcache_tag u_dcache_tag (
      .clk              (clk),
      .rst              (rst),
      .dcache_tag_i     (dcache_tag_write),  // tag
      .dcache_index_i   (dcache_index),      // index
      .write_valid_i    (dcache_tag_wen),    // 写使能
      .dcache_tag_o     (dcache_tag_read),
      .dirty_bit_read_o (dirty_bit_read),
      .dirty_bit_write_i(dirty_bit_write),
      .dirty_flush_i    (dirty_flush),
      .dcache_hit_o     (dcache_hit)
  );

  ysyx_041514_dcache_data u_dcache_data (
      // .clk                     (clk),
      // .rst                     (rst),
      .dcache_index_i          (dcache_index),
      // index
      .dcache_blk_addr_i       (cache_blk_addr),
      .dcache_line_wdata_i     (dcache_wdata),
      .dcache_wmask            (dcache_wmask),
      .dcache_wen_i            (dcache_wwen),
      .burst_count_i           (burst_count[2:0]),
      .dcache_allocate_valid_i (dcache_allocate_valid),
      .dcache_writeback_valid_i(dcache_writeback_valid),
      .dcache_writeback_data_o (dcache_writeback_data),
      .dcache_rdata_o          (dcache_rdata),
      /* sram */
      .io_sram0_addr           (io_sram0_addr),
      .io_sram0_cen            (io_sram0_cen),
      .io_sram0_wen            (io_sram0_wen),
      .io_sram0_wmask          (io_sram0_wmask),
      .io_sram0_wdata          (io_sram0_wdata),
      .io_sram0_rdata          (io_sram0_rdata),
      .io_sram1_addr           (io_sram1_addr),
      .io_sram1_cen            (io_sram1_cen),
      .io_sram1_wen            (io_sram1_wen),
      .io_sram1_wmask          (io_sram1_wmask),
      .io_sram1_wdata          (io_sram1_wdata),
      .io_sram1_rdata          (io_sram1_rdata),
      .io_sram2_addr           (io_sram2_addr),
      .io_sram2_cen            (io_sram2_cen),
      .io_sram2_wen            (io_sram2_wen),
      .io_sram2_wmask          (io_sram2_wmask),
      .io_sram2_wdata          (io_sram2_wdata),
      .io_sram2_rdata          (io_sram2_rdata),
      .io_sram3_addr           (io_sram3_addr),
      .io_sram3_cen            (io_sram3_cen),
      .io_sram3_wen            (io_sram3_wen),
      .io_sram3_wmask          (io_sram3_wmask),
      .io_sram3_wdata          (io_sram3_wdata),
      .io_sram3_rdata          (io_sram3_rdata)
  );



  assign ram_wlen_dcache_o = _ram_wlen_dcache_o;
  assign ram_rlen_dcache_o = _ram_rlen_dcache_o;
  assign mem_fencei_ready_o = fencei_ready;



  assign mem_rdata_o = (uncache) ? uncache_rdata : dcache_rdata;

  assign mem_data_ready_o = dcache_data_ready && (dcache_state == CACHE_IDLE);

  assign ram_raddr_dcache_o = _ram_raddr_dcache_o;
  assign ram_raddr_valid_dcache_o = _ram_raddr_valid_dcache_o;
  assign ram_rmask_dcache_o = _ram_rmask_dcache_o;
  assign ram_rsize_dcache_o = _ram_rsize_dcache_o;


  assign ram_waddr_dcache_o = _ram_waddr_dcache_o;
  assign ram_waddr_valid_dcache_o = _ram_waddr_valid_dcache_o;
  assign ram_wmask_dcache_o = _ram_wmask_dcache_o;
  assign ram_wdata_dcache_o = dcache_writeback_valid ? dcache_writeback_data : _ram_wdata_dcache_o;
  assign ram_wsize_dcache_o = _ram_wsize_dcache_o;

endmodule
 

// 写入一个周期
// 读取立即返回
module ysyx_041514_icache_tag #(
    TAG_LEN = 20,  // tag 长度
    IDX_LEN = 6,   // 组号 长度
    TAG_NUM = 64   // tag 个数
) (
    input clk,
    input rst,
    input [TAG_LEN-1:0] icache_tag_i,  // tag
    input [IDX_LEN-1:0] icache_index_i,  // index
    input write_valid_i,  // 写使能
    input fencei_valid_i,
    output icache_hit_o
);
// 寄存器已复位
  reg [TAG_LEN-1+1:0] icache_tag_regs[TAG_NUM-1:0];  //{valid,tag}


  wire _fencei_valid = fencei_valid_i;
  wire valid_bit;
  wire [TAG_LEN-1:0] tag_read;
  assign {valid_bit, tag_read} = icache_tag_regs[icache_index_i];

  wire _icache_hit = (icache_tag_i == tag_read) & valid_bit;  // hit


  assign icache_hit_o = _icache_hit;


  /* 写入逻辑，一个周期写入 tag */
  integer i;
  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < TAG_NUM; i = i + 1) begin
        icache_tag_regs[i][19:0] <= 'b0;
      end
    end else if (write_valid_i) begin
      icache_tag_regs[icache_index_i][19:0] <= icache_tag_i;
    end
  end


  /* valid */
  integer j;
  always @(posedge clk) begin
    if (rst | _fencei_valid) begin
      for (j = 0; j < TAG_NUM; j = j + 1) begin
        icache_tag_regs[j][20] <= 'b0;
      end
    end else if (write_valid_i) begin
      icache_tag_regs[icache_index_i][20] <= 1'b1;
    end
  end

  //else 保持不变
endmodule
 
// 地址位宽 32,icache<->cpu (数据64位) mem<-->icache(数据128位)
// 连接方式 ram<-->cache<-->cpu
// cache<-->cpu : 地址线宽度:32 数据线宽度:64

// 1. cache 总容量: 4KB (4096Byte)
// 2. cahce 块大小: 64Byte
// 3. cache 块个数: 64个 (64*64Byte==4096Byte)
// 4. 映射方式 直接映射
// 5. 块内地址: 6bit(2^6==64)
// 6. 组号: 6bit（2^6==64）
// 6. tag: 32-6-6 == 20 bit 

module ysyx_041514_icache_top (
    input clk,
    input rst,
    /* cpu<-->cache 端口 */
    input [`ysyx_041514_NPC_ADDR_BUS] preif_raddr_i,  // CPU 的访存信息 
    // input [7:0] preif_rmask_i,  // 访存掩码
    input preif_raddr_valid_i,  // 地址是否有效，无效时，停止访问 cache
    output [`ysyx_041514_XLEN_BUS] if_rdata_o,  // icache 返回读数据

    //input  if_rdata_ready_i,  // 是否准备好接收数据
    output if_rdata_valid_o,   // icache 读数据是否准备好(未准备好需要暂停流水线)
    input  mem_fencei_valid_i,

    /* cache<-->mem 端口 */
    output [`ysyx_041514_NPC_ADDR_BUS] ram_raddr_icache_o,
    output                             ram_raddr_valid_icache_o,
    output [                      7:0] ram_rmask_icache_o,
    output [                      3:0] ram_rsize_icache_o,
    output [                      7:0] ram_rlen_icache_o,
    input                              ram_rdata_ready_icache_i,
    input  [    `ysyx_041514_XLEN_BUS] ram_rdata_icache_i,
    /* sram */
    output [                      5:0] io_sram4_addr,
    output                             io_sram4_cen,
    output                             io_sram4_wen,
    output [                    127:0] io_sram4_wmask,
    output [                    127:0] io_sram4_wdata,
    input  [                    127:0] io_sram4_rdata,
    output [                      5:0] io_sram5_addr,
    output                             io_sram5_cen,
    output                             io_sram5_wen,
    output [                    127:0] io_sram5_wmask,
    output [                    127:0] io_sram5_wdata,
    input  [                    127:0] io_sram5_rdata,
    output [                      5:0] io_sram6_addr,
    output                             io_sram6_cen,
    output                             io_sram6_wen,
    output [                    127:0] io_sram6_wmask,
    output [                    127:0] io_sram6_wdata,
    input  [                    127:0] io_sram6_rdata,
    output [                      5:0] io_sram7_addr,
    output                             io_sram7_cen,
    output                             io_sram7_wen,
    output [                    127:0] io_sram7_wmask,
    output [                    127:0] io_sram7_wdata,
    input  [                    127:0] io_sram7_rdata
);

`ifndef ysyx_041514_YSYX_SOC
  import "DPI-C" function void icache_hit_count(
    input int last_pc,
    input int now_pc
  );
  import "DPI-C" function void icache_unhit_count();
`endif


  // 寄存器已复位

  wire [ 5:0] cache_blk_addr;
  wire [ 5:0] cache_line_idx;
  wire [19:0] cache_line_tag;
  assign {cache_line_tag, cache_line_idx, cache_blk_addr} = preif_raddr_i;

  wire _fencei_valid = mem_fencei_valid_i;
  wire icache_hit;
  wire uncache;


  /* cache 命中 */
  localparam CACHE_RST = 4'd0;
  localparam CACHE_IDLE = 4'd1;
  localparam CACHE_MISS = 4'd2;
  localparam UNCACHE_READ = 4'd3;
  localparam CACHE_LOOKUP = 4'd4;

  reg [`ysyx_041514_XLEN_BUS] uncache_rdata;
  reg [3:0] icache_state;


  reg [5:0] blk_addr_reg;
  reg [5:0] line_idx_reg;
  reg [19:0] line_tag_reg;
  reg icache_tag_write_valid;

  reg uncache_data_ready;
  // cache<-->mem 端口 
  reg [`ysyx_041514_NPC_ADDR_BUS] _ram_raddr_icache_o;
  reg _ram_raddr_valid_icache_o;
  reg [7:0] _ram_rmask_icache_o;
  reg [3:0] _ram_rsize_icache_o;
  reg [7:0] _ram_rlen_icache_o;
  reg [2:0] burst_count;


  wire ram_r_handshake = _ram_raddr_valid_icache_o & ram_rdata_ready_icache_i;
  wire [2:0] burst_count_plus1 = burst_count + 1;


  ysyx_041514_uncache_check u_ysyx_041514_uncache_check (
      .addr_check_i   ({line_tag_reg, line_idx_reg, blk_addr_reg}),
      .uncache_valid_o(uncache)
  );

  always @(posedge clk) begin
    if (rst) begin
      icache_state              <= CACHE_RST;
      blk_addr_reg              <= 0;
      line_idx_reg              <= 0;
      line_tag_reg              <= 0;
      icache_tag_write_valid    <= 0;
      _ram_rmask_icache_o       <= 0;
      _ram_rsize_icache_o       <= 0;
      _ram_raddr_valid_icache_o <= 0;
      uncache_data_ready        <= 0;
      _ram_raddr_icache_o       <= 0;
      _ram_rlen_icache_o        <= 0;
      burst_count               <= 0;
      uncache_rdata             <= 0;
    end else begin
      case (icache_state)
        CACHE_RST: begin
          icache_state <= CACHE_IDLE;
        end
        CACHE_IDLE: begin
          blk_addr_reg           <= cache_blk_addr;
          line_idx_reg           <= cache_line_idx;
          line_tag_reg           <= cache_line_tag;
          icache_tag_write_valid <= `ysyx_041514_FALSE;
          uncache_data_ready     <= `ysyx_041514_FALSE;
          // 执行 fencei 指令时，保证 icache 处于 idle 状态
          if (preif_raddr_valid_i && ~_fencei_valid) begin
            icache_state <= CACHE_LOOKUP;
          end
        end
        CACHE_LOOKUP: begin
          blk_addr_reg <= cache_blk_addr;
          line_idx_reg <= cache_line_idx;
          line_tag_reg <= cache_line_tag;
          icache_tag_write_valid    <= `ysyx_041514_FALSE;
          uncache_data_ready <= `ysyx_041514_FALSE;
          // 执行 fencei 指令时，保证 icache 处于 idle 状态
          if (~preif_raddr_valid_i || _fencei_valid) begin
            icache_state <= CACHE_IDLE;
          end else if (~icache_hit && ~uncache) begin
            icache_state <= CACHE_MISS;
            _ram_raddr_icache_o <= {line_tag_reg, line_idx_reg, 6'b0};  // 读地址
            _ram_raddr_valid_icache_o <= `ysyx_041514_TRUE;  // 地址有效
            _ram_rmask_icache_o <= 8'b1111_1111;  // 读掩码
            _ram_rsize_icache_o <= 4'b1000;  // 64bit
            _ram_rlen_icache_o <= 8'd7;  // 突发 8 次
            burst_count <= 0;  // 清空计数器
`ifndef ysyx_041514_YSYX_SOC 
            icache_unhit_count();
`endif
          end else if (~icache_hit && uncache) begin
            icache_state              <= UNCACHE_READ;
            _ram_raddr_icache_o       <= {line_tag_reg, line_idx_reg, blk_addr_reg};  // 读地址
            _ram_raddr_valid_icache_o <= `ysyx_041514_TRUE;  // 地址有效
            _ram_rmask_icache_o       <= 8'b1111_1111;  // 读掩码
            _ram_rsize_icache_o       <= 4'b0100;  //读大小 32bit,一条指令
            _ram_rlen_icache_o        <= 8'd0;  // 不突发
          end
`ifndef ysyx_041514_YSYX_SOC 
          else if (icache_hit) begin : hit
            icache_hit_count({line_tag_reg, line_idx_reg, blk_addr_reg}, preif_raddr_i);
          end
`endif 
        end
        CACHE_MISS: begin
          if (ram_r_handshake) begin  // 在 handshake 时，向 ram 写入数据
            if (burst_count == _ram_rlen_icache_o[2:0]) begin  // 突发传输最后一个数据
              icache_state <= CACHE_IDLE;
              _ram_raddr_valid_icache_o <= `ysyx_041514_FALSE;  // 传输结束
              icache_tag_write_valid <= `ysyx_041514_TRUE;  // 写 tag 
            end else begin
              burst_count <= burst_count_plus1;
            end
          end
        end
        UNCACHE_READ: begin
          if (ram_r_handshake) begin
            _ram_raddr_valid_icache_o <= `ysyx_041514_FALSE;
            uncache_data_ready <= `ysyx_041514_TRUE;  // 完成信号
            uncache_rdata     <= _ram_raddr_icache_o[2]?{32'b0,ram_rdata_icache_i[63:32]}:ram_rdata_icache_i;  // 数据返回
            icache_state <= CACHE_IDLE;
          end
        end
        default: begin
          icache_state <= CACHE_IDLE;
        end
      endcase
    end
  end

  ysyx_041514_icache_tag u_icache_tag (
      .clk           (clk),
      .rst           (rst),
      .icache_tag_i  (line_tag_reg),            // tag
      .icache_index_i(line_idx_reg),            // index
      .write_valid_i (icache_tag_write_valid),  // 写使能
      .fencei_valid_i(_fencei_valid),
      .icache_hit_o  (icache_hit)
  );



  wire [127:0] icache_wmask = ~burst_count[0]?{64'b0,64'hffff_ffff_ffff_ffff}:{64'hffff_ffff_ffff_ffff,64'b0};
  wire [127:0] icache_wdate = ~burst_count[0]?{64'b0,ram_rdata_icache_i}:{ram_rdata_icache_i,64'b0};
  wire [`ysyx_041514_XLEN_BUS] icache_rdata;
  ysyx_041514_icache_data u_icache_data (

      .icache_index_i     (cache_line_idx),//cache_line_idx 使用直接输入数据，满足一个周期的时许要求
      .icache_blk_addr_i(blk_addr_reg),  // icache_blk_addr_i 使用寄存器中的数据
      .icache_line_wdata_i(icache_wdate),
      .icache_wmask(icache_wmask),
      .icache_wen_i(ram_r_handshake),  // 握手成功的时候，同时将数据写入cache
      .burst_count_i(burst_count),
      .icache_rdata_o(icache_rdata),
      /* sram */
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






  // wire [`ysyx_041514_XLEN_BUS] _icache_data_o = {32'b0, icache_line_rdata[blk_addr_reg*8+:32]};

  // 1. icache_hit ： 数据来自 cache
  // 2. uncache_data_ready ：数据来自 uncache
  assign if_rdata_valid_o = icache_hit | uncache_data_ready;
  wire [`ysyx_041514_XLEN_BUS] icache_final_data = uncache ? uncache_rdata : icache_rdata;
  assign if_rdata_o = icache_final_data;


  assign ram_raddr_icache_o = _ram_raddr_icache_o;
  assign ram_raddr_valid_icache_o = _ram_raddr_valid_icache_o;
  assign ram_rmask_icache_o = _ram_rmask_icache_o;
  assign ram_rsize_icache_o = _ram_rsize_icache_o;
  assign ram_rlen_icache_o = _ram_rlen_icache_o;

endmodule

 

module ysyx_041514_rv64_csr_regfile (
    input clk,
    input rst,
    /* 单独引出寄存器(写) */
    input [`ysyx_041514_XLEN-1:0] csr_mstatus_writedata_i,
    input [`ysyx_041514_XLEN-1:0] csr_mepc_writedata_i,
    input [`ysyx_041514_XLEN-1:0] csr_mcause_writedata_i,
    input [`ysyx_041514_XLEN-1:0] csr_mtval_writedata_i,
    // input wire [`ysyx_041514_XLEN-1:0] csr_mtvec_writedata_i,
    input wire [`ysyx_041514_XLEN-1:0] csr_mip_writedata_i,
    // input wire [`ysyx_041514_XLEN-1:0] csr_mie_writedata_i,
    input csr_mstatus_write_valid_i,
    input csr_mepc_write_valid_i,
    input csr_mcause_write_valid_i,
    input csr_mtval_write_valid_i,
    // input wire csr_mtvec_write_valid_i,
    input wire csr_mip_write_valid_i,
    // input wire csr_mie_write_valid_i,
    /* 单独引出寄存器(读) */
    output [`ysyx_041514_XLEN-1:0] csr_mstatus_readdata_o,
    output [`ysyx_041514_XLEN-1:0] csr_mepc_readdata_o,
    // output wire [`ysyx_041514_XLEN-1:0] csr_mcause_readdata_o,
    // output wire [`ysyx_041514_XLEN-1:0] csr_mtval_readdata_o,
    output [`ysyx_041514_XLEN-1:0] csr_mtvec_readdata_o,
    output [`ysyx_041514_XLEN-1:0] csr_mip_readdata_o,
    output [`ysyx_041514_XLEN-1:0] csr_mie_readdata_o,
    /* 读取数据端口 */
    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_readaddr_i,
    output [`ysyx_041514_XLEN-1:0] csr_readdata_o,
    /* 写入数据端口 */
    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_writeaddr_i,
    input csr_write_valid_i,
    input [`ysyx_041514_XLEN-1:0] csr_writedata_i
);


  // mstatus TODO 
  reg _mstatus_en;
  wire [`ysyx_041514_XLEN-1:0] _mstatus_q;
  wire [`ysyx_041514_XLEN-1:0] _mstatus_d = (csr_mstatus_write_valid_i) ? csr_mstatus_writedata_i : 
                                            (_mstatus_en)?csr_writedata_i:
                                            {_mstatus_q[63:13],1'b1,1'b1,_mstatus_q[10:0]};




  // mepc
  wire [`ysyx_041514_XLEN-1:0] _mepc_d = (csr_mepc_write_valid_i) ? csr_mepc_writedata_i : csr_writedata_i;
  wire [`ysyx_041514_XLEN-1:0] _mepc_q;
  reg _mepc_en;

  // mcause
  wire [`ysyx_041514_XLEN-1:0] _mcause_d = (csr_mcause_write_valid_i) ? csr_mcause_writedata_i : csr_writedata_i;
  wire [`ysyx_041514_XLEN-1:0] _mcause_q;
  reg _mcause_en;

  // mtval
  wire [`ysyx_041514_XLEN-1:0] _mtval_d = (csr_mtval_write_valid_i) ? csr_mtval_writedata_i : csr_writedata_i;
  wire [`ysyx_041514_XLEN-1:0] _mtval_q;
  reg _mtval_en;

  // mtvec
  wire [`ysyx_041514_XLEN-1:0] _mtvec_d = csr_writedata_i;
  wire [`ysyx_041514_XLEN-1:0] _mtvec_q;
  reg _mtvec_en;

  // mip TODO 设计不完善 目前只有 mtime 会使用
  reg _mip_en;
  wire [`ysyx_041514_XLEN-1:0] _mip_q;
  wire [`ysyx_041514_XLEN-1:0] _mip_d = (csr_mip_write_valid_i) ? csr_mip_writedata_i : 
                                        (_mip_en)?csr_writedata_i:
                                        {_mip_q[63:8],1'b0,_mip_q[6:0]}; // mtime 清 0



  // mie
  wire [`ysyx_041514_XLEN-1:0] _mie_d = csr_writedata_i;
  wire [`ysyx_041514_XLEN-1:0] _mie_q;
  reg _mie_en;


  /* 写使能 */
  always @(*) begin
    //需要赋初值防止生成 latch
    _mstatus_en = csr_mstatus_write_valid_i;
    _mepc_en = csr_mepc_write_valid_i;
    _mcause_en = csr_mcause_write_valid_i;
    _mtval_en = csr_mtval_write_valid_i;
    _mtvec_en = `ysyx_041514_FALSE;
    _mip_en = csr_mip_write_valid_i;
    _mie_en = `ysyx_041514_FALSE;
    case (csr_writeaddr_i)
      `ysyx_041514_CSR_MSTATUS: _mstatus_en = csr_write_valid_i;
      `ysyx_041514_CSR_MEPC: _mepc_en = csr_write_valid_i;
      `ysyx_041514_CSR_MCAUSE: _mcause_en = csr_write_valid_i;
      `ysyx_041514_CSR_MTVAL: _mtval_en = csr_write_valid_i;
      `ysyx_041514_CSR_MTVEC: _mtvec_en = csr_write_valid_i;
      `ysyx_041514_CSR_MIE: _mie_en = csr_write_valid_i;
      `ysyx_041514_CSR_MIP: _mip_en = csr_write_valid_i;
      default: ;
    endcase
  end

  /* 读取���据 */
  reg [`ysyx_041514_XLEN-1:0] _csr_readdata;
  always @(*) begin
    case (csr_readaddr_i)
      `ysyx_041514_CSR_MSTATUS: _csr_readdata = _mstatus_q;
      `ysyx_041514_CSR_MEPC: _csr_readdata = _mepc_q;
      `ysyx_041514_CSR_MCAUSE: _csr_readdata = _mcause_q;
      `ysyx_041514_CSR_MTVAL: _csr_readdata = _mtval_q;
      `ysyx_041514_CSR_MTVEC: _csr_readdata = _mtvec_q;
      `ysyx_041514_CSR_MIE: _csr_readdata = _mie_q;
      `ysyx_041514_CSR_MIP: _csr_readdata = _mip_q;
      default: _csr_readdata = `ysyx_041514_XLEN'b0;
    endcase
  end

  assign csr_readdata_o = _csr_readdata;

  assign csr_mepc_readdata_o = _mepc_q;
  //   assign csr_mcause_readdata_o = _mcause_q;
  //   assign csr_mtval_readdata_o = _mtval_q;
  assign csr_mtvec_readdata_o = _mtvec_q;
  assign csr_mstatus_readdata_o = _mstatus_q;
  assign csr_mie_readdata_o = _mie_q;
  assign csr_mip_readdata_o = _mip_q;


  /* CSR 寄存器组 */
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_CSR_MSTATUS_DEFAULT)  // TODO 为了 difftest
  ) u_csr_mstatus (
      .clk (clk),
      .rst (rst),
      .din (_mstatus_d),
      .dout(_mstatus_q),
      .wen (1'b1)
  );
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_mepc (
      .clk (clk),
      .rst (rst),
      .din (_mepc_d),
      .dout(_mepc_q),
      .wen (_mepc_en)
  );
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_mcause (
      .clk (clk),
      .rst (rst),
      .din (_mcause_d),
      .dout(_mcause_q),
      .wen (_mcause_en)
  );
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_mtval (
      .clk (clk),
      .rst (rst),
      .din (_mtval_d),
      .dout(_mtval_q),
      .wen (_mtval_en)
  );
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_mtvec (
      .clk (clk),
      .rst (rst),
      .din (_mtvec_d),
      .dout(_mtvec_q),
      .wen (_mtvec_en)
  );

  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_mip (
      .clk (clk),
      .rst (rst),
      .din (_mip_d),
      .dout(_mip_q),
      .wen (1'b1)
  );

  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_mie (
      .clk (clk),
      .rst (rst),
      .din (_mie_d),
      .dout(_mie_q),
      .wen (_mie_en)
  );

endmodule
 


module ysyx_041514_execute_csr (

    input  [  `ysyx_041514_IMM_LEN-1:0] csr_imm_i,
    input                               csr_imm_valid_i,      // 是否是立即数指令
    input  [     `ysyx_041514_XLEN-1:0] rs1_data_i,           // rs1 data
    input  [     `ysyx_041514_XLEN-1:0] csr_data_i,           // 读取的 CSR 数据
    input  [`ysyx_041514_CSROP_LEN-1:0] csr_op_i,             // csr 操作码
    output [     `ysyx_041514_XLEN-1:0] csr_exe_data_o,
    output                              csr_exe_data_valid_o
);

  // wire _csr_write = (csr_op_i == `ysyx_041514_CSROP_WRITE);
  // wire _csr_set = (csr_op_i == `ysyx_041514_CSROP_SET);
  // wire _csr_clear = (csr_op_i == `ysyx_041514_CSROP_CLEAR);
  // wire _csr_read = (csr_op_i == `ysyx_041514_CSROP_READ);
  // wire _csr_none = (csr_op_i == `ysyx_041514_CSROP_NONE);

  wire _csr_write = csr_op_i[`ysyx_041514_CSROP_WRITE];
  wire _csr_set = csr_op_i[`ysyx_041514_CSROP_SET];
  wire _csr_clear = csr_op_i[`ysyx_041514_CSROP_CLEAR];
  wire _csr_read = csr_op_i[`ysyx_041514_CSROP_READ];
  wire _csr_none = csr_op_i[`ysyx_041514_CSROP_NONE];


  /* CSR 不同操作的结果 */
  wire [`ysyx_041514_XLEN-1:0] _csr_op1 = csr_data_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_op2 = csr_imm_valid_i ? csr_imm_i : rs1_data_i;

  wire [`ysyx_041514_XLEN-1:0] _csr_write_result = _csr_op2;
  wire [`ysyx_041514_XLEN-1:0] _csr_set_result = _csr_op1 | _csr_op2;
  wire [`ysyx_041514_XLEN-1:0] _csr_clear_result = _csr_op1 & (~_csr_op2);
  wire [`ysyx_041514_XLEN-1:0] _csr_read_result = _csr_op1;

  wire [`ysyx_041514_XLEN-1:0] _csr_exe_data_o= ({`ysyx_041514_XLEN{_csr_write}}&_csr_write_result)|
                                    ({`ysyx_041514_XLEN{_csr_set}}&_csr_set_result)|
                                    ({`ysyx_041514_XLEN{_csr_clear}}&_csr_clear_result)|
                                    ({`ysyx_041514_XLEN{_csr_read}}&_csr_read_result);


  assign csr_exe_data_o = _csr_exe_data_o;
  assign csr_exe_data_valid_o = ~(_csr_none | _csr_read);  // 读取不写回
endmodule
 

module ysyx_041514_if_id (
    input clk,
    input rst,
    input [5:0] stall_valid_i,  // 保持当前数据，不接受新的数据
    input [5:0] flush_valid_i,  // 清空当前数据（nop），不接受新的数据


    input [`ysyx_041514_XLEN_BUS] inst_addr_if_i,
    input [`ysyx_041514_INST_LEN-1:0] inst_data_if_i,
    input bru_taken_if_i,
    input [`ysyx_041514_TRAP_BUS] trap_bus_if_i,

    output [`ysyx_041514_XLEN_BUS] inst_addr_if_id_o,
    output [`ysyx_041514_INST_LEN-1:0] inst_data_if_id_o,
    output bru_taken_if_id_o,
    output [`ysyx_041514_TRAP_BUS] trap_bus_if_id_o
);
  // 保持时，写失效

  wire reg_wen = !stall_valid_i[`ysyx_041514_CTRLBUS_IF_ID];
  wire _flush_valid = flush_valid_i[`ysyx_041514_CTRLBUS_IF_ID] | (inst_addr_if_i == `ysyx_041514_PC_RESET_ADDR - 'd4);
  wire reg_rst = rst | _flush_valid;


  /* inst_addr_if_i 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _inst_addr_if_id_d = inst_addr_if_i;
  wire [`ysyx_041514_XLEN-1:0] _inst_addr_if_id_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_inst_addr_if_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_inst_addr_if_id_d),
      .dout(_inst_addr_if_id_q),
      .wen (reg_wen)
  );
  assign inst_addr_if_id_o = _inst_addr_if_id_q;

  /* inst_data_if_i 寄存器 */
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_if_id_d = inst_data_if_i;
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_if_id_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_INST_LEN),
      .RESET_VAL(`ysyx_041514_INST_NOP)
  ) u_inst_data_if_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_inst_data_if_id_d),
      .dout(_inst_data_if_id_q),
      .wen (reg_wen)
  );
  assign inst_data_if_id_o = _inst_data_if_id_q;


  /* bru_taken_if_i 寄存器 */
  wire _bru_taken_if_id_d = bru_taken_if_i;
  wire _bru_taken_if_id_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(0)
  ) u_bru_taken_if_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_bru_taken_if_id_d),
      .dout(_bru_taken_if_id_q),
      .wen (reg_wen)
  );
  assign bru_taken_if_id_o = _bru_taken_if_id_q;


  /* trap_bus_if_i 寄存器 */
  wire [`ysyx_041514_TRAP_BUS] _trap_bus_if_id_d = trap_bus_if_i;
  wire [`ysyx_041514_TRAP_BUS] _trap_bus_if_id_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_TRAP_LEN),
      .RESET_VAL(`ysyx_041514_TRAP_LEN'b0)
  ) u_trap_bus_if_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_trap_bus_if_id_d),
      .dout(_trap_bus_if_id_q),
      .wen (reg_wen)
  );
  assign trap_bus_if_id_o = _trap_bus_if_id_q;


endmodule
 

module ysyx_041514_mem_wb (
    input clk,
    input rst,
    input [5:0] flush_valid_i,
    input [5:0] stall_valid_i,


    // input [    `ysyx_041514_XLEN_BUS] pc_mem_wb_i,
    // input [`ysyx_041514_INST_LEN-1:0] inst_data_mem_wb_i,
    /* trap 所需寄存器，来自于 csr (写)*/
    input [`ysyx_041514_XLEN-1:0] csr_mstatus_writedata_mem_wb_i,
    input [`ysyx_041514_XLEN-1:0] csr_mepc_writedata_mem_wb_i,
    input [`ysyx_041514_XLEN-1:0] csr_mcause_writedata_mem_wb_i,
    input [`ysyx_041514_XLEN-1:0] csr_mtval_writedata_mem_wb_i,
    // input [`ysyx_041514_XLEN-1:0] csr_mtvec_writedata_mem_wb_i,
    // input [`ysyx_041514_XLEN-1:0] csr_mie_writedata_mem_wb_i,
    input [`ysyx_041514_XLEN-1:0] csr_mip_writedata_mem_wb_i,

    input                             csr_mstatus_write_valid_mem_wb_i,
    input                             csr_mepc_write_valid_mem_wb_i,
    input                             csr_mcause_write_valid_mem_wb_i,
    input                             csr_mtval_write_valid_mem_wb_i,
    // input                             csr_mtvec_write_valid_mem_wb_i,
    // input                             csr_mie_write_valid_mem_wb_i,
    input                             csr_mip_write_valid_mem_wb_i,
    input [    `ysyx_041514_XLEN-1:0] pc_mem_wb_i,                       //指令地址
    input [`ysyx_041514_INST_LEN-1:0] inst_data_mem_wb_i,                //指令内容


    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_mem_wb_i,       //csr 写回地址
    input [             `ysyx_041514_XLEN_BUS] exc_csr_data_mem_wb_i,   //csr 写回数据
    input                                      exc_csr_valid_mem_wb_i,  // csr 写回使能
    input [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_addr_mem_wb_i,        // gpr 写回使能
    input [             `ysyx_041514_XLEN-1:0] mem_data_mem_wb_i,       //访存阶段的数据

    /* trap 所需寄存器，来自于 csr (写)*/
    output [`ysyx_041514_XLEN-1:0] csr_mstatus_writedata_mem_wb_o,
    output [`ysyx_041514_XLEN-1:0] csr_mepc_writedata_mem_wb_o,
    output [`ysyx_041514_XLEN-1:0] csr_mcause_writedata_mem_wb_o,
    output [`ysyx_041514_XLEN-1:0] csr_mtval_writedata_mem_wb_o,
    // output [`ysyx_041514_XLEN-1:0] csr_mtvec_writedata_mem_wb_o,
    // output [`ysyx_041514_XLEN-1:0] csr_mie_writedata_mem_wb_o,
    output [`ysyx_041514_XLEN-1:0] csr_mip_writedata_mem_wb_o,

    output csr_mstatus_write_valid_mem_wb_o,
    output csr_mepc_write_valid_mem_wb_o,
    output csr_mcause_write_valid_mem_wb_o,
    output csr_mtval_write_valid_mem_wb_o,
    // output csr_mtvec_write_valid_mem_wb_o,
    // output csr_mie_write_valid_mem_wb_o,
    output csr_mip_write_valid_mem_wb_o,

    output [`ysyx_041514_XLEN-1:0] pc_mem_wb_o,  //指令地址
    output [`ysyx_041514_INST_LEN-1:0] inst_data_mem_wb_o,  //指令内容

    output [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_mem_wb_o,       //csr 写回地址
    output [             `ysyx_041514_XLEN_BUS] exc_csr_data_mem_wb_o,   //csr 写回数据
    output                                      exc_csr_valid_mem_wb_o,  // csr 写回使能
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_addr_mem_wb_o,        // gpr 写回使能
    output [             `ysyx_041514_XLEN-1:0] mem_data_mem_wb_o        //访存阶段的数据
);

  wire reg_wen = !stall_valid_i[`ysyx_041514_CTRLBUS_MEM_WB];
  wire _flush_valid = flush_valid_i[`ysyx_041514_CTRLBUS_MEM_WB];
  wire reg_rst = rst | _flush_valid;

`ifndef ysyx_041514_YSYX_SOC
  // 用于 difftest，获取即将提交的下一条指令的 pc
  import "DPI-C" function void set_nextpc(input longint nextpc);
  always @(posedge clk) begin
    // 避免重复提交 pc
    if (reg_wen & (~_flush_valid)) begin
      set_nextpc(pc_mem_wb_i);
    end
  end
`endif

  //   /* pc 寄存器 */
  //   wire [`ysyx_041514_XLEN_BUS] _pc_mem_wb_d = (_flush_valid) ? `ysyx_041514_XLEN'b0 : pc_mem_wb_i;
  //   wire [`ysyx_041514_XLEN_BUS] _pc_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_XLEN),
  //       .RESET_VAL(`ysyx_041514_XLEN'b0)
  //   ) u_pc_mem_wb_id (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_pc_mem_wb_d),
  //       .dout(_pc_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign pc_mem_wb_o = _pc_mem_wb_q;


  //   /* inst_data 寄存器 */
  //   wire [`ysyx_041514_INST_LEN-1:0] _inst_data_mem_wb_d = (_flush_valid) ? `ysyx_041514_INST_NOP : inst_data_mem_wb_i;
  //   wire [`ysyx_041514_INST_LEN-1:0] _inst_data_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_INST_LEN),
  //       .RESET_VAL(`ysyx_041514_INST_NOP)
  //   ) u_inst_data_mem_wb_id (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_inst_data_mem_wb_d),
  //       .dout(_inst_data_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign inst_data_mem_wb_o = _inst_data_mem_wb_q;


  /* csr_mip_write_valid寄存器 */
  wire _csr_mip_write_valid_mem_wb_d = csr_mip_write_valid_mem_wb_i;
  wire _csr_mip_write_valid_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_csr_mip_write_valid_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mip_write_valid_mem_wb_d),
      .dout(_csr_mip_write_valid_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mip_write_valid_mem_wb_o = _csr_mip_write_valid_mem_wb_q;



  //   /* csr_mie_write_valid寄存器 */
  //   wire _csr_mie_write_valid_mem_wb_d = (_flush_valid) ? `ysyx_041514_FALSE : csr_mie_write_valid_mem_wb_i;
  //   wire _csr_mie_write_valid_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (1),
  //       .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  //   ) u_csr_mie_write_valid_mem_wb (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_csr_mie_write_valid_mem_wb_d),
  //       .dout(_csr_mie_write_valid_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign csr_mie_write_valid_mem_wb_o = _csr_mie_write_valid_mem_wb_q;



  //   /* csr_mtvec_write_valid寄存器 */
  //   wire _csr_mtvec_write_valid_mem_wb_d = (_flush_valid) ? `ysyx_041514_FALSE : csr_mtvec_write_valid_mem_wb_i;
  //   wire _csr_mtvec_write_valid_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (1),
  //       .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  //   ) u_csr_mtvec_write_valid_mem_wb (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_csr_mtvec_write_valid_mem_wb_d),
  //       .dout(_csr_mtvec_write_valid_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign csr_mtvec_write_valid_mem_wb_o = _csr_mtvec_write_valid_mem_wb_q;


  /* csr_mtval_write_valid寄存器 */
  wire _csr_mtval_write_valid_mem_wb_d = csr_mtval_write_valid_mem_wb_i;
  wire _csr_mtval_write_valid_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_csr_mtval_write_valid_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mtval_write_valid_mem_wb_d),
      .dout(_csr_mtval_write_valid_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mtval_write_valid_mem_wb_o = _csr_mtval_write_valid_mem_wb_q;


  /* csr_mcause_write_valid寄存器 */
  wire _csr_mcause_write_valid_mem_wb_d = csr_mcause_write_valid_mem_wb_i;
  wire _csr_mcause_write_valid_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_csr_mcause_write_valid_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mcause_write_valid_mem_wb_d),
      .dout(_csr_mcause_write_valid_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mcause_write_valid_mem_wb_o = _csr_mcause_write_valid_mem_wb_q;

  /* csr_mepc_write_valid寄存器 */
  wire _csr_mepc_write_valid_mem_wb_d = csr_mepc_write_valid_mem_wb_i;
  wire _csr_mepc_write_valid_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_csr_mepc_write_valid_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mepc_write_valid_mem_wb_d),
      .dout(_csr_mepc_write_valid_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mepc_write_valid_mem_wb_o = _csr_mepc_write_valid_mem_wb_q;


  /* csr_mstatus_write_valid寄存器 */
  wire _csr_mstatus_write_valid_mem_wb_d = csr_mstatus_write_valid_mem_wb_i;
  wire _csr_mstatus_write_valid_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_csr_mstatus_write_valid_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mstatus_write_valid_mem_wb_d),
      .dout(_csr_mstatus_write_valid_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mstatus_write_valid_mem_wb_o = _csr_mstatus_write_valid_mem_wb_q;




  /* csr_mip_writedata寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_mip_writedata_mem_wb_d = csr_mip_writedata_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_mip_writedata_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_csr_mip_writedata_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mip_writedata_mem_wb_d),
      .dout(_csr_mip_writedata_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mip_writedata_mem_wb_o = _csr_mip_writedata_mem_wb_q;


  //   /* csr_mie_writedata寄存器 */
  //   wire [`ysyx_041514_XLEN-1:0] _csr_mie_writedata_mem_wb_d = (_flush_valid) ? `ysyx_041514_XLEN'b0 : csr_mie_writedata_mem_wb_i;
  //   wire [`ysyx_041514_XLEN-1:0] _csr_mie_writedata_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_XLEN),
  //       .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  //   ) u_csr_mie_writedata_mem_wb (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_csr_mie_writedata_mem_wb_d),
  //       .dout(_csr_mie_writedata_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign csr_mie_writedata_mem_wb_o = _csr_mie_writedata_mem_wb_q;


  //   /* csr_mtvec_writedata寄存器 */
  //   wire [`ysyx_041514_XLEN-1:0] _csr_mtvec_writedata_mem_wb_d = (_flush_valid) ? `ysyx_041514_XLEN'b0 : csr_mtvec_writedata_mem_wb_i;
  //   wire [`ysyx_041514_XLEN-1:0] _csr_mtvec_writedata_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_XLEN),
  //       .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  //   ) u_csr_mtvec_writedata_mem_wb (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_csr_mtvec_writedata_mem_wb_d),
  //       .dout(_csr_mtvec_writedata_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign csr_mtvec_writedata_mem_wb_o = _csr_mtvec_writedata_mem_wb_q;

  /* csr_mtval_writedata寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_mtval_writedata_mem_wb_d = csr_mtval_writedata_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_mtval_writedata_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_csr_mtval_writedata_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mtval_writedata_mem_wb_d),
      .dout(_csr_mtval_writedata_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mtval_writedata_mem_wb_o = _csr_mtval_writedata_mem_wb_q;


  /* csr_mcause_writedata寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_mcause_writedata_mem_wb_d = csr_mcause_writedata_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_mcause_writedata_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_csr_mcause_writedata_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mcause_writedata_mem_wb_d),
      .dout(_csr_mcause_writedata_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mcause_writedata_mem_wb_o = _csr_mcause_writedata_mem_wb_q;

  /* csr_mepc_writedata寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_mepc_writedata_mem_wb_d = csr_mepc_writedata_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_mepc_writedata_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:��认值未设置
  ) u_csr_mepc_writedata_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mepc_writedata_mem_wb_d),
      .dout(_csr_mepc_writedata_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mepc_writedata_mem_wb_o = _csr_mepc_writedata_mem_wb_q;

  /* csr_mstatus_writedata寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_mstatus_writedata_mem_wb_d = csr_mstatus_writedata_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_mstatus_writedata_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默���值未设置
  ) u_csr_mstatus_writedata_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_mstatus_writedata_mem_wb_d),
      .dout(_csr_mstatus_writedata_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_mstatus_writedata_mem_wb_o = _csr_mstatus_writedata_mem_wb_q;


  /* pc寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _pc_mem_wb_d = pc_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _pc_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_pc_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_pc_mem_wb_d),
      .dout(_pc_mem_wb_q),
      .wen (reg_wen)
  );
  assign pc_mem_wb_o = _pc_mem_wb_q;

  /* inst_data寄存器 */
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_mem_wb_d = inst_data_mem_wb_i;
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_INST_LEN),
      .RESET_VAL(`ysyx_041514_INST_NOP)
  ) u_inst_data_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_inst_data_mem_wb_d),
      .dout(_inst_data_mem_wb_q),
      .wen (reg_wen)
  );
  assign inst_data_mem_wb_o = _inst_data_mem_wb_q;


  //   /* exc_alu_data寄存器 */
  //   wire [`ysyx_041514_XLEN-1:0] _exc_alu_data_mem_wb_d = exc_alu_data_mem_wb_i;
  //   wire [`ysyx_041514_XLEN-1:0] _exc_alu_data_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_XLEN),
  //       .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  //   ) u_exc_alu_data_mem_wb (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_exc_alu_data_mem_wb_d),
  //       .dout(_exc_alu_data_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign exc_alu_data_mem_wb_o = _exc_alu_data_mem_wb_q;




  //   /* load_valid寄存器 */
  //   wire _load_valid_mem_wb_d = load_valid_mem_wb_i;
  //   wire _load_valid_mem_wb_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (1),
  //       .RESET_VAL(1'b0)  //TODO:默认值未设置
  //   ) u_load_valid_mem_wb (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_load_valid_mem_wb_d),
  //       .dout(_load_valid_mem_wb_q),
  //       .wen (reg_wen)
  //   );
  //   assign load_valid_mem_wb_o = _load_valid_mem_wb_q;

  /* csr_addr 寄存器 */
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_addr_mem_wb_d = csr_addr_mem_wb_i;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_addr_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_CSR_REG_ADDRWIDTH),
      .RESET_VAL(`ysyx_041514_CSR_REG_ADDRWIDTH'b0)  //TODO:默认值未设置
  ) u_csr_addr_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_addr_mem_wb_d),
      .dout(_csr_addr_mem_wb_q),
      .wen (reg_wen)
  );
  assign csr_addr_mem_wb_o = _csr_addr_mem_wb_q;


  /* exc_csr_data 寄存器 */
  wire [`ysyx_041514_XLEN_BUS] _exc_csr_data_mem_wb_d = exc_csr_data_mem_wb_i;
  wire [`ysyx_041514_XLEN_BUS] _exc_csr_data_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_exc_csr_data_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_exc_csr_data_mem_wb_d),
      .dout(_exc_csr_data_mem_wb_q),
      .wen (reg_wen)
  );
  assign exc_csr_data_mem_wb_o = _exc_csr_data_mem_wb_q;


  /* exc_csr_valid 寄存器 */
  wire _exc_csr_valid_mem_wb_d = exc_csr_valid_mem_wb_i;
  wire _exc_csr_valid_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_exc_csr_valid_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_exc_csr_valid_mem_wb_d),
      .dout(_exc_csr_valid_mem_wb_q),
      .wen (reg_wen)
  );
  assign exc_csr_valid_mem_wb_o = _exc_csr_valid_mem_wb_q;


  /* rd_addr 寄存器 */
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rd_addr_mem_wb_d = rd_addr_mem_wb_i;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rd_addr_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_REG_ADDRWIDTH),
      .RESET_VAL(`ysyx_041514_REG_ADDRWIDTH'b0)  //TODO:默认值未设置
  ) u_rd_addr_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_rd_addr_mem_wb_d),
      .dout(_rd_addr_mem_wb_q),
      .wen (reg_wen)
  );
  assign rd_addr_mem_wb_o = _rd_addr_mem_wb_q;


  /* mem_data寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _mem_data_mem_wb_d = mem_data_mem_wb_i;
  wire [`ysyx_041514_XLEN-1:0] _mem_data_mem_wb_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_mem_data_mem_wb (
      .clk (clk),
      .rst (reg_rst),
      .din (_mem_data_mem_wb_d),
      .dout(_mem_data_mem_wb_q),
      .wen (reg_wen)
  );

  assign mem_data_mem_wb_o = _mem_data_mem_wb_q;

endmodule


 

module ysyx_041514_ex_mem (
    input clk,
    input rst,
    input [5:0] flush_valid_i,
    input [5:0] stall_valid_i,

    input [             `ysyx_041514_XLEN_BUS] pc_ex_mem_i,
    input [         `ysyx_041514_INST_LEN-1:0] inst_data_ex_mem_i,
    // input [             `ysyx_041514_XLEN_BUS] imm_data_ex_mem_i,
    input [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_ex_mem_i,
    // input [             `ysyx_041514_XLEN_BUS] rs1_data_ex_mem_i,
    input [             `ysyx_041514_XLEN_BUS] rs2_data_ex_mem_i,
    input [             `ysyx_041514_XLEN_BUS] alu_data_ex_mem_i,
    input [             `ysyx_041514_XLEN_BUS] csr_writedata_ex_mem_i,   // CSR 写回数据
    input                                      csr_writevalid_ex_mem_i,  // CSR 写回使能
    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_ex_mem_i,        // CSR 写回地址
    // input [         `ysyx_041514_PCOP_LEN-1:0] pc_op_ex_mem_i,
    input [        `ysyx_041514_MEMOP_LEN-1:0] mem_op_ex_mem_i,

    /* TARP 总线 */
    input [`ysyx_041514_TRAP_BUS] trap_bus_ex_mem_i,


    output [             `ysyx_041514_XLEN_BUS] pc_ex_mem_o,
    output [         `ysyx_041514_INST_LEN-1:0] inst_data_ex_mem_o,
    // output [             `ysyx_041514_XLEN_BUS] imm_data_ex_mem_o,
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_ex_mem_o,
    // output [             `ysyx_041514_XLEN_BUS] rs1_data_ex_mem_o,
    output [             `ysyx_041514_XLEN_BUS] rs2_data_ex_mem_o,
    output [             `ysyx_041514_XLEN_BUS] alu_data_ex_mem_o,
    output [             `ysyx_041514_XLEN_BUS] csr_writedata_ex_mem_o,
    output                                      csr_writevalid_ex_mem_o,
    output [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_ex_mem_o,        // CSR 写回地址
    // output [         `ysyx_041514_PCOP_LEN-1:0] pc_op_ex_mem_o,
    output [        `ysyx_041514_MEMOP_LEN-1:0] mem_op_ex_mem_o,

    /* TARP 总线 */
    output [`ysyx_041514_TRAP_BUS] trap_bus_ex_mem_o
);

  wire reg_wen = !stall_valid_i[`ysyx_041514_CTRLBUS_EX_MEM];
  wire _flush_valid = flush_valid_i[`ysyx_041514_CTRLBUS_EX_MEM];
  wire reg_rst = rst | _flush_valid;

  /* pc 寄存器 */
  wire [`ysyx_041514_XLEN_BUS] _pc_ex_mem_d = pc_ex_mem_i;
  wire [`ysyx_041514_XLEN_BUS] _pc_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_pc_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_pc_ex_mem_d),
      .dout(_pc_ex_mem_q),
      .wen (reg_wen)
  );
  assign pc_ex_mem_o = _pc_ex_mem_q;


  /* inst_data 寄存器 */
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_ex_mem_d = inst_data_ex_mem_i;
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_INST_LEN),
      .RESET_VAL(`ysyx_041514_INST_NOP)
  ) u_inst_data_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_inst_data_ex_mem_d),
      .dout(_inst_data_ex_mem_q),
      .wen (reg_wen)
  );
  assign inst_data_ex_mem_o = _inst_data_ex_mem_q;




  /* rd_idx 寄存器 */
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rd_idx_ex_mem_d = rd_idx_ex_mem_i;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rd_idx_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_REG_ADDRWIDTH),
      .RESET_VAL(`ysyx_041514_REG_ADDRWIDTH'b0)
  ) u_rd_idx_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_rd_idx_ex_mem_d),
      .dout(_rd_idx_ex_mem_q),
      .wen (reg_wen)
  );
  assign rd_idx_ex_mem_o = _rd_idx_ex_mem_q;



  /* rs2_data 寄存器 */
  wire [`ysyx_041514_XLEN_BUS] _rs2_data_ex_mem_d = rs2_data_ex_mem_i;
  wire [`ysyx_041514_XLEN_BUS] _rs2_data_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_rs2_data_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_rs2_data_ex_mem_d),
      .dout(_rs2_data_ex_mem_q),
      .wen (reg_wen)
  );
  assign rs2_data_ex_mem_o = _rs2_data_ex_mem_q;



  /* alu_data 寄存器 */
  wire [`ysyx_041514_XLEN_BUS] _alu_data_ex_mem_d = alu_data_ex_mem_i;
  wire [`ysyx_041514_XLEN_BUS] _alu_data_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_alu_data_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_alu_data_ex_mem_d),
      .dout(_alu_data_ex_mem_q),
      .wen (reg_wen)
  );
  assign alu_data_ex_mem_o = _alu_data_ex_mem_q;


  /* csr_writedata 寄存器 */
  wire [`ysyx_041514_XLEN_BUS] _csr_writedata_ex_mem_d = csr_writedata_ex_mem_i;
  wire [`ysyx_041514_XLEN_BUS] _csr_writedata_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)  //TODO:默认值未设置
  ) u_csr_writedata_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_writedata_ex_mem_d),
      .dout(_csr_writedata_ex_mem_q),
      .wen (reg_wen)
  );
  assign csr_writedata_ex_mem_o = _csr_writedata_ex_mem_q;

  /* csr_writevalid 寄存器 */
  wire _csr_writevalid_ex_mem_d = csr_writevalid_ex_mem_i;
  wire _csr_writevalid_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)  //TODO:默认值未设置
  ) u_csr_writevalid_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_writevalid_ex_mem_d),
      .dout(_csr_writevalid_ex_mem_q),
      .wen (reg_wen)
  );
  assign csr_writevalid_ex_mem_o = _csr_writevalid_ex_mem_q;


  /* csr_addr 寄存器 */
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_addr_ex_mem_d = csr_addr_ex_mem_i;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_addr_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_CSR_REG_ADDRWIDTH),
      .RESET_VAL(`ysyx_041514_CSR_REG_ADDRWIDTH'b0)  //TODO:默认值未设置
  ) u_csr_addr_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_addr_ex_mem_d),
      .dout(_csr_addr_ex_mem_q),
      .wen (reg_wen)
  );
  assign csr_addr_ex_mem_o = _csr_addr_ex_mem_q;




  /* mem_op 寄存器 */
  wire [`ysyx_041514_MEMOP_LEN-1:0] _mem_op_ex_mem_d = mem_op_ex_mem_i;
  wire [`ysyx_041514_MEMOP_LEN-1:0] _mem_op_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_MEMOP_LEN),
      .RESET_VAL(`ysyx_041514_MEMOP_NONE)  //TODO:默认值未设置
  ) u_mem_op_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_mem_op_ex_mem_d),
      .dout(_mem_op_ex_mem_q),
      .wen (reg_wen)
  );
  assign mem_op_ex_mem_o = _mem_op_ex_mem_q;


  /* trap_bus 寄存器 */
  wire [`ysyx_041514_TRAP_LEN-1:0] _trap_bus_ex_mem_d = trap_bus_ex_mem_i;
  wire [`ysyx_041514_TRAP_LEN-1:0] _trap_bus_ex_mem_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_TRAP_LEN),
      .RESET_VAL(`ysyx_041514_TRAP_LEN'b0)  //TODO:默认值未设置
  ) u_trap_bus_ex_mem_id (
      .clk (clk),
      .rst (reg_rst),
      .din (_trap_bus_ex_mem_d),
      .dout(_trap_bus_ex_mem_q),
      .wen (reg_wen)
  );
  assign trap_bus_ex_mem_o = _trap_bus_ex_mem_q;


endmodule
 

module ysyx_041514_pc_reg (
    input clk,
    input rst,
    input [5:0] stall_valid_i,
    input [5:0] flush_valid_i,

    input [`ysyx_041514_XLEN_BUS] redirect_pc_i,  // branch pc,来自 exc 模块
    input redirect_pc_valid_i,  // 分支预测错误时，需要重定向 pc
    input [`ysyx_041514_XLEN_BUS] clint_pc_i,  // trap pc,来自mem
    input clint_pc_valid_i,  // trap pc valide,来自mem
    input clint_pc_plus4_valid_o,  // fencei 的 pc +4
    // input [`ysyx_041514_XLEN_BUS] bpu_pc_i,  // bpu pc ,来自 if bpu 分支预测
    input [`ysyx_041514_XLEN_BUS] bpu_pc_op1_i,
    input [`ysyx_041514_XLEN_BUS] bpu_pc_op2_i,
    input bpu_pc_valid_i,

    output                             read_req_o,
    output [`ysyx_041514_NPC_ADDR_BUS] pc_next_o,   //输出 next_pc, icache 取指
    output [    `ysyx_041514_XLEN_BUS] pc_o         //输出pc
);

  wire [`ysyx_041514_XLEN_BUS] _pc_current;
  wire [`ysyx_041514_XLEN_BUS] pc_temp = clint_pc_plus4_valid_o ? clint_pc_i : _pc_current;
  wire [`ysyx_041514_XLEN_BUS] pc_temp_plus4 = pc_temp + 'd4;

  reg [`ysyx_041514_XLEN_BUS] _pc_next;
  always @(*) begin
    if (clint_pc_valid_i & clint_pc_plus4_valid_o) begin : int_pc
      _pc_next = pc_temp_plus4;
    end else if (clint_pc_valid_i & ~clint_pc_plus4_valid_o) begin : trap_pc
      _pc_next = clint_pc_i;
    end else if (redirect_pc_valid_i) begin : redirect_pc
      _pc_next = redirect_pc_i;
    end else if (bpu_pc_valid_i) begin : bpu_pc
      _pc_next = bpu_pc_op1_i + bpu_pc_op2_i;
    end else begin
      _pc_next = pc_temp_plus4;
    end
  end


  wire _read_req = (~rst);  // pre if 阶段访问 icache, if 阶段返回数据

  wire _pc_reg_wen = (~stall_valid_i[`ysyx_041514_CTRLBUS_PC]) & (~rst);  // stall
  wire _flush_valid = flush_valid_i[`ysyx_041514_CTRLBUS_PC];  // flush

  wire [`ysyx_041514_XLEN_BUS] _pc_next_d = (_flush_valid) ? `ysyx_041514_PC_RESET_ADDR : _pc_next;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_PC_RESET_ADDR)
  ) u_pc_reg (
      .clk (clk),
      .rst (rst),
      .din (_pc_next_d),
      .dout(_pc_current),
      .wen (_pc_reg_wen)
  );

  // next pc,为 icache 的访存地址, stall 时,保持上一个 pc 的值
  assign pc_next_o = stall_valid_i[`ysyx_041514_CTRLBUS_PC] ? _pc_current[31:0] : _pc_next_d[31:0];

  assign pc_o = _pc_current;
  assign read_req_o = _read_req;

endmodule
 


module ysyx_041514_data_buff (
    input clk,
    input rst,
    input [5:0] flush_i,
    input [5:0] stall_i,

    /* 乘法器数据缓存 */
    input [`ysyx_041514_XLEN_BUS] alu_data_i,
    input alu_data_ready_i,
    output alu_data_buff_valid_o,
    output [`ysyx_041514_XLEN_BUS] alu_data_buff_o,

    /* fencei ready 缓存 */
    input  mem_fencei_ready_i,
    output mem_fencei_ready_buff_o,
    output mem_fencei_buff_valid_o,

    /* mem 读数据缓存 */
    input                          mem_data_ready_i,
    input  [`ysyx_041514_XLEN-1:0] mem_data_mem_i,      //访存阶段的数据
    output                         rdata_buff_valid_o,
    output [`ysyx_041514_XLEN_BUS] rdata_buff_o
);
// 寄存器已复位

  reg [`ysyx_041514_XLEN_BUS] alu_data_buff;
  reg alu_data_buff_valid;

  always @(posedge clk) begin
    if (rst) begin
      alu_data_buff_valid <= `ysyx_041514_FALSE;
      alu_data_buff <= 'b0;
    end else if (alu_data_ready_i&stall_i[`ysyx_041514_CTRLBUS_ID_EX]) begin  // 接收到数据时，缓存起来
      alu_data_buff_valid <= `ysyx_041514_TRUE;  // 缓存数据有效
      alu_data_buff       <= alu_data_i;  // 记录读取的数据
    end else if ((~stall_i[`ysyx_041514_CTRLBUS_ID_EX])&alu_data_buff_valid) begin  // mem 阶段 stall 时，保持缓存不变
      alu_data_buff_valid <= `ysyx_041514_FALSE;  // 流水线不阻塞，缓存清空
      alu_data_buff <= 'b0;
    end
    // else 保持不变
  end
  assign alu_data_buff_o = alu_data_buff;
  assign alu_data_buff_valid_o = alu_data_buff_valid;




  reg [`ysyx_041514_XLEN_BUS] rdata_buff;
  reg rdata_buff_valid;

  always @(posedge clk) begin
    if (rst) begin
      rdata_buff_valid <= `ysyx_041514_FALSE;
      rdata_buff <= 'b0;

    end else if (mem_data_ready_i & stall_i[`ysyx_041514_CTRLBUS_EX_MEM]) begin  // 接收到数据时，缓存起来
      rdata_buff_valid <= `ysyx_041514_TRUE;  // 缓存数据有效
      rdata_buff       <= mem_data_mem_i;  // 记录读取的数据
    end else if ((~stall_i[`ysyx_041514_CTRLBUS_EX_MEM])&rdata_buff_valid) begin  // mem 阶段 stall 时，保持缓存不变
      rdata_buff_valid <= `ysyx_041514_FALSE;  // 流水线不阻塞，缓存清空
      rdata_buff <= 'b0;
    end
    // else 保持不变
  end

  assign rdata_buff_valid_o = rdata_buff_valid;
  assign rdata_buff_o = rdata_buff;


  reg mem_fencei_ready_buff;
  reg mem_fencei_buff_valid;

  always @(posedge clk) begin
    if (rst) begin
      mem_fencei_buff_valid <= `ysyx_041514_FALSE;
      mem_fencei_ready_buff <= 'b0;

    end else if (mem_fencei_ready_i & stall_i[`ysyx_041514_CTRLBUS_EX_MEM]) begin  // 1. 接收到数据，且 mem 阶段 stall 时，缓存数据
      mem_fencei_buff_valid <= `ysyx_041514_TRUE;  // 缓存数据有效
      mem_fencei_ready_buff <= mem_fencei_ready_i;  // 记录读取的数据
    end else if ((~stall_i[`ysyx_041514_CTRLBUS_EX_MEM])&mem_fencei_buff_valid) begin  // 2. mem 阶段不是 stall 时，清空缓存
      mem_fencei_buff_valid <= `ysyx_041514_FALSE;  // 流水线不阻塞，缓存清空
      mem_fencei_ready_buff <= 'b0;
    end
    // else 保持不变
  end

  assign mem_fencei_ready_buff_o = mem_fencei_ready_buff;
  assign mem_fencei_buff_valid_o = mem_fencei_buff_valid;





endmodule
 

module ysyx_041514_id_ex (
    input                                      clk,
    input                                      rst,
    input [                               5:0] flush_valid_i,
    input [                               5:0] stall_valid_i,
    /* 输入 */
    input [             `ysyx_041514_XLEN-1:0] pc_id_ex_i,
    input [         `ysyx_041514_INST_LEN-1:0] inst_data_id_ex_i,
    input                                      bru_taken_id_ex_i,
    // input      [    `ysyx_041514_REG_ADDRWIDTH-1:0] rs1_idx_id_ex_i,
    // input      [    `ysyx_041514_REG_ADDRWIDTH-1:0] rs2_idx_id_ex_i,
    input [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_id_ex_i,
    input [          `ysyx_041514_IMM_LEN-1:0] imm_data_id_ex_i,
    input [          `ysyx_041514_IMM_LEN-1:0] csr_imm_id_ex_i,
    input                                      csr_imm_valid_id_ex_i,
    input [             `ysyx_041514_XLEN_BUS] rs1_data_id_ex_i,
    input [             `ysyx_041514_XLEN_BUS] rs2_data_id_ex_i,
    input [             `ysyx_041514_XLEN_BUS] csr_data_id_ex_i,
    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_idx_id_ex_i,
    input [        `ysyx_041514_ALUOP_LEN-1:0] alu_op_id_ex_i,         // alu 操作码
    input [        `ysyx_041514_MEMOP_LEN-1:0] mem_op_id_ex_i,         // mem 操作码
    input [        `ysyx_041514_EXCOP_LEN-1:0] exc_op_id_ex_i,         // exc 操作码
    // input      [         `ysyx_041514_PCOP_LEN-1:0] pc_op_id_ex_i,          // pc 操作码
    input [        `ysyx_041514_CSROP_LEN-1:0] csr_op_id_ex_i,         // csr 操作码
    /* TARP 总线 */
    input [             `ysyx_041514_TRAP_BUS] trap_bus_id_ex_i,

    /* 输出 */
    output [             `ysyx_041514_XLEN-1:0] pc_id_ex_o,
    output [         `ysyx_041514_INST_LEN-1:0] inst_data_id_ex_o,
    output                                      bru_taken_id_ex_o,
    // output      [    `ysyx_041514_REG_ADDRWIDTH-1:0] rs1_idx_id_ex_o,
    // output      [    `ysyx_041514_REG_ADDRWIDTH-1:0] rs2_idx_id_ex_o,
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_id_ex_o,
    output [          `ysyx_041514_IMM_LEN-1:0] imm_data_id_ex_o,
    output [          `ysyx_041514_IMM_LEN-1:0] csr_imm_id_ex_o,
    output                                      csr_imm_valid_id_ex_o,
    output [             `ysyx_041514_XLEN_BUS] rs1_data_id_ex_o,
    output [             `ysyx_041514_XLEN_BUS] rs2_data_id_ex_o,
    output [             `ysyx_041514_XLEN_BUS] csr_data_id_ex_o,
    output [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_idx_id_ex_o,
    output [        `ysyx_041514_ALUOP_LEN-1:0] alu_op_id_ex_o,         // alu 操作码
    output [        `ysyx_041514_MEMOP_LEN-1:0] mem_op_id_ex_o,         // mem 操作码
    output [        `ysyx_041514_EXCOP_LEN-1:0] exc_op_id_ex_o,         // exc 操作码
    // output      [         `ysyx_041514_PCOP_LEN-1:0] pc_op_id_ex_o,          // pc 操作码
    output [        `ysyx_041514_CSROP_LEN-1:0] csr_op_id_ex_o,         // csr 操作码
    /* TARP 总线 */
    output [             `ysyx_041514_TRAP_BUS] trap_bus_id_ex_o

);

  wire reg_wen = !stall_valid_i[`ysyx_041514_CTRLBUS_ID_EX];
  wire _flush_valid = flush_valid_i[`ysyx_041514_CTRLBUS_ID_EX];
  wire reg_rst = rst | _flush_valid;

  /* pc 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _pc_id_ex_d = pc_id_ex_i;
  wire [`ysyx_041514_XLEN-1:0] _pc_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_pc_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_pc_id_ex_d),
      .dout(_pc_id_ex_q),
      .wen (reg_wen)
  );
  assign pc_id_ex_o = _pc_id_ex_q;

  /* inst_data 寄存器 */
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_id_ex_d = inst_data_id_ex_i;
  wire [`ysyx_041514_INST_LEN-1:0] _inst_data_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_INST_LEN),
      .RESET_VAL(`ysyx_041514_INST_NOP)
  ) u_inst_data_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_inst_data_id_ex_d),
      .dout(_inst_data_id_ex_q),
      .wen (reg_wen)
  );
  assign inst_data_id_ex_o = _inst_data_id_ex_q;


  /* bru_taken_if_i 寄存器 */
  wire _bru_taken_id_ex_d = bru_taken_id_ex_i;
  wire _bru_taken_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(0)
  ) u_bru_taken_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_bru_taken_id_ex_d),
      .dout(_bru_taken_id_ex_q),
      .wen (reg_wen)
  );
  assign bru_taken_id_ex_o = _bru_taken_id_ex_q;


  //   /* rs1_idx 寄存器 */
  //   wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rs1_idx_id_ex_d = (_flush_valid) ? `ysyx_041514_REG_ADDRWIDTH'b0 : rs1_idx_id_ex_i;
  //   wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rs1_idx_id_ex_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_REG_ADDRWIDTH),
  //       .RESET_VAL(`ysyx_041514_REG_ADDRWIDTH'b0)
  //   ) u_rs1_idx_id_ex (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_rs1_idx_id_ex_d),
  //       .dout(_rs1_idx_id_ex_q),
  //       .wen (reg_wen)
  //   );
  //   assign rs1_idx_id_ex_o = _rs1_idx_id_ex_q;

  //   /* rs2_idx 寄存器 */
  //   wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rs2_idx_id_ex_d = (_flush_valid) ? `ysyx_041514_REG_ADDRWIDTH'b0 :rs2_idx_id_ex_i;
  //   wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rs2_idx_id_ex_q;
  //   ysyx_041514_regTemplate #(
  //       .WIDTH    (`ysyx_041514_REG_ADDRWIDTH),
  //       .RESET_VAL(`ysyx_041514_REG_ADDRWIDTH'b0)
  //   ) u_rs2_idx_id_ex (
  //       .clk (clk),
  //       .rst (reg_rst),
  //       .din (_rs2_idx_id_ex_d),
  //       .dout(_rs2_idx_id_ex_q),
  //       .wen (reg_wen)
  //   );
  //   assign rs2_idx_id_ex_o = _rs2_idx_id_ex_q;


  /* rd_idx 寄存器 */
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rd_idx_id_ex_d = rd_idx_id_ex_i;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] _rd_idx_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_REG_ADDRWIDTH),
      .RESET_VAL(`ysyx_041514_REG_ADDRWIDTH'b0)
  ) u_rd_idx_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_rd_idx_id_ex_d),
      .dout(_rd_idx_id_ex_q),
      .wen (reg_wen)
  );
  assign rd_idx_id_ex_o = _rd_idx_id_ex_q;


  /* imm_data 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _imm_data_id_ex_d = imm_data_id_ex_i;
  wire [`ysyx_041514_XLEN-1:0] _imm_data_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_imm_data_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_imm_data_id_ex_d),
      .dout(_imm_data_id_ex_q),
      .wen (reg_wen)
  );
  assign imm_data_id_ex_o = _imm_data_id_ex_q;


  /* csr_imm 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_imm_id_ex_d = csr_imm_id_ex_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_imm_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_imm_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_imm_id_ex_d),
      .dout(_csr_imm_id_ex_q),
      .wen (reg_wen)
  );
  assign csr_imm_id_ex_o = _csr_imm_id_ex_q;


  /* csr_imm_valid 寄存器 */
  wire _csr_imm_valid_id_ex_d = csr_imm_valid_id_ex_i;
  wire _csr_imm_valid_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (1),
      .RESET_VAL(`ysyx_041514_FALSE)
  ) u_csr_imm_valid_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_imm_valid_id_ex_d),
      .dout(_csr_imm_valid_id_ex_q),
      .wen (reg_wen)
  );
  assign csr_imm_valid_id_ex_o = _csr_imm_valid_id_ex_q;


  /* csr_idx 寄存器 */
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_idx_id_ex_d = csr_idx_id_ex_i;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] _csr_idx_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_CSR_REG_ADDRWIDTH),
      .RESET_VAL(`ysyx_041514_CSR_REG_ADDRWIDTH'b0)
  ) u_csr_idx_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_idx_id_ex_d),
      .dout(_csr_idx_id_ex_q),
      .wen (reg_wen)
  );
  assign csr_idx_id_ex_o = _csr_idx_id_ex_q;


  /* rs1_data 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _rs1_data_id_ex_d = rs1_data_id_ex_i;
  wire [`ysyx_041514_XLEN-1:0] _rs1_data_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_rs1_data_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_rs1_data_id_ex_d),
      .dout(_rs1_data_id_ex_q),
      .wen (reg_wen)
  );
  assign rs1_data_id_ex_o = _rs1_data_id_ex_q;


  /* rs2_data 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _rs2_data_id_ex_d = rs2_data_id_ex_i;
  wire [`ysyx_041514_XLEN-1:0] _rs2_data_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_rs2_data_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_rs2_data_id_ex_d),
      .dout(_rs2_data_id_ex_q),
      .wen (reg_wen)
  );
  assign rs2_data_id_ex_o = _rs2_data_id_ex_q;



  /* csr_data 寄存器 */
  wire [`ysyx_041514_XLEN-1:0] _csr_data_id_ex_d = csr_data_id_ex_i;
  wire [`ysyx_041514_XLEN-1:0] _csr_data_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_XLEN),
      .RESET_VAL(`ysyx_041514_XLEN'b0)
  ) u_csr_data_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_data_id_ex_d),
      .dout(_csr_data_id_ex_q),
      .wen (reg_wen)
  );
  assign csr_data_id_ex_o = _csr_data_id_ex_q;


  /* alu_op 寄存器 */
  wire [`ysyx_041514_ALUOP_LEN-1:0] _alu_op_id_ex_d = alu_op_id_ex_i;
  wire [`ysyx_041514_ALUOP_LEN-1:0] _alu_op_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_ALUOP_LEN),
      .RESET_VAL(`ysyx_041514_ALUOP_NONE)
  ) u_alu_op_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_alu_op_id_ex_d),
      .dout(_alu_op_id_ex_q),
      .wen (reg_wen)
  );
  assign alu_op_id_ex_o = _alu_op_id_ex_q;


  /* mem_op 寄存器 */
  wire [`ysyx_041514_MEMOP_LEN-1:0] _mem_op_id_ex_d = mem_op_id_ex_i;
  wire [`ysyx_041514_MEMOP_LEN-1:0] _mem_op_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_MEMOP_LEN),
      .RESET_VAL(`ysyx_041514_MEMOP_NONE)
  ) u_mem_op_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_mem_op_id_ex_d),
      .dout(_mem_op_id_ex_q),
      .wen (reg_wen)
  );
  assign mem_op_id_ex_o = _mem_op_id_ex_q;


  /* exc_op 寄存器 */

  wire [`ysyx_041514_EXCOP_LEN-1:0] _exc_op_id_ex_d = exc_op_id_ex_i;
  wire [`ysyx_041514_EXCOP_LEN-1:0] _exc_op_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_EXCOP_LEN),
      .RESET_VAL(`ysyx_041514_EXCOP_NONE)
  ) u_exc_op_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_exc_op_id_ex_d),
      .dout(_exc_op_id_ex_q),
      .wen (reg_wen)
  );
  assign exc_op_id_ex_o = _exc_op_id_ex_q;


  /* csr_op 寄存器 */
  wire [`ysyx_041514_CSROP_LEN-1:0] _csr_op_id_ex_d = csr_op_id_ex_i;
  wire [`ysyx_041514_CSROP_LEN-1:0] _csr_op_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_CSROP_LEN),
      .RESET_VAL(`ysyx_041514_CSROP_NONE)
  ) u_csr_op_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_csr_op_id_ex_d),
      .dout(_csr_op_id_ex_q),
      .wen (reg_wen)
  );
  assign csr_op_id_ex_o = _csr_op_id_ex_q;


  /* trap_bus 寄存器 */
  wire [`ysyx_041514_TRAP_LEN-1:0] _trap_bus_id_ex_d = trap_bus_id_ex_i;
  wire [`ysyx_041514_TRAP_LEN-1:0] _trap_bus_id_ex_q;
  ysyx_041514_regTemplate #(
      .WIDTH    (`ysyx_041514_TRAP_LEN),
      .RESET_VAL(`ysyx_041514_TRAP_LEN'b0)
  ) u_trap_bus_id_ex (
      .clk (clk),
      .rst (reg_rst),
      .din (_trap_bus_id_ex_d),
      .dout(_trap_bus_id_ex_q),
      .wen (reg_wen)
  );
  assign trap_bus_id_ex_o = _trap_bus_id_ex_q;






endmodule
 
module ysyx_041514_execute_top (
    input                                       clk,
    input                                       rst,
    /******************************* from id/ex *************************/
    // pc
    input  [             `ysyx_041514_XLEN_BUS] pc_i,
    input  [         `ysyx_041514_INST_LEN-1:0] inst_data_i,
    input                                       bru_taken_i,
    // gpr 译码结果
    input  [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_i,
    input  [             `ysyx_041514_XLEN_BUS] rs1_data_i,
    input  [             `ysyx_041514_XLEN_BUS] rs2_data_i,
    input  [          `ysyx_041514_IMM_LEN-1:0] imm_data_i,
    // CSR 译码结果 
    input  [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_readaddr_i,
    input  [             `ysyx_041514_XLEN_BUS] csr_data_i,
    input  [          `ysyx_041514_IMM_LEN-1:0] csr_imm_i,
    input                                       csr_imm_valid_i,
    // 指令微码
    input  [        `ysyx_041514_ALUOP_LEN-1:0] alu_op_i,         // alu 操作码
    input  [        `ysyx_041514_MEMOP_LEN-1:0] mem_op_i,         // 访存操作码
    input  [        `ysyx_041514_EXCOP_LEN-1:0] exc_op_i,         // exc 操作码
    input  [        `ysyx_041514_CSROP_LEN-1:0] csr_op_i,         // exc_csr 操作码
    /* TARP 总线 */
    input  [             `ysyx_041514_TRAP_BUS] trap_bus_i,
    /********************** to ex/mem **************************/
    // pc 同时给 EX/MEM 和 MEM（用于中断返回地址）
    output [             `ysyx_041514_XLEN_BUS] pc_o,
    output [         `ysyx_041514_INST_LEN-1:0] inst_data_o,
    // gpr 译码结果
    output [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_o,
    output [             `ysyx_041514_XLEN_BUS] rs2_data_o,
    // CSR 译码结果 
    output [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] exc_csr_addr_o,
    output [        `ysyx_041514_MEMOP_LEN-1:0] mem_op_o,         // 访存操作码

    output [`ysyx_041514_XLEN_BUS] exc_alu_data_o,  // ALU 计算得到的数据，同时送给 ID（bypass） 和 EX/MEM
    output [`ysyx_041514_XLEN_BUS] exc_csr_data_o,  // csr 计算得到的数据
    output exc_csr_valid_o,
    /************************to pc_reg ******************************************/
    output [`ysyx_041514_XLEN_BUS] redirect_pc_o,
    output redirect_pc_valid_o,

    /********************* from data_buff *******************/

    input alu_data_buff_valid_i,  // ALU结果缓存
    input [`ysyx_041514_XLEN_BUS] alu_data_buff_i,
    output alu_data_ready_o,
    /* trap bus */
    output jump_hazard_valid_o,  // 请求暂停流水线
    output alu_mul_div_valid_o,

    output [`ysyx_041514_TRAP_BUS] trap_bus_o
);
  assign pc_o = pc_i;
  assign inst_data_o = inst_data_i;
  assign mem_op_o = mem_op_i;
  assign rs2_data_o = rs2_data_i;
  assign rd_idx_o = rd_idx_i;
  assign exc_csr_addr_o = csr_readaddr_i;


  wire [`ysyx_041514_XLEN_BUS] _alu_out;
  wire _compare_out;
  wire alu_stall_req;


  wire _excop_none = exc_op_i[`ysyx_041514_EXCOP_NONE];
  wire _excop_auipc = exc_op_i[`ysyx_041514_EXCOP_AUIPC];
  wire _excop_lui = exc_op_i[`ysyx_041514_EXCOP_LUI];
  wire _excop_jal = exc_op_i[`ysyx_041514_EXCOP_JAL];
  wire _excop_jalr = exc_op_i[`ysyx_041514_EXCOP_JALR];
  wire _excop_load = exc_op_i[`ysyx_041514_EXCOP_LOAD];
  wire _excop_store = exc_op_i[`ysyx_041514_EXCOP_STORE];
  wire _excop_branch = exc_op_i[`ysyx_041514_EXCOP_BRANCH];
  wire _excop_opimm = exc_op_i[`ysyx_041514_EXCOP_OPIMM];
  wire _excop_opimm32 = exc_op_i[`ysyx_041514_EXCOP_OPIMM32];
  wire _excop_op = exc_op_i[`ysyx_041514_EXCOP_OP];
  wire _excop_op32 = exc_op_i[`ysyx_041514_EXCOP_OP32];
  wire _excop_csr = exc_op_i[`ysyx_041514_EXCOP_CSR];

  /*****************************branch 操作********************************/

  // 以下两种情况 跳转指令 ，应该执行跳转
  // 1. branch 指令，且条件成立
  // 2. jal、jalr 指令
  wire jump_taken = (_compare_out & _excop_branch) | _excop_jalr | _excop_jal;

  // bru_taken_i 实际的跳转情况
  // jump_taken 正确的跳转情况
  // 两者不同，分支预测错误，需要冲刷流水线，修改 pc
  wire bpu_pc_wrong = jump_taken ^ bru_taken_i;



  // 1. _excop_branch，_excop_jal （pc+imm）
  // 2. _excop_jalr (rs1+imm)
  // 3. bpu err （pc+4）or (pc+imm)、(rs1+imm)，depending on bru_taken_i
  reg [`ysyx_041514_XLEN_BUS] redirect_pc_op1;
  reg [`ysyx_041514_XLEN_BUS] redirect_pc_op2;
  always @(*) begin
    if (bru_taken_i) begin
      redirect_pc_op1 = pc_i;
      redirect_pc_op2 = 'd4;
    end else begin
      redirect_pc_op1 = _excop_jalr ? rs1_data_i : pc_i;
      redirect_pc_op2 = imm_data_i;
    end
  end

  // TODO 节省加法器, 可能引入关键路径
  wire [`ysyx_041514_XLEN_BUS] redirect_pc = redirect_pc_op1 + redirect_pc_op2;

  assign redirect_pc_o = redirect_pc;
  assign redirect_pc_valid_o = bpu_pc_wrong;
  // 若跳转指令有效，通知控制模块，中断流水线
  assign jump_hazard_valid_o = bpu_pc_wrong;



  /****************************** ALU 操作******************************************/

  /* ALU 两端操作数选择 */
  wire _rs1_rs2 = _excop_op32 | _excop_op | _excop_branch;
  wire _rs1_imm = _excop_opimm | _excop_opimm32 | _excop_load | _excop_store;
  wire _pc_4 = _excop_jal | _excop_jalr;
  wire _pc_imm12 = _excop_auipc;
  wire _none_imm12 = _excop_lui;
  wire _none_csr = _excop_csr;  //保存原来的 csr csr->rd

  /* jal jalr lui auipc ecall ebreak 需要单独处理 */
  /* 拼接代替左移 */
  // wire [`ysyx_041514_IMM_LEN-1:0] _imm_aui_auipc = imm_data << 12;
  wire [`ysyx_041514_IMM_LEN-1:0] _imm_aui_auipc = {imm_data_i[`ysyx_041514_IMM_LEN-1:12], 12'b0};
  // ALU 第一个操作数
  wire [         `ysyx_041514_XLEN_BUS] _alu_in1 = ({`ysyx_041514_XLEN{_rs1_rs2 | _rs1_imm}}&rs1_data_i) |
                                       ({`ysyx_041514_XLEN{_pc_4 | _pc_imm12}}&pc_i) |
                                       ({`ysyx_041514_XLEN{_none_imm12|_none_csr}}&`ysyx_041514_XLEN'b0);
  // ALU 第二个操作数
  wire [         `ysyx_041514_XLEN_BUS] _alu_in2 = ({`ysyx_041514_XLEN{_rs1_rs2}}&rs2_data_i) |
                                       ({`ysyx_041514_XLEN{_rs1_imm}}&imm_data_i) |
                                       ({`ysyx_041514_XLEN{_none_csr}}&csr_data_i) |
                                       ({`ysyx_041514_XLEN{_pc_4}}&`ysyx_041514_XLEN'd4)   |
                                       ({`ysyx_041514_XLEN{_pc_imm12|_none_imm12}}&_imm_aui_auipc);


  ysyx_041514_alu_top u_alu (
      .clk(clk),
      .rst(rst),
      /* ALU 端口 */
      .alu_a_i(_alu_in1),
      .alu_b_i(_alu_in2),
      .alu_out_o(_alu_out),
      .alu_op_i(alu_op_i),
      .compare_out_o(_compare_out),
      /* 乘法、除法结果缓存 */
      .alu_data_buff_valid_i(alu_data_buff_valid_i),
      .alu_data_buff_i(alu_data_buff_i),
      .alu_data_ready_o(alu_data_ready_o),
      .alu_stall_req_o(alu_stall_req)
  );
  /* alu计算结果需要符号扩展 */
  wire _alu_sext = _excop_opimm32 | _excop_op32;
  wire [`ysyx_041514_XLEN_BUS] _alu_sext_out = {{32{_alu_out[31]}}, _alu_out[31:0]};
  assign exc_alu_data_o = (_alu_sext) ? _alu_sext_out : _alu_out;
  // 乘除法需要暂停处理器
  assign alu_mul_div_valid_o = alu_stall_req;

  /***************************** CSR 执行操作 **************************/

  wire [`ysyx_041514_XLEN_BUS] _csr_exe_data;
  wire _csr_exe_data_valid;
  ysyx_041514_execute_csr u_execute_csr (
      .csr_imm_i           (csr_imm_i),
      .csr_imm_valid_i     (csr_imm_valid_i),     // 是否是立即数指令
      .rs1_data_i          (rs1_data_i),          // rs1 data
      .csr_data_i          (csr_data_i),          // 读取的 CSR 数据
      .csr_op_i            (csr_op_i),            // csr 操作码
      .csr_exe_data_o      (_csr_exe_data),
      .csr_exe_data_valid_o(_csr_exe_data_valid)
  );

  assign exc_csr_data_o  = _csr_exe_data;
  assign exc_csr_valid_o = _csr_exe_data_valid;


  /* trap_bus TODO:add more*/
  reg [`ysyx_041514_TRAP_BUS] _exc_trap_bus;
  integer i;
  always @(*) begin
    for (i = 0; i < `ysyx_041514_TRAP_LEN; i = i + 1) begin
      _exc_trap_bus[i] = trap_bus_i[i];
    end
  end
  assign trap_bus_o = _exc_trap_bus;
endmodule
 

// 仲裁模块
module ysyx_041514_axi_arb (
    input clk,
    input rst,

    // if 访存请求端口（读）
    input [`ysyx_041514_NPC_ADDR_BUS] if_read_addr_i,  // if 阶段的 read
    input if_raddr_valid_i,  // 是否发起读请求
    input [7:0] if_rmask_i,  // 数据掩码
    input [3:0] if_rsize_i,  // 数据大小
    input [7:0] if_rlen_i,
    output [`ysyx_041514_XLEN_BUS] if_rdata_o,  // 读数据返回mem
    output if_rdata_ready_o,  // 读数据是否有效
    // mem 访存请求端口（读）
    input [`ysyx_041514_NPC_ADDR_BUS] mem_read_addr_i,  // mem 阶段的 read
    input mem_raddr_valid_i,
    input [7:0] mem_rmask_i,
    input [3:0] mem_rsize_i,  // 数据大小
    input [7:0] mem_rlen_i,
    output [`ysyx_041514_XLEN_BUS] mem_rdata_o,
    output mem_rdata_ready_o,
    input arb_rlast_i,
    // mem 访存请求端口（写）,独占
    input [`ysyx_041514_NPC_ADDR_BUS] mem_write_addr_i,  // mem 阶段的 write
    input mem_write_valid_i,
    input [7:0] mem_wmask_i,
    input [`ysyx_041514_XLEN_BUS] mem_wdata_i,
    input [3:0] mem_wsize_i,  // 数据大小
    input [7:0] mem_wlen_i,
    output mem_wdata_ready_o,  // 数据是否已经写入


    /* arb<-->axi */
    // 读通道
    output [`ysyx_041514_NPC_ADDR_BUS] arb_read_addr_o,
    output arb_raddr_valid_o,  // 是否发起读请求
    output [7:0] arb_rmask_o,  // 数据掩码
    output [3:0] arb_rsize_o,  // 数据大小
    output [7:0] arb_rlen_o,
    input [`ysyx_041514_XLEN_BUS] arb_rdata_i,  // 读数据返回mem
    input arb_rdata_ready_i,  // 读数据是否有效
    //写通道
    output [`ysyx_041514_NPC_ADDR_BUS] arb_write_addr_o,  // mem 阶段的 write
    output arb_write_valid_o,
    output [7:0] arb_wmask_o,
    output [`ysyx_041514_XLEN_BUS] arb_wdata_o,
    output [3:0] arb_wsize_o,  // 数据大小
    output [7:0] arb_wlen_o,
    input arb_wdata_ready_i  // 数据是否已经写入
);
// 寄存器已复位


  localparam ARB_IDLE = 2'd0;
  localparam IF_READ_STATE = 2'd1;
  localparam MEM_READ_STATE = 2'd2;

  // 读通道
  reg [`ysyx_041514_NPC_ADDR_BUS]  _arb_read_addr_o;
  reg                              _arb_raddr_valid_o;  // 是否发起读请求
  reg [                      7:0 ] _arb_rmask_o;  // 数据掩码
  reg [                      3:0 ] _arb_rsize_o;
  reg [                      7:0 ] _arb_rlen_o;  // 突发大小


  reg [                      1:0 ] arb_state;

  always @(posedge clk) begin
    if (rst) begin
      arb_state <= ARB_IDLE;
      _arb_read_addr_o <= 0;
      _arb_raddr_valid_o <= 0;
      _arb_rmask_o <= 0;
      _arb_rsize_o <= 0;
      _arb_rlen_o <= 0;
    end else begin
      case (arb_state)
        ARB_IDLE: begin
          if (mem_raddr_valid_i) begin
            arb_state <= MEM_READ_STATE;
            _arb_read_addr_o <= mem_read_addr_i;
            _arb_raddr_valid_o <= mem_raddr_valid_i;
            _arb_rmask_o <= mem_rmask_i;
            _arb_rsize_o <= mem_rsize_i;
            _arb_rlen_o <= mem_rlen_i;
          end else if (if_raddr_valid_i) begin
            arb_state <= IF_READ_STATE;
            _arb_read_addr_o <= if_read_addr_i;
            _arb_raddr_valid_o <= if_raddr_valid_i;
            _arb_rmask_o <= if_rmask_i;
            _arb_rsize_o <= if_rsize_i;
            _arb_rlen_o <= if_rlen_i;
          end
          // if (if_raddr_valid_i) begin
          //   arb_state <= IF_READ_STATE;
          //   _arb_read_addr_o <= if_read_addr_i;
          //   _arb_raddr_valid_o <= if_raddr_valid_i;
          //   _arb_rmask_o <= if_rmask_i;
          //   _arb_rsize_o <= if_rsize_i;
          //   _arb_rlen_o <= if_rlen_i;
          // end else if (mem_raddr_valid_i) begin
          //   arb_state <= MEM_READ_STATE;
          //   _arb_read_addr_o <= mem_read_addr_i;
          //   _arb_raddr_valid_o <= mem_raddr_valid_i;
          //   _arb_rmask_o <= mem_rmask_i;
          //   _arb_rsize_o <= mem_rsize_i;
          //   _arb_rlen_o <= mem_rlen_i;
          // end
        end
        MEM_READ_STATE: begin
          if (arb_rlast_i) begin
            arb_state <= ARB_IDLE;
            _arb_raddr_valid_o <= `ysyx_041514_FALSE;
          end

        end
        IF_READ_STATE: begin
          if (arb_rlast_i) begin
            arb_state <= ARB_IDLE;
            _arb_raddr_valid_o <= `ysyx_041514_FALSE;
          end
        end
        default: begin
        end
      endcase
    end
  end


  wire if_read_state = arb_state == IF_READ_STATE;
  wire mem_read_state = arb_state == MEM_READ_STATE;


  // 读响应
  assign if_rdata_o = (if_read_state) ? arb_rdata_i : 0;
  assign if_rdata_ready_o = (if_read_state) ? arb_rdata_ready_i : `ysyx_041514_FALSE;
  assign mem_rdata_o = (mem_read_state) ? arb_rdata_i : 0;
  assign mem_rdata_ready_o = (mem_read_state) ? arb_rdata_ready_i : `ysyx_041514_FALSE;
  // 写响应
  assign mem_wdata_ready_o = arb_wdata_ready_i;


  // 读
  assign arb_read_addr_o = _arb_read_addr_o;
  assign arb_raddr_valid_o = _arb_raddr_valid_o;
  assign arb_rmask_o = _arb_rmask_o;
  assign arb_rsize_o = _arb_rsize_o;
  assign arb_rlen_o = _arb_rlen_o;
  // 写
  assign arb_write_addr_o = mem_write_addr_i;
  assign arb_write_valid_o = mem_write_valid_i;
  assign arb_wdata_o = mem_wdata_i;
  assign arb_wmask_o = mem_wmask_i;
  assign arb_wsize_o = mem_wsize_i;
  assign arb_wlen_o = mem_wlen_i;

endmodule

 


module ysyx_041514_axi_rw #(
    parameter RW_DATA_WIDTH  = 64,
    parameter RW_ADDR_WIDTH  = 32,
    parameter AXI_DATA_WIDTH = 64,
    parameter AXI_ADDR_WIDTH = 32,
    parameter AXI_ID_WIDTH   = 4,
    parameter AXI_STRB_WIDTH = AXI_DATA_WIDTH / 8,
    parameter AXI_USER_WIDTH = 1
) (
    input clock,
    input reset,

    /* arb<-->axi */
    // 读通道
    input [`ysyx_041514_NPC_ADDR_BUS] arb_read_addr_i,
    input arb_raddr_valid_i,  // 是否发起读请求
    input [7:0] arb_rmask_i,  // 数据掩码
    input [3:0] arb_rsize_i,
    input [7:0] arb_rlen_i,  // 突发传输大小
    output [`ysyx_041514_XLEN_BUS] arb_rdata_o,  // 读数据返回mem
    output arb_rdata_ready_o,  // 读数据是否有效
    output arb_rlast_o,
    //写通道
    input [`ysyx_041514_NPC_ADDR_BUS] arb_write_addr_i,  // mem 阶段的 write
    input arb_write_valid_i,
    input [7:0] arb_wmask_i,
    input [3:0] arb_wsize_i,
    input [7:0] arb_wlen_i,  // 突发传输大小
    input [`ysyx_041514_XLEN_BUS] arb_wdata_i,
    output arb_wdata_ready_o,  // 数据是否已经写入

    /* axi master */
    // Advanced eXtensible Interface
    // 写地址
    input                         axi_aw_ready_i,
    output                        axi_aw_valid_o,
    output [  AXI_ADDR_WIDTH-1:0] axi_aw_addr_o,
    output [                 2:0] axi_aw_prot_o,
    output [    AXI_ID_WIDTH-1:0] axi_aw_id_o,
    output [  AXI_USER_WIDTH-1:0] axi_aw_user_o,
    output [                 7:0] axi_aw_len_o,
    output [                 2:0] axi_aw_size_o,
    output [                 1:0] axi_aw_burst_o,
    output                        axi_aw_lock_o,
    output [                 3:0] axi_aw_cache_o,
    output [                 3:0] axi_aw_qos_o,
    output [                 3:0] axi_aw_region_o,
    //写数据
    input                         axi_w_ready_i,
    output                        axi_w_valid_o,
    output [  AXI_DATA_WIDTH-1:0] axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0] axi_w_strb_o,
    output                        axi_w_last_o,
    output [  AXI_USER_WIDTH-1:0] axi_w_user_o,
    //写响应
    output                        axi_b_ready_o,
    input                         axi_b_valid_i,
    input  [                 1:0] axi_b_resp_i,
    input  [    AXI_ID_WIDTH-1:0] axi_b_id_i,
    input  [  AXI_USER_WIDTH-1:0] axi_b_user_i,
    //读地址
    input                         axi_ar_ready_i,
    output                        axi_ar_valid_o,
    output [  AXI_ADDR_WIDTH-1:0] axi_ar_addr_o,
    output [                 2:0] axi_ar_prot_o,
    output [    AXI_ID_WIDTH-1:0] axi_ar_id_o,
    output [  AXI_USER_WIDTH-1:0] axi_ar_user_o,
    output [                 7:0] axi_ar_len_o,
    output [                 2:0] axi_ar_size_o,
    output [                 1:0] axi_ar_burst_o,
    output                        axi_ar_lock_o,
    output [                 3:0] axi_ar_cache_o,
    output [                 3:0] axi_ar_qos_o,
    output [                 3:0] axi_ar_region_o,
    //读数据
    output                        axi_r_ready_o,
    input                         axi_r_valid_i,
    input  [                 1:0] axi_r_resp_i,
    input  [  AXI_DATA_WIDTH-1:0] axi_r_data_i,
    input                         axi_r_last_i,
    input  [    AXI_ID_WIDTH-1:0] axi_r_id_i,
    input  [  AXI_USER_WIDTH-1:0] axi_r_user_i
);
// 寄存器已复位


  //握手信号
  wire axi_ar_handshake = axi_ar_valid_o & axi_ar_ready_i;
  wire axi_aw_handshake = axi_aw_valid_o & axi_aw_ready_i;
  wire axi_r_handshake = axi_r_valid_i & axi_r_ready_o;
  wire axi_w_handshake = axi_w_valid_o & axi_w_ready_i;
  wire axi_b_handshake = axi_b_valid_i & axi_b_ready_o;


  // ------------------State Machine------------------TODO

  /************************ 写通道状态切换 ************************/
  localparam AXI_WSTATE_LEN = 3;
  localparam AXI_WRST = 3'd0;
  localparam AXI_WIDLE = 3'd1;
  localparam AXI_WADDR_WDATA = 3'd2;  // axi4  写地址写数据同时发送
  localparam AXI_WADDR_FINISH_BURST = 3'd3;  // 写地址握手
  localparam AXI_WDATA_VALID_BURST = 3'd4;  // 写数据有效
  localparam AXI_WDATA_HANDSHAKE_BURST = 3'd5;  // 突写数据握手
  localparam AXI_WDATA_FINISH_BURST = 3'd6;  // 突发传输结束


  wire [2:0 ]to_aw_size = ({3{arb_wsize_i[0]}}&`ysyx_041514_AXI_SIZE_BYTES_1)
                             | ({3{arb_wsize_i[1]}}&`ysyx_041514_AXI_SIZE_BYTES_2)
                             | ({3{arb_wsize_i[2]}}&`ysyx_041514_AXI_SIZE_BYTES_4)
                             | ({3{arb_wsize_i[3]}}&`ysyx_041514_AXI_SIZE_BYTES_8);


  reg [AXI_WSTATE_LEN-1:0] axi_wstate;
  reg _arb_wdata_ready_o;

  // 写地址缓存
  reg [`ysyx_041514_NPC_ADDR_BUS] aw_addr;
  reg aw_valid;
  reg [7:0] aw_len;  // 突发长度 Aysyx_041514_XLEN[7:0] + 1,0 表示不突发
  reg [2:0] aw_size;  // 突发大小 = 2^AxSIZE 
  // 写数据缓存
  // reg [`ysyx_041514_XLEN_BUS] w_data;
  reg [7:0] w_strb;
  reg w_valid;
  reg w_last;

  // 写响应缓存
  reg b_ready;


  reg [2:0] burst_count;
  wire [2:0] burst_count_plus1 = burst_count + 1;

  always @(posedge clock) begin
    if (reset) begin
      axi_wstate <= AXI_WRST;
      aw_valid <= `ysyx_041514_FALSE;
      w_valid <= `ysyx_041514_FALSE;
      w_last <= `ysyx_041514_FALSE;
      b_ready <= `ysyx_041514_FALSE;
      w_strb <= 0;
      aw_size <= 0;
      aw_addr <= 0;
      aw_len <= 0;
      burst_count <= 0;
      _arb_wdata_ready_o <= `ysyx_041514_FALSE;
    end else begin
      case (axi_wstate)
        AXI_WRST: begin
          axi_wstate <= AXI_WIDLE;
        end
        AXI_WIDLE: begin
          _arb_wdata_ready_o <= `ysyx_041514_FALSE;
          if (arb_write_valid_i & ~_arb_wdata_ready_o) begin : arb_write
            if (arb_wlen_i == 8'b0) begin  // 不是突发传输，地址和数据一起到
              // 同时写数据和地址
              /* aw 通道 */
              axi_wstate <= AXI_WADDR_WDATA;
              aw_valid <= `ysyx_041514_TRUE;
              aw_addr <= arb_write_addr_i;
              aw_len <= arb_wlen_i;  // 无突发
              aw_size <= to_aw_size;
              /* w 通道 */
              w_valid <= `ysyx_041514_TRUE;
              w_last <= `ysyx_041514_TRUE;  // 只有一个数据
              //对于Narrow Burst，无论是读写请求，数据都出现在[RW]DATA对应访问地址%总线宽度的位置
              // wstrb wdata 与 data bus 的对齐处理在 mem 阶段处理
              w_strb <= arb_wmask_i;
              // w_data <= arb_wdata_i;
              /* b 通道 */
              b_ready <= `ysyx_041514_TRUE;  // 默认为高
            end else begin  // 突发传输，先写地址，再写数据
              /* aw 通道 */
              axi_wstate <= AXI_WADDR_FINISH_BURST;
              aw_valid <= `ysyx_041514_TRUE;
              aw_addr <= arb_write_addr_i;
              aw_len <= arb_wlen_i;  // 突发传输
              aw_size <= to_aw_size;
              /* b 通道 */
              b_ready <= `ysyx_041514_TRUE;  // 默认为高

              burst_count <= 0;
            end
          end else begin
            axi_wstate <= AXI_WIDLE;
            aw_valid <= `ysyx_041514_FALSE;
            w_valid <= `ysyx_041514_FALSE;
            w_last <= `ysyx_041514_FALSE;
          end
        end
        AXI_WADDR_WDATA: begin
          if (axi_aw_handshake) begin
            aw_valid <= `ysyx_041514_FALSE;  // 握手成功后拉低 valid
          end
          if (axi_w_handshake) begin
            w_valid <= `ysyx_041514_FALSE;  // 握手成功后拉低 valid
            w_last  <= `ysyx_041514_FALSE;  // wlast 与 wvalid 一同拉低
          end
          if (axi_b_handshake) begin
            axi_wstate <= AXI_WIDLE;  // 一次写事务结束
            b_ready <= `ysyx_041514_FALSE;  // todo:为低表示一次写事务完毕,测试使用
            _arb_wdata_ready_o <= `ysyx_041514_TRUE;  // 通知 arb 写完成
          end

        end
        AXI_WADDR_FINISH_BURST: begin
          if (axi_aw_handshake) begin
            aw_valid   <= `ysyx_041514_FALSE;  // 握手成功后拉低 valid
            axi_wstate <= AXI_WDATA_VALID_BURST;
          end
        end
        AXI_WDATA_VALID_BURST: begin
          /* w 通道 */
          w_valid <= `ysyx_041514_TRUE;
          w_strb <= arb_wmask_i;  // 第一个数据
          // w_data <= arb_wdata_i;
          _arb_wdata_ready_o <= `ysyx_041514_FALSE;
          if (burst_count == 3'd7) begin  // 最后一个数据，last 有效
            w_last <= `ysyx_041514_TRUE;
          end

          axi_wstate <= AXI_WDATA_HANDSHAKE_BURST;
        end
        AXI_WDATA_HANDSHAKE_BURST: begin
          if (axi_w_handshake) begin
            w_valid <= `ysyx_041514_FALSE;  // 握手成功后拉低 valid
            w_last <= `ysyx_041514_FALSE;
            _arb_wdata_ready_o <= `ysyx_041514_TRUE;  // 通知 arb 写完成
            burst_count <= burst_count_plus1;
            if (w_last) begin
              axi_wstate  <= AXI_WDATA_FINISH_BURST;
              burst_count <= 0;
            end else begin
              axi_wstate <= AXI_WDATA_VALID_BURST;
            end
          end
        end
        AXI_WDATA_FINISH_BURST: begin
          _arb_wdata_ready_o <= `ysyx_041514_FALSE;
          if (axi_b_handshake) begin
            b_ready <= `ysyx_041514_FALSE;
            axi_wstate <= AXI_WIDLE;
          end
        end
        default: begin
          axi_wstate <= AXI_WIDLE;
        end
      endcase
    end
  end

  /************************ 读通道状态切换 ************************/
  localparam AXI_RSTATE_LEN = 3;
  localparam AXI_RRST = 3'd0;
  localparam AXI_RIDLE = 3'd1;
  localparam AXI_RADDR = 3'd2;
  localparam AXI_RDATA = 3'd3;


  wire [2:0 ]to_ar_size = ({3{arb_rsize_i[0]}}&`ysyx_041514_AXI_SIZE_BYTES_1)
                             | ({3{arb_rsize_i[1]}}&`ysyx_041514_AXI_SIZE_BYTES_2)
                             | ({3{arb_rsize_i[2]}}&`ysyx_041514_AXI_SIZE_BYTES_4)
                             | ({3{arb_rsize_i[3]}}&`ysyx_041514_AXI_SIZE_BYTES_8);


  reg [AXI_RSTATE_LEN-1:0] axi_rstate;
  reg _arb_rdata_ready_o;
  reg [`ysyx_041514_XLEN_BUS] _arb_rdata_o;
  reg _arb_rlast_o;

  reg ar_valid;
  reg [AXI_ADDR_WIDTH-1:0] ar_addr;
  reg [2:0] ar_size;  // 突发大小 = 2^AxSIZE 
  reg [7:0] ar_len;  // 突发长度 Aysyx_041514_XLEN[7:0] + 1,0 表示不突发

  reg r_ready;

  always @(posedge clock) begin
    if (reset) begin
      axi_rstate <= AXI_RRST;
      ar_valid <= `ysyx_041514_FALSE;
      ar_addr <= 0;
      ar_len <= 0;
      ar_size <= 0;
      _arb_rlast_o <= 0;
      _arb_rdata_o <= 0;
      r_ready <= `ysyx_041514_FALSE;
      _arb_rdata_ready_o <= `ysyx_041514_FALSE;
    end else begin
      case (axi_rstate)
        AXI_RRST: begin
          axi_rstate <= AXI_RIDLE;
        end
        AXI_RIDLE: begin
          _arb_rdata_ready_o <= `ysyx_041514_FALSE;
          _arb_rlast_o <= 0;
          // arb_raddr_valid_i & ~_arb_rdata_ready_o 为 arb 发出了读请求，且当前周期不为读数据返回周期
          // 当 _arb_rdata_ready_o = `ysyx_041514_TRUE 时，读数据返回，且 下一个读地址在下一个周期才会来到
          // 避免重复度读请求，_arb_rdata_ready_o = `ysyx_041514_TRUE 时，不能发生读请求
          if (arb_raddr_valid_i & ~_arb_rdata_ready_o) begin
            axi_rstate <= AXI_RADDR;
            /* ar 通道 */
            // cache miss 时,或者访问外设时,地址一定时对齐的
            ar_addr <= arb_read_addr_i;
            ar_valid <= `ysyx_041514_TRUE;
            ar_size <= to_ar_size;
            ar_len <= arb_rlen_i;  // 支持突发传输
          end else begin
            axi_rstate <= AXI_RIDLE;
          end
        end
        AXI_RADDR: begin : wait_for_ar_handshake
          if (axi_ar_handshake) begin : wait_for_ar_handshake
            axi_rstate <= AXI_RDATA;
            ar_valid <= `ysyx_041514_FALSE;  // 地址握手成功后拉低
            r_ready <= `ysyx_041514_TRUE;  // 准备接收读数据
          end
        end
        AXI_RDATA: begin  // 支持突发传输
          if (axi_r_handshake) begin : wait_for_r_handshake
            if (axi_r_last_i) begin  // 最后一个数据传输完成
              axi_rstate <= AXI_RIDLE;
              _arb_rlast_o <= `ysyx_041514_TRUE;
              r_ready <= `ysyx_041514_FALSE;  // 数据握手成功后拉低
            end
            _arb_rdata_o <= axi_r_data_i;
            _arb_rdata_ready_o <= `ysyx_041514_TRUE;
          end else begin  // 没有接收到数据
            _arb_rdata_ready_o <= `ysyx_041514_FALSE;
          end
        end
        default: begin
          axi_rstate <= AXI_RIDLE;
        end
      endcase
    end
  end

  /********************类 sram 接口数据返回**************************/

  assign arb_rdata_o = _arb_rdata_o;
  assign arb_rdata_ready_o = _arb_rdata_ready_o;
  assign arb_rlast_o = _arb_rlast_o;
  assign arb_wdata_ready_o = _arb_wdata_ready_o;


  // ------------------Write Transaction------------------

  wire [  AXI_ID_WIDTH-1:0] axi_id = {AXI_ID_WIDTH{1'b0}};
  wire [AXI_USER_WIDTH-1:0] axi_user = {AXI_USER_WIDTH{1'b0}};

  // 写地址通道  ��下没有备注初始化信号的都可能是你需要产生和用到的
  assign axi_aw_valid_o = aw_valid;
  assign axi_aw_addr_o = aw_addr;
  assign axi_aw_prot_o    = `ysyx_041514_AXI_PROT_UNPRIVILEGED_ACCESS | `ysyx_041514_AXI_PROT_SECURE_ACCESS | `ysyx_041514_AXI_PROT_DATA_ACCESS;  //初始化信号即可
  assign axi_aw_id_o = axi_id;  //初始化信号即可
  assign axi_aw_user_o = axi_user;  //初始化信号即可
  assign axi_aw_len_o = aw_len;
  assign axi_aw_size_o = aw_size;
  assign axi_aw_burst_o = `ysyx_041514_AXI_BURST_TYPE_INCR;
  assign axi_aw_lock_o = 1'b0;  //初始化信号即可
  assign axi_aw_cache_o = `ysyx_041514_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE;  //初始化信号即可
  assign axi_aw_qos_o = 4'h0;  //初始化信号即可
  assign axi_aw_region_o = 4'h0;  //初始化信号即可

  // 写数据通道
  assign axi_w_valid_o = w_valid;
  assign axi_w_data_o = arb_wdata_i;  // 直接使用原始数据，不经过寄存器
  assign axi_w_strb_o = w_strb;
  assign axi_w_last_o = w_last;
  assign axi_w_user_o = axi_user;  //初始化信号即可

  // 写应答通道
  assign axi_b_ready_o = b_ready;

  // ------------------Read Transaction------------------



  // Read address channel signals
  assign axi_ar_valid_o = ar_valid;  // leesum
  assign axi_ar_addr_o = ar_addr;  // leesum
  assign axi_ar_prot_o    = `ysyx_041514_AXI_PROT_UNPRIVILEGED_ACCESS | `ysyx_041514_AXI_PROT_SECURE_ACCESS | `ysyx_041514_AXI_PROT_DATA_ACCESS;  //初始化信号即可
  assign axi_ar_id_o = axi_id;  //初始化信号即可                        
  assign axi_ar_user_o = axi_user;  //初始化信号即可
  assign axi_ar_len_o = ar_len;  // leesum
  assign axi_ar_size_o = ar_size;  // leesum
  assign axi_ar_burst_o = `ysyx_041514_AXI_BURST_TYPE_INCR;
  assign axi_ar_lock_o = 1'b0;  //初始化信号即可
  assign axi_ar_cache_o   = `ysyx_041514_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;                                 //初始化信号即可
  assign axi_ar_qos_o = 4'h0;  //初始化信号即可
  assign axi_ar_region_o = 4'h0;

  // Read data channel signals
  assign axi_r_ready_o = r_ready;  //leesum

endmodule
 

// 只用于仿真，为了提高仿真速度
module ysyx_041514_alu_mul_sim (
    input                clk,
    input                rst,
    input                rs1_signed_valid_i,
    input                rs2_signed_valid_i,
    input  [  `ysyx_041514_XLEN_BUS] rs1_data_i,
    input  [  `ysyx_041514_XLEN_BUS] rs2_data_i,
    input                mul_valid_i,
    output               mul_ready_o,
    output [`ysyx_041514_XLEN*2-1:0] mul_out_o

);

  /* 双符号位扩展 */
  wire _rs1_sign = (rs1_signed_valid_i) ? rs1_data_i[`ysyx_041514_XLEN-1] : 1'b0;
  wire _rs2_sign = (rs2_signed_valid_i) ? rs2_data_i[`ysyx_041514_XLEN-1] : 1'b0;
  /* 共65位 */
  wire [`ysyx_041514_XLEN:0] _rs1_65 = {_rs1_sign, rs1_data_i};
  wire [`ysyx_041514_XLEN:0] _rs2_65 = {_rs2_sign, rs2_data_i};

  wire [`ysyx_041514_XLEN*2-1:0] _mul_result = _rs1_65 * _rs2_65;
  assign mul_out_o = _mul_result;

  reg mul_ready;
  always @(posedge clk) begin
    if (rst) begin
      mul_ready <= `ysyx_041514_FALSE;
    end else begin
      if (mul_valid_i) begin
        mul_ready <= `ysyx_041514_TRUE;
      end
      else begin
        mul_ready<=`ysyx_041514_FALSE;
      end
    end
  end
assign mul_ready_o = mul_ready;

endmodule


 

// 只用于仿真，为了提高仿真速度
module ysyx_041514_alu_div_sim (
    input clk,
    input rst,
    input div_signed_valid_i,// 有符号树除法
    input div32_valid_i,     // 32 位除法
    input [`ysyx_041514_XLEN-1:0] dividented_i, // 被除数 rs1
    input [`ysyx_041514_XLEN-1:0] divisor_i,// 除数 rs2
    input div_valid_i,
    output [`ysyx_041514_XLEN-1:0] div_data_o,
    output [`ysyx_041514_XLEN-1:0] rem_data_o,
    output div_ready_o
);


  /* 64 位除法 */
  wire signed [`ysyx_041514_XLEN-1:0] sr1_64_signed = dividented_i;
  wire signed [`ysyx_041514_XLEN-1:0] sr2_64_signed = divisor_i;
  // 有符号
  wire signed [`ysyx_041514_XLEN-1:0] div64_signed = sr1_64_signed / sr2_64_signed;
  wire signed [`ysyx_041514_XLEN-1:0] rem64_signed = sr1_64_signed % sr2_64_signed;
  // 无符号
  wire [`ysyx_041514_XLEN-1:0] div64_unsigned = dividented_i / divisor_i;
  wire [`ysyx_041514_XLEN-1:0] rem64_unsigned = dividented_i % divisor_i;
  // 结果
  wire [`ysyx_041514_XLEN-1:0] div64_result = (div_signed_valid_i) ? div64_signed : div64_unsigned;
  wire [`ysyx_041514_XLEN-1:0] rem64_result = (div_signed_valid_i) ? rem64_signed : rem64_unsigned;

  /* 32 位除法 */
  wire signed [32-1:0] sr1_32_signed = dividented_i[31:0];
  wire signed [32-1:0] sr2_32_signed = divisor_i[31:0];
  //有符号
  wire signed [32-1:0] div32_signed = sr1_32_signed / sr2_32_signed;
  wire signed [32-1:0] rem32_signed = sr1_32_signed % sr2_32_signed;
  //无符号
  wire [32-1:0] div32_unsigned = dividented_i[31:0] / divisor_i[31:0];
  wire [32-1:0] rem32_unsigned = dividented_i[31:0] % divisor_i[31:0];
  //结果
  wire [32-1:0] div32_result = (div_signed_valid_i) ? div32_signed : div32_unsigned;
  wire [32-1:0] rem32_result = (div_signed_valid_i) ? rem32_signed : rem32_unsigned;

  // 最终结果
  assign div_data_o = (div32_valid_i) ? {32'b0, div32_result} : div64_result;
  assign rem_data_o = (div32_valid_i) ? {32'b0, rem32_result} : rem64_result;



  reg div_ready;
  always @(posedge clk) begin
    if (rst) begin
      div_ready <= `ysyx_041514_FALSE;
    end else begin
      if (div_valid_i) begin
        div_ready <= `ysyx_041514_TRUE;
      end
      else begin
        div_ready<=`ysyx_041514_FALSE;
      end
    end
  end
assign div_ready_o = div_ready;

endmodule
 
module ysyx_041514_alu_top (
    input clk,
    input rst,
    /* ALU 端口 */
    input [`ysyx_041514_XLEN-1:0] alu_a_i,
    input [`ysyx_041514_XLEN-1:0] alu_b_i,
    input [`ysyx_041514_ALUOP_LEN-1:0] alu_op_i,
    // ALU 结果缓存
    input alu_data_buff_valid_i,
    input [`ysyx_041514_XLEN_BUS] alu_data_buff_i,
    output alu_data_ready_o,

    output [`ysyx_041514_XLEN-1:0] alu_out_o,
    // stall 
    output alu_stall_req_o,
    //比较指令输出
    output compare_out_o

);

  //加减和逻辑
  wire _aluop_add = (alu_op_i[`ysyx_041514_ALUOP_ADD]);
  wire _aluop_sub = (alu_op_i[`ysyx_041514_ALUOP_SUB]);
  wire _aluop_xor = (alu_op_i[`ysyx_041514_ALUOP_XOR]);
  wire _aluop_or = (alu_op_i[`ysyx_041514_ALUOP_OR]);
  wire _aluop_and = (alu_op_i[`ysyx_041514_ALUOP_AND]);
  //移位
  wire _aluop_sll = (alu_op_i[`ysyx_041514_ALUOP_SLL]);
  wire _aluop_srl = (alu_op_i[`ysyx_041514_ALUOP_SRL]);
  wire _aluop_sra = (alu_op_i[`ysyx_041514_ALUOP_SRA]);
  wire _aluop_sllw = (alu_op_i[`ysyx_041514_ALUOP_SLLW]);
  wire _aluop_srlw = (alu_op_i[`ysyx_041514_ALUOP_SRLW]);
  wire _aluop_sraw = (alu_op_i[`ysyx_041514_ALUOP_SRAW]);
  //比较
  wire _aluop_slt = (alu_op_i[`ysyx_041514_ALUOP_SLT]);
  wire _aluop_sltu = (alu_op_i[`ysyx_041514_ALUOP_SLTU]);

  wire _aluop_beq = (alu_op_i[`ysyx_041514_ALUOP_BEQ]);
  wire _aluop_bne = (alu_op_i[`ysyx_041514_ALUOP_BNE]);
  wire _aluop_blt = (alu_op_i[`ysyx_041514_ALUOP_BLT]);
  wire _aluop_bge = (alu_op_i[`ysyx_041514_ALUOP_BGE]);
  wire _aluop_bltu = (alu_op_i[`ysyx_041514_ALUOP_BLTU]);
  wire _aluop_bgeu = (alu_op_i[`ysyx_041514_ALUOP_BGEU]);

  //乘法
  wire _aluop_mul = (alu_op_i[`ysyx_041514_ALUOP_MUL]);
  wire _aluop_mulh = (alu_op_i[`ysyx_041514_ALUOP_MULH]);
  wire _aluop_mulhsu = (alu_op_i[`ysyx_041514_ALUOP_MULHSU]);
  wire _aluop_mulhu = (alu_op_i[`ysyx_041514_ALUOP_MULHU]);
  wire _aluop_mulw = (alu_op_i[`ysyx_041514_ALUOP_MULW]);

  //除法
  wire _aluop_div = (alu_op_i[`ysyx_041514_ALUOP_DIV]);
  wire _aluop_divu = (alu_op_i[`ysyx_041514_ALUOP_DIVU]);
  wire _aluop_rem = (alu_op_i[`ysyx_041514_ALUOP_REM]);
  wire _aluop_remu = (alu_op_i[`ysyx_041514_ALUOP_REMU]);
  wire _aluop_divw = (alu_op_i[`ysyx_041514_ALUOP_DIVW]);
  wire _aluop_divuw = (alu_op_i[`ysyx_041514_ALUOP_DIVUW]);
  wire _aluop_remw = (alu_op_i[`ysyx_041514_ALUOP_REMW]);
  wire _aluop_remuw = (alu_op_i[`ysyx_041514_ALUOP_REMUW]);


  /*********************************加法-减法-比较器实现*************************************/

  wire _isCMP =   _aluop_slt | _aluop_bgeu |
                  _aluop_sltu |_aluop_beq |
                  _aluop_bne |_aluop_blt  |
                  _aluop_bge|_aluop_bltu  ;


//   // 面积换时序，该方法关键路径较短
//   wire compare_eq = $signed(alu_a_i) == $signed(alu_b_i);
//   wire compare_neq = $signed(alu_a_i) != $signed(alu_b_i);
//   wire compare_lt = $signed(alu_a_i) < $signed(alu_b_i);
//   wire compare_ge = $signed(alu_a_i) >= $signed(alu_b_i);
//   wire compare_ltu = $unsigned(alu_a_i) < $unsigned(alu_b_i);
//   wire compare_geu = $unsigned(alu_a_i) >= $unsigned(alu_b_i);

//   wire compare_out = _aluop_beq&compare_eq
//                    | _aluop_bne&compare_neq
//                    | (_aluop_blt|_aluop_slt)&compare_lt
//                    | _aluop_bge&compare_ge
//                    | (_aluop_bltu|_aluop_sltu)&compare_ltu
//                    | _aluop_bgeu&compare_geu;


  /* 如果是减法、比较操作则进行减法 */
  wire _isSUBop = _aluop_sub | _isCMP;
  /* 进位 */
  wire [`ysyx_041514_XLEN:0] _cin = {{64{1'b0}}, _isSUBop};  //减法的加1
  /* 扩展为双符号位 */
  wire [`ysyx_041514_XLEN:0] _alu_a = {{1{alu_a_i[`ysyx_041514_XLEN-1]}}, alu_a_i};
  wire [`ysyx_041514_XLEN:0] _alu_b = {{1{alu_b_i[`ysyx_041514_XLEN-1]}}, alu_b_i} ^ {65{_isSUBop}};  //异或实现取反
  wire [`ysyx_041514_XLEN:0] _add_out;
  /* 加法器 */
  assign _add_out = _alu_a + _alu_b + _cin;

  /* 标志位生成  具体看https://blog.csdn.net/mariodf/article/details/125334271*/
  //通过真值表得到,最高位进位,用于计算 CF 标志位
  wire _tb_A = _alu_a[`ysyx_041514_XLEN];
  wire _tb_B = _alu_b[`ysyx_041514_XLEN];
  wire _tb_C = _add_out[`ysyx_041514_XLEN];
  wire _tb_NOTA = ~_tb_A;
  wire _tb_NOTB = ~_tb_B;
  wire _tb_NOTC = ~_tb_C;
  // 最高位进位,(测试)
  wire _isC64in = (_tb_A|_tb_B|_tb_C) &
                  (_tb_A|_tb_NOTB|_tb_NOTC)&
                  (_tb_NOTA|_tb_B|_tb_NOTC)&
                  (_tb_NOTA|_tb_NOTB|_tb_C);

  wire _isZero = (_add_out == 65'd0);
  wire _isOF = _add_out[`ysyx_041514_XLEN] ^ _add_out[`ysyx_041514_XLEN-1];
  wire _isSF = _add_out[`ysyx_041514_XLEN-1];  //leesum(bug),最高位为扩展符号位,次高位为原始符号位
  wire _isCF = _isSUBop ^ _isC64in;

  /* 比较信息 具体看 obsidian 笔记 */
  //   wire _isSLT = _isOF ^ _add_out[`ysyx_041514_XLEN-1];
  wire _isSLT = _isSF ^ _isOF;  // a<b (signed)
  wire _isSLTU = _isCF;  //a<b (unsigned)

  wire _isBLT = _isSLT;  // a<b(signed)
  wire _isBLTU = _isSLTU;  // a<b(unsigned)
  wire _isBGE = ~_isSLT;  // a>=b(signed)
  wire _isBGEU = ~_isSLTU;  //a>=b(unsigned)

  wire _isBEQ = _isZero;  //a==b
  wire _isBNE = ~_isZero;  //a!=b

  /* 并行多路选择器,选择比较输出 */
  wire _compare_out = ((_aluop_slt|_aluop_blt)&_isSLT)|
                      ((_aluop_sltu|_aluop_bltu)&_isSLTU)|
                      ((_aluop_beq)&_isBEQ)|
                      ((_aluop_bne)&_isBNE)|
                      ((_aluop_bge)&_isBGE)|
                      ((_aluop_bgeu)&_isBGEU);

  /************************************* 移位器实现 *********************************************/

  wire _shift_sra = _aluop_sra | _aluop_sraw;  //算数右移
  wire _shift_srl = _aluop_srl | _aluop_srlw;  //逻辑右移
  wire _shift_sll = _aluop_sll | _aluop_sllw;  //逻辑左移

  //Shifts the lower 32 bits of x[rs1] left by x[rs2] bit positions. The vacated bits are filled withzeros, and the sign-extended 32-bit result is written to x[rd]. 
  wire _isshift32 = _aluop_sllw | _aluop_sraw | _aluop_srlw;  //是否忽略高32位
  wire [`ysyx_041514_XLEN-1:0] _shift_num = alu_a_i;  //进行移位的操作数
  wire [5:0] _shift_count = alu_b_i[5:0];  //移位次数
  wire [`ysyx_041514_XLEN-1:0] _shift_out;  //移位结果

  ysyx_041514_alu_shift u_alu_shift (
      .shift_sra_i(_shift_sra),
      .shift_srl_i(_shift_srl),
      .shift_sll_i(_shift_sll),
      .shift32_valid_i(_isshift32),
      .shift_num_i(_shift_num),
      .shift_count_i(_shift_count),
      .shift_out_o(_shift_out)
  );

  /***************************************逻辑运算*******************************************/
  wire [`ysyx_041514_XLEN-1:0] _and_res = alu_a_i & alu_b_i;
  wire [`ysyx_041514_XLEN-1:0] _or_res = alu_a_i | alu_b_i;
  wire [`ysyx_041514_XLEN-1:0] _xor_res = alu_a_i ^ alu_b_i;

  /***************************************乘法运算*******************************************/
  wire _mulop_valid = _aluop_mul | _aluop_mulh | _aluop_mulhsu | _aluop_mulhu | _aluop_mulw;
  wire _is_mul_sr1_signed = _aluop_mul | _aluop_mulh | _aluop_mulhsu | _aluop_mulw;
  wire _is_mul_sr2_signed = _aluop_mul | _aluop_mulh | _aluop_mulw;
  wire _mul_ready;
  wire [`ysyx_041514_XLEN*2-1:0] mul_data_direct;

  // 乘法器需要暂停流水线
  wire mul_stall_req = _mulop_valid & (~_mul_ready) & (~alu_data_buff_valid_i);
  wire mul_req_valid = mul_stall_req;  //

  ysyx_041514_alu_mul_top u_alu_mul_top (
      .clk               (clk),
      .rst               (rst),
      .rs1_signed_valid_i(_is_mul_sr1_signed),
      .rs2_signed_valid_i(_is_mul_sr2_signed),
      .rs1_data_i        (alu_a_i),
      .rs2_data_i        (alu_b_i),
      .mul_valid_i       (mul_req_valid),
      .mul_ready_o       (_mul_ready),
      .mul_out_o         (mul_data_direct)
  );

  // 乘法结果选择，缓存中的结果，还是直接的结果
  wire [`ysyx_041514_XLEN*2-1:0] _mul_result = mul_data_direct;

  /* 不同乘法指令的结果 */
  wire [`ysyx_041514_XLEN-1:0] _inst_mul_result = _mul_result[`ysyx_041514_XLEN-1:0];
  wire [`ysyx_041514_XLEN-1:0] _inst_mulh_mulhsu_mulhu_result = _mul_result[`ysyx_041514_XLEN*2-1:`ysyx_041514_XLEN];
  // w 指令的符号扩展统一在 execute 中执行.
  wire [`ysyx_041514_XLEN-1:0] _inst_mulw_result = {32'b0, _mul_result[31:0]};

  /***************************************除法运算*******************************************/
  // 是否是有符号除法
  wire _is_div_signed = _aluop_div | _aluop_divw | _aluop_rem | _aluop_remw;

  // 是否是 32 位除法
  wire _is_div32 = _aluop_divw | _aluop_divuw | _aluop_remw | _aluop_remuw;


  wire divop_valid = _aluop_div|_aluop_divu|
                   _aluop_rem|_aluop_remu|
                   _aluop_divw|_aluop_divuw|
                   _aluop_remw|_aluop_remuw;

  wire _div_ready;

  // 除法器需要暂停流水线
  wire div_stall_req = divop_valid & (~_div_ready) & (~alu_data_buff_valid_i);
  wire div_req_valid = div_stall_req;  //

  /* 暂存结果 */
  wire [`ysyx_041514_XLEN-1:0] _div_result, _rem_result;

  ysyx_041514_alu_div_top u_alu_div_top (
      .clk           (clk),
      .rst           (rst),
      .signed_valid_i(_is_div_signed),
      .div32_valid_i (_is_div32),
      .sr1_data_i    (alu_a_i),
      .sr2_data_i    (alu_b_i),
      .div_valid_i   (div_req_valid),
      .div_ready_o   (_div_ready),
      .div_out_o     (_div_result),
      .rem_out_o     (_rem_result)
  );

  /* 不同除法指令的结果 */
  wire [`ysyx_041514_XLEN-1:0] _inst_div_divu_divw_divuw_ret = _div_result;
  wire [`ysyx_041514_XLEN-1:0] _inst_rem_remu_remw_remuw_ret = _rem_result;

  /****************************选择最终ALU结果***********************************************/

  wire [`ysyx_041514_XLEN-1:0] _alu_out = ({`ysyx_041514_XLEN{_aluop_add|_aluop_sub}}&_add_out[`ysyx_041514_XLEN-1:0])|
                                ({`ysyx_041514_XLEN{_aluop_and}}&_and_res)|
                                ({`ysyx_041514_XLEN{_aluop_or}}&_or_res)|
                                ({`ysyx_041514_XLEN{_aluop_xor}}&_xor_res)|
                                ({`ysyx_041514_XLEN{_shift_sra|_shift_srl|_shift_sll}}&_shift_out)|
                                ({`ysyx_041514_XLEN{_aluop_mul}}&_inst_mul_result) |
                                ({`ysyx_041514_XLEN{_aluop_mulh|_aluop_mulhsu|_aluop_mulhu}}&_inst_mulh_mulhsu_mulhu_result) |
                                ({`ysyx_041514_XLEN{_aluop_mulw}}&_inst_mulw_result)|
                                ({`ysyx_041514_XLEN{_aluop_div|_aluop_divu|_aluop_divw|_aluop_divuw}}&_inst_div_divu_divw_divuw_ret)|
                                ({`ysyx_041514_XLEN{_aluop_rem|_aluop_remu|_aluop_remw|_aluop_remuw}}&_inst_rem_remu_remw_remuw_ret);

  /* 选择最后输出 */
  assign alu_out_o = (_isCMP) ? {63'b0, _compare_out} : 
                     alu_data_buff_valid_i ? alu_data_buff_i // 优先选择缓存数据
                     :_alu_out;

  assign alu_data_ready_o = _mul_ready | _div_ready;
  assign alu_stall_req_o = mul_stall_req | div_stall_req;
  assign compare_out_o = _compare_out;

endmodule

 
// 1. booth移位乘法改进，一次性生成所有部分积，并且缓存在寄存器中，关键路径较短，但需要的面积大
// 2. 接下来每一个周期加上一个部分积
module ysyx_041514_alu_mul_slow (
    input                            clk,
    input                            rst,
    input                            rs1_signed_valid_i,
    input                            rs2_signed_valid_i,
    input  [  `ysyx_041514_XLEN_BUS] rs1_data_i,
    input  [  `ysyx_041514_XLEN_BUS] rs2_data_i,
    input                            mul_valid_i,
    output                           mul_ready_o,
    output [`ysyx_041514_XLEN*2-1:0] mul_out_o
);

  localparam STATE_LEN = 3;
  localparam MUL_RST = 3'd0;
  localparam MUL_IDLE = 3'd1;
  localparam MUL_BOOTH = 3'd2;
  localparam MUL_WAIT = 3'd3;


  reg [STATE_LEN-1:0] mul_state;
  reg [32:0] mul_count;  // 移位计数器
  reg mul_ready;
  reg [127:0] mul_data128;
  reg [`ysyx_041514_XLEN_BUS] booth_rs1;
  reg [`ysyx_041514_XLEN_BUS] booth_rs2;
  reg booth_rs1_signed_valid;
  reg booth_rs2_signed_valid;


  wire [127:0] Partial_product[33-1:0];
  ysyx_041514_alu_mul_booth_r4 u_alu_mul_booth_r4 (
      .rs1_signed_valid_i(booth_rs1_signed_valid),
      .rs2_signed_valid_i(booth_rs2_signed_valid),
      .rs1_data_i        (booth_rs1),
      .rs2_data_i        (booth_rs2),
      .pp0_o             (Partial_product[0]),
      .pp1_o             (Partial_product[1]),
      .pp2_o             (Partial_product[2]),
      .pp3_o             (Partial_product[3]),
      .pp4_o             (Partial_product[4]),
      .pp5_o             (Partial_product[5]),
      .pp6_o             (Partial_product[6]),
      .pp7_o             (Partial_product[7]),
      .pp8_o             (Partial_product[8]),
      .pp9_o             (Partial_product[9]),
      .pp10_o            (Partial_product[10]),
      .pp11_o            (Partial_product[11]),
      .pp12_o            (Partial_product[12]),
      .pp13_o            (Partial_product[13]),
      .pp14_o            (Partial_product[14]),
      .pp15_o            (Partial_product[15]),
      .pp16_o            (Partial_product[16]),
      .pp17_o            (Partial_product[17]),
      .pp18_o            (Partial_product[18]),
      .pp19_o            (Partial_product[19]),
      .pp20_o            (Partial_product[20]),
      .pp21_o            (Partial_product[21]),
      .pp22_o            (Partial_product[22]),
      .pp23_o            (Partial_product[23]),
      .pp24_o            (Partial_product[24]),
      .pp25_o            (Partial_product[25]),
      .pp26_o            (Partial_product[26]),
      .pp27_o            (Partial_product[27]),
      .pp28_o            (Partial_product[28]),
      .pp29_o            (Partial_product[29]),
      .pp30_o            (Partial_product[30]),
      .pp31_o            (Partial_product[31]),
      .pp32_o            (Partial_product[32])
  );

  //  部分积生成 ( 共33 个),缓存一个周期
  wire [127:0] step1_pp_q[33-1:0];

  genvar step1_Dflap;
  generate
    for (step1_Dflap = 0; step1_Dflap < 33; step1_Dflap = step1_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate (
          .clk (clk),
          .rst (rst),
          .din (Partial_product[step1_Dflap]),
          .dout(step1_pp_q[step1_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate



  always @(posedge clk) begin
    if (rst) begin
      mul_state <= MUL_RST;
      mul_count <= 'b0;
      mul_ready <= `ysyx_041514_FALSE;
      mul_data128 <= 'b0;
      booth_rs1 <= 'b0;
      booth_rs2 <= 'b0;
      booth_rs1_signed_valid <= 'b0;
      booth_rs2_signed_valid <= 'b0;
    end else begin
      case (mul_state)
        MUL_RST: begin
          mul_state <= MUL_IDLE;
        end
        MUL_IDLE: begin
          mul_count <= 'b0;
          mul_ready <= `ysyx_041514_FALSE;
          if (mul_valid_i) begin
            booth_rs1 <= rs1_data_i;
            booth_rs2 <= rs2_data_i;
            booth_rs1_signed_valid <= rs1_signed_valid_i;
            booth_rs2_signed_valid <= rs2_signed_valid_i;
            mul_state <= MUL_BOOTH;
            mul_data128 <= 'b0;
          end
        end
        MUL_BOOTH: begin
          if (mul_valid_i) begin
            mul_state <= MUL_WAIT;
          end else begin
            mul_state <= MUL_IDLE;
          end
        end
        MUL_WAIT: begin
          if (mul_count == 'd33) begin
            mul_state <= MUL_IDLE;
            mul_ready <= `ysyx_041514_TRUE;
          end else if (mul_valid_i) begin
            mul_data128 <= mul_data128 + step1_pp_q[mul_count[5:0]]; // TODO 很疑惑能不能这样用
            mul_count <= mul_count + 'b1;
          end else begin
            mul_state <= MUL_IDLE;
          end
        end
        default: begin
        end
      endcase
    end
  end

  assign mul_ready_o = mul_ready;
  assign mul_out_o   = mul_data128;


endmodule
 
// 1. booth 华莱士乘法树，采用 全加器（csa）实现
module ysyx_041514_alu_mul_wallace_csa (
    input                            clk,
    input                            rst,
    input                            rs1_signed_valid_i,
    input                            rs2_signed_valid_i,
    input  [  `ysyx_041514_XLEN_BUS] rs1_data_i,
    input  [  `ysyx_041514_XLEN_BUS] rs2_data_i,
    input                            mul_valid_i,
    output                           mul_ready_o,
    output [`ysyx_041514_XLEN*2-1:0] mul_out_o
);
  // 寄存器已经复位
  localparam STATE_LEN = 3;
  localparam MUL_RST = 3'd0;
  localparam MUL_IDLE = 3'd1;
  localparam MUL_WAIT = 3'd3;



  wire _mul_valid = mul_valid_i;
  reg [STATE_LEN-1:0] mul_state;

  reg [3:0] mul_count;
  wire [3:0] mul_count_plus1 = mul_count + 'd1;

  reg mul_ready;
  reg [127:0] mul_data128;

  reg [`ysyx_041514_XLEN_BUS] booth_rs1;
  reg [`ysyx_041514_XLEN_BUS] booth_rs2;
  reg booth_rs1_signed_valid;
  reg booth_rs2_signed_valid;


  wire [127:0] mul_final128;
  assign mul_ready_o = mul_ready;

  assign mul_out_o   = mul_data128;


  /* 乘法状态机切换 */
  always @(posedge clk) begin
    if (rst) begin
      mul_state <= MUL_RST;
      mul_ready <= `ysyx_041514_FALSE;
      mul_data128 <= 'b0;
      mul_count <= 'b0;
      booth_rs1 <= 'b0;
      booth_rs2 <= 'b0;
      booth_rs1_signed_valid <= 'b0;
      booth_rs2_signed_valid <= 'b0;
    end else begin
      case (mul_state)
        MUL_RST: begin
          mul_state <= MUL_IDLE;
        end
        MUL_IDLE: begin
          mul_ready <= `ysyx_041514_FALSE;
          mul_count <= 'b0;
          if (_mul_valid) begin  // 乘法请求
            mul_state <= MUL_WAIT;
            booth_rs1 <= rs1_data_i;
            booth_rs2 <= rs2_data_i;
            booth_rs1_signed_valid <= rs1_signed_valid_i;
            booth_rs2_signed_valid <= rs2_signed_valid_i;
          end
        end
        MUL_WAIT: begin
          if (~_mul_valid) begin
            mul_state <= MUL_IDLE;
          end else begin
            mul_count <= mul_count_plus1;
            if (mul_count == 'd3) begin
              mul_data128 <= mul_final128;
              mul_state   <= MUL_IDLE;
              mul_ready   <= `ysyx_041514_TRUE;
            end
          end
        end
        default: begin
        end
      endcase
    end
  end







  wire [127:0] Partial_product[33-1:0];
  ysyx_041514_alu_mul_booth_r4 u_alu_mul_booth_r4 (
      .rs1_signed_valid_i(booth_rs1_signed_valid),
      .rs2_signed_valid_i(booth_rs2_signed_valid),
      .rs1_data_i        (booth_rs1),
      .rs2_data_i        (booth_rs2),
      .pp0_o             (Partial_product[0]),
      .pp1_o             (Partial_product[1]),
      .pp2_o             (Partial_product[2]),
      .pp3_o             (Partial_product[3]),
      .pp4_o             (Partial_product[4]),
      .pp5_o             (Partial_product[5]),
      .pp6_o             (Partial_product[6]),
      .pp7_o             (Partial_product[7]),
      .pp8_o             (Partial_product[8]),
      .pp9_o             (Partial_product[9]),
      .pp10_o            (Partial_product[10]),
      .pp11_o            (Partial_product[11]),
      .pp12_o            (Partial_product[12]),
      .pp13_o            (Partial_product[13]),
      .pp14_o            (Partial_product[14]),
      .pp15_o            (Partial_product[15]),
      .pp16_o            (Partial_product[16]),
      .pp17_o            (Partial_product[17]),
      .pp18_o            (Partial_product[18]),
      .pp19_o            (Partial_product[19]),
      .pp20_o            (Partial_product[20]),
      .pp21_o            (Partial_product[21]),
      .pp22_o            (Partial_product[22]),
      .pp23_o            (Partial_product[23]),
      .pp24_o            (Partial_product[24]),
      .pp25_o            (Partial_product[25]),
      .pp26_o            (Partial_product[26]),
      .pp27_o            (Partial_product[27]),
      .pp28_o            (Partial_product[28]),
      .pp29_o            (Partial_product[29]),
      .pp30_o            (Partial_product[30]),
      .pp31_o            (Partial_product[31]),
      .pp32_o            (Partial_product[32])
  );

  //  部分积生成 ( 共33 个),缓存一个周期
  wire [127:0] step1_pp_q[33-1:0];

  genvar step1_Dflap;
  generate
    for (step1_Dflap = 0; step1_Dflap < 33; step1_Dflap = step1_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate (
          .clk (clk),
          .rst (rst),
          .din (Partial_product[step1_Dflap]),
          .dout(step1_pp_q[step1_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate

  // wire [127:0] step1_pp[33-1:0];
  // assign step1_pp = step1_pp_q;

  /*******                    booth                ********/
  /* 流水线缓存1 */
  /*******                wallace tree            ********/
  /*******(33)             11*csa(3-2) --0        ********/
  /*******(22)             7*csa(3-2)  --1        ********/
  /*******(15)             5*csa(3-2)  --0        ********/
  /*******(10)             3*csa(3-2)  --1        ********/
  /* 流水线缓存2 */
  /*******(7)              2*csa(3-2)  --1        ********/
  /*******(5)              1*csa(3-2)  --2        ********/
  /*******(4)              1*csa(3-2)  --1        ********/
  /*******(3)              1*csa(3-2)  --0        ********/
  /* 流水线缓存3 */
  /*******(2)              add(2-1)               ********/
  /* 流水线缓存4 */
  /*******(1)              mul_final              ********/


  /* step1  */
  localparam STEP1_CSA_NUM = 11;
  genvar step1_num_count;
  genvar step1_bit_count;
  wire [128-1:0] step1_sum  [STEP1_CSA_NUM-1:0];
  wire [128-1:0] step1_carry[STEP1_CSA_NUM-1:0];

  generate
    for (
        step1_num_count = 0; step1_num_count < STEP1_CSA_NUM; step1_num_count = step1_num_count + 1
    ) begin
      for (step1_bit_count = 0; step1_bit_count < 128; step1_bit_count = step1_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step1 (
            .a (step1_pp_q[step1_num_count*3+0][step1_bit_count]),
            .b (step1_pp_q[step1_num_count*3+1][step1_bit_count]),
            .ci(step1_pp_q[step1_num_count*3+2][step1_bit_count]),
            .s (step1_sum[step1_num_count][step1_bit_count]),
            .co(step1_carry[step1_num_count][step1_bit_count])
        );
      end
    end
  endgenerate


  /* step2  */
  wire [128-1:0] step2_pp_q[22-1:0];
  genvar step2_pp_q_count;
  generate
    for (
        step2_pp_q_count = 0;
        step2_pp_q_count < STEP1_CSA_NUM;
        step2_pp_q_count = step2_pp_q_count + 1
    ) begin
      assign step2_pp_q[step2_pp_q_count*2+0] = step1_sum[step2_pp_q_count];
      assign step2_pp_q[step2_pp_q_count*2+1] = {step1_carry[step2_pp_q_count][126:0], 1'b0};
    end
  endgenerate



  localparam STEP2_CSA_NUM = 7;
  genvar step2_num_count;
  genvar step2_bit_count;
  wire [128-1:0] step2_sum  [STEP2_CSA_NUM-1:0];
  wire [128-1:0] step2_carry[STEP2_CSA_NUM-1:0];
  generate
    for (
        step2_num_count = 0; step2_num_count < STEP2_CSA_NUM; step2_num_count = step2_num_count + 1
    ) begin
      for (step2_bit_count = 0; step2_bit_count < 128; step2_bit_count = step2_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step2 (
            .a (step2_pp_q[step2_num_count*3+0][step2_bit_count]),
            .b (step2_pp_q[step2_num_count*3+1][step2_bit_count]),
            .ci(step2_pp_q[step2_num_count*3+2][step2_bit_count]),
            .s (step2_sum[step2_num_count][step2_bit_count]),
            .co(step2_carry[step2_num_count][step2_bit_count])
        );
      end
    end
  endgenerate



  /* step3  */
  wire [128-1:0] step3_pp_q[15-1:0];
  assign step3_pp_q[14] = step2_pp_q[21];  // 单独处理
  genvar step3_pp_q_count;
  generate
    for (
        step3_pp_q_count = 0;
        step3_pp_q_count < STEP2_CSA_NUM;
        step3_pp_q_count = step3_pp_q_count + 1
    ) begin
      assign step3_pp_q[step3_pp_q_count*2+0] = step2_sum[step3_pp_q_count];
      assign step3_pp_q[step3_pp_q_count*2+1] = {step2_carry[step3_pp_q_count][126:0], 1'b0};
    end
  endgenerate



  localparam STEP3_CSA_NUM = 5;
  genvar step3_num_count;
  genvar step3_bit_count;
  wire [128-1:0] step3_sum  [STEP3_CSA_NUM-1:0];
  wire [128-1:0] step3_carry[STEP3_CSA_NUM-1:0];
  generate
    for (
        step3_num_count = 0; step3_num_count < STEP3_CSA_NUM; step3_num_count = step3_num_count + 1
    ) begin
      for (step3_bit_count = 0; step3_bit_count < 128; step3_bit_count = step3_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step3 (
            .a (step3_pp_q[step3_num_count*3+0][step3_bit_count]),
            .b (step3_pp_q[step3_num_count*3+1][step3_bit_count]),
            .ci(step3_pp_q[step3_num_count*3+2][step3_bit_count]),
            .s (step3_sum[step3_num_count][step3_bit_count]),
            .co(step3_carry[step3_num_count][step3_bit_count])
        );
      end
    end
  endgenerate


  /* step4  */
  wire [128-1:0] step4_pp_q[10-1:0];
  // assign step4_pp_q[14] = step2_pp_q[21];  // 单独处理
  genvar step4_pp_q_count;
  generate
    for (
        step4_pp_q_count = 0;
        step4_pp_q_count < STEP3_CSA_NUM;
        step4_pp_q_count = step4_pp_q_count + 1
    ) begin
      assign step4_pp_q[step4_pp_q_count*2+0] = step3_sum[step4_pp_q_count];
      assign step4_pp_q[step4_pp_q_count*2+1] = {step3_carry[step4_pp_q_count][126:0], 1'b0};
    end
  endgenerate



  localparam STEP4_CSA_NUM = 3;
  genvar step4_num_count;
  genvar step4_bit_count;
  wire [128-1:0] step4_sum  [STEP4_CSA_NUM-1:0];
  wire [128-1:0] step4_carry[STEP4_CSA_NUM-1:0];
  generate
    for (
        step4_num_count = 0; step4_num_count < STEP4_CSA_NUM; step4_num_count = step4_num_count + 1
    ) begin
      for (step4_bit_count = 0; step4_bit_count < 128; step4_bit_count = step4_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step4 (
            .a (step4_pp_q[step4_num_count*3+0][step4_bit_count]),
            .b (step4_pp_q[step4_num_count*3+1][step4_bit_count]),
            .ci(step4_pp_q[step4_num_count*3+2][step4_bit_count]),
            .s (step4_sum[step4_num_count][step4_bit_count]),
            .co(step4_carry[step4_num_count][step4_bit_count])
        );
      end
    end
  endgenerate


  /* step5  */
  wire [128-1:0] step5_pp_q[7-1:0];
  // 单独处理
  // assign step5_pp_q[6] = step4_pp_q[9];  
  ysyx_041514_regTemplate #(
      .WIDTH    (128),
      .RESET_VAL('b0)
  ) u_ysyx_041514_regTemplate_step4_sum_alone (
      .clk (clk),
      .rst (rst),
      .din (step4_pp_q[9]),
      .dout(step5_pp_q[6]),
      .wen (1'b1)
  );

  genvar step5_pp_q_count;
  generate
    for (
        step5_pp_q_count = 0;
        step5_pp_q_count < STEP4_CSA_NUM;
        step5_pp_q_count = step5_pp_q_count + 1
    ) begin
      // assign step5_pp_q[step5_pp_q_count*2+0] = step4_sum[step5_pp_q_count];
      // assign step5_pp_q[step5_pp_q_count*2+1] = {step4_carry[step5_pp_q_count][126:0], 1'b0};
      //插入流水线缓存，切断关键路径
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL('b0)
      ) u_ysyx_041514_regTemplate_step4_sum (
          .clk (clk),
          .rst (rst),
          .din (step4_sum[step5_pp_q_count]),
          .dout(step5_pp_q[step5_pp_q_count*2+0]),
          .wen (1'b1)
      );
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL('b0)
      ) u_ysyx_041514_regTemplate_step4_carry (
          .clk (clk),
          .rst (rst),
          .din ({step4_carry[step5_pp_q_count][126:0], 1'b0}),
          .dout(step5_pp_q[step5_pp_q_count*2+1]),
          .wen (1'b1)
      );
    end
  endgenerate


  localparam STEP5_CSA_NUM = 2;
  genvar step5_num_count;
  genvar step5_bit_count;
  wire [128-1:0] step5_sum  [STEP5_CSA_NUM-1:0];
  wire [128-1:0] step5_carry[STEP5_CSA_NUM-1:0];
  generate
    for (
        step5_num_count = 0; step5_num_count < STEP5_CSA_NUM; step5_num_count = step5_num_count + 1
    ) begin
      for (step5_bit_count = 0; step5_bit_count < 128; step5_bit_count = step5_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step5 (
            .a (step5_pp_q[step5_num_count*3+0][step5_bit_count]),
            .b (step5_pp_q[step5_num_count*3+1][step5_bit_count]),
            .ci(step5_pp_q[step5_num_count*3+2][step5_bit_count]),
            .s (step5_sum[step5_num_count][step5_bit_count]),
            .co(step5_carry[step5_num_count][step5_bit_count])
        );
      end
    end
  endgenerate



  /* step6  */
  wire [128-1:0] step6_pp_q[5-1:0];
  assign step6_pp_q[4] = step5_pp_q[6];  // 单独处理
  genvar step6_pp_q_count;
  generate
    for (
        step6_pp_q_count = 0;
        step6_pp_q_count < STEP5_CSA_NUM;
        step6_pp_q_count = step6_pp_q_count + 1
    ) begin
      assign step6_pp_q[step6_pp_q_count*2+0] = step5_sum[step6_pp_q_count];
      assign step6_pp_q[step6_pp_q_count*2+1] = {step5_carry[step6_pp_q_count][126:0], 1'b0};
    end
  endgenerate


  localparam STEP6_CSA_NUM = 1;
  genvar step6_num_count;
  genvar step6_bit_count;
  wire [128-1:0] step6_sum  [STEP6_CSA_NUM-1:0];
  wire [128-1:0] step6_carry[STEP6_CSA_NUM-1:0];
  generate
    for (
        step6_num_count = 0; step6_num_count < STEP6_CSA_NUM; step6_num_count = step6_num_count + 1
    ) begin
      for (step6_bit_count = 0; step6_bit_count < 128; step6_bit_count = step6_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step6 (
            .a (step6_pp_q[step6_num_count*3+0][step6_bit_count]),
            .b (step6_pp_q[step6_num_count*3+1][step6_bit_count]),
            .ci(step6_pp_q[step6_num_count*3+2][step6_bit_count]),
            .s (step6_sum[step6_num_count][step6_bit_count]),
            .co(step6_carry[step6_num_count][step6_bit_count])
        );
      end
    end
  endgenerate



  /* step7  */
  wire [128-1:0] step7_pp_q[4-1:0];
  assign step7_pp_q[2] = step6_pp_q[3];  // 单独处理
  assign step7_pp_q[3] = step6_pp_q[4];  // 单独处理
  genvar step7_pp_q_count;
  generate
    for (
        step7_pp_q_count = 0;
        step7_pp_q_count < STEP6_CSA_NUM;
        step7_pp_q_count = step7_pp_q_count + 1
    ) begin
      assign step7_pp_q[step7_pp_q_count*2+0] = step6_sum[step7_pp_q_count];
      assign step7_pp_q[step7_pp_q_count*2+1] = {step6_carry[step7_pp_q_count][126:0], 1'b0};
    end
  endgenerate


  localparam STEP7_CSA_NUM = 1;
  genvar step7_num_count;
  genvar step7_bit_count;
  wire [128-1:0] step7_sum  [STEP7_CSA_NUM-1:0];
  wire [128-1:0] step7_carry[STEP7_CSA_NUM-1:0];
  generate
    for (
        step7_num_count = 0; step7_num_count < STEP7_CSA_NUM; step7_num_count = step7_num_count + 1
    ) begin
      for (step7_bit_count = 0; step7_bit_count < 128; step7_bit_count = step7_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step7 (
            .a (step7_pp_q[step7_num_count*3+0][step7_bit_count]),
            .b (step7_pp_q[step7_num_count*3+1][step7_bit_count]),
            .ci(step7_pp_q[step7_num_count*3+2][step7_bit_count]),
            .s (step7_sum[step7_num_count][step7_bit_count]),
            .co(step7_carry[step7_num_count][step7_bit_count])
        );
      end
    end
  endgenerate



  /* step8  */
  wire [128-1:0] step8_pp_q[3-1:0];
  assign step8_pp_q[2] = step7_pp_q[3];  // 单独处理
  genvar step8_pp_q_count;
  generate
    for (
        step8_pp_q_count = 0;
        step8_pp_q_count < STEP7_CSA_NUM;
        step8_pp_q_count = step8_pp_q_count + 1
    ) begin
      assign step8_pp_q[step8_pp_q_count*2+0] = step7_sum[step8_pp_q_count];
      assign step8_pp_q[step8_pp_q_count*2+1] = {step7_carry[step8_pp_q_count][126:0], 1'b0};
    end
  endgenerate


  localparam STEP8_CSA_NUM = 1;
  genvar step8_num_count;
  genvar step8_bit_count;
  wire [128-1:0] step8_sum  [STEP8_CSA_NUM-1:0];
  wire [128-1:0] step8_carry[STEP8_CSA_NUM-1:0];
  generate
    for (
        step8_num_count = 0; step8_num_count < STEP8_CSA_NUM; step8_num_count = step8_num_count + 1
    ) begin
      for (step8_bit_count = 0; step8_bit_count < 128; step8_bit_count = step8_bit_count + 1) begin
        ysyx_041514_full_adder u_ysyx_041514_full_adder_step8 (
            .a (step8_pp_q[step8_num_count*3+0][step8_bit_count]),
            .b (step8_pp_q[step8_num_count*3+1][step8_bit_count]),
            .ci(step8_pp_q[step8_num_count*3+2][step8_bit_count]),
            .s (step8_sum[step8_num_count][step8_bit_count]),
            .co(step8_carry[step8_num_count][step8_bit_count])
        );
      end
    end
  endgenerate

  // // 插入流水线缓存
  wire [128-1:0] mul_final_a;
  wire [128-1:0] mul_final_b;
  ysyx_041514_regTemplate #(
      .WIDTH    (128),
      .RESET_VAL('b0)
  ) u_ysyx_041514_regTemplate_step8_sum (
      .clk (clk),
      .rst (rst),
      .din (step8_sum[0]),
      .dout(mul_final_a),
      .wen (1'b1)
  );
  ysyx_041514_regTemplate #(
      .WIDTH    (128),
      .RESET_VAL('b0)
  ) u_ysyx_041514_regTemplate_step8_carry (
      .clk (clk),
      .rst (rst),
      .din ({step8_carry[0][126:0], 1'b0}),
      .dout(mul_final_b),
      .wen (1'b1)
  );

  /* step9 */
  // assign mul_final128 = step8_sum[0] + {step8_carry[0][126:0], 1'b0};
  assign mul_final128 = mul_final_a + mul_final_b;


endmodule

module ysyx_041514_alu_mul_compressor52 (
    input  x0,
    input  x1,
    input  x2,
    input  x3,
    input  x4,
    input  cin0,
    input  cin1,
    output cout0,
    output cout1,
    output sum,
    output carry
);
  wire _x0_x1_xor = x0 ^ x1;
  wire _x3_x4_xor = x3 ^ x4;
  wire _x0_x1_x2_x3_x4_cin0_xor = _x0_x1_xor ^ x2 ^ _x3_x4_xor ^ cin0;


  assign cout0 = ((x0 + x1) & x2) | (x0 & x1);
  assign cout1 = (_x3_x4_xor & cin0) | (~_x3_x4_xor & x3);


  wire wtemp = (x0 ^ x1 ^ x2) ^ (x3 ^ x4 ^ cin0);
  assign carry = (wtemp & cin1) | ((~wtemp) & (x0 ^ x1 ^ x2));

  assign sum   = _x0_x1_x2_x3_x4_cin0_xor ^ cin1;

endmodule


module ysyx_041514_full_adder (
    input  wire a,
    input  wire b,
    input  wire ci,
    output wire s,
    output wire co
);

  assign s  = a ^ b ^ ci;
  assign co = (a & b) | (a & ci) | (b & ci);
endmodule
 
// 1. 移位器实现，能够实现 逻辑左移、逻辑右移、算数右移
// 2. 采用掩码算法，将右移转换为左移，节省资源
module ysyx_041514_alu_shift (
    input shift_sra_i,
    input shift_srl_i,
    input shift_sll_i,
    input shift32_valid_i,
    input [`ysyx_041514_XLEN-1:0] shift_num_i,
    input [5:0] shift_count_i,
    output [`ysyx_041514_XLEN-1:0] shift_out_o
);
  wire _op_shift = shift_sra_i | shift_srl_i | shift_sll_i;
  /* 选择是否忽略高32位 */
  wire [`ysyx_041514_XLEN-1:0] _shift_num = (shift32_valid_i) ? {32'b0, shift_num_i[31:0]} : shift_num_i;
  wire [`ysyx_041514_XLEN-1:0] _shift_num_inv;
  /* 位颠倒 */
  ysyx_041514_Vectorinvert #(
      .DATA_LEN(`ysyx_041514_XLEN)
  ) u_ysyx_041514_Vectorinvert1 (
      .in (_shift_num),
      .out(_shift_num_inv)
  );
  //将右移转换为左移
  wire [`ysyx_041514_XLEN-1:0] _shifter_in1 = {`ysyx_041514_XLEN{_op_shift}} & ((shift_sra_i | shift_srl_i) ? _shift_num_inv : _shift_num);//操作数
  wire [5:0] _shifter_in2 = (shift32_valid_i) ? {1'b0, shift_count_i[4:0]} : shift_count_i;  //TODO:BUG(很坑)移位次数
  /* 实际移位操作,用一个移位器实现左移和右移 */
  wire [`ysyx_041514_XLEN-1:0] _shifter_res = _shifter_in1 << _shifter_in2;

  wire [`ysyx_041514_XLEN-1:0] _sll_res = _shifter_res;  //逻辑左移结果
  /*逻辑右移结果,srl_in->位颠倒->移位器(左移)->位颠倒->srl_out*/
  wire [`ysyx_041514_XLEN-1:0] _srl_res;
  ysyx_041514_Vectorinvert #(
      .DATA_LEN(`ysyx_041514_XLEN)
  ) u_ysyx_041514_Vectorinvert2 (
      .in (_sll_res),
      .out(_srl_res)
  );
  /* 选择掩码,64位移位和32位移位掩码不同 */
  wire [5:0] _eff_mask_shift_count = (shift32_valid_i) ? (_shifter_in2 + 6'd32) : _shifter_in2;
  /* 选择符号位,32位移位需要忽略输入num的高32位 */
  wire _lastbit = (shift32_valid_i) ? _shift_num[31] : _shift_num[`ysyx_041514_XLEN-1];

  /* 算数右移结果，采用掩码算法实现算数右移 */
  wire [`ysyx_041514_XLEN-1:0] _eff_mask = (~(`ysyx_041514_XLEN'b0)) >> _eff_mask_shift_count;
  wire [`ysyx_041514_XLEN-1:0] _sra_res = (_srl_res & _eff_mask) | ({`ysyx_041514_XLEN{_lastbit}} & (~_eff_mask));

  /* 多路选择器选择最终结果 */
  wire [`ysyx_041514_XLEN-1:0] _shift_out = ({`ysyx_041514_XLEN{shift_srl_i}}&_srl_res) |
                                ({`ysyx_041514_XLEN{shift_sra_i}}&_sra_res) |
                                ({`ysyx_041514_XLEN{shift_sll_i}}&_sll_res);
  assign shift_out_o = _shift_out;
endmodule
 

/* 
  除法器主要参考书目：COMPUTER ARITHMETIC Algorithms and Hardware Designs
  https://archive.org/details/introductiontoar0000wase/page/188/mode/1up
  章节：13.4 NONRESTORING AND SIGNED DIVISION
  The following notation is used in our discussion of division algorithms:
  z   Dividend    z2k−1 z2k−2 · · · z1 z0
  d   Divisor     dk−1dk−2 · · · d1 d0
  q   Quotient    qk−1qk−2 · · · q1 q0
  s   Remainder   sk−1 sk−2 · · · s1 s0

  主要特点：
  1. 采用 NONRESTORING AND SIGNED DIVISION 设计，补码的不恢复余数法，同时支持有符号除法和无符号除法
  2. 同时支持 64 位除法 和 32 位除法
  3. 64 位除法 66 个时钟周期，32 位除法 34 个时钟周期
*/
module ysyx_041514_alu_div_slow (

    input clk,
    input rst,
    input div_signed_valid_i,// 有符号树除法
    input div32_valid_i,     // 32 位除法
    input [`ysyx_041514_XLEN-1:0] dividented_i, // 被除数 rs1
    input [`ysyx_041514_XLEN-1:0] divisor_i,// 除数 rs2
    input div_valid_i,
    output [`ysyx_041514_XLEN-1:0] div_data_o,
    output [`ysyx_041514_XLEN-1:0] rem_data_o,
    output div_ready_o

);
  // 寄存器已复位
  localparam STATE_LEN = 3;
  localparam DIV_RST = 3'd0;
  localparam DIV_IDLE = 3'd1;
  localparam DIV_COUNT32 = 3'd2;
  localparam DIV_COUNT64 = 3'd3;
  localparam DIV_CORECT32 = 3'd4;
  localparam DIV_CORECT64 = 3'd5;


  reg [STATE_LEN-1:0] div_state;
  reg [`ysyx_041514_XLEN_BUS] div_data;  // 最终 商
  reg [`ysyx_041514_XLEN_BUS] rem_data;  // 最终 余数
  reg [129:0] s_reg;  // 记录每一步的 部分余数
  reg [64:0] d_reg;  // 记录除数
  reg [64:0] d_neg_reg;  // 记录 除数的负数
  reg [64:0] div_count;  // 移位计数器
  reg div_ready;


  /* 得到符号位 */
  wire div64_rs1_sign = div_signed_valid_i ? dividented_i[63] : 1'b0;  // dividented
  wire div64_rs2_sign = div_signed_valid_i ? divisor_i[63] : 1'b0;  // divisor
  wire div32_rs1_sign = div_signed_valid_i ? dividented_i[31] : 1'b0;
  wire div32_rs2_sign = div_signed_valid_i ? divisor_i[31] : 1'b0;

  /* 符号扩展 */
  wire [64:0] div64_dividented = {div64_rs1_sign, dividented_i};
  wire [64:0] div64_divisor = {div64_rs2_sign, divisor_i};
  wire [64:0] div64_divisor_neg = ~div64_divisor + 1;  // TODO 求补操作可以统一

  wire [32:0] div32_dividented = {div32_rs1_sign, dividented_i[31:0]};
  wire [32:0] div32_divisor = {div32_rs2_sign, divisor_i[31:0]};
  wire [32:0] div32_divisor_neg = ~div32_divisor + 1;  // TODO 求补操作可以统一

  /* 64 位除法 初始数据 */
  wire [129:0] div64_z = {{65{div64_rs1_sign}}, div64_dividented};  // 被除数
  wire [64:0] div64_d = div64_divisor;  // 除数，运算时，与 div64_z 左对齐
  wire [64:0] div64_d_neg = div64_divisor_neg; // 除数的相反数（补码）,与 div64_z 左对齐

  /* 32 位除法 初始数据 */
  wire [65:0] div32_z = {{33{div32_rs1_sign}}, div32_dividented};  // 被除数
  wire [32:0] div32_d = div32_divisor;  // 除数,与 div32_z 左对齐
  wire [32:0] div32_d_neg = div32_divisor_neg;  // 除数的相反数（补码）,与 div32_z 左对齐


  wire s_sign_64 = s_reg[129];
  wire s_sign_32 = s_reg[65];
  wire d_sign_64 = d_reg[64];
  wire d_sign_32 = d_reg[32];
  wire z_sign_64 = div64_rs1_sign;
  wire z_sign_32 = div32_rs1_sign;


  wire add_d_64 = s_sign_64 ^ d_sign_64;  // 符号异：加有效，符号同：减有效
  wire add_d_32 = s_sign_32 ^ d_sign_32;  // 符号异：加有效，符号同：减有效

  wire [64:0] d_switch_64 = add_d_64 ? d_reg : d_neg_reg;  // 每一步需要加上的数
  wire [64:0] d_switch_32 = add_d_32 ? d_reg : d_neg_reg;

  wire q_temp_64 = add_d_64 ? 1'b0 : 1'b1;  // 每一次计算的商
  wire q_temp_32 = add_d_32 ? 1'b0 : 1'b1;  // 每一次计算的商

  wire [129:0] s_reg_next64 = {
    {s_reg[128:64] + d_switch_64}, s_reg[63:0], q_temp_64
  };  // TODO 先选再加
  wire [129:0] s_reg_next32 = {64'b0, s_reg[64:32] + d_switch_32[32:0], s_reg[31:0], q_temp_32};

  /* 用于最后对 商和余数的修正 */
  wire s_is_zero64 = (s_reg[129:65] == 0);
  wire s_is_zero32 = (s_reg[65:33] == 0);
  wire s_is_div64 = (s_reg[129:65] == d_reg);
  wire s_is_neg_div64 = (s_reg[129:65] == d_neg_reg);
  wire s_is_div32 = (s_reg[65:33] == d_reg[32:0]);
  wire s_is_neg_div32 = (s_reg[65:33] == d_neg_reg[32:0]);

  wire need_correct_64 = ((s_sign_64 ^ z_sign_64)) & (~s_is_zero64)|s_is_div64|s_is_neg_div64;  // 结果需要修正 DGX
  wire need_coreect_32 = ((s_sign_32 ^ z_sign_32)) & (~s_is_zero32)|s_is_div32|s_is_neg_div32;  // 结果需要修正

  wire [65:0] q_correct_plus_64 = {66{need_correct_64}}&(add_d_64 ? (~66'b0) : 66'b1);  // 1 或 -1
  wire [33:0] q_correct_plus_32 = {34{need_coreect_32}}&(add_d_32 ? (~34'b0) : 34'b1);  // 1 或 -1

  wire [65:0] q_correct_64 = {~s_reg[64], s_reg[63:0], 1'b1} + q_correct_plus_64;// TODO 先选再加
  wire [33:0] q_correct_32 = {~s_reg[32], s_reg[31:0], 1'b1} + q_correct_plus_32;

  wire [64:0] s_correct_plus_64 = {65{need_correct_64}} & (add_d_64 ? d_reg : d_neg_reg);
  wire [32:0] s_correct_plus_32 = {33{need_coreect_32}}&(add_d_32?d_reg[32:0]:d_neg_reg[32:0]);

  wire [64:0] s_correct_64 = s_reg[129:65] + s_correct_plus_64;
  wire [32:0] s_correct_32 = s_reg[65:33] + s_correct_plus_32;



  // 手动左移 1 位，用于计数 
  wire [64:0] div_count_next = {1'b0, div_count[64:1]};
  wire div_count_is_zero = ~div_count[0];


  always @(posedge clk) begin
    if (rst) begin
      div_state <= DIV_RST;
      div_data <= 0;
      rem_data <= 0;
      div_ready <= `ysyx_041514_FALSE;
      div_count <= 0;
      s_reg <= 0;
      d_reg <= 0;
      d_neg_reg <= 0;
    end else begin
      case (div_state)
        DIV_RST: begin
          div_state <= DIV_IDLE;
        end
        DIV_IDLE: begin
          div_ready <= `ysyx_041514_FALSE;
          case ({
            div_valid_i, div32_valid_i
          })
            2'b11: begin : div32_begin
              s_reg <= {64'b0, div32_z};  // 只使用低位
              d_reg <= {32'b0, div32_d};
              d_neg_reg <= {32'b0, div32_d_neg};
              // div_count <= 32'd33;
              div_count <= {32'b0, {33{1'b1}}};  // 移位计数器
              div_state <= DIV_COUNT32;
            end
            2'b10: begin : div64_begin
              s_reg <= div64_z;
              d_reg <= div64_d;
              d_neg_reg <= div64_d_neg;
              // div_count <= 32'd65;
              div_count <= {65{1'b1}};  // 移位计数器
              div_state <= DIV_COUNT64;
            end
            default: begin
              div_state <= DIV_IDLE;
            end
          endcase
        end
        DIV_COUNT32: begin
          if (div_count_is_zero) begin
            div_state <= DIV_CORECT32;
          end else begin
            div_count <= div_count_next;
            s_reg <= s_reg_next32;
          end
        end
        DIV_COUNT64: begin  //TODO DIV_COUNT64 DIV_CORECT32 阶段合并
          if (div_count_is_zero) begin
            div_state <= DIV_CORECT64;
          end else begin
            div_count <= div_count_next;
            s_reg <= s_reg_next64;
          end
        end
        DIV_CORECT32: begin  //TODO DIV_CORECT64 DIV_CORECT32 阶段合并
          div_data  <= {32'b0, q_correct_32[31:0]};
          rem_data  <= {32'b0, s_correct_32[31:0]};
          div_ready <= `ysyx_041514_TRUE;
          div_state <= DIV_IDLE;

        end
        DIV_CORECT64: begin
          div_data  <= q_correct_64[63:0];
          rem_data  <= s_correct_64[63:0];
          div_ready <= `ysyx_041514_TRUE;
          div_state <= DIV_IDLE;

        end
        default: begin
          div_state <= DIV_IDLE;
        end
      endcase
    end
  end

  assign div_data_o  = div_data;
  assign rem_data_o  = rem_data;
  assign div_ready_o = div_ready;

endmodule

 
// 1. booth 华莱士乘法树，采用 5-2，4-2 压缩器实现，资源消耗巨大，但只需要 6 个周期能完成 64 位乘法操作
// 2. 高等级压缩器之间的进位传输成为关键路径，满足不了时序要求
// 3. 考虑将 5-2 4-2 压缩器，换为 3-2 压缩器，减少关键路径
module ysyx_041514_alu_mul_wallace (
    input                            clk,
    input                            rst,
    input                            rs1_signed_valid_i,
    input                            rs2_signed_valid_i,
    input  [  `ysyx_041514_XLEN_BUS] rs1_data_i,
    input  [  `ysyx_041514_XLEN_BUS] rs2_data_i,
    input                            mul_valid_i,
    output                           mul_ready_o,
    output [`ysyx_041514_XLEN*2-1:0] mul_out_o
);
  // 寄存器已经复位
  localparam STATE_LEN = 3;
  localparam MUL_RST = 3'd0;
  localparam MUL_IDLE = 3'd1;
  localparam MUL_BOOTH = 3'd2;
  localparam MUL_STEP1 = 3'd3;
  localparam MUL_STEP2 = 3'd4;
  localparam MUL_STEP3 = 3'd5;
  localparam MUL_STEP4 = 3'd6;
  localparam MUL_STEP5 = 3'd7;


  wire _mul_valid = mul_valid_i;
  reg [STATE_LEN-1:0] mul_state;
  reg mul_ready;
  reg [127:0] mul_data128;

  reg [`ysyx_041514_XLEN_BUS] booth_rs1;
  reg [`ysyx_041514_XLEN_BUS] booth_rs2;
  reg booth_rs1_signed_valid;
  reg booth_rs2_signed_valid;


  wire [127:0] mul_final128;
  assign mul_ready_o = mul_ready;

  assign mul_out_o   = mul_data128;


  /* 乘法状态机切换 */
  always @(posedge clk) begin
    if (rst) begin
      mul_state   <= MUL_RST;
      mul_ready   <= `ysyx_041514_FALSE;
      mul_data128 <= 'b0;
      booth_rs1   <= 'b0;
      booth_rs2   <= 'b0;
      booth_rs1_signed_valid<='b0;
      booth_rs2_signed_valid<='b0;
    end else begin
      case (mul_state)
        MUL_RST: begin
          mul_state <= MUL_IDLE;
        end
        MUL_IDLE: begin
          mul_ready <= `ysyx_041514_FALSE;
          if (_mul_valid) begin  // booth 结果有效
            mul_state <= MUL_BOOTH;
            booth_rs1 <= rs1_data_i;
            booth_rs2 <= rs2_data_i;
            booth_rs1_signed_valid<=rs1_signed_valid_i;
            booth_rs2_signed_valid<=rs2_signed_valid_i;
          end
        end
        MUL_BOOTH: begin
          if (_mul_valid) begin
            mul_state <= MUL_STEP1;  // booth 结果有效，进入 step 1
          end else begin
            mul_state   <= MUL_IDLE;
            mul_data128 <= 'b0;
          end
        end
        MUL_STEP1: begin
          if (_mul_valid) begin
            mul_state <= MUL_STEP2;  // step1 33->16，进入 step2
          end else begin
            mul_state   <= MUL_IDLE;
            mul_data128 <= 'b0;
          end
        end
        MUL_STEP2: begin
          if (_mul_valid) begin
            mul_state <= MUL_STEP3;  // step2 16->8 ，进入step3
          end else begin
            mul_state   <= MUL_IDLE;
            mul_data128 <= 'b0;
          end
        end
        MUL_STEP3: begin
          if (_mul_valid) begin
            mul_state <= MUL_STEP4;  // step3 8->2，进入 step4
          end else begin
            mul_state   <= MUL_IDLE;
            mul_data128 <= 'b0;
          end
        end
        MUL_STEP4: begin
          if (_mul_valid) begin
            mul_state <= MUL_STEP5;  // step3 8->2，进入 step4
          end else begin
            mul_state   <= MUL_IDLE;
            mul_data128 <= 'b0;
          end
        end
        MUL_STEP5: begin
          if (_mul_valid) begin
            mul_state   <= MUL_IDLE;  // step4 2->1, 进入 idle
            mul_data128 <= mul_final128;  // 结果有效
            mul_ready   <= `ysyx_041514_TRUE;
          end else begin
            mul_state   <= MUL_IDLE;
            mul_data128 <= 'b0;
          end
        end
      endcase
    end
  end







  wire [127:0] Partial_product[33-1:0];
  ysyx_041514_alu_mul_booth_r4 u_alu_mul_booth_r4 (
      .rs1_signed_valid_i(booth_rs1_signed_valid),
      .rs2_signed_valid_i(booth_rs2_signed_valid),
      .rs1_data_i        (booth_rs1),
      .rs2_data_i        (booth_rs2),
      .pp0_o             (Partial_product[0]),
      .pp1_o             (Partial_product[1]),
      .pp2_o             (Partial_product[2]),
      .pp3_o             (Partial_product[3]),
      .pp4_o             (Partial_product[4]),
      .pp5_o             (Partial_product[5]),
      .pp6_o             (Partial_product[6]),
      .pp7_o             (Partial_product[7]),
      .pp8_o             (Partial_product[8]),
      .pp9_o             (Partial_product[9]),
      .pp10_o            (Partial_product[10]),
      .pp11_o            (Partial_product[11]),
      .pp12_o            (Partial_product[12]),
      .pp13_o            (Partial_product[13]),
      .pp14_o            (Partial_product[14]),
      .pp15_o            (Partial_product[15]),
      .pp16_o            (Partial_product[16]),
      .pp17_o            (Partial_product[17]),
      .pp18_o            (Partial_product[18]),
      .pp19_o            (Partial_product[19]),
      .pp20_o            (Partial_product[20]),
      .pp21_o            (Partial_product[21]),
      .pp22_o            (Partial_product[22]),
      .pp23_o            (Partial_product[23]),
      .pp24_o            (Partial_product[24]),
      .pp25_o            (Partial_product[25]),
      .pp26_o            (Partial_product[26]),
      .pp27_o            (Partial_product[27]),
      .pp28_o            (Partial_product[28]),
      .pp29_o            (Partial_product[29]),
      .pp30_o            (Partial_product[30]),
      .pp31_o            (Partial_product[31]),
      .pp32_o            (Partial_product[32])
  );

  //  部分积生成 ( 共33 个),缓存一个周期
  wire [127:0] step1_pp_q[33-1:0];

  genvar step1_Dflap;
  generate
    for (step1_Dflap = 0; step1_Dflap < 33; step1_Dflap = step1_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate (
          .clk (clk),
          .rst (rst),
          .din (Partial_product[step1_Dflap]),
          .dout(step1_pp_q[step1_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate

  // wire [127:0] step1_pp[33-1:0];
  // assign step1_pp = step1_pp_q;

  /*******                booth                ********/
  /*******             wallace tree            ********/

  /*******(33) 5-2 4-2 4-2 4-2 4-2 4-2 4-2 4-2 ********/

  /*******(16)        4-2 4-2 4-2 4-2          ********/

  /*******(8)            4-2 4-2               ********/

  /*******(4)              4-2                 ********/

  /*******(2)              2-1                 ********/

  /*******(1)               1                  ********/



  /* step1 插入寄存器 */
  wire [129-1:0] step1_A0_cout0  /* verilator split_var */;
  wire [129-1:0] step1_A0_cout1  /* verilator split_var */;
  assign step1_A0_cout0[0] = 1'b0;
  assign step1_A0_cout1[0] = 1'b0;
  wire [128-1:0] step1_A0_sum, step1_A0_carry;
  genvar step1_A0;

  generate
    for (step1_A0 = 0; step1_A0 < 128; step1_A0 = step1_A0 + 1) begin
      ysyx_041514_alu_mul_compressor52 u_alu_mul_compressor52 (
          .x0   (step1_pp_q[0][step1_A0]),
          .x1   (step1_pp_q[1][step1_A0]),
          .x2   (step1_pp_q[2][step1_A0]),
          .x3   (step1_pp_q[3][step1_A0]),
          .x4   (step1_pp_q[4][step1_A0]),
          .cin0 (step1_A0_cout0[step1_A0]),
          .cin1 (step1_A0_cout1[step1_A0]),
          .cout0(step1_A0_cout0[step1_A0+1]),
          .cout1(step1_A0_cout1[step1_A0+1]),
          .sum  (step1_A0_sum[step1_A0]),
          .carry(step1_A0_carry[step1_A0])
      );
    end
  endgenerate

  // wire [129-1:0] step1_A0_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  // assign step1_A0_cout[0] = 1'b0;
  // wire [128-1:0] step1_A0_sum, step1_A0_carry;
  // genvar step1_A0;
  // generate
  //   for (step1_A0 = 0; step1_A0 < 128; step1_A0 = step1_A0 + 1) begin
  //     alu_mul_compressor42 u_alu_mul_compressor42_step1_A0 (
  //         .x0   (step1_pp[1][step1_A0]),
  //         .x1   (step1_pp[2][step1_A0]),
  //         .x2   (step1_pp[3][step1_A0]),
  //         .x3   (step1_pp[4][step1_A0]),
  //         .ci   (step1_A0_cout[step1_A0]),
  //         .sum  (step1_A0_sum[step1_A0]),
  //         .co   (step1_A0_cout[step1_A0+1]),
  //         .carry(step1_A0_carry[step1_A0])
  //     );
  //   end
  // endgenerate


  wire [129-1:0] step1_A1_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A1_cout[0] = 1'b0;
  wire [128-1:0] step1_A1_sum, step1_A1_carry;
  genvar step1_A1;
  generate
    for (step1_A1 = 0; step1_A1 < 128; step1_A1 = step1_A1 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step1_A1 (
          .x0   (step1_pp_q[5][step1_A1]),
          .x1   (step1_pp_q[6][step1_A1]),
          .x2   (step1_pp_q[7][step1_A1]),
          .x3   (step1_pp_q[8][step1_A1]),
          .ci   (step1_A1_cout[step1_A1]),
          .sum  (step1_A1_sum[step1_A1]),
          .co   (step1_A1_cout[step1_A1+1]),
          .carry(step1_A1_carry[step1_A1])
      );
    end
  endgenerate


  wire [129-1:0] step1_A2_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A2_cout[0] = 1'b0;
  wire [128-1:0] step1_A2_sum, step1_A2_carry;
  genvar step1_A2;
  generate
    for (step1_A2 = 0; step1_A2 < 128; step1_A2 = step1_A2 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step1_A2 (
          .x0   (step1_pp_q[9][step1_A2]),
          .x1   (step1_pp_q[10][step1_A2]),
          .x2   (step1_pp_q[11][step1_A2]),
          .x3   (step1_pp_q[12][step1_A2]),
          .ci   (step1_A2_cout[step1_A2]),
          .sum  (step1_A2_sum[step1_A2]),
          .co   (step1_A2_cout[step1_A2+1]),
          .carry(step1_A2_carry[step1_A2])
      );
    end
  endgenerate


  wire [129-1:0] step1_A3_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A3_cout[0] = 1'b0;
  wire [128-1:0] step1_A3_sum, step1_A3_carry;
  genvar step1_A3;
  generate
    for (step1_A3 = 0; step1_A3 < 128; step1_A3 = step1_A3 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step1_A3 (
          .x0   (step1_pp_q[13][step1_A3]),
          .x1   (step1_pp_q[14][step1_A3]),
          .x2   (step1_pp_q[15][step1_A3]),
          .x3   (step1_pp_q[16][step1_A3]),
          .ci   (step1_A3_cout[step1_A3]),
          .sum  (step1_A3_sum[step1_A3]),
          .co   (step1_A3_cout[step1_A3+1]),
          .carry(step1_A3_carry[step1_A3])
      );
    end
  endgenerate




  wire [129-1:0] step1_A4_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A4_cout[0] = 1'b0;
  wire [128-1:0] step1_A4_sum, step1_A4_carry;
  genvar step1_A4;
  generate
    for (step1_A4 = 0; step1_A4 < 128; step1_A4 = step1_A4 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step1_A4 (
          .x0   (step1_pp_q[17][step1_A4]),
          .x1   (step1_pp_q[18][step1_A4]),
          .x2   (step1_pp_q[19][step1_A4]),
          .x3   (step1_pp_q[20][step1_A4]),
          .ci   (step1_A4_cout[step1_A4]),
          .sum  (step1_A4_sum[step1_A4]),
          .co   (step1_A4_cout[step1_A4+1]),
          .carry(step1_A4_carry[step1_A4])
      );
    end
  endgenerate



  wire [129-1:0] step1_A5_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A5_cout[0] = 1'b0;
  wire [128-1:0] step1_A5_sum, step1_A5_carry;
  genvar step1_A5;
  generate
    for (step1_A5 = 0; step1_A5 < 128; step1_A5 = step1_A5 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_tep1_A5 (
          .x0   (step1_pp_q[21][step1_A5]),
          .x1   (step1_pp_q[22][step1_A5]),
          .x2   (step1_pp_q[23][step1_A5]),
          .x3   (step1_pp_q[24][step1_A5]),
          .ci   (step1_A5_cout[step1_A5]),
          .sum  (step1_A5_sum[step1_A5]),
          .co   (step1_A5_cout[step1_A5+1]),
          .carry(step1_A5_carry[step1_A5])
      );
    end
  endgenerate


  wire [129-1:0] step1_A6_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A6_cout[0] = 1'b0;
  wire [128-1:0] step1_A6_sum, step1_A6_carry;
  genvar step1_A6;
  generate
    for (step1_A6 = 0; step1_A6 < 128; step1_A6 = step1_A6 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step1_A6 (
          .x0   (step1_pp_q[25][step1_A6]),
          .x1   (step1_pp_q[26][step1_A6]),
          .x2   (step1_pp_q[27][step1_A6]),
          .x3   (step1_pp_q[28][step1_A6]),
          .ci   (step1_A6_cout[step1_A6]),
          .sum  (step1_A6_sum[step1_A6]),
          .co   (step1_A6_cout[step1_A6+1]),
          .carry(step1_A6_carry[step1_A6])
      );
    end
  endgenerate


  wire [129-1:0] step1_A7_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step1_A7_cout[0] = 1'b0;
  wire [128-1:0] step1_A7_sum, step1_A7_carry;
  genvar step1_A7;
  generate
    for (step1_A7 = 0; step1_A7 < 128; step1_A7 = step1_A7 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step1_A7 (
          .x0   (step1_pp_q[29][step1_A7]),
          .x1   (step1_pp_q[30][step1_A7]),
          .x2   (step1_pp_q[31][step1_A7]),
          .x3   (step1_pp_q[32][step1_A7]),
          .ci   (step1_A7_cout[step1_A7]),
          .sum  (step1_A7_sum[step1_A7]),
          .co   (step1_A7_cout[step1_A7+1]),
          .carry(step1_A7_carry[step1_A7])
      );
    end
  endgenerate



  /* step2 插入寄存器 */
  wire [127:0] step2_pp_d[16-1:0];
  wire [127:0] step2_pp_q[16-1:0];

  assign step2_pp_d[0]  = step1_A0_sum;
  assign step2_pp_d[1]  = step1_A1_sum;
  assign step2_pp_d[2]  = step1_A2_sum;
  assign step2_pp_d[3]  = step1_A3_sum;
  assign step2_pp_d[4]  = step1_A4_sum;
  assign step2_pp_d[5]  = step1_A5_sum;
  assign step2_pp_d[6]  = step1_A6_sum;
  assign step2_pp_d[7]  = step1_A7_sum;
  assign step2_pp_d[8]  = {step1_A0_carry[126:0], 1'b0};
  assign step2_pp_d[9]  = {step1_A1_carry[126:0], 1'b0};
  assign step2_pp_d[10] = {step1_A2_carry[126:0], 1'b0};
  assign step2_pp_d[11] = {step1_A3_carry[126:0], 1'b0};
  assign step2_pp_d[12] = {step1_A4_carry[126:0], 1'b0};
  assign step2_pp_d[13] = {step1_A5_carry[126:0], 1'b0};
  assign step2_pp_d[14] = {step1_A6_carry[126:0], 1'b0};
  assign step2_pp_d[15] = {step1_A7_carry[126:0], 1'b0};

  genvar step2_Dflap;
  generate
    for (step2_Dflap = 0; step2_Dflap < 16; step2_Dflap = step2_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate_step2 (
          .clk (clk),
          .rst (rst),
          .din (step2_pp_d[step2_Dflap]),
          .dout(step2_pp_q[step2_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate

  // wire [127:0] step2_pp[16-1:0];
  // assign step2_pp = step2_pp_q;


  wire [129-1:0] step2_A0_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step2_A0_cout[0] = 1'b0;
  wire [128-1:0] step2_A0_sum, step2_A0_carry;
  genvar step2_A0;
  generate
    for (step2_A0 = 0; step2_A0 < 128; step2_A0 = step2_A0 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step2_A0 (
          .x0   (step2_pp_q[0][step2_A0]),
          .x1   (step2_pp_q[1][step2_A0]),
          .x2   (step2_pp_q[2][step2_A0]),
          .x3   (step2_pp_q[3][step2_A0]),
          .ci   (step2_A0_cout[step2_A0]),
          .sum  (step2_A0_sum[step2_A0]),
          .co   (step2_A0_cout[step2_A0+1]),
          .carry(step2_A0_carry[step2_A0])
      );
    end
  endgenerate


  wire [129-1:0] step2_A1_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step2_A1_cout[0] = 1'b0;
  wire [128-1:0] step2_A1_sum, step2_A1_carry;
  genvar step2_A1;
  generate
    for (step2_A1 = 0; step2_A1 < 128; step2_A1 = step2_A1 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step2_A1 (
          .x0   (step2_pp_q[4][step2_A1]),
          .x1   (step2_pp_q[5][step2_A1]),
          .x2   (step2_pp_q[6][step2_A1]),
          .x3   (step2_pp_q[7][step2_A1]),
          .ci   (step2_A1_cout[step2_A1]),
          .sum  (step2_A1_sum[step2_A1]),
          .co   (step2_A1_cout[step2_A1+1]),
          .carry(step2_A1_carry[step2_A1])
      );
    end
  endgenerate


  wire [129-1:0] step2_A2_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step2_A2_cout[0] = 1'b0;
  wire [128-1:0] step2_A2_sum, step2_A2_carry;
  genvar step2_A2;
  generate
    for (step2_A2 = 0; step2_A2 < 128; step2_A2 = step2_A2 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step2_A2 (
          .x0   (step2_pp_q[8][step2_A2]),
          .x1   (step2_pp_q[9][step2_A2]),
          .x2   (step2_pp_q[10][step2_A2]),
          .x3   (step2_pp_q[11][step2_A2]),
          .ci   (step2_A2_cout[step2_A2]),
          .sum  (step2_A2_sum[step2_A2]),
          .co   (step2_A2_cout[step2_A2+1]),
          .carry(step2_A2_carry[step2_A2])
      );
    end
  endgenerate


  wire [129-1:0] step2_A3_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step2_A3_cout[0] = 1'b0;
  wire [128-1:0] step2_A3_sum, step2_A3_carry;
  genvar step2_A3;
  generate
    for (step2_A3 = 0; step2_A3 < 128; step2_A3 = step2_A3 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step2_A3 (
          .x0   (step2_pp_q[12][step2_A3]),
          .x1   (step2_pp_q[13][step2_A3]),
          .x2   (step2_pp_q[14][step2_A3]),
          .x3   (step2_pp_q[15][step2_A3]),
          .ci   (step2_A3_cout[step2_A3]),
          .sum  (step2_A3_sum[step2_A3]),
          .co   (step2_A3_cout[step2_A3+1]),
          .carry(step2_A3_carry[step2_A3])
      );
    end
  endgenerate



  /* step3 插入寄存器 */
  wire [127:0] step3_pp_d[8-1:0];
  wire [127:0] step3_pp_q[8-1:0];
  assign step3_pp_d[0] = step2_A0_sum;
  assign step3_pp_d[1] = step2_A1_sum;
  assign step3_pp_d[2] = step2_A2_sum;
  assign step3_pp_d[3] = step2_A3_sum;
  assign step3_pp_d[4] = {step2_A0_carry[126:0], 1'b0};
  assign step3_pp_d[5] = {step2_A1_carry[126:0], 1'b0};
  assign step3_pp_d[6] = {step2_A2_carry[126:0], 1'b0};
  assign step3_pp_d[7] = {step2_A3_carry[126:0], 1'b0};

  genvar step3_Dflap;
  generate
    for (step3_Dflap = 0; step3_Dflap < 8; step3_Dflap = step3_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate_step3 (
          .clk (clk),
          .rst (rst),
          .din (step3_pp_d[step3_Dflap]),
          .dout(step3_pp_q[step3_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate
  // wire [127:0] step3_pp[8-1:0];
  // assign step3_pp = step3_pp_q;






  wire [129-1:0] step3_A0_cout/* verilator split_var */;  // 最低位进位位 0 �����最高位进位不使用
  assign step3_A0_cout[0] = 1'b0;
  wire [128-1:0] step3_A0_sum, step3_A0_carry;
  genvar step3_A0;
  generate
    for (step3_A0 = 0; step3_A0 < 128; step3_A0 = step3_A0 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step3_A0 (
          .x0   (step3_pp_q[0][step3_A0]),
          .x1   (step3_pp_q[1][step3_A0]),
          .x2   (step3_pp_q[2][step3_A0]),
          .x3   (step3_pp_q[3][step3_A0]),
          .ci   (step3_A0_cout[step3_A0]),
          .sum  (step3_A0_sum[step3_A0]),
          .co   (step3_A0_cout[step3_A0+1]),
          .carry(step3_A0_carry[step3_A0])
      );
    end
  endgenerate


  wire [129-1:0] step3_A1_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进位不使用
  assign step3_A1_cout[0] = 1'b0;
  wire [128-1:0] step3_A1_sum, step3_A1_carry;
  genvar step3_A1;
  generate
    for (step3_A1 = 0; step3_A1 < 128; step3_A1 = step3_A1 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step3_A1 (
          .x0   (step3_pp_q[4][step3_A1]),
          .x1   (step3_pp_q[5][step3_A1]),
          .x2   (step3_pp_q[6][step3_A1]),
          .x3   (step3_pp_q[7][step3_A1]),
          .ci   (step3_A1_cout[step3_A1]),
          .sum  (step3_A1_sum[step3_A1]),
          .co   (step3_A1_cout[step3_A1+1]),
          .carry(step3_A1_carry[step3_A1])
      );
    end
  endgenerate


  /* step4 TODO:插入流水线 */
  wire [127:0] step4_pp_d[4-1:0];
  wire [127:0] step4_pp_q[4-1:0];
  assign step4_pp_d[0] = step3_A0_sum;
  assign step4_pp_d[1] = step3_A1_sum;
  assign step4_pp_d[2] = {step3_A0_carry[126:0], 1'b0};
  assign step4_pp_d[3] = {step3_A1_carry[126:0], 1'b0};



  genvar step4_Dflap;
  generate
    for (step4_Dflap = 0; step4_Dflap < 4; step4_Dflap = step4_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate_step4 (
          .clk (clk),
          .rst (rst),
          .din (step4_pp_d[step4_Dflap]),
          .dout(step4_pp_q[step4_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate
  // wire [127:0] step4_pp[4-1:0];
  // assign step4_pp = step4_pp_q;


  wire [129-1:0] step4_A0_cout/* verilator split_var */;  // 最低位进位位 0 ，最高位进����不���用
  assign step4_A0_cout[0] = 1'b0;
  wire [128-1:0] step4_A0_sum, step4_A0_carry;
  genvar step4_A0;
  generate
    for (step4_A0 = 0; step4_A0 < 128; step4_A0 = step4_A0 + 1) begin
      ysyx_041514_alu_mul_compressor42 u_alu_mul_compressor42_step4_A0 (
          .x0   (step4_pp_q[0][step4_A0]),
          .x1   (step4_pp_q[1][step4_A0]),
          .x2   (step4_pp_q[2][step4_A0]),
          .x3   (step4_pp_q[3][step4_A0]),
          .ci   (step4_A0_cout[step4_A0]),
          .sum  (step4_A0_sum[step4_A0]),
          .co   (step4_A0_cout[step4_A0+1]),
          .carry(step4_A0_carry[step4_A0])
      );
    end
  endgenerate





  /* step5 TODO:插入流水线 */
  wire [127:0] step5_pp_d[2-1:0];
  wire [127:0] step5_pp_q[2-1:0];
  assign step5_pp_d[0] = step4_A0_sum;
  assign step5_pp_d[1] = {step4_A0_carry[126:0], 1'b0};

  genvar step5_Dflap;
  generate
    for (step5_Dflap = 0; step5_Dflap < 2; step5_Dflap = step5_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate_step5 (
          .clk (clk),
          .rst (rst),
          .din (step5_pp_d[step5_Dflap]),
          .dout(step5_pp_q[step5_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate


  assign mul_final128 = step5_pp_q[0] + step5_pp_q[1];

  // /* step5 TODO:插入流水线 */
  // assign mul_out_o = 
endmodule
 



module ysyx_041514_alu_mul_top (
    input                            clk,
    input                            rst,
    input                            rs1_signed_valid_i,
    input                            rs2_signed_valid_i,
    input  [  `ysyx_041514_XLEN_BUS] rs1_data_i,
    input  [  `ysyx_041514_XLEN_BUS] rs2_data_i,
    input                            mul_valid_i,
    output                           mul_ready_o,
    output [`ysyx_041514_XLEN*2-1:0] mul_out_o
);
  // /* 双符号位扩展 */
  // wire _rs1_sign = (rs1_signed_valid_i) ? rs1_data_i[`ysyx_041514_XLEN-1] : 1'b0;
  // wire _rs2_sign = (rs2_signed_valid_i) ? rs2_data_i[`ysyx_041514_XLEN-1] : 1'b0;
  // /* 共65位 */
  // wire [`ysyx_041514_XLEN:0] _rs1_65 = {_rs1_sign, rs1_data_i};
  // wire [`ysyx_041514_XLEN:0] _rs2_65 = {_rs2_sign, rs2_data_i};

  // wire [`ysyx_041514_XLEN*2-1:0] _mul_result = _rs1_65 * _rs2_65;
  // assign mul_out_o = _mul_result;

`ifdef MUL_SIM
  ysyx_041514_alu_mul_sim u_alu_mul_sim (
      .clk               (clk),
      .rst               (rst),
      .rs1_signed_valid_i(rs1_signed_valid_i),
      .rs2_signed_valid_i(rs2_signed_valid_i),
      .rs1_data_i        (rs1_data_i),
      .rs2_data_i        (rs2_data_i),
      .mul_valid_i       (mul_valid_i),
      .mul_ready_o       (mul_ready_o),
      .mul_out_o         (mul_out_o)
  );
`else

`ifdef MUL_SLOW
  ysyx_041514_alu_mul_slow u_alu_mul_slow (
      .clk               (clk),
      .rst               (rst),
      .rs1_signed_valid_i(rs1_signed_valid_i),
      .rs2_signed_valid_i(rs2_signed_valid_i),
      .rs1_data_i        (rs1_data_i),
      .rs2_data_i        (rs2_data_i),
      .mul_valid_i       (mul_valid_i),
      .mul_ready_o       (mul_ready_o),
      .mul_out_o         (mul_out_o)
  );
`else
  ysyx_041514_alu_mul_wallace_csa u_ysyx_041514_alu_mul_wallace (
      .clk               (clk),
      .rst               (rst),
      .rs1_signed_valid_i(rs1_signed_valid_i),
      .rs2_signed_valid_i(rs2_signed_valid_i),
      .rs1_data_i        (rs1_data_i),
      .rs2_data_i        (rs2_data_i),
      .mul_valid_i       (mul_valid_i),
      .mul_ready_o       (mul_ready_o),
      .mul_out_o         (mul_out_o)
  );
`endif

`endif
endmodule
 



module ysyx_041514_alu_div_top (
    input clk,  //为流水线准备
    input rst,
    input signed_valid_i,
    input div32_valid_i,
    input [`ysyx_041514_XLEN-1:0] sr1_data_i,
    input [`ysyx_041514_XLEN-1:0] sr2_data_i,
    input div_valid_i,
    output div_ready_o,
    output [`ysyx_041514_XLEN-1:0] div_out_o,
    output [`ysyx_041514_XLEN-1:0] rem_out_o
);


`ifdef DIV_SIM
  alu_div_sim u_alu_div_sim (
      .clk               (clk),
      .rst               (rst),
      .div_signed_valid_i(signed_valid_i),
      // 有符号树除法
      .div32_valid_i     (div32_valid_i),
      // 32 位除法
      .dividented_i      (sr1_data_i),
      // 被除数 rs1
      .divisor_i         (sr2_data_i),
      // 除数 rs2
      .div_valid_i       (div_valid_i),
      .div_data_o        (div_out_o),
      .rem_data_o        (rem_out_o),
      .div_ready_o       (div_ready_o)
  );

`else
  ysyx_041514_alu_div_slow u_alu_div_slow (
      .clk               (clk),
      .rst               (rst),
      .div_signed_valid_i(signed_valid_i),
      // 有符号树除法
      .div32_valid_i     (div32_valid_i),
      // 32 位除法
      .dividented_i      (sr1_data_i),
      // 被除数 rs1
      .divisor_i         (sr2_data_i),
      // 除数 rs2
      .div_valid_i       (div_valid_i),
      .div_data_o        (div_out_o),
      .rem_data_o        (rem_out_o),
      .div_ready_o       (div_ready_o)
  );
`endif



  // /* 64 位除法 */
  // wire signed [`ysyx_041514_XLEN-1:0] sr1_64_signed = sr1_data_i;
  // wire signed [`ysyx_041514_XLEN-1:0] sr2_64_signed = sr2_data_i;
  // // 有符号
  // wire signed [`ysyx_041514_XLEN-1:0] div64_signed = sr1_64_signed / sr2_64_signed;
  // wire signed [`ysyx_041514_XLEN-1:0] rem64_signed = sr1_64_signed % sr2_64_signed;
  // // 无符号
  // wire [`ysyx_041514_XLEN-1:0] div64_unsigned = sr1_data_i / sr2_data_i;
  // wire [`ysyx_041514_XLEN-1:0] rem64_unsigned = sr1_data_i % sr2_data_i;
  // // 结果
  // wire [`ysyx_041514_XLEN-1:0] div64_result = (signed_valid_i) ? div64_signed : div64_unsigned;
  // wire [`ysyx_041514_XLEN-1:0] rem64_result = (signed_valid_i) ? rem64_signed : rem64_unsigned;

  // /* 32 位除法 */
  // wire signed [32-1:0] sr1_32_signed = sr1_data_i[31:0];
  // wire signed [32-1:0] sr2_32_signed = sr2_data_i[31:0];
  // //有符号
  // wire signed [32-1:0] div32_signed = sr1_32_signed / sr2_32_signed;
  // wire signed [32-1:0] rem32_signed = sr1_32_signed % sr2_32_signed;
  // //无符号
  // wire [32-1:0] div32_unsigned = sr1_data_i[31:0] / sr2_data_i[31:0];
  // wire [32-1:0] rem32_unsigned = sr1_data_i[31:0] % sr2_data_i[31:0];
  // //结果
  // wire [32-1:0] div32_result = (signed_valid_i) ? div32_signed : div32_unsigned;
  // wire [32-1:0] rem32_result = (signed_valid_i) ? rem32_signed : rem32_unsigned;

  // // 最终结果
  // assign div_out_o = (div32_valid_i) ? {32'b0, div32_result} : div64_result;
  // assign rem_out_o = (div32_valid_i) ? {32'b0, rem32_result} : rem64_result;

endmodule

module ysyx_041514_alu_mul_compressor42 (
    input  wire x0,
    input  wire x1,
    input  wire x2,
    input  wire x3,
    input  wire ci,
    output wire sum,
    output wire co,
    output wire carry
);
  wire _s_temp = x0 ^ x1 ^ x2 ^ x3;
  assign sum = ci ^ _s_temp;
  assign carry = (x0 | x1) & (x2 | x3);
  assign co = (ci & _s_temp) | ~(_s_temp | ~((x0 & x1) | (x2 & x3)));
endmodule


 
// 1. 一次性生成 64 位 乘法的 booth 的部分积
// 2. 内含一个加法器，用于实现补码 +1，其余大部分是连线
module ysyx_041514_alu_mul_booth_r4 (

    input             rs1_signed_valid_i,
    input             rs2_signed_valid_i,
    input [`ysyx_041514_XLEN_BUS] rs1_data_i,
    input [`ysyx_041514_XLEN_BUS] rs2_data_i,

    output [128-1:0] pp0_o,
    output [128-1:0] pp1_o,
    output [128-1:0] pp2_o,
    output [128-1:0] pp3_o,
    output [128-1:0] pp4_o,
    output [128-1:0] pp5_o,
    output [128-1:0] pp6_o,
    output [128-1:0] pp7_o,
    output [128-1:0] pp8_o,
    output [128-1:0] pp9_o,
    output [128-1:0] pp10_o,
    output [128-1:0] pp11_o,
    output [128-1:0] pp12_o,
    output [128-1:0] pp13_o,
    output [128-1:0] pp14_o,
    output [128-1:0] pp15_o,
    output [128-1:0] pp16_o,
    output [128-1:0] pp17_o,
    output [128-1:0] pp18_o,
    output [128-1:0] pp19_o,
    output [128-1:0] pp20_o,
    output [128-1:0] pp21_o,
    output [128-1:0] pp22_o,
    output [128-1:0] pp23_o,
    output [128-1:0] pp24_o,
    output [128-1:0] pp25_o,
    output [128-1:0] pp26_o,
    output [128-1:0] pp27_o,
    output [128-1:0] pp28_o,
    output [128-1:0] pp29_o,
    output [128-1:0] pp30_o,
    output [128-1:0] pp31_o,
    output [128-1:0] pp32_o
);

  // 两位符号扩展
  wire [66-1:0]rs1_66 = rs1_signed_valid_i?{{2{rs1_data_i[63]}},rs1_data_i}:{2'b00,rs1_data_i};
  wire [66-1:0]rs2_66 = rs2_signed_valid_i?{{2{rs2_data_i[63]}},rs2_data_i}:{2'b00,rs2_data_i};
  // booth 编码
  wire [66-1:0] x = rs1_66;
  wire [66-1:0] x_double = {x[66-2:0], 1'b0};
  wire [66-1:0] x_neg = ~x + 1;  // TODO 加法器可以省吗？，可以但要改结构
  wire [66-1:0] x_neg_double = {x_neg[66-2:0], 1'b0};
  // booth 编码 扫描数
  wire [67-1:0] scan_num = {rs2_66, 1'b0};

  wire [66-1:0] pp_o[33-1:0];  // 部分积
  genvar i;
  generate
    // i*2+1==j
    for (i = 0; i < 33; i = i + 1) begin : gen_pp
      wire x_valid = (scan_num[i*2+2:i*2] == 3'b001) | (scan_num[i*2+2:i*2] == 3'b010);
      wire x_neg_valid = (scan_num[i*2+2:i*2] == 3'b101) | (scan_num[i*2+2:i*2] == 3'b110);
      wire x_neg_double_valid = (scan_num[i*2+2:i*2] == 3'b100);
      wire x_double_valid = (scan_num[i*2+2:i*2] == 3'b011);
      wire x_zero_valid = (scan_num[i*2+2:i*2] == 3'b000) | (scan_num[i*2+2:i*2] == 3'b111);

      assign pp_o[i] = ({66{x_valid}}&x) 
                     | ({66{x_neg_valid}}&x_neg) 
                     | ({66{x_neg_double_valid}}&x_neg_double) 
                     | ({66{x_double_valid}}&x_double) 
                     | ({66{x_zero_valid}}&66'b0);
    end
  endgenerate


  // 手动移位器，将部分积移动到 128 bit 中对应的位置上
  assign pp0_o  = {{128 - 66 - 0{1'b0}}, pp_o[0]};
  assign pp1_o  = {{128 - 66 - 2{1'b0}}, pp_o[1], 2'b0};
  assign pp2_o  = {{128 - 66 - 4{1'b0}}, pp_o[2], 4'b0};
  assign pp3_o  = {{128 - 66 - 6{1'b0}}, pp_o[3], 6'b0};
  assign pp4_o  = {{128 - 66 - 8{1'b0}}, pp_o[4], 8'b0};
  assign pp5_o  = {{128 - 66 - 10{1'b0}}, pp_o[5], 10'b0};
  assign pp6_o  = {{128 - 66 - 12{1'b0}}, pp_o[6], 12'b0};
  assign pp7_o  = {{128 - 66 - 14{1'b0}}, pp_o[7], 14'b0};
  assign pp8_o  = {{128 - 66 - 16{1'b0}}, pp_o[8], 16'b0};
  assign pp9_o  = {{128 - 66 - 18{1'b0}}, pp_o[9], 18'b0};
  assign pp10_o = {{128 - 66 - 20{1'b0}}, pp_o[10], 20'b0};
  assign pp11_o = {{128 - 66 - 22{1'b0}}, pp_o[11], 22'b0};
  assign pp12_o = {{128 - 66 - 24{1'b0}}, pp_o[12], 24'b0};
  assign pp13_o = {{128 - 66 - 26{1'b0}}, pp_o[13], 26'b0};
  assign pp14_o = {{128 - 66 - 28{1'b0}}, pp_o[14], 28'b0};
  assign pp15_o = {{128 - 66 - 30{1'b0}}, pp_o[15], 30'b0};
  assign pp16_o = {{128 - 66 - 32{1'b0}}, pp_o[16], 32'b0};
  assign pp17_o = {{128 - 66 - 34{1'b0}}, pp_o[17], 34'b0};
  assign pp18_o = {{128 - 66 - 36{1'b0}}, pp_o[18], 36'b0};
  assign pp19_o = {{128 - 66 - 38{1'b0}}, pp_o[19], 38'b0};
  assign pp20_o = {{128 - 66 - 40{1'b0}}, pp_o[20], 40'b0};
  assign pp21_o = {{128 - 66 - 42{1'b0}}, pp_o[21], 42'b0};
  assign pp22_o = {{128 - 66 - 44{1'b0}}, pp_o[22], 44'b0};
  assign pp23_o = {{128 - 66 - 46{1'b0}}, pp_o[23], 46'b0};
  assign pp24_o = {{128 - 66 - 48{1'b0}}, pp_o[24], 48'b0};
  assign pp25_o = {{128 - 66 - 50{1'b0}}, pp_o[25], 50'b0};
  assign pp26_o = {{128 - 66 - 52{1'b0}}, pp_o[26], 52'b0};
  assign pp27_o = {{128 - 66 - 54{1'b0}}, pp_o[27], 54'b0};
  assign pp28_o = {{128 - 66 - 56{1'b0}}, pp_o[28], 56'b0};
  assign pp29_o = {{128 - 66 - 58{1'b0}}, pp_o[29], 58'b0};
  assign pp30_o = {{128 - 66 - 60{1'b0}}, pp_o[30], 60'b0};
  assign pp31_o = {{128 - 66 - 62{1'b0}}, pp_o[31], 62'b0};
  assign pp32_o = {pp_o[32][63:0], 64'b0};  // 最后一个部分积特殊处理，溢出两位


endmodule
 
module ysyx_041514_memory (

    /* from databuff */
    input rdata_buff_valid_i,  // 读缓存有效
    input [`ysyx_041514_XLEN_BUS] rdata_buff_i,  // 读缓存


    input mem_fencei_ready_buff_i,
    input mem_fencei_buff_valid_i,
    /* from ex/mem */
    input [`ysyx_041514_XLEN_BUS] pc_i,
    input [`ysyx_041514_INST_LEN-1:0] inst_data_i,
    input [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_i,
    input [`ysyx_041514_XLEN_BUS] rs2_data_i,
    input [`ysyx_041514_MEMOP_LEN-1:0] mem_op_i,  // 访存操作码
    input [`ysyx_041514_XLEN_BUS] exc_alu_data_i,
    input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_i,
    input [`ysyx_041514_XLEN_BUS] exc_csr_data_i,
    input exc_csr_valid_i,
    /* clint 接口 */
    output [`ysyx_041514_NPC_ADDR_BUS] clint_addr_o,
    output clint_valid_o,
    output clint_write_valid_o,
    output [`ysyx_041514_XLEN_BUS] clint_wdata_o,
    input [`ysyx_041514_XLEN_BUS] clint_rdata_i,
    /* dcache 接口 */
    output [`ysyx_041514_NPC_ADDR_BUS] mem_addr_o,  // 地址
    output mem_addr_valid_o,  // 地址是否有效
    output [7:0] mem_mask_o,  // 数据掩码,读取多少位
    output mem_write_valid_o,  // 1'b1,表示写;1'b0 表示读 
    output [3:0] mem_size_o,  // 数据宽度 8、4、2、1 byte
    input mem_data_ready_i,  // 读/写 数据是否准备好
    input [`ysyx_041514_XLEN_BUS] mem_rdata_i,  // 返回到读取的数据
    output [`ysyx_041514_XLEN_BUS] mem_wdata_o,  // 写入的数据
    output mem_fencei_valid_o,
    input mem_fencei_ready_i,
    /* to mem/wb */
    output [`ysyx_041514_XLEN_BUS] pc_o,
    output [`ysyx_041514_INST_LEN-1:0] inst_data_o,
    output [`ysyx_041514_XLEN_BUS] mem_data_o,  //同时送回 id 阶段（bypass）
    output [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_o,
    output [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_o,
    output [`ysyx_041514_XLEN_BUS] exc_csr_data_o,
    output exc_csr_valid_o,
    /* stall req */
    output ram_stall_valid_mem_o,  // mem 阶段访存暂停
    /* TARP 总线 */
    input [`ysyx_041514_TRAP_BUS] trap_bus_i,
    output [`ysyx_041514_TRAP_BUS] trap_bus_o
);

  assign pc_o = pc_i;
  assign inst_data_o = inst_data_i;
  assign rd_idx_o = rd_idx_i;
  assign csr_addr_o = csr_addr_i;
  assign exc_csr_data_o = exc_csr_data_i;
  assign exc_csr_valid_o = exc_csr_valid_i;


  wire [`ysyx_041514_NPC_ADDR_BUS] clint_addr;
  wire clint_valid;
  wire clint_write_valid;
  wire [`ysyx_041514_XLEN_BUS] clint_wdata;
  wire [`ysyx_041514_XLEN_BUS] clint_rdata;
  wire [`ysyx_041514_XLEN_BUS] mem_rdata;





  // wire _memop_none = (mem_op_i == `ysyx_041514_MEMOP_NONE);
  // wire _memop_lb = (mem_op_i == `ysyx_041514_MEMOP_LB);
  // wire _memop_lbu = (mem_op_i == `ysyx_041514_MEMOP_LBU);
  // wire _memop_sb = (mem_op_i == `ysyx_041514_MEMOP_SB);
  // wire _memop_lh = (mem_op_i == `ysyx_041514_MEMOP_LH);
  // wire _memop_lhu = (mem_op_i == `ysyx_041514_MEMOP_LHU);
  // wire _memop_sh = (mem_op_i == `ysyx_041514_MEMOP_SH);
  // wire _memop_lw = (mem_op_i == `ysyx_041514_MEMOP_LW);
  // wire _memop_lwu = (mem_op_i == `ysyx_041514_MEMOP_LWU);
  // wire _memop_sw = (mem_op_i == `ysyx_041514_MEMOP_SW);
  // wire _memop_ld = (mem_op_i == `ysyx_041514_MEMOP_LD);
  // wire _memop_sd = (mem_op_i == `ysyx_041514_MEMOP_SD);
  // wire _memop_fencei = (mem_op_i == `ysyx_041514_MEMOP_FENCEI);

  wire _memop_none = ~(|mem_op_i);
  wire _memop_lb = mem_op_i[`ysyx_041514_MEMOP_LB];
  wire _memop_lbu = mem_op_i[`ysyx_041514_MEMOP_LBU];
  wire _memop_sb = mem_op_i[`ysyx_041514_MEMOP_SB];
  wire _memop_lh = mem_op_i[`ysyx_041514_MEMOP_LH];
  wire _memop_lhu = mem_op_i[`ysyx_041514_MEMOP_LHU];
  wire _memop_sh = mem_op_i[`ysyx_041514_MEMOP_SH];
  wire _memop_lw = mem_op_i[`ysyx_041514_MEMOP_LW];
  wire _memop_lwu = mem_op_i[`ysyx_041514_MEMOP_LWU];
  wire _memop_sw = mem_op_i[`ysyx_041514_MEMOP_SW];
  wire _memop_ld = mem_op_i[`ysyx_041514_MEMOP_LD];
  wire _memop_sd = mem_op_i[`ysyx_041514_MEMOP_SD];
  wire _memop_fencei = mem_op_i[`ysyx_041514_MEMOP_FENCEI];

  /* fencei 指令 */
  wire mem_fencei_ready_final = (mem_fencei_buff_valid_i)?mem_fencei_ready_buff_i:mem_fencei_ready_i;
  assign mem_fencei_valid_o = _memop_fencei && (~mem_fencei_ready_final);


  /* 写入还是读取 */
  wire _isload = (_memop_lb |_memop_lbu |_memop_ld|_memop_lh|_memop_lhu|_memop_lw|_memop_lwu);
  wire _isstore = (_memop_sb | _memop_sd | _memop_sh | _memop_sw);

  /* 读取或写入的 byte */
  wire _ls1byte = _memop_lb | _memop_lbu | _memop_sb;
  wire _ls2byte = _memop_lh | _memop_lhu | _memop_sh;
  wire _ls4byte = _memop_lw | _memop_sw | _memop_lwu;
  wire _ls8byte = _memop_ld | _memop_sd;

  /* 是否进行符号扩展 */
  wire _unsigned = _memop_lhu | _memop_lbu | _memop_lwu;
  wire _signed = _memop_lh | _memop_lb | _memop_lw | _memop_ld;


  /* 为 load 指令 */
  wire _load_valid = _unsigned | _signed;

  /* 读取的数据 */
  wire [`ysyx_041514_XLEN_BUS] rdata_switch = (clint_valid) ? clint_rdata : mem_rdata;

  /* 符号扩展后的结果 TODO:改成并行编码*/
  wire [     `ysyx_041514_XLEN_BUS] _mem_signed_out = ({64{_ls1byte}}&{{`ysyx_041514_XLEN-8{rdata_switch[7]}},rdata_switch[7:0]})
                                        | ({64{_ls2byte}}&{{`ysyx_041514_XLEN-16{rdata_switch[15]}},rdata_switch[15:0]})
                                        | ({64{_ls4byte}}&{{`ysyx_041514_XLEN-32{rdata_switch[31]}},rdata_switch[31:0]})
                                        | ({64{_ls8byte}}&rdata_switch);

  /* 不进行符号扩展的结果 TODO:改成并行编码 */
  wire [     `ysyx_041514_XLEN_BUS] _mem_unsigned_out = ({64{_ls1byte}}&{{`ysyx_041514_XLEN-8{1'b0}},rdata_switch[7:0]})
                                          | ({64{_ls2byte}}&{{`ysyx_041514_XLEN-16{1'b0}},rdata_switch[15:0]})
                                          | ({64{_ls4byte}}&{{`ysyx_041514_XLEN-32{1'b0}},rdata_switch[31:0]})
                                          | ({64{_ls8byte}}&rdata_switch);

  /* 选择最终读取的数据 */
  wire [`ysyx_041514_XLEN_BUS] _mem_final_out = ({64{_signed}}&_mem_signed_out)
                                  | ({64{_unsigned}}&_mem_unsigned_out);

  /* 写入数据选择 */
  wire [`ysyx_041514_XLEN_BUS] _mem_write = ({64{_ls1byte}}&{56'b0, rs2_data_i[7:0]})  
                              | ({64{_ls2byte}}&{48'b0, rs2_data_i[15:0]}) 
                              | ({64{_ls4byte}}&{32'b0, rs2_data_i[31:0]}) 
                              | ({64{_ls8byte}}&rs2_data_i);

  /*  mask 选择, byte 选通 */
  wire [7:0] _mask = ({8{_ls1byte}}&8'b0000_0001)  
                   | ({8{_ls2byte}}&8'b0000_0011) 
                   | ({8{_ls4byte}}&8'b0000_1111) 
                   | ({8{_ls8byte}}&8'b1111_1111);

  /* 地址 */
  wire [`ysyx_041514_XLEN_BUS] _addr = (_memop_none) ? `ysyx_041514_PC_RESET_ADDR : exc_alu_data_i;
  wire [2:0] addr_last3 = _addr[2:0];

  wire [7:0] rmask = _mask;
  wire [7:0] wmask = (_mask << addr_last3);

  wire [3:0] _mem_size = {
    _ls8byte, _ls4byte, _ls2byte, _ls1byte
  };  // 全为 0 时，表示没有数据写入或读取

  // wire [7:0] _wmask = (_isstore) ? _mask : 8'b0000_0000;
  // wire [7:0] _rmask = (_isload) ? _mask : 8'b0000_0000;


  // wire [`ysyx_041514_XLEN_BUS] _raddr = _addr;
  // wire [`ysyx_041514_XLEN_BUS] _waddr = _addr;
  /***************************** clint 接口 ************************************************/
  assign clint_addr = _addr[31:0];
  assign clint_valid = (_addr[31:0] == `ysyx_041514_MTIME_ADDR) | (_addr[31:0] == `ysyx_041514_MTIMECMP_ADDR);
  assign clint_write_valid = _isstore;
  assign clint_wdata = _mem_write;
  assign clint_rdata = clint_rdata_i;

  assign clint_addr_o = clint_addr;
  assign clint_valid_o = clint_valid;
  assign clint_write_valid_o = clint_write_valid;
  assign clint_wdata_o = clint_wdata;


  /***************************** dcache 接口 ************************************************/
  // cache_line_temp <= (mem_addr_i[3]) ? {{mem_wdata_i<<{addr_last3,3'b0}}, 64'b0} : {64'b0, {mem_wdata_i<<{addr_last3,3'b0}}};
  // 1. mem store 指令,需要将 waddr,wdata,wmask 对齐
  // 2. mem load 指令,需要调整 rmask,不能与 wmask 相同
  // 3. dcache 的 mask 和 data 需要调整
  // 4. axi write strobes 和 wdata 需要调整


  assign mem_addr_o = _addr[31:0];
  assign mem_mask_o = mem_write_valid_o ? wmask : rmask;
  //assign _mem_read = (mem_data_ready_i) ? (mem_rdata_i) : `ysyx_041514_XLEN'b0;
  assign mem_rdata = (mem_data_ready_i) ? (mem_rdata_i) : `ysyx_041514_XLEN'b0;
  // 访存有效条件
  // 1. 为访存指令
  // 2. 当前周期不是读数据返回周期、写数据成功周期(避免多次访存)
  // 3. 读数据缓存无效(避免多次访存，读数据缓存有效时，直接使用读数据缓存)
  // 4. 不是读写 clint mtime 指令
  assign mem_addr_valid_o = (_isload | _isstore) & (~mem_data_ready_i) & (~rdata_buff_valid_i) & (~clint_valid);
  assign mem_write_valid_o = _isstore & (~mem_data_ready_i) & mem_addr_valid_o;
  assign mem_wdata_o = _mem_write << {addr_last3, 3'b0};  // 对齐位置调整 TODO 移位器优化
  assign mem_size_o = _mem_size;
  assign mem_data_o = ({64{~rdata_buff_valid_i & _load_valid}}&_mem_final_out) |  // 使用直接返回的读数据
      ({64{rdata_buff_valid_i & _load_valid}} & rdata_buff_i) |  // 使用读数据缓存
      ({64{_memop_none}} & exc_alu_data_i);  // 不是访存指令，直接传递 alu 结果


  /* stall_req */
  assign ram_stall_valid_mem_o = mem_addr_valid_o | mem_fencei_valid_o;





  /* trap_bus TODO:add more*/
  wire _1byte_misaligned = `ysyx_041514_FALSE & _ls1byte;
  wire _2byte_misaligned = _addr[0] & _ls2byte;
  wire _4byte_misaligned = (|_addr[1:0]) & _ls4byte;
  wire _8byte_misaligned = (|_addr[2:0]) & _ls8byte;

  wire _addr_misaligned = _1byte_misaligned|_2byte_misaligned|_4byte_misaligned|_8byte_misaligned;
  wire _load_addr_misaligned = _isload & _addr_misaligned;
  wire _store_addr_misaligned = _isstore & _addr_misaligned;

  reg [`ysyx_041514_TRAP_BUS] _mem_trap_bus;
  integer i;
  always @(*) begin
    for (i = 0; i < `ysyx_041514_TRAP_LEN; i = i + 1) begin
      if (i == `ysyx_041514_TRAP_LOAD_ADDR_MISALIGNED) begin
        _mem_trap_bus[i] = _load_addr_misaligned;
      end else if (i == `ysyx_041514_TRAP_STORE_ADDR_MISALIGNED) begin
        _mem_trap_bus[i] = _store_addr_misaligned;
      end else if (i == `ysyx_041514_TRAP_FENCEI) begin  // fencei 复用 trap 线路，实现跳转
        _mem_trap_bus[i] = mem_fencei_valid_o;
      end else begin
        _mem_trap_bus[i] = trap_bus_i[i];
      end
    end
  end
  assign trap_bus_o = _mem_trap_bus;



  /************************××××××向仿真环境传递 PC *****************************/

`ifndef ysyx_041514_YSYX_SOC
  // 用于 difftest，获取 mem_pc
  import "DPI-C" function void set_mem_pc(input longint mem_pc);
  always @(*) begin
    if (_isstore | _isload) begin
      set_mem_pc(pc_i);
    end
  end
`endif

endmodule
module ysyx_041514_sram (

    input clk,
    
    input  [  5:0] io_sram0_addr,
    input          io_sram0_cen,
    input          io_sram0_wen,
    input  [127:0] io_sram0_wmask,
    input  [127:0] io_sram0_wdata,
    output [127:0] io_sram0_rdata,

    input  [  5:0] io_sram1_addr,
    input          io_sram1_cen,
    input          io_sram1_wen,
    input  [127:0] io_sram1_wmask,
    input  [127:0] io_sram1_wdata,
    output [127:0] io_sram1_rdata,

    input  [  5:0] io_sram2_addr,
    input          io_sram2_cen,
    input          io_sram2_wen,
    input  [127:0] io_sram2_wmask,
    input  [127:0] io_sram2_wdata,
    output [127:0] io_sram2_rdata,

    input  [  5:0] io_sram3_addr,
    input          io_sram3_cen,
    input          io_sram3_wen,
    input  [127:0] io_sram3_wmask,
    input  [127:0] io_sram3_wdata,
    output [127:0] io_sram3_rdata,

    input  [  5:0] io_sram4_addr,
    input          io_sram4_cen,
    input          io_sram4_wen,
    input  [127:0] io_sram4_wmask,
    input  [127:0] io_sram4_wdata,
    output [127:0] io_sram4_rdata,

    input  [  5:0] io_sram5_addr,
    input          io_sram5_cen,
    input          io_sram5_wen,
    input  [127:0] io_sram5_wmask,
    input  [127:0] io_sram5_wdata,
    output [127:0] io_sram5_rdata,

    input  [  5:0] io_sram6_addr,
    input          io_sram6_cen,
    input          io_sram6_wen,
    input  [127:0] io_sram6_wmask,
    input  [127:0] io_sram6_wdata,
    output [127:0] io_sram6_rdata,

    input  [  5:0] io_sram7_addr,
    input          io_sram7_cen,
    input          io_sram7_wen,
    input  [127:0] io_sram7_wmask,
    input  [127:0] io_sram7_wdata,
    output [127:0] io_sram7_rdata
);

ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram0 (
    .Q       (io_sram0_rdata),
    .CLK     (clk),
    .CEN     (io_sram0_cen),
    .WEN     (io_sram0_wen),
    .BWEN    (io_sram0_wmask),
    .A       (io_sram0_addr),
    .D       (io_sram0_wdata)
);

ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram1 (
    .Q       (io_sram1_rdata),
    .CLK     (clk),
    .CEN     (io_sram1_cen),
    .WEN     (io_sram1_wen),
    .BWEN    (io_sram1_wmask),
    .A       (io_sram1_addr),
    .D       (io_sram1_wdata)
);


ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram2 (
    .Q       (io_sram2_rdata),
    .CLK     (clk),
    .CEN     (io_sram2_cen),
    .WEN     (io_sram2_wen),
    .BWEN    (io_sram2_wmask),
    .A       (io_sram2_addr),
    .D       (io_sram2_wdata)
);


ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram3 (
    .Q       (io_sram3_rdata),
    .CLK     (clk),
    .CEN     (io_sram3_cen),
    .WEN     (io_sram3_wen),
    .BWEN    (io_sram3_wmask),
    .A       (io_sram3_addr),
    .D       (io_sram3_wdata)
);


ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram4 (
    .Q       (io_sram4_rdata),
    .CLK     (clk),
    .CEN     (io_sram4_cen),
    .WEN     (io_sram4_wen),
    .BWEN    (io_sram4_wmask),
    .A       (io_sram4_addr),
    .D       (io_sram4_wdata)
);


ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram5 (
    .Q       (io_sram5_rdata),
    .CLK     (clk),
    .CEN     (io_sram5_cen),
    .WEN     (io_sram5_wen),
    .BWEN    (io_sram5_wmask),
    .A       (io_sram5_addr),
    .D       (io_sram5_wdata)
);


ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram6 (
    .Q       (io_sram6_rdata),
    .CLK     (clk),
    .CEN     (io_sram6_cen),
    .WEN     (io_sram6_wen),
    .BWEN    (io_sram6_wmask),
    .A       (io_sram6_addr),
    .D       (io_sram6_wdata)
);


ysyx_041514_S011HD1P_X32Y2D128_BW u_S011HD1P_X32Y2D128_BW_sram7 (
    .Q       (io_sram7_rdata),
    .CLK     (clk),
    .CEN     (io_sram7_cen),
    .WEN     (io_sram7_wen),
    .BWEN    (io_sram7_wmask),
    .A       (io_sram7_addr),
    .D       (io_sram7_wdata)
);

endmodule
module ysyx_041514_Vectorinvert #(
    DATA_LEN = 1
) (
    input [DATA_LEN-1:0] in,
    output reg [DATA_LEN-1:0] out
);
  integer i;
  always @(*) begin
    for (i = 0; i < DATA_LEN; i = i + 1) begin
      out[i] = in[DATA_LEN-1-i];
    end
  end

endmodule
// 触发器模板

module ysyx_041514_regTemplate #(
    WIDTH = 1,
    RESET_VAL = 0
) (
    input                  clk,
    input                  rst,
    input      [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    input                  wen
);
  always @(posedge clk) begin
    if (rst) dout <= RESET_VAL;
    else if (wen) dout <= din;
  end
endmodule

// // 使用触发器模板的示例
// module Regexample (
//   input        clk,
//   input        rst,
//   input  [3:0] in ,
//   output [3:0] out
// );
//   // 位宽为1比特, 复位值为1'b1, 写使能一直有效
//   Reg #(1,1'b1) i0 (clk,rst,in[0],out[0],1'b1);
//   // 位宽为3比特, 复位值为3'b0, 写使能为out[0]
//   Reg #(3,3'b0) i1 (clk,rst,in[3:1],out[3:1],out[0]);
// endmodule
 

/* 需要设为为input熟悉才能才仿真中改变值 */
module ysyx_041514_core (
    input clk,  //todo clock reset
    input rst,
    /* AXI4 master */
    // 写地址通道
    input io_master_awready,
    output io_master_awvalid,
    output [31:0] io_master_awaddr,
    output [3:0] io_master_awid,
    output [7:0] io_master_awlen,
    output [2:0] io_master_awsize,
    output [1:0] io_master_awburst,
    // 写数据通道
    input io_master_wready,
    output io_master_wvalid,
    output [63:0] io_master_wdata,
    output [7:0] io_master_wstrb,
    output io_master_wlast,
    // 写响应通道
    output io_master_bready,
    input io_master_bvalid,
    input [1:0] io_master_bresp,
    input [3:0] io_master_bid,
    // 读地址通道
    input io_master_arready,
    output io_master_arvalid,
    output [31:0] io_master_araddr,
    output [3:0] io_master_arid,
    output [7:0] io_master_arlen,
    output [2:0] io_master_arsize,
    output [1:0] io_master_arburst,
    // 读数据通道
    output io_master_rready,
    input io_master_rvalid,
    input [1:0] io_master_rresp,
    input [63:0] io_master_rdata,
    input io_master_rlast,
    input [3:0] io_master_rid,

    output [  5:0] io_sram0_addr,
    output         io_sram0_cen,
    output         io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input  [127:0] io_sram0_rdata,
    output [  5:0] io_sram1_addr,
    output         io_sram1_cen,
    output         io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input  [127:0] io_sram1_rdata,
    output [  5:0] io_sram2_addr,
    output         io_sram2_cen,
    output         io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input  [127:0] io_sram2_rdata,
    output [  5:0] io_sram3_addr,
    output         io_sram3_cen,
    output         io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input  [127:0] io_sram3_rdata,
    output [  5:0] io_sram4_addr,
    output         io_sram4_cen,
    output         io_sram4_wen,
    output [127:0] io_sram4_wmask,
    output [127:0] io_sram4_wdata,
    input  [127:0] io_sram4_rdata,
    output [  5:0] io_sram5_addr,
    output         io_sram5_cen,
    output         io_sram5_wen,
    output [127:0] io_sram5_wmask,
    output [127:0] io_sram5_wdata,
    input  [127:0] io_sram5_rdata,
    output [  5:0] io_sram6_addr,
    output         io_sram6_cen,
    output         io_sram6_wen,
    output [127:0] io_sram6_wmask,
    output [127:0] io_sram6_wdata,
    input  [127:0] io_sram6_rdata,
    output [  5:0] io_sram7_addr,
    output         io_sram7_cen,
    output         io_sram7_wen,
    output [127:0] io_sram7_wmask,
    output [127:0] io_sram7_wdata,
    input  [127:0] io_sram7_rdata
);
  /*×××××××××××××××××××××××××× PC 模块 用于选择吓一跳指令地址 ×××××××××××××××××××××××*/
  wire [`ysyx_041514_XLEN_BUS] inst_addr;
  wire [`ysyx_041514_NPC_ADDR_BUS] pc_next;  // 输出给 icache
  wire read_req;

  /*************************** 取指阶段 *************************************/
  wire [`ysyx_041514_XLEN_BUS] inst_addr_if;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_if;
  wire [`ysyx_041514_TRAP_BUS] trap_bus_if;

  //   wire [`ysyx_041514_XLEN_BUS] bpu_pc;  // bru pc ,来自 分支预测模块
  wire [`ysyx_041514_XLEN_BUS] bpu_pc_op1;
  wire [`ysyx_041514_XLEN_BUS] bpu_pc_op2;
  wire bpu_pc_valid;

  wire if_rdata_valid;  // 读数据是否准备好
  wire [`ysyx_041514_XLEN_BUS] if_rdata;  // 返回到读取的数据

  wire ram_stall_valid_if;
  /*************************** if/id 流水线缓存 *************************************/
  wire bpu_pc_valid_if_id;
  wire [`ysyx_041514_XLEN_BUS] inst_addr_if_id;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_if_id;
  wire [`ysyx_041514_TRAP_BUS] trap_bus_if_id;


  /*************************** decode 阶段 *************************************/

  /*通用寄存器译码结果：to id/ex */
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rs1_idx_id;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rs2_idx_id;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_id;
  wire [`ysyx_041514_XLEN_BUS] rs1_data_id;
  wire [`ysyx_041514_XLEN_BUS] rs2_data_id;
  wire [`ysyx_041514_IMM_LEN-1:0] imm_data_id;
  /* CSR 译码结果：to id/ex*/
  wire [`ysyx_041514_IMM_LEN-1:0] csr_imm_id;
  wire csr_imm_valid_id;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_idx_id;
  wire [`ysyx_041514_XLEN_BUS] csr_readdata_id;

  wire [`ysyx_041514_ALUOP_LEN-1:0] alu_op_id;  // alu 操作码
  wire [`ysyx_041514_MEMOP_LEN-1:0] mem_op_id;  // mem 操作码
  wire [`ysyx_041514_EXCOP_LEN-1:0] exc_op_id;  // exc 操作码
  // wire [         `ysyx_041514_PCOP_LEN-1:0 ] pc_op_id;  // pc 操作码
  wire [`ysyx_041514_CSROP_LEN-1:0] csr_op_id;  // csr 操作码

  wire [`ysyx_041514_XLEN_BUS] inst_addr_id;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_id;
  // 请求暂停流水线
  wire load_use_valid;
  /* TARP 总线 */
  wire [`ysyx_041514_TRAP_BUS] trap_bus_id;
  /*************************** id/ex 流水线缓存 *************************************/
  //   wire [    `ysyx_041514_REG_ADDRWIDTH-1:0 ] rs1_idx_id_ex;
  //   wire [    `ysyx_041514_REG_ADDRWIDTH-1:0 ] rs2_idx_id_ex;
  wire bpu_pc_valid_id_ex;

  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_id_ex;
  wire [`ysyx_041514_XLEN_BUS] rs1_data_id_ex;
  wire [`ysyx_041514_XLEN_BUS] rs2_data_id_ex;
  wire [`ysyx_041514_IMM_LEN-1:0] imm_data_id_ex;
  wire [`ysyx_041514_IMM_LEN-1:0] csr_imm_id_ex;
  wire csr_imm_valid_id_ex;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_idx_id_ex;
  wire [`ysyx_041514_XLEN_BUS] csr_readdata_id_ex;
  wire [`ysyx_041514_ALUOP_LEN-1:0] alu_op_id_ex;  // alu 操作码
  wire [`ysyx_041514_MEMOP_LEN-1:0] mem_op_id_ex;  // mem 操作码
  wire [`ysyx_041514_EXCOP_LEN-1:0] exc_op_id_ex;  // exc 操作码
  // wire [         `ysyx_041514_PCOP_LEN-1:0 ] pc_op_id_ex;  // pc 操作码
  wire [`ysyx_041514_CSROP_LEN-1:0] csr_op_id_ex;  // csr 操作码
  wire [`ysyx_041514_XLEN_BUS] inst_addr_id_ex;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_id_ex;
  // wire                           id_stall_req_valid_id_ex;
  wire [`ysyx_041514_TRAP_BUS] trap_bus_id_ex;
  /*************************** ex 阶段 *************************************/

  wire [`ysyx_041514_XLEN_BUS] pc_ex;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_ex;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_ex;
  //   wire [             `ysyx_041514_XLEN_BUS]  rs1_data_ex;
  wire [`ysyx_041514_XLEN_BUS] rs2_data_ex;
  //   wire [          `ysyx_041514_IMM_LEN-1:0 ] imm_data_ex;
  //   wire [             `ysyx_041514_XLEN_BUS]  csr_data_ex;
  //   wire [          `ysyx_041514_IMM_LEN-1:0 ] csr_imm_ex;
  //   wire                                       csr_imm_valid_ex;
  wire [`ysyx_041514_MEMOP_LEN-1:0] mem_op_ex;  // 访存操作码
  //   wire [         `ysyx_041514_PCOP_LEN-1:0 ] pc_op_ex;
  wire [`ysyx_041514_XLEN_BUS] exc_alu_data_ex;  // 同时送给 ID 和 EX/MEM
  wire [`ysyx_041514_XLEN_BUS] exc_csr_data_ex;
  wire exc_csr_valid_ex;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] exc_csr_addr_ex;
  //   wire [        `ysyx_041514_EXCOP_LEN-1:0 ] exc_op_ex;  // exc 操作码
  // 请求暂停流水线
  wire jump_hazard_valid;
  wire alu_mul_div_valid;
  /* TARP 总线 */
  wire [`ysyx_041514_TRAP_BUS] trap_bus_ex;


  wire [`ysyx_041514_XLEN_BUS] redirect_pc;
  wire redirect_pc_valid;
  /**********************  ex/mem 流水线间缓存 **************************/


  wire [`ysyx_041514_XLEN_BUS] pc_ex_mem;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_ex_mem;
  //   wire [             `ysyx_041514_XLEN_BUS]  imm_data_ex_mem;
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_ex_mem;
  //   wire [             `ysyx_041514_XLEN_BUS]  rs1_data_ex_mem;
  wire [`ysyx_041514_XLEN_BUS] rs2_data_ex_mem;
  wire [`ysyx_041514_XLEN_BUS] alu_data_ex_mem;
  wire [`ysyx_041514_XLEN_BUS] csr_writedata_ex_mem;
  wire csr_writevalid_ex_mem;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_ex_mem;
  //   wire [         `ysyx_041514_PCOP_LEN-1:0 ] pc_op_ex_mem;
  wire [`ysyx_041514_MEMOP_LEN-1:0] mem_op_ex_mem;
  /* TARP 总线 */
  wire [`ysyx_041514_TRAP_BUS] trap_bus_ex_mem;


  /**********************  访存阶段 **************************/


  /* to mem/wb */
  wire [`ysyx_041514_XLEN_BUS] pc_mem;
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_mem;
  wire [`ysyx_041514_XLEN_BUS] mem_data_mem;  //同时送回 id 阶段（bypass）
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_idx_mem;
  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_mem;
  wire [`ysyx_041514_XLEN_BUS] exc_csr_data_mem;
  wire exc_csr_valid_mem;

  /* clint 接口 */
  wire [`ysyx_041514_NPC_ADDR_BUS] clint_addr;
  wire clint_valid;
  wire clint_write_valid;
  wire [`ysyx_041514_XLEN_BUS] clint_wdata;
  wire [`ysyx_041514_XLEN_BUS] clint_rdata;

  /* dcache 接口 */
  wire [`ysyx_041514_NPC_ADDR_BUS] mem_addr;  // 地址
  wire mem_addr_valid;  // 地址是否有效
  wire [7:0] mem_mask;  // 数据掩码,读取多少位
  wire [`ysyx_041514_XLEN_BUS] mem_rdata;  // 返回到读取的数据
  wire [`ysyx_041514_XLEN_BUS] mem_wdata;  // 写入的数据
  wire [3:0] mem_size;  // 数据大小
  wire mem_write_valid;  // 1'b1,表示写;1'b0 表示读 
  wire mem_data_ready;  // 读/写 数据是否准备好
  wire mem_fencei_valid;
  wire mem_fencei_ready;


  /* TARP 总线 */
  wire [`ysyx_041514_TRAP_BUS] trap_bus_mem;

  wire ram_stall_valid_mem;


  /**************** 控制模块 加 中断模块 ******************/
  wire [`ysyx_041514_XLEN-1:0] csr_mstatus_writedata;
  wire [`ysyx_041514_XLEN-1:0] csr_mepc_writedata;
  wire [`ysyx_041514_XLEN-1:0] csr_mcause_writedata;
  wire [`ysyx_041514_XLEN-1:0] csr_mtval_writedata;
  //wire [`ysyx_041514_XLEN-1:0] csr_mtvec_writedata;
  wire [`ysyx_041514_XLEN-1:0] csr_mip_writedata;
  //wire [`ysyx_041514_XLEN-1:0] csr_mie_writedata;
  wire csr_mstatus_write_valid;
  wire csr_mepc_write_valid;
  wire csr_mcause_write_valid;
  wire csr_mtval_write_valid;
  //wire csr_mtvec_write_valid;
  wire csr_mip_write_valid;
  //wire csr_mie_write_valid;
  /* 输出至取指阶段 */
  wire [`ysyx_041514_XLEN-1:0] clint_pc;
  wire clint_pc_valid;
  wire clint_pc_plus4_valid;
  wire [5:0]stall_clint;  // stall request to PC,IF_ID, ID_EX, EX_MEM, MEM_WB， one bit for one stage respectively
  wire [5:0] flush_clint;


  /**********************  mem/wb 阶段 **************************/

  wire [`ysyx_041514_XLEN-1:0] csr_mstatus_writedata_mem_wb;
  wire [`ysyx_041514_XLEN-1:0] csr_mepc_writedata_mem_wb;
  wire [`ysyx_041514_XLEN-1:0] csr_mcause_writedata_mem_wb;
  wire [`ysyx_041514_XLEN-1:0] csr_mtval_writedata_mem_wb;
  //   wire [             `ysyx_041514_XLEN-1:0 ] csr_mtvec_writedata_mem_wb;
  //   wire [             `ysyx_041514_XLEN-1:0 ] csr_mie_writedata_mem_wb;
  wire [`ysyx_041514_XLEN-1:0] csr_mip_writedata_mem_wb;

  wire csr_mstatus_write_valid_mem_wb;
  wire csr_mepc_write_valid_mem_wb;
  wire csr_mcause_write_valid_mem_wb;
  wire csr_mtval_write_valid_mem_wb;
  //   wire                                       csr_mtvec_write_valid_mem_wb;
  //   wire                                       csr_mie_write_valid_mem_wb;
  wire csr_mip_write_valid_mem_wb;
  wire [`ysyx_041514_XLEN-1:0] pc_mem_wb;  //指令地址
  wire [`ysyx_041514_INST_LEN-1:0] inst_data_mem_wb;  //指令内容


  wire [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_mem_wb;  //csr 写回地址
  wire [`ysyx_041514_XLEN_BUS] exc_csr_data_mem_wb;  //csr 写回数据
  wire exc_csr_valid_mem_wb;  // csr 写回使能
  wire [`ysyx_041514_REG_ADDRWIDTH-1:0] rd_addr_mem_wb;  // gpr 写回使能
  wire [`ysyx_041514_XLEN-1:0] mem_data_mem_wb;  //访存阶段的数据



  //     input [`ysyx_041514_CSR_REG_ADDRWIDTH-1:0] csr_addr_mem_wb_i,       //csr 写回地址
  // input [             `ysyx_041514_XLEN_BUS] exc_csr_data_mem_wb_i,   //csr 写回数据
  // input                          exc_csr_valid_mem_wb_i,  // csr 写回使能
  // input [    `ysyx_041514_REG_ADDRWIDTH-1:0] rd_addr_mem_wb_i,        // gpr 写回使能
  // input [             `ysyx_041514_XLEN-1:0] mem_data_mem_wb_i,       //访存阶段的数据

  /******************** gpr 寄存器组、csr 寄存器组 ************************/

  wire [`ysyx_041514_XLEN_BUS] rs1_data_gpr;
  wire [`ysyx_041514_XLEN_BUS] rs2_data_gpr;


  /* CSR 单独引出寄存器(读) */
  wire [`ysyx_041514_XLEN-1:0] csr_mstatus_readdata_csr;
  wire [`ysyx_041514_XLEN-1:0] csr_mepc_readdata_csr;
  //   wire [`ysyx_041514_XLEN-1:0] csr_mcause_readdata_csr;
  //   wire [`ysyx_041514_XLEN-1:0] csr_mtval_readdata_csr;
  wire [`ysyx_041514_XLEN-1:0] csr_mtvec_readdata_csr;
  wire [`ysyx_041514_XLEN-1:0] csr_mie_readdata_csr;
  wire [`ysyx_041514_XLEN-1:0] csr_mip_readdata_csr;

  wire [`ysyx_041514_XLEN-1:0] csr_data_csr;



  /*****************************测试中的 cache 模块******************************/



  wire [`ysyx_041514_NPC_ADDR_BUS] ram_raddr_icache;
  wire ram_raddr_valid_icache;
  wire [7:0] ram_rmask_icache;
  wire [3:0] ram_rsize_icache;
  wire [7:0] ram_rlen_icache;
  wire ram_rdata_ready_icache;
  wire [`ysyx_041514_XLEN_BUS] ram_rdata_icache;



  /* dcache<-->mem 端口 */
  // 读端口
  wire [`ysyx_041514_NPC_ADDR_BUS] ram_raddr_dcache;
  wire ram_raddr_valid_dcache;
  wire [7:0] ram_rmask_dcache;
  wire [3:0] ram_rsize_dcache;
  wire [7:0] ram_rlen_dcache;
  wire ram_rdata_ready_dcache;
  wire [`ysyx_041514_XLEN_BUS] ram_rdata_dcache;
  // 写端口
  wire [`ysyx_041514_NPC_ADDR_BUS] ram_waddr_dcache;  // 地址
  wire ram_waddr_valid_dcache;  // 地址是否准备好
  wire [7:0] ram_wmask_dcache;  // 数据掩码,写入多少位
  wire ram_wdata_ready_dcache;  // 数据是否已经写入
  wire [`ysyx_041514_XLEN_BUS] ram_wdata_dcache;  // 写入的数据
  wire [3:0] ram_wsize_dcache;
  wire [7:0] ram_wlen_dcache;


  /***********************************测试中的 AXI4 总线接口***************************************/
  /* arb<-->axi */
  // 读通道
  wire [`ysyx_041514_NPC_ADDR_BUS] arb_read_addr;
  wire arb_raddr_valid;  // 是否发起读请求
  wire [7:0] arb_rmask;  // 数据掩码
  wire [3:0] arb_rsize;
  wire [7:0] arb_rlen;
  wire [`ysyx_041514_XLEN_BUS] arb_rdata;  // 读数据返回mem
  wire arb_rdata_ready;  // 读数据是否有效
  wire arb_rlast;
  //写通道
  wire [`ysyx_041514_NPC_ADDR_BUS] arb_write_addr;  // mem 阶段的 write
  wire arb_write_valid;
  wire [7:0] arb_wmask;
  wire [`ysyx_041514_XLEN_BUS] arb_wdata;
  wire [3:0] arb_wsize;
  wire [7:0] arb_wlen;
  wire arb_wdata_ready;  // 数据是否已经写入


  /********************** 各种数据缓存  ***********************/
  /* 乘法器数据缓存 */
  wire [`ysyx_041514_XLEN_BUS] alu_data = exc_alu_data_ex;
  wire alu_data_ready;
  wire alu_data_buff_valid;
  wire [`ysyx_041514_XLEN_BUS] alu_data_buff;


  wire rdata_buff_valid;
  wire [`ysyx_041514_XLEN_BUS] rdata_buff;

  /* fencei ready 缓存 */
  //wire  mem_fencei_ready_i,
  wire mem_fencei_ready_buff;
  wire mem_fencei_buff_valid;

  ysyx_041514_pc_reg u_pc_reg (
      .clk                   (clk),
      .rst                   (rst),
      .stall_valid_i         (stall_clint),
      .flush_valid_i         (flush_clint),
      .redirect_pc_i         (redirect_pc),
      .redirect_pc_valid_i   (redirect_pc_valid),
      .clint_pc_i            (clint_pc),              //trap pc,来自mem
      .clint_pc_valid_i      (clint_pc_valid),        //trap pc valide,来自mem
      .clint_pc_plus4_valid_o(clint_pc_plus4_valid),
      //   .bpu_pc_i              (bpu_pc),
      .bpu_pc_op1_i          (bpu_pc_op1),
      .bpu_pc_op2_i          (bpu_pc_op2),
      .bpu_pc_valid_i        (bpu_pc_valid),
      .read_req_o            (read_req),
      //.if_rdata_valid_i (if_rdata_valid),
      .pc_next_o             (pc_next),               //输出 next_pc
      .pc_o                  (inst_addr)
  );
  ysyx_041514_fetch u_fetch (
      //指令地址
      //   .rst        (rst),
      .inst_addr_i(inst_addr),  // from pc_reg

      .if_rdata_valid_i    (if_rdata_valid),      // 读数据是否准备好
      .if_rdata_i          (if_rdata),            // 返回到读取的数据
      //   .bpu_pc_o            (bpu_pc),
      .bpu_pc_op1_o        (bpu_pc_op1),
      .bpu_pc_op2_o        (bpu_pc_op2),
      .bpu_pc_valid_o      (bpu_pc_valid),
      /* stall req */
      .ram_stall_valid_if_o(ram_stall_valid_if),  // if 阶段访存暂停
      /* to if/id */
      .inst_addr_o         (inst_addr_if),
      .inst_data_o         (inst_data_if),
      .trap_bus_o          (trap_bus_if)
  );



  ysyx_041514_if_id u_if_id (
      .clk              (clk),
      .rst              (rst),
      .flush_valid_i    (flush_clint),
      .stall_valid_i    (stall_clint),
      .inst_addr_if_i   (inst_addr_if),
      .inst_data_if_i   (inst_data_if),
      .trap_bus_if_i    (trap_bus_if),
      .bru_taken_if_i   (bpu_pc_valid),
      .bru_taken_if_id_o(bpu_pc_valid_if_id),
      .inst_addr_if_id_o(inst_addr_if_id),
      .inst_data_if_id_o(inst_data_if_id),
      .trap_bus_if_id_o (trap_bus_if_id)
  );


  ysyx_041514_dcode u_dcode (
      /* from if/id */
      .inst_addr_i(inst_addr_if_id),
      .inst_data_i(inst_data_if_id),
      .trap_bus_i(trap_bus_if_id),
      /* from gpr regs */
      .rs1_data_i(rs1_data_gpr),
      .rs2_data_i(rs2_data_gpr),
      /* from csr regs */
      .csr_data_i(csr_data_csr),
      /* from id/ex stage */
      .id_ex_exc_op_i (exc_op_id_ex), // 上一条指令的类型，用于判断上一条指令是否是访存指令
      /* from exc bypass */
      .ex_rd_data_i(exc_alu_data_ex),
      .ex_rd_addr_i(rd_idx_ex),
      .ex_csr_writeaddr_i(exc_csr_addr_ex),
      .ex_csr_writedata_i(exc_csr_data_ex),
      /* from mem bypass */
      .mem_rd_data_i(mem_data_mem),
      .mem_rd_addr_i(rd_idx_mem),
      /*通用寄存器译码结果：to id/ex */
      .rs1_idx_o(rs1_idx_id),
      .rs2_idx_o(rs2_idx_id),
      .rd_idx_o(rd_idx_id),
      .rs1_data_o(rs1_data_id),
      .rs2_data_o(rs2_data_id),
      .imm_data_o(imm_data_id),
      /* CSR 译码结果：to id/ex*/
      .csr_imm_o(csr_imm_id),
      .csr_imm_valid_o(csr_imm_valid_id),
      .csr_idx_o(csr_idx_id),
      .csr_readdata_o(csr_readdata_id),
      .alu_op_o(alu_op_id),
      // alu 操作码
      .mem_op_o(mem_op_id),
      // mem 操作码
      .exc_op_o(exc_op_id),
      // exc 操作码
      // .pc_op_o(pc_op_id),
      // pc 操作码
      .csr_op_o(csr_op_id),
      // csr 操作码
      .inst_addr_o(inst_addr_id),
      .inst_data_o(inst_data_id),
      // 请求暂停流水线 to ctrl
      ._load_use_valid_o(load_use_valid),
      /* TARP 总线 */
      .trap_bus_o(trap_bus_id)
  );

  ysyx_041514_id_ex u_id_ex (
      .clk          (clk),
      .rst          (rst),
      .flush_valid_i(flush_clint),
      .stall_valid_i(stall_clint),


      .bru_taken_id_ex_i    (bpu_pc_valid_if_id),
      .bru_taken_id_ex_o    (bpu_pc_valid_id_ex),
      /* 输入 */
      .pc_id_ex_i           (inst_addr_id),
      .inst_data_id_ex_i    (inst_data_id),
      //   .rs1_idx_id_ex_i      (rs1_idx_id),
      //   .rs2_idx_id_ex_i      (rs2_idx_id),
      .rd_idx_id_ex_i       (rd_idx_id),
      .imm_data_id_ex_i     (imm_data_id),
      .csr_imm_id_ex_i      (csr_imm_id),
      .csr_imm_valid_id_ex_i(csr_imm_valid_id),
      .csr_idx_id_ex_i      (csr_idx_id),
      .rs1_data_id_ex_i     (rs1_data_id),
      .rs2_data_id_ex_i     (rs2_data_id),
      .csr_data_id_ex_i     (csr_readdata_id),
      .alu_op_id_ex_i       (alu_op_id),
      // alu 操作码
      .mem_op_id_ex_i       (mem_op_id),
      // mem 操作码
      .exc_op_id_ex_i       (exc_op_id),
      // exc 操作码
      // .pc_op_id_ex_i        (pc_op_id),
      // pc 操作码
      .csr_op_id_ex_i       (csr_op_id),
      // csr 操作码
      /* TARP 总线 */
      .trap_bus_id_ex_i     (trap_bus_id),
      /* 输出 */
      .pc_id_ex_o           (inst_addr_id_ex),
      .inst_data_id_ex_o    (inst_data_id_ex),
      //   .rs1_idx_id_ex_o      (rs1_idx_id_ex),
      //   .rs2_idx_id_ex_o      (rs2_idx_id_ex),
      .rd_idx_id_ex_o       (rd_idx_id_ex),
      .imm_data_id_ex_o     (imm_data_id_ex),
      .csr_imm_id_ex_o      (csr_imm_id_ex),
      .csr_imm_valid_id_ex_o(csr_imm_valid_id_ex),
      .csr_idx_id_ex_o      (csr_idx_id_ex),
      .rs1_data_id_ex_o     (rs1_data_id_ex),
      .rs2_data_id_ex_o     (rs2_data_id_ex),
      .csr_data_id_ex_o     (csr_readdata_id_ex),
      .alu_op_id_ex_o       (alu_op_id_ex),
      // alu 操作码
      .mem_op_id_ex_o       (mem_op_id_ex),
      // mem 操作码
      .exc_op_id_ex_o       (exc_op_id_ex),
      // exc 操作码
      // .pc_op_id_ex_o        (pc_op_id_ex),
      // pc 操作码
      .csr_op_id_ex_o       (csr_op_id_ex),
      // csr 操作码
      /* TARP 总线 */
      .trap_bus_id_ex_o     (trap_bus_id_ex)
  );


  ysyx_041514_execute_top u_execute_top (
      .clk            (clk),
      .rst            (rst),
      .bru_taken_i    (bpu_pc_valid_id_ex),
      /******************************* from id/ex *************************/
      // pc
      .pc_i           (inst_addr_id_ex),
      .inst_data_i    (inst_data_id_ex),
      // gpr 译码结果
      .rd_idx_i       (rd_idx_id_ex),
      .rs1_data_i     (rs1_data_id_ex),
      .rs2_data_i     (rs2_data_id_ex),
      .imm_data_i     (imm_data_id_ex),
      // CSR 译码结果 
      .csr_readaddr_i (csr_idx_id_ex),
      .csr_data_i     (csr_readdata_id_ex),
      .csr_imm_i      (csr_imm_id_ex),
      .csr_imm_valid_i(csr_imm_valid_id_ex),
      // 指令微码
      .alu_op_i       (alu_op_id_ex),
      // alu 操作码
      .mem_op_i       (mem_op_id_ex),
      // 访存操作码
      .exc_op_i       (exc_op_id_ex),
      // exc 操作码
      .csr_op_i       (csr_op_id_ex),
      // exc_csr 操作码
      // .pc_op_i        (pc_op_id_ex),
      /* TARP 总线 */
      .trap_bus_i     (trap_bus_id_ex),
      /********************** to ex/mem **************************/
      // pc
      .pc_o           (pc_ex),
      .inst_data_o    (inst_data_ex),
      // gpr 译码结果
      .rd_idx_o       (rd_idx_ex),
      // .rs1_data_o     (rs1_data_ex),
      .rs2_data_o     (rs2_data_ex),
      // .imm_data_o     (imm_data_ex),
      // CSR 译码结果 
      // .csr_data_o     (csr_data_ex),
      // .csr_imm_o      (csr_imm_ex),
      // .csr_imm_valid_o(csr_imm_valid_ex),
      .mem_op_o       (mem_op_ex),
      // 访存操作码
      // .pc_op_o        (pc_op_ex),
      .exc_alu_data_o (exc_alu_data_ex),
      // 同时送给 ID 和 EX/MEM
      .exc_csr_data_o (exc_csr_data_ex),
      .exc_csr_valid_o(exc_csr_valid_ex),
      .exc_csr_addr_o (exc_csr_addr_ex),
      /************************to id *************************************/
      // .exc_op_o       (exc_op_ex),
      // exc 操作码

      /********************* from data_buff *******************/
      // ALU结果缓存
      .alu_data_buff_valid_i(alu_data_buff_valid),
      .alu_data_buff_i(alu_data_buff),
      .alu_data_ready_o(alu_data_ready),

      // 请求暂停流水线
      .jump_hazard_valid_o(jump_hazard_valid),
      .alu_mul_div_valid_o(alu_mul_div_valid),
      .redirect_pc_o      (redirect_pc),
      .redirect_pc_valid_o(redirect_pc_valid),
      /* TARP 总线 */
      .trap_bus_o         (trap_bus_ex)
  );

  ysyx_041514_ex_mem u_ex_mem (
      .clk                    (clk),
      .rst                    (rst),
      .flush_valid_i          (flush_clint),
      .stall_valid_i          (stall_clint),
      .pc_ex_mem_i            (pc_ex),
      .inst_data_ex_mem_i     (inst_data_ex),
      //   .imm_data_ex_mem_i      (imm_data_ex),
      .rd_idx_ex_mem_i        (rd_idx_ex),
      //   .rs1_data_ex_mem_i      (rs1_data_ex),
      .rs2_data_ex_mem_i      (rs2_data_ex),
      .alu_data_ex_mem_i      (exc_alu_data_ex),
      .csr_writedata_ex_mem_i (exc_csr_data_ex),
      .csr_writevalid_ex_mem_i(exc_csr_valid_ex),
      .csr_addr_ex_mem_i      (exc_csr_addr_ex),
      //   .pc_op_ex_mem_i         (pc_op_ex),
      .mem_op_ex_mem_i        (mem_op_ex),
      /* TARP 总线 */
      .trap_bus_ex_mem_i      (trap_bus_ex),
      .pc_ex_mem_o            (pc_ex_mem),
      .inst_data_ex_mem_o     (inst_data_ex_mem),
      //   .imm_data_ex_mem_o      (imm_data_ex_mem),
      .rd_idx_ex_mem_o        (rd_idx_ex_mem),
      //   .rs1_data_ex_mem_o      (rs1_data_ex_mem),
      .rs2_data_ex_mem_o      (rs2_data_ex_mem),
      .alu_data_ex_mem_o      (alu_data_ex_mem),
      .csr_writedata_ex_mem_o (csr_writedata_ex_mem),
      .csr_writevalid_ex_mem_o(csr_writevalid_ex_mem),
      .csr_addr_ex_mem_o      (csr_addr_ex_mem),
      //   .pc_op_ex_mem_o         (pc_op_ex_mem),
      .mem_op_ex_mem_o        (mem_op_ex_mem),
      /* TARP 总线 */
      .trap_bus_ex_mem_o      (trap_bus_ex_mem)
  );


  ysyx_041514_memory u_memory (
      //TODO:TEST
      .rdata_buff_valid_i(rdata_buff_valid),
      .rdata_buff_i(rdata_buff),
      .mem_fencei_ready_buff_i(mem_fencei_ready_buff),
      .mem_fencei_buff_valid_i(mem_fencei_buff_valid),
      /* from ex/mem */
      .pc_i(pc_ex_mem),
      .inst_data_i(inst_data_ex_mem),
      .rd_idx_i(rd_idx_ex_mem),
      // input  [         `ysyx_041514_XLEN_BUS] rs1_data_i,
      .rs2_data_i(rs2_data_ex_mem),
      // input  [      `ysyx_041514_IMM_LEN-1:0] imm_data_i,
      .mem_op_i(mem_op_ex_mem),  // 访存操作码
      .exc_alu_data_i(alu_data_ex_mem),
      .csr_addr_i(csr_addr_ex_mem),
      .exc_csr_data_i(csr_writedata_ex_mem),
      .exc_csr_valid_i(csr_writevalid_ex_mem),
      /* clint 接口 */
      .clint_addr_o(clint_addr),
      .clint_valid_o(clint_valid),
      .clint_write_valid_o(clint_write_valid),
      .clint_wdata_o(clint_wdata),
      .clint_rdata_i(clint_rdata),
      /* dcache 接口 */
      .mem_addr_o(mem_addr),
      .mem_addr_valid_o(mem_addr_valid),
      .mem_mask_o(mem_mask),
      .mem_write_valid_o(mem_write_valid),
      .mem_data_ready_i(mem_data_ready),
      .mem_rdata_i(mem_rdata),
      .mem_wdata_o(mem_wdata),
      .mem_size_o(mem_size),  // 数据宽度 8、4、2、1 byte
      .mem_fencei_valid_o(mem_fencei_valid),
      .mem_fencei_ready_i(mem_fencei_ready),
      // TARP 总线
      .trap_bus_i(trap_bus_ex_mem),
      .ram_stall_valid_mem_o(ram_stall_valid_mem),
      /* to mem/wb */
      .pc_o(pc_mem),
      .inst_data_o(inst_data_mem),
      .mem_data_o(mem_data_mem),  // gpr写回数据，同时送回 id 阶段（bypass）
      .rd_idx_o(rd_idx_mem),  // gpr 写回地址
      .csr_addr_o(csr_addr_mem),  // csr 写回地址
      .exc_csr_data_o(exc_csr_data_mem),  // csr 写回数据
      .exc_csr_valid_o(exc_csr_valid_mem),  // 写回数据有效位
      .trap_bus_o(trap_bus_mem)  /* TARP 总线 */
  );





  ysyx_041514_clint u_clint (
      .clk(clk),
      .rst(rst),
      .pc_from_mem_i(pc_ex_mem),
      .pc_from_exe_i(pc_ex),
      .inst_data_i(inst_data_ex_mem),
      /* 各级流水线的 stall 请求 */
      .load_use_valid_id_i(load_use_valid),  //load-use data hazard from id
      .jump_valid_ex_i(jump_hazard_valid),  // branch hazard from ex
      .alu_mul_div_valid_ex_i(alu_mul_div_valid),
      .ram_stall_valid_if_i(ram_stall_valid_if),
      .ram_stall_valid_mem_i(ram_stall_valid_mem),

      /* clint 接口 */
      .clint_addr_i       (clint_addr),
      .clint_valid_i      (clint_valid),
      .clint_write_valid_i(clint_write_valid),
      .clint_wdata_i      (clint_wdata),
      .clint_rdata_o      (clint_rdata),

      /* TARP 总线 */
      .trap_bus_i(trap_bus_mem),  // 包括 取指，译码，执行，访存 阶段的 trap 请求
      /* trap 所需寄存器，来自于 csr (读)*/
      .csr_mstatus_readdata_i(csr_mstatus_readdata_csr),
      .csr_mepc_readdata_i(csr_mepc_readdata_csr),
      //   .csr_mcause_readdata_i(csr_mcause_readdata_csr),
      //   .csr_mtval_readdata_i(csr_mtval_readdata_csr),
      .csr_mtvec_readdata_i(csr_mtvec_readdata_csr),
      .csr_mie_readdata_i(csr_mie_readdata_csr),
      .csr_mip_readdata_i(csr_mip_readdata_csr),
      /* trap 所需寄存器，来自于 csr (写)*/
      .csr_mstatus_writedata_o(csr_mstatus_writedata),
      .csr_mepc_writedata_o(csr_mepc_writedata),
      .csr_mcause_writedata_o(csr_mcause_writedata),
      .csr_mtval_writedata_o(csr_mtval_writedata),
      //   .csr_mtvec_writedata_o(csr_mtvec_writedata),
      //   .csr_mie_writedata_o(csr_mie_writedata),
      .csr_mip_writedata_o(csr_mip_writedata),

      .csr_mstatus_write_valid_o(csr_mstatus_write_valid),
      .csr_mepc_write_valid_o(csr_mepc_write_valid),
      .csr_mcause_write_valid_o(csr_mcause_write_valid),
      .csr_mtval_write_valid_o(csr_mtval_write_valid),
      //   .csr_mtvec_write_valid_o(csr_mtvec_write_valid),
      //   .csr_mie_write_valid_o(csr_mie_write_valid),
      .csr_mip_write_valid_o(csr_mip_write_valid),
      /* 输出至取指阶段 */
      .clint_pc_o(clint_pc),  // trap pc
      .clint_pc_valid_o(clint_pc_valid),  // trap pc valid
      .clint_pc_plus4_valid_o(clint_pc_plus4_valid),
      .stall_o(stall_clint),
      .flush_o(flush_clint)
  );




  ysyx_041514_mem_wb u_mem_wb (
      .clk                           (clk),
      .rst                           (rst),
      .flush_valid_i                 (flush_clint),
      .stall_valid_i                 (stall_clint),
      //   // TODO:TSET
      //   .mem_data_ready_i              (mem_data_ready),
      //   .rdata_buff_valid_o            (rdata_buff_valid),
      //   .rdata_buff_o                  (rdata_buff),
      /* trap 所需寄存器，来自于 csr (写)*/
      .csr_mstatus_writedata_mem_wb_i(csr_mstatus_writedata),
      .csr_mepc_writedata_mem_wb_i   (csr_mepc_writedata),
      .csr_mcause_writedata_mem_wb_i (csr_mcause_writedata),
      .csr_mtval_writedata_mem_wb_i  (csr_mtval_writedata),
      //.csr_mtvec_writedata_mem_wb_i  (csr_mtvec_writedata),
      //.csr_mie_writedata_mem_wb_i    (csr_mie_writedata),
      .csr_mip_writedata_mem_wb_i    (csr_mip_writedata),

      .csr_mstatus_write_valid_mem_wb_i(csr_mstatus_write_valid),
      .csr_mepc_write_valid_mem_wb_i   (csr_mepc_write_valid),
      .csr_mcause_write_valid_mem_wb_i (csr_mcause_write_valid),
      .csr_mtval_write_valid_mem_wb_i  (csr_mtval_write_valid),
      //.csr_mtvec_write_valid_mem_wb_i  (csr_mtvec_write_valid),
      //.csr_mie_write_valid_mem_wb_i  (csr_mie_write_valid),
      .csr_mip_write_valid_mem_wb_i  (csr_mip_write_valid),

      .pc_mem_wb_i           (pc_mem),
      .inst_data_mem_wb_i    (inst_data_mem),
      .csr_addr_mem_wb_i     (csr_addr_mem),
      .exc_csr_data_mem_wb_i (exc_csr_data_mem),
      .exc_csr_valid_mem_wb_i(exc_csr_valid_mem),
      .rd_addr_mem_wb_i      (rd_idx_mem),
      .mem_data_mem_wb_i     (mem_data_mem),

      /* trap 所需寄存器，来自于 csr (写)*/
      .csr_mstatus_writedata_mem_wb_o(csr_mstatus_writedata_mem_wb),
      .csr_mepc_writedata_mem_wb_o(csr_mepc_writedata_mem_wb),
      .csr_mcause_writedata_mem_wb_o(csr_mcause_writedata_mem_wb),
      .csr_mtval_writedata_mem_wb_o(csr_mtval_writedata_mem_wb),
      //   .csr_mtvec_writedata_mem_wb_o(csr_mtvec_writedata_mem_wb),
      //   .csr_mie_writedata_mem_wb_o(csr_mie_writedata_mem_wb),
      .csr_mip_writedata_mem_wb_o(csr_mip_writedata_mem_wb),

      .csr_mstatus_write_valid_mem_wb_o(csr_mstatus_write_valid_mem_wb),
      .csr_mepc_write_valid_mem_wb_o(csr_mepc_write_valid_mem_wb),
      .csr_mcause_write_valid_mem_wb_o(csr_mcause_write_valid_mem_wb),
      .csr_mtval_write_valid_mem_wb_o(csr_mtval_write_valid_mem_wb),
      //   .csr_mtvec_write_valid_mem_wb_o(csr_mtvec_write_valid_mem_wb),
      //   .csr_mie_write_valid_mem_wb_o(csr_mie_write_valid_mem_wb),
      .csr_mip_write_valid_mem_wb_o(csr_mip_write_valid_mem_wb),

      .pc_mem_wb_o(pc_mem_wb),
      .inst_data_mem_wb_o(inst_data_mem_wb),
      .csr_addr_mem_wb_o(csr_addr_mem_wb),
      .exc_csr_data_mem_wb_o(exc_csr_data_mem_wb),
      .exc_csr_valid_mem_wb_o(exc_csr_valid_mem_wb),
      .rd_addr_mem_wb_o(rd_addr_mem_wb),
      .mem_data_mem_wb_o(mem_data_mem_wb)

  );



  /***************************写回阶段***********************************/
`ifndef ysyx_041514_YSYX_SOC
  ysyx_041514_writeback u_writeback (
      .clk           (clk),
      //   .rst           (rst),
      .pc_wb_i       (pc_mem_wb),
      .inst_data_wb_i(inst_data_mem_wb)

  );
`endif



  ysyx_041514_rv64_gpr_regfile u_rv64_gpr_regfile (
      .clk               (clk),
      .rst               (rst),
      /* 读取数据 */
      .rs1_idx_i         (rs1_idx_id),
      .rs2_idx_i         (rs2_idx_id),
      .rs1_data_o        (rs1_data_gpr),
      .rs2_data_o        (rs2_data_gpr),     //TODO 添加 valid 信号
      /* 写数据 */
      .write_idx_i       (rd_addr_mem_wb),
      .write_data_i      (mem_data_mem_wb),
      .write_data_valid_i(1'b1)
  );




  ysyx_041514_rv64_csr_regfile u_rv64_csr_regfile (
      .clk                    (clk),
      .rst                    (rst),
      /* 单独引出寄存器(写) */
      .csr_mstatus_writedata_i(csr_mstatus_writedata_mem_wb),
      .csr_mepc_writedata_i   (csr_mepc_writedata_mem_wb),
      .csr_mcause_writedata_i (csr_mcause_writedata_mem_wb),
      .csr_mtval_writedata_i  (csr_mtval_writedata_mem_wb),
      //   .csr_mtvec_writedata_i  (csr_mtvec_writedata_mem_wb),
      //   .csr_mie_writedata_i    (csr_mie_writedata_mem_wb),
      .csr_mip_writedata_i    (csr_mip_writedata_mem_wb),

      .csr_mstatus_write_valid_i(csr_mstatus_write_valid_mem_wb),
      .csr_mepc_write_valid_i   (csr_mepc_write_valid_mem_wb),
      .csr_mcause_write_valid_i (csr_mcause_write_valid_mem_wb),
      .csr_mtval_write_valid_i  (csr_mtval_write_valid_mem_wb),
      //   .csr_mtvec_write_valid_i  (csr_mtvec_write_valid_mem_wb),
      //   .csr_mie_write_valid_i    (csr_mie_write_valid_mem_wb),
      .csr_mip_write_valid_i    (csr_mip_write_valid_mem_wb),
      /* 单独引出寄存器(读) */
      .csr_mstatus_readdata_o   (csr_mstatus_readdata_csr),
      .csr_mepc_readdata_o      (csr_mepc_readdata_csr),
      //   .csr_mcause_readdata_o    (csr_mcause_readdata_csr),
      //   .csr_mtval_readdata_o     (csr_mtval_readdata_csr),
      .csr_mtvec_readdata_o     (csr_mtvec_readdata_csr),
      .csr_mie_readdata_o       (csr_mie_readdata_csr),
      .csr_mip_readdata_o       (csr_mip_readdata_csr),
      /* 读取数据端口 */
      .csr_readaddr_i           (csr_idx_id),
      .csr_readdata_o           (csr_data_csr),                    //TODO 添加 valid
      /* 写入数据端口 */
      .csr_writeaddr_i          (csr_addr_mem_wb),
      .csr_write_valid_i        (exc_csr_valid_mem_wb),
      .csr_writedata_i          (exc_csr_data_mem_wb)
  );




  ysyx_041514_icache_top u_icache_top (
      .clk(clk),
      .rst(rst),
      /* cpu<-->cache 端口 */
      .preif_raddr_i(pc_next[31:0]),  // CPU 的访存信息 
      .preif_raddr_valid_i(read_req),  // 地址是否有效，无效时，停止访问 cache
      .if_rdata_o(if_rdata),  // icache 返回读数据
      .if_rdata_valid_o          (if_rdata_valid),// icache 读数据是否准备好(未准备好需要暂停流水线)
      .mem_fencei_valid_i(mem_fencei_valid),
      /* cache<-->mem 端口 */
      .ram_raddr_icache_o(ram_raddr_icache),
      .ram_raddr_valid_icache_o(ram_raddr_valid_icache),
      .ram_rmask_icache_o(ram_rmask_icache),
      .ram_rsize_icache_o(ram_rsize_icache),
      .ram_rlen_icache_o(ram_rlen_icache),
      .ram_rdata_ready_icache_i(ram_rdata_ready_icache),
      .ram_rdata_icache_i(ram_rdata_icache),
      /* sram */
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




  ysyx_041514_dcache_top u_dcache_top (
      .clk(clk),
      .rst(rst),
      .mem_fencei_valid_i(mem_fencei_valid),
      .mem_fencei_ready_o(mem_fencei_ready),
      /* cpu<-->cache 端口 */
      .mem_addr_i(mem_addr),  // CPU 的访存信息 
      .mem_mask_i(mem_mask),  // 访存掩码
      .mem_addr_valid_i  (mem_addr_valid),    // 地址是否有效，无效时，���止访问 cache
      .mem_write_valid_i(mem_write_valid),  // 1'b1,表示写;1'b0 表示读 
      .mem_wdata_i(mem_wdata),  // 写数据
      .mem_rdata_o(mem_rdata),  // dcache 返回读数据
      .mem_data_ready_o(mem_data_ready),
      .mem_size_i(mem_size),
      // dcache 读数据是否准备好(未准备好需要暂停流水线)

      /* cache<-->mem 端口 */
      // 读端口
      .ram_raddr_dcache_o(ram_raddr_dcache),
      .ram_raddr_valid_dcache_o(ram_raddr_valid_dcache),
      .ram_rmask_dcache_o(ram_rmask_dcache),
      .ram_rdata_ready_dcache_i(ram_rdata_ready_dcache),
      .ram_rdata_dcache_i(ram_rdata_dcache),
      .ram_rsize_dcache_o(ram_rsize_dcache),
      .ram_rlen_dcache_o(ram_rlen_dcache),
      // 写端口
      .ram_waddr_dcache_o(ram_waddr_dcache),  // 地址
      .ram_waddr_valid_dcache_o(ram_waddr_valid_dcache),  // 地址是否准备好
      .ram_wmask_dcache_o(ram_wmask_dcache),  // 数据掩码,写入多少位
      .ram_wsize_dcache_o(ram_wsize_dcache),
      .ram_wlen_dcache_o(ram_wlen_dcache),
      .ram_wdata_ready_dcache_i(ram_wdata_ready_dcache),// 数据是否已经写入// 写入的数据
      .ram_wdata_dcache_o(ram_wdata_dcache),

      /* sram */
      .io_sram0_addr (io_sram0_addr),
      .io_sram0_cen  (io_sram0_cen),
      .io_sram0_wen  (io_sram0_wen),
      .io_sram0_wmask(io_sram0_wmask),
      .io_sram0_wdata(io_sram0_wdata),
      .io_sram0_rdata(io_sram0_rdata),
      .io_sram1_addr (io_sram1_addr),
      .io_sram1_cen  (io_sram1_cen),
      .io_sram1_wen  (io_sram1_wen),
      .io_sram1_wmask(io_sram1_wmask),
      .io_sram1_wdata(io_sram1_wdata),
      .io_sram1_rdata(io_sram1_rdata),
      .io_sram2_addr (io_sram2_addr),
      .io_sram2_cen  (io_sram2_cen),
      .io_sram2_wen  (io_sram2_wen),
      .io_sram2_wmask(io_sram2_wmask),
      .io_sram2_wdata(io_sram2_wdata),
      .io_sram2_rdata(io_sram2_rdata),
      .io_sram3_addr (io_sram3_addr),
      .io_sram3_cen  (io_sram3_cen),
      .io_sram3_wen  (io_sram3_wen),
      .io_sram3_wmask(io_sram3_wmask),
      .io_sram3_wdata(io_sram3_wdata),
      .io_sram3_rdata(io_sram3_rdata)
  );



  ysyx_041514_axi_arb u_axi_arb (
      .clk(clk),
      .rst(rst),

      /* if 访存请求端口（读）*/
      .if_read_addr_i(ram_raddr_icache),  // if 阶段的 read
      .if_raddr_valid_i(ram_raddr_valid_icache),  // 是否发起读请求
      .if_rmask_i(ram_rmask_icache),  // 数据掩码
      .if_rsize_i(ram_rsize_icache),
      .if_rlen_i(ram_rlen_icache),
      .if_rdata_o(ram_rdata_icache),  // 读数据返回mem
      .if_rdata_ready_o (ram_rdata_ready_icache),// 读数据是否有效// mem 访存请求端口（读）
      /* mem 访存请求端口（读）*/
      .mem_read_addr_i(ram_raddr_dcache),
      .mem_raddr_valid_i(ram_raddr_valid_dcache),
      .mem_rmask_i(ram_rmask_dcache),
      .mem_rsize_i(ram_rsize_dcache),
      .mem_rlen_i(ram_rlen_dcache),
      .mem_rdata_o(ram_rdata_dcache),
      .mem_rdata_ready_o(ram_rdata_ready_dcache),
      /* mem 访存接口（写）*/
      .mem_write_addr_i(ram_waddr_dcache),  // mem 阶段的 write
      .mem_write_valid_i(ram_waddr_valid_dcache),
      .mem_wmask_i(ram_wmask_dcache),
      .mem_wdata_i(ram_wdata_dcache),
      .mem_wsize_i(ram_wsize_dcache),
      .mem_wlen_i(ram_wlen_dcache),
      .mem_wdata_ready_o(ram_wdata_ready_dcache),  // 数据是否已经写入

      /* arb<-->axi */
      // 读通道
      .arb_read_addr_o  (arb_read_addr),
      .arb_raddr_valid_o(arb_raddr_valid),  // 是否发起读请求
      .arb_rmask_o      (arb_rmask),        // 数据掩码
      .arb_rsize_o      (arb_rsize),
      .arb_rlen_o       (arb_rlen),
      .arb_rdata_i      (arb_rdata),        // 读数据返回mem
      .arb_rdata_ready_i(arb_rdata_ready),  // 读数据是否有效
      .arb_rlast_i      (arb_rlast),
      //写通道
      .arb_write_addr_o (arb_write_addr),   // mem 阶段的 write
      .arb_write_valid_o(arb_write_valid),
      .arb_wmask_o      (arb_wmask),
      .arb_wdata_o      (arb_wdata),        // 数据是否已经写入
      .arb_wsize_o      (arb_wsize),
      .arb_wlen_o       (arb_wlen),
      .arb_wdata_ready_i(arb_wdata_ready)
  );


  /* 未使用到的信号 */
  wire [2:0] io_master_awprot;
  wire io_master_awuser;
  wire io_master_awlock;
  wire [3:0] io_master_awcache;
  wire [3:0] io_master_awqos;
  wire [3:0] io_master_awregion;
  wire io_master_wuser;
  wire io_master_buser = 0;
  wire [2:0] io_master_arprot;
  wire io_master_aruser;
  wire io_master_arlock;
  wire [3:0] io_master_arcache;
  wire [3:0] io_master_arqos;
  wire [3:0] io_master_arregion;
  wire io_master_ruser = 0;

  ysyx_041514_axi_rw #(
      .RW_DATA_WIDTH (64),
      .RW_ADDR_WIDTH (32),
      .AXI_DATA_WIDTH(64),
      .AXI_ADDR_WIDTH(32),
      .AXI_ID_WIDTH  (4),
      .AXI_STRB_WIDTH(8),
      .AXI_USER_WIDTH(1)
  ) u_axi_rw (
      .clock            (clk),
      .reset            (rst),
      /* arb<-->axi */
      // 读通道
      .arb_read_addr_i  (arb_read_addr),
      .arb_raddr_valid_i(arb_raddr_valid),  // 是否发起读请求
      .arb_rmask_i      (arb_rmask),        // 数据掩码
      .arb_rsize_i      (arb_rsize),
      .arb_rlen_i       (arb_rlen),
      .arb_rdata_o      (arb_rdata),        // 读数据返回mem
      .arb_rdata_ready_o(arb_rdata_ready),  // 读数据是否有效//写通道
      .arb_rlast_o      (arb_rlast),
      // 写通道
      .arb_write_addr_i (arb_write_addr),   // mem 阶段的 write
      .arb_write_valid_i(arb_write_valid),
      .arb_wmask_i      (arb_wmask),
      .arb_wdata_i      (arb_wdata),
      .arb_wsize_i      (arb_wsize),
      .arb_wlen_i       (arb_wlen),
      .arb_wdata_ready_o(arb_wdata_ready),  // 数据是否已经写���

      /* axi master */
      // Advanced eXtensible Interface
      // 写地址
      .axi_aw_ready_i (io_master_awready),
      .axi_aw_valid_o (io_master_awvalid),
      .axi_aw_addr_o  (io_master_awaddr),
      .axi_aw_prot_o  (io_master_awprot),
      .axi_aw_id_o    (io_master_awid),
      .axi_aw_user_o  (io_master_awuser),
      .axi_aw_len_o   (io_master_awlen),
      .axi_aw_size_o  (io_master_awsize),
      .axi_aw_burst_o (io_master_awburst),
      .axi_aw_lock_o  (io_master_awlock),
      .axi_aw_cache_o (io_master_awcache),
      .axi_aw_qos_o   (io_master_awqos),
      .axi_aw_region_o(io_master_awregion),
      //写数据
      .axi_w_ready_i  (io_master_wready),
      .axi_w_valid_o  (io_master_wvalid),
      .axi_w_data_o   (io_master_wdata),
      .axi_w_strb_o   (io_master_wstrb),
      .axi_w_last_o   (io_master_wlast),
      .axi_w_user_o   (io_master_wuser),
      //写响应
      .axi_b_ready_o  (io_master_bready),
      .axi_b_valid_i  (io_master_bvalid),
      .axi_b_resp_i   (io_master_bresp),
      .axi_b_id_i     (io_master_bid),
      .axi_b_user_i   (io_master_buser),
      //读地址
      .axi_ar_ready_i (io_master_arready),
      .axi_ar_valid_o (io_master_arvalid),
      .axi_ar_addr_o  (io_master_araddr),
      .axi_ar_prot_o  (io_master_arprot),
      .axi_ar_id_o    (io_master_arid),
      .axi_ar_user_o  (io_master_aruser),
      .axi_ar_len_o   (io_master_arlen),
      .axi_ar_size_o  (io_master_arsize),
      .axi_ar_burst_o (io_master_arburst),
      .axi_ar_lock_o  (io_master_arlock),
      .axi_ar_cache_o (io_master_arcache),
      .axi_ar_qos_o   (io_master_arqos),
      .axi_ar_region_o(io_master_arregion),
      //读数据
      .axi_r_ready_o  (io_master_rready),
      .axi_r_valid_i  (io_master_rvalid),
      .axi_r_resp_i   (io_master_rresp),
      .axi_r_data_i   (io_master_rdata),
      .axi_r_last_i   (io_master_rlast),
      .axi_r_id_i     (io_master_rid),
      .axi_r_user_i   (io_master_ruser)
  );


  ysyx_041514_data_buff u_data_buff (
      .clk                    (clk),
      .rst                    (rst),
      .flush_i                (flush_clint),
      .stall_i                (stall_clint),
      /* 乘法器数据缓存 */
      .alu_data_i             (alu_data),
      .alu_data_ready_i       (alu_data_ready),
      .alu_data_buff_valid_o  (alu_data_buff_valid),
      .alu_data_buff_o        (alu_data_buff),
      /* fencei ready 缓存 */
      .mem_fencei_ready_i     (mem_fencei_ready),
      .mem_fencei_ready_buff_o(mem_fencei_ready_buff),
      .mem_fencei_buff_valid_o(mem_fencei_buff_valid),
      /* mem load 数据缓存 */
      .mem_data_mem_i         (mem_data_mem),
      .mem_data_ready_i       (mem_data_ready),
      .rdata_buff_valid_o     (rdata_buff_valid),
      .rdata_buff_o           (rdata_buff)
  );




`ifndef ysyx_041514_YSYX_SOC

  wire jump_inst = exc_op_id_ex[`ysyx_041514_EXCOP_BRANCH]
               | exc_op_id_ex[`ysyx_041514_EXCOP_JAL]
               | exc_op_id_ex[`ysyx_041514_EXCOP_JALR];

  wire bpu_seccess = (~redirect_pc_valid);  // 分支预测成功

  wire exc_go_ready = (~flush_clint[`ysyx_041514_CTRLBUS_EX_MEM])
                  & (~stall_clint[`ysyx_041514_CTRLBUS_EX_MEM]);

  import "DPI-C" function void bpu_count(input bit bpu_ret);
  // 1. 用于分支预测准确率
  // 2. exc 阶段为跳转指令，且 exc/mem 正常流通时，计算一次
  always @(posedge clk) begin
    if (jump_inst & exc_go_ready) begin
      bpu_count(bpu_seccess);
    end
  end
`endif




endmodule




module ysyx_041514 (
  input          clock,
  input          reset,
  input          io_master_arready,
  output         io_master_arvalid,
  output [31:0]  io_master_araddr,
  output [3:0]   io_master_arid,
  output [7:0]   io_master_arlen,
  output [2:0]   io_master_arsize,
  output [1:0]   io_master_arburst,
  output         io_master_rready,
  input          io_master_rvalid,
  input  [1:0]   io_master_rresp,
  input  [63:0]  io_master_rdata,
  input          io_master_rlast,
  input  [3:0]   io_master_rid,
  input          io_master_awready,
  output         io_master_awvalid,
  output [31:0]  io_master_awaddr,
  output [3:0]   io_master_awid,
  output [7:0]   io_master_awlen,
  output [2:0]   io_master_awsize,
  output [1:0]   io_master_awburst,
  input          io_master_wready,
  output         io_master_wvalid,
  output [63:0]  io_master_wdata,
  output [7:0]   io_master_wstrb,
  output         io_master_wlast,
  output         io_master_bready,
  input          io_master_bvalid,
  input  [1:0]   io_master_bresp,
  input  [3:0]   io_master_bid,
  output         io_slave_arready,
  input          io_slave_arvalid,
  input  [31:0]  io_slave_araddr,
  input  [3:0]   io_slave_arid,
  input  [7:0]   io_slave_arlen,
  input  [2:0]   io_slave_arsize,
  input  [1:0]   io_slave_arburst,
  input          io_slave_rready,
  output         io_slave_rvalid,
  output [1:0]   io_slave_rresp,
  output [63:0]  io_slave_rdata,
  output         io_slave_rlast,
  output [3:0]   io_slave_rid,
  output         io_slave_awready,
  input          io_slave_awvalid,
  input  [31:0]  io_slave_awaddr,
  input  [3:0]   io_slave_awid,
  input  [7:0]   io_slave_awlen,
  input  [2:0]   io_slave_awsize,
  input  [1:0]   io_slave_awburst,
  output         io_slave_wready,
  input          io_slave_wvalid,
  input  [63:0]  io_slave_wdata,
  input  [7:0]   io_slave_wstrb,
  input          io_slave_wlast,
  input          io_slave_bready,
  output         io_slave_bvalid,
  output [1:0]   io_slave_bresp,
  output [3:0]   io_slave_bid,
  input          io_interrupt,
  output [5:0]   io_sram0_addr,
  output         io_sram0_cen,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output [5:0]   io_sram1_addr,
  output         io_sram1_cen,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]   io_sram2_addr,
  output         io_sram2_cen,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]   io_sram3_addr,
  output         io_sram3_cen,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata,
  output [5:0]   io_sram4_addr,
  output         io_sram4_cen,
  output         io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,
  output [5:0]   io_sram5_addr,
  output         io_sram5_cen,
  output         io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,
  output [5:0]   io_sram6_addr,
  output         io_sram6_cen,
  output         io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,
  output [5:0]   io_sram7_addr,
  output         io_sram7_cen,
  output         io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
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





  ysyx_041514_core u_ysyx_041514_core (
      .clk              (clock),              //todo clock reset
      .rst              (reset),
      /* AXI4 master */
      // 写地址通道
      .io_master_awready(io_master_awready),
      .io_master_awvalid(io_master_awvalid),
      .io_master_awaddr (io_master_awaddr),
      .io_master_awid   (io_master_awid),
      .io_master_awlen  (io_master_awlen),
      .io_master_awsize (io_master_awsize),
      .io_master_awburst(io_master_awburst),
      // 写数据通道
      .io_master_wready (io_master_wready),
      .io_master_wvalid (io_master_wvalid),
      .io_master_wdata  (io_master_wdata),
      .io_master_wstrb  (io_master_wstrb),
      .io_master_wlast  (io_master_wlast),
      // 写响应通道
      .io_master_bready (io_master_bready),
      .io_master_bvalid (io_master_bvalid),
      .io_master_bresp  (io_master_bresp),
      .io_master_bid    (io_master_bid),
      // 读地址通道
      .io_master_arready(io_master_arready),
      .io_master_arvalid(io_master_arvalid),
      .io_master_araddr (io_master_araddr),
      .io_master_arid   (io_master_arid),
      .io_master_arlen  (io_master_arlen),
      .io_master_arsize (io_master_arsize),
      .io_master_arburst(io_master_arburst),
      // 读数据通道
      .io_master_rready (io_master_rready),
      .io_master_rvalid (io_master_rvalid),
      .io_master_rresp  (io_master_rresp),
      .io_master_rdata  (io_master_rdata),
      .io_master_rlast  (io_master_rlast),
      .io_master_rid    (io_master_rid),
      .io_sram0_addr    (io_sram0_addr),
      .io_sram0_cen     (io_sram0_cen),
      .io_sram0_wen     (io_sram0_wen),
      .io_sram0_wmask   (io_sram0_wmask),
      .io_sram0_wdata   (io_sram0_wdata),
      .io_sram0_rdata   (io_sram0_rdata),
      .io_sram1_addr    (io_sram1_addr),
      .io_sram1_cen     (io_sram1_cen),
      .io_sram1_wen     (io_sram1_wen),
      .io_sram1_wmask   (io_sram1_wmask),
      .io_sram1_wdata   (io_sram1_wdata),
      .io_sram1_rdata   (io_sram1_rdata),
      .io_sram2_addr    (io_sram2_addr),
      .io_sram2_cen     (io_sram2_cen),
      .io_sram2_wen     (io_sram2_wen),
      .io_sram2_wmask   (io_sram2_wmask),
      .io_sram2_wdata   (io_sram2_wdata),
      .io_sram2_rdata   (io_sram2_rdata),
      .io_sram3_addr    (io_sram3_addr),
      .io_sram3_cen     (io_sram3_cen),
      .io_sram3_wen     (io_sram3_wen),
      .io_sram3_wmask   (io_sram3_wmask),
      .io_sram3_wdata   (io_sram3_wdata),
      .io_sram3_rdata   (io_sram3_rdata),
      .io_sram4_addr    (io_sram4_addr),
      .io_sram4_cen     (io_sram4_cen),
      .io_sram4_wen     (io_sram4_wen),
      .io_sram4_wmask   (io_sram4_wmask),
      .io_sram4_wdata   (io_sram4_wdata),
      .io_sram4_rdata   (io_sram4_rdata),
      .io_sram5_addr    (io_sram5_addr),
      .io_sram5_cen     (io_sram5_cen),
      .io_sram5_wen     (io_sram5_wen),
      .io_sram5_wmask   (io_sram5_wmask),
      .io_sram5_wdata   (io_sram5_wdata),
      .io_sram5_rdata   (io_sram5_rdata),
      .io_sram6_addr    (io_sram6_addr),
      .io_sram6_cen     (io_sram6_cen),
      .io_sram6_wen     (io_sram6_wen),
      .io_sram6_wmask   (io_sram6_wmask),
      .io_sram6_wdata   (io_sram6_wdata),
      .io_sram6_rdata   (io_sram6_rdata),
      .io_sram7_addr    (io_sram7_addr),
      .io_sram7_cen     (io_sram7_cen),
      .io_sram7_wen     (io_sram7_wen),
      .io_sram7_wmask   (io_sram7_wmask),
      .io_sram7_wdata   (io_sram7_wdata),
      .io_sram7_rdata   (io_sram7_rdata)
  );

endmodule

