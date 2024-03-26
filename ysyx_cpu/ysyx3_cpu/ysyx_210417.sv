/*
 * @Author: ZhiyuanZhao
 * @Description: 
 * @Date: 2021-09-23 21:05:06
 * @LastEditTime: 2021-10-10 21:51:05
 */
`timescale 1ns/1ns
typedef     logic   [63:0]      logic64_t         ;
typedef     logic   [31:0]      logic32_t         ;
typedef     logic   [7:0]       logic8_t          ;
typedef     logic   [4:0]       logic5_t          ;

module ysyx_210417(
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
    assign  io_slave_awready =   1;
    assign  io_slave_wready =   1;
    assign  io_slave_bvalid = 0;
    assign  io_slave_bresp = 0;
    assign  io_slave_bid = 0;
    assign  io_slave_arready = 1;
    assign  io_slave_rvalid = 0 ;
    assign  io_slave_rresp = 0 ;
    assign  io_slave_rdata = 0 ;
    assign  io_slave_rlast = 0 ;
    assign  io_slave_rid = 0 ;
    logic                               IB_rdy                          ;
    logic                               IB_vld                          ;
    logic64_t                           IB_addr                         ;
    logic32_t                           IB_data                         ;
    logic64_t                           DB_wdata                        ;
    logic [2:0]                         DB_size                         ;
    logic                               DB_wr                           ;
    logic64_t                           DB_rdata                        ;
    logic                               DB_vld                          ;
    logic                               DB_rdy                          ;
    logic64_t                           DB_addr                         ;
    logic 						        interrupt_soft                  ;
    logic 						        interrupt_timer                 ;
    logic 						        interrupt_ext                   ;

    ysyx_210417_core rv64i_inst(
    .clk                               (clock                     ),
    .reset                             (reset                     ),
    .IB_rdy                            (IB_rdy                    ),
    .IB_vld                            (IB_vld                    ),
    .IB_addr                           (IB_addr                   ),
    .IB_data                           (IB_data                   ),
    .DB_rdy                            (DB_rdy                    ),
    .DB_wdata                          (DB_wdata                  ),
    .DB_size                           (DB_size                   ),
    .DB_wr                             (DB_wr                     ),
    .DB_vld                            (DB_vld                    ),
    .DB_addr                           (DB_addr                   ),
    .DB_rdata                          (DB_rdata                  ),
    .interrupt_soft                    (interrupt_soft            ),
    .interrupt_timer                   (interrupt_timer           ),
    .interrupt_ext                     (interrupt_ext             ) 
    );
    ysyx_210417_AXI #(
    .AXI_ID_WIDTH                      (4                         )
    )axi_inst(
    .clk                               (clock                     ),
    .reset                             (reset                     ),
    .IB_rdy                            (IB_rdy                    ),
    .IB_vld                            (IB_vld                    ),
    .IB_data                           (IB_data                   ),
    .IB_addr                           (IB_addr                   ),
    .DB_rdy                            (DB_rdy                    ),
    .DB_wdata                          (DB_wdata                  ),
    .DB_size                           (DB_size                   ),
    .DB_wr                             (DB_wr                     ),
    .DB_vld                            (DB_vld                    ),
    .DB_addr                           (DB_addr                   ),
    .DB_rdata                          (DB_rdata                  ),
    .axi_awvalid                       (io_master_awvalid         ),
    .axi_awready                       (io_master_awready         ),
    .axi_awaddr                        (io_master_awaddr          ),
    .axi_awid                          (io_master_awid            ),
    .axi_awlen                         (io_master_awlen           ),
    .axi_awsize                        (io_master_awsize          ),
    .axi_awburst                       (io_master_awburst         ),
    .axi_wvalid                        (io_master_wvalid          ),
    .axi_wready                        (io_master_wready          ),
    .axi_wdata                         (io_master_wdata           ),
    .axi_wstrb                         (io_master_wstrb           ),
    .axi_wlast                         (io_master_wlast           ),
    .axi_bvalid                        (io_master_bvalid          ),
    .axi_bready                        (io_master_bready          ),
    .axi_bresp                         (io_master_bresp           ),
    .axi_bid                           (io_master_bid             ),
    .axi_arvalid                       (io_master_arvalid         ),
    .axi_arready                       (io_master_arready         ),
    .axi_araddr                        (io_master_araddr          ),
    .axi_arid                          (io_master_arid            ),
    .axi_arlen                         (io_master_arlen           ),
    .axi_arsize                        (io_master_arsize          ),
    .axi_arburst                       (io_master_arburst         ),
    .axi_rvalid                        (io_master_rvalid          ),
    .axi_rready                        (io_master_rready          ),
    .axi_rdata                         (io_master_rdata           ),
    .axi_rresp                         (io_master_rresp           ),
    .axi_rlast                         (io_master_rlast           ),
    .axi_rid                           (io_master_rid             ),
    .io_interrupt                      (io_interrupt              ),
    .interrupt_soft                    (interrupt_soft            ),
    .interrupt_timer                   (interrupt_timer           ),
    .interrupt_ext                     (interrupt_ext             ) 
);
endmodule

module ysyx_210417_core#(
        parameter   base_addr    = 64'h3000_0000     
)(
        input	logic		    			clk			     ,
        input	logic		    			reset		     ,
    
	    input   logic                       IB_rdy           ,
	    output  logic                       IB_vld           ,
	    output  logic64_t                   IB_addr          ,
	    input   logic32_t                   IB_data          ,
    
	    output  logic64_t                   DB_wdata         ,
	    output  logic [2:0]                 DB_size          ,
	    input   logic64_t                   DB_rdata         ,
	    output  logic                       DB_vld           ,
	    output  logic                       DB_wr            ,
	    input   logic                       DB_rdy           ,
	    output  logic64_t                   DB_addr          ,
        input   logic 						interrupt_soft   ,
        input   logic 						interrupt_timer  ,
        input   logic 						interrupt_ext            
    );
    localparam
        R_opcode  =   5'b01100      ,
        Rw_opcode =   5'b01110      ,
        I_opcode  =   5'b00100      ,
        Iw_opcode =   5'b00110      ,
        L_opcode  =   5'b00000      ,
        S_opcode  =   5'b01000      ,
        B_opcode  =   5'b11000      ,
        U_opcode  =   5'b01101      ,
        J_opcode  =   5'b11011      ,
        Jr_opcode =   5'b11001      ,
        A_opcode  =   5'b00101      ,
        C_opcode  =   5'b11100      ;
    typedef enum logic[3:0] {
        sel_add                     ,
        sel_addw                    ,
        sel_sub                     ,
        sel_subw                    ,
        sel_sll                     ,
        sel_sllw                    ,
        sel_slt                     ,
        sel_sltu                    ,
        sel_xor                     ,
        sel_srl                     ,
        sel_srlw                    ,
        sel_sra                     ,
        sel_sraw                    ,
        sel_none                    ,
        sel_or                      ,
        sel_and                     
    } alu_sel_enum;
    typedef enum logic[2:0] {
        comp_one                    ,
        comp_zero                   ,
        comp_beq                    ,
        comp_bne                    ,
        comp_blt                    ,
        comp_bltu                   ,
        comp_bge                    ,
        comp_bgeu                                     
    } comp_sel_enum;
    typedef enum logic[1:0] {
        sntaken  = 2'b00                   ,
        ntaken   = 2'b01                   ,
        taken    = 2'b10                   ,
        staken   = 2'b11                   
    } bp_2bit_enum;
    typedef struct packed {
        logic       [1:0]                funct7     ;
        logic		[2:0]                funct3		;
        logic       [4:0]                opcode     ;
    } opcode_t;        
    typedef struct packed {
        logic5_t                         rs2        ;
        logic5_t                         rs1        ;
        logic5_t                         rd         ;
    } xaddr_t;
    typedef struct packed {
        logic64_t                        mcycle     ;
        logic64_t                        mtvec      ;
        logic64_t                        mcause     ;
        logic64_t                        mepc       ;
        logic64_t                        mstatus    ;
        logic64_t                        mhartid    ;
        logic64_t                        mscratch   ;
        logic64_t                        mie        ;
        logic64_t                        mip        ;
    } csr_t;
    typedef struct packed {
        logic                            mcycle     ;
        logic                            mtvec      ;
        logic                            mcause     ;
        logic                            mepc       ;
        logic                            mstatus    ;
        logic                            mhartid    ;
        logic                            mscratch   ;
        logic                            mie        ;
        logic                            mip        ;
    } csr_sel_t; 
    typedef struct packed {
        logic                            R          ;
        logic                            Rw         ;
        logic                            I          ;
        logic                            Iw         ;
        logic                            L          ;
        logic                            S          ;
        logic                            B          ;
        logic                            U          ;
        logic                            J          ;
        logic                            Jr         ;
        logic                            A          ;
        logic                            C          ;
    } instr_type_t;
    typedef struct packed {
        logic                            instr_lui      ;
        logic                            instr_auipc    ;
        logic                            instr_jal      ;
        logic                            instr_jalr     ;
        logic                            instr_beq      ; 
        logic                            instr_bne      ; 
        logic                            instr_blt      ; 
        logic                            instr_bge      ; 
        logic                            instr_bltu     ; 
        logic                            instr_bgeu     ; 
        logic                            instr_lb       ; 
        logic                            instr_lh       ; 
        logic                            instr_lw       ; 
        logic                            instr_lbu      ; 
        logic                            instr_lhu      ; 
        logic                            instr_sb       ; 
        logic                            instr_sh       ; 
        logic                            instr_sw       ; 
        logic                            instr_addi     ; 
        logic                            instr_slti     ; 
        logic                            instr_sltiu    ; 
        logic                            instr_xori     ; 
        logic                            instr_ori      ; 
        logic                            instr_andi     ; 
        logic                            instr_slli     ; 
        logic                            instr_srli     ; 
        logic                            instr_srai     ; 
        logic                            instr_add      ; 
        logic                            instr_sub      ; 
        logic                            instr_sll      ; 
        logic                            instr_slt      ; 
        logic                            instr_sltu     ; 
        logic                            instr_xor      ; 
        logic                            instr_srl      ; 
        logic                            instr_sra      ; 
        logic                            instr_or       ; 
        logic                            instr_and      ;    
        logic                            instr_lwu      ;
        logic                            instr_ld       ;
        logic                            instr_sd       ;
        logic                            instr_addiw    ;
        logic                            instr_slliw    ; 
        logic                            instr_srliw    ; 
        logic                            instr_sraiw    ; 
        logic                            instr_addw     ;  
        logic                            instr_subw     ; 
        logic                            instr_sllw     ; 
        logic                            instr_srlw     ; 
        logic                            instr_sraw     ; 
        logic                            instr_csrrw    ;   
        logic                            instr_csrrs    ;   
        logic                            instr_csrrc    ;   
        logic                            instr_csrrwi   ;   
        logic                            instr_csrrsi   ;   
        logic                            instr_csrrci   ;   
        logic                            instr_ecall    ;   
        logic                            instr_mret     ;   
    } instr_t;
    typedef struct packed {
        logic                            external       ; 
        logic                            timer          ;      
        logic                            software       ;     
    } interrupt_t;
    typedef struct packed {
        logic                            j          ;
        logic                            beq        ;
        logic                            bne        ;
        logic                            blt        ;
        logic                            bltu       ;
        logic                            bge        ;
        logic                            bgeu       ;
    } jump_sel_t;
    typedef struct packed {
        logic                            ld       ;
        logic                            lb       ;
        logic                            lh       ;
        logic                            lw       ;
        logic                            lbu      ;
        logic                            lhu      ;
        logic                            lwu      ;
        logic                            sb       ;
        logic                            sh       ;
        logic                            sw       ;
        logic                            sd       ;
    } mem_sel_t;
    typedef struct packed {
        logic                            j          ;
        logic32_t                        instr      ;
        logic64_t                        pc         ;
    } queue_data_t;
    csr_t                               csr             ;
    logic64_t                           csr_rs_id       ;
    logic64_t                           csr_rs          ;
    csr_sel_t                           csr_sel_id      ;
    csr_sel_t                           csr_sel_ex      ;
    logic      [11:0]                   csr_addr        ;
    logic      [1:0]                    csr_op          ;
    logic64_t                           csr_id          ;
    logic64_t                           csr_ex          ;

    logic                               J_pred          ;
    logic64_t                           pc_pred         ;
    logic64_t                           imm_pred        ;
    logic                               J_pred_if       ;
    bp_2bit_enum                        bp_2bit         ;
    logic                               stall           ;
    logic                               D_pvld          ;
    logic                               I_pvld          ;
    logic64_t                           I_paddr         ; 
    logic                               I_vld           ;
    logic                               QI_vld          ;
    logic                               instr_clear     ;
    logic                               queue_vld       ;
    logic                               launch_en       ;
    logic                               instr_launch    ;
    logic32_t                           instr           ;
    logic64_t                           pc_launch       ;
    logic                               J_comb          ;
    logic                               J_vld           ;
    logic                               J_flush         ;
    queue_data_t                        queue_dout      ;
    queue_data_t                        queue_data      ;
    queue_data_t                        in_data         ;
    logic                               store_vld       ;
    logic                               queue_wr        ;
    logic                               queue_rdy       ;

    logic                               I_vld_id        ;
    logic32_t                           instr_id        ;
    logic64_t                           pc_id           ;
    logic                               J_pred_id       ;
    logic                               Wenreg_id       ;
    xaddr_t                             xaddr_id        ;
    alu_sel_enum                        alu_sel_id      ;
    mem_sel_t                           mem_sel_id      ;
    logic                               load_id         ;
    logic                               nstore_id       ;
    logic                               exception_id    ;
    interrupt_t                         interrupt_id    ;
    logic                               ret_id          ;
    jump_sel_t                          jump_sel        ;
    logic64_t       		        	alu_id1	        ;
    logic64_t       		        	alu_id2	        ;
    logic64_t       		        	pc_add_id       ;
    
    logic                               I_vld_ex        ;
    logic32_t                           instr_ex        ;
    logic64_t                           pc_ex           ;
    logic                               ex_hs           ;
    logic                               Wenreg_ex       ;
    logic       [4:0]                   rd_addr_ex      ;
    alu_sel_enum                        alu_sel_ex      ;
    mem_sel_t                           mem_sel_ex      ;
    logic                               load_ex         ;
    logic                               branch_ex       ;
    logic                               mem_bypass      ;
    logic                               exception_ex    ;
    interrupt_t                         interrupt_ex    ;
    logic                               ret_ex          ;
    logic                               rs1_pass        ;
    logic                               rs2_pass        ;
    logic64_t       		        	alu_in1	        ;
    logic64_t       		        	alu_in2	        ;
    logic64_t                           alu_out         ;
    logic64_t       		        	pc_add	        ;

    logic                               I_vld_mem       ;
    logic                               mem_hs          ;
    logic32_t                           instr_mem       ;
    logic64_t                           pc_mem          ;
    logic                               Wenreg_mem      ;
    mem_sel_t                           mem_sel_mem     ;
    logic                               load_mem        ;
    logic       [4:0]                   rd_addr_mem     ;
    logic64_t                           rd_mem          ;
    logic                               exception_mem   ;
    interrupt_t                         interrupt_mem   ;
    logic                               ret_mem         ;
    csr_t                               csr_reg_mem     ;

    logic                               I_vld_wb        ;
    logic32_t                           instr_wb        ;
    logic64_t                           pc_wb           ;
    logic                               Wenreg_wb       ;
    logic       [4:0]                   rd_addr_wb      ;
    logic64_t                           rd_wb           ;
    logic                               exception_wb    ;
    interrupt_t                         interrupt_wb    ;
    logic                               ret_wb          ;
    csr_t                               csr_reg_wb      ;

    logic                               rs1_instr       ;
    logic                               rs1_conflict    ;
    logic                               rs2_instr       ;
    logic                               rs2_conflict    ;
    logic64_t                           pc_seq          ;
    logic64_t                           pc_jump         ;
    logic64_t                           pc_next         ;
    logic64_t                           pc              ;
    logic64_t                           rs1             ;
    logic64_t                           rs2             ;
    xaddr_t                             xaddr           ;

    logic64_t                           imm_alu         ;
    logic64_t                           imm_pc          ;
    logic64_t       		        	mem_addr        ;
    logic64_t       		        	mem_wdata       ;
    logic64_t       		        	mem_wdata_id    ;
    logic64_t       		        	mem_rdata       ;

    instr_type_t                        I_type          ;
    opcode_t                            op              ;
    instr_t                             tp              ;
    logic64_t                           alu_add         ;  
    logic64_t                           alu_addw        ; 
    logic64_t                           alu_sub         ;  
    logic64_t                           alu_subw        ;  
    logic64_t                           alu_sll         ;  
    logic64_t                           alu_sllw        ; 
    logic64_t                           alu_slt         ;  
    logic64_t                           alu_sltu        ; 
    logic64_t                           alu_xor         ;  
    logic64_t                           alu_srl         ;  
    logic64_t                           alu_srlw        ; 
    logic64_t                           alu_sra         ;  
    logic64_t                           alu_sraw        ; 
    logic64_t                           alu_or          ;   
    logic64_t                           alu_and         ;  
    logic64_t                           alu_none        ;  
    logic32_t                           sllw_comb       ;  
    logic64_t                           x[1:31]		    ;

    assign queue_wr         =   I_vld && (queue_vld || rs1_conflict || rs2_conflict || stall)                   ;
    assign queue_rdy        =   launch_en || !queue_vld                                                         ;
    assign I_vld            =   IB_rdy && !J_flush && !instr_clear                                              ;
    assign QI_vld           =   queue_vld && !J_flush                                                           ;
    assign J_pred           =   I_vld && (I_type.J || (I_type.B && bp_2bit[1])) && !queue_vld                   ;
    assign mem_hs           =   I_vld_mem && (mem_bypass || DB_rdy)                                             ;
    assign ex_hs            =   I_vld_ex && !stall                                                              ;
    assign xaddr    		=	{instr[24:20], instr[19:15], instr[11:7]}			                            ;
    assign op		        =	{{instr[30], instr[25]}, instr[14:12], instr[6:2]}                              ;
    assign DB_addr		    =	alu_out	                                                                        ;
    // assign DB_addr		    =	{alu_out[63:3], 3'b0}	                                                        ;
    assign IB_addr		    =	pc	                                                                            ;
    assign sllw_comb		=	alu_in1[31:0] << alu_in2[4:0]			                                        ;
    assign csr_addr         =   instr[31:20]                                                                    ;
    assign rs1_instr        =   I_type.C || I_type.R || I_type.Rw || I_type.I || I_type.Iw || I_type.S || I_type.B || I_type.L || I_type.Jr;
    assign rs2_instr        =   I_type.R || I_type.Rw || I_type.S || I_type.B                                   ;
    assign rs1_conflict     =   rs1_instr && ((xaddr.rs1 == xaddr_id.rd && I_vld_id && load_id) || (xaddr.rs1 == rd_addr_ex && I_vld_ex && load_ex) || (xaddr.rs1 == rd_addr_mem && I_vld_mem && load_mem && !DB_rdy));
    assign rs2_conflict     =   rs2_instr && ((xaddr.rs2 == xaddr_id.rd && I_vld_id && load_id) || (xaddr.rs2 == rd_addr_ex && I_vld_ex && load_ex) || (xaddr.rs2 == rd_addr_mem && I_vld_mem && load_mem && !DB_rdy));
    assign stall            =   D_pvld && !DB_rdy                                                               ;    //所有指令
    assign instr_launch     =   !(rs1_conflict || rs2_conflict || stall) && (QI_vld || I_vld)                   ;
    assign launch_en        =   !(rs1_conflict || rs2_conflict || stall) || !(QI_vld || I_vld)                  ;
    assign interrupt_id     =   {3{csr.mstatus[3]}} & {interrupt_ext && csr.mie[11], interrupt_timer && csr.mie[7], interrupt_soft && csr.mie[3]};
	//----------------------------
	//IF STAGE
	//----------------------------
    always_ff@(posedge clk)begin
        if(reset)
            I_pvld <= 1'b0;
        else 
        if(IB_rdy || !I_pvld)
            I_pvld <= IB_vld;
    end
    always_ff@(posedge clk)begin
        if(reset)
            IB_vld <= 1'b1;
        else 
        if((IB_rdy || !I_pvld) && (launch_en || J_pred || J_flush))
            IB_vld <= 1'b1;
        else
        if(IB_rdy || !I_pvld)
            IB_vld <= 1'b0;
    end
    always_ff@(posedge clk)begin
        if(reset)
            I_paddr <= 'd0;
        else
        if(IB_rdy || !I_pvld)
            I_paddr <= IB_addr;
    end
    always_ff@(posedge clk)begin
        if(reset)
            pc <= base_addr;
        else
        if(IB_rdy || !I_pvld)begin
            if(J_flush)      
                pc <= pc_next;  
            else
                pc <= pc_pred + imm_pred;  
        end 
    end
    always_comb begin
        if(J_vld)
            pc_next = pc_jump;
        else 
            pc_next = pc_seq;
    end
    always_comb begin
        if(J_pred)
            pc_pred = I_paddr;
        else  
            pc_pred = pc;
    end
    always_comb begin
        if(I_type.B && J_pred)
            imm_pred = {{52{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
        else 
        if(J_pred) 
            imm_pred = {{44{instr[31]}}, instr[19:12],  instr[20], instr[30:21], 1'b0};
        else
        if(!launch_en)
            imm_pred = 0;
        else  
            imm_pred = 4;
    end
    always_ff@(posedge clk)begin
        if(reset)
            instr_clear <= 1'b0;
        else
        if(IB_rdy)
            instr_clear <= (J_pred || J_flush) && IB_vld;
    end
	//----------------------------
	//INSTR QUEUE
	//----------------------------
    always_comb begin
        if(queue_vld)
            {J_pred_if, instr, pc_launch}       = queue_dout;
        else 
            {J_pred_if, instr, pc_launch}       = {J_pred, IB_data, I_paddr};
    end

    always_ff@(posedge clk)begin
        if(reset)
            queue_data <= 'd0;
        else
        if(queue_wr && !queue_rdy)
            queue_data <= {J_pred, IB_data, I_paddr};
    end
    always_ff@(posedge clk)begin
        if(reset)
            store_vld <= 'd0;
        else
        if(J_flush)
            store_vld <= 'd0;
        else
        if(queue_wr && !queue_rdy)
            store_vld <= queue_wr;
        else
        if(queue_rdy && store_vld)
            store_vld <= 'd0;
    end
    always_comb begin
        if(queue_rdy && store_vld)
            in_data = queue_data;
        else 
            in_data = {J_pred, IB_data, I_paddr};
    end
    always_ff@(posedge clk)begin
        if(reset)
            queue_dout <= 'd0;
        else
        if(queue_rdy)
            queue_dout <= in_data;
    end
    always_ff@(posedge clk)begin
        if(reset)
            queue_vld <= 'd0;
        else 
        if(J_flush)
            queue_vld <= 'd0;
        else
        if(queue_rdy)
            queue_vld <= store_vld || queue_wr;
    end
	//----------------------------
	//ID STAGE
	//----------------------------
    always_ff@(posedge clk)begin
        if(reset)
            I_vld_id <= 1'b0;
        else 
        if(J_flush)
            I_vld_id <= 1'b0;
        else
        if(instr_launch)
            I_vld_id <= 1'b1;
        else 
        if(!stall)
            I_vld_id <= 1'b0;
    end
    always_comb begin     // instr type
        I_type.R    = op.opcode == R_opcode;
        I_type.Rw   = op.opcode == Rw_opcode;
        I_type.I    = op.opcode == I_opcode;
        I_type.Iw   = op.opcode == Iw_opcode;
        I_type.S    = op.opcode == S_opcode;
        I_type.B    = op.opcode == B_opcode;
        I_type.U    = op.opcode == U_opcode;
        I_type.J    = op.opcode == J_opcode;
        I_type.Jr   = op.opcode == Jr_opcode;
        I_type.A    = op.opcode == A_opcode;
        I_type.L    = op.opcode == L_opcode;
        I_type.C    = op.opcode == C_opcode;
    end
    always_comb begin   // instr type
        tp.instr_addw  = I_type.Rw && op.funct3 == 3'b000 && op.funct7 == 2'b00    ;
        tp.instr_subw  = I_type.Rw && op.funct3 == 3'b000 && op.funct7 == 2'b10    ;
        tp.instr_sraw  = I_type.Rw && op.funct3 == 3'b101 && op.funct7 == 2'b10    ;
        tp.instr_srlw  = I_type.Rw && op.funct3 == 3'b101 && op.funct7 == 2'b00    ;
        tp.instr_srliw = I_type.Iw && op.funct3 == 3'b101 && !op.funct7[1]         ;
        tp.instr_sraiw = I_type.Iw && op.funct3 == 3'b101 && op.funct7[1]          ;
        tp.instr_sllw  = I_type.Rw && op.funct3 == 3'b001                          ;
        tp.instr_slliw = I_type.Iw && op.funct3 == 3'b001                          ;
        tp.instr_addiw = I_type.Iw && op.funct3 == 3'b000                          ;
        tp.instr_lwu   = I_type.L && op.funct3 == 3'b110                           ;
        tp.instr_ld    = I_type.L && op.funct3 == 3'b011                           ;
        tp.instr_sd    = I_type.S && op.funct3 == 3'b011                           ;
        
        tp.instr_add   = I_type.R && op.funct3 == 3'b000 && op.funct7 == 2'b00     ;
        tp.instr_sub   = I_type.R && op.funct3 == 3'b000 && op.funct7 == 2'b10     ;
        tp.instr_sra   = I_type.R && op.funct3 == 3'b101 && op.funct7 == 2'b10     ;
        tp.instr_srl   = I_type.R && op.funct3 == 3'b101 && op.funct7 == 2'b00     ;
        tp.instr_srli  = I_type.I && op.funct3 == 3'b101 && !op.funct7[1]          ;
        tp.instr_srai  = I_type.I && op.funct3 == 3'b101 && op.funct7[1]           ;
        tp.instr_sll   = I_type.R && op.funct3 == 3'b001                           ;
        tp.instr_slli  = I_type.I && op.funct3 == 3'b001                           ;
        tp.instr_addi  = I_type.I && op.funct3 == 3'b000                           ;
    
        tp.instr_andi  = I_type.I && op.funct3 == 3'b111                           ;
        tp.instr_and   = I_type.R && op.funct3 == 3'b111                           ;
        tp.instr_or    = I_type.R && op.funct3 == 3'b110                           ;
        tp.instr_slt   = I_type.R && op.funct3 == 3'b010                           ;
        tp.instr_sltu  = I_type.R && op.funct3 == 3'b011                           ;
        tp.instr_xor   = I_type.R && op.funct3 == 3'b100                           ;
        tp.instr_slti  = I_type.I && op.funct3 == 3'b010                           ;
        tp.instr_sltiu = I_type.I && op.funct3 == 3'b011                           ;
        tp.instr_xori  = I_type.I && op.funct3 == 3'b100                           ;
        tp.instr_ori   = I_type.I && op.funct3 == 3'b110                           ;
        tp.instr_lb    = I_type.L && op.funct3 == 3'b000                           ;
        tp.instr_lh    = I_type.L && op.funct3 == 3'b001                           ;
        tp.instr_lw    = I_type.L && op.funct3 == 3'b010                           ;
        tp.instr_lbu   = I_type.L && op.funct3 == 3'b100                           ;
        tp.instr_lhu   = I_type.L && op.funct3 == 3'b101                           ;
        tp.instr_sb    = I_type.S && op.funct3 == 3'b000                           ;
        tp.instr_sh    = I_type.S && op.funct3 == 3'b001                           ;
        tp.instr_sw    = I_type.S && op.funct3 == 3'b010                           ;
        tp.instr_beq   = I_type.B && op.funct3 == 3'b000                           ;
        tp.instr_bne   = I_type.B && op.funct3 == 3'b001                           ;
        tp.instr_blt   = I_type.B && op.funct3 == 3'b100                           ;
        tp.instr_bltu  = I_type.B && op.funct3 == 3'b110                           ;
        tp.instr_bge   = I_type.B && op.funct3 == 3'b101                           ;
        tp.instr_bgeu  = I_type.B && op.funct3 == 3'b111                           ;
        tp.instr_jalr  = I_type.Jr                                                 ;
        tp.instr_jal   = I_type.J                                                  ;
        tp.instr_lui   = I_type.U                                                  ;
        tp.instr_auipc = I_type.A                                                  ;

        tp.instr_csrrw  = I_type.C && op.funct3 == 3'b001                          ;
        tp.instr_csrrs  = I_type.C && op.funct3 == 3'b010                          ;
        tp.instr_csrrc  = I_type.C && op.funct3 == 3'b011                          ;
        tp.instr_csrrwi = I_type.C && op.funct3 == 3'B101                          ;
        tp.instr_csrrsi = I_type.C && op.funct3 == 3'b110                          ;
        tp.instr_csrrci = I_type.C && op.funct3 == 3'b111                          ;
        tp.instr_ecall  = I_type.C && op.funct3 == 3'b000 && xaddr.rs2 == 0        ;
        tp.instr_mret   = I_type.C && op.funct3 == 3'b000 && xaddr.rs2 == 5'b00010 ;
    end
    always_comb begin   // imm for alu
        if(I_type.S)
            imm_alu = {{53{instr[31]}}, instr[30:25], instr[11:7]};
        else
        if(I_type.U || I_type.A)
            imm_alu = {{33{instr[31]}},instr[30:12], 12'd0};
        else
        if(I_type.J || I_type.Jr)
            imm_alu = 4;
        else
            imm_alu =  {{53{instr[31]}},instr[30:20]};
    end
    always_ff@(posedge clk)begin
        if(reset)
            imm_pc <= 0;
        else
        if(instr_launch)begin
            if(op.opcode[1:0] == 2'b11)  //JAL
                imm_pc <= {{44{instr[31]}}, instr[19:12],  instr[20], instr[30:21], 1'b0};
            else
            if(op.opcode[1:0] == 2'b01)  //JALR
                imm_pc <=  {{53{instr[31]}},instr[30:20]};
            else   //B
                imm_pc <= {{52{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
        end
    end
    always_comb begin    //rs1
        if(xaddr.rs1 == rd_addr_ex && Wenreg_ex && I_vld_ex && !load_ex)   
            rs1 = alu_out;
        else
        if(xaddr.rs1 == rd_addr_mem && Wenreg_mem && I_vld_mem && load_mem && DB_rdy)   
            rs1 = mem_rdata;
        else
        if(xaddr.rs1 == rd_addr_mem && Wenreg_mem && I_vld_mem && !load_mem)   
            rs1 = rd_mem;
        else
        if(xaddr.rs1 == rd_addr_wb && Wenreg_wb)   
            rs1 = rd_wb;
        else
        if(|xaddr.rs1)
            rs1 = x[xaddr.rs1];
        else   
            rs1 = 0;
    end
    always_comb begin  //rs2
        if(xaddr.rs2 == rd_addr_ex && Wenreg_ex && I_vld_ex && !load_ex)   
            rs2 = alu_out;
        else
        if(xaddr.rs2 == rd_addr_mem && Wenreg_mem && I_vld_mem && load_mem && DB_rdy)   
            rs2 = mem_rdata;
        else
        if(xaddr.rs2 == rd_addr_mem && Wenreg_mem && I_vld_mem && !load_mem)   
            rs2 = rd_mem;
        else
        if(xaddr.rs2 == rd_addr_wb && Wenreg_wb)   
            rs2 = rd_wb;
        else
        if(|xaddr.rs2)
            rs2 = x[xaddr.rs2];
        else   
            rs2 = 0;
    end
    always_ff@(posedge clk)begin
        if(reset)begin
            instr_id            <= 'd0;
            pc_id               <= 'd0;
            pc_add_id           <= 'd0;
            xaddr_id            <= 'd0;
            mem_wdata_id        <= 'd0;
            alu_id1             <= 'd0;
            alu_id2             <= 'd0;
            jump_sel            <= 'd0;
            J_pred_id           <= 'd0;
            mem_sel_id          <= 'd0;
            load_id             <= 'd0;
            nstore_id           <= 'd0;
            Wenreg_id           <= 'd0;
            rs1_pass            <= 'd0;
            rs2_pass            <= 'd0;
            csr_rs_id           <= 'd0;
            csr_op              <= 'd0;
            csr_sel_id          <= 'd0;
            exception_id        <= 'd0;
            ret_id              <= 'd0;
        end
        else 
        if(instr_launch)begin 
            instr_id            <= instr                                                                                                        ;
            pc_id               <= pc_launch                                                                                                    ;
            pc_add_id           <= I_type.Jr ? rs1 : pc_launch                                                                                  ;
            xaddr_id            <= xaddr                                                                                                        ;
            mem_wdata_id        <= rs2                                                                                                          ;
            alu_id1             <= (I_type.J || I_type.A || I_type.Jr) ? pc_launch : rs1                                                        ; 
            alu_id2             <= (I_type.R || I_type.Rw || I_type.B) ? rs2 : imm_alu                                                          ;
            jump_sel.beq        <= tp.instr_beq                                                                                                 ; 
            jump_sel.bne        <= tp.instr_bne                                                                                                 ; 
            jump_sel.blt        <= tp.instr_blt                                                                                                 ; 
            jump_sel.bltu       <= tp.instr_bltu                                                                                                ; 
            jump_sel.bge        <= tp.instr_bge                                                                                                 ; 
            jump_sel.bgeu       <= tp.instr_bgeu                                                                                                ; 
            jump_sel.j          <= tp.instr_jalr || tp.instr_jal                                                                                ; 
            J_pred_id           <= J_pred_if                                                                                                    ;
            mem_sel_id.lb       <= tp.instr_lb                                                                                                  ; 
            mem_sel_id.lh       <= tp.instr_lh                                                                                                  ;
            mem_sel_id.lw       <= tp.instr_lw                                                                                                  ;
            mem_sel_id.lbu      <= tp.instr_lbu                                                                                                 ;
            mem_sel_id.lhu      <= tp.instr_lhu                                                                                                 ;
            mem_sel_id.lwu      <= tp.instr_lwu                                                                                                 ;
            mem_sel_id.ld       <= tp.instr_ld                                                                                                  ; 
            mem_sel_id.sd       <= tp.instr_sd                                                                                                  ; 
            mem_sel_id.sb       <= tp.instr_sb                                                                                                  ;
            mem_sel_id.sh       <= tp.instr_sh                                                                                                  ;
            mem_sel_id.sw       <= tp.instr_sw                                                                                                  ;
            load_id             <= tp.instr_lb || tp.instr_lh || tp.instr_lw || tp.instr_lbu || tp.instr_lhu || tp.instr_lwu || tp.instr_ld     ;
            nstore_id           <= !(tp.instr_sd || tp.instr_sb || tp.instr_sh || tp.instr_sw)                                                  ;
            Wenreg_id           <= !I_type.B && !I_type.S && |xaddr.rd                                                                          ; 
            rs1_pass            <= rs1_instr && (xaddr.rs1 == xaddr_id.rd && I_vld_id && !load_id && Wenreg_id)                                 ;           
            rs2_pass            <= rs2_instr && (xaddr.rs2 == xaddr_id.rd && I_vld_id && !load_id && Wenreg_id)                                 ;
            csr_rs_id           <= instr[14] ? {59'd0, instr[19:15]} : rs1                                                                      ;
            csr_op              <= (I_type.C && |instr[13:12]) ?  instr[13:12] : 2'b0                                                           ;
            csr_sel_id.mcycle   <= csr_addr == 12'hb00 && I_type.C                                                                              ;
            csr_sel_id.mtvec    <= csr_addr == 12'h305 && I_type.C                                                                              ;
            csr_sel_id.mcause   <= csr_addr == 12'h342 && I_type.C                                                                              ;
            csr_sel_id.mepc     <= csr_addr == 12'h341 && I_type.C                                                                              ;
            csr_sel_id.mstatus  <= csr_addr == 12'h300 && I_type.C                                                                              ;
            csr_sel_id.mip      <= csr_addr == 12'h344 && I_type.C                                                                              ;
            csr_sel_id.mie      <= csr_addr == 12'h304 && I_type.C                                                                              ;
            csr_sel_id.mhartid  <= csr_addr == 12'hf14 && I_type.C                                                                              ;
            csr_sel_id.mscratch <= csr_addr == 12'h340 && I_type.C                                                                              ;
            exception_id        <= tp.instr_ecall                                                                                               ;
            ret_id              <= tp.instr_mret                                                                                                ;
        end                     
    end
    always_comb begin
        if(rs1_pass && !jump_sel.j)
            alu_in1 = alu_out;
        else 
            alu_in1 = alu_id1;
    end
    always_comb begin
        if(rs1_pass && jump_sel.j)
            pc_add = alu_out;
        else 
            pc_add = pc_add_id;
    end
    always_comb begin
        if(rs1_pass && |csr_op)
            csr_rs = alu_out;
        else 
            csr_rs = csr_rs_id;
    end
    always_comb begin
        if(rs2_pass && nstore_id)
            alu_in2 = alu_out;
        else 
            alu_in2 = alu_id2;
    end
    always_comb begin
        if(rs2_pass)
            mem_wdata = alu_out;
        else 
            mem_wdata = mem_wdata_id;
    end
    always_ff@(posedge clk)begin
        if(reset)
            alu_sel_id <= sel_add   ;
        else
        if(instr_launch)
            unique case(1'b1)
                tp.instr_addw || tp.instr_addiw:    
                    alu_sel_id <= sel_addw  ;
                tp.instr_sub:     
                    alu_sel_id <= sel_sub   ;
                tp.instr_subw:
                    alu_sel_id <= sel_subw  ;
                tp.instr_sll || tp.instr_slli:    
                    alu_sel_id <= sel_sll   ;
                tp.instr_sllw || tp.instr_slliw:    
                    alu_sel_id <= sel_sllw  ;
                tp.instr_srl || tp.instr_srli:    
                    alu_sel_id <= sel_srl   ;
                tp.instr_srlw || tp.instr_srliw:      
                    alu_sel_id <= sel_srlw  ;
                tp.instr_sra || tp.instr_srai:    
                    alu_sel_id <= sel_sra   ;
                tp.instr_sraw || tp.instr_sraiw:    
                    alu_sel_id <= sel_sraw  ;
                tp.instr_slt || tp.instr_slti:    
                    alu_sel_id <= sel_slt   ;
                tp.instr_sltu || tp.instr_sltiu:     
                    alu_sel_id <= sel_sltu  ;
                tp.instr_xor || tp.instr_xori:    
                    alu_sel_id <= sel_xor   ;
                tp.instr_or || tp.instr_ori:      
                    alu_sel_id <= sel_or    ;
                tp.instr_and || tp.instr_andi:    
                    alu_sel_id <= sel_and   ;
                I_type.U || I_type.C:
                    alu_sel_id <= sel_none  ;
                default:
                    alu_sel_id <= sel_add   ;
            endcase
    end
    always_ff@(posedge clk)begin  //get csr
        if(reset)
            csr_id <= 'd0        ;
        else
        if(instr_launch)
            unique case(csr_addr)
                12'hb00:csr_id <= csr.mcycle        ;
                12'h305:csr_id <= csr.mtvec         ;
                12'h342:csr_id <= csr.mcause        ;
                12'h341:csr_id <= csr.mepc          ;
                12'h300:csr_id <= csr.mstatus       ;
                12'h344:csr_id <= csr.mip           ;
                12'h304:csr_id <= csr.mie           ;
                12'hf14:csr_id <= csr.mhartid       ;
                12'h340:csr_id <= csr.mscratch      ;
                default:csr_id <= csr.mcycle        ;
            endcase
    end
	//----------------------------
	//EX STAGE
	//----------------------------
    always_ff@(posedge clk)begin
        if(reset)
            I_vld_ex <= 1'b0;
        else
        if(I_vld_id && !stall && !J_flush)
            I_vld_ex <= 1'b1;
        else 
        if(!stall)
            I_vld_ex <= 1'b0;
    end 
    always_ff@(posedge clk)begin
        if(reset)
            branch_ex <= 1'b0;
        else
        if(I_vld_id && !stall && !J_flush)
            branch_ex <= |jump_sel[5:0];
        else 
            branch_ex <= 1'b0;
    end 
    always_ff@(posedge clk)begin
        if(reset)begin
            instr_ex        <= 'b0;
            pc_ex           <= 'b0;
            rd_addr_ex      <= 5'd0;
            mem_sel_ex      <= 'd0;
            load_ex         <= 'd0;
            Wenreg_ex       <= 1'b0;
            csr_sel_ex      <= 'd0;
            alu_sel_ex      <= sel_add;
            exception_ex    <= 1'b0;
            interrupt_ex    <= 'd0;
            ret_ex          <= 1'b0;
        end 
        else
        if(I_vld_id && !stall)begin
            instr_ex        <= instr_id;
            pc_ex           <= pc_id;
            rd_addr_ex      <= xaddr_id.rd;
            mem_sel_ex      <= |interrupt_id ? 0 : mem_sel_id;
            load_ex         <= |interrupt_id ? 0 : load_id;
            Wenreg_ex       <= Wenreg_id;
            csr_sel_ex      <= csr_sel_id;
            alu_sel_ex      <= alu_sel_id;
            exception_ex    <= exception_id;
            interrupt_ex    <= interrupt_id;
            ret_ex          <= ret_id;
        end
    end 
    always_comb begin
        unique case(1'b1)
            jump_sel.j:
                J_comb = 1;
            jump_sel.beq:
                J_comb = !(|alu_xor);
            jump_sel.bne:
                J_comb = |alu_xor;
            jump_sel.blt:
                J_comb = alu_slt[0];
            jump_sel.bltu:
                J_comb = alu_sltu[0];
            jump_sel.bge:
                J_comb = !alu_slt[0];
            jump_sel.bgeu:
                J_comb = !alu_sltu[0];
            default:
                J_comb = 1'b0;
        endcase                              
    end
    always_ff@(posedge clk)begin
        if(reset)begin
            J_vld       <= 1'b0;
            J_flush     <= 1'b0;          
        end
        else
        if(I_vld_id && !stall && !J_flush)begin
            J_vld      <= J_comb || ret_id || |exception_id || |interrupt_id;
            J_flush    <= (J_comb != J_pred_id) || ret_id || |exception_id || |interrupt_id ;        
        end
        else
        if(IB_rdy)begin
            J_vld       <= 1'b0;
            J_flush     <= 1'b0;         
        end
    end

    always_ff@(posedge clk)begin
        if(reset)
            bp_2bit <= staken;
        else
        if(branch_ex)
            unique case (bp_2bit)
                sntaken:
                    if(J_vld)
                        bp_2bit <= ntaken;
                ntaken :
                    if(J_vld)
                        bp_2bit <= taken;
                    else   
                        bp_2bit <= sntaken;
                taken  :
                    if(J_vld)
                        bp_2bit <= staken;
                    else   
                        bp_2bit <= ntaken;
                staken :
                    if(!J_vld)
                        bp_2bit <= taken;
            endcase
    end
    always_ff@(posedge clk)begin   // jump addr
        if(reset)
            pc_jump <= 0;
        else
        if(I_vld_id && !stall && !J_flush)
            if(|exception_id || |interrupt_id)
                pc_jump <= csr.mtvec;
            else
            if(ret_id)
                pc_jump <= csr.mepc;
            else
                pc_jump <= pc_add + imm_pc;
    end
    always_ff@(posedge clk)begin   // seq addr
        if(reset)
            pc_seq <= 0;
        else
        if(I_vld_id && !stall && !J_flush)
            pc_seq <= pc_id + 4;
    end
    always_comb begin
            alu_add   = alu_in1 + alu_in2                         ;
            alu_addw  = $signed(alu_add[31:0])                    ;
            alu_sub   = alu_in1 - alu_in2                         ;
            alu_subw  = $signed(alu_sub[31:0])                    ;
            alu_sll   = alu_in1 << alu_in2[5:0]                   ;
            alu_sllw  = $signed(sllw_comb)                        ;//截为32位后符号拓展
            alu_slt   = $signed(alu_in1) < $signed(alu_in2)       ;
            alu_sltu  = alu_in1 < alu_in2                         ;
            alu_xor   = alu_in1 ^ alu_in2                         ;
            alu_srl   = alu_in1 >> alu_in2[5:0]                   ;
            alu_srlw  = $signed(alu_in1[31:0] >> alu_in2[4:0])    ;
            alu_sra   = $signed(alu_in1) >>> alu_in2[5:0]         ;
            alu_sraw  = $signed(alu_in1[31:0]) >>> alu_in2[4:0]   ;
            alu_or    = alu_in1 | alu_in2                         ;
            alu_and   = alu_in1 & alu_in2                         ;    
            alu_none  = |csr_sel_id ? csr_id : alu_in2            ;
    end 
    always_ff@(posedge clk)begin
        if(I_vld_id && !stall)
            unique case(alu_sel_id)
                sel_add:    alu_out <= alu_add       ;
                sel_addw:   alu_out <= alu_addw      ;
                sel_sub:    alu_out <= alu_sub       ;
                sel_subw:   alu_out <= alu_subw      ;
                sel_sll:    alu_out <= alu_sll       ;
                sel_sllw:   alu_out <= alu_sllw      ;
                sel_slt:    alu_out <= alu_slt       ;
                sel_sltu:   alu_out <= alu_sltu      ;
                sel_xor:    alu_out <= alu_xor       ;
                sel_srl:    alu_out <= alu_srl       ;
                sel_srlw:   alu_out <= alu_srlw      ;
                sel_sra:    alu_out <= alu_sra       ;
                sel_sraw:   alu_out <= alu_sraw      ;
                sel_or:     alu_out <= alu_or        ;
                sel_and:    alu_out <= alu_and       ;
                sel_none:   alu_out <= alu_none      ;
            endcase
    end 

    always_ff@(posedge clk)begin
        if(reset)
            csr_ex <= 0;
        else
        if(I_vld_id && !stall)begin
            if(csr_op == 2'b10)
                csr_ex <= csr_rs | csr_id;
            else
            if(csr_op == 2'b11)
                csr_ex <= (~csr_rs) & csr_id;
            else
                csr_ex <= csr_rs;
        end
    end
   always_ff@(posedge clk)begin
        if(reset)
            DB_vld <= 'd0;
        else 
        if(I_vld_id && |mem_sel_id && !stall && !J_flush && interrupt_id==0)
            DB_vld <= 1'b1;
        else
        if(DB_rdy || !D_pvld)
            DB_vld <= 1'b0;
    end
    always_ff@(posedge clk)begin
        if(reset)
            D_pvld <= 1'b0;
        else
        if(DB_rdy || !D_pvld)
            D_pvld <= DB_vld;
    end
    always_ff@(posedge clk)begin
        if(reset)
            DB_size <= 3;
        else
        if(I_vld_id && !stall)begin
            unique case(1'b1)
                mem_sel_id.sb || mem_sel_id.lb || mem_sel_id.lbu:
                    DB_size <= 0;
                mem_sel_id.sh || mem_sel_id.lh || mem_sel_id.lhu:
                    DB_size <= 1;
                mem_sel_id.sw || mem_sel_id.lw || mem_sel_id.lwu:
                    DB_size <= 2;
                default:
                    DB_size <= 3;
            endcase
        end
    end
    always_ff@(posedge clk)begin
        if(reset)
            DB_wr <= 1'b0;
        else
        if(I_vld_id && !stall)
            DB_wr <= !load_id;
    end
    always_ff@(posedge clk)begin
        if(reset)
            DB_wdata <= 'd0;
        else
        if(I_vld_id && !stall)begin
            unique case(1'b1)
                mem_sel_id.sb:
                    DB_wdata <= {8{mem_wdata[7:0]}};
                mem_sel_id.sh:
                    DB_wdata <= {4{mem_wdata[15:0]}};
                mem_sel_id.sw:
                    DB_wdata <= {2{mem_wdata[31:0]}};
                default:
                    DB_wdata <= mem_wdata;
            endcase
        end
    end
	//----------------------------
	//MEM STAGE
	//----------------------------
    always_ff@(posedge clk)begin
        if(reset)
            I_vld_mem <= 1'b0;
        else
        if(ex_hs)
            I_vld_mem <= 1'b1;
        else 
        if(!stall)
            I_vld_mem <= 1'b0;
    end 
    always_ff@(posedge clk)begin
        if(reset)begin
            mem_bypass <= 1'b0;
            instr_mem <= 'd0;
            pc_mem <= 'd0;
            rd_addr_mem <= 5'd0;
            rd_mem <= 'd0;
            mem_sel_mem <= 'd0;
            Wenreg_mem <= 1'b0;
            mem_addr <= 'd0;
            exception_mem <= 'd0;
            interrupt_mem <= 'd0;
            ret_mem <= 'd0;
            csr_reg_mem <= 'd0;
            load_mem <= 'd0;
        end
        else
        if(ex_hs)begin
            mem_bypass <= mem_sel_ex == 0;
            instr_mem <= instr_ex;
            pc_mem <= pc_ex;
            rd_addr_mem <= rd_addr_ex;
            csr_reg_mem <= csr;
            rd_mem <= alu_out;
            mem_sel_mem <= mem_sel_ex;
            Wenreg_mem <= Wenreg_ex;  
            mem_addr <= alu_out;
            exception_mem <= exception_ex;
            interrupt_mem <= interrupt_ex;
            ret_mem <= ret_ex;
            load_mem <= load_ex;
        end
    end
	//----------------------------
	//WB STAGE
	//----------------------------
    // always_ff@(posedge clk)begin
    //     if(reset)
    //         I_vld_wb <= 'd0;
    //     else 
    //         I_vld_wb <= mem_hs && interrupt_mem==0;
    // end
    always_ff@(posedge clk)begin
        if(reset)
            Wenreg_wb <= '0;
        else
            Wenreg_wb <= Wenreg_mem && mem_hs && interrupt_mem==0;
    end 
    always_comb begin
        unique case(1'b1)
            mem_sel_mem.lb:
                mem_rdata = $signed(DB_rdata[mem_addr[2:0]*8+:8]);  
            mem_sel_mem.lh: 
                mem_rdata = $signed(DB_rdata[mem_addr[2:1]*16+:16]);  
            mem_sel_mem.lw: 
                mem_rdata = $signed(DB_rdata[mem_addr[2]*32+:32]);  
            mem_sel_mem.lbu:
                mem_rdata = DB_rdata[mem_addr[2:0]*8+:8];  
            mem_sel_mem.lhu:
                mem_rdata = DB_rdata[mem_addr[2:1]*16+:16];  
            mem_sel_mem.lwu:       
                mem_rdata = DB_rdata[mem_addr[2]*32+:32];  
            default:
                mem_rdata = DB_rdata;
        endcase
    end
    always_ff@(posedge clk)begin
        if(reset)begin 
            instr_wb <= 'd0;
            pc_wb <= 'd0;
            rd_addr_wb <= 5'd0;
            csr_reg_wb <= 'd0;   
            rd_wb <= 'd0; 
        end
        else 
        if(mem_hs)begin
            instr_wb <= instr_mem;
            pc_wb <= pc_mem;
            rd_addr_wb <= rd_addr_mem;
            csr_reg_wb <= csr_reg_mem;
            rd_wb <= |mem_sel_mem ? mem_rdata : rd_mem;
        end
    end
    // always_ff@(posedge clk)begin
    //     if(reset)begin 
    //         exception_wb <= 'd0;
    //         interrupt_wb <= 'd0;
    //         ret_wb       <= 'd0;      
    //     end
    //     else 
    //     if(mem_hs)begin
    //         exception_wb <= exception_mem;
    //         interrupt_wb <= interrupt_mem;
    //         ret_wb       <= ret_mem; 
    //     end
    //     else begin
    //         exception_wb <= 'd0;
    //         interrupt_wb <= 'd0;
    //         ret_wb       <= 'd0;      
    //     end
    // end
    always_ff@(posedge clk)begin
        if(reset)
            for(int i=1;i<32;i++)
                x[i] <= 0;
        else
        if(Wenreg_wb)
            x[rd_addr_wb] <= rd_wb;
    end  
	//----------------------------
	//CSR   
	//----------------------------
    always_ff@(posedge clk)begin
        if(reset)
            csr.mcycle <= 'd0;
        else
        if(csr_sel_ex.mcycle && ex_hs)
            csr.mcycle <= csr_ex;
        else
            csr.mcycle <= csr.mcycle + 1'b1;
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mtvec <='d0;
        else
        if(csr_sel_ex.mtvec && ex_hs)
            csr.mtvec <= csr_ex;
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mcause <= 'd0;
        else  
        if(interrupt_ex.external && ex_hs)
            csr.mcause <= {1'b1, 63'd11};
        else  
        if(interrupt_ex.timer && ex_hs)
            csr.mcause <= {1'b1, 63'd7};
        else  
        if(interrupt_ex.software && ex_hs)
            csr.mcause <= {1'b1, 63'd3};
        else
        if(csr_sel_ex.mcause && ex_hs)
            csr.mcause <= csr_ex;
        else
        if(|exception_ex && ex_hs)
            csr.mcause <= {1'b0, 63'd11};
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mepc <= 'd0;
        else
        if((|exception_ex || |interrupt_ex) && ex_hs)
            csr.mepc <= pc_ex;
        else
        if(csr_sel_ex.mepc && ex_hs)
            csr.mepc <= csr_ex;
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mstatus <= 64'h1888;
        else
        if((|exception_ex || |interrupt_ex) && ex_hs)
            {csr.mstatus[12:11], csr.mstatus[7], csr.mstatus[3]} <= {2'b11, csr.mstatus[3], 1'b0}; 
        else  
        if(csr_sel_ex.mstatus && ex_hs)begin
            csr.mstatus[62:0] <= csr_ex[62:0];
            csr.mstatus[63] <= csr_ex[14:13] == 2'b11 || csr_ex[16:15] == 2'b11;
        end
        else
        if(ret_ex && ex_hs)
            {csr.mstatus[12:11], csr.mstatus[7], csr.mstatus[3]} <= {2'b00, 1'b1, csr.mstatus[7]};
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mie <= 64'h0000;// 64'h0888;
        else
        if(csr_sel_ex.mie && ex_hs)
            csr.mie <= csr_ex;
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mip <= 64'h0000;
        else
        if(csr_sel_ex.mip && ex_hs)
            csr.mip <= csr_ex;
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mhartid <= 64'h0000;
    end
    always_ff@(posedge clk)begin
        if(reset)
            csr.mscratch <= 64'd0;
        else
        if(csr_sel_ex.mscratch && ex_hs)
            csr.mscratch <= csr_ex;
    end
    // always_ff@(posedge clk)begin
    //     if(instr_wb == 32'h7b && I_vld_wb)
    //         $write("%c",x[10][7:0]);
    // end  
endmodule

module ysyx_210417_AXI #(
    parameter                           AXI_ID_WIDTH      = 4      
)(
    input                               logic		    			clk,
    input                               logic		    			reset,
	// Native memory interface
    input                               logic                       IB_vld,
    output                              logic                       IB_rdy,
    input                               logic64_t                   IB_addr,
    output                              logic32_t                   IB_data,

    input                               logic64_t                   DB_wdata,
    input                               logic [2:0]                 DB_size,
    output                              logic64_t                   DB_rdata,
    input                               logic                       DB_vld,
    input                               logic                       DB_wr,
    output                              logic                       DB_rdy,
    input                               logic64_t                   DB_addr,
    // axi
    output                              logic                       axi_awvalid,
    input                               logic                       axi_awready,
    output                              logic32_t                   axi_awaddr,

    output                              logic[AXI_ID_WIDTH-1:0]     axi_awid,
    output                              logic[7:0]                  axi_awlen,
    output                              logic[2:0]                  axi_awsize,
    output                              logic[1:0]                  axi_awburst,

    output                              logic                       axi_wvalid,
    input                               logic                       axi_wready,
    output                              logic64_t                   axi_wdata,
    output                              logic8_t                    axi_wstrb,

    output                              logic                       axi_wlast,

    input                               logic                       axi_bvalid,
    output                              logic                       axi_bready,

    input                               logic[1:0]                  axi_bresp,
    input                               logic[AXI_ID_WIDTH-1:0]     axi_bid,

    output                              logic                       axi_arvalid,
    input                               logic                       axi_arready,
    output                              logic32_t                   axi_araddr,

    output                              logic[AXI_ID_WIDTH-1:0]     axi_arid,
    output                              logic[7:0]                  axi_arlen,
    output                              logic[2:0]                  axi_arsize,
    output                              logic[1:0]                  axi_arburst,

    input                               logic                       axi_rvalid,
    output                              logic                       axi_rready,
    input                               logic64_t                   axi_rdata,

    input                               logic[1:0]                  axi_rresp,
    input                               logic                       axi_rlast,
    input                               logic[AXI_ID_WIDTH-1:0]     axi_rid,

    input                               logic                       io_interrupt,
    output  							logic 						interrupt_soft,       
    output  							logic 						interrupt_timer,       
    output  							logic 						interrupt_ext        
);

	logic  						wr_transfer									;
	logic  						D_transfer  								;
	logic  						I_transfer  								;
	logic 						handshake_w									;								
	logic 						handshake_aw								;								
	logic 						handshake_b									;								
	logic 						handshake_ar								;								
	logic 						handshake_r									;		
	logic 						wr_burst_end								;
	logic 						rd_burst_end								;
	logic 						add_wr_index								;
	logic 						end_wr_index								;
	logic 						last_wr_index								;
	logic 						add_rd_index								;
	logic 						end_rd_index								;
	logic 	[8:0]				wr_burst_len    							;
	logic 	[8:0]				rd_burst_len    							;
	logic 	[8:0]				cnt_wr_index								;
	logic 	[8:0]				cnt_rd_index								;

    logic                       D_pvld          							;
    logic                       I_pvld          							;
	logic64_t					I_paddr 									;
	logic64_t					D_paddr 									;
	logic  [2:0]	    		D_psize 									;
    logic8_t                    D_pwstrb                                    ;
    logic                       D_pwr                                       ;
	logic64_t					D_pwdata 									;
    logic                       D_stall          							;
    logic                       I_stall          							;
    logic                       pliclint_req                    			;
    logic                       axi_DBwr_req                  				;
    logic                       axi_DBrd_req                  				;
    logic                       axi_IBrd_req                  				;
    logic                       pliclint_rdy                    			;
    logic64_t                   pliclint_rdata                 				;
	logic  						wr_burst_enable								;
	logic  						rd_burst_enable								;

	assign axi_awid					=	0																	;
	assign axi_awlen				=	0																	;
	assign axi_awburst				=	1												                    ;
	assign axi_arid					=	0																	;
	assign axi_arlen				=	0																	;
	assign axi_arburst				=	1												                    ;
	assign axi_bready				=	1																	;

	assign handshake_w				=	axi_wvalid && axi_wready											;
	assign handshake_aw				=	axi_awvalid && axi_awready											;
	assign handshake_b				=	axi_bready && axi_bvalid											;
	assign handshake_ar				=	axi_arvalid && axi_arready											;
	assign handshake_r				=	axi_rready && axi_rvalid  											;
	assign wr_burst_end				=	handshake_w && axi_wlast											;
	assign rd_burst_end				=	handshake_r && axi_rlast											;	
	assign D_stall  				=	D_pvld && !DB_rdy													;
	assign I_stall  				=	I_pvld && !IB_rdy													;
	assign DB_rdy					=	D_transfer && (handshake_b || (rd_burst_end && !D_pwr)  || pliclint_rdy) 		;
	assign DB_rdata  				=	|D_paddr[63:26] ? axi_rdata : pliclint_rdata					    ;		
	//data channel
    assign pliclint_req 			= 	D_pvld && D_paddr[63:26]==0 && !D_transfer     						;
    assign axi_DBwr_req 			= 	D_pvld && |D_paddr[63:26] && D_pwr && !D_transfer     			    ;
    assign axi_DBrd_req 			= 	D_pvld && |D_paddr[63:26] && !D_pwr && !D_transfer && !I_transfer   ;
    assign axi_IBrd_req 			= 	I_pvld && !D_transfer && !I_transfer && !axi_DBrd_req  			    ;

    assign wr_burst_len             =   1                                                                   ;
    assign rd_burst_len             =   1                                                                   ;
	//--------------------
	//Affairs Control
	//--------------------		
    always_ff@(posedge clk)begin
        if(reset)begin
            D_pvld 	<= 1'b0;
			D_paddr <= 'd0;
			D_psize <= 'd0;
			D_pwdata <= 'd0;
            D_pwr <= 'd0;
		end
        else
        if(DB_rdy || !D_pvld)begin
            D_pvld <= DB_vld;
			D_paddr <= DB_addr;
			D_psize <= DB_size;
			D_pwdata <= DB_wdata;
            D_pwr <= DB_wr;
		end
    end
    always_ff@(posedge clk)begin
        if(reset)begin
            I_pvld <= 1'b0;
            I_paddr <= 'd0;
		end
        else
        if(IB_rdy || !I_pvld)begin
            I_pvld <= IB_vld;
            I_paddr <= IB_addr;
		end
    end
    always_ff@(posedge clk)begin
        if(reset)                                                        
	        D_transfer <= 1'b0;                                                                                                       
	    else 
		if (axi_DBrd_req || axi_DBwr_req || pliclint_req)                 
	        D_transfer <= 1'b1;                                           
	    else 
		if (DB_rdy)                             
	        D_transfer <= 1'b0;                                                                             
	end   
    always_ff@(posedge clk)begin
        if(reset)                                                         
	        I_transfer <= 1'b0;                                                                                                       
	    else 
		if (axi_IBrd_req)            
	        I_transfer <= 1'b1;                                           
	    else 
		if (IB_rdy)                             
	        I_transfer <= 1'b0;                                                                             
	end 
    always_ff@(posedge clk)begin
        if(reset)                                                            
	        IB_rdy <= 1'b0;                                                                                                       
	    else        
	        IB_rdy <= I_transfer && rd_burst_end;                                                                                                                      
	end 
    always_ff@(posedge clk)begin
        if(reset)                                                            
	        IB_data <= 'd0;                                                                                                       
	    else        
			IB_data <= I_paddr[2] ? axi_rdata[63:32] : axi_rdata[31:0];                                                                                                              
	end 
	//--------------------
	//Write Address Channel
	//--------------------				
    always_ff@(posedge clk)begin
        if(reset)                                                            
	        axi_awvalid <= 1'b0;                                                                                                       
	    else 
		if (~axi_awvalid && axi_DBwr_req)                 
	        axi_awvalid <= 1'b1;                                           
	    else 
		if (axi_awready && axi_awvalid)                             
	        axi_awvalid <= 1'b0;                                                                             
	end   

    always_ff@(posedge clk)begin
        if(reset)                                                           
	        axi_awaddr <= 'b0;                                             
	    else 
		if (~axi_awvalid && axi_DBwr_req)                    
	        axi_awaddr <= D_paddr[31:0];                                        
	end    
    always_ff@(posedge clk)begin
        if(reset)                                                           
	        axi_awsize <= 'b0;                                             
	    else 
		if (~axi_awvalid && axi_DBwr_req)                    
	        axi_awsize <= D_psize;                                        
	end   
	//--------------------
	//Write Data Channel
	//--------------------
    always_ff@(posedge clk)begin
        if(reset)                                                                            
	        axi_wvalid <= 1'b0;                                                         
	    else 
		if (~axi_wvalid && axi_DBwr_req)                               
	        axi_wvalid <= 1'b1;                                                                                        
	    else 
		if (wr_burst_end)                                                    
	      	axi_wvalid <= 1'b0;                                                                                                             
	end    
    always_ff@(posedge clk)begin
        if(reset)                                                            
	      	axi_wdata <= 'd0;                                                                                                                     
	    else 	
		if (axi_DBwr_req)                                                                 
	      	axi_wdata <= D_pwdata;                                                                                  
	end   
    always_ff@(posedge clk)begin
        if(reset)                                                         
	      	axi_wstrb <= 'd0;                                                                                                                     
	    else 	
		if (axi_DBwr_req)                                                                 
            axi_wstrb <= D_pwstrb;                                                                 
	end  
    always_comb begin
        if(!D_pwr)
            D_pwstrb = 0;
        else
            case(D_psize)
                3'd0:
                    D_pwstrb = 8'b1 << D_paddr[2:0];
                3'd1:
                    case(D_paddr[2:1])
                        2'b00:D_pwstrb = 8'b00000011;
                        2'b01:D_pwstrb = 8'b00001100;  
                        2'b10:D_pwstrb = 8'b00110000;  
                        2'b11:D_pwstrb = 8'b11000000;
                    endcase
                3'd2:
                    D_pwstrb = D_paddr[2] ? 8'hf0 : 8'h0f;
                default:
                    D_pwstrb = 8'hff;
            endcase   
    end
    always_ff@(posedge clk)begin
        if(reset)                                                                              
	        axi_wlast <= 1'b0;                                                          
	    else 
		if (last_wr_index || wr_burst_len == 1)                                                                   
	        axi_wlast <= 1'b1;                                                                                                                                                                
	    else 
		if (wr_burst_end)                                                                 
	      	axi_wlast <= 1'b0;                                                                                                                 
	end   
    always_ff@(posedge clk)begin
        if(reset)   
			cnt_wr_index <= 'd0;
		else
		if(end_wr_index)
			cnt_wr_index <= 'd0;
		else
		if(add_wr_index)
			cnt_wr_index <= cnt_wr_index + 1'b1;
	end
	assign	add_wr_index	=	handshake_w												;
	assign	end_wr_index	=	add_wr_index && cnt_wr_index == wr_burst_len	- 1 	;
	assign  last_wr_index	=	add_wr_index && cnt_wr_index == wr_burst_len	- 2 	;	
	//----------------------------
	//Read Address Channel
	//----------------------------
    always_ff@(posedge clk)begin
        if(reset)                                                                                                                   
	        axi_arvalid <= 1'b0;                                                                                                 
	    else 
		if (~axi_arvalid && (axi_DBrd_req || axi_IBrd_req))                
	        axi_arvalid <= 1'b1;                                         
	    else 
		if (axi_arready && axi_arvalid)                           
	        axi_arvalid <= 1'b0;                                                                           
	end   
    always_ff@(posedge clk)begin
        if(reset)                                                                                                                        
	    	axi_araddr <= 'b0;                                           
	    else 
		if (~axi_arvalid && axi_DBrd_req)                          
	        axi_araddr <= D_paddr[31:0];   
	    else 
		if (~axi_arvalid && axi_IBrd_req)                          
	        axi_araddr <= I_paddr[31:0];                                          
	end     
    always_ff@(posedge clk)begin
        if(reset)                                                                                                                        
	    	axi_arsize <= 'b0;                                           
	    else 
		if (~axi_arvalid && axi_DBrd_req)                          
	        axi_arsize <= D_psize;   
	    else 
		if (~axi_arvalid && axi_IBrd_req)                          
	        axi_arsize <= 2;                                          
	end     
	//--------------------------------
	//Read Data (and Response) Channel
	//--------------------------------

    // always_ff@(posedge clk)begin
    //     if(reset)    
	// 		cnt_rd_index <= 'd0;
	// 	else
	// 	if(end_rd_index)
	// 		cnt_rd_index <= 'd0;
	// 	else
	// 	if(add_rd_index)
	// 		cnt_rd_index <= cnt_rd_index + 1'b1;
	// end
	// assign	add_rd_index	=	handshake_r												;
	// assign	end_rd_index	=	add_rd_index && cnt_rd_index >= rd_burst_len	- 1 	;
    always_ff@(posedge clk)begin
        if(reset)                                                              
	        axi_rready <= 1'b0;                                                                  
	    else 
		if (axi_rvalid && axi_rlast && axi_rready)     
			axi_rready <= 1'b0;                                 
	    else
		if(axi_rvalid)                                    
	        axi_rready <= 1'b1;                                                       
	end  

    ysyx_210417_pliclint interrupt_inst(   //0x0200_0000~0x0200_ffff 
    .clk                               (clk                       ),
    .reset                             (reset                     ),
    .wdata                             (D_pwdata                  ),
    .wstrb                             (D_pwstrb                  ),
    .vld                               (pliclint_req              ),
    .addr                              (D_paddr                   ),
    .rdata                             (pliclint_rdata            ),
    .rdy                               (pliclint_rdy              ),
    .io_interrupt                      (io_interrupt              ),
    .interrupt_soft                    (interrupt_soft            ),
    .interrupt_timer                   (interrupt_timer           ),
    .interrupt_ext                     (interrupt_ext             ) 
    );
endmodule

module ysyx_210417_pliclint(
        input	logic		    			clk			    ,
        input	logic		    			reset		    ,

	    input   logic64_t                   wdata           ,
	    input   logic8_t                    wstrb           ,
	    input   logic                       vld             ,
	    input   logic64_t                   addr            ,
	    output  logic64_t                   rdata           ,
	    output  logic                       rdy             ,
        input   logic                       io_interrupt    ,
        output  logic 						interrupt_soft  ,       
        output  logic 						interrupt_timer ,       
        output  logic 						interrupt_ext          
    );
	localparam msip_addr	  = 64'h2000000;
	localparam mtime_addr 	  = 64'h200bff8;
	localparam mtimecmp_addr  = 64'h2004000;
	logic32_t						msip			;
	logic64_t						mtime			;
	logic64_t						mtimecmp		;
    logic      [1:0]                interrupt_as2s  ;
    assign interrupt_ext    =   interrupt_as2s[1];
    always_ff@(posedge clk)begin
        if(reset)
			interrupt_as2s <= 'd0;
		else begin
            interrupt_as2s[0] <= io_interrupt;
            interrupt_as2s[1] <= interrupt_as2s[0];
        end
	end
    always_ff@(posedge clk)begin
        if(reset)
			rdy <= 1'b0;
		else
			rdy <= vld;
	end
    always_ff@(posedge clk)begin
        if(reset)
			mtime <= 'd0;
		else
		if(vld && addr == mtime_addr && |wstrb)begin
    		for(int i = 0; i<8;i++)
    		  if (wstrb[i])
    		    mtime[i*8+:8] <= wdata[i*8+:8]; 
		end
		else
			mtime <= mtime + 1'b1;
	end
    always_ff@(posedge clk)begin
        if(reset)
			msip <= 'd0;
		else
		if(vld && addr == msip_addr)begin
    		for(int i = 0; i<4;i++)
    		  if (wstrb[i])
    		    msip[i*8+:8] <= wdata[i*8+:8]; 
		end
	end
    always_ff@(posedge clk)begin
        if(reset)
			mtimecmp <= 5;
		else
		if(vld && addr == mtimecmp_addr)begin
    		for(int i = 0; i<8;i++)
    		  if (wstrb[i])
    		    mtimecmp[i*8+:8] <= wdata[i*8+:8]; 
		end
	end
    always_ff@(posedge clk)begin
        if(reset)begin
			interrupt_soft  <= 1'b0;
			interrupt_timer <= 1'b0;
		end
		else begin
			interrupt_soft  <= msip[0];
			interrupt_timer <= mtime >= mtimecmp;
		end
	end
    always_ff@(posedge clk)begin
        if(reset)
			rdata <= 'd0;
		else
		if(vld && wstrb == 0)begin
    		unique case (addr)
				msip_addr: 		rdata 	<= {32'd0, msip};
				mtime_addr:		rdata 	<= mtime;
				mtimecmp_addr:	rdata   <= mtimecmp;
				default:rdata			<= 'd0;
			endcase
		end
	end
endmodule