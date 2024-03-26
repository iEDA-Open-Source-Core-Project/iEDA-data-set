`timescale 1ns/1ps

//CLINT
`define YSYX_210428_MTIME_ADDR    64'h00000000_0200bff8
`define YSYX_210428_MTIMECMP_ADDR 64'h00000000_02004000

//no_use
`define YSYX_210428_NO_USE 64'd0

//command
`define YSYX_210428_MRET           8'hfd
`define YSYX_210428_NO_INSTRUCTION 8'd0 

`define YSYX_210428_LUI            8'd1 
`define YSYX_210428_AUIPC          8'd2 
`define YSYX_210428_JAL            8'd3 
`define YSYX_210428_JALR           8'd4 
`define YSYX_210428_BEQ            8'd5 
`define YSYX_210428_BNE            8'd6 
`define YSYX_210428_BLT            8'd7 
`define YSYX_210428_BGE            8'd8 
`define YSYX_210428_BLTU           8'd9 
`define YSYX_210428_BGEU           8'd10
`define YSYX_210428_LB             8'd11
`define YSYX_210428_LH             8'd12
`define YSYX_210428_LW             8'd13
`define YSYX_210428_LBU            8'd14
`define YSYX_210428_LHU            8'd15
`define YSYX_210428_SB             8'd16
`define YSYX_210428_SH             8'd17
`define YSYX_210428_SW             8'd18
`define YSYX_210428_ADDI           8'd19
`define YSYX_210428_SLTI           8'd20
`define YSYX_210428_SLTIU          8'd21
`define YSYX_210428_XORI           8'd22
`define YSYX_210428_ORI            8'd23
`define YSYX_210428_ANDI           8'd24
`define YSYX_210428_SLLI           8'd25    //64_changed
`define YSYX_210428_SRLI           8'd26    //64_changed
`define YSYX_210428_SRAI           8'd27    //64_changed
`define YSYX_210428_ADD            8'd28
`define YSYX_210428_SUB            8'd29
`define YSYX_210428_SLL            8'd30    //64_changed
`define YSYX_210428_SLT            8'd31
`define YSYX_210428_SLTU           8'd32
`define YSYX_210428_XOR            8'd33
`define YSYX_210428_SRL            8'd34    //64_changed
`define YSYX_210428_SRA            8'd35    //64_changed
`define YSYX_210428_OR             8'd36
`define YSYX_210428_AND            8'd37
`define YSYX_210428_FENCE          8'd38
`define YSYX_210428_ECALL          8'd39
`define YSYX_210428_EBREAK         8'd40
//RV64
`define YSYX_210428_LWU            8'd41
`define YSYX_210428_LD             8'd42
`define YSYX_210428_SD             8'd43
`define YSYX_210428_ADDIW          8'd44
`define YSYX_210428_SLLIW          8'd45
`define YSYX_210428_SRLIW          8'd46
`define YSYX_210428_SRAIW          8'd47
`define YSYX_210428_ADDW           8'd48
`define YSYX_210428_SUBW           8'd49
`define YSYX_210428_SLLW           8'd50
`define YSYX_210428_SRLW           8'd51
`define YSYX_210428_SRAW           8'd52
//fence.i
`define YSYX_210428_FENCE_I        8'd53
//csr
`define YSYX_210428_CSRRW          8'd54
`define YSYX_210428_CSRRS          8'd55
`define YSYX_210428_CSRRC          8'd56
`define YSYX_210428_CSRRWI         8'd57
`define YSYX_210428_CSRRSI         8'd58
`define YSYX_210428_CSRRCI         8'd59
//----------------------------------------------------------------
//name : ysyx_210428
//engineer : yhz
//date : 2021.10.07
//----------------------------------------------------------------
module ysyx_210428 (
    //sys
    input         clock             ,
    input         reset             ,
    input         io_interrupt      ,
    //axi_master
    input         io_master_awready ,
    output        io_master_awvalid ,
    output [31:0] io_master_awaddr  ,
    output [3:0]  io_master_awid    ,
    output [7:0]  io_master_awlen   ,
    output [2:0]  io_master_awsize  ,
    output [1:0]  io_master_awburst ,
    input         io_master_wready  ,
    output        io_master_wvalid  ,
    output [63:0] io_master_wdata   ,
    output [7:0]  io_master_wstrb   ,
    output        io_master_wlast   ,
    output        io_master_bready  ,
    input         io_master_bvalid  ,
    input  [1:0]  io_master_bresp   ,
    input  [3:0]  io_master_bid     ,
    input         io_master_arready ,
    output        io_master_arvalid ,
    output [31:0] io_master_araddr  ,
    output [3:0]  io_master_arid    ,
    output [7:0]  io_master_arlen   ,
    output [2:0]  io_master_arsize  ,
    output [1:0]  io_master_arburst ,
    output        io_master_rready  ,
    input         io_master_rvalid  ,
    input  [1:0]  io_master_rresp   ,
    input  [63:0] io_master_rdata   ,
    input         io_master_rlast   ,
    input  [3:0]  io_master_rid     ,
    //axi_slave_no_use
    output        io_slave_awready  ,
    input         io_slave_awvalid  ,
    input  [31:0] io_slave_awaddr   ,
    input  [3:0]  io_slave_awid     ,
    input  [7:0]  io_slave_awlen    ,
    input  [2:0]  io_slave_awsize   ,
    input  [1:0]  io_slave_awburst  ,
    output        io_slave_wready   ,
    input         io_slave_wvalid   ,
    input  [63:0] io_slave_wdata    ,
    input  [7:0]  io_slave_wstrb    ,
    input         io_slave_wlast    ,
    input         io_slave_bready   ,
    output        io_slave_bvalid   ,
    output [1:0]  io_slave_bresp    ,
    output [3:0]  io_slave_bid      ,
    output        io_slave_arready  ,
    input         io_slave_arvalid  ,
    input  [31:0] io_slave_araddr   ,
    input  [3:0]  io_slave_arid     ,
    input  [7:0]  io_slave_arlen    ,
    input  [2:0]  io_slave_arsize   ,
    input  [1:0]  io_slave_arburst  ,
    input         io_slave_rready   ,
    output        io_slave_rvalid   ,
    output [1:0]  io_slave_rresp    ,
    output [63:0] io_slave_rdata    ,
    output        io_slave_rlast    ,
    output [3:0]  io_slave_rid       
);
//----------------------------------------------------------------
//wire
//----------------------------------------------------------------
    //axi_slave_no_use
    assign io_slave_awready = 1'd0  ;
    assign io_slave_wready  = 1'd0  ;
    assign io_slave_bvalid  = 1'd0  ;
    assign io_slave_bresp   = 2'd0  ;
    assign io_slave_bid     = 4'd0  ;
    assign io_slave_arready = 1'd0  ;
    assign io_slave_rvalid  = 1'd0  ;
    assign io_slave_rresp   = 2'd0  ;
    assign io_slave_rdata   = 64'd0 ;
    assign io_slave_rlast   = 1'd0  ;
    assign io_slave_rid     = 4'd0  ;
    //cpu
    wire        r_inst_valid ;
    wire        w_ram_valid  ;
    wire        r_ram_valid  ;
    wire [31:0] r_inst_addr  ;
    wire [31:0] w_ram_addr   ;
    wire [31:0] r_ram_addr   ;
    wire [63:0] w_ram_data   ;
    wire [63:0] w_ram_mask   ;
    //axi
    wire        rw_ready   ;
    wire [63:0] data_read  ;
    wire        rw_valid   = r_inst_valid | r_ram_valid | w_ram_valid ;
    wire        rw_req     = (r_inst_valid | r_ram_valid) ? 1'b0 : w_ram_valid ? 1'b1 : 1'b0 ;
    wire [31:0] rw_addr    = r_inst_valid ? r_inst_addr : r_ram_valid ? r_ram_addr : w_ram_valid ? w_ram_addr : 32'd0 ;
//----------------------------------------------------------------
//module
//----------------------------------------------------------------
    //cpu
    ysyx_210428_cpu ysyx_210428_cpu (
        .i_clk          (clock       ),
        .i_rst          (reset       ),
        //IF
        .i_r_inst_data  (data_read   ),
        .i_r_inst_ready (rw_ready    ),
        .o_r_inst_valid (r_inst_valid),
        .o_r_inst_addr  (r_inst_addr ),
        //RAM
        .i_w_ram_ready  (rw_ready    ),
        .o_w_ram_valid  (w_ram_valid ),
        .o_w_ram_addr   (w_ram_addr  ),
        .o_w_ram_data   (w_ram_data  ),
        .o_w_ram_mask   (w_ram_mask  ),
        .i_r_ram_ready  (rw_ready    ),
        .o_r_ram_valid  (r_ram_valid ),
        .o_r_ram_addr   (r_ram_addr  ),
        .i_r_ram_data   (data_read   ) 
    );
    //axi
    ysyx_210428_axi ysyx_210428_axi (
        .clock           (clock            ),
        .reset           (reset            ),
        //user
    	.rw_valid_i      (rw_valid         ),
    	.rw_ready_o      (rw_ready         ),
        .rw_req_i        (rw_req           ),
        .data_read_o     (data_read        ),
        .data_write_i    (w_ram_data       ),
        .data_mask_i     (w_ram_mask       ),
        .rw_addr_i       (rw_addr          ),
        //Advanced_eXtensible_Interface
        //write_address
        .axi_aw_ready_i  (io_master_awready),
        .axi_aw_valid_o  (io_master_awvalid),
        .axi_aw_addr_o   (io_master_awaddr ),
        .axi_aw_id_o     (io_master_awid   ),
        .axi_aw_len_o    (io_master_awlen  ),
        .axi_aw_size_o   (io_master_awsize ),
        .axi_aw_burst_o  (io_master_awburst),
        //write_data
        .axi_w_ready_i   (io_master_wready ),
        .axi_w_valid_o   (io_master_wvalid ),
        .axi_w_data_o    (io_master_wdata  ),
        .axi_w_strb_o    (io_master_wstrb  ),
        .axi_w_last_o    (io_master_wlast  ),
        //write_resp
        .axi_b_ready_o   (io_master_bready ),
        .axi_b_valid_i   (io_master_bvalid ),
        //read_address
        .axi_ar_ready_i  (io_master_arready),
        .axi_ar_valid_o  (io_master_arvalid),
        .axi_ar_addr_o   (io_master_araddr ),
        .axi_ar_id_o     (io_master_arid   ),
        .axi_ar_len_o    (io_master_arlen  ),
        .axi_ar_size_o   (io_master_arsize ),
        .axi_ar_burst_o  (io_master_arburst),
        //read_data
        .axi_r_ready_o   (io_master_rready ),
        .axi_r_valid_i   (io_master_rvalid ),
        .axi_r_data_i    (io_master_rdata  ),
        .axi_r_last_i    (io_master_rlast  ) 
    );
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_axi
//engineer : yhz
//date : 2021.10.02
//----------------------------------------------------------------
module ysyx_210428_axi (
    input  wire        clock           ,
    input  wire        reset           ,
    //user
	input  wire        rw_valid_i      ,
	output wire        rw_ready_o      ,
    input  wire        rw_req_i        ,
    output wire [63:0] data_read_o     ,
    input  wire [63:0] data_write_i    ,
    input  wire [63:0] data_mask_i     ,
    input  wire [31:0] rw_addr_i       ,
    //Advanced_eXtensible_Interface
    //write_address
    input  wire        axi_aw_ready_i  ,
    output wire        axi_aw_valid_o  ,
    output wire [31:0] axi_aw_addr_o   ,
    output wire [3:0]  axi_aw_id_o     ,
    output wire [7:0]  axi_aw_len_o    ,
    output wire [2:0]  axi_aw_size_o   ,
    output wire [1:0]  axi_aw_burst_o  ,
    //write_data
    input  wire        axi_w_ready_i   ,
    output wire        axi_w_valid_o   ,
    output wire [63:0] axi_w_data_o    ,
    output wire [7:0]  axi_w_strb_o    ,
    output wire        axi_w_last_o    ,
    //write_resp
    output wire        axi_b_ready_o   ,
    input  wire        axi_b_valid_i   ,
    //read_address
    input  wire        axi_ar_ready_i  ,
    output wire        axi_ar_valid_o  ,
    output wire [31:0] axi_ar_addr_o   ,
    output wire [3:0]  axi_ar_id_o     ,
    output wire [7:0]  axi_ar_len_o    ,
    output wire [2:0]  axi_ar_size_o   ,
    output wire [1:0]  axi_ar_burst_o  ,
    //read_data
    output wire        axi_r_ready_o   ,
    input  wire        axi_r_valid_i   ,
    input  wire [63:0] axi_r_data_i    ,
    input  wire        axi_r_last_i      
);
//----------------------------------------------------------------
//wire
//----------------------------------------------------------------
    //command
    wire w_trans = rw_req_i   == 1'b1    ;
    wire r_trans = rw_req_i   == 1'b0    ;
    wire w_valid = rw_valid_i &  w_trans ;
    wire r_valid = rw_valid_i &  r_trans ;
    // handshake
    wire aw_hs = axi_aw_ready_i & axi_aw_valid_o ;
    wire w_hs  = axi_w_ready_i  & axi_w_valid_o  ;
    wire b_hs  = axi_b_ready_o  & axi_b_valid_i  ;
    wire ar_hs = axi_ar_ready_i & axi_ar_valid_o ;
    wire r_hs  = axi_r_ready_o  & axi_r_valid_i  ;
    //done
    wire w_done     = w_hs & axi_w_last_o     ;
    wire r_done     = r_hs & axi_r_last_i     ;
    wire trans_done = w_trans ? b_hs : r_done ;
//----------------------------------------------------------------
//State_Machine
//----------------------------------------------------------------
    parameter [2:0] W_STATE_IDLE = 3'b000 , W_STATE_ADDR = 3'b001 , W_STATE_WRITE = 3'b010 , W_STATE_RESP = 3'b011 , W_STATE_WAIT = 3'b100 ;
    parameter [2:0] R_STATE_IDLE = 3'b000 , R_STATE_ADDR = 3'b001 , R_STATE_READ  = 3'b010 , R_STATE_WAIT = 3'b011 ;

    reg [2:0] w_state, r_state ;
    wire w_state_addr = w_state == W_STATE_ADDR , w_state_write = w_state == W_STATE_WRITE , w_state_resp = w_state == W_STATE_RESP ;
    wire r_state_addr = r_state == R_STATE_ADDR , r_state_read  = r_state == R_STATE_READ ;
    //Wirte_State_Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE ;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE  :             w_state <= W_STATE_ADDR  ;
                    W_STATE_ADDR  : if (aw_hs)  w_state <= W_STATE_WRITE ; else w_state <= W_STATE_ADDR  ;
                    W_STATE_WRITE : if (w_done) w_state <= W_STATE_RESP  ; else w_state <= W_STATE_WRITE ;
                    W_STATE_RESP  : if (b_hs)   w_state <= W_STATE_WAIT  ; else w_state <= W_STATE_RESP  ;
                    W_STATE_WAIT  :             w_state <= W_STATE_IDLE  ;
                    default       :             w_state <= W_STATE_IDLE  ;
                endcase
            end
            else begin
                w_state <= W_STATE_IDLE ;
            end
        end
    end
    //Read_State_Machine
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE ;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE :             r_state <= R_STATE_ADDR ;
                    R_STATE_ADDR : if (ar_hs)  r_state <= R_STATE_READ ; else r_state <= R_STATE_ADDR ;
                    R_STATE_READ : if (r_done) r_state <= R_STATE_WAIT ; else r_state <= R_STATE_READ ;
                    R_STATE_WAIT :             r_state <= R_STATE_IDLE ;
                    default      :             r_state <= R_STATE_IDLE ;
                endcase
            end
            else begin
                r_state <= R_STATE_IDLE ;
            end
        end
    end
//----------------------------------------------------------------
//Process_Data
//----------------------------------------------------------------
    //rw_ready
    reg rw_ready ;
    wire rw_ready_nxt = trans_done ;
    wire rw_ready_en  = trans_done | rw_ready ;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 0 ;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt ;
        end
    end
    assign rw_ready_o = rw_ready ;
    //strb
    wire mask_0 = data_mask_i[7 :0 ] == 8'hff ;
    wire mask_1 = data_mask_i[15:8 ] == 8'hff ;
    wire mask_2 = data_mask_i[23:16] == 8'hff ;
    wire mask_3 = data_mask_i[31:24] == 8'hff ;
    wire mask_4 = data_mask_i[39:32] == 8'hff ;
    wire mask_5 = data_mask_i[47:40] == 8'hff ;
    wire mask_6 = data_mask_i[55:48] == 8'hff ;
    wire mask_7 = data_mask_i[63:56] == 8'hff ;
    wire [7:0] strb = {mask_7 , mask_6 , mask_5 , mask_4 , mask_3 , mask_2 , mask_1 , mask_0} ;
    //size_sel
    wire [2:0] size_sel = (rw_addr_i < 32'h8000_0000) ? 3'b010 : 3'b011 ;
//----------------------------------------------------------------
//Write_Transaction
//----------------------------------------------------------------
    //write_address
    assign axi_aw_valid_o  = w_state_addr  ;
    assign axi_aw_addr_o   = rw_addr_i     ;
    assign axi_aw_id_o     = 0             ;
    assign axi_aw_len_o    = 0             ;
    assign axi_aw_size_o   = size_sel      ;
    assign axi_aw_burst_o  = 2'b01         ;
    //write_data
    assign axi_w_valid_o   = w_state_write ;
    assign axi_w_data_o    = data_write_i  ;
    assign axi_w_strb_o    = strb          ;
    assign axi_w_last_o    = w_state_write ;
    //write_resp
    assign axi_b_ready_o   = w_state_resp  ;
//----------------------------------------------------------------
//Read_Transaction
//----------------------------------------------------------------
    //read_address
    assign axi_ar_valid_o = r_state_addr     ;
    assign axi_ar_addr_o  = rw_addr_i[31:0]  ;
    assign axi_ar_id_o    = 0                ;
    assign axi_ar_len_o   = 8'd0             ;
    assign axi_ar_size_o  = size_sel         ;
    assign axi_ar_burst_o = 2'b01            ;
    //read_data
    assign axi_r_ready_o  = r_state_read     ;
//----------------------------------------------------------------
//to_cpu
//----------------------------------------------------------------
    //data_read_o
    reg [63:0] data_read ;
    always @(posedge clock) begin
        if(reset) begin
            data_read <= 64'd0 ;
        end
        else begin
            data_read <= axi_r_data_i ;
        end
    end
    assign data_read_o = data_read ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_cpu
//engineer : yhz
//date : 2021.07.28
//----------------------------------------------------------------
module ysyx_210428_cpu (
    input  wire        i_clk          ,
    input  wire        i_rst          ,
    //IF
    input  wire [63:0] i_r_inst_data  ,
    input  wire        i_r_inst_ready ,
    output wire        o_r_inst_valid ,
    output wire [31:0] o_r_inst_addr  ,
    //RAM
    input  wire        i_w_ram_ready  ,
    output wire        o_w_ram_valid  ,
    output wire [31:0] o_w_ram_addr   ,
    output wire [63:0] o_w_ram_data   ,
    output wire [63:0] o_w_ram_mask   ,
    input  wire        i_r_ram_ready  ,
    output wire        o_r_ram_valid  ,
    output wire [31:0] o_r_ram_addr   ,
    input  wire [63:0] i_r_ram_data    
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    //ram
    wire        pipeline_pulse_t1 ;
    wire        pipeline_pulse_t2 ;
    wire        pipeline_pulse_t3 ;
    wire        pipeline_unlock   ;
    wire        hand_shake_flag   ;
    wire [63:0] pc_addr           ;
    wire [31:0] instruction       ;
    //trap
    wire        trap_ecall        ;
    wire        trap_timer        ;
    wire        trap              ;
    wire        mret              ;
    wire [63:0] mtvec_addr        ;
    wire [63:0] mepc_addr         ;
    //jump
    wire        jal_en            ;
    wire        jalr_en           ;
    wire        branch_en         ;
    wire [63:0] pcj_addr          ;
    //csr
    wire        w_csr_en          ;
    wire [11:0] w_csr_addr        ;
    wire [63:0] w_csr_data        ;
    wire [11:0] r_csr_addr        ;
    wire [63:0] r_csr_data        ;
    //rd
    wire        r_rs1_en          ;
    wire        r_rs2_en          ;
    wire [4:0]  r_rs1_addr        ;
    wire [4:0]  r_rs2_addr        ;
    wire [63:0] r_rs1_data        ;
    wire [63:0] r_rs2_data        ;

    wire [63:0] inst_op1          ;
    wire [63:0] inst_op2          ;
    wire [63:0] inst_op3          ;
    wire [7:0]  inst_encode       ;

    wire        load_en           ;
    wire        store_en          ;
    wire [4:0]  load_cmd          ;
    wire [63:0] store_data        ;
    wire [63:0] store_mask        ;

    wire        w_rd_en_t1        ;
    wire        w_rd_en_t2        ;
    wire        w_rd_en_t3        ;
    wire        w_rd_en_t4        ;
    wire [4:0]  w_rd_addr_t1      ;
    wire [4:0]  w_rd_addr_t2      ;
    wire [4:0]  w_rd_addr_t3      ;
    wire [4:0]  w_rd_addr_t4      ;
    wire [63:0] w_rd_data_t1      ;
    wire [63:0] w_rd_data_t2      ;
    wire [63:0] w_rd_data_em      ;
    wire [63:0] w_rd_data_t3      ;
    wire [63:0] w_rd_data_t4      ;
    //clint
    wire        w_mtime_en        ;
    wire        r_mtime_en        ;
    wire        w_mtimecmp_en     ;
    wire        r_mtimecmp_en     ;
    wire [63:0] r_clint_data      ;
//----------------------------------------------------------------
//module
//----------------------------------------------------------------
    ysyx_210428_if IF (
        .i_clk             (i_clk            ),
        .i_rst             (i_rst            ),
        .i_pipeline_pulse  (pipeline_pulse_t1),
        .o_hand_shake_flag (hand_shake_flag  ),
        //trap
        .i_trap            (trap             ),
        .i_mret            (mret             ),
        .i_mtvec_addr      (mtvec_addr       ),
        .i_mepc_addr       (mepc_addr        ),
        //jump
        .i_jal_en          (jal_en           ),
        .i_jalr_en         (jalr_en          ),
        .i_branch_en       (branch_en        ),
        .i_pcj_addr        (pcj_addr         ),
        //to_AXI
        .i_r_inst_data     (i_r_inst_data    ),
        .i_r_inst_ready    (i_r_inst_ready   ),
        .o_r_inst_valid    (o_r_inst_valid   ),
        .o_r_inst_addr     (o_r_inst_addr    ),
        //to_instruction_decode
        .o_pc_addr         (pc_addr          ),
        .o_instruction     (instruction      ) 
    );

    ysyx_210428_id ID (
        .i_clk               (i_clk            ),
        .i_rst               (i_rst            ),
        .i_pipeline_unlock   (pipeline_unlock  ),
        .o_pipeline_pulse    (pipeline_pulse_t1),
        //transfer
        .i_pc_addr           (pc_addr          ),
        .i_instruction       (instruction      ),
        .i_rs1_data          (r_rs1_data       ),
        .i_rs2_data          (r_rs2_data       ),
        .i_r_csr_data        (r_csr_data       ),

        .i_w_rd_en_exe       (w_rd_en_t2       ),
        .i_w_rd_en_mem       (w_rd_en_t3       ),
        .i_w_rd_en_wb        (w_rd_en_t4       ),
        .i_w_rd_addr_exe     (w_rd_addr_t2     ),
        .i_w_rd_addr_mem     (w_rd_addr_t3     ),
        .i_w_rd_addr_wb      (w_rd_addr_t4     ),
        .i_w_rd_data         (w_rd_data_t1     ),
        .i_w_rd_data_exe     (w_rd_data_t2     ),
        .i_w_rd_data_mem     (w_rd_data_t3     ),
        .i_w_rd_data_wb      (w_rd_data_t4     ),
        
        .i_trap_timer        (trap_timer       ),
        .o_trap_ecall        (trap_ecall       ),
        .o_mret              (mret             ),

        .o_jal_en            (jal_en           ),
        .o_jalr_en           (jalr_en          ),
        .o_branch_en         (branch_en        ),
        .o_pcj_addr          (pcj_addr         ),

        .o_r_rs1_en          (r_rs1_en         ),
        .o_r_rs2_en          (r_rs2_en         ),
        .o_r_rs1_addr        (r_rs1_addr       ),
        .o_r_rs2_addr        (r_rs2_addr       ),
        .o_r_csr_addr        (r_csr_addr       ),
        //to_execute
        .o_w_rd_en           (w_rd_en_t1       ),
        .o_w_csr_en          (w_csr_en         ),
        .o_w_rd_addr         (w_rd_addr_t1     ),
        .o_w_csr_addr        (w_csr_addr       ),
        .o_w_csr_data        (w_csr_data       ),
        .o_inst_op1          (inst_op1         ),
        .o_inst_op2          (inst_op2         ),
        .o_inst_op3          (inst_op3         ),
        .o_inst_encode       (inst_encode      ) 
    );

    ysyx_210428_exe EXE (
        .i_clk             (i_clk            ),
        .i_rst             (i_rst            ),
        .i_pipeline_unlock (pipeline_unlock  ),
        .i_pipeline_pulse  (pipeline_pulse_t1),
        .o_pipeline_pulse  (pipeline_pulse_t2),
        //command
        .i_inst_encode     (inst_encode      ),
        .i_inst_op1        (inst_op1         ),
        .i_inst_op2        (inst_op2         ),
        .i_inst_op3        (inst_op3         ),
        //transfer
        .i_w_rd_en         (w_rd_en_t1       ),
        .i_w_rd_addr       (w_rd_addr_t1     ),
        .o_w_rd_data_t     (w_rd_data_t1     ),
        //to_memory
        .o_load_en         (load_en          ),
        .o_store_en        (store_en         ),
        .o_load_cmd        (load_cmd         ),
        .o_store_data      (store_data       ),
        .o_store_mask      (store_mask       ),
        .o_w_rd_en         (w_rd_en_t2       ),
        .o_w_rd_addr       (w_rd_addr_t2     ),
        .o_w_rd_data       (w_rd_data_em     ) 
    );

    ysyx_210428_mem MEM (
        .i_clk             (i_clk            ),
        .i_rst             (i_rst            ),
        .i_pipeline_pulse  (pipeline_pulse_t2),
        .o_pipeline_unlock (pipeline_unlock  ),
        .o_pipeline_pulse  (pipeline_pulse_t3),
        //command
        .i_load_en         (load_en          ),
        .i_store_en        (store_en         ),
        .i_load_cmd        (load_cmd         ),
        .i_store_data      (store_data       ),
        .i_store_mask      (store_mask       ),
        //transfer
        .i_w_rd_en         (w_rd_en_t2       ),
        .i_w_rd_addr       (w_rd_addr_t2     ),
        .i_w_rd_data       (w_rd_data_em     ),
        .o_w_rd_data_t     (w_rd_data_t2     ),
        //to_write_back
        .o_w_rd_en         (w_rd_en_t3       ),
        .o_w_rd_addr       (w_rd_addr_t3     ),
        .o_w_rd_data       (w_rd_data_t3     ),
        //clint
        .o_w_mtime_en      (w_mtime_en       ),
        .o_r_mtime_en      (r_mtime_en       ),
        .o_w_mtimecmp_en   (w_mtimecmp_en    ),
        .o_r_mtimecmp_en   (r_mtimecmp_en    ),
        .i_r_clint_data    (r_clint_data     ),
        //to_RAM
        .i_w_ram_ready     (i_w_ram_ready    ),
        .o_w_ram_valid     (o_w_ram_valid    ),
        .o_w_ram_addr      (o_w_ram_addr     ),
        .o_w_ram_data      (o_w_ram_data     ),
        .o_w_ram_mask      (o_w_ram_mask     ),
        .i_r_ram_ready     (i_r_ram_ready    ),
        .o_r_ram_valid     (o_r_ram_valid    ),
        .o_r_ram_addr      (o_r_ram_addr     ),
        .i_r_ram_data      (i_r_ram_data     ) 
    );

    ysyx_210428_wb WB (
        .i_clk             (i_clk            ),
        .i_rst             (i_rst            ),
        .i_pipeline_unlock (pipeline_unlock  ),
        .i_pipeline_pulse  (pipeline_pulse_t3),
        //transfer
        .i_w_rd_en         (w_rd_en_t3       ),
        .i_w_rd_addr       (w_rd_addr_t3     ),
        .i_w_rd_data       (w_rd_data_t3     ),
        //to_common_register
        .o_w_rd_en         (w_rd_en_t4       ),
        .o_w_rd_addr       (w_rd_addr_t4     ),
        .o_w_rd_data       (w_rd_data_t4     ) 
    );

    ysyx_210428_cr CR (
        .i_clk          (i_clk       ),
        .i_rst          (i_rst       ),
        //rd
        .i_w_rd_en      (w_rd_en_t4  ),
        .i_w_rd_addr    (w_rd_addr_t4),
        .i_w_rd_data    (w_rd_data_t4),
        //rs
        .i_r_rs1_en     (r_rs1_en    ),
        .i_r_rs2_en     (r_rs2_en    ),
        .i_r_rs1_addr   (r_rs1_addr  ),
        .i_r_rs2_addr   (r_rs2_addr  ),
        .o_r_rs1_data   (r_rs1_data  ),
        .o_r_rs2_data   (r_rs2_data  ) 
    );

    ysyx_210428_csr CSR (
        .i_clk             (i_clk          ),
        .i_rst             (i_rst          ),
        .i_hand_shake_flag (hand_shake_flag),
        //trap
        .i_trap_ecall      (trap_ecall     ),
        .o_trap_timer      (trap_timer     ),
        .o_trap            (trap           ),
        .i_mret            (mret           ),
        .i_pc_addr         (pc_addr        ),
        .o_mtvec_addr      (mtvec_addr     ),
        .o_mepc_addr       (mepc_addr      ),
        //clint
        .i_w_mtime_en      (w_mtime_en     ),
        .i_r_mtime_en      (r_mtime_en     ),
        .i_w_mtimecmp_en   (w_mtimecmp_en  ),
        .i_r_mtimecmp_en   (r_mtimecmp_en  ),
        .i_w_clint_data    (o_w_ram_data   ),
        .o_r_clint_data    (r_clint_data   ),
        //write
        .i_w_csr_en        (w_csr_en       ),
        .i_w_csr_addr      (w_csr_addr     ),
        .i_w_csr_data      (w_csr_data     ),
        //read
        .i_r_csr_addr      (r_csr_addr     ),
        .o_r_csr_data      (r_csr_data     ) 
    );
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_if
//engineer : yhz
//date : 2021.07.26
//----------------------------------------------------------------
module ysyx_210428_if (
    input  wire        i_clk             ,
    input  wire        i_rst             ,
    input  wire        i_pipeline_pulse  ,
    output wire        o_hand_shake_flag ,
    //trap
    input  wire        i_trap            ,
    input  wire        i_mret            ,
    input  wire [63:0] i_mtvec_addr      ,
    input  wire [63:0] i_mepc_addr       ,
    //jump
    input  wire        i_jal_en          ,
    input  wire        i_jalr_en         ,
    input  wire        i_branch_en       ,
    input  wire [63:0] i_pcj_addr        ,
    //to_AXI
    input  wire [63:0] i_r_inst_data     ,
    input  wire        i_r_inst_ready    ,
    output wire        o_r_inst_valid    ,
    output wire [31:0] o_r_inst_addr     ,
    //to_instruction_decode
    output wire [63:0] o_pc_addr         ,
    output wire [31:0] o_instruction      
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    wire        r_inst_valid    = i_pipeline_pulse ? 1'b0 : 1'b1 ;
    wire        hand_shake_flag = r_inst_valid & i_r_inst_ready  ;

    reg  [63:0] r_inst_addr_t ;
    reg  [63:0] r_inst_addr   ;
    reg  [63:0] pc_addr       ;
    
    wire [63:0] pc_addr_t       = hand_shake_flag ? r_inst_addr : pc_addr ; 
    wire [31:0] instruction     = hand_shake_flag ? r_inst_addr[2] ? i_r_inst_data[63:32] : i_r_inst_data[31:0] : 32'd0 ;
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //r_inst_addr_t
    always @(*) begin
        if(i_rst) begin
            r_inst_addr_t = 64'h00000000_30000000 ;
        end
        else if(hand_shake_flag) begin
            case({i_trap,i_mret,i_branch_en,i_jal_en,i_jalr_en})
                5'b10000 : r_inst_addr_t = i_mtvec_addr ;
                5'b01000 : r_inst_addr_t = i_mepc_addr ;
                5'b00100 : r_inst_addr_t = r_inst_addr + i_pcj_addr ;
                5'b00010 : r_inst_addr_t = i_pcj_addr[63]? (r_inst_addr - (~i_pcj_addr + 1'b1)) : (r_inst_addr + i_pcj_addr) ;
                5'b00001 : r_inst_addr_t = i_pcj_addr ;
                default   : r_inst_addr_t = r_inst_addr + 64'd4 ;
            endcase
        end
        else begin
            r_inst_addr_t = r_inst_addr ;
        end
    end
    //r_inst_addr
    always @(posedge i_clk) begin
        if(i_rst) begin
            r_inst_addr <= 64'h00000000_30000000 ;
        end
        else begin
            r_inst_addr <= r_inst_addr_t ;
        end
    end
    //pc_addr
    always @(posedge i_clk) begin
        if(i_rst) begin
            pc_addr <= 64'h00000000_30000000 ;
        end
        else begin
            pc_addr <= pc_addr_t ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    assign o_hand_shake_flag = hand_shake_flag   ;
    assign o_r_inst_valid    = r_inst_valid      ;
    assign o_r_inst_addr     = r_inst_addr[31:0] ;
    assign o_pc_addr         = pc_addr_t         ;
    assign o_instruction     = instruction       ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_id
//engineer : yhz
//date : 2021.07.26
//update : 2021.07.30 处理rd还没到位时rs就调用的问题
//----------------------------------------------------------------
module ysyx_210428_id (
    input  wire        i_clk               ,
    input  wire        i_rst               ,
    input  wire        i_pipeline_unlock   ,
    output wire        o_pipeline_pulse    ,
    //transfer
    input  wire [63:0] i_pc_addr           ,
    input  wire [31:0] i_instruction       ,
    input  wire [63:0] i_rs1_data          ,
    input  wire [63:0] i_rs2_data          ,
    input  wire [63:0] i_r_csr_data        ,

    input  wire        i_w_rd_en_exe       ,
    input  wire        i_w_rd_en_mem       ,
    input  wire        i_w_rd_en_wb        ,
    input  wire [4:0]  i_w_rd_addr_exe     ,
    input  wire [4:0]  i_w_rd_addr_mem     ,
    input  wire [4:0]  i_w_rd_addr_wb      ,
    input  wire [63:0] i_w_rd_data         ,
    input  wire [63:0] i_w_rd_data_exe     ,
    input  wire [63:0] i_w_rd_data_mem     ,
    input  wire [63:0] i_w_rd_data_wb      ,

    input  wire        i_trap_timer        ,
    output wire        o_trap_ecall        ,
    output wire        o_mret              ,

    output wire        o_jal_en            ,
    output wire        o_jalr_en           ,
    output wire        o_branch_en         ,
    output wire [63:0] o_pcj_addr          ,

    output wire        o_r_rs1_en          ,
    output wire        o_r_rs2_en          ,
    output wire [4:0]  o_r_rs1_addr        ,
    output wire [4:0]  o_r_rs2_addr        ,
    output wire [11:0] o_r_csr_addr        ,
    //to_execute
    output wire        o_w_rd_en           ,
    output wire        o_w_csr_en          ,
    output wire [4:0]  o_w_rd_addr         ,
    output wire [11:0] o_w_csr_addr        ,
    output wire [63:0] o_w_csr_data        ,
    output wire [63:0] o_inst_op1          ,
    output wire [63:0] o_inst_op2          ,
    output wire [63:0] o_inst_op3          ,
    output wire [7:0]  o_inst_encode        
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    //decode
    wire [11:0] imm_i  = i_instruction[31:20]                                                                  ;
    wire [11:0] imm_s  = {i_instruction[31] , i_instruction[30:25] , i_instruction[11:7]}                      ;
    wire [11:0] imm_b  = {i_instruction[31] , i_instruction[7] , i_instruction[30:25] , i_instruction[11:8]}   ;
    wire [19:0] imm_u  = i_instruction[31:12]                                                                  ;
    wire [19:0] imm_j  = {i_instruction[31] , i_instruction[19:12] , i_instruction[20] , i_instruction[30:21]} ;
    wire [11:0] csr    = i_instruction[31:20]    ;
    wire [4:0]  rs2    = i_instruction[24:20]    ;
    wire [4:0]  rs1    = i_instruction[19:15]    ;
    wire [2:0]  func3  = i_instruction[14:12]    ;
    wire [4:0]  rd     = i_instruction[11:7]     ;
    wire [6:0]  opcode = i_instruction[6:0]      ;
    //transfer
    reg        pipeline_pulse ;
    reg        branch_en      ;
    reg [63:0] pcj_addr       ;
    reg [63:0] w_csr_data     ;
    reg [63:0] inst_op1_t     ;
    reg [63:0] inst_op2_t     ;
    reg [63:0] inst_op3_t     ;
    reg [7:0]  inst_encode_t  ;
    //to_execute
    reg        w_rd_en        ;
    reg [4:0]  w_rd_addr      ;
    reg [63:0] inst_op1       ;
    reg [63:0] inst_op2       ;
    reg [63:0] inst_op3       ;
    reg [7:0]  inst_encode    ;

    wire        r_rs1_en         = (((inst_encode_t > 8'd3 ) && (inst_encode_t < 8'd39)) || 
                                    ((inst_encode_t > 8'd40) && (inst_encode_t < 8'd53)) || 
                                    ((inst_encode_t > 8'd53) && (inst_encode_t < 8'd57))) ? 1'b1 : 1'b0 ;
    wire        r_rs2_en         = (((inst_encode_t > 8'd4 ) && (inst_encode_t < 8'd11)) || 
                                    ((inst_encode_t > 8'd15) && (inst_encode_t < 8'd19)) || 
                                    ((inst_encode_t > 8'd27) && (inst_encode_t < 8'd38)) || 
                                    ((inst_encode_t > 8'd47) && (inst_encode_t < 8'd53)) || 
                                    (inst_encode_t == 8'd43)) ? 1'b1 : 1'b0 ;
    wire        r_csr_en         = ((inst_encode_t > 8'd53) && (inst_encode_t < 8'd60)) ? 1'b1 : 1'b0 ;
    wire        w_csr_en         = ((inst_encode_t > 8'd53) && (inst_encode_t < 8'd60)) ? 1'b1 : 1'b0 ;
    wire [4:0]  r_rs1_addr       = r_rs1_en ? rs1 : 5'd0  ;
    wire [4:0]  r_rs2_addr       = r_rs2_en ? rs2 : 5'd0  ;
    wire [11:0] r_csr_addr       = r_csr_en ? csr : 12'd0 ;
    wire [11:0] w_csr_addr       = w_csr_en ? csr : 12'd0 ;
    wire        w_rd_en_t        = (((inst_encode_t > 8'd0 ) && (inst_encode_t < 8'd5 )) || 
                                    ((inst_encode_t > 8'd10) && (inst_encode_t < 8'd16)) || 
                                    ((inst_encode_t > 8'd18) && (inst_encode_t < 8'd39)) || 
                                    ((inst_encode_t > 8'd40) && (inst_encode_t < 8'd43)) || 
                                    ((inst_encode_t > 8'd43) && (inst_encode_t < 8'd53)) || 
                                    ((inst_encode_t > 8'd53) && (inst_encode_t < 8'd60))) ? 1'b1 : 1'b0 ;
    wire [4:0]  w_rd_addr_t      = w_rd_en_t ? rd : 5'd0 ;
    wire        load_store_cmd   = (((inst_encode_t > 8'd10) && (inst_encode_t < 8'd19)) || 
                                    ((inst_encode_t > 8'd40) && (inst_encode_t < 8'd44))) ? 1'b1 : 1'b0 ;
    wire        pipeline_pulse_t = load_store_cmd ? 1'b1 : i_pipeline_unlock ? 1'b0 : pipeline_pulse ;
    wire        trap_ecall       = (inst_encode_t == `YSYX_210428_ECALL) ? 1'b1 : 1'b0 ;
    wire        mret             = (inst_encode_t == `YSYX_210428_MRET ) ? 1'b1 : 1'b0 ;
    wire        jal_en           = (inst_encode_t == `YSYX_210428_JAL  ) ? 1'b1 : 1'b0 ;
    wire        jalr_en          = (inst_encode_t == `YSYX_210428_JALR ) ? 1'b1 : 1'b0 ;
    wire [63:0] add_t            = inst_op1_t + inst_op2_t ;
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //pipeline_pulse
    always @(posedge i_clk) begin
        if(i_rst) begin
            pipeline_pulse <= 1'b0 ;
        end
        else begin
            pipeline_pulse <= pipeline_pulse_t ;
        end
    end
    //branch_en
    always @(*) begin
        if(i_rst) begin
            branch_en = 1'b0 ;
        end
        else begin
            case(inst_encode_t)
                `YSYX_210428_BEQ  : branch_en = (inst_op1_t == inst_op2_t) ? 1'b1 : 1'b0 ;
                `YSYX_210428_BNE  : branch_en = (inst_op1_t == inst_op2_t) ? 1'b0 : 1'b1 ;
                `YSYX_210428_BLTU : branch_en = (inst_op1_t <  inst_op2_t) ? 1'b1 : 1'b0 ;
                `YSYX_210428_BGEU : branch_en = (inst_op1_t <  inst_op2_t) ? 1'b0 : 1'b1 ;
                `YSYX_210428_BLT  : begin
                    case({inst_op1_t[63],inst_op2_t[63]})
                        2'b00 : branch_en = (inst_op1_t < inst_op2_t) ? 1'b1 : 1'b0 ;
                        2'b01 : branch_en = 1'b0 ;
                        2'b10 : branch_en = 1'b1 ;
                        2'b11 : branch_en = ((~inst_op1_t + 64'd1) > (~inst_op2_t + 64'd1)) ? 1'b1 : 1'b0 ;
                        default : branch_en = 1'b0 ;
                    endcase
                end
                `YSYX_210428_BGE  : begin
                    case({inst_op1_t[63],inst_op2_t[63]})
                        2'b00 : branch_en = (inst_op1_t < inst_op2_t) ? 1'b0 : 1'b1 ;
                        2'b01 : branch_en = 1'b1 ;
                        2'b10 : branch_en = 1'b0 ;
                        2'b11 : branch_en = ((~inst_op1_t + 64'd1) > (~inst_op2_t + 64'd1)) ? 1'b0 : 1'b1 ;
                        default : branch_en = 1'b0 ;
                    endcase
                end
                default : branch_en = 1'b0 ;
            endcase
        end
    end
    //pcj_addr
    always @(*) begin
        if(i_rst) begin
            pcj_addr = 64'd0 ;
        end
        else begin
            case({jal_en,jalr_en,branch_en})
                3'b100  : pcj_addr = inst_op2_t ;
                3'b010  : pcj_addr = add_t & 64'hffff_ffff_ffff_fffe ;
                3'b001  : pcj_addr = { { 51 { imm_b [11] } } , imm_b  , 1'b0 } ;
                default : pcj_addr = 64'd0 ;
            endcase
        end
    end
    //w_csr_data
    always @(*) begin
        if(i_rst) begin
            w_csr_data = 64'd0 ;
        end
        else begin
            case(inst_encode_t)
                `YSYX_210428_CSRRW  : begin
                    w_csr_data = inst_op1_t ;
                end
                `YSYX_210428_CSRRS  : begin
                    w_csr_data = inst_op2_t | inst_op1_t ;
                end
                `YSYX_210428_CSRRC  : begin
                    w_csr_data = inst_op2_t & ~inst_op1_t ;
                end
                `YSYX_210428_CSRRWI : begin
                    w_csr_data = inst_op3_t ;
                end
                `YSYX_210428_CSRRSI : begin
                    w_csr_data = inst_op2_t | inst_op3_t ;
                end
                `YSYX_210428_CSRRCI : begin
                    w_csr_data = inst_op2_t & ~inst_op3_t ;
                end
                default : w_csr_data = 64'd0 ;
            endcase
        end
    end
    ///inst_op1_t
    always @(*) begin
        if(i_rst) begin
            inst_op1_t = 64'd0 ;
        end
        else if(r_rs1_en) begin
            if(r_rs1_addr == 5'd0) begin
                inst_op1_t = 64'd0 ;
            end
            else if(w_rd_en && (r_rs1_addr == w_rd_addr)) begin
                inst_op1_t = i_w_rd_data ;
            end
            else if(i_w_rd_en_exe && (r_rs1_addr == i_w_rd_addr_exe)) begin
                inst_op1_t = i_w_rd_data_exe ;
            end
            else if(i_w_rd_en_mem && (r_rs1_addr == i_w_rd_addr_mem)) begin
                inst_op1_t = i_w_rd_data_mem ;
            end
            else if(i_w_rd_en_wb && (r_rs1_addr == i_w_rd_addr_wb)) begin
                inst_op1_t = i_w_rd_data_wb ;
            end
            else begin
                inst_op1_t = i_rs1_data ;
            end
        end
        else begin
            inst_op1_t = 64'd0 ;
        end
    end
    ///inst_op2_t
    always @(*) begin
        if(i_rst) begin
            inst_op2_t = 64'd0 ;
        end
        else if(r_rs2_en) begin
            if(r_rs2_addr == 5'd0) begin
                inst_op2_t = 64'd0 ;
            end
            else if(w_rd_en && (r_rs2_addr == w_rd_addr)) begin
                inst_op2_t = i_w_rd_data ;
            end
            else if(i_w_rd_en_exe && (r_rs2_addr == i_w_rd_addr_exe)) begin
                inst_op2_t = i_w_rd_data_exe ;
            end
            else if(i_w_rd_en_mem && (r_rs2_addr == i_w_rd_addr_mem)) begin
                inst_op2_t = i_w_rd_data_mem ;
            end
            else if(i_w_rd_en_wb && (r_rs2_addr == i_w_rd_addr_wb)) begin
                inst_op2_t = i_w_rd_data_wb ;
            end
            else begin
                inst_op2_t = i_rs2_data ;
            end
        end
        else if(r_csr_en) begin
            inst_op2_t = i_r_csr_data ;
        end
        else if((inst_encode_t == `YSYX_210428_LUI) || (inst_encode_t == `YSYX_210428_AUIPC)) begin
            inst_op2_t = { { 32 { imm_u[19] } } , imm_u , 12'h000 } ;
        end
        else if(inst_encode_t == `YSYX_210428_JAL) begin
            inst_op2_t = { { 43 { imm_j [19] } } , imm_j  , 1'b0 } ;
        end
        else begin
            inst_op2_t = { { 52 { imm_i[11] } } , imm_i } ;
        end
    end
    ///inst_op3_t
    always @(*) begin
        if(i_rst) begin
            inst_op3_t = 64'd0 ;
        end
        else if((inst_encode_t > 8'd1) && (inst_encode_t < 8'd5)) begin
            inst_op3_t = i_pc_addr ;
        end
        else if(((inst_encode_t > 8'd15) && (inst_encode_t < 8'd19)) || (inst_encode_t == 8'd43)) begin
            inst_op3_t = { { 52 { imm_s[11] } } , imm_s } ;
        end
        else if((inst_encode_t > 8'd56) && (inst_encode_t < 8'd60)) begin
            inst_op3_t = { 59'd0 , rs1 } ;
        end
        else begin
            inst_op3_t = 64'd0 ;
        end
    end
    //inst_encode_t
    always @(*) begin
        if(i_rst) begin
            inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
        end
        if(i_trap_timer) begin
            inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
        end
        else if(opcode[1:0] == 2'b11) begin
            case(opcode[6:2])
                5'b01101 : begin
                    inst_encode_t = `YSYX_210428_LUI ;    //lui
                end
                5'b00101 : begin
                    inst_encode_t = `YSYX_210428_AUIPC ;    //auipc
                end
                5'b11011 : begin
                    inst_encode_t = `YSYX_210428_JAL ;    //jal
                end
                5'b11001 : begin
                    inst_encode_t = (func3 == 3'b000)? `YSYX_210428_JALR : `YSYX_210428_NO_INSTRUCTION ;    //jalr
                end
                5'b11000 : begin
                    case(func3)
                        3'b000  : inst_encode_t = `YSYX_210428_BEQ            ;    //beq
                        3'b001  : inst_encode_t = `YSYX_210428_BNE            ;    //bne
                        3'b100  : inst_encode_t = `YSYX_210428_BLT            ;    //blt
                        3'b101  : inst_encode_t = `YSYX_210428_BGE            ;    //bge
                        3'b110  : inst_encode_t = `YSYX_210428_BLTU           ;    //bltu
                        3'b111  : inst_encode_t = `YSYX_210428_BGEU           ;    //bgeu
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                5'b00000 : begin
                    case(func3)
                        3'b000  : inst_encode_t = `YSYX_210428_LB             ;    //lb
                        3'b001  : inst_encode_t = `YSYX_210428_LH             ;    //lh
                        3'b010  : inst_encode_t = `YSYX_210428_LW             ;    //lw
                        3'b100  : inst_encode_t = `YSYX_210428_LBU            ;    //lbu
                        3'b101  : inst_encode_t = `YSYX_210428_LHU            ;    //lhu
                        3'b110  : inst_encode_t = `YSYX_210428_LWU            ;    //lwu    //RV64
                        3'b011  : inst_encode_t = `YSYX_210428_LD             ;    //ld     //RV64
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                5'b01000 : begin
                    case(func3)
                        3'b000  : inst_encode_t = `YSYX_210428_SB             ;    //sb
                        3'b001  : inst_encode_t = `YSYX_210428_SH             ;    //sh
                        3'b010  : inst_encode_t = `YSYX_210428_SW             ;    //sw
                        3'b011  : inst_encode_t = `YSYX_210428_SD             ;    //sd    //RV64
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase 
                end
                5'b00100 : begin
                    case(func3)
                        3'b000  : inst_encode_t = `YSYX_210428_ADDI  ;    //addi
                        3'b010  : inst_encode_t = `YSYX_210428_SLTI  ;    //slti
                        3'b011  : inst_encode_t = `YSYX_210428_SLTIU ;    //sltiu
                        3'b100  : inst_encode_t = `YSYX_210428_XORI  ;    //xori
                        3'b110  : inst_encode_t = `YSYX_210428_ORI   ;    //ori
                        3'b111  : inst_encode_t = `YSYX_210428_ANDI  ;    //andi
                        3'b001  : inst_encode_t = (imm_i[11:6] == 6'b000000 )? `YSYX_210428_SLLI : `YSYX_210428_NO_INSTRUCTION ;    //slli    //64_changed
                        3'b101  : inst_encode_t = (imm_i[11:6] == 6'b000000 )? `YSYX_210428_SRLI :                                  //srli    //64_changed
                                                  (imm_i[11:6] == 6'b010000 )? `YSYX_210428_SRAI : `YSYX_210428_NO_INSTRUCTION ;    //srai    //64_changed
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                5'b01100 : begin
                     case(func3)
                        3'b000  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_ADD  :                                  //add
                                                  (imm_i[11:5] == 7'b0100000)? `YSYX_210428_SUB  : `YSYX_210428_NO_INSTRUCTION ;    //sub
                        3'b001  : inst_encode_t = (imm_i[11:6] == 6'b000000 )? `YSYX_210428_SLL  : `YSYX_210428_NO_INSTRUCTION ;    //sll    //64_changed
                        3'b010  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_SLT  : `YSYX_210428_NO_INSTRUCTION ;    //slt
                        3'b011  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_SLTU : `YSYX_210428_NO_INSTRUCTION ;    //sltu
                        3'b100  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_XOR  : `YSYX_210428_NO_INSTRUCTION ;    //xor
                        3'b101  : inst_encode_t = (imm_i[11:6] == 6'b000000 )? `YSYX_210428_SRL  :                                  //srl    //64_changed
                                                  (imm_i[11:6] == 6'b010000 )? `YSYX_210428_SRA  : `YSYX_210428_NO_INSTRUCTION ;    //sra    //64_changed
                        3'b110  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_OR   : `YSYX_210428_NO_INSTRUCTION ;    //or
                        3'b111  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_AND  : `YSYX_210428_NO_INSTRUCTION ;    //and
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                //RV64
                5'b00110 : begin
                    case(func3)
                        3'b000  : inst_encode_t = `YSYX_210428_ADDIW ;    //addiw
                        3'b001  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_SLLIW : `YSYX_210428_NO_INSTRUCTION ;    //slliw
                        3'b101  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_SRLIW :                                  //srliw
                                                  (imm_i[11:5] == 7'b0100000)? `YSYX_210428_SRAIW : `YSYX_210428_NO_INSTRUCTION ;    //sraiw
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                5'b01110 : begin
                    case(func3)
                        3'b000  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_ADDW :                                  //addw
                                                  (imm_i[11:5] == 7'b0100000)? `YSYX_210428_SUBW : `YSYX_210428_NO_INSTRUCTION ;    //subw
                        3'b001  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_SLLW : `YSYX_210428_NO_INSTRUCTION ;    //sllw
                        3'b101  : inst_encode_t = (imm_i[11:5] == 7'b0000000)? `YSYX_210428_SRLW :                                  //srlw
                                                  (imm_i[11:5] == 7'b0100000)? `YSYX_210428_SRAW : `YSYX_210428_NO_INSTRUCTION ;    //sraw
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                //csr
                5'b11100 : begin
                    case(func3)
                        3'b000  : inst_encode_t = (i_instruction[31:7] == 25'b0000_0000_0000_0000_0000_00000)? `YSYX_210428_ECALL  :                                  //ecall
                                                  (i_instruction[31:7] == 25'b0000_0000_0001_0000_0000_00000)? `YSYX_210428_EBREAK :                                  //ebreak
                                                  (i_instruction[31:7] == 25'b0011_0000_0010_0000_0000_00000)? `YSYX_210428_MRET   : `YSYX_210428_NO_INSTRUCTION ;    //mret
                        3'b001  : inst_encode_t = `YSYX_210428_CSRRW  ;    //csrrw
                        3'b010  : inst_encode_t = `YSYX_210428_CSRRS  ;    //csrrs
                        3'b011  : inst_encode_t = `YSYX_210428_CSRRC  ;    //csrrc
                        3'b101  : inst_encode_t = `YSYX_210428_CSRRWI ;    //csrrwi
                        3'b110  : inst_encode_t = `YSYX_210428_CSRRSI ;    //csrrsi
                        3'b111  : inst_encode_t = `YSYX_210428_CSRRCI ;    //csrrci
                        default : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
                    endcase
                end
                default  : inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
            endcase
        end
        else begin
            inst_encode_t = `YSYX_210428_NO_INSTRUCTION ;
        end
    end
    //register
    //w_rd_en
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_en <= 1'b0 ;
        end
        else if(i_pipeline_unlock) begin
            w_rd_en <= 1'b0 ;
        end
        else if(pipeline_pulse) begin
            w_rd_en <= w_rd_en ;
        end
        else begin
            w_rd_en <= w_rd_en_t ;
        end
    end
    //w_rd_addr
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_addr <= 5'd0 ;
        end
        else if(i_pipeline_unlock) begin
            w_rd_addr <= 5'd0 ;
        end
        else if(pipeline_pulse) begin
            w_rd_addr <= w_rd_addr ;
        end
        else begin
            w_rd_addr <= w_rd_addr_t ;
        end
    end
    //inst_op1
    always @(posedge i_clk) begin
        if(i_rst) begin
            inst_op1 <= 64'd0 ;
        end
        else if(i_pipeline_unlock) begin
            inst_op1 <= 64'd0 ;
        end
        else if(pipeline_pulse) begin
            inst_op1 <= inst_op1 ;
        end
        else begin
            inst_op1 <= inst_op1_t ;
        end
    end
    //inst_op2
    always @(posedge i_clk) begin
        if(i_rst) begin
            inst_op2 <= 64'd0 ;
        end
        else if(i_pipeline_unlock) begin
            inst_op2 <= 64'd0 ;
        end
        else if(pipeline_pulse) begin
            inst_op2 <= inst_op2 ;
        end
        else begin
            inst_op2 <= inst_op2_t ;
        end
    end
    //inst_op3
    always @(posedge i_clk) begin
        if(i_rst) begin
            inst_op3 <= 64'd0 ;
        end
        else if(i_pipeline_unlock) begin
            inst_op3 <= 64'd0 ;
        end
        else if(pipeline_pulse) begin
            inst_op3 <= inst_op3 ;
        end
        else begin
            inst_op3 <= inst_op3_t ;
        end
    end
    //inst_encode
    always @(posedge i_clk) begin
        if(i_rst) begin
            inst_encode <= 8'd0 ;
        end
        else if(i_pipeline_unlock) begin
            inst_encode <= 8'd0 ;
        end
        else if(pipeline_pulse) begin
            inst_encode <= inst_encode ;
        end
        else begin
            inst_encode <= inst_encode_t ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    //transfer
    assign o_pipeline_pulse = pipeline_pulse   ;
    assign o_trap_ecall     = trap_ecall       ;
    assign o_mret           = mret             ;
    assign o_jal_en         = jal_en           ;
    assign o_jalr_en        = jalr_en          ;
    assign o_branch_en      = branch_en        ;
    assign o_pcj_addr       = pcj_addr         ;

    assign o_r_rs1_en       = r_rs1_en         ;
    assign o_r_rs2_en       = r_rs2_en         ;
    assign o_w_csr_en       = w_csr_en         ;
    assign o_r_rs1_addr     = r_rs1_addr       ;
    assign o_r_rs2_addr     = r_rs2_addr       ;
    assign o_r_csr_addr     = r_csr_addr       ;
    assign o_w_csr_addr     = w_csr_addr       ;
    assign o_w_csr_data     = w_csr_data       ;
    //to_execute
    assign o_w_rd_en        = w_rd_en          ;
    assign o_w_rd_addr      = w_rd_addr        ;
    assign o_inst_op1       = inst_op1         ;
    assign o_inst_op2       = inst_op2         ;
    assign o_inst_op3       = inst_op3         ;
    assign o_inst_encode    = inst_encode      ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_exe
//engineer : yhz
//date : 2021.07.28
//----------------------------------------------------------------
module ysyx_210428_exe (
    input  wire        i_clk             ,
    input  wire        i_rst             ,
    input  wire        i_pipeline_unlock ,
    input  wire        i_pipeline_pulse  ,
    output wire        o_pipeline_pulse  ,
    //command
    input  wire [7:0]  i_inst_encode     ,
    input  wire [63:0] i_inst_op1        ,
    input  wire [63:0] i_inst_op2        ,
    input  wire [63:0] i_inst_op3        ,
    //transfer
    input  wire        i_w_rd_en         ,
    input  wire [4:0]  i_w_rd_addr       ,
    output wire [63:0] o_w_rd_data_t     ,
    //to_memory
    output wire        o_load_en         ,
    output wire        o_store_en        ,
    output wire [4:0]  o_load_cmd        ,
    output wire [63:0] o_store_data      ,
    output wire [63:0] o_store_mask      ,
    output wire        o_w_rd_en         ,
    output wire [4:0]  o_w_rd_addr       ,
    output wire [63:0] o_w_rd_data        
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    //transfer
    reg  [63:0] w_rd_data_t    ;
    reg  [4:0]  load_cmd_t     ;
    reg  [63:0] store_mask_t   ;
    //register
    reg         pipeline_pulse ;
    reg         load_en        ;
    reg         store_en       ;
    reg  [4:0]  load_cmd       ;
    reg  [63:0] store_data     ;
    reg  [63:0] store_mask     ;
    reg         w_rd_en        ;
    reg  [4:0]  w_rd_addr      ;
    reg  [63:0] w_rd_data      ;
    //64
    wire [31:0] slliw_data = i_inst_op1[31:0]          <<  i_inst_op2[4:0]  ;
    wire [31:0] srliw_data = i_inst_op1[31:0]          >>  i_inst_op2[4:0]  ;
    wire [31:0] sraiw_data = $signed(i_inst_op1[31:0]) >>> i_inst_op2[4:0]  ;
    wire [31:0] addw_data  = i_inst_op1[31:0]          +   i_inst_op2[31:0] ;
    wire [31:0] subw_data  = i_inst_op1[31:0]          -   i_inst_op2[31:0] ;
    wire [31:0] sllw_data  = i_inst_op1[31:0]          <<  i_inst_op2[4:0]  ;
    wire [31:0] srlw_data  = i_inst_op1[31:0]          >>  i_inst_op2[4:0]  ;
    wire [31:0] sraw_data  = $signed(i_inst_op1[31:0]) >>> i_inst_op2[4:0]  ;
    //transfer
    wire load_en_t  = (((i_inst_encode > 8'd10) && (i_inst_encode < 8'd16)) || 
                       ((i_inst_encode > 8'd40) && (i_inst_encode < 8'd43))) ? 1'b1 : 1'b0 ;
    wire store_en_t = (((i_inst_encode > 8'd15) && (i_inst_encode < 8'd19)) || 
                        (i_inst_encode == 8'd43)) ? 1'b1 : 1'b0 ;
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //transfer
    //w_rd_data_t
    always @(*) begin
        if(i_rst) begin
            w_rd_data_t = 64'd0 ;
        end
        else begin
            case(i_inst_encode)
                //jump
                `YSYX_210428_LUI : begin
                    w_rd_data_t = i_inst_op2 ;
                end
                `YSYX_210428_AUIPC : begin
                    w_rd_data_t = i_inst_op2 + i_inst_op3 ;
                end
                `YSYX_210428_JAL,`YSYX_210428_JALR    : begin
                    w_rd_data_t = i_inst_op3 + 64'd4 ;
                end
                //memory
                `YSYX_210428_LB,`YSYX_210428_LH,`YSYX_210428_LW,`YSYX_210428_LBU,`YSYX_210428_LHU,`YSYX_210428_LWU,`YSYX_210428_LD : begin
                    w_rd_data_t = i_inst_op1 + i_inst_op2 ;
                end
                `YSYX_210428_SB,`YSYX_210428_SH,`YSYX_210428_SW,`YSYX_210428_SD : begin
                    w_rd_data_t = i_inst_op1 + i_inst_op3 ;
                end
                //math
                `YSYX_210428_ADDI,`YSYX_210428_ADD : begin
                    w_rd_data_t = i_inst_op1 + i_inst_op2 ;
                end
                `YSYX_210428_ADDIW,`YSYX_210428_ADDW : begin    //64
                    w_rd_data_t = {{32{addw_data[31]}} , addw_data} ;
                end
                `YSYX_210428_SUB : begin
                    w_rd_data_t = i_inst_op1 - i_inst_op2 ;
                end
                `YSYX_210428_SUBW : begin    //64
                    w_rd_data_t = {{32{subw_data[31]}} , subw_data} ;
                end
                //logic
                `YSYX_210428_SLTI,`YSYX_210428_SLT : begin
                    case({i_inst_op1[63],i_inst_op2[63]})
                        2'b00 : w_rd_data_t = (i_inst_op1 < i_inst_op2)? 64'd1 : 64'd0 ;
                        2'b01 : w_rd_data_t = 64'd0 ;
                        2'b10 : w_rd_data_t = 64'd1 ;
                        2'b11 : w_rd_data_t = ((~i_inst_op1 + 64'd1) > (~i_inst_op2 + 64'd1))? 64'd1 : 64'd0 ;
                        default : w_rd_data_t = `YSYX_210428_NO_USE ;
                    endcase
                end
                `YSYX_210428_SLTIU,`YSYX_210428_SLTU : begin
                    w_rd_data_t = (i_inst_op1 < i_inst_op2)? 64'd1 : 64'd0 ;
                end
                `YSYX_210428_XORI,`YSYX_210428_XOR : begin
                    w_rd_data_t = i_inst_op1 ^ i_inst_op2 ;
                end
                `YSYX_210428_ORI,`YSYX_210428_OR : begin
                    w_rd_data_t = i_inst_op1 | i_inst_op2 ;
                end
                `YSYX_210428_ANDI,`YSYX_210428_AND : begin
                    w_rd_data_t = i_inst_op1 & i_inst_op2 ;
                end
                `YSYX_210428_SLLI,`YSYX_210428_SLL : begin    //64_changed
                    w_rd_data_t = i_inst_op1 << i_inst_op2[5:0] ;
                end
                `YSYX_210428_SLLIW : begin    //64
                    w_rd_data_t = {{32{slliw_data[31]}} , slliw_data} ;
                end
                `YSYX_210428_SLLW : begin    //64
                    w_rd_data_t = {{32{sllw_data[31]}} , sllw_data} ;
                end
                `YSYX_210428_SRLI,`YSYX_210428_SRL : begin    //64_changed
                    w_rd_data_t = i_inst_op1 >> i_inst_op2[5:0] ;
                end
                `YSYX_210428_SRLIW : begin    //64
                    w_rd_data_t = {{32{srliw_data[31]}} , srliw_data} ;
                end
                `YSYX_210428_SRLW : begin    //64
                    w_rd_data_t = {{32{srlw_data[31]}} , srlw_data} ;
                end
                `YSYX_210428_SRAI,`YSYX_210428_SRA : begin    //64_changed
                    w_rd_data_t = $signed(i_inst_op1) >>> i_inst_op2[5:0] ;
                end
                `YSYX_210428_SRAIW : begin    //64
                    w_rd_data_t = {{32{sraiw_data[31]}} , sraiw_data} ;
                end
                `YSYX_210428_SRAW : begin    //64
                    w_rd_data_t = {{32{sraw_data[31]}} , sraw_data} ;
                end
                //csr
                `YSYX_210428_CSRRW,`YSYX_210428_CSRRS,`YSYX_210428_CSRRC,`YSYX_210428_CSRRWI,`YSYX_210428_CSRRSI,`YSYX_210428_CSRRCI : begin
                    w_rd_data_t = i_inst_op2 ;
                end
                default : w_rd_data_t = 64'd0 ;
            endcase
        end
    end
    //load_cmd_t
    always @(*) begin
        if(i_rst) begin
            load_cmd_t = 5'd0 ;
        end
        else begin
            case(i_inst_encode)
                `YSYX_210428_LB  : load_cmd_t = 5'b00011 ;
                `YSYX_210428_LH  : load_cmd_t = 5'b00101 ;
                `YSYX_210428_LW  : load_cmd_t = 5'b01001 ;
                `YSYX_210428_LBU : load_cmd_t = 5'b00010 ;
                `YSYX_210428_LHU : load_cmd_t = 5'b00100 ;
                `YSYX_210428_LWU : load_cmd_t = 5'b01000 ;
                `YSYX_210428_LD  : load_cmd_t = 5'b10001 ;
                default : load_cmd_t = 5'd0 ;
            endcase
        end
    end
    //store_mask_t
    always @(*) begin
        if(i_rst) begin
            store_mask_t = 64'd0 ;
        end
        else begin
            case(i_inst_encode)
                `YSYX_210428_SB : store_mask_t = {56'd0 , 8'hff       } ;
                `YSYX_210428_SH : store_mask_t = {48'd0 , 16'hffff    } ;
                `YSYX_210428_SW : store_mask_t = {32'd0 , 32'hffffffff} ;
                `YSYX_210428_SD : store_mask_t = 64'hffffffffffffffff   ;
                default : store_mask_t = 64'd0 ;
            endcase
        end
    end
    //register
    //pipeline_pulse
    always @(posedge i_clk) begin
        if(i_rst) begin
            pipeline_pulse <= 1'b0 ;
        end
        else if(i_pipeline_unlock) begin
            pipeline_pulse <= 1'b0 ;
        end
        else begin
            pipeline_pulse <= i_pipeline_pulse ;
        end
    end
    //load_en
    always @(posedge i_clk) begin
        if(i_rst) begin
            load_en <= 1'b0 ;
        end
        else if(i_pipeline_unlock) begin
            load_en <= 1'b0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            load_en <= load_en ;
        end
        else begin
            load_en <= load_en_t ;
        end
    end
    //store_en
    always @(posedge i_clk) begin
        if(i_rst) begin
            store_en <= 1'b0 ;
        end
        else if(i_pipeline_unlock) begin
            store_en <= 1'b0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            store_en <= store_en ;
        end
        else begin
            store_en <= store_en_t ;
        end
    end
    //load_cmd
    always @(posedge i_clk) begin
        if(i_rst) begin
            load_cmd <= 5'd0 ;
        end
        else if(i_pipeline_unlock) begin
            load_cmd <= 5'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            load_cmd <= load_cmd ;
        end
        else begin
            load_cmd <= load_cmd_t ;
        end
    end
    //store_data
    always @(posedge i_clk) begin
        if(i_rst) begin
            store_data <= 64'd0 ;
        end
        else if(i_pipeline_unlock) begin
            store_data <= 64'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            store_data <= store_data ;
        end
        else begin
            store_data <= i_inst_op2 ;
        end
    end
    //store_mask
    always @(posedge i_clk) begin
        if(i_rst) begin
            store_mask <= 64'd0 ;
        end
        else if(i_pipeline_unlock) begin
            store_mask <= 64'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            store_mask <= store_mask ;
        end
        else begin
            store_mask <= store_mask_t ;
        end
    end
    //w_rd_en
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_en <= 1'b0 ;
        end
        else if(i_pipeline_unlock) begin
            w_rd_en <= 1'b0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            w_rd_en <= w_rd_en ;
        end
        else begin
            w_rd_en <= i_w_rd_en ;
        end
    end
    //w_rd_addr
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_addr <= 5'd0 ;
        end
        else if(i_pipeline_unlock) begin
            w_rd_addr <= 5'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            w_rd_addr <= w_rd_addr ;
        end
        else begin
            w_rd_addr <= i_w_rd_addr ;
        end
    end
    //w_rd_data
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_data <= 64'd0 ;
        end
        else if(i_pipeline_unlock) begin
            w_rd_data <= 64'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            w_rd_data <= w_rd_data ;
        end
        else begin
            w_rd_data <= w_rd_data_t ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    assign o_pipeline_pulse = pipeline_pulse ;
    assign o_w_rd_data_t    = w_rd_data_t    ;
    assign o_load_en        = load_en        ;
    assign o_store_en       = store_en       ;
    assign o_load_cmd       = load_cmd       ;
    assign o_store_data     = store_data     ;
    assign o_store_mask     = store_mask     ;
    assign o_w_rd_en        = w_rd_en        ;
    assign o_w_rd_addr      = w_rd_addr      ;
    assign o_w_rd_data      = w_rd_data      ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_mem
//engineer : yhz
//date : 2021.07.28
//----------------------------------------------------------------
module ysyx_210428_mem (
    input  wire        i_clk             ,
    input  wire        i_rst             ,
    input  wire        i_pipeline_pulse  ,
    output wire        o_pipeline_unlock ,
    output wire        o_pipeline_pulse  ,
    //command
    input  wire        i_load_en         ,
    input  wire        i_store_en        ,
    input  wire [4:0]  i_load_cmd        ,
    input  wire [63:0] i_store_data      ,
    input  wire [63:0] i_store_mask      ,
    //transfer
    input  wire        i_w_rd_en         ,
    input  wire [4:0]  i_w_rd_addr       ,
    input  wire [63:0] i_w_rd_data       ,
    output wire [63:0] o_w_rd_data_t     ,
    //to_write_back
    output wire        o_w_rd_en         ,
    output wire [4:0]  o_w_rd_addr       ,
    output wire [63:0] o_w_rd_data       ,
    //clint
    output wire        o_w_mtime_en      ,
    output wire        o_r_mtime_en      ,
    output wire        o_w_mtimecmp_en   ,
    output wire        o_r_mtimecmp_en   ,
    input  wire [63:0] i_r_clint_data    ,
    //to_AXI
    input  wire        i_w_ram_ready     ,
    output wire        o_w_ram_valid     ,
    output wire [31:0] o_w_ram_addr      ,
    output wire [63:0] o_w_ram_data      ,
    output wire [63:0] o_w_ram_mask      ,
    input  wire        i_r_ram_ready     ,
    output wire        o_r_ram_valid     ,
    output wire [31:0] o_r_ram_addr      ,
    input  wire [63:0] i_r_ram_data       
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    reg         pipeline_pulse ;
    reg  [63:0] w_rd_data_t    ;
    reg         w_rd_en        ;
    reg  [4:0]  w_rd_addr      ;
    reg  [63:0] w_rd_data      ;
    wire [63:0] w_ram_addr        = i_store_en ? i_w_rd_data : 64'd0                               ;
    wire [63:0] r_ram_addr        = i_load_en  ? i_w_rd_data : 64'd0                               ;
    wire [5:0]  store_shift       = {3'b0 , w_ram_addr[2:0]} << 3                                  ;
    wire [5:0]  load_shift        = {3'b0 , r_ram_addr[2:0]} << 3                                  ;
    wire [63:0] w_ram_data        = i_store_en ? (i_store_data << store_shift) : 64'd0             ;
    wire [63:0] w_ram_mask        = i_store_en ? (i_store_mask << store_shift) : 64'd0             ;
    wire        w_mtime_en        = i_store_en && (w_ram_addr == `YSYX_210428_MTIME_ADDR   )                   ;
    wire        r_mtime_en        = i_load_en  && (r_ram_addr == `YSYX_210428_MTIME_ADDR   )                   ;
    wire        w_mtimecmp_en     = i_store_en && (w_ram_addr == `YSYX_210428_MTIMECMP_ADDR)                   ;
    wire        r_mtimecmp_en     = i_load_en  && (r_ram_addr == `YSYX_210428_MTIMECMP_ADDR)                   ;
    wire        w_ram_valid       = i_store_en ? (w_mtime_en | w_mtimecmp_en) ? 1'b0 : 1'b1 : 1'b0 ;
    wire        r_ram_valid       = i_load_en  ? (r_mtime_en | r_mtimecmp_en) ? 1'b0 : 1'b1 : 1'b0 ;
   
    wire [63:0] r_ram_data        = (r_mtime_en | r_mtimecmp_en) ? (i_r_clint_data >> load_shift) : (i_r_ram_data >> load_shift)  ;
    wire        hand_shake_flag_w = (w_mtime_en | w_mtimecmp_en) ? 1'b1                           : (w_ram_valid & i_w_ram_ready) ;
    wire        hand_shake_flag_r = (r_mtime_en | r_mtimecmp_en) ? 1'b1                           : (r_ram_valid & i_r_ram_ready) ;
    wire        pipeline_unlock   = hand_shake_flag_w | hand_shake_flag_r ;
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //w_rd_data_t
    always @(*) begin
        if(i_rst) begin
            w_rd_data_t = 64'd0 ;
        end
        else if(i_load_en) begin
            case(i_load_cmd)
                5'b00011 : w_rd_data_t = {{56{r_ram_data[7]}} ,r_ram_data[7:0] } ;
                5'b00101 : w_rd_data_t = {{48{r_ram_data[15]}},r_ram_data[15:0]} ;
                5'b01001 : w_rd_data_t = {{32{r_ram_data[31]}},r_ram_data[31:0]} ;
                5'b00010 : w_rd_data_t = {56'd0,r_ram_data[7:0] } ;
                5'b00100 : w_rd_data_t = {48'd0,r_ram_data[15:0]} ;
                5'b01000 : w_rd_data_t = {32'd0,r_ram_data[31:0]} ;
                5'b10001 : w_rd_data_t = r_ram_data ;
                default  : w_rd_data_t = 64'd0 ;
            endcase
        end
        else begin
            w_rd_data_t = i_w_rd_data ;
        end
    end
    //pipeline_pulse
    always @(posedge i_clk) begin
        if(i_rst) begin
            pipeline_pulse <= 1'b0 ;
        end
        else if(pipeline_unlock) begin
            pipeline_pulse <= 1'b0 ;
        end
        else begin
            pipeline_pulse <= i_pipeline_pulse ;
        end
    end
    //w_rd_en
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_en <= 1'b0 ;
        end
        else if(pipeline_pulse & (!pipeline_unlock)) begin
            w_rd_en <= w_rd_en ;
        end
        else begin
            w_rd_en <= i_w_rd_en ;
        end
    end
    //w_rd_addr
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_addr <= 5'd0 ;
        end
        else if(pipeline_pulse & (!pipeline_unlock)) begin
            w_rd_addr <= w_rd_addr ;
        end
        else begin
            w_rd_addr <= i_w_rd_addr ;
        end
    end
    //w_rd_data
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_data <= 64'd0 ;
        end
        else if(pipeline_pulse & (!pipeline_unlock)) begin
            w_rd_data <= w_rd_data ;
        end
        else begin
            w_rd_data <= w_rd_data_t ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    //transfer
    assign o_pipeline_unlock = pipeline_unlock  ;
    assign o_pipeline_pulse  = pipeline_pulse   ;
    assign o_w_rd_data_t     = w_rd_data_t      ;
    //rd
    assign o_w_rd_en         = w_rd_en          ;
    assign o_w_rd_addr       = w_rd_addr        ;
    assign o_w_rd_data       = w_rd_data        ;
    //clint
    assign o_w_mtime_en      = w_mtime_en       ;
    assign o_r_mtime_en      = r_mtime_en       ;
    assign o_w_mtimecmp_en   = w_mtimecmp_en    ;
    assign o_r_mtimecmp_en   = r_mtimecmp_en    ;
    //ram
    assign o_w_ram_valid     = w_ram_valid      ;
    assign o_w_ram_addr      = w_ram_addr[31:0] ;
    assign o_w_ram_data      = w_ram_data       ;
    assign o_w_ram_mask      = w_ram_mask       ;
    assign o_r_ram_valid     = r_ram_valid      ;
    assign o_r_ram_addr      = r_ram_addr[31:0] ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_wb
//engineer : yhz
//date : 2021.07.28
//----------------------------------------------------------------
module ysyx_210428_wb (
    input  wire        i_clk             ,
    input  wire        i_rst             ,
    input  wire        i_pipeline_unlock ,
    input  wire        i_pipeline_pulse  ,
    //transfer
    input  wire        i_w_rd_en         ,
    input  wire [4:0]  i_w_rd_addr       ,
    input  wire [63:0] i_w_rd_data       ,
    //to_common_register
    output wire        o_w_rd_en         ,
    output wire [4:0]  o_w_rd_addr       ,
    output wire [63:0] o_w_rd_data        
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    reg        pipeline_pulse ;
    reg        w_rd_en        ;
    reg [4:0]  w_rd_addr      ;
    reg [63:0] w_rd_data      ;
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //pipeline_pulse
    always @(posedge i_clk) begin
        if(i_rst) begin
            pipeline_pulse <= 1'b0 ;
        end
        else if(i_pipeline_unlock) begin
            pipeline_pulse <= 1'b0 ;
        end
        else begin
            pipeline_pulse <= i_pipeline_pulse ;
        end
    end
    //w_rd_en
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_en <= 1'b0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            w_rd_en <= w_rd_en ;
        end
        else begin
            w_rd_en <= i_w_rd_en ;
        end
    end
    //w_rd_addr
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_addr <= 5'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            w_rd_addr <= w_rd_addr ;
        end
        else begin
            w_rd_addr <= i_w_rd_addr ;
        end
    end
    //w_rd_data
    always @(posedge i_clk) begin
        if(i_rst) begin
            w_rd_data <= 64'd0 ;
        end
        else if(pipeline_pulse & (!i_pipeline_unlock)) begin
            w_rd_data <= w_rd_data ;
        end
        else begin
            w_rd_data <= i_w_rd_data ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    assign o_w_rd_en    = w_rd_en    ;
    assign o_w_rd_addr  = w_rd_addr  ;
    assign o_w_rd_data  = w_rd_data  ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_cr
//engineer : yhz
//date : 2021.07.27
//----------------------------------------------------------------
module ysyx_210428_cr (
    input  wire        i_clk                 ,
    input  wire        i_rst                 ,
    //rd
    input  wire        i_w_rd_en             ,
    input  wire [4:0]  i_w_rd_addr           ,
    input  wire [63:0] i_w_rd_data           ,
    //rs
    input  wire        i_r_rs1_en            ,
    input  wire        i_r_rs2_en            ,
    input  wire [4:0]  i_r_rs1_addr          ,
    input  wire [4:0]  i_r_rs2_addr          ,
    output wire [63:0] o_r_rs1_data          ,
    output wire [63:0] o_r_rs2_data           
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    reg [63:0] common_register [31:0] ;
    reg [63:0] rs1_data               ;
    reg [63:0] rs2_data               ;
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //common_register
    always @(posedge i_clk) begin
        if(i_rst) begin
            common_register[0]  <= 64'd0 ;
            common_register[1]  <= 64'd0 ;
            common_register[2]  <= 64'd0 ;
            common_register[3]  <= 64'd0 ;
            common_register[4]  <= 64'd0 ;
            common_register[5]  <= 64'd0 ;
            common_register[6]  <= 64'd0 ;
            common_register[7]  <= 64'd0 ;
            common_register[8]  <= 64'd0 ;
            common_register[9]  <= 64'd0 ;
            common_register[10] <= 64'd0 ;
            common_register[11] <= 64'd0 ;
            common_register[12] <= 64'd0 ;
            common_register[13] <= 64'd0 ;
            common_register[14] <= 64'd0 ;
            common_register[15] <= 64'd0 ;
            common_register[16] <= 64'd0 ;
            common_register[17] <= 64'd0 ;
            common_register[18] <= 64'd0 ;
            common_register[19] <= 64'd0 ;
            common_register[20] <= 64'd0 ;
            common_register[21] <= 64'd0 ;
            common_register[22] <= 64'd0 ;
            common_register[23] <= 64'd0 ;
            common_register[24] <= 64'd0 ;
            common_register[25] <= 64'd0 ;
            common_register[26] <= 64'd0 ;
            common_register[27] <= 64'd0 ;
            common_register[28] <= 64'd0 ;
            common_register[29] <= 64'd0 ;
            common_register[30] <= 64'd0 ;
            common_register[31] <= 64'd0 ;
        end
        else if(i_w_rd_en && (i_w_rd_addr != 5'd0)) begin
            common_register[i_w_rd_addr] <= i_w_rd_data ;
        end
        else begin
            common_register[0]  <= common_register[0]  ;
            common_register[1]  <= common_register[1]  ;
            common_register[2]  <= common_register[2]  ;
            common_register[3]  <= common_register[3]  ;
            common_register[4]  <= common_register[4]  ;
            common_register[5]  <= common_register[5]  ;
            common_register[6]  <= common_register[6]  ;
            common_register[7]  <= common_register[7]  ;
            common_register[8]  <= common_register[8]  ;
            common_register[9]  <= common_register[9]  ;
            common_register[10] <= common_register[10] ;
            common_register[11] <= common_register[11] ;
            common_register[12] <= common_register[12] ;
            common_register[13] <= common_register[13] ;
            common_register[14] <= common_register[14] ;
            common_register[15] <= common_register[15] ;
            common_register[16] <= common_register[16] ;
            common_register[17] <= common_register[17] ;
            common_register[18] <= common_register[18] ;
            common_register[19] <= common_register[19] ;
            common_register[20] <= common_register[20] ;
            common_register[21] <= common_register[21] ;
            common_register[22] <= common_register[22] ;
            common_register[23] <= common_register[23] ;
            common_register[24] <= common_register[24] ;
            common_register[25] <= common_register[25] ;
            common_register[26] <= common_register[26] ;
            common_register[27] <= common_register[27] ;
            common_register[28] <= common_register[28] ;
            common_register[29] <= common_register[29] ;
            common_register[30] <= common_register[30] ;
            common_register[31] <= common_register[31] ;
        end
    end
    //rs1_data
    always @(*) begin
        if(i_rst) begin
            rs1_data = 64'd0 ;
        end
        else if(i_r_rs1_en) begin
            rs1_data = common_register[i_r_rs1_addr] ;
        end
        else begin
            rs1_data = 64'd0 ;
        end
    end
    //rs2_data
    always @(*) begin
        if(i_rst) begin
            rs2_data = 64'd0 ;
        end
        else if(i_r_rs2_en) begin
            rs2_data = common_register[i_r_rs2_addr] ;
        end
        else begin
            rs2_data = 64'd0 ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    assign o_r_rs1_data = rs1_data ;
    assign o_r_rs2_data = rs2_data ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
//----------------------------------------------------------------
//name : ysyx_210428_csr
//engineer : yhz
//date : 2021.09.15
//----------------------------------------------------------------
module ysyx_210428_csr (
    input  wire        i_clk             ,
    input  wire        i_rst             ,
    input  wire        i_hand_shake_flag ,
    //trap
    input  wire        i_trap_ecall      ,
    output wire        o_trap_timer      ,
    output wire        o_trap            ,
    input  wire        i_mret            ,
    input  wire [63:0] i_pc_addr         ,
    output wire [63:0] o_mtvec_addr      ,
    output wire [63:0] o_mepc_addr       ,
    //clint
    input  wire        i_w_mtime_en      ,
    input  wire        i_r_mtime_en      ,
    input  wire        i_w_mtimecmp_en   ,
    input  wire        i_r_mtimecmp_en   ,
    input  wire [63:0] i_w_clint_data    ,
    output wire [63:0] o_r_clint_data    ,
    //write
    input  wire        i_w_csr_en        ,
    input  wire [11:0] i_w_csr_addr      ,
    input  wire [63:0] i_w_csr_data      ,
    //read
    input  wire [11:0] i_r_csr_addr      ,
    output wire [63:0] o_r_csr_data       
);
//----------------------------------------------------------------
//register & wire
//----------------------------------------------------------------
    //ecall
    reg  [63:0] mstatus    ;
    reg  [63:0] mtvec      ;
    reg  [63:0] mepc       ;
    reg  [63:0] mcause     ;
    //timer
    reg  [63:0] mip        ;
    reg  [63:0] mie        ;
    reg  [63:0] mcycle     ;
    reg  [63:0] mtime      ;
    reg  [63:0] mtimecmp   ;
    //rtt
    reg  [63:0] mscratch   ;

    reg         trap_timer ;
    reg  [63:0] r_csr_data ;
    wire        trap            = i_trap_ecall | trap_timer                                 ;
    wire        timer_trap_en   = mstatus[3] & mie[7]                                       ;
    wire [63:0] r_clint_data    = i_r_mtime_en ? mtime : i_r_mtimecmp_en ? mtimecmp : 64'd0 ;
    wire [63:0] mtvec_addr      = trap         ? mtvec : 64'd0                              ;
    wire [63:0] mepc_addr       = i_mret       ? mepc  : 64'd0                              ;
    wire        trap_timer_flag = trap_timer   & i_hand_shake_flag                          ;
    wire        trap_flag       = i_trap_ecall | trap_timer_flag                            ; 
//----------------------------------------------------------------
//logic
//----------------------------------------------------------------
    //trap_timer
    always @(posedge i_clk) begin
        if(i_rst) begin
            trap_timer <= 1'b0 ;
        end
        else if(timer_trap_en & (mtime == mtimecmp)) begin
            trap_timer <= 1'b1 ;
        end
        else if(i_hand_shake_flag) begin
            trap_timer <= 1'b0 ;
        end
        else begin
            trap_timer <= trap_timer ;
        end
    end
    //mstatus
    always @(posedge i_clk) begin
        if(i_rst) begin
            mstatus <= {1'b0 , 50'd0 , 2'b11 , 11'd0} ;
        end
        else if(i_mret) begin
            mstatus[3]     <= mstatus[7] ;
            mstatus[7]     <= 1'b1       ;
            mstatus[12:11] <= 2'b00      ;
        end
        else if(trap_flag) begin
            mstatus[7]     <= mstatus[3] ;
            mstatus[3]     <= 1'b0       ;
            mstatus[12:11] <= 2'b11      ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h300)) begin
            mstatus <= {i_w_csr_data[13] & i_w_csr_data[14] , i_w_csr_data[62:0]} ;
        end
        else begin
            mstatus <= mstatus ;
        end
    end
    //mtvec
    always @(posedge i_clk) begin
        if(i_rst) begin
            mtvec <= 64'd0 ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h305)) begin
            mtvec <= {i_w_csr_data[63:2] , mtvec[1:0]} ;
        end
        else begin
            mtvec <= mtvec ;
        end
    end
    //mepc
    always @(posedge i_clk) begin
        if(i_rst) begin
            mepc <= 64'd0 ;
        end
        else if(trap_flag) begin
            mepc <= i_pc_addr ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h341)) begin
            mepc <= i_w_csr_data ;
        end
        else begin
            mepc <= mepc ;
        end
    end
    //mcause
    always @(posedge i_clk) begin
        if(i_rst) begin
            mcause <= 64'd0 ;
        end
        else if(i_trap_ecall) begin
            mcause <= 64'h00000000_0000000b ;
        end
        else if(trap_timer_flag) begin
            mcause <= 64'h80000000_00000007 ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h342)) begin
            mcause <= i_w_csr_data ;
        end
        else begin
            mcause <= mcause ;
        end
    end
    //mip
    always @(posedge i_clk) begin
        if(i_rst) begin
            mip <= 64'd0 ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h344)) begin
            mip <= i_w_csr_data ;
        end
        else begin
            mip <= mip ;
        end
    end
    //mie
    always @(posedge i_clk) begin
        if(i_rst) begin
            mie <= 64'd0 ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h304)) begin
            mie <= i_w_csr_data ;
        end
        else begin
            mie <= mie ;
        end
    end
    //mcycle
    always @(posedge i_clk) begin
        if(i_rst) begin
            mcycle <= 64'd0 ;
        end
        else begin
            mcycle <= mcycle + 1'b1 ;
        end
    end
    //mtime
    always @(posedge i_clk) begin
        if(i_rst) begin
            mtime <= 64'd0 ;
        end
        else if(i_w_mtime_en) begin
            mtime <= i_w_clint_data ;
        end
        else if(timer_trap_en) begin
            mtime <= mtime + 1'b1 ;
        end
        else begin
            mtime <= mtime ;
        end
    end
    //mtimecmp
    always @(posedge i_clk) begin
        if(i_rst) begin
            mtimecmp <= 64'd0 ;
        end
        else if(i_w_mtimecmp_en) begin
            mtimecmp <= i_w_clint_data ;
        end
        else begin
            mtimecmp <= mtimecmp ;
        end
    end
    //mscratch
    always @(posedge i_clk) begin
        if(i_rst) begin
            mscratch <= 64'd0 ;
        end
        else if(i_w_csr_en && (i_w_csr_addr == 12'h340)) begin
            mscratch <= i_w_csr_data ;
        end
        else begin
            mscratch <= mscratch ;
        end
    end
    //rs1_data
    always @(*) begin
        if(i_rst) begin
            r_csr_data = 64'd0 ;
        end
        else if(i_w_csr_en) begin
            case(i_r_csr_addr)
                12'h300 : r_csr_data = mstatus  ;
                12'h304 : r_csr_data = mie      ;
                12'h305 : r_csr_data = mtvec    ;
                12'h340 : r_csr_data = mscratch ;
                12'h341 : r_csr_data = mepc     ;
                12'h342 : r_csr_data = mcause   ;
                12'h344 : r_csr_data = mip      ;
                12'hb00 : r_csr_data = mcycle   ;
                default : r_csr_data = 64'd0    ;
            endcase
        end
        else begin
            r_csr_data = 64'd0 ;
        end
    end
//----------------------------------------------------------------
//output
//----------------------------------------------------------------
    assign o_r_csr_data   = r_csr_data   ;
    assign o_r_clint_data = r_clint_data ;
    assign o_mtvec_addr   = mtvec_addr   ;
    assign o_mepc_addr    = mepc_addr    ;
    assign o_trap         = trap         ;
    assign o_trap_timer   = trap_timer   ;
//----------------------------------------------------------------
endmodule
//----------------------------------------------------------------
