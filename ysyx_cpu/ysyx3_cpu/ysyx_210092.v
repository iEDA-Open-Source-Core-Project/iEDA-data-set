`ifndef YSYX210092___DEFINES_V
`define YSYX210092___DEFINES_V
/* debug marco */
//`define YSYX210092_DEFINE_PUTCH
//`define YSYX210092_DEFINE_DIFFTEST

/* if marco */
`define YSYX210092_INST_ADDR_BUS           63:0
`define YSYX210092_INST_BUS                31:0   
`define YSYX210092_INST_ADDR_SIZE          64
`define YSYX210092_INST_SIZE               32
`define YSYX210092_PC_START                64'h00000000_30000000  
`define YSYX210092_INST_NOP                32'h0000_0033
/* regfile marco */
`define YSYX210092_REG_INDEX_BUS           4:0  
`define YSYX210092_REG_INDEX_SIZE          5
`define YSYX210092_REG_NUM                 (1<<`YSYX210092_REG_INDEX_SIZE)
`define YSYX210092_REG_BUS                 63:0
`define YSYX210092_REG_BUS_SIZE            64
`define YSYX210092_REG_ZERO                64'b0

/* id marco */

//opcode and funct
`define YSYX210092_OPCODE_LOC_BUS          6:0
`define YSYX210092_EFF_OPCODE_LOC_BUS      6:2
`define YSYX210092_EFF_OPCODE_BUS          4:0
`define YSYX210092_FUNCT3_LOC_BUS          14:12
`define YSYX210092_FUNCT7_LOC_BUS          31:25
`define YSYX210092_OPCODE_BUS              6:0
`define YSYX210092_FUNCT3_BUS              2:0
`define YSYX210092_FUNCT7_BUS              6:0
`define YSYX210092_CSR_LOC_BUS             31:20

`define YSYX210092_EFF_OPCODE_LUI          5'b01101
`define YSYX210092_EFF_OPCODE_AUIPC        5'b00101
`define YSYX210092_EFF_OPCODE_JAL          5'b11011
`define YSYX210092_EFF_OPCODE_JALR         5'b11001
`define YSYX210092_EFF_OPCODE_BRANCH       5'b11000
`define YSYX210092_EFF_OPCODE_LOAD         5'b00000
`define YSYX210092_EFF_OPCODE_STORE        5'b01000
`define YSYX210092_EFF_OPCODE_ALI          5'b00100
`define YSYX210092_EFF_OPCODE_ALIW         5'b00110
`define YSYX210092_EFF_OPCODE_AL           5'b01100
`define YSYX210092_EFF_OPCODE_ALW          5'b01110
`define YSYX210092_EFF_OPCODE_CSR          5'b11100

//register
`define YSYX210092_RD_LOC_BUS              11:7
`define YSYX210092_RS1_LOC_BUS             19:15
`define YSYX210092_RS2_LOC_BUS             24:20

//immediate
`define YSYX210092_GEN_TYPE_BUS            2:0
`define YSYX210092_IMM_PRE_BUS             31:0
`define YSYX210092_INST_31                 31:31
`define YSYX210092_INST_31_12              31:12
`define YSYX210092_INST_31_20              31:20
`define YSYX210092_INST_31_25              31:25
`define YSYX210092_INST_30_21              30:21
`define YSYX210092_INST_30_25              30:25
`define YSYX210092_INST_20                 20:20
`define YSYX210092_INST_19_7               19:7
`define YSYX210092_INST_19_12              19:12
`define YSYX210092_INST_19_15              19:15
`define YSYX210092_INST_11_7               11:7
`define YSYX210092_INST_11_8               11:8
`define YSYX210092_INST_7                  7:7
         
//alu control
`define YSYX210092_ALU_OP_BUS              2:0
`define YSYX210092_ALU_OP_SIZE             3

//compare
`define YSYX210092_COMP_TYPE_BUS           2:0
`define YSYX210092_COMP_TYPE_SIZE          3

//shift
`define YSYX210092_SHIFT_TYPE_BUS          2:0
`define YSYX210092_SHIFT_TYPE_SIZE         3
`define YSYX210092_IMM_SHIFT_BUS           5:0
`define YSYX210092_IMM_SHIFT_SIZE          6
`define YSYX210092_INST_25_20              25:20
  
//store
`define YSYX210092_STORE_TYPE_BUS          2:0
`define YSYX210092_STORE_TYPE_SIZE         3

//load
`define YSYX210092_LOAD_TYPE_BUS           2:0
`define YSYX210092_LOAD_TYPE_SIZE          3

/* ex marco */
`define YSYX210092_DATA_EXTEND_BUS         64:0
`define YSYX210092_DATA_EXTEND_SIZE        65
`define YSYX210092_DATA_BUS                63:0
`define YSYX210092_DATA_BUS_SIZE           64
`define YSYX210092_ALU_SRC_IMM             1
`define YSYX210092_ALU_SRC_RS2             0

/* memory acess marco */
`define YSYX210092_DATA_ADDR_BUS           63:0
`define YSYX210092_ADDR_LOW_BUS            2:0

/* csr marco */
`define YSYX210092_CSR_INDEX_BUS           11:0
`define YSYX210092_CSR_INDEX_SIZE          12
`define YSYX210092_CSR_CTRL_BUS            2:0

`define YSYX210092_CSR_MCYCLE_INDEX        12'hB00
`define YSYX210092_CSR_MISA_INDEX          12'h301
`define YSYX210092_CSR_MVENDORID_INDEX     12'hf11
`define YSYX210092_CSR_MARCHID_INDEX       12'hf12
`define YSYX210092_CSR_MIMPID_INDEX        12'hf13
`define YSYX210092_CSR_MHARTID_INDEX       12'hf14
`define YSYX210092_CSR_MSTATUS_INDEX       12'h300
`define YSYX210092_CSR_MTVEC_INDEX         12'h305
`define YSYX210092_CSR_MEPC_INDEX          12'h341
`define YSYX210092_CSR_MCAUSE_INDEX        12'h342
`define YSYX210092_CSR_MIP_INDEX           12'h344
`define YSYX210092_CSR_MIE_INDEX           12'h304
`define YSYX210092_CSR_MSCRATCH_INDEX      12'h340
`define YSYX210092_CSR_MINSTRET_INDEX      12'hB02

`define YSYX210092_CLINT_BASE              64'h2000000
`define YSYX210092_MTIME_ADDR              `YSYX210092_CLINT_BASE + 64'hBFF8
`define YSYX210092_MTIMECMP_ADDR           `YSYX210092_CLINT_BASE + 64'h4000

/*  */
`define YSYX210092_ZERO_DWORD              64'h00000000_00000000   
     
`define YSYX210092_INST_ADD                8'h11

/* axi */

`define YSYX210092_AXI_ADDR_WIDTH          64
`define YSYX210092_AXI_DATA_WIDTH          64
`define YSYX210092_AXI_ID_WIDTH            4
`define YSYX210092_AXI_USER_WIDTH          1
    
`define YSYX210092_SIZE_B                  2'b00
`define YSYX210092_SIZE_H                  2'b01
`define YSYX210092_SIZE_W                  2'b10
`define YSYX210092_SIZE_D                  2'b11
    
`define YSYX210092_REQ_READ                1'b0
`define YSYX210092_REQ_WRITE               1'b1

`endif
module ysyx_210092_if_pc (
    input                       clk,
    input                       rst,

    /* control signals */
    input                       if_pc_inst_valid_i,
    input                       if_pc_dont_fetch_i,
    input                       if_pc_jumpbranch_en_i,
    input                       if_pc_trap_en_i,
    /* data_signals */
    input   [`YSYX210092_INST_ADDR_BUS]    if_pc_nxt_inst_addr_i,
    output  [`YSYX210092_INST_ADDR_BUS]    if_pc_cur_inst_addr_o
);

    reg [`YSYX210092_INST_ADDR_BUS] cur_inst_addr_r;

    always @( posedge clk ) begin
        if( rst ) begin
            cur_inst_addr_r <= `YSYX210092_PC_START;
        end
        else if( if_pc_inst_valid_i & ( ~if_pc_dont_fetch_i | if_pc_jumpbranch_en_i | if_pc_trap_en_i ) )begin
            cur_inst_addr_r <= if_pc_nxt_inst_addr_i;
        end
        else begin
            cur_inst_addr_r <= cur_inst_addr_r;
        end
    end

    assign if_pc_cur_inst_addr_o    = cur_inst_addr_r;
endmodule

module ysyx_210092_if_top (
    input                       clk,
    input                       rst,

    /* control signals */
    input                       if_top_jumpbranch_en_i,
    input                       if_top_trap_en_i,
    input                       if_top_inst_valid_i,
    input                       if_top_dont_fetch_i,

    output                      if_top_fetched_ok_o,

    /* data signals */
    input   [`YSYX210092_INST_ADDR_BUS]    if_top_jumpbranch_addr_i,
    input   [`YSYX210092_INST_ADDR_BUS]    if_top_csr_nxt_pc_i,
    
    
    /* bus interface */
    input                       if_top_if_ready_i,
    input   [`YSYX210092_DATA_BUS]         if_top_if_data_read_i,
    input   [1:0]               if_top_if_resp_i,

    output  [`YSYX210092_INST_ADDR_BUS]    if_top_inst_addr_o,
    output                      if_top_if_valid_o,
    output  [`YSYX210092_INST_ADDR_BUS]    if_top_if_addr_o,
    output  [1:0]               if_top_if_size_o,
    output  [`YSYX210092_INST_BUS]         if_top_inst_o,
    output                      if_top_if_req_o
);
    wire    [`YSYX210092_INST_ADDR_BUS]    nxt_inst_addr;
    wire                        handshake_done;

    assign nxt_inst_addr            =   if_top_trap_en_i? if_top_csr_nxt_pc_i:
                                         ( if_top_jumpbranch_en_i ? if_top_jumpbranch_addr_i : if_top_inst_addr_o + 64'd4 );    
    assign if_top_fetched_ok_o      =   handshake_done | if_top_dont_fetch_i;

    assign if_top_if_addr_o         =   if_top_inst_addr_o;
    assign if_top_if_valid_o        =   ~if_top_dont_fetch_i;
    assign if_top_if_size_o         =   `YSYX210092_SIZE_W;
    assign handshake_done           =   if_top_if_valid_o & if_top_if_ready_i;
    assign if_top_if_req_o          =   `YSYX210092_REQ_READ;
    assign if_top_inst_o            =   if_top_if_data_read_i[`YSYX210092_INST_BUS];

    ysyx_210092_if_pc my_if_pc(
        .clk( clk ),
        .rst( rst ),

        /* control signals */
        .if_pc_inst_valid_i( if_top_inst_valid_i ),
        .if_pc_dont_fetch_i( if_top_dont_fetch_i ),
        .if_pc_jumpbranch_en_i( if_top_jumpbranch_en_i ),
        .if_pc_trap_en_i( if_top_trap_en_i ),
        /* data_signals */
        .if_pc_nxt_inst_addr_i( nxt_inst_addr ),
        .if_pc_cur_inst_addr_o( if_top_inst_addr_o )
    );
endmodule

module ysyx_210092_if2id(
    input                       clk,
    input                       rst,

    /* ysyx_210092_if2id control signals */
    input                       if2id_inst_valid_i,
    input                       if2id_if_flush_i,
    input                       if2id_id_stall_i,
    /* modules controls signals */    
    output                      if2id_inst_nop_o,

    /* data signals */
    input   [`YSYX210092_INST_ADDR_BUS]    if2id_inst_addr_i,
    input   [`YSYX210092_INST_BUS]         if2id_inst_i,
    
    output  [`YSYX210092_INST_ADDR_BUS]    if2id_inst_addr_o,
    output  [`YSYX210092_INST_BUS]         if2id_inst_o
);
    /* control reg */
    reg                         inst_nop_r;

    /* data reg */
    reg     [`YSYX210092_INST_ADDR_BUS]    inst_addr_r;
    reg     [`YSYX210092_INST_BUS]         inst_r;

    wire                        flush_en;
    wire                        stall_en;
    wire                        flow_en;
    
    assign flush_en             =   if2id_if_flush_i & if2id_inst_valid_i;
    assign stall_en             =   if2id_id_stall_i & if2id_inst_valid_i;
    assign flow_en              =   if2id_inst_valid_i;
    
    assign if2id_inst_nop_o     =   inst_nop_r;
    assign if2id_inst_addr_o    =   inst_addr_r;
    assign if2id_inst_o         =   inst_r;
    
    always @( posedge clk ) begin
        if( rst | flush_en ) begin
            inst_nop_r <= 1'b1;
        end
        else if( stall_en )begin
            inst_nop_r <= inst_nop_r;
        end
        else if( flow_en )begin
            inst_nop_r <= 1'b0;
        end
        else begin
            inst_nop_r <= inst_nop_r;
        end
    end
    
    always @( posedge clk ) begin
        if( rst | flush_en ) begin
            inst_addr_r <= `YSYX210092_PC_START;    
        end
        else if( stall_en ) begin
            inst_addr_r <= inst_addr_r;
        end
        else if( flow_en ) begin
            inst_addr_r <= if2id_inst_addr_i;
        end
        else begin
            inst_addr_r <= inst_addr_r;
        end
    end

    always @( posedge clk ) begin
        if( rst | flush_en ) begin
            inst_r  <= `YSYX210092_INST_NOP;
        end
        else if( stall_en ) begin
            inst_r <= inst_r;
        end
        else if( flow_en ) begin
            inst_r <= if2id_inst_i;
        end
        else begin
            inst_r <= inst_r;
        end
    end
    
endmodule
module ysyx_210092_id_branchjudge (
    /* control signals */
    input   [`YSYX210092_COMP_TYPE_BUS]    id_branchjudge_comp_type_i,

    /* data signals */
    input   [`YSYX210092_DATA_BUS]         id_branchjudge_rs1_data_i,
    input   [`YSYX210092_DATA_BUS]         id_branchjudge_rs2_data_i,
    output                      id_branchjudge_ok_o
);
    /* rename */
    wire    [`YSYX210092_COMP_TYPE_BUS]    comp_type;
    wire    [`YSYX210092_DATA_BUS]         rs1_data;
    wire    [`YSYX210092_DATA_BUS]         rs2_data;
    wire                        branchjudge_ok;
    /* rename */

    wire    [`YSYX210092_DATA_EXTEND_BUS]  sub_op1;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  sub_op2;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  sub_res;
    
    wire                        comp_signed;
    wire                        branchjudge_eq;
    wire                        branchjudge_neq;
    wire                        branchjudge_lt;
    wire                        branchjudge_ge;
    wire                        branchjudge_eq_res;
    wire                        branchjudge_neq_res;
    wire                        branchjudge_lt_res;
    wire                        branchjudge_ge_res;
    
    /* rename */
    assign comp_type                    =   id_branchjudge_comp_type_i;
    assign rs1_data                     =   id_branchjudge_rs1_data_i;
    assign rs2_data                     =   id_branchjudge_rs2_data_i;
    assign id_branchjudge_ok_o          =   branchjudge_ok;
    /* rename */

    assign sub_op1                      =   { comp_signed & rs1_data[63], rs1_data };
    assign sub_op2                      =   { comp_signed & rs2_data[63], rs2_data };
    assign sub_res                      =   sub_op1 + ( ~sub_op2 + `YSYX210092_DATA_EXTEND_SIZE'b1 );
    
    assign comp_signed                  =   ~( comp_type[2] & comp_type[0] );
    assign branchjudge_eq               =   comp_type == 3'b010;
    assign branchjudge_neq              =   comp_type == 3'b011;
    assign branchjudge_lt               =   comp_type[2:1] == 2'b10;
    assign branchjudge_ge               =   comp_type[2:1] == 2'b11;
    
    assign branchjudge_eq_res           =   sub_res == `YSYX210092_DATA_EXTEND_SIZE'b0;
    assign branchjudge_neq_res          =   ~branchjudge_eq_res;//sub_res != `YSYX210092_DATA_EXTEND_SIZE'b0;
    assign branchjudge_ge_res           =   sub_res[64] == 1'b0;
    assign branchjudge_lt_res           =   ~branchjudge_ge_res;//sub_res[64] == 1'b1;

    assign branchjudge_ok               =   0 | branchjudge_eq & branchjudge_eq_res
                                              | branchjudge_neq & branchjudge_neq_res
                                              | branchjudge_ge & branchjudge_ge_res
                                              | branchjudge_lt & branchjudge_lt_res;
                                      
endmodule
module ysyx_210092_id_control (

    input   [`YSYX210092_INST_BUS]         id_control_inst_i,

    input   [`YSYX210092_OPCODE_BUS]       id_control_opcode_i,
    input   [`YSYX210092_FUNCT3_BUS]       id_control_funct3_i,
    input   [`YSYX210092_FUNCT7_BUS]       id_control_funct7_i,
    
    /* id */
    output                      id_control_rs1_en_o,
    output                      id_control_rs2_en_o,
    output                      id_control_rd_en_o,
    output                      id_control_jump_base_pc_o,
    output  [`YSYX210092_COMP_TYPE_BUS]    id_control_comp_type_o,
    output                      id_control_inst_jump_o,
    output                      id_control_inst_branch_o,
    output                      id_control_inst_lui_o,
    output  [`YSYX210092_GEN_TYPE_BUS]     id_control_gen_type_o,

    /* ex */
    output                      id_control_inst_word_o,
    output                      id_control_inst_slt_nu_o,
    output                      id_control_inst_slt_u_o,
    output                      id_control_inst_shift_o,
    output                      id_control_alu_src_pc_o,
    output                      id_control_alu_src_imm_o,
    output                      id_control_shift_num_src_o,
    output  [`YSYX210092_SHIFT_TYPE_BUS]   id_control_shift_type_o,
    output                      id_control_inst_arth_lgc_o,
    output                      id_control_inst_auipc_o,
    output  [`YSYX210092_ALU_OP_BUS]       id_control_alu_op_o,

    /* mem */
    output                      id_control_inst_csr_o,
    output                      id_control_inst_load_o,
    output                      id_control_mem_write_o,
    output                      id_control_mem_read_o,
    output  [`YSYX210092_STORE_TYPE_BUS]   id_control_store_type_o,
    output  [`YSYX210092_LOAD_TYPE_BUS]    id_control_load_type_o,
    output  [`YSYX210092_CSR_CTRL_BUS]     id_control_csr_ctrl_o,
    output                      id_control_inst_ecall_o,
    output                      id_control_inst_ebreak_o,
    output                      id_control_inst_mret_o,
    output                      id_control_inst_trap_o

    `ifdef YSYX210092_DEFINE_PUTCH
    ,
    output                      id_control_inst_selfdefine_o
    `endif
);
    /* rename */
    wire    [`YSYX210092_INST_BUS]         inst; 
    wire    [`YSYX210092_OPCODE_BUS]       opcode;
    wire    [`YSYX210092_FUNCT3_BUS]       funct3;
    wire    [`YSYX210092_FUNCT7_BUS]       funct7;
    // id
    wire                        rs1_en;
    wire                        rs2_en;
    wire                        rd_en;
    wire                        jump_base_pc;
    wire    [`YSYX210092_COMP_TYPE_BUS]    comp_type;
    wire                        inst_jump;
    wire                        inst_branch;
    wire                        inst_lui;
    wire    [`YSYX210092_GEN_TYPE_BUS]     gen_type;

    // ex    
    wire                        inst_word;
    wire                        inst_slt_nu;
    wire                        inst_slt_u;
    wire                        inst_shift;
    wire                        alu_src_pc;
    wire                        alu_src_imm;
    wire                        shift_num_src;
    wire    [`YSYX210092_SHIFT_TYPE_BUS]   shift_type;
    wire                        inst_arth_lgc;
    wire                        inst_auipc;
    wire    [`YSYX210092_ALU_OP_BUS]       alu_op;

    // mem   
    wire                        inst_csr;
    wire                        inst_load;
    wire                        mem_write;
    wire                        mem_read;
    wire    [`YSYX210092_STORE_TYPE_BUS]   store_type;
    wire    [`YSYX210092_LOAD_TYPE_BUS]    load_type;
    wire    [`YSYX210092_CSR_CTRL_BUS]     csr_ctrl;
    wire                        inst_ecall;
    wire                        inst_ebreak;
    wire                        inst_mret;
    wire                        inst_trap;
    
    `ifdef YSYX210092_DEFINE_PUTCH
    wire                        inst_selfdefine;
    `endif
    
    /* all instruction types */

    // wire                        inst_shift;
    // wire                        inst_lui;
    // wire                        inst_load;
    // wire                        inst_jump;    
    // wire                        inst_word;   
    // wire                        inst_branch;
    // wire                        inst_csr;
    // wire                        inst_auipc;
    // wire                        inst_slt_nu;
    // wire                        inst_slt_u;    
    // wire                        inst_trap;
    wire                            inst_store;
    wire                            inst_ali;
    wire                            inst_aliw;
    wire                            inst_al;
    wire                            inst_alw;

    wire                            inst_jal;
    wire                            inst_jalr;


    wire                            inst_mem;
    wire                            inst_alxx;
    wire                            inst_al_ni;
    wire                            inst_al_i;
    // wire                            inst_al_nw;
    // wire                            inst_al_w;
    wire                            inst_addxx;
    wire                            inst_subxx;
    wire                            inst_xorxx;
    wire                            inst_orxx;
    wire                            inst_andxx;
    wire                            inst_xuix;

    wire                            inst_csr_ni;
    // wire                            inst_csr_i;
    wire                            inst_expt;
    /* all instructions */

    // wire                            inst_lui;
    // wire                            inst_auipc;
    // wire                            inst_jal;
    // wire                            inst_jalr;
    // wire                            inst_ecall;
    // wire                            inst_ebreak;
    // wire                            inst_mret;
    wire                            inst_beq;
    wire                            inst_bne;
    wire                            inst_blt;
    wire                            inst_bltu;
    wire                            inst_bge;
    wire                            inst_bgeu;
    wire                            inst_lb;
    wire                            inst_lh;
    wire                            inst_lw;
    wire                            inst_ld;
    wire                            inst_lbu;
    wire                            inst_lhu;
    wire                            inst_lwu;
    wire                            inst_sb;
    wire                            inst_sh;
    wire                            inst_sw;
    wire                            inst_sd;
    wire                            inst_addiw;
    wire                            inst_addi;
    wire                            inst_slti;
    wire                            inst_sltiu;
    wire                            inst_xori;
    wire                            inst_ori;
    wire                            inst_andi;
    wire                            inst_slliw;
    wire                            inst_slli;
    wire                            inst_srliw;
    wire                            inst_srli;
    wire                            inst_sraiw;
    wire                            inst_srai;
    wire                            inst_addw;
    wire                            inst_add;
    wire                            inst_subw;
    wire                            inst_sub;
    wire                            inst_sllw;
    wire                            inst_sll;
    wire                            inst_slt;
    wire                            inst_sltu;
    wire                            inst_xor;
    wire                            inst_srlw;
    wire                            inst_srl;
    wire                            inst_sraw;
    wire                            inst_sra;
    wire                            inst_or;
    wire                            inst_and;
    // wire                            inst_csrrw;
    // wire                            inst_csrrs;
    // wire                            inst_csrrc;
    // wire                            inst_csrrwi;
    // wire                            inst_csrrsi;
    // wire                            inst_csrrci; //不使用，因为控制信号直接用funct3

    `ifdef YSYX210092_DEFINE_PUTCH
    assign inst_selfdefine              =   inst == 32'h7b;
    `endif

    wire [`YSYX210092_EFF_OPCODE_BUS] eff_opcode = opcode[`YSYX210092_EFF_OPCODE_LOC_BUS];

    
    /* rename assignments */
    assign inst                         =   id_control_inst_i; 
    assign opcode                       =   id_control_opcode_i;
    assign funct3                       =   id_control_funct3_i;
    assign funct7                       =   id_control_funct7_i;

    /* id */
    assign id_control_rs1_en_o          =   rs1_en;
    assign id_control_rs2_en_o          =   rs2_en;
    assign id_control_rd_en_o           =   rd_en;
    assign id_control_jump_base_pc_o    =   jump_base_pc;
    assign id_control_comp_type_o       =   comp_type;
    assign id_control_inst_jump_o       =   inst_jump;
    assign id_control_inst_branch_o     =   inst_branch;
    assign id_control_inst_lui_o        =   inst_lui;
    assign id_control_gen_type_o        =   gen_type;
    
    /* ex */
    assign id_control_inst_word_o       =   inst_word;
    assign id_control_inst_slt_nu_o     =   inst_slt_nu;
    assign id_control_inst_slt_u_o      =   inst_slt_u;
    assign id_control_inst_shift_o      =   inst_shift;
    assign id_control_alu_src_pc_o      =   alu_src_pc;
    assign id_control_alu_src_imm_o     =   alu_src_imm;
    assign id_control_shift_num_src_o   =   shift_num_src;
    assign id_control_shift_type_o      =   shift_type;
    assign id_control_inst_arth_lgc_o   =   inst_arth_lgc;
    assign id_control_inst_auipc_o      =   inst_auipc;
    assign id_control_alu_op_o          =   alu_op;

    /* mem */
    assign id_control_inst_csr_o        =   inst_csr;
    assign id_control_inst_load_o       =   inst_load;
    assign id_control_mem_write_o       =   mem_write;
    assign id_control_mem_read_o        =   mem_read;
    assign id_control_store_type_o      =   store_type;
    assign id_control_load_type_o       =   load_type;
    assign id_control_csr_ctrl_o        =   csr_ctrl;
    assign id_control_inst_ecall_o      =   inst_ecall;
    assign id_control_inst_ebreak_o     =   inst_ebreak;
    assign id_control_inst_mret_o       =   inst_mret;
    assign id_control_inst_trap_o       =   inst_trap;

    `ifdef YSYX210092_DEFINE_PUTCH
    assign id_control_inst_selfdefine_o =   inst_selfdefine;
    `endif

    /* instruction type assignments*/
    assign inst_shift                   =   inst_alxx & ( funct3[1:0]==2'b01 );
    assign inst_lui                     =   eff_opcode == `YSYX210092_EFF_OPCODE_LUI;
    assign inst_load                    =   eff_opcode == `YSYX210092_EFF_OPCODE_LOAD;
    assign inst_jump                    =   inst_jal | inst_jalr;
    assign inst_word                    =   inst_aliw | inst_alw;
    assign inst_branch                  =   eff_opcode == `YSYX210092_EFF_OPCODE_BRANCH;
    assign inst_csr                     =   eff_opcode == `YSYX210092_EFF_OPCODE_CSR;
    assign inst_store                   =   eff_opcode == `YSYX210092_EFF_OPCODE_STORE;
    assign inst_ali                     =   eff_opcode == `YSYX210092_EFF_OPCODE_ALI;
    assign inst_aliw                    =   eff_opcode == `YSYX210092_EFF_OPCODE_ALIW;
    assign inst_al                      =   eff_opcode == `YSYX210092_EFF_OPCODE_AL;
    assign inst_alw                     =   eff_opcode == `YSYX210092_EFF_OPCODE_ALW;
    assign inst_auipc                   =   eff_opcode == `YSYX210092_EFF_OPCODE_AUIPC;
    assign inst_jal                     =   eff_opcode == `YSYX210092_EFF_OPCODE_JAL;
    assign inst_jalr                    =   eff_opcode == `YSYX210092_EFF_OPCODE_JALR;  
    assign inst_mem                     =   inst_load | inst_store;
    assign inst_arth_lgc                =   inst_alxx;
    assign inst_alxx                    =   inst_al_i | inst_al_ni;
    assign inst_al_ni                   =   inst_al | inst_alw;
    assign inst_al_i                    =   inst_ali | inst_aliw;
    // assign inst_al_nw                   =   inst_al | inst_ali;
    // assign inst_al_w                    =   inst_alw | inst_aliw;
    assign inst_addxx                   =   inst_add | inst_addi | inst_addw | inst_addiw;
    assign inst_subxx                   =   inst_sub | inst_subw;
    assign inst_xorxx                   =   inst_xor | inst_xori;
    assign inst_orxx                    =   inst_or | inst_ori;
    assign inst_andxx                   =   inst_and | inst_andi;
    assign inst_xuix                    =   inst_lui | inst_auipc;
    assign inst_slt_nu                  =   inst_slt | inst_slti;
    assign inst_slt_u                   =   inst_sltu | inst_sltiu;
    assign inst_csr_ni                  =   inst_csr & ( funct3[2] == 1'b0 ) & funct3[1:0] != 2'b00;
    // assign inst_csr_i                   =   inst_csr & ( funct3[2] == 1'b1 ) & funct3[1:0] != 2'b00;
    assign inst_expt                    =   inst_csr & inst[`YSYX210092_INST_19_7] == 13'b0;
    assign inst_trap                    =   inst_ecall | inst_ebreak | inst_mret;
    /* all instructions' assignments */
 
    // assign inst_lui                     = eff_opcode == `YSYX210092_EFF_OPCODE_LUI;
    // assign inst_auipc                   = eff_opcode == `YSYX210092_EFF_OPCODE_AUIPC;
    // assign inst_jal                     = eff_opcode == `YSYX210092_EFF_OPCODE_JAL;
    // assign inst_jalr                    = eff_opcode == `YSYX210092_EFF_OPCODE_JALR; 
    assign inst_ecall                   =   inst_expt & inst[`YSYX210092_INST_31_20] == 12'b0;
    assign inst_ebreak                  =   inst_expt & inst[`YSYX210092_INST_31_20] == 12'b1;
    assign inst_mret                    =   inst_expt & inst[`YSYX210092_INST_31_20] == 12'h302;
    assign inst_beq                     =   inst_branch & ( funct3 == 3'b000 );
    assign inst_bne                     =   inst_branch & ( funct3 == 3'b001 );
    assign inst_blt                     =   inst_branch & ( funct3 == 3'b100 );
    assign inst_bltu                    =   inst_branch & ( funct3 == 3'b110 );
    assign inst_bge                     =   inst_branch & ( funct3 == 3'b101 );
    assign inst_bgeu                    =   inst_branch & ( funct3 == 3'b111 );
    assign inst_lb                      =   inst_load & ( funct3 == 3'b000 ) ;
    assign inst_lh                      =   inst_load & ( funct3 == 3'b001 ) ;
    assign inst_lw                      =   inst_load & ( funct3 == 3'b010 ) ;
    assign inst_ld                      =   inst_load & ( funct3 == 3'b011 ) ;
    assign inst_lbu                     =   inst_load & ( funct3 == 3'b100 ) ;
    assign inst_lhu                     =   inst_load & ( funct3 == 3'b101 ) ;
    assign inst_lwu                     =   inst_load & ( funct3 == 3'b110 ) ;//也是对称的诶
    assign inst_sb                      =   inst_store & ( funct3 == 3'b000 );
    assign inst_sh                      =   inst_store & ( funct3 == 3'b001 );
    assign inst_sw                      =   inst_store & ( funct3 == 3'b010 );
    assign inst_sd                      =   inst_store & ( funct3 == 3'b011 );
    assign inst_addiw                   =   inst_aliw & ( funct3 == 3'b000 );
    assign inst_addi                    =   inst_ali & ( funct3 == 3'b000 );
    assign inst_slti                    =   inst_ali & ( funct3 == 3'b010 );
    assign inst_sltiu                   =   inst_ali & ( funct3 == 3'b011 );
    assign inst_xori                    =   inst_ali & ( funct3 == 3'b100 );
    assign inst_ori                     =   inst_ali & ( funct3 == 3'b110 );
    assign inst_andi                    =   inst_ali & ( funct3 == 3'b111 );
    assign inst_slliw                   =   inst_aliw & ( funct3 == 3'b001 ) & ( funct7 == 7'b0000000 );
    assign inst_slli                    =   inst_ali & ( funct3 == 3'b001 ) & ( funct7[6:1] == 6'b000000 ) ;
    assign inst_srliw                   =   inst_aliw & ( funct3 == 3'b101 ) & ( funct7 == 7'b0000000 );
    assign inst_srli                    =   inst_ali & ( funct3 == 3'b101 ) & ( funct7[6:1] == 6'b000000 );
    assign inst_sraiw                   =   inst_aliw & ( funct3 == 3'b101 ) & ( funct7 == 7'b0100000 );
    assign inst_srai                    =   inst_ali & ( funct3 == 3'b101 ) & ( funct7[6:1] == 6'b010000 );
    assign inst_addw                    =   inst_alw & ( funct3 == 3'b000 ) & ( funct7 == 7'b0000000 );
    assign inst_add                     =   inst_al & ( funct3 == 3'b000 ) & ( funct7 == 7'b0000000 );
    assign inst_subw                    =   inst_alw & ( funct3 == 3'b000 ) & ( funct7 == 7'b0100000 );
    assign inst_sub                     =   inst_al & ( funct3 == 3'b000 ) & ( funct7 == 7'b0100000 );
    assign inst_sllw                    =   inst_alw & ( funct3 == 3'b001 ) & ( funct7 == 7'b0000000 );
    assign inst_sll                     =   inst_al & ( funct3 == 3'b001 ) & ( funct7 == 7'b0000000 );
    assign inst_slt                     =   inst_al & ( funct3 == 3'b010 ) & ( funct7 == 7'b0000000 );
    assign inst_sltu                    =   inst_al & ( funct3 == 3'b011 ) & ( funct7 == 7'b0000000 );
    assign inst_xor                     =   inst_al & ( funct3 == 3'b100 ) & ( funct7 == 7'b0000000 );
    assign inst_srlw                    =   inst_alw & ( funct3 == 3'b101 ) & ( funct7 == 7'b0000000 );
    assign inst_srl                     =   inst_al & ( funct3 == 3'b101 ) & ( funct7 == 7'b0000000 );
    assign inst_sraw                    =   inst_alw & ( funct3 == 3'b101 ) & ( funct7 == 7'b0100000 );
    assign inst_sra                     =   inst_al & ( funct3 == 3'b101 ) & ( funct7 == 7'b0100000 );
    assign inst_or                      =   inst_al & ( funct3 == 3'b110 ) & ( funct7 == 7'b0000000 );
    assign inst_and                     =   inst_al & ( funct3 == 3'b111 ) & ( funct7 == 7'b0000000 );

    /* all control signals' assignments */
    /* register control */
    assign rs1_en                       =   inst_jalr | inst_branch | inst_mem | inst_alxx | inst_csr_ni;
    assign rs2_en                       =   inst_branch | inst_store | inst_al_ni ;
    assign rd_en                        =   inst_xuix | inst_jump | inst_load | inst_alxx | inst_csr;
    assign jump_base_pc                 =   inst_jalr;

    /* instruction type */
    // assign inst_sltxx                   =   inst_slt | inst_sltu |inst_slti | inst_sltiu ;
    // assign inst_shift                   =   ( inst_al | inst_alw | inst_ali | inst_aliw ) & ( funct3[1:0]==2'b01 );
    // assign inst_lui                     =   eff_opcode == `YSYX210092_EFF_OPCODE_LUI;
    // assign inst_load                    =   eff_opcode == `YSYX210092_EFF_OPCODE_LOAD;
    // assign inst_jump                    =   inst_jal | inst_jalr;
    // assign inst_word                    =   inst_aliw | inst_alw;
    // assign inst_branch                  =   eff_opcode == `YSYX210092_EFF_OPCODE_BRANCH;

    /* memory control */
    assign mem_write                    =   inst_store ;
    assign mem_read                     =   inst_load ;

    /* immediate number */
    assign gen_type                     =     ( { 3 { inst_store } } & 3'b011) 
                                            | ( { 3 { inst_xuix } } & 3'b100 )
                                            | ( { 3 { inst_jal } } & 3'b101 )
                                            | ( { 3 { inst_jalr | inst_load | ( inst_al_i & ~inst_shift ) } } & 3'b110 )
                                            | ( { 3 { inst_branch } } & 3'b111 )
                                            | ( { 3 { inst_shift } } & 3'b010 )
                                            | ( { 3 { inst_csr } } & 3'b001);

    /* alu control */
    assign alu_src_pc                   =   ~inst_auipc;
    assign alu_src_imm                  =   inst_auipc | inst_mem | ( inst_al_i & ~inst_shift ) ;
    assign alu_op                       =    ( { 3 { inst_auipc | inst_mem | inst_addxx } } & 3'b011 )  
                                           | ( { 3 { inst_slt_nu | inst_slt_u | inst_subxx } } & 3'b100)
                                           | ( { 3 { inst_xorxx } } & 3'b101 )
                                           | ( { 3 { inst_orxx } } & 3'b110 )
                                           | ( { 3 { inst_andxx } } & 3'b111);

    /* compare */
    assign comp_type                    =    ( { 3 { inst_beq } } & 3'b010 )
                                           | ( { 3 { inst_bne } } & 3'b011 )
                                           | ( { 3 { inst_blt } } & 3'b100 )
                                           | ( { 3 { inst_bltu } } & 3'b101 )
                                           | ( { 3 { inst_bge } } & 3'b110 )
                                           | ( { 3 { inst_bgeu } } & 3'b111 );          

    /* shift */
    assign shift_type                   =    ( { 3 { inst_sll | inst_slli } } & 3'b001 )
                                           | ( { 3 { inst_sllw | inst_slliw } } & 3'b011 )
                                           | ( { 3 { inst_srlw | inst_srliw } } & 3'b111 )
                                           | ( { 3 { inst_srl | inst_srli } } & 3'b101 )         
                                           | ( { 3 { inst_sraw | inst_sraiw} } & 3'b110 )
                                           | ( { 3 { inst_sra | inst_srai } } & 3'b100 );
    assign shift_num_src                =   ( inst_shift & inst_al_i );

    /* store */
    assign store_type                   =    ( { 3 { inst_sb } } & 3'b100 )
                                           | ( { 3 { inst_sh } } & 3'b101 )
                                           | ( { 3 { inst_sw } } & 3'b110 )
                                           | ( { 3 { inst_sd } } & 3'b111 );

    /* load */
    assign load_type                    =    ( { 3 { inst_lb } } & 3'b001 )
                                           | ( { 3 { inst_lbu } } & 3'b101 )
                                           | ( { 3 { inst_lh } } & 3'b010 )
                                           | ( { 3 { inst_lhu } } & 3'b110 )
                                           | ( { 3 { inst_lw } } & 3'b011 )
                                           | ( { 3 { inst_lwu } } & 3'b111 )
                                           | ( { 3 { inst_ld } } & 3'b100 );

    assign csr_ctrl                     =   inst_csr? funct3: 3'b100;
endmodule
module ysyx_210092_id_forward (
    /* control signals */
    input                       id_forward_inst_jump_i,
    input                       id_forward_inst_branch_i,
    input                       id_forward_id_rs1_en_i,
    input                       id_forward_id_rs2_en_i,
    input                       id_forward_id2ex_rd_en_i,
    input                       id_forward_ex2mem_rd_en_i,
    input                       id_forward_mem2wb_rd_en_i,
    
    input   [`YSYX210092_REG_INDEX_BUS]    id_forward_id_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_forward_id_rs2_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_forward_id2ex_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_forward_ex2mem_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_forward_mem2wb_rd_index_i,

    output                      id_forward_id_rs1_src_reg_o,
    output                      id_forward_id_rs1_src_id2ex_o,
    output                      id_forward_id_rs1_src_ex2mem_o,
    output                      id_forward_id_rs1_src_mem2wb_o,
    output                      id_forward_id_rs2_src_reg_o,
    output                      id_forward_id_rs2_src_id2ex_o,
    output                      id_forward_id_rs2_src_ex2mem_o,
    output                      id_forward_id_rs2_src_mem2wb_o
);
    /* rename */
    wire                        inst_jump;
    wire                        inst_branch;
    wire                        id_rs1_en;
    wire                        id_rs2_en;
    wire                        id2ex_rd_en;
    wire                        ex2mem_rd_en;
    wire                        mem2wb_rd_en;
    wire                        id_rs1_src_reg;
    wire                        id_rs1_src_id2ex;
    wire                        id_rs1_src_ex2mem;
    wire                        id_rs1_src_mem2wb;
    wire                        id_rs2_src_reg;
    wire                        id_rs2_src_id2ex;
    wire                        id_rs2_src_ex2mem;
    wire                        id_rs2_src_mem2wb; 

    wire    [`YSYX210092_REG_INDEX_BUS]    id_rs1_index;
    wire    [`YSYX210092_REG_INDEX_BUS]    id_rs2_index;
    wire    [`YSYX210092_REG_INDEX_BUS]    id2ex_rd_index;
    wire    [`YSYX210092_REG_INDEX_BUS]    ex2mem_rd_index;
    wire    [`YSYX210092_REG_INDEX_BUS]    mem2wb_rd_index;
    /* rename */
    wire                        inst_jumpbranch;
    wire                        id_rs1_src_id2ex_n;
    wire                        id_rs1_src_ex2mem_n;
    wire                        id_rs1_src_mem2wb_n;
    wire                        id_rs2_src_id2ex_n;
    wire                        id_rs2_src_ex2mem_n;
    wire                        id_rs2_src_mem2wb_n; 

    /* rename */
    assign inst_jump                        =   id_forward_inst_jump_i;
    assign inst_branch                      =   id_forward_inst_branch_i;
    assign id_rs1_en                        =   id_forward_id_rs1_en_i;
    assign id_rs2_en                        =   id_forward_id_rs2_en_i;
    assign id2ex_rd_en                      =   id_forward_id2ex_rd_en_i;
    assign ex2mem_rd_en                     =   id_forward_ex2mem_rd_en_i;
    assign mem2wb_rd_en                     =   id_forward_mem2wb_rd_en_i;
    assign id_forward_id_rs1_src_reg_o      =   id_rs1_src_reg;
    assign id_forward_id_rs1_src_id2ex_o    =   id_rs1_src_id2ex;
    assign id_forward_id_rs1_src_ex2mem_o   =   id_rs1_src_ex2mem;
    assign id_forward_id_rs1_src_mem2wb_o   =   id_rs1_src_mem2wb;
    assign id_forward_id_rs2_src_reg_o      =   id_rs2_src_reg;
    assign id_forward_id_rs2_src_id2ex_o    =   id_rs2_src_id2ex;
    assign id_forward_id_rs2_src_ex2mem_o   =   id_rs2_src_ex2mem;
    assign id_forward_id_rs2_src_mem2wb_o   =   id_rs2_src_mem2wb;

    assign id_rs1_index                     =   id_forward_id_rs1_index_i;
    assign id_rs2_index                     =   id_forward_id_rs2_index_i;
    assign id2ex_rd_index                   =   id_forward_id2ex_rd_index_i;
    assign ex2mem_rd_index                  =   id_forward_ex2mem_rd_index_i;
    assign mem2wb_rd_index                  =   id_forward_mem2wb_rd_index_i;
    /* rename */
    assign inst_jumpbranch                  =   inst_jump | inst_branch;
    assign id_rs1_src_id2ex_n               =   ~id_rs1_src_id2ex;
    assign id_rs1_src_ex2mem_n              =   ~id_rs1_src_ex2mem;
    assign id_rs1_src_mem2wb_n              =   ~id_rs1_src_mem2wb;
    assign id_rs2_src_id2ex_n               =   ~id_rs2_src_id2ex;
    assign id_rs2_src_ex2mem_n              =   ~id_rs2_src_ex2mem;
    assign id_rs2_src_mem2wb_n              =   ~id_rs2_src_mem2wb;
    
    assign id_rs1_src_reg                   =   id_rs1_src_id2ex_n & id_rs1_src_ex2mem_n & id_rs1_src_mem2wb_n;
    assign id_rs1_src_id2ex                 =   ( id2ex_rd_index != `YSYX210092_REG_INDEX_SIZE'b0 ) & ( id_rs1_index == id2ex_rd_index )
                                                & id_rs1_en & id2ex_rd_en & inst_jumpbranch;
    assign id_rs1_src_ex2mem                =   id_rs1_src_id2ex_n & ( ex2mem_rd_index != `YSYX210092_REG_INDEX_SIZE'b0 )
                                                & ( id_rs1_index == ex2mem_rd_index )& id_rs1_en & ex2mem_rd_en
                                                & inst_jumpbranch;
    assign id_rs1_src_mem2wb                =   id_rs1_src_id2ex_n & id_rs1_src_ex2mem_n & ( mem2wb_rd_index != `YSYX210092_REG_INDEX_SIZE'b0 )
                                                & ( id_rs1_index == mem2wb_rd_index )& id_rs1_en & mem2wb_rd_en
                                                & inst_jumpbranch;
    
    assign id_rs2_src_reg                   =   id_rs2_src_id2ex_n & id_rs2_src_ex2mem_n & id_rs2_src_mem2wb_n;
    assign id_rs2_src_id2ex                 =   ( id2ex_rd_index != `YSYX210092_REG_INDEX_SIZE'b0 ) & ( id_rs2_index == id2ex_rd_index ) 
                                                & id_rs2_en & id2ex_rd_en & inst_branch;
    assign id_rs2_src_ex2mem                =   id_rs2_src_id2ex_n & ( ex2mem_rd_index != `YSYX210092_REG_INDEX_SIZE'b0 )
                                                & ( id_rs2_index == ex2mem_rd_index )& id_rs2_en & ex2mem_rd_en
                                                & inst_branch;
    assign id_rs2_src_mem2wb                =   id_rs2_src_id2ex_n & id_rs2_src_ex2mem_n & ( mem2wb_rd_index != `YSYX210092_REG_INDEX_SIZE'b0 )
                                                & ( id_rs2_index == mem2wb_rd_index )& id_rs2_en & mem2wb_rd_en
                                                & inst_branch;
endmodule
module ysyx_210092_id_immgen (
    /* control signals */
    input   [`YSYX210092_GEN_TYPE_BUS]     id_immgen_gen_type_i,
    
    /* data signals */
    input   [`YSYX210092_INST_BUS]         id_immgen_inst_i,    
    output  [`YSYX210092_DATA_BUS]         id_immgen_imm_data_o
);
    /* rename */
    wire [`YSYX210092_GEN_TYPE_BUS]        gen_type    =   id_immgen_gen_type_i;
    wire [`YSYX210092_INST_BUS]            inst        =   id_immgen_inst_i;
    wire [`YSYX210092_DATA_BUS]            imm_data;
    
    assign id_immgen_imm_data_o             =   imm_data;
    /* rename */

    wire inst_store;
    wire inst_xuix;
    wire inst_jal;
    wire inst_jalr_load_ali;
    wire inst_branch;
    wire inst_shift;
    wire inst_csr;
    
    wire [`YSYX210092_IMM_PRE_BUS] imm_store;
    wire [`YSYX210092_IMM_PRE_BUS] imm_xuix;
    wire [`YSYX210092_IMM_PRE_BUS] imm_jal;
    wire [`YSYX210092_IMM_PRE_BUS] imm_jalr_load_ali;
    wire [`YSYX210092_IMM_PRE_BUS] imm_branch;
    wire [`YSYX210092_IMM_PRE_BUS] imm_shift;
    wire [`YSYX210092_IMM_PRE_BUS] imm_csr;
    wire [`YSYX210092_IMM_PRE_BUS] imm_pre;


    assign inst_store           =   gen_type == 3'b011;
    assign inst_xuix            =   gen_type == 3'b100;
    assign inst_jal             =   gen_type == 3'b101;
    assign inst_jalr_load_ali   =   gen_type == 3'b110;
    assign inst_branch          =   gen_type == 3'b111;
    assign inst_shift           =   gen_type == 3'b010;
    assign inst_csr             =   gen_type == 3'b001;

    assign imm_store            =   { { 20 { inst[`YSYX210092_INST_31]} }, inst[`YSYX210092_INST_31_25], 
                                        inst[`YSYX210092_INST_11_7] };

    assign imm_xuix             =   { inst[`YSYX210092_INST_31_12], 12'b0 };

    assign imm_jal              =   { { 11 { inst[`YSYX210092_INST_31] } }, inst[`YSYX210092_INST_31],
                                        inst[`YSYX210092_INST_19_12], inst[`YSYX210092_INST_20],
                                        inst[`YSYX210092_INST_30_21], 1'b0 };

    assign imm_jalr_load_ali    =   {  { 20 { inst[`YSYX210092_INST_31] } }, inst[`YSYX210092_INST_31_20] };

    assign imm_branch           =   {  { 19 { inst[`YSYX210092_INST_31] } }, inst[`YSYX210092_INST_31],
                                        inst[`YSYX210092_INST_7], inst[`YSYX210092_INST_30_25], 
                                        inst[`YSYX210092_INST_11_8], 1'b0 };
    assign imm_shift            =   { 26'b0, inst[`YSYX210092_INST_25_20] };
    assign imm_csr              =   { 27'b0, inst[`YSYX210092_INST_19_15] };

    assign imm_pre              =     ( { 32 { inst_store } } & imm_store )
                                    | ( { 32 { inst_xuix } } & imm_xuix )
                                    | ( { 32 { inst_jal } } & imm_jal )
                                    | ( { 32 { inst_jalr_load_ali } } & imm_jalr_load_ali )
                                    | ( { 32 { inst_branch } } & imm_branch )
                                    | ( { 32 { inst_shift } } & imm_shift  )
                                    | ( { 32 { inst_csr } } & imm_csr );

    assign imm_data             =   { { 32 { imm_pre[31] } } , imm_pre };  
                            
endmodule

module ysyx_210092_id_regfile(
    input                       clk,
    input                       rst,

    /* control signals */
    input                       id_regfile_inst_valid_i,
    input                       id_regfile_rd_en_i,
    input                       id_regfile_rs1_en_i,
    input                       id_regfile_rs2_en_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_regfile_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_regfile_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_regfile_rs2_index_i,

    /* data signals */
    input   [`YSYX210092_REG_BUS]          id_regfile_rd_data_i,
    output  [`YSYX210092_REG_BUS]          id_regfile_rs1_data_o,
    output  [`YSYX210092_REG_BUS]          id_regfile_rs2_data_o

    `ifdef YSYX210092_DEFINE_DIFFTEST
    /* difftest interface */
    ,
    output  [`YSYX210092_REG_BUS]          id_regfile_regs_o  [31:0] 
    `endif

);
    
    reg [`YSYX210092_REG_BUS] regfile_r [`YSYX210092_REG_NUM-1:1];

    genvar i;
    generate
        for( i=1; i<`YSYX210092_REG_NUM; i = i+1 ) begin
            :regfile_op
            always @( posedge clk ) begin
                if( rst ) begin
                    regfile_r[i] <= `YSYX210092_REG_BUS_SIZE'b0;
                end
                else if( id_regfile_inst_valid_i & ( ( id_regfile_rd_index_i == i ) & id_regfile_rd_en_i ) ) begin
                    regfile_r[i] <= id_regfile_rd_data_i;    
                end
                else begin
                    regfile_r[i] <= regfile_r[i];
                end
            end
        end
    endgenerate

`ifdef YSYX210092_DEFINE_DIFFTEST
    generate
        assign id_regfile_regs_o[0] = `YSYX210092_DATA_BUS_SIZE'b0;
		for (i = 1; i < `YSYX210092_REG_NUM; i = i + 1) begin
			:reg_o_op
            assign id_regfile_regs_o[i] = ( id_regfile_rd_en_i & ( id_regfile_rd_index_i == i ) ) ? 
                                            id_regfile_rd_data_i : regfile_r[i];
		end
	endgenerate
`endif

    wire [`YSYX210092_REG_BUS] rs1_data_pre = id_regfile_rs1_index_i == 5'b0 ? `YSYX210092_REG_BUS_SIZE'b0 : 
                                   ( id_regfile_rs1_index_i == id_regfile_rd_index_i & id_regfile_rd_en_i )? id_regfile_rd_data_i:
                                   regfile_r[id_regfile_rs1_index_i];
    wire [`YSYX210092_REG_BUS] rs2_data_pre = id_regfile_rs2_index_i == 5'b0 ? `YSYX210092_REG_BUS_SIZE'b0 : 
                                   ( id_regfile_rs2_index_i == id_regfile_rd_index_i & id_regfile_rd_en_i )? id_regfile_rd_data_i:
                                   regfile_r[id_regfile_rs2_index_i];

    assign id_regfile_rs1_data_o = id_regfile_rs1_en_i ? rs1_data_pre: `YSYX210092_REG_BUS_SIZE'b0;
    assign id_regfile_rs2_data_o = id_regfile_rs2_en_i ? rs2_data_pre: `YSYX210092_REG_BUS_SIZE'b0;

endmodule

module ysyx_210092_id_top (
    input                       clk,
    input                       rst,

    /* control signals */
    input                       id_top_inst_valid_i,
    

    input                       id_top_id2ex_rd_en_i,
    input                       id_top_ex2mem_rd_en_i,
    input                       id_top_mem2wb_rd_en_i,

    input   [`YSYX210092_REG_INDEX_BUS]    id_top_id2ex_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_top_ex2mem_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    id_top_mem2wb_rd_index_i,
    
    output  [`YSYX210092_REG_INDEX_BUS]    id_top_rs1_index_o,
    output  [`YSYX210092_REG_INDEX_BUS]    id_top_rs2_index_o,
    output  [`YSYX210092_REG_INDEX_BUS]    id_top_rd_index_o,
    output  [`YSYX210092_CSR_INDEX_BUS]    id_top_csr_index_o,


    output                      id_top_id_rs1_src_id2ex_o,
    output                      id_top_id_rs1_src_ex2mem_o,
    output                      id_top_id_rs2_src_id2ex_o,
    output                      id_top_id_rs2_src_ex2mem_o,

    output                      id_top_rs1_en_o,
    output                      id_top_rs2_en_o,
    output                      id_top_rd_en_o,
    output                      id_top_inst_jump_o,
    output                      id_top_inst_branch_o,

    output                      id_top_inst_word_o,
    output                      id_top_inst_slt_nu_o,
    output                      id_top_inst_slt_u_o,
    output                      id_top_inst_shift_o,
    output                      id_top_alu_src_pc_o,
    output                      id_top_alu_src_imm_o,
    output                      id_top_shift_num_src_o,
    output  [`YSYX210092_SHIFT_TYPE_BUS]   id_top_shift_type_o,
    output                      id_top_inst_arth_lgc_o,
    output                      id_top_inst_auipc_o,
    output  [`YSYX210092_ALU_OP_BUS]       id_top_alu_op_o,

    output                      id_top_inst_csr_o,
    output                      id_top_inst_load_o,
    output                      id_top_mem_write_o,
    output                      id_top_mem_read_o,
    output  [`YSYX210092_STORE_TYPE_BUS]   id_top_store_type_o,
    output  [`YSYX210092_LOAD_TYPE_BUS]    id_top_load_type_o,
    output  [`YSYX210092_CSR_CTRL_BUS]     id_top_csr_ctrl_o,
    output                      id_top_inst_ecall_o,
    output                      id_top_inst_ebreak_o,
    output                      id_top_inst_mret_o,
    output                      id_top_inst_trap_o,

    output                      id_top_jumpbranch_en_o,

    `ifdef YSYX210092_DEFINE_PUTCH
    output                      id_top_inst_selfdefine_o,
    `endif

    /* data signals */
    input   [`YSYX210092_INST_BUS]         id_top_inst_i,
    input   [`YSYX210092_INST_ADDR_BUS]    id_top_inst_addr_i,
    input   [`YSYX210092_INST_ADDR_BUS]    id_top_nxt_inst_addr_i,
    input   [`YSYX210092_DATA_BUS]         id_top_id2ex_rd_data_i,
    input   [`YSYX210092_DATA_BUS]         id_top_ex2mem_rd_data_i,
    input   [`YSYX210092_DATA_BUS]         id_top_mem2wb_rd_data_i,

    output  [`YSYX210092_REG_BUS]          id_top_rs1_data_o,
    output  [`YSYX210092_REG_BUS]          id_top_rs2_data_o,
    output  [`YSYX210092_DATA_BUS]         id_top_imm_data_o,
    output  [`YSYX210092_DATA_BUS]         id_top_rd_data_o,
    output  [`YSYX210092_INST_ADDR_BUS]    id_top_inst_addr_o,
    output  [`YSYX210092_INST_ADDR_BUS]    id_top_jumpbranch_addr_o
    `ifdef YSYX210092_DEFINE_DIFFTEST  
    ,
    output    [`YSYX210092_REG_BUS]        id_top_regs_o[31:0]
    `endif
);
    
    wire                        id_control_rs1_en_o;
    wire                        id_control_rs2_en_o;
    wire                        id_control_rd_en_o;
    wire                        id_control_jump_base_pc_o;
    wire    [`YSYX210092_COMP_TYPE_BUS]    id_control_comp_type_o;
    wire                        id_control_inst_jump_o;
    wire                        id_control_inst_branch_o;
    wire                        id_control_inst_lui_o;
    wire    [`YSYX210092_GEN_TYPE_BUS]     id_control_gen_type_o;
    wire                        id_control_inst_word_o;
    wire                        id_control_inst_slt_nu_o;
    wire                        id_control_inst_slt_u_o;
    wire                        id_control_inst_shift_o;
    wire                        id_control_alu_src_pc_o;
    wire                        id_control_alu_src_imm_o;
    wire                        id_control_shift_num_src_o;
    wire    [`YSYX210092_SHIFT_TYPE_BUS]   id_control_shift_type_o;
    wire                        id_control_inst_arth_lgc_o;
    wire                        id_control_inst_auipc_o;
    wire    [`YSYX210092_ALU_OP_BUS]       id_control_alu_op_o;
    wire                        id_control_inst_csr_o;
    wire                        id_control_inst_load_o;
    wire                        id_control_mem_write_o;
    wire                        id_control_mem_read_o;
    wire    [`YSYX210092_STORE_TYPE_BUS]   id_control_store_type_o;
    wire    [`YSYX210092_LOAD_TYPE_BUS]    id_control_load_type_o;
    wire    [`YSYX210092_CSR_CTRL_BUS]     id_control_csr_ctrl_o;
    wire                        id_control_inst_ecall_o;
    wire                        id_control_inst_ebreak_o;
    wire                        id_control_inst_mret_o;
    wire                        id_control_inst_trap_o;
    
    `ifdef YSYX210092_DEFINE_PUTCH 
    wire                        id_control_inst_selfdefine_o;
    `endif  
    
    wire                        id_branchjudge_ok_o;

    wire    [`YSYX210092_DATA_BUS]         id_immgen_imm_data_o;

    wire                        id_forward_id_rs1_src_reg_o;
    wire                        id_forward_id_rs1_src_id2ex_o;
    wire                        id_forward_id_rs1_src_ex2mem_o;
    wire                        id_forward_id_rs1_src_mem2wb_o;
    wire                        id_forward_id_rs2_src_reg_o;
    wire                        id_forward_id_rs2_src_id2ex_o;
    wire                        id_forward_id_rs2_src_ex2mem_o;
    wire                        id_forward_id_rs2_src_mem2wb_o;

    wire    [`YSYX210092_REG_BUS]          id_regfile_rs1_data_o;
    wire    [`YSYX210092_REG_BUS]          id_regfile_rs2_data_o;

    `ifdef YSYX210092_DEFINE_DIFFTEST      
    wire    [`YSYX210092_REG_BUS]          id_regfile_regs_o  [31:0] ;
    `endif


    wire    [`YSYX210092_REG_BUS]          id_rs1_data;
    wire    [`YSYX210092_REG_BUS]          id_rs2_data;

    wire    [`YSYX210092_INST_ADDR_BUS]    jumpbranch_base;


    assign id_rs1_data                  =     ( { 64 { id_forward_id_rs1_src_reg_o } } & id_regfile_rs1_data_o ) 
                                            | ( { 64 { id_forward_id_rs1_src_id2ex_o } } & id_top_id2ex_rd_data_i )
                                            | ( { 64 { id_forward_id_rs1_src_ex2mem_o } } & id_top_ex2mem_rd_data_i )
                                            | ( { 64 { id_forward_id_rs1_src_mem2wb_o} } & id_top_mem2wb_rd_data_i );
    assign id_rs2_data                  =     ( { 64 { id_forward_id_rs2_src_reg_o } } & id_regfile_rs2_data_o ) 
                                            | ( { 64 { id_forward_id_rs2_src_id2ex_o } } & id_top_id2ex_rd_data_i )
                                            | ( { 64 { id_forward_id_rs2_src_ex2mem_o } } & id_top_ex2mem_rd_data_i )
                                            | ( { 64 { id_forward_id_rs2_src_mem2wb_o} } & id_top_mem2wb_rd_data_i );

    assign jumpbranch_base              =   ( id_control_jump_base_pc_o == 1'b0 ) ? id_top_inst_addr_i: id_rs1_data;
    

    /* control signals */
    assign id_top_rs1_index_o           =   id_top_inst_i[`YSYX210092_RS1_LOC_BUS];
    assign id_top_rs2_index_o           =   id_top_inst_i[`YSYX210092_RS2_LOC_BUS];
    assign id_top_rd_index_o            =   id_top_inst_i[`YSYX210092_RD_LOC_BUS];
    assign id_top_csr_index_o           =   id_top_inst_i[`YSYX210092_CSR_LOC_BUS];



    assign id_top_id_rs1_src_id2ex_o    =   id_forward_id_rs1_src_id2ex_o;
    assign id_top_id_rs1_src_ex2mem_o   =   id_forward_id_rs1_src_ex2mem_o;
    assign id_top_id_rs2_src_id2ex_o    =   id_forward_id_rs2_src_id2ex_o;
    assign id_top_id_rs2_src_ex2mem_o   =   id_forward_id_rs2_src_ex2mem_o;

    assign id_top_rs1_en_o              =   id_control_rs1_en_o;
    assign id_top_rs2_en_o              =   id_control_rs2_en_o;
    assign id_top_rd_en_o               =   id_control_rd_en_o;
    assign id_top_inst_jump_o           =   id_control_inst_jump_o;
    assign id_top_inst_branch_o         =   id_control_inst_branch_o;

    assign id_top_inst_word_o           =   id_control_inst_word_o;
    assign id_top_inst_slt_nu_o         =   id_control_inst_slt_nu_o;
    assign id_top_inst_slt_u_o          =   id_control_inst_slt_u_o;
    assign id_top_inst_shift_o          =   id_control_inst_shift_o;
    assign id_top_alu_src_pc_o          =   id_control_alu_src_pc_o;
    assign id_top_alu_src_imm_o         =   id_control_alu_src_imm_o;
    assign id_top_shift_num_src_o       =   id_control_shift_num_src_o;
    assign id_top_shift_type_o          =   id_control_shift_type_o;
    assign id_top_inst_arth_lgc_o       =   id_control_inst_arth_lgc_o;
    assign id_top_inst_auipc_o          =   id_control_inst_auipc_o;
    assign id_top_alu_op_o              =   id_control_alu_op_o;

    assign id_top_inst_csr_o            =   id_control_inst_csr_o;
    assign id_top_inst_load_o           =   id_control_inst_load_o;
    assign id_top_mem_write_o           =   id_control_mem_write_o;
    assign id_top_mem_read_o            =   id_control_mem_read_o;
    assign id_top_store_type_o          =   id_control_store_type_o;
    assign id_top_load_type_o           =   id_control_load_type_o;
    assign id_top_csr_ctrl_o            =   id_control_csr_ctrl_o;
    assign id_top_inst_ecall_o          =   id_control_inst_ecall_o;
    assign id_top_inst_ebreak_o         =   id_control_inst_ebreak_o;
    assign id_top_inst_mret_o           =   id_control_inst_mret_o;
    assign id_top_inst_trap_o           =   id_control_inst_trap_o;

    assign id_top_jumpbranch_en_o       =   ( id_branchjudge_ok_o & id_control_inst_branch_o ) | id_control_inst_jump_o;

    `ifdef YSYX210092_DEFINE_PUTCH
    assign id_top_inst_selfdefine_o     =   id_control_inst_selfdefine_o;
    `endif

    /* data signals */

    assign id_top_rs1_data_o            =   id_rs1_data;
    assign id_top_rs2_data_o            =   id_rs2_data;
    assign id_top_imm_data_o            =   id_immgen_imm_data_o;
    assign id_top_rd_data_o             =   id_control_inst_lui_o? id_immgen_imm_data_o: id_top_nxt_inst_addr_i;
    assign id_top_inst_addr_o           =   id_top_inst_addr_i;
    assign id_top_jumpbranch_addr_o     =   jumpbranch_base + id_immgen_imm_data_o;
    `ifdef YSYX210092_DEFINE_DIFFTEST  
    assign id_top_regs_o                =   id_regfile_regs_o;
    `endif

    ysyx_210092_id_control my_id_control(


        .id_control_inst_i( id_top_inst_i ),

        .id_control_opcode_i( id_top_inst_i[`YSYX210092_OPCODE_LOC_BUS] ),
        .id_control_funct3_i( id_top_inst_i[`YSYX210092_FUNCT3_LOC_BUS] ),
        .id_control_funct7_i( id_top_inst_i[`YSYX210092_FUNCT7_LOC_BUS] ),

        /* id */
        .id_control_rs1_en_o( id_control_rs1_en_o ),
        .id_control_rs2_en_o( id_control_rs2_en_o ),
        .id_control_rd_en_o( id_control_rd_en_o ),
        .id_control_jump_base_pc_o( id_control_jump_base_pc_o ),
        .id_control_comp_type_o( id_control_comp_type_o ),
        .id_control_inst_jump_o( id_control_inst_jump_o ),
        .id_control_inst_branch_o( id_control_inst_branch_o ),
        .id_control_inst_lui_o( id_control_inst_lui_o ),
        .id_control_gen_type_o( id_control_gen_type_o ),

        /* ex */
        .id_control_inst_word_o( id_control_inst_word_o ),
        .id_control_inst_slt_nu_o( id_control_inst_slt_nu_o ),
        .id_control_inst_slt_u_o( id_control_inst_slt_u_o ),
        .id_control_inst_shift_o( id_control_inst_shift_o ),
        .id_control_alu_src_pc_o( id_control_alu_src_pc_o ),
        .id_control_alu_src_imm_o( id_control_alu_src_imm_o ),
        .id_control_shift_num_src_o( id_control_shift_num_src_o ),
        .id_control_shift_type_o( id_control_shift_type_o ),
        .id_control_inst_arth_lgc_o( id_control_inst_arth_lgc_o ),
        .id_control_inst_auipc_o( id_control_inst_auipc_o ),
        .id_control_alu_op_o( id_control_alu_op_o ),

        /* mem */
        .id_control_inst_csr_o( id_control_inst_csr_o ),
        .id_control_inst_load_o( id_control_inst_load_o ),
        .id_control_mem_write_o( id_control_mem_write_o ),
        .id_control_mem_read_o( id_control_mem_read_o ),
        .id_control_store_type_o( id_control_store_type_o ),
        .id_control_load_type_o( id_control_load_type_o ),
        .id_control_csr_ctrl_o( id_control_csr_ctrl_o ),
        .id_control_inst_ecall_o( id_control_inst_ecall_o ),
        .id_control_inst_ebreak_o( id_control_inst_ebreak_o ),
        .id_control_inst_mret_o( id_control_inst_mret_o ),
        .id_control_inst_trap_o( id_control_inst_trap_o )

        `ifdef YSYX210092_DEFINE_PUTCH
        ,
        .id_control_inst_selfdefine_o( id_control_inst_selfdefine_o )
        `endif
    );

    ysyx_210092_id_regfile my_id_regfile(
        .clk( clk ),
        .rst( rst ),

        /* control signals */
        .id_regfile_inst_valid_i( id_top_inst_valid_i ),
        .id_regfile_rd_en_i( id_top_mem2wb_rd_en_i ),
        .id_regfile_rs1_en_i( id_control_rs1_en_o ),
        .id_regfile_rs2_en_i( id_control_rs2_en_o ),
        .id_regfile_rd_index_i( id_top_mem2wb_rd_index_i ),
        .id_regfile_rs1_index_i( id_top_inst_i[`YSYX210092_RS1_LOC_BUS] ),
        .id_regfile_rs2_index_i( id_top_inst_i[`YSYX210092_RS2_LOC_BUS] ),

        /* data signals */
        .id_regfile_rd_data_i( id_top_mem2wb_rd_data_i ),
        .id_regfile_rs1_data_o( id_regfile_rs1_data_o ),
        .id_regfile_rs2_data_o( id_regfile_rs2_data_o )

        `ifdef YSYX210092_DEFINE_DIFFTEST
        /* difftest interface */
        ,
        .id_regfile_regs_o( id_regfile_regs_o )
        `endif
    );

    ysyx_210092_id_immgen my_id_immgen(
        /* control signals */
        .id_immgen_gen_type_i( id_control_gen_type_o ),

        /* data signals */
        .id_immgen_inst_i( id_top_inst_i ),    
        .id_immgen_imm_data_o( id_immgen_imm_data_o )
    );

    ysyx_210092_id_forward my_id_forward(
        /* control signals */
        .id_forward_inst_jump_i( id_control_inst_jump_o ),
        .id_forward_inst_branch_i( id_control_inst_branch_o ),
        .id_forward_id_rs1_en_i( id_control_rs1_en_o ),
        .id_forward_id_rs2_en_i( id_control_rs2_en_o ),
        .id_forward_id2ex_rd_en_i( id_top_id2ex_rd_en_i ),
        .id_forward_ex2mem_rd_en_i( id_top_ex2mem_rd_en_i ),
        .id_forward_mem2wb_rd_en_i( id_top_mem2wb_rd_en_i ),
        .id_forward_id_rs1_index_i( id_top_inst_i[`YSYX210092_RS1_LOC_BUS]  ),
        .id_forward_id_rs2_index_i( id_top_inst_i[`YSYX210092_RS2_LOC_BUS] ),
        .id_forward_id2ex_rd_index_i( id_top_id2ex_rd_index_i ),
        .id_forward_ex2mem_rd_index_i( id_top_ex2mem_rd_index_i ),
        .id_forward_mem2wb_rd_index_i( id_top_mem2wb_rd_index_i ),

        .id_forward_id_rs1_src_reg_o( id_forward_id_rs1_src_reg_o ),
        .id_forward_id_rs1_src_id2ex_o( id_forward_id_rs1_src_id2ex_o ),
        .id_forward_id_rs1_src_ex2mem_o( id_forward_id_rs1_src_ex2mem_o ),
        .id_forward_id_rs1_src_mem2wb_o( id_forward_id_rs1_src_mem2wb_o ),
        .id_forward_id_rs2_src_reg_o( id_forward_id_rs2_src_reg_o ),
        .id_forward_id_rs2_src_id2ex_o( id_forward_id_rs2_src_id2ex_o ),
        .id_forward_id_rs2_src_ex2mem_o( id_forward_id_rs2_src_ex2mem_o ),
        .id_forward_id_rs2_src_mem2wb_o( id_forward_id_rs2_src_mem2wb_o )
    );
    
    ysyx_210092_id_branchjudge my_id_branchjudge(
        /* control signals */
        .id_branchjudge_comp_type_i( id_control_comp_type_o ),

        /* data signals */
        .id_branchjudge_rs1_data_i( id_rs1_data ),
        .id_branchjudge_rs2_data_i( id_rs2_data ),
        .id_branchjudge_ok_o( id_branchjudge_ok_o )
    );

endmodule
module ysyx_210092_id2ex(
    input                       clk,
    input                       rst,

    /* ysyx_210092_id2ex control signals */
    input                       id2ex_inst_valid_i,
    input                       id2ex_id_flush_i,
    input                       id2ex_ex_stall_i,
    /* modules control signals */
    input  [`YSYX210092_REG_INDEX_BUS]     id2ex_rs1_index_i,
    input  [`YSYX210092_REG_INDEX_BUS]     id2ex_rs2_index_i,
    input  [`YSYX210092_REG_INDEX_BUS]     id2ex_rd_index_i,


    input                       id2ex_inst_nop_i,

    input                       id2ex_rs1_en_i,
    input                       id2ex_rs2_en_i,
    input                       id2ex_rd_en_i,
    input                       id2ex_inst_jump_i,
    input                       id2ex_inst_branch_i, 

    input                       id2ex_inst_word_i,
    input                       id2ex_inst_slt_nu_i,
    input                       id2ex_inst_slt_u_i,
    input                       id2ex_inst_shift_i,
    input                       id2ex_alu_src_pc_i,
    input                       id2ex_alu_src_imm_i,
    input                       id2ex_shift_num_src_i,
    input  [`YSYX210092_SHIFT_TYPE_BUS]    id2ex_shift_type_i,
    input                       id2ex_inst_arth_lgc_i,
    input                       id2ex_inst_auipc_i,
    input  [`YSYX210092_ALU_OP_BUS]        id2ex_alu_op_i,

    input  [`YSYX210092_CSR_INDEX_BUS]     id2ex_csr_index_i,
    input                       id2ex_inst_csr_i,
    input                       id2ex_inst_load_i,
    input                       id2ex_mem_write_i,
    input                       id2ex_mem_read_i,
    input  [`YSYX210092_STORE_TYPE_BUS]    id2ex_store_type_i,
    input  [`YSYX210092_LOAD_TYPE_BUS]     id2ex_load_type_i,
    input  [`YSYX210092_CSR_CTRL_BUS]      id2ex_csr_ctrl_i,
    input                       id2ex_inst_ecall_i,
    input                       id2ex_inst_ebreak_i,
    input                       id2ex_inst_mret_i,
    input                       id2ex_inst_trap_i,

    input                       id2ex_jumpbranch_en_i,

    `ifdef YSYX210092_DEFINE_PUTCH
    input                       id2ex_inst_selfdefine_i,
    `endif

    `ifdef YSYX210092_DEFINE_DIFFTEST
    input   [`YSYX210092_INST_BUS]         id2ex_inst_i,
    `endif
    output  [`YSYX210092_REG_INDEX_BUS]    id2ex_rs1_index_o,
    output  [`YSYX210092_REG_INDEX_BUS]    id2ex_rs2_index_o,
    output  [`YSYX210092_REG_INDEX_BUS]    id2ex_rd_index_o,
    output  [`YSYX210092_CSR_INDEX_BUS]    id2ex_csr_index_o,

    output                      id2ex_inst_nop_o,

    output                      id2ex_rs1_en_o,
    output                      id2ex_rs2_en_o,
    output                      id2ex_rd_en_o,
    output                      id2ex_inst_jump_o,
    output                      id2ex_inst_branch_o,

    output                      id2ex_inst_word_o,
    output                      id2ex_inst_slt_nu_o,
    output                      id2ex_inst_slt_u_o,
    output                      id2ex_inst_shift_o,
    output                      id2ex_alu_src_pc_o,
    output                      id2ex_alu_src_imm_o,
    output                      id2ex_shift_num_src_o,
    output  [`YSYX210092_SHIFT_TYPE_BUS]   id2ex_shift_type_o,
    output                      id2ex_inst_arth_lgc_o,
    output                      id2ex_inst_auipc_o,
    output  [`YSYX210092_ALU_OP_BUS]       id2ex_alu_op_o,

    output                      id2ex_inst_csr_o,
    output                      id2ex_inst_load_o,
    output                      id2ex_mem_write_o,
    output                      id2ex_mem_read_o,
    output  [`YSYX210092_STORE_TYPE_BUS]   id2ex_store_type_o,
    output  [`YSYX210092_LOAD_TYPE_BUS]    id2ex_load_type_o,
    output  [`YSYX210092_CSR_CTRL_BUS]     id2ex_csr_ctrl_o,
    output                      id2ex_inst_ecall_o,
    output                      id2ex_inst_ebreak_o,
    output                      id2ex_inst_mret_o,
    output                      id2ex_inst_trap_o,

    output                      id2ex_jumpbranch_en_o,

    `ifdef YSYX210092_DEFINE_PUTCH
    output                      id2ex_inst_selfdefine_o,
    `endif

    /* data signals */
    input   [`YSYX210092_REG_BUS]          id2ex_rs1_data_i,
    input   [`YSYX210092_REG_BUS]          id2ex_rs2_data_i,
    input   [`YSYX210092_DATA_BUS]         id2ex_imm_data_i,
    input   [`YSYX210092_DATA_BUS]         id2ex_rd_data_i,
    input   [`YSYX210092_INST_ADDR_BUS]    id2ex_inst_addr_i,
    input   [`YSYX210092_INST_ADDR_BUS]    id2ex_jumpbranch_addr_i,

    output  [`YSYX210092_REG_BUS]          id2ex_rs1_data_o,
    output  [`YSYX210092_REG_BUS]          id2ex_rs2_data_o,
    output  [`YSYX210092_DATA_BUS]         id2ex_imm_data_o,
    output  [`YSYX210092_DATA_BUS]         id2ex_rd_data_o,
    output  [`YSYX210092_INST_ADDR_BUS]    id2ex_inst_addr_o,
    output  [`YSYX210092_INST_ADDR_BUS]    id2ex_jumpbranch_addr_o
    `ifdef YSYX210092_DEFINE_DIFFTEST
    ,
    output  [`YSYX210092_INST_BUS]         id2ex_inst_o
    `endif
);

    reg     [`YSYX210092_REG_INDEX_BUS]    rs1_index_r;
    reg     [`YSYX210092_REG_INDEX_BUS]    rs2_index_r;
    reg     [`YSYX210092_REG_INDEX_BUS]    rd_index_r;
    reg     [`YSYX210092_CSR_INDEX_BUS]    csr_index_r;

    reg                         inst_nop_r;

    reg                         rs1_en_r;
    reg                         rs2_en_r;
    reg                         rd_en_r;
    reg                         inst_jump_r;
    reg                         inst_branch_r;

    reg                         inst_word_r;
    reg                         inst_slt_nu_r;
    reg                         inst_slt_u_r;
    reg                         inst_shift_r;
    reg                         alu_src_pc_r;
    reg                         alu_src_imm_r;
    reg                         shift_num_src_r;
    reg     [`YSYX210092_SHIFT_TYPE_BUS]   shift_type_r;
    reg                         inst_arth_lgc_r;
    reg                         inst_auipc_r;
    reg     [`YSYX210092_ALU_OP_BUS]       alu_op_r;

    reg                         inst_csr_r;
    reg                         inst_load_r;
    reg                         mem_write_r;
    reg                         mem_read_r;
    reg     [`YSYX210092_STORE_TYPE_BUS]   store_type_r;
    reg     [`YSYX210092_LOAD_TYPE_BUS]    load_type_r;
    reg     [`YSYX210092_CSR_CTRL_BUS]     csr_ctrl_r;
    reg                         inst_ecall_r;
    reg                         inst_ebreak_r;
    reg                         inst_mret_r;
    reg                         inst_trap_r;

    reg                         jumpbranch_en_r;

    `ifdef YSYX210092_DEFINE_PUTCH
    reg                         inst_selfdefine_r;
    `endif

    `ifdef YSYX210092_DEFINE_DIFFTEST
    reg     [`YSYX210092_INST_BUS]         inst_r;
    `endif
    reg     [`YSYX210092_REG_BUS]          rs1_data_r;
    reg     [`YSYX210092_REG_BUS]          rs2_data_r;
    reg     [`YSYX210092_DATA_BUS]         imm_data_r;
    reg     [`YSYX210092_DATA_BUS]         rd_data_r;
    reg     [`YSYX210092_INST_ADDR_BUS]    inst_addr_r;
    reg     [`YSYX210092_INST_ADDR_BUS]    jumpbranch_addr_r;

    wire                        flush_en;
    wire                        stall_en;
    wire                        flow_en;

    assign id2ex_rs1_index_o        =   rs1_index_r;
    assign id2ex_rs2_index_o        =   rs2_index_r;
    assign id2ex_rd_index_o         =   rd_index_r;
    assign id2ex_csr_index_o        =   csr_index_r;

    assign id2ex_inst_nop_o         =   inst_nop_r;

    assign id2ex_rs1_en_o           =   rs1_en_r;
    assign id2ex_rs2_en_o           =   rs2_en_r;
    assign id2ex_rd_en_o            =   rd_en_r;
    assign id2ex_inst_jump_o        =   inst_jump_r;
    assign id2ex_inst_branch_o      =   inst_branch_r;

    assign id2ex_inst_word_o        =   inst_word_r;
    assign id2ex_inst_slt_nu_o      =   inst_slt_nu_r;
    assign id2ex_inst_slt_u_o       =   inst_slt_u_r;
    assign id2ex_inst_shift_o       =   inst_shift_r;
    assign id2ex_alu_src_pc_o       =   alu_src_pc_r;
    assign id2ex_alu_src_imm_o      =   alu_src_imm_r;
    assign id2ex_shift_num_src_o    =   shift_num_src_r;
    assign id2ex_shift_type_o       =   shift_type_r;
    assign id2ex_inst_arth_lgc_o    =   inst_arth_lgc_r;   
    assign id2ex_inst_auipc_o       =   inst_auipc_r;
    assign id2ex_alu_op_o           =   alu_op_r;

    assign id2ex_inst_csr_o         =   inst_csr_r;
    assign id2ex_inst_load_o        =   inst_load_r;
    assign id2ex_mem_write_o        =   mem_write_r;
    assign id2ex_mem_read_o         =   mem_read_r;
    assign id2ex_store_type_o       =   store_type_r;
    assign id2ex_load_type_o        =   load_type_r;
    assign id2ex_csr_ctrl_o         =   csr_ctrl_r;
    assign id2ex_inst_ecall_o       =   inst_ecall_r;
    assign id2ex_inst_ebreak_o      =   inst_ebreak_r;
    assign id2ex_inst_mret_o        =   inst_mret_r;
    assign id2ex_inst_trap_o        =   inst_trap_r;

    assign id2ex_jumpbranch_en_o    =   jumpbranch_en_r;

    `ifdef YSYX210092_DEFINE_PUTCH
    assign id2ex_inst_selfdefine_o  =   inst_selfdefine_r;
    `endif

    `ifdef YSYX210092_DEFINE_DIFFTEST
    assign id2ex_inst_o             =   inst_r;
    `endif
    assign id2ex_rs1_data_o         =   rs1_data_r;
    assign id2ex_rs2_data_o         =   rs2_data_r;
    assign id2ex_imm_data_o         =   imm_data_r;
    assign id2ex_rd_data_o          =   rd_data_r;
    assign id2ex_inst_addr_o        =   inst_addr_r;
    assign id2ex_jumpbranch_addr_o  =   jumpbranch_addr_r;

    assign flush_en                 =   id2ex_id_flush_i & id2ex_inst_valid_i;
    assign stall_en                 =   id2ex_ex_stall_i & id2ex_inst_valid_i;
    assign flow_en                  =   id2ex_inst_valid_i;

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            rs1_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( stall_en ) begin
            rs1_index_r <= rs1_index_r;
        end
        else if( flow_en ) begin
            rs1_index_r <= id2ex_rs1_index_i;
        end
        else begin
            rs1_index_r <= rs1_index_r;
        end
    end
    
    always @( posedge clk ) begin
        if( rst ) begin
            rs2_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            rs2_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( stall_en ) begin
            rs2_index_r <= rs2_index_r;
        end
        else if( flow_en ) begin
            rs2_index_r <= id2ex_rs2_index_i;
        end
        else begin
            rs2_index_r <= rs2_index_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rd_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            rd_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( stall_en ) begin
            rd_index_r <= rd_index_r;
        end
        else if( flow_en ) begin
            rd_index_r <= id2ex_rd_index_i;
        end
        else begin
            rd_index_r <= rd_index_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            csr_index_r <= `YSYX210092_CSR_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            csr_index_r <= `YSYX210092_CSR_INDEX_SIZE'b0;
        end
        else if( stall_en ) begin
            csr_index_r <= csr_index_r;
        end
        else if( flow_en ) begin
            csr_index_r <= id2ex_csr_index_i;
        end
        else begin
            csr_index_r <= csr_index_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_nop_r <= 1'b1;
        end
        else if( flush_en ) begin
            inst_nop_r <= 1'b1;
        end
        else if( stall_en ) begin
            inst_nop_r <= inst_nop_r;
        end
        else if( flow_en ) begin
            inst_nop_r <= id2ex_inst_nop_i;
        end
        else begin
            inst_nop_r <= inst_nop_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_en_r <= 1'b0;        
        end
        else if( flush_en ) begin
            rs1_en_r <= 1'b0;
        end
        else if( stall_en ) begin
            rs1_en_r <= rs1_en_r;
        end
        else if( flow_en ) begin
            rs1_en_r <= id2ex_rs1_en_i;
        end
        else begin
            rs1_en_r <= rs1_en_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rs2_en_r <= 1'b0;        
        end
        else if( flush_en ) begin
            rs2_en_r <= 1'b0;
        end
        else if( stall_en ) begin
            rs2_en_r <= rs2_en_r;
        end
        else if( flow_en ) begin
            rs2_en_r <= id2ex_rs2_en_i;
        end
        else begin
            rs2_en_r <= rs2_en_r;
        end
    end
    
    always @( posedge clk ) begin
        if( rst ) begin
            rd_en_r <= 1'b0;        
        end
        else if( flush_en ) begin
            rd_en_r <= 1'b0;
        end
        else if( stall_en ) begin
            rd_en_r <= rd_en_r;
        end
        else if( flow_en ) begin
            rd_en_r <= id2ex_rd_en_i;
        end
        else begin
            rd_en_r <= rd_en_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_jump_r <= 1'b0;        
        end
        else if( flush_en ) begin
            inst_jump_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_jump_r <= inst_jump_r;
        end
        else if( flow_en ) begin
            inst_jump_r <= id2ex_inst_jump_i;
        end
        else begin
            inst_jump_r <= inst_jump_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_branch_r <= 1'b0;
        end
        else if( flush_en ) begin
            inst_branch_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_branch_r <= inst_branch_r;
        end
        else if( flow_en ) begin
            inst_branch_r <= id2ex_inst_branch_i;
        end
        else begin
            inst_branch_r <= inst_branch_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_word_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_word_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_word_r <= inst_word_r;
        end
        else if( flow_en ) begin
            inst_word_r <= id2ex_inst_word_i;
        end
        else begin
            inst_word_r <= inst_word_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_slt_nu_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_slt_nu_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_slt_nu_r <= inst_slt_nu_r;
        end
        else if( flow_en ) begin
            inst_slt_nu_r <= id2ex_inst_slt_nu_i;
        end
        else begin
            inst_slt_nu_r <= inst_slt_nu_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_slt_u_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_slt_u_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_slt_u_r <= inst_slt_u_r;
        end
        else if( flow_en ) begin
            inst_slt_u_r <= id2ex_inst_slt_u_i;
        end
        else begin
            inst_slt_u_r <= inst_slt_u_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_shift_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_shift_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_shift_r <= inst_shift_r;
        end
        else if( flow_en ) begin
            inst_shift_r <= id2ex_inst_shift_i;
        end
        else begin
            inst_shift_r <= inst_shift_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            alu_src_pc_r <= 1'b1;   
        end
        else if( flush_en ) begin
            alu_src_pc_r <= 1'b1;
        end
        else if( stall_en ) begin
            alu_src_pc_r <= alu_src_pc_r;
        end
        else if( flow_en ) begin
            alu_src_pc_r <= id2ex_alu_src_pc_i;
        end
        else begin
            alu_src_pc_r <= alu_src_pc_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            alu_src_imm_r <= 1'b0;   
        end
        else if( flush_en ) begin
            alu_src_imm_r <= 1'b0;
        end
        else if( stall_en ) begin
            alu_src_imm_r <= alu_src_imm_r;
        end
        else if( flow_en ) begin
            alu_src_imm_r <= id2ex_alu_src_imm_i;
        end
        else begin
            alu_src_imm_r <= alu_src_imm_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            shift_num_src_r <= 1'b0;   
        end
        else if( flush_en ) begin
            shift_num_src_r <= 1'b0;
        end
        else if( stall_en ) begin
            shift_num_src_r <= shift_num_src_r;
        end
        else if( flow_en ) begin
            shift_num_src_r <= id2ex_shift_num_src_i;
        end
        else begin
            shift_num_src_r <= shift_num_src_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            shift_type_r <= 3'b0;   
        end
        else if( flush_en ) begin
            shift_type_r <= 3'b0;
        end
        else if( stall_en ) begin
            shift_type_r <= shift_type_r;
        end
        else if( flow_en ) begin
            shift_type_r <= id2ex_shift_type_i;
        end
        else begin
            shift_type_r <= shift_type_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_arth_lgc_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_arth_lgc_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_arth_lgc_r <= inst_arth_lgc_r;
        end
        else if( flow_en ) begin
            inst_arth_lgc_r <= id2ex_inst_arth_lgc_i;
        end
        else begin
            inst_arth_lgc_r <= inst_arth_lgc_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_auipc_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_auipc_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_auipc_r <= inst_auipc_r;
        end
        else if( flow_en ) begin
            inst_auipc_r <= id2ex_inst_auipc_i;
        end
        else begin
            inst_auipc_r <= inst_auipc_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            alu_op_r <= 3'b0;   
        end
        else if( flush_en ) begin
            alu_op_r <= 3'b0;
        end
        else if( stall_en ) begin
            alu_op_r <= alu_op_r;
        end
        else if( flow_en ) begin
            alu_op_r <= id2ex_alu_op_i;
        end
        else begin
            alu_op_r <= alu_op_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_csr_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_csr_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_csr_r <= inst_csr_r;
        end
        else if( flow_en ) begin
            inst_csr_r <= id2ex_inst_csr_i;
        end
        else begin
            inst_csr_r <= inst_csr_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_load_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_load_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_load_r <= inst_load_r;
        end
        else if( flow_en ) begin
            inst_load_r <= id2ex_inst_load_i;
        end
        else begin
            inst_load_r <= inst_load_r;
        end
    end 

    always @( posedge clk ) begin
        if( rst ) begin
            mem_write_r <= 1'b0;   
        end
        else if( flush_en ) begin
            mem_write_r <= 1'b0;
        end
        else if( stall_en ) begin
            mem_write_r <= mem_write_r;
        end
        else if( flow_en ) begin
            mem_write_r <= id2ex_mem_write_i;
        end
        else begin
            mem_write_r <= mem_write_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            mem_read_r <= 1'b0;   
        end
        else if( flush_en ) begin
            mem_read_r <= 1'b0;
        end
        else if( stall_en ) begin
            mem_read_r <= mem_read_r;
        end
        else if( flow_en ) begin
            mem_read_r <= id2ex_mem_read_i;
        end
        else begin
            mem_read_r <= mem_read_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            store_type_r <= 3'b0;   
        end
        else if( flush_en ) begin
            store_type_r <= 3'b0;
        end
        else if( stall_en ) begin
            store_type_r <= store_type_r;
        end
        else if( flow_en ) begin
            store_type_r <= id2ex_store_type_i;
        end
        else begin
            store_type_r <= store_type_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            load_type_r <= 3'b0;   
        end
        else if( flush_en ) begin
            load_type_r <= 3'b0;
        end
        else if( stall_en ) begin
            load_type_r <= load_type_r;
        end
        else if( flow_en ) begin
            load_type_r <= id2ex_load_type_i;
        end
        else begin
            load_type_r <= load_type_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            csr_ctrl_r <= 3'b100;   
        end
        else if( flush_en ) begin
            csr_ctrl_r <= 3'b100;
        end
        else if( stall_en ) begin
            csr_ctrl_r <= csr_ctrl_r;
        end
        else if( flow_en ) begin
            csr_ctrl_r <= id2ex_csr_ctrl_i;
        end
        else begin
            csr_ctrl_r <= csr_ctrl_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_ecall_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_ecall_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_ecall_r <= inst_ecall_r;
        end
        else if( flow_en ) begin
            inst_ecall_r <= id2ex_inst_ecall_i;
        end
        else begin
            inst_ecall_r <= inst_ecall_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_ebreak_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_ebreak_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_ebreak_r <= inst_ebreak_r;
        end
        else if( flow_en ) begin
            inst_ebreak_r <= id2ex_inst_ebreak_i;
        end
        else begin
            inst_ebreak_r <= inst_ebreak_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_mret_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_mret_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_mret_r <= inst_mret_r;
        end
        else if( flow_en ) begin
            inst_mret_r <= id2ex_inst_mret_i;
        end
        else begin
            inst_mret_r <= inst_mret_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_trap_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_trap_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_trap_r <= inst_trap_r;
        end
        else if( flow_en ) begin
            inst_trap_r <= id2ex_inst_trap_i;
        end
        else begin
            inst_trap_r <= inst_trap_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            jumpbranch_en_r <= 1'b0;   
        end
        else if( flush_en ) begin
            jumpbranch_en_r <= 1'b0;
        end
        else if( stall_en ) begin
            jumpbranch_en_r <= jumpbranch_en_r;
        end
        else if( flow_en ) begin
            jumpbranch_en_r <= id2ex_jumpbranch_en_i;
        end
        else begin
            jumpbranch_en_r <= jumpbranch_en_r;
        end
    end

    `ifdef YSYX210092_DEFINE_PUTCH
    always @( posedge clk ) begin
        if( rst ) begin
            inst_selfdefine_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_selfdefine_r <= 1'b0;
        end
        else if( stall_en ) begin
            inst_selfdefine_r <= inst_selfdefine_r;
        end
        else if( flow_en ) begin
            inst_selfdefine_r <= id2ex_inst_selfdefine_i;
        end
        else begin
            inst_selfdefine_r <= inst_selfdefine_r;
        end
    end
    `endif

    `ifdef YSYX210092_DEFINE_DIFFTEST
    always @( posedge clk ) begin
        if( rst ) begin
            inst_r <= `YSYX210092_INST_NOP;   
        end
        else if( flush_en ) begin
            inst_r <= `YSYX210092_INST_NOP;
        end
        else if( stall_en ) begin
            inst_r <= inst_r;
        end
        else if( flow_en ) begin
            inst_r <= id2ex_inst_i;
        end
        else begin
            inst_r <= inst_r;
        end
    end
    `endif

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            rs1_data_r <= 64'b0;
        end
        else if( stall_en ) begin
            rs1_data_r <= rs1_data_r;
        end
        else if( flow_en ) begin
            rs1_data_r <= id2ex_rs1_data_i;
        end
        else begin
            rs1_data_r <= rs1_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rs2_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            rs2_data_r <= 64'b0;
        end
        else if( stall_en ) begin
            rs2_data_r <= rs2_data_r;
        end
        else if( flow_en ) begin
            rs2_data_r <= id2ex_rs2_data_i;
        end
        else begin
            rs2_data_r <= rs2_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            imm_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            imm_data_r <= 64'b0;
        end
        else if( stall_en ) begin
            imm_data_r <= imm_data_r;
        end
        else if( flow_en ) begin
            imm_data_r <= id2ex_imm_data_i;
        end
        else begin
            imm_data_r <= imm_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rd_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            rd_data_r <= 64'b0;
        end
        else if( stall_en ) begin
            rd_data_r <= rd_data_r;
        end
        else if( flow_en ) begin
            rd_data_r <= id2ex_rd_data_i;
        end
        else begin
            rd_data_r <= rd_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_addr_r <= 64'b0;   
        end
        else if( flush_en ) begin
            inst_addr_r <= 64'b0;
        end
        else if( stall_en ) begin
            inst_addr_r <= inst_addr_r;
        end
        else if( flow_en ) begin
            inst_addr_r <= id2ex_inst_addr_i;
        end
        else begin
            inst_addr_r <= inst_addr_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            jumpbranch_addr_r <= 64'b0;   
        end
        else if( flush_en ) begin
            jumpbranch_addr_r <= 64'b0;
        end
        else if( stall_en ) begin
            jumpbranch_addr_r <= jumpbranch_addr_r;
        end
        else if( flow_en ) begin
            jumpbranch_addr_r <= id2ex_jumpbranch_addr_i;
        end
        else begin
            jumpbranch_addr_r <= jumpbranch_addr_r;
        end
    end

endmodule
module ysyx_210092_ex_wordgen (
    /* control signals */
    input                       ex_wordgen_inst_word_i, 

    /* data */
    input   [`YSYX210092_DATA_BUS]         ex_wordgen_wordgen_src_data_i,

    /* output */
    output  [`YSYX210092_DATA_BUS]         ex_wordgen_res_data_o
);

    wire    [`YSYX210092_DATA_BUS]         wordgen_res_data_pre;

    assign wordgen_res_data_pre     =   { { 32 { ex_wordgen_wordgen_src_data_i[31] } }, ex_wordgen_wordgen_src_data_i[31:0] };

    assign ex_wordgen_res_data_o    =   ex_wordgen_inst_word_i ? wordgen_res_data_pre: `YSYX210092_ZERO_DWORD;
    
endmodule

module ysyx_210092_ex_alu(
    /* control signals */
    input   [`YSYX210092_ALU_OP_BUS]       ex_alu_alu_op_i,
    input                       ex_alu_inst_slt_nu_i,
    input                       ex_alu_inst_slt_u_i,
    /* data signals*/
    input   [`YSYX210092_DATA_BUS]         ex_alu_op1_i,
    input   [`YSYX210092_DATA_BUS]         ex_alu_op2_i,

    output  [`YSYX210092_DATA_BUS]         ex_alu_res_data_o
);

    /* rename */
    wire    [`YSYX210092_ALU_OP_BUS]       alu_op;
    wire                        inst_slt_nu;
    wire                        inst_slt_u;

    wire    [`YSYX210092_DATA_BUS]         op1;
    wire    [`YSYX210092_DATA_BUS]         op2;

    wire    [`YSYX210092_DATA_BUS]         alu_res_data;
    /* rename */

    wire                        alu_add;
    wire                        alu_sub;
    wire                        alu_xor;
    wire                        alu_or;
    wire                        alu_and;
    wire                        inst_sltxx;
    wire                        op_signed;

    wire    [`YSYX210092_DATA_EXTEND_BUS]  extended_op1;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  extended_op2;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  alu_arh_res;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  alu_xor_res;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  alu_or_res;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  alu_and_res;
    wire    [`YSYX210092_DATA_EXTEND_BUS]  alu_res_data_pre;
    
    /* rename */
    assign alu_op               =   ex_alu_alu_op_i;
    assign inst_slt_nu          =   ex_alu_inst_slt_nu_i;
    assign inst_slt_u           =   ex_alu_inst_slt_u_i;

    assign op1                  =   ex_alu_op1_i;
    assign op2                  =   ex_alu_op2_i;
    
    assign ex_alu_res_data_o    =   alu_res_data;
    /* rename */

    assign alu_add              =   alu_op == 3'b011;
    assign alu_sub              =   alu_op == 3'b100;
    assign alu_xor              =   alu_op == 3'b101;
    assign alu_or               =   alu_op == 3'b110;
    assign alu_and              =   alu_op == 3'b111;
    assign inst_sltxx           =   inst_slt_nu | inst_slt_u;
    assign op_signed            =   ~inst_slt_u;

    assign extended_op1         =   { op_signed & op1[63], op1 };
    assign extended_op2         =   { op_signed & op2[63], op2 };

    assign alu_arh_res          =   extended_op1 + ( alu_sub? ( ~extended_op2 + `YSYX210092_DATA_EXTEND_SIZE'b1 ): extended_op2 );
    assign alu_xor_res          =   extended_op1 ^ extended_op2;
    assign alu_or_res           =   extended_op1 | extended_op2;
    assign alu_and_res          =   extended_op1 & extended_op2;

    assign alu_res_data_pre     =   `YSYX210092_DATA_EXTEND_SIZE'b0
                                    | { `YSYX210092_DATA_EXTEND_SIZE { alu_add | ( alu_sub & ~inst_sltxx ) } } & alu_arh_res
                                    | { `YSYX210092_DATA_EXTEND_SIZE { alu_xor } } & alu_xor_res
                                    | { `YSYX210092_DATA_EXTEND_SIZE { alu_or } } & alu_or_res
                                    | { `YSYX210092_DATA_EXTEND_SIZE { alu_and } } & alu_and_res
                                    | { `YSYX210092_DATA_EXTEND_SIZE { inst_sltxx  } } & { 64'b0, alu_arh_res[64]==1'b1 }; 
    assign alu_res_data         =   alu_res_data_pre[63:0];
endmodule
module ysyx_210092_ex_shifter(
    /* control signals */
    input   [`YSYX210092_SHIFT_TYPE_BUS]   ex_shifter_shift_type_i,
    
    /* data signals*/
    input   [`YSYX210092_DATA_BUS]         ex_shifter_shifted_data_i,
    input   [`YSYX210092_DATA_BUS]         ex_shifter_shift_num_i,

    output  [`YSYX210092_DATA_BUS]         ex_shifter_res_data_o
);
    /* rename */
    wire    [`YSYX210092_SHIFT_TYPE_BUS]   shift_type;
    
    /* data signals*/
    wire    [`YSYX210092_DATA_BUS]         shifted_data;
    wire    [`YSYX210092_DATA_BUS]         shift_num;

    wire    [`YSYX210092_DATA_BUS]         shifter_res_data;
    /* rename */

    wire                        shift_word;
    wire                        shift_sllx;
    wire                        shift_srxx;
    wire                        shift_srax;
    wire                        shift_srlx;
    // wire                        shift_srl;
    wire                        shift_srlw;

    wire    [`YSYX210092_IMM_SHIFT_BUS]    shift_num_eff;
    wire    [`YSYX210092_DATA_BUS]         shift_src;
    wire    [`YSYX210092_DATA_BUS]         shift_src_pre;
    wire    [`YSYX210092_DATA_BUS]         shift_res;
    wire    [`YSYX210092_DATA_BUS]         shift_sllx_res;
    wire    [`YSYX210092_DATA_BUS]         shift_srax_res;
    wire    [`YSYX210092_DATA_BUS]         shift_srlx_res;
    wire    [`YSYX210092_DATA_BUS]         shift_eff_mask;

    /* rename */
    assign shift_type               =   ex_shifter_shift_type_i;


    assign shifted_data             =   ex_shifter_shifted_data_i;
    assign shift_num                =   ex_shifter_shift_num_i;

    assign ex_shifter_res_data_o    =   shifter_res_data;
    /* rename */
    assign shift_word               =   ( shift_type[2:1] == 2'b11 ) | ( shift_sllx & ( shift_type[1] == 1'b1) );
    assign shift_sllx               =   ~shift_type[2] & shift_type[0]; //( shift_type[2]  == 1'b0 ) && ( shift_type[0] == 1'b1 );
    assign shift_srxx               =   shift_type[2]  == 1'b1;
    assign shift_srax               =   shift_srxx & ( shift_type[0] == 1'b0 ); 
    assign shift_srlx               =   shift_srxx & ( shift_type[0] == 1'b1 );
    // assign shift_srl                =   shift_srlx & ~shift_word;
    assign shift_srlw               =   shift_srlx & shift_word;

    assign shift_num_eff            =   shift_word? { 1'b0, shift_num[4:0] }: shift_num[5:0];

    assign shift_src_pre            =   ( shift_srlw & ( shift_num_eff != 6'b0 ) )? { 32'b0, shifted_data[31:0] }: shifted_data;
        // shifter的输入已经进行了字扩展， 只有进行srlw操作且位数不为0时才会出现扩展位一定是0的情况。
        // 其他情况下符号位一定与扩展出的高位一致，而最高位的问题将由后续的字扩展解决。
    // 此处实现参考了E203   
    assign shift_src                =   shift_srxx? { shift_src_pre[00], shift_src_pre[01], shift_src_pre[02], shift_src_pre[03], 
                                                      shift_src_pre[04], shift_src_pre[05], shift_src_pre[06], shift_src_pre[07], 
                                                      shift_src_pre[08], shift_src_pre[09], shift_src_pre[10], shift_src_pre[11], 
                                                      shift_src_pre[12], shift_src_pre[13], shift_src_pre[14], shift_src_pre[15],
                                                      shift_src_pre[16], shift_src_pre[17], shift_src_pre[18], shift_src_pre[19],
                                                      shift_src_pre[20], shift_src_pre[21], shift_src_pre[22], shift_src_pre[23],
                                                      shift_src_pre[24], shift_src_pre[25], shift_src_pre[26], shift_src_pre[27], 
                                                      shift_src_pre[28], shift_src_pre[29], shift_src_pre[30], shift_src_pre[31],
                                                      shift_src_pre[32], shift_src_pre[33], shift_src_pre[34], shift_src_pre[35],
                                                      shift_src_pre[36], shift_src_pre[37], shift_src_pre[38], shift_src_pre[39],
                                                      shift_src_pre[40], shift_src_pre[41], shift_src_pre[42], shift_src_pre[43],
                                                      shift_src_pre[44], shift_src_pre[45], shift_src_pre[46], shift_src_pre[47],
                                                      shift_src_pre[48], shift_src_pre[49], shift_src_pre[50], shift_src_pre[51],
                                                      shift_src_pre[52], shift_src_pre[53], shift_src_pre[54], shift_src_pre[55],
                                                      shift_src_pre[56], shift_src_pre[57], shift_src_pre[58], shift_src_pre[59],
                                                      shift_src_pre[60], shift_src_pre[61], shift_src_pre[62], shift_src_pre[63]
                                                    }
                                                    : shift_src_pre;                                   
    assign shift_res                =   shift_src << shift_num_eff;
    assign shift_sllx_res           =   shift_res;
    assign shift_srlx_res           =   { shift_res[00], shift_res[01], shift_res[02], shift_res[03], 
                                          shift_res[04], shift_res[05], shift_res[06], shift_res[07], 
                                          shift_res[08], shift_res[09], shift_res[10], shift_res[11], 
                                          shift_res[12], shift_res[13], shift_res[14], shift_res[15],
                                          shift_res[16], shift_res[17], shift_res[18], shift_res[19],
                                          shift_res[20], shift_res[21], shift_res[22], shift_res[23],
                                          shift_res[24], shift_res[25], shift_res[26], shift_res[27], 
                                          shift_res[28], shift_res[29], shift_res[30], shift_res[31],
                                          shift_res[32], shift_res[33], shift_res[34], shift_res[35],
                                          shift_res[36], shift_res[37], shift_res[38], shift_res[39],
                                          shift_res[40], shift_res[41], shift_res[42], shift_res[43],
                                          shift_res[44], shift_res[45], shift_res[46], shift_res[47],
                                          shift_res[48], shift_res[49], shift_res[50], shift_res[51],
                                          shift_res[52], shift_res[53], shift_res[54], shift_res[55],
                                          shift_res[56], shift_res[57], shift_res[58], shift_res[59],
                                          shift_res[60], shift_res[61], shift_res[62], shift_res[63]
                                        };
    assign shift_srax_res           = shift_word? shift_srlx_res: ( ( shift_srlx_res & shift_eff_mask ) | ( { `YSYX210092_DATA_BUS_SIZE { shift_src[0] } } & ~shift_eff_mask ) );
    assign shift_eff_mask           = ( ~( `YSYX210092_DATA_BUS_SIZE'b0) ) >> shift_num_eff;

    assign shifter_res_data         = `YSYX210092_ZERO_DWORD | ( { 64 { shift_sllx } } & shift_sllx_res ) 
                                                  | ( { 64 { shift_srax } } & shift_srax_res )
                                                  | ( { 64 { shift_srlx } } & shift_srlx_res );  
endmodule
module ysyx_210092_ex_core(
    /* control signals */
    input   [`YSYX210092_ALU_OP_BUS]       ex_core_alu_op_i,
    input                       ex_core_inst_slt_nu_i,
    input                       ex_core_inst_slt_u_i,
    input   [`YSYX210092_SHIFT_TYPE_BUS]   ex_core_shift_type_i,
    input                       ex_core_shift_num_src,
    input                       ex_core_inst_word_i,
    input                       ex_core_alu_src_pc_i,
    input                       ex_core_alu_src_imm_i,
    input                       ex_core_inst_shift_i,
    /* data signals*/
    input   [`YSYX210092_INST_ADDR_BUS]    ex_core_inst_addr_i,
    input   [`YSYX210092_DATA_BUS]         ex_core_rs1_data_i,
    input   [`YSYX210092_DATA_BUS]         ex_core_rs2_data_i,
    input   [`YSYX210092_DATA_BUS]         ex_core_imm_data_i,

    output  [`YSYX210092_DATA_BUS]         ex_core_res_data_o
);
    wire    [`YSYX210092_DATA_BUS]         ex_alu_op1_i;
    wire    [`YSYX210092_DATA_BUS]         ex_alu_op2_i;
    wire    [`YSYX210092_DATA_BUS]         ex_alu_res_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex_shifter_shift_num_i;
    wire    [`YSYX210092_DATA_BUS]         ex_shifter_res_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex_wordgen_rs1_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex_wordgen_rs2_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex_wordgen_res_pre_data_o;

    wire    [`YSYX210092_DATA_BUS]         rs1_data;
    wire    [`YSYX210092_DATA_BUS]         rs2_data;
    wire    [`YSYX210092_DATA_BUS]         res_pre;

    assign { rs1_data, rs2_data }   =   ex_core_inst_word_i? { ex_wordgen_rs1_data_o, ex_wordgen_rs2_data_o }:
                                            { ex_core_rs1_data_i, ex_core_rs2_data_i };
    assign ex_alu_op1_i             =   ( ex_core_alu_src_pc_i == 1'b0 ) ? ex_core_inst_addr_i: rs1_data;
    assign ex_alu_op2_i             =   ex_core_alu_src_imm_i? ex_core_imm_data_i: rs2_data;
    assign ex_shifter_shift_num_i   =   ex_core_shift_num_src? ex_core_imm_data_i: ex_core_rs2_data_i;

    assign res_pre                  =   ex_core_inst_shift_i? ex_shifter_res_data_o: ex_alu_res_data_o;
    assign ex_core_res_data_o       =   ex_core_inst_word_i? ex_wordgen_res_pre_data_o: res_pre;

    ysyx_210092_ex_alu my_ex_alu(
        /* control signals */
        .ex_alu_alu_op_i( ex_core_alu_op_i ),
        .ex_alu_inst_slt_nu_i( ex_core_inst_slt_nu_i ),
        .ex_alu_inst_slt_u_i( ex_core_inst_slt_u_i ),
        /* data signals*/
        .ex_alu_op1_i( ex_alu_op1_i ),
        .ex_alu_op2_i( ex_alu_op2_i ),

        .ex_alu_res_data_o( ex_alu_res_data_o )
    );

    ysyx_210092_ex_shifter my_ex_shifter(
        /* control signals */
        .ex_shifter_shift_type_i( ex_core_shift_type_i ),

        /* data signals*/
        .ex_shifter_shifted_data_i( rs1_data ),
        .ex_shifter_shift_num_i( ex_shifter_shift_num_i ),

        .ex_shifter_res_data_o( ex_shifter_res_data_o )
    );

    ysyx_210092_ex_wordgen rs1_ex_wordgen(
        /* control signals */
        .ex_wordgen_inst_word_i( ex_core_inst_word_i ), 

        /* data */
        .ex_wordgen_wordgen_src_data_i( ex_core_rs1_data_i ),

        /* output */
        .ex_wordgen_res_data_o( ex_wordgen_rs1_data_o )
    );

    ysyx_210092_ex_wordgen rs2_ex_wordgen(
        /* control signals */
        .ex_wordgen_inst_word_i( ex_core_inst_word_i ), 

        /* data */
        .ex_wordgen_wordgen_src_data_i( ex_core_rs2_data_i ),

        /* output */
        .ex_wordgen_res_data_o( ex_wordgen_rs2_data_o )
    );

    ysyx_210092_ex_wordgen res_pre_ex_wordgen(
        /* control signals */
        .ex_wordgen_inst_word_i( ex_core_inst_word_i ), 

        /* data */
        .ex_wordgen_wordgen_src_data_i( res_pre ),

        /* output */
        .ex_wordgen_res_data_o( ex_wordgen_res_pre_data_o)
    );
    
endmodule
module ysyx_210092_ex_forward(
    input                       ex_forward_mem_write_i,
    input                       ex_forward_mem_read_i,
    input                       ex_forward_inst_arth_lgc_i,
    input                       ex_forward_inst_csr_i,

    input                       ex_forward_id2ex_rs1_en_i,
    input                       ex_forward_id2ex_rs2_en_i,
    input                       ex_forward_ex2mem_rd_en_i,
    input                       ex_forward_mem2wb_rd_en_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_forward_id2ex_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_forward_id2ex_rs2_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_forward_ex2mem_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_forward_mem2wb_rd_index_i,

    output                      ex_forward_ex_rs1_src_id2ex_o,
    output                      ex_forward_ex_rs1_src_ex2mem_o,
    output                      ex_forward_ex_rs1_src_mem2wb_o,
    output                      ex_forward_ex_rs2_src_id2ex_o,
    output                      ex_forward_ex_rs2_src_ex2mem_o,
    output                      ex_forward_ex_rs2_src_mem2wb_o
);
    wire                        ex_forward_ex_rs1_src_ex2mem_n;
    wire                        ex_forward_ex_rs1_src_mem2wb_n;
    wire                        ex_forward_ex_rs2_src_ex2mem_n;
    wire                        ex_forward_ex_rs2_src_mem2wb_n;
    wire                        inst_mem_arth_lgc;
    wire                        inst_mem_arth_lgc_csr;

    assign ex_forward_ex_rs1_src_ex2mem_n   =   ~ex_forward_ex_rs1_src_ex2mem_o;
    assign ex_forward_ex_rs1_src_mem2wb_n   =   ~ex_forward_ex_rs1_src_mem2wb_o;

    assign ex_forward_ex_rs2_src_ex2mem_n   =   ~ex_forward_ex_rs2_src_ex2mem_o;
    assign ex_forward_ex_rs2_src_mem2wb_n   =   ~ex_forward_ex_rs2_src_mem2wb_o;
    
    assign inst_mem_arth_lgc                =   ex_forward_mem_write_i | ex_forward_mem_read_i | ex_forward_inst_arth_lgc_i;
    assign inst_mem_arth_lgc_csr            =   inst_mem_arth_lgc | ex_forward_inst_csr_i;
    assign ex_forward_ex_rs1_src_id2ex_o    =   ex_forward_ex_rs1_src_ex2mem_n & ex_forward_ex_rs1_src_mem2wb_n;
    assign ex_forward_ex_rs1_src_ex2mem_o   =   ( ex_forward_ex2mem_rd_index_i != `YSYX210092_REG_INDEX_SIZE'b0 ) 
                                                & ex_forward_ex2mem_rd_index_i == ex_forward_id2ex_rs1_index_i
                                                & ex_forward_id2ex_rs1_en_i & ex_forward_ex2mem_rd_en_i
                                                & inst_mem_arth_lgc;
    assign ex_forward_ex_rs1_src_mem2wb_o   =   ( ex_forward_mem2wb_rd_index_i != `YSYX210092_REG_INDEX_SIZE'b0 )  
                                                & ex_forward_mem2wb_rd_index_i == ex_forward_id2ex_rs1_index_i
                                                & ex_forward_ex_rs1_src_ex2mem_n & ex_forward_id2ex_rs1_en_i 
                                                & ex_forward_mem2wb_rd_en_i
                                                & inst_mem_arth_lgc_csr;

    assign ex_forward_ex_rs2_src_id2ex_o    =   ex_forward_ex_rs2_src_ex2mem_n & ex_forward_ex_rs2_src_mem2wb_n;
    assign ex_forward_ex_rs2_src_ex2mem_o   =   ( ex_forward_ex2mem_rd_index_i != `YSYX210092_REG_INDEX_SIZE'b0 ) 
                                                & ex_forward_ex2mem_rd_index_i == ex_forward_id2ex_rs2_index_i
                                                & ex_forward_id2ex_rs2_en_i & ex_forward_ex2mem_rd_en_i
                                                & ex_forward_inst_arth_lgc_i;
    assign ex_forward_ex_rs2_src_mem2wb_o   =   ( ex_forward_mem2wb_rd_index_i != `YSYX210092_REG_INDEX_SIZE'b0 )  
                                                & ex_forward_mem2wb_rd_index_i == ex_forward_id2ex_rs2_index_i
                                                & ex_forward_ex_rs2_src_ex2mem_n & ex_forward_id2ex_rs2_en_i 
                                                & ex_forward_mem2wb_rd_en_i
                                                & ( ex_forward_inst_arth_lgc_i | ex_forward_mem_write_i );
endmodule
module ysyx_210092_ex_top(
    input                       clk,
    input                       rst,

    /* control signals */
    input                       ex_top_inst_valid_i,

    input                       ex_top_rs1_buffered_i,
    input                       ex_top_rs2_buffered_i,
    input                       ex_top_rs1_src_buffer_i,
    input                       ex_top_rs2_src_buffer_i,

    input                       ex_top_id2ex_rs1_en_i,
    input                       ex_top_id2ex_rs2_en_i,
    input                       ex_top_ex2mem_rd_en_i,
    input                       ex_top_mem2wb_rd_en_i,

    input                       ex_top_inst_csr_i,
    input                       ex_top_inst_word_i,
    input                       ex_top_inst_slt_nu_i,
    input                       ex_top_inst_slt_u_i,
    input                       ex_top_inst_shift_i,
    input                       ex_top_alu_src_pc_i,
    input                       ex_top_alu_src_imm_i,
    input                       ex_top_shift_num_src_i,
    input   [`YSYX210092_SHIFT_TYPE_BUS]   ex_top_shift_type_i,
    input                       ex_top_inst_arth_lgc_i,
    input                       ex_top_inst_auipc_i,
    input   [`YSYX210092_ALU_OP_BUS]       ex_top_alu_op_i,

    input                       ex_top_mem_read_i,
    input                       ex_top_mem_write_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_top_id2ex_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_top_id2ex_rs2_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_top_ex2mem_rd_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex_top_mem2wb_rd_index_i,


    output                      ex_top_ex_rs1_src_ex2mem_o,
    output                      ex_top_ex_rs2_src_ex2mem_o,
    output                      ex_top_ex_rs1_src_mem2wb_o,
    output                      ex_top_ex_rs2_src_mem2wb_o,

    /* data signals */
    input   [`YSYX210092_DATA_BUS]         ex_top_imm_data_i,
    input   [`YSYX210092_REG_BUS]          ex_top_id2ex_rs1_data_i,
    input   [`YSYX210092_REG_BUS]          ex_top_id2ex_rs2_data_i,
    input   [`YSYX210092_REG_BUS]          ex_top_id2ex_rd_data_i,
    input   [`YSYX210092_REG_BUS]          ex_top_ex2mem_rd_data_i,
    input   [`YSYX210092_REG_BUS]          ex_top_mem2wb_rd_data_i,
    input   [`YSYX210092_INST_ADDR_BUS]    ex_top_inst_addr_i,

    output  [`YSYX210092_DATA_BUS]         ex_top_rs1_data_o,
    output  [`YSYX210092_DATA_BUS]         ex_top_rs2_data_o,
    output  [`YSYX210092_DATA_BUS]         ex_top_rd_data_o
);
    wire                        ex_forward_ex_rs1_src_id2ex_o;
    wire                        ex_forward_ex_rs1_src_ex2mem_o;
    wire                        ex_forward_ex_rs1_src_mem2wb_o;
    wire                        ex_forward_ex_rs2_src_id2ex_o;
    wire                        ex_forward_ex_rs2_src_ex2mem_o;
    wire                        ex_forward_ex_rs2_src_mem2wb_o;
    wire    [`YSYX210092_DATA_BUS]         ex_core_res_data_o;
    wire    [`YSYX210092_DATA_BUS]         rs1_data_pre;
    wire    [`YSYX210092_DATA_BUS]         rs2_data_pre;
    wire    [`YSYX210092_DATA_BUS]         rs1_data;
    wire    [`YSYX210092_DATA_BUS]         rs2_data;
    reg     [`YSYX210092_DATA_BUS]         rs1_data_r;
    reg     [`YSYX210092_DATA_BUS]         rs2_data_r;

    assign rs1_data_pre                 =     ( { 64 { ex_forward_ex_rs1_src_id2ex_o } } & ex_top_id2ex_rs1_data_i ) 
                                            | ( { 64 { ex_forward_ex_rs1_src_ex2mem_o } } & ex_top_ex2mem_rd_data_i)
                                            | ( { 64 { ex_forward_ex_rs1_src_mem2wb_o } } & ex_top_mem2wb_rd_data_i );

    assign rs2_data_pre                 =     ( { 64 { ex_forward_ex_rs2_src_id2ex_o } } & ex_top_id2ex_rs2_data_i ) 
                                            | ( { 64 { ex_forward_ex_rs2_src_ex2mem_o } } & ex_top_ex2mem_rd_data_i)
                                            | ( { 64 { ex_forward_ex_rs2_src_mem2wb_o } } & ex_top_mem2wb_rd_data_i );
    assign rs1_data                     =   ex_top_rs1_src_buffer_i? rs1_data_r : rs1_data_pre;
    assign rs2_data                     =   ex_top_rs2_src_buffer_i? rs2_data_r : rs2_data_pre;
    assign ex_top_rs1_data_o            =   rs1_data;
    assign ex_top_rs2_data_o            =   rs2_data;
    assign ex_top_rd_data_o             =   ( ex_top_inst_arth_lgc_i | ex_top_inst_auipc_i | ex_top_mem_read_i | ex_top_mem_write_i ) ?
                                            ex_core_res_data_o: ex_top_id2ex_rd_data_i; 
    
    assign ex_top_ex_rs1_src_ex2mem_o   =   ex_forward_ex_rs1_src_ex2mem_o;
    assign ex_top_ex_rs2_src_ex2mem_o   =   ex_forward_ex_rs2_src_ex2mem_o;
    assign ex_top_ex_rs1_src_mem2wb_o   =   ex_forward_ex_rs1_src_mem2wb_o;
    assign ex_top_ex_rs2_src_mem2wb_o   =   ex_forward_ex_rs2_src_mem2wb_o;

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_data_r <= 64'h0;
        end
        else if( ex_top_inst_valid_i & ex_top_rs1_buffered_i) begin
            rs1_data_r <= rs1_data_pre;
        end
        else begin
            rs1_data_r <= rs1_data_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            rs2_data_r <= 64'h0;
        end
        else if( ex_top_inst_valid_i & ex_top_rs2_buffered_i) begin
            rs2_data_r <= rs2_data_pre;
        end
        else begin
            rs2_data_r <= rs2_data_r;
        end
    end
    ysyx_210092_ex_core my_ex_core(
        /* control signals */
        .ex_core_alu_op_i( ex_top_alu_op_i ),
        .ex_core_inst_slt_nu_i( ex_top_inst_slt_nu_i ),
        .ex_core_inst_slt_u_i( ex_top_inst_slt_u_i ),
        .ex_core_shift_type_i( ex_top_shift_type_i ),
        .ex_core_shift_num_src( ex_top_shift_num_src_i ),
        .ex_core_inst_word_i( ex_top_inst_word_i ),
        .ex_core_alu_src_pc_i( ex_top_alu_src_pc_i ),
        .ex_core_alu_src_imm_i( ex_top_alu_src_imm_i ),
        .ex_core_inst_shift_i( ex_top_inst_shift_i ),
        /* data signals*/
        .ex_core_inst_addr_i( ex_top_inst_addr_i ),
        .ex_core_rs1_data_i( rs1_data ),
        .ex_core_rs2_data_i( rs2_data ),
        .ex_core_imm_data_i( ex_top_imm_data_i ),

        .ex_core_res_data_o( ex_core_res_data_o )
    );
    
    ysyx_210092_ex_forward my_ex_forward(
        .ex_forward_mem_write_i( ex_top_mem_write_i ),
        .ex_forward_mem_read_i( ex_top_mem_read_i ),
        .ex_forward_inst_arth_lgc_i( ex_top_inst_arth_lgc_i ),
        .ex_forward_inst_csr_i(  ex_top_inst_csr_i ),

        .ex_forward_id2ex_rs1_en_i( ex_top_id2ex_rs1_en_i ),
        .ex_forward_id2ex_rs2_en_i( ex_top_id2ex_rs2_en_i ),
        .ex_forward_ex2mem_rd_en_i( ex_top_ex2mem_rd_en_i ),
        .ex_forward_mem2wb_rd_en_i( ex_top_mem2wb_rd_en_i ),
        .ex_forward_id2ex_rs1_index_i( ex_top_id2ex_rs1_index_i ),
        .ex_forward_id2ex_rs2_index_i( ex_top_id2ex_rs2_index_i ),
        .ex_forward_ex2mem_rd_index_i( ex_top_ex2mem_rd_index_i ),
        .ex_forward_mem2wb_rd_index_i( ex_top_mem2wb_rd_index_i ),

        .ex_forward_ex_rs1_src_id2ex_o( ex_forward_ex_rs1_src_id2ex_o ),
        .ex_forward_ex_rs1_src_ex2mem_o( ex_forward_ex_rs1_src_ex2mem_o ),
        .ex_forward_ex_rs1_src_mem2wb_o( ex_forward_ex_rs1_src_mem2wb_o ),
        .ex_forward_ex_rs2_src_id2ex_o( ex_forward_ex_rs2_src_id2ex_o ),
        .ex_forward_ex_rs2_src_ex2mem_o( ex_forward_ex_rs2_src_ex2mem_o ),
        .ex_forward_ex_rs2_src_mem2wb_o( ex_forward_ex_rs2_src_mem2wb_o )
    );

endmodule
module ysyx_210092_ex2mem(
    input                       clk,
    input                       rst,

    /* ysyx_210092_ex2mem control signals */
    input                       ex2mem_inst_valid_i,
    input                       ex2mem_ex_flush_i,

    /* modules control signals */
    input   [`YSYX210092_REG_INDEX_BUS]    ex2mem_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex2mem_rs2_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    ex2mem_rd_index_i,

    input                       ex2mem_rs1_en_i,
    input                       ex2mem_rs2_en_i,
    input                       ex2mem_rd_en_i,

    input   [`YSYX210092_CSR_INDEX_BUS]    ex2mem_csr_index_i,
    input                       ex2mem_inst_csr_i,
    input                       ex2mem_inst_load_i,
    input                       ex2mem_mem_write_i,
    input                       ex2mem_mem_read_i,
    input   [`YSYX210092_STORE_TYPE_BUS]   ex2mem_store_type_i,
    input   [`YSYX210092_LOAD_TYPE_BUS]    ex2mem_load_type_i,
    input   [`YSYX210092_CSR_CTRL_BUS]     ex2mem_csr_ctrl_i,
    input                       ex2mem_inst_ecall_i,
    input                       ex2mem_inst_ebreak_i,
    input                       ex2mem_inst_mret_i,
    input                       ex2mem_inst_trap_i,

    `ifdef YSYX210092_DEFINE_DIFFTEST
    input   [`YSYX210092_INST_BUS]         ex2mem_inst_i,
    input                       ex2mem_inst_nop_i,
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    input                       ex2mem_inst_selfdefine_i,
    `endif

    output  [`YSYX210092_REG_INDEX_BUS]    ex2mem_rs1_index_o,
    output  [`YSYX210092_REG_INDEX_BUS]    ex2mem_rs2_index_o,
    output  [`YSYX210092_REG_INDEX_BUS]    ex2mem_rd_index_o,

    output                      ex2mem_rs1_en_o,
    output                      ex2mem_rs2_en_o,
    output                      ex2mem_rd_en_o,

    output  [`YSYX210092_CSR_INDEX_BUS]    ex2mem_csr_index_o,
    output                      ex2mem_inst_csr_o,
    output                      ex2mem_inst_load_o,
    output                      ex2mem_mem_write_o,
    output                      ex2mem_mem_read_o,
    output  [`YSYX210092_STORE_TYPE_BUS]   ex2mem_store_type_o,
    output  [`YSYX210092_LOAD_TYPE_BUS]    ex2mem_load_type_o,
    output  [`YSYX210092_CSR_CTRL_BUS]     ex2mem_csr_ctrl_o,
    output                      ex2mem_inst_ecall_o,
    output                      ex2mem_inst_ebreak_o,
    output                      ex2mem_inst_mret_o,
    output                      ex2mem_inst_trap_o,

    `ifdef YSYX210092_DEFINE_DIFFTEST
    output  [`YSYX210092_INST_BUS]         ex2mem_inst_o,
    output                      ex2mem_inst_nop_o,
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    output                      ex2mem_inst_selfdefine_o,
    `endif

    /* data signals */
    input   [`YSYX210092_REG_BUS]          ex2mem_rs1_data_i,
    input   [`YSYX210092_REG_BUS]          ex2mem_rs2_data_i,
    input   [`YSYX210092_DATA_BUS]         ex2mem_imm_data_i,
    input   [`YSYX210092_DATA_BUS]         ex2mem_rd_data_i,
    input   [`YSYX210092_INST_ADDR_BUS]    ex2mem_inst_addr_i,

    output  [`YSYX210092_REG_BUS]          ex2mem_rs1_data_o,
    output  [`YSYX210092_REG_BUS]          ex2mem_rs2_data_o,
    output  [`YSYX210092_DATA_BUS]         ex2mem_imm_data_o,
    output  [`YSYX210092_DATA_BUS]         ex2mem_rd_data_o,
    output  [`YSYX210092_INST_ADDR_BUS]    ex2mem_inst_addr_o
);

    reg     [`YSYX210092_REG_INDEX_BUS]    rs1_index_r;
    reg     [`YSYX210092_REG_INDEX_BUS]    rs2_index_r;
    reg     [`YSYX210092_REG_INDEX_BUS]    rd_index_r;
    reg     [`YSYX210092_CSR_INDEX_BUS]    csr_index_r;

    reg                         rs1_en_r;
    reg                         rs2_en_r;
    reg                         rd_en_r;

    reg                         inst_csr_r;
    reg                         inst_load_r;
    reg                         mem_write_r;
    reg                         mem_read_r;
    reg     [`YSYX210092_STORE_TYPE_BUS]   store_type_r;
    reg     [`YSYX210092_LOAD_TYPE_BUS]    load_type_r;
    reg     [`YSYX210092_CSR_CTRL_BUS]     csr_ctrl_r;
    reg                         inst_ecall_r;
    reg                         inst_ebreak_r;
    reg                         inst_mret_r;
    reg                         inst_trap_r;

    `ifdef YSYX210092_DEFINE_DIFFTEST
    reg     [`YSYX210092_INST_BUS]         inst_r;
    reg                         inst_nop_r;
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    reg                         inst_selfdefine_r;
    `endif

    reg     [`YSYX210092_REG_BUS]          rs1_data_r;
    reg     [`YSYX210092_REG_BUS]          rs2_data_r;
    reg     [`YSYX210092_DATA_BUS]         imm_data_r;
    reg     [`YSYX210092_DATA_BUS]         rd_data_r;
    reg     [`YSYX210092_INST_ADDR_BUS]    inst_addr_r;

    wire                        flush_en;
    wire                        flow_en;

    assign ex2mem_rs1_index_o        =   rs1_index_r;
    assign ex2mem_rs2_index_o        =   rs2_index_r;
    assign ex2mem_rd_index_o         =   rd_index_r;
    assign ex2mem_csr_index_o        =   csr_index_r;


    assign ex2mem_rs1_en_o           =   rs1_en_r;
    assign ex2mem_rs2_en_o           =   rs2_en_r;
    assign ex2mem_rd_en_o            =   rd_en_r;


    assign ex2mem_inst_csr_o         =   inst_csr_r;
    assign ex2mem_inst_load_o        =   inst_load_r;
    assign ex2mem_mem_write_o        =   mem_write_r;
    assign ex2mem_mem_read_o         =   mem_read_r;
    assign ex2mem_store_type_o       =   store_type_r;
    assign ex2mem_load_type_o        =   load_type_r;
    assign ex2mem_csr_ctrl_o         =   csr_ctrl_r;
    assign ex2mem_inst_ecall_o       =   inst_ecall_r;
    assign ex2mem_inst_ebreak_o      =   inst_ebreak_r;
    assign ex2mem_inst_mret_o        =   inst_mret_r;
    assign ex2mem_inst_trap_o        =   inst_trap_r;

    `ifdef YSYX210092_DEFINE_DIFFTEST
    assign ex2mem_inst_o             =   inst_r;
    assign ex2mem_inst_nop_o         =   inst_nop_r;
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    assign ex2mem_inst_selfdefine_o  =   inst_selfdefine_r;
    `endif

    assign ex2mem_rs1_data_o         =   rs1_data_r;
    assign ex2mem_rs2_data_o         =   rs2_data_r;
    assign ex2mem_imm_data_o         =   imm_data_r;
    assign ex2mem_rd_data_o          =   rd_data_r;
    assign ex2mem_inst_addr_o        =   inst_addr_r;

    assign flush_en                  =   ex2mem_ex_flush_i & ex2mem_inst_valid_i;
    assign flow_en                   =   ex2mem_inst_valid_i;

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            rs1_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flow_en ) begin
            rs1_index_r <= ex2mem_rs1_index_i;
        end
        else begin
            rs1_index_r <= rs1_index_r;
        end
    end
    
    always @( posedge clk ) begin
        if( rst ) begin
            rs2_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            rs2_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flow_en ) begin
            rs2_index_r <= ex2mem_rs2_index_i;
        end
        else begin
            rs2_index_r <= rs2_index_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rd_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            rd_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flow_en ) begin
            rd_index_r <= ex2mem_rd_index_i;
        end
        else begin
            rd_index_r <= rd_index_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            csr_index_r <= `YSYX210092_CSR_INDEX_SIZE'b0;
        end
        else if( flush_en ) begin
            csr_index_r <= `YSYX210092_CSR_INDEX_SIZE'b0;
        end
        else if( flow_en ) begin
            csr_index_r <= ex2mem_csr_index_i;
        end
        else begin
            csr_index_r <= csr_index_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_en_r <= 1'b0;        
        end
        else if( flush_en ) begin
            rs1_en_r <= 1'b0;
        end
        else if( flow_en ) begin
            rs1_en_r <= ex2mem_rs1_en_i;
        end
        else begin
            rs1_en_r <= rs1_en_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rs2_en_r <= 1'b0;        
        end
        else if( flush_en ) begin
            rs2_en_r <= 1'b0;
        end
        else if( flow_en ) begin
            rs2_en_r <= ex2mem_rs2_en_i;
        end
        else begin
            rs2_en_r <= rs2_en_r;
        end
    end
    
    always @( posedge clk ) begin
        if( rst ) begin
            rd_en_r <= 1'b0;        
        end
        else if( flush_en ) begin
            rd_en_r <= 1'b0;
        end
        else if( flow_en ) begin
            rd_en_r <= ex2mem_rd_en_i;
        end
        else begin
            rd_en_r <= rd_en_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_csr_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_csr_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_csr_r <= ex2mem_inst_csr_i;
        end
        else begin
            inst_csr_r <= inst_csr_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_load_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_load_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_load_r <= ex2mem_inst_load_i;
        end
        else begin
            inst_load_r <= inst_load_r;
        end
    end 

    always @( posedge clk ) begin
        if( rst ) begin
            mem_write_r <= 1'b0;   
        end
        else if( flush_en ) begin
            mem_write_r <= 1'b0;
        end
        else if( flow_en ) begin
            mem_write_r <= ex2mem_mem_write_i;
        end
        else begin
            mem_write_r <= mem_write_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            mem_read_r <= 1'b0;   
        end
        else if( flush_en ) begin
            mem_read_r <= 1'b0;
        end
        else if( flow_en ) begin
            mem_read_r <= ex2mem_mem_read_i;
        end
        else begin
            mem_read_r <= mem_read_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            store_type_r <= 3'b0;   
        end
        else if( flush_en ) begin
            store_type_r <= 3'b0;
        end
        else if( flow_en ) begin
            store_type_r <= ex2mem_store_type_i;
        end
        else begin
            store_type_r <= store_type_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            load_type_r <= 3'b0;   
        end
        else if( flush_en ) begin
            load_type_r <= 3'b0;
        end
        else if( flow_en ) begin
            load_type_r <= ex2mem_load_type_i;
        end
        else begin
            load_type_r <= load_type_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            csr_ctrl_r <= 3'b100;   
        end
        else if( flush_en ) begin
            csr_ctrl_r <= 3'b100;
        end
        else if( flow_en ) begin
            csr_ctrl_r <= ex2mem_csr_ctrl_i;
        end
        else begin
            csr_ctrl_r <= csr_ctrl_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_ecall_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_ecall_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_ecall_r <= ex2mem_inst_ecall_i;
        end
        else begin
            inst_ecall_r <= inst_ecall_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_ebreak_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_ebreak_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_ebreak_r <= ex2mem_inst_ebreak_i;
        end
        else begin
            inst_ebreak_r <= inst_ebreak_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_mret_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_mret_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_mret_r <= ex2mem_inst_mret_i;
        end
        else begin
            inst_mret_r <= inst_mret_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            inst_trap_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_trap_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_trap_r <= ex2mem_inst_trap_i;
        end
        else begin
            inst_trap_r <= inst_trap_r;
        end
    end
    `ifdef YSYX210092_DEFINE_DIFFTEST
    always @( posedge clk ) begin
        if( rst ) begin
            inst_r <= `YSYX210092_INST_NOP;
        end
        else if( flush_en ) begin
            inst_r <= `YSYX210092_INST_NOP;
        end
        else if( flow_en ) begin
            inst_r <= ex2mem_inst_i;
        end
        else begin
            inst_r <= inst_r;
        end      
    end
    always @( posedge clk ) begin
        if( rst ) begin
            inst_nop_r <= 1'b1;
        end
        else if( flush_en ) begin
            inst_nop_r <= 1'b1;
        end
        else if( flow_en ) begin
            inst_nop_r <= ex2mem_inst_nop_i;
        end
        else begin
            inst_nop_r <= inst_nop_r;
        end
    end
    `endif
    `ifdef YSYX210092_DEFINE_PUTCH
    always @( posedge clk ) begin
        if( rst ) begin
            inst_selfdefine_r <= 1'b0;   
        end
        else if( flush_en ) begin
            inst_selfdefine_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_selfdefine_r <= ex2mem_inst_selfdefine_i;
        end
        else begin
            inst_selfdefine_r <= inst_selfdefine_r;
        end
    end
    `endif

    always @( posedge clk ) begin
        if( rst ) begin
            rs1_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            rs1_data_r <= 64'b0;
        end
        else if( flow_en ) begin
            rs1_data_r <= ex2mem_rs1_data_i;
        end
        else begin
            rs1_data_r <= rs1_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rs2_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            rs2_data_r <= 64'b0;
        end
        else if( flow_en ) begin
            rs2_data_r <= ex2mem_rs2_data_i;
        end
        else begin
            rs2_data_r <= rs2_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            imm_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            imm_data_r <= 64'b0;
        end
        else if( flow_en ) begin
            imm_data_r <= ex2mem_imm_data_i;
        end
        else begin
            imm_data_r <= imm_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            rd_data_r <= 64'b0;   
        end
        else if( flush_en ) begin
            rd_data_r <= 64'b0;
        end
        else if( flow_en ) begin
            rd_data_r <= ex2mem_rd_data_i;
        end
        else begin
            rd_data_r <= rd_data_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            inst_addr_r <= 64'b0;   
        end
        else if( flush_en ) begin
            inst_addr_r <= 64'b0;
        end
        else if( flow_en ) begin
            inst_addr_r <= ex2mem_inst_addr_i;
        end
        else begin
            inst_addr_r <= inst_addr_r;
        end
    end

endmodule
module ysyx_210092_mem_interface(
    input                       clk,
    input                       rst,

    input                       mem_interface_intp_en_i,
    output                      mem_interface_access_ok_o,

    /* ysyx_210092_cpu side */
    input                       mem_interface_inst_valid_i,
    input   [`YSYX210092_STORE_TYPE_BUS]   mem_interface_store_type_i,
    input   [`YSYX210092_LOAD_TYPE_BUS]    mem_interface_load_type_i,
    input                       mem_interface_mem_write_i,
    input                       mem_interface_mem_read_i,
    input   [`YSYX210092_DATA_ADDR_BUS]    mem_interface_data_addr_i,
    input   [`YSYX210092_DATA_BUS]         mem_interface_write_data_i,
    output  [`YSYX210092_DATA_BUS]         mem_interface_read_data_o,

    /* access side */
    output                      mem_interface_valid_o,
    input                       mem_interface_ready_i,
    input   [`YSYX210092_DATA_BUS]         mem_interface_data_read_i,
    output  [`YSYX210092_DATA_BUS]         mem_interface_data_write_o,
    output  [`YSYX210092_DATA_ADDR_BUS]    mem_interface_addr_o,
    output  [1:0]               mem_interface_size_o,
    input   [1:0]               mem_interface_resp_i,
    output                      mem_interface_req_o
);
    
    /* write */
    wire                        store_eff;
    wire                        store_sb;
    wire                        store_sh;
    wire                        store_sw;
    wire                        store_sd;

    /* read */
    wire                        load_lbx;
    wire                        load_lhx;
    wire                        load_lwx;
    wire                        load_ld;
    wire                        load_signed;

    wire                        signed_bit;

    wire    [`YSYX210092_DATA_BUS]         mask_lbx;
    wire    [`YSYX210092_DATA_BUS]         mask_lhx;
    wire    [`YSYX210092_DATA_BUS]         mask_lwx;
    wire    [`YSYX210092_DATA_BUS]         mask_ld;
    wire    [`YSYX210092_DATA_BUS]         mask;

    /* interface */

    reg                         mem_finished;
    reg     [`YSYX210092_DATA_BUS]         read_data_r;
    wire                        handshake_done;

    /* assignment */
    assign store_eff                    =   mem_interface_store_type_i[2] == 1'b1;
    assign store_sb                     =   store_eff & ( mem_interface_store_type_i[1:0] == 2'b00 );
    assign store_sh                     =   store_eff & ( mem_interface_store_type_i[1:0] == 2'b01 );
    assign store_sw                     =   store_eff & ( mem_interface_store_type_i[1:0] == 2'b10 );
    assign store_sd                     =   store_eff & ( mem_interface_store_type_i[1:0] == 2'b11 );


    assign load_lbx                     =   mem_interface_load_type_i[1:0] == 2'b01;
    assign load_lhx                     =   mem_interface_load_type_i[1:0] == 2'b10;
    assign load_lwx                     =   mem_interface_load_type_i[1:0] == 2'b11;
    assign load_ld                      =   mem_interface_load_type_i[2:0] == 3'b100;
    assign load_signed                  =   ( mem_interface_load_type_i[2] == 1'b0 ) & ( mem_interface_load_type_i[1:0] != 2'b0 ); 

    assign signed_bit                   =  load_signed & 
                                            ( | load_lbx & read_data_r[07]
                                              | load_lhx & read_data_r[15]
                                              | load_lwx & read_data_r[31]
                                              | load_ld  & read_data_r[63] 
                                            );

    assign mask_lbx                     =   64'hff;
    assign mask_lhx                     =   64'hffff;
    assign mask_lwx                     =   64'hffff_ffff;
    assign mask_ld                      =   ~64'h0;
    assign mask                         =       ( { 64 { load_lbx } } & mask_lbx )
                                              | ( { 64 { load_lhx } } & mask_lhx )
                                              | ( { 64 { load_lwx } } & mask_lwx )
                                              | ( { 64 { load_ld  } } & mask_ld  );
    assign mem_interface_read_data_o    =   load_signed? 
                                         ( ( read_data_r  ) | ( { 64 { signed_bit } } & ~mask ) )
                                         : read_data_r;


    assign mem_interface_valid_o        =   ( mem_interface_mem_write_i | mem_interface_mem_read_i ) & ~mem_finished & ~mem_interface_intp_en_i;
    assign mem_interface_data_write_o   =   mem_interface_write_data_i <<( { 3'b0, mem_interface_data_addr_i[2:0] } << 3 );
    assign mem_interface_addr_o         =   mem_interface_data_addr_i;
    assign mem_interface_size_o         =     { 2 { store_sb | load_lbx } } & `YSYX210092_SIZE_B 
                                            | { 2 { store_sh | load_lhx } } & `YSYX210092_SIZE_H
                                            | { 2 { store_sw | load_lwx } } & `YSYX210092_SIZE_W
                                            | { 2 { store_sd | load_ld  } } & `YSYX210092_SIZE_D ;
    assign mem_interface_req_o          =   ( mem_interface_mem_read_i & `YSYX210092_REQ_READ ) | ( mem_interface_mem_write_i & `YSYX210092_REQ_WRITE );  
    assign handshake_done               =   mem_interface_valid_o & mem_interface_ready_i;
    assign mem_interface_access_ok_o    =   mem_finished | mem_interface_intp_en_i;

    always @( posedge clk ) begin
        if( rst ) begin
            read_data_r <= `YSYX210092_ZERO_DWORD;
        end
        else if( handshake_done & mem_interface_mem_read_i ) begin
            read_data_r <= mem_interface_data_read_i;
        end
        else begin
            read_data_r <= read_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst | mem_interface_inst_valid_i ) begin
            mem_finished <= 1'b0;
        end
        else if( handshake_done ) begin
            mem_finished <= 1'b1;
        end
        else begin
            mem_finished <= mem_finished;
        end
    end
    
endmodule
module ysyx_210092_mem_clint_dstb (
    /* input side */
    input                       mem_clint_dstb_valid_i,
    output                      mem_clint_dstb_ready_o,
    output  [`YSYX210092_DATA_BUS]         mem_clint_dstb_data_read_o,
    input   [`YSYX210092_DATA_BUS]         mem_clint_dstb_data_write_i,
    input   [`YSYX210092_DATA_ADDR_BUS]    mem_clint_dstb_addr_i,
    input   [1:0]               mem_clint_dstb_size_i,
    output  [1:0]               mem_clint_dstb_resp_o,
    input                       mem_clint_dstb_req_i,

    /* mem side */
    output                      mem_clint_dstb_mem_valid_o,
    input                       mem_clint_dstb_mem_ready_i,
    input   [`YSYX210092_DATA_BUS]         mem_clint_dstb_mem_data_read_i,
    output  [`YSYX210092_DATA_BUS]         mem_clint_dstb_mem_data_write_o,
    output  [`YSYX210092_DATA_ADDR_BUS]    mem_clint_dstb_mem_addr_o,
    output  [1:0]               mem_clint_dstb_mem_size_o,
    input   [1:0]               mem_clint_dstb_mem_resp_i,
    output                      mem_clint_dstb_mem_req_o,

    /* clint side */
    output                      mem_clint_dstb_clint_valid_o,
    input                       mem_clint_dstb_clint_ready_i,
    input   [`YSYX210092_DATA_BUS]         mem_clint_dstb_clint_data_read_i,
    output  [`YSYX210092_DATA_BUS]         mem_clint_dstb_clint_data_write_o,
    output  [`YSYX210092_DATA_ADDR_BUS]    mem_clint_dstb_clint_addr_o,
    output  [1:0]               mem_clint_dstb_clint_size_o,
    input   [1:0]               mem_clint_dstb_clint_resp_i,
    output                      mem_clint_dstb_clint_req_o
    
    `ifdef YSYX210092_DEFINE_DIFFTEST
    ,
    output                      mem_clint_dstb_skip_o
    `endif
);
    wire                        to_clint;
    wire                        to_other;

    assign to_clint                             =   ( mem_clint_dstb_addr_i == `YSYX210092_MTIME_ADDR ) 
                                                    | ( mem_clint_dstb_addr_i == `YSYX210092_MTIMECMP_ADDR );
    assign to_other                             =   ~to_clint;
    
    `ifdef YSYX210092_DEFINE_DIFFTEST
    assign mem_clint_dstb_skip_o                =   to_clint;
    `endif

    assign mem_clint_dstb_ready_o               =   to_clint? mem_clint_dstb_clint_ready_i: mem_clint_dstb_mem_ready_i;
    assign mem_clint_dstb_data_read_o           =   to_clint? mem_clint_dstb_clint_data_read_i: mem_clint_dstb_mem_data_read_i;
    assign mem_clint_dstb_resp_o                =   to_clint? mem_clint_dstb_clint_resp_i: mem_clint_dstb_mem_resp_i;
    
    assign mem_clint_dstb_mem_valid_o           =   to_other & mem_clint_dstb_valid_i;
    assign mem_clint_dstb_mem_data_write_o      =   { `YSYX210092_DATA_BUS_SIZE { to_other } } & mem_clint_dstb_data_write_i;
    assign mem_clint_dstb_mem_addr_o            =   { `YSYX210092_DATA_BUS_SIZE { to_other } } & mem_clint_dstb_addr_i;
    assign mem_clint_dstb_mem_size_o            =   { 2 { to_other } } & mem_clint_dstb_size_i;
    assign mem_clint_dstb_mem_req_o             =   to_other & mem_clint_dstb_req_i;

    assign mem_clint_dstb_clint_valid_o         =   to_clint & mem_clint_dstb_valid_i;
    assign mem_clint_dstb_clint_data_write_o    =   { `YSYX210092_DATA_BUS_SIZE { to_clint } } & mem_clint_dstb_data_write_i;
    assign mem_clint_dstb_clint_addr_o          =   { `YSYX210092_DATA_BUS_SIZE { to_clint } } & mem_clint_dstb_addr_i;
    assign mem_clint_dstb_clint_size_o          =   { 2 { to_clint } } & mem_clint_dstb_size_i;
    assign mem_clint_dstb_clint_req_o           =   to_clint & mem_clint_dstb_req_i;

endmodule
module ysyx_210092_mem_clint(
    input                       clk,
    input                       rst,

    output                      mem_clint_clint_mtip_o,
    output                      mem_clint_clint_update_o,
    input                       mem_clint_clint_valid_i,
    input   [`YSYX210092_DATA_BUS]         mem_clint_clint_data_write_i,
    input   [`YSYX210092_DATA_ADDR_BUS]    mem_clint_clint_addr_i,
    input   [1:0]               mem_clint_clint_size_i,
    input                       mem_clint_clint_req_i,

    output                      mem_clint_clint_ready_o,
    output  [`YSYX210092_DATA_BUS]         mem_clint_clint_data_read_o,
    output  [1:0]               mem_clint_clint_resp_o
);
    reg     [`YSYX210092_DATA_BUS]         mtime_r;
    reg     [`YSYX210092_DATA_BUS]         mtimecmp_r;
    reg                         clint_update_r;
    reg     [1:0]               small_clk;
    wire                        small_clk_en;
    wire                        clint_read;
    wire                        clint_write;
    wire                        mtime_en;
    wire                        mtimecmp_en;

    assign clint_read           =   mem_clint_clint_req_i == `YSYX210092_REQ_READ;
    assign clint_write          =   mem_clint_clint_req_i == `YSYX210092_REQ_WRITE;
    assign mtime_en             =   mem_clint_clint_valid_i & ( mem_clint_clint_addr_i == `YSYX210092_MTIME_ADDR );
    assign mtimecmp_en          =   mem_clint_clint_valid_i & ( mem_clint_clint_addr_i == `YSYX210092_MTIMECMP_ADDR );

    always @( posedge clk ) begin
        if( rst ) begin
            small_clk <= 2'b0;
        end
        else begin
            small_clk <= small_clk + 2'b1;
        end
    end
    assign small_clk_en = small_clk == 2'b0;
    
    always @( posedge clk ) begin
        if( rst ) begin
            mtime_r <= `YSYX210092_DATA_BUS_SIZE'b0;
        end
        else if( mtime_en & clint_write ) begin
            mtime_r <= mem_clint_clint_data_write_i;
        end
        else if( small_clk_en )begin
            mtime_r <= mtime_r + `YSYX210092_DATA_BUS_SIZE'b1;
        end
        else begin
            mtime_r <= mtime_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            mtimecmp_r <= `YSYX210092_DATA_BUS_SIZE'b0;
        end
        else if( mtimecmp_en & clint_write ) begin
            mtimecmp_r <= mem_clint_clint_data_write_i;
        end
        else begin
            mtimecmp_r <= mtimecmp_r;
        end
    end

    always @( posedge clk ) begin
        if( rst | clint_update_r ) begin
            clint_update_r <= 1'b0;
        end    
        else if( clint_write ) begin
            clint_update_r <= 1'b1;
        end
        else begin
            clint_update_r <= clint_update_r;
        end
    end

    assign mem_clint_clint_ready_o          =   1'b1;
    assign mem_clint_clint_data_read_o      =   ( { `YSYX210092_DATA_BUS_SIZE { mtime_en & clint_read } } & mtime_r ) 
                                                | ( { `YSYX210092_DATA_BUS_SIZE { mtimecmp_en & clint_read } } & mtimecmp_r );
    assign mem_clint_clint_resp_o           =   2'b0;

    assign mem_clint_clint_mtip_o           =   mtime_r >= mtimecmp_r;
    assign mem_clint_clint_update_o         =   clint_update_r;
endmodule

module ysyx_210092_mem_csr(
    input                           clk,
    input                           rst,

    input                           mem_csr_inst_valid_i,

    input                           mem_csr_intp_en_i,

    input   [`YSYX210092_CSR_INDEX_BUS]        mem_csr_csr_index_i,
    input   [`YSYX210092_DATA_BUS]             mem_csr_rs1_data_i,
    input   [`YSYX210092_DATA_BUS]             mem_csr_imm_csr_i,
    input   [`YSYX210092_CSR_CTRL_BUS]         mem_csr_csr_ctrl_i,
    input   [`YSYX210092_INST_ADDR_BUS]        mem_csr_inst_addr_i,
    input                           mem_csr_inst_trap_i,
    input                           mem_csr_inst_mret_i,
    input                           mem_csr_clint_mtip_i,
    input                           mem_csr_clint_update_i,
    input                           mem_csr_inst_ecall_i,
    input                           mem_csr_inst_ebreak_i,

    output                          mem_csr_csr_trap_o,
    output  [`YSYX210092_INST_ADDR_BUS]        mem_csr_csr_nxt_pc_o,
    output  [`YSYX210092_DATA_BUS]             mem_csr_csr_read_o
    `ifdef YSYX210092_DEFINE_DIFFTEST
    ,
    output                          mem_csr_csr_skip_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mstatus_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mtvec_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mepc_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mcause_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mip_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mie_o,
    output  [`YSYX210092_REG_BUS]              mem_csr_mscratch_o,
    output  [31:0]                  mem_csr_cause_o
    `endif
);
    /* index */
    wire                            index_mcycle;
    wire                            index_misa;
    wire                            index_mvendorid;
    wire                            index_marchid;
    wire                            index_mimpid;
    wire                            index_mhartid;
    wire                            index_mstatus;
    wire                            index_mtvec;
    wire                            index_mepc;
    wire                            index_mcause;
    wire                            index_mip;
    wire                            index_mie;
    wire                            index_mscratch;
    wire                            index_minstret; 

    /* control */  
    wire                            inst_csrrwx;
    wire                            inst_csrrsx;
    wire                            inst_csrrcx;
    wire                            change_en;
    wire                            trap_en;
    wire                            ret_en; 
    wire    [`YSYX210092_DATA_BUS]             mcycle_nxt;
    wire    [`YSYX210092_DATA_BUS]             minstret_nxt;
    wire                            trap_nmret;

    wire    [`YSYX210092_DATA_BUS]             csr_nxt;
    wire    [`YSYX210092_DATA_BUS]             csr_org;
    wire    [`YSYX210092_DATA_BUS]             csr_writereference;
    wire    [`YSYX210092_DATA_BUS]             csrrwx_res;
    wire    [`YSYX210092_DATA_BUS]             csrrsx_res;
    wire    [`YSYX210092_DATA_BUS]             csrrcx_res;

   
    /* reg */
    reg     [`YSYX210092_DATA_BUS]             mcycle_r;
    wire    [`YSYX210092_DATA_BUS]             misa_r;
    wire    [`YSYX210092_DATA_BUS]             mvendorid_r;
    wire    [`YSYX210092_DATA_BUS]             marchid_r;
    wire    [`YSYX210092_DATA_BUS]             mimpid_r;
    wire    [`YSYX210092_DATA_BUS]             mhartid_r;
    reg     [`YSYX210092_DATA_BUS]             mstatus_r;
    reg     [`YSYX210092_DATA_BUS]             mtvec_r;
    reg     [`YSYX210092_INST_ADDR_BUS]        mepc_r;
    reg     [`YSYX210092_DATA_BUS]             mcause_r;
    reg     [`YSYX210092_DATA_BUS]             mip_r;
    reg     [`YSYX210092_DATA_BUS]             mie_r;
    reg     [`YSYX210092_DATA_BUS]             mscratch_r;
    reg     [`YSYX210092_DATA_BUS]             minstret_r;

    assign index_mcycle             =   mem_csr_csr_index_i == `YSYX210092_CSR_MCYCLE_INDEX;
    assign index_misa               =   mem_csr_csr_index_i == `YSYX210092_CSR_MISA_INDEX;
    assign index_mvendorid          =   mem_csr_csr_index_i == `YSYX210092_CSR_MVENDORID_INDEX;
    assign index_marchid            =   mem_csr_csr_index_i == `YSYX210092_CSR_MARCHID_INDEX;
    assign index_mimpid             =   mem_csr_csr_index_i == `YSYX210092_CSR_MIMPID_INDEX;
    assign index_mhartid            =   mem_csr_csr_index_i == `YSYX210092_CSR_MHARTID_INDEX;    
    assign index_mstatus            =   mem_csr_csr_index_i == `YSYX210092_CSR_MSTATUS_INDEX;
    assign index_mtvec              =   mem_csr_csr_index_i == `YSYX210092_CSR_MTVEC_INDEX;
    assign index_mepc               =   mem_csr_csr_index_i == `YSYX210092_CSR_MEPC_INDEX;
    assign index_mcause             =   mem_csr_csr_index_i == `YSYX210092_CSR_MCAUSE_INDEX;
    assign index_mip                =   mem_csr_csr_index_i == `YSYX210092_CSR_MIP_INDEX;
    assign index_mie                =   mem_csr_csr_index_i == `YSYX210092_CSR_MIE_INDEX;
    assign index_mscratch           =   mem_csr_csr_index_i == `YSYX210092_CSR_MSCRATCH_INDEX;    
    assign index_minstret           =   mem_csr_csr_index_i == `YSYX210092_CSR_MINSTRET_INDEX;

    assign trap_nmret               =   (mem_csr_inst_trap_i & ~mem_csr_inst_mret_i) | mem_csr_intp_en_i;

    assign inst_csrrwx              =   mem_csr_csr_ctrl_i[1:0] == 2'b01;
    assign inst_csrrsx              =   mem_csr_csr_ctrl_i[1:0] == 2'b10;
    assign inst_csrrcx              =   mem_csr_csr_ctrl_i[1:0] == 2'b11;
    assign change_en                =   (mem_csr_csr_ctrl_i[2:0]!=3'b100) & mem_csr_inst_valid_i & ~mem_csr_intp_en_i;
    assign trap_en                  =   mem_csr_inst_valid_i & trap_nmret;
    assign ret_en                   =   mem_csr_inst_valid_i & mem_csr_inst_mret_i;
    assign minstret_nxt             =   minstret_r + `YSYX210092_DATA_BUS_SIZE'h1;
    assign mcycle_nxt               =   mcycle_r + `YSYX210092_DATA_BUS_SIZE'h1;

    assign csr_nxt                  =   { `YSYX210092_DATA_BUS_SIZE { inst_csrrwx } } & csrrwx_res
                                        | { `YSYX210092_DATA_BUS_SIZE { inst_csrrsx } } & csrrsx_res
                                        | { `YSYX210092_DATA_BUS_SIZE { inst_csrrcx } } & csrrcx_res ;  

    assign csr_org                  =   { `YSYX210092_DATA_BUS_SIZE { index_mcycle } } & ( mcycle_nxt )
                                        // | { `YSYX210092_DATA_BUS_SIZE{ index_misa } } & ( misa_r )
                                        // | { `YSYX210092_DATA_BUS_SIZE{ index_mvendorid } } & ( mvendorid_r )
                                        // | { `YSYX210092_DATA_BUS_SIZE{ index_marchid } } & ( marchid_r )
                                        // | { `YSYX210092_DATA_BUS_SIZE{ index_mimpid } } & ( mimpid_r )
                                        // | { `YSYX210092_DATA_BUS_SIZE{ index_mhartid } } & ( mhartid_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_mstatus } } & ( mstatus_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_mtvec } } & ( mtvec_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_mepc } } & ( mepc_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_mcause } } & ( mcause_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_mip } } & ( mip_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_mscratch } } & ( mscratch_r )
                                        | { `YSYX210092_DATA_BUS_SIZE{ index_minstret } } & ( minstret_nxt ); 

    assign csr_writereference       =   mem_csr_csr_ctrl_i[2] ? mem_csr_imm_csr_i: mem_csr_rs1_data_i;
    assign csrrwx_res               =   csr_writereference;
    assign csrrsx_res               =   csr_org | csr_writereference;    
    assign csrrcx_res               =   csr_org & ~csr_writereference;
    
    //mcycle
    always @( posedge clk ) begin
        if( rst ) begin
            mcycle_r <= `YSYX210092_DATA_BUS_SIZE'b0;
        end
        else  if( index_mcycle & change_en )begin
            mcycle_r <= csr_nxt;
        end
        else begin
            mcycle_r <= mcycle_nxt;
        end
    end

    //misa
    assign misa_r                   =   { 2'b10, {`YSYX210092_DATA_BUS_SIZE-28{1'b0}}, 26'h0100 };

    //mvendorid 
    assign mvendorid_r              =   `YSYX210092_DATA_BUS_SIZE'b0;

    //marchid   
    assign marchid_r                =   `YSYX210092_DATA_BUS_SIZE'b1;

    //mhartid   
    assign mhartid_r                =   `YSYX210092_DATA_BUS_SIZE'b0;
    //mimpid
    assign mimpid_r                 =   `YSYX210092_DATA_BUS_SIZE'b1;
    //mem_csr_mstatus_o
    always @( posedge clk ) begin
        if( rst ) begin
            mstatus_r <=  `YSYX210092_DATA_BUS_SIZE'b0;
        end
        else if( index_mstatus & change_en ) begin
            mstatus_r <= { ( csr_nxt[16:15] == 2'b11 ) | ( csr_nxt[14:13] == 2'b11 ) ,csr_nxt[62:0] } /* & `YSYX210092_DATA_BUS_SIZE'h1888 */;
        end
        else if( trap_en ) begin
            mstatus_r[12:11] <= 2'b11;
            mstatus_r[7] <= mstatus_r[3];
            mstatus_r[3] <= 1'b0;
        end
        else if( ret_en ) begin
            mstatus_r[12:11] <= 2'b00;
            mstatus_r[7] <= 1'b1;
            mstatus_r[3] <= mstatus_r[7];
        end
        else begin
            mstatus_r <= mstatus_r;
        end
    end 

    //mem_csr_mtvec_o
    always @( posedge clk ) begin
        if( rst ) begin
            mtvec_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( index_mtvec & change_en ) begin
            mtvec_r <= csr_nxt & ~64'h3;
        end
        else begin
            mtvec_r <= mtvec_r;
        end
    end

    //mem_csr_mepc_o
    always @( posedge clk ) begin
        if( rst ) begin
            mepc_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( index_mepc & change_en ) begin
            mepc_r <= csr_nxt;
        end
        else if( trap_en ) begin
            mepc_r <= mem_csr_inst_addr_i;
        end
        else begin
            mepc_r <= mepc_r;
        end
    end    

    //mem_csr_mcause_o
    always @( posedge clk ) begin
        if( rst ) begin
            mcause_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( change_en & index_mcause ) begin
            mcause_r <= csr_nxt;
        end
        else if( mem_csr_inst_ecall_i & change_en ) begin
            mcause_r <= `YSYX210092_DATA_BUS_SIZE'd11; 
        end
        else if( mem_csr_inst_ebreak_i & change_en ) begin
            mcause_r <= `YSYX210092_DATA_BUS_SIZE'd3;
        end
        else if( trap_en ) begin//确定不是ecall和break
            mcause_r <= ( `YSYX210092_DATA_BUS_SIZE'h1<<(`YSYX210092_DATA_BUS_SIZE-1) ) + `YSYX210092_DATA_BUS_SIZE'h7;
        end
        else begin
            mcause_r <= mcause_r;
        end
    end

    //mem_csr_mip_o
    always @( posedge clk ) begin
        if( rst ) begin
            mip_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( index_mip & change_en ) begin
            mip_r <= csr_nxt & `YSYX210092_DATA_BUS_SIZE'h80;
        end
        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        else if( mem_csr_clint_mtip_i | mem_csr_clint_update_i ) begin
            mip_r[7] <= mem_csr_clint_mtip_i;
        end
        else begin
            mip_r <= mip_r;
        end
    end

    //mem_csr_mie_o
    always @( posedge clk ) begin
        if( rst ) begin
            mie_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( index_mie & change_en ) begin
            mie_r <= csr_nxt & `YSYX210092_DATA_BUS_SIZE'h80;
        end
        else begin
            mie_r <= mie_r;
        end
    end

    //mem_csr_mscratch_o
    always @( posedge clk ) begin
        if( rst ) begin
            mscratch_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( index_mscratch & change_en ) begin
            mscratch_r <= csr_nxt;
        end
        else begin
            mscratch_r <= mscratch_r;
        end
    end

    //minstret
    always @( posedge clk ) begin
        if( rst ) begin
            minstret_r <= `YSYX210092_DATA_BUS_SIZE'h0;
        end
        else if( index_minstret & change_en ) begin
            minstret_r <= csr_nxt;
        end
        else if( change_en ) begin
            minstret_r <= minstret_nxt;
        end
        else begin
            minstret_r <= minstret_r;
        end
    end


    //output
    assign mem_csr_csr_trap_o       =   mstatus_r[3] & ( mie_r[7] & mip_r[7] );
    assign mem_csr_csr_nxt_pc_o     =   trap_nmret ? mtvec_r: mepc_r;
    assign mem_csr_csr_read_o       =    { `YSYX210092_DATA_BUS_SIZE { index_mcycle } } & ( mcycle_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_misa } } & ( misa_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mvendorid } } & ( mvendorid_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_marchid } } & ( marchid_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mimpid } } & ( mimpid_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mhartid } } & ( mhartid_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mstatus } } & ( mstatus_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mtvec } } & ( mtvec_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mepc } } & ( mepc_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mcause } } & ( mcause_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mip } } & ( mip_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_mscratch } } & ( mscratch_r )
                                       | { `YSYX210092_DATA_BUS_SIZE{ index_minstret } } & ( minstret_r ); 


    `ifdef YSYX210092_DEFINE_DIFFTEST

    assign mem_csr_csr_skip_o       =   ~( index_mstatus | index_mtvec | index_mepc | index_mepc | index_mcause /* | index_mip */ | index_mie | index_mscratch | mem_csr_inst_ecall_i | mem_csr_inst_ebreak_i | mem_csr_inst_mret_i );
    assign mem_csr_mstatus_o        =   index_mstatus & ~mem_csr_intp_en_i? { ( csr_nxt[16:15] == 2'b11 ) | ( csr_nxt[14:13] == 2'b11 ) ,csr_nxt[62:0] } /* & `YSYX210092_DATA_BUS_SIZE'h1888 */: 
                                            trap_en? {mstatus_r[63:13], 2'b11, mstatus_r[10:8], mstatus_r[3],mstatus_r[6:4],1'b0,mstatus_r[2:0]}:
                                            ret_en? {mstatus_r[63:13], 2'b00, mstatus_r[10:8], 1'b1,mstatus_r[6:4],mstatus_r[7],mstatus_r[2:0]}:
                                            mstatus_r;
    assign mem_csr_mtvec_o          =   index_mtvec & ~mem_csr_intp_en_i? csr_nxt & ~64'h3: mtvec_r;
    assign mem_csr_mepc_o           =   index_mepc & ~mem_csr_intp_en_i? csr_nxt:
                                            trap_nmret? mem_csr_inst_addr_i:
                                            mepc_r ;
    assign mem_csr_mcause_o         =   index_mcause & ~mem_csr_intp_en_i? csr_nxt: 
                                            mem_csr_inst_ecall_i? `YSYX210092_DATA_BUS_SIZE'd11: 
                                            mem_csr_inst_ebreak_i? `YSYX210092_DATA_BUS_SIZE'd3:
                                            trap_nmret? ( `YSYX210092_DATA_BUS_SIZE'h1<<(`DATA_BUS_SIZE-1) ) + `YSYX210092_DATA_BUS_SIZE'h7: 
                                            mcause_r;
    assign mem_csr_mip_o            =   index_mip & ~mem_csr_intp_en_i? csr_nxt & `YSYX210092_DATA_BUS_SIZE'h80:
                                            mem_csr_clint_mtip_i? { mip_r[63:8], 1'b1, mip_r[6:0] }:
                                            mip_r;
    assign mem_csr_mie_o            =   index_mie & ~mem_csr_intp_en_i? csr_nxt & `YSYX210092_DATA_BUS_SIZE'h80: mie_r;
    assign mem_csr_mscratch_o       =   index_mscratch & ~mem_csr_intp_en_i? csr_nxt: mscratch_r;
    assign mem_csr_cause_o          =   { mem_csr_mcause_o[`YSYX210092_DATA_BUS_SIZE-1], mem_csr_mcause_o[30:0] }; 

    `endif
    
endmodule

module ysyx_210092_mem_forward(
    input                       mem_forward_ex2mem_rs1_en_i,
    input                       mem_forward_ex2mem_rs2_en_i,
    input                       mem_forward_mem2wb_rd_en_i,
    input   [`YSYX210092_REG_INDEX_BUS]    mem_forward_ex2mem_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    mem_forward_ex2mem_rs2_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    mem_forward_mem2wb_rd_index_i,
    
    output                      mem_forward_ex_rs1_src_ex2mem_o,
    output                      mem_forward_ex_rs1_src_mem2wb_o,
    output                      mem_forward_ex_rs2_src_ex2mem_o,
    output                      mem_forward_ex_rs2_src_mem2wb_o
);
    wire                        mem_forward_ex_rs1_src_mem2wb_n;
    wire                        mem_forward_ex_rs2_src_mem2wb_n;

    assign mem_forward_ex_rs1_src_mem2wb_n  =   ~mem_forward_ex_rs1_src_mem2wb_o;
    assign mem_forward_ex_rs2_src_mem2wb_n  =   ~mem_forward_ex_rs2_src_mem2wb_o;

    assign mem_forward_ex_rs1_src_ex2mem_o  =   mem_forward_ex_rs1_src_mem2wb_n;
    assign mem_forward_ex_rs2_src_ex2mem_o  =   mem_forward_ex_rs2_src_mem2wb_n;

    assign mem_forward_ex_rs1_src_mem2wb_o  =   ( mem_forward_mem2wb_rd_index_i != `YSYX210092_REG_INDEX_SIZE'b0 )
                                                & ( mem_forward_mem2wb_rd_index_i == mem_forward_ex2mem_rs1_index_i )
                                                & mem_forward_mem2wb_rd_en_i & mem_forward_ex2mem_rs1_en_i;  

    assign mem_forward_ex_rs2_src_mem2wb_o  =   ( mem_forward_mem2wb_rd_index_i != `YSYX210092_REG_INDEX_SIZE'b0 )
                                                & ( mem_forward_mem2wb_rd_index_i == mem_forward_ex2mem_rs2_index_i )
                                                & mem_forward_mem2wb_rd_en_i & mem_forward_ex2mem_rs2_en_i;  
                                                
endmodule
module ysyx_210092_mem_top(
    input                       clk,
    input                       rst,

    /* control signals */
    input                       mem_top_inst_valid_i,
    input   [`YSYX210092_REG_INDEX_BUS]    mem_top_ex2mem_rs1_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    mem_top_ex2mem_rs2_index_i,
    input   [`YSYX210092_REG_INDEX_BUS]    mem_top_mem2wb_rd_index_i,

    input                       mem_top_ex2mem_rs1_en_i,
    input                       mem_top_ex2mem_rs2_en_i,
    input                       mem_top_mem2wb_rd_en_i,

    input   [`YSYX210092_CSR_INDEX_BUS]    mem_top_csr_index_i,
    input                       mem_top_inst_csr_i,
    input                       mem_top_inst_load_i,
    input                       mem_top_mem_write_i,
    input                       mem_top_mem_read_i,
    input   [`YSYX210092_STORE_TYPE_BUS]   mem_top_store_type_i,
    input   [`YSYX210092_LOAD_TYPE_BUS]    mem_top_load_type_i,
    input   [`YSYX210092_CSR_CTRL_BUS]     mem_top_csr_ctrl_i,
    input                       mem_top_inst_ecall_i,
    input                       mem_top_inst_ebreak_i,
    input                       mem_top_inst_mret_i,
    input                       mem_top_inst_trap_i,

    input                       mem_top_intp_en_i,


    output  [`YSYX210092_INST_ADDR_BUS]    mem_top_csr_nxt_pc_o,
    output                      mem_top_intp_en_o,
    output                      mem_top_csr_trap_o,

    output                      mem_top_access_ok_o,
    /* data signals */
    input   [`YSYX210092_REG_BUS]          mem_top_ex2mem_rs1_data_i,
    input   [`YSYX210092_REG_BUS]          mem_top_ex2mem_rs2_data_i,
    input   [`YSYX210092_DATA_BUS]         mem_top_imm_data_i,
    input   [`YSYX210092_DATA_BUS]         mem_top_ex2mem_rd_data_i,
    input   [`YSYX210092_DATA_BUS]         mem_top_mem2wb_rd_data_i,
    input   [`YSYX210092_INST_ADDR_BUS]    mem_top_ex2mem_inst_addr_i,

    output  [`YSYX210092_DATA_BUS]         mem_top_rd_data_o,

    /* bus interface */
    output                      mem_top_mem_valid_o,
    input                       mem_top_mem_ready_i,
    input   [`YSYX210092_DATA_BUS]         mem_top_mem_data_read_i,
    output  [`YSYX210092_DATA_BUS]         mem_top_mem_data_write_o,
    output  [`YSYX210092_DATA_ADDR_BUS]    mem_top_mem_addr_o,
    output  [1:0]               mem_top_mem_size_o,
    input   [1:0]               mem_top_mem_resp_i,
    output                      mem_top_mem_req_o
    `ifdef YSYX210092_DEFINE_DIFFTEST
    ,
    output                      mem_top_csr_skip_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mstatus_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mtvec_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mepc_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mcause_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mip_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mie_o,
    output  [`YSYX210092_REG_BUS]          mem_top_mscratch_o,
    output  [31:0]              mem_top_cause_o,
    output                      mem_top_clint_dstb_skip_o
    `endif
);

    wire                        mem_interface_access_ok_o;
    wire    [`YSYX210092_DATA_BUS]         mem_interface_read_data_o;
    wire                        mem_interface_valid_o;
    wire    [`YSYX210092_DATA_BUS]         mem_interface_data_write_o;
    wire    [`YSYX210092_DATA_ADDR_BUS]    mem_interface_addr_o;
    wire    [1:0]               mem_interface_size_o;
    wire                        mem_interface_req_o;

    wire                        mem_csr_csr_trap_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    mem_csr_csr_nxt_pc_o;
    wire    [`YSYX210092_DATA_BUS]         mem_csr_csr_read_o;
    
    `ifdef YSYX210092_DEFINE_DIFFTEST
    wire                        mem_csr_csr_skip_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mstatus_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mtvec_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mepc_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mcause_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mip_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mie_o;
    wire    [`YSYX210092_REG_BUS]          mem_csr_mscratch_o;
    wire    [31:0]              mem_csr_cause_o;
    `endif

    wire                        mem_clint_dstb_ready_o;
    wire    [`YSYX210092_DATA_BUS]         mem_clint_dstb_data_read_o;
    wire    [1:0]               mem_clint_dstb_resp_o;
    wire                        mem_clint_dstb_mem_valid_o;

    wire    [`YSYX210092_DATA_BUS]         mem_clint_dstb_mem_data_write_o;
    wire    [`YSYX210092_DATA_ADDR_BUS]    mem_clint_dstb_mem_addr_o;
    wire    [1:0]               mem_clint_dstb_mem_size_o;
    wire                        mem_clint_dstb_mem_req_o;
    
    wire                        mem_clint_dstb_clint_valid_o;
    wire    [`YSYX210092_DATA_BUS]         mem_clint_dstb_clint_data_write_o;
    wire    [`YSYX210092_DATA_ADDR_BUS]    mem_clint_dstb_clint_addr_o;
    wire    [1:0]               mem_clint_dstb_clint_size_o;
    wire                        mem_clint_dstb_clint_req_o;
    
    `ifdef YSYX210092_DEFINE_DIFFTEST
    wire                        mem_clint_dstb_skip_o;
    `endif


    wire                        mem_clint_clint_mtip_o;
    wire                        mem_clint_clint_update_o;
    wire                        mem_clint_clint_ready_o;
    wire    [`YSYX210092_DATA_BUS]         mem_clint_clint_data_read_o;
    wire    [1:0]               mem_clint_clint_resp_o;

    wire                        mem_forward_ex_rs1_src_ex2mem_o;
    wire                        mem_forward_ex_rs1_src_mem2wb_o;
    wire                        mem_forward_ex_rs2_src_ex2mem_o;
    wire                        mem_forward_ex_rs2_src_mem2wb_o;

    wire    [`YSYX210092_DATA_BUS]         rs1_data;
    wire    [`YSYX210092_DATA_BUS]         rs2_data;

    assign rs1_data                         =     ( { 64 { mem_forward_ex_rs1_src_ex2mem_o } } & mem_top_ex2mem_rs1_data_i )
                                                | ( { 64 { mem_forward_ex_rs1_src_mem2wb_o } } & mem_top_mem2wb_rd_data_i );
    assign rs2_data                         =     ( { 64 { mem_forward_ex_rs2_src_ex2mem_o } } & mem_top_ex2mem_rs2_data_i )
                                                | ( { 64 { mem_forward_ex_rs2_src_mem2wb_o } } & mem_top_mem2wb_rd_data_i );
    
    assign mem_top_csr_nxt_pc_o             =   mem_csr_csr_nxt_pc_o;
    assign mem_top_intp_en_o                =   mem_top_intp_en_i;
    assign mem_top_csr_trap_o               =   mem_csr_csr_trap_o;
    assign mem_top_access_ok_o              =   mem_interface_access_ok_o;
    assign mem_top_rd_data_o                =     ( { 64 { mem_top_inst_load_i } } &  mem_interface_read_data_o )
                                                | ( { 64 { mem_top_inst_csr_i } } & mem_csr_csr_read_o )
                                                | ( { 64 { ~mem_top_inst_load_i & ~mem_top_inst_csr_i } } & mem_top_ex2mem_rd_data_i );

    assign mem_top_mem_valid_o              =   mem_clint_dstb_mem_valid_o;
    assign mem_top_mem_data_write_o         =   mem_clint_dstb_mem_data_write_o;
    assign mem_top_mem_addr_o               =   mem_clint_dstb_mem_addr_o;
    assign mem_top_mem_size_o               =   mem_clint_dstb_mem_size_o;
    assign mem_top_mem_req_o                =   mem_clint_dstb_mem_req_o;
   
    `ifdef YSYX210092_DEFINE_DIFFTEST
    assign mem_top_csr_skip_o               =   mem_csr_csr_skip_o;
    assign mem_top_mstatus_o                =   mem_csr_mstatus_o;
    assign mem_top_mtvec_o                  =   mem_csr_mtvec_o;
    assign mem_top_mepc_o                   =   mem_csr_mepc_o;
    assign mem_top_mcause_o                 =   mem_csr_mcause_o;  
    assign mem_top_mip_o                    =   mem_csr_mip_o;
    assign mem_top_mie_o                    =   mem_csr_mie_o;
    assign mem_top_mscratch_o               =   mem_csr_mscratch_o;
    assign mem_top_cause_o                  =   mem_csr_cause_o;
    assign mem_top_clint_dstb_skip_o        =   mem_clint_dstb_skip_o;

    `endif
   
    ysyx_210092_mem_interface my_mem_interface(
        .clk( clk ),
        .rst( rst ),
        .mem_interface_intp_en_i( mem_top_intp_en_i ),
        .mem_interface_access_ok_o( mem_interface_access_ok_o ),

        /* ysyx_210092_cpu side */
        .mem_interface_inst_valid_i( mem_top_inst_valid_i ),
        .mem_interface_store_type_i( mem_top_store_type_i ),
        .mem_interface_load_type_i( mem_top_load_type_i ),
        .mem_interface_mem_write_i( mem_top_mem_write_i ),
        .mem_interface_mem_read_i( mem_top_mem_read_i ),
        .mem_interface_data_addr_i( mem_top_ex2mem_rd_data_i ),
        .mem_interface_write_data_i( rs2_data ),
        .mem_interface_read_data_o( mem_interface_read_data_o ),

        /* access side */
        .mem_interface_valid_o( mem_interface_valid_o ),
        .mem_interface_ready_i( mem_clint_dstb_ready_o ),
        .mem_interface_data_read_i( mem_clint_dstb_data_read_o ),
        .mem_interface_data_write_o( mem_interface_data_write_o ),
        .mem_interface_addr_o( mem_interface_addr_o ),
        .mem_interface_size_o( mem_interface_size_o ),
        .mem_interface_resp_i( mem_clint_dstb_resp_o ),
        .mem_interface_req_o( mem_interface_req_o )
    );

    ysyx_210092_mem_csr my_mem_csr(
        .clk( clk ),
        .rst( rst ),

        .mem_csr_inst_valid_i( mem_top_inst_valid_i ),

        .mem_csr_intp_en_i( mem_top_intp_en_i ),

        .mem_csr_csr_index_i( mem_top_csr_index_i ),
        .mem_csr_rs1_data_i( rs1_data ),
        .mem_csr_imm_csr_i( mem_top_imm_data_i ),
        .mem_csr_csr_ctrl_i( mem_top_csr_ctrl_i ),
        .mem_csr_inst_addr_i( mem_top_ex2mem_inst_addr_i ),
        .mem_csr_inst_trap_i( mem_top_inst_trap_i ),
        .mem_csr_inst_mret_i( mem_top_inst_mret_i ),
        .mem_csr_clint_mtip_i( mem_clint_clint_mtip_o ),
        .mem_csr_clint_update_i( mem_clint_clint_update_o ),
        .mem_csr_inst_ecall_i( mem_top_inst_ecall_i ),
        .mem_csr_inst_ebreak_i( mem_top_inst_ebreak_i ),

        .mem_csr_csr_trap_o( mem_csr_csr_trap_o ),
        .mem_csr_csr_nxt_pc_o( mem_csr_csr_nxt_pc_o ),
        .mem_csr_csr_read_o( mem_csr_csr_read_o )
        `ifdef YSYX210092_DEFINE_DIFFTEST
        ,
        .mem_csr_csr_skip_o( mem_csr_csr_skip_o ),
        .mem_csr_mstatus_o( mem_csr_mstatus_o ),
        .mem_csr_mtvec_o( mem_csr_mtvec_o ),
        .mem_csr_mepc_o( mem_csr_mepc_o ),
        .mem_csr_mcause_o( mem_csr_mcause_o ),
        .mem_csr_mip_o( mem_csr_mip_o),
        .mem_csr_mie_o( mem_csr_mie_o ),
        .mem_csr_mscratch_o( mem_csr_mscratch_o ),
        .mem_csr_cause_o( mem_csr_cause_o )
        `endif
    );

ysyx_210092_mem_clint_dstb my_mem_clint_dstb(
    /* input side */
    .mem_clint_dstb_valid_i( mem_interface_valid_o ),
    .mem_clint_dstb_ready_o( mem_clint_dstb_ready_o ),
    .mem_clint_dstb_data_read_o( mem_clint_dstb_data_read_o ),
    .mem_clint_dstb_data_write_i( mem_interface_data_write_o ),
    .mem_clint_dstb_addr_i( mem_interface_addr_o ),
    .mem_clint_dstb_size_i( mem_interface_size_o ),
    .mem_clint_dstb_resp_o( mem_clint_dstb_resp_o ),
    .mem_clint_dstb_req_i( mem_interface_req_o ),

    /* mem side */
    .mem_clint_dstb_mem_valid_o( mem_clint_dstb_mem_valid_o ),
    .mem_clint_dstb_mem_ready_i( mem_top_mem_ready_i ),
    .mem_clint_dstb_mem_data_read_i( mem_top_mem_data_read_i ),
    .mem_clint_dstb_mem_data_write_o( mem_clint_dstb_mem_data_write_o ),
    .mem_clint_dstb_mem_addr_o( mem_clint_dstb_mem_addr_o ),
    .mem_clint_dstb_mem_size_o( mem_clint_dstb_mem_size_o ),
    .mem_clint_dstb_mem_resp_i( mem_top_mem_resp_i ),
    .mem_clint_dstb_mem_req_o( mem_clint_dstb_mem_req_o ),

    /* clint side */
    .mem_clint_dstb_clint_valid_o( mem_clint_dstb_clint_valid_o ),
    .mem_clint_dstb_clint_ready_i(  mem_clint_clint_ready_o ),
    .mem_clint_dstb_clint_data_read_i( mem_clint_clint_data_read_o ),
    .mem_clint_dstb_clint_data_write_o( mem_clint_dstb_clint_data_write_o ),
    .mem_clint_dstb_clint_addr_o( mem_clint_dstb_clint_addr_o ),
    .mem_clint_dstb_clint_size_o( mem_clint_dstb_clint_size_o ),
    .mem_clint_dstb_clint_resp_i( mem_clint_clint_resp_o ),
    .mem_clint_dstb_clint_req_o( mem_clint_dstb_clint_req_o )
    
    `ifdef YSYX210092_DEFINE_DIFFTEST
    ,
    .mem_clint_dstb_skip_o( mem_clint_dstb_skip_o )
    `endif
);

ysyx_210092_mem_clint my_mem_clint(
    .clk( clk ),
    .rst( rst ),

    .mem_clint_clint_mtip_o( mem_clint_clint_mtip_o ),
    .mem_clint_clint_update_o( mem_clint_clint_update_o ),
    .mem_clint_clint_valid_i( mem_clint_dstb_clint_valid_o ),
    .mem_clint_clint_data_write_i( mem_clint_dstb_clint_data_write_o ),
    .mem_clint_clint_addr_i( mem_clint_dstb_clint_addr_o ),
    .mem_clint_clint_size_i( mem_clint_dstb_clint_size_o ),
    .mem_clint_clint_req_i( mem_clint_dstb_clint_req_o ),

    .mem_clint_clint_ready_o( mem_clint_clint_ready_o ),
    .mem_clint_clint_data_read_o( mem_clint_clint_data_read_o ),
    .mem_clint_clint_resp_o( mem_clint_clint_resp_o )
);

ysyx_210092_mem_forward my_mem_forward(
    .mem_forward_ex2mem_rs1_en_i( mem_top_ex2mem_rs1_en_i ),
    .mem_forward_ex2mem_rs2_en_i( mem_top_ex2mem_rs2_en_i ),
    .mem_forward_mem2wb_rd_en_i( mem_top_mem2wb_rd_en_i ),
    .mem_forward_ex2mem_rs1_index_i( mem_top_ex2mem_rs1_index_i ),
    .mem_forward_ex2mem_rs2_index_i( mem_top_ex2mem_rs2_index_i ),
    .mem_forward_mem2wb_rd_index_i( mem_top_mem2wb_rd_index_i ),
    
    .mem_forward_ex_rs1_src_ex2mem_o( mem_forward_ex_rs1_src_ex2mem_o ),
    .mem_forward_ex_rs1_src_mem2wb_o( mem_forward_ex_rs1_src_mem2wb_o ),
    .mem_forward_ex_rs2_src_ex2mem_o( mem_forward_ex_rs2_src_ex2mem_o ),
    .mem_forward_ex_rs2_src_mem2wb_o( mem_forward_ex_rs2_src_mem2wb_o )
);

    // wire temp   = ( mem_top_ex2mem_rd_data_i == 64'h00000000800004c0 );
    // always @( posedge clk ) begin
    //     if( temp & mem_top_mem_write_i & mem_top_inst_valid_i ) begin
    //         $write("%hwrite %h\n", mem_top_ex2mem_inst_addr_i, rs2_data );
    //     end
    //     if( temp & mem_top_mem_read_i & mem_top_inst_valid_i ) begin
    //         $write("%hread %h\n", mem_top_ex2mem_inst_addr_i, mem_top_rd_data_o );
    //     end
    // end
    
    // wire temp = ( mem_top_mem_addr_o < 64'h8000_0000 ) & ( mem_top_mem_size_o > 2'b10 );
    // always @( posedge temp ) begin
    //     if( mem_top_mem_read_i ) begin
    //         $write("%h read %h from %h", mem_top_ex2mem_inst_addr_i, mem_top_rd_data_o, mem_top_ex2mem_rd_data_i );
    //     end
    //     if( mem_top_mem_write_i ) begin
    //         $write("%h write %h at %h", mem_top_ex2mem_inst_addr_i, mem_top_rd_data_o, mem_top_ex2mem_rd_data_i );
    //     end
    // end

endmodule
module ysyx_210092_mem2wb(
    input                       clk,
    input                       rst,

    /* ysyx_210092_mem2wb control signals */
    input                       mem2wb_inst_valid_i,

    /* modules control signals */
    input   [`YSYX210092_REG_INDEX_BUS]    mem2wb_rd_index_i,
    input                       mem2wb_rd_en_i,
    input                       mem2wb_inst_trap_i,
    input                       mem2wb_intp_en_i,
    `ifdef YSYX210092_DEFINE_DIFFTEST
    input                       mem2wb_inst_csr_i,
    input   [`YSYX210092_INST_BUS]         mem2wb_inst_i,
    input   [`YSYX210092_INST_ADDR_BUS]    mem2wb_inst_addr_i,
    input                       mem2wb_inst_nop_i,
    input                       mem2wb_csr_skip_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mstatus_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mtvec_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mepc_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mcause_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mip_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mie_i,
    input   [`YSYX210092_REG_BUS]          mem2wb_mscratch_i,
    input   [31:0]              mem2wb_cause_i,
    input                       mem2wb_clint_dstb_skip_i,
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    input                       mem2wb_inst_selfdefine_i,
    `endif

    output  [`YSYX210092_REG_INDEX_BUS]    mem2wb_rd_index_o,
    output                      mem2wb_rd_en_o,
    output                      mem2wb_inst_trap_o,
    output                      mem2wb_intp_en_o,

    `ifdef YSYX210092_DEFINE_DIFFTEST
    output                      mem2wb_inst_csr_o,
    output  [`YSYX210092_INST_BUS]         mem2wb_inst_o,
    output  [`YSYX210092_INST_ADDR_BUS]    mem2wb_inst_addr_o,
    output                      mem2wb_inst_nop_o,
    output                      mem2wb_csr_skip_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mstatus_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mtvec_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mepc_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mcause_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mip_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mie_o,
    output  [`YSYX210092_REG_BUS]          mem2wb_mscratch_o,
    output  [31:0]              mem2wb_cause_o,
    output                      mem2wb_clint_dstb_skip_o,
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    output                      mem2wb_inst_selfdefine_o,
    `endif

    /* data signals */
    input   [`YSYX210092_DATA_BUS]         mem2wb_rd_data_i,
    input   [`YSYX210092_INST_ADDR_BUS]    mem2wb_csr_nxt_pc_i,

    output  [`YSYX210092_DATA_BUS]         mem2wb_rd_data_o,
    output  [`YSYX210092_INST_ADDR_BUS]    mem2wb_csr_nxt_pc_o
);

    reg     [`YSYX210092_REG_INDEX_BUS]    rd_index_r;

    reg                         rd_en_r;
    reg                         inst_trap_r;
    reg                         intp_en_r;

    `ifdef YSYX210092_DEFINE_DIFFTEST
    reg                         inst_csr_r;
    reg     [`YSYX210092_INST_BUS]         inst_r;
    reg     [`YSYX210092_INST_ADDR_BUS]    inst_addr_r;
    reg                         inst_nop_r;
    reg                         csr_skip_r;
    reg     [`YSYX210092_REG_BUS]          mstatus_r;
    reg     [`YSYX210092_REG_BUS]          mtvec_r;
    reg     [`YSYX210092_REG_BUS]          mepc_r;
    reg     [`YSYX210092_REG_BUS]          mcause_r;
    reg     [`YSYX210092_REG_BUS]          mip_r;
    reg     [`YSYX210092_REG_BUS]          mie_r;
    reg     [`YSYX210092_REG_BUS]          mscratch_r;
    reg     [31:0]              cause_r;
    reg                         clint_dstb_skip_r;
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    reg                         inst_selfdefine_r;
    `endif

    reg     [`YSYX210092_DATA_BUS]         rd_data_r;
    reg     [`YSYX210092_INST_ADDR_BUS]    csr_nxt_pc_r;

    wire                        flow_en;
    wire                        intp_en;

    assign mem2wb_rd_index_o         =   rd_index_r;
    
    assign mem2wb_rd_en_o            =   rd_en_r;
    assign mem2wb_inst_trap_o        =   inst_trap_r;
    assign mem2wb_intp_en_o          =   intp_en_r;

    `ifdef YSYX210092_DEFINE_DIFFTEST
    assign mem2wb_inst_csr_o         =   inst_csr_r;
    assign mem2wb_inst_o             =   inst_r;
    assign mem2wb_inst_addr_o        =   inst_addr_r;
    assign mem2wb_inst_nop_o         =   inst_nop_r;
    assign mem2wb_csr_skip_o         =   csr_skip_r;
    assign mem2wb_mstatus_o          =   mstatus_r;
    assign mem2wb_mtvec_o            =   mtvec_r;
    assign mem2wb_mepc_o             =   mepc_r;
    assign mem2wb_mcause_o           =   mcause_r;
    assign mem2wb_mip_o              =   mip_r;
    assign mem2wb_mie_o              =   mie_r;
    assign mem2wb_mscratch_o         =   mscratch_r;
    assign mem2wb_cause_o            =   cause_r;
    assign mem2wb_clint_dstb_skip_o  =   clint_dstb_skip_r;
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    assign mem2wb_inst_selfdefine_o  =   inst_selfdefine_r;
    `endif

    assign mem2wb_rd_data_o          =   rd_data_r;
    assign mem2wb_csr_nxt_pc_o       =   csr_nxt_pc_r;

    assign flow_en                   =   mem2wb_inst_valid_i;
    assign intp_en                   =   mem2wb_inst_valid_i & mem2wb_intp_en_i;

    always @( posedge clk ) begin
        if( rst | intp_en ) begin
            rd_index_r <= `YSYX210092_REG_INDEX_SIZE'b0;
        end
        else if( flow_en ) begin
            rd_index_r <= mem2wb_rd_index_i;
        end
        else begin
            rd_index_r <= rd_index_r;
        end
    end
    
    always @( posedge clk ) begin
        if( rst | intp_en ) begin
            rd_en_r <= 1'b0;        
        end
        else if( flow_en ) begin
            rd_en_r <= mem2wb_rd_en_i;
        end
        else begin
            rd_en_r <= rd_en_r;
        end
    end

    always @( posedge clk ) begin
        if( rst | intp_en ) begin
            inst_trap_r <= 1'b0;        
        end
        else if( flow_en ) begin
            inst_trap_r <= mem2wb_inst_trap_i;
        end
        else begin
            inst_trap_r <= inst_trap_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            intp_en_r <= 1'b0;        
        end
        else if( flow_en ) begin
            intp_en_r <= mem2wb_intp_en_i;
        end
        else begin
            intp_en_r <= intp_en_r;
        end
    end

    `ifdef YSYX210092_DEFINE_DIFFTEST
    always @( posedge clk ) begin
        if( rst ) begin
            inst_csr_r <= 1'b0;
        end
        else if( flow_en ) begin
            inst_csr_r <= mem2wb_inst_csr_i;
        end
        else begin
            inst_csr_r <= inst_csr_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            inst_r <= `YSYX210092_INST_NOP;
        end
        else if( flow_en ) begin
            inst_r <= mem2wb_inst_i;
        end
        else begin
            inst_r <= inst_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            inst_addr_r <= 64'b0;
        end
        else if( flow_en ) begin
            inst_addr_r <= mem2wb_inst_addr_i;
        end
        else begin
            inst_addr_r <= inst_addr_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            inst_nop_r <= 1'b1;
        end
        else if( flow_en ) begin
            inst_nop_r <= mem2wb_inst_nop_i;
        end
        else begin
            inst_nop_r <= inst_nop_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            csr_skip_r <= 1'b0;
        end
        else if( flow_en ) begin
            csr_skip_r <= mem2wb_csr_skip_i;
        end
        else begin
            csr_skip_r <= csr_skip_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mstatus_r <= 64'b0;
        end
        else if( flow_en ) begin
            mstatus_r <= mem2wb_mstatus_i;
        end
        else begin
            mstatus_r <= mstatus_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mtvec_r <= 64'b0;
        end
        else if( flow_en ) begin
            mtvec_r <= mem2wb_mtvec_i;
        end
        else begin
            mtvec_r <= mtvec_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mepc_r <= 64'b0;
        end
        else if( flow_en ) begin
            mepc_r <= mem2wb_mepc_i;
        end
        else begin
            mepc_r <= mepc_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mcause_r <= 64'b0;
        end
        else if( flow_en ) begin
            mcause_r <= mem2wb_mcause_i;
        end
        else begin
            mcause_r <= mcause_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mip_r <= 64'b0;
        end
        else if( flow_en ) begin
            mip_r <= mem2wb_mip_i;
        end
        else begin
            mip_r <= mip_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mie_r <= 64'b0;
        end
        else if( flow_en ) begin
            mie_r <= mem2wb_mie_i;
        end
        else begin
            mie_r <= mie_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            mscratch_r <= 64'b0;
        end
        else if( flow_en ) begin
            mscratch_r <= mem2wb_mscratch_i;
        end
        else begin
            mscratch_r <= mscratch_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            cause_r <= 32'b0;
        end
        else if( flow_en ) begin
            cause_r <= mem2wb_cause_i;
        end
        else begin
            cause_r <= cause_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            clint_dstb_skip_r <= 1'b0;   
        end
        else if( flow_en ) begin
            clint_dstb_skip_r <= mem2wb_clint_dstb_skip_i;
        end
        else begin
            clint_dstb_skip_r <= clint_dstb_skip_r;
        end
    end
    `endif

    `ifdef YSYX210092_DEFINE_PUTCH
    always @( posedge clk ) begin
        if( rst | intp_en ) begin
            inst_selfdefine_r <= 1'b0;   
        end
        else if( flow_en ) begin
            inst_selfdefine_r <= mem2wb_inst_selfdefine_i;
        end
        else begin
            inst_selfdefine_r <= inst_selfdefine_r;
        end
    end
    `endif

    always @( posedge clk ) begin
        if( rst | intp_en ) begin
            rd_data_r <= 64'b0;   
        end
        else if( flow_en ) begin
            rd_data_r <= mem2wb_rd_data_i;
        end
        else begin
            rd_data_r <= rd_data_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            csr_nxt_pc_r <= 64'b0;   
        end
        else if( flow_en ) begin
            csr_nxt_pc_r <= mem2wb_csr_nxt_pc_i;
        end
        else begin
            csr_nxt_pc_r <= csr_nxt_pc_r;
        end
    end

endmodule
module ysyx_210092_pipeline_ctrl(
    input                       clk,
    input                       rst,

    input                       pipeline_ctrl_fetched_ok_i,

    input                       pipeline_ctrl_id_inst_branch_i,
    input                       pipeline_ctrl_id_inst_jump_i,
    input                       pipeline_ctrl_id_inst_trap_i,
    input                       pipeline_ctrl_id_rs1_src_id2ex_i,
    input                       pipeline_ctrl_id_rs1_src_ex2mem_i,
    input                       pipeline_ctrl_id_rs2_src_id2ex_i,
    input                       pipeline_ctrl_id_rs2_src_ex2mem_i,

    input                       pipeline_ctrl_id2ex_inst_nop_i,
    input                       pipeline_ctrl_id2ex_inst_branch_i,
    input                       pipeline_ctrl_id2ex_inst_jump_i,
    input                       pipeline_ctrl_id2ex_inst_trap_i,
    input                       pipeline_ctrl_id2ex_inst_load_i,
    input                       pipeline_ctrl_id2ex_inst_csr_i,
    input                       pipeline_ctrl_id2ex_inst_arth_lgc_i,
    input                       pipeline_ctrl_id2ex_inst_auipc_i,
    input                       pipeline_ctrl_ex_rs1_src_ex2mem_i,
    input                       pipeline_ctrl_ex_rs2_src_ex2mem_i,
    input                       pipeline_ctrl_ex_rs1_src_mem2wb_i,
    input                       pipeline_ctrl_ex_rs2_src_mem2wb_i,

    input                       pipeline_ctrl_access_ok_i,
    input                       pipeline_ctrl_mem_csr_trap_i,
    input                       pipeline_ctrl_ex2mem_inst_trap_i,
    input                       pipeline_ctrl_ex2mem_inst_load_i,
    input                       pipeline_ctrl_ex2mem_mem_read_i,
    input                       pipeline_ctrl_ex2mem_mem_write_i,
    input                       pipeline_ctrl_ex2mem_inst_csr_i,

    input                       pipeline_ctrl_mem2wb_inst_trap_i,
    input                       pipeline_ctrl_mem2wb_intp_en_i,


    output                      pipeline_ctrl_inst_valid_o,

    output                      pipeline_ctrl_dont_fetch_o,
    output                      pipeline_ctrl_if_flush_o,
    output                      pipeline_ctrl_id_stall_o,
    output                      pipeline_ctrl_id_flush_o,
    output                      pipeline_ctrl_ex_stall_o,
    output                      pipeline_ctrl_ex_flush_o,
    
    output                      pipeline_ctrl_ex_rs1_src_buffer_o,
    output                      pipeline_ctrl_ex_rs2_src_buffer_o,
    output                      pipeline_ctrl_ex_rs1_buffered_o,
    output                      pipeline_ctrl_ex_rs2_buffered_o,  
    output                      pipeline_ctrl_intp_en_o 
);
    wire                        mem_access;
    wire                        id_rsx_src_id2ex;
    wire                        id_rsx_src_ex2mem;
    wire                        ex_rsx_src_ex2mem;
    wire                        id2ex_load_csr;
    wire                        ex2mem_load_csr;
    wire                        intp_en;
    wire                        if_trap_flush;
    wire                        if_jumpbranch_flush;
    reg                         ex_rs1_src_buffered_r;
    reg                         ex_rs2_src_buffered_r;
    reg                         intp_en_r;

    assign mem_access                               =   pipeline_ctrl_ex2mem_mem_read_i | pipeline_ctrl_ex2mem_mem_write_i;
    assign id_rsx_src_id2ex                         =   pipeline_ctrl_id_rs1_src_id2ex_i | pipeline_ctrl_id_rs2_src_id2ex_i;
    assign id_rsx_src_ex2mem                        =   pipeline_ctrl_id_rs1_src_ex2mem_i | pipeline_ctrl_id_rs2_src_ex2mem_i;
    assign ex_rsx_src_ex2mem                        =   pipeline_ctrl_ex_rs1_src_ex2mem_i | pipeline_ctrl_ex_rs2_src_ex2mem_i;
    assign id2ex_load_csr                           =   pipeline_ctrl_id2ex_inst_load_i | pipeline_ctrl_id2ex_inst_csr_i;
    assign ex2mem_load_csr                          =   pipeline_ctrl_ex2mem_inst_load_i | pipeline_ctrl_ex2mem_inst_csr_i;
    assign intp_en                                  =   pipeline_ctrl_intp_en_o | pipeline_ctrl_mem2wb_intp_en_i;
    assign if_trap_flush                            =   pipeline_ctrl_id_inst_trap_i | pipeline_ctrl_id2ex_inst_trap_i 
                                                        | pipeline_ctrl_ex2mem_inst_trap_i | pipeline_ctrl_mem2wb_inst_trap_i 
                                                        | intp_en;
    assign if_jumpbranch_flush                        =   pipeline_ctrl_id_inst_jump_i | pipeline_ctrl_id_inst_branch_i | pipeline_ctrl_id2ex_inst_jump_i
                                                        | pipeline_ctrl_id2ex_inst_branch_i;

    assign pipeline_ctrl_inst_valid_o               =   pipeline_ctrl_fetched_ok_i & ( ~mem_access | ( mem_access & pipeline_ctrl_access_ok_i ) );
    assign pipeline_ctrl_dont_fetch_o               =   pipeline_ctrl_if_flush_o  | pipeline_ctrl_id_stall_o;
    assign pipeline_ctrl_if_flush_o                 =   if_trap_flush | ( if_jumpbranch_flush & ~pipeline_ctrl_id_stall_o );
    assign pipeline_ctrl_id_stall_o                 =   pipeline_ctrl_ex_stall_o | ( id_rsx_src_id2ex & ( pipeline_ctrl_id2ex_inst_arth_lgc_i | pipeline_ctrl_id2ex_inst_auipc_i | id2ex_load_csr ) )
                                                        | ( id_rsx_src_ex2mem & ex2mem_load_csr );
    assign pipeline_ctrl_id_flush_o                 =   intp_en | ( pipeline_ctrl_id_stall_o & ~pipeline_ctrl_ex_stall_o );
    assign pipeline_ctrl_ex_stall_o                 =   ex_rsx_src_ex2mem & ex2mem_load_csr;
    assign pipeline_ctrl_ex_flush_o                 =   intp_en | pipeline_ctrl_ex_stall_o;
    assign pipeline_ctrl_ex_rs1_src_buffer_o        =   ex_rs1_src_buffered_r;
    assign pipeline_ctrl_ex_rs2_src_buffer_o        =   ex_rs2_src_buffered_r;           

    assign pipeline_ctrl_intp_en_o                  =   intp_en_r;

    assign pipeline_ctrl_ex_rs1_buffered_o          =   pipeline_ctrl_ex_rs1_src_mem2wb_i & pipeline_ctrl_ex_stall_o;
    assign pipeline_ctrl_ex_rs2_buffered_o          =   pipeline_ctrl_ex_rs2_src_mem2wb_i & pipeline_ctrl_ex_stall_o;

    always @( posedge clk ) begin
        if( rst ) begin
            intp_en_r <= 1'b0;
        end
        else if( pipeline_ctrl_inst_valid_o ) begin
            intp_en_r <= pipeline_ctrl_mem_csr_trap_i & ~pipeline_ctrl_ex2mem_inst_trap_i 
                        & ~pipeline_ctrl_id2ex_inst_nop_i & ~intp_en_r & ~pipeline_ctrl_ex_stall_o;
        end
        else begin
            intp_en_r <= intp_en_r;
        end
    end
    always @( posedge clk ) begin
        if( rst ) begin
            ex_rs1_src_buffered_r <= 1'b0;
        end
        else if( pipeline_ctrl_inst_valid_o ) begin
            if( pipeline_ctrl_intp_en_o ) begin
                ex_rs1_src_buffered_r <= 1'b0;
            end
            else if( pipeline_ctrl_ex_rs1_buffered_o ) begin
                ex_rs1_src_buffered_r <= 1'b1;
            end
            else if( ex_rs1_src_buffered_r ) begin
                ex_rs1_src_buffered_r <= 1'b0;
            end
            else begin
                ex_rs1_src_buffered_r <= ex_rs1_src_buffered_r;
            end
        end
        else begin
            ex_rs1_src_buffered_r <= ex_rs1_src_buffered_r;
        end
    end

    always @( posedge clk ) begin
        if( rst ) begin
            ex_rs2_src_buffered_r <= 1'b0;
        end
        else if( pipeline_ctrl_inst_valid_o ) begin
            if( pipeline_ctrl_intp_en_o ) begin
                ex_rs2_src_buffered_r <= 1'b0;
            end
            else if( pipeline_ctrl_ex_rs2_buffered_o ) begin
                ex_rs2_src_buffered_r <= 1'b1;
            end
            else if( ex_rs2_src_buffered_r ) begin
                ex_rs2_src_buffered_r <= 1'b0;
            end
            else begin
                ex_rs2_src_buffered_r <= ex_rs2_src_buffered_r;
            end
        end
        else begin
            ex_rs2_src_buffered_r <= ex_rs2_src_buffered_r;
        end
    end
endmodule
module ysyx_210092_cpu(
    input                       clock,
    input                       reset,
    
    input                       if_ready,
    input   [`YSYX210092_DATA_BUS]         if_data_read,
    input   [1:0]               if_resp,
    output                      if_valid,
    output  [`YSYX210092_INST_ADDR_BUS]    if_addr,
    output  [1:0]               if_size,
    output                      if_req,

    output                      cpu_mem_valid,
    input                       cpu_mem_ready,
    input   [`YSYX210092_DATA_BUS]         cpu_mem_data_read,
    output  [`YSYX210092_DATA_BUS]         cpu_mem_data_write,
    output  [`YSYX210092_DATA_ADDR_BUS]    cpu_mem_addr,
    output  [1:0]               cpu_mem_size,
    input   [1:0]               cpu_mem_resp,
    output                      cpu_mem_req
);

    /* ysyx_210092_if_top */
    wire                        if_top_fetched_ok_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    if_top_inst_addr_o;
    wire    [`YSYX210092_INST_BUS]         if_top_inst_o;

    /* ysyx_210092_if2id */
    wire                        if2id_inst_nop_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    if2id_inst_addr_o;
    wire    [`YSYX210092_INST_BUS]         if2id_inst_o;

    /* ysyx_210092_id_top */
    wire    [`YSYX210092_REG_INDEX_BUS]    id_top_rs1_index_o;
    wire    [`YSYX210092_REG_INDEX_BUS]    id_top_rs2_index_o;
    wire    [`YSYX210092_REG_INDEX_BUS]    id_top_rd_index_o;
    wire    [`YSYX210092_CSR_INDEX_BUS]    id_top_csr_index_o;
    wire                        id_top_id_rs1_src_id2ex_o;
    wire                        id_top_id_rs1_src_ex2mem_o;
    wire                        id_top_id_rs2_src_id2ex_o;
    wire                        id_top_id_rs2_src_ex2mem_o;
    wire                        id_top_rs1_en_o;
    wire                        id_top_rs2_en_o;
    wire                        id_top_rd_en_o;
    wire                        id_top_inst_jump_o;
    wire                        id_top_inst_branch_o;
    wire                        id_top_inst_word_o;
    wire                        id_top_inst_slt_nu_o;
    wire                        id_top_inst_slt_u_o;
    wire                        id_top_inst_shift_o;
    wire                        id_top_alu_src_pc_o;
    wire                        id_top_alu_src_imm_o;
    wire                        id_top_shift_num_src_o;
    wire    [`YSYX210092_SHIFT_TYPE_BUS]   id_top_shift_type_o;
    wire                        id_top_inst_arth_lgc_o;
    wire                        id_top_inst_auipc_o;
    wire    [`YSYX210092_ALU_OP_BUS]       id_top_alu_op_o;
    wire                        id_top_inst_csr_o;
    wire                        id_top_inst_load_o;
    wire                        id_top_mem_write_o;
    wire                        id_top_mem_read_o;
    wire    [`YSYX210092_STORE_TYPE_BUS]   id_top_store_type_o;
    wire    [`YSYX210092_LOAD_TYPE_BUS]    id_top_load_type_o;
    wire    [`YSYX210092_CSR_CTRL_BUS]     id_top_csr_ctrl_o;
    wire                        id_top_inst_ecall_o;
    wire                        id_top_inst_ebreak_o;
    wire                        id_top_inst_mret_o;
    wire                        id_top_inst_trap_o;
    wire                        id_top_jumpbranch_en_o;

    `ifdef YSYX210092_DEFINE_PUTCH
    wire                        id_top_inst_selfdefine_o;
    `endif

    wire    [`YSYX210092_REG_BUS]          id_top_rs1_data_o;
    wire    [`YSYX210092_REG_BUS]          id_top_rs2_data_o;
    wire    [`YSYX210092_DATA_BUS]         id_top_imm_data_o;
    wire    [`YSYX210092_DATA_BUS]         id_top_rd_data_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    id_top_inst_addr_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    id_top_jumpbranch_addr_o;

    `ifdef YSYX210092_DEFINE_DIFFTEST  
    wire      [`YSYX210092_REG_BUS]        id_top_regs_o[31:0];
    `endif

    /* ysyx_210092_id2ex */
    wire    [`YSYX210092_REG_INDEX_BUS]    id2ex_rs1_index_o;
    wire    [`YSYX210092_REG_INDEX_BUS]    id2ex_rs2_index_o;
    wire    [`YSYX210092_REG_INDEX_BUS]    id2ex_rd_index_o;
    wire    [`YSYX210092_CSR_INDEX_BUS]    id2ex_csr_index_o;
    wire                        id2ex_inst_nop_o;
    wire                        id2ex_rs1_en_o;
    wire                        id2ex_rs2_en_o;
    wire                        id2ex_rd_en_o;
    wire                        id2ex_inst_jump_o;
    wire                        id2ex_inst_branch_o;
    wire                        id2ex_inst_word_o;
    wire                        id2ex_inst_slt_nu_o;
    wire                        id2ex_inst_slt_u_o;
    wire                        id2ex_inst_shift_o;
    wire                        id2ex_alu_src_pc_o;
    wire                        id2ex_alu_src_imm_o;
    wire                        id2ex_shift_num_src_o;
    wire    [`YSYX210092_SHIFT_TYPE_BUS]   id2ex_shift_type_o;
    wire                        id2ex_inst_arth_lgc_o;
    wire                        id2ex_inst_auipc_o;
    wire    [`YSYX210092_ALU_OP_BUS]       id2ex_alu_op_o;
    wire                        id2ex_inst_csr_o;
    wire                        id2ex_inst_load_o;
    wire                        id2ex_mem_write_o;
    wire                        id2ex_mem_read_o;
    wire    [`YSYX210092_STORE_TYPE_BUS]   id2ex_store_type_o;
    wire    [`YSYX210092_LOAD_TYPE_BUS]    id2ex_load_type_o;
    wire    [`YSYX210092_CSR_CTRL_BUS]     id2ex_csr_ctrl_o;
    wire                        id2ex_inst_ecall_o;
    wire                        id2ex_inst_ebreak_o;
    wire                        id2ex_inst_mret_o;
    wire                        id2ex_inst_trap_o;
    wire                        id2ex_jumpbranch_en_o;
    `ifdef YSYX210092_DEFINE_PUTCH
    wire                        id2ex_inst_selfdefine_o;
    `endif
    `ifdef YSYX210092_DEFINE_DIFFTEST
    wire    [`YSYX210092_INST_BUS]         id2ex_inst_o;
    `endif
    wire    [`YSYX210092_REG_BUS]          id2ex_rs1_data_o;
    wire    [`YSYX210092_REG_BUS]          id2ex_rs2_data_o;
    wire    [`YSYX210092_DATA_BUS]         id2ex_imm_data_o;
    wire    [`YSYX210092_DATA_BUS]         id2ex_rd_data_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    id2ex_inst_addr_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    id2ex_jumpbranch_addr_o;

    /* ysyx_210092_ex_top */
    wire                        ex_top_ex_rs1_src_ex2mem_o;
    wire                        ex_top_ex_rs2_src_ex2mem_o;
    wire                        ex_top_ex_rs1_src_mem2wb_o;
    wire                        ex_top_ex_rs2_src_mem2wb_o;
    wire    [`YSYX210092_DATA_BUS]         ex_top_rs1_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex_top_rs2_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex_top_rd_data_o;

    /* ysyx_210092_ex2mem */
    wire    [`YSYX210092_REG_INDEX_BUS]    ex2mem_rs1_index_o;
    wire    [`YSYX210092_REG_INDEX_BUS]    ex2mem_rs2_index_o;
    wire    [`YSYX210092_REG_INDEX_BUS]    ex2mem_rd_index_o;
    wire                        ex2mem_rs1_en_o;
    wire                        ex2mem_rs2_en_o;
    wire                        ex2mem_rd_en_o;
    wire    [`YSYX210092_CSR_INDEX_BUS]    ex2mem_csr_index_o;
    wire                        ex2mem_inst_csr_o;
    wire                        ex2mem_inst_load_o;
    wire                        ex2mem_mem_write_o;
    wire                        ex2mem_mem_read_o;
    wire    [`YSYX210092_STORE_TYPE_BUS]   ex2mem_store_type_o;
    wire    [`YSYX210092_LOAD_TYPE_BUS]    ex2mem_load_type_o;
    wire    [`YSYX210092_CSR_CTRL_BUS]     ex2mem_csr_ctrl_o;
    wire                        ex2mem_inst_ecall_o;
    wire                        ex2mem_inst_ebreak_o;
    wire                        ex2mem_inst_mret_o;
    wire                        ex2mem_inst_trap_o;
    `ifdef YSYX210092_DEFINE_DIFFTEST
    wire                        ex2mem_inst_nop_o;
    wire    [`YSYX210092_INST_BUS]         ex2mem_inst_o;
    `endif
    `ifdef YSYX210092_DEFINE_PUTCH
    wire                        ex2mem_inst_selfdefine_o;
    `endif
    wire    [`YSYX210092_REG_BUS]          ex2mem_rs1_data_o;
    wire    [`YSYX210092_REG_BUS]          ex2mem_rs2_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex2mem_imm_data_o;
    wire    [`YSYX210092_DATA_BUS]         ex2mem_rd_data_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    ex2mem_inst_addr_o;

    /* ysyx_210092_mem_top */
    wire    [`YSYX210092_INST_ADDR_BUS]    mem_top_csr_nxt_pc_o;
    wire                        mem_top_intp_en_o;
    wire                        mem_top_csr_trap_o;
    wire                        mem_top_access_ok_o;
    wire    [`YSYX210092_DATA_BUS]         mem_top_rd_data_o;
    `ifdef YSYX210092_DEFINE_DIFFTEST
    wire                        mem_top_csr_skip_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mstatus_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mtvec_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mepc_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mcause_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mip_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mie_o;
    wire    [`YSYX210092_REG_BUS]          mem_top_mscratch_o;
    wire    [31:0]              mem_top_cause_o;
    wire                        mem_top_clint_dstb_skip_o;
    `endif

    /* ysyx_210092_mem2wb */
    wire    [`YSYX210092_REG_INDEX_BUS]    mem2wb_rd_index_o;
    wire                        mem2wb_rd_en_o;
    wire                        mem2wb_inst_trap_o;
    wire                        mem2wb_intp_en_o;
    `ifdef YSYX210092_DEFINE_DIFFTEST
    wire                        mem2wb_inst_csr_o;
    wire                        mem2wb_inst_nop_o;
    wire                        mem2wb_csr_skip_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mstatus_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mtvec_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mepc_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mcause_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mip_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mie_o;
    wire    [`YSYX210092_REG_BUS]          mem2wb_mscratch_o;
    wire    [31:0]              mem2wb_cause_o;
    wire                        mem2wb_clint_dstb_skip_o;
    wire    [`YSYX210092_INST_BUS]         mem2wb_inst_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    mem2wb_inst_addr_o;
    `endif
    `ifdef YSYX210092_DEFINE_PUTCH
    wire                        mem2wb_inst_selfdefine_o;
    `endif
    wire    [`YSYX210092_DATA_BUS]         mem2wb_rd_data_o;
    wire    [`YSYX210092_INST_ADDR_BUS]    mem2wb_csr_nxt_pc_o;

    /* pipeline_control */
    wire                        pipeline_ctrl_inst_valid_o;
    wire                        pipeline_ctrl_dont_fetch_o;
    wire                        pipeline_ctrl_if_flush_o;
    wire                        pipeline_ctrl_id_stall_o;
    wire                        pipeline_ctrl_id_flush_o;
    wire                        pipeline_ctrl_ex_stall_o;
    wire                        pipeline_ctrl_ex_flush_o;
    wire                        pipeline_ctrl_intp_en_o;
    wire                        pipeline_ctrl_ex_rs1_src_buffer_o;
    wire                        pipeline_ctrl_ex_rs2_src_buffer_o;
    wire                        pipeline_ctrl_ex_rs1_buffered_o;
    wire                        pipeline_ctrl_ex_rs2_buffered_o;
    /* wb */
    wire                        wb_trap_en_o;

    assign wb_trap_en_o             =   mem2wb_intp_en_o | mem2wb_inst_trap_o;

    ysyx_210092_if_top my_if_top(
        .clk( clock ),
        .rst( reset ),

        /* control signals */
        .if_top_jumpbranch_en_i( id2ex_jumpbranch_en_o ),
        .if_top_trap_en_i( wb_trap_en_o ),
        .if_top_inst_valid_i( pipeline_ctrl_inst_valid_o ),
        .if_top_dont_fetch_i( pipeline_ctrl_dont_fetch_o ),

        .if_top_fetched_ok_o( if_top_fetched_ok_o ),

        /* data signals */
        .if_top_jumpbranch_addr_i( id2ex_jumpbranch_addr_o ),
        .if_top_csr_nxt_pc_i( mem2wb_csr_nxt_pc_o ),


        /* bus interface */
        .if_top_if_ready_i( if_ready ),
        .if_top_if_data_read_i( if_data_read ),
        .if_top_if_resp_i( if_resp ),

        .if_top_inst_addr_o( if_top_inst_addr_o ),
        .if_top_if_valid_o( if_valid ),
        .if_top_if_addr_o( if_addr ),
        .if_top_if_size_o( if_size ),
        .if_top_inst_o( if_top_inst_o ),
        .if_top_if_req_o( if_req )
    );

    ysyx_210092_if2id my_if2id(
        .clk( clock ),
        .rst( reset ),

        /* ysyx_210092_if2id control signals */
        .if2id_inst_valid_i( pipeline_ctrl_inst_valid_o ),
        .if2id_if_flush_i( pipeline_ctrl_if_flush_o ),
        .if2id_id_stall_i( pipeline_ctrl_id_stall_o ),
        /* modules controls signals */    
        .if2id_inst_nop_o( if2id_inst_nop_o ),

        /* data signals */
        .if2id_inst_addr_i( if_top_inst_addr_o ),
        .if2id_inst_i( if_top_inst_o ),

        .if2id_inst_addr_o( if2id_inst_addr_o ),
        .if2id_inst_o( if2id_inst_o )
    );

    ysyx_210092_id_top my_id_top(
        .clk( clock ),
        .rst( reset ),

        /* control signals */
        .id_top_inst_valid_i( pipeline_ctrl_inst_valid_o ),


        .id_top_id2ex_rd_en_i( id2ex_rd_en_o ),
        .id_top_ex2mem_rd_en_i( ex2mem_rd_en_o ),
        .id_top_mem2wb_rd_en_i( mem2wb_rd_en_o ),

        .id_top_id2ex_rd_index_i( id2ex_rd_index_o ),
        .id_top_ex2mem_rd_index_i( ex2mem_rd_index_o ),
        .id_top_mem2wb_rd_index_i( mem2wb_rd_index_o ),

        .id_top_rs1_index_o( id_top_rs1_index_o ),
        .id_top_rs2_index_o( id_top_rs2_index_o ),
        .id_top_rd_index_o( id_top_rd_index_o ),
        .id_top_csr_index_o( id_top_csr_index_o ),


        .id_top_id_rs1_src_id2ex_o( id_top_id_rs1_src_id2ex_o ),
        .id_top_id_rs1_src_ex2mem_o( id_top_id_rs1_src_ex2mem_o ),
        .id_top_id_rs2_src_id2ex_o( id_top_id_rs2_src_id2ex_o ),
        .id_top_id_rs2_src_ex2mem_o( id_top_id_rs2_src_ex2mem_o ),

        .id_top_rs1_en_o( id_top_rs1_en_o ),
        .id_top_rs2_en_o( id_top_rs2_en_o ),
        .id_top_rd_en_o( id_top_rd_en_o ),
        .id_top_inst_jump_o( id_top_inst_jump_o ),
        .id_top_inst_branch_o( id_top_inst_branch_o ),

        .id_top_inst_word_o( id_top_inst_word_o ),
        .id_top_inst_slt_nu_o( id_top_inst_slt_nu_o ),
        .id_top_inst_slt_u_o( id_top_inst_slt_u_o ),
        .id_top_inst_shift_o( id_top_inst_shift_o ),
        .id_top_alu_src_pc_o( id_top_alu_src_pc_o ),
        .id_top_alu_src_imm_o( id_top_alu_src_imm_o ),
        .id_top_shift_num_src_o( id_top_shift_num_src_o ),
        .id_top_shift_type_o( id_top_shift_type_o ),
        .id_top_inst_arth_lgc_o( id_top_inst_arth_lgc_o ),
        .id_top_inst_auipc_o( id_top_inst_auipc_o ),
        .id_top_alu_op_o( id_top_alu_op_o ),

        .id_top_inst_csr_o( id_top_inst_csr_o ),
        .id_top_inst_load_o( id_top_inst_load_o ),
        .id_top_mem_write_o( id_top_mem_write_o ),
        .id_top_mem_read_o( id_top_mem_read_o ),
        .id_top_store_type_o( id_top_store_type_o ),
        .id_top_load_type_o( id_top_load_type_o ),
        .id_top_csr_ctrl_o( id_top_csr_ctrl_o ),
        .id_top_inst_ecall_o( id_top_inst_ecall_o ),
        .id_top_inst_ebreak_o( id_top_inst_ebreak_o ),
        .id_top_inst_mret_o( id_top_inst_mret_o ),
        .id_top_inst_trap_o( id_top_inst_trap_o ),

        .id_top_jumpbranch_en_o( id_top_jumpbranch_en_o ),

        `ifdef YSYX210092_DEFINE_PUTCH
        .id_top_inst_selfdefine_o( id_top_inst_selfdefine_o ),
        `endif

        /* data signals */
        .id_top_inst_i( if2id_inst_o ),
        .id_top_inst_addr_i( if2id_inst_addr_o ),
        .id_top_nxt_inst_addr_i( if_top_inst_addr_o ),
        .id_top_id2ex_rd_data_i( id2ex_rd_data_o ),
        .id_top_ex2mem_rd_data_i( ex2mem_rd_data_o ),
        .id_top_mem2wb_rd_data_i( mem2wb_rd_data_o ),

        .id_top_rs1_data_o( id_top_rs1_data_o ),
        .id_top_rs2_data_o( id_top_rs2_data_o ),
        .id_top_imm_data_o( id_top_imm_data_o ),
        .id_top_rd_data_o( id_top_rd_data_o ),
        .id_top_inst_addr_o( id_top_inst_addr_o ),
        .id_top_jumpbranch_addr_o( id_top_jumpbranch_addr_o )
        `ifdef YSYX210092_DEFINE_DIFFTEST  
        ,
        .id_top_regs_o( id_top_regs_o )
        `endif
    );

    ysyx_210092_id2ex my_id2ex(
        .clk( clock ),
        .rst( reset ),

        /* ysyx_210092_id2ex control signals */
        .id2ex_inst_valid_i( pipeline_ctrl_inst_valid_o ),
        .id2ex_id_flush_i( pipeline_ctrl_id_flush_o ),
        .id2ex_ex_stall_i( pipeline_ctrl_ex_stall_o ),
        /* modules control signals */
        .id2ex_rs1_index_i( id_top_rs1_index_o ),
        .id2ex_rs2_index_i( id_top_rs2_index_o ),
        .id2ex_rd_index_i( id_top_rd_index_o ),


        .id2ex_inst_nop_i( if2id_inst_nop_o ),

        .id2ex_rs1_en_i( id_top_rs1_en_o ),
        .id2ex_rs2_en_i( id_top_rs2_en_o ),
        .id2ex_rd_en_i( id_top_rd_en_o ),
        .id2ex_inst_jump_i( id_top_inst_jump_o ),
        .id2ex_inst_branch_i( id_top_inst_branch_o ),

        .id2ex_inst_word_i( id_top_inst_word_o ),
        .id2ex_inst_slt_nu_i( id_top_inst_slt_nu_o ),
        .id2ex_inst_slt_u_i( id_top_inst_slt_u_o ),
        .id2ex_inst_shift_i( id_top_inst_shift_o ),
        .id2ex_alu_src_pc_i( id_top_alu_src_pc_o ),
        .id2ex_alu_src_imm_i( id_top_alu_src_imm_o ),
        .id2ex_shift_num_src_i( id_top_shift_num_src_o ),
        .id2ex_shift_type_i( id_top_shift_type_o ),
        .id2ex_inst_arth_lgc_i( id_top_inst_arth_lgc_o ),
        .id2ex_inst_auipc_i( id_top_inst_auipc_o ),
        .id2ex_alu_op_i( id_top_alu_op_o ),

        .id2ex_csr_index_i( id_top_csr_index_o ),
        .id2ex_inst_csr_i( id_top_inst_csr_o ),
        .id2ex_inst_load_i( id_top_inst_load_o ),
        .id2ex_mem_write_i( id_top_mem_write_o ),
        .id2ex_mem_read_i( id_top_mem_read_o ),
        .id2ex_store_type_i( id_top_store_type_o ),
        .id2ex_load_type_i( id_top_load_type_o ),
        .id2ex_csr_ctrl_i( id_top_csr_ctrl_o ),
        .id2ex_inst_ecall_i( id_top_inst_ecall_o ),
        .id2ex_inst_ebreak_i( id_top_inst_ebreak_o ),
        .id2ex_inst_mret_i( id_top_inst_mret_o ),
        .id2ex_inst_trap_i( id_top_inst_trap_o ),

        .id2ex_jumpbranch_en_i( id_top_jumpbranch_en_o ),

        `ifdef YSYX210092_DEFINE_PUTCH
        .id2ex_inst_selfdefine_i( id_top_inst_selfdefine_o ),
        `endif
        `ifdef YSYX210092_DEFINE_DIFFTEST
        .id2ex_inst_i( if2id_inst_o ),
        `endif
        .id2ex_rs1_index_o( id2ex_rs1_index_o ),
        .id2ex_rs2_index_o( id2ex_rs2_index_o ),
        .id2ex_rd_index_o( id2ex_rd_index_o ),
        .id2ex_csr_index_o( id2ex_csr_index_o ),

        .id2ex_inst_nop_o( id2ex_inst_nop_o ),

        .id2ex_rs1_en_o( id2ex_rs1_en_o ),
        .id2ex_rs2_en_o( id2ex_rs2_en_o ),
        .id2ex_rd_en_o( id2ex_rd_en_o ),
        .id2ex_inst_jump_o( id2ex_inst_jump_o ),
        .id2ex_inst_branch_o( id2ex_inst_branch_o ),

        .id2ex_inst_word_o( id2ex_inst_word_o ),
        .id2ex_inst_slt_nu_o( id2ex_inst_slt_nu_o ),
        .id2ex_inst_slt_u_o( id2ex_inst_slt_u_o ),
        .id2ex_inst_shift_o( id2ex_inst_shift_o ),
        .id2ex_alu_src_pc_o( id2ex_alu_src_pc_o ),
        .id2ex_alu_src_imm_o( id2ex_alu_src_imm_o ),
        .id2ex_shift_num_src_o( id2ex_shift_num_src_o ),
        .id2ex_shift_type_o( id2ex_shift_type_o ),
        .id2ex_inst_arth_lgc_o( id2ex_inst_arth_lgc_o ),
        .id2ex_inst_auipc_o( id2ex_inst_auipc_o ),
        .id2ex_alu_op_o( id2ex_alu_op_o ),

        .id2ex_inst_csr_o( id2ex_inst_csr_o ),
        .id2ex_inst_load_o( id2ex_inst_load_o ),
        .id2ex_mem_write_o( id2ex_mem_write_o ),
        .id2ex_mem_read_o( id2ex_mem_read_o ),
        .id2ex_store_type_o( id2ex_store_type_o ),
        .id2ex_load_type_o( id2ex_load_type_o ),
        .id2ex_csr_ctrl_o( id2ex_csr_ctrl_o ),
        .id2ex_inst_ecall_o( id2ex_inst_ecall_o ),
        .id2ex_inst_ebreak_o( id2ex_inst_ebreak_o ),
        .id2ex_inst_mret_o( id2ex_inst_mret_o ),
        .id2ex_inst_trap_o( id2ex_inst_trap_o ),

        .id2ex_jumpbranch_en_o( id2ex_jumpbranch_en_o ),

        `ifdef YSYX210092_DEFINE_PUTCH
        .id2ex_inst_selfdefine_o( id2ex_inst_selfdefine_o ),
        `endif
        `ifdef YSYX210092_DEFINE_DIFFTEST
        .id2ex_inst_o( id2ex_inst_o ),
        `endif
        /* data signals */
        .id2ex_rs1_data_i( id_top_rs1_data_o ),
        .id2ex_rs2_data_i( id_top_rs2_data_o ),
        .id2ex_imm_data_i( id_top_imm_data_o ),
        .id2ex_rd_data_i( id_top_rd_data_o ),
        .id2ex_inst_addr_i( id_top_inst_addr_o ),
        .id2ex_jumpbranch_addr_i( id_top_jumpbranch_addr_o ),

        .id2ex_rs1_data_o( id2ex_rs1_data_o ),
        .id2ex_rs2_data_o( id2ex_rs2_data_o ),
        .id2ex_imm_data_o( id2ex_imm_data_o ),
        .id2ex_rd_data_o( id2ex_rd_data_o ),
        .id2ex_inst_addr_o( id2ex_inst_addr_o ),
        .id2ex_jumpbranch_addr_o( id2ex_jumpbranch_addr_o )
    );

    ysyx_210092_ex_top my_ex_top(
        .clk( clock ),
        .rst( reset ),

        /* control signals */
        .ex_top_inst_valid_i( pipeline_ctrl_inst_valid_o ),

        .ex_top_rs1_buffered_i( pipeline_ctrl_ex_rs1_buffered_o ),
        .ex_top_rs2_buffered_i( pipeline_ctrl_ex_rs2_buffered_o ),
        .ex_top_rs1_src_buffer_i( pipeline_ctrl_ex_rs1_src_buffer_o ),
        .ex_top_rs2_src_buffer_i( pipeline_ctrl_ex_rs2_src_buffer_o ),
        .ex_top_id2ex_rs1_en_i( id2ex_rs1_en_o ),
        .ex_top_id2ex_rs2_en_i( id2ex_rs2_en_o ),
        .ex_top_ex2mem_rd_en_i( ex2mem_rd_en_o ),
        .ex_top_mem2wb_rd_en_i( mem2wb_rd_en_o ),
        .ex_top_inst_csr_i( id2ex_inst_csr_o ),
        .ex_top_inst_word_i( id2ex_inst_word_o ),
        .ex_top_inst_slt_nu_i( id2ex_inst_slt_nu_o ),
        .ex_top_inst_slt_u_i( id2ex_inst_slt_u_o ),
        .ex_top_inst_shift_i( id2ex_inst_shift_o ),
        .ex_top_alu_src_pc_i( id2ex_alu_src_pc_o ),
        .ex_top_alu_src_imm_i( id2ex_alu_src_imm_o ),
        .ex_top_shift_num_src_i( id2ex_shift_num_src_o ),
        .ex_top_shift_type_i( id2ex_shift_type_o ),
        .ex_top_inst_arth_lgc_i( id2ex_inst_arth_lgc_o ),
        .ex_top_inst_auipc_i( id2ex_inst_auipc_o ),
        .ex_top_alu_op_i( id2ex_alu_op_o ),

        .ex_top_mem_read_i( id2ex_mem_read_o ),
        .ex_top_mem_write_i( id2ex_mem_write_o ),
        .ex_top_id2ex_rs1_index_i( id2ex_rs1_index_o ),
        .ex_top_id2ex_rs2_index_i( id2ex_rs2_index_o ),
        .ex_top_ex2mem_rd_index_i( ex2mem_rd_index_o ),
        .ex_top_mem2wb_rd_index_i( mem2wb_rd_index_o ),


        .ex_top_ex_rs1_src_ex2mem_o( ex_top_ex_rs1_src_ex2mem_o ),
        .ex_top_ex_rs2_src_ex2mem_o( ex_top_ex_rs2_src_ex2mem_o ),
        .ex_top_ex_rs1_src_mem2wb_o( ex_top_ex_rs1_src_mem2wb_o ),
        .ex_top_ex_rs2_src_mem2wb_o( ex_top_ex_rs2_src_mem2wb_o ),
        /* data signals */
        .ex_top_imm_data_i( id2ex_imm_data_o ),
        .ex_top_id2ex_rs1_data_i( id2ex_rs1_data_o ),
        .ex_top_id2ex_rs2_data_i( id2ex_rs2_data_o ),
        .ex_top_id2ex_rd_data_i( id2ex_rd_data_o ),
        .ex_top_ex2mem_rd_data_i( ex2mem_rd_data_o ),
        .ex_top_mem2wb_rd_data_i( mem2wb_rd_data_o ),
        .ex_top_inst_addr_i( id2ex_inst_addr_o ),
        .ex_top_rs1_data_o( ex_top_rs1_data_o),
        .ex_top_rs2_data_o( ex_top_rs2_data_o),
        .ex_top_rd_data_o( ex_top_rd_data_o )
    );

    ysyx_210092_ex2mem my_ex2mem(
        .clk( clock ),
        .rst( reset ),

        /* ysyx_210092_ex2mem control signals */
        .ex2mem_inst_valid_i( pipeline_ctrl_inst_valid_o ),
        .ex2mem_ex_flush_i( pipeline_ctrl_ex_flush_o ),

        /* modules control signals */
        .ex2mem_rs1_index_i( id2ex_rs1_index_o ),
        .ex2mem_rs2_index_i( id2ex_rs2_index_o ),
        .ex2mem_rd_index_i( id2ex_rd_index_o ),

        .ex2mem_rs1_en_i( id2ex_rs1_en_o ),
        .ex2mem_rs2_en_i( id2ex_rs2_en_o ),
        .ex2mem_rd_en_i( id2ex_rd_en_o ),

        .ex2mem_csr_index_i( id2ex_csr_index_o ),
        .ex2mem_inst_csr_i( id2ex_inst_csr_o ),
        .ex2mem_inst_load_i( id2ex_inst_load_o ),
        .ex2mem_mem_write_i( id2ex_mem_write_o ),
        .ex2mem_mem_read_i( id2ex_mem_read_o ),
        .ex2mem_store_type_i( id2ex_store_type_o ),
        .ex2mem_load_type_i( id2ex_load_type_o ),
        .ex2mem_csr_ctrl_i( id2ex_csr_ctrl_o ),
        .ex2mem_inst_ecall_i( id2ex_inst_ecall_o ),
        .ex2mem_inst_ebreak_i( id2ex_inst_ebreak_o ),
        .ex2mem_inst_mret_i( id2ex_inst_mret_o ),
        .ex2mem_inst_trap_i( id2ex_inst_trap_o ),

        `ifdef YSYX210092_DEFINE_DIFFTEST
        .ex2mem_inst_nop_i( id2ex_inst_nop_o ),
        .ex2mem_inst_i( id2ex_inst_o ),
        `endif

        `ifdef YSYX210092_DEFINE_PUTCH
        .ex2mem_inst_selfdefine_i( id2ex_inst_selfdefine_o ),
        `endif

        .ex2mem_rs1_index_o( ex2mem_rs1_index_o ),
        .ex2mem_rs2_index_o( ex2mem_rs2_index_o ),
        .ex2mem_rd_index_o( ex2mem_rd_index_o ),

        .ex2mem_rs1_en_o( ex2mem_rs1_en_o ),
        .ex2mem_rs2_en_o( ex2mem_rs2_en_o ),
        .ex2mem_rd_en_o( ex2mem_rd_en_o ),

        .ex2mem_csr_index_o( ex2mem_csr_index_o ),
        .ex2mem_inst_csr_o( ex2mem_inst_csr_o ),
        .ex2mem_inst_load_o( ex2mem_inst_load_o ),
        .ex2mem_mem_write_o( ex2mem_mem_write_o ),
        .ex2mem_mem_read_o( ex2mem_mem_read_o ),
        .ex2mem_store_type_o( ex2mem_store_type_o ),
        .ex2mem_load_type_o( ex2mem_load_type_o ),
        .ex2mem_csr_ctrl_o( ex2mem_csr_ctrl_o ),
        .ex2mem_inst_ecall_o( ex2mem_inst_ecall_o ),
        .ex2mem_inst_ebreak_o( ex2mem_inst_ebreak_o ),
        .ex2mem_inst_mret_o( ex2mem_inst_mret_o ),
        .ex2mem_inst_trap_o( ex2mem_inst_trap_o ),

        `ifdef YSYX210092_DEFINE_DIFFTEST
        .ex2mem_inst_nop_o( ex2mem_inst_nop_o ),
        .ex2mem_inst_o( ex2mem_inst_o ),
        `endif

        `ifdef YSYX210092_DEFINE_PUTCH
        .ex2mem_inst_selfdefine_o( ex2mem_inst_selfdefine_o ),
        `endif

        /* data signals */
        .ex2mem_rs1_data_i( ex_top_rs1_data_o ),
        .ex2mem_rs2_data_i( ex_top_rs2_data_o ),
        .ex2mem_imm_data_i( id2ex_imm_data_o ),
        .ex2mem_rd_data_i( ex_top_rd_data_o ),
        .ex2mem_inst_addr_i( id2ex_inst_addr_o ),

        .ex2mem_rs1_data_o( ex2mem_rs1_data_o ),
        .ex2mem_rs2_data_o( ex2mem_rs2_data_o ),
        .ex2mem_imm_data_o( ex2mem_imm_data_o ),
        .ex2mem_rd_data_o( ex2mem_rd_data_o ),
        .ex2mem_inst_addr_o( ex2mem_inst_addr_o )
    );
    ysyx_210092_mem_top my_mem_top(
        .clk( clock ),
        .rst( reset ),

        /* control signals */
        .mem_top_inst_valid_i( pipeline_ctrl_inst_valid_o ),
        .mem_top_ex2mem_rs1_index_i( ex2mem_rs1_index_o ),
        .mem_top_ex2mem_rs2_index_i( ex2mem_rs2_index_o ),
        .mem_top_mem2wb_rd_index_i( mem2wb_rd_index_o ),

        .mem_top_ex2mem_rs1_en_i( ex2mem_rs1_en_o ),
        .mem_top_ex2mem_rs2_en_i( ex2mem_rs2_en_o ),
        .mem_top_mem2wb_rd_en_i( mem2wb_rd_en_o ),

        .mem_top_csr_index_i( ex2mem_csr_index_o ),
        .mem_top_inst_csr_i( ex2mem_inst_csr_o ),
        .mem_top_inst_load_i( ex2mem_inst_load_o ),
        .mem_top_mem_write_i( ex2mem_mem_write_o ),
        .mem_top_mem_read_i( ex2mem_mem_read_o ),
        .mem_top_store_type_i( ex2mem_store_type_o ),
        .mem_top_load_type_i( ex2mem_load_type_o ),
        .mem_top_csr_ctrl_i( ex2mem_csr_ctrl_o ),
        .mem_top_inst_ecall_i( ex2mem_inst_ecall_o ),
        .mem_top_inst_ebreak_i( ex2mem_inst_ebreak_o ),
        .mem_top_inst_mret_i( ex2mem_inst_mret_o ),
        .mem_top_inst_trap_i( ex2mem_inst_trap_o ),

        .mem_top_intp_en_i( pipeline_ctrl_intp_en_o ),


        .mem_top_csr_nxt_pc_o( mem_top_csr_nxt_pc_o ),
        .mem_top_intp_en_o( mem_top_intp_en_o ),
        .mem_top_csr_trap_o( mem_top_csr_trap_o ),

        .mem_top_access_ok_o( mem_top_access_ok_o ),
        /* data signals */
        .mem_top_ex2mem_rs1_data_i( ex2mem_rs1_data_o ),
        .mem_top_ex2mem_rs2_data_i( ex2mem_rs2_data_o ),
        .mem_top_imm_data_i( ex2mem_imm_data_o ),
        .mem_top_ex2mem_rd_data_i( ex2mem_rd_data_o ),
        .mem_top_mem2wb_rd_data_i( mem2wb_rd_data_o ),
        .mem_top_ex2mem_inst_addr_i( ex2mem_inst_addr_o ),

        .mem_top_rd_data_o( mem_top_rd_data_o ),

        /* bus interface */
        .mem_top_mem_valid_o( cpu_mem_valid ),
        .mem_top_mem_ready_i( cpu_mem_ready ),
        .mem_top_mem_data_read_i( cpu_mem_data_read ),
        .mem_top_mem_data_write_o( cpu_mem_data_write ),
        .mem_top_mem_addr_o( cpu_mem_addr ),
        .mem_top_mem_size_o( cpu_mem_size ),
        .mem_top_mem_resp_i( cpu_mem_resp ),
        .mem_top_mem_req_o( cpu_mem_req )
        `ifdef YSYX210092_DEFINE_DIFFTEST
        ,
        .mem_top_csr_skip_o( mem_top_csr_skip_o ),
        .mem_top_mstatus_o( mem_top_mstatus_o ),
        .mem_top_mtvec_o( mem_top_mtvec_o ),
        .mem_top_mepc_o( mem_top_mepc_o ),
        .mem_top_mcause_o( mem_top_mcause_o ),
        .mem_top_mip_o( mem_top_mip_o ),
        .mem_top_mie_o( mem_top_mie_o ),
        .mem_top_mscratch_o( mem_top_mscratch_o ),
        .mem_top_cause_o( mem_top_cause_o ),
        .mem_top_clint_dstb_skip_o( mem_top_clint_dstb_skip_o )
        `endif
    );

    ysyx_210092_mem2wb my_mem2wb(
        .clk( clock ),
        .rst( reset ),

        /* ysyx_210092_mem2wb control signals */
        .mem2wb_inst_valid_i( pipeline_ctrl_inst_valid_o ),

        /* modules control signals */
        .mem2wb_rd_index_i( ex2mem_rd_index_o ),
        .mem2wb_rd_en_i( ex2mem_rd_en_o ),
        .mem2wb_inst_trap_i( ex2mem_inst_trap_o ),
        .mem2wb_intp_en_i( mem_top_intp_en_o ),
        `ifdef YSYX210092_DEFINE_DIFFTEST
        .mem2wb_inst_csr_i( ex2mem_inst_csr_o),
        .mem2wb_inst_i( ex2mem_inst_o ),
        .mem2wb_inst_addr_i( ex2mem_inst_addr_o ),
        .mem2wb_inst_nop_i( ex2mem_inst_nop_o ),
        .mem2wb_csr_skip_i( mem_top_csr_skip_o ),
        .mem2wb_mstatus_i( mem_top_mstatus_o ),
        .mem2wb_mtvec_i( mem_top_mtvec_o ),
        .mem2wb_mepc_i( mem_top_mepc_o ),
        .mem2wb_mcause_i( mem_top_mcause_o ),
        .mem2wb_mip_i( mem_top_mip_o ),
        .mem2wb_mie_i( mem_top_mie_o ),
        .mem2wb_mscratch_i( mem_top_mscratch_o ),
        .mem2wb_cause_i( mem_top_cause_o ),
        .mem2wb_clint_dstb_skip_i( mem_top_clint_dstb_skip_o ),
        `endif

        `ifdef YSYX210092_DEFINE_PUTCH
        .mem2wb_inst_selfdefine_i( ex2mem_inst_selfdefine_o ),
        `endif

        .mem2wb_rd_index_o( mem2wb_rd_index_o ),
        .mem2wb_rd_en_o( mem2wb_rd_en_o ),
        .mem2wb_inst_trap_o( mem2wb_inst_trap_o ),
        .mem2wb_intp_en_o( mem2wb_intp_en_o ),

        `ifdef YSYX210092_DEFINE_DIFFTEST
        .mem2wb_inst_csr_o( mem2wb_inst_csr_o ),
        .mem2wb_inst_o( mem2wb_inst_o ),
        .mem2wb_inst_addr_o( mem2wb_inst_addr_o ),
        .mem2wb_inst_nop_o( mem2wb_inst_nop_o ),
        .mem2wb_csr_skip_o( mem2wb_csr_skip_o ),
        .mem2wb_mstatus_o( mem2wb_mstatus_o ),
        .mem2wb_mtvec_o( mem2wb_mtvec_o ),
        .mem2wb_mepc_o( mem2wb_mepc_o ),
        .mem2wb_mcause_o( mem2wb_mcause_o ),
        .mem2wb_mip_o( mem2wb_mip_o ),
        .mem2wb_mie_o( mem2wb_mie_o ),
        .mem2wb_mscratch_o( mem2wb_mscratch_o ),
        .mem2wb_cause_o( mem2wb_cause_o ),
        .mem2wb_clint_dstb_skip_o( mem2wb_clint_dstb_skip_o ),
        `endif

        `ifdef YSYX210092_DEFINE_PUTCH
        .mem2wb_inst_selfdefine_o( mem2wb_inst_selfdefine_o ),
        `endif

        /* data signals */
        .mem2wb_rd_data_i( mem_top_rd_data_o ),
        .mem2wb_csr_nxt_pc_i( mem_top_csr_nxt_pc_o ),

        .mem2wb_rd_data_o( mem2wb_rd_data_o ),
        .mem2wb_csr_nxt_pc_o( mem2wb_csr_nxt_pc_o )
    );

    ysyx_210092_pipeline_ctrl my_pipeline_ctrl(
        .clk( clock ),
        .rst( reset ),

        .pipeline_ctrl_fetched_ok_i( if_top_fetched_ok_o ),

        .pipeline_ctrl_id_inst_branch_i( id_top_inst_branch_o ),
        .pipeline_ctrl_id_inst_jump_i( id_top_inst_jump_o ),
        .pipeline_ctrl_id_inst_trap_i( id_top_inst_trap_o ),
        .pipeline_ctrl_id_rs1_src_id2ex_i( id_top_id_rs1_src_id2ex_o ),
        .pipeline_ctrl_id_rs1_src_ex2mem_i( id_top_id_rs1_src_ex2mem_o ),
        .pipeline_ctrl_id_rs2_src_id2ex_i( id_top_id_rs2_src_id2ex_o ),
        .pipeline_ctrl_id_rs2_src_ex2mem_i( id_top_id_rs2_src_ex2mem_o ),

        .pipeline_ctrl_id2ex_inst_nop_i( id2ex_inst_nop_o ),
        .pipeline_ctrl_id2ex_inst_branch_i( id2ex_inst_branch_o ),
        .pipeline_ctrl_id2ex_inst_jump_i( id2ex_inst_jump_o ),
        .pipeline_ctrl_id2ex_inst_trap_i( id2ex_inst_trap_o ),
        .pipeline_ctrl_id2ex_inst_load_i( id2ex_inst_load_o ),
        .pipeline_ctrl_id2ex_inst_csr_i( id2ex_inst_csr_o ),
        .pipeline_ctrl_id2ex_inst_arth_lgc_i( id2ex_inst_arth_lgc_o ),
        .pipeline_ctrl_id2ex_inst_auipc_i( id2ex_inst_auipc_o ),
        .pipeline_ctrl_ex_rs1_src_ex2mem_i( ex_top_ex_rs1_src_ex2mem_o ),
        .pipeline_ctrl_ex_rs2_src_ex2mem_i( ex_top_ex_rs2_src_ex2mem_o ),
        .pipeline_ctrl_ex_rs1_src_mem2wb_i( ex_top_ex_rs1_src_mem2wb_o ),
        .pipeline_ctrl_ex_rs2_src_mem2wb_i( ex_top_ex_rs2_src_mem2wb_o ),

        .pipeline_ctrl_access_ok_i( mem_top_access_ok_o ),
        .pipeline_ctrl_mem_csr_trap_i( mem_top_csr_trap_o ),
        .pipeline_ctrl_ex2mem_inst_trap_i( ex2mem_inst_trap_o ),
        .pipeline_ctrl_ex2mem_inst_load_i( ex2mem_inst_load_o ),
        .pipeline_ctrl_ex2mem_mem_read_i( ex2mem_mem_read_o ),
        .pipeline_ctrl_ex2mem_mem_write_i( ex2mem_mem_write_o ),
        .pipeline_ctrl_ex2mem_inst_csr_i( ex2mem_inst_csr_o ),

        .pipeline_ctrl_mem2wb_inst_trap_i( mem2wb_inst_trap_o ),
        .pipeline_ctrl_mem2wb_intp_en_i( mem2wb_intp_en_o ),


        .pipeline_ctrl_inst_valid_o( pipeline_ctrl_inst_valid_o ),

        .pipeline_ctrl_dont_fetch_o( pipeline_ctrl_dont_fetch_o ),
        .pipeline_ctrl_if_flush_o( pipeline_ctrl_if_flush_o ),
        .pipeline_ctrl_id_stall_o( pipeline_ctrl_id_stall_o ),
        .pipeline_ctrl_id_flush_o( pipeline_ctrl_id_flush_o ),
        .pipeline_ctrl_ex_stall_o( pipeline_ctrl_ex_stall_o ),
        .pipeline_ctrl_ex_flush_o( pipeline_ctrl_ex_flush_o ),
        .pipeline_ctrl_ex_rs1_src_buffer_o( pipeline_ctrl_ex_rs1_src_buffer_o ),
        .pipeline_ctrl_ex_rs2_src_buffer_o( pipeline_ctrl_ex_rs2_src_buffer_o ),
        .pipeline_ctrl_ex_rs1_buffered_o( pipeline_ctrl_ex_rs1_buffered_o ),
        .pipeline_ctrl_ex_rs2_buffered_o( pipeline_ctrl_ex_rs2_buffered_o ),  
        .pipeline_ctrl_intp_en_o( pipeline_ctrl_intp_en_o ) 
    );


`ifdef YSYX210092_DEFINE_PUTCH
    always @( posedge mem2wb_inst_selfdefine_o ) begin
        $write("%c", id_top_regs_o[10][7:0]);
    end
`endif

`ifdef YSYX210092_DEFINE_DIFFTEST
    // Difftest
    reg cmt_wen;
    reg [7:0] cmt_wdest;
    reg [`YSYX210092_REG_BUS] cmt_wdata;
    reg [`YSYX210092_REG_BUS] cmt_pc;
    reg [31:0] cmt_inst;
    reg cmt_valid;
    reg trap;
    reg [7:0] trap_code;
    reg [63:0] cycleCnt;
    reg [63:0] instrCnt;
    reg [`YSYX210092_REG_BUS] regs_diff [ 31:0 ];
    reg cmt_skip;
    // output                          csr_skip
    // reg [`YSYX210092_REG_BUS]  cmt_mstatus;
    // reg [`YSYX210092_REG_BUS]  cmt_mtvec;
    // reg [`YSYX210092_REG_BUS]  cmt_mepc;
    // reg [`YSYX210092_REG_BUS]  cmt_mcause;
    // reg [`YSYX210092_REG_BUS]  cmt_mip;
    // reg [`YSYX210092_REG_BUS]  cmt_mie;
    // reg [`YSYX210092_REG_BUS]  cmt_mscratch;
    reg [31:0]      cmt_intrNO;
    reg [`YSYX210092_REG_BUS]  cmt_einst;
    reg [`YSYX210092_REG_BUS]  cmt_epc;
    reg             intp_r;
    reg [`YSYX210092_INST_BUS] einst_r;
    reg [`YSYX210092_INST_ADDR_BUS] epc_r;
    // wire inst_valid = ( inst_addr != `YSYX210092_PC_START) | (inst != 0);
    always @(negedge clock) begin
        if (reset) begin
            {cmt_wen, cmt_wdest, cmt_wdata, cmt_pc, cmt_inst, cmt_valid, trap, trap_code, cycleCnt, instrCnt} <= 0;
        end
        else if (~trap) begin
            cmt_wen <=   mem2wb_rd_en_o & pipeline_ctrl_inst_valid_o;
            cmt_wdest <= {3'd0, mem2wb_rd_index_o};
            cmt_wdata <= mem2wb_rd_data_o;
            cmt_pc <= mem2wb_inst_addr_o;
            cmt_inst <= mem2wb_inst_o;
            cmt_valid <= pipeline_ctrl_inst_valid_o & ~mem2wb_inst_nop_o & ~mem2wb_intp_en_o;
        
        	    regs_diff <= id_top_regs_o;

            trap <= mem2wb_inst_o[6:0] == 7'h6b;
            trap_code <= id_top_regs_o[10][7:0];
            cycleCnt <= cycleCnt + 1;
            instrCnt <= instrCnt + pipeline_ctrl_inst_valid_o;
            cmt_skip <= ( mem2wb_inst_csr_o & mem2wb_csr_skip_o )
                        `ifdef YSYX210092_DEFINE_PUTCH
                        | mem2wb_inst_selfdefine_o 
                        `endif
                        | mem2wb_clint_dstb_skip_o
                        ;
            // cmt_mstatus <= mstatus;
            // cmt_mtvec <= mtvec;
            // cmt_mepc <= mepc;
            // cmt_mcause <= mcause;
            // cmt_mip <= mip;
            // cmt_mie <= mie;
            // cmt_mscratch <= mscratch;
            cmt_intrNO <= pipeline_ctrl_inst_valid_o & mem2wb_intp_en_o ? 7: 0 ;
            cmt_einst <= pipeline_ctrl_inst_valid_o & mem2wb_intp_en_o? mem2wb_inst_o: 0;
            cmt_epc <= pipeline_ctrl_inst_valid_o & mem2wb_intp_en_o? mem2wb_inst_addr_o: 0;
        end
    end
    DifftestInstrCommit DifftestInstrCommit(
      .clock              (clock),
      .coreid             (0),
      .index              (0),
      .valid              (cmt_valid),
      .pc                 (cmt_pc),
      .instr              (cmt_inst),
      .skip               (cmt_skip ),
      .isRVC              (0),
      .scFailed           (0),
      .wen                (cmt_wen),
      .wdest              (cmt_wdest),
      .wdata              (cmt_wdata)
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
    DifftestArchEvent DifftestArchEvent(
        .clock( clock ),
        .coreid( 0 ),
        .intrNO( cmt_intrNO ),
        .cause( 0 ),
        .exceptionPC( cmt_epc ),
        .exceptionInst( cmt_einst )
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
      .priviledgeMode     (3),
      .mstatus            (mem2wb_mstatus_o),
      .sstatus            (mem2wb_mstatus_o & 64'h80000003000de122),
      .mepc               (mem2wb_mepc_o),
      .sepc               (0),
      .mtval              (0),
      .stval              (0),
      .mtvec              (mem2wb_mtvec_o),
      .stvec              (0),
      .mcause             (mem2wb_mcause_o),
      .scause             (0),
      .satp               (0),
      .mip                (0),// !!!!!
      .mie                (mem2wb_mie_o),
      .mscratch           (mem2wb_mscratch_o),
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
`endif

endmodule


module ysyx_210092_if_mem_arbiter  # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64
)
(
    /* if */
    output                          if_ready,
    output  [`YSYX210092_DATA_BUS]             if_data_read,
    output  [1:0]                   if_resp,

    input                           if_valid,
    input   [`YSYX210092_INST_ADDR_BUS]        if_addr,
    input   [1:0]                   if_size,
    input                           if_req,

    /* mem */   
    input                           mem_valid,
	output                          mem_ready,
    output  [`YSYX210092_DATA_BUS]             mem_data_read,
    input   [`YSYX210092_DATA_BUS]             mem_data_write,
    input   [`YSYX210092_DATA_ADDR_BUS]        mem_addr,
    input   [1:0]                   mem_size,
    output  [1:0]                   mem_resp,
    input                           mem_req,

    /* ysyx_210092_axi_rw */    
    output                          rw_valid,
	input                           rw_ready,
    output                          rw_req,
    input   [RW_DATA_WIDTH-1:0]     data_read,
    output  [RW_DATA_WIDTH-1:0]     data_write,
    output  [AXI_DATA_WIDTH-1:0]    rw_addr,
    output  [1:0]                   rw_size,
    input   [1:0]                   rw_resp,
    output  [3:0]                   rw_id
);

    localparam  STATE_IF = 1'b0, STATE_MEM = 1'b1;
    wire                        state_cur;
    wire                        state_cur_if;
    wire                        state_cur_mem;

    assign state_cur            =   mem_valid? STATE_MEM: STATE_IF;
    assign state_cur_if         =   state_cur == STATE_IF;
    assign state_cur_mem        =   state_cur == STATE_MEM;

    assign rw_valid             =   state_cur_if ? if_valid: mem_valid;
    assign if_ready             =   state_cur_if & rw_ready; 
    assign mem_ready            =   state_cur_mem & rw_ready;
    assign rw_req               =   state_cur_if ? if_req: mem_req;
    assign if_data_read         =   data_read;
    assign mem_data_read        =   data_read;  
    assign data_write           =   mem_data_write;
    assign rw_addr              =   state_cur_if ? if_addr: mem_addr;
    assign rw_size              =   state_cur_if ? if_size: mem_size;
    assign if_resp              =   rw_resp;
    assign mem_resp             =   rw_resp;
    assign rw_id                =   4'h0; 
    
endmodule



// Burst types
`define YSYX210092_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210092_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210092_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210092_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210092_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210092_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210092_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210092_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210092_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210092_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210092_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210092_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210092_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210092_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210092_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210092_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210092_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210092_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210092_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210092_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210092_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210092_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210092_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210092_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210092_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210092_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210092_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210092_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210092_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210092_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210092_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210092_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210092_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210092_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210092_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210092_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210092_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210092_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210092_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210092_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210092_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_210092_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 64,
    parameter AXI_ID_WIDTH      = 4
)(
    input                               clock,
    input                               reset,

	input                               rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output [RW_DATA_WIDTH-1:0]          data_read_o,
    input  [RW_DATA_WIDTH-1:0]          data_write_i,
    input  [AXI_DATA_WIDTH-1:0]         rw_addr_i,
    input  [1:0]                        rw_size_i,
    output [1:0]                        rw_resp_o,
    input  [AXI_ID_WIDTH-1:0]           rw_id_i,
    // Advanced eXtensible Interface
    
    //写地址
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,

    //写数据
    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    
    //写返回
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,

    //读地址
    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    
    //读数据（返回）
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i
);

    wire to_mem     = rw_addr_i >= 64'h8000_0000;

    wire w_trans    = rw_req_i == `YSYX210092_REQ_WRITE;
    wire r_trans    = rw_req_i == `YSYX210092_REQ_READ;
    wire w_valid    = rw_valid_i & w_trans;
    wire r_valid    = rw_valid_i & r_trans;

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i; 

    wire w_done     = w_hs & axi_w_last_o;// 这个write done只是用于状态转换
    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = w_trans ? b_hs : r_done;

    
    // ------------------State Machine------------------
    localparam [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;
    reg rw_ready;
    reg [1:0] w_state, r_state;
    wire w_state_idle = w_state == W_STATE_IDLE, w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
    wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if ( w_valid & ~rw_ready ) begin// 由于设置了mem_finished信号，此处若不加这个，会提前送出错误的写地址
                case (w_state)
                    W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
                    W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_IDLE; default: w_state <= w_state;
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
            if ( r_valid & ~rw_ready ) begin// 同理
                case (r_state)// 之所以读部分可以这样写，是因为读逻辑
                    R_STATE_IDLE:               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (r_done)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end


    // ------------------Number of transmission------------------
    reg [7:0] len; // 正在写的是第几beat
    wire [7:0] mem_axi_len;
    wire [7:0] axi_len;
    assign axi_len      = to_mem? mem_axi_len: 8'b0;
    wire len_reset      = reset | (w_trans & w_state_idle) | (r_trans & r_state_idle);
    wire len_incr_en    = (len != axi_len) & (w_hs | r_hs);
    always @(posedge clock) begin
        if (len_reset) begin
            len <= 8'b0;
        end
        else if (len_incr_en) begin
            len <= len + 8'b1;
        end
    end
    // 此处实现仅支持len为1的读，之所以要设置len时因为单非对齐时，会要求读两次

    // ------------------Process Data------------------
    localparam MEM_ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);// 首先计算总线一次传输的字节数，字节数log2就知道对齐的是对应地址中的哪几位
    localparam MEM_OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);// 偏移量，也就是非对齐访问的数据在对齐访问返回的信息中所在位置的偏移
    localparam MEM_AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);// 用于size信号
    localparam MEM_MASK_WIDTH    = AXI_DATA_WIDTH * 2; // 为啥乘2？因为最多跨越两个lane（非对齐时），乘2方便形成mem_mask
    localparam MEM_TRANS_LEN     = RW_DATA_WIDTH / AXI_DATA_WIDTH;
    localparam MEM_BLOCK_TRANS   = MEM_TRANS_LEN > 1 ? 1'b1 : 1'b0;// 这是大于，不是右移，呆比！！
        // 同一事物不允许插入其他事物


    wire mem_aligned        = MEM_BLOCK_TRANS | rw_addr_i[MEM_ALIGNED_WIDTH-1:0] == 0;// 就默认block（需要传输的次数大于1）就对齐把，具体原因未知，时间有限来不及看了
    wire per_aligned        = 1'b1;
    wire aligned            = to_mem? mem_aligned: per_aligned;

    wire size_b             = rw_size_i == `YSYX210092_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210092_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210092_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210092_SIZE_D;
    wire [3:0] mem_addr_op1     = {{4-MEM_ALIGNED_WIDTH{1'b0}}, rw_addr_i[MEM_ALIGNED_WIDTH-1:0]};
                                // 高位补零，低位为地址对齐位
    wire [3:0] mem_addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] mem_addr_end     = mem_addr_op1 + mem_addr_op2;// 结束的那个字节的地址

    wire mem_overstep           = mem_addr_end[3:MEM_ALIGNED_WIDTH] != {3-MEM_ALIGNED_WIDTH+1{1'b0}};// 最高位未计算前为0，计算之后，出现了进位，说明跨越了一个lane
    wire overstep               = to_mem? mem_overstep: 1'b0;

    assign mem_axi_len          = mem_aligned ? 8'b0/* MEM_TRANS_LEN - 1 */ : {{7{1'b0}}, mem_overstep};// 根据上文，非对齐一定有MEM_TRANS_LEN==1,非对齐且越界，则一定要两次
    // assign axi_len          = to_mem? mem_axi_len: per_axi_len;

    wire [2:0] mem_axi_size     = MEM_AXI_SIZE[2:0];
    wire [2:0] per_axi_size     = {1'b0, rw_size_i};
    wire [2:0] axi_size         = to_mem? mem_axi_size: per_axi_size;

    wire [AXI_ADDR_WIDTH-1:0] mem_axi_addr          = {rw_addr_i[AXI_ADDR_WIDTH-1:MEM_ALIGNED_WIDTH], {MEM_ALIGNED_WIDTH{1'b0}}};// 转化为对齐访问
    wire [MEM_OFFSET_WIDTH-1:0] mem_aligned_offset_l    = {{MEM_OFFSET_WIDTH-MEM_ALIGNED_WIDTH{1'b0}}, {rw_addr_i[MEM_ALIGNED_WIDTH-1:0]}} << 3;// 非对齐低地址lane偏移
    wire [MEM_OFFSET_WIDTH:0]   mem_aligned_offset_h_pre= AXI_DATA_WIDTH - mem_aligned_offset_l;// 非对齐高地址lane偏移
    wire [MEM_OFFSET_WIDTH-1:0] mem_aligned_offset_h    = mem_aligned_offset_h_pre[MEM_OFFSET_WIDTH-1:0];
    wire [MEM_MASK_WIDTH-1:0] mem_mask                  = (({MEM_MASK_WIDTH{size_b}} & {{MEM_MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MEM_MASK_WIDTH{size_h}} & {{MEM_MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MEM_MASK_WIDTH{size_w}} & {{MEM_MASK_WIDTH-32{1'b0}}, 32'hffff_ffff})
                                                    | ({MEM_MASK_WIDTH{size_d}} & {{MEM_MASK_WIDTH-64{1'b0}}, 64'hffff_ffff_ffff_ffff})
                                                    ) << mem_aligned_offset_l;// 对应的各种mem_mask，用128位方便移位吧。。。

    wire [AXI_DATA_WIDTH-1:0] per_mask                  = ( ({AXI_DATA_WIDTH{size_b}} & {{AXI_DATA_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({AXI_DATA_WIDTH{size_h}} & {{AXI_DATA_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({AXI_DATA_WIDTH{size_w}} & {{AXI_DATA_WIDTH-32{1'b0}}, 32'hffff_ffff}) )
                                                      << ( { 3'b0, rw_addr_i[2:0] } << 3 );
                                                      
    wire [AXI_DATA_WIDTH-1:0] mem_mask_l            = mem_mask[AXI_DATA_WIDTH-1:0];
    wire [AXI_DATA_WIDTH-1:0] mem_mask_h            = mem_mask[MEM_MASK_WIDTH-1:AXI_DATA_WIDTH];// l，h对应关系同理
    wire [AXI_DATA_WIDTH-1:0] mask_l            = mem_mask_l;
    wire [AXI_DATA_WIDTH-1:0] mask_h            = mem_mask_h;
    wire [MEM_OFFSET_WIDTH-1:0] aligned_offset_l= mem_aligned_offset_l;
    wire [MEM_OFFSET_WIDTH-1:0] aligned_offset_h= mem_aligned_offset_h;
    wire [AXI_ADDR_WIDTH-1:0] axi_addr          = to_mem? mem_axi_addr: rw_addr_i;


    /* 这一部分是针对cpu端的 */
    wire rw_ready_nxt = trans_done;// 对的，因为不会同时读写
    wire rw_ready_en  = trans_done | rw_ready;
        // 最初ready为0，单tans完成后，trans_done有效，ready有效
        // 之后，master在收到信号之后会关闭valid，握手结束，tans_done无效，而ready还有效，则ready会清零
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 1'b0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
        end
        else begin
            rw_ready <= rw_ready;
        end
    end
    assign rw_ready_o     = rw_ready;
        //因为rw_ready会迟一个周期，所以返回的读数据并不会有问题

    // 直接将信息返回即可
    reg [1:0] rw_resp;
    wire [1:0] rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i;
    wire resp_en = trans_done;
    always @(posedge clock) begin
        if (reset) begin
            rw_resp <= 2'b0;
        end
        else if (resp_en) begin
            rw_resp <= rw_resp_nxt;
        end
    end
    assign rw_resp_o      = rw_resp;


    /* 这一部分是针对slave端的 */
    // ------------------Write Transaction------------------
    // aw
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = axi_addr;
    assign axi_aw_id_o      = rw_id_i;
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = axi_size;
    assign axi_aw_burst_o   = `YSYX210092_AXI_BURST_TYPE_INCR;

    //w
    reg [AXI_DATA_WIDTH-1:0] mem_axi_w_data_r;
    reg [AXI_DATA_WIDTH/8-1:0] mem_axi_w_strb_r;
    reg [AXI_DATA_WIDTH-1:0] per_axi_w_data_r;
    reg [AXI_DATA_WIDTH/8-1:0] per_axi_w_strb_r;

    assign axi_w_valid_o    = w_state_write;
    assign axi_w_data_o     = to_mem? mem_axi_w_data_r: per_axi_w_data_r;
    assign axi_w_strb_o     = to_mem? mem_axi_w_strb_r: per_axi_w_strb_r;
    assign axi_w_last_o     = axi_len == len;

    genvar i;
    generate
        for( i=0; i < MEM_TRANS_LEN; i = i + 1 ) begin: axi_w_for
            always @( posedge clock ) begin
                if( reset ) begin
                    mem_axi_w_data_r <= {AXI_DATA_WIDTH{1'b0}}; mem_axi_w_strb_r <= {AXI_DATA_WIDTH/8{1'b0}};
                end
                else if( ~aligned & overstep ) begin
                    // 这种写法的唯一保障在于接收方接收到后ready立马置低，即写至少需要额外一周期
                    // 写需要一周期，也合理
                    if( len[0] ) begin
                        mem_axi_w_data_r <= data_write_i & mask_l;
                        mem_axi_w_strb_r <= { mask_l[56],mask_l[48], mask_l[40], mask_l[32], mask_l[24], mask_l[16], mask_l[8], mask_l[0] } ;
                    end
                    else begin
                        mem_axi_w_data_r <= ( data_write_i >> aligned_offset_l )& mask_h;
                        mem_axi_w_strb_r <= { mask_h[56], mask_h[48], mask_h[40], mask_h[32], mask_h[24], mask_h[16], mask_h[8], mask_h[0] } ;
                    end
                end
                else if( len == i )begin
                    mem_axi_w_data_r <= data_write_i[i*AXI_DATA_WIDTH +: AXI_DATA_WIDTH ] & mask_l;
                    mem_axi_w_strb_r <= { mask_l[56], mask_l[48], mask_l[40], mask_l[32], mask_l[24], mask_l[16], mask_l[8], mask_l[0] } ;
                end
            end
        end
    endgenerate

    always @( posedge clock ) begin
        if( reset ) begin
            per_axi_w_data_r <= {AXI_DATA_WIDTH{1'b0}}; per_axi_w_strb_r <= {AXI_DATA_WIDTH/8{1'b0}};
        end
        else begin
            per_axi_w_data_r <= data_write_i & per_mask;
            per_axi_w_strb_r <= { per_mask[56], per_mask[48], per_mask[40], per_mask[32], per_mask[24], per_mask[16], per_mask[8], per_mask[0] } ;
        end
    end
    



    //b

    assign axi_b_ready_o    = w_state_resp;
    

    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;// 当目前在输出地址时，那就写地址允许
    assign axi_ar_addr_o    = axi_addr;
    assign axi_ar_id_o      = rw_id_i;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210092_AXI_BURST_TYPE_INCR;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;// 确实！

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;// 分别移动， 使得两者可以相或就可以直接得到最终数据  

    reg [RW_DATA_WIDTH-1:0] mem_read_r;
    reg [RW_DATA_WIDTH-1:0] per_read_r;
    assign data_read_o = to_mem? mem_read_r: per_read_r;

    generate
        for ( i = 0; i < MEM_TRANS_LEN; i = i + 1) begin: mem_read_for // verilog真不支持+=，我记得，这是sv啊
            // MEM_TRANS_LEN的含义是读完一次RW所需的位数需要的总线事务数
            // 
            always @(posedge clock) begin
                if (reset) begin
                    mem_read_r[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= {AXI_DATA_WIDTH{1'b0}};
                end
                    //非对齐且跨越，一定读两次，不用管MEM_TRANS_LEN
                else if ( r_hs ) begin // 这不就是hs吗？这样浪费一个门啊
                    if (~aligned & overstep) begin
                        if (len[0]) begin// 奇数位把高位或进来
                            mem_read_r[AXI_DATA_WIDTH-1:0] <= mem_read_r[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                        end
                        else begin// 偶数位直接相等
                            mem_read_r[AXI_DATA_WIDTH-1:0] <= mem_read_r;
                        end
                    end
                    // 非对齐且不跨越，只读一次，按对应位处理即可
                    // 普通读多次，就正常处理即可
                    else if (len == i) begin
                        mem_read_r[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= axi_r_data_l;
                    end
                end
            end
        end
    endgenerate

    always @(posedge clock) begin
        if (reset) begin
            per_read_r <= {AXI_DATA_WIDTH{1'b0}};
        end
        else begin
            per_read_r <= ( axi_r_data_i & per_mask ) >> ( { 3'b0, rw_addr_i[2:0] } << 3 );
        end
    end



endmodule


module ysyx_210092(
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
    // aw
    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210092_AXI_ADDR_WIDTH-1:0] aw_addr;
    wire [`YSYX210092_AXI_ID_WIDTH-1:0] aw_id;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;

    //w
    wire w_ready;
    wire w_valid;
    wire [`YSYX210092_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210092_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
    
    //b
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;
    wire [`YSYX210092_AXI_ID_WIDTH-1:0] b_id;

    //ar
    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210092_AXI_ADDR_WIDTH-1:0] ar_addr;
    wire [`YSYX210092_AXI_ID_WIDTH-1:0] ar_id;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    
    //r
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210092_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210092_AXI_ID_WIDTH-1:0] r_id;

    //ysyx_210092_axi_rw
	wire rw_ready;
    wire [`YSYX210092_AXI_DATA_WIDTH-1:0] data_read;
    wire [1:0] rw_resp;

    //ysyx_210092_if_mem_arbiter
    wire if_ready;
    wire [`YSYX210092_DATA_BUS] if_data_read;
    wire [1:0] if_resp;

	wire cpu_mem_ready;
    wire [`YSYX210092_DATA_BUS] cpu_mem_data_read;
    wire [1:0] cpu_mem_resp;

    wire rw_valid;
    wire rw_req;
    wire  [63:0] data_write;
    wire  [63:0] rw_addr;
    wire  [1:0] rw_size;
    wire  [3:0] rw_id;

    // ysyx_210092_cpu 
    wire if_valid;
    wire [63:0] if_addr;
    wire [1:0] if_size;
    wire if_req;

    wire cpu_mem_valid;
    wire [63:0] cpu_mem_data_write;
    wire [63:0] cpu_mem_addr;
    wire [1:0] cpu_mem_size;
    wire cpu_mem_req;

    //aw
    assign aw_ready                                 = io_master_awready;
    assign io_master_awvalid                        = aw_valid;
    assign io_master_awaddr                         = aw_addr[31:0];
    assign io_master_awid                           = aw_id;
    assign io_master_awlen                          = aw_len;
    assign io_master_awsize                         = aw_size;
    assign io_master_awburst                        = aw_burst;

    //w
    assign w_ready                                  = io_master_wready;
    assign io_master_wvalid                         = w_valid;
    assign io_master_wdata                          = w_data;
    assign io_master_wstrb                          = w_strb;
    assign io_master_wlast                          = w_last;
    
    //b
    assign io_master_bready                         = b_ready;
    assign b_valid                                  = io_master_bvalid;
    assign b_resp                                   = io_master_bresp;
    assign b_id                                     = io_master_bid;

    //ar
    assign ar_ready                                 = io_master_arready;
    assign io_master_arvalid                        = ar_valid;
    assign io_master_araddr                         = ar_addr[31:0];
    assign io_master_arid                           = ar_id;
    assign io_master_arlen                          = ar_len;
    assign io_master_arsize                         = ar_size;
    assign io_master_arburst                        = ar_burst;
    
    //r
    assign io_master_rready                         = r_ready;
    assign r_valid                                  = io_master_rvalid;
    assign r_resp                                   = io_master_rresp;
    assign r_data                                   = io_master_rdata;
    assign r_last                                   = io_master_rlast;
    assign r_id                                     = io_master_rid;


    /* slave */
    assign io_slave_awready                         = 1'b0;

    assign io_slave_wready                          = 1'b0;

    assign io_slave_bvalid                          = 1'b0;
    assign io_slave_bresp                           = 2'b0;
    assign io_slave_bid                             = 4'b0;

    assign io_slave_arready                         = 1'b0;

    assign io_slave_rvalid                          = 1'b0;
    assign io_slave_rresp                           = 2'b0;
    assign io_slave_rdata                           = 64'b0;
    assign io_slave_rlast                           = 1'b0;
    assign io_slave_rid                             = 4'b0;

    //ysyx_210092_axi_rw
    ysyx_210092_axi_rw my_axi_rw(
        .clock( clock ),
        .reset( reset ),

    	.rw_valid_i( rw_valid ),
    	.rw_ready_o( rw_ready ),
        .rw_req_i( rw_req ),
        .data_read_o( data_read ),
        .data_write_i( data_write ),
        .rw_addr_i( rw_addr ),
        .rw_size_i( rw_size ),
        .rw_resp_o( rw_resp ),
        .rw_id_i( rw_id ),
        // Advanced eXtensible Interface

        //写地址
        .axi_aw_ready_i( aw_ready ),
        .axi_aw_valid_o( aw_valid),
        .axi_aw_addr_o( aw_addr ),
        .axi_aw_id_o( aw_id ),
        .axi_aw_len_o( aw_len ),
        .axi_aw_size_o( aw_size ),
        .axi_aw_burst_o( aw_burst ),

        //写数据
        .axi_w_ready_i( w_ready ),
        .axi_w_valid_o( w_valid ),
        .axi_w_data_o( w_data ),
        .axi_w_strb_o( w_strb ),
        .axi_w_last_o( w_last ),

        //写返回
        .axi_b_ready_o( b_ready ),
        .axi_b_valid_i( b_valid ),
        .axi_b_resp_i( b_resp ),
        .axi_b_id_i( b_id ),

        //读地址
        .axi_ar_ready_i( ar_ready ),
        .axi_ar_valid_o( ar_valid ),
        .axi_ar_addr_o( ar_addr ),
        .axi_ar_id_o( ar_id ),
        .axi_ar_len_o( ar_len ),
        .axi_ar_size_o( ar_size ),
        .axi_ar_burst_o( ar_burst ),

        //读数据（返回）
        .axi_r_ready_o( r_ready ),
        .axi_r_valid_i( r_valid ),
        .axi_r_resp_i( r_resp ),
        .axi_r_data_i( r_data ),
        .axi_r_last_i( r_last ),
        .axi_r_id_i( r_id )
    );

    //ysyx_210092_if_mem_arbiter
    ysyx_210092_if_mem_arbiter my_if_mem_arbiter    (
        /* if */
        .if_ready( if_ready ),
        .if_data_read( if_data_read ),
        .if_resp( if_resp ),

        .if_valid( if_valid ),
        .if_addr( if_addr ),
        .if_size( if_size ),
        .if_req( if_req ),

        /* mem */
        .mem_valid( cpu_mem_valid ),
    	.mem_ready( cpu_mem_ready ),
        .mem_data_read( cpu_mem_data_read ),
        .mem_data_write( cpu_mem_data_write ),
        .mem_addr( cpu_mem_addr ),
        .mem_size( cpu_mem_size ),
        .mem_resp( cpu_mem_resp ),
        .mem_req( cpu_mem_req ),

        /* ysyx_210092_axi_rw */
        .rw_valid( rw_valid ),
    	.rw_ready( rw_ready ),
        .rw_req( rw_req ),
        .data_read( data_read ),
        .data_write( data_write ),
        .rw_addr( rw_addr ),
        .rw_size( rw_size ),
        .rw_resp( rw_resp ),
        .rw_id( rw_id )
    );

    //ysyx_210092_cpu
    ysyx_210092_cpu my_cpu(
        .clock( clock ),
        .reset( reset ),

        .if_ready( if_ready ),
        .if_data_read( if_data_read ),
        .if_resp( if_resp ),
        .if_valid( if_valid ),
        .if_addr( if_addr ),
        .if_size( if_size ),
        .if_req( if_req ),

        .cpu_mem_valid( cpu_mem_valid ),
        .cpu_mem_ready( cpu_mem_ready ),
        .cpu_mem_data_read( cpu_mem_data_read ),
        .cpu_mem_data_write( cpu_mem_data_write ),
        .cpu_mem_addr( cpu_mem_addr ),
        .cpu_mem_size( cpu_mem_size ),
        .cpu_mem_resp( cpu_mem_resp ),
        .cpu_mem_req( cpu_mem_req )
    );

endmodule
