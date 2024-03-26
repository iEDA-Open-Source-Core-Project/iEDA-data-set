//opcode
`define ysyx_041461_RV32_R 7'b0110011
`define ysyx_041461_RV64_R 7'b0111011
`define ysyx_041461_RV32_I 7'b0010011
`define ysyx_041461_RV64_I 7'b0011011
`define ysyx_041461_Stores 7'b0100011
`define ysyx_041461_Loads 7'b0000011
`define ysyx_041461_Branches 7'b1100011
`define ysyx_041461_Jal 7'b1101111
`define ysyx_041461_Jalr 7'b1100111
`define ysyx_041461_Lui 7'b0110111
`define ysyx_041461_Auipc 7'b0010111
`define ysyx_041461_Privileged 7'b1110011
`define ysyx_041461_FENCE 7'b0001111

//{funct7, funct3} RV32_R
`define ysyx_041461_SLL 10'b0000000_001
`define ysyx_041461_SRL 10'b0000000_101
`define ysyx_041461_SRA 10'b0100000_101
`define ysyx_041461_ADD 10'b0000000_000
`define ysyx_041461_SUB 10'b0100000_000
`define ysyx_041461_XOR 10'b0000000_100
`define ysyx_041461_OR 10'b0000000_110
`define ysyx_041461_AND 10'b0000000_111
`define ysyx_041461_SLT 10'b0000000_010
`define ysyx_041461_SLTU 10'b0000000_011
`define ysyx_041461_MUL 10'b0000001_000
`define ysyx_041461_MULH 10'b0000001_001
`define ysyx_041461_MULHSU 10'b0000001_010
`define ysyx_041461_MULHU 10'b0000001_011
`define ysyx_041461_DIV 10'b0000001_100
`define ysyx_041461_DIVU 10'b0000001_101
`define ysyx_041461_REM 10'b0000001_110
`define ysyx_041461_REMU 10'b0000001_111

//{funct7, funct3} RV64_R
`define ysyx_041461_SLLW 10'b0000000_001
`define ysyx_041461_SRLW 10'b0000000_101
`define ysyx_041461_SRAW 10'b0100000_101
`define ysyx_041461_ADDW 10'b0000000_000
`define ysyx_041461_SUBW 10'b0100000_000
`define ysyx_041461_MULW 10'b0000001_000
`define ysyx_041461_DIVW 10'b0000001_100
`define ysyx_041461_DIVUW 10'b0000001_101
`define ysyx_041461_REMW 10'b0000001_110
`define ysyx_041461_REMUW 10'b0000001_111

//funct3 RV32_I
`define ysyx_041461_FUN3_SLLI 3'b001
`define ysyx_041461_FUN3_SRI 3'b101
`define ysyx_041461_ADDI 3'b000
`define ysyx_041461_XORI 3'b100
`define ysyx_041461_ORI 3'b110
`define ysyx_041461_ANDI 3'b111
`define ysyx_041461_SLTI 3'b010
`define ysyx_041461_SLTIU 3'b011

//funct6 RV32_I
`define ysyx_041461_FUN6_SLLI 6'b000000
`define ysyx_041461_FUN6_SRLI 6'b000000
`define ysyx_041461_FUN6_SRAI 6'b010000

//funct3ysyx_041461_ RV64_I
`define ysyx_041461_FUN3_SLLIW 3'b001
`define ysyx_041461_FUN3_SRIW 3'b101
`define ysyx_041461_ADDIW 3'b000

//funct6 RV64_I
`define ysyx_041461_FUN6_SLLIW 6'b000000
`define ysyx_041461_FUN6_SRLIW 6'b000000
`define ysyx_041461_FUN6_SRAIW 6'b010000

//funct3 Stores
`define ysyx_041461_SB 3'b000
`define ysyx_041461_SH 3'b001
`define ysyx_041461_SW 3'b010
`define ysyx_041461_SD 3'b011

//funct3 Loads
`define ysyx_041461_LB 3'b000
`define ysyx_041461_LH 3'b001
`define ysyx_041461_LBU 3'b100
`define ysyx_041461_LHU 3'b101
`define ysyx_041461_LW 3'b010
`define ysyx_041461_LWU 3'b110
`define ysyx_041461_LD 3'b011

//funct3 Branches
`define ysyx_041461_BEQ 3'b000
`define ysyx_041461_BNE 3'b001
`define ysyx_041461_BLT 3'b100
`define ysyx_041461_BGE 3'b101
`define ysyx_041461_BLTU 3'b110
`define ysyx_041461_BGEU 3'b111

//funct3 Jalr
`define ysyx_041461_JALR 3'b000

//funct3 Zicsr
`define ysyx_041461_CSRRW 3'b001
`define ysyx_041461_CSRRS 3'b010
`define ysyx_041461_CSRRC 3'b011
`define ysyx_041461_CSRRWI 3'b101
`define ysyx_041461_CSRRSI 3'b110
`define ysyx_041461_CSRRCI 3'b111

`define ysyx_041461_ECALL 25'b00000_00000_00000_00000_00000
`define ysyx_041461_MRET 25'b0011000_00010_00000_000_00000
`define ysyx_041461_EBREAK 25'b0000000_00001_00000_000_00000
`define ysyx_041461_FENCE_I 25'b0000000_00000_00000_001_00000

//ID_TYPE
`define ysyx_041461_TYPE_NOP 3'b000
`define ysyx_041461_TYPE_BRANCHES 3'b001
`define ysyx_041461_TYPE_JAL 3'b010
`define ysyx_041461_TYPE_JALR 3'b011
`define ysyx_041461_TYPE_FENCE_I 3'b100


//EXE_ctrl
`define ysyx_041461_EXE_NOP 5'b00000
`define ysyx_041461_EXE_SLL 5'b00001
`define ysyx_041461_EXE_SRL 5'b00010
`define ysyx_041461_EXE_SRA 5'b00011
`define ysyx_041461_EXE_ADD 5'b00100
`define ysyx_041461_EXE_SUB 5'b00101
`define ysyx_041461_EXE_XOR 5'b00110
`define ysyx_041461_EXE_OR 5'b00111
`define ysyx_041461_EXE_AND 5'b01000
`define ysyx_041461_EXE_SLT 5'b01001
`define ysyx_041461_EXE_SLTU 5'b01010
`define ysyx_041461_EXE_MUL 5'b01011
`define ysyx_041461_EXE_MULH 5'b01100
`define ysyx_041461_EXE_MULHSU 5'b01101
`define ysyx_041461_EXE_MULHU 5'b01110
`define ysyx_041461_EXE_DIV 5'b01111
`define ysyx_041461_EXE_DIVU 5'b10000
`define ysyx_041461_EXE_REM 5'b10001
`define ysyx_041461_EXE_REMU 5'b10010
`define ysyx_041461_EXE_SLLW 5'b10011
`define ysyx_041461_EXE_SRLW 5'b10100
`define ysyx_041461_EXE_SRAW 5'b10101
`define ysyx_041461_EXE_ADDW 5'b10110
`define ysyx_041461_EXE_SUBW 5'b10111
`define ysyx_041461_EXE_MULW 5'b11000
`define ysyx_041461_EXE_DIVW 5'b11001
`define ysyx_041461_EXE_DIVUW 5'b11010
`define ysyx_041461_EXE_REMW  5'b11011
`define ysyx_041461_EXE_REMUW 5'b11100

//EXE_src
`define ysyx_041461_EXE_src_NOP 3'b000
`define ysyx_041461_EXE_R_R 3'b001
`define ysyx_041461_EXE_R_I 3'b010
`define ysyx_041461_EXE_PC_I 3'b011
`define ysyx_041461_EXE_R_CSR 3'b100
`define ysyx_041461_EXE_NOTR_CSR 3'b101
`define ysyx_041461_EXE_CSR_ZIMM 3'b110
`define ysyx_041461_EXE_CSR_NOTZIMM 3'b111

//MUL_signed
`define ysyx_041461_MUL_unsigned_x_unsigned 2'b00
`define ysyx_041461_MUL_signed_x_unsigned 2'b10
`define ysyx_041461_MUL_signed_x_signed 2'b11

//MEM_ctrl
`define ysyx_041461_MEM_NOP 4'b0000
`define ysyx_041461_MEM_LB 4'b0001
`define ysyx_041461_MEM_LH 4'b0010
`define ysyx_041461_MEM_LBU 4'b0011
`define ysyx_041461_MEM_LHU 4'b0100
`define ysyx_041461_MEM_LW 4'b0101
`define ysyx_041461_MEM_LWU 4'b0110
`define ysyx_041461_MEM_LD 4'b0111
`define ysyx_041461_MEM_SB 4'b1000
`define ysyx_041461_MEM_SH 4'b1001
`define ysyx_041461_MEM_SW 4'b1010
`define ysyx_041461_MEM_SD 4'b1011
`define ysyx_041461_MEM_FENCE_I 4'b1100

//WB_ctrl
`define ysyx_041461_WB_NOP 4'b0000
`define ysyx_041461_WB_EXE 4'b0001
`define ysyx_041461_WB_MEM 4'b0010
`define ysyx_041461_WB_IMM 4'b0011
`define ysyx_041461_WB_SNPC 4'b0100
`define ysyx_041461_WB_CSR_RS1 4'b0101
`define ysyx_041461_WB_CSR_EXE 4'b0110
`define ysyx_041461_WB_CSR_ZIMM 4'b0111
`define ysyx_041461_WB_CSR_RO 4'b1000

//csr
`define ysyx_041461_MVENDORID 12'hf11
`define ysyx_041461_MARCHID 12'hf12
`define ysyx_041461_MIMPID 12'hf13
`define ysyx_041461_MHARTID 12'hf14
`define ysyx_041461_MSTATUS 12'h300
`define ysyx_041461_MISA 12'h301
`define ysyx_041461_MIE 12'h304
`define ysyx_041461_MTVEC 12'h305
`define ysyx_041461_MSCRATCH 12'h340
`define ysyx_041461_MEPC 12'h341
`define ysyx_041461_MCAUSE 12'h342
`define ysyx_041461_MTVAL 12'h343
`define ysyx_041461_MIP 12'h344
`define ysyx_041461_MCYCLE 12'hb00
`define ysyx_041461_MINSTRET 12'hb02

//IF state
`define ysyx_041461_IF_START 3'b000
`define ysyx_041461_IF_RCACHE 3'b001
`define ysyx_041461_IF_RAXI_AR 3'b010
`define ysyx_041461_IF_RAXI_R 3'b011
`define ysyx_041461_IF_WCACHE 3'b100
`define ysyx_041461_IF_FINISH 3'b101

//IF2 state
`define ysyx_041461_IF2_START 1'b0
`define ysyx_041461_IF2_FINISH 1'b1

//EXE state
`define ysyx_041461_EXE_START 2'b00
`define ysyx_041461_EXE_STATE_MUL 2'b01
`define ysyx_041461_EXE_STATE_DIV 2'b10
`define ysyx_041461_EXE_FINISH 2'b11

//MEM state
`define ysyx_041461_MEM_START 4'b0000
`define ysyx_041461_MEM_RCACHE 4'b0001
`define ysyx_041461_MEM_RAXI_AR 4'b0010
`define ysyx_041461_MEM_RAXI_R 4'b0011
`define ysyx_041461_MEM_WCACHE 4'b0100
`define ysyx_041461_MEM_WAXI_AW 4'b0101
`define ysyx_041461_MEM_WAXI_W 4'b0110
`define ysyx_041461_MEM_WAXI_B 4'b0111
`define ysyx_041461_MEM_FINISH 4'b1000

//ARBITER rstate
`define ysyx_041461_ARBITER_RSTART 2'b00
`define ysyx_041461_ARBITER_IF_RAXI 2'b01
`define ysyx_041461_ARBITER_MEM_RAXI 2'b10
`define ysyx_041461_ARBITER_MEM_RCLINT 2'b11

//ARBITER wstate
`define ysyx_041461_ARBITER_WSTART 2'b00
`define ysyx_041461_ARBITER_WAXI 2'b01
`define ysyx_041461_ARBITER_WCLINT 2'b10

//CLINT state
`define ysyx_041461_CLINT_START 2'b00
`define ysyx_041461_CLINT_W 2'b01
`define ysyx_041461_CLINT_WFINISH 2'b10
`define ysyx_041461_CLINT_R 2'b11

//TRAP
`define ysyx_041461_TRAP_NOP 4'b0000
`define ysyx_041461_IF_MISALIGN 4'b0001
`define ysyx_041461_ID_ECALL 4'b0010
`define ysyx_041461_ID_MRET 4'b0011
`define ysyx_041461_ID_EBREAK 4'b0100
`define ysyx_041461_ID_ILLEGAL_INST 4'b0101
`define ysyx_041461_MEM_LOAD_MISALIGN 4'b0110
`define ysyx_041461_MEM_STORE_MISALIGN 4'b0111
`define ysyx_041461_TIMER_INTERRUPT 4'b1000

//ID_IFreg_ctrl
`define ysyx_041461_ID_IFreg_ctrl_NOP 1'b0
`define ysyx_041461_ID_IFreg_ctrl_IDpc 1'b1

//WB_IFreg_ctrl
`define ysyx_041461_WB_IFreg_ctrl_NOP 2'b00
`define ysyx_041461_WB_IFreg_ctrl_MTVEC 2'b01
`define ysyx_041461_WB_IFreg_ctrl_MEPC 2'b10


module ysyx_041461_IF_reg(

    input   wire [0:0]   clk                 ,
    input   wire [0:0]   rst                 ,
    input   wire [0:0]   IFreg_enable        ,
    input   wire [0:0]   IFreg_ctrl_fromID   ,
    input   wire [1:0]   IFreg_ctrl_fromWB   ,

    input   wire [63:0]  IFreg_next_pc       ,
    input   wire [63:0]  IFreg_mtvec         ,
    input   wire [63:0]  IFreg_mepc          ,
    input   wire [62:0]  IFreg_CAUSE         ,
    
    output  reg  [63:0]  IFreg_pc          
);


//PC寄存器功能实现
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        IFreg_pc <= 64'h0000_0000_3000_0000;
    end
    else if(IFreg_enable == 1'b0) begin
        IFreg_pc <= IFreg_pc;
    end
    else if(IFreg_ctrl_fromWB != `ysyx_041461_WB_IFreg_ctrl_NOP) begin
        case(IFreg_ctrl_fromWB)
            `ysyx_041461_WB_IFreg_ctrl_MTVEC: begin
                if(IFreg_mtvec[1:0] == 2'b00) begin
                    IFreg_pc <= IFreg_mtvec;
                end
                else if(IFreg_mtvec[1:0] == 2'b01) begin
                    IFreg_pc <= {IFreg_mtvec[63:2], 2'b00} + {IFreg_CAUSE, 1'b0} + {IFreg_CAUSE, 1'b0} + {IFreg_CAUSE, 1'b0} + {IFreg_CAUSE, 1'b0};
                end
            end
            `ysyx_041461_WB_IFreg_ctrl_MEPC: begin
                IFreg_pc <= IFreg_mepc;
            end
            default:begin
                IFreg_pc <= IFreg_pc;
            end
        endcase
    end
    else begin
        case(IFreg_ctrl_fromID)
            `ysyx_041461_ID_IFreg_ctrl_NOP: begin
                IFreg_pc <= IFreg_pc + 64'd4;
            end
            `ysyx_041461_ID_IFreg_ctrl_IDpc: begin
                IFreg_pc <= IFreg_next_pc;
            end
        endcase
    end
end


endmodule

module ysyx_041461_IF(

    input   wire [0:0]    clk                  ,
    input   wire [0:0]    rst                  ,
    input   wire [63:0]   IF_pc                ,
    input   wire [63:0]   IF_mstatus           ,
    input   wire [63:0]   IF_mie               ,
    input   wire [63:0]   IF_mip               ,
    input   wire [2:0]    IF_ID_TYPE           ,
    input   wire [0:0]    IF_IF2_ready         ,
    input   wire [0:0]    IF_CD_trap           ,
  
    output  reg  [3:0]    IF_trap_out          ,
    output  reg  [0:0]    IF_valid_out         ,
    output  reg  [0:0]    IF_ready             ,
    output  reg  [63:0]   IF_AXI_rdata         ,
    output  reg  [0:0]    IF_ok                ,

    output  reg  [0:0]    IF_hit1              ,
    output  reg  [0:0]    IF_hit2              ,
    output  reg  [0:0]    IF_hit3              ,
    output  reg  [0:0]    IF_hit4              ,
    output  reg  [0:0]    IF_hit5              ,
    output  reg  [0:0]    IF_hit6              ,
    output  reg  [0:0]    IF_hit7              ,
    output  reg  [0:0]    IF_hit8              ,
        
    input   wire [0:0]    IF_arready           ,
    output  reg  [0:0]    IF_arvalid           ,
    output  reg  [31:0]   IF_araddr            ,
    output  wire [3:0]    IF_arid              ,
    output  wire [7:0]    IF_arlen             ,
    output  reg  [2:0]    IF_arsize            ,
    output  wire [1:0]    IF_arburst           ,
         
    output  reg  [0:0]    IF_rready            ,
    input   wire [0:0]    IF_rvalid            ,
    input   wire [1:0]    IF_rresp             ,
    input   wire [63:0]   IF_rdata             ,
    input   wire [0:0]    IF_rlast             ,
    input   wire [3:0]    IF_rid               ,
   
    output  wire [5:0]    IF_sram0_addr        , 
    output  wire [0:0]    IF_sram0_cen         , 
    output  reg  [0:0]    IF_sram0_wen         , 
    output  reg  [127:0]  IF_sram0_wmask       , 
    output  reg  [127:0]  IF_sram0_wdata       , 
   
    output  wire [5:0]    IF_sram1_addr        , 
    output  wire [0:0]    IF_sram1_cen         , 
    output  reg  [0:0]    IF_sram1_wen         , 
    output  reg  [127:0]  IF_sram1_wmask       , 
    output  reg  [127:0]  IF_sram1_wdata       , 
   
    output  wire [5:0]    IF_sram2_addr        , 
    output  wire [0:0]    IF_sram2_cen         , 
    output  reg  [0:0]    IF_sram2_wen         , 
    output  reg  [127:0]  IF_sram2_wmask       , 
    output  reg  [127:0]  IF_sram2_wdata       , 

    output  wire [5:0]    IF_sram3_addr        , 
    output  wire [0:0]    IF_sram3_cen         , 
    output  reg  [0:0]    IF_sram3_wen         , 
    output  reg  [127:0]  IF_sram3_wmask       , 
    output  reg  [127:0]  IF_sram3_wdata       
);

parameter IF_AXI_id = 4'b0000;

parameter OKAY = 2'b00;
parameter EXOKAY = 2'b01;
//parameter SLVERR = 2'b10;
//parameter DECERR = 2'b11;

parameter FIXED = 2'b00;
//parameter INCR = 2'b01;
//parameter WRAP = 2'b10;
//parameter Rserved = 2'b11;

reg  [2:0]   state;

reg  [63:0]  AXI_rdata;

reg  [0:0]   V1        [63:0];
reg  [0:0]   V1_next   [63:0];
reg  [22:0]  tag1      [63:0];
reg  [22:0]  tag1_next [63:0];
reg  [0:0]   V2        [63:0];
reg  [0:0]   V2_next   [63:0];
reg  [22:0]  tag2      [63:0];
reg  [22:0]  tag2_next [63:0];
reg  [0:0]   V3        [63:0];
reg  [0:0]   V3_next   [63:0];
reg  [22:0]  tag3      [63:0];
reg  [22:0]  tag3_next [63:0];
reg  [0:0]   V4        [63:0];
reg  [0:0]   V4_next   [63:0];
reg  [22:0]  tag4      [63:0];
reg  [22:0]  tag4_next [63:0];
reg  [0:0]   V5        [63:0];
reg  [0:0]   V5_next   [63:0];
reg  [22:0]  tag5      [63:0];
reg  [22:0]  tag5_next [63:0];
reg  [0:0]   V6        [63:0];
reg  [0:0]   V6_next   [63:0];
reg  [22:0]  tag6      [63:0];
reg  [22:0]  tag6_next [63:0];
reg  [0:0]   V7        [63:0];
reg  [0:0]   V7_next   [63:0];
reg  [22:0]  tag7      [63:0];
reg  [22:0]  tag7_next [63:0];
reg  [0:0]   V8        [63:0];
reg  [0:0]   V8_next   [63:0];
reg  [22:0]  tag8      [63:0];
reg  [22:0]  tag8_next [63:0];

wire [0:0]   hit;

wire [5:0]   index;
wire [2:0]   offset;
wire [22:0]  tag;

reg  [0:0]   uncached;

reg  [6:0]   PLRU_tree       [63:0];
reg  [6:0]   PLRU_tree_next  [63:0];
reg  [2:0]   replace_line;

wire [0:0]   mie_MTIE;
wire [0:0]   mip_MTIP;
wire [0:0]   mstatus_MIE;


assign index = IF_pc[8:3];
assign offset = IF_pc[2:0];
assign tag = IF_pc[31:9];

assign IF_sram0_addr = index;
assign IF_sram1_addr = index;
assign IF_sram2_addr = index;
assign IF_sram3_addr = index;
assign IF_sram0_cen  = 1'b0;
assign IF_sram1_cen  = 1'b0;
assign IF_sram2_cen  = 1'b0;
assign IF_sram3_cen  = 1'b0;

assign hit = IF_hit1 || IF_hit2 || IF_hit3 || IF_hit4 || IF_hit5 || IF_hit6 || IF_hit7 || IF_hit8;

assign mie_MTIE = IF_mie[7:7];
assign mip_MTIP = IF_mip[7:7];
assign mstatus_MIE = IF_mstatus[3:3];


always@(*) begin
    if(mie_MTIE == 1'b1 && mip_MTIP == 1'b1 && mstatus_MIE == 1'b1) begin
        IF_trap_out = `ysyx_041461_TIMER_INTERRUPT;
    end
    else if(offset[1:0] != 2'b00) begin
        IF_trap_out = `ysyx_041461_IF_MISALIGN;
    end
    else begin
        IF_trap_out = `ysyx_041461_TRAP_NOP;
    end
end

//在运行pa程序时，需判断地址大小，运行soc程序时只需判断一位
//SOC
always@(*) begin
    if(IF_pc[31:31] == 1'b1) begin
        uncached = 1'b0;
    end
    else begin
        uncached = 1'b1;
    end
end


//PA
/*always@(*) begin
    if(IF_pc[31:0] >= 32'h8000_0000 && IF_pc[31:0] < 32'h8800_0000) begin
        uncached = 1'b0;
    end
    else begin
        uncached = 1'b1;
    end
end
*/


always@(*) begin
    if(V1[index] == 1'b1) begin
        if(tag1[index] == tag) begin
            IF_hit1 = 1'b1;
        end
        else begin
            IF_hit1 = 1'b0;
        end
    end
    else begin
        IF_hit1 = 1'b0;
    end
end

always@(*) begin
    if(V2[index] == 1'b1) begin
        if(tag2[index] == tag) begin
            IF_hit2 = 1'b1;
        end
        else begin
            IF_hit2 = 1'b0;
        end
    end
    else begin
        IF_hit2 = 1'b0;
    end
end

always@(*) begin
    if(V3[index] == 1'b1) begin
        if(tag3[index] == tag) begin
            IF_hit3 = 1'b1;
        end
        else begin
            IF_hit3 = 1'b0;
        end
    end
    else begin
        IF_hit3 = 1'b0;
    end
end

always@(*) begin
    if(V4[index] == 1'b1) begin
        if(tag4[index] == tag) begin
            IF_hit4 = 1'b1;
        end
        else begin
            IF_hit4 = 1'b0;
        end
    end
    else begin
        IF_hit4 = 1'b0;
    end
end

always@(*) begin
    if(V5[index] == 1'b1) begin
        if(tag5[index] == tag) begin
            IF_hit5 = 1'b1;
        end
        else begin
            IF_hit5 = 1'b0;
        end
    end
    else begin
        IF_hit5 = 1'b0;
    end
end

always@(*) begin
    if(V6[index] == 1'b1) begin
        if(tag6[index] == tag) begin
            IF_hit6 = 1'b1;
        end
        else begin
            IF_hit6 = 1'b0;
        end
    end
    else begin
        IF_hit6 = 1'b0;
    end
end

always@(*) begin
    if(V7[index] == 1'b1) begin
        if(tag7[index] == tag) begin
            IF_hit7 = 1'b1;
        end
        else begin
            IF_hit7 = 1'b0;
        end
    end
    else begin
        IF_hit7 = 1'b0;
    end
end

always@(*) begin
    if(V8[index] == 1'b1) begin
        if(tag8[index] == tag) begin
            IF_hit8 = 1'b1;
        end
        else begin
            IF_hit8 = 1'b0;
        end
    end
    else begin
        IF_hit8 = 1'b0;
    end
end

integer n;
always@(*) begin
    for(n = 0; n < 64; n = n + 1) begin
        PLRU_tree_next[n] = PLRU_tree[n];
    end
    if(state == `ysyx_041461_IF_START && IF_trap_out == `ysyx_041461_TRAP_NOP && IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
        if(IF_hit1 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b1;
            PLRU_tree_next[index][3:3] = 1'b1;
        end
        else if(IF_hit2 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b1;
            PLRU_tree_next[index][3:3] = 1'b0;
        end
        else if(IF_hit3 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b0;
            PLRU_tree_next[index][4:4] = 1'b1;
        end
        else if(IF_hit4 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b0;
            PLRU_tree_next[index][4:4] = 1'b0;
        end
        else if(IF_hit5 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b1;
            PLRU_tree_next[index][5:5] = 1'b1;
        end
        else if(IF_hit6 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b1;
            PLRU_tree_next[index][5:5] = 1'b0;
        end
        else if(IF_hit7 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b0;
            PLRU_tree_next[index][6:6] = 1'b1;
        end
        else if(IF_hit8 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b0;
            PLRU_tree_next[index][6:6] = 1'b0;
        end
    end
end

integer r;
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        for(r = 0; r < 64; r = r + 1) begin
            PLRU_tree[r] <= 7'b0;
        end
    end
    else begin
        for(r = 0; r < 64; r = r + 1) begin
            PLRU_tree[r] <= PLRU_tree_next[r];
        end
    end
end

always@(*) begin
    if(PLRU_tree[index][0:0] == 1'b0) begin
        if(PLRU_tree[index][1:1] == 1'b0) begin
            if(PLRU_tree[index][3:3] == 1'b0) begin
                replace_line = 3'b000;
            end
            else begin
                replace_line = 3'b001;
            end
        end
        else begin
            if(PLRU_tree[index][4:4] == 1'b0) begin 
                replace_line = 3'b010;
            end
            else begin
                replace_line = 3'b011;
            end
        end
    end
    else begin
        if(PLRU_tree[index][2:2] == 1'b0) begin
            if(PLRU_tree[index][5:5] == 1'b0) begin
                replace_line = 3'b100;
            end
            else begin
                replace_line = 3'b101;
            end
        end
        else begin
            if(PLRU_tree[index][6:6] == 1'b0) begin 
                replace_line = 3'b110;
            end
            else begin
                replace_line = 3'b111;
            end
        end
    end
end

always@(*) begin
    IF_sram0_wen = 1'b1;
    IF_sram0_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    IF_sram0_wdata = 128'b0;
    IF_sram1_wen = 1'b1;
    IF_sram1_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    IF_sram1_wdata = 128'b0;
    IF_sram2_wen = 1'b1;
    IF_sram2_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    IF_sram2_wdata = 128'b0;
    IF_sram3_wen = 1'b1;
    IF_sram3_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    IF_sram3_wdata = 128'b0;
    if(state == `ysyx_041461_IF_WCACHE) begin
        if(V1[index] == 1'b0) begin
            IF_sram0_wen = 1'b0;
            IF_sram0_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
            IF_sram0_wdata = {64'b0, AXI_rdata};
        end
        else if(V2[index] == 1'b0) begin
            IF_sram0_wen = 1'b0;
            IF_sram0_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
            IF_sram0_wdata = {AXI_rdata, 64'b0};
        end
        else if(V3[index] == 1'b0) begin
            IF_sram1_wen = 1'b0;
            IF_sram1_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
            IF_sram1_wdata = {64'b0, AXI_rdata};
        end
        else if(V4[index] == 1'b0) begin
            IF_sram1_wen = 1'b0;
            IF_sram1_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
            IF_sram1_wdata = {AXI_rdata, 64'b0};
        end
        else if(V5[index] == 1'b0) begin
            IF_sram2_wen = 1'b0;
            IF_sram2_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
            IF_sram2_wdata = {64'b0, AXI_rdata};
        end
        else if(V6[index] == 1'b0) begin
            IF_sram2_wen = 1'b0;
            IF_sram2_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
            IF_sram2_wdata = {AXI_rdata, 64'b0};
        end
        else if(V7[index] == 1'b0) begin
            IF_sram3_wen = 1'b0;
            IF_sram3_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
            IF_sram3_wdata = {64'b0, AXI_rdata};
        end
        else if(V8[index] == 1'b0) begin
            IF_sram3_wen = 1'b0;
            IF_sram3_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
            IF_sram3_wdata = {AXI_rdata, 64'b0};
        end
        else begin
            case(replace_line)
                3'b000: begin
                    IF_sram0_wen = 1'b0;
                    IF_sram0_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                    IF_sram0_wdata = {64'b0, AXI_rdata};
                end
                3'b001: begin
                    IF_sram0_wen = 1'b0;
                    IF_sram0_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                    IF_sram0_wdata = {AXI_rdata, 64'b0};
                end
                3'b010: begin
                    IF_sram1_wen = 1'b0;
                    IF_sram1_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                    IF_sram1_wdata = {64'b0, AXI_rdata};
                end
                3'b011: begin
                    IF_sram1_wen = 1'b0;
                    IF_sram1_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                    IF_sram1_wdata = {AXI_rdata, 64'b0};
                end
                3'b100: begin
                    IF_sram2_wen = 1'b0;
                    IF_sram2_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                    IF_sram2_wdata = {64'b0, AXI_rdata};
                end
                3'b101: begin
                    IF_sram2_wen = 1'b0;
                    IF_sram2_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                    IF_sram2_wdata = {AXI_rdata, 64'b0};
                end
                3'b110: begin
                    IF_sram3_wen = 1'b0;
                    IF_sram3_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                    IF_sram3_wdata = {64'b0, AXI_rdata};
                end
                3'b111: begin
                    IF_sram3_wen = 1'b0;
                    IF_sram3_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                    IF_sram3_wdata = {AXI_rdata, 64'b0};
                end
            endcase
        end
    end
end

integer i;
always@(*) begin
    for(i = 0; i < 64; i = i + 1) begin
        V1_next[i] = V1[i];
        V2_next[i] = V2[i];
        V3_next[i] = V3[i];
        V4_next[i] = V4[i];
        V5_next[i] = V5[i];
        V6_next[i] = V6[i];
        V7_next[i] = V7[i];
        V8_next[i] = V8[i];
        tag1_next[i] = tag1[i];
        tag2_next[i] = tag2[i];
        tag3_next[i] = tag3[i];
        tag4_next[i] = tag4[i];
        tag5_next[i] = tag5[i];
        tag6_next[i] = tag6[i];
        tag7_next[i] = tag7[i];
        tag8_next[i] = tag8[i];
    end
    case(state)
        `ysyx_041461_IF_WCACHE: begin
            if(V1[index] == 1'b0) begin
                V1_next[index] = 1'b1;
                tag1_next[index] = tag;
            end
            else if(V2[index] == 1'b0) begin
                V2_next[index] = 1'b1;
                tag2_next[index] = tag;
            end
            else if(V3[index] == 1'b0) begin
                V3_next[index] = 1'b1;
                tag3_next[index] = tag;
            end
            else if(V4[index] == 1'b0) begin
                V4_next[index] = 1'b1;
                tag4_next[index] = tag;
            end
            else if(V5[index] == 1'b0) begin
                V5_next[index] = 1'b1;
                tag5_next[index] = tag;
            end
            else if(V6[index] == 1'b0) begin
                V6_next[index] = 1'b1;
                tag6_next[index] = tag;
            end
            else if(V7[index] == 1'b0) begin
                V7_next[index] = 1'b1;
                tag7_next[index] = tag;
            end
            else if(V8[index] == 1'b0) begin
                V8_next[index] = 1'b1;
                tag8_next[index] = tag;
            end
            else begin
                case(replace_line)
                    3'b000: begin
                        tag1_next[index] = tag;
                    end
                    3'b001: begin
                        tag2_next[index] = tag;
                    end
                    3'b010: begin
                        tag3_next[index] = tag;
                    end
                    3'b011: begin
                        tag4_next[index] = tag;
                    end
                    3'b100: begin
                        tag5_next[index] = tag;
                    end
                    3'b101: begin
                        tag6_next[index] = tag;
                    end
                    3'b110: begin
                        tag7_next[index] = tag;
                    end
                    3'b111: begin
                        tag8_next[index] = tag;
                    end
                endcase
            end
        end
        `ysyx_041461_IF_START: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_FENCE_I) begin
                for(i = 0; i < 64; i = i + 1) begin
                    V1_next[i] = 1'b0;
                    V2_next[i] = 1'b0;
                    V3_next[i] = 1'b0;
                    V4_next[i] = 1'b0;
                    V5_next[i] = 1'b0;
                    V6_next[i] = 1'b0;
                    V7_next[i] = 1'b0;
                    V8_next[i] = 1'b0;
                end
            end
        end
        `ysyx_041461_IF_RAXI_R: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_FENCE_I) begin
                for(i = 0; i < 64; i = i + 1) begin
                    V1_next[i] = 1'b0;
                    V2_next[i] = 1'b0;
                    V3_next[i] = 1'b0;
                    V4_next[i] = 1'b0;
                    V5_next[i] = 1'b0;
                    V6_next[i] = 1'b0;
                    V7_next[i] = 1'b0;
                    V8_next[i] = 1'b0;
                end
            end
        end
        `ysyx_041461_IF_FINISH: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_FENCE_I) begin
                for(i = 0; i < 64; i = i + 1) begin
                    V1_next[i] = 1'b0;
                    V2_next[i] = 1'b0;
                    V3_next[i] = 1'b0;
                    V4_next[i] = 1'b0;
                    V5_next[i] = 1'b0;
                    V6_next[i] = 1'b0;
                    V7_next[i] = 1'b0;
                    V8_next[i] = 1'b0;
                end
            end
        end
        default: begin

        end
    endcase
end

integer k;
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        for(k = 0; k < 64; k = k + 1) begin
            V1[k] <= 1'b0;
            V2[k] <= 1'b0;
            V3[k] <= 1'b0;
            V4[k] <= 1'b0;
            V5[k] <= 1'b0;
            V6[k] <= 1'b0;
            V7[k] <= 1'b0;
            V8[k] <= 1'b0;
            tag1[k] <= 23'b0;
            tag2[k] <= 23'b0;
            tag3[k] <= 23'b0;
            tag4[k] <= 23'b0;
            tag5[k] <= 23'b0;
            tag6[k] <= 23'b0;
            tag7[k] <= 23'b0;
            tag8[k] <= 23'b0;
        end
    end
    else begin
        for(k = 0; k < 64; k = k + 1) begin
           V1[k] <= V1_next[k];
           V2[k] <= V2_next[k];
           V3[k] <= V3_next[k];
           V4[k] <= V4_next[k];
           V5[k] <= V5_next[k];
           V6[k] <= V6_next[k];
           V7[k] <= V7_next[k];
           V8[k] <= V8_next[k];
           tag1[k] <= tag1_next[k];
           tag2[k] <= tag2_next[k];
           tag3[k] <= tag3_next[k];
           tag4[k] <= tag4_next[k];
           tag5[k] <= tag5_next[k];
           tag6[k] <= tag6_next[k];
           tag7[k] <= tag7_next[k];
           tag8[k] <= tag8_next[k];
        end
    end
end

always@(*) begin
    IF_AXI_rdata = AXI_rdata;
    if(state == `ysyx_041461_IF_RAXI_R) begin
        IF_AXI_rdata = IF_rdata;
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        AXI_rdata <= 64'b0;
    end
    else begin
        AXI_rdata <= IF_AXI_rdata;
    end
end

assign IF_arid = IF_AXI_id;
assign IF_arlen = 8'b0;
assign IF_arburst = FIXED;

always@(*) begin
    if(uncached == 1'b1) begin
        IF_araddr = IF_pc[31:0];
    end
    else begin
        IF_araddr = {IF_pc[31:3], 3'b000};
    end
end

always@(*) begin
    if(uncached == 1'b1) begin
        IF_arsize = 3'b010;
    end
    else begin
        IF_arsize = 3'b011;
    end
end

always@(*) begin
    if(state == `ysyx_041461_IF_RAXI_AR) begin
        IF_arvalid = 1'b1;
    end
    else begin
        IF_arvalid = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_IF_RAXI_R) begin
        IF_rready = 1'b1;
    end
    else begin
        IF_rready = 1'b0;
    end
end

always@(*) begin
    case(state)
        `ysyx_041461_IF_START: begin
            if(IF_ID_TYPE != `ysyx_041461_TYPE_NOP || IF_CD_trap == 1'b1) begin
                IF_ok = 1'b1;
            end
            else begin
                IF_ok = 1'b0;
            end
        end
        `ysyx_041461_IF_RAXI_R: begin
            if(IF_rvalid == 1'b1 && IF_rid == IF_AXI_id && IF_rlast == 1'b1 && (IF_rresp == OKAY || IF_rresp == EXOKAY)) begin
                if(IF_ID_TYPE != `ysyx_041461_TYPE_NOP || IF_CD_trap == 1'b1) begin
                    IF_ok = 1'b1;
                end
                else begin
                    IF_ok = 1'b0;
                end
            end
            else begin
                IF_ok = 1'b0;
            end
        end
        `ysyx_041461_IF_FINISH: begin
            if(IF_ID_TYPE != `ysyx_041461_TYPE_NOP || IF_CD_trap == 1'b1) begin
                IF_ok = 1'b1;
            end
            else begin
                IF_ok = 1'b0;
            end
        end
        default: begin
            IF_ok = 1'b0;
        end
    endcase
end


always@(*) begin
    case(state)
        `ysyx_041461_IF_START: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                if(IF_trap_out == `ysyx_041461_TRAP_NOP) begin
                    if(uncached == 1'b1) begin
                        IF_ready = 1'b0;
                    end
                    else begin
                        if(hit == 1'b1) begin
                            IF_ready = IF_IF2_ready;
                        end
                        else begin
                            IF_ready = 1'b0;
                        end
                    end
                end
                else begin
                    IF_ready = IF_IF2_ready;
                end
            end
            else begin
                IF_ready = 1'b1;
            end
        end
        `ysyx_041461_IF_RAXI_R: begin
            if(IF_rvalid == 1'b1 && IF_rid == IF_AXI_id && IF_rlast == 1'b1 && (IF_rresp == OKAY || IF_rresp == EXOKAY)) begin
                if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                    if(IF_trap_out == `ysyx_041461_TRAP_NOP) begin
                        if(uncached == 1'b1) begin
                            IF_ready = IF_IF2_ready;
                        end
                        else begin
                            IF_ready = 1'b0;
                        end
                    end
                    else begin
                        IF_ready = IF_IF2_ready;
                    end
                end
                else begin
                    IF_ready = 1'b1;
                end
            end
            else begin
                IF_ready = 1'b0;
            end
        end
        `ysyx_041461_IF_FINISH: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                IF_ready = IF_IF2_ready;
            end
            else begin
                IF_ready = 1'b1;
            end
        end
        default: begin
            IF_ready = 1'b0;
        end
    endcase
end

always@(*) begin
    case(state)
        `ysyx_041461_IF_START: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                if(IF_trap_out == `ysyx_041461_TRAP_NOP) begin
                    if(uncached == 1'b1) begin
                        IF_valid_out = 1'b0;
                    end
                    else begin
                        if(hit == 1'b1) begin
                            IF_valid_out = 1'b1;
                        end
                        else begin
                            IF_valid_out = 1'b0;
                        end
                    end
                end
                else begin
                    IF_valid_out = 1'b1;
                end
            end
            else begin
                IF_valid_out = 1'b0;
            end
        end
        `ysyx_041461_IF_RAXI_R: begin
            if(IF_rvalid == 1'b1 && IF_rid == IF_AXI_id && IF_rlast == 1'b1 && (IF_rresp == OKAY || IF_rresp == EXOKAY)) begin
                if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                    if(IF_trap_out == `ysyx_041461_TRAP_NOP) begin
                        if(uncached == 1'b1) begin
                            IF_valid_out = 1'b1;
                        end
                        else begin
                            IF_valid_out = 1'b0;
                        end
                    end
                    else begin
                        IF_valid_out = 1'b1;
                    end
                end
                else begin
                    IF_valid_out = 1'b0;
                end
            end
            else begin
                IF_valid_out = 1'b0;
            end
        end
        `ysyx_041461_IF_FINISH: begin
            if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                IF_valid_out = 1'b1;
            end
            else begin
                IF_valid_out = 1'b0;
            end
        end
        default: begin
            IF_valid_out = 1'b0;
        end
    endcase
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= `ysyx_041461_IF_START;
    end
    else begin
        case(state)
            `ysyx_041461_IF_START: begin
                if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                    if(IF_trap_out == `ysyx_041461_TRAP_NOP) begin
                        if(uncached == 1'b1) begin
                            state <= `ysyx_041461_IF_RAXI_AR;
                        end
                        else begin
                            if(hit == 1'b1) begin
                                state <= state;
                            end
                            else begin
                                state <= `ysyx_041461_IF_RAXI_AR;
                            end
                        end
                    end
                    else begin
                        state <= state;
                    end
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_IF_RAXI_AR: begin
                if(IF_arready == 1'b1) begin
                    state <= `ysyx_041461_IF_RAXI_R;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_IF_RAXI_R: begin
                if(IF_rvalid == 1'b1 && IF_rid == IF_AXI_id && IF_rlast == 1'b1 && (IF_rresp == OKAY || IF_rresp == EXOKAY)) begin
                    if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                        if(IF_trap_out == `ysyx_041461_TRAP_NOP) begin
                            if(uncached == 1'b1) begin
                                if(IF_IF2_ready == 1'b1) begin
                                    state <= `ysyx_041461_IF_START;
                                end
                                else begin
                                    state <= `ysyx_041461_IF_FINISH;
                                end
                            end
                            else begin
                                state <= `ysyx_041461_IF_WCACHE;
                            end
                        end
                        else begin
                            state <= `ysyx_041461_IF_START;
                        end
                    end
                    else begin
                        state <= `ysyx_041461_IF_START;
                    end
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_IF_WCACHE: begin
                state <= `ysyx_041461_IF_START;
            end
            `ysyx_041461_IF_FINISH: begin
                if(IF_ID_TYPE == `ysyx_041461_TYPE_NOP && IF_CD_trap == 1'b0) begin
                    if(IF_IF2_ready == 1'b1) begin
                        state <= `ysyx_041461_IF_START;
                    end
                    else begin
                        state <= state;
                    end
                end
                else begin
                    state <= `ysyx_041461_IF_START;
                end
            end
            default: begin
                state <= `ysyx_041461_IF_START;
            end
        endcase
    end      
end


endmodule

module ysyx_041461_IF2_reg(

    input   wire [0:0]    clk                  ,
    input   wire [0:0]    rst                  ,
    input   wire [0:0]    IF2reg_enable       ,

    input   wire [63:0]   IF2reg_pc_in        ,
    input   wire [63:0]   IF2reg_AXI_rdata_in ,
    input   wire [0:0]    IF2reg_hit1_in      ,
    input   wire [0:0]    IF2reg_hit2_in      ,
    input   wire [0:0]    IF2reg_hit3_in      ,
    input   wire [0:0]    IF2reg_hit4_in      ,
    input   wire [0:0]    IF2reg_hit5_in      ,
    input   wire [0:0]    IF2reg_hit6_in      ,
    input   wire [0:0]    IF2reg_hit7_in      ,
    input   wire [0:0]    IF2reg_hit8_in      ,
    input   wire [0:0]    IF2reg_valid_in     ,
    input   wire [3:0]    IF2reg_trap_in      ,
    
    output  reg  [63:0]   IF2reg_pc_out       ,
    output  reg  [63:0]   IF2reg_AXI_rdata_out,
    output  reg  [0:0]    IF2reg_hit1_out     ,
    output  reg  [0:0]    IF2reg_hit2_out     ,
    output  reg  [0:0]    IF2reg_hit3_out     ,
    output  reg  [0:0]    IF2reg_hit4_out     ,
    output  reg  [0:0]    IF2reg_hit5_out     ,
    output  reg  [0:0]    IF2reg_hit6_out     ,
    output  reg  [0:0]    IF2reg_hit7_out     ,
    output  reg  [0:0]    IF2reg_hit8_out     ,
    output  reg  [0:0]    IF2reg_valid_out    ,
    output  reg  [3:0]    IF2reg_trap_out 
);

//流水线寄存器功能实现

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin  
        IF2reg_pc_out <= 64'h0000_0000_3000_0000; 
        IF2reg_AXI_rdata_out <= 64'b0;
        IF2reg_hit1_out <= 1'b0;
        IF2reg_hit2_out <= 1'b0;
        IF2reg_hit3_out <= 1'b0;
        IF2reg_hit4_out <= 1'b0;
        IF2reg_hit5_out <= 1'b0;
        IF2reg_hit6_out <= 1'b0;
        IF2reg_hit7_out <= 1'b0;
        IF2reg_hit8_out <= 1'b0;
        IF2reg_valid_out <= 1'b0;
        IF2reg_trap_out <= `ysyx_041461_TRAP_NOP;                 
    end
    else if(IF2reg_enable == 1'b0) begin
        IF2reg_pc_out <= IF2reg_pc_out; 
        IF2reg_AXI_rdata_out <= IF2reg_AXI_rdata_out;
        IF2reg_hit1_out <= IF2reg_hit1_out;
        IF2reg_hit2_out <= IF2reg_hit2_out;
        IF2reg_hit3_out <= IF2reg_hit3_out;
        IF2reg_hit4_out <= IF2reg_hit4_out;
        IF2reg_hit5_out <= IF2reg_hit5_out;
        IF2reg_hit6_out <= IF2reg_hit6_out;
        IF2reg_hit7_out <= IF2reg_hit7_out;
        IF2reg_hit8_out <= IF2reg_hit8_out;
        IF2reg_valid_out <= IF2reg_valid_out;
        IF2reg_trap_out <= IF2reg_trap_out;   
    end
    else begin 
        IF2reg_pc_out <= IF2reg_pc_in; 
        IF2reg_AXI_rdata_out <= IF2reg_AXI_rdata_in;
        IF2reg_hit1_out <= IF2reg_hit1_in;
        IF2reg_hit2_out <= IF2reg_hit2_in;
        IF2reg_hit3_out <= IF2reg_hit3_in;
        IF2reg_hit4_out <= IF2reg_hit4_in;
        IF2reg_hit5_out <= IF2reg_hit5_in;
        IF2reg_hit6_out <= IF2reg_hit6_in;
        IF2reg_hit7_out <= IF2reg_hit7_in;
        IF2reg_hit8_out <= IF2reg_hit8_in;
        IF2reg_valid_out <= IF2reg_valid_in;
        IF2reg_trap_out <= IF2reg_trap_in;  
    end
end

endmodule

module ysyx_041461_IF2(

    input   wire [0:0]    clk            ,
    input   wire [0:0]    rst            ,

    input   wire [63:0]   IF2_pc         ,
    input   wire [0:0]    IF2_hit1       ,
    input   wire [0:0]    IF2_hit2       ,
    input   wire [0:0]    IF2_hit3       ,
    input   wire [0:0]    IF2_hit4       ,
    input   wire [0:0]    IF2_hit5       ,
    input   wire [0:0]    IF2_hit6       ,
    input   wire [0:0]    IF2_hit7       ,
    input   wire [0:0]    IF2_hit8       ,
    input   wire [0:0]    IF2_valid_in   ,
    input   wire [3:0]    IF2_trap_in    ,
    input   wire [2:0]    IF2_ID_TYPE    ,
    input   wire [0:0]    IF2_ID_ready   ,
    input   wire [0:0]    IF2_CD_trap    ,
    
    output  reg  [0:0]    IF2_valid_out  ,
    output  wire [3:0]    IF2_trap_out   ,
    output  reg  [0:0]    IF2_ready      ,
    output  reg  [31:0]   IF2_inst       ,
   
    input   wire [127:0]  IF2_sram0_rdata,
    input   wire [127:0]  IF2_sram1_rdata,
    input   wire [127:0]  IF2_sram2_rdata,
    input   wire [127:0]  IF2_sram3_rdata,
    input   wire [63:0]   IF2_AXI_rdata
);

reg [0:0]   state;

reg [127:0] sram0_rdata;
reg [127:0] sram0_rdata_next;
reg [127:0] sram1_rdata;
reg [127:0] sram1_rdata_next;
reg [127:0] sram2_rdata;
reg [127:0] sram2_rdata_next;
reg [127:0] sram3_rdata;
reg [127:0] sram3_rdata_next;

assign IF2_trap_out = IF2_trap_in;

always@(*) begin
    if(state == `ysyx_041461_IF2_START) begin
        sram0_rdata_next = IF2_sram0_rdata;
        sram1_rdata_next = IF2_sram1_rdata;
        sram2_rdata_next = IF2_sram2_rdata;
        sram3_rdata_next = IF2_sram3_rdata;
    end
    else begin
        sram0_rdata_next = sram0_rdata;
        sram1_rdata_next = sram1_rdata;
        sram2_rdata_next = sram2_rdata;
        sram3_rdata_next = sram3_rdata;
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        sram0_rdata <= 128'b0;
        sram1_rdata <= 128'b0;
        sram2_rdata <= 128'b0;
        sram3_rdata <= 128'b0;
    end
    else begin
        sram0_rdata <= sram0_rdata_next;
        sram1_rdata <= sram1_rdata_next;
        sram2_rdata <= sram2_rdata_next;
        sram3_rdata <= sram3_rdata_next;
    end
end

always@(*) begin
    if(IF2_hit1 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram0_rdata_next[31:0];
        end
        else begin
            IF2_inst = sram0_rdata_next[63:32];
        end
    end
    else if(IF2_hit2 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram0_rdata_next[95:64];
        end
        else begin
            IF2_inst = sram0_rdata_next[127:96];
        end
    end
    else if(IF2_hit3 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram1_rdata_next[31:0];
        end
        else begin
            IF2_inst = sram1_rdata_next[63:32];
        end
    end
    else if(IF2_hit4 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram1_rdata_next[95:64];
        end
        else begin
            IF2_inst = sram1_rdata_next[127:96];
        end
    end
    else if(IF2_hit5 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram2_rdata_next[31:0];
        end
        else begin
            IF2_inst = sram2_rdata_next[63:32];
        end
    end
    else if(IF2_hit6 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram2_rdata_next[95:64];
        end
        else begin
            IF2_inst = sram2_rdata_next[127:96];
        end
    end
    else if(IF2_hit7 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram3_rdata_next[31:0];
        end
        else begin
            IF2_inst = sram3_rdata_next[63:32];
        end
    end
    else if(IF2_hit8 == 1'b1) begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = sram3_rdata_next[95:64];
        end
        else begin
            IF2_inst = sram3_rdata_next[127:96];
        end
    end
    else begin
        if(IF2_pc[2:2] == 1'b0) begin
            IF2_inst = IF2_AXI_rdata[31:0];
        end
        else begin
            IF2_inst = IF2_AXI_rdata[63:32];
        end
    end
end

always@(*) begin
    if(IF2_valid_in == 1'b1 && IF2_ID_TYPE == `ysyx_041461_TYPE_NOP && IF2_CD_trap == 1'b0) begin
        IF2_valid_out = 1'b1;
    end
    else begin
        IF2_valid_out = 1'b0;
    end
end

always@(*) begin
    if(IF2_valid_in == 1'b1 && IF2_trap_in == `ysyx_041461_TRAP_NOP && IF2_ID_TYPE == `ysyx_041461_TYPE_NOP && IF2_CD_trap == 1'b0) begin
        if(IF2_ID_ready == 1'b1) begin
            IF2_ready = 1'b1;
        end
        else begin
            IF2_ready = 1'b0;
        end
    end
    else begin
        IF2_ready = 1'b1;
    end
end


always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= `ysyx_041461_IF2_START;
    end
    else begin
        case(state)
            `ysyx_041461_IF2_START: begin
                if(IF2_valid_in == 1'b1 && IF2_ID_TYPE == `ysyx_041461_TYPE_NOP && IF2_CD_trap == 1'b0 && IF2_ID_ready == 1'b0) begin
                    state <= `ysyx_041461_IF2_FINISH;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_IF2_FINISH: begin
                if(IF2_ID_ready == 1'b1 || IF2_CD_trap == 1'b1 || IF2_ID_TYPE != `ysyx_041461_TYPE_NOP) begin
                    state <= `ysyx_041461_IF2_START;
                end
                else begin
                    state <= state;
                end
            end
        endcase
    end
end

endmodule

module ysyx_041461_ID_reg(

    input   wire [0:0]   clk               ,
    input   wire [0:0]   rst               ,
    input   wire [0:0]   IDreg_enable      ,
        
    input   wire [0:0]   IDreg_valid_in    , 
    input   wire [3:0]   IDreg_trap_in     ,
    input   wire [31:0]  IDreg_inst_in     ,
    input   wire [63:0]  IDreg_pc_in       ,

    output  reg  [0:0]   IDreg_valid_out   ,  
    output  reg  [3:0]   IDreg_trap_out    ,
    output  reg  [31:0]  IDreg_inst_out    ,   
    output  reg  [63:0]  IDreg_pc_out      
);


//流水线寄存器功能实现

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        IDreg_valid_out <= 1'b0;
        IDreg_trap_out <= `ysyx_041461_TRAP_NOP;
        IDreg_inst_out <= 32'b0;
        IDreg_pc_out <= 64'h0000_0000_3000_0000;
    end
    else if(IDreg_enable == 1'b0) begin
        IDreg_valid_out <= IDreg_valid_out;
        IDreg_trap_out <= IDreg_trap_out;
        IDreg_inst_out <= IDreg_inst_out;
        IDreg_pc_out <= IDreg_pc_out;
    end
    else begin
        IDreg_valid_out <= IDreg_valid_in;
        IDreg_trap_out <= IDreg_trap_in;
        IDreg_inst_out <= IDreg_inst_in;
        IDreg_pc_out <= IDreg_pc_in;
    end
end

endmodule

module ysyx_041461_ID( 

    input   wire [31:0] ID_inst      ,
    input   wire [0:0]  ID_valid_in  ,
    input   wire [63:0] ID_pc        ,
    input   wire [63:0] ID_rs1_data  ,
    input   wire [63:0] ID_rs2_data  ,
    input   wire [3:0]  ID_trap_in   ,
    input   wire [0:0]  ID_conflict  ,
    input   wire [0:0]  ID_IF_ok     ,
    input   wire [0:0]  ID_EXE_ready ,
    input   wire [0:0]  ID_EXE_valid ,
    input   wire [0:0]  ID_MEM_valid ,
    input   wire [0:0]  ID_CD_trap   ,

    output  wire [4:0]  ID_rd        ,
    output  wire [4:0]  ID_rs1       ,
    output  wire [4:0]  ID_rs2       ,
    output  wire [11:0] ID_csr       ,
    output  reg  [63:0] ID_imm       ,
    output  wire [63:0] ID_zimm      ,
    output  reg  [63:0] ID_next_pc   ,
    output  reg  [0:0]  ID_valid_out ,
    output  reg  [0:0]  ID_IFreg_ctrl,
    output  reg  [2:0]  ID_TYPE      ,
    output  reg  [4:0]  ID_EXE_ctrl  ,
    output  reg  [2:0]  ID_EXE_src   ,
    output  reg  [3:0]  ID_MEM_ctrl  ,
    output  reg  [3:0]  ID_WB_ctrl   ,
    output  reg  [3:0]  ID_trap_out  ,
    output  reg  [0:0]  ID_ready     
); 

function [63:0] immI(
    input  [31:0] INST
);

immI = {{52{INST[31:31]}}, INST[31:20]};
endfunction

function [63:0] immS(
    input  [31:0] INST
);

immS = {{52{INST[31:31]}}, INST[31:25], INST[11:7]};
endfunction

function [63:0] immB(
    input  [31:0] INST
);

immB = {{51{INST[31:31]}}, INST[31:31], INST[7:7], INST[30:25], INST[11:8],1'b0};
endfunction

function [63:0] immU(
    input  [31:0] INST
);

immU = {{32{INST[31:31]}}, INST[31:12], 12'b0};
endfunction

function [63:0] immJ(
    input  [31:0] INST
);

immJ = {{43{INST[31:31]}}, INST[31:31], INST[19:12], INST[20:20], INST[30:21], 1'b0};
endfunction

wire  [6:0]  opcode;
wire  [2:0]  funct3;
wire  [5:0]  funct6;
wire  [6:0]  funct7;
wire  [5:0]  shamt;
wire  [0:0]  MRO_csr;
wire  [0:0]  valid_csr;

assign ID_rd   = ID_inst[11:7] ;
assign ID_rs1  = ID_inst[19:15];
assign ID_rs2  = ID_inst[24:20];
assign ID_csr  = ID_inst[31:20];
assign shamt   = ID_inst[25:20];
assign ID_zimm = {59'b0, ID_inst[19:15]};
assign opcode = ID_inst[6:0]  ;
assign funct3 = ID_inst[14:12];
assign funct6 = ID_inst[31:26];
assign funct7 = ID_inst[31:25];
assign MRO_csr = ID_csr[11:10] == 2'b11;
assign valid_csr = ID_csr == `ysyx_041461_MVENDORID || ID_csr == `ysyx_041461_MARCHID || ID_csr == `ysyx_041461_MIMPID || ID_csr == `ysyx_041461_MHARTID || ID_csr == `ysyx_041461_MSTATUS || ID_csr == `ysyx_041461_MISA || ID_csr == `ysyx_041461_MIE || ID_csr == `ysyx_041461_MTVEC || ID_csr == `ysyx_041461_MSCRATCH || ID_csr == `ysyx_041461_MEPC || ID_csr == `ysyx_041461_MCAUSE || ID_csr == `ysyx_041461_MTVAL || ID_csr == `ysyx_041461_MIP || ID_csr == `ysyx_041461_MCYCLE || ID_csr == `ysyx_041461_MINSTRET;


//指令译码
always@(*) begin  
    ID_imm = 64'b0;
    ID_next_pc  = 64'b0;
    ID_valid_out = 1'b1;
    ID_IFreg_ctrl  = `ysyx_041461_ID_IFreg_ctrl_NOP;
    ID_TYPE  = `ysyx_041461_TYPE_NOP;
    ID_EXE_ctrl = `ysyx_041461_EXE_NOP;
    ID_EXE_src  = `ysyx_041461_EXE_src_NOP;
    ID_MEM_ctrl = `ysyx_041461_MEM_NOP;
    ID_WB_ctrl  = `ysyx_041461_WB_NOP;
    ID_trap_out = `ysyx_041461_TRAP_NOP;
    if(ID_valid_in == 1'b1 && ID_trap_in == `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0) begin
        case(opcode)
            `ysyx_041461_RV32_R: begin
                ID_EXE_src = `ysyx_041461_EXE_R_R;
                ID_WB_ctrl = `ysyx_041461_WB_EXE;
                case({funct7, funct3})
                    `ysyx_041461_SLL: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SLL;
                    end
                    `ysyx_041461_SRL: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SRL;
                    end
                    `ysyx_041461_SRA: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SRA;
                    end
                    `ysyx_041461_ADD: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_ADD;
                    end
                    `ysyx_041461_SUB: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SUB;
                    end
                    `ysyx_041461_XOR: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_XOR;
                    end
                    `ysyx_041461_OR: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_OR;
                    end
                    `ysyx_041461_AND: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_AND;
                    end
                    `ysyx_041461_SLT: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SLT;
                    end
                    `ysyx_041461_SLTU: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SLTU;
                    end
                    `ysyx_041461_MUL: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_MUL;
                    end
                    `ysyx_041461_MULH: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_MULH;
                    end
                    `ysyx_041461_MULHSU: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_MULHSU;
                    end
                    `ysyx_041461_MULHU: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_MULHU;
                    end
                    `ysyx_041461_DIV: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_DIV;
                    end
                    `ysyx_041461_DIVU: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_DIVU;
                    end
                    `ysyx_041461_REM: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_REM;
                    end
                    `ysyx_041461_REMU: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_REMU;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_RV64_R: begin
                ID_EXE_src = `ysyx_041461_EXE_R_R;
                ID_WB_ctrl = `ysyx_041461_WB_EXE;
                case({funct7, funct3})
                    `ysyx_041461_SLLW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SLLW;
                    end
                    `ysyx_041461_SRLW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SRLW;
                    end
                    `ysyx_041461_SRAW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SRAW;
                    end
                    `ysyx_041461_ADDW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_ADDW;
                    end
                    `ysyx_041461_SUBW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SUBW;
                    end
                    `ysyx_041461_MULW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_MULW;
                    end
                    `ysyx_041461_DIVW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_DIVW;
                    end
                    `ysyx_041461_DIVUW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_DIVUW;
                    end
                    `ysyx_041461_REMW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_REMW;
                    end
                    `ysyx_041461_REMUW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_REMUW;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_RV32_I: begin
                ID_imm = immI(ID_inst);
                ID_EXE_src = `ysyx_041461_EXE_R_I;
                ID_WB_ctrl = `ysyx_041461_WB_EXE;
                case(funct3)
                    `ysyx_041461_FUN3_SLLI: begin
                        case(funct6)
                            `ysyx_041461_FUN6_SLLI: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_SLL;
                            end
                            default: begin
                                ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                            end
                        endcase
                    end
                    `ysyx_041461_FUN3_SRI: begin
                        case(funct6)
                            `ysyx_041461_FUN6_SRLI: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_SRL;
                            end
                            `ysyx_041461_FUN6_SRAI: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_SRA;
                            end
                            default: begin
                                ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                            end
                        endcase
                    end
                    `ysyx_041461_ADDI: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_ADD;
                    end
                    `ysyx_041461_XORI: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_XOR;
                    end
                    `ysyx_041461_ORI: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_OR;
                    end
                    `ysyx_041461_ANDI: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_AND;
                    end
                    `ysyx_041461_SLTI: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SLT;
                    end
                    `ysyx_041461_SLTIU: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_SLTU;
                    end
                endcase
            end
            `ysyx_041461_RV64_I: begin
                ID_imm = immI(ID_inst);
                ID_EXE_src = `ysyx_041461_EXE_R_I;
                ID_WB_ctrl = `ysyx_041461_WB_EXE;
                case(funct3)
                    `ysyx_041461_FUN3_SLLIW: begin
                        case(funct6)
                            `ysyx_041461_FUN6_SLLIW: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_SLLW;
                                case(shamt[5:5])
                                    1'b0: begin
                                        ID_valid_out = ID_valid_in;
                                    end
                                    default: begin
                                        ID_valid_out = 1'b0;
                                    end
                                endcase
                            end
                            default: begin
                                ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                            end
                        endcase
                    end
                    `ysyx_041461_FUN3_SRIW: begin
                        case(funct6)
                            `ysyx_041461_FUN6_SRLIW: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_SRLW;
                                case(shamt[5:5])
                                    1'b0: begin
                                        ID_valid_out = ID_valid_in;
                                    end
                                    default: begin
                                        ID_valid_out = 1'b0;
                                    end
                                endcase
                            end
                            `ysyx_041461_FUN6_SRAIW: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_SRAW;
                                case(shamt[5:5])
                                    1'b0: begin
                                        ID_valid_out = ID_valid_in;
                                    end
                                    default: begin
                                        ID_valid_out = 1'b0;
                                    end
                                endcase
                            end
                            default: begin
                                ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                            end
                        endcase
                    end
                    `ysyx_041461_ADDIW: begin
                        ID_EXE_ctrl = `ysyx_041461_EXE_ADDW;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_Stores: begin
                ID_imm = immS(ID_inst);
                ID_EXE_ctrl = `ysyx_041461_EXE_ADD;
                ID_EXE_src = `ysyx_041461_EXE_R_I;
                case(funct3)
                    `ysyx_041461_SB: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_SB;
                    end
                    `ysyx_041461_SH: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_SH;
                    end
                    `ysyx_041461_SW: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_SW;
                    end
                    `ysyx_041461_SD: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_SD;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_Loads: begin
                ID_imm = immI(ID_inst);
                ID_EXE_ctrl = `ysyx_041461_EXE_ADD;
                ID_EXE_src = `ysyx_041461_EXE_R_I;
                ID_WB_ctrl = `ysyx_041461_WB_MEM;
                case(funct3)
                    `ysyx_041461_LB: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LB;
                    end
                    `ysyx_041461_LH: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LH;
                    end
                    `ysyx_041461_LBU: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LBU;
                    end
                    `ysyx_041461_LHU: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LHU;
                    end
                    `ysyx_041461_LW: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LW;
                    end
                    `ysyx_041461_LWU: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LWU;
                    end
                    `ysyx_041461_LD: begin
                        ID_MEM_ctrl = `ysyx_041461_MEM_LD;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_Branches: begin
                ID_imm = immB(ID_inst);
                ID_next_pc = ID_pc + 64'd4;
                ID_IFreg_ctrl = `ysyx_041461_ID_IFreg_ctrl_IDpc;
                ID_TYPE = `ysyx_041461_TYPE_BRANCHES;
                case(funct3)
                    `ysyx_041461_BEQ: begin
                        if(ID_rs1_data == ID_rs2_data) begin
                            ID_next_pc = ID_pc + ID_imm;
                        end
                    end
                    `ysyx_041461_BNE: begin
                        if(ID_rs1_data != ID_rs2_data) begin
                            ID_next_pc = ID_pc + ID_imm;
                        end
                    end
                    `ysyx_041461_BLT: begin
                        if($signed(ID_rs1_data) < $signed(ID_rs2_data)) begin
                            ID_next_pc = ID_pc + ID_imm;
                        end
                    end
                    `ysyx_041461_BGE: begin
                        if($signed(ID_rs1_data) >= $signed(ID_rs2_data)) begin
                            ID_next_pc = ID_pc + ID_imm;
                        end
                    end
                    `ysyx_041461_BLTU: begin
                        if(ID_rs1_data < ID_rs2_data) begin
                            ID_next_pc = ID_pc + ID_imm;
                        end
                    end
                    `ysyx_041461_BGEU: begin
                        if(ID_rs1_data >= ID_rs2_data) begin
                            ID_next_pc = ID_pc + ID_imm;
                        end
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_Jal: begin
                ID_imm = immJ(ID_inst);
                ID_next_pc = ID_pc + ID_imm;
                ID_IFreg_ctrl = `ysyx_041461_ID_IFreg_ctrl_IDpc;
                ID_TYPE = `ysyx_041461_TYPE_JAL;
                ID_WB_ctrl = `ysyx_041461_WB_SNPC;
            end
            `ysyx_041461_Jalr: begin
                ID_imm = immI(ID_inst);
                case(funct3)
                    `ysyx_041461_JALR: begin
                        ID_next_pc = (ID_rs1_data + ID_imm) & ~64'd1;
                        ID_IFreg_ctrl = `ysyx_041461_ID_IFreg_ctrl_IDpc;
                        ID_TYPE = `ysyx_041461_TYPE_JALR;
                        ID_WB_ctrl = `ysyx_041461_WB_SNPC;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase
            end
            `ysyx_041461_Lui: begin
                ID_imm = immU(ID_inst);
                ID_WB_ctrl = `ysyx_041461_WB_IMM;
            end
            `ysyx_041461_Auipc: begin
                ID_imm = immU(ID_inst);
                ID_EXE_ctrl = `ysyx_041461_EXE_ADD;
                ID_EXE_src = `ysyx_041461_EXE_PC_I;
                ID_WB_ctrl = `ysyx_041461_WB_EXE;
            end
            `ysyx_041461_Privileged: begin
                case(ID_inst[31:7])
                    `ysyx_041461_ECALL: begin
                        ID_trap_out = `ysyx_041461_ID_ECALL;
                    end
                    `ysyx_041461_MRET: begin
                        ID_trap_out = `ysyx_041461_ID_MRET;
                    end
                    `ysyx_041461_EBREAK: begin
                        ID_trap_out = `ysyx_041461_ID_EBREAK;
                    end
                    default: begin
                        case(funct3)
                            `ysyx_041461_CSRRW: begin
                                ID_WB_ctrl = `ysyx_041461_WB_CSR_RS1;
                                if(MRO_csr == 1'b1 || valid_csr == 1'b0) begin
                                    ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                                end
                            end
                            `ysyx_041461_CSRRS:  begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_OR;
                                ID_EXE_src = `ysyx_041461_EXE_R_CSR;
                                if(ID_rs1 == 5'b0) begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_RO;
                                end
                                else begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_EXE;
                                end
                                if((MRO_csr == 1'b1 && ID_rs1 != 5'b0) || valid_csr == 1'b0) begin
                                    ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                                end
                            end
                            `ysyx_041461_CSRRC: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_AND;
                                ID_EXE_src = `ysyx_041461_EXE_NOTR_CSR;
                                if(ID_rs1 == 5'b0) begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_RO;
                                end
                                else begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_EXE;
                                end
                                if((MRO_csr == 1'b1 && ID_rs1 != 5'b0) || valid_csr == 1'b0) begin
                                    ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                                end
                            end
                            `ysyx_041461_CSRRWI: begin
                                ID_WB_ctrl = `ysyx_041461_WB_CSR_ZIMM;
                                if(MRO_csr == 1'b1 || valid_csr == 1'b0) begin
                                    ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                                end
                            end
                            `ysyx_041461_CSRRSI: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_OR;
                                ID_EXE_src = `ysyx_041461_EXE_CSR_ZIMM;
                                if(ID_zimm[4:0] == 5'b0) begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_RO;
                                end
                                else begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_EXE;
                                end
                                if((MRO_csr == 1'b1 && ID_zimm[4:0] != 5'b0) || valid_csr == 1'b0) begin
                                    ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                                end
                            end
                            `ysyx_041461_CSRRCI: begin
                                ID_EXE_ctrl = `ysyx_041461_EXE_AND;
                                ID_EXE_src = `ysyx_041461_EXE_CSR_NOTZIMM;
                                if(ID_zimm[4:0] == 5'b0) begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_RO;
                                end
                                else begin
                                    ID_WB_ctrl = `ysyx_041461_WB_CSR_EXE;
                                end
                                if((MRO_csr == 1'b1 && ID_zimm[4:0] != 5'b0) || valid_csr == 1'b0) begin
                                    ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                                end
                            end
                            default: begin
                                ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                            end
                        endcase
                    end
                endcase
            end
            `ysyx_041461_FENCE: begin
                case(ID_inst[31:7])
                    `ysyx_041461_FENCE_I: begin
                        ID_TYPE = `ysyx_041461_TYPE_FENCE_I;
                        ID_next_pc = ID_pc + 64'd4;
                        ID_IFreg_ctrl = `ysyx_041461_ID_IFreg_ctrl_IDpc;
                    end
                    default: begin
                        ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
                    end
                endcase 
            end
            default: begin
                ID_trap_out = `ysyx_041461_ID_ILLEGAL_INST;
            end
        endcase
    end
    if(ID_valid_in == 1'b1 && ID_trap_in == `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0 && ID_conflict == 1'b0) begin
        case(ID_TYPE)
            `ysyx_041461_TYPE_NOP: begin
                
            end
            `ysyx_041461_TYPE_JAL: begin
                if(ID_IF_ok == 1'b1) begin
                    ID_valid_out = 1'b1;
                end
                else begin
                    ID_valid_out = 1'b0;
                end
            end
            `ysyx_041461_TYPE_JALR: begin
                if(ID_IF_ok == 1'b1) begin
                    ID_valid_out = 1'b1;
                end
                else begin
                    ID_valid_out = 1'b0;
                end
            end
            `ysyx_041461_TYPE_BRANCHES: begin
                if(ID_IF_ok == 1'b1) begin
                    ID_valid_out = 1'b1;
                end
                else begin
                    ID_valid_out = 1'b0;
                end
            end
            `ysyx_041461_TYPE_FENCE_I: begin
                if(ID_IF_ok == 1'b1 && ID_EXE_valid == 1'b0 && ID_MEM_valid == 1'b0) begin
                    ID_valid_out = 1'b1;
                end
                else begin
                    ID_valid_out = 1'b0;
                end
            end
            default: begin
                ID_valid_out = 1'b0;
            end
        endcase
    end
    else if(ID_valid_in == 1'b1 && ID_trap_in == `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0 && ID_conflict == 1'b1) begin
        ID_valid_out = 1'b0;
    end
    else if(ID_valid_in == 1'b1 && ID_trap_in != `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0) begin
        ID_valid_out = 1'b1;
        ID_trap_out = ID_trap_in;
    end
    else begin
        ID_valid_out = 1'b0;
    end
end

always@(*) begin
    if(ID_valid_in == 1'b1 && ID_trap_in == `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0 && ID_conflict == 1'b0) begin
        case(ID_TYPE)
            `ysyx_041461_TYPE_NOP: begin
                if(ID_EXE_ready == 1'b1) begin
                    ID_ready = 1'b1;
                end
                else begin
                    ID_ready = 1'b0;
                end
            end
            `ysyx_041461_TYPE_JAL: begin
                if(ID_EXE_ready == 1'b1 && ID_IF_ok == 1'b1) begin
                    ID_ready = 1'b1;
                end
                else begin
                    ID_ready = 1'b0;
                end
            end
            `ysyx_041461_TYPE_JALR: begin
                if(ID_EXE_ready == 1'b1 && ID_IF_ok == 1'b1) begin
                    ID_ready = 1'b1;
                end
                else begin
                    ID_ready = 1'b0;
                end
            end
            `ysyx_041461_TYPE_BRANCHES: begin
                if(ID_EXE_ready == 1'b1 && ID_IF_ok == 1'b1) begin
                    ID_ready = 1'b1;
                end
                else begin
                    ID_ready = 1'b0;
                end
            end
            `ysyx_041461_TYPE_FENCE_I: begin
                if(ID_IF_ok == 1'b1 && ID_EXE_ready == 1'b1 && ID_EXE_valid == 1'b0 && ID_MEM_valid == 1'b0) begin
                    ID_ready = 1'b1;
                end
                else begin
                    ID_ready = 1'b0;
                end
            end
            default: begin
                ID_ready = 1'b0;
            end
        endcase
    end
    else if(ID_valid_in == 1'b1 && ID_trap_in == `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0 && ID_conflict == 1'b1) begin
        ID_ready = 1'b0;
    end
    else if(ID_valid_in == 1'b1 && ID_trap_in != `ysyx_041461_TRAP_NOP && ID_CD_trap == 1'b0) begin
        if(ID_EXE_ready == 1'b1) begin
            ID_ready = 1'b1;
        end
        else begin
            ID_ready = 1'b0;
        end
    end
    else begin
        ID_ready = 1'b1;
    end
end

endmodule

module  ysyx_041461_EXE_reg(

    input   wire  [0:0]  clk                          ,
    input   wire  [0:0]  rst                          ,
    input   wire  [0:0]  EXEreg_enable                ,
     
    input   wire  [0:0]  EXEreg_valid_in              ,
    input   wire  [3:0]  EXEreg_trap_in               ,
    input   wire  [4:0]  EXEreg_rd_in                 ,
    input   wire  [4:0]  EXEreg_rs1_in                ,
    input   wire  [4:0]  EXEreg_rs2_in                ,
    input   wire  [11:0] EXEreg_csr_in                ,
    input   wire  [63:0] EXEreg_imm_in                ,
    input   wire  [63:0] EXEreg_zimm_in               ,
    input   wire  [63:0] EXEreg_pc_in                 ,
    input   wire  [4:0]  EXEreg_EXE_ctrl_in           ,
    input   wire  [2:0]  EXEreg_EXE_src_in            ,
    input   wire  [3:0]  EXEreg_MEM_ctrl_in           ,
    input   wire  [3:0]  EXEreg_WB_ctrl_in            ,
    input   wire  [31:0] EXEreg_inst_in               ,
          
    output  reg   [0:0]  EXEreg_valid_out             ,
    output  reg   [3:0]  EXEreg_trap_out              ,
    output  reg   [4:0]  EXEreg_rd_out                ,
    output  reg   [4:0]  EXEreg_rs1_out               ,
    output  reg   [4:0]  EXEreg_rs2_out               ,
    output  reg   [11:0] EXEreg_csr_out               ,
    output  reg   [63:0] EXEreg_imm_out               ,
    output  reg   [63:0] EXEreg_zimm_out              ,
    output  reg   [63:0] EXEreg_pc_out                ,
    output  reg   [4:0]  EXEreg_EXE_ctrl_out          ,
    output  reg   [2:0]  EXEreg_EXE_src_out           ,
    output  reg   [3:0]  EXEreg_MEM_ctrl_out          ,
    output  reg   [3:0]  EXEreg_WB_ctrl_out           ,
    output  reg   [31:0] EXEreg_inst_out              
);


//流水线寄存器功能实现

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin  
        EXEreg_valid_out <= 1'b0;
        EXEreg_trap_out <= `ysyx_041461_TRAP_NOP;
        EXEreg_rd_out <= 5'b0;     
        EXEreg_rs1_out <= 5'b0;     
        EXEreg_rs2_out <= 5'b0;    
        EXEreg_csr_out <= 12'b0;     
        EXEreg_imm_out <= 64'b0;   
        EXEreg_zimm_out <= 64'b0;   
        EXEreg_pc_out <= 64'h0000_0000_3000_0000;     
        EXEreg_EXE_ctrl_out <= `ysyx_041461_EXE_NOP;
        EXEreg_EXE_src_out <= `ysyx_041461_EXE_src_NOP;
        EXEreg_MEM_ctrl_out <= `ysyx_041461_MEM_NOP;
        EXEreg_WB_ctrl_out <= `ysyx_041461_WB_NOP;    
        EXEreg_inst_out <= 32'b0;                  
    end
    else if(EXEreg_enable == 1'b0) begin
        EXEreg_valid_out <= EXEreg_valid_out;
        EXEreg_trap_out <= EXEreg_trap_out;
        EXEreg_rd_out <= EXEreg_rd_out;     
        EXEreg_rs1_out <= EXEreg_rs1_out;     
        EXEreg_rs2_out <= EXEreg_rs2_out;    
        EXEreg_csr_out <= EXEreg_csr_out;     
        EXEreg_imm_out <= EXEreg_imm_out;  
        EXEreg_zimm_out <= EXEreg_zimm_out;   
        EXEreg_pc_out <= EXEreg_pc_out;     
        EXEreg_EXE_ctrl_out <= EXEreg_EXE_ctrl_out;
        EXEreg_EXE_src_out <= EXEreg_EXE_src_out;
        EXEreg_MEM_ctrl_out <= EXEreg_MEM_ctrl_out;
        EXEreg_WB_ctrl_out <= EXEreg_WB_ctrl_out;  
        EXEreg_inst_out <= EXEreg_inst_out;
    end
    else begin 
        EXEreg_valid_out <= EXEreg_valid_in;
        EXEreg_trap_out <= EXEreg_trap_in;
        EXEreg_rd_out <= EXEreg_rd_in;     
        EXEreg_rs1_out <= EXEreg_rs1_in;     
        EXEreg_rs2_out <= EXEreg_rs2_in;    
        EXEreg_csr_out <= EXEreg_csr_in;     
        EXEreg_imm_out <= EXEreg_imm_in;   
        EXEreg_zimm_out <= EXEreg_zimm_in;   
        EXEreg_pc_out <= EXEreg_pc_in;     
        EXEreg_EXE_ctrl_out <= EXEreg_EXE_ctrl_in;
        EXEreg_EXE_src_out <= EXEreg_EXE_src_in;
        EXEreg_MEM_ctrl_out <= EXEreg_MEM_ctrl_in;
        EXEreg_WB_ctrl_out <= EXEreg_WB_ctrl_in;  
        EXEreg_inst_out <= EXEreg_inst_in;
    end
end

endmodule

module ysyx_041461_EXE(

    input  wire   [0:0]  clk          ,
    input  wire   [0:0]  rst          ,

    input  wire   [0:0]  EXE_valid_in ,
    input  wire   [3:0]  EXE_trap_in  ,
    input  wire   [63:0] EXE_rs1_data ,
    input  wire   [63:0] EXE_rs2_data ,
    input  wire   [63:0] EXE_csr_data ,
    input  wire   [63:0] EXE_imm      ,
    input  wire   [63:0] EXE_zimm     ,
    input  wire   [63:0] EXE_pc       ,
    input  wire   [4:0]  EXE_ctrl     ,
    input  wire   [2:0]  EXE_src      ,
    input  wire   [0:0]  EXE_conflict ,
    input  wire   [0:0]  EXE_MEM_ready,
    input  wire   [0:0]  EXE_CD_trap  ,
    
    output reg    [63:0] EXE_out      ,
    output reg    [0:0]  EXE_valid_out,
    output reg    [0:0]  EXE_ready    ,
    output reg    [0:0]  EXE_ok          
);

reg [1:0] state;
reg [31:0] middle;
reg [63:0] src1;
reg [63:0] src2;
reg [0:0] multiplication;
reg [0:0] division;

reg [0:0] MUL_valid_in;
reg [1:0] MUL_signed;
wire [0:0] MUL_valid_out;
wire [63:0] MUL_result_hi;
wire [63:0] MUL_result_lo;

reg [0:0] DIV_valid_in;
reg [0:0] DIV_signed;
reg [0:0] DIV_divw;
wire [0:0] DIV_valid_out;
wire [63:0] DIV_quotient ;
wire [63:0] DIV_remainder;

reg [63:0] DIV_quotient_out;
reg [63:0] DIV_remainder_out;


always@(*) begin
    if(EXE_ctrl == `ysyx_041461_EXE_MUL || EXE_ctrl == `ysyx_041461_EXE_MULH || EXE_ctrl == `ysyx_041461_EXE_MULHSU || EXE_ctrl == `ysyx_041461_EXE_MULHU || EXE_ctrl == `ysyx_041461_EXE_MULW) begin
        multiplication = 1'b1;
    end
    else begin
        multiplication = 1'b0;
    end
end

always@(*) begin
    if(EXE_ctrl == `ysyx_041461_EXE_DIV || EXE_ctrl == `ysyx_041461_EXE_DIVU || EXE_ctrl == `ysyx_041461_EXE_REM || EXE_ctrl == `ysyx_041461_EXE_REMU || EXE_ctrl == `ysyx_041461_EXE_DIVW || EXE_ctrl == `ysyx_041461_EXE_DIVUW || EXE_ctrl == `ysyx_041461_EXE_REMW || EXE_ctrl == `ysyx_041461_EXE_REMUW) begin
        division = 1'b1;
    end
    else begin
        division = 1'b0;
    end
end

always@(*) begin
    if(EXE_valid_in == 1'b0) begin
        src1 = 64'b0;
        src2 = 64'b0;
    end
    else if(EXE_ctrl == `ysyx_041461_EXE_NOP) begin
        src1 = 64'b0;
        src2 = 64'b0;
    end
    else begin
        case(EXE_src)
            `ysyx_041461_EXE_src_NOP: begin
                src1 = 64'b0;
                src2 = 64'b0;
            end
            `ysyx_041461_EXE_R_R: begin
                src1 = EXE_rs1_data;
                src2 = EXE_rs2_data;
            end
            `ysyx_041461_EXE_R_I: begin
                src1 = EXE_rs1_data;
                src2 = EXE_imm;
            end
            `ysyx_041461_EXE_PC_I: begin
                src1 = EXE_pc;
                src2 = EXE_imm;
            end
            `ysyx_041461_EXE_R_CSR: begin
                src1 = EXE_rs1_data;
                src2 = EXE_csr_data;
            end
            `ysyx_041461_EXE_NOTR_CSR: begin
                src1 = ~EXE_rs1_data;
                src2 = EXE_csr_data;
            end
            `ysyx_041461_EXE_CSR_ZIMM: begin
                src1 = EXE_csr_data;
                src2 = EXE_zimm;
            end
            `ysyx_041461_EXE_CSR_NOTZIMM: begin
                src1 = EXE_csr_data;
                src2 = ~EXE_zimm;
            end
        endcase
    end
end


always@(*) begin
    if(EXE_valid_in == 1'b0 || EXE_trap_in != `ysyx_041461_TRAP_NOP) begin
        middle = 32'b0;
        EXE_out = 64'b0;
    end
    else begin
        case(EXE_ctrl)
            `ysyx_041461_EXE_NOP: begin
                middle = 32'b0;
                EXE_out = 64'b0;
            end
            `ysyx_041461_EXE_SLL: begin
                middle = 32'b0;
                EXE_out = src1 << src2[5:0];
            end
            `ysyx_041461_EXE_SRL: begin
                middle = 32'b0;
                EXE_out = src1 >> src2[5:0];
            end
            `ysyx_041461_EXE_SRA: begin
                middle = 32'b0;
                EXE_out = $signed(src1) >>> src2[5:0];
            end
            `ysyx_041461_EXE_ADD: begin
                middle = 32'b0;
                EXE_out = src1 + src2;
            end
            `ysyx_041461_EXE_SUB: begin
                middle = 32'b0;
                EXE_out = src1 - src2;
            end
            `ysyx_041461_EXE_XOR: begin
                middle = 32'b0;
                EXE_out = src1 ^ src2;
            end
            `ysyx_041461_EXE_OR: begin
                middle = 32'b0;
                EXE_out = src1 | src2;
            end
            `ysyx_041461_EXE_AND: begin
                middle = 32'b0;
                EXE_out = src1 & src2;
            end
            `ysyx_041461_EXE_SLT: begin
                middle = 32'b0;
                if($signed(src1) < $signed(src2)) begin
                    EXE_out = 64'b1;
                end
                else begin
                    EXE_out = 64'b0;
                end
            end
            `ysyx_041461_EXE_SLTU: begin
                middle = 32'b0;
                if(src1 < src2) begin
                    EXE_out = 64'b1;
                end
                else begin
                    EXE_out = 64'b0;
                end
            end
            `ysyx_041461_EXE_MUL: begin
                middle = 32'b0;
                EXE_out = MUL_result_lo;
            end
            `ysyx_041461_EXE_MULH: begin
                middle = 32'b0;
                EXE_out = MUL_result_hi;
            end
            `ysyx_041461_EXE_MULHSU: begin
                middle = 32'b0;
                EXE_out = MUL_result_hi;
            end
            `ysyx_041461_EXE_MULHU: begin
                middle = 32'b0;
                EXE_out = MUL_result_hi;
            end
            `ysyx_041461_EXE_DIV: begin
                middle = 32'b0;
                EXE_out = DIV_quotient_out;
            end
            `ysyx_041461_EXE_DIVU: begin
                middle = 32'b0;
                EXE_out = DIV_quotient_out;
            end
            `ysyx_041461_EXE_REM: begin
                middle = 32'b0;
                EXE_out = DIV_remainder_out;
            end
            `ysyx_041461_EXE_REMU: begin
                middle = 32'b0;
                EXE_out = DIV_remainder_out;
            end
            `ysyx_041461_EXE_SLLW: begin
                middle = src1[31:0] << src2[4:0];
                EXE_out = {{32{middle[31:31]}}, middle[31:0]};
            end
            `ysyx_041461_EXE_SRLW: begin
                middle = src1[31:0] >> src2[4:0];
                EXE_out = {{32{middle[31:31]}}, middle[31:0]};
            end
            `ysyx_041461_EXE_SRAW: begin
                middle = $signed(src1[31:0]) >>> src2[4:0];
                EXE_out = {{32{middle[31:31]}}, middle[31:0]};
            end
            `ysyx_041461_EXE_ADDW: begin
                middle = src1[31:0] + src2[31:0];
                EXE_out = {{32{middle[31:31]}}, middle[31:0]};
            end
            `ysyx_041461_EXE_SUBW: begin
                middle = src1[31:0] - src2[31:0];
                EXE_out = {{32{middle[31:31]}}, middle[31:0]};
            end
            `ysyx_041461_EXE_MULW: begin
                middle = 32'b0;
                EXE_out = {{32{MUL_result_lo[31:31]}}, MUL_result_lo[31:0]};
            end
            `ysyx_041461_EXE_DIVW: begin
                middle = 32'b0;
                EXE_out = {{32{DIV_quotient_out[31:31]}}, DIV_quotient_out[31:0]};
            end
            `ysyx_041461_EXE_DIVUW: begin
                middle = 32'b0;
                EXE_out = {{32{DIV_quotient_out[31:31]}}, DIV_quotient_out[31:0]};
            end
            `ysyx_041461_EXE_REMW: begin
                middle = 32'b0;
                EXE_out = {{32{DIV_remainder_out[31:31]}}, DIV_remainder_out[31:0]};
            end
            `ysyx_041461_EXE_REMUW: begin
                middle = 32'b0;
                EXE_out = {{32{DIV_remainder_out[31:31]}}, DIV_remainder_out[31:0]};
            end
            default: begin
                middle = 32'b0;
                EXE_out = 64'b0;
            end
        endcase
    end
end

always@(*) begin
    if(state == `ysyx_041461_EXE_START) begin
        if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b0) begin
            if(multiplication == 1'b0 && division == 1'b0) begin
                EXE_valid_out = 1'b1;
            end
            else begin
                EXE_valid_out = 1'b0;
            end
        end
        else if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b1)begin
            EXE_valid_out = 1'b0;
        end
        else if(EXE_valid_in == 1'b1 && EXE_trap_in != `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0) begin
            EXE_valid_out = 1'b1;
        end
        else begin
            EXE_valid_out = 1'b0;
        end
    end
    else if(state == `ysyx_041461_EXE_FINISH) begin
        if(EXE_CD_trap == 1'b1) begin
            EXE_valid_out = 1'b0;
        end
        else begin
            EXE_valid_out = 1'b1;
        end
    end
    else begin
        EXE_valid_out = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_EXE_START) begin
        if(EXE_CD_trap == 1'b1) begin
            EXE_ok = 1'b1;
        end
        else begin
            EXE_ok = 1'b0;
        end
    end
    else if(state == `ysyx_041461_EXE_FINISH) begin
        if(EXE_CD_trap == 1'b1) begin
            EXE_ok = 1'b1;
        end
        else begin
            EXE_ok = 1'b0;
        end
    end
    else begin
        EXE_ok = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_EXE_START) begin
        if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b0) begin
            if(multiplication == 1'b0 && division == 1'b0) begin
                if(EXE_MEM_ready == 1'b1) begin
                    EXE_ready = 1'b1;
                end
                else begin
                    EXE_ready = 1'b0;
                end
            end
            else begin
                EXE_ready = 1'b0;
            end
        end
        else if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b1)begin
            EXE_ready = 1'b0;
        end
        else if(EXE_valid_in == 1'b1 && EXE_trap_in != `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0) begin
            if(EXE_MEM_ready == 1'b1) begin
                EXE_ready = 1'b1;
            end
            else begin
                EXE_ready = 1'b0;
            end
        end
        else begin
            EXE_ready = 1'b1;
        end
    end
    else if(state == `ysyx_041461_EXE_FINISH) begin
        if(EXE_MEM_ready == 1'b1) begin
            EXE_ready = 1'b1;
        end
        else begin
            EXE_ready = 1'b0;
        end
    end
    else begin
        EXE_ready = 1'b0;
    end
end

always@(*) begin
    case(EXE_ctrl)
        `ysyx_041461_EXE_MUL: begin
            MUL_signed = `ysyx_041461_MUL_signed_x_signed;
        end
        `ysyx_041461_EXE_MULH: begin
            MUL_signed = `ysyx_041461_MUL_signed_x_signed;
        end
        `ysyx_041461_EXE_MULHSU: begin
            MUL_signed = `ysyx_041461_MUL_signed_x_unsigned;
        end
        `ysyx_041461_EXE_MULHU: begin
            MUL_signed = `ysyx_041461_MUL_unsigned_x_unsigned;
        end
        `ysyx_041461_EXE_MULW: begin
            MUL_signed = `ysyx_041461_MUL_signed_x_signed;
        end
        default: begin
            MUL_signed = `ysyx_041461_MUL_signed_x_signed;
        end
    endcase
end

always@(*) begin
    if(state == `ysyx_041461_EXE_START ) begin
        if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b0) begin
            if(multiplication == 1'b1) begin
                MUL_valid_in = 1'b1;
            end
            else begin
                MUL_valid_in = 1'b0;
            end
        end
        else begin
            MUL_valid_in = 1'b0;
        end
    end
    else begin
        MUL_valid_in = 1'b0;
    end
end


always@(*) begin
    case(EXE_ctrl)
        `ysyx_041461_EXE_DIV: begin
            DIV_signed = 1'b1;
            DIV_divw = 1'b0;
        end
        `ysyx_041461_EXE_DIVU: begin
            DIV_signed = 1'b0;
            DIV_divw = 1'b0;
        end
        `ysyx_041461_EXE_REM: begin
            DIV_signed = 1'b1;
            DIV_divw = 1'b0;
        end
        `ysyx_041461_EXE_REMU: begin
            DIV_signed = 1'b0;
            DIV_divw = 1'b0;
        end
        `ysyx_041461_EXE_DIVW: begin
            DIV_signed = 1'b1;
            DIV_divw = 1'b1;
        end
        `ysyx_041461_EXE_DIVUW: begin
            DIV_signed = 1'b0;
            DIV_divw = 1'b1;
        end
        `ysyx_041461_EXE_REMW: begin
            DIV_signed = 1'b1;
            DIV_divw = 1'b1;
        end
        `ysyx_041461_EXE_REMUW: begin
            DIV_signed = 1'b0;
            DIV_divw = 1'b1;
        end
        default: begin
            DIV_signed = 1'b0;
            DIV_divw = 1'b0;
        end
    endcase
end

always@(*) begin
    if(state == `ysyx_041461_EXE_START ) begin
        if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b0) begin
            if(division == 1'b1) begin
                DIV_valid_in = 1'b1;
            end
            else begin
                DIV_valid_in = 1'b0;
            end
        end
        else begin
            DIV_valid_in = 1'b0;
        end
    end
    else begin
        DIV_valid_in = 1'b0;
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        DIV_quotient_out <= 64'b0;
        DIV_remainder_out <= 64'b0;
    end
    else begin
        if(state == `ysyx_041461_EXE_STATE_DIV) begin
            DIV_quotient_out <= DIV_quotient;
            DIV_remainder_out <= DIV_remainder;
        end
        else begin
            DIV_quotient_out <= DIV_quotient_out;
            DIV_remainder_out <= DIV_remainder_out;
        end
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= `ysyx_041461_EXE_START;
    end
    else begin
        case(state)
            `ysyx_041461_EXE_START: begin
                if(EXE_valid_in == 1'b1 && EXE_trap_in == `ysyx_041461_TRAP_NOP && EXE_CD_trap == 1'b0 && EXE_conflict == 1'b0) begin
                    if(multiplication == 1'b1) begin
                        state <= `ysyx_041461_EXE_STATE_MUL;
                    end
                    else if(division == 1'b1) begin
                        state <= `ysyx_041461_EXE_STATE_DIV;
                    end
                    else begin
                        state <= state;
                    end
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_EXE_STATE_MUL: begin
                if(MUL_valid_out == 1'b1) begin
                    state <= `ysyx_041461_EXE_FINISH;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_EXE_STATE_DIV: begin
                if(DIV_valid_out == 1'b1) begin
                    state <= `ysyx_041461_EXE_FINISH;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_EXE_FINISH: begin
                if(EXE_MEM_ready == 1'b1 || EXE_CD_trap == 1'b1) begin
                    state <= `ysyx_041461_EXE_START;
                end
                else begin
                    state <= state;
                end
            end
        endcase
    end
end

ysyx_041461_MUL MUL(

    .clk              (clk),
    .rst              (rst),

    .MUL_valid_in     (MUL_valid_in),
    .MUL_signed       (MUL_signed),
    .MUL_multiplicand (src1),
    .MUL_multiplier   (src2),

    .MUL_valid_out    (MUL_valid_out),
    .MUL_result_hi    (MUL_result_hi),
    .MUL_result_lo    (MUL_result_lo)
);

ysyx_041461_DIV DIV(

  .clk           (clk),
  .rst           (rst),

  .DIV_valid_in  (DIV_valid_in),
  .DIV_signed    (DIV_signed  ),
  .DIV_divw      (DIV_divw    ),
  .DIV_dividend  (src1),
  .DIV_divisor   (src2),

  .DIV_valid_out (DIV_valid_out),
  .DIV_quotient  (DIV_quotient ),
  .DIV_remainder (DIV_remainder)
);

endmodule

module ysyx_041461_MEM_reg(

    input   wire [0:0]   clk                 ,
    input   wire [0:0]   rst                 ,
    input   wire [0:0]   MEMreg_enable       ,
       
    input   wire [0:0]   MEMreg_valid_in     ,
    input   wire [3:0]   MEMreg_trap_in      ,
    input   wire [63:0]  MEMreg_EXE_in       ,
    input   wire [4:0]   MEMreg_rd_in        ,
    input   wire [4:0]   MEMreg_rs1_in       ,
    input   wire [4:0]   MEMreg_rs2_in       ,
    input   wire [11:0]  MEMreg_csr_in       ,
    input   wire [63:0]  MEMreg_imm_in       ,
    input   wire [63:0]  MEMreg_zimm_in      ,
    input   wire [63:0]  MEMreg_pc_in        ,
    input   wire [3:0]   MEMreg_MEM_ctrl_in  ,
    input   wire [3:0]   MEMreg_WB_ctrl_in   ,
    input   wire [31:0]  MEMreg_inst_in      ,
  
    output  reg  [0:0]   MEMreg_valid_out    ,    
    output  reg  [3:0]   MEMreg_trap_out     ,
    output  reg  [63:0]  MEMreg_EXE_out      ,
    output  reg  [4:0]   MEMreg_rd_out       ,
    output  reg  [4:0]   MEMreg_rs1_out      ,
    output  reg  [4:0]   MEMreg_rs2_out      ,
    output  reg  [11:0]  MEMreg_csr_out      ,
    output  reg  [63:0]  MEMreg_imm_out      ,
    output  reg  [63:0]  MEMreg_zimm_out     ,
    output  reg  [63:0]  MEMreg_pc_out       ,
    output  reg  [3:0]   MEMreg_MEM_ctrl_out ,
    output  reg  [3:0]   MEMreg_WB_ctrl_out  ,
    output  reg  [31:0]  MEMreg_inst_out
);


//流水线寄存器功能实现

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin  
        MEMreg_valid_out <= 1'b0;
        MEMreg_trap_out <= `ysyx_041461_TRAP_NOP;
        MEMreg_EXE_out <= 64'b0;   
        MEMreg_rd_out <= 5'b0;   
        MEMreg_rs1_out <= 5'b0;  
        MEMreg_rs2_out <= 5'b0;
        MEMreg_csr_out <= 12'b0;   
        MEMreg_imm_out <= 64'b0;    
        MEMreg_zimm_out <= 64'b0;   
        MEMreg_pc_out <= 64'h0000_0000_3000_0000;     
        MEMreg_MEM_ctrl_out <= `ysyx_041461_MEM_NOP;
        MEMreg_WB_ctrl_out <= `ysyx_041461_WB_NOP;   
        MEMreg_inst_out <= 32'b0;        
    end
    else if(MEMreg_enable == 1'b0) begin
        MEMreg_valid_out <= MEMreg_valid_out;
        MEMreg_trap_out <= MEMreg_trap_out;
        MEMreg_EXE_out <= MEMreg_EXE_out;   
        MEMreg_rd_out <= MEMreg_rd_out;   
        MEMreg_rs1_out <= MEMreg_rs1_out;  
        MEMreg_rs2_out <= MEMreg_rs2_out;
        MEMreg_csr_out <= MEMreg_csr_out;   
        MEMreg_imm_out <= MEMreg_imm_out;    
        MEMreg_zimm_out <= MEMreg_zimm_out;   
        MEMreg_pc_out <= MEMreg_pc_out;     
        MEMreg_MEM_ctrl_out <= MEMreg_MEM_ctrl_out;
        MEMreg_WB_ctrl_out <= MEMreg_WB_ctrl_out;  
        MEMreg_inst_out <= MEMreg_inst_out;
    end
    else begin 
        MEMreg_valid_out <= MEMreg_valid_in;
        MEMreg_trap_out <= MEMreg_trap_in;     
        MEMreg_EXE_out <= MEMreg_EXE_in;   
        MEMreg_rd_out <= MEMreg_rd_in;   
        MEMreg_rs1_out <= MEMreg_rs1_in;  
        MEMreg_rs2_out <= MEMreg_rs2_in;
        MEMreg_csr_out <= MEMreg_csr_in;   
        MEMreg_imm_out <= MEMreg_imm_in;    
        MEMreg_zimm_out <= MEMreg_zimm_in;   
        MEMreg_pc_out <= MEMreg_pc_in;     
        MEMreg_MEM_ctrl_out <= MEMreg_MEM_ctrl_in;
        MEMreg_WB_ctrl_out <= MEMreg_WB_ctrl_in;  
        MEMreg_inst_out <= MEMreg_inst_in;
    end
end

endmodule

module ysyx_041461_MEM(

    input   wire [0:0]    clk             ,
    input   wire [0:0]    rst             ,
      
    input   wire [0:0]    MEM_valid_in    ,
    input   wire [63:0]   MEM_EXE_in      ,
    input   wire [63:0]   MEM_rs2_data    ,
    input   wire [3:0]    MEM_ctrl        ,  
    input   wire [3:0]    MEM_trap_in     ,
    input   wire [0:0]    MEM_WB_ready    ,
    input   wire [0:0]    MEM_CD_trap     ,
    input   wire [0:0]    MEM_conflict    ,

    output  reg  [0:0]    MEM_valid_out   ,
    output  reg  [0:0]    MEM_ready       ,
    output  reg  [63:0]   MEM_out         ,
    output  reg  [3:0]    MEM_trap_out    ,
    output  reg  [0:0]    MEM_ok          ,

    input   wire [0:0]    MEM_awready     ,
    output  reg  [0:0]    MEM_awvalid     ,
    output  reg  [31:0]   MEM_awaddr      ,
    output  wire [3:0]    MEM_awid        ,
    output  wire [7:0]    MEM_awlen       ,
    output  reg  [2:0]    MEM_awsize      ,
    output  wire [1:0]    MEM_awburst     ,
             
    input   wire [0:0]    MEM_wready      ,
    output  reg  [0:0]    MEM_wvalid      ,
    output  reg  [63:0]   MEM_wdata       ,
    output  reg  [7:0]    MEM_wstrb       ,
    output  reg  [0:0]    MEM_wlast       ,
             
    output  reg  [0:0]    MEM_bready      ,
    input   wire [0:0]    MEM_bvalid      ,
    input   wire [1:0]    MEM_bresp       ,
    input   wire [3:0]    MEM_bid         ,
            
    input   wire [0:0]    MEM_arready     ,
    output  reg  [0:0]    MEM_arvalid     ,
    output  reg  [31:0]   MEM_araddr      ,
    output  wire [3:0]    MEM_arid        ,
    output  wire [7:0]    MEM_arlen       ,
    output  reg  [2:0]    MEM_arsize      ,
    output  wire [1:0]    MEM_arburst     ,
             
    output  reg  [0:0]    MEM_rready      ,
    input   wire [0:0]    MEM_rvalid      ,
    input   wire [1:0]    MEM_rresp       ,
    input   wire [63:0]   MEM_rdata       ,
    input   wire [0:0]    MEM_rlast       ,
    input   wire [3:0]    MEM_rid         ,
       
    output  wire [5:0]    MEM_sram4_addr  , 
    output  wire [0:0]    MEM_sram4_cen   , 
    output  reg  [0:0]    MEM_sram4_wen   , 
    output  reg  [127:0]  MEM_sram4_wmask , 
    output  reg  [127:0]  MEM_sram4_wdata , 
    input   wire [127:0]  MEM_sram4_rdata ,
       
    output  wire [5:0]    MEM_sram5_addr  , 
    output  wire [0:0]    MEM_sram5_cen   , 
    output  reg  [0:0]    MEM_sram5_wen   , 
    output  reg  [127:0]  MEM_sram5_wmask , 
    output  reg  [127:0]  MEM_sram5_wdata , 
    input   wire [127:0]  MEM_sram5_rdata ,
       
    output  wire [5:0]    MEM_sram6_addr  , 
    output  wire [0:0]    MEM_sram6_cen   , 
    output  reg  [0:0]    MEM_sram6_wen   , 
    output  reg  [127:0]  MEM_sram6_wmask , 
    output  reg  [127:0]  MEM_sram6_wdata , 
    input   wire [127:0]  MEM_sram6_rdata ,
       
    output  wire [5:0]    MEM_sram7_addr  , 
    output  wire [0:0]    MEM_sram7_cen   , 
    output  reg  [0:0]    MEM_sram7_wen   , 
    output  reg  [127:0]  MEM_sram7_wmask , 
    output  reg  [127:0]  MEM_sram7_wdata , 
    input   wire [127:0]  MEM_sram7_rdata 
);

parameter MEM_AXI_id = 4'b0001;

parameter OKAY = 2'b00;
parameter EXOKAY = 2'b01;
//parameter SLVERR = 2'b10;
//parameter DECERR = 2'b11;

parameter FIXED = 2'b00;
//parameter INCR = 2'b01;
//parameter WRAP = 2'b10;
//parameter Rserved = 2'b11;


wire [0:0]   load;
wire [0:0]   store;
reg  [0:0]   uncached;
reg  [3:0]   state;

reg  [63:0]  AXI_rdata;
reg  [63:0]  AXI_rdata_next;

reg  [0:0]   V1        [63:0];
reg  [0:0]   V1_next   [63:0];
reg  [22:0]  tag1      [63:0];
reg  [22:0]  tag1_next [63:0];
reg  [0:0]   V2        [63:0];
reg  [0:0]   V2_next   [63:0];
reg  [22:0]  tag2      [63:0];
reg  [22:0]  tag2_next [63:0];
reg  [0:0]   V3        [63:0];
reg  [0:0]   V3_next   [63:0];
reg  [22:0]  tag3      [63:0];
reg  [22:0]  tag3_next [63:0];
reg  [0:0]   V4        [63:0];
reg  [0:0]   V4_next   [63:0];
reg  [22:0]  tag4      [63:0];
reg  [22:0]  tag4_next [63:0];
reg  [0:0]   V5        [63:0];
reg  [0:0]   V5_next   [63:0];
reg  [22:0]  tag5      [63:0];
reg  [22:0]  tag5_next [63:0];
reg  [0:0]   V6        [63:0];
reg  [0:0]   V6_next   [63:0];
reg  [22:0]  tag6      [63:0];
reg  [22:0]  tag6_next [63:0];
reg  [0:0]   V7        [63:0];
reg  [0:0]   V7_next   [63:0];
reg  [22:0]  tag7      [63:0];
reg  [22:0]  tag7_next [63:0];
reg  [0:0]   V8        [63:0];
reg  [0:0]   V8_next   [63:0];
reg  [22:0]  tag8      [63:0];
reg  [22:0]  tag8_next [63:0];

reg  [0:0]   hit1;
reg  [0:0]   hit2;
reg  [0:0]   hit3;
reg  [0:0]   hit4;
reg  [0:0]   hit5;
reg  [0:0]   hit6;
reg  [0:0]   hit7;
reg  [0:0]   hit8;

wire [0:0]   hit;

wire [5:0]   index;
wire [2:0]   offset;
wire [22:0]  tag;

reg  [6:0]   PLRU_tree       [63:0];
reg  [6:0]   PLRU_tree_next  [63:0];
reg  [2:0]   replace_line;

reg [0:0]  align;

wire [0:0] w_sdram;

assign index = MEM_EXE_in[8:3];
assign offset = MEM_EXE_in[2:0];
assign tag = MEM_EXE_in[31:9];

assign hit = hit1 || hit2 || hit3 || hit4 || hit5 || hit6 || hit7 || hit8;

assign load = MEM_ctrl == `ysyx_041461_MEM_LB || MEM_ctrl == `ysyx_041461_MEM_LH || MEM_ctrl == `ysyx_041461_MEM_LBU || MEM_ctrl == `ysyx_041461_MEM_LHU || MEM_ctrl == `ysyx_041461_MEM_LW || MEM_ctrl == `ysyx_041461_MEM_LWU || MEM_ctrl == `ysyx_041461_MEM_LD;
assign store = MEM_ctrl == `ysyx_041461_MEM_SB || MEM_ctrl == `ysyx_041461_MEM_SH || MEM_ctrl == `ysyx_041461_MEM_SW || MEM_ctrl == `ysyx_041461_MEM_SD;

assign w_sdram = MEM_EXE_in[31:26] == 6'b111111;

//在运行pa程序时，需判断地址大小，运行soc程序时只需判断一位
//SOC
always@(*) begin
    if(MEM_EXE_in[31:31] == 1'b1) begin
        uncached = 1'b0;
    end
    else begin
        uncached = 1'b1;
    end
end

//PA
/*
always@(*) begin
    if(MEM_EXE_in[31:0] >= 32'h8000_0000 && MEM_EXE_in[31:0] < 32'h8800_0000) begin
        uncached = 1'b0;
    end
    else begin
        uncached = 1'b1;
    end
end
*/

always@(*) begin
    if(V1[index] == 1'b1) begin
        if(tag1[index] == tag) begin
            hit1 = 1'b1;
        end
        else begin
            hit1 = 1'b0;
        end
    end
    else begin
        hit1 = 1'b0;
    end
end

always@(*) begin
    if(V2[index] == 1'b1) begin
        if(tag2[index] == tag) begin
            hit2 = 1'b1;
        end
        else begin
            hit2 = 1'b0;
        end
    end
    else begin
        hit2 = 1'b0;
    end
end

always@(*) begin
    if(V3[index] == 1'b1) begin
        if(tag3[index] == tag) begin
            hit3 = 1'b1;
        end
        else begin
            hit3 = 1'b0;
        end
    end
    else begin
        hit3 = 1'b0;
    end
end

always@(*) begin
    if(V4[index] == 1'b1) begin
        if(tag4[index] == tag) begin
            hit4 = 1'b1;
        end
        else begin
            hit4 = 1'b0;
        end
    end
    else begin
        hit4 = 1'b0;
    end
end

always@(*) begin
    if(V5[index] == 1'b1) begin
        if(tag5[index] == tag) begin
            hit5 = 1'b1;
        end
        else begin
            hit5 = 1'b0;
        end
    end
    else begin
        hit5 = 1'b0;
    end
end

always@(*) begin
    if(V6[index] == 1'b1) begin
        if(tag6[index] == tag) begin
            hit6 = 1'b1;
        end
        else begin
            hit6 = 1'b0;
        end
    end
    else begin
        hit6 = 1'b0;
    end
end

always@(*) begin
    if(V7[index] == 1'b1) begin
        if(tag7[index] == tag) begin
            hit7 = 1'b1;
        end
        else begin
            hit7 = 1'b0;
        end
    end
    else begin
        hit7 = 1'b0;
    end
end

always@(*) begin
    if(V8[index] == 1'b1) begin
        if(tag8[index] == tag) begin
            hit8 = 1'b1;
        end
        else begin
            hit8 = 1'b0;
        end
    end
    else begin
        hit8 = 1'b0;
    end
end

always@(*) begin
    case(MEM_ctrl)
        `ysyx_041461_MEM_SD: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_SW: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                3'b100: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_SH: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                3'b010: begin
                    align = 1'b1;
                end
                3'b100: begin
                    align = 1'b1;
                end
                3'b110: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_SB: begin
            align = 1'b1;
        end
        `ysyx_041461_MEM_LB: begin
            align = 1'b1;
        end
        `ysyx_041461_MEM_LH: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                3'b010: begin
                    align = 1'b1;
                end
                3'b100: begin
                    align = 1'b1;
                end
                3'b110: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_LBU: begin
            align = 1'b1;
        end
        `ysyx_041461_MEM_LHU: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                3'b010: begin
                    align = 1'b1;
                end
                3'b100: begin
                    align = 1'b1;
                end
                3'b110: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_LW: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                3'b100: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_LWU: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                3'b100: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        `ysyx_041461_MEM_LD: begin
            case(offset)
                3'b000: begin
                    align = 1'b1;
                end
                default: begin
                    align = 1'b0;
                end
            endcase
        end
        default: begin
            align = 1'b1;
        end
    endcase
end

always@(*) begin
    if(MEM_valid_in == 1'b1 && MEM_trap_in == `ysyx_041461_TRAP_NOP && align == 1'b0) begin
        if(load == 1'b1) begin
            MEM_trap_out = `ysyx_041461_MEM_LOAD_MISALIGN;
        end
        else if(store == 1'b1) begin
            MEM_trap_out = `ysyx_041461_MEM_STORE_MISALIGN;
        end
        else begin
            MEM_trap_out = MEM_trap_in;
        end
    end
    else begin
        MEM_trap_out = MEM_trap_in;
    end
end

always@(*) begin
    if(uncached == 1'b1) begin
        MEM_araddr = MEM_EXE_in[31:0];
    end
    else begin
        MEM_araddr = {MEM_EXE_in[31:3], 3'b000};
    end
end

always@(*) begin
    if(uncached == 1'b1 || w_sdram == 1'b1) begin
        MEM_awaddr = MEM_EXE_in[31:0];
    end
    else begin
        MEM_awaddr = {MEM_EXE_in[31:3], 3'b000};
    end
end

always@(*) begin
    if(uncached == 1'b1) begin
        case(MEM_ctrl)
            `ysyx_041461_MEM_LB: begin
                MEM_arsize = 3'b000;
            end
            `ysyx_041461_MEM_LH: begin
                MEM_arsize = 3'b001;
            end
            `ysyx_041461_MEM_LBU: begin
                MEM_arsize = 3'b000;
            end
            `ysyx_041461_MEM_LHU: begin
                MEM_arsize = 3'b001;
            end
            `ysyx_041461_MEM_LW: begin
                MEM_arsize = 3'b010;
            end
            `ysyx_041461_MEM_LWU: begin
                MEM_arsize = 3'b010;
            end
            `ysyx_041461_MEM_LD: begin
                MEM_arsize = 3'b011;
            end
            default: begin
                MEM_arsize = 3'b000;
            end
        endcase
    end
    else begin
        MEM_arsize = 3'b011;
    end
end

always@(*) begin
    if(uncached == 1'b1 || w_sdram == 1'b1) begin
        case(MEM_ctrl)
            `ysyx_041461_MEM_SD: begin
                MEM_awsize = 3'b011;
            end
            `ysyx_041461_MEM_SW: begin
                MEM_awsize = 3'b010;
            end
            `ysyx_041461_MEM_SH: begin
                MEM_awsize = 3'b001;
            end
            `ysyx_041461_MEM_SB: begin
                MEM_awsize = 3'b000;
            end
            default: begin
                MEM_awsize = 3'b000;
            end
        endcase
    end
    else begin
        MEM_awsize = 3'b011;
    end
end

assign MEM_arid = MEM_AXI_id;
assign MEM_arlen = 8'd0;
assign MEM_arburst = FIXED;

assign MEM_awid = MEM_AXI_id;
assign MEM_awlen = 8'd0;
assign MEM_awburst = FIXED;

always@(*) begin
    case(MEM_ctrl)
        `ysyx_041461_MEM_SD: begin
            MEM_wstrb = 8'b1111_1111;
            MEM_wdata = MEM_rs2_data;
        end
        `ysyx_041461_MEM_SW: begin
            case(offset)
                3'b000: begin
                    MEM_wstrb = 8'b0000_1111;
                    MEM_wdata = MEM_rs2_data;
                end
                3'b100: begin
                    MEM_wstrb = 8'b1111_0000;
                    MEM_wdata = MEM_rs2_data << 6'd32;
                end
                default: begin
                    MEM_wstrb = 8'b0000_0000;
                    MEM_wdata = MEM_rs2_data;
                end
            endcase
        end
        `ysyx_041461_MEM_SH: begin
            case(offset)
                3'b000: begin
                    MEM_wstrb = 8'b0000_0011;
                    MEM_wdata = MEM_rs2_data;
                end
                3'b010: begin
                    MEM_wstrb = 8'b0000_1100;
                    MEM_wdata = MEM_rs2_data << 6'd16;
                end
                3'b100: begin
                    MEM_wstrb = 8'b0011_0000;
                    MEM_wdata = MEM_rs2_data << 6'd32;
                end
                3'b110: begin
                    MEM_wstrb = 8'b1100_0000;
                    MEM_wdata = MEM_rs2_data << 6'd48;
                end
                default: begin
                    MEM_wstrb = 8'b0000_0000;
                    MEM_wdata = MEM_rs2_data;
                end
            endcase
        end
        `ysyx_041461_MEM_SB: begin
            case(offset)
                3'b000: begin
                    MEM_wstrb = 8'b0000_0001;
                    MEM_wdata = MEM_rs2_data;
                end
                3'b001: begin
                    MEM_wstrb = 8'b0000_0010;
                    MEM_wdata = MEM_rs2_data << 6'd8;
                end
                3'b010: begin
                    MEM_wstrb = 8'b0000_0100;
                    MEM_wdata = MEM_rs2_data << 6'd16;
                end
                3'b011: begin
                    MEM_wstrb = 8'b0000_1000;
                    MEM_wdata = MEM_rs2_data << 6'd24;
                end
                3'b100: begin
                    MEM_wstrb = 8'b0001_0000;
                    MEM_wdata = MEM_rs2_data << 6'd32;
                end
                3'b101: begin
                    MEM_wstrb = 8'b0010_0000;
                    MEM_wdata = MEM_rs2_data << 6'd40;
                end
                3'b110: begin
                    MEM_wstrb = 8'b0100_0000;
                    MEM_wdata = MEM_rs2_data << 6'd48;
                end
                3'b111: begin
                    MEM_wstrb = 8'b1000_0000;
                    MEM_wdata = MEM_rs2_data << 6'd56;
                end
            endcase
        end
        default: begin
            MEM_wstrb = 8'b0000_0000;
            MEM_wdata = MEM_rs2_data;
        end
    endcase
end


always@(*) begin
    if(state == `ysyx_041461_MEM_RAXI_AR) begin
        MEM_arvalid = 1'b1;
    end
    else begin
        MEM_arvalid = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_RAXI_R) begin
        MEM_rready = 1'b1;
    end
    else begin
        MEM_rready = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_RAXI_R) begin
        AXI_rdata_next = MEM_rdata;
    end
    else begin
        AXI_rdata_next = AXI_rdata;
    end 
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        AXI_rdata <= 64'b0;
    end
    else begin
        AXI_rdata <= AXI_rdata_next;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_WAXI_AW) begin
        MEM_awvalid = 1'b1;
    end
    else begin
        MEM_awvalid = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_WAXI_W) begin
        MEM_wvalid = 1'b1;
        MEM_wlast = 1'b1;
    end
    else begin
        MEM_wvalid = 1'b0;
        MEM_wlast = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_WAXI_B) begin
        MEM_bready = 1'b1;
    end
    else begin
        MEM_bready = 1'b0;
    end
end

integer n;
always@(*) begin
    for(n = 0; n < 64; n = n + 1) begin
        PLRU_tree_next[n] = PLRU_tree[n];
    end
    if(state == `ysyx_041461_MEM_RCACHE) begin
        if(hit1 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b1;
            PLRU_tree_next[index][3:3] = 1'b1;
        end
        else if(hit2 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b1;
            PLRU_tree_next[index][3:3] = 1'b0;
        end
        else if(hit3 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b0;
            PLRU_tree_next[index][4:4] = 1'b1;
        end
        else if(hit4 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b1;
            PLRU_tree_next[index][1:1] = 1'b0;
            PLRU_tree_next[index][4:4] = 1'b0;
        end
        else if(hit5 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b1;
            PLRU_tree_next[index][5:5] = 1'b1;
        end
        else if(hit6 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b1;
            PLRU_tree_next[index][5:5] = 1'b0;
        end
        else if(hit7 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b0;
            PLRU_tree_next[index][6:6] = 1'b1;
        end
        else if(hit8 == 1'b1) begin
            PLRU_tree_next[index][0:0] = 1'b0;
            PLRU_tree_next[index][2:2] = 1'b0;
            PLRU_tree_next[index][6:6] = 1'b0;
        end
    end
end

integer r;
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        for(r = 0; r < 64; r = r + 1) begin
            PLRU_tree[r] <= 7'b0;
        end
    end
    else begin
        for(r = 0; r < 64; r = r + 1) begin
            PLRU_tree[r] <= PLRU_tree_next[r];
        end
    end
end

always@(*) begin
    if(PLRU_tree[index][0:0] == 1'b0) begin
        if(PLRU_tree[index][1:1] == 1'b0) begin
            if(PLRU_tree[index][3:3] == 1'b0) begin
                replace_line = 3'b000;
            end
            else begin
                replace_line = 3'b001;
            end
        end
        else begin
            if(PLRU_tree[index][4:4] == 1'b0) begin 
                replace_line = 3'b010;
            end
            else begin
                replace_line = 3'b011;
            end
        end
    end
    else begin
        if(PLRU_tree[index][2:2] == 1'b0) begin
            if(PLRU_tree[index][5:5] == 1'b0) begin
                replace_line = 3'b100;
            end
            else begin
                replace_line = 3'b101;
            end
        end
        else begin
            if(PLRU_tree[index][6:6] == 1'b0) begin 
                replace_line = 3'b110;
            end
            else begin
                replace_line = 3'b111;
            end
        end
    end
end

integer i;
always@(*) begin
    for(i = 0; i < 64; i = i + 1) begin
        V1_next[i] = V1[i];
        V2_next[i] = V2[i];
        V3_next[i] = V3[i];
        V4_next[i] = V4[i];
        V5_next[i] = V5[i];
        V6_next[i] = V6[i];
        V7_next[i] = V7[i];
        V8_next[i] = V8[i];
        tag1_next[i] = tag1[i];
        tag2_next[i] = tag2[i];
        tag3_next[i] = tag3[i];
        tag4_next[i] = tag4[i];
        tag5_next[i] = tag5[i];
        tag6_next[i] = tag6[i];
        tag7_next[i] = tag7[i];
        tag8_next[i] = tag8[i];
    end
    if(state == `ysyx_041461_MEM_WCACHE) begin
        if(load == 1'b1) begin
            if(V1[index] == 1'b0) begin
                V1_next[index] = 1'b1;
                tag1_next[index] = tag;
            end
            else if(V2[index] == 1'b0) begin
                V2_next[index] = 1'b1;
                tag2_next[index] = tag;
            end
            else if(V3[index] == 1'b0) begin
                V3_next[index] = 1'b1;
                tag3_next[index] = tag;
            end
            else if(V4[index] == 1'b0) begin
                V4_next[index] = 1'b1;
                tag4_next[index] = tag;
            end
            else if(V5[index] == 1'b0) begin
                V5_next[index] = 1'b1;
                tag5_next[index] = tag;
            end
            else if(V6[index] == 1'b0) begin
                V6_next[index] = 1'b1;
                tag6_next[index] = tag;
            end
            else if(V7[index] == 1'b0) begin
                V7_next[index] = 1'b1;
                tag7_next[index] = tag;
            end
            else if(V8[index] == 1'b0) begin
                V8_next[index] = 1'b1;
                tag8_next[index] = tag;
            end
            else begin
                case(replace_line)
                    3'b000: begin
                        tag1_next[index] = tag;
                    end
                    3'b001: begin
                        tag2_next[index] = tag;
                    end
                    3'b010: begin
                        tag3_next[index] = tag;
                    end
                    3'b011: begin
                        tag4_next[index] = tag;
                    end
                    3'b100: begin
                        tag5_next[index] = tag;
                    end
                    3'b101: begin
                        tag6_next[index] = tag;
                    end
                    3'b110: begin
                        tag7_next[index] = tag;
                    end
                    3'b111: begin
                        tag8_next[index] = tag;
                    end
                endcase
            end
        end
    end
end

integer k;
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        for(k = 0; k < 64; k = k + 1) begin
            V1[k] <= 1'b0;
            V2[k] <= 1'b0;
            V3[k] <= 1'b0;
            V4[k] <= 1'b0;
            V5[k] <= 1'b0;
            V6[k] <= 1'b0;
            V7[k] <= 1'b0;
            V8[k] <= 1'b0;
            tag1[k] <= 23'b0;
            tag2[k] <= 23'b0;
            tag3[k] <= 23'b0;
            tag4[k] <= 23'b0;
            tag5[k] <= 23'b0;
            tag6[k] <= 23'b0;
            tag7[k] <= 23'b0;
            tag8[k] <= 23'b0;
        end
    end
    else begin
        for(k = 0; k < 64; k = k + 1) begin
           V1[k] <= V1_next[k];
           V2[k] <= V2_next[k];
           V3[k] <= V3_next[k];
           V4[k] <= V4_next[k];
           V5[k] <= V5_next[k];
           V6[k] <= V6_next[k];
           V7[k] <= V7_next[k];
           V8[k] <= V8_next[k];
           tag1[k] <= tag1_next[k];
           tag2[k] <= tag2_next[k];
           tag3[k] <= tag3_next[k];
           tag4[k] <= tag4_next[k];
           tag5[k] <= tag5_next[k];
           tag6[k] <= tag6_next[k];
           tag7[k] <= tag7_next[k];
           tag8[k] <= tag8_next[k];
        end
    end
end

assign MEM_sram4_addr = index;
assign MEM_sram5_addr = index;
assign MEM_sram6_addr = index;
assign MEM_sram7_addr = index;

assign MEM_sram4_cen = 1'b0;
assign MEM_sram5_cen = 1'b0;
assign MEM_sram6_cen = 1'b0;
assign MEM_sram7_cen = 1'b0;

reg [63:0]  cache_wmask;

always@(*) begin
    case(MEM_ctrl)
        `ysyx_041461_MEM_SD: begin
            cache_wmask = 64'h0000_0000_0000_0000;
        end
        `ysyx_041461_MEM_SW: begin
            case(offset)
                3'b000: begin
                    cache_wmask = 64'hffff_ffff_0000_0000;
                end
                3'b100: begin
                    cache_wmask = 64'h0000_0000_ffff_ffff;
                end
                default: begin
                    cache_wmask = 64'hffff_ffff_ffff_ffff;
                end
            endcase
        end
        `ysyx_041461_MEM_SH: begin
            case(offset)
                3'b000: begin
                    cache_wmask = 64'hffff_ffff_ffff_0000;
                end
                3'b010: begin
                    cache_wmask = 64'hffff_ffff_0000_ffff;
                end
                3'b100: begin
                    cache_wmask = 64'hffff_0000_ffff_ffff;
                end
                3'b110: begin
                    cache_wmask = 64'h0000_ffff_ffff_ffff;
                end
                default: begin
                    cache_wmask = 64'hffff_ffff_ffff_ffff;
                end
            endcase
        end
        `ysyx_041461_MEM_SB: begin
            case(offset)
                3'b000: begin
                    cache_wmask = 64'hffff_ffff_ffff_ff00;
                end
                3'b001: begin
                    cache_wmask = 64'hffff_ffff_ffff_00ff;
                end
                3'b010: begin
                    cache_wmask = 64'hffff_ffff_ff00_ffff;
                end
                3'b011: begin
                    cache_wmask = 64'hffff_ffff_00ff_ffff;
                end
                3'b100: begin
                    cache_wmask = 64'hffff_ff00_ffff_ffff;
                end
                3'b101: begin
                    cache_wmask = 64'hffff_00ff_ffff_ffff;
                end
                3'b110: begin
                    cache_wmask = 64'hff00_ffff_ffff_ffff;
                end
                3'b111: begin
                    cache_wmask = 64'h00ff_ffff_ffff_ffff;
                end
            endcase
        end
        default: begin
            cache_wmask = 64'hffff_ffff_ffff_ffff;
        end
    endcase
end

reg [63:0]  cache_wdata;

always@(*) begin
    if(load == 1'b1) begin
        cache_wdata = AXI_rdata;
    end
    else if(store == 1'b1) begin
        case(MEM_ctrl)
            `ysyx_041461_MEM_SD: begin
                cache_wdata = MEM_rs2_data;
            end
            `ysyx_041461_MEM_SW: begin
                case(offset)
                    3'b000: begin
                        cache_wdata = MEM_rs2_data;
                    end
                    3'b100: begin
                        cache_wdata = MEM_rs2_data << 6'd32;
                    end
                    default: begin
                        cache_wdata = MEM_rs2_data;
                    end
                endcase
            end
            `ysyx_041461_MEM_SH: begin
                case(offset)
                    3'b000: begin
                        cache_wdata = MEM_rs2_data;
                    end
                    3'b010: begin
                        cache_wdata = MEM_rs2_data << 6'd16;
                    end
                    3'b100: begin
                        cache_wdata = MEM_rs2_data << 6'd32;
                    end
                    3'b110: begin
                        cache_wdata = MEM_rs2_data << 6'd48;
                    end
                    default: begin
                        cache_wdata = MEM_rs2_data;
                    end
                endcase
            end
            `ysyx_041461_MEM_SB: begin
                case(offset)
                    3'b000: begin
                        cache_wdata = MEM_rs2_data;
                    end
                    3'b001: begin
                        cache_wdata = MEM_rs2_data << 6'd8;
                    end
                    3'b010: begin
                        cache_wdata = MEM_rs2_data << 6'd16;
                    end
                    3'b011: begin
                        cache_wdata = MEM_rs2_data << 6'd24;
                    end
                    3'b100: begin
                        cache_wdata = MEM_rs2_data << 6'd32;
                    end
                    3'b101: begin
                        cache_wdata = MEM_rs2_data << 6'd40;
                    end
                    3'b110: begin
                        cache_wdata = MEM_rs2_data << 6'd48;
                    end
                    3'b111: begin
                        cache_wdata = MEM_rs2_data << 6'd56;
                    end
                endcase
            end
            default: begin
                cache_wdata = MEM_rs2_data;
            end
        endcase
    end
    else begin
        cache_wdata = 64'b0;
    end
end


always@(*) begin
    MEM_sram4_wen = 1'b1;
    MEM_sram4_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    MEM_sram4_wdata = 128'b0;
    MEM_sram5_wen = 1'b1;
    MEM_sram5_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    MEM_sram5_wdata = 128'b0;
    MEM_sram6_wen = 1'b1;
    MEM_sram6_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    MEM_sram6_wdata = 128'b0;
    MEM_sram7_wen = 1'b1;
    MEM_sram7_wmask = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
    MEM_sram7_wdata = 128'b0;
    if(state == `ysyx_041461_MEM_WCACHE) begin
        if(load == 1'b1) begin
            if(V1[index] == 1'b0) begin
                MEM_sram4_wen = 1'b0;
                MEM_sram4_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                MEM_sram4_wdata = {64'b0, cache_wdata};
            end
            else if(V2[index] == 1'b0) begin
                MEM_sram4_wen = 1'b0;
                MEM_sram4_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                MEM_sram4_wdata = {cache_wdata, 64'b0};
            end
            else if(V3[index] == 1'b0) begin
                MEM_sram5_wen = 1'b0;
                MEM_sram5_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                MEM_sram5_wdata = {64'b0, cache_wdata};
            end
            else if(V4[index] == 1'b0) begin
                MEM_sram5_wen = 1'b0;
                MEM_sram5_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                MEM_sram5_wdata = {cache_wdata, 64'b0};
            end
            else if(V5[index] == 1'b0) begin
                MEM_sram6_wen = 1'b0;
                MEM_sram6_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                MEM_sram6_wdata = {64'b0, cache_wdata};
            end
            else if(V6[index] == 1'b0) begin
                MEM_sram6_wen = 1'b0;
                MEM_sram6_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                MEM_sram6_wdata = {cache_wdata, 64'b0};
            end
            else if(V7[index] == 1'b0) begin
                MEM_sram7_wen = 1'b0;
                MEM_sram7_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                MEM_sram7_wdata = {64'b0, cache_wdata};
            end
            else if(V8[index] == 1'b0) begin
                MEM_sram7_wen = 1'b0;
                MEM_sram7_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                MEM_sram7_wdata = {cache_wdata, 64'b0};
            end
            else begin
                case(replace_line)
                    3'b000: begin
                        MEM_sram4_wen = 1'b0;
                        MEM_sram4_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                        MEM_sram4_wdata = {64'b0, cache_wdata};
                    end
                    3'b001: begin
                        MEM_sram4_wen = 1'b0;
                        MEM_sram4_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                        MEM_sram4_wdata = {cache_wdata, 64'b0};
                    end
                    3'b010: begin
                        MEM_sram5_wen = 1'b0;
                        MEM_sram5_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                        MEM_sram5_wdata = {64'b0, cache_wdata};
                    end
                    3'b011: begin
                        MEM_sram5_wen = 1'b0;
                        MEM_sram5_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                        MEM_sram5_wdata = {cache_wdata, 64'b0};
                    end
                    3'b100: begin
                        MEM_sram6_wen = 1'b0;
                        MEM_sram6_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                        MEM_sram6_wdata = {64'b0, cache_wdata};
                    end
                    3'b101: begin
                        MEM_sram6_wen = 1'b0;
                        MEM_sram6_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                        MEM_sram6_wdata = {cache_wdata, 64'b0};
                    end
                    3'b110: begin
                        MEM_sram7_wen = 1'b0;
                        MEM_sram7_wmask = 128'hffff_ffff_ffff_ffff_0000_0000_0000_0000;
                        MEM_sram7_wdata = {64'b0, cache_wdata};
                    end
                    3'b111: begin
                        MEM_sram7_wen = 1'b0;
                        MEM_sram7_wmask = 128'h0000_0000_0000_0000_ffff_ffff_ffff_ffff;
                        MEM_sram7_wdata = {cache_wdata, 64'b0};
                    end
                endcase
            end
        end
        else if(store == 1'b1) begin
            if(hit1 == 1'b1) begin
                MEM_sram4_wen = 1'b0;
                MEM_sram4_wmask = {64'hffff_ffff_ffff_ffff, cache_wmask};
                MEM_sram4_wdata = {64'b0, cache_wdata};
            end
            else if(hit2 == 1'b1) begin
                MEM_sram4_wen = 1'b0;
                MEM_sram4_wmask = {cache_wmask, 64'hffff_ffff_ffff_ffff};
                MEM_sram4_wdata = {cache_wdata, 64'b0};
            end
            else if(hit3 == 1'b1) begin
                MEM_sram5_wen = 1'b0;
                MEM_sram5_wmask = {64'hffff_ffff_ffff_ffff, cache_wmask};
                MEM_sram5_wdata = {64'b0, cache_wdata};
            end
            else if(hit4 == 1'b1) begin
                MEM_sram5_wen = 1'b0;
                MEM_sram5_wmask = {cache_wmask, 64'hffff_ffff_ffff_ffff};
                MEM_sram5_wdata = {cache_wdata, 64'b0};
            end
            else if(hit5 == 1'b1) begin
                MEM_sram6_wen = 1'b0;
                MEM_sram6_wmask = {64'hffff_ffff_ffff_ffff, cache_wmask};
                MEM_sram6_wdata = {64'b0, cache_wdata};
            end
            else if(hit6 == 1'b1) begin
                MEM_sram6_wen = 1'b0;
                MEM_sram6_wmask = {cache_wmask, 64'hffff_ffff_ffff_ffff};
                MEM_sram6_wdata = {cache_wdata, 64'b0};
            end
            else if(hit7 == 1'b1) begin
                MEM_sram7_wen = 1'b0;
                MEM_sram7_wmask = {64'hffff_ffff_ffff_ffff, cache_wmask};
                MEM_sram7_wdata = {64'b0, cache_wdata};
            end
            else if(hit8 == 1'b1) begin
                MEM_sram7_wen = 1'b0;
                MEM_sram7_wmask = {cache_wmask, 64'hffff_ffff_ffff_ffff};
                MEM_sram7_wdata = {cache_wdata, 64'b0};
            end
        end
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_START) begin
        if(MEM_CD_trap == 1'b1) begin
            MEM_ok = 1'b1;
        end
        else begin
            MEM_ok = 1'b0;
        end
    end
    else if(state == `ysyx_041461_MEM_FINISH) begin
        if(MEM_CD_trap == 1'b1) begin
            MEM_ok = 1'b1;
        end
        else begin
            MEM_ok = 1'b0;
        end
    end
    else begin
        MEM_ok = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_START) begin
        if(MEM_valid_in == 1'b1 && MEM_trap_out == `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0 && MEM_conflict == 1'b0) begin
            if(MEM_ctrl == `ysyx_041461_MEM_NOP) begin
                if(MEM_WB_ready == 1'b1) begin
                    MEM_ready = 1'b1;
                end
                else begin
                    MEM_ready = 1'b0;
                end
            end
            else begin
                MEM_ready = 1'b0;
            end
        end
        else if(MEM_valid_in == 1'b1 && MEM_trap_out == `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0 && MEM_conflict == 1'b1) begin
            MEM_ready = 1'b0;
        end
        else if(MEM_valid_in == 1'b1 && MEM_trap_out != `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0) begin
            if(MEM_WB_ready == 1'b1) begin
                MEM_ready = 1'b1;
            end
            else begin
                MEM_ready = 1'b0;
            end
        end
        else begin
            MEM_ready = 1'b1;
        end
    end
    else if(state == `ysyx_041461_MEM_FINISH) begin
        if(MEM_WB_ready == 1'b1) begin
            MEM_ready = 1'b1;
        end
        else begin
            MEM_ready = 1'b0;
        end
    end
    else begin
        MEM_ready = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_MEM_START) begin
        if(MEM_valid_in == 1'b1 && MEM_trap_out == `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0 && MEM_conflict == 1'b0) begin
            if(MEM_ctrl == `ysyx_041461_MEM_NOP) begin
                MEM_valid_out = 1'b1;
            end
            else begin
                MEM_valid_out = 1'b0;
            end
        end
        else if(MEM_valid_in == 1'b1 && MEM_trap_out == `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0 && MEM_conflict == 1'b1) begin
            MEM_valid_out = 1'b0;
        end
        else if(MEM_valid_in == 1'b1 && MEM_trap_out != `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0) begin
            MEM_valid_out = 1'b1;
        end
        else begin
            MEM_valid_out = 1'b0;
        end
    end
    else if(state == `ysyx_041461_MEM_FINISH) begin
        if(MEM_CD_trap == 1'b1) begin
            MEM_valid_out = 1'b0;
        end
        else begin
            MEM_valid_out = 1'b1;
        end
    end
    else begin
        MEM_valid_out = 1'b0;
    end
end


reg [63:0]  rdata;
reg [63:0]  rrdata;

always@(*) begin
    if(uncached == 1'b1) begin
        rdata = AXI_rdata;
    end
    else begin
        if(hit1 == 1'b1) begin
            rdata = MEM_sram4_rdata[63:0];
        end
        else if(hit2 == 1'b1) begin
            rdata = MEM_sram4_rdata[127:64];
        end
        else if(hit3 == 1'b1) begin
            rdata = MEM_sram5_rdata[63:0];
        end
        else if(hit4 == 1'b1) begin
            rdata = MEM_sram5_rdata[127:64];
        end
        else if(hit5 == 1'b1) begin
            rdata = MEM_sram6_rdata[63:0];
        end
        else if(hit6 == 1'b1) begin
            rdata = MEM_sram6_rdata[127:64];
        end
        else if(hit7 == 1'b1) begin
            rdata = MEM_sram7_rdata[63:0];
        end
        else if(hit8 == 1'b1) begin
            rdata = MEM_sram7_rdata[127:64];
        end
        else begin
            rdata = 64'd0;
        end
    end
end

always@(*) begin
    case(offset)
        3'b000: begin
            rrdata = rdata;
        end
        3'b001: begin
            rrdata = rdata >> 6'd8;
        end
        3'b010: begin
            rrdata = rdata >> 6'd16;
        end
        3'b011: begin
            rrdata = rdata >> 6'd24;
        end
        3'b100: begin
            rrdata = rdata >> 6'd32;
        end
        3'b101: begin
            rrdata = rdata >> 6'd40;
        end
        3'b110: begin
            rrdata = rdata >> 6'd48;
        end
        3'b111: begin
            rrdata = rdata >> 6'd56;
        end
    endcase
end

 
always@(*) begin
    case(MEM_ctrl)
        `ysyx_041461_MEM_LB: begin
            MEM_out = {{56{rrdata[7:7]}}, rrdata[7:0]};
        end
        `ysyx_041461_MEM_LH: begin
            MEM_out = {{48{rrdata[15:15]}}, rrdata[15:0]};
        end
        `ysyx_041461_MEM_LBU: begin
            MEM_out = {56'b0, rrdata[7:0]};
        end
        `ysyx_041461_MEM_LHU: begin
            MEM_out = {48'b0, rrdata[15:0]};
        end
        `ysyx_041461_MEM_LW: begin
            MEM_out = {{32{rrdata[31:31]}}, rrdata[31:0]};
        end
        `ysyx_041461_MEM_LWU: begin
            MEM_out = {32'b0, rrdata[31:0]};
        end
        `ysyx_041461_MEM_LD: begin
            MEM_out = rrdata;
        end
        default: begin
            MEM_out = 64'b0;
        end
    endcase
end




always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= `ysyx_041461_MEM_START;
    end
    else begin
        case(state)
            `ysyx_041461_MEM_START: begin
                if(MEM_valid_in == 1'b1 && MEM_trap_out == `ysyx_041461_TRAP_NOP && MEM_CD_trap == 1'b0 && MEM_conflict == 1'b0) begin
                    if(load == 1'b1) begin
                        if(uncached == 1'b1) begin
                            state <= `ysyx_041461_MEM_RAXI_AR;
                        end
                        else begin
                            if(hit == 1'b1) begin
                                state <= `ysyx_041461_MEM_RCACHE;
                            end
                            else begin
                                state <= `ysyx_041461_MEM_RAXI_AR;
                            end
                        end
                    end
                    else if(store == 1'b1) begin
                        state <= `ysyx_041461_MEM_WAXI_AW;
                    end
                    else begin
                        state <= state;
                    end
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_RCACHE: begin
                state <= `ysyx_041461_MEM_FINISH;
            end
            `ysyx_041461_MEM_RAXI_AR: begin
                if(MEM_arready == 1'b1) begin
                    state <= `ysyx_041461_MEM_RAXI_R;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_RAXI_R: begin
                if(MEM_rvalid == 1'b1 && MEM_rid == MEM_AXI_id && MEM_rlast == 1'b1 && (MEM_rresp == OKAY || MEM_rresp == EXOKAY)) begin
                    if(uncached == 1'b1) begin
                        state <= `ysyx_041461_MEM_FINISH;
                    end
                    else begin
                        state <= `ysyx_041461_MEM_WCACHE;
                    end
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_WCACHE: begin
                if(store == 1'b1) begin
                    state <= `ysyx_041461_MEM_FINISH;
                end
                else if(load == 1'b1) begin
                    state <= `ysyx_041461_MEM_RCACHE;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_WAXI_AW: begin
                if(MEM_awready == 1'b1) begin
                    state <= `ysyx_041461_MEM_WAXI_W;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_WAXI_W: begin
                if(MEM_wready == 1'b1) begin
                    state <= `ysyx_041461_MEM_WAXI_B;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_WAXI_B: begin
                if(MEM_bvalid == 1'b1 && (MEM_bresp == OKAY || MEM_bresp == EXOKAY) && MEM_bid == MEM_AXI_id) begin
                    if(hit == 1'b1) begin
                        state <= `ysyx_041461_MEM_WCACHE;
                    end
                    else begin
                        state <= `ysyx_041461_MEM_FINISH;
                    end
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_MEM_FINISH: begin
                if(MEM_WB_ready == 1'b1 || MEM_CD_trap == 1'b1) begin
                    state <= `ysyx_041461_MEM_START;
                end
                else begin
                    state <= state;
                end
            end
            default: begin
                state <= `ysyx_041461_MEM_START;
            end
        endcase
    end      
end

endmodule

module ysyx_041461_WB_reg(

    input   wire [0:0]   clk                ,
    input   wire [0:0]   rst                ,
    input   wire [0:0]   WBreg_enable       ,
         
    input   wire [0:0]   WBreg_valid_in     ,
    input   wire [3:0]   WBreg_trap_in      ,
    input   wire [63:0]  WBreg_EXE_in       ,
    input   wire [63:0]  WBreg_MEM_in       ,
    input   wire [4:0]   WBreg_rd_in        ,
    input   wire [4:0]   WBreg_rs1_in       ,
    input   wire [11:0]  WBreg_csr_in       ,
    input   wire [63:0]  WBreg_imm_in       ,
    input   wire [63:0]  WBreg_zimm_in      ,
    input   wire [63:0]  WBreg_pc_in        ,
    input   wire [3:0]   WBreg_WB_ctrl_in   ,
    input   wire [31:0]  WBreg_inst_in      ,
         
    output  reg  [0:0]   WBreg_valid_out    , 
    output  reg  [3:0]   WBreg_trap_out     ,
    output  reg  [63:0]  WBreg_EXE_out      ,
    output  reg  [63:0]  WBreg_MEM_out      ,
    output  reg  [4:0]   WBreg_rd_out       ,
    output  reg  [4:0]   WBreg_rs1_out      ,
    output  reg  [11:0]  WBreg_csr_out      ,
    output  reg  [63:0]  WBreg_imm_out      ,
    output  reg  [63:0]  WBreg_zimm_out     ,
    output  reg  [63:0]  WBreg_pc_out       ,
    output  reg  [3:0]   WBreg_WB_ctrl_out  ,
    output  reg  [31:0]  WBreg_inst_out
);


//流水线寄存器功能实现

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin  
        WBreg_valid_out <= 1'b0;
        WBreg_trap_out <= `ysyx_041461_TRAP_NOP;
        WBreg_EXE_out <= 64'b0;
        WBreg_MEM_out <= 64'b0;   
        WBreg_rd_out <= 5'b0;     
        WBreg_rs1_out <= 5'b0;
        WBreg_csr_out <= 12'b0;   
        WBreg_imm_out <= 64'b0;    
        WBreg_zimm_out <= 64'b0;   
        WBreg_pc_out <= 64'h0000_0000_3000_0000;     
        WBreg_WB_ctrl_out <= `ysyx_041461_WB_NOP;  
        WBreg_inst_out <= 32'b0;     
    end
    else if(WBreg_enable == 1'b0) begin
        WBreg_valid_out <= WBreg_valid_out;
        WBreg_trap_out <= WBreg_trap_out;
        WBreg_EXE_out <= WBreg_EXE_out;
        WBreg_MEM_out <= WBreg_MEM_out;   
        WBreg_rd_out <= WBreg_rd_out;    
        WBreg_rs1_out <= WBreg_rs1_out; 
        WBreg_csr_out <= WBreg_csr_out;   
        WBreg_imm_out <= WBreg_imm_out;    
        WBreg_zimm_out <= WBreg_zimm_out;   
        WBreg_pc_out <= WBreg_pc_out;     
        WBreg_WB_ctrl_out <= WBreg_WB_ctrl_out;  
        WBreg_inst_out <= WBreg_inst_out;
    end
    else begin 
        WBreg_valid_out <= WBreg_valid_in;
        WBreg_trap_out <= WBreg_trap_in;
        WBreg_EXE_out <= WBreg_EXE_in;
        WBreg_MEM_out <= WBreg_MEM_in;   
        WBreg_rd_out <= WBreg_rd_in;  
        WBreg_rs1_out <= WBreg_rs1_in;   
        WBreg_csr_out <= WBreg_csr_in;   
        WBreg_imm_out <= WBreg_imm_in;    
        WBreg_zimm_out <= WBreg_zimm_in;   
        WBreg_pc_out <= WBreg_pc_in;     
        WBreg_WB_ctrl_out <= WBreg_WB_ctrl_in;  
        WBreg_inst_out <= WBreg_inst_in;
    end
end

endmodule

module ysyx_041461_WB(

    input   wire [0:0]   clk            ,
    input   wire [0:0]   rst            ,
    input   wire [0:0]   WB_valid       ,

    input   wire [0:0]   WB_IF_ok       ,
    input   wire [0:0]   WB_EXE_ok      ,
    input   wire [0:0]   WB_MEM_ok      ,
                
    input   wire [4:0]   WB_ID_rs1      ,
    input   wire [4:0]   WB_ID_rs2      ,
         
    input   wire [4:0]   WB_EXE_rs1     ,
    input   wire [4:0]   WB_EXE_rs2     ,
    input   wire [11:0]  WB_EXE_csr     ,
         
    input   wire [4:0]   WB_MEM_rs2     ,

    input   wire [31:0]  WB_inst        ,
         
    input   wire [63:0]  WB_EXE_in      ,
    input   wire [63:0]  WB_MEM_in      ,
    input   wire [4:0]   WB_rd          ,
    input   wire [4:0]   WB_rs1         ,
    input   wire [11:0]  WB_csr         ,
    input   wire [63:0]  WB_imm         ,
    input   wire [63:0]  WB_zimm        ,
    input   wire [63:0]  WB_pc          ,
    input   wire [3:0]   WB_ctrl        ,
    input   wire [3:0]   WB_trap        ,
    input   wire [0:0]   WB_interrupt   ,

    output  reg  [0:0]   WB_ready       ,  

    output  wire [63:0]  WB_IFreg_mtvec ,
    output  wire [63:0]  WB_IFreg_mepc  ,
    output  reg  [62:0]  WB_IFreg_CAUSE ,
    output  reg  [1:0]   WB_IFreg_ctrl  ,  

    output  wire [63:0]  WB_IF_mstatus  ,
    output  wire [63:0]  WB_IF_mie      ,
    output  wire [63:0]  WB_IF_mip      ,  
        
    output  wire [63:0]  WB_ID_rs1_data ,
    output  wire [63:0]  WB_ID_rs2_data ,
        
    output  wire [63:0]  WB_EXE_rs1_data,
    output  wire [63:0]  WB_EXE_rs2_data,
    output  reg  [63:0]  WB_EXE_csr_data,

    output  wire [63:0]  WB_MEM_rs2_data

);

reg [63:0] x [31:0];    //寄存器现态的值
reg [63:0] d [31:0];    //寄存器次态的值

reg [63:0] t;
reg [63:0] c;

reg [63:0] mhartid;
reg [63:0] mhartid_next;
reg [63:0] mstatus;
reg [63:0] mstatus_next;
reg [63:0] misa;
reg [63:0] misa_next;
reg [63:0] mie;
reg [63:0] mie_next;
reg [63:0] mtvec;
reg [63:0] mtvec_next;
reg [63:0] mscratch;
reg [63:0] mscratch_next;
reg [63:0] mepc;
reg [63:0] mepc_next;
reg [63:0] mcause;
reg [63:0] mcause_next;
reg [63:0] mip;
reg [63:0] mip_next;
reg [63:0] mcycle;
reg [63:0] mcycle_next;
reg [63:0] minstret;
reg [63:0] minstret_next;
reg [63:0] mtval;
reg [63:0] mtval_next;


integer i;
integer j;

assign WB_IFreg_mtvec = mtvec;
assign WB_IFreg_mepc = mepc;

assign WB_IF_mstatus = mstatus;
assign WB_IF_mie     = mie;
assign WB_IF_mip     = mip;

assign WB_ID_rs1_data = x[WB_ID_rs1];
assign WB_ID_rs2_data = x[WB_ID_rs2];

assign WB_EXE_rs1_data = x[WB_EXE_rs1];
assign WB_EXE_rs2_data = x[WB_EXE_rs2];

assign WB_MEM_rs2_data = x[WB_MEM_rs2];

always@(*) begin
    if(WB_valid == 1'b1) begin
        if(WB_trap != `ysyx_041461_TRAP_NOP && (WB_IF_ok == 1'b0 || WB_EXE_ok == 1'b0 || WB_MEM_ok == 1'b0)) begin
            WB_ready = 1'b0;
        end
        else begin
            WB_ready = 1'b1;
        end
    end
    else begin
        WB_ready = 1'b1;
    end
end

always@(*) begin
    case(WB_EXE_csr)
        `ysyx_041461_MVENDORID: begin
            WB_EXE_csr_data = 64'b0;
        end
        `ysyx_041461_MARCHID: begin
            WB_EXE_csr_data = 64'b0;
        end
        `ysyx_041461_MIMPID: begin
            WB_EXE_csr_data = 64'b0;
        end
        `ysyx_041461_MHARTID: begin
            WB_EXE_csr_data = mhartid;
        end
        `ysyx_041461_MSTATUS: begin
            WB_EXE_csr_data = mstatus;
        end
        `ysyx_041461_MISA: begin
            WB_EXE_csr_data = misa;
        end
        `ysyx_041461_MIE: begin
            WB_EXE_csr_data = mie;
        end
        `ysyx_041461_MTVEC: begin
            WB_EXE_csr_data = mtvec;
        end
        `ysyx_041461_MSCRATCH: begin
            WB_EXE_csr_data = mscratch;
        end
        `ysyx_041461_MEPC: begin
            WB_EXE_csr_data = mepc;
        end
        `ysyx_041461_MCAUSE: begin
            WB_EXE_csr_data = mcause;
        end
        `ysyx_041461_MIP: begin
            WB_EXE_csr_data = mip;
        end
        `ysyx_041461_MCYCLE: begin
            WB_EXE_csr_data = mcycle;
        end
        `ysyx_041461_MINSTRET: begin
            WB_EXE_csr_data = minstret;
        end
        `ysyx_041461_MTVAL: begin
            WB_EXE_csr_data = mtval;
        end
        default: begin
            WB_EXE_csr_data = 64'b0;
        end
    endcase
end

always@(*) begin
    if(WB_valid == 1'b1) begin
        case(WB_trap)
            `ysyx_041461_TRAP_NOP: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_NOP;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_IF_MISALIGN: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_ID_ECALL: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_ID_MRET: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MEPC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_ID_EBREAK: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_ID_ILLEGAL_INST: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_MEM_LOAD_MISALIGN: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_MEM_STORE_MISALIGN: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'b0;
            end
            `ysyx_041461_TIMER_INTERRUPT: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_MTVEC;
                WB_IFreg_CAUSE = 63'd7;
            end
            default: begin
                WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_NOP;
                WB_IFreg_CAUSE = 63'b0;
            end
        endcase
    end
    else begin
        WB_IFreg_ctrl = `ysyx_041461_WB_IFreg_ctrl_NOP;
        WB_IFreg_CAUSE = 63'b0;
    end
end

always@(*) begin
    case(WB_csr)
        `ysyx_041461_MVENDORID: begin
            t = 64'b0;
        end
        `ysyx_041461_MARCHID: begin
            t = 64'b0;
        end
        `ysyx_041461_MIMPID: begin
            t = 64'b0;
        end
        `ysyx_041461_MHARTID: begin
            t = mhartid;
        end
        `ysyx_041461_MSTATUS: begin
            t = mstatus;
        end
        `ysyx_041461_MISA: begin
            t = misa;
        end
        `ysyx_041461_MIE: begin
            t = mie;
        end
        `ysyx_041461_MTVEC: begin
            t = mtvec;
        end
        `ysyx_041461_MSCRATCH: begin
            t = mscratch;
        end
        `ysyx_041461_MEPC: begin
            t = mepc;
        end
        `ysyx_041461_MCAUSE: begin
            t = mcause;
        end
        `ysyx_041461_MIP: begin
            t = mip;
        end
        `ysyx_041461_MCYCLE: begin
            t = mcycle;
        end
        `ysyx_041461_MINSTRET: begin
            t = minstret;
        end
        `ysyx_041461_MTVAL: begin
            t = mtval;
        end
        default: begin
            t = 64'b0;
        end
    endcase
end

always@(*) begin
    case(WB_ctrl)
        `ysyx_041461_WB_CSR_RS1: begin
            c = x[WB_rs1];
        end
        `ysyx_041461_WB_CSR_EXE: begin
            c = WB_EXE_in;
        end
        `ysyx_041461_WB_CSR_ZIMM: begin
            c = WB_zimm;
        end
        default: begin
            c = 64'b0;
        end
    endcase
end

always@(*) begin
    for(i = 0; i < 32; i = i + 1) begin
        d[i] = x[i];
    end
    if(WB_valid == 1'b1 && WB_trap == `ysyx_041461_TRAP_NOP) begin
        case(WB_ctrl)
            `ysyx_041461_WB_NOP: begin

            end
            `ysyx_041461_WB_EXE: begin
                d[WB_rd] = WB_EXE_in;
            end
            `ysyx_041461_WB_MEM: begin
                d[WB_rd] = WB_MEM_in;
            end
            `ysyx_041461_WB_IMM: begin
                d[WB_rd] = WB_imm;
            end        
            `ysyx_041461_WB_SNPC: begin
                d[WB_rd] = WB_pc + 64'd4;
            end
            `ysyx_041461_WB_CSR_RS1: begin
                d[WB_rd] = t;
            end
            `ysyx_041461_WB_CSR_EXE: begin
                d[WB_rd] = t;
            end
            `ysyx_041461_WB_CSR_ZIMM: begin
                d[WB_rd] = t;
            end
            `ysyx_041461_WB_CSR_RO: begin
                d[WB_rd] = t;
            end
            default: begin

            end
        endcase
    end
    d[0] = 64'b0;
end

always@(*) begin
    mhartid_next = mhartid;
    mstatus_next = mstatus;
    misa_next = misa;
    mie_next = mie; 
    mtvec_next = mtvec;
    mscratch_next = mscratch;
    mepc_next = mepc;
    mcause_next = mcause;
    mip_next = mip; 
    mcycle_next = mcycle + 1'b1;
    minstret_next = minstret;
    mtval_next = mtval;
    if(WB_valid == 1'b1) begin
        if(WB_trap != `ysyx_041461_TRAP_NOP) begin
            case(WB_trap)
                `ysyx_041461_IF_MISALIGN: begin
                    mepc_next = WB_pc;
                    mcause_next = 64'd0;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                    mtval_next = WB_pc;
                end
                `ysyx_041461_ID_ECALL: begin
                    mepc_next = WB_pc;
                    mcause_next = 64'd11;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                end
                `ysyx_041461_ID_MRET: begin
                    mstatus_next[3:3] = mstatus[7:7];
                    mstatus_next[7:7] = 1'b1;
                end
                `ysyx_041461_ID_EBREAK: begin
                    mepc_next = WB_pc;
                    mcause_next = 64'd3;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                end
                `ysyx_041461_ID_ILLEGAL_INST: begin
                    mepc_next = WB_pc;
                    mcause_next = 64'd2;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                    mtval_next = {32'b0, WB_inst};
                end
                `ysyx_041461_MEM_LOAD_MISALIGN: begin
                    mepc_next = WB_pc;
                    mcause_next = 64'd4;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                    mtval_next = WB_EXE_in;
                end
                `ysyx_041461_MEM_STORE_MISALIGN: begin
                    mepc_next = WB_pc;
                    mcause_next = 64'd6;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                    mtval_next = WB_EXE_in;
                end
                `ysyx_041461_TIMER_INTERRUPT: begin
                    mepc_next = WB_pc;
                    mcause_next[63:63] = 1'b1;
                    mcause_next[62:0] = 63'd7;
                    mstatus_next[3:3] = 1'b0;
                    mstatus_next[7:7] = mstatus[3:3];
                end
                default: begin
                    
                end
            endcase
            if(WB_IF_ok == 1'b1 && WB_EXE_ok == 1'b1 && WB_MEM_ok == 1'b1) begin
                minstret_next = minstret + 1'b1;
            end
        end
        else if(WB_ctrl == `ysyx_041461_WB_CSR_RS1 || WB_ctrl == `ysyx_041461_WB_CSR_EXE || WB_ctrl == `ysyx_041461_WB_CSR_ZIMM)begin
            minstret_next = minstret + 1'b1;
            case(WB_csr)
                `ysyx_041461_MSTATUS: begin
                    mstatus_next = c;
                end
                `ysyx_041461_MISA: begin
                    misa_next = c;
                end
                `ysyx_041461_MIE: begin
                    mie_next = c;
                end
                `ysyx_041461_MTVEC: begin
                    mtvec_next = c;
                end
                `ysyx_041461_MSCRATCH: begin
                    mscratch_next = c;
                end
                `ysyx_041461_MEPC: begin
                    mepc_next = c;
                end
                `ysyx_041461_MCAUSE: begin
                    mcause_next = c;
                end
                `ysyx_041461_MIP: begin
                    mip_next = c;
                end
                `ysyx_041461_MCYCLE: begin
                    mcycle_next = c;
                end
                `ysyx_041461_MINSTRET: begin
                    minstret_next = c;
                end
                `ysyx_041461_MTVAL: begin
                    mtval_next = c;
                end
                default: begin

                end
            endcase
        end
        else begin
            minstret_next = minstret + 1'b1;
        end
    end
    if(WB_interrupt == 1'b1) begin
        mip_next[7:7] = 1'b1;
    end
    else begin
        mip_next[7:7] = 1'b0;
    end
    {mip_next[63:8], mip_next[6:0]} = 63'b0;
    {mie_next[63:8], mie_next[6:0]} = 63'b0;
    {mstatus_next[63:13], mstatus_next[10:8], mstatus_next[6:4], mstatus_next[2:0]} = 60'b0;
    mstatus_next[12:11] = 2'b11;
end

always@(posedge clk or posedge rst)  begin
    if(rst == 1'b1) begin
        for(j = 0; j < 32; j = j + 1) begin
            x[j] <= 64'd0;
        end
        mhartid <= 64'b0;
        mstatus <= {51'b0, 2'b11, 11'b0};
        misa <= {2'b10, 36'b0, 26'b00000_00000_00010_00100_00000_0};
        mie <= 64'b0;
        mtvec <= 64'd0;
        mscratch <= 64'b0;
        mepc <= 64'd0;
        mcause <= 64'd0;
        mip <= 64'b0;
        mcycle <= 64'b0;
        minstret <= 64'b0;
        mtval <= 64'b0;
    end
    else begin
        for(j = 0; j < 32; j = j + 1) begin
            x[j] <= d[j];
        end
        mhartid <= mhartid_next;
        mstatus <= mstatus_next;
        misa <= misa_next ;
        mie <= mie_next;
        mtvec <= mtvec_next;
        mscratch <= mscratch_next;
        mepc <= mepc_next;
        mcause <= mcause_next;
        mip <= mip_next;
        mcycle <= mcycle_next;
        minstret <= minstret_next;
        mtval <= mtval_next;
    end
end

endmodule
//conflict detector

module ysyx_041461_CD(  

    input   wire  [0:0]  CD_IF2_valid_in ,
    input   wire  [3:0]  CD_IF2_trap_in  ,

    input   wire  [0:0]  CD_ID_valid_in ,
    input   wire  [2:0]  CD_ID_TYPE     ,
    input   wire  [4:0]  CD_ID_rs1      ,
    input   wire  [4:0]  CD_ID_rs2      ,
    input   wire  [3:0]  CD_ID_trap_in  ,

    input   wire  [0:0]  CD_EXE_valid_in,
    input   wire  [4:0]  CD_EXE_ctrl    ,
    input   wire  [2:0]  CD_EXE_src     ,
    input   wire  [3:0]  CD_EXE_WB_ctrl ,
    input   wire  [4:0]  CD_EXE_rd      ,
    input   wire  [4:0]  CD_EXE_rs1     ,
    input   wire  [4:0]  CD_EXE_rs2     ,
    input   wire  [11:0] CD_EXE_csr     ,
    input   wire  [3:0]  CD_EXE_trap_in ,

    input   wire  [0:0]  CD_MEM_valid_in,
    input   wire  [3:0]  CD_MEM_ctrl    ,   
    input   wire  [3:0]  CD_MEM_WB_ctrl ,
    input   wire  [4:0]  CD_MEM_rd      ,
    input   wire  [4:0]  CD_MEM_rs2     ,
    input   wire  [11:0] CD_MEM_csr     ,
    input   wire  [3:0]  CD_MEM_trap_in ,
 
    input   wire  [0:0]  CD_WB_valid_in ,
    input   wire  [3:0]  CD_WB_ctrl     ,
    input   wire  [4:0]  CD_WB_rd       ,
    input   wire  [11:0] CD_WB_csr      ,
    input   wire  [3:0]  CD_WB_trap_in  ,

    output  reg   [0:0]  CD_IF_trap     ,
    output  reg   [0:0]  CD_IF2_trap    ,
    output  reg   [0:0]  CD_ID_conflict ,
    output  reg   [0:0]  CD_ID_trap     ,
    output  reg   [0:0]  CD_EXE_conflict,
    output  reg   [0:0]  CD_EXE_trap    ,
    output  reg   [0:0]  CD_MEM_conflict,
    output  reg   [0:0]  CD_MEM_trap
);


reg [0:0] ID_rs1_read;
reg [0:0] ID_rs2_read;

reg [0:0] EXE_rd_write;
reg [0:0] EXE_rs1_read;
reg [0:0] EXE_rs2_read;
reg [0:0] EXE_csr_read;

reg [0:0] MEM_rd_write;
reg [0:0] MEM_csr_write;
reg [0:0] MEM_rs2_read;

reg [0:0] WB_rd_write;
reg [0:0] WB_csr_write;

always@(*) begin
    if(CD_ID_valid_in == 1'b1) begin
        if(CD_ID_TYPE == `ysyx_041461_TYPE_BRANCHES || CD_ID_TYPE == `ysyx_041461_TYPE_JALR) begin
            ID_rs1_read = 1'b1;
        end
        else begin
            ID_rs1_read = 1'b0;
        end
    end
    else begin
        ID_rs1_read = 1'b0;
    end
end

always@(*) begin
    if(CD_ID_valid_in == 1'b1) begin
        if(CD_ID_TYPE == `ysyx_041461_TYPE_BRANCHES) begin
            ID_rs2_read = 1'b1;
        end
        else begin
            ID_rs2_read = 1'b0;
        end
    end
    else begin
        ID_rs2_read = 1'b0;
    end
end

always@(*) begin
    if(CD_EXE_valid_in == 1'b1) begin
        if(CD_EXE_WB_ctrl == `ysyx_041461_WB_EXE || CD_EXE_WB_ctrl == `ysyx_041461_WB_MEM || 
        CD_EXE_WB_ctrl == `ysyx_041461_WB_IMM || CD_EXE_WB_ctrl == `ysyx_041461_WB_SNPC || 
        CD_EXE_WB_ctrl == `ysyx_041461_WB_CSR_RS1 || CD_EXE_WB_ctrl == `ysyx_041461_WB_CSR_EXE || 
        CD_EXE_WB_ctrl == `ysyx_041461_WB_CSR_ZIMM || CD_EXE_WB_ctrl == `ysyx_041461_WB_CSR_RO) begin
            EXE_rd_write = 1'b1;
        end
        else begin
            EXE_rd_write = 1'b0;
        end
    end
    else begin
        EXE_rd_write = 1'b0;
    end
end


always@(*) begin
    if(CD_EXE_valid_in == 1'b1) begin
        if(CD_EXE_ctrl != `ysyx_041461_EXE_NOP)begin
            case(CD_EXE_src)
                `ysyx_041461_EXE_src_NOP: begin
                    EXE_rs1_read = 1'b0;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b0;
                end
                `ysyx_041461_EXE_R_R: begin
                    EXE_rs1_read = 1'b1;
                    EXE_rs2_read = 1'b1;
                    EXE_csr_read = 1'b0;
                end
                `ysyx_041461_EXE_R_I: begin
                    EXE_rs1_read = 1'b1;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b0;
                end
                `ysyx_041461_EXE_PC_I: begin
                    EXE_rs1_read = 1'b0;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b0;
                end
                `ysyx_041461_EXE_R_CSR: begin
                    EXE_rs1_read = 1'b1;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b1;
                end
                `ysyx_041461_EXE_NOTR_CSR: begin
                    EXE_rs1_read = 1'b1;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b1;
                end
                `ysyx_041461_EXE_CSR_ZIMM: begin
                    EXE_rs1_read = 1'b0;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b1;
                end
                `ysyx_041461_EXE_CSR_NOTZIMM: begin
                    EXE_rs1_read = 1'b0;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b1;
                end
                default: begin
                    EXE_rs1_read = 1'b0;
                    EXE_rs2_read = 1'b0;
                    EXE_csr_read = 1'b0;
                end
            endcase
        end
        else begin
            EXE_rs1_read = 1'b0;
            EXE_rs2_read = 1'b0;
            EXE_csr_read = 1'b0;
        end
    end
    else begin
        EXE_rs1_read = 1'b0;
        EXE_rs2_read = 1'b0;
        EXE_csr_read = 1'b0;
    end
end

always@(*) begin
    if(CD_MEM_valid_in == 1'b1) begin
        if(CD_MEM_WB_ctrl == `ysyx_041461_WB_EXE || CD_MEM_WB_ctrl == `ysyx_041461_WB_MEM || 
        CD_MEM_WB_ctrl == `ysyx_041461_WB_IMM || CD_MEM_WB_ctrl == `ysyx_041461_WB_SNPC || 
        CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_RS1 || CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_EXE || 
        CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_ZIMM || CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_RO) begin
            MEM_rd_write = 1'b1;
        end
        else begin
            MEM_rd_write = 1'b0;
        end
    end
    else begin
        MEM_rd_write = 1'b0;
    end
end

always@(*) begin
    if(CD_MEM_valid_in == 1'b1) begin
        if(CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_RS1 || CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_EXE || 
        CD_MEM_WB_ctrl == `ysyx_041461_WB_CSR_ZIMM) begin
            MEM_csr_write = 1'b1;
        end
        else begin
            MEM_csr_write = 1'b0;
        end
    end
    else begin
        MEM_csr_write = 1'b0;
    end
end

always@(*) begin
    if(CD_MEM_valid_in == 1'b1) begin
        case(CD_MEM_ctrl)
            `ysyx_041461_MEM_SB: begin
                MEM_rs2_read = 1'b1;
            end
            `ysyx_041461_MEM_SH: begin
                MEM_rs2_read = 1'b1;
            end
            `ysyx_041461_MEM_SW: begin
                MEM_rs2_read = 1'b1;
            end
            `ysyx_041461_MEM_SD: begin
                MEM_rs2_read = 1'b1;
            end
            default: begin
                MEM_rs2_read = 1'b0;
            end
        endcase
    end
    else begin
        MEM_rs2_read = 1'b0;
    end
end

always@(*) begin
    if(CD_WB_valid_in == 1'b1) begin
        if(CD_WB_ctrl == `ysyx_041461_WB_EXE || CD_WB_ctrl == `ysyx_041461_WB_MEM || 
        CD_WB_ctrl == `ysyx_041461_WB_IMM || CD_WB_ctrl == `ysyx_041461_WB_SNPC || 
        CD_WB_ctrl == `ysyx_041461_WB_CSR_RS1 || CD_WB_ctrl == `ysyx_041461_WB_CSR_EXE || 
        CD_WB_ctrl == `ysyx_041461_WB_CSR_ZIMM || CD_WB_ctrl == `ysyx_041461_WB_CSR_RO) begin
            WB_rd_write = 1'b1;
        end
        else begin
            WB_rd_write = 1'b0;
        end
    end
    else begin
        WB_rd_write = 1'b0;
    end
end

always@(*) begin
    if(CD_WB_valid_in == 1'b1) begin
        if(CD_WB_ctrl == `ysyx_041461_WB_CSR_RS1 || CD_WB_ctrl == `ysyx_041461_WB_CSR_EXE || 
        CD_WB_ctrl == `ysyx_041461_WB_CSR_ZIMM) begin
            WB_csr_write = 1'b1;
        end
        else begin
            WB_csr_write = 1'b0;
        end
    end
    else begin
        WB_csr_write = 1'b0;
    end
end

always@(*) begin
    CD_ID_conflict = 1'b0;
    if(ID_rs1_read == 1'b1 && CD_ID_rs1 != 5'b0) begin
        if(EXE_rd_write == 1'b1) begin
            if(CD_ID_rs1 == CD_EXE_rd) begin
                CD_ID_conflict = 1'b1;
            end
        end
        if(MEM_rd_write == 1'b1) begin
            if(CD_ID_rs1 == CD_MEM_rd) begin
                CD_ID_conflict = 1'b1;
            end
        end
        if(WB_rd_write == 1'b1) begin
            if(CD_ID_rs1 == CD_WB_rd) begin
                CD_ID_conflict = 1'b1;
            end
        end
    end
    if(ID_rs2_read == 1'b1 && CD_ID_rs2 != 5'b0) begin
        if(EXE_rd_write == 1'b1) begin
            if(CD_ID_rs2 == CD_EXE_rd) begin
                CD_ID_conflict = 1'b1;
            end
        end
        if(MEM_rd_write == 1'b1) begin
            if(CD_ID_rs2 == CD_MEM_rd) begin
                CD_ID_conflict = 1'b1;
            end
        end
        if(WB_rd_write == 1'b1) begin
            if(CD_ID_rs2 == CD_WB_rd) begin
                CD_ID_conflict = 1'b1;
            end
        end
    end
end

always@(*) begin
    CD_EXE_conflict = 1'b0;
    if(EXE_rs1_read == 1'b1 && CD_EXE_rs1 != 5'b0) begin
        if(MEM_rd_write == 1'b1) begin
            if(CD_EXE_rs1 == CD_MEM_rd) begin
                CD_EXE_conflict = 1'b1;
            end
        end
        if(WB_rd_write == 1'b1) begin
            if(CD_EXE_rs1 == CD_WB_rd) begin
                CD_EXE_conflict = 1'b1;
            end
        end
    end
    if(EXE_rs2_read == 1'b1 && CD_EXE_rs2 != 5'b0) begin
        if(MEM_rd_write == 1'b1) begin
            if(CD_EXE_rs2 == CD_MEM_rd) begin
                CD_EXE_conflict = 1'b1;
            end
        end
        if(WB_rd_write == 1'b1) begin
            if(CD_EXE_rs2 == CD_WB_rd) begin
                CD_EXE_conflict = 1'b1;
            end
        end
    end
    if(EXE_csr_read == 1'b1) begin
        if(MEM_csr_write == 1'b1) begin
            if(CD_EXE_csr == CD_MEM_csr) begin
                CD_EXE_conflict = 1'b1;
            end
        end
        if(WB_csr_write == 1'b1) begin
            if(CD_EXE_csr == CD_WB_csr) begin
                CD_EXE_conflict = 1'b1;
            end
        end
    end
end

always@(*) begin
    CD_MEM_conflict = 1'b0;
    if(MEM_rs2_read == 1'b1 && CD_MEM_rs2 != 5'b0) begin
        if(WB_rd_write == 1'b1) begin
            if(CD_MEM_rs2 == CD_WB_rd) begin
                CD_MEM_conflict = 1'b1;
            end
        end
    end
end

always@(*) begin
    if((CD_IF2_valid_in == 1'b1 && CD_IF2_trap_in != `ysyx_041461_TRAP_NOP) || (CD_ID_valid_in == 1'b1 && CD_ID_trap_in != `ysyx_041461_TRAP_NOP) || (CD_EXE_valid_in == 1'b1 && CD_EXE_trap_in != `ysyx_041461_TRAP_NOP) || (CD_MEM_valid_in == 1'b1 && CD_MEM_trap_in != `ysyx_041461_TRAP_NOP) || (CD_WB_valid_in == 1'b1 && CD_WB_trap_in != `ysyx_041461_TRAP_NOP)) begin
        CD_IF_trap = 1'b1;
    end
    else begin
        CD_IF_trap = 1'b0;
    end
end

always@(*) begin
    if((CD_ID_valid_in == 1'b1 && CD_ID_trap_in != `ysyx_041461_TRAP_NOP) || (CD_EXE_valid_in == 1'b1 && CD_EXE_trap_in != `ysyx_041461_TRAP_NOP) || (CD_MEM_valid_in == 1'b1 && CD_MEM_trap_in != `ysyx_041461_TRAP_NOP) || (CD_WB_valid_in == 1'b1 && CD_WB_trap_in != `ysyx_041461_TRAP_NOP)) begin
        CD_IF2_trap = 1'b1;
    end
    else begin
        CD_IF2_trap = 1'b0;
    end
end


always@(*) begin
    if((CD_EXE_valid_in == 1'b1 && CD_EXE_trap_in != `ysyx_041461_TRAP_NOP) || (CD_MEM_valid_in == 1'b1 && CD_MEM_trap_in != `ysyx_041461_TRAP_NOP) || (CD_WB_valid_in == 1'b1 && CD_WB_trap_in != `ysyx_041461_TRAP_NOP)) begin
        CD_ID_trap = 1'b1;
    end
    else begin
        CD_ID_trap = 1'b0;
    end
end

always@(*) begin
    if((CD_MEM_valid_in == 1'b1 && CD_MEM_trap_in != `ysyx_041461_TRAP_NOP) || (CD_WB_valid_in == 1'b1 && CD_WB_trap_in != `ysyx_041461_TRAP_NOP)) begin
        CD_EXE_trap = 1'b1;
    end
    else begin
        CD_EXE_trap = 1'b0;
    end
end

always@(*) begin
    if(CD_WB_valid_in == 1'b1 && CD_WB_trap_in != `ysyx_041461_TRAP_NOP) begin
        CD_MEM_trap = 1'b1;
    end
    else begin
        CD_MEM_trap = 1'b0;
    end
end


endmodule

module  ysyx_041461_ARBITER(

    input   wire [0:0]    clk                  ,
    input   wire [0:0]    rst                  ,

    input   wire [0:0]    ARBITER_IF_arvalid   ,
    input   wire [31:0]   ARBITER_IF_araddr    ,
    input   wire [3:0]    ARBITER_IF_arid      ,
    input   wire [7:0]    ARBITER_IF_arlen     ,
    input   wire [2:0]    ARBITER_IF_arsize    ,
    input   wire [1:0]    ARBITER_IF_arburst   ,
    output  reg  [0:0]    ARBITER_IF_arready   ,

    input   wire [0:0]    ARBITER_IF_rready    ,
    output  reg  [0:0]    ARBITER_IF_rvalid    ,
    output  reg  [1:0]    ARBITER_IF_rresp     ,
    output  reg  [63:0]   ARBITER_IF_rdata     ,
    output  reg  [0:0]    ARBITER_IF_rlast     ,
    output  reg  [3:0]    ARBITER_IF_rid       ,

    input   wire [0:0]    ARBITER_MEM_arvalid  ,
    input   wire [31:0]   ARBITER_MEM_araddr   ,
    input   wire [3:0]    ARBITER_MEM_arid     ,
    input   wire [7:0]    ARBITER_MEM_arlen    ,
    input   wire [2:0]    ARBITER_MEM_arsize   ,
    input   wire [1:0]    ARBITER_MEM_arburst  ,
    output  reg  [0:0]    ARBITER_MEM_arready  ,

    input   wire [0:0]    ARBITER_MEM_rready   ,
    output  reg  [0:0]    ARBITER_MEM_rvalid   ,
    output  reg  [1:0]    ARBITER_MEM_rresp    ,
    output  reg  [63:0]   ARBITER_MEM_rdata    ,
    output  reg  [0:0]    ARBITER_MEM_rlast    ,
    output  reg  [3:0]    ARBITER_MEM_rid      ,

    output  reg  [0:0]    ARBITER_MEM_awready  ,
    input   wire [0:0]    ARBITER_MEM_awvalid  ,
    input   wire [31:0]   ARBITER_MEM_awaddr   ,
    input   wire [3:0]    ARBITER_MEM_awid     ,
    input   wire [7:0]    ARBITER_MEM_awlen    ,
    input   wire [2:0]    ARBITER_MEM_awsize   ,
    input   wire [1:0]    ARBITER_MEM_awburst  ,
       
    output  reg  [0:0]    ARBITER_MEM_wready   ,
    input   wire [0:0]    ARBITER_MEM_wvalid   ,
    input   wire [63:0]   ARBITER_MEM_wdata    ,
    input   wire [7:0]    ARBITER_MEM_wstrb    ,
    input   wire [0:0]    ARBITER_MEM_wlast    ,
       
    input   wire [0:0]    ARBITER_MEM_bready   ,
    output  reg  [0:0]    ARBITER_MEM_bvalid   ,
    output  reg  [1:0]    ARBITER_MEM_bresp    ,
    output  reg  [3:0]    ARBITER_MEM_bid      ,
    
    input   wire          ARBITER_CLINT_awready,
    output  reg           ARBITER_CLINT_awvalid,
    output  wire [3:0]    ARBITER_CLINT_awid   ,
    output  wire [31:0]   ARBITER_CLINT_awaddr ,
    output  wire [7:0]    ARBITER_CLINT_awlen  ,
    output  wire [2:0]    ARBITER_CLINT_awsize ,
    output  wire [1:0]    ARBITER_CLINT_awburst,
 
    input   wire          ARBITER_CLINT_wready ,
    output  reg           ARBITER_CLINT_wvalid ,
    output  wire [63:0]   ARBITER_CLINT_wdata  ,
    output  wire [7:0]    ARBITER_CLINT_wstrb  ,
    output  wire          ARBITER_CLINT_wlast  ,
 
    output  wire          ARBITER_CLINT_bready ,
    input   wire          ARBITER_CLINT_bvalid ,
    input   wire [3:0]    ARBITER_CLINT_bid    ,
    input   wire [1:0]    ARBITER_CLINT_bresp  ,

    input   wire          ARBITER_CLINT_arready,
    output  reg           ARBITER_CLINT_arvalid,
    output  reg  [3:0]    ARBITER_CLINT_arid   ,
    output  reg  [31:0]   ARBITER_CLINT_araddr ,
    output  reg  [7:0]    ARBITER_CLINT_arlen  ,
    output  reg  [2:0]    ARBITER_CLINT_arsize ,
    output  reg  [1:0]    ARBITER_CLINT_arburst,

    output  reg           ARBITER_CLINT_rready ,
    input   wire          ARBITER_CLINT_rvalid ,
    input   wire [3:0]    ARBITER_CLINT_rid    ,
    input   wire [1:0]    ARBITER_CLINT_rresp  ,
    input   wire [63:0]   ARBITER_CLINT_rdata  ,
    input   wire          ARBITER_CLINT_rlast  ,

    input   wire          ARBITER_io_awready   ,
    output  reg           ARBITER_io_awvalid   ,
    output  wire [3:0]    ARBITER_io_awid      ,
    output  wire [31:0]   ARBITER_io_awaddr    ,
    output  wire [7:0]    ARBITER_io_awlen     ,
    output  wire [2:0]    ARBITER_io_awsize    ,
    output  wire [1:0]    ARBITER_io_awburst   ,
 
    input   wire          ARBITER_io_wready    ,
    output  reg           ARBITER_io_wvalid    ,
    output  wire [63:0]   ARBITER_io_wdata     ,
    output  wire [7:0]    ARBITER_io_wstrb     ,
    output  wire          ARBITER_io_wlast     ,
 
    output  wire          ARBITER_io_bready    ,
    input   wire          ARBITER_io_bvalid    ,
    input   wire [3:0]    ARBITER_io_bid       ,
    input   wire [1:0]    ARBITER_io_bresp     ,

    input   wire [0:0]    ARBITER_io_arready   ,
    output  reg  [0:0]    ARBITER_io_arvalid   ,
    output  reg  [31:0]   ARBITER_io_araddr    ,
    output  reg  [3:0]    ARBITER_io_arid      ,
    output  reg  [7:0]    ARBITER_io_arlen     ,
    output  reg  [2:0]    ARBITER_io_arsize    ,
    output  reg  [1:0]    ARBITER_io_arburst   ,

    output  reg  [0:0]    ARBITER_io_rready    ,
    input   wire [0:0]    ARBITER_io_rvalid    ,
    input   wire [1:0]    ARBITER_io_rresp     ,
    input   wire [63:0]   ARBITER_io_rdata     ,
    input   wire [0:0]    ARBITER_io_rlast     ,
    input   wire [3:0]    ARBITER_io_rid        
);

parameter IF_AXI_id = 4'b0000;
parameter MEM_AXI_id = 4'b0001;

parameter OKAY = 2'b00;
parameter EXOKAY = 2'b01;
//parameter SLVERR = 2'b10;
//parameter DECERR = 2'b11;

//parameter FIXED = 2'b00;
//parameter INCR = 2'b01;
//parameter WRAP = 2'b10;
//parameter Rserved = 2'b11;

reg  [1:0]  rstate;
reg  [1:0]  wstate;
wire [0:0]  rclint;
wire [0:0]  wclint;

//在pa中，由于地址冲突，需要屏蔽CLINT模块
assign rclint = (ARBITER_MEM_araddr >= 32'h0200_bff8 && ARBITER_MEM_araddr <= 32'h0200_bfff) || (ARBITER_MEM_araddr >= 32'h0200_4000 && ARBITER_MEM_araddr <= 32'h0200_4007);
assign wclint = (ARBITER_MEM_awaddr >= 32'h0200_bff8 && ARBITER_MEM_awaddr <= 32'h0200_bfff) || (ARBITER_MEM_awaddr >= 32'h0200_4000 && ARBITER_MEM_awaddr <= 32'h0200_4007);

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        rstate <= `ysyx_041461_ARBITER_RSTART;
    end
    else begin
        case(rstate)
            `ysyx_041461_ARBITER_RSTART: begin
                if(ARBITER_IF_arvalid == 1'b1) begin
                    rstate <= `ysyx_041461_ARBITER_IF_RAXI;
                end
                else if(ARBITER_MEM_arvalid == 1'b1) begin
                    if(rclint == 1'b1) begin
                        rstate <= `ysyx_041461_ARBITER_MEM_RCLINT;
                    end
                    else if(rclint == 1'b0) begin
                        rstate <= `ysyx_041461_ARBITER_MEM_RAXI;
                    end
                    else begin
                        rstate <= rstate;
                    end
                end
                else begin
                    rstate <= rstate;
                end
            end
            `ysyx_041461_ARBITER_IF_RAXI: begin
                if(ARBITER_IF_rready == 1'b1 && ARBITER_io_rvalid == 1'b1 && (ARBITER_io_rresp == OKAY || ARBITER_io_rresp == EXOKAY) && ARBITER_io_rlast == 1'b1 && ARBITER_io_rid == IF_AXI_id) begin
                    rstate <= `ysyx_041461_ARBITER_RSTART;
                end
                else begin
                    rstate <= rstate;
                end
            end   
            `ysyx_041461_ARBITER_MEM_RAXI: begin
                if(ARBITER_MEM_rready == 1'b1 && ARBITER_io_rvalid == 1'b1 && (ARBITER_io_rresp == OKAY || ARBITER_io_rresp == EXOKAY) && ARBITER_io_rlast == 1'b1 && ARBITER_io_rid == MEM_AXI_id) begin
                    rstate <= `ysyx_041461_ARBITER_RSTART;
                end
                else begin
                    rstate <= rstate;
                end
            end       
            `ysyx_041461_ARBITER_MEM_RCLINT: begin
                if(ARBITER_MEM_rready == 1'b1 && ARBITER_CLINT_rvalid == 1'b1 && (ARBITER_CLINT_rresp == OKAY || ARBITER_CLINT_rresp == EXOKAY) && ARBITER_CLINT_rlast == 1'b1 && ARBITER_CLINT_rid == MEM_AXI_id) begin
                    rstate <= `ysyx_041461_ARBITER_RSTART;
                end
                else begin
                    rstate <= rstate;
                end
            end
            default: begin
                rstate <= `ysyx_041461_ARBITER_RSTART;
            end
        endcase
    end
end


always@(*) begin
    case(rstate)
        `ysyx_041461_ARBITER_RSTART: begin
            if(ARBITER_IF_arvalid == 1'b1) begin
                ARBITER_io_arvalid = ARBITER_IF_arvalid;
                ARBITER_io_arid    = ARBITER_IF_arid   ;
                ARBITER_io_araddr  = ARBITER_IF_araddr ;
                ARBITER_io_arlen   = ARBITER_IF_arlen  ;
                ARBITER_io_arsize  = ARBITER_IF_arsize ;
                ARBITER_io_arburst = ARBITER_IF_arburst;
            end
            else if(ARBITER_MEM_arvalid == 1'b1 && rclint == 1'b0) begin
                ARBITER_io_arvalid = ARBITER_MEM_arvalid;
                ARBITER_io_arid    = ARBITER_MEM_arid   ;
                ARBITER_io_araddr  = ARBITER_MEM_araddr ;
                ARBITER_io_arlen   = ARBITER_MEM_arlen  ;
                ARBITER_io_arsize  = ARBITER_MEM_arsize ;
                ARBITER_io_arburst = ARBITER_MEM_arburst;
            end
            else begin
                ARBITER_io_arvalid = ARBITER_IF_arvalid;
                ARBITER_io_arid    = ARBITER_IF_arid   ;
                ARBITER_io_araddr  = ARBITER_IF_araddr ;
                ARBITER_io_arlen   = ARBITER_IF_arlen  ;
                ARBITER_io_arsize  = ARBITER_IF_arsize ;
                ARBITER_io_arburst = ARBITER_IF_arburst;
            end
            ARBITER_io_rready = 1'b0;
        end
        `ysyx_041461_ARBITER_IF_RAXI: begin
            ARBITER_io_arvalid = ARBITER_IF_arvalid;
            ARBITER_io_arid    = ARBITER_IF_arid   ;
            ARBITER_io_araddr  = ARBITER_IF_araddr ;
            ARBITER_io_arlen   = ARBITER_IF_arlen  ;
            ARBITER_io_arsize  = ARBITER_IF_arsize ;
            ARBITER_io_arburst = ARBITER_IF_arburst;
            ARBITER_io_rready = ARBITER_IF_rready;
        end
        `ysyx_041461_ARBITER_MEM_RAXI: begin
            ARBITER_io_arvalid = ARBITER_MEM_arvalid;
            ARBITER_io_arid    = ARBITER_MEM_arid   ;
            ARBITER_io_araddr  = ARBITER_MEM_araddr ;
            ARBITER_io_arlen   = ARBITER_MEM_arlen  ;
            ARBITER_io_arsize  = ARBITER_MEM_arsize ;
            ARBITER_io_arburst = ARBITER_MEM_arburst;
            ARBITER_io_rready = ARBITER_MEM_rready;
        end
        default: begin
            ARBITER_io_arvalid = 1'b0;
            ARBITER_io_arid    = 4'b0;
            ARBITER_io_araddr  = 32'b0;
            ARBITER_io_arlen   = 8'b0;
            ARBITER_io_arsize  = 3'b0;
            ARBITER_io_arburst = 2'b0;
            ARBITER_io_rready = 1'b0;
        end
    endcase
end       

 always@(*) begin
    case(rstate)
        `ysyx_041461_ARBITER_RSTART: begin
            if(ARBITER_IF_arvalid == 1'b0 && ARBITER_MEM_arvalid == 1'b1 && rclint == 1'b1) begin
                ARBITER_CLINT_arvalid = ARBITER_MEM_arvalid;
                ARBITER_CLINT_arid    = ARBITER_MEM_arid   ;
                ARBITER_CLINT_araddr  = ARBITER_MEM_araddr ;
                ARBITER_CLINT_arlen   = ARBITER_MEM_arlen  ;
                ARBITER_CLINT_arsize  = ARBITER_MEM_arsize ;
                ARBITER_CLINT_arburst = ARBITER_MEM_arburst;
            end
            else begin
                ARBITER_CLINT_arvalid = 1'b0;
                ARBITER_CLINT_arid    = 4'b0;
                ARBITER_CLINT_araddr  = 32'b0;
                ARBITER_CLINT_arlen   = 8'b0;
                ARBITER_CLINT_arsize  = 3'b0;
                ARBITER_CLINT_arburst = 2'b0;
            end
            ARBITER_CLINT_rready = 1'b0;
        end
        `ysyx_041461_ARBITER_MEM_RCLINT: begin
            ARBITER_CLINT_arvalid = 1'b0;
            ARBITER_CLINT_arid    = 4'b0;
            ARBITER_CLINT_araddr  = 32'b0;
            ARBITER_CLINT_arlen   = 8'b0;
            ARBITER_CLINT_arsize  = 3'b0;
            ARBITER_CLINT_arburst = 2'b0;
            ARBITER_CLINT_rready = ARBITER_MEM_rready;
        end
        default: begin
            ARBITER_CLINT_arvalid = 1'b0;
            ARBITER_CLINT_arid    = 4'b0;
            ARBITER_CLINT_araddr  = 32'b0;
            ARBITER_CLINT_arlen   = 8'b0;
            ARBITER_CLINT_arsize  = 3'b0;
            ARBITER_CLINT_arburst = 2'b0;
            ARBITER_CLINT_rready = 1'b0;
        end
    endcase
end       

always@(*) begin
    case(rstate)
        `ysyx_041461_ARBITER_RSTART: begin
            ARBITER_IF_arready = ARBITER_io_arready;
            ARBITER_IF_rvalid = 1'b0 ;
            ARBITER_IF_rresp  = 2'b0 ;
            ARBITER_IF_rdata  = 64'b0;
            ARBITER_IF_rlast  = 1'b0 ;
            ARBITER_IF_rid    = 4'b0 ;
        end
        `ysyx_041461_ARBITER_IF_RAXI: begin
            ARBITER_IF_arready = ARBITER_io_arready;
            ARBITER_IF_rvalid = ARBITER_io_rvalid;
            ARBITER_IF_rresp  = ARBITER_io_rresp ;
            ARBITER_IF_rdata  = ARBITER_io_rdata ;
            ARBITER_IF_rlast  = ARBITER_io_rlast ;
            ARBITER_IF_rid    = ARBITER_io_rid   ;
        end
        default: begin
            ARBITER_IF_arready = 1'b0;
            ARBITER_IF_rvalid = 1'b0 ;
            ARBITER_IF_rresp  = 2'b0 ;
            ARBITER_IF_rdata  = 64'b0;
            ARBITER_IF_rlast  = 1'b0 ;
            ARBITER_IF_rid    = 4'b0 ;
        end
    endcase
end

always@(*) begin
    case(rstate)
        `ysyx_041461_ARBITER_RSTART: begin
            if(ARBITER_IF_arvalid == 1'b0 && ARBITER_MEM_arvalid == 1'b1) begin
                if(rclint == 1'b0) begin
                    ARBITER_MEM_arready = ARBITER_io_arready;
                end
                else begin
                    ARBITER_MEM_arready = ARBITER_CLINT_arready;
                end
            end
            else begin
                ARBITER_MEM_arready = 1'b0;
            end
            ARBITER_MEM_rvalid = 1'b0 ;
            ARBITER_MEM_rresp  = 2'b0 ;
            ARBITER_MEM_rdata  = 64'b0;
            ARBITER_MEM_rlast  = 1'b0 ;
            ARBITER_MEM_rid    = 4'b0 ;
        end
        `ysyx_041461_ARBITER_MEM_RAXI: begin
            ARBITER_MEM_arready = ARBITER_io_arready;
            ARBITER_MEM_rvalid = ARBITER_io_rvalid;
            ARBITER_MEM_rresp  = ARBITER_io_rresp ;
            ARBITER_MEM_rdata  = ARBITER_io_rdata ;
            ARBITER_MEM_rlast  = ARBITER_io_rlast ;
            ARBITER_MEM_rid    = ARBITER_io_rid   ;
        end
        `ysyx_041461_ARBITER_MEM_RCLINT: begin
            ARBITER_MEM_arready = ARBITER_CLINT_arready;
            ARBITER_MEM_rvalid = ARBITER_CLINT_rvalid;
            ARBITER_MEM_rresp  = ARBITER_CLINT_rresp ;
            ARBITER_MEM_rdata  = ARBITER_CLINT_rdata ;
            ARBITER_MEM_rlast  = ARBITER_CLINT_rlast ;
            ARBITER_MEM_rid    = ARBITER_CLINT_rid   ;
        end
        default: begin
            ARBITER_MEM_arready = 1'b0;
            ARBITER_MEM_rvalid = 1'b0 ;
            ARBITER_MEM_rresp  = 2'b0 ;
            ARBITER_MEM_rdata  = 64'b0;
            ARBITER_MEM_rlast  = 1'b0 ;
            ARBITER_MEM_rid    = 4'b0 ;
        end
    endcase
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        wstate <= `ysyx_041461_ARBITER_WSTART;
    end
    else begin
        case(wstate)
            `ysyx_041461_ARBITER_WSTART: begin
                if(ARBITER_MEM_awvalid == 1'b1) begin
                    if(wclint == 1'b0) begin
                        wstate <= `ysyx_041461_ARBITER_WAXI;
                    end
                    else begin
                        wstate <= `ysyx_041461_ARBITER_WCLINT;
                    end
                end
                else begin
                    wstate <= wstate;
                end
            end
            `ysyx_041461_ARBITER_WAXI: begin
                 if(ARBITER_MEM_bready == 1'b1 && ARBITER_io_bvalid == 1'b1 && (ARBITER_io_bresp == OKAY || ARBITER_io_bresp == EXOKAY) && ARBITER_io_bid == MEM_AXI_id) begin
                    wstate <= `ysyx_041461_ARBITER_WSTART;
                end
                else begin
                    wstate <= wstate;
                end
            end
            `ysyx_041461_ARBITER_WCLINT: begin
                if(ARBITER_MEM_bready == 1'b1 && ARBITER_CLINT_bvalid == 1'b1 && (ARBITER_CLINT_bresp == OKAY || ARBITER_CLINT_bresp == EXOKAY) && ARBITER_CLINT_bid == MEM_AXI_id) begin
                    wstate <= `ysyx_041461_ARBITER_WSTART;
                end
                else begin
                    wstate <= wstate;
                end
            end
            default: begin
                wstate <= `ysyx_041461_ARBITER_WSTART;
            end
        endcase
    end
end

always@(*) begin
    case(wstate)
        `ysyx_041461_ARBITER_WSTART: begin
            if(wclint == 1'b0) begin
                ARBITER_io_awvalid = ARBITER_MEM_awvalid;
            end
            else begin
                ARBITER_io_awvalid = 1'b0;
            end
        end
        `ysyx_041461_ARBITER_WAXI: begin
            ARBITER_io_awvalid = ARBITER_MEM_awvalid;
        end
        default: begin
            ARBITER_io_awvalid = 1'b0;
        end
    endcase
end

always@(*) begin
    case(wstate)
        `ysyx_041461_ARBITER_WAXI: begin
            ARBITER_io_wvalid = ARBITER_MEM_wvalid;
        end
        default: begin
            ARBITER_io_wvalid = 1'b0;
        end
    endcase
end

assign ARBITER_io_awid    = ARBITER_MEM_awid   ;
assign ARBITER_io_awaddr  = ARBITER_MEM_awaddr ;
assign ARBITER_io_awlen   = ARBITER_MEM_awlen  ;
assign ARBITER_io_awsize  = ARBITER_MEM_awsize ;
assign ARBITER_io_awburst = ARBITER_MEM_awburst;
assign ARBITER_io_wdata   = ARBITER_MEM_wdata  ;
assign ARBITER_io_wstrb   = ARBITER_MEM_wstrb  ;
assign ARBITER_io_wlast   = ARBITER_MEM_wlast  ;
assign ARBITER_io_bready  = ARBITER_MEM_bready ;

always@(*) begin
    case(wstate)
        `ysyx_041461_ARBITER_WSTART: begin
            if(wclint == 1'b1) begin
                ARBITER_CLINT_awvalid = ARBITER_MEM_awvalid;
            end
            else begin
                ARBITER_CLINT_awvalid = 1'b0;
            end
        end
        `ysyx_041461_ARBITER_WCLINT: begin
            ARBITER_CLINT_awvalid = ARBITER_MEM_awvalid;
        end
        default: begin
            ARBITER_CLINT_awvalid = 1'b0;
        end
    endcase
end

always@(*) begin
    case(wstate)
        `ysyx_041461_ARBITER_WCLINT: begin
            ARBITER_CLINT_wvalid = ARBITER_MEM_wvalid;
        end
        default: begin
            ARBITER_CLINT_wvalid = 1'b0;
        end
    endcase
end

assign ARBITER_CLINT_awid    = ARBITER_MEM_awid   ;
assign ARBITER_CLINT_awaddr  = ARBITER_MEM_awaddr ;
assign ARBITER_CLINT_awlen   = ARBITER_MEM_awlen  ;
assign ARBITER_CLINT_awsize  = ARBITER_MEM_awsize ;
assign ARBITER_CLINT_awburst = ARBITER_MEM_awburst;
assign ARBITER_CLINT_wdata   = ARBITER_MEM_wdata  ;
assign ARBITER_CLINT_wstrb   = ARBITER_MEM_wstrb  ;
assign ARBITER_CLINT_wlast   = ARBITER_MEM_wlast  ;
assign ARBITER_CLINT_bready  = ARBITER_MEM_bready ;


always@(*) begin
    case(wstate)
        `ysyx_041461_ARBITER_WSTART: begin
            if(wclint == 1'b1) begin
                ARBITER_MEM_awready = ARBITER_CLINT_awready;
            end
            else begin
                ARBITER_MEM_awready = ARBITER_io_awready;
            end
        end
        `ysyx_041461_ARBITER_WAXI: begin
            ARBITER_MEM_awready = ARBITER_io_awready;
        end
        `ysyx_041461_ARBITER_WCLINT: begin
            ARBITER_MEM_awready = ARBITER_CLINT_awready;
        end
        default: begin
            ARBITER_MEM_awready = 1'b0;
        end
    endcase
end


always@(*) begin
    case(wstate)
        `ysyx_041461_ARBITER_WAXI: begin
            ARBITER_MEM_wready = ARBITER_io_wready;
            ARBITER_MEM_bvalid = ARBITER_io_bvalid;
            ARBITER_MEM_bresp  = ARBITER_io_bresp;
            ARBITER_MEM_bid    = ARBITER_io_bid;
        end
        `ysyx_041461_ARBITER_WCLINT: begin
            ARBITER_MEM_wready = ARBITER_CLINT_wready;
            ARBITER_MEM_bvalid = ARBITER_CLINT_bvalid;
            ARBITER_MEM_bresp  = ARBITER_CLINT_bresp;
            ARBITER_MEM_bid    = ARBITER_CLINT_bid;
        end
        default: begin
            ARBITER_MEM_wready = 1'b0;
            ARBITER_MEM_bvalid = 1'b0;
            ARBITER_MEM_bresp  = 2'b0;
            ARBITER_MEM_bid    = 4'b0;
        end
    endcase
end

endmodule
module ysyx_041461_CLINT (

    input    wire   [0:0]    clk           ,
    input    wire   [0:0]    rst           ,
    output   reg    [0:0]    time_interrupt,
  
    output   reg             CLINT_awready ,
    input    wire            CLINT_awvalid ,
    input    wire   [3:0]    CLINT_awid    ,
    input    wire   [31:0]   CLINT_awaddr  ,
    input    wire   [7:0]    CLINT_awlen   ,
    input    wire   [2:0]    CLINT_awsize  ,
    input    wire   [1:0]    CLINT_awburst ,
 
    output   reg             CLINT_wready  ,
    input    wire            CLINT_wvalid  ,
    input    wire   [63:0]   CLINT_wdata   ,
    input    wire   [7:0]    CLINT_wstrb   ,
    input    wire            CLINT_wlast   ,
 
    input    wire            CLINT_bready  ,
    output   reg             CLINT_bvalid  ,
    output   reg    [3:0]    CLINT_bid     ,
    output   reg    [1:0]    CLINT_bresp   ,
  
    output   reg             CLINT_arready ,
    input    wire            CLINT_arvalid ,
    input    wire   [3:0]    CLINT_arid    ,
    input    wire   [31:0]   CLINT_araddr  ,
    input    wire   [7:0]    CLINT_arlen   ,
    input    wire   [2:0]    CLINT_arsize  ,
    input    wire   [1:0]    CLINT_arburst ,

    input    wire            CLINT_rready  ,
    output   reg             CLINT_rvalid  ,
    output   reg    [3:0]    CLINT_rid     ,
    output   reg    [1:0]    CLINT_rresp   ,
    output   reg    [63:0]   CLINT_rdata   ,
    output   reg             CLINT_rlast   

);

parameter OKAY = 2'b00;
//parameter EXOKAY = 2'b01;
//parameter SLVERR = 2'b10;
//parameter DECERR = 2'b11;


reg  [63:0]  mtime;
reg  [63:0]  mtime_next;
reg  [63:0]  mtimecmp;
reg  [63:0]  mtimecmp_next;
reg  [1:0]   state;

wire [0:0]   waddr_mtime_hit;
wire [0:0]   waddr_mtimecmp_hit;

wire [0:0]   raddr_mtime_hit;
wire [0:0]   raddr_mtimecmp_hit;

wire [0:0]   waddr_hit;
wire [0:0]   raddr_hit;

reg  [3:0]   awid        ;
reg  [3:0]   awid_next   ;
reg  [31:0]  awaddr      ;
reg  [31:0]  awaddr_next ;
reg  [7:0]   awlen       ;
reg  [7:0]   awlen_next  ;
reg  [2:0]   awsize      ;
reg  [2:0]   awsize_next ;
reg  [1:0]   awburst     ;
reg  [1:0]   awburst_next;

reg  [3:0]   arid        ;
reg  [3:0]   arid_next   ;
reg  [31:0]  araddr      ;
reg  [31:0]  araddr_next ;
reg  [7:0]   arlen       ;
reg  [7:0]   arlen_next  ;
reg  [2:0]   arsize      ;
reg  [2:0]   arsize_next ;
reg  [1:0]   arburst     ;
reg  [1:0]   arburst_next;

assign  waddr_hit = (awaddr_next >= 32'h0200_bff8 && awaddr_next <= 32'h0200_bfff) || (awaddr_next >= 32'h0200_4000 && awaddr_next <= 32'h0200_4007);
assign  raddr_hit = (araddr_next >= 32'h0200_bff8 && araddr_next <= 32'h0200_bfff) || (araddr_next >= 32'h0200_4000 && araddr_next <= 32'h0200_4007);

always@(*) begin
    if(mtime >= mtimecmp) begin
        time_interrupt = 1'b1;
    end
    else begin
        time_interrupt = 1'b0;
    end
end

always@(*) begin
    if(state == `ysyx_041461_CLINT_START) begin
        awid_next = CLINT_awid;
        awaddr_next = CLINT_awaddr;
        awlen_next = CLINT_awlen;
        awsize_next = CLINT_awsize;
        awburst_next = CLINT_awburst;
    end
    else begin
        awid_next = awid;
        awaddr_next = awaddr;
        awlen_next = awlen;
        awsize_next = awsize;
        awburst_next = awburst;
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        awid <= 4'b0;
        awaddr <= 32'b0;
        awlen <= 8'b0;
        awsize <= 3'b0;
        awburst <= 2'b0;
    end
    else begin
        awid <= awid_next;
        awaddr <= awaddr_next;
        awlen <= awlen_next;
        awsize <= awsize_next;
        awburst <= awburst_next;
    end
end

always@(*) begin
    if(state == `ysyx_041461_CLINT_START) begin
        arid_next = CLINT_arid;
        araddr_next = CLINT_araddr;
        arlen_next = CLINT_arlen;
        arsize_next = CLINT_arsize;
        arburst_next = CLINT_arburst;
    end
    else begin
        arid_next = arid;
        araddr_next = araddr;
        arlen_next = arlen;
        arsize_next = arsize;
        arburst_next = arburst;
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        arid <= 4'b0;
        araddr <= 32'b0;
        arlen <= 8'b0;
        arsize <= 3'b0;
        arburst <= 2'b0;
    end
    else begin
        arid <= arid_next;
        araddr <= araddr_next;
        arlen <= arlen_next;
        arsize <= arsize_next;
        arburst <= arburst_next;
    end
end

assign  waddr_mtime_hit = awaddr >= 32'h0200_bff8 && awaddr <= 32'h0200_bfff;
assign  waddr_mtimecmp_hit = awaddr >= 32'h0200_4000 && awaddr <= 32'h0200_4007;
assign  raddr_mtime_hit = araddr >= 32'h0200_bff8 && araddr <= 32'h0200_bfff;
assign  raddr_mtimecmp_hit = araddr >= 32'h0200_4000 && araddr <= 32'h0200_4007;


always@(*) begin
    case(state)
        `ysyx_041461_CLINT_START: begin
            CLINT_awready = 1'b1;
        end
        default: begin
            CLINT_awready = 1'b0;
        end
    endcase
end

always@(*) begin
    case(state)
        `ysyx_041461_CLINT_START: begin
            CLINT_arready = 1'b1;
        end
        default: begin
            CLINT_arready = 1'b0;
        end
    endcase
end

always@(*) begin
    mtime_next = mtime + 1'b1;
    mtimecmp_next = mtimecmp;
    if(state == `ysyx_041461_CLINT_W && CLINT_wvalid == 1'b1) begin
        if(waddr_mtime_hit == 1'b1) begin
            case(awsize) 
                3'b000:begin
                    case(awaddr[2:0])
                        3'b000:begin
                            mtime_next[7:0] = CLINT_wdata[7:0];
                        end
                        3'b001:begin
                            mtime_next[15:8] = CLINT_wdata[15:8];
                        end
                        3'b010:begin
                            mtime_next[23:16] = CLINT_wdata[23:16];
                        end
                        3'b011:begin
                            mtime_next[31:24] = CLINT_wdata[31:24];
                        end
                        3'b100:begin
                            mtime_next[39:32] = CLINT_wdata[39:32];
                        end
                        3'b101:begin
                            mtime_next[47:40] = CLINT_wdata[47:40];
                        end
                        3'b110:begin
                            mtime_next[55:48] = CLINT_wdata[55:48];
                        end
                        3'b111:begin
                            mtime_next[63:56] = CLINT_wdata[63:56];
                        end
                    endcase
                end
                3'b001:begin
                    case(awaddr[2:1])
                        2'b00:begin
                            mtime_next[15:0] = CLINT_wdata[15:0];
                        end
                        2'b01:begin
                            mtime_next[31:16] = CLINT_wdata[31:16];
                        end
                        2'b10:begin
                            mtime_next[47:32] = CLINT_wdata[47:32];
                        end
                        2'b11:begin
                            mtime_next[63:48] = CLINT_wdata[63:48];
                        end
                    endcase
                end
                3'b010:begin
                    case(awaddr[2:2])
                        1'b0:begin
                            mtime_next[31:0] = CLINT_wdata[31:0];
                        end
                        1'b1:begin
                            mtime_next[63:32] = CLINT_wdata[63:32];
                        end
                    endcase
                end
                3'b011:begin
                    mtime_next = CLINT_wdata;
                end
                default:begin

                end
            endcase
        end
        else if(waddr_mtimecmp_hit == 1'b1) begin
            case(awsize) 
                3'b000:begin
                    case(awaddr[2:0])
                        3'b000:begin
                            mtimecmp_next[7:0] = CLINT_wdata[7:0];
                        end
                        3'b001:begin
                            mtimecmp_next[15:8] = CLINT_wdata[15:8];
                        end
                        3'b010:begin
                            mtimecmp_next[23:16] = CLINT_wdata[23:16];
                        end
                        3'b011:begin
                            mtimecmp_next[31:24] = CLINT_wdata[31:24];
                        end
                        3'b100:begin
                            mtimecmp_next[39:32] = CLINT_wdata[39:32];
                        end
                        3'b101:begin
                            mtimecmp_next[47:40] = CLINT_wdata[47:40];
                        end
                        3'b110:begin
                            mtimecmp_next[55:48] = CLINT_wdata[55:48];
                        end
                        3'b111:begin
                            mtimecmp_next[63:56] = CLINT_wdata[63:56];
                        end
                    endcase
                end
                3'b001:begin
                    case(awaddr[2:1])
                        2'b00:begin
                            mtimecmp_next[15:0] = CLINT_wdata[15:0];
                        end
                        2'b01:begin
                            mtimecmp_next[31:16] = CLINT_wdata[31:16];
                        end
                        2'b10:begin
                            mtimecmp_next[47:32] = CLINT_wdata[47:32];
                        end
                        2'b11:begin
                            mtimecmp_next[63:48] = CLINT_wdata[63:48];
                        end
                    endcase
                end
                3'b010:begin
                    case(awaddr[2:2])
                        1'b0:begin
                            mtimecmp_next[31:0] = CLINT_wdata[31:0];
                        end
                        1'b1:begin
                            mtimecmp_next[63:32] = CLINT_wdata[63:32];
                        end
                    endcase
                end
                3'b011:begin
                    mtimecmp_next = CLINT_wdata;
                end
                default:begin

                end
            endcase
        end
    end
end

always@(*) begin
    case(state)
        `ysyx_041461_CLINT_W:  begin
            CLINT_wready = 1'b1;
        end
        default: begin
            CLINT_wready = 1'b0;
        end
    endcase
end

always@(*) begin
    case(state)
        `ysyx_041461_CLINT_WFINISH: begin
            CLINT_bvalid = 1'b1;
            CLINT_bid = awid;
            CLINT_bresp = OKAY;
        end
        default: begin
            CLINT_bvalid = 1'b0;
            CLINT_bid = awid;
            CLINT_bresp = OKAY;
        end
    endcase
end

always@(*) begin
    case(state)
        `ysyx_041461_CLINT_R: begin
            if(raddr_mtime_hit == 1'b1) begin
                CLINT_rdata = mtime;
            end
            else if(raddr_mtimecmp_hit == 1'b1) begin
                CLINT_rdata = mtimecmp;
            end
            else begin
                CLINT_rdata = 64'b0;
            end
        end
        default: begin
            CLINT_rdata = 64'b0;
        end
    endcase
end

always@(*) begin
    case(state)
        `ysyx_041461_CLINT_R: begin
            CLINT_rvalid = 1'b1;
            CLINT_rid = arid;
            CLINT_rresp = OKAY;
            CLINT_rlast = 1'b1;
        end
        default: begin
            CLINT_rvalid = 1'b0;
            CLINT_rid = 4'b0000;
            CLINT_rresp = OKAY;
            CLINT_rlast = 1'b0;
        end
    endcase
end


always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        mtime <= 64'b0;
        mtimecmp <= 64'b0;
    end
    else begin
        mtime <= mtime_next;
        mtimecmp <= mtimecmp_next;
    end
end


always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= `ysyx_041461_CLINT_START;
    end
    else begin
        case(state)
            `ysyx_041461_CLINT_START: begin
                if(CLINT_awvalid == 1'b1 && waddr_hit == 1'b1 && CLINT_awlen == 8'b000) begin
                    state <= `ysyx_041461_CLINT_W;
                end
                else if(CLINT_arvalid == 1'b1 && raddr_hit == 1'b1 && CLINT_arlen == 8'b000) begin
                    state <= `ysyx_041461_CLINT_R;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_CLINT_W: begin
                if(CLINT_wvalid == 1'b1 && CLINT_wlast == 1'b1) begin
                    state <= `ysyx_041461_CLINT_WFINISH;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_CLINT_WFINISH: begin
                if(CLINT_bready == 1'b1) begin
                    state <= `ysyx_041461_CLINT_START;
                end
                else begin
                    state <= state;
                end
            end
            `ysyx_041461_CLINT_R: begin
                if(CLINT_rready == 1'b1) begin
                    state <= `ysyx_041461_CLINT_START;
                end
                else begin
                    state <= state;
                end
            end
        endcase
    end
end

  
endmodule
module ysyx_041461_Booth_core(

    input  wire  [2:0]    Booth_core_src,
    input  wire  [127:0]  Booth_core_x  ,

    output reg   [127:0]  Booth_core_p  ,
    output reg   [0:0]    Booth_core_c
);

wire [0:0] y_add;
wire [0:0] y;
wire [0:0] y_sub;
wire [0:0] sel_negative;
wire [0:0] sel_double_negative;
wire [0:0] sel_positive;
wire [0:0] sel_double_positive;

assign y_add = Booth_core_src[2:2];
assign y = Booth_core_src[1:1];
assign y_sub = Booth_core_src[0:0];
assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
assign sel_double_negative =  y_add & ~y & ~y_sub;
assign sel_double_positive = ~y_add &  y &  y_sub;

always@(*) begin
    if(sel_negative == 1'b1) begin
        Booth_core_p = ~Booth_core_x;
        Booth_core_c = 1'b1;
    end
    else if(sel_positive == 1'b1) begin
        Booth_core_p = Booth_core_x;
        Booth_core_c = 1'b0;
    end
    else if(sel_double_negative == 1'b1) begin
        Booth_core_p = ~(Booth_core_x << 1);
        Booth_core_c = 1'b1;
    end
    else if(sel_double_positive == 1'b1) begin
        Booth_core_p = Booth_core_x << 1;
        Booth_core_c = 1'b0;
    end
    else begin
        Booth_core_p = 128'b0;
        Booth_core_c = 1'b0;
    end
end

endmodule
module ysyx_041461_CSA(

    input  wire [0:0] a   ,
    input  wire [0:0] b   ,
    input  wire [0:0] cin ,
    output wire [0:0] cout,
    output wire [0:0] s
);

assign s = a ^ b ^ cin;
assign cout = a & b | b & cin | a & cin;

endmodule

module ysyx_041461_DIV(

    input  wire   [0:0]  clk          ,
    input  wire   [0:0]  rst          ,

    input  wire   [0:0]  DIV_valid_in ,
    input  wire   [0:0]  DIV_signed   ,
    input  wire   [0:0]  DIV_divw     ,
    input  wire   [63:0] DIV_dividend ,
    input  wire   [63:0] DIV_divisor  ,

    output reg    [0:0]  DIV_valid_out,
    output reg    [63:0] DIV_quotient ,
    output reg    [63:0] DIV_remainder
);

reg  [0:0]  signed_buffer  ;   
reg  [0:0]  divw_buffer    ;     
reg  [63:0] dividend_buffer; 
reg  [63:0] divisor_buffer ;  

reg  [127:0] dividend;
reg  [64:0] divisor;
reg  [63:0] quotient;
wire [64:0] sub_out; 

reg  [63:0] dividend_w;
reg  [32:0] divisor_w;
reg  [31:0] quotient_w;
wire [32:0] subw_out;

reg  [63:0] quotient_out;
reg  [63:0] remainder_out;

reg  [0:0] quotient_positive;
reg  [0:0] remainder_positive;

reg  [6:0] state;

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        signed_buffer   <= 1'b0; 
        divw_buffer     <= 1'b0; 
        dividend_buffer <= 64'b0; 
        divisor_buffer  <= 64'b0; 
    end
    else begin
        if(state == 7'b0 && DIV_valid_in == 1'b1) begin
            signed_buffer   <= DIV_signed  ; 
            divw_buffer     <= DIV_divw    ; 
            dividend_buffer <= DIV_dividend; 
            divisor_buffer  <= DIV_divisor ; 
        end
        else begin
            signed_buffer   <= signed_buffer  ;
            divw_buffer     <= divw_buffer    ;
            dividend_buffer <= dividend_buffer;
            divisor_buffer  <= divisor_buffer ;
        end
    end
end

always@(*) begin
    if(signed_buffer == 1'b1) begin
        if(divisor_buffer[63:63] == 1'b1) begin
            divisor = {1'b0, ~divisor_buffer + 1'b1};
        end
        else begin
            divisor = {1'b0, divisor_buffer};
        end
    end
    else begin
        divisor = {1'b0, divisor_buffer};
    end
end

always@(*) begin
    if(signed_buffer == 1'b1) begin
        if(divisor_buffer[31:31] == 1'b1) begin
            divisor_w = {1'b0, ~divisor_buffer[31:0] + 1'b1};
        end
        else begin
            divisor_w = {1'b0, divisor_buffer[31:0]};
        end
    end
    else begin
        divisor_w = {1'b0, divisor_buffer[31:0]};
    end
end

assign sub_out = dividend[127:63] - divisor;
assign subw_out = dividend_w[63:31] - divisor_w;

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        dividend <= 128'b0;
    end
    else begin
        if(state == 7'b1) begin
            if(signed_buffer == 1'b1) begin
                if(dividend_buffer[63:63] == 1'b1) begin
                    dividend <= {64'b0, ~dividend_buffer + 1'b1};
                end
                else begin
                    dividend <= {64'b0, dividend_buffer};
                end
            end
            else begin
                dividend <= {64'b0, dividend_buffer};
            end
        end
        else begin
            if(sub_out[64:64] == 1'b1) begin
                dividend <= dividend << 1;
            end
            else begin
                dividend <= {sub_out, dividend[62:0]} << 1;
            end
        end
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        quotient <= 64'b0;
    end
    else begin
        if(state == 7'b1) begin
            quotient <= 64'b0;
        end
        else begin
            if(sub_out[64:64] == 1'b1) begin
                quotient <= {quotient[63:1], 1'b0} << 1;
            end
            else begin
                quotient <= {quotient[63:1], 1'b1} << 1;
            end
        end
    end
end


always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        dividend_w <= 64'b0;
    end
    else begin
        if(state == 7'b1) begin
            if(signed_buffer == 1'b1) begin
                if(dividend_buffer[31:31] == 1'b1) begin
                    dividend_w <= {32'b0, ~dividend_buffer[31:0] + 1'b1};
                end
                else begin
                    dividend_w <= {32'b0, dividend_buffer[31:0]};
                end
            end
            else begin
                dividend_w <= {32'b0, dividend_buffer[31:0]};
            end
        end
        else begin
            if(subw_out[32:32] == 1'b1) begin
                dividend_w <= dividend_w << 1;
            end
            else begin
                dividend_w <= {subw_out, dividend_w[30:0]} << 1;
            end
        end
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        quotient_w <= 32'b0;
    end
    else begin
        if(state == 7'b1) begin
            quotient_w <= 32'b0;
        end
        else begin
            if(subw_out[32:32] == 1'b1) begin
                quotient_w <= {quotient_w[31:1], 1'b0} << 1;
            end
            else begin
                quotient_w <= {quotient_w[31:1], 1'b1} << 1;
            end
        end
    end
end

always@(*) begin
    if(divw_buffer == 1'b0) begin
        if(sub_out[64:64] == 1'b1) begin
            quotient_out = {quotient[63:1], 1'b0};
        end
        else begin
            quotient_out = {quotient[63:1], 1'b1};
        end
    end
    else begin
        if(subw_out[32:32] == 1'b1) begin
            quotient_out = {32'b0, quotient_w[31:1], 1'b0};
        end
        else begin
            quotient_out = {32'b0, quotient_w[31:1], 1'b1};
        end
    end
end

always@(*) begin
    if(divw_buffer == 1'b0) begin
        if(sub_out[64:64] == 1'b1) begin
            remainder_out = dividend[126:63];
        end
        else begin
            remainder_out = sub_out[63:0];
        end
    end
    else begin
        if(subw_out[32:32] == 1'b1) begin
            remainder_out = {32'b0, dividend_w[62:31]};
        end
        else begin
            remainder_out = {32'b0, subw_out[31:0]};
        end
    end
end

always@(*) begin
    if(signed_buffer == 1'b1) begin
        if(divw_buffer == 1'b0) begin
            quotient_positive = ~dividend_buffer[63:63] ^ divisor_buffer[63:63];
            remainder_positive = ~dividend_buffer[63:63];
        end
        else begin
            quotient_positive = ~dividend_buffer[31:31] ^ divisor_buffer[31:31];
            remainder_positive = ~dividend_buffer[31:31];
        end
    end
    else begin
        quotient_positive = 1'b1;
        remainder_positive = 1'b1;
    end
end

always@(*) begin
    if(quotient_positive == 1'b1) begin
        DIV_quotient = quotient_out;
    end
    else begin
        DIV_quotient = ~quotient_out + 1'b1;
    end
end

always@(*) begin
    if(remainder_positive == 1'b1) begin
        DIV_remainder = remainder_out;
    end
    else begin
        DIV_remainder = ~remainder_out + 1'b1;
    end
end

always@(*) begin
    if(state == 7'd33 && divw_buffer == 1'b1) begin
        DIV_valid_out = 1'b1;
    end
    else if(state == 7'd65) begin
        DIV_valid_out = 1'b1;
    end
    else begin
        DIV_valid_out = 1'b0;
    end
end

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= 7'b0;
    end
    else begin
        if(state == 7'b0) begin
            if(DIV_valid_in == 1'b1) begin
                state <= state + 1'b1;
            end
            else begin
                state <= state;
            end
        end
        else if(state == 7'd33 && divw_buffer == 1'b1) begin
            state <= 7'b0;
        end
        else if(state == 7'd65) begin
            state <= 7'b0;
        end
        else begin
            state <= state + 1'b1;
        end
    end
end


endmodule

module ysyx_041461_MUL(

    input  wire   [0:0]  clk             ,
    input  wire   [0:0]  rst             ,

    input  wire   [0:0]  MUL_valid_in    ,
    input  wire   [1:0]  MUL_signed      ,
    input  wire   [63:0] MUL_multiplicand,
    input  wire   [63:0] MUL_multiplier  ,

    output reg    [0:0]  MUL_valid_out   ,
    output wire   [63:0] MUL_result_hi   ,
    output wire   [63:0] MUL_result_lo
);

reg [127:0] multiplicand;
reg [65:0] multiplier;

always@(*) begin
    case(MUL_signed)
        `ysyx_041461_MUL_unsigned_x_unsigned: begin
            multiplicand = {64'b0, MUL_multiplicand};
            multiplier = {2'b0, MUL_multiplier};
        end
        `ysyx_041461_MUL_signed_x_unsigned: begin
            multiplicand = {{64{MUL_multiplicand[63:63]}}, MUL_multiplicand};
            multiplier = {2'b0, MUL_multiplier};
        end
        `ysyx_041461_MUL_signed_x_signed: begin
            multiplicand = {{64{MUL_multiplicand[63:63]}}, MUL_multiplicand};
            multiplier = {{2{MUL_multiplier[63:63]}}, MUL_multiplier};
        end
        default: begin
            multiplicand = 128'b0;
            multiplier = 66'b0;
        end
    endcase
end

wire [127:0] Booth_core_p [32:0];
wire [0:0] Booth_core_c [32:0];

ysyx_041461_Booth_core Booth_core0(

    .Booth_core_src ({multiplier[1:0], 1'b0}),
    .Booth_core_x   (multiplicand),

    .Booth_core_p   (Booth_core_p[0]),
    .Booth_core_c   (Booth_core_c[0])
);
genvar i;
generate  
    for(i = 2; i < 65; i = i + 2) begin: Booth_core
        ysyx_041461_Booth_core Booth_core(

            .Booth_core_src (multiplier[i + 1:i - 1]),
            .Booth_core_x   (multiplicand << i      ),

            .Booth_core_p   (Booth_core_p[i / 2]),
            .Booth_core_c   (Booth_core_c[i / 2])
        );
   	end 
endgenerate

reg [32:0] switch_out [127:0];
reg [32:0] switch_c;

genvar j, k, m;
generate
    for(j = 0; j < 128; j = j + 1) begin: switch1
        for(k = 0; k < 33; k = k + 1) begin: switch2
            always@(posedge clk or posedge rst) begin
                if(rst == 1'b1) begin
                    switch_out[j][k] <= 1'b0;
                end
                else begin
                    switch_out[j][k] <= Booth_core_p[k][j];
                end
            end
        end
    end
endgenerate
generate
    for(m = 0; m < 33; m = m + 1) begin: switch3
        always@(posedge clk or posedge rst) begin
            if(rst == 1'b1) begin
                switch_c[m] <= 1'b0;
            end
            else begin
                switch_c[m] <= Booth_core_c[m];
            end
        end
    end
endgenerate


wire   [10:0] Walloc_33bits_cout1 [127:0];
wire   [6:0]  Walloc_33bits_cout2 [127:0];
wire   [4:0]  Walloc_33bits_cout3 [127:0];
wire   [2:0]  Walloc_33bits_cout4 [127:0];
wire   [1:0]  Walloc_33bits_cout5 [127:0];
wire   [1:0]  Walloc_33bits_cout6 [127:0];
wire   [0:0]  Walloc_33bits_cout7 [127:0];
wire   [0:0]  Walloc_33bits_cout  [127:0];
wire   [0:0]  Walloc_33bits_sout  [127:0];

ysyx_041461_Walloc_33bits Walloc0(

    .clk                 (clk),
    .rst                 (rst),

    .Walloc_33bits_src   (switch_out[0]  ),
    .Walloc_33bits_cin2  (switch_c[10:0] ),
    .Walloc_33bits_cin3  (switch_c[17:11]),
    .Walloc_33bits_cin4  (switch_c[22:18]),
    .Walloc_33bits_cin5  (switch_c[25:23]),
    .Walloc_33bits_cin6  (switch_c[27:26]),
    .Walloc_33bits_cin7  (switch_c[29:28]),
    .Walloc_33bits_cin8  (switch_c[30:30]),

    .Walloc_33bits_cout1 (Walloc_33bits_cout1[0]),
    .Walloc_33bits_cout2 (Walloc_33bits_cout2[0]),
    .Walloc_33bits_cout3 (Walloc_33bits_cout3[0]),
    .Walloc_33bits_cout4 (Walloc_33bits_cout4[0]),
    .Walloc_33bits_cout5 (Walloc_33bits_cout5[0]),
    .Walloc_33bits_cout6 (Walloc_33bits_cout6[0]),
    .Walloc_33bits_cout7 (Walloc_33bits_cout7[0]),
    .Walloc_33bits_cout  (Walloc_33bits_cout [0]),
    .Walloc_33bits_sout  (Walloc_33bits_sout [0])
);
genvar t;
generate  
    for(t = 1; t < 128; t = t + 1) begin: Walloc
        ysyx_041461_Walloc_33bits Walloc(

            .clk                 (clk),
            .rst                 (rst),

            .Walloc_33bits_src   (switch_out[t]  ),
            .Walloc_33bits_cin2  (Walloc_33bits_cout1[t-1]),
            .Walloc_33bits_cin3  (Walloc_33bits_cout2[t-1]),
            .Walloc_33bits_cin4  (Walloc_33bits_cout3[t-1]),
            .Walloc_33bits_cin5  (Walloc_33bits_cout4[t-1]),
            .Walloc_33bits_cin6  (Walloc_33bits_cout5[t-1]),
            .Walloc_33bits_cin7  (Walloc_33bits_cout6[t-1]),
            .Walloc_33bits_cin8  (Walloc_33bits_cout7[t-1]),

            .Walloc_33bits_cout1 (Walloc_33bits_cout1[t]),
            .Walloc_33bits_cout2 (Walloc_33bits_cout2[t]),
            .Walloc_33bits_cout3 (Walloc_33bits_cout3[t]),
            .Walloc_33bits_cout4 (Walloc_33bits_cout4[t]),
            .Walloc_33bits_cout5 (Walloc_33bits_cout5[t]),
            .Walloc_33bits_cout6 (Walloc_33bits_cout6[t]),
            .Walloc_33bits_cout7 (Walloc_33bits_cout7[t]),
            .Walloc_33bits_cout  (Walloc_33bits_cout [t]),
            .Walloc_33bits_sout  (Walloc_33bits_sout [t])
        );
   	end 
endgenerate


reg [127:0] adder_src1;
reg [127:0] adder_src2;

integer r;
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        adder_src1 <= 128'b0;
        adder_src2 <= 128'b0;
    end
    else begin
        adder_src1[0:0] <= switch_c[31:31];
        adder_src2[0:0] <= Walloc_33bits_sout[0];
        for(r = 1; r < 128; r = r + 1) begin
            adder_src1[r] <= Walloc_33bits_cout[r - 1];
            adder_src2[r] <= Walloc_33bits_sout[r];
        end
    end
end

assign {MUL_result_hi, MUL_result_lo} = adder_src1 + adder_src2 + {127'b0, switch_c[32:32]};

reg [2:0] state; 

always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        state <= 3'b0;
    end
    else begin
        if(state == 3'b0) begin
            if(MUL_valid_in == 1'b1) begin
                state <= state + 1'b1;
            end
            else begin
                state <= state;
            end
        end
        else if(state == 3'd5) begin
            state <= 3'b0;
        end
        else begin
            state <= state + 1'b1;
        end
    end
end

always@(*) begin
    if(state == 3'd5) begin
        MUL_valid_out = 1'b1;
    end
    else begin
        MUL_valid_out = 1'b0;
    end
end

endmodule
module ysyx_041461_Walloc_33bits(

    input  wire   [0:0]  clk               ,
    input  wire   [0:0]  rst               ,

    input  wire   [32:0] Walloc_33bits_src ,
    input  wire   [10:0] Walloc_33bits_cin2,
    input  wire   [6:0]  Walloc_33bits_cin3,
    input  wire   [4:0]  Walloc_33bits_cin4,
    input  wire   [2:0]  Walloc_33bits_cin5,
    input  wire   [1:0]  Walloc_33bits_cin6,
    input  wire   [1:0]  Walloc_33bits_cin7,
    input  wire   [0:0]  Walloc_33bits_cin8,

    output wire   [10:0] Walloc_33bits_cout1,
    output wire   [6:0]  Walloc_33bits_cout2,
    output wire   [4:0]  Walloc_33bits_cout3,
    output wire   [2:0]  Walloc_33bits_cout4,
    output wire   [1:0]  Walloc_33bits_cout5,
    output wire   [1:0]  Walloc_33bits_cout6,
    output wire   [0:0]  Walloc_33bits_cout7,
    output wire   [0:0]  Walloc_33bits_cout ,
    output wire   [0:0]  Walloc_33bits_sout
);

///////////////first////////////////
wire [10:0] sout1;
genvar i;
generate
    for(i = 0; i < 11; i = i + 1) begin: first
        ysyx_041461_CSA CSA(

            .a    (Walloc_33bits_src[3*i:3*i]),
            .b    (Walloc_33bits_src[3*i + 1:3*i + 1]),
            .cin  (Walloc_33bits_src[3*i + 2:3*i + 2]),
            .cout (Walloc_33bits_cout1[i:i]),
            .s    (sout1[i:i])
        );
    end
endgenerate
///////////////secnod///////////////
wire [21:0] src2;
wire [7:0] sout2;
assign src2 = {Walloc_33bits_cin2, sout1};
assign sout2[7:7] = src2[21:21];
genvar j;
generate
    for(j = 0; j < 7; j = j + 1) begin: second
        ysyx_041461_CSA CSA(

            .a    (src2[3*j:3*j]),
            .b    (src2[3*j + 1:3*j + 1]),
            .cin  (src2[3*j + 2:3*j + 2]),
            .cout (Walloc_33bits_cout2[j:j]),
            .s    (sout2[j:j])
        );
    end
endgenerate
///////////////thrid///////////////
reg  [14:0] src3;
wire [4:0] sout3;
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        src3 <= 15'b0;
    end
    else begin
        src3 <= {Walloc_33bits_cin3, sout2};
    end
end
genvar k;
generate
    for(k = 0; k < 5; k = k + 1) begin: thrid
        ysyx_041461_CSA CSA(

            .a    (src3[3*k:3*k]),
            .b    (src3[3*k + 1:3*k + 1]),
            .cin  (src3[3*k + 2:3*k + 2]),
            .cout (Walloc_33bits_cout3[k:k]),
            .s    (sout3[k:k])
        );
    end
endgenerate
///////////////fourth///////////////
wire [9:0] src4;
wire [3:0] sout4;
assign src4 = {Walloc_33bits_cin4, sout3};
assign sout4[3:3] = src4[9:9];
genvar m;
generate
    for(m = 0; m < 3; m = m + 1) begin: fourth
        ysyx_041461_CSA CSA(

            .a    (src4[3*m:3*m]),
            .b    (src4[3*m + 1:3*m + 1]),
            .cin  (src4[3*m + 2:3*m + 2]),
            .cout (Walloc_33bits_cout4[m:m]),
            .s    (sout4[m:m])
        );
    end
endgenerate
///////////////fifth///////////////
reg  [6:0] src5;
wire [2:0] sout5;
assign sout5[2:2] = src5[6:6];
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        src5 <= 7'b0;
    end
    else begin
        src5 <= {Walloc_33bits_cin5, sout4};
    end
end
genvar n;
generate
    for(n = 0; n < 2; n = n + 1) begin: fifth
        ysyx_041461_CSA CSA(

            .a    (src5[3*n:3*n]),
            .b    (src5[3*n + 1:3*n + 1]),
            .cin  (src5[3*n + 2:3*n + 2]),
            .cout (Walloc_33bits_cout5[n:n]),
            .s    (sout5[n:n])
        );
    end
endgenerate
///////////////sixth///////////////
wire [5:0] src6;
wire [1:0] sout6;
assign src6 = {Walloc_33bits_cin6, sout5, 1'b0};
genvar r;
generate
    for(r = 0; r < 2; r = r + 1) begin: sixth
        ysyx_041461_CSA CSA(

            .a    (src6[3*r:3*r]),
            .b    (src6[3*r + 1:3*r + 1]),
            .cin  (src6[3*r + 2:3*r + 2]),
            .cout (Walloc_33bits_cout6[r:r]),
            .s    (sout6[r:r])
        );
    end
endgenerate
///////////////seventh///////////////
reg  [3:0] src7;
wire [1:0] sout7;
assign sout7[1:1] = src7[3:3];
always@(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        src7 <= 4'b0;
    end
    else begin
        src7 <= {Walloc_33bits_cin7, sout6};
    end
end
ysyx_041461_CSA CSA7(
    .a    (src7[0:0]),
    .b    (src7[1:1]),
    .cin  (src7[2:2]),
    .cout (Walloc_33bits_cout7),
    .s    (sout7[0:0])
);
///////////////eighth///////////////
wire [2:0] src8;
assign src8 = {Walloc_33bits_cin8, sout7};
ysyx_041461_CSA CSA8(
    .a    (src8[0:0]),
    .b    (src8[1:1]),
    .cin  (src8[2:2]),
    .cout (Walloc_33bits_cout),
    .s    (Walloc_33bits_sout)
);

endmodule
module ysyx_041461(
    input             clock            , 
    input             reset            ,
    input             io_interrupt     ,
    input             io_master_awready,
    output            io_master_awvalid,
    output   [3:0]    io_master_awid   ,
    output   [31:0]   io_master_awaddr ,
    output   [7:0]    io_master_awlen  ,
    output   [2:0]    io_master_awsize ,
    output   [1:0]    io_master_awburst,
    input             io_master_wready ,
    output            io_master_wvalid ,
    output   [63:0]   io_master_wdata  ,
    output   [7:0]    io_master_wstrb  ,
    output            io_master_wlast  ,
    output            io_master_bready ,
    input             io_master_bvalid ,
    input    [3:0]    io_master_bid    ,
    input    [1:0]    io_master_bresp  ,
    input             io_master_arready,
    output            io_master_arvalid,
    output   [3:0]    io_master_arid   ,
    output   [31:0]   io_master_araddr ,
    output   [7:0]    io_master_arlen  ,
    output   [2:0]    io_master_arsize ,
    output   [1:0]    io_master_arburst,
    output            io_master_rready ,
    input             io_master_rvalid ,
    input    [3:0]    io_master_rid    ,
    input    [1:0]    io_master_rresp  ,
    input    [63:0]   io_master_rdata  ,
    input             io_master_rlast  ,
    output            io_slave_awready ,
    input             io_slave_awvalid ,
    input    [3:0]    io_slave_awid    ,
    input    [31:0]   io_slave_awaddr  ,
    input    [7:0]    io_slave_awlen   ,
    input    [2:0]    io_slave_awsize  ,
    input    [1:0]    io_slave_awburst ,
    output            io_slave_wready  ,
    input             io_slave_wvalid  ,
    input    [63:0]   io_slave_wdata   ,
    input    [7:0]    io_slave_wstrb   ,
    input             io_slave_wlast   ,
    input             io_slave_bready  ,
    output            io_slave_bvalid  ,
    output   [3:0]    io_slave_bid     ,
    output   [1:0]    io_slave_bresp   ,
    output            io_slave_arready ,
    input             io_slave_arvalid ,
    input    [3:0]    io_slave_arid    ,
    input    [31:0]   io_slave_araddr  ,
    input    [7:0]    io_slave_arlen   ,
    input    [2:0]    io_slave_arsize  ,
    input    [1:0]    io_slave_arburst ,
    input             io_slave_rready  ,
    output            io_slave_rvalid  ,
    output   [3:0]    io_slave_rid     ,
    output   [1:0]    io_slave_rresp   ,
    output   [63:0]   io_slave_rdata   ,
    output            io_slave_rlast   ,
    output   [5:0]    io_sram0_addr    , 
    output            io_sram0_cen     , 
    output            io_sram0_wen     , 
    output   [127:0]  io_sram0_wmask   , 
    output   [127:0]  io_sram0_wdata   , 
    input    [127:0]  io_sram0_rdata   ,
    output   [5:0]    io_sram1_addr    , 
    output            io_sram1_cen     , 
    output            io_sram1_wen     , 
    output   [127:0]  io_sram1_wmask   , 
    output   [127:0]  io_sram1_wdata   , 
    input    [127:0]  io_sram1_rdata   , 
    output   [5:0]    io_sram2_addr    , 
    output            io_sram2_cen     , 
    output            io_sram2_wen     , 
    output   [127:0]  io_sram2_wmask   , 
    output   [127:0]  io_sram2_wdata   , 
    input    [127:0]  io_sram2_rdata   , 
    output   [5:0]    io_sram3_addr    , 
    output            io_sram3_cen     , 
    output            io_sram3_wen     , 
    output   [127:0]  io_sram3_wmask   , 
    output   [127:0]  io_sram3_wdata   , 
    input    [127:0]  io_sram3_rdata   , 
    output   [5:0]    io_sram4_addr    , 
    output            io_sram4_cen     , 
    output            io_sram4_wen     , 
    output   [127:0]  io_sram4_wmask   , 
    output   [127:0]  io_sram4_wdata   , 
    input    [127:0]  io_sram4_rdata   , 
    output   [5:0]    io_sram5_addr    , 
    output            io_sram5_cen     , 
    output            io_sram5_wen     , 
    output   [127:0]  io_sram5_wmask   , 
    output   [127:0]  io_sram5_wdata   , 
    input    [127:0]  io_sram5_rdata   , 
    output   [5:0]    io_sram6_addr    , 
    output            io_sram6_cen     , 
    output            io_sram6_wen     , 
    output   [127:0]  io_sram6_wmask   , 
    output   [127:0]  io_sram6_wdata   , 
    input    [127:0]  io_sram6_rdata   , 
    output   [5:0]    io_sram7_addr    , 
    output            io_sram7_cen     , 
    output            io_sram7_wen     , 
    output   [127:0]  io_sram7_wmask   , 
    output   [127:0]  io_sram7_wdata   , 
    input    [127:0]  io_sram7_rdata   
); 

assign  io_slave_awready = 1'b0 ;
assign  io_slave_wready  = 1'b0 ;
assign  io_slave_bvalid  = 1'b0 ;
assign  io_slave_bresp   = 2'b0 ;
assign  io_slave_bid     = 4'b0 ;
assign  io_slave_arready = 1'b0 ;
assign  io_slave_rvalid  = 1'b0 ;
assign  io_slave_rresp   = 2'b0 ;
assign  io_slave_rdata   = 64'b0;
assign  io_slave_rlast   = 1'b0 ;
assign  io_slave_rid     = 4'b0 ;


wire [0:0]  CD_IF_trap;   
wire [0:0]  CD_IF2_trap;  
wire [0:0]  CD_ID_conflict;
wire [0:0]  CD_ID_trap;  
wire [0:0]  CD_EXE_conflict;
wire [0:0]  CD_EXE_trap; 
wire [0:0]  CD_MEM_conflict;
wire [0:0]  CD_MEM_trap;

wire [63:0] IFreg_pc       ;

wire [3:0]  IF_trap_out;
wire [0:0]  IF_valid_out;
wire [0:0]  IF_ready;
wire [63:0] IF_AXI_rdata;
wire [0:0]  IF_ok;
wire [0:0]  IF_hit1;
wire [0:0]  IF_hit2;
wire [0:0]  IF_hit3;
wire [0:0]  IF_hit4;
wire [0:0]  IF_hit5;
wire [0:0]  IF_hit6;
wire [0:0]  IF_hit7;
wire [0:0]  IF_hit8;
wire [0:0]  IF_arvalid;
wire [31:0] IF_araddr ;
wire [3:0]  IF_arid   ;
wire [7:0]  IF_arlen  ;
wire [2:0]  IF_arsize ;
wire [1:0]  IF_arburst;
wire [0:0]  IF_rready ;

wire [63:0] IF2reg_pc_out;     
wire [63:0] IF2reg_AXI_rdata_out;
wire [0:0]  IF2reg_hit1_out;     
wire [0:0]  IF2reg_hit2_out;     
wire [0:0]  IF2reg_hit3_out;     
wire [0:0]  IF2reg_hit4_out;     
wire [0:0]  IF2reg_hit5_out;     
wire [0:0]  IF2reg_hit6_out;     
wire [0:0]  IF2reg_hit7_out;     
wire [0:0]  IF2reg_hit8_out;     
wire [0:0]  IF2reg_valid_out;  
wire [3:0]  IF2reg_trap_out; 

wire [0:0]  IF2_valid_out;
wire [3:0]  IF2_trap_out; 
wire [0:0]  IF2_ready;    
wire [31:0] IF2_inst;     

wire [0:0]  IDreg_valid_out ;  
wire [3:0]  IDreg_trap_out  ;
wire [31:0] IDreg_inst_out  ;  
wire [63:0] IDreg_pc_out    ;  

wire [4:0]  ID_rd       ;
wire [4:0]  ID_rs1      ;
wire [4:0]  ID_rs2      ;
wire [11:0] ID_csr      ;
wire [63:0] ID_imm      ;
wire [63:0] ID_zimm     ;
wire [63:0] ID_next_pc  ;
wire [0:0]  ID_valid_out;
wire [0:0]  ID_IFreg_ctrl;
/* verilator lint_off UNOPTFLAT */
wire [2:0]  ID_TYPE  ;
/* verilator lint_on UNOPTFLAT */
wire [4:0]  ID_EXE_ctrl ;
wire [2:0]  ID_EXE_src  ;
wire [3:0]  ID_MEM_ctrl ;
wire [3:0]  ID_WB_ctrl  ;
wire [3:0]  ID_trap_out;  
wire [0:0]  ID_ready;

wire [0:0]  EXEreg_valid_out   ;
wire [3:0]  EXEreg_trap_out    ;
wire [4:0]  EXEreg_rd_out      ;
wire [4:0]  EXEreg_rs1_out     ;
wire [4:0]  EXEreg_rs2_out     ;
wire [11:0] EXEreg_csr_out     ;
wire [63:0] EXEreg_imm_out     ;
wire [63:0] EXEreg_zimm_out    ;
wire [63:0] EXEreg_pc_out      ;
wire [4:0]  EXEreg_EXE_ctrl_out;
wire [2:0]  EXEreg_EXE_src_out ;
wire [3:0]  EXEreg_MEM_ctrl_out;
wire [3:0]  EXEreg_WB_ctrl_out ;
wire [31:0] EXEreg_inst_out    ;

wire [63:0] EXE_out            ;
wire [0:0]  EXE_valid_out      ;
wire [0:0]  EXE_ready;
wire [0:0]  EXE_ok;

wire [0:0]  MEMreg_valid_out   ;
wire [3:0]  MEMreg_trap_out    ;
wire [63:0] MEMreg_EXE_out     ;
wire [4:0]  MEMreg_rd_out      ;
wire [4:0]  MEMreg_rs1_out     ;
wire [4:0]  MEMreg_rs2_out     ;
wire [11:0] MEMreg_csr_out     ;
wire [63:0] MEMreg_imm_out     ;
wire [63:0] MEMreg_zimm_out    ;
wire [63:0] MEMreg_pc_out      ;
wire [3:0]  MEMreg_MEM_ctrl_out;
wire [3:0]  MEMreg_WB_ctrl_out ;
wire [31:0] MEMreg_inst_out    ;

wire [0:0]  MEM_valid_out;
wire [0:0]  MEM_ready    ;
wire [63:0] MEM_out      ;
wire [3:0]  MEM_trap_out;
wire [0:0]  MEM_ok    ;
wire [0:0]  MEM_awvalid  ;
wire [31:0] MEM_awaddr   ;
wire [3:0]  MEM_awid     ;
wire [7:0]  MEM_awlen    ;
wire [2:0]  MEM_awsize   ;
wire [1:0]  MEM_awburst  ;
wire [0:0]  MEM_wvalid   ;
wire [63:0] MEM_wdata    ;
wire [7:0]  MEM_wstrb    ;
wire [0:0]  MEM_wlast    ;
wire [0:0]  MEM_bready   ; 
wire [0:0]  MEM_arvalid  ; 
wire [31:0] MEM_araddr   ; 
wire [3:0]  MEM_arid     ; 
wire [7:0]  MEM_arlen    ; 
wire [2:0]  MEM_arsize   ; 
wire [1:0]  MEM_arburst  ; 
wire [0:0]  MEM_rready   ;

wire [0:0]  WBreg_valid_out  ;
wire [3:0]  WBreg_trap_out   ;
wire [63:0] WBreg_EXE_out    ;
wire [63:0] WBreg_MEM_out    ;
wire [4:0]  WBreg_rd_out     ;
wire [4:0]  WBreg_rs1_out    ;
wire [11:0] WBreg_csr_out    ;
wire [63:0] WBreg_imm_out    ;
wire [63:0] WBreg_zimm_out   ;
wire [63:0] WBreg_pc_out     ;
wire [3:0]  WBreg_WB_ctrl_out; 
wire [31:0] WBreg_inst_out   ;


wire [0:0]   WB_ready;
wire [63:0]  WB_IFreg_mtvec ;
wire [63:0]  WB_IFreg_mepc  ;
wire [62:0]  WB_IFreg_CAUSE ;
wire [1:0]   WB_IFreg_ctrl  ;
wire [63:0]  WB_IF_mstatus  ;
wire [63:0]  WB_IF_mie      ;
wire [63:0]  WB_IF_mip      ;
wire [63:0]  WB_ID_rs1_data ;
wire [63:0]  WB_ID_rs2_data ;
wire [63:0]  WB_EXE_rs1_data;
wire [63:0]  WB_EXE_rs2_data;
wire [63:0]  WB_EXE_csr_data;
wire [63:0]  WB_MEM_rs2_data;

wire [0:0]   time_interrupt;  
wire         CLINT_awready ;  
wire         CLINT_wready  ; 
wire         CLINT_bvalid  ; 
wire [3:0]   CLINT_bid     ; 
wire [1:0]   CLINT_bresp   ;
wire         CLINT_arready ; 
wire         CLINT_rvalid  ;
wire [3:0]   CLINT_rid     ;
wire [1:0]   CLINT_rresp   ;
wire [63:0]  CLINT_rdata   ;
wire         CLINT_rlast   ;

wire [0:0]   ARBITER_IF_arready ;
wire [0:0]   ARBITER_IF_rvalid  ;
wire [1:0]   ARBITER_IF_rresp   ;
wire [63:0]  ARBITER_IF_rdata   ;
wire [0:0]   ARBITER_IF_rlast   ;
wire [3:0]   ARBITER_IF_rid     ;
wire [0:0]   ARBITER_MEM_arready;
wire [0:0]   ARBITER_MEM_rvalid ;
wire [1:0]   ARBITER_MEM_rresp  ;
wire [63:0]  ARBITER_MEM_rdata  ;
wire [0:0]   ARBITER_MEM_rlast  ;
wire [3:0]   ARBITER_MEM_rid    ;
wire [0:0]   ARBITER_MEM_awready;
wire [0:0]   ARBITER_MEM_wready ; 
wire [0:0]   ARBITER_MEM_bvalid ;
wire [1:0]   ARBITER_MEM_bresp  ;
wire [3:0]   ARBITER_MEM_bid    ;
wire         ARBITER_CLINT_awvalid;
wire [3:0]   ARBITER_CLINT_awid   ;
wire [31:0]  ARBITER_CLINT_awaddr ;
wire [7:0]   ARBITER_CLINT_awlen  ;
wire [2:0]   ARBITER_CLINT_awsize ;
wire [1:0]   ARBITER_CLINT_awburst;
wire         ARBITER_CLINT_wvalid ;
wire [63:0]  ARBITER_CLINT_wdata  ;
wire [7:0]   ARBITER_CLINT_wstrb  ;
wire         ARBITER_CLINT_wlast  ;
wire         ARBITER_CLINT_bready ;
wire         ARBITER_CLINT_arvalid;
wire [3:0]   ARBITER_CLINT_arid   ;
wire [31:0]  ARBITER_CLINT_araddr ;
wire [7:0]   ARBITER_CLINT_arlen  ;
wire [2:0]   ARBITER_CLINT_arsize ;
wire [1:0]   ARBITER_CLINT_arburst;
wire         ARBITER_CLINT_rready ;

//异步复位同步释放
reg  [0:0]   rst_r1;
reg  [0:0]   rst_r2;
wire [0:0]   rst_sync;

assign rst_sync = rst_r2;

always@(posedge clock or posedge reset) begin
    if(reset == 1'b1) begin
        rst_r1 <= 1'b1;
        rst_r2 <= 1'b1;
    end
    else begin
        rst_r1 <= 1'b0;
        rst_r2 <= rst_r1;
    end
end


ysyx_041461_IF_reg IF_reg(

    .clk                (clock          ),
    .rst                (rst_sync       ),
    .IFreg_enable       (IF_ready       ),
    .IFreg_ctrl_fromID  (ID_IFreg_ctrl  ),
    .IFreg_ctrl_fromWB  (WB_IFreg_ctrl  ),

    .IFreg_next_pc      (ID_next_pc     ),
    .IFreg_mtvec        (WB_IFreg_mtvec ),
    .IFreg_mepc         (WB_IFreg_mepc  ),
    .IFreg_CAUSE        (WB_IFreg_CAUSE ),

    .IFreg_pc           (IFreg_pc       )
);


ysyx_041461_IF IF(

    .clk                   (clock),
    .rst                   (rst_sync),
    .IF_pc                 (IFreg_pc),
    .IF_mstatus            (WB_IF_mstatus),
    .IF_mie                (WB_IF_mie    ),
    .IF_mip                (WB_IF_mip    ),
    .IF_ID_TYPE            (ID_TYPE  ),
    .IF_IF2_ready          (IF2_ready ),
    .IF_CD_trap            (CD_IF_trap  ),
  
    .IF_trap_out           (IF_trap_out),
    .IF_valid_out          (IF_valid_out),
    .IF_ready              (IF_ready),
    .IF_AXI_rdata          (IF_AXI_rdata),
    .IF_ok                 (IF_ok       ),

    .IF_hit1               (IF_hit1      ),
    .IF_hit2               (IF_hit2      ),
    .IF_hit3               (IF_hit3      ),
    .IF_hit4               (IF_hit4      ),
    .IF_hit5               (IF_hit5      ),
    .IF_hit6               (IF_hit6      ),
    .IF_hit7               (IF_hit7      ),
    .IF_hit8               (IF_hit8      ),
           
    .IF_arready            (ARBITER_IF_arready),
    .IF_arvalid            (IF_arvalid),
    .IF_araddr             (IF_araddr ),
    .IF_arid               (IF_arid   ),
    .IF_arlen              (IF_arlen  ),
    .IF_arsize             (IF_arsize ),
    .IF_arburst            (IF_arburst),
       
    .IF_rready             (IF_rready),
    .IF_rvalid             (ARBITER_IF_rvalid),
    .IF_rresp              (ARBITER_IF_rresp ),
    .IF_rdata              (ARBITER_IF_rdata ),
    .IF_rlast              (ARBITER_IF_rlast ),
    .IF_rid                (ARBITER_IF_rid   ),
        
    .IF_sram0_addr         (io_sram0_addr  ), 
    .IF_sram0_cen          (io_sram0_cen   ), 
    .IF_sram0_wen          (io_sram0_wen   ), 
    .IF_sram0_wmask        (io_sram0_wmask ), 
    .IF_sram0_wdata        (io_sram0_wdata ), 
        
    .IF_sram1_addr         (io_sram1_addr ), 
    .IF_sram1_cen          (io_sram1_cen  ), 
    .IF_sram1_wen          (io_sram1_wen  ), 
    .IF_sram1_wmask        (io_sram1_wmask), 
    .IF_sram1_wdata        (io_sram1_wdata), 
        
    .IF_sram2_addr         (io_sram2_addr ), 
    .IF_sram2_cen          (io_sram2_cen  ), 
    .IF_sram2_wen          (io_sram2_wen  ), 
    .IF_sram2_wmask        (io_sram2_wmask), 
    .IF_sram2_wdata        (io_sram2_wdata), 
        
    .IF_sram3_addr         (io_sram3_addr ), 
    .IF_sram3_cen          (io_sram3_cen  ), 
    .IF_sram3_wen          (io_sram3_wen  ), 
    .IF_sram3_wmask        (io_sram3_wmask), 
    .IF_sram3_wdata        (io_sram3_wdata)
);

ysyx_041461_IF2_reg IF2_reg(

    .clk                  (clock),
    .rst                  (rst_sync),
    .IF2reg_enable        (IF2_ready),

    .IF2reg_pc_in         (IFreg_pc),
    .IF2reg_AXI_rdata_in  (IF_AXI_rdata),
    .IF2reg_hit1_in       (IF_hit1),
    .IF2reg_hit2_in       (IF_hit2),
    .IF2reg_hit3_in       (IF_hit3),
    .IF2reg_hit4_in       (IF_hit4),
    .IF2reg_hit5_in       (IF_hit5),
    .IF2reg_hit6_in       (IF_hit6),
    .IF2reg_hit7_in       (IF_hit7),
    .IF2reg_hit8_in       (IF_hit8),
    .IF2reg_valid_in      (IF_valid_out),
    .IF2reg_trap_in       (IF_trap_out),

    .IF2reg_pc_out        (IF2reg_pc_out  ),
    .IF2reg_AXI_rdata_out (IF2reg_AXI_rdata_out),
    .IF2reg_hit1_out      (IF2reg_hit1_out),
    .IF2reg_hit2_out      (IF2reg_hit2_out),
    .IF2reg_hit3_out      (IF2reg_hit3_out),
    .IF2reg_hit4_out      (IF2reg_hit4_out),
    .IF2reg_hit5_out      (IF2reg_hit5_out),
    .IF2reg_hit6_out      (IF2reg_hit6_out),
    .IF2reg_hit7_out      (IF2reg_hit7_out),
    .IF2reg_hit8_out      (IF2reg_hit8_out),
    .IF2reg_valid_out     (IF2reg_valid_out),
    .IF2reg_trap_out      (IF2reg_trap_out)
);

ysyx_041461_IF2 IF2(

    .clk             (clock),
    .rst             (rst_sync),

    .IF2_pc          (IF2reg_pc_out),
    .IF2_hit1        (IF2reg_hit1_out),
    .IF2_hit2        (IF2reg_hit2_out),
    .IF2_hit3        (IF2reg_hit3_out),
    .IF2_hit4        (IF2reg_hit4_out),
    .IF2_hit5        (IF2reg_hit5_out),
    .IF2_hit6        (IF2reg_hit6_out),
    .IF2_hit7        (IF2reg_hit7_out),
    .IF2_hit8        (IF2reg_hit8_out),
    .IF2_valid_in    (IF2reg_valid_out),
    .IF2_trap_in     (IF2reg_trap_out),
    .IF2_ID_TYPE     (ID_TYPE),
    .IF2_ID_ready    (ID_ready),
    .IF2_CD_trap     (CD_IF2_trap),
    
    .IF2_valid_out   (IF2_valid_out),
    .IF2_trap_out    (IF2_trap_out ),
    .IF2_ready       (IF2_ready    ),
    .IF2_inst        (IF2_inst     ),
   
    .IF2_sram0_rdata (io_sram0_rdata),
    .IF2_sram1_rdata (io_sram1_rdata),
    .IF2_sram2_rdata (io_sram2_rdata),
    .IF2_sram3_rdata (io_sram3_rdata),
    .IF2_AXI_rdata   (IF2reg_AXI_rdata_out)
);

ysyx_041461_ID_reg ID_reg(

    .clk                          (clock          ),
    .rst                          (rst_sync       ),
    .IDreg_enable                 (ID_ready       ),
        
    .IDreg_valid_in               (IF2_valid_out   ),
    .IDreg_trap_in                (IF2_trap_out    ),
    .IDreg_inst_in                (IF2_inst        ),
    .IDreg_pc_in                  (IF2reg_pc_out   ),

    .IDreg_valid_out              (IDreg_valid_out),  
    .IDreg_trap_out               (IDreg_trap_out ),
    .IDreg_inst_out               (IDreg_inst_out ),   
    .IDreg_pc_out                 (IDreg_pc_out   )
);

ysyx_041461_ID ID( 
    
    .ID_inst               (IDreg_inst_out ),
    .ID_valid_in           (IDreg_valid_out),
    .ID_pc                 (IDreg_pc_out   ),
    .ID_rs1_data           (WB_ID_rs1_data ),
    .ID_rs2_data           (WB_ID_rs2_data ),
    .ID_trap_in            (IDreg_trap_out),
    .ID_conflict           (CD_ID_conflict ),
    .ID_IF_ok              (IF_ok    ),
    .ID_EXE_ready          (EXE_ready),
    .ID_EXE_valid          (EXEreg_valid_out),
    .ID_MEM_valid          (MEMreg_valid_out),
    .ID_CD_trap            (CD_ID_trap ),

    .ID_rd                 (ID_rd          ),
    .ID_rs1                (ID_rs1         ),
    .ID_rs2                (ID_rs2         ),
    .ID_csr                (ID_csr         ),
    .ID_imm                (ID_imm         ),
    .ID_zimm               (ID_zimm        ),
    .ID_next_pc            (ID_next_pc     ),
    .ID_valid_out          (ID_valid_out   ),
    .ID_IFreg_ctrl         (ID_IFreg_ctrl  ),
    .ID_TYPE               (ID_TYPE        ),
    .ID_EXE_ctrl           (ID_EXE_ctrl    ),
    .ID_EXE_src            (ID_EXE_src     ),
    .ID_MEM_ctrl           (ID_MEM_ctrl    ),   
    .ID_WB_ctrl            (ID_WB_ctrl     ),
    .ID_trap_out           (ID_trap_out    ),
    .ID_ready              (ID_ready       )
);  


ysyx_041461_EXE_reg EXE_reg(

    .clk                           (clock              ),
    .rst                           (rst_sync           ),
    .EXEreg_enable                 (EXE_ready          ),
      
    .EXEreg_valid_in               (ID_valid_out       ),

    .EXEreg_trap_in                (ID_trap_out        ),
    .EXEreg_rd_in                  (ID_rd              ),
    .EXEreg_rs1_in                 (ID_rs1             ),
    .EXEreg_rs2_in                 (ID_rs2             ),
    .EXEreg_csr_in                 (ID_csr             ),
    .EXEreg_imm_in                 (ID_imm             ),
    .EXEreg_zimm_in                (ID_zimm            ),
    .EXEreg_pc_in                  (IDreg_pc_out       ),
    .EXEreg_EXE_ctrl_in            (ID_EXE_ctrl        ),
    .EXEreg_EXE_src_in             (ID_EXE_src         ),
    .EXEreg_MEM_ctrl_in            (ID_MEM_ctrl        ),
    .EXEreg_WB_ctrl_in             (ID_WB_ctrl         ),
    .EXEreg_inst_in                (IDreg_inst_out     ),
    
    .EXEreg_valid_out              (EXEreg_valid_out   ),
    .EXEreg_trap_out               (EXEreg_trap_out    ),
    .EXEreg_rd_out                 (EXEreg_rd_out      ),
    .EXEreg_rs1_out                (EXEreg_rs1_out     ),
    .EXEreg_rs2_out                (EXEreg_rs2_out     ),
    .EXEreg_csr_out                (EXEreg_csr_out     ),
    .EXEreg_imm_out                (EXEreg_imm_out     ),
    .EXEreg_zimm_out               (EXEreg_zimm_out    ),
    .EXEreg_pc_out                 (EXEreg_pc_out      ),
    .EXEreg_EXE_ctrl_out           (EXEreg_EXE_ctrl_out),
    .EXEreg_EXE_src_out            (EXEreg_EXE_src_out ),
    .EXEreg_MEM_ctrl_out           (EXEreg_MEM_ctrl_out),
    .EXEreg_WB_ctrl_out            (EXEreg_WB_ctrl_out ),
    .EXEreg_inst_out               (EXEreg_inst_out    )
);

ysyx_041461_EXE EXE(

    .clk           (clock              ),
    .rst           (rst_sync           ),

    .EXE_valid_in  (EXEreg_valid_out   ),
    .EXE_trap_in   (EXEreg_trap_out    ),
    .EXE_rs1_data  (WB_EXE_rs1_data    ),
    .EXE_rs2_data  (WB_EXE_rs2_data    ),
    .EXE_csr_data  (WB_EXE_csr_data    ),
    .EXE_imm       (EXEreg_imm_out     ),
    .EXE_zimm      (EXEreg_zimm_out    ),
    .EXE_pc        (EXEreg_pc_out      ),
    .EXE_ctrl      (EXEreg_EXE_ctrl_out),
    .EXE_src       (EXEreg_EXE_src_out ),
    .EXE_conflict  (CD_EXE_conflict    ),
    .EXE_MEM_ready (MEM_ready          ),
    .EXE_CD_trap   (CD_EXE_trap        ),

    .EXE_out       (EXE_out            ),
    .EXE_valid_out (EXE_valid_out      ),
    .EXE_ready     (EXE_ready          ),
    .EXE_ok        (EXE_ok             )
);

ysyx_041461_MEM_reg MEM_reg(

    .clk                           (clock              ),
    .rst                           (rst_sync           ),
    .MEMreg_enable                 (MEM_ready          ),
        
    .MEMreg_valid_in               (EXE_valid_out      ),
    .MEMreg_trap_in                (EXEreg_trap_out    ),
    .MEMreg_EXE_in                 (EXE_out            ),
    .MEMreg_rd_in                  (EXEreg_rd_out      ),
    .MEMreg_rs1_in                 (EXEreg_rs1_out     ),
    .MEMreg_rs2_in                 (EXEreg_rs2_out     ),
    .MEMreg_csr_in                 (EXEreg_csr_out     ),
    .MEMreg_imm_in                 (EXEreg_imm_out     ),
    .MEMreg_zimm_in                (EXEreg_zimm_out    ),
    .MEMreg_pc_in                  (EXEreg_pc_out      ),
    .MEMreg_MEM_ctrl_in            (EXEreg_MEM_ctrl_out),
    .MEMreg_WB_ctrl_in             (EXEreg_WB_ctrl_out ),
    .MEMreg_inst_in                (EXEreg_inst_out    ),
  
    .MEMreg_valid_out              (MEMreg_valid_out   ),
    .MEMreg_trap_out               (MEMreg_trap_out    ), 
    .MEMreg_EXE_out                (MEMreg_EXE_out     ),
    .MEMreg_rd_out                 (MEMreg_rd_out      ),
    .MEMreg_rs1_out                (MEMreg_rs1_out     ),
    .MEMreg_rs2_out                (MEMreg_rs2_out     ),
    .MEMreg_csr_out                (MEMreg_csr_out     ),
    .MEMreg_imm_out                (MEMreg_imm_out     ),
    .MEMreg_zimm_out               (MEMreg_zimm_out    ),
    .MEMreg_pc_out                 (MEMreg_pc_out      ),
    .MEMreg_MEM_ctrl_out           (MEMreg_MEM_ctrl_out),
    .MEMreg_WB_ctrl_out            (MEMreg_WB_ctrl_out ),
    .MEMreg_inst_out               (MEMreg_inst_out    )
);

ysyx_041461_MEM MEM(

    .clk                    (clock                   ),
    .rst                    (rst_sync                ),

    .MEM_valid_in           (MEMreg_valid_out        ),
    .MEM_EXE_in             (MEMreg_EXE_out          ),
    .MEM_rs2_data           (WB_MEM_rs2_data         ),
    .MEM_ctrl               (MEMreg_MEM_ctrl_out     ),  
    .MEM_trap_in            (MEMreg_trap_out         ), 
    .MEM_WB_ready           (WB_ready                ),
    .MEM_CD_trap            (CD_MEM_trap             ),
    .MEM_conflict           (CD_MEM_conflict         ),

    .MEM_valid_out          (MEM_valid_out           ),
    .MEM_ready              (MEM_ready               ),
    .MEM_out                (MEM_out                 ),
    .MEM_trap_out           (MEM_trap_out            ),
    .MEM_ok                 (MEM_ok                  ),

    .MEM_awready            (ARBITER_MEM_awready),
    .MEM_awvalid            (MEM_awvalid             ),
    .MEM_awaddr             (MEM_awaddr              ),
    .MEM_awid               (MEM_awid                ),
    .MEM_awlen              (MEM_awlen               ),
    .MEM_awsize             (MEM_awsize              ),
    .MEM_awburst            (MEM_awburst             ),
        
    .MEM_wready             (ARBITER_MEM_wready ),
    .MEM_wvalid             (MEM_wvalid              ),
    .MEM_wdata              (MEM_wdata               ),
    .MEM_wstrb              (MEM_wstrb               ),
    .MEM_wlast              (MEM_wlast               ),
        
    .MEM_bready             (MEM_bready              ),
    .MEM_bvalid             (ARBITER_MEM_bvalid ),
    .MEM_bresp              (ARBITER_MEM_bresp  ),
    .MEM_bid                (ARBITER_MEM_bid    ),
        
    .MEM_arready            (ARBITER_MEM_arready),
    .MEM_arvalid            (MEM_arvalid             ),
    .MEM_araddr             (MEM_araddr              ),
    .MEM_arid               (MEM_arid                ),
    .MEM_arlen              (MEM_arlen               ),
    .MEM_arsize             (MEM_arsize              ),
    .MEM_arburst            (MEM_arburst             ),
        
    .MEM_rready             (MEM_rready),
    .MEM_rvalid             (ARBITER_MEM_rvalid ),
    .MEM_rresp              (ARBITER_MEM_rresp  ),
    .MEM_rdata              (ARBITER_MEM_rdata  ),
    .MEM_rlast              (ARBITER_MEM_rlast  ),
    .MEM_rid                (ARBITER_MEM_rid    ),
        
    .MEM_sram4_addr         (io_sram4_addr           ), 
    .MEM_sram4_cen          (io_sram4_cen            ), 
    .MEM_sram4_wen          (io_sram4_wen            ), 
    .MEM_sram4_wmask        (io_sram4_wmask          ), 
    .MEM_sram4_wdata        (io_sram4_wdata          ), 
    .MEM_sram4_rdata        (io_sram4_rdata          ),
        
    .MEM_sram5_addr         (io_sram5_addr           ), 
    .MEM_sram5_cen          (io_sram5_cen            ), 
    .MEM_sram5_wen          (io_sram5_wen            ), 
    .MEM_sram5_wmask        (io_sram5_wmask          ), 
    .MEM_sram5_wdata        (io_sram5_wdata          ), 
    .MEM_sram5_rdata        (io_sram5_rdata          ),
        
    .MEM_sram6_addr         (io_sram6_addr           ), 
    .MEM_sram6_cen          (io_sram6_cen            ), 
    .MEM_sram6_wen          (io_sram6_wen            ), 
    .MEM_sram6_wmask        (io_sram6_wmask          ), 
    .MEM_sram6_wdata        (io_sram6_wdata          ), 
    .MEM_sram6_rdata        (io_sram6_rdata          ),
        
    .MEM_sram7_addr         (io_sram7_addr           ), 
    .MEM_sram7_cen          (io_sram7_cen            ), 
    .MEM_sram7_wen          (io_sram7_wen            ), 
    .MEM_sram7_wmask        (io_sram7_wmask          ), 
    .MEM_sram7_wdata        (io_sram7_wdata          ), 
    .MEM_sram7_rdata        (io_sram7_rdata          )
);

ysyx_041461_WB_reg WB_reg(

    .clk                           (clock             ),
    .rst                           (rst_sync          ),
    .WBreg_enable                  (WB_ready          ),
           
    .WBreg_valid_in                (MEM_valid_out     ),
    .WBreg_trap_in                 (MEM_trap_out      ),
    .WBreg_EXE_in                  (MEMreg_EXE_out    ),
    .WBreg_MEM_in                  (MEM_out           ),
    .WBreg_rd_in                   (MEMreg_rd_out     ),
    .WBreg_rs1_in                  (MEMreg_rs1_out    ),
    .WBreg_csr_in                  (MEMreg_csr_out    ),
    .WBreg_imm_in                  (MEMreg_imm_out    ),
    .WBreg_zimm_in                 (MEMreg_zimm_out   ),
    .WBreg_pc_in                   (MEMreg_pc_out     ),
    .WBreg_WB_ctrl_in              (MEMreg_WB_ctrl_out),
    .WBreg_inst_in                 (MEMreg_inst_out   ),
  
    .WBreg_valid_out               (WBreg_valid_out   ), 
    .WBreg_trap_out                (WBreg_trap_out    ),
    .WBreg_EXE_out                 (WBreg_EXE_out     ),
    .WBreg_MEM_out                 (WBreg_MEM_out     ),
    .WBreg_rd_out                  (WBreg_rd_out      ),
    .WBreg_rs1_out                 (WBreg_rs1_out     ),
    .WBreg_csr_out                 (WBreg_csr_out     ),
    .WBreg_imm_out                 (WBreg_imm_out     ),
    .WBreg_zimm_out                (WBreg_zimm_out    ),
    .WBreg_pc_out                  (WBreg_pc_out      ),
    .WBreg_WB_ctrl_out             (WBreg_WB_ctrl_out ),
    .WBreg_inst_out                (WBreg_inst_out    )
);


ysyx_041461_WB WB(

    .clk                   (clock            ),
    .rst                   (rst_sync         ),
    .WB_valid              (WBreg_valid_out  ),

    .WB_IF_ok              (IF_ok            ),
    .WB_EXE_ok             (EXE_ok           ),
    .WB_MEM_ok             (MEM_ok           ),
            
    .WB_ID_rs1             (ID_rs1           ),
    .WB_ID_rs2             (ID_rs2           ),
            
    .WB_EXE_rs1            (EXEreg_rs1_out   ),
    .WB_EXE_rs2            (EXEreg_rs2_out   ),
    .WB_EXE_csr            (EXEreg_csr_out   ),
            
    .WB_MEM_rs2            (MEMreg_rs2_out   ),

    .WB_inst               (WBreg_inst_out   ),
            
    .WB_EXE_in             (WBreg_EXE_out    ),
    .WB_MEM_in             (WBreg_MEM_out    ),
    .WB_rd                 (WBreg_rd_out     ),
    .WB_rs1                (WBreg_rs1_out    ),
    .WB_csr                (WBreg_csr_out    ),
    .WB_imm                (WBreg_imm_out    ),
    .WB_zimm               (WBreg_zimm_out   ),
    .WB_pc                 (WBreg_pc_out     ),
    .WB_ctrl               (WBreg_WB_ctrl_out),
    .WB_trap               (WBreg_trap_out   ),
    .WB_interrupt          (time_interrupt   ),

    .WB_ready              (WB_ready         ),

    .WB_IFreg_mtvec        (WB_IFreg_mtvec   ),
    .WB_IFreg_mepc         (WB_IFreg_mepc    ),
    .WB_IFreg_CAUSE        (WB_IFreg_CAUSE   ),
    .WB_IFreg_ctrl         (WB_IFreg_ctrl    ),

    .WB_IF_mstatus         (WB_IF_mstatus    ),
    .WB_IF_mie             (WB_IF_mie        ),
    .WB_IF_mip             (WB_IF_mip        ),

    .WB_ID_rs1_data        (WB_ID_rs1_data   ),
    .WB_ID_rs2_data        (WB_ID_rs2_data   ),

    .WB_EXE_rs1_data       (WB_EXE_rs1_data  ),
    .WB_EXE_rs2_data       (WB_EXE_rs2_data  ),
    .WB_EXE_csr_data       (WB_EXE_csr_data  ),

    .WB_MEM_rs2_data       (WB_MEM_rs2_data  )
);



ysyx_041461_CD CD(  
   
    .CD_IF2_valid_in           (IF2reg_valid_out  ),
    .CD_IF2_trap_in            (IF2reg_trap_out   ),

    .CD_ID_valid_in            (IDreg_valid_out    ),
    .CD_ID_TYPE                (ID_TYPE            ),
    .CD_ID_rs1                 (ID_rs1             ),
    .CD_ID_rs2                 (ID_rs2             ),
    .CD_ID_trap_in             (IDreg_trap_out     ),
   
    .CD_EXE_valid_in           (EXEreg_valid_out   ),
    .CD_EXE_ctrl               (EXEreg_EXE_ctrl_out),
    .CD_EXE_src                (EXEreg_EXE_src_out ),
    .CD_EXE_WB_ctrl            (EXEreg_WB_ctrl_out ),
    .CD_EXE_rd                 (EXEreg_rd_out      ),
    .CD_EXE_rs1                (EXEreg_rs1_out     ),
    .CD_EXE_rs2                (EXEreg_rs2_out     ),
    .CD_EXE_csr                (EXEreg_csr_out     ),
    .CD_EXE_trap_in            (EXEreg_trap_out    ),

    .CD_MEM_valid_in           (MEMreg_valid_out   ),
    .CD_MEM_ctrl               (MEMreg_MEM_ctrl_out),   
    .CD_MEM_WB_ctrl            (MEMreg_WB_ctrl_out ),
    .CD_MEM_rd                 (MEMreg_rd_out      ),
    .CD_MEM_rs2                (MEMreg_rs2_out     ),
    .CD_MEM_csr                (MEMreg_csr_out     ),
    .CD_MEM_trap_in            (MEMreg_trap_out    ),
    
    .CD_WB_valid_in            (WBreg_valid_out    ),
    .CD_WB_ctrl                (WBreg_WB_ctrl_out  ),
    .CD_WB_rd                  (WBreg_rd_out       ),
    .CD_WB_csr                 (WBreg_csr_out      ),
    .CD_WB_trap_in             (WBreg_trap_out     ),

    .CD_IF_trap                (CD_IF_trap         ),
    .CD_IF2_trap               (CD_IF2_trap        ),
    .CD_ID_conflict            (CD_ID_conflict     ),
    .CD_ID_trap                (CD_ID_trap         ),
    .CD_EXE_conflict           (CD_EXE_conflict    ),
    .CD_EXE_trap               (CD_EXE_trap        ),
    .CD_MEM_conflict           (CD_MEM_conflict    ),
    .CD_MEM_trap               (CD_MEM_trap        )
);

ysyx_041461_CLINT CLINT(

    .clk            (clock),
    .rst            (rst_sync),
    .time_interrupt (time_interrupt),

    .CLINT_awready (CLINT_awready),
    .CLINT_awvalid (ARBITER_CLINT_awvalid),
    .CLINT_awid    (ARBITER_CLINT_awid   ),
    .CLINT_awaddr  (ARBITER_CLINT_awaddr ),
    .CLINT_awlen   (ARBITER_CLINT_awlen  ),
    .CLINT_awsize  (ARBITER_CLINT_awsize ),
    .CLINT_awburst (ARBITER_CLINT_awburst),

    .CLINT_wready  (CLINT_wready),
    .CLINT_wvalid  (ARBITER_CLINT_wvalid),
    .CLINT_wdata   (ARBITER_CLINT_wdata ),
    .CLINT_wstrb   (ARBITER_CLINT_wstrb ),
    .CLINT_wlast   (ARBITER_CLINT_wlast ),

    .CLINT_bready  (ARBITER_CLINT_bready),
    .CLINT_bvalid  (CLINT_bvalid),
    .CLINT_bid     (CLINT_bid   ),
    .CLINT_bresp   (CLINT_bresp ),

    .CLINT_arready (CLINT_arready),
    .CLINT_arvalid (ARBITER_CLINT_arvalid),
    .CLINT_arid    (ARBITER_CLINT_arid   ),
    .CLINT_araddr  (ARBITER_CLINT_araddr ),
    .CLINT_arlen   (ARBITER_CLINT_arlen  ),
    .CLINT_arsize  (ARBITER_CLINT_arsize ),
    .CLINT_arburst (ARBITER_CLINT_arburst),

    .CLINT_rready  (ARBITER_CLINT_rready),
    .CLINT_rvalid  (CLINT_rvalid),
    .CLINT_rid     (CLINT_rid   ),
    .CLINT_rresp   (CLINT_rresp ),
    .CLINT_rdata   (CLINT_rdata ),
    .CLINT_rlast   (CLINT_rlast )

);

ysyx_041461_ARBITER ARBITER(

    .clk                      (clock),
    .rst                      (rst_sync),

    .ARBITER_IF_arvalid  (IF_arvalid),
    .ARBITER_IF_araddr   (IF_araddr ),
    .ARBITER_IF_arid     (IF_arid   ),
    .ARBITER_IF_arlen    (IF_arlen  ),
    .ARBITER_IF_arsize   (IF_arsize ),
    .ARBITER_IF_arburst  (IF_arburst),
    .ARBITER_IF_arready  (ARBITER_IF_arready),

    .ARBITER_IF_rready   (IF_rready),
    .ARBITER_IF_rvalid   (ARBITER_IF_rvalid),
    .ARBITER_IF_rresp    (ARBITER_IF_rresp ),
    .ARBITER_IF_rdata    (ARBITER_IF_rdata ),
    .ARBITER_IF_rlast    (ARBITER_IF_rlast ),
    .ARBITER_IF_rid      (ARBITER_IF_rid   ),

    .ARBITER_MEM_arvalid (MEM_arvalid),
    .ARBITER_MEM_araddr  (MEM_araddr ),
    .ARBITER_MEM_arid    (MEM_arid   ),
    .ARBITER_MEM_arlen   (MEM_arlen  ),
    .ARBITER_MEM_arsize  (MEM_arsize ),
    .ARBITER_MEM_arburst (MEM_arburst),
    .ARBITER_MEM_arready (ARBITER_MEM_arready),

    .ARBITER_MEM_rready  (MEM_rready),
    .ARBITER_MEM_rvalid  (ARBITER_MEM_rvalid),
    .ARBITER_MEM_rresp   (ARBITER_MEM_rresp ),
    .ARBITER_MEM_rdata   (ARBITER_MEM_rdata ),
    .ARBITER_MEM_rlast   (ARBITER_MEM_rlast ),
    .ARBITER_MEM_rid     (ARBITER_MEM_rid   ),

    .ARBITER_MEM_awready (ARBITER_MEM_awready),
    .ARBITER_MEM_awvalid (MEM_awvalid),
    .ARBITER_MEM_awaddr  (MEM_awaddr ),
    .ARBITER_MEM_awid    (MEM_awid   ),
    .ARBITER_MEM_awlen   (MEM_awlen  ),
    .ARBITER_MEM_awsize  (MEM_awsize ),
    .ARBITER_MEM_awburst (MEM_awburst),

    .ARBITER_MEM_wready  (ARBITER_MEM_wready),
    .ARBITER_MEM_wvalid  (MEM_wvalid),
    .ARBITER_MEM_wdata   (MEM_wdata ),
    .ARBITER_MEM_wstrb   (MEM_wstrb ),
    .ARBITER_MEM_wlast   (MEM_wlast ),

    .ARBITER_MEM_bready  (MEM_bready),
    .ARBITER_MEM_bvalid  (ARBITER_MEM_bvalid),
    .ARBITER_MEM_bresp   (ARBITER_MEM_bresp ),
    .ARBITER_MEM_bid     (ARBITER_MEM_bid   ),

    .ARBITER_CLINT_awready (CLINT_awready),
    .ARBITER_CLINT_awvalid (ARBITER_CLINT_awvalid),
    .ARBITER_CLINT_awid    (ARBITER_CLINT_awid   ),
    .ARBITER_CLINT_awaddr  (ARBITER_CLINT_awaddr ),
    .ARBITER_CLINT_awlen   (ARBITER_CLINT_awlen  ),
    .ARBITER_CLINT_awsize  (ARBITER_CLINT_awsize ),
    .ARBITER_CLINT_awburst (ARBITER_CLINT_awburst),

    .ARBITER_CLINT_wready  (CLINT_wready),
    .ARBITER_CLINT_wvalid  (ARBITER_CLINT_wvalid),
    .ARBITER_CLINT_wdata   (ARBITER_CLINT_wdata ),
    .ARBITER_CLINT_wstrb   (ARBITER_CLINT_wstrb ),
    .ARBITER_CLINT_wlast   (ARBITER_CLINT_wlast ),

    .ARBITER_CLINT_bready  (ARBITER_CLINT_bready),
    .ARBITER_CLINT_bvalid  (CLINT_bvalid),
    .ARBITER_CLINT_bid     (CLINT_bid   ),
    .ARBITER_CLINT_bresp   (CLINT_bresp ),

    .ARBITER_CLINT_arready (CLINT_arready),
    .ARBITER_CLINT_arvalid (ARBITER_CLINT_arvalid),
    .ARBITER_CLINT_arid    (ARBITER_CLINT_arid   ),
    .ARBITER_CLINT_araddr  (ARBITER_CLINT_araddr ),
    .ARBITER_CLINT_arlen   (ARBITER_CLINT_arlen  ),
    .ARBITER_CLINT_arsize  (ARBITER_CLINT_arsize ),
    .ARBITER_CLINT_arburst (ARBITER_CLINT_arburst),

    .ARBITER_CLINT_rready  (ARBITER_CLINT_rready),
    .ARBITER_CLINT_rvalid  (CLINT_rvalid),
    .ARBITER_CLINT_rid     (CLINT_rid   ),
    .ARBITER_CLINT_rresp   (CLINT_rresp ),
    .ARBITER_CLINT_rdata   (CLINT_rdata ),
    .ARBITER_CLINT_rlast   (CLINT_rlast ),

    .ARBITER_io_awready  (io_master_awready),
    .ARBITER_io_awvalid  (io_master_awvalid),
    .ARBITER_io_awid     (io_master_awid   ),
    .ARBITER_io_awaddr   (io_master_awaddr ),
    .ARBITER_io_awlen    (io_master_awlen  ),
    .ARBITER_io_awsize   (io_master_awsize ),
    .ARBITER_io_awburst  (io_master_awburst),

    .ARBITER_io_wready   (io_master_wready ),
    .ARBITER_io_wvalid   (io_master_wvalid ),
    .ARBITER_io_wdata    (io_master_wdata  ),
    .ARBITER_io_wstrb    (io_master_wstrb  ),
    .ARBITER_io_wlast    (io_master_wlast  ),

    .ARBITER_io_bready   (io_master_bready ),
    .ARBITER_io_bvalid   (io_master_bvalid ),
    .ARBITER_io_bid      (io_master_bid    ),
    .ARBITER_io_bresp    (io_master_bresp  ),

    .ARBITER_io_arready   (io_master_arready),
    .ARBITER_io_arvalid   (io_master_arvalid),
    .ARBITER_io_araddr    (io_master_araddr ),
    .ARBITER_io_arid      (io_master_arid   ),
    .ARBITER_io_arlen     (io_master_arlen  ),
    .ARBITER_io_arsize    (io_master_arsize ),
    .ARBITER_io_arburst   (io_master_arburst),

    .ARBITER_io_rready    (io_master_rready),
    .ARBITER_io_rvalid    (io_master_rvalid),
    .ARBITER_io_rresp     (io_master_rresp ),
    .ARBITER_io_rdata     (io_master_rdata ),
    .ARBITER_io_rlast     (io_master_rlast ),
    .ARBITER_io_rid       (io_master_rid   )
);


endmodule
