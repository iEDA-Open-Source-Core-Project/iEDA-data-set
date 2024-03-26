`define SEG_NUM     6
`define OTHER       0
`define RAM         1
`define FLASH_0     2
`define FLASH_1     3
`define FLASH_2     4
`define UART        5
`define SPI         6
`define BR_BUS_WD       33
`define PS_TO_FS_BUS_WD 35
`define FS_TO_DS_BUS_WD 104
`define DS_TO_ES_BUS_WD 284
`define ES_TO_RS_BUS_WD 538
`define RS_TO_MS_BUS_WD 115
`define MS_TO_WS_BUS_WD 106
`define WS_TO_RF_BUS_WD 41
`define EX_INT  0
`define EX_MOD  1
`define EX_TLBL 2
`define EX_TLBS 3
`define EX_ADEL 4
`define EX_ADES 5
`define EX_SYS  8
`define EX_BP   9
`define EX_RI   10
`define EX_OV   12
`define TLBNUM  16
`define ICACHELINE 3'h2
`define ICACHECONN 3'h1
`define DCACHELINE 3'h2
`define DCACHECONN 3'h1
`define USE_DCACHE 1
//`define USE_TLB 0

//================================================================================================================================//
module ysyx_210101(
    input          io_interrupt,
    input          clock,
    input          reset,

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
    
    // not used
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
    output [3:0]   io_slave_rid
);

assign io_slave_awready = 0;
assign io_slave_wready  = 0;
assign io_slave_bvalid  = 0;
assign io_slave_bresp   = 2'b0;
assign io_slave_bid     = 4'b0;
assign io_slave_arready = 0;
assign io_slave_rvalid  = 0;
assign io_slave_rresp   = 2'b0;
assign io_slave_rdata   = 64'b0;
assign io_slave_rlast   = 0;
assign io_slave_rid     = 4'b0;


wire        data_sram_req;
wire        data_sram_wr;
wire [ 1:0] data_sram_size;
wire [ 3:0] data_sram_wstrb;
wire [31:0] data_sram_addr;
wire [31:0] data_sram_wdata;
wire        data_sram_addr_ok;
wire        data_sram_data_ok;
wire [31:0] data_sram_rdata;
wire [31:0] inst_sram_wdata;
wire        inst_sram_addr_ok;
wire        inst_sram_data_ok;
wire [31:0] inst_sram_rdata;
wire        inst_sram_req;
wire        inst_sram_wr;
wire [ 1:0] inst_sram_size;
wire [ 3:0] inst_sram_wstrb;
wire [31:0] inst_sram_addr;
wire        data_cache;
wire        clk = clock;

wire         fs_allowin;
wire         ds_allowin;
wire         es_allowin;
wire         rs_allowin;
wire         ms_allowin;
wire         ws_allowin;
wire         ps_to_fs_valid;
wire         fs_to_ds_valid;
wire         ds_to_es_valid;
wire         es_to_rs_valid;
wire         rs_to_ms_valid;
wire         ms_to_ws_valid;
wire [`PS_TO_FS_BUS_WD -1:0] ps_to_fs_bus;
wire [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus;
wire [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus;
wire [`ES_TO_RS_BUS_WD -1:0] es_to_rs_bus;
wire [`RS_TO_MS_BUS_WD -1:0] rs_to_ms_bus;
wire [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus;
wire [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus;
wire [`BR_BUS_WD       -1:0] br_bus;
wire [45:0] es_reg; 
wire [45:0] rs_reg; 
wire [42:0] ms_reg;
wire [40:0] ws_reg;

wire          handle_exc;
wire          handle_eret;
wire [31:0]   cp0_epc;
wire          has_int;
wire          br_leaving;
wire          es_loading;
wire          rs_loading;
wire          ms_loading;

wire [18:0]   s0_vpn2;
wire          s0_odd_page;
wire          s0_found;
wire [ 3:0]   s0_index;
wire [19:0]   s0_pfn;
wire [ 2:0]   s0_c;
wire          s0_d;
wire          s0_v;
wire [18:0]   s1_vpn2;
wire          s1_odd_page;
wire          s1_found;
wire [ 3:0]   s1_index;
wire [19:0]   s1_pfn;
wire [ 2:0]   s1_c;
wire          s1_d;
wire          s1_v;
wire          ds_tlbwir_cancel;
wire [31:0]   cp0_entryhi;
wire [31:0]   pipe_flush_pc;
wire          pipe_flush;
wire          exception_tlb_refill;

wire [18:0] r_vpn2;
wire [ 7:0] r_asid;
wire        r_g;
wire [19:0] r_pfn0;
wire [ 2:0] r_c0;
wire        r_d0;
wire        r_v0;
wire [19:0] r_pfn1;
wire [ 2:0] r_c1;
wire        r_d1;
wire        r_v1;

wire rs_bd;
wire [ 4:0] rs_exccode;
wire [31:0] rs_badvaddr;
wire mtc0_we;
wire [ 7:0] es_c0_addr;
wire [31:0] es_pc;
wire [31:0] rs_pc;
wire [31:0] mtc0_data;
wire [31:0] mfc0_rdata;

wire [31:0] cp0_entrylo0;
wire [31:0] cp0_entrylo1;
wire [31:0] cp0_index;
wire [31:0] cp0_random;
wire pre_branch;
wire inst_cache;
wire es_tlbp;
wire es_tlbr;
wire es_tlbwi;
wire es_tlbwr;
wire es_tlbwir_cancel;
wire fs_error;
wire fs_pc_error;
wire rs_ex_tlb;

wire ds_br;
wire ds_br_taken;
wire [31:0] inst;
wire [31:0] pc;
wire [31:0] ds_pc;
wire        valid;
wire        jr_we;
wire [31:0] jr_realtarget;
wire        taken;
wire [31:0] pc_predict;
wire no_predict;
ysyx_210101_branch_predictor ysyx_210101_branch_predictor(
	.clk           (clk          ),
	.reset         (reset        ),
	.inst          (inst         ),
	.pc            (pc           ),
    .ds_pc         (ds_pc        ),
    .valid         (valid && !no_predict),//&& !no_predict
	.jr_we         (jr_we        ),
	.jr_realtarget (jr_realtarget),
    .ds_br         (ds_br        ),
    .ds_br_taken   (ds_br_taken  ),
	.taken         (taken        ),
	.pc_predict    (pc_predict   ),
    .pre_branch    (pre_branch   )
);

/*PC_Read pc_Read (
    .clock(clk),
    .rst(reset),
    .pc(pc)
);*/


// PF stage
wire refresh_tlb_cache;
assign refresh_tlb_cache = handle_exc | handle_eret | pipe_flush;
ysyx_210101_pf_stage ysyx_210101_pf_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //IF-ID Bus
    .fs_allowin     (fs_allowin     ),
    .ps_to_fs_valid (ps_to_fs_valid ),
    .ps_to_fs_bus   (ps_to_fs_bus   ),
    .br_bus         (br_bus         ),
    .br_leaving     (br_leaving     ),
    // IF-WB Bus
    .handle_exc     (handle_exc     ),
    .handle_eret    (handle_eret    ),
    .cp0_epc        (cp0_epc        ),
`ifdef USE_TLB
    .refresh_tlb_cache (refresh_tlb_cache),
    .ds_tlbwir_cancel(1'b0),
    .pipe_flush_pc  (pipe_flush_pc  ),
    .pipe_flush     (1'b0     ),
    .exception_tlb_refill(exception_tlb_refill),
`else
    .refresh_tlb_cache (1'b0),
    .ds_tlbwir_cancel(1'b0),
    .pipe_flush_pc  (32'd0  ),
    .pipe_flush     (1'b0     ),
    .exception_tlb_refill(1'b0),
`endif
    // Inst-sram interface
    .inst_sram_req    (inst_sram_req    ),
    .inst_sram_wr     (inst_sram_wr     ),
    .inst_sram_size   (inst_sram_size   ),
    .inst_sram_addr   (inst_sram_addr   ),
    .inst_sram_addr_ok(inst_sram_addr_ok),
    .inst_cache       (inst_cache),
    
    .s0_vpn2        (s0_vpn2),
    .s0_odd_page    (s0_odd_page),
    .s0_found       (s0_found),
    .s0_index       (s0_index),
    .s0_pfn         (s0_pfn),
    .s0_c           (s0_c),
    .s0_d           (s0_d),
    .s0_v           (s0_v),
	
    .fs_error (fs_error),
	.taken         (taken        ),
	.pc_predict    (pc_predict   ),
    .pre_branch    (pre_branch   )
);

// IF stage
ysyx_210101_if_stage ysyx_210101_if_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //IF-ID Bus
    .ds_allowin     (ds_allowin     ),
    .fs_allowin     (fs_allowin     ),
    .ps_to_fs_valid (ps_to_fs_valid ),
    .ps_to_fs_bus   (ps_to_fs_bus   ),
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),

    // IF-WB Bus
    .handle_exc     (handle_exc     ),
    .handle_eret    (handle_eret    ),
`ifdef USE_TLB
    .pipe_flush     (1'b0     ),
    .refresh_tlb_cache (refresh_tlb_cache),
    .ds_tlbwir_cancel(ds_tlbwir_cancel),
`else
    .pipe_flush     (1'b0     ),
    .refresh_tlb_cache (1'b0 ),
    .ds_tlbwir_cancel(1'b0 ),
`endif
    .has_int        (has_int        ),
    // Inst-sram interface
    .inst_sram_data_ok(inst_sram_data_ok),
    .inst_sram_rdata  (inst_sram_rdata  ),
    
    .fs_pc_error(fs_pc_error | fs_error),
	.inst          (inst         ),
	.pc            (pc           ),
    .valid         (valid        )
);
assign inst_sram_wdata = 32'b0;
assign inst_sram_wstrb = 4'b0;

wire icache_stall;
// ID stage
ysyx_210101_id_stage ysyx_210101_id_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    .icache_stall   (icache_stall),
    //allowin
    .es_allowin     (es_allowin     ),
    .ds_allowin     (ds_allowin     ),
    //from fs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    //forward_bus
    .es_reg         (es_reg         ),
    .rs_reg         (rs_reg         ),
    .ms_reg         (ms_reg         ),
    .ws_reg         (ws_reg         ),
    .ms_loading     (ms_loading     ),
    //to es
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   ), 
    .handle_exc     (handle_exc     ),
    .handle_eret    (handle_eret    ),
    .ds_tlbwir_cancel(ds_tlbwir_cancel),	
`ifdef USE_TLB
    .pipe_flush     (pipe_flush     ),
    .es_tlbwir_cancel(1'b0)
`else
    .pipe_flush     (1'b0 ),
    .es_tlbwir_cancel(1'b0)
`endif
);

// EXE stage
ysyx_210101_exe_stage ysyx_210101_exe_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .rs_allowin     (rs_allowin     ),
    .es_allowin     (es_allowin     ),
    //from ds
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to rs
    .es_to_rs_valid (es_to_rs_valid ),
    .es_to_rs_bus   (es_to_rs_bus   ),

    //forward_bus
    .es_reg         (es_reg         ),

    .s1_vpn2          (s1_vpn2),
    .s1_odd_page      (s1_odd_page),
    .s1_found         (s1_found),
    .s1_index         (s1_index),
    .s1_pfn           (s1_pfn),
    .s1_c             (s1_c),
    .s1_d             (s1_d),
    .s1_v             (s1_v),

	.handle_eret      (handle_eret         ),
	.handle_exc       (handle_exc          ),
`ifdef USE_TLB	
	.pipe_flush       (pipe_flush          ),
`else
	.pipe_flush       (1'b0          ),
`endif
	
	.cp0_entryhi    (cp0_entryhi    ),
	.mtc0_we         (mtc0_we    ),
	.es_c0_addr      (es_c0_addr ),
	.pipe_flush_pc           (pipe_flush_pc      ),
	.mtc0_data       (mtc0_data  ),
	.mfc0_rdata      (mfc0_rdata ),
	.refresh_tlb_cache (refresh_tlb_cache),
	.es_tlbp         (es_tlbp    ),
	.es_tlbr         (es_tlbr    ),
	.es_tlbwi        (es_tlbwi  ),
	.es_tlbwr        (es_tlbwr  ),
    .es_tlbwir_cancel(es_tlbwir_cancel),
    //to fs
    .br_bus         (br_bus         ),
    .br_leaving     (br_leaving     ),
    .ds_br          (ds_br          ),
    .ds_br_taken    (ds_br_taken    ),  
	.jr_we         (jr_we        ),
    .es_pc         (ds_pc        ),
	.jr_realtarget (jr_realtarget),
    .no_predict    (no_predict   )
);

wire dcache_op_req;
wire icache_op_req;
wire [ 4:0] cache_op;
wire [31:0] cache_op_addr;
wire [21:0] cache_op_wdata;
wire        icache_op_addr_ok;
wire        dcache_op_addr_ok;
wire        icache_op_data_ok;
wire        dcache_op_data_ok;
assign      icache_op_data_ok = 0;
assign      dcache_op_data_ok = 0;

// MEM_REQ stage
ysyx_210101_mem_req_stage ysyx_210101_mem_req_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ms_allowin     (ms_allowin     ),
    .rs_allowin     (rs_allowin     ),
    //from ds
    .rs_to_ms_valid (rs_to_ms_valid ),
    .rs_to_ms_bus   (rs_to_ms_bus   ),
    //to rs
    .es_to_rs_valid (es_to_rs_valid ),
    .es_to_rs_bus   (es_to_rs_bus   ),

    //forward_bus
    .rs_reg         (rs_reg         ),
    .rs_loading     (rs_loading     ),
    //data sram interface 
    .data_sram_req    (data_sram_req    ),
    .data_sram_wr     (data_sram_wr     ),
    .data_sram_size   (data_sram_size   ),
    .data_sram_wstrb  (data_sram_wstrb  ),
    .data_sram_addr   (data_sram_addr   ),
    .data_sram_wdata  (data_sram_wdata  ),
    .data_sram_addr_ok(data_sram_addr_ok),

    .cache_op          (cache_op),
    .dcache_op_req      (dcache_op_req),
    .icache_op_req      (icache_op_req),
    .cache_op_addr     (cache_op_addr),
    .icache_op_ok      (icache_op_data_ok),
    .dcache_op_ok      (dcache_op_data_ok),

	.exception_tlb_refill (exception_tlb_refill),
	.handle_eret          (handle_eret         ),
	.handle_exc           (handle_exc          ),
	.rs_ex_tlb            (rs_ex_tlb           ),
	.pipe_flush           (pipe_flush          ),
    .data_cache       (data_cache       ),
	
	.rs_bd           (rs_bd      ),
	.rs_exccode      (rs_exccode ),
	.rs_badvaddr     (rs_badvaddr),
	.rs_pc           (rs_pc      ),
    .fs_pc_error(fs_pc_error)
);
// MEM_ACK stage
ysyx_210101_mem_ack_stage ysyx_210101_mem_ack_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    .ms_allowin     (ms_allowin     ),
    //from es
    .rs_to_ms_valid (rs_to_ms_valid ),
    .rs_to_ms_bus   (rs_to_ms_bus   ),
    .rs_loading     (rs_loading     ),
    //to ws
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //forward_bus
    .ms_reg         (ms_reg         ),
    .ms_loading     (ms_loading     ),
    //from data-sram
    .data_sram_data_ok(data_sram_data_ok),
    .data_sram_rdata  (data_sram_rdata  )
);
// WB stage
ysyx_210101_wb_stage ysyx_210101_wb_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    //from ms
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    .ws_reg         (ws_reg         ),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   )
);

wire [5:0] ext_int;
assign ext_int = {5'b0,io_interrupt};

ysyx_210101_cp0 ysyx_210101_cp0 (
    .clk            (clk            ),
    .rst            (reset          ),
    .es_ex          (handle_exc     ),
    .es_ex_tlb      (rs_ex_tlb      ),
	.eret_flush     (handle_eret    ),
    .ext_int_in     (ext_int        ),
    .es_bd          (rs_bd          ),
	.es_exccode     (rs_exccode     ),
	.es_badvaddr    (rs_badvaddr    ),
	.mtc0_we        (mtc0_we        ),
	.dst            (es_c0_addr[7:3]),
	.sel            (es_c0_addr[2:0]),
    .es_pc          (rs_pc          ),
	.data           (mtc0_data      ),
	.rdata          (mfc0_rdata     ),
    .cp0_epc        (cp0_epc        ),
    .has_int        (has_int        ),
    .tlbp           (es_tlbp        ),
    .tlbp_found     (es_tlbp && s1_found),
    .index          (s1_index       ),
    .tlbr           (es_tlbr        ),
    .tlbwr          (es_tlbwr       ),
    .r_vpn2         (r_vpn2         ),
    .r_asid         (r_asid         ),
    .r_g            (r_g            ),
    .r_pfn0         (r_pfn0         ),
    .r_c0           (r_c0           ),
    .r_d0           (r_d0           ),
    .r_v0           (r_v0           ),
    .r_pfn1         (r_pfn1         ),
    .r_c1           (r_c1           ),
    .r_d1           (r_d1           ),
    .r_v1           (r_v1           ),
    .cp0_entryhi    (cp0_entryhi    ),
    .cp0_entrylo0   (cp0_entrylo0   ),
    .cp0_entrylo1   (cp0_entrylo1   ),
    .cp0_index      (cp0_index      ),
    .cp0_random     (cp0_random     )
);

`ifdef USE_TLB
ysyx_210101_tlb #(.TLBNUM(`TLBNUM)) ysyx_210101_tlb
(
    .clk        (clk),
    .reset      (reset),
    .s0_vpn2    (s0_vpn2),
    .s0_odd_page(s0_odd_page),
    .s0_asid    (cp0_entryhi[7:0]),
    .s0_found   (s0_found),
    .s0_index   (s0_index),
    .s0_pfn     (s0_pfn),
    .s0_c       (s0_c),
    .s0_d       (s0_d),
    .s0_v       (s0_v),

    .s1_vpn2    (s1_vpn2),
    .s1_odd_page(s1_odd_page),
    .s1_asid    (cp0_entryhi[7:0]),
    .s1_found   (s1_found),
    .s1_index   (s1_index),
    .s1_pfn     (s1_pfn),
    .s1_c       (s1_c),
    .s1_d       (s1_d),
    .s1_v       (s1_v),
    
    .we         (es_tlbwi || es_tlbwr),
    .w_index    (es_tlbwi ? cp0_index[3:0] : cp0_random[3:0]),
    .w_vpn2     (cp0_entryhi[31:13]),
    .w_asid     (cp0_entryhi[7:0]),
    .w_g        (cp0_entrylo0[0] & cp0_entrylo1[0]),
    .w_pfn0     (cp0_entrylo0[25:6]),
    .w_c0       (cp0_entrylo0[5:3]),     
    .w_d0       (cp0_entrylo0[2]), 
    .w_v0       (cp0_entrylo0[1]),     
    .w_pfn1     (cp0_entrylo1[25:6]),     
    .w_c1       (cp0_entrylo1[5:3]),     
    .w_d1       (cp0_entrylo1[2]),     
    .w_v1       (cp0_entrylo1[1]), 

    .r_index    (cp0_index[3:0]),   
    .r_vpn2     (r_vpn2),     
    .r_asid     (r_asid),     
    .r_g        (r_g),     
    .r_pfn0     (r_pfn0),     
    .r_c0       (r_c0),     
    .r_d0       (r_d0),     
    .r_v0       (r_v0),     
    .r_pfn1     (r_pfn1),     
    .r_c1       (r_c1),     
    .r_d1       (r_d1),     
    .r_v1       (r_v1) 
);
`else
assign s0_found = 0;
assign s0_index = 4'b0;
assign s0_pfn   = 20'b0;
assign s0_c     = 3'b0;
assign s0_d     = 0;
assign s0_v     = 0;
assign s1_found = 0;
assign s1_index = 4'b0;
assign s1_pfn   = 20'b0;
assign s1_c     = 3'b0;
assign s1_d     = 0;
assign s1_v     = 0;
assign r_vpn2   = 19'b0;
assign r_asid   = 8'b0;
assign r_g      = 0;
assign r_pfn0   = 0;     
assign r_c0     = 0;    
assign r_d0     = 0;    
assign r_v0     = 0; 
assign r_pfn1   = 0;     
assign r_c1     = 0;    
assign r_d1     = 0;    
assign r_v1     = 0;
`endif

wire  [3 :0]icache_arid   ;
wire  [31:0]icache_araddr ;
wire  [7 :0]icache_arlen  ;
wire  [2 :0]icache_arsize ;
wire  [1 :0]icache_arburst;
wire  [1 :0]icache_arlock ;
wire  [3 :0]icache_arcache;
wire  [2 :0]icache_arprot ;
wire         icache_arvalid;
wire         icache_arready;
    //r
wire [3 :0] icache_rid    ;
wire [31:0] icache_rdata  ;
wire [1 :0] icache_rresp  ;
wire        icache_rlast  ;
wire        icache_rvalid ;
wire        icache_rready ;
    //aw
wire  [3 :0] icache_awid   ;
wire  [31:0] icache_awaddr ;
wire  [7 :0] icache_awlen  ;
wire  [2 :0] icache_awsize ;
wire  [1 :0] icache_awburst;
wire         icache_awvalid;
wire         icache_awready;
    //w
wire  [3 :0] icache_wid    ;
wire  [31:0] icache_wdata  ;
wire  [3 :0] icache_wstrb  ;
wire         icache_wlast  ;
wire         icache_wvalid ;
wire         icache_wready ;
    //b
wire [3 :0] icache_bid    ;
wire [1 :0] icache_bresp  ;
wire        icache_bvalid ;
wire        icache_bready ;

wire  [3 :0]dcache_arid   ;
wire  [31:0]dcache_araddr ;
wire  [7 :0]dcache_arlen  ;
wire  [2 :0]dcache_arsize ;
wire  [1 :0]dcache_arburst;
wire        dcache_arvalid;
wire        dcache_arready;
//r
wire [3 :0] dcache_rid    ;
wire [31:0] dcache_rdata  ;
wire [1 :0] dcache_rresp  ;
wire        dcache_rlast  ;
wire        dcache_rvalid ;
wire        dcache_rready ;
//aw
wire [3 :0] dcache_awid   ;
wire [31:0] dcache_awaddr ;
wire [7 :0] dcache_awlen  ;
wire [2 :0] dcache_awsize ;
wire [1 :0] dcache_awburst;
wire        dcache_awvalid;
wire        dcache_awready;
//w
wire  [31:0]dcache_wdata  ;
wire  [3 :0]dcache_wstrb  ;
wire         dcache_wlast  ;
wire         dcache_wvalid ;
wire         dcache_wready ;
//b
wire [3 :0]dcache_bid    ;
wire [1 :0]dcache_bresp  ;
wire        dcache_bvalid ;
wire        dcache_bready ;

//wire for uncached inst read
//ar
wire  [3 :0] uncached_inst_arid    ;
wire  [31:0] uncached_inst_araddr  ;
wire  [7 :0] uncached_inst_arlen   ;
wire  [2 :0] uncached_inst_arsize  ;
wire  [1 :0] uncached_inst_arburst ;
wire  [1 :0] uncached_inst_arlock  ;
wire  [3 :0] uncached_inst_arcache ;
wire  [2 :0] uncached_inst_arprot  ;
wire         uncached_inst_arvalid  ;
wire         uncached_inst_arready;
//r
wire [3 :0] uncached_inst_rid  ;
wire [31:0] uncached_inst_rdata  ;
wire [1 :0] uncached_inst_rresp ;
wire        uncached_inst_rlast ;
wire        uncached_inst_rvalid ;
wire        uncached_inst_rready  ;
//aw
wire  [3 :0] uncached_inst_awid    ;
wire  [31:0] uncached_inst_awaddr  ;
wire  [7 :0] uncached_inst_awlen   ;
wire  [2 :0] uncached_inst_awsize  ;
wire  [1 :0] uncached_inst_awburst  ;
wire         uncached_inst_awvalid  ;
wire         uncached_inst_awready;
//w
wire  [31:0]uncached_inst_wdata   ;
wire  [3 :0]uncached_inst_wstrb   ;
wire         uncached_inst_wlast   ;
wire         uncached_inst_wvalid  ;
wire         uncached_inst_wready;
//b
wire [3 :0]uncached_inst_bid   ;
wire [1 :0]uncached_inst_bresp ;
wire        uncached_inst_bvalid ;
wire        uncached_inst_bready  ;

//wire for uncached data read/write
//ar
wire  [3 :0]uncached_data_arid   ;
wire  [31:0]uncached_data_araddr  ;
wire  [7 :0]uncached_data_arlen   ;
wire  [2 :0]uncached_data_arsize  ;
wire  [1 :0]uncached_data_arburst  ;
wire  [1 :0]uncached_data_arlock  ;
wire  [3 :0]uncached_data_arcache ;
wire  [2 :0]uncached_data_arprot  ;
wire        uncached_data_arvalid  ;
wire        uncached_data_arready;
//r
wire [3 :0] uncached_data_rid  ;
wire [31:0] uncached_data_rdata ;
wire [1 :0] uncached_data_rresp ;
wire        uncached_data_rlast ;
wire        uncached_data_rvalid ;
wire        uncached_data_rready  ;
//aw
wire  [3 :0]uncached_data_awid    ;
wire  [31:0]uncached_data_awaddr  ;
wire  [7 :0]uncached_data_awlen   ;
wire  [2 :0]uncached_data_awsize  ;
wire  [1 :0]uncached_data_awburst ;
wire         uncached_data_awvalid  ;
wire         uncached_data_awready;
//w
wire  [31:0]uncached_data_wdata   ;
wire  [3 :0]uncached_data_wstrb   ;
wire         uncached_data_wlast   ;
wire         uncached_data_wvalid  ;
wire         uncached_data_wready ;
//b
wire [3 :0]uncached_data_bid   ;
wire [1 :0]uncached_data_bresp ;
wire        uncached_data_bvalid ;
wire        uncached_data_bready  ;

wire icache_req;
wire icache_addr_ok;
wire icache_data_ok;
wire [31:0] icache_data;
assign icache_addr_ok = 1'b0;
assign icache_data_ok = 1'b0;

wire dcache_req;
wire dcache_data_ok;
wire dcache_addr_ok;
wire [31:0] dcache_data;
assign dcache_data_ok = 1'b0;
assign dcache_addr_ok = 1'b0;

assign uncached_inst_bid[3] = 1'b0;
assign uncached_inst_rid[3] = 1'b0;
assign uncached_data_bid[3] = 1'b0;
assign uncached_data_rid[3] = 1'b0;

ysyx_210101_data_cache_control ysyx_210101_data_cache_control(
    .clk          (clk                     ),
    .reset        (reset                   ),
    //cpu
    .data_req     (data_sram_req            ),
    .data_size    (data_sram_size           ),
    .data_op      (data_sram_wr             ),
    .data_index   (data_sram_addr[11:5]     ),
    .data_tag     (data_sram_addr[31:12]    ),
    .data_offset  (data_sram_addr[4:0]      ),
    .data_wstrb   (data_sram_wstrb          ),
    .data_wdata   (data_sram_wdata          ),
    .data_addr_ok (data_sram_addr_ok        ),
    .data_data_ok (data_sram_data_ok        ),
    .data_rdata   (data_sram_rdata          ),
    .data_cache   (data_cache),
    //decache
    .dcache_req       (dcache_req           ),
    .dcache_addr_ok   (dcache_addr_ok       ),
    .dcache_data_ok   (dcache_data_ok       ),
    .dcache_rdata     (32'b0             ),

    //data uncache
    .arid         (uncached_data_arid             ),
    .araddr       (uncached_data_araddr           ),
    .arlen        (uncached_data_arlen            ),
    .arsize       (uncached_data_arsize           ),
    .arburst      (uncached_data_arburst          ),
    .arvalid      (uncached_data_arvalid          ),
    .arready      (uncached_data_arready          ),
    //r              
    .rid          (uncached_data_rid              ),
    .rdata        (uncached_data_rdata            ),
    .rresp        (uncached_data_rresp            ),
    .rlast        (uncached_data_rlast            ),
    .rvalid       (uncached_data_rvalid           ),
    .rready       (uncached_data_rready           ),
    //aw               
    .awid         (uncached_data_awid             ),
    .awaddr       (uncached_data_awaddr           ),
    .awlen        (uncached_data_awlen            ),
    .awsize       (uncached_data_awsize           ),
    .awburst      (uncached_data_awburst          ),
    .awvalid      (uncached_data_awvalid          ),
    .awready      (uncached_data_awready          ),
    //w               
    .wdata        (uncached_data_wdata            ),
    .wstrb        (uncached_data_wstrb            ),
    .wlast        (uncached_data_wlast            ),
    .wvalid       (uncached_data_wvalid           ),
    .wready       (uncached_data_wready           ),
        //b              
    .bid          (uncached_data_bid              ),
    .bresp        (uncached_data_bresp            ),
    .bvalid       (uncached_data_bvalid           ),
    .bready       (uncached_data_bready           )
);

ysyx_210101_inst_cache_control ysyx_210101_inst_cache_control(
    .clk          (clk                     ),
    .reset        (reset                   ),
    //cpu
    .inst_req     (inst_sram_req            ),
    .inst_size    (inst_sram_size           ),
    .inst_op      (inst_sram_wr             ),
    .inst_index   (inst_sram_addr[11:5]     ),
    .inst_tag     (inst_sram_addr[31:12]    ),
    .inst_offset  (inst_sram_addr[4:0]      ),
    .inst_wstrb   (inst_sram_wstrb          ),
    .inst_wdata   (inst_sram_wdata          ),
    .inst_addr_ok (inst_sram_addr_ok        ),
    .inst_data_ok (inst_sram_data_ok        ),
    .inst_rdata   (inst_sram_rdata          ),
    .inst_cache   (inst_cache),
    //decache
    .icache_req       (icache_req           ),
    .icache_addr_ok   (icache_addr_ok       ),
    .icache_data_ok   (icache_data_ok       ),
    .icache_rdata     (32'b0             ),

    //data uncache
    .arid         (uncached_inst_arid             ),
    .araddr       (uncached_inst_araddr           ),
    .arlen        (uncached_inst_arlen            ),
    .arsize       (uncached_inst_arsize           ),
    .arburst      (uncached_inst_arburst          ),
    .arvalid      (uncached_inst_arvalid          ),
    .arready      (uncached_inst_arready          ),
    //r              
    .rid          (uncached_inst_rid              ),
    .rdata        (uncached_inst_rdata            ),
    .rresp        (uncached_inst_rresp            ),
    .rlast        (uncached_inst_rlast            ),
    .rvalid       (uncached_inst_rvalid           ),
    .rready       (uncached_inst_rready           ),
    //aw               
    .awid         (uncached_inst_awid             ),
    .awaddr       (uncached_inst_awaddr           ),
    .awlen        (uncached_inst_awlen            ),
    .awsize       (uncached_inst_awsize           ),
    .awburst      (uncached_inst_awburst          ),
    .awvalid      (uncached_inst_awvalid          ),
    .awready      (uncached_inst_awready          ),
    //w               
    .wdata        (uncached_inst_wdata            ),
    .wstrb        (uncached_inst_wstrb            ),
    .wlast        (uncached_inst_wlast            ),
    .wvalid       (uncached_inst_wvalid           ),
    .wready       (uncached_inst_wready           ),
        //b              
    .bid          (uncached_inst_bid              ),
    .bresp        (uncached_inst_bresp            ),
    .bvalid       (uncached_inst_bvalid           ),
    .bready       (uncached_inst_bready           )
);

wire [31:0] extended_awaddr;
wire [63:0] extended_wdata;
wire [ 7:0] extended_wstrb;
wire [63:0] extended_inst_rdata;
wire [63:0] extended_data_rdata;

assign extended_awaddr = uncached_data_awaddr;
assign extended_wdata  = uncached_data_awaddr[2] ? {uncached_data_wdata,32'b0} : {32'b0,uncached_data_wdata};
assign extended_wstrb  = uncached_data_awaddr[2] ? {uncached_data_wstrb,4'b0} : {4'b0,uncached_data_wstrb};

assign uncached_inst_rdata = extended_inst_rdata[31:0];
assign uncached_data_rdata = extended_data_rdata[31:0];

wire [31:0] cpu_awaddr;
wire [31:0] cpu_araddr;       

//no-cache, 2*1 cross-bridge
ysyx_210101_AXI4Xbar  ysyx_210101_AXI4Xbar(
    .clk        (clk   ),
    .reset      (reset ),

    .io_port0_aw_ready         (uncached_inst_awready ),
    .io_port0_aw_valid         (uncached_inst_awvalid ),
    .io_port0_aw_payload_addr  (uncached_inst_awaddr  ),
    .io_port0_aw_payload_id    (uncached_inst_awid[2:0]),
    .io_port0_aw_payload_len   (uncached_inst_awlen   ),
    .io_port0_aw_payload_size  (uncached_inst_awsize  ),
    .io_port0_aw_payload_burst (uncached_inst_awburst ),
    .io_port0_aw_payload_region(4'b0),
    .io_port0_aw_payload_lock  (1'b0),
    .io_port0_aw_payload_cache (4'b0),
    .io_port0_aw_payload_qos   (4'b0),
    .io_port0_aw_payload_prot  (3'b0),

    .io_port0_w_ready          (uncached_inst_wready  ),
    .io_port0_w_valid          (uncached_inst_wvalid  ),
    .io_port0_w_payload_data   ({32'b0,uncached_inst_wdata}),
    .io_port0_w_payload_strb   ({4'b0,uncached_inst_wstrb}),
    .io_port0_w_payload_last   (uncached_inst_wlast   ),
    .io_port0_b_ready          (uncached_inst_bready  ), 
    .io_port0_b_valid          (uncached_inst_bvalid  ),
    .io_port0_b_payload_resp   (uncached_inst_bresp   ),
    .io_port0_b_payload_id     (uncached_inst_bid[2:0]),

    .io_port0_ar_ready         (uncached_inst_arready ),
    .io_port0_ar_valid         (uncached_inst_arvalid ),
    .io_port0_ar_payload_addr  (uncached_inst_araddr  ),
    .io_port0_ar_payload_id    (uncached_inst_arid[2:0]),
    .io_port0_ar_payload_len   (uncached_inst_arlen   ),
    .io_port0_ar_payload_size  (uncached_inst_arsize  ),
    .io_port0_ar_payload_burst (uncached_inst_arburst ),
    .io_port0_ar_payload_region(4'b0),
    .io_port0_ar_payload_lock  (1'b0),
    .io_port0_ar_payload_cache (4'b0),
    .io_port0_ar_payload_qos   (4'b0),
    .io_port0_ar_payload_prot  (3'b0),
    .io_port0_r_ready          (uncached_inst_rready  ),
    .io_port0_r_valid          (uncached_inst_rvalid  ),
    .io_port0_r_payload_resp   (uncached_inst_rresp   ),
    .io_port0_r_payload_data   (extended_inst_rdata   ),
    .io_port0_r_payload_last   (uncached_inst_rlast   ),
    .io_port0_r_payload_id     (uncached_inst_rid[2:0]),
  
  
    .io_port1_aw_ready         (uncached_data_awready ),
    .io_port1_aw_valid         (uncached_data_awvalid ),
    .io_port1_aw_payload_addr  (extended_awaddr       ),
    .io_port1_aw_payload_id    (uncached_data_awid[2:0]),
    .io_port1_aw_payload_len   (uncached_data_awlen   ),
    .io_port1_aw_payload_size  (uncached_data_awsize  ),
    .io_port1_aw_payload_burst (uncached_data_awburst ),
    .io_port1_aw_payload_region(4'b0),
    .io_port1_aw_payload_lock  (1'b0),
    .io_port1_aw_payload_cache (4'b0),
    .io_port1_aw_payload_qos   (4'b0),
    .io_port1_aw_payload_prot  (3'b0),

    .io_port1_w_ready          (uncached_data_wready  ),
    .io_port1_w_valid          (uncached_data_wvalid  ),
    .io_port1_w_payload_data   (extended_wdata        ),
    .io_port1_w_payload_strb   (extended_wstrb        ),
    .io_port1_w_payload_last   (uncached_data_wlast   ),
    .io_port1_b_ready          (uncached_data_bready  ), 
    .io_port1_b_valid          (uncached_data_bvalid  ),
    .io_port1_b_payload_resp   (uncached_data_bresp   ),
    .io_port1_b_payload_id     (uncached_data_bid[2:0]),

    .io_port1_ar_ready         (uncached_data_arready ),
    .io_port1_ar_valid         (uncached_data_arvalid ),
    .io_port1_ar_payload_addr  (uncached_data_araddr  ),
    .io_port1_ar_payload_id    (uncached_data_arid[2:0]),
    .io_port1_ar_payload_len   (uncached_data_arlen   ),
    .io_port1_ar_payload_size  (uncached_data_arsize  ),
    .io_port1_ar_payload_burst (uncached_data_arburst ),
    .io_port1_ar_payload_region(4'b0),
    .io_port1_ar_payload_lock  (1'b0),
    .io_port1_ar_payload_cache (4'b0),
    .io_port1_ar_payload_qos   (4'b0),
    .io_port1_ar_payload_prot  (3'b0),
    .io_port1_r_ready          (uncached_data_rready  ),
    .io_port1_r_valid          (uncached_data_rvalid  ),
    .io_port1_r_payload_resp   (uncached_data_rresp   ),
    .io_port1_r_payload_data   (extended_data_rdata   ),
    .io_port1_r_payload_last   (uncached_data_rlast   ),
    .io_port1_r_payload_id     (uncached_data_rid[2:0]),


    .io_out_port_aw_ready      (io_master_awready ),
    .io_out_port_aw_valid      (io_master_awvalid ),
    .io_out_port_aw_payload_addr (cpu_awaddr  ),
    .io_out_port_aw_payload_id   (io_master_awid),
    .io_out_port_aw_payload_len  (io_master_awlen   ),
    .io_out_port_aw_payload_size (io_master_awsize  ),
    .io_out_port_aw_payload_burst(io_master_awburst ),
    .io_out_port_aw_payload_region(),
    .io_out_port_aw_payload_lock  (),
    .io_out_port_aw_payload_cache (),
    .io_out_port_aw_payload_qos   (),
    .io_out_port_aw_payload_prot  (),

    .io_out_port_w_ready       (io_master_wready  ),
    .io_out_port_w_valid       (io_master_wvalid  ),
    .io_out_port_w_payload_data  (io_master_wdata   ),
    .io_out_port_w_payload_strb  (io_master_wstrb   ),
    .io_out_port_w_payload_last  (io_master_wlast   ),
    .io_out_port_b_ready       (io_master_bready  ), 
    .io_out_port_b_valid       (io_master_bvalid  ),
    .io_out_port_b_payload_resp  (io_master_bresp   ),
    .io_out_port_b_payload_id    (io_master_bid),

    .io_out_port_ar_ready      (io_master_arready ),
    .io_out_port_ar_valid      (io_master_arvalid ),
    .io_out_port_ar_payload_addr (cpu_araddr  ),
    .io_out_port_ar_payload_id   (io_master_arid),
    .io_out_port_ar_payload_len  (io_master_arlen   ),
    .io_out_port_ar_payload_size (io_master_arsize  ),
    .io_out_port_ar_payload_burst(io_master_arburst ),
    .io_out_port_ar_payload_region(),
    .io_out_port_ar_payload_lock  (),
    .io_out_port_ar_payload_cache (),
    .io_out_port_ar_payload_qos   (),
    .io_out_port_ar_payload_prot  (),
    .io_out_port_r_ready       (io_master_rready  ),
    .io_out_port_r_valid       (io_master_rvalid  ),
    .io_out_port_r_payload_resp  (io_master_rresp   ),
    .io_out_port_r_payload_data  (io_master_rdata   ),
    .io_out_port_r_payload_last  (io_master_rlast   ),
    .io_out_port_r_payload_id    (io_master_rid)
);


//address translation loognson <-> ysyx
ysyx_210101_addr_converter ysyx_210101_araddr_converter(
    .cpu_addr   (cpu_araddr      ),
    .soc_addr   (io_master_araddr)
);

ysyx_210101_addr_converter ysyx_210101_awaddr_converter(
    .cpu_addr   (cpu_awaddr      ),
    .soc_addr   (io_master_awaddr)
);

endmodule


//==============================================================================================================================//
// MIPS32 Encoding of the Opcode Field
`define OP_SPECIAL  6'b000_000
`define OP_REGIMM   6'b000_001
`define OP_J        6'b000_010
`define OP_JAL      6'b000_011
`define OP_BEQ      6'b000_100
`define OP_BNE      6'b000_101
`define OP_BLEZ     6'b000_110
`define OP_BGTZ     6'b000_111
`define OP_ADDI     6'b001_000
`define OP_ADDIU    6'b001_001
`define OP_SLTI     6'b001_010
`define OP_SLTIU    6'b001_011
`define OP_ANDI     6'b001_100
`define OP_ORI      6'b001_101
`define OP_XORI     6'b001_110
`define OP_LUI      6'b001_111
`define OP_COP0     6'b010_000
`define OP_COP1     6'b010_001
`define OP_COP2     6'b010_010
`define OP_COP1X    6'b010_011
`define OP_BEQL     6'b010_100
`define OP_BNEL     6'b010_101
`define OP_BLEZL    6'b010_110
`define OP_BGTZL    6'b010_111
`define OP_SPECIAL2 6'b011_100
`define OP_SPECIAL3 6'b011_111
`define OP_LB       6'b100_000
`define OP_LH       6'b100_001
`define OP_LWL      6'b100_010
`define OP_LW       6'b100_011
`define OP_LBU      6'b100_100
`define OP_LHU      6'b100_101
`define OP_LWR      6'b100_110
`define OP_SB       6'b101_000
`define OP_SH       6'b101_001
`define OP_SWL      6'b101_010
`define OP_SW       6'b101_011
`define OP_SWR      6'b101_110
`define OP_CACHE    6'b101_111
`define OP_LL       6'b110_000
`define OP_LWC1     6'b110_001
`define OP_LWC2     6'b110_010
`define OP_PREF     6'b110_011
`define OP_LDC1     6'b110_101
`define OP_LDC2     6'b110_110
`define OP_SC       6'b111_000
`define OP_SWC1     6'b111_001
`define OP_SWC2     6'b111_010
`define OP_SDC1     6'b111_101
`define OP_SDC2     6'b111_110

// MIPS32 SPECIAL Opcode Encoding of Function Field
`define FU_SLL      6'b000_000
`define FU_MOVCI    6'b000_001
`define FU_SRL      6'b000_010
`define FU_SRA      6'b000_011
`define FU_SLLV     6'b000_100
`define FU_SRLV     6'b000_110
`define FU_SRAV     6'b000_111
`define FU_JR       6'b001_000
`define FU_JALR     6'b001_001
`define FU_MOVZ     6'b001_010
`define FU_MOVN     6'b001_011
`define FU_SYSCALL  6'b001_100
`define FU_BREAK    6'b001_101
`define FU_SYNC     6'b001_111
`define FU_MFHI     6'b010_000
`define FU_MTHI     6'b010_001
`define FU_MFLO     6'b010_010
`define FU_MTLO     6'b010_011
`define FU_MULT     6'b011_000
`define FU_MULTU    6'b011_001
`define FU_DIV      6'b011_010
`define FU_DIVU     6'b011_011
`define FU_ADD      6'b100_000
`define FU_ADDU     6'b100_001
`define FU_SUB      6'b100_010
`define FU_SUBU     6'b100_011
`define FU_AND      6'b100_100
`define FU_OR       6'b100_101
`define FU_XOR      6'b100_110
`define FU_NOR      6'b100_111
`define FU_SLT      6'b101_010
`define FU_SLTU     6'b101_011
`define FU_TGE      6'b110_000
`define FU_TGEU     6'b110_001
`define FU_TLT      6'b110_010
`define FU_TLTU     6'b110_011
`define FU_TEQ      6'b110_100
`define FU_TNE      6'b110_110

// MIPS32 SPECIAL2 Encoding of Function Field
`define FU_MADD     6'b000_000
`define FU_MADDU    6'b000_001
`define FU_MUL      6'b000_010
`define FU_MSUB     6'b000_100
`define FU_MSUBU    6'b000_101
`define FU_CLZ      6'b100_000
`define FU_CLO      6'b100_001
`define FU_SDBBP    6'b111_111

// MIPS32 SPECIAL3 Encoding of Function Field
`define FU_EXT      6'b000_000
`define FU_INS      6'b000_100
`define FU_BSHFL    6'b100_000
`define FU_RDHWR    6'b111_011

// MIPS32 COP0 Encoding of Function Field
`define FU_TLBR     6'b000_001
`define FU_TLBWI    6'b000_010
`define FU_TLBWR    6'b000_110
`define FU_TLBP     6'b001_000
`define FU_ERET     6'b011_000
`define FU_WAIT     6'b100_000

// MIPS32 COP0 Encoding of rs Field
`define RS_MF       5'b00_000
`define RS_MT       5'b00_100
`define RS_RDPGPR   5'b01_010
`define RS_MFMC01   5'b01_011
`define RS_WRPGPR   5'b01_110
`define RS_CO       5'b10_000

// MIPS32 REGIMM Encoding of rt Field
`define RT_BLTZ     5'b00_000
`define RT_BGEZ     5'b00_001
`define RT_BLTZL    5'b00_010
`define RT_BGEZL    5'b00_011
`define RT_TGEI     5'b01_000
`define RT_TGEIU    5'b01_001
`define RT_TLTI     5'b01_010
`define RT_TLTIU    5'b01_011
`define RT_TEQI     5'b01_100
`define RT_TNEI     5'b01_110
`define RT_BLTZAL   5'b10_000
`define RT_BGEZAL   5'b10_001
`define RT_BLTZALL  5'b10_010
`define RT_BGEZALL  5'b10_011
`define RT_SYNCI    5'b11_111

// MIPS32 BSHFL Encoding of sa Field
`define SA_WSBH     5'b00_010
`define SA_SEB      5'b10_000
`define SA_SEH      5'b11_000


//===============================================================================================================================//
module ysyx_210101_pf_stage(
    input                          clk            ,
    input                          reset          ,

    // IF-ID Bus
    input                          fs_allowin     ,
    output                         ps_to_fs_valid ,
    output [`PS_TO_FS_BUS_WD -1:0] ps_to_fs_bus   ,
    input  [`BR_BUS_WD       -1:0] br_bus         ,
    input                          br_leaving     ,

    // IF-WB Bus Exception related
    input         handle_exc,
    input         handle_eret,
    input         exception_tlb_refill,
    input [31:0]  cp0_epc,
    input [31:0]  pipe_flush_pc,
    input         pipe_flush,

    // Inst-sram interface
    output        inst_sram_req,
    output        inst_sram_wr,
    output [ 1:0] inst_sram_size,
    output [31:0] inst_sram_addr,
    input         inst_sram_addr_ok,
    output        inst_cache,
    	
	//TLB search port 0     
    output [18:0] s0_vpn2,
    output        s0_odd_page,
    input         s0_found,     
    input  [ 3:0] s0_index,     
    input  [19:0] s0_pfn,     
    input  [ 2:0] s0_c,     
    input         s0_d,     
    input         s0_v,
    
    //TLB refetch tag
    input ds_tlbwir_cancel,
    input refresh_tlb_cache,
    output fs_error,
    input taken,
    input [31:0] pc_predict,
    input pre_branch
);

/****************************** SIGNAL DECLARE *******************************/

// Pre IF
wire                     to_ps_valid;
wire                     ps_ready_go;
wire                     mapped;
wire [31:0]              seq_pc;
wire [31:0]              nextpc;
wire [31:0]              real_pc;
wire [31:0]              _real_pc;
wire                     ps_pc_adel;
wire                     ps_tlb_miss;
wire                     ps_tlb_invalid;
wire                     ps_ex;
reg  [`BR_BUS_WD - 1:0]  br_bus_r;
reg                      br_bus_r_valid;
wire                     br_taken;
wire [ 31:0]             br_target;
wire                     pre_taken;
reg  [ 31:0]             pre_history;
reg                      pre_valid;
reg                      pre_taken_r;

// IF
reg  [31:0] ps_pc;
reg         ps_valid;

// TLB query: 0 for get, 1 for querying, 2 for result
reg [ 1:0] tlb_query_state;
reg [ 1:0] next_state;
wire tlb_hit;

reg [18:0] tlb_history_vpn2;
reg [19:0] tlb_history_pfn;
reg        tlb_history_odd;
reg        tlb_history_v;
reg        tlb_history_vv;
reg        tlb_history_found;


wire kseg1;
wire wait_translation;


/****************************** SIGNAL DEFINE *******************************/

always @(posedge clk) begin
    if (reset)
        pre_history <= 32'b0;
    else if (pre_branch)
        pre_history <= pc_predict; 
end

always @(posedge clk) begin
	if (reset)
		pre_taken_r <= 1'b0;
    else if (handle_exc || handle_eret || pipe_flush)
        pre_taken_r <= 1'b0;
	else if (taken && !br_leaving)
		pre_taken_r <= 1'b1;
	else if (br_leaving || ps_pc == pre_history)
		pre_taken_r <= 1'b0;
end

assign fs_error = ps_ex;
always @(posedge clk) begin
	if (reset)
		br_bus_r <= 33'b0;
	else if (br_leaving)
		br_bus_r <= br_bus;
end

always @(posedge clk) begin
	if (reset)
		br_bus_r_valid <= 1'b0;
    else if (handle_exc || handle_eret || pipe_flush)
        br_bus_r_valid <= 1'b0;
	else if (br_leaving && pre_history != br_bus[31:0] && ps_pc != br_bus[31:0])
		br_bus_r_valid <= 1'b1;
	else if (ps_pc == br_target)
		br_bus_r_valid <= 1'b0;
end

assign br_taken  = br_bus_r_valid && (ps_pc != br_target); 
assign br_target = br_bus_r[31:0]; 
assign pre_taken = (taken || pre_taken_r) && ps_pc != pre_history;

`ifdef USE_TLB
always @(posedge clk) begin
    if (reset)
        tlb_query_state <= 2'b0;
    else 
        tlb_query_state <= next_state; 
end

assign tlb_hit = ps_pc[12] == tlb_history_odd && ps_pc[31:13] == tlb_history_vpn2 && tlb_history_v;

always @(*) begin
    case (tlb_query_state)
        0:
            if (tlb_hit || !mapped || ps_pc_adel)
                next_state = 0;
            else
                next_state = 1;
        1:
            next_state = 2;
        2:
            next_state = 0;
        default: next_state = 0;
    endcase 
end

always @(posedge clk) begin
    if (reset) begin
        tlb_history_vpn2 <= 19'b0;
        tlb_history_pfn  <= 20'b0;
        tlb_history_odd  <=  1'b0;
        tlb_history_v    <=  1'b0;
        tlb_history_vv   <=  1'b0;
        tlb_history_found<=  1'b0;
    end else if (refresh_tlb_cache) begin
        tlb_history_v    <= 1'b0;
    end else if (tlb_query_state == 0 && !tlb_hit) begin
        tlb_history_vpn2 <= ps_pc[31:13]; 
        tlb_history_odd  <= ps_pc[12];
    end else if (tlb_query_state == 1) begin
        tlb_history_pfn  <= s0_pfn;    
        tlb_history_v    <= 1;
        tlb_history_vv   <= s0_v;    
        tlb_history_found<= s0_found;
    end
end
`endif

assign kseg1 = _real_pc[31:29] == 3'b101;
assign inst_cache = !kseg1;

assign ps_to_fs_bus = {ps_pc_adel,
		               ps_tlb_miss,
	                   ps_tlb_invalid,
	                   ps_pc};

// pre-IF stage
assign ps_ready_go = !wait_translation && (inst_sram_req && inst_sram_addr_ok || ps_ex);
assign to_ps_valid = ~reset && ps_ready_go;
assign ps_to_fs_valid = to_ps_valid && ps_ready_go; //&& !handle_exc && !handle_eret && !pipe_flush;

assign nextpc       = br_taken ? br_target : taken ? pc_predict : pre_taken ? pre_history : seq_pc;
assign seq_pc       = ps_pc + 32'h4;

`ifdef USE_TLB
assign wait_translation = mapped && !(tlb_query_state == 0 && tlb_hit) && !ps_pc_adel;
`else
assign wait_translation = 0;
`endif

assign inst_sram_req   = ~reset && !wait_translation && fs_allowin && !ps_ex;
assign inst_sram_addr  = ps_ex ? 32'b0 : real_pc; 
assign inst_sram_size  = 2'b10;
assign inst_sram_wr    = 0;

always @(posedge clk) begin
    if (reset) begin
        ps_valid <= 1'b0;
    end else if (handle_exc || handle_eret || pipe_flush) begin
        ps_valid <= 1'b0;
    end else begin
        ps_valid <= to_ps_valid;
    end
end

always @(posedge clk) begin
    if (reset) begin
        ps_pc <= 32'hbfc00000;  //80000000;
    end else if (handle_exc && exception_tlb_refill) begin
        ps_pc <= 32'h80000000;   //32'hbfc00200;
    end else if (handle_exc) begin
        ps_pc <= 32'h80000180;   //32'hbfc00380;
    end else if (handle_eret) begin
        ps_pc <= cp0_epc;
    end else if (pipe_flush) begin
        ps_pc <= pipe_flush_pc;
    end else if (to_ps_valid && fs_allowin) begin
        ps_pc <= nextpc;
    end
end

// TLB va->pa
`ifdef USE_TLB
assign s0_vpn2        = tlb_history_vpn2;
assign s0_odd_page    = tlb_history_odd;
assign mapped         = ~ps_pc[31] | (ps_pc[31] & ps_pc[30]);
assign _real_pc       = mapped ? {tlb_history_pfn, {ps_pc[11:0]}} : ps_pc;
assign ps_tlb_miss    = mapped && !tlb_history_found;
assign ps_tlb_invalid = mapped && !tlb_history_vv;
`else
assign s0_vpn2        = 0;
assign s0_odd_page    = 0;
assign _real_pc       = ps_pc;
assign ps_tlb_miss    = 0;
assign ps_tlb_invalid = 0;
`endif

assign real_pc        = _real_pc & (_real_pc[31:30] == 2'b10 ? 32'h1fffffff : 32'hffffffff);
assign ps_pc_adel     = ps_pc[1:0] != 2'b00;
assign ps_ex          = ps_pc_adel | ps_tlb_miss | ps_tlb_invalid;

endmodule


//===============================================================================================================================//
module ysyx_210101_if_stage(
    input                          clk            ,
    input                          reset          ,

    // IF-ID Bus
    input                          ds_allowin     ,
    output                         fs_allowin     ,

    input                          ps_to_fs_valid ,
    input  [`PS_TO_FS_BUS_WD -1:0] ps_to_fs_bus   ,
    
	output                         fs_to_ds_valid ,
    output [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus   ,

    // IF-WB Bus Exception related
    input         handle_exc,
    input         handle_eret,
    input         pipe_flush,
    input         has_int,

    // Inst-sram interface
    input         inst_sram_data_ok,
	input  [31:0] inst_sram_rdata,
    
    //TLB refetch tag
    input ds_tlbwir_cancel,
    input refresh_tlb_cache,
    input fs_pc_error,

    output [31:0] inst,
    output [31:0] pc,
    output valid
);

/****************************** SIGNAL DECLARE *******************************/

// IF
reg         fs_valid;
reg [`PS_TO_FS_BUS_WD - 1:0] ps_to_fs_bus_r;
wire        fs_ready_go;

wire [31:0] fs_inst;
wire [31:0] fs_pc;
reg  [31:0] fs_inst_sram_rdata_r;
reg         fs_inst_sram_rdata_r_vaild;

// Exception
wire        fs_ex;
wire [31:0] fs_badvaddr;       
wire [ 4:0] fs_exccode;
wire        fs_pc_adel;
wire        fs_tlb_miss;
wire        fs_tlb_invalid;
wire        fs_tlbwir_cancel;

assign {fs_pc_adel,
		fs_tlb_miss,
		fs_tlb_invalid,
	    fs_pc} = ps_to_fs_bus_r;

reg fs_cancel;
initial fs_cancel = 0;
always @(posedge clk)begin
    if((handle_exc || handle_eret || pipe_flush) && !fs_pc_error && (ps_to_fs_valid || (!fs_allowin && !fs_ready_go))) begin
        fs_cancel <= 1'b1;
    end else if(inst_sram_data_ok) begin
        fs_cancel <= 1'b0;
    end
end

// IF stage
assign fs_to_ds_bus = {fs_tlb_miss,
                       fs_tlbwir_cancel,
                       fs_ex,
                       fs_badvaddr,      
                       fs_exccode,
                       fs_inst ,
                       fs_pc};
					   
assign fs_ready_go    = !fs_cancel && (inst_sram_data_ok || fs_inst_sram_rdata_r_vaild) || fs_pc_adel || fs_tlb_miss || fs_tlb_invalid;
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid = fs_valid && fs_ready_go && !handle_exc && !handle_eret && !pipe_flush;

assign fs_tlbwir_cancel = 0;

initial fs_valid = 0;
always @(posedge clk) begin
    if (reset) begin
        fs_valid <= 1'b0;
    end else if (handle_exc || handle_eret || pipe_flush) begin
        fs_valid <= 1'b0;
    end else if (fs_allowin) begin
        fs_valid <= ps_to_fs_valid;
    end

    if (reset) begin
        ps_to_fs_bus_r <= `PS_TO_FS_BUS_WD'b0;
    end else if (ps_to_fs_valid && fs_allowin) begin
        ps_to_fs_bus_r <= ps_to_fs_bus;
    end
end

always @(posedge clk) begin
    if (reset) begin
        fs_inst_sram_rdata_r <= 32'b0;
    end
    else if(inst_sram_data_ok && !ds_allowin) begin
        fs_inst_sram_rdata_r <= inst_sram_rdata;
    end
end

always @(posedge clk) begin
    if(reset) begin
        fs_inst_sram_rdata_r_vaild <= 1'b0;
    end else if(handle_exc || handle_eret || pipe_flush) begin
        fs_inst_sram_rdata_r_vaild <= 1'b0;
    end else if(inst_sram_data_ok && !ds_allowin) begin
        fs_inst_sram_rdata_r_vaild <= 1'b1;
    end else if(fs_ready_go && ds_allowin) begin
        fs_inst_sram_rdata_r_vaild <= 1'b0;
    end
end
assign inst = fs_inst_sram_rdata_r_vaild ? fs_inst_sram_rdata_r : inst_sram_rdata;

assign pc = fs_pc;
assign valid = fs_ready_go && fs_valid;
assign fs_inst = fs_ex ? 32'b0 : fs_inst_sram_rdata_r_vaild ? fs_inst_sram_rdata_r : inst_sram_rdata;
assign fs_ex = has_int | fs_pc_adel | fs_tlb_miss | fs_tlb_invalid;                 
assign fs_badvaddr = fs_pc;
assign fs_exccode =  has_int                           ? `EX_INT  :
                    (fs_tlb_miss | fs_tlb_invalid)     ? `EX_TLBL :
                     fs_pc_adel                        ? `EX_ADEL : 5'b0 ; 
endmodule


//===============================================================================================================================//
module ysyx_210101_id_stage(
    input                          clk           ,
    input                          reset         ,
    output                         icache_stall  ,
    //allowin
    input                          es_allowin    ,
    output                         ds_allowin    ,
    //from fs
    input                          fs_to_ds_valid,
    input  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus  ,
    //to es
    output                         ds_to_es_valid,
    output [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,
    //to rf: for write back
    input  [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus,
    // forward_bus
    input  [45:0] es_reg,
    input  [45:0] rs_reg,
    input  [42:0] ms_reg,
    input  [40:0] ws_reg,
    input         ms_loading,
    
    input         handle_exc,      
    input         handle_eret,
    output ds_tlbwir_cancel,
    input  es_tlbwir_cancel,
    input  pipe_flush
);

/****************************** SIGNAL DECLARE *******************************/

reg         ds_valid   ;
wire        ds_ready_go;
wire [31                 :0] fs_pc;
wire [31                 :0] ds_pc;

reg  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;
wire        ds_fs_ex;
wire        ds_fs_bd;
wire [31:0] ds_fs_badvaddr;       
wire [ 4:0] ds_fs_exccode;
wire [31:0] ds_inst;

wire [ 3:0] rf_we   ;
wire [ 4:0] rf_waddr;
wire [31:0] rf_wdata;

wire        of_check;  
wire        ds_ex;
wire        ds_bd;
wire        src1_is_pc;
wire        src2_is_imm;
wire        src2_is_zimm;
wire        src2_is_8;
wire        gr_we;
wire        mem_we;
wire [31:0] ds_badvaddr;       
wire [ 4:0] ds_exccode;
wire [ 7:0] ds_c0_addr;
wire [13:0] alu_op;
wire [ 4:0] store_op;
wire [ 6:0] load_op;
wire        src1_is_sa;

wire [ 4:0] dest;
wire [15:0] imm;
wire [31:0] rs_value;
wire [31:0] rt_value;

// wire [ 5:0] op;
// wire [ 4:0] rs;
// wire [ 4:0] rt;
// wire [ 4:0] rd;
// wire [ 4:0] sa;
// wire [ 5:0] func;
// wire [25:0] jidx;
wire [ 5:0] field_op;
wire [ 4:0] field_sa;
wire [ 4:0] field_rs;
wire [ 4:0] field_rt;
wire [ 4:0] field_rd;
wire [ 5:0] field_func;
wire [15:0] field_imm;
wire [25:0] field_jidx;
wire [ 2:0] field_sel;

wire [63:0] op_d;
wire [31:0] rs_d;
wire [31:0] rt_d;
wire [31:0] rd_d;
wire [31:0] sa_d;
wire [63:0] func_d;

wire inst_cop0;
wire inst_cop1;
wire inst_cop1x;
wire inst_cop2;
wire inst_ldc1;
wire inst_ldc2;
wire inst_lwc1;
wire inst_lwc2;
wire inst_movci;
wire inst_sdc1;
wire inst_sdc2;
wire inst_swc1;
wire inst_swc2;

wire inst_add;
wire inst_addi;
wire inst_addiu;
wire inst_addu;
wire inst_and;
wire inst_andi;
wire inst_beq;
wire inst_beql;
wire inst_bgez;
wire inst_bgezl;
wire inst_bgezal;
wire inst_bgezall;
wire inst_bgtz;
wire inst_bgtzl;
wire inst_blez;
wire inst_blezl;
wire inst_bltz;
wire inst_bltzl;
wire inst_bltzal;
wire inst_bltzall;
wire inst_bne;
wire inst_bnel;
wire inst_break;
wire inst_cache;
wire inst_clo;
wire inst_clz;
wire inst_di;
wire inst_div;
wire inst_divu;
wire inst_ehb;
wire inst_ei;
wire inst_eret;
wire inst_ext;
wire inst_ins;
wire inst_j;
wire inst_jal;
wire inst_jalr;
wire inst_jalr_hb;
wire inst_jr;
wire inst_jr_hb;
wire inst_lb;
wire inst_lbu;
wire inst_lh;
wire inst_lhu;
wire inst_ll;
wire inst_lui;
wire inst_lw;
wire inst_lwl;
wire inst_lwr;
wire inst_madd;
wire inst_maddu;
wire inst_mfc0;
wire inst_mfhi;
wire inst_mflo;
wire inst_movn;
wire inst_movz;
wire inst_msub;
wire inst_msubu;
wire inst_mtc0;
wire inst_mthi;
wire inst_mtlo;
wire inst_mul;
wire inst_mult;
wire inst_multu;
wire inst_nop;
wire inst_nor;
wire inst_or;
wire inst_ori;
wire inst_pause;
wire inst_pref;
wire inst_rdhwr;
wire inst_rdpgpr;
wire inst_rotr;
wire inst_rotrv;
wire inst_sb;
wire inst_sc;
wire inst_sdbbp;
wire inst_seb;
wire inst_seh;
wire inst_sh;
wire inst_sll;
wire inst_sllv;
wire inst_slt;
wire inst_sltu;
wire inst_slti;
wire inst_sltiu;
wire inst_sra;
wire inst_srav;
wire inst_srl;
wire inst_srlv;
wire inst_ssnop;
wire inst_sub;
wire inst_subu;
wire inst_sw;
wire inst_swl;
wire inst_swr;
wire inst_sync;
wire inst_synci;
wire inst_syscall;
wire inst_teq;
wire inst_teqi;
wire inst_tge;
wire inst_tgeu;
wire inst_tgei;
wire inst_tgeiu;
wire inst_tlbp;
wire inst_tlbr;
wire inst_tlbwi;
wire inst_tlbwr;
wire inst_tlt;
wire inst_tltu;
wire inst_tlti;
wire inst_tltiu;
wire inst_tne;
wire inst_tnei;
wire inst_wait;
wire inst_wrpgpr;
wire inst_wsbh;
wire inst_xor;
wire inst_xori;

wire inst_remain;

wire dst_is_rd;
wire dst_is_rt;
wire dst_is_r31;

wire [ 4:0] rf_raddr1;
wire [31:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [31:0] rf_rdata2;

//Forward
wire        es_is_mfhi;
wire        es_is_mul;
wire        es_is_mflo;
wire [ 3:0] es_we;
wire [ 4:0] es_dest;
wire [31:0] es_result;
wire es_load;
wire es_is_mfc0;

//Forward
wire [ 3:0] rs_we;
wire [ 4:0] rs_dest;
wire [31:0] rs_result;
wire rs_load;
wire rs_is_mfc0;
wire rs_is_mfhi;
wire rs_is_mflo;
wire rs_is_mul;
wire        ms_load;
wire [ 3:0] ms_we;
wire [ 4:0] ms_dest;
wire [31:0] ms_result;
wire ms_is_mfc0;
wire [ 3:0] ws_we;
wire [ 4:0] ws_dest;
wire [31:0] ws_result;

wire [4:0] cache_op;

reg llbit;

wire [31:0] trap_imm;
wire        trap;
wire        trap_taken;
wire        ds_tlb_refill;
wire        fs_tlbwir_cancel;

assign icache_stall = inst_cache && ds_valid;
assign fs_pc = fs_to_ds_bus[31:0];

assign {ds_tlb_refill,
        fs_tlbwir_cancel,
        ds_fs_ex,
        ds_fs_badvaddr,       
        ds_fs_exccode,
        ds_inst,
        ds_pc  } = fs_to_ds_bus_r;
assign {rf_we   ,  //40:37
        rf_waddr,  //36:32
        rf_wdata   //31:0
       } = ws_to_rf_bus;

assign {
    es_we,
    es_is_mul,
    es_load,
    es_is_mfc0,
    es_is_mfhi,
    es_is_mflo,
    es_dest,
    es_result
} = es_reg;

assign {rs_we,
        rs_load,
		rs_is_mfc0,
        rs_is_mfhi,
        rs_is_mflo,
        rs_is_mul,
		rs_dest,
		rs_result} = rs_reg;
assign {ms_load,
        ms_we,
		ms_is_mfc0,
		ms_dest,
		ms_result} = ms_reg;

assign {
    ws_we,
	ws_dest,
	ws_result
} = ws_reg;
assign cache_op = field_rt;
assign ds_to_es_bus =  {
    cache_op,
    inst_cache,
    inst_sc && !llbit,
    inst_sc &&  llbit,
    inst_movz | inst_movn,
    inst_madd,
    inst_maddu,
    inst_msub,
    inst_msubu,
    inst_beq,
    inst_bne,
    inst_bgez,
    inst_bgtz,
    inst_blez,
    inst_bltz,
    inst_bgezal,
    inst_bltzal,
    inst_j,
    inst_jr,
    inst_jal,
    inst_jalr,
    imm,
    field_jidx,
    ds_fs_ex && ds_exccode != `EX_INT,
    ds_tlb_refill ,  //211:211
    ds_tlbwir_cancel | fs_tlbwir_cancel | es_tlbwir_cancel, //210:210
    inst_tlbp   ,  //209:209
    inst_tlbr   ,  //208:208
    inst_tlbwi  ,  //207:207
    inst_tlbwr  ,
    of_check    ,  //206:206    
    ds_badvaddr ,  //205:174    
    ds_exccode  ,  //173:169
    ds_ex       ,  //168:168
    1'b0       ,  //167:167 ds_bd
    inst_mul    ,
    inst_eret   ,  //166:166
    inst_mfc0   ,  //165:165
    inst_mtc0   ,  //164:164
    ds_c0_addr  ,  //163:156
    alu_op      ,  //155:144
    store_op    ,  //143:139
    load_op     ,  //138:132
    inst_mult   ,  //131:131
    inst_multu  ,  //130:130
    inst_div    ,  //129:129
    inst_divu   ,  //128:128
    inst_mthi   ,  //127:127
    inst_mtlo   ,  //126:126
    inst_mfhi   ,  //125:125
    inst_mflo   ,  //124:124
    src1_is_sa  ,  //123:123
    src1_is_pc  ,  //122:122
    src2_is_imm ,  //121:121
    src2_is_zimm,  //120:120
    src2_is_8   ,  //119:119
    gr_we       ,  //118:118
    mem_we      ,  //117:117
    dest        ,  //116:112
    imm         ,  //111:96
    rs_value    ,  //95 :64
    rt_value    ,  //63 :32
    ds_pc          //31 :0
};

/*assign rt_re =
    inst_add    | inst_addu   | inst_and    | inst_beq    | inst_beql   |
    inst_bne    | inst_bnel   | inst_clo    | inst_clz    | inst_div    |
    inst_divu   | inst_ins    | inst_madd   | inst_maddu  | inst_movn   |
    inst_movz   | inst_msub   | inst_msubu  | inst_mtc0   | inst_mul    |
    inst_mult   | inst_multu  | inst_nor    | inst_or     | inst_rotr   |
    inst_rotrv  | inst_sb     | inst_sc     | inst_seb    | inst_seh    |
    inst_sh     | inst_sll    | inst_sllv   | inst_slt    | inst_sltu   |
    inst_sra    | inst_srav   | inst_srl    | inst_srlv   | inst_sub    |
    inst_subu   | inst_sw     | inst_swl    | inst_swr    | inst_teq    |
    inst_tge    | inst_tgeu   | inst_tlt    | inst_tltu   | inst_tne    |
    inst_wrpgpr | inst_wsbh   | inst_xor;

assign rs_re =
    inst_add    | inst_addi   | inst_addiu  | inst_addu   | inst_and    |
    inst_andi   | inst_beq    | inst_beql   | inst_bgez   | inst_bgez   |
    inst_bgezal | inst_bgezall| inst_bgezl  | inst_bgtz   | inst_bgtzl  |
    inst_blez   | inst_blezl  | inst_bltz   | inst_bltzal | inst_bltzall|
    inst_bltzl  | inst_bne    | inst_bnel   | inst_cache  | inst_clo    |
    inst_clz    | inst_div    | inst_divu   | inst_ext    | inst_ins    |
    inst_jalr   | inst_jalr_hb| inst_jr     | inst_jr_hb  | inst_lb     |
    inst_lbu    | inst_lh     | inst_lhu    | inst_ll     | inst_lw     |
    inst_lwl    | inst_lwr    | inst_madd   | inst_maddu  | inst_movn   |
    inst_movz   | inst_msub   | inst_msubu  | inst_mthi   | inst_mtlo   |
    inst_mul    | inst_mult   | inst_multu  | inst_nor    | inst_or     |
    inst_ori    | inst_pref   | inst_rotrv  | inst_sb     | inst_sc     |
    inst_sh     | inst_sllv   | inst_slt    | inst_slti   | inst_sltiu  |
    inst_sltu   | inst_srav   | inst_srlv   | inst_sub    | inst_subu   |
    inst_sw     | inst_swl    | inst_swr    | inst_synci  | inst_teq    |
    inst_teqi   | inst_tge    | inst_tgei   | inst_tgeiu  | inst_tgeu   |
    inst_tlt    | inst_tlti   | inst_tltiu  | inst_tltu   | inst_tne    |
    inst_tnei   | inst_xor    | inst_xori;*/

wire   wait_ms;
wire   es_hit;
wire   rs_hit;
wire   ms_hit;
wire   ws_hit;
wire   es_hit_mul;
wire   es_hit_load;
wire   ms_hit_load;
wire   es_hit_mfc0;
wire   es_hit_mfhi;
wire   es_hit_mflo;
wire   rs_hit_load;
wire   rs_hit_mfhi;
assign wait_ms = !(|ms_we) && ms_loading;
assign es_hit     = (es_dest == rf_raddr1 && rf_raddr1 != 0) || (es_dest == rf_raddr2 && rf_raddr2 != 0);
assign rs_hit     = (rs_dest == rf_raddr1 && rf_raddr1 != 0) || (rs_dest == rf_raddr2 && rf_raddr2 != 0);
assign ms_hit     = (ms_dest == rf_raddr1 && rf_raddr1 != 0) || (ms_dest == rf_raddr2 && rf_raddr2 != 0);
assign ws_hit     = (ws_dest == rf_raddr1 && rf_raddr1 != 0) || (ws_dest == rf_raddr2 && rf_raddr2 != 0);

assign es_hit_mul  = ((es_dest == rf_raddr1 && rf_raddr1 != 0) || (es_dest == rf_raddr2 && rf_raddr2 != 0)) && es_is_mul;
assign es_hit_load = ((es_dest == rf_raddr1 && rf_raddr1 != 0) || (es_dest == rf_raddr2 && rf_raddr2 != 0)) && es_load;
assign ms_hit_load = ((ms_dest == rf_raddr1 && rf_raddr1 != 0) || (ms_dest == rf_raddr2 && rf_raddr2 != 0)) && ms_load;
assign es_hit_mfc0 = ((es_dest == rf_raddr1 && rf_raddr1 != 0) || (es_dest == rf_raddr2 && rf_raddr2 != 0)) && es_is_mfc0;
assign es_hit_mfhi = ((es_dest == rf_raddr1 && rf_raddr1 != 0) || (es_dest == rf_raddr2 && rf_raddr2 != 0)) && es_is_mfhi;
assign es_hit_mflo = ((es_dest == rf_raddr1 && rf_raddr1 != 0) || (es_dest == rf_raddr2 && rf_raddr2 != 0)) && es_is_mflo;
assign rs_hit_load = ((rs_dest == rf_raddr1 && rf_raddr1 != 0) || (rs_dest == rf_raddr2 && rf_raddr2 != 0)) && rs_load;
//assign rs_hit_mfc0 = ((rs_dest == rf_raddr1 && rf_raddr1 != 0) || (rs_dest == rf_raddr2 && rf_raddr2 != 0)) && rs_is_mfc0;
assign rs_hit_mfhi = ((rs_dest == rf_raddr1 && rf_raddr1 != 0) || (rs_dest == rf_raddr2 && rf_raddr2 != 0)) && rs_is_mfhi;
//assign rs_hit_mflo = ((rs_dest == rf_raddr1 && rf_raddr1 != 0) || (rs_dest == rf_raddr2 && rf_raddr2 != 0)) && rs_is_mflo;
//assign rs_hit_mul  = ((rs_dest == rf_raddr1 && rf_raddr1 != 0) || (rs_dest == rf_raddr2 && rf_raddr2 != 0)) && rs_is_mul;
assign ds_ready_go = (handle_exc | handle_eret | pipe_flush) || !(wait_ms | es_hit_mul | es_hit_mfc0 | es_hit_load | ms_hit_load | rs_hit_load | es_hit_mfhi |  es_hit_mflo);
//assign is_branch_reg = inst_beq | inst_bne | inst_bgez | inst_bgtz | inst_blez | inst_bltz | inst_bgezal | inst_bltzal | inst_jr | inst_jalr;
//assign wait_br       = is_branch_reg &&( es_hit || ms_hit || rs_hit || ws_hit);
assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go && !handle_exc && !handle_eret && !pipe_flush;

always @(posedge clk) begin
    if (reset) begin
        ds_valid <= 1'b0;
    end
    else if (handle_exc || handle_eret || pipe_flush) begin
    	ds_valid <= 1'b0;
    end
    else if (ds_allowin) begin
        ds_valid <= fs_to_ds_valid;
    end

    if (reset) begin
        fs_to_ds_bus_r <= `FS_TO_DS_BUS_WD'b0;
    end
    else if (fs_to_ds_valid && ds_allowin) begin
        fs_to_ds_bus_r <= fs_to_ds_bus;
    end
end

//Decode
assign field_op   = ds_inst[31:26];
assign field_rs   = ds_inst[25:21];
assign field_rt   = ds_inst[20:16];
assign field_rd   = ds_inst[15:11];
assign field_sa   = ds_inst[10: 6];
assign field_func = ds_inst[ 5: 0];
assign field_imm  = ds_inst[15: 0];
assign field_jidx = ds_inst[25: 0];
assign field_sel  = ds_inst[ 2: 0];
assign imm  = ds_inst[15: 0];

ysyx_210101_decoder_6_64 u_dec0(.in(field_op  ), .out(op_d  ));
ysyx_210101_decoder_6_64 u_dec1(.in(field_func), .out(func_d));
ysyx_210101_decoder_5_32 u_dec2(.in(field_rs  ), .out(rs_d  ));
ysyx_210101_decoder_5_32 u_dec3(.in(field_rt  ), .out(rt_d  ));
ysyx_210101_decoder_5_32 u_dec4(.in(field_rd  ), .out(rd_d  ));
ysyx_210101_decoder_5_32 u_dec5(.in(field_sa  ), .out(sa_d  ));

assign inst_cop0  = op_d[`OP_COP0];
assign inst_cop1  = op_d[`OP_COP1];
assign inst_cop2  = op_d[`OP_COP2];
assign inst_cop1x = op_d[`OP_COP1X];
assign inst_ldc1  = op_d[`OP_LDC1];
assign inst_ldc2  = op_d[`OP_LDC2];
assign inst_lwc1  = op_d[`OP_LDC1];
assign inst_lwc2  = op_d[`OP_LDC2];
assign inst_movci = op_d[`OP_SPECIAL]     & func_d[`FU_MOVCI];
assign inst_sdc1  = op_d[`OP_SDC1];
assign inst_sdc2  = op_d[`OP_SDC2];
assign inst_swc1  = op_d[`OP_SWC1];
assign inst_swc2  = op_d[`OP_SWC2];

assign inst_add     = op_d[`OP_SPECIAL]   & func_d[`FU_ADD];
assign inst_addi    = op_d[`OP_ADDI];
assign inst_addiu   = op_d[`OP_ADDIU];
assign inst_addu    = op_d[`OP_SPECIAL]   & func_d[`FU_ADDU]  & sa_d[0];
assign inst_and     = op_d[`OP_SPECIAL]   & func_d[`FU_AND]   & sa_d[0];
assign inst_andi    = op_d[`OP_ANDI];
assign inst_beq     = op_d[`OP_BEQ];
assign inst_beql    = op_d[`OP_BEQL];
assign inst_bgez    = op_d[`OP_REGIMM]    & rt_d[`RT_BGEZ];
assign inst_bgezal  = op_d[`OP_REGIMM]    & rt_d[`RT_BGEZAL];
assign inst_bgezall = op_d[`OP_REGIMM]    & rt_d[`RT_BGEZALL];
assign inst_bgezl   = op_d[`OP_REGIMM]    & rt_d[`RT_BGEZL];
assign inst_bgtz    = op_d[`OP_BGTZ]      & rt_d[0];
assign inst_bgtzl   = op_d[`OP_BGTZL]     & rt_d[0];
assign inst_blez    = op_d[`OP_BLEZ]      & rt_d[0];
assign inst_blezl   = op_d[`OP_BLEZL]     & rt_d[0];
assign inst_bltz    = op_d[`OP_REGIMM]    & rt_d[`RT_BLTZ];
assign inst_bltzal  = op_d[`OP_REGIMM]    & rt_d[`RT_BLTZAL];
assign inst_bltzall = op_d[`OP_REGIMM]    & rt_d[`RT_BLTZALL];
assign inst_bltzl   = op_d[`OP_REGIMM]    & rt_d[`RT_BLTZL];
assign inst_bne     = op_d[`OP_BNE];
assign inst_bnel    = op_d[`OP_BNEL];
assign inst_break   = op_d[`OP_SPECIAL] & func_d[`FU_BREAK] ;
assign inst_cache   = 0;                  // no cache in ysyx_cpu;    op_d[`OP_CACHE];
assign inst_clo     = op_d[`OP_SPECIAL2]  & func_d[`FU_CLO]   & sa_d[0];
assign inst_clz     = op_d[`OP_SPECIAL2]  & func_d[`FU_CLZ]   & sa_d[0];
assign inst_di      = op_d[`OP_COP0]      & rd_d[12]          & sa_d[0] & func_d[6'b0_00_000];
assign inst_div     = op_d[`OP_SPECIAL]   & func_d[`FU_DIV]   & rd_d[0] & sa_d[0];
assign inst_divu    = op_d[`OP_SPECIAL]   & func_d[`FU_DIVU]  & rd_d[0] & sa_d[0];
assign inst_ehb     = op_d[`OP_SPECIAL]   & func_d[`FU_SLL]   & rs_d[0] & rt_d[0] & rd_d[0] & sa_d[3];
assign inst_ei      = op_d[`OP_COP0]      & rd_d[12]          & sa_d[0] & func_d[6'b1_00_000];
assign inst_eret    = op_d[`OP_COP0]      & func_d[`FU_ERET]  & rs_d[`RS_CO] & rt_d[0] & rd_d[0] & sa_d[0];
assign inst_ext     = op_d[`OP_SPECIAL3]  & func_d[`FU_EXT];
assign inst_ins     = op_d[`OP_SPECIAL3]  & func_d[`FU_INS];
assign inst_j       = op_d[`OP_J];
assign inst_jal     = op_d[`OP_JAL];
assign inst_jalr    = op_d[`OP_SPECIAL]   & func_d[`FU_JALR]  & sa_d[5'b00000]  & rt_d[0];
assign inst_jalr_hb = op_d[`OP_SPECIAL]   & func_d[`FU_JALR]  & sa_d[5'b10000]  & rt_d[0];
assign inst_jr      = op_d[`OP_SPECIAL]   & func_d[`FU_JR]    & sa_d[5'b00000]  & rt_d[0] & rd_d[0];
assign inst_jr_hb   = op_d[`OP_SPECIAL]   & func_d[`FU_JR]    & sa_d[5'b10000]  & rt_d[0] & rd_d[0];
assign inst_lb      = op_d[`OP_LB];
assign inst_lbu     = op_d[`OP_LBU];
assign inst_lh      = op_d[`OP_LH];
assign inst_lhu     = op_d[`OP_LHU];
assign inst_ll      = op_d[`OP_LL];
assign inst_lui     = op_d[`OP_LUI];
assign inst_lw      = op_d[`OP_LW];
assign inst_lwl     = op_d[`OP_LWL];
assign inst_lwr     = op_d[`OP_LWR];
assign inst_madd    = op_d[`OP_SPECIAL2]  & func_d[`FU_MADD]  & sa_d[0] & rd_d[0];
assign inst_maddu   = op_d[`OP_SPECIAL2]  & func_d[`FU_MADDU] & sa_d[0] & rd_d[0];
assign inst_mfc0    = op_d[`OP_COP0]      & rs_d[`RS_MF]      & sa_d[0];
assign inst_mfhi    = op_d[`OP_SPECIAL]   & func_d[`FU_MFHI]  & rs_d[0] & rt_d[0] & sa_d[0];
assign inst_mflo    = op_d[`OP_SPECIAL]   & func_d[`FU_MFLO]  & rs_d[0] & rt_d[0] & sa_d[0];
assign inst_movn    = op_d[`OP_SPECIAL]   & func_d[`FU_MOVN];
assign inst_movz    = op_d[`OP_SPECIAL]   & func_d[`FU_MOVZ];
assign inst_msub    = op_d[`OP_SPECIAL2]  & func_d[`FU_MSUB]  & sa_d[0] & rd_d[0];
assign inst_msubu   = op_d[`OP_SPECIAL2]  & func_d[`FU_MSUBU] & sa_d[0] & rd_d[0];
assign inst_mtc0    = op_d[`OP_COP0]      & rs_d[`RS_MT]      & sa_d[0];
assign inst_mthi    = op_d[`OP_SPECIAL]   & func_d[`FU_MTHI]  & rd_d[0] & rt_d[0] & sa_d[0];
assign inst_mtlo    = op_d[`OP_SPECIAL]   & func_d[`FU_MTLO]  & rd_d[0] & rt_d[0] & sa_d[0];
assign inst_mul     = op_d[`OP_SPECIAL2]  & func_d[`FU_MUL]   & sa_d[0];
assign inst_mult    = op_d[`OP_SPECIAL]   & func_d[`FU_MULT]  & sa_d[0] & rd_d[0];
assign inst_multu   = op_d[`OP_SPECIAL]   & func_d[`FU_MULTU] & sa_d[0] & rd_d[0];
assign inst_nop     = op_d[`OP_SPECIAL]   & func_d[`FU_SLL]   & rs_d[0] & rt_d[0] & rd_d[0] & sa_d[0];
assign inst_nor     = op_d[`OP_SPECIAL]   & func_d[`FU_NOR]   & sa_d[0];
assign inst_or      = op_d[`OP_SPECIAL]   & func_d[`FU_OR]    & sa_d[0];
assign inst_ori     = op_d[`OP_ORI];
assign inst_pause   = op_d[`OP_SPECIAL]   & func_d[`FU_SLL]   & rs_d[0] & rt_d[0] & rd_d[0] & sa_d[5];
assign inst_pref    = op_d[`OP_PREF];
assign inst_rdhwr   = op_d[`OP_SPECIAL3]  & func_d[`FU_RDHWR];
assign inst_rdpgpr  = op_d[`OP_COP0]      & rs_d[`RS_RDPGPR];
assign inst_rotr    = op_d[`OP_SPECIAL]   & func_d[`FU_SRL]   & rs_d[5'b00001];
assign inst_rotrv   = op_d[`OP_SPECIAL]   & func_d[`FU_SRLV]  & sa_d[5'b00001];
assign inst_sb      = op_d[`OP_SB];
assign inst_sc      = op_d[`OP_SC];
assign inst_sdbbp   = op_d[`OP_SPECIAL2]  & func_d[`FU_SDBBP];
assign inst_seb     = op_d[`OP_SPECIAL3]  & func_d[`FU_BSHFL] & sa_d[`SA_SEB];
assign inst_seh     = op_d[`OP_SPECIAL3]  & func_d[`FU_BSHFL] & sa_d[`SA_SEH];
assign inst_sh      = op_d[`OP_SH];
assign inst_sll     = op_d[`OP_SPECIAL]   & func_d[`FU_SLL]   & rs_d[0];
assign inst_sllv    = op_d[`OP_SPECIAL]   & func_d[`FU_SLLV]  & sa_d[0];
assign inst_slt     = op_d[`OP_SPECIAL]   & func_d[`FU_SLT]   & sa_d[0];
assign inst_slti    = op_d[`OP_SLTI];
assign inst_sltiu   = op_d[`OP_SLTIU];
assign inst_sltu    = op_d[`OP_SPECIAL]   & func_d[`FU_SLTU]  & sa_d[0];
assign inst_sra     = op_d[`OP_SPECIAL]   & func_d[`FU_SRA]   & rs_d[0];
assign inst_srav    = op_d[`OP_SPECIAL]   & func_d[`FU_SRAV]  & sa_d[0];
assign inst_srl     = op_d[`OP_SPECIAL]   & func_d[`FU_SRL]   & rs_d[5'b00000];
assign inst_srlv    = op_d[`OP_SPECIAL]   & func_d[`FU_SRLV]  & sa_d[5'b00000];
assign inst_ssnop   = op_d[`OP_SPECIAL]   & func_d[`FU_SLL]   & rs_d[0] & rt_d[0] & rd_d[0] & sa_d[1];
assign inst_sub     = op_d[`OP_SPECIAL]   & func_d[`FU_SUB]   & sa_d[0];
assign inst_subu    = op_d[`OP_SPECIAL]   & func_d[`FU_SUBU]  & sa_d[0];
assign inst_sw      = op_d[`OP_SW];
assign inst_swl     = op_d[`OP_SWL];
assign inst_swr     = op_d[`OP_SWR];
assign inst_sync    = op_d[`OP_SPECIAL]   & func_d[`FU_SYNC];
assign inst_synci   = op_d[`OP_REGIMM]    & rt_d[`RT_SYNCI];
assign inst_syscall = op_d[`OP_SPECIAL]   & func_d[`FU_SYSCALL];
assign inst_teq     = op_d[`OP_SPECIAL]   & func_d[`FU_TEQ];
assign inst_teqi    = op_d[`OP_REGIMM]    & rt_d[`RT_TEQI];
assign inst_tge     = op_d[`OP_SPECIAL]   & func_d[`FU_TGE];
assign inst_tgei    = op_d[`OP_REGIMM]    & rt_d[`RT_TGEI];
assign inst_tgeiu   = op_d[`OP_REGIMM]    & rt_d[`RT_TGEIU];
assign inst_tgeu    = op_d[`OP_SPECIAL]   & func_d[`FU_TGEU];
assign inst_tlbp    = op_d[`OP_COP0]      & func_d[`FU_TLBP]  & rs_d[`RS_CO]  & rt_d[0] & rd_d[0] & sa_d[0];
assign inst_tlbr    = op_d[`OP_COP0]      & func_d[`FU_TLBR]  & rs_d[`RS_CO]  & rt_d[0] & rd_d[0] & sa_d[0];
assign inst_tlbwi   = op_d[`OP_COP0]      & func_d[`FU_TLBWI] & rs_d[`RS_CO]  & rt_d[0] & rd_d[0] & sa_d[0];
assign inst_tlbwr   = op_d[`OP_COP0]      & func_d[`FU_TLBWR] & rs_d[`RS_CO]  & rt_d[0] & rd_d[0] & sa_d[0];
assign inst_tlt     = op_d[`OP_SPECIAL]   & func_d[`FU_TLT];
assign inst_tlti    = op_d[`OP_REGIMM]    & rt_d[`RT_TLTI];
assign inst_tltiu   = op_d[`OP_REGIMM]    & rt_d[`RT_TLTIU];
assign inst_tltu    = op_d[`OP_SPECIAL]   & func_d[`FU_TLTU];
assign inst_tne     = op_d[`OP_SPECIAL]   & func_d[`FU_TNE];
assign inst_tnei    = op_d[`OP_REGIMM]    & rt_d[`RT_TNEI];
assign inst_wait    = op_d[`OP_COP0]      & func_d[`FU_WAIT]  & rs_d[`RS_CO];
assign inst_wrpgpr  = op_d[`OP_COP0]      & rs_d[`RS_WRPGPR];
assign inst_wsbh    = op_d[`OP_SPECIAL3]  & func_d[`FU_BSHFL] & sa_d[`SA_WSBH];
assign inst_xor     = op_d[`OP_SPECIAL]   & func_d[`FU_XOR]   & sa_d[0];
assign inst_xori    = op_d[`OP_XORI];

assign inst_remain = !(
 //   inst_cop0     | inst_cop1     | inst_cop1x    | inst_cop2     | inst_ldc1     | inst_ldc2     |
 //   inst_lwc1     | inst_lwc2     | inst_movci    | inst_sdc1     | inst_sdc2     | inst_swc1     |
 //   inst_swc2     | 

    inst_add      | inst_addi     | inst_addiu    | inst_addu     | inst_and      | inst_andi     |
    inst_beq      | inst_beql     | inst_bgez     | inst_bgezl    | inst_bgezal   | inst_bgezall  |
    inst_bgtz     | inst_bgtzl    | inst_blez     | inst_blezl    | inst_bltz     | inst_bltzl    |
    inst_bltzal   | inst_bltzall  | inst_bne      | inst_bnel     | inst_break    | inst_cache    |
    inst_clo      | inst_clz      | inst_di       | inst_div      | inst_divu     | inst_ehb      |
    inst_ei       | inst_eret     | inst_ext      | inst_ins      | inst_j        | inst_jal      |
    inst_jalr     | inst_jalr_hb  | inst_jr       | inst_jr_hb    | inst_lb       | inst_lbu      |
    inst_lh       | inst_lhu      | inst_ll       | inst_lui      | inst_lw       | inst_lwl      |
    inst_lwr      | inst_madd     | inst_maddu    | inst_mfc0     | inst_mfhi     | inst_mflo     |
    inst_movn     | inst_movz     | inst_msub     | inst_msubu    | inst_mtc0     | inst_mthi     |
    inst_mtlo     | inst_mul      | inst_mult     | inst_multu    | inst_nop      | inst_nor      |
    inst_or       | inst_ori      | inst_pause    | inst_pref     | inst_rdhwr    | inst_rdpgpr   |
    inst_rotr     | inst_rotrv    | inst_sb       | inst_sc       | inst_sdbbp    | inst_seb      |
    inst_seh      | inst_sh       | inst_sll      | inst_sllv     | inst_slt      | inst_sltu     |
    inst_slti     | inst_sltiu    | inst_sra      | inst_srav     | inst_srl      | inst_srlv     |
    inst_ssnop    | inst_sub      | inst_subu     | inst_sw       | inst_swl      | inst_swr      |
    inst_sync     | inst_synci    | inst_syscall  | inst_teq      | inst_teqi     | inst_tge      |
    inst_tgeu     | inst_tgei     | inst_tgeiu    | inst_tlbp     | inst_tlbr     | inst_tlbwi    |
    inst_tlbwr    | inst_tlt      | inst_tltu     | inst_tlti     | inst_tltiu    | inst_tne      |
    inst_tnei     | inst_wait     | inst_wrpgpr   | inst_wsbh     | inst_xor      | inst_xori
);
				
assign ds_c0_addr = {field_rd, ds_inst[2:0]};
assign ds_ex = ds_fs_ex || inst_remain || inst_syscall || inst_break || trap_taken;

assign ds_badvaddr = ds_fs_badvaddr;
assign ds_exccode = 
    ds_fs_ex        ? ds_fs_exccode :
    inst_remain     ? `EX_RI :
    inst_syscall    ? `EX_SYS :
    trap_taken      ? `EX_SYS :
    inst_break      ? `EX_BP :
    5'b0;

always @(posedge clk) begin
    if (reset)
        llbit <= 1'b0;
    else if (handle_exc || handle_eret)
        llbit <= 1'b0;
    else if (inst_ll && ds_ready_go && es_allowin)
        llbit <= 1'b1;
    else if (inst_sc && ds_ready_go && es_allowin)
        llbit <= 1'b0;
end

assign of_check = inst_add | inst_addi | inst_sub;

assign alu_op[ 0] = inst_add  | inst_addu | inst_addi   | inst_addiu  | inst_lw | inst_sw | 
                    inst_jal  | inst_jalr | inst_bltzal | inst_bgezal | inst_lb | inst_lh |
                    inst_lbu  | inst_lhu  | inst_lwl    | inst_lwr    | inst_sb | inst_sh |
                    inst_swr  | inst_swl  | inst_ll     | inst_sc     | inst_cache;
assign alu_op[ 1] = inst_sub  | inst_subu;
assign alu_op[ 2] = inst_slt  | inst_slti;
assign alu_op[ 3] = inst_sltu | inst_sltiu;
assign alu_op[ 4] = inst_and  | inst_andi;
assign alu_op[ 5] = inst_nor;
assign alu_op[ 6] = inst_or   | inst_ori;
assign alu_op[ 7] = inst_xor  | inst_xori;
assign alu_op[ 8] = inst_sll  | inst_sllv;
assign alu_op[ 9] = inst_srl  | inst_srlv;
assign alu_op[10] = inst_sra  | inst_srav;
assign alu_op[11] = inst_lui;
assign alu_op[12] = inst_clo;
assign alu_op[13] = inst_clz;

assign store_op = {inst_swr,inst_swl,inst_sw,inst_sh,inst_sb | (inst_sc && llbit)};
assign load_op  = {inst_lwr,inst_lwl,inst_lw,inst_lhu,inst_lh,inst_lbu,inst_lb | inst_ll};

assign src1_is_sa = 
    inst_sll    | inst_srl    | inst_sra;
assign src1_is_pc = 
    inst_jal    | inst_bgezal | inst_bltzal | inst_jalr;

assign src2_is_imm =
    inst_slti   | inst_sltiu  | inst_addi   | inst_addiu  | inst_lui    | inst_lw     | inst_sw     |
    inst_lb     | inst_lbu    | inst_lh     | inst_lhu    | inst_lwl    | inst_lwr    | inst_swl    |
    inst_swr    | inst_sb     | inst_sh     ;
assign src2_is_zimm = 
    inst_andi   | inst_ori    | inst_xori   ;
assign src2_is_8 = 
    inst_jal    | inst_bgezal | inst_bltzal | inst_jalr;

assign dst_is_r31 = 
    inst_jal  | inst_bgezal | inst_bltzal;
assign dst_is_rt = 
    inst_addi   | inst_addiu  | inst_ext    | inst_lui    | inst_sltiu  | inst_slti   | inst_lw     |
    inst_andi   | inst_ori    | inst_xori   | inst_lb     | inst_lbu    | inst_lh     | inst_lhu    |
    inst_lwl    | inst_lwr    | inst_ins    | inst_mfc0;
assign dst_is_rd =
    inst_add    | inst_addu   | inst_and    | inst_clo    | inst_clz    | inst_jalr   | inst_jalr_hb|
    inst_mfhi   | inst_mflo   | (inst_movn && rt_value != 0)     | (inst_movz && rt_value == 0)     |
    inst_mul    | inst_nor    | inst_or     | inst_rotr   | inst_rotrv  | inst_seb    | inst_seh    |
    inst_sll    | inst_sllv   | inst_slt    | inst_sltu   | inst_sra    | inst_srav   | inst_srl    |
    inst_srlv   | inst_sub    | inst_subu   | inst_wsbh   | inst_xor    ;

assign gr_we = dst_is_r31 | dst_is_rt | dst_is_rd;

assign mem_we       = inst_sw | inst_sb | inst_sh | inst_swl | inst_swr | (inst_sc && llbit);
assign ds_tlbwir_cancel = (inst_tlbwi | inst_tlbr | fs_tlbwir_cancel) && ds_valid;

assign dest =
    ({5{dst_is_rd}}  &  field_rd) |
    ({5{dst_is_rt}}  &  field_rt) |
    ({5{dst_is_r31}} &  5'd31   ); 


assign rs_value[ 7: 0] = (es_we[0] && es_dest == rf_raddr1 && rf_raddr1!=0)? es_result[ 7: 0] :
                         (rs_we[0] && rs_dest == rf_raddr1 && rf_raddr1!=0)? rs_result[ 7: 0] :
                         (ms_we[0] && ms_dest == rf_raddr1 && rf_raddr1!=0)? ms_result[ 7: 0] :
                         (ws_we[0] && ws_dest == rf_raddr1 && rf_raddr1!=0)? ws_result[ 7: 0] :
                         rf_rdata1[ 7: 0];

assign rt_value[ 7: 0] = (es_we[0] && es_dest == rf_raddr2 && rf_raddr2!=0)? es_result[ 7: 0] :
                         (rs_we[0] && rs_dest == rf_raddr2 && rf_raddr2!=0)? rs_result[ 7: 0] :
                         (ms_we[0] && ms_dest == rf_raddr2 && rf_raddr2!=0)? ms_result[ 7: 0] :
                         (ws_we[0] && ws_dest == rf_raddr2 && rf_raddr2!=0)? ws_result[ 7: 0] :
                         rf_rdata2[ 7: 0];

assign rs_value[15: 8] = (es_we[1] && es_dest == rf_raddr1 && rf_raddr1!=0)? es_result[15: 8] :
                         (rs_we[1] && rs_dest == rf_raddr1 && rf_raddr1!=0)? rs_result[15: 8] :
                         (ms_we[1] && ms_dest == rf_raddr1 && rf_raddr1!=0)? ms_result[15: 8] :
                         (ws_we[1] && ws_dest == rf_raddr1 && rf_raddr1!=0)? ws_result[15: 8] :
                         rf_rdata1[15: 8];

assign rt_value[15: 8] = (es_we[1] && es_dest == rf_raddr2 && rf_raddr2!=0)? es_result[15: 8] :
                         (rs_we[1] && rs_dest == rf_raddr2 && rf_raddr2!=0)? rs_result[15: 8] :
                         (ms_we[1] && ms_dest == rf_raddr2 && rf_raddr2!=0)? ms_result[15: 8] :
                         (ws_we[1] && ws_dest == rf_raddr2 && rf_raddr2!=0)? ws_result[15: 8] :
                         rf_rdata2[15: 8];
assign rs_value[23:16] = (es_we[2] && es_dest == rf_raddr1 && rf_raddr1!=0)? es_result[23:16] :
                         (rs_we[2] && rs_dest == rf_raddr1 && rf_raddr1!=0)? rs_result[23:16] :
                         (ms_we[2] && ms_dest == rf_raddr1 && rf_raddr1!=0)? ms_result[23:16] :
                         (ws_we[2] && ws_dest == rf_raddr1 && rf_raddr1!=0)? ws_result[23:16] :
                         rf_rdata1[23:16];
assign rt_value[23:16] = (es_we[2] && es_dest == rf_raddr2 && rf_raddr2!=0)? es_result[23:16] :
                         (rs_we[2] && rs_dest == rf_raddr2 && rf_raddr2!=0)? rs_result[23:16] :
                         (ms_we[2] && ms_dest == rf_raddr2 && rf_raddr2!=0)? ms_result[23:16] :
                         (ws_we[2] && ws_dest == rf_raddr2 && rf_raddr2!=0)? ws_result[23:16] :
                         rf_rdata2[23:16];
assign rs_value[31:24] = (es_we[3] && es_dest == rf_raddr1 && rf_raddr1!=0)? es_result[31:24] :
                         (rs_we[3] && rs_dest == rf_raddr1 && rf_raddr1!=0)? rs_result[31:24] :
                         (ms_we[3] && ms_dest == rf_raddr1 && rf_raddr1!=0)? ms_result[31:24] :
                         (ws_we[3] && ws_dest == rf_raddr1 && rf_raddr1!=0)? ws_result[31:24]:
                         rf_rdata1[31:24];
assign rt_value[31:24] = (es_we[3] && es_dest == rf_raddr2 && rf_raddr2!=0)? es_result[31:24] :
                         (rs_we[3] && rs_dest == rf_raddr2 && rf_raddr2!=0)? rs_result[31:24] :
                         (ms_we[3] && ms_dest == rf_raddr2 && rf_raddr2!=0)? ms_result[31:24] :
                         (ws_we[3] && ws_dest == rf_raddr2 && rf_raddr2!=0)? ws_result[31:24] :
                         rf_rdata2[31:24];

assign trap_imm = {{16{imm[15]}}, imm};

assign trap = inst_teq | inst_teqi | inst_tge | inst_tgei | inst_tgeu | inst_tgeiu |
              inst_tlt | inst_tltu | inst_tlti | inst_tltiu | inst_tne | inst_tnei;

assign trap_taken = inst_teq   && rs_value == rt_value ||
                    inst_teqi  && rs_value == trap_imm ||
		    inst_tge   && $signed(rs_value) >= $signed(rt_value) ||
		    inst_tgei  && $signed(rs_value) >= $signed(trap_imm) ||
		    inst_tgeu  && rs_value >= rt_value ||
		    inst_tgeiu && rs_value >= trap_imm ||
		    inst_tlt   && $signed(rs_value) <  $signed(rt_value) ||
		    inst_tltu  && rs_value <  rt_value ||
		    inst_tlti  && $signed(rs_value) <  $signed(trap_imm) ||
		    inst_tltiu && rs_value <  trap_imm ||
		    inst_tne   && rs_value != rt_value ||
		    inst_tnei  && rs_value != trap_imm ;

assign rf_raddr1 = field_rs;
assign rf_raddr2 = field_rt;
ysyx_210101_regfile ysyx_210101_u_regfile(
    .clk    (clk      ),
    .reset  (reset    ),
    .raddr1 (rf_raddr1),
    .rdata1 (rf_rdata1),
    .raddr2 (rf_raddr2),
    .rdata2 (rf_rdata2),
    .we     (rf_we    ),
    .waddr  (rf_waddr ),
    .wdata  (rf_wdata )
);
endmodule

//=============================================================================================================================//
module ysyx_210101_exe_stage(
    input                          clk           ,
    input                          reset         ,
	
    //allowin
    input                          rs_allowin    ,
    output                         es_allowin    ,
    //to fs
    output [`BR_BUS_WD       -1:0] br_bus        ,
    output                         br_leaving    ,

    //from ds
    input                          ds_to_es_valid,
    input  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,
	
    //to ms
    output                         es_to_rs_valid,
    output [`ES_TO_RS_BUS_WD -1:0] es_to_rs_bus  ,
	
    //to ds:forward
    output [45:0] es_reg,
	input refresh_tlb_cache,
    //TLB search port 1
    output [18:0] s1_vpn2,     
    output        s1_odd_page,
    input         s1_found,     
    input  [ 3:0] s1_index,     
    input  [19:0] s1_pfn,     
    input  [ 2:0] s1_c,     
    input         s1_d,     
    input         s1_v,

	output        es_tlbp,
	output        es_tlbr,
	output        es_tlbwi,
    output        es_tlbwr,

    input  [31:0] cp0_entryhi,
    input         handle_exc,      
    input         handle_eret,
    input         pipe_flush,
	
	output [ 7:0]  es_c0_addr,
	output [31:0]  mtc0_data,
	output [31:0] pipe_flush_pc,
	output         mtc0_we,
	input  [31:0]  mfc0_rdata,
    output         es_tlbwir_cancel,

    output jr_we,
    output [31:0] jr_realtarget,
    output no_predict,
    output ds_br,
    output ds_br_taken,
    output [31:0] es_pc 
);

/****************************** SIGNAL DECLARE *******************************/
wire [25:0] jidx;
wire [15:0] imm;

wire [31:0] es_result;
wire [31:0] _es_result;
wire        es_inst_eret;
wire        es_inst_mfc0;
wire        es_inst_mtc0;
wire        es_inst_mult;
wire        es_inst_multu;
wire        es_inst_div;
wire        es_inst_divu;
wire        es_inst_mthi;
wire        es_inst_mtlo;
wire        es_inst_mfhi;
wire        es_inst_mflo;
wire        es_inst_mul;

wire inst_madd;
wire inst_maddu;
wire inst_msub;
wire inst_msubu;

wire        es_of_check      ;
wire        es_ds_ex      ;
wire        es_ds_bd      ;
wire [31:0] es_ds_badvaddr;       
wire [ 4:0] es_ds_exccode ;

wire [13:0] es_alu_op     ;
wire [ 4:0] es_store_op   ;
wire [ 6:0] es_load_op    ;

wire        es_src1_is_sa ;  
wire        es_src1_is_pc ;
wire        es_src2_is_imm; 
wire        es_src2_is_zimm;
wire        es_src2_is_8  ;
wire        es_gr_we      ;
wire        es_mem_we     ;

wire [31:0] es_alu_src1;
wire [31:0] es_alu_src2;
wire [31:0] es_alu_result;

wire [ 4:0] es_dest       ;
wire [15:0] es_imm        ;
wire [31:0] es_rs_value   ;
wire [31:0] es_rt_value   ;
wire [31:0] data_sram_physical_addr   ;

wire        has_ex;
wire        overflow;
wire        ades;
wire        adel;
wire        es_ex;

reg         es_valid      ;
wire        es_ready_go   ;


// TLB query: 0 for get, 1 for querying
reg [1:0] tlb_query_state;
reg [1:0] next_state;
wire tlb_hit;


wire        data_sram_wr;
wire [ 1:0] data_sram_size;
wire [ 3:0] data_sram_wstrb;
wire [31:0] data_sram_addr;
wire [31:0] data_sram_wdata;
wire         es_bd;
wire [ 4:0]  es_exccode;
wire [31:0]  es_badvaddr;
wire         fs_pc_error;

reg  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;
wire inst_mov;
wire sc_fail;
wire sc_success;
wire [4:0] cache_op;

wire        es_res_from_mem;
wire        es_is_load;
wire        es_is_store;

wire [ 3:0] addr_align;
wire [31:0] es_sb_value;
wire [31:0] es_sh_value;
wire [31:0] es_sw_value;
wire [31:0] es_swl_value;
wire [31:0] es_swr_value;
wire [ 3:0] sb_strb;
wire [ 3:0] sh_strb;
wire [ 3:0] sw_strb;
wire [ 3:0] swl_strb;
wire [ 3:0] swr_strb;
wire [ 3:0] strb;

reg [   18:0] tlb_history_vpn2;
reg [   19:0] tlb_history_pfn ;
reg           tlb_history_odd ;
reg           tlb_history_found;
reg           tlb_history_v   ;
reg           tlb_history_d   ;
reg           tlb_history_vv  ;

wire [31:0] _real_address;
wire kseg1;
wire mapped;

wire        br_stall;
wire        is_branch;
wire        br_taken;
wire [31:0] br_target;
wire        br_cancel;
reg  [ 2:0] br_cnt;
reg  [31:0] br_target_r;
wire [31:0] next_br_target;
wire [31:0] ds_pc;
wire ds_bd;
wire br_bd;

wire wait_translation;

`ifdef USE_TLB
always @(posedge clk) begin
    if (reset)
        tlb_query_state <= 2'b0;
    else 
        tlb_query_state <= next_state; 
end

assign es_tlbwir_cancel = (es_tlbwi | es_tlbwr | es_tlbr) && es_valid;
assign tlb_hit = es_alu_result[12] == tlb_history_odd && es_alu_result[31:13] == tlb_history_vpn2 && tlb_history_v;

always @(*) begin
    case (tlb_query_state)
        0:
            if ((tlb_hit || !mapped) && (es_is_load || es_is_store))
                next_state = 0;
            else if (es_is_load || es_is_store)
                next_state = 1;
            else
                next_state = 0;
        1:
            next_state = 2;
        2:
            next_state = 0;
        default: next_state = 0;
    endcase 
end

always @(posedge clk) begin
    if (reset) begin
        tlb_history_vpn2 <= 19'b0;
        tlb_history_pfn  <= 20'b0;
        tlb_history_odd  <=  1'b0;
        tlb_history_v    <=  1'b0;
        tlb_history_d    <=  1'b0;
        tlb_history_vv   <=  1'b0;
        tlb_history_found<=  1'b0;
    end else if (handle_exc || es_inst_mtc0) begin
        tlb_history_v    <=  1'b0;
    end else if (tlb_query_state == 0 && !tlb_hit && (es_is_load || es_is_store)) begin
        tlb_history_vpn2 <= es_alu_result[31:13]; 
        tlb_history_odd  <= es_alu_result[12];
    end else if (tlb_query_state == 1) begin
        tlb_history_pfn  <= s1_pfn;    
        tlb_history_v <= 1;    
        tlb_history_found<= s1_found;
        tlb_history_vv   <= s1_v;
        tlb_history_d    <= s1_d;
    end
end
`else
assign es_tlbwir_cancel = 0;
`endif

wire inst_cache;
wire inst_beq;
wire inst_bne;
wire inst_bgez;
wire inst_bgtz;
wire inst_blez;
wire inst_bltz;
wire inst_bgezal;
wire inst_bltzal;
wire inst_jal;
wire inst_j;
wire inst_jr;
wire inst_jalr;
wire ds_to_es_tlb_refill;
wire ds_to_es_tlbwir_cancel;
wire es_tlb_miss;
wire exception_tlb_refill;
wire es_ex_tlb;
wire es_tlb_invalid;
wire es_tlb_mod;
wire es_tlb_ex;
wire es_overflow;

wire [63:0] mult_result;
wire [63:0] multu_result;
wire [63:0] div_result;
wire [63:0] divu_result;
reg  mul_tvalid;
wire mul_out_tvalid;
reg  div_tvalid;
wire div_out_tvalid;

assign {
    cache_op,
    inst_cache,
    sc_fail,
    sc_success,
    inst_mov,
    inst_madd,
    inst_maddu,
    inst_msub,
    inst_msubu,      //271:271
    inst_beq,
    inst_bne,
    inst_bgez,
    inst_bgtz,
    inst_blez,
    inst_bltz,
    inst_bgezal,
    inst_bltzal,
    inst_j,
    inst_jr,
    inst_jal,
    inst_jalr,        //259:259
    imm,              //258:243
    jidx,             //242:217
    fs_pc_error,      //216:216
    ds_to_es_tlb_refill,  //215:215
    ds_to_es_tlbwir_cancel, //214:214
    es_tlbp        ,  //213:213
    es_tlbr        ,  //212:212 
    es_tlbwi       ,  //211:211
    es_tlbwr       ,  //210:210
    es_of_check    ,  //209:209
    es_ds_badvaddr ,  //208:177    
    es_ds_exccode  ,  //176:172
    es_ds_ex       ,  //171:171
    es_ds_bd       ,  //170:170
    es_inst_mul    ,  //169:169
    es_inst_eret   ,  //168:168
    es_inst_mfc0   ,  //167:167
    es_inst_mtc0   ,  //166:166
    es_c0_addr     ,  //165:158
    es_alu_op      ,  //157:144
    es_store_op    ,  //143:139
    es_load_op     ,  //138:132
    es_inst_mult   ,  //131:131
    es_inst_multu  ,  //130:130
    es_inst_div    ,  //129:129
    es_inst_divu   ,  //128:128
    es_inst_mthi   ,  //127:127
    es_inst_mtlo   ,  //126:126
    es_inst_mfhi   ,  //125:125
    es_inst_mflo   ,  //124:124
    es_src1_is_sa  ,  //123:123
    es_src1_is_pc  ,  //122:122
    es_src2_is_imm ,  //121:121
    es_src2_is_zimm,  //120:120
    es_src2_is_8   ,  //119:119
    es_gr_we       ,  //118:118
    es_mem_we      ,  //117:117
    es_dest        ,  //116:112
    es_imm         ,  //111:96
    es_rs_value    ,  //95 :64
    es_rt_value    ,  //63 :32
    es_pc             //31 :0
} = ds_to_es_bus_r;


`ifdef USE_TLB
assign exception_tlb_refill = (es_tlb_miss || ds_to_es_tlb_refill) && es_valid;
assign pipe_flush_pc = es_pc;
`else 
assign exception_tlb_refill = 0;
assign pipe_flush_pc = 32'b0;
`endif

assign mtc0_data = es_rt_value;
assign  es_result = inst_mov ? es_rs_value : es_inst_mfc0 ? mfc0_rdata : es_inst_mul ? mult_result[31:0] : es_alu_result;
assign _es_result = es_alu_result;

`ifdef USE_TLB
assign es_ex_tlb = (es_exccode == `EX_TLBL || es_exccode == `EX_TLBS || 
                    es_exccode == `EX_MOD) && es_valid;
//exception
assign es_tlb_miss    = mapped && !tlb_history_found && (es_is_load || es_is_store);
assign es_tlb_invalid = mapped && tlb_history_found && !tlb_history_vv && (es_is_load || es_is_store);
assign es_tlb_mod     = mapped && tlb_history_found && tlb_history_vv && !tlb_history_d && es_is_store;
assign es_tlb_ex      = es_tlb_miss | es_tlb_invalid | es_tlb_mod;  
`else
assign es_ex_tlb      = 0;
assign es_tlb_miss    = 0;
assign es_tlb_invalid = 0;
assign es_tlb_mod     = 0;
assign es_tlb_ex      = 0;  
`endif

assign es_overflow = es_of_check && overflow;

assign es_ex = es_ds_ex    | es_overflow    | ades      | adel 
             | es_tlb_miss | es_tlb_invalid | es_tlb_mod;

assign es_bd = ds_bd;

assign es_badvaddr = es_ds_ex ? es_ds_badvaddr :
                     es_tlb_ex ? es_alu_result :
                     ades || adel ? es_result : 32'b0 ;                

assign es_exccode =  es_ds_ex ? es_ds_exccode :
                     es_tlb_mod ? `EX_MOD :
                     (es_tlb_miss || es_tlb_invalid) && es_is_load  ? `EX_TLBL :
                     (es_tlb_miss || es_tlb_invalid) && es_is_store ? `EX_TLBS :
                     es_overflow ? `EX_OV :
                     ades ? `EX_ADES :
                     adel ? `EX_ADEL : 5'b0;
assign mtc0_we = es_valid && es_inst_mtc0 && !es_ex && !br_cancel;

`ifdef USE_TLB
assign has_ex = es_ex || ds_to_es_tlbwir_cancel && es_valid;
`else
assign has_ex = es_ex && es_valid;
`endif

assign es_is_store = |es_store_op;
assign es_is_load  = |es_load_op;
assign es_res_from_mem = es_is_load;

`ifdef USE_TLB
assign kseg1 = mapped ? data_sram_physical_addr[31:29] == 3'b101 : es_alu_result[31:29] == 3'b101;
`else
assign kseg1 = es_alu_result[31:29] == 3'b101;
`endif

wire data_cache = !kseg1 && `USE_DCACHE;
assign es_to_rs_bus = {538{!br_cancel}} & {
    cache_op,
    inst_cache,
    sc_fail,
    sc_success,
    inst_madd,
    inst_maddu,
    inst_msub,
    inst_msubu,
    data_cache,
    es_inst_mul,
    es_inst_mfhi,
    es_inst_mflo,
    es_inst_mthi,
    es_inst_mtlo,
    es_inst_mult,
    es_inst_multu,
    es_inst_div,
    es_inst_divu,
    es_rs_value,
    div_result,
    divu_result,
    mult_result,
    multu_result,
    fs_pc_error,
    es_inst_eret,          //226:226
    ds_to_es_tlbwir_cancel,//225:225
    exception_tlb_refill, //224:224
    data_sram_addr ,      //223:192
    data_sram_wr   ,      //191:191
    data_sram_wdata,      //190:159
    data_sram_size ,      //158:157
    data_sram_wstrb,      //156:153
    has_ex         ,      //152:152
    es_ex          ,      //151:151
    es_bd          ,      //150:150
    es_badvaddr    ,      //149:118
    es_exccode     ,      //117:113
    es_inst_mfc0   ,      //112:112
    mfc0_rdata     ,      //111:80
    es_is_load     ,      //79:79
    es_is_store    ,      //78:78
    es_load_op     ,      //77:71
    es_res_from_mem,      //70:70
    (es_gr_we && !es_ex),   //69:69
    es_dest        ,      //68:64
    es_result      ,      //63:32
    es_pc                 //31:0
};

`ifdef USE_TLB
assign es_ready_go    = (es_is_load | es_is_store) && !br_cancel ? !wait_translation :
                        ((es_inst_div | es_inst_divu) & div_out_tvalid) |
                        ((es_inst_mul | es_inst_mult | es_inst_multu | inst_madd | inst_maddu | inst_msub | inst_msubu) & mul_out_tvalid) |
                        (~es_inst_div & ~es_inst_divu & ~es_inst_mul & ~es_inst_mult & ~es_inst_multu & ~inst_madd & ~inst_maddu & ~inst_msub & ~inst_msubu) |
                        br_cancel;
`else
assign es_ready_go    = ((es_inst_div | es_inst_divu) & div_out_tvalid) |
                        ((es_inst_mul | es_inst_mult | es_inst_multu | inst_madd | inst_maddu | inst_msub | inst_msubu) & mul_out_tvalid) |
                        (~es_inst_div & ~es_inst_divu & ~es_inst_mul & ~es_inst_mult & ~es_inst_multu & ~inst_madd & ~inst_maddu & ~inst_msub & ~inst_msubu) |
                        br_cancel;
`endif

assign es_allowin     = !es_valid || es_ready_go && rs_allowin;
assign es_to_rs_valid = es_valid && es_ready_go && !handle_exc && !handle_eret && !pipe_flush;

always @(posedge clk) begin
    if (reset) begin
        es_valid <= 1'b0;
    end
	else if (handle_exc || handle_eret || pipe_flush) begin
		es_valid <= 1'b0;
	end
    else if (es_allowin) begin
        es_valid <= ds_to_es_valid;
    end

    if (reset) begin
        ds_to_es_bus_r <= `DS_TO_ES_BUS_WD'b0;
    end
    else if (ds_to_es_valid && es_allowin) begin
        ds_to_es_bus_r <= ds_to_es_bus;
    end
end

reg sign;
always @(posedge clk) begin
    if (reset)
        sign <= 1'b0;
    if (es_allowin)
        sign <= ds_to_es_valid;
    else if (sign)
        sign <= 1'b0;
end

//execute
assign es_alu_src1 = es_src1_is_sa  ? {27'b0, es_imm[10:6]} : 
                     es_src1_is_pc  ? es_pc[31:0] :
                                      es_rs_value;
assign es_alu_src2 = es_src2_is_imm ? {{16{es_imm[15]}}, es_imm[15:0]} : 
                     es_src2_is_zimm? {{16{1'b0}},es_imm[15:0]} :
                     es_src2_is_8   ? 32'd8 :
                                      es_rt_value;

ysyx_210101_alu ysyx_210101_u_alu(
    .alu_op     (es_alu_op    ),
    .alu_src1   (es_alu_src1  ),
    .alu_src2   (es_alu_src2  ),
    .alu_result (es_alu_result),
    .overflow   (overflow     )
    );

always @(posedge clk) begin
    if (reset) begin
        mul_tvalid <= 1'b0;
    end
    else if(ds_to_es_valid && es_allowin) begin
        mul_tvalid <= (ds_to_es_bus[130:130] || ds_to_es_bus[131:131] || ds_to_es_bus[169:169] || 
                       ds_to_es_bus[271:271] || ds_to_es_bus[272:272] || ds_to_es_bus[273:273] || ds_to_es_bus[274:274]);
    end
    else if(mul_tvalid && mul_out_tvalid)begin
        mul_tvalid <= 1'b0;
    end
end

ysyx_210101_mymul ysyx_210101_mymul(
    .clk             (clk           ),
    .reset           (reset         ),
    .mul_tvalid      (mul_tvalid && !br_cancel),
    .mul_signed      (!(es_inst_multu | inst_maddu | inst_msubu)),   //1'b1 signed; 1'b0 unsigned
    .x               (es_rs_value   ),
    .y               (es_rt_value   ),
    .mul_out_tvalid  (mul_out_tvalid),
    .result          (mult_result   )
);
assign multu_result = mult_result;

always @(posedge clk) begin
    if (reset) begin
        div_tvalid <= 1'b0;
    end
    else if(ds_to_es_valid && es_allowin) begin
        div_tvalid <= (ds_to_es_bus[129:129] || ds_to_es_bus[128:128]);
    end
    else if(div_tvalid && div_out_tvalid)begin
        div_tvalid <= 1'b0;
    end
end

ysyx_210101_mydiv ysyx_210101_mydiv(
    .clk                (clk),
    .reset              (reset),
    .div_tvalid         (div_tvalid && !br_cancel),
    .div_signed         (es_inst_div),
    .div_divisor        (es_rt_value),
    .div_dividend       (es_rs_value),
    .div_out_tvalid     (div_out_tvalid),
    .div_result         (div_result),
    .exception          (handle_exc || handle_eret || pipe_flush)
);
assign divu_result = div_result;

assign es_reg = {{4{es_gr_we & es_valid && !br_cancel}},
				   es_inst_mul && es_valid && !br_cancel,
                   es_is_load && es_valid && !br_cancel,
        		   es_inst_mfc0 && es_valid && !br_cancel,
                   es_inst_mfhi && es_valid && !br_cancel,
                   es_inst_mflo && es_valid && !br_cancel,
				   es_dest & {5{es_valid && !br_cancel}},
				   es_alu_result};

//unalign store
assign addr_align = {es_alu_result[1:0] == 2'b11, es_alu_result[1:0] == 2'b10,
                     es_alu_result[1:0] == 2'b01, es_alu_result[1:0] == 2'b00};
assign es_sw_value   = es_rt_value;
assign es_sb_value   = ({32{addr_align[0]}} & {24'b0, es_rt_value[7:0]       }) |
                       ({32{addr_align[1]}} & {16'b0, es_rt_value[7:0],  8'b0}) |
                       ({32{addr_align[2]}} & { 8'b0, es_rt_value[7:0], 16'b0}) |
                       ({32{addr_align[3]}} & {       es_rt_value[7:0], 24'b0}) ;
assign es_sh_value   = ({32{~es_alu_result[1]}} & {16'b0, es_rt_value[15:0]       }) |
                       ({32{ es_alu_result[1]}} & {       es_rt_value[15:0], 16'b0}) ;
assign es_swl_value  = ({32{addr_align[0]}} & {24'b0, es_rt_value[31:24]}) |
                       ({32{addr_align[1]}} & {16'b0, es_rt_value[31:16]}) |
                       ({32{addr_align[2]}} & { 8'b0, es_rt_value[31: 8]}) |
                       ({32{addr_align[3]}} &  es_rt_value)                 ;
assign es_swr_value  = ({32{addr_align[0]}} &  es_rt_value              ) |
                       ({32{addr_align[1]}} & {es_rt_value[23:0], 8'b0}) |
                       ({32{addr_align[2]}} & {es_rt_value[15:0],16'b0}) |
                       ({32{addr_align[3]}} & {es_rt_value[ 7:0],24'b0}) ;
assign sw_strb  = 4'b1111;
assign sb_strb  = {addr_align[3], addr_align[2],  addr_align[1],  addr_align[0]};
assign sh_strb  = {es_alu_result[1], es_alu_result[1], ~es_alu_result[1], ~es_alu_result[1]};
assign swl_strb = {es_alu_result[1] & es_alu_result[0], es_alu_result[1], es_alu_result[1] | es_alu_result[0], 1'b1};
assign swr_strb = {1'b1, ~(es_alu_result[1] & es_alu_result[0]), ~es_alu_result[1], ~(es_alu_result[1] | es_alu_result[0])};

assign strb     = ({4{es_store_op[0]}} & sb_strb ) |
                  ({4{es_store_op[1]}} & sh_strb ) |
                  ({4{es_store_op[2]}} & sw_strb ) |
                  ({4{es_store_op[3]}} & swl_strb) |
                  ({4{es_store_op[4]}} & swr_strb) ;

assign ades = (es_store_op[2] & (es_alu_result[1:0]!=2'b00)) | (es_store_op[1] & (es_alu_result[0]!=1'b0));
assign adel = ( es_load_op[4] & (es_alu_result[1:0]!=2'b00)) | ((es_load_op[2] | es_load_op[3]) & (es_alu_result[0]!=1'b0));

// SRAM interface
wire   data_size_1;
wire   data_size_2;

`ifdef USE_TLB
assign wait_translation = mapped && !(tlb_query_state == 0 && tlb_hit);
`endif

assign data_sram_wr  = es_is_store & !ades & !adel && !br_cancel;

assign data_size_2 = es_store_op[2] | es_load_op[4] |
                    ((es_store_op[3] | es_load_op[5]) && (es_alu_result[1:0] == 2'b10 || es_alu_result[1:0] == 2'b11)) | 
                    ((es_store_op[4] | es_load_op[6]) && (es_alu_result[1:0] == 2'b00 || es_alu_result[1:0] == 2'b01)) ; 
assign data_size_1 = es_store_op[1] | es_load_op[2] | es_load_op[3] |
                    ((es_store_op[3] | es_load_op[5]) && (es_alu_result[1:0] == 2'b01)) | 
                    ((es_store_op[4] | es_load_op[6]) && (es_alu_result[1:0] == 2'b10)) ; 
assign data_sram_size = data_size_2 ? 2'b10 : data_size_1 ? 2'b01 : 2'b0; 
assign data_sram_wstrb = es_mem_we && es_valid && (!has_ex) ? strb : 4'h0;


assign _real_address = es_alu_result & (es_alu_result[31:30] == 2'b10 ? 32'h1fffffff : 32'hffffffff);

`ifdef USE_TLB
assign data_sram_addr = mapped ? data_sram_physical_addr : _real_address;
`else
assign data_sram_addr = _real_address;
`endif

assign data_sram_wdata = ({32{es_store_op[0]}} & es_sb_value ) |
                         ({32{es_store_op[1]}} & es_sh_value ) |
                         ({32{es_store_op[2]}} & es_sw_value ) |
                         ({32{es_store_op[3]}} & es_swl_value) |
                         ({32{es_store_op[4]}} & es_swr_value) ;
// TLB related
`ifdef USE_TLB
assign mapped      = ~es_alu_result[31] | (es_alu_result[31] & es_alu_result[30]);
assign s1_vpn2     =  es_tlbp ? cp0_entryhi[31:13] : tlb_history_vpn2;
assign s1_odd_page =  es_tlbp ? 0 : tlb_history_odd;
assign data_sram_physical_addr = {tlb_history_pfn, {es_alu_result[11:0]}} 
                   & ((es_store_op[3] | es_load_op[5]) ? 32'hfffffffc : 32'hffffffff);
`else
assign s1_vpn2     = 0;
assign s1_odd_page = 0;
`endif

assign br_bus = {
    br_taken && es_ready_go && rs_allowin && !br_cancel,
    br_target
};

assign ds_br = is_branch;
assign ds_br_taken = br_taken && br_leaving;
assign jr_we = inst_jr;
assign jr_realtarget = br_target;
assign no_predict = br_cnt != 0;
// branch counter
assign ds_pc = es_pc + 4;
assign next_br_target = br_target;
assign br_cancel      = br_cnt != 0 && br_cnt != 1 && !(es_pc == br_target_r);
assign br_bd          = br_cnt == 1;
assign ds_bd = br_bd;

always @(posedge clk) begin
	if (reset)
		br_cnt <= 3'b0;
	else if (handle_exc || handle_eret || pipe_flush)
		br_cnt <= 3'b0;
	else if (is_branch && es_valid && !br_cancel && rs_allowin && es_ready_go)
		br_cnt <= 3'b1;
	else if (es_pc == br_target_r)
		br_cnt <= 3'b0;
	else if (br_cnt != 3'b0 && es_valid && rs_allowin && es_ready_go)
		br_cnt <= br_cnt + 1'b1;
end

always @(posedge clk) begin
	if (reset) begin
		br_target_r <= 32'b0;
	end else if (is_branch && es_ready_go && !br_cancel) begin
		br_target_r <= next_br_target;
	end
end

wire        rs_eq_rt;
wire        rs_gez;
wire        rs_gtz;
assign rs_eq_rt = (es_rs_value == es_rt_value);
assign rs_gez = !es_rs_value[31];
assign rs_gtz = !es_rs_value[31] && es_rs_value!=0;

assign is_branch = es_valid && (inst_beq | inst_bne | inst_bgez | inst_bgtz | inst_blez | inst_bltz | inst_bgezal | inst_bltzal | inst_jal | inst_j | inst_jr | inst_jalr);
assign br_leaving = is_branch && sign && !br_cancel;//&& es_ready_go && rs_allowin && !br_cancel;
assign br_taken = (   inst_beq    &&  rs_eq_rt
                   || inst_bne    && !rs_eq_rt
                   || inst_bgez   &&  rs_gez
                   || inst_bgtz   &&  rs_gtz
                   || inst_blez   && !rs_gtz
                   || inst_bltz   && !rs_gez
                   || inst_bgezal && rs_gez
                   || inst_bltzal && !rs_gez
                   || inst_jal
                   || inst_j
                   || inst_jr
                   || inst_jalr
                  ) && es_valid ;

wire br_b = inst_beq || inst_bne || inst_bgez || inst_bgtz || inst_blez || inst_bltz || inst_bgezal || inst_bltzal;

assign br_target = ({32{inst_jr | inst_jalr }} & es_rs_value                                         ) |
                   ({32{~br_taken           }} & (es_pc + 32'h8                                   )) |
                   ({32{ br_taken & br_b    }} & (es_pc + 32'h4 + {{14{imm[15]}}, imm[15:0], 2'b0})) |
                   ({32{inst_j  | inst_jal  }} & {ds_pc[31:28], jidx[25:0], 2'b0}                 ) ;
endmodule

module ysyx_210101_mymul(
    input         clk                ,
    input         reset              ,
    input         mul_tvalid         ,
    input         mul_signed         ,   //1'b1 signed; 1'b0 unsigned
    input  [31:0] y,
    input  [31:0] x,
    output reg    mul_out_tvalid     ,
    output [63:0] result
);

reg  [63:0] s_to_plus_r;
reg  [63:0] c_to_plus_r;
reg  final_c;

wire [32:0] input_x;     //input to booth_coder
wire [34:0] input_y;     //input to booth_coder
wire [63:0] p[16:0];     //output from booth_coder part_product
wire [16:0] c;           //output from booth_coder plus 1 for ins, mind c[16] is always 0
wire [16:0] out[63:0];   //output from switch
//wire [13:0] c_to_tree[64:0];  //carryin for tree, only 0-63 will be used, 0 come from plus 1 for ins
wire [63:0] c_to_plus;        //carryin to final plus, come from tree0 - tree63
wire [63:0] final_c_to_plus;  //final plus, come from tree0 - tree62 and c[14]
wire [63:0] s_to_plus;        //final plus, come from tree0 - tree63


assign input_x = {(mul_signed & x[31]),x};
assign input_y = {{2{(mul_signed & y[31])}},y,1'b0};

always @(posedge clk) begin
    if (reset) begin
        mul_out_tvalid <= 0;
    end else if (mul_tvalid) begin
        mul_out_tvalid <= 1;
    end else begin
        mul_out_tvalid <= 0;
    end
end

ysyx_210101_booth_coder inst_booth_coder_0(
    .x(input_x),
    .y(input_y[2:0]),
    .i(6'b0),
    .p(p[0]),
    .c(c[0])
);
ysyx_210101_booth_coder inst_booth_coder_1(
    .x(input_x),
    .y(input_y[4:2]),
    .i(6'd2),
    .p(p[1]),
    .c(c[1])
);
ysyx_210101_booth_coder inst_booth_coder_2(
    .x(input_x),
    .y(input_y[6:4]),
    .i(6'd4),
    .p(p[2]),
    .c(c[2])
);
ysyx_210101_booth_coder inst_booth_coder_3(
    .x(input_x),
    .y(input_y[8:6]),
    .i(6'd6),
    .p(p[3]),
    .c(c[3])
);
ysyx_210101_booth_coder inst_booth_coder_4(
    .x(input_x),
    .y(input_y[10:8]),
    .i(6'd8),
    .p(p[4]),
    .c(c[4])
);
ysyx_210101_booth_coder inst_booth_coder_5(
    .x(input_x),
    .y(input_y[12:10]),
    .i(6'd10),
    .p(p[5]),
    .c(c[5])
);
ysyx_210101_booth_coder inst_booth_coder_6(
    .x(input_x),
    .y(input_y[14:12]),
    .i(6'd12),
    .p(p[6]),
    .c(c[6])
);
ysyx_210101_booth_coder inst_booth_coder_7(
    .x(input_x),
    .y(input_y[16:14]),
    .i(6'd14),
    .p(p[7]),
    .c(c[7])
);
ysyx_210101_booth_coder inst_booth_coder_8(
    .x(input_x),
    .y(input_y[18:16]),
    .i(6'd16),
    .p(p[8]),
    .c(c[8])
);
ysyx_210101_booth_coder inst_booth_coder_9(
    .x(input_x),
    .y(input_y[20:18]),
    .i(6'd18),
    .p(p[9]),
    .c(c[9])
);
ysyx_210101_booth_coder inst_booth_coder_10(
    .x(input_x),
    .y(input_y[22:20]),
    .i(6'd20),
    .p(p[10]),
    .c(c[10])
);
ysyx_210101_booth_coder inst_booth_coder_11(
    .x(input_x),
    .y(input_y[24:22]),
    .i(6'd22),
    .p(p[11]),
    .c(c[11])
);
ysyx_210101_booth_coder inst_booth_coder_12(
    .x(input_x),
    .y(input_y[26:24]),
    .i(6'd24),
    .p(p[12]),
    .c(c[12])
);
ysyx_210101_booth_coder inst_booth_coder_13(
    .x(input_x),
    .y(input_y[28:26]),
    .i(6'd26),
    .p(p[13]),
    .c(c[13])
);
ysyx_210101_booth_coder inst_booth_coder_14(
    .x(input_x),
    .y(input_y[30:28]),
    .i(6'd28),
    .p(p[14]),
    .c(c[14])
);
ysyx_210101_booth_coder inst_booth_coder_15(
    .x(input_x),
    .y(input_y[32:30]),
    .i(6'd30),
    .p(p[15]),
    .c(c[15])
);
ysyx_210101_booth_coder inst_booth_coder_16(
    .x(input_x),
    .y(input_y[34:32]),
    .i(6'd32),
    .p(p[16]),
    .c(c[16])
);

ysyx_210101_switch inst_switch(
    .p0(p[0]),
    .p1(p[1]),    .p9(p[9]),
    .p2(p[2]),    .p10(p[10]),
    .p3(p[3]),    .p11(p[11]),
    .p4(p[4]),    .p12(p[12]),
    .p5(p[5]),    .p13(p[13]),
    .p6(p[6]),    .p14(p[14]),
    .p7(p[7]),    .p15(p[15]),
    .p8(p[8]),    .p16(p[16]),

    .out1(out[0]),    .out9(out[8]),
    .out2(out[1]),    .out10(out[9]),
    .out3(out[2]),    .out11(out[10]),
    .out4(out[3]),    .out12(out[11]),
    .out5(out[4]),    .out13(out[12]),
    .out6(out[5]),    .out14(out[13]),
    .out7(out[6]),    .out15(out[14]),
    .out8(out[7]),    .out16(out[15]),
    .out17(out[16]),  .out25(out[24]),
    .out18(out[17]),  .out26(out[25]),
    .out19(out[18]),  .out27(out[26]),
    .out20(out[19]),  .out28(out[27]),
    .out21(out[20]),  .out29(out[28]),
    .out22(out[21]),  .out30(out[29]),
    .out23(out[22]),  .out31(out[30]),
    .out24(out[23]),  .out32(out[31]),
    .out33(out[32]),  .out41(out[40]),
    .out34(out[33]),  .out42(out[41]),
    .out35(out[34]),  .out43(out[42]),
    .out36(out[35]),  .out44(out[43]),
    .out37(out[36]),  .out45(out[44]),
    .out38(out[37]),  .out46(out[45]),
    .out39(out[38]),  .out47(out[46]),
    .out40(out[39]),  .out48(out[47]),
    .out49(out[48]),  .out57(out[56]),
    .out50(out[49]),  .out58(out[57]),
    .out51(out[50]),  .out59(out[58]),
    .out52(out[51]),  .out60(out[59]),
    .out53(out[52]),  .out61(out[60]),
    .out54(out[53]),  .out62(out[61]),
    .out55(out[54]),  .out63(out[62]),
    .out56(out[55]),  .out64(out[63])
);

wire [13:0] c_to_tree0,c_to_tree1,c_to_tree2,c_to_tree3,c_to_tree4,c_to_tree5,c_to_tree6,c_to_tree7;
wire [13:0] c_to_tree8,c_to_tree9,c_to_tree10,c_to_tree11,c_to_tree12,c_to_tree13,c_to_tree14,c_to_tree15;
wire [13:0] c_to_tree16,c_to_tree17,c_to_tree18,c_to_tree19,c_to_tree20,c_to_tree21,c_to_tree22,c_to_tree23;
wire [13:0] c_to_tree24,c_to_tree25,c_to_tree26,c_to_tree27,c_to_tree28,c_to_tree29,c_to_tree30,c_to_tree31;
wire [13:0] c_to_tree32,c_to_tree33,c_to_tree34,c_to_tree35,c_to_tree36,c_to_tree37,c_to_tree38,c_to_tree39;
wire [13:0] c_to_tree40,c_to_tree41,c_to_tree42,c_to_tree43,c_to_tree44,c_to_tree45,c_to_tree46,c_to_tree47;
wire [13:0] c_to_tree48,c_to_tree49,c_to_tree50,c_to_tree51,c_to_tree52,c_to_tree53,c_to_tree54,c_to_tree55;
wire [13:0] c_to_tree56,c_to_tree57,c_to_tree58,c_to_tree59,c_to_tree60,c_to_tree61,c_to_tree62,c_to_tree63;
wire [13:0] c_to_tree64;

assign c_to_tree0 = c[13:0];
ysyx_210101_tree inst_tree0(
        .in(out[0]),
        .cin(c_to_tree0),
        .cout(c_to_tree1),
        .c_to_plus(c_to_plus[0]),
        .s_to_plus(s_to_plus[0])
);
ysyx_210101_tree inst_tree1(
        .in(out[1]),
        .cin(c_to_tree1),
        .cout(c_to_tree2),
        .c_to_plus(c_to_plus[1]),
        .s_to_plus(s_to_plus[1])
);
ysyx_210101_tree inst_tree2(
        .in(out[2]),
        .cin(c_to_tree2),
        .cout(c_to_tree3),
        .c_to_plus(c_to_plus[2]),
        .s_to_plus(s_to_plus[2])
);
ysyx_210101_tree inst_tree3(
        .in(out[3]),
        .cin(c_to_tree3),
        .cout(c_to_tree4),
        .c_to_plus(c_to_plus[3]),
        .s_to_plus(s_to_plus[3])
);
ysyx_210101_tree inst_tree4(
        .in(out[4]),
        .cin(c_to_tree4),
        .cout(c_to_tree5),
        .c_to_plus(c_to_plus[4]),
        .s_to_plus(s_to_plus[4])
);
ysyx_210101_tree inst_tree5(
        .in(out[5]),
        .cin(c_to_tree5),
        .cout(c_to_tree6),
        .c_to_plus(c_to_plus[5]),
        .s_to_plus(s_to_plus[5])
);
ysyx_210101_tree inst_tree6(
        .in(out[6]),
        .cin(c_to_tree6),
        .cout(c_to_tree7),
        .c_to_plus(c_to_plus[6]),
        .s_to_plus(s_to_plus[6])
);
ysyx_210101_tree inst_tree7(
        .in(out[7]),
        .cin(c_to_tree7),
        .cout(c_to_tree8),
        .c_to_plus(c_to_plus[7]),
        .s_to_plus(s_to_plus[7])
);
ysyx_210101_tree inst_tree8(
        .in(out[8]),
        .cin(c_to_tree8),
        .cout(c_to_tree9),
        .c_to_plus(c_to_plus[8]),
        .s_to_plus(s_to_plus[8])
);
ysyx_210101_tree inst_tree9(
        .in(out[9]),
        .cin(c_to_tree9),
        .cout(c_to_tree10),
        .c_to_plus(c_to_plus[9]),
        .s_to_plus(s_to_plus[9])
);
ysyx_210101_tree inst_tree10(
        .in(out[10]),
        .cin(c_to_tree10),
        .cout(c_to_tree11),
        .c_to_plus(c_to_plus[10]),
        .s_to_plus(s_to_plus[10])
);
ysyx_210101_tree inst_tree11(
        .in(out[11]),
        .cin(c_to_tree11),
        .cout(c_to_tree12),
        .c_to_plus(c_to_plus[11]),
        .s_to_plus(s_to_plus[11])
);
ysyx_210101_tree inst_tree12(
        .in(out[12]),
        .cin(c_to_tree12),
        .cout(c_to_tree13),
        .c_to_plus(c_to_plus[12]),
        .s_to_plus(s_to_plus[12])
);
ysyx_210101_tree inst_tree13(
        .in(out[13]),
        .cin(c_to_tree13),
        .cout(c_to_tree14),
        .c_to_plus(c_to_plus[13]),
        .s_to_plus(s_to_plus[13])
);
ysyx_210101_tree inst_tree14(
        .in(out[14]),
        .cin(c_to_tree14),
        .cout(c_to_tree15),
        .c_to_plus(c_to_plus[14]),
        .s_to_plus(s_to_plus[14])
);
ysyx_210101_tree inst_tree15(
        .in(out[15]),
        .cin(c_to_tree15),
        .cout(c_to_tree16),
        .c_to_plus(c_to_plus[15]),
        .s_to_plus(s_to_plus[15])
);
ysyx_210101_tree inst_tree16(
        .in(out[16]),
        .cin(c_to_tree16),
        .cout(c_to_tree17),
        .c_to_plus(c_to_plus[16]),
        .s_to_plus(s_to_plus[16])
);
ysyx_210101_tree inst_tree17(
        .in(out[17]),
        .cin(c_to_tree17),
        .cout(c_to_tree18),
        .c_to_plus(c_to_plus[17]),
        .s_to_plus(s_to_plus[17])
);
ysyx_210101_tree inst_tree18(
        .in(out[18]),
        .cin(c_to_tree18),
        .cout(c_to_tree19),
        .c_to_plus(c_to_plus[18]),
        .s_to_plus(s_to_plus[18])
);
ysyx_210101_tree inst_tree19(
        .in(out[19]),
        .cin(c_to_tree19),
        .cout(c_to_tree20),
        .c_to_plus(c_to_plus[19]),
        .s_to_plus(s_to_plus[19])
);
ysyx_210101_tree inst_tree20(
        .in(out[20]),
        .cin(c_to_tree20),
        .cout(c_to_tree21),
        .c_to_plus(c_to_plus[20]),
        .s_to_plus(s_to_plus[20])
);
ysyx_210101_tree inst_tree21(
        .in(out[21]),
        .cin(c_to_tree21),
        .cout(c_to_tree22),
        .c_to_plus(c_to_plus[21]),
        .s_to_plus(s_to_plus[21])
);
ysyx_210101_tree inst_tree22(
        .in(out[22]),
        .cin(c_to_tree22),
        .cout(c_to_tree23),
        .c_to_plus(c_to_plus[22]),
        .s_to_plus(s_to_plus[22])
);
ysyx_210101_tree inst_tree23(
        .in(out[23]),
        .cin(c_to_tree23),
        .cout(c_to_tree24),
        .c_to_plus(c_to_plus[23]),
        .s_to_plus(s_to_plus[23])
);
ysyx_210101_tree inst_tree24(
        .in(out[24]),
        .cin(c_to_tree24),
        .cout(c_to_tree25),
        .c_to_plus(c_to_plus[24]),
        .s_to_plus(s_to_plus[24])
);
ysyx_210101_tree inst_tree25(
        .in(out[25]),
        .cin(c_to_tree25),
        .cout(c_to_tree26),
        .c_to_plus(c_to_plus[25]),
        .s_to_plus(s_to_plus[25])
);
ysyx_210101_tree inst_tree26(
        .in(out[26]),
        .cin(c_to_tree26),
        .cout(c_to_tree27),
        .c_to_plus(c_to_plus[26]),
        .s_to_plus(s_to_plus[26])
);
ysyx_210101_tree inst_tree27(
        .in(out[27]),
        .cin(c_to_tree27),
        .cout(c_to_tree28),
        .c_to_plus(c_to_plus[27]),
        .s_to_plus(s_to_plus[27])
);
ysyx_210101_tree inst_tree28(
        .in(out[28]),
        .cin(c_to_tree28),
        .cout(c_to_tree29),
        .c_to_plus(c_to_plus[28]),
        .s_to_plus(s_to_plus[28])
);
ysyx_210101_tree inst_tree29(
        .in(out[29]),
        .cin(c_to_tree29),
        .cout(c_to_tree30),
        .c_to_plus(c_to_plus[29]),
        .s_to_plus(s_to_plus[29])
);
ysyx_210101_tree inst_tree30(
        .in(out[30]),
        .cin(c_to_tree30),
        .cout(c_to_tree31),
        .c_to_plus(c_to_plus[30]),
        .s_to_plus(s_to_plus[30])
);
ysyx_210101_tree inst_tree31(
        .in(out[31]),
        .cin(c_to_tree31),
        .cout(c_to_tree32),
        .c_to_plus(c_to_plus[31]),
        .s_to_plus(s_to_plus[31])
);
ysyx_210101_tree inst_tree32(
        .in(out[32]),
        .cin(c_to_tree32),
        .cout(c_to_tree33),
        .c_to_plus(c_to_plus[32]),
        .s_to_plus(s_to_plus[32])
);
ysyx_210101_tree inst_tree33(
        .in(out[33]),
        .cin(c_to_tree33),
        .cout(c_to_tree34),
        .c_to_plus(c_to_plus[33]),
        .s_to_plus(s_to_plus[33])
);
ysyx_210101_tree inst_tree34(
        .in(out[34]),
        .cin(c_to_tree34),
        .cout(c_to_tree35),
        .c_to_plus(c_to_plus[34]),
        .s_to_plus(s_to_plus[34])
);
ysyx_210101_tree inst_tree35(
        .in(out[35]),
        .cin(c_to_tree35),
        .cout(c_to_tree36),
        .c_to_plus(c_to_plus[35]),
        .s_to_plus(s_to_plus[35])
);
ysyx_210101_tree inst_tree36(
        .in(out[36]),
        .cin(c_to_tree36),
        .cout(c_to_tree37),
        .c_to_plus(c_to_plus[36]),
        .s_to_plus(s_to_plus[36])
);
ysyx_210101_tree inst_tree37(
        .in(out[37]),
        .cin(c_to_tree37),
        .cout(c_to_tree38),
        .c_to_plus(c_to_plus[37]),
        .s_to_plus(s_to_plus[37])
);
ysyx_210101_tree inst_tree38(
        .in(out[38]),
        .cin(c_to_tree38),
        .cout(c_to_tree39),
        .c_to_plus(c_to_plus[38]),
        .s_to_plus(s_to_plus[38])
);
ysyx_210101_tree inst_tree39(
        .in(out[39]),
        .cin(c_to_tree39),
        .cout(c_to_tree40),
        .c_to_plus(c_to_plus[39]),
        .s_to_plus(s_to_plus[39])
);
ysyx_210101_tree inst_tree40(
        .in(out[40]),
        .cin(c_to_tree40),
        .cout(c_to_tree41),
        .c_to_plus(c_to_plus[40]),
        .s_to_plus(s_to_plus[40])
);
ysyx_210101_tree inst_tree41(
        .in(out[41]),
        .cin(c_to_tree41),
        .cout(c_to_tree42),
        .c_to_plus(c_to_plus[41]),
        .s_to_plus(s_to_plus[41])
);
ysyx_210101_tree inst_tree42(
        .in(out[42]),
        .cin(c_to_tree42),
        .cout(c_to_tree43),
        .c_to_plus(c_to_plus[42]),
        .s_to_plus(s_to_plus[42])
);
ysyx_210101_tree inst_tree43(
        .in(out[43]),
        .cin(c_to_tree43),
        .cout(c_to_tree44),
        .c_to_plus(c_to_plus[43]),
        .s_to_plus(s_to_plus[43])
);
ysyx_210101_tree inst_tree44(
        .in(out[44]),
        .cin(c_to_tree44),
        .cout(c_to_tree45),
        .c_to_plus(c_to_plus[44]),
        .s_to_plus(s_to_plus[44])
);
ysyx_210101_tree inst_tree45(
        .in(out[45]),
        .cin(c_to_tree45),
        .cout(c_to_tree46),
        .c_to_plus(c_to_plus[45]),
        .s_to_plus(s_to_plus[45])
);
ysyx_210101_tree inst_tree46(
        .in(out[46]),
        .cin(c_to_tree46),
        .cout(c_to_tree47),
        .c_to_plus(c_to_plus[46]),
        .s_to_plus(s_to_plus[46])
);
ysyx_210101_tree inst_tree47(
        .in(out[47]),
        .cin(c_to_tree47),
        .cout(c_to_tree48),
        .c_to_plus(c_to_plus[47]),
        .s_to_plus(s_to_plus[47])
);
ysyx_210101_tree inst_tree48(
        .in(out[48]),
        .cin(c_to_tree48),
        .cout(c_to_tree49),
        .c_to_plus(c_to_plus[48]),
        .s_to_plus(s_to_plus[48])
);
ysyx_210101_tree inst_tree49(
        .in(out[49]),
        .cin(c_to_tree49),
        .cout(c_to_tree50),
        .c_to_plus(c_to_plus[49]),
        .s_to_plus(s_to_plus[49])
);
ysyx_210101_tree inst_tree50(
        .in(out[50]),
        .cin(c_to_tree50),
        .cout(c_to_tree51),
        .c_to_plus(c_to_plus[50]),
        .s_to_plus(s_to_plus[50])
);
ysyx_210101_tree inst_tree51(
        .in(out[51]),
        .cin(c_to_tree51),
        .cout(c_to_tree52),
        .c_to_plus(c_to_plus[51]),
        .s_to_plus(s_to_plus[51])
);
ysyx_210101_tree inst_tree52(
        .in(out[52]),
        .cin(c_to_tree52),
        .cout(c_to_tree53),
        .c_to_plus(c_to_plus[52]),
        .s_to_plus(s_to_plus[52])
);
ysyx_210101_tree inst_tree53(
        .in(out[53]),
        .cin(c_to_tree53),
        .cout(c_to_tree54),
        .c_to_plus(c_to_plus[53]),
        .s_to_plus(s_to_plus[53])
);
ysyx_210101_tree inst_tree54(
        .in(out[54]),
        .cin(c_to_tree54),
        .cout(c_to_tree55),
        .c_to_plus(c_to_plus[54]),
        .s_to_plus(s_to_plus[54])
);
ysyx_210101_tree inst_tree55(
        .in(out[55]),
        .cin(c_to_tree55),
        .cout(c_to_tree56),
        .c_to_plus(c_to_plus[55]),
        .s_to_plus(s_to_plus[55])
);
ysyx_210101_tree inst_tree56(
        .in(out[56]),
        .cin(c_to_tree56),
        .cout(c_to_tree57),
        .c_to_plus(c_to_plus[56]),
        .s_to_plus(s_to_plus[56])
);
ysyx_210101_tree inst_tree57(
        .in(out[57]),
        .cin(c_to_tree57),
        .cout(c_to_tree58),
        .c_to_plus(c_to_plus[57]),
        .s_to_plus(s_to_plus[57])
);
ysyx_210101_tree inst_tree58(
        .in(out[58]),
        .cin(c_to_tree58),
        .cout(c_to_tree59),
        .c_to_plus(c_to_plus[58]),
        .s_to_plus(s_to_plus[58])
);
ysyx_210101_tree inst_tree59(
        .in(out[59]),
        .cin(c_to_tree59),
        .cout(c_to_tree60),
        .c_to_plus(c_to_plus[59]),
        .s_to_plus(s_to_plus[59])
);
ysyx_210101_tree inst_tree60(
        .in(out[60]),
        .cin(c_to_tree60),
        .cout(c_to_tree61),
        .c_to_plus(c_to_plus[60]),
        .s_to_plus(s_to_plus[60])
);
ysyx_210101_tree inst_tree61(
        .in(out[61]),
        .cin(c_to_tree61),
        .cout(c_to_tree62),
        .c_to_plus(c_to_plus[61]),
        .s_to_plus(s_to_plus[61])
);
ysyx_210101_tree inst_tree62(
        .in(out[62]),
        .cin(c_to_tree62),
        .cout(c_to_tree63),
        .c_to_plus(c_to_plus[62]),
        .s_to_plus(s_to_plus[62])
);
ysyx_210101_tree inst_tree63(
        .in(out[63]),
        .cin(c_to_tree63),
        .cout(c_to_tree64),
        .c_to_plus(c_to_plus[63]),
        .s_to_plus(s_to_plus[63])
);

assign final_c_to_plus = {c_to_plus[62:0],c[14]};

always@(posedge clk)
begin
    if(reset)
        s_to_plus_r <= 64'b0;
    else
        s_to_plus_r <= s_to_plus;
end

always@(posedge clk)
begin
    if(reset)
        c_to_plus_r <= 64'b0;
    else
        c_to_plus_r <= final_c_to_plus;
end

always@(posedge clk)
begin
    if(reset)
        final_c <= 1'b0;
    else
        final_c <= c[15];
end

assign result = s_to_plus_r + c_to_plus_r + {63'b0,final_c};

endmodule

module ysyx_210101_booth_coder(
  input [2:0] y,
  input [32:0] x,
  input [5:0] i,  //0,2,4...,32
  output [63:0] p,
  output c
);
wire [33:0] part_p;
wire [63:0] part_p_2;
wire snx;     //-x
wire spx;     //+x
wire sndx;    //-2x
wire spdx;    //+2x
assign snx = (y[2] & y[1] & ~y[0])  | (y[2] & ~y[1] & y[0]);
assign spx = (~y[2] & y[1] & ~y[0]) | (~y[2] & ~y[1] & y[0]);
assign sndx = (y[2] & ~y[1] & ~y[0]);
assign spdx = (~y[2] & y[1] & y[0]);

assign part_p = ({34{spx}}  &  {x[32],x}) |
                ({34{snx}}  &  {x[32],x}) |
                ({34{spdx}} &  {x,1'b0})  |
                ({34{sndx}} &  {x,1'b0});
assign c = snx | sndx;

assign part_p_2 = {{30{part_p[33]}},part_p} << i;
assign p = c ? ~part_p_2 : part_p_2;

endmodule

module ysyx_210101_switch(
  input [63:0] p0,  input [63:0] p1,  input [63:0] p2,  input [63:0] p3,
  input [63:0] p4,  input [63:0] p5,  input [63:0] p6,  input [63:0] p7,
  input [63:0] p8,  input [63:0] p9,  input [63:0] p10, input [63:0] p11,
  input [63:0] p12, input [63:0] p13, input [63:0] p14, input [63:0] p15,
  input [63:0] p16,

  output [16:0] out1, output [16:0] out2, output [16:0] out3, output [16:0] out4,
  output [16:0] out5, output [16:0] out6, output [16:0] out7, output [16:0] out8,
  output [16:0] out9, output [16:0] out10, output [16:0] out11, output [16:0] out12,
  output [16:0] out13, output [16:0] out14, output [16:0] out15, output [16:0] out16,
  output [16:0] out17, output [16:0] out18, output [16:0] out19, output [16:0] out20,
  output [16:0] out21, output [16:0] out22, output [16:0] out23, output [16:0] out24,
  output [16:0] out25, output [16:0] out26, output [16:0] out27, output [16:0] out28,
  output [16:0] out29, output [16:0] out30, output [16:0] out31, output [16:0] out32,
  output [16:0] out33, output [16:0] out34, output [16:0] out35, output [16:0] out36,
  output [16:0] out37, output [16:0] out38, output [16:0] out39, output [16:0] out40,
  output [16:0] out41, output [16:0] out42, output [16:0] out43, output [16:0] out44,
  output [16:0] out45, output [16:0] out46, output [16:0] out47, output [16:0] out48,
  output [16:0] out49, output [16:0] out50, output [16:0] out51, output [16:0] out52,
  output [16:0] out53, output [16:0] out54, output [16:0] out55, output [16:0] out56,
  output [16:0] out57, output [16:0] out58, output [16:0] out59, output [16:0] out60,
  output [16:0] out61, output [16:0] out62, output [16:0] out63, output [16:0] out64

);

wire [16:0] part_res[63:0];

genvar i;
generate for (i=0; i<64; i=i+1) begin : switch
    assign part_res[i] = {p16[i],p15[i],p14[i],p13[i],p12[i],p11[i],p10[i],p9[i],p8[i],p7[i],p6[i],p5[i],p4[i],p3[i],p2[i],p1[i],p0[i]} ;
end endgenerate

assign out1 = part_res[0];
assign out2 = part_res[1];
assign out3 = part_res[2];
assign out4 = part_res[3];
assign out5 = part_res[4];
assign out6 = part_res[5];
assign out7 = part_res[6];
assign out8 = part_res[7];
assign out9 = part_res[8];
assign out10 = part_res[9];
assign out11 = part_res[10];
assign out12 = part_res[11];
assign out13 = part_res[12];
assign out14 = part_res[13];
assign out15 = part_res[14];
assign out16 = part_res[15];
assign out17 = part_res[16];
assign out18 = part_res[17];
assign out19 = part_res[18];
assign out20 = part_res[19];
assign out21 = part_res[20];
assign out22 = part_res[21];
assign out23 = part_res[22];
assign out24 = part_res[23];
assign out25 = part_res[24];
assign out26 = part_res[25];
assign out27 = part_res[26];
assign out28 = part_res[27];
assign out29 = part_res[28];
assign out30 = part_res[29];
assign out31 = part_res[30];
assign out32 = part_res[31];
assign out33 = part_res[32];
assign out34 = part_res[33];
assign out35 = part_res[34];
assign out36 = part_res[35];
assign out37 = part_res[36];
assign out38 = part_res[37];
assign out39 = part_res[38];
assign out40 = part_res[39];
assign out41 = part_res[40];
assign out42 = part_res[41];
assign out43 = part_res[42];
assign out44 = part_res[43];
assign out45 = part_res[44];
assign out46 = part_res[45];
assign out47 = part_res[46];
assign out48 = part_res[47];
assign out49 = part_res[48];
assign out50 = part_res[49];
assign out51 = part_res[50];
assign out52 = part_res[51];
assign out53 = part_res[52];
assign out54 = part_res[53];
assign out55 = part_res[54];
assign out56 = part_res[55];
assign out57 = part_res[56];
assign out58 = part_res[57];
assign out59 = part_res[58];
assign out60 = part_res[59];
assign out61 = part_res[60];
assign out62 = part_res[61];
assign out63 = part_res[62];
assign out64 = part_res[63];

endmodule

module ysyx_210101_tree(
    input [16:0] in,
    input [13:0] cin,

    output[13:0] cout,
    output c_to_plus,
    output s_to_plus
);

wire n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
wire cout0,cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13;

assign {cout0, n0} = in[16] + in[15] + in[14];
assign {cout1, n1} = in[13] + in[12] + in[11];
assign {cout2, n2} = in[10] + in[9] + in[8];
assign {cout3, n3} = in[7] + in[6] + in[5];
assign {cout4, n4} = in[4] + in[3] + in[2];

assign {cout5, n5} = n0 + n1 + n2;
assign {cout6, n6} = n3 + n4 + in[1];
assign {cout7, n7} = in[0] + cin[0] + cin[1];
assign {cout8, n8} = cin[2] + cin[3] + cin[4];

assign {cout9, n9} = n5 + n6 + n7;
assign {cout10, n10} = n8 + cin[5] + cin[6];

assign {cout11, n11} = n9 + n10 + cin[7];
assign {cout12, n12} = cin[8] + cin[9] + cin[10];

assign {cout13, n13} = n11 + n12 + cin[11];
assign cout = {cout13,cout12,cout11,cout10,cout9,cout8,cout7,cout6,cout5,cout4,cout3,cout2,cout1,cout0};

assign {c_to_plus, s_to_plus} = n13 + cin[12] + cin[13];

endmodule

module ysyx_210101_mydiv(
    input         clk                ,
    input         reset              ,
    input         div_tvalid         ,
    input         div_signed         ,
    input  [31:0] div_divisor        ,
    input  [31:0] div_dividend       ,
    output        div_out_tvalid     ,
    output [63:0] div_result         ,
    input         exception
);

    reg [63:0] A;
    reg [32:0] B;
    reg [31:0] S;
    reg [5:0]  count;

    wire       start;
    wire [31:0] s;
    wire [31:0] r;

    wire       dividend_neg;
    wire       divisor_neg;
    wire       s_neg;
    wire       r_neg;

    wire [32:0] partial_sum;
    wire        partial_quotient;

    assign dividend_neg = div_dividend[31] & div_signed;
    assign divisor_neg = div_divisor[31] & div_signed;
    assign s_neg = dividend_neg ^ divisor_neg;
    assign r_neg = dividend_neg;

    assign start = (count == 0);
    assign div_out_tvalid = (count == 6'd33);

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
        end
        else if (exception)begin
            count <= 0;
        end
        else if (div_out_tvalid) begin
            count <= 0;
        end else if (div_tvalid & start) begin
            count <= 1;
        end else if (~start) begin
            count <= count + 1;
        end
    end

    assign partial_sum      = A[63:31] + ~B[32:0] + 1;
    assign partial_quotient = ~partial_sum[32];

    always @(posedge clk) begin
        if (reset) begin
            B <= 0;
        end 
        else if (exception)begin
            B <= 0;
        end        
        else if(div_tvalid & start) begin
            B <= divisor_neg ? {1'b0 , ~div_divisor + 1} : {1'b0 , div_divisor};
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            A <= 0;
        end 
        else if (exception)begin
            A <= 0;
        end
        else if (div_tvalid & start) begin
            A <= dividend_neg ? {32'b0, ~div_dividend + 1} : {32'b0, div_dividend};
        end else if (~start) begin
            A <= partial_quotient ? {partial_sum[31:0], A[30:0], 1'b0}:
                                    {A[62:0], 1'b0};
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            S <= 0;
        end 
        else if (exception)begin
            S <= 0;
        end        
        else if (div_tvalid & start) begin
            S <= 0;
        end else if (~start) begin
            S <= {S[30:0], partial_quotient};
        end
    end

    assign s = s_neg ? ~S + 1        : S;
    assign r = r_neg ? ~A[63:32] + 1 : A[63:32];
    assign div_result = {s,r};

endmodule

//===============================================================================================================================//
module ysyx_210101_mem_req_stage(
    input                          clk           ,
    input                          reset         ,
	
    //allowin
    input                          ms_allowin    ,
    output                         rs_allowin    ,
	
    //from ds
    input                          es_to_rs_valid,
    input  [`ES_TO_RS_BUS_WD -1:0] es_to_rs_bus  ,
	
    //to ms
    output                         rs_to_ms_valid,
    output [`RS_TO_MS_BUS_WD -1:0] rs_to_ms_bus  ,
    output                         rs_loading,
    output                         data_cache,
	
    //data sram interface 
    output [ 4:0] cache_op,
    output [31:0] cache_op_addr,
    output icache_op_req,
    output dcache_op_req,
    input  icache_op_ok,
    input  dcache_op_ok,

    output        data_sram_req,
    output        data_sram_wr,
    output [ 1:0] data_sram_size,
    output [ 3:0] data_sram_wstrb,
    output [31:0] data_sram_addr,
    output [31:0] data_sram_wdata,
    input         data_sram_addr_ok,
	
    //exception related
    output         exception_tlb_refill,
    output         handle_exc,
    output         handle_eret,
	output         rs_ex_tlb,
    output         pipe_flush,
	output [45:0]  rs_reg,
	output         rs_bd,
	output [ 4:0]  rs_exccode,
	output [31:0]  rs_badvaddr,
	output [31:0]  rs_pc,
    output         fs_pc_error
	
);
reg  [31:0] hi;
reg  [31:0] lo;
wire        rs_inst_eret;
reg         rs_valid;
wire        rs_ready_go   ;
reg         handle_exc_r;

reg  [`ES_TO_RS_BUS_WD -1:0] es_to_rs_bus_r;
wire [ 4:0] rs_dest;
wire [31:0] rs_result;
wire [31:0] _rs_result;
wire [31:0] es_result;
wire [ 6:0] rs_load_op;
wire [31:0] rs_c0_rdata;

wire rs_ex;
wire rs_tlbwir_cancel;
wire has_ex;
wire rs_inst_mfc0;
wire rs_is_load;
wire rs_is_store;
wire rs_res_from_mem;
wire rs_gr_we;    

wire inst_mfhi;
wire inst_mflo;
wire inst_mthi;
wire inst_mtlo;
wire inst_mult;
wire inst_multu;
wire inst_div;
wire inst_divu;
wire [31:0] rs_rs_value;
wire [63:0] mult_result;
wire [63:0] multu_result;
wire [63:0] div_result;
wire [63:0] divu_result;
wire inst_mul;
wire inst_madd;
wire inst_maddu;
wire inst_msub;
wire inst_msubu;
wire sc_fail;
wire sc_success;
wire inst_cache;
assign {cache_op,
    inst_cache,
    sc_fail,
	sc_success,
	inst_madd,
	inst_maddu,
	inst_msub,
	inst_msubu,
	data_cache,
    inst_mul,
    inst_mfhi,
    inst_mflo,
    inst_mthi,
    inst_mtlo,
    inst_mult,
    inst_multu,
    inst_div,
    inst_divu,
    rs_rs_value,
    div_result,
    divu_result,
    mult_result,
    multu_result,
    fs_pc_error,
    rs_inst_eret,
    rs_tlbwir_cancel,
    exception_tlb_refill,
    data_sram_addr,
    data_sram_wr,
    data_sram_wdata,
    data_sram_size,
    data_sram_wstrb,
    has_ex,
    rs_ex,
    rs_bd,
    rs_badvaddr,
    rs_exccode,
    rs_inst_mfc0,
    rs_c0_rdata,
    rs_is_load,
    rs_is_store,
    rs_load_op,
    rs_res_from_mem,
    rs_gr_we,
    rs_dest,
    es_result,
    rs_pc
} = es_to_rs_bus_r;

assign cache_op_addr = data_sram_addr;
assign icache_op_req = inst_cache && cache_op[1:0]==2'b00;
assign dcache_op_req = inst_cache && cache_op[1:0]==2'b01;

always @(posedge clk) begin
    if (reset)
        handle_exc_r <= 0;
    else if (rs_ex)
        handle_exc_r <= 1;
    else if (ms_allowin && rs_ready_go)
        handle_exc_r <= 0;
end

reg handle_eret_r;
always @(posedge clk) begin
    if (reset)
        handle_eret_r <= 0;
    else if (rs_inst_eret)
        handle_eret_r <= 1;
    else if (ms_allowin && rs_ready_go)
        handle_eret_r <= 0;
end

`ifdef USE_TLB
assign pipe_flush  = rs_tlbwir_cancel && rs_valid;
`else
assign pipe_flush  = 0;
`endif
assign handle_eret = rs_inst_eret && !handle_eret_r && rs_valid;
assign handle_exc  = rs_ex && !handle_exc_r && rs_valid;

assign rs_ex_tlb = (rs_exccode == `EX_TLBL || rs_exccode == `EX_TLBS || 
                    rs_exccode == `EX_MOD) && rs_valid;

assign rs_loading = rs_is_load | rs_is_store;
assign rs_result  = inst_mul ? mult_result[31:0] : inst_mfhi ? hi : inst_mflo ? lo : es_result;
assign rs_to_ms_bus = {sc_fail,
                       sc_success,
		       rs_inst_mfc0   ,  //112:112
                       rs_c0_rdata    ,  //111:80
                       rs_is_load     ,  //79:79
                       rs_is_store    ,  //78:78
                       rs_load_op     ,  //77:71
                       rs_res_from_mem,  //70:70
                       rs_gr_we       ,  //69:69
                       rs_dest        ,  //68:64
                       rs_result      ,  //63:32
                       rs_pc             //31:0
                      };

assign rs_ready_go    = rs_ex || rs_inst_eret || rs_tlbwir_cancel ? 1'b1 :
                        rs_is_load | rs_is_store ? (data_sram_req && data_sram_addr_ok) :
                        inst_cache ? ((icache_op_req && icache_op_ok) || (dcache_op_req && dcache_op_ok)) :
                        1'b1;
assign rs_allowin     = !rs_valid || rs_ready_go && ms_allowin;
assign rs_to_ms_valid = rs_valid && rs_ready_go && !rs_ex && !rs_inst_eret;
wire [63:0] madd_result = {hi, lo} + mult_result;
wire [63:0] maddu_result = {hi, lo} + multu_result;
wire [63:0] msub_result = {hi, lo} - mult_result;
wire [63:0] msubu_result = {hi, lo} - multu_result;
always @(posedge clk) begin
    if (reset) begin
        rs_valid <= 1'b0;
    end
    else if (rs_allowin) begin
        rs_valid <= es_to_rs_valid;
    end

    if (reset) begin
        es_to_rs_bus_r <= `ES_TO_RS_BUS_WD'b0;
    end
    else if (es_to_rs_valid && rs_allowin) begin
        es_to_rs_bus_r <= es_to_rs_bus;
    end
end

always @(posedge clk) begin
    if (reset) begin
        hi <= 32'b0;
    end
    else if(inst_mult && rs_valid && !has_ex) begin
        hi <= mult_result[63:32];
    end
    else if(inst_multu && rs_valid && !has_ex) begin
        hi <= multu_result[63:32];
    end
    else if(inst_div && rs_valid && !has_ex) begin
        hi <= div_result[31:0];
    end
    else if(inst_divu && rs_valid && !has_ex) begin
        hi <= divu_result[31:0];
    end
    else if(inst_mthi && rs_valid && !has_ex) begin
        hi <= rs_rs_value;
    end
    else if(inst_madd && rs_valid && !has_ex) begin
        hi <= madd_result[63:32];
    end
    else if(inst_maddu && rs_valid && !has_ex) begin
        hi <= maddu_result[63:32];
    end
    else if(inst_msub && rs_valid && !has_ex) begin
        hi <= msub_result[63:32];
    end
    else if(inst_msubu && rs_valid && !has_ex) begin
        hi <= msubu_result[63:32];
    end
end

always @(posedge clk) begin
    if (reset) begin
        lo<=32'b0;
    end
    else if(inst_mult && rs_valid && !has_ex) begin
        lo<=mult_result[31:0];
    end
    else if(inst_multu && rs_valid && !has_ex) begin
        lo <= multu_result[31:0];
    end
    else if(inst_div && rs_valid && !has_ex) begin
        lo <= div_result[63:32];
    end
    else if(inst_divu && rs_valid && !has_ex) begin
        lo <= divu_result[63:32];
    end
    else if(inst_mtlo && rs_valid && !has_ex) begin
        lo <= rs_rs_value;
    end
    else if(inst_madd && rs_valid && !has_ex) begin
        lo <= madd_result[31:0];
    end
    else if(inst_maddu && rs_valid && !has_ex) begin
        lo <= maddu_result[31:0];
    end
    else if(inst_msub && rs_valid && !has_ex) begin
        lo <= msub_result[31:0];
    end
    else if(inst_msubu && rs_valid && !has_ex) begin
        lo <= msubu_result[31:0];
    end
end

assign rs_reg = {{4{rs_gr_we & rs_valid}},
                    rs_is_load && rs_valid,
					rs_inst_mfc0 && rs_valid,
                    inst_mfhi && rs_valid,
                    inst_mflo && rs_valid,
                    inst_mul && rs_valid,
					rs_dest & {5{rs_valid}},
					rs_result};

assign data_sram_req = rs_valid && ms_allowin && (rs_is_load | rs_is_store) && !(rs_ex || rs_inst_eret);

endmodule

//=============================================================================================================================//
module ysyx_210101_mem_ack_stage(
    input                          clk           ,
    input                          reset         ,
    input                          ws_allowin    ,
    output                         ms_allowin    ,
    //from es 
    input                          rs_to_ms_valid,
    input  [`RS_TO_MS_BUS_WD -1:0] rs_to_ms_bus  ,
    input                          rs_loading    ,
    //to ws
    output                         ms_to_ws_valid,
    output [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus  ,
    //to ds:forward
    output [42:0]                  ms_reg,
    output                         ms_loading,
    //data sram interface
    input         data_sram_data_ok,
    input  [31:0] data_sram_rdata
);

reg         ms_valid;
wire        ms_ready_go;

reg [`RS_TO_MS_BUS_WD -1:0] rs_to_ms_bus_r;

wire        ms_is_load    ;
wire        ms_is_store   ;
wire [31:0] ms_final_result;
wire [ 3:0] load_we;
wire [ 3:0] ms_rf_we;
wire        ms_inst_mfc0    ;
wire [ 6:0] ms_load_op;
wire        ms_res_from_mem;
wire        ms_gr_we;
wire [ 4:0] ms_dest;
wire [31:0] ms_alu_result;
wire [31:0] ms_pc;
wire [31:0] mem_result;
wire [ 3:0] addr_align;
wire [31:0] lb_result;
wire [31:0] lh_result;
wire [31:0] lw_result;
wire [31:0] lwl_result;
wire [31:0] lwr_result;
wire [31:0] ms_c0_rdata;
wire sc_fail;
wire sc_success;

assign {sc_fail,
	sc_success,
	ms_inst_mfc0   ,  //112:112
	ms_c0_rdata    ,  //111:80
	ms_is_load     ,  //79:79
        ms_is_store    ,  //78:78
        ms_load_op     ,  //77:71
        ms_res_from_mem,  //70:70
        ms_gr_we       ,  //69:69
        ms_dest        ,  //68:64
        ms_alu_result  ,  //63:32
        ms_pc             //31:0
       } = rs_to_ms_bus_r;

//exception
assign ms_to_ws_bus = {ms_c0_rdata       ,  //105:74
                       ms_inst_mfc0      ,  //73:73
                       ms_rf_we          ,  //72:69
                       ms_dest           ,  //68:64
                       ms_final_result   ,  //63:32
                       ms_pc                //31:0
                      };

assign ms_ready_go    = !((ms_is_load || ms_is_store) && !data_sram_data_ok);
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid =  ms_valid && ms_ready_go;

always @(posedge clk) begin
    if (reset) begin
        ms_valid <= 1'b0;
    end
    else if (ms_allowin) begin
        ms_valid <= rs_to_ms_valid;
    end

    if (reset) begin
        rs_to_ms_bus_r  <= `RS_TO_MS_BUS_WD'b0;
    end
    else if (rs_to_ms_valid && ms_allowin) begin
        rs_to_ms_bus_r  <= rs_to_ms_bus;
    end
end

//unalign load
assign load_we    = ({4{(ms_load_op[6] & (ms_alu_result[1:0] == 2'b00))}} & 4'b1111)|
					({4{(ms_load_op[6] & (ms_alu_result[1:0] == 2'b01))}} & 4'b0111)|
					({4{(ms_load_op[6] & (ms_alu_result[1:0] == 2'b10))}} & 4'b0011)|
					({4{(ms_load_op[6] & (ms_alu_result[1:0] == 2'b11))}} & 4'b0001)|
					({4{(ms_load_op[5] & (ms_alu_result[1:0] == 2'b00))}} & 4'b1000)|
					({4{(ms_load_op[5] & (ms_alu_result[1:0] == 2'b01))}} & 4'b1100)|
					({4{(ms_load_op[5] & (ms_alu_result[1:0] == 2'b10))}} & 4'b1110)|
					({4{(ms_load_op[5] & (ms_alu_result[1:0] == 2'b11))}} & 4'b1111)|
					({4{(ms_load_op[0] | ms_load_op[1] | ms_load_op[2] | ms_load_op[3] | ms_load_op[4])}} & {4{ms_gr_we}});
assign addr_align = {ms_alu_result[1:0] == 2'b11, ms_alu_result[1:0] == 2'b10,
                     ms_alu_result[1:0] == 2'b01, ms_alu_result[1:0] == 2'b00};
assign lb_result  = ({32{addr_align[0]}} & {{24{(ms_load_op[0]) ? data_sram_rdata[ 7] : 1'b0}}, data_sram_rdata[ 7: 0]}) |
                    ({32{addr_align[1]}} & {{24{(ms_load_op[0]) ? data_sram_rdata[15] : 1'b0}}, data_sram_rdata[15: 8]}) |
                    ({32{addr_align[2]}} & {{24{(ms_load_op[0]) ? data_sram_rdata[23] : 1'b0}}, data_sram_rdata[23:16]}) |
                    ({32{addr_align[3]}} & {{24{(ms_load_op[0]) ? data_sram_rdata[31] : 1'b0}}, data_sram_rdata[31:24]}) ;
assign lh_result  = ({32{~ms_alu_result[1]}} & {{16{(ms_load_op[2]) ? data_sram_rdata[15] : 1'b0}}, data_sram_rdata[15: 0]}) |
                    ({32{ ms_alu_result[1]}} & {{16{(ms_load_op[2]) ? data_sram_rdata[31] : 1'b0}}, data_sram_rdata[31:16]});
assign lw_result  = data_sram_rdata;
assign lwl_result = ({32{addr_align[0]}} & {data_sram_rdata[ 7: 0], 24'b0}) |
                    ({32{addr_align[1]}} & {data_sram_rdata[15: 0], 16'b0}) |
                    ({32{addr_align[2]}} & {data_sram_rdata[23: 0],  8'b0}) |
                    ({32{addr_align[3]}} &  data_sram_rdata)                ;
assign lwr_result = ({32{addr_align[0]}} &  data_sram_rdata)                |
                    ({32{addr_align[1]}} & { 8'b0, data_sram_rdata[31: 8]}) |
                    ({32{addr_align[2]}} & {16'b0, data_sram_rdata[31:16]}) |
                    ({32{addr_align[3]}} & {24'b0, data_sram_rdata[31:24]}) ;
assign mem_result = ({32{ms_load_op[0] | ms_load_op[1]}} & lb_result ) |
                    ({32{ms_load_op[2] | ms_load_op[3]}} & lh_result ) |
                    ({32{ms_load_op[4]                }} & lw_result ) |
                    ({32{ms_load_op[5]                }} & lwl_result) |
                    ({32{ms_load_op[6]                }} & lwr_result) ;
					
assign ms_rf_we = ms_res_from_mem ? load_we : {4{ms_gr_we}};
assign ms_final_result = sc_fail ? 32'b0 : sc_success ? 32'b1 : ms_res_from_mem ? mem_result : ms_alu_result;
assign ms_loading = ms_is_load & ms_valid; 
assign ms_reg = {ms_is_load ,
                 ms_rf_we    & {4{ms_valid}},
                 ms_inst_mfc0 & ms_valid,
				 ms_dest      & {5{ms_valid}},
	             ms_alu_result/*ms_final_result*/}; 
							  
endmodule

//===============================================================================================================================//
module ysyx_210101_wb_stage(
    input                           clk           ,
    input                           reset         ,
    output                          ws_allowin    ,
    input                           ms_to_ws_valid,
    input  [`MS_TO_WS_BUS_WD -1:0]  ms_to_ws_bus  ,
    //to rf: for write back
    output [`WS_TO_RF_BUS_WD -1:0]  ws_to_rf_bus  ,
    output [40:0]                   ws_reg

    /*trace debug interface
    output [31:0] debug_wb_pc     ,
    output [ 3:0] debug_wb_rf_wen ,
    output [ 4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata*/
);

reg         ws_valid;
wire        ws_ready_go;
reg  [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus_r;

wire        ws_inst_mfc0;
wire [31:0] ws_c0_rdata;
wire [ 7:0] ws_c0_addr;
wire [ 3:0] ws_gr_we;
wire [ 4:0] ws_dest;
wire [31:0] ws_final_result;
wire [31:0] ws_pc;

assign {ws_c0_rdata      , // 105:74
		ws_inst_mfc0    ,  // 73:73
        ws_gr_we        ,  // 72:69
        ws_dest         ,  // 68:64
        ws_final_result ,  // 63:32
        ws_pc              // 31:0
       } = ms_to_ws_bus_r;

wire [3 :0] rf_we;
wire [4 :0] rf_waddr;
wire [31:0] rf_wdata;

assign ws_to_rf_bus = {rf_we   ,  //40:37
                       rf_waddr,  //36:32
                       rf_wdata   //31:0
                      };

assign ws_ready_go = 1'b1;
assign ws_allowin  = !ws_valid || ws_ready_go;
always @(posedge clk) begin
    if (reset) begin
        ws_valid <= 1'b0;
    end
    else if (ws_allowin) begin
        ws_valid <= ms_to_ws_valid;
    end

    if (reset) begin
        ms_to_ws_bus_r <= `MS_TO_WS_BUS_WD'b0;
    end
    else if (ms_to_ws_valid && ws_allowin) begin
        ms_to_ws_bus_r <= ms_to_ws_bus;
    end
end

assign rf_we    = ws_gr_we&{4{ws_valid}};
assign rf_waddr = ws_dest;
assign rf_wdata = ws_inst_mfc0 ? ws_c0_rdata : ws_final_result;

assign ws_reg = {rf_we & {4{ws_valid}}, rf_waddr & {5{ws_valid}}, rf_wdata};
  
/* debug info generate
assign debug_wb_pc       = ws_pc;
assign debug_wb_rf_wen   = rf_we;
assign debug_wb_rf_wnum  = ws_dest;
assign debug_wb_rf_wdata = rf_wdata;*/

endmodule

//===============================================================================================================================//
module ysyx_210101_alu(
  input  [13:0] alu_op,
  input  [31:0] alu_src1,
  input  [31:0] alu_src2,
  output        overflow,            
  output [31:0] alu_result
);

wire op_add;   //加法操作
wire op_sub;   //减法操作
wire op_slt;   //有符号比较，小于输出1
wire op_sltu;  //无符号比较，小于输出1
wire op_and;   //按位与
wire op_nor;   //按位或非
wire op_or;    //按位或
wire op_xor;   //按位异或
wire op_sll;   //逻辑左移
wire op_srl;   //逻辑右移
wire op_sra;   //算术右移
wire op_lui;   //立即数置高位
wire op_clo;
wire op_clz;

// control code decomposition
assign op_add  = alu_op[ 0];
assign op_sub  = alu_op[ 1];
assign op_slt  = alu_op[ 2];
assign op_sltu = alu_op[ 3];
assign op_and  = alu_op[ 4];
assign op_nor  = alu_op[ 5];
assign op_or   = alu_op[ 6];
assign op_xor  = alu_op[ 7];
assign op_sll  = alu_op[ 8];
assign op_srl  = alu_op[ 9];
assign op_sra  = alu_op[10];
assign op_lui  = alu_op[11];
assign op_clo  = alu_op[12];
assign op_clz  = alu_op[13];

wire [31:0] add_sub_result; 
wire [31:0] slt_result; 
wire [31:0] sltu_result;
wire [31:0] and_result;
wire [31:0] nor_result;
wire [31:0] or_result;
wire [31:0] xor_result;
wire [31:0] lui_result;
wire [31:0] sll_result; 
wire [63:0] sr64_result; 
wire [31:0] sr_result; 


// 32-bit adder
wire [31:0] adder_a;
wire [31:0] adder_b;
wire [31:0] adder_cin;
wire [31:0] adder_result;
wire        adder_cout;

assign adder_a   = alu_src1;
assign adder_b   = (op_sub | op_slt | op_sltu) ? ~alu_src2 : alu_src2;
assign adder_cin = (op_sub | op_slt | op_sltu) ? 32'b1     : 32'b0;
assign {adder_cout, adder_result} = adder_a + adder_b + adder_cin;

// ADD, SUB result
assign add_sub_result = adder_result;

// SLT result
assign slt_result[31:1] = 31'b0;
assign slt_result[0]    = (alu_src1[31] & ~alu_src2[31])
                        | ((alu_src1[31] ~^ alu_src2[31]) & adder_result[31]);

// SLTU result
assign sltu_result[31:1] = 31'b0;
assign sltu_result[0]    = ~adder_cout;

// bitwise operation
assign and_result = alu_src1 & alu_src2;
assign or_result  = alu_src1 | alu_src2;
assign nor_result = ~or_result;
assign xor_result = alu_src1 ^ alu_src2;
assign lui_result = {alu_src2[15:0], 16'b0};

// SLL result 
assign sll_result = alu_src2 << alu_src1[4:0];

// SRL, SRA result
assign sr64_result = {{32{op_sra & alu_src2[31]}}, alu_src2[31:0]} >> alu_src1[4:0];

assign sr_result   = sr64_result[31:0];

assign overflow = ((alu_src1[31] ^ alu_src2[31]) ? op_sub : op_add) & (alu_src1[31] ^ add_sub_result[31]);

wire [ 5:0] count_one;
wire [ 5:0] count_zero;

ysyx_210101_CLOZ ysyx_210101_CLOZ(
    .in         (alu_src1  ),
    .count_one  (count_one ),
    .count_zero (count_zero)
);

// final result mux
assign alu_result = ({32{op_add|op_sub}} & add_sub_result)
                  | ({32{op_slt       }} & slt_result)
                  | ({32{op_sltu      }} & sltu_result)
                  | ({32{op_and       }} & and_result)
                  | ({32{op_nor       }} & nor_result)
                  | ({32{op_or        }} & or_result)
                  | ({32{op_xor       }} & xor_result)
                  | ({32{op_lui       }} & lui_result)
                  | ({32{op_sll       }} & sll_result)
                  | ({32{op_srl|op_sra}} & sr_result)
                  | ({32{op_clo       }} & {26'b0, count_one})
                  | ({32{op_clz       }} & {26'b0, count_zero});

endmodule

module ysyx_210101_CLOZ(
    input  [31:0]   in,
    output [ 5:0]	count_one,
    output [ 5:0]	count_zero
);

wire        clo_res0;
wire        clo_res1;
wire        clo_res2;
wire        clo_res3;
wire        clo_res4;

wire [31:0] clo_val32;
wire [15:0] clo_val16;
wire [ 7:0] clo_val8;
wire [ 3:0] clo_val4;
wire [ 1:0] clo_val2;

assign clo_val32  = in[31:0];
assign clo_res4 = (clo_val32[31:16] == 16'hffff);
assign clo_val16  = clo_res4? clo_val32[15: 0] : clo_val32[31:16];
assign clo_res3 = (clo_val16[15:8] == 8'hff);
assign clo_val8   = clo_res3 ? clo_val16[ 7: 0] : clo_val16[15: 8];
assign clo_res2 = (clo_val8 [ 7:4] == 4'hf);
assign clo_val4   = clo_res2 ? clo_val8 [ 3: 0] : clo_val8 [7: 4];
assign clo_res1 = (clo_val4 [ 3:2] == 2'h3);
assign clo_val2   = clo_res1 ? clo_val4 [ 1: 0] : clo_val4 [ 3: 2];
assign clo_res0 = (clo_val2 [1] == 1'h1);

assign count_one = (in == 32'hffff_ffff) ? 6'd32 : {1'b0, clo_res4,clo_res3,clo_res2,clo_res1,clo_res0};

wire        clz_res0;
wire        clz_res1;
wire        clz_res2;
wire        clz_res3;
wire        clz_res4;

wire [31:0] clz_val32;
wire [15:0] clz_val16;
wire [ 7:0] clz_val8;
wire [ 3:0] clz_val4;
wire [ 1:0] clz_val2;

assign clz_val32  = in[31:0];
assign clz_res4 = (clz_val32[31:16] == 16'h0);
assign clz_val16  = clz_res4 ? clz_val32[15: 0] : clz_val32[31:16];
assign clz_res3 = (clz_val16[15:8] == 8'h0);
assign clz_val8   = clz_res3 ? clz_val16[ 7: 0] : clz_val16[15: 8];
assign clz_res2 = (clz_val8 [ 7:4] == 4'h0);
assign clz_val4   = clz_res2 ? clz_val8 [ 3: 0] : clz_val8 [7: 4];
assign clz_res1 = (clz_val4 [ 3:2] == 2'h0);
assign clz_val2   = clz_res1 ? clz_val4 [ 1: 0] : clz_val4 [ 3: 2];
assign clz_res0 = (clz_val2 [1] == 1'h0);

assign count_zero = (in == 32'h0) ? 6'd32 : {1'b0, clz_res4,clz_res3,clz_res2,clz_res1,clz_res0};

endmodule

//0 --- 0000 --- 0
//1 --- 0001,0010,0100,1000 --- 1,2,4,8
//2 --- 1001,1010,1100,0110,0101,0011 --- 9,a,c,6,5,3
//3 --- 1110,1101,1011,0111 --- e,d,b,7
//4 --- 1111 --- f

module ysyx_210101_branch_predictor(
	input         clk,
	input         reset,

	// from fs
	input  [31:0] inst,
	input  [31:0] pc,
	input         valid,

	// from ds
	input         jr_we,
	input  [31:0] jr_realtarget,

	// from ds
	input         ds_br,
	input         ds_br_taken,
	input [31:0] ds_pc,

	// to ps
	output        taken,
	output [31:0] pc_predict,
	output        pre_branch
);

parameter LEN = 6;
wire [31:0] pc_predict_next;
wire [31:0] target_n;
wire [31:0] target_b;
wire [31:0] target_jt;
wire [15:0] imm;
wire [25:0] jidx;

assign imm  = inst[15: 0];
assign jidx = inst[25: 0];

wire [63:0] op_d;
wire [63:0] func_d;
wire [31:0] rt_d;
reg  [31:0] jr_target;

reg [ 1:0] bht_list [2 ** LEN-1:0];

integer i;
initial begin
	for (i = 0; i < 2 ** LEN; i=i+1) begin
		bht_list[i] =  2'b0;
	end
end

initial jr_target = 32'b0; 
always @(posedge clk) begin
    if (jr_we)
		jr_target <= jr_realtarget;
end 

// FAST DECODE
always @(posedge clk) begin
	if (ds_br && ds_br_taken)
		bht_list[ds_pc[LEN+1:2]] <= {bht_list[ds_pc[LEN+1:2]][0], 1'b1};
	else if (ds_br && !ds_br_taken)
		bht_list[ds_pc[LEN+1:2]] <= {bht_list[ds_pc[LEN+1:2]][0], 1'b0};
end

wire   inst_branch;
wire   inst_beq;
wire   inst_bsure;
wire   inst_bne;
wire   inst_jal;
wire   inst_jr;
wire   inst_bgez;
wire   inst_bgtz;
wire   inst_blez;
wire   inst_bltz;
wire   inst_j;
wire   inst_jalr;
wire   inst_bgezal;
wire   inst_bltzal;
wire   inst_b;
wire   inst_jt;
wire   inst_sure;
wire   inst_unsure;

assign pre_branch = inst_branch;
assign inst_branch = inst_b | inst_jt | inst_jr;

assign inst_beq    = inst[31:26] == 6'h04 && (inst[25:21] != 0 || inst[20:16] != 0);
assign inst_bsure  = inst[31:26] == 6'h04 && (inst[25:21] == 0 && inst[20:16] == 0);
assign inst_bne    = inst[31:26] == 6'h05;
assign inst_jal    = inst[31:26] == 6'h03;
assign inst_jr     = inst[31:26] == 6'h00 && inst[ 5: 0] == 6'h08;
assign inst_bgez   = inst[31:26] == 6'h01 && inst[20:16] == 5'h01;
assign inst_bgtz   = inst[31:26] == 6'h07 && inst[20:16] == 5'h00;
assign inst_blez   = inst[31:26] == 6'h06 && inst[20:16] == 5'h00;
assign inst_bltz   = inst[31:26] == 6'h01 && inst[20:16] == 5'h00;
assign inst_j      = inst[31:26] == 6'h02;
assign inst_jalr   = inst[31:26] == 6'h00 && inst[ 5: 0] == 6'h09;
assign inst_bgezal = inst[31:26] == 6'h01 && inst[20:16] == 5'h11;
assign inst_bltzal = inst[31:26] == 6'h01 && inst[20:16] == 5'h10;

assign inst_b      = inst_beq | inst_bne | inst_bgez   | inst_bltz  | inst_blez | inst_bgtz | inst_bsure;
assign inst_jt     = inst_j   | inst_jal | inst_bgezal | inst_bltzal;
assign inst_sure   = inst_j   | inst_jal | inst_bsure  ;
assign inst_unsure = inst_branch && ~inst_sure;

assign taken       = (inst_unsure && bht_list[pc[LEN+1:2]][1] || inst_sure)&& valid;//(inst_beq && !inst[25:21] && !inst[20:16) | inst_jal | inst_jr | inst_j | inst_jalr;
assign target_n    = pc + 32'h4;
assign target_b    = target_n + {{14{imm[15]}}, imm[15:0], 2'b0};
assign target_jt   = {target_n[31:28], jidx[25:0], 2'b0};
assign pc_predict  = taken ? ({32{inst_b }} & target_b) | 
					      ({32{inst_jt}} & target_jt) |
				          ({32{inst_jr | inst_jalr}} & jr_target) : pc + 8;

endmodule

module ysyx_210101_cp0(
    input clk,
    input rst,
    
    // Exception
    input es_ex,
    input es_ex_tlb,
    input es_bd,
    input eret_flush,
    input [4:0] es_exccode,
    input [31:0] es_pc,
    input [31:0] es_badvaddr,

    // Write port
    input [4:0] dst,
    input [2:0] sel,
    input mtc0_we,
    input [31:0] data,
    
    // External interrupt
    input [5:0] ext_int_in,

    // TLB related
    input tlbp,
    input tlbp_found,
    input [3:0] index,
    input tlbr,
    input tlbwr,
    
    input [18:0] r_vpn2,     
    input [ 7:0] r_asid,     
    input r_g,     
    input [19:0] r_pfn0,     
    input [ 2:0] r_c0,     
    input r_d0,     
    input r_v0,     
    input [19:0] r_pfn1,     
    input [ 2:0] r_c1,     
    input r_d1,     
    input r_v1,  

    // Read port
	output has_int,
    output [31:0] rdata,
    output reg [31:0] cp0_epc,
    output [31:0] cp0_entryhi,
    output [31:0] cp0_entrylo0,
    output [31:0] cp0_entrylo1,
    output [31:0] cp0_index,
    output [31:0] cp0_random
);

localparam REG_INDEX    = 0;
localparam REG_RANDOM   = 1;
localparam REG_ENTRYLO0 = 2;
localparam REG_ENTRYLO1 = 3;
localparam REG_CONTEXT  = 4;
localparam REG_WIRED    = 6;
localparam REG_BADVADDR = 8;
localparam REG_COUNT    = 9;
localparam REG_ENTRYHI  = 10;
localparam REG_COMPARE  = 11;
localparam REG_STATUS   = 12;
localparam REG_CAUSE    = 13;
localparam REG_EPC      = 14;
localparam REG_PRID     = 15;
localparam REG_CONFIG   = 16;

localparam SEL_CONFIG0  = 0;
localparam SEL_CONFIG1  = 1;

wire cp0_count_eq;
// STATUS
wire [31:0] cp0_status;
reg [7:0] cp0_status_im;
reg cp0_status_exl;
reg cp0_status_ie;

// CAUSE
wire [31:0] cp0_cause;
reg cp0_cause_bd;
reg cp0_cause_ti;
reg [7:0] cp0_cause_ip;
reg [4:0] cp0_cause_exccode;

reg [31:0] cp0_count;
reg [31:0] cp0_compare;
reg [31:0] cp0_badvaddr;

// entryhi
reg [18:0] cp0_entryhi_vpn2;
reg [ 7:0] cp0_entryhi_asid;

// entrylo
reg [19:0] cp0_entrylo0_pfn0;
reg [ 2:0] cp0_entrylo0_c0;
reg        cp0_entrylo0_d0;
reg        cp0_entrylo0_v0;
reg        cp0_entrylo0_g0;

reg [19:0] cp0_entrylo1_pfn1;
reg [ 2:0] cp0_entrylo1_c1;
reg        cp0_entrylo1_d1;
reg        cp0_entrylo1_v1;
reg        cp0_entrylo1_g1;

// index
reg        cp0_index_p;
reg [ 3:0] cp0_index_index;

// random
reg [ 3:0] cp0_random_random;

// wired
wire [31:0] cp0_wired;
reg  [ 3:0] cp0_wired_wired;

// prid
wire [31:0] cp0_prid;

// STATUS
assign cp0_status = { 9'b0, //31:23
                      1'b1, //22:22
                      6'b0, //21:16
                      cp0_status_im, //15:8
                      6'b0, //7:2
                      cp0_status_exl, //1:1 
                      cp0_status_ie //0:0
                     };

always @(posedge clk) begin
    if (rst) begin
        cp0_status_im <= 8'b0;        // reset state undefined in handbook;
    end 
    else if (mtc0_we && dst == REG_STATUS) begin
        cp0_status_im <= data[15:8];
    end 
end

always @(posedge clk) begin
    if (rst)
        cp0_status_exl <= 1'b0;
    else if (es_ex)
        cp0_status_exl <= 1'b1;
    else if (eret_flush)
        cp0_status_exl <= 1'b0;
    else if (mtc0_we && dst == REG_STATUS)
        cp0_status_exl <= data[1];
end

always @(posedge clk) begin
    if (rst)
        cp0_status_ie <= 1'b0;
    else if (mtc0_we && dst == REG_STATUS)
        cp0_status_ie <= data[0];
end

// CAUSE
assign cp0_cause = { cp0_cause_bd, //31:31
                     cp0_cause_ti, //30:30
                     14'b0, //29:16
                     cp0_cause_ip, //15:8
                     1'b0, //7:7
                     cp0_cause_exccode, //6:2
                     2'b0 //1:0
                    };

always @(posedge clk) begin
    if (rst)
        cp0_cause_bd <= 1'b0;
    else if (es_ex && !cp0_status_exl)
        cp0_cause_bd <= es_bd;
end

always @(posedge clk) begin
    if (rst)
        cp0_cause_ti <= 1'b0;
    else if (mtc0_we && dst == REG_COMPARE)
        cp0_cause_ti <= 1'b0;
    else if (cp0_count_eq)
        cp0_cause_ti <= 1'b1;
end

always @(posedge clk) begin
    if (rst)
        cp0_cause_ip[7:2] <= 6'b0;
    else begin
        cp0_cause_ip[7]   <= ext_int_in[5] | cp0_cause_ti;
        cp0_cause_ip[6:2] <= ext_int_in[4:0];
    end
end

always @(posedge clk) begin
    if (rst)
        cp0_cause_ip[1:0] <= 2'b0;
    else if (mtc0_we && dst == REG_CAUSE)
        cp0_cause_ip[1:0] <= data[9:8];
end 

always @(posedge clk) begin
    if (rst)
        cp0_cause_exccode <= 5'b0;
    else if (es_ex)
        cp0_cause_exccode <= es_exccode;
end

// EPC
always @(posedge clk) begin
    if (rst) begin
        cp0_epc <= 32'b0;            // reset state undefined in handbook;
    end
    else if (es_ex && !cp0_status_exl) begin
        cp0_epc <= es_bd ? es_pc - 32'h4 : es_pc;
    end
    else if (mtc0_we && dst == REG_EPC) begin
        cp0_epc <= data;
    end      
end

// PRID
assign cp0_prid = 32'h00004220;

// Badvaddr
always @(posedge clk) begin
    if (rst) 
        cp0_badvaddr <= 32'b0;        // reset state undefined in handbook;
    else if (es_ex && (es_exccode == `EX_ADEL || es_exccode == `EX_ADES))
        cp0_badvaddr <= es_badvaddr;
end
// Count
reg tick;
always @(posedge clk) begin
    if (rst)
        tick <= 0;
    else
        tick <= ~tick;
    
    if (rst) 
        cp0_count <= 32'b0;          // reset state undefined in handbook;
    else if (mtc0_we && dst == REG_COUNT)
        cp0_count <= data;
    else if (tick)
        cp0_count <= cp0_count + 1'b1;
end
// Compare
always @(posedge clk) begin
    if (rst)
        cp0_compare <= 32'b0;        // reset state undefined in handbook;
    else if(mtc0_we && dst == REG_COMPARE)
        cp0_compare <= data;
end
assign cp0_count_eq = cp0_count == cp0_compare;

// EntryHi
assign cp0_entryhi = { cp0_entryhi_vpn2,
                       5'b0,
                       cp0_entryhi_asid};

// vpn2
always @(posedge clk) begin
    if (rst)
        cp0_entryhi_vpn2 <= 19'b0;
    else if (es_ex_tlb)
        cp0_entryhi_vpn2 <= es_badvaddr[31:13];
    else if (mtc0_we && dst == REG_ENTRYHI)
        cp0_entryhi_vpn2 <= data[31:13];
    else if (tlbr)
        cp0_entryhi_vpn2 <= r_vpn2;
end

// vpn1
always @(posedge clk) begin
    if (rst)
        cp0_entryhi_asid <= 8'b0;
    else if (mtc0_we && dst == REG_ENTRYHI)
        cp0_entryhi_asid <= data[7:0];
    else if (tlbr)
        cp0_entryhi_asid <= r_asid;
end


// EntryLo
assign cp0_entrylo0 = { 6'b0,
                        cp0_entrylo0_pfn0,
                        cp0_entrylo0_c0,
                        cp0_entrylo0_d0,
                        cp0_entrylo0_v0,
                        cp0_entrylo0_g0};

always @(posedge clk) begin
    if (rst)
        cp0_entrylo0_pfn0 <= 20'b0;
    else if (mtc0_we && dst == REG_ENTRYLO0)
        cp0_entrylo0_pfn0 <= data[25:6];
    else if (tlbr)
        cp0_entrylo0_pfn0 <= r_pfn0;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo0_c0 <= 3'b0;
    else if (mtc0_we && dst == REG_ENTRYLO0)
        cp0_entrylo0_c0 <= data[5:3];
    else if (tlbr)
        cp0_entrylo0_c0 <= r_c0;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo0_d0 <= 1'b0;
    else if (mtc0_we && dst == REG_ENTRYLO0)
        cp0_entrylo0_d0 <= data[2];
    else if (tlbr)
        cp0_entrylo0_d0 <= r_d0;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo0_v0 <= 1'b0;
    else if (mtc0_we && dst == REG_ENTRYLO0)
        cp0_entrylo0_v0 <= data[1];
    else if (tlbr)
        cp0_entrylo0_v0 <= r_v0;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo0_g0 <= 1'b0;
    else if (mtc0_we && dst == REG_ENTRYLO0)
        cp0_entrylo0_g0 <= data[0];
    else if (tlbr)
        cp0_entrylo0_g0 <= r_g;
end

assign cp0_entrylo1 = { 6'b0,
                        cp0_entrylo1_pfn1,
                        cp0_entrylo1_c1,
                        cp0_entrylo1_d1,
                        cp0_entrylo1_v1,
                        cp0_entrylo1_g1};

always @(posedge clk) begin
    if (rst)
        cp0_entrylo1_pfn1 <= 20'b0;
    else if (mtc0_we && dst == REG_ENTRYLO1)
        cp0_entrylo1_pfn1 <= data[25:6];
    else if (tlbr)
        cp0_entrylo1_pfn1 <= r_pfn1;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo1_c1 <= 3'b0;
    else if (mtc0_we && dst == REG_ENTRYLO1)
        cp0_entrylo1_c1 <= data[5:3];
    else if (tlbr)
        cp0_entrylo1_c1 <= r_c1;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo1_d1 <= 1'b0;
    else if (mtc0_we && dst == REG_ENTRYLO1)
        cp0_entrylo1_d1 <= data[2];
    else if (tlbr)
        cp0_entrylo1_d1 <= r_d1;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo1_v1 <= 1'b0;
    else if (mtc0_we && dst == REG_ENTRYLO1)
        cp0_entrylo1_v1 <= data[1];
    else if (tlbr)
        cp0_entrylo1_v1 <= r_v1;
end

always @(posedge clk) begin
    if (rst)
        cp0_entrylo1_g1 <= 1'b0;
    else if (mtc0_we && dst == REG_ENTRYLO1)
        cp0_entrylo1_g1 <= data[0];
    else if (tlbr)
        cp0_entrylo1_g1 <= r_g;
end

// Index
assign cp0_index = { cp0_index_p,
                     27'b0,
                     cp0_index_index};

always @(posedge clk) begin
    if (rst)
        cp0_index_p <= 1'b0;
    else if (tlbp && !tlbp_found)
        cp0_index_p <= 1'b1;
    else if (tlbp &&  tlbp_found)
        cp0_index_p <= 1'b0;
end

always @(posedge clk) begin
    if (rst)
        cp0_index_index <= 4'b0;
    else if (mtc0_we && dst == REG_INDEX)
        cp0_index_index <= data[3:0];
    else if (tlbp &&  tlbp_found)
        cp0_index_index <= index;
end

// Random
assign cp0_random = {
    28'b0,
    cp0_random_random
};

always @(posedge clk) begin
    if (rst)
        cp0_random_random <= 15;
    else if (mtc0_we && dst == REG_RANDOM)
        cp0_random_random <= data[3:0];
    else if (tlbwr) begin
        if (cp0_random_random == 15) begin
            cp0_random_random <= cp0_wired_wired;
        end else begin
            cp0_random_random <= cp0_random_random + 1;
        end
    end
end

// Wired
assign cp0_wired = {
    28'b0,
    cp0_wired_wired
};

always @(posedge clk) begin
    if (rst)
        cp0_wired_wired <= 4'b0;
    else if (mtc0_we && dst == REG_WIRED)
        cp0_wired_wired <= data[3:0];
end

// Config0
reg  [ 2:0] config0_k0;
wire [31:0] config0;
wire [31:0] config1;

assign rdata = 
    ({32{dst == REG_EPC	   }} & cp0_epc      ) |
    ({32{dst == REG_STATUS  }} & cp0_status   ) |
    ({32{dst == REG_CAUSE   }} & cp0_cause    ) |
    ({32{dst == REG_COUNT   }} & cp0_count    ) |
    ({32{dst == REG_BADVADDR}} & cp0_badvaddr ) |
    ({32{dst == REG_ENTRYHI }} & cp0_entryhi  ) |
    ({32{dst == REG_INDEX   }} & cp0_index    ) |
    ({32{dst == REG_RANDOM  }} & cp0_random   ) |
    ({32{dst == REG_WIRED   }} & cp0_wired    ) |
    ({32{dst == REG_ENTRYLO0}} & cp0_entrylo0 ) |
    ({32{dst == REG_ENTRYLO1}} & cp0_entrylo1 ) |
    ({32{dst == REG_CONFIG && sel == SEL_CONFIG0}} & config0 ) |
    ({32{dst == REG_CONFIG && sel == SEL_CONFIG1}} & config1 ) |
    ({32{dst == REG_PRID    }} & cp0_prid     ) |
    ({32{dst == REG_COMPARE }} & cp0_compare  ) ;
			   
assign has_int = ((cp0_cause_ip[7:0] & cp0_status_im[7:0]) != 8'h00) && cp0_status_ie && !cp0_status_exl;


always @(posedge clk) begin
	if (rst)
		config0_k0 <= 3'd2;
	else if (mtc0_we && dst == REG_CONFIG && sel == SEL_CONFIG0)
		config0_k0 <= data[2:0];
end

assign config0 = {
    1'b1,
	15'b0,
	1'b0,
    2'b0,
    3'b0,
    3'b1,
    4'b0,
    3'd2  //config0_k0
};

assign config1 = {
    1'b0,
    6'd`TLBNUM - 1'b1,
    `ICACHELINE,
    3'h4,
    `ICACHECONN,
    `DCACHELINE,
    3'h4,
    `DCACHECONN,
    7'b0
};
endmodule


module ysyx_210101_regfile(
    input         clk,
    input         reset,
    // READ PORT 1
    input  [ 4:0] raddr1,
    output [31:0] rdata1,
    // READ PORT 2
    input  [ 4:0] raddr2,
    output [31:0] rdata2,
    // WRITE PORT
    input  [ 3:0]    we,       //write enable, HIGH valid
    input  [ 4:0] waddr,
    input  [31:0] wdata
);
reg [31:0] rf[31:0];

//WRITE
always @(posedge clk) begin
    if (reset) begin
        rf[0] <= 32'b0;
        rf[1] <= 32'b0;
        rf[2] <= 32'b0;
        rf[3] <= 32'b0;
        rf[4] <= 32'b0;
        rf[5] <= 32'b0;
        rf[6] <= 32'b0;
        rf[7] <= 32'b0;
        rf[8] <= 32'b0;
        rf[9] <= 32'b0;
        rf[10] <= 32'b0;
        rf[11] <= 32'b0;
        rf[12] <= 32'b0;
        rf[13] <= 32'b0;
        rf[14] <= 32'b0;
        rf[15] <= 32'b0;
        rf[16] <= 32'b0;
        rf[17] <= 32'b0;
        rf[18] <= 32'b0;
        rf[19] <= 32'b0;
        rf[20] <= 32'b0;
        rf[21] <= 32'b0;
        rf[22] <= 32'b0;
        rf[23] <= 32'b0;
        rf[24] <= 32'b0;
        rf[25] <= 32'b0;
        rf[26] <= 32'b0;
        rf[27] <= 32'b0;
        rf[28] <= 32'b0;
        rf[29] <= 32'b0;
        rf[30] <= 32'b0;
        rf[31] <= 32'b0;
    end
    else if (|we) begin
        rf[waddr][ 7: 0] <= we[0] ? wdata[ 7: 0] : rf[waddr][ 7: 0];
        rf[waddr][15: 8] <= we[1] ? wdata[15: 8] : rf[waddr][15: 8];
        rf[waddr][23:16] <= we[2] ? wdata[23:16] : rf[waddr][23:16];
        rf[waddr][31:24] <= we[3] ? wdata[31:24] : rf[waddr][31:24];
    end
end

//READ OUT 1
assign rdata1 = (raddr1==5'b0) ? 32'b0 : rf[raddr1];

//READ OUT 2
assign rdata2 = (raddr2==5'b0) ? 32'b0 : rf[raddr2];

endmodule

//===============================================================================================================================//
module ysyx_210101_addr_converter (
    input   [31:0]  cpu_addr,
    output  [31:0]  soc_addr
);

wire [`SEG_NUM:0] addr_hit;
wire [31:0] addr_new    [`SEG_NUM:1];

wire [31:0] mask        [`SEG_NUM:1];
wire [31:0] cpu_base    [`SEG_NUM:1];
wire [31:0] soc_base    [`SEG_NUM:1];

assign mask[`RAM]       = 32'hf800_0000;
assign mask[`FLASH_2]   = 32'hff80_0000;
assign mask[`FLASH_1]   = 32'hffc0_0000;
assign mask[`FLASH_0]   = 32'hfff0_0000;
assign mask[`UART]      = 32'hffff_f000;
assign mask[`SPI]       = 32'hffff_f000;

assign cpu_base[`RAM]       = 32'h0000_0000;
assign cpu_base[`FLASH_2]   = 32'h1f00_0000;
assign cpu_base[`FLASH_1]   = 32'h1f80_0000;
assign cpu_base[`FLASH_0]   = 32'h1fc0_0000;
assign cpu_base[`UART]      = 32'h1fe4_0000;
assign cpu_base[`SPI]       = 32'h1fe8_0000;

assign soc_base[`RAM]       = 32'h8000_0000;
assign soc_base[`FLASH_2]   = 32'h3000_0000;
assign soc_base[`FLASH_1]   = 32'h3080_0000;
assign soc_base[`FLASH_0]   = 32'h30c0_0000;
assign soc_base[`UART]      = 32'h1000_0000;
assign soc_base[`SPI]       = 32'h1000_1000;

//assign addr_hit[0] = ~|addr_hit[6:1];
assign addr_hit[0] = 0;

genvar idx;
generate for (idx = 1; idx <= `SEG_NUM; idx = idx + 1) begin : addr_check
    assign addr_hit[idx] = (cpu_addr & mask[idx]) == cpu_base[idx];
    assign addr_new[idx] = (cpu_addr & ~mask[idx]) | soc_base[idx];
end endgenerate

reg [31:0] soc_addr_r;
assign soc_addr = soc_addr_r;

integer jdx;
always @ (*) begin
    soc_addr_r = 32'h0;
    for (jdx = 1; jdx <= `SEG_NUM; jdx = jdx + 1) begin
        soc_addr_r = soc_addr_r | ({32{addr_hit[jdx]}} & addr_new[jdx]);
    end
end

endmodule


module ysyx_210101_AXI4Xbar(
  input               io_port0_aw_valid,
  output              io_port0_aw_ready,
  input      [31:0]   io_port0_aw_payload_addr,
  input      [2:0]    io_port0_aw_payload_id,
  input      [3:0]    io_port0_aw_payload_region,
  input      [7:0]    io_port0_aw_payload_len,
  input      [2:0]    io_port0_aw_payload_size,
  input      [1:0]    io_port0_aw_payload_burst,
  input      [0:0]    io_port0_aw_payload_lock,
  input      [3:0]    io_port0_aw_payload_cache,
  input      [3:0]    io_port0_aw_payload_qos,
  input      [2:0]    io_port0_aw_payload_prot,
  input               io_port0_w_valid,
  output              io_port0_w_ready,
  input      [63:0]   io_port0_w_payload_data,
  input      [7:0]    io_port0_w_payload_strb,
  input               io_port0_w_payload_last,
  output              io_port0_b_valid,
  input               io_port0_b_ready,
  output     [2:0]    io_port0_b_payload_id,
  output     [1:0]    io_port0_b_payload_resp,
  input               io_port0_ar_valid,
  output              io_port0_ar_ready,
  input      [31:0]   io_port0_ar_payload_addr,
  input      [2:0]    io_port0_ar_payload_id,
  input      [3:0]    io_port0_ar_payload_region,
  input      [7:0]    io_port0_ar_payload_len,
  input      [2:0]    io_port0_ar_payload_size,
  input      [1:0]    io_port0_ar_payload_burst,
  input      [0:0]    io_port0_ar_payload_lock,
  input      [3:0]    io_port0_ar_payload_cache,
  input      [3:0]    io_port0_ar_payload_qos,
  input      [2:0]    io_port0_ar_payload_prot,
  output              io_port0_r_valid,
  input               io_port0_r_ready,
  output     [63:0]   io_port0_r_payload_data,
  output     [2:0]    io_port0_r_payload_id,
  output     [1:0]    io_port0_r_payload_resp,
  output              io_port0_r_payload_last,
  input               io_port1_aw_valid,
  output              io_port1_aw_ready,
  input      [31:0]   io_port1_aw_payload_addr,
  input      [2:0]    io_port1_aw_payload_id,
  input      [3:0]    io_port1_aw_payload_region,
  input      [7:0]    io_port1_aw_payload_len,
  input      [2:0]    io_port1_aw_payload_size,
  input      [1:0]    io_port1_aw_payload_burst,
  input      [0:0]    io_port1_aw_payload_lock,
  input      [3:0]    io_port1_aw_payload_cache,
  input      [3:0]    io_port1_aw_payload_qos,
  input      [2:0]    io_port1_aw_payload_prot,
  input               io_port1_w_valid,
  output              io_port1_w_ready,
  input      [63:0]   io_port1_w_payload_data,
  input      [7:0]    io_port1_w_payload_strb,
  input               io_port1_w_payload_last,
  output              io_port1_b_valid,
  input               io_port1_b_ready,
  output     [2:0]    io_port1_b_payload_id,
  output     [1:0]    io_port1_b_payload_resp,
  input               io_port1_ar_valid,
  output              io_port1_ar_ready,
  input      [31:0]   io_port1_ar_payload_addr,
  input      [2:0]    io_port1_ar_payload_id,
  input      [3:0]    io_port1_ar_payload_region,
  input      [7:0]    io_port1_ar_payload_len,
  input      [2:0]    io_port1_ar_payload_size,
  input      [1:0]    io_port1_ar_payload_burst,
  input      [0:0]    io_port1_ar_payload_lock,
  input      [3:0]    io_port1_ar_payload_cache,
  input      [3:0]    io_port1_ar_payload_qos,
  input      [2:0]    io_port1_ar_payload_prot,
  output              io_port1_r_valid,
  input               io_port1_r_ready,
  output     [63:0]   io_port1_r_payload_data,
  output     [2:0]    io_port1_r_payload_id,
  output     [1:0]    io_port1_r_payload_resp,
  output              io_port1_r_payload_last,
  output              io_out_port_aw_valid,
  input               io_out_port_aw_ready,
  output     [31:0]   io_out_port_aw_payload_addr,
  output     [3:0]    io_out_port_aw_payload_id,
  output     [3:0]    io_out_port_aw_payload_region,
  output     [7:0]    io_out_port_aw_payload_len,
  output     [2:0]    io_out_port_aw_payload_size,
  output     [1:0]    io_out_port_aw_payload_burst,
  output     [0:0]    io_out_port_aw_payload_lock,
  output     [3:0]    io_out_port_aw_payload_cache,
  output     [3:0]    io_out_port_aw_payload_qos,
  output     [2:0]    io_out_port_aw_payload_prot,
  output              io_out_port_w_valid,
  input               io_out_port_w_ready,
  output     [63:0]   io_out_port_w_payload_data,
  output     [7:0]    io_out_port_w_payload_strb,
  output              io_out_port_w_payload_last,
  input               io_out_port_b_valid,
  output              io_out_port_b_ready,
  input      [3:0]    io_out_port_b_payload_id,
  input      [1:0]    io_out_port_b_payload_resp,
  output              io_out_port_ar_valid,
  input               io_out_port_ar_ready,
  output     [31:0]   io_out_port_ar_payload_addr,
  output     [3:0]    io_out_port_ar_payload_id,
  output     [3:0]    io_out_port_ar_payload_region,
  output     [7:0]    io_out_port_ar_payload_len,
  output     [2:0]    io_out_port_ar_payload_size,
  output     [1:0]    io_out_port_ar_payload_burst,
  output     [0:0]    io_out_port_ar_payload_lock,
  output     [3:0]    io_out_port_ar_payload_cache,
  output     [3:0]    io_out_port_ar_payload_qos,
  output     [2:0]    io_out_port_ar_payload_prot,
  input               io_out_port_r_valid,
  output              io_out_port_r_ready,
  input      [63:0]   io_out_port_r_payload_data,
  input      [3:0]    io_out_port_r_payload_id,
  input      [1:0]    io_out_port_r_payload_resp,
  input               io_out_port_r_payload_last,
  input               clk,
  input               reset
);
  wire                io_port0_readOnly_decoder_io_input_ar_ready;
  wire                io_port0_readOnly_decoder_io_input_r_valid;
  wire       [63:0]   io_port0_readOnly_decoder_io_input_r_payload_data;
  wire       [2:0]    io_port0_readOnly_decoder_io_input_r_payload_id;
  wire       [1:0]    io_port0_readOnly_decoder_io_input_r_payload_resp;
  wire                io_port0_readOnly_decoder_io_input_r_payload_last;
  wire                io_port0_readOnly_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   io_port0_readOnly_decoder_io_outputs_0_ar_payload_addr;
  wire       [2:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_id;
  wire       [3:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_region;
  wire       [7:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_size;
  wire       [1:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_burst;
  wire       [0:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_lock;
  wire       [3:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_cache;
  wire       [3:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_qos;
  wire       [2:0]    io_port0_readOnly_decoder_io_outputs_0_ar_payload_prot;
  wire                io_port0_readOnly_decoder_io_outputs_0_r_ready;
  wire                io_port0_writeOnly_decoder_io_input_aw_ready;
  wire                io_port0_writeOnly_decoder_io_input_w_ready;
  wire                io_port0_writeOnly_decoder_io_input_b_valid;
  wire       [2:0]    io_port0_writeOnly_decoder_io_input_b_payload_id;
  wire       [1:0]    io_port0_writeOnly_decoder_io_input_b_payload_resp;
  wire                io_port0_writeOnly_decoder_io_outputs_0_aw_valid;
  wire       [31:0]   io_port0_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  wire       [2:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_id;
  wire       [3:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_region;
  wire       [7:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_len;
  wire       [2:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_size;
  wire       [1:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  wire       [0:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  wire       [3:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  wire       [3:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_qos;
  wire       [2:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  wire                io_port0_writeOnly_decoder_io_outputs_0_w_valid;
  wire       [63:0]   io_port0_writeOnly_decoder_io_outputs_0_w_payload_data;
  wire       [7:0]    io_port0_writeOnly_decoder_io_outputs_0_w_payload_strb;
  wire                io_port0_writeOnly_decoder_io_outputs_0_w_payload_last;
  wire                io_port0_writeOnly_decoder_io_outputs_0_b_ready;
  wire                io_port1_readOnly_decoder_io_input_ar_ready;
  wire                io_port1_readOnly_decoder_io_input_r_valid;
  wire       [63:0]   io_port1_readOnly_decoder_io_input_r_payload_data;
  wire       [2:0]    io_port1_readOnly_decoder_io_input_r_payload_id;
  wire       [1:0]    io_port1_readOnly_decoder_io_input_r_payload_resp;
  wire                io_port1_readOnly_decoder_io_input_r_payload_last;
  wire                io_port1_readOnly_decoder_io_outputs_0_ar_valid;
  wire       [31:0]   io_port1_readOnly_decoder_io_outputs_0_ar_payload_addr;
  wire       [2:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_id;
  wire       [3:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_region;
  wire       [7:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_len;
  wire       [2:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_size;
  wire       [1:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_burst;
  wire       [0:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_lock;
  wire       [3:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_cache;
  wire       [3:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_qos;
  wire       [2:0]    io_port1_readOnly_decoder_io_outputs_0_ar_payload_prot;
  wire                io_port1_readOnly_decoder_io_outputs_0_r_ready;
  wire                io_port1_writeOnly_decoder_io_input_aw_ready;
  wire                io_port1_writeOnly_decoder_io_input_w_ready;
  wire                io_port1_writeOnly_decoder_io_input_b_valid;
  wire       [2:0]    io_port1_writeOnly_decoder_io_input_b_payload_id;
  wire       [1:0]    io_port1_writeOnly_decoder_io_input_b_payload_resp;
  wire                io_port1_writeOnly_decoder_io_outputs_0_aw_valid;
  wire       [31:0]   io_port1_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  wire       [2:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_id;
  wire       [3:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_region;
  wire       [7:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_len;
  wire       [2:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_size;
  wire       [1:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  wire       [0:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  wire       [3:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  wire       [3:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_qos;
  wire       [2:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  wire                io_port1_writeOnly_decoder_io_outputs_0_w_valid;
  wire       [63:0]   io_port1_writeOnly_decoder_io_outputs_0_w_payload_data;
  wire       [7:0]    io_port1_writeOnly_decoder_io_outputs_0_w_payload_strb;
  wire                io_port1_writeOnly_decoder_io_outputs_0_w_payload_last;
  wire                io_port1_writeOnly_decoder_io_outputs_0_b_ready;
  wire                io_out_port_readOnly_arbiter_io_inputs_0_ar_ready;
  wire                io_out_port_readOnly_arbiter_io_inputs_0_r_valid;
  wire       [63:0]   io_out_port_readOnly_arbiter_io_inputs_0_r_payload_data;
  wire       [2:0]    io_out_port_readOnly_arbiter_io_inputs_0_r_payload_id;
  wire       [1:0]    io_out_port_readOnly_arbiter_io_inputs_0_r_payload_resp;
  wire                io_out_port_readOnly_arbiter_io_inputs_0_r_payload_last;
  wire                io_out_port_readOnly_arbiter_io_inputs_1_ar_ready;
  wire                io_out_port_readOnly_arbiter_io_inputs_1_r_valid;
  wire       [63:0]   io_out_port_readOnly_arbiter_io_inputs_1_r_payload_data;
  wire       [2:0]    io_out_port_readOnly_arbiter_io_inputs_1_r_payload_id;
  wire       [1:0]    io_out_port_readOnly_arbiter_io_inputs_1_r_payload_resp;
  wire                io_out_port_readOnly_arbiter_io_inputs_1_r_payload_last;
  wire                io_out_port_readOnly_arbiter_io_output_ar_valid;
  wire       [31:0]   io_out_port_readOnly_arbiter_io_output_ar_payload_addr;
  wire       [3:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_id;
  wire       [3:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_region;
  wire       [7:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_len;
  wire       [2:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_size;
  wire       [1:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_burst;
  wire       [0:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_lock;
  wire       [3:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_cache;
  wire       [3:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_qos;
  wire       [2:0]    io_out_port_readOnly_arbiter_io_output_ar_payload_prot;
  wire                io_out_port_readOnly_arbiter_io_output_r_ready;
  wire                io_out_port_writeOnly_arbiter_io_inputs_0_aw_ready;
  wire                io_out_port_writeOnly_arbiter_io_inputs_0_w_ready;
  wire                io_out_port_writeOnly_arbiter_io_inputs_0_b_valid;
  wire       [2:0]    io_out_port_writeOnly_arbiter_io_inputs_0_b_payload_id;
  wire       [1:0]    io_out_port_writeOnly_arbiter_io_inputs_0_b_payload_resp;
  wire                io_out_port_writeOnly_arbiter_io_inputs_1_aw_ready;
  wire                io_out_port_writeOnly_arbiter_io_inputs_1_w_ready;
  wire                io_out_port_writeOnly_arbiter_io_inputs_1_b_valid;
  wire       [2:0]    io_out_port_writeOnly_arbiter_io_inputs_1_b_payload_id;
  wire       [1:0]    io_out_port_writeOnly_arbiter_io_inputs_1_b_payload_resp;
  wire                io_out_port_writeOnly_arbiter_io_output_aw_valid;
  wire       [31:0]   io_out_port_writeOnly_arbiter_io_output_aw_payload_addr;
  wire       [3:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_id;
  wire       [3:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_region;
  wire       [7:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_len;
  wire       [2:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_size;
  wire       [1:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_burst;
  wire       [0:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_lock;
  wire       [3:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_cache;
  wire       [3:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_qos;
  wire       [2:0]    io_out_port_writeOnly_arbiter_io_output_aw_payload_prot;
  wire                io_out_port_writeOnly_arbiter_io_output_w_valid;
  wire       [63:0]   io_out_port_writeOnly_arbiter_io_output_w_payload_data;
  wire       [7:0]    io_out_port_writeOnly_arbiter_io_output_w_payload_strb;
  wire                io_out_port_writeOnly_arbiter_io_output_w_payload_last;
  wire                io_out_port_writeOnly_arbiter_io_output_b_ready;
  wire                io_out_port_readOnly_ar_valid;
  wire                io_out_port_readOnly_ar_ready;
  wire       [31:0]   io_out_port_readOnly_ar_payload_addr;
  wire       [3:0]    io_out_port_readOnly_ar_payload_id;
  wire       [3:0]    io_out_port_readOnly_ar_payload_region;
  wire       [7:0]    io_out_port_readOnly_ar_payload_len;
  wire       [2:0]    io_out_port_readOnly_ar_payload_size;
  wire       [1:0]    io_out_port_readOnly_ar_payload_burst;
  wire       [0:0]    io_out_port_readOnly_ar_payload_lock;
  wire       [3:0]    io_out_port_readOnly_ar_payload_cache;
  wire       [3:0]    io_out_port_readOnly_ar_payload_qos;
  wire       [2:0]    io_out_port_readOnly_ar_payload_prot;
  wire                io_out_port_readOnly_r_valid;
  wire                io_out_port_readOnly_r_ready;
  wire       [63:0]   io_out_port_readOnly_r_payload_data;
  wire       [3:0]    io_out_port_readOnly_r_payload_id;
  wire       [1:0]    io_out_port_readOnly_r_payload_resp;
  wire                io_out_port_readOnly_r_payload_last;
  wire                io_out_port_writeOnly_aw_valid;
  wire                io_out_port_writeOnly_aw_ready;
  wire       [31:0]   io_out_port_writeOnly_aw_payload_addr;
  wire       [3:0]    io_out_port_writeOnly_aw_payload_id;
  wire       [3:0]    io_out_port_writeOnly_aw_payload_region;
  wire       [7:0]    io_out_port_writeOnly_aw_payload_len;
  wire       [2:0]    io_out_port_writeOnly_aw_payload_size;
  wire       [1:0]    io_out_port_writeOnly_aw_payload_burst;
  wire       [0:0]    io_out_port_writeOnly_aw_payload_lock;
  wire       [3:0]    io_out_port_writeOnly_aw_payload_cache;
  wire       [3:0]    io_out_port_writeOnly_aw_payload_qos;
  wire       [2:0]    io_out_port_writeOnly_aw_payload_prot;
  wire                io_out_port_writeOnly_w_valid;
  wire                io_out_port_writeOnly_w_ready;
  wire       [63:0]   io_out_port_writeOnly_w_payload_data;
  wire       [7:0]    io_out_port_writeOnly_w_payload_strb;
  wire                io_out_port_writeOnly_w_payload_last;
  wire                io_out_port_writeOnly_b_valid;
  wire                io_out_port_writeOnly_b_ready;
  wire       [3:0]    io_out_port_writeOnly_b_payload_id;
  wire       [1:0]    io_out_port_writeOnly_b_payload_resp;
  wire                io_port0_readOnly_ar_valid;
  wire                io_port0_readOnly_ar_ready;
  wire       [31:0]   io_port0_readOnly_ar_payload_addr;
  wire       [2:0]    io_port0_readOnly_ar_payload_id;
  wire       [3:0]    io_port0_readOnly_ar_payload_region;
  wire       [7:0]    io_port0_readOnly_ar_payload_len;
  wire       [2:0]    io_port0_readOnly_ar_payload_size;
  wire       [1:0]    io_port0_readOnly_ar_payload_burst;
  wire       [0:0]    io_port0_readOnly_ar_payload_lock;
  wire       [3:0]    io_port0_readOnly_ar_payload_cache;
  wire       [3:0]    io_port0_readOnly_ar_payload_qos;
  wire       [2:0]    io_port0_readOnly_ar_payload_prot;
  wire                io_port0_readOnly_r_valid;
  wire                io_port0_readOnly_r_ready;
  wire       [63:0]   io_port0_readOnly_r_payload_data;
  wire       [2:0]    io_port0_readOnly_r_payload_id;
  wire       [1:0]    io_port0_readOnly_r_payload_resp;
  wire                io_port0_readOnly_r_payload_last;
  wire                io_port0_writeOnly_aw_valid;
  wire                io_port0_writeOnly_aw_ready;
  wire       [31:0]   io_port0_writeOnly_aw_payload_addr;
  wire       [2:0]    io_port0_writeOnly_aw_payload_id;
  wire       [3:0]    io_port0_writeOnly_aw_payload_region;
  wire       [7:0]    io_port0_writeOnly_aw_payload_len;
  wire       [2:0]    io_port0_writeOnly_aw_payload_size;
  wire       [1:0]    io_port0_writeOnly_aw_payload_burst;
  wire       [0:0]    io_port0_writeOnly_aw_payload_lock;
  wire       [3:0]    io_port0_writeOnly_aw_payload_cache;
  wire       [3:0]    io_port0_writeOnly_aw_payload_qos;
  wire       [2:0]    io_port0_writeOnly_aw_payload_prot;
  wire                io_port0_writeOnly_w_valid;
  wire                io_port0_writeOnly_w_ready;
  wire       [63:0]   io_port0_writeOnly_w_payload_data;
  wire       [7:0]    io_port0_writeOnly_w_payload_strb;
  wire                io_port0_writeOnly_w_payload_last;
  wire                io_port0_writeOnly_b_valid;
  wire                io_port0_writeOnly_b_ready;
  wire       [2:0]    io_port0_writeOnly_b_payload_id;
  wire       [1:0]    io_port0_writeOnly_b_payload_resp;
  wire                io_port1_readOnly_ar_valid;
  wire                io_port1_readOnly_ar_ready;
  wire       [31:0]   io_port1_readOnly_ar_payload_addr;
  wire       [2:0]    io_port1_readOnly_ar_payload_id;
  wire       [3:0]    io_port1_readOnly_ar_payload_region;
  wire       [7:0]    io_port1_readOnly_ar_payload_len;
  wire       [2:0]    io_port1_readOnly_ar_payload_size;
  wire       [1:0]    io_port1_readOnly_ar_payload_burst;
  wire       [0:0]    io_port1_readOnly_ar_payload_lock;
  wire       [3:0]    io_port1_readOnly_ar_payload_cache;
  wire       [3:0]    io_port1_readOnly_ar_payload_qos;
  wire       [2:0]    io_port1_readOnly_ar_payload_prot;
  wire                io_port1_readOnly_r_valid;
  wire                io_port1_readOnly_r_ready;
  wire       [63:0]   io_port1_readOnly_r_payload_data;
  wire       [2:0]    io_port1_readOnly_r_payload_id;
  wire       [1:0]    io_port1_readOnly_r_payload_resp;
  wire                io_port1_readOnly_r_payload_last;
  wire                io_port1_writeOnly_aw_valid;
  wire                io_port1_writeOnly_aw_ready;
  wire       [31:0]   io_port1_writeOnly_aw_payload_addr;
  wire       [2:0]    io_port1_writeOnly_aw_payload_id;
  wire       [3:0]    io_port1_writeOnly_aw_payload_region;
  wire       [7:0]    io_port1_writeOnly_aw_payload_len;
  wire       [2:0]    io_port1_writeOnly_aw_payload_size;
  wire       [1:0]    io_port1_writeOnly_aw_payload_burst;
  wire       [0:0]    io_port1_writeOnly_aw_payload_lock;
  wire       [3:0]    io_port1_writeOnly_aw_payload_cache;
  wire       [3:0]    io_port1_writeOnly_aw_payload_qos;
  wire       [2:0]    io_port1_writeOnly_aw_payload_prot;
  wire                io_port1_writeOnly_w_valid;
  wire                io_port1_writeOnly_w_ready;
  wire       [63:0]   io_port1_writeOnly_w_payload_data;
  wire       [7:0]    io_port1_writeOnly_w_payload_strb;
  wire                io_port1_writeOnly_w_payload_last;
  wire                io_port1_writeOnly_b_valid;
  wire                io_port1_writeOnly_b_ready;
  wire       [2:0]    io_port1_writeOnly_b_payload_id;
  wire       [1:0]    io_port1_writeOnly_b_payload_resp;
  wire                io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_valid;
  wire                io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [2:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id;
  wire       [3:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_region;
  wire       [7:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len;
  wire       [2:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [1:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst;
  wire       [0:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock;
  wire       [3:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [3:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_qos;
  wire       [2:0]    io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 io_port0_readOnly_decoder_io_outputs_0_ar_rValid;
  wire                io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_fire;
  wire                io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_fire_1;
  wire                io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid;
  wire                io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready;
  wire       [31:0]   io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr;
  wire       [2:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id;
  wire       [3:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_region;
  wire       [7:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len;
  wire       [2:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size;
  wire       [1:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst;
  wire       [0:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock;
  wire       [3:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache;
  wire       [3:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_qos;
  wire       [2:0]    io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot;
  reg                 io_port0_writeOnly_decoder_io_outputs_0_aw_rValid;
  wire                io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire;
  wire                io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire_1;
  wire                io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_valid;
  wire                io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_ready;
  wire       [31:0]   io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr;
  wire       [2:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id;
  wire       [3:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_region;
  wire       [7:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len;
  wire       [2:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size;
  wire       [1:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst;
  wire       [0:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock;
  wire       [3:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache;
  wire       [3:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_qos;
  wire       [2:0]    io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot;
  reg                 io_port1_readOnly_decoder_io_outputs_0_ar_rValid;
  wire                io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_fire;
  wire                io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_fire_1;
  wire                io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid;
  wire                io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready;
  wire       [31:0]   io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr;
  wire       [2:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id;
  wire       [3:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_region;
  wire       [7:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len;
  wire       [2:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size;
  wire       [1:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst;
  wire       [0:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock;
  wire       [3:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache;
  wire       [3:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_qos;
  wire       [2:0]    io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot;
  reg                 io_port1_writeOnly_decoder_io_outputs_0_aw_rValid;
  wire                io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire;
  wire                io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire_1;

  Axi4ReadOnlyDecoder io_port0_readOnly_decoder (
    .io_input_ar_valid                 (io_port0_readOnly_ar_valid                                  ), //i
    .io_input_ar_ready                 (io_port0_readOnly_decoder_io_input_ar_ready                 ), //o
    .io_input_ar_payload_addr          (io_port0_readOnly_ar_payload_addr                           ), //i
    .io_input_ar_payload_id            (io_port0_readOnly_ar_payload_id                             ), //i
    .io_input_ar_payload_region        (io_port0_readOnly_ar_payload_region                         ), //i
    .io_input_ar_payload_len           (io_port0_readOnly_ar_payload_len                            ), //i
    .io_input_ar_payload_size          (io_port0_readOnly_ar_payload_size                           ), //i
    .io_input_ar_payload_burst         (io_port0_readOnly_ar_payload_burst                          ), //i
    .io_input_ar_payload_lock          (io_port0_readOnly_ar_payload_lock                           ), //i
    .io_input_ar_payload_cache         (io_port0_readOnly_ar_payload_cache                          ), //i
    .io_input_ar_payload_qos           (io_port0_readOnly_ar_payload_qos                            ), //i
    .io_input_ar_payload_prot          (io_port0_readOnly_ar_payload_prot                           ), //i
    .io_input_r_valid                  (io_port0_readOnly_decoder_io_input_r_valid                  ), //o
    .io_input_r_ready                  (io_port0_readOnly_r_ready                                   ), //i
    .io_input_r_payload_data           (io_port0_readOnly_decoder_io_input_r_payload_data           ), //o
    .io_input_r_payload_id             (io_port0_readOnly_decoder_io_input_r_payload_id             ), //o
    .io_input_r_payload_resp           (io_port0_readOnly_decoder_io_input_r_payload_resp           ), //o
    .io_input_r_payload_last           (io_port0_readOnly_decoder_io_input_r_payload_last           ), //o
    .io_outputs_0_ar_valid             (io_port0_readOnly_decoder_io_outputs_0_ar_valid             ), //o
    .io_outputs_0_ar_ready             (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_fire_1  ), //i
    .io_outputs_0_ar_payload_addr      (io_port0_readOnly_decoder_io_outputs_0_ar_payload_addr      ), //o
    .io_outputs_0_ar_payload_id        (io_port0_readOnly_decoder_io_outputs_0_ar_payload_id        ), //o
    .io_outputs_0_ar_payload_region    (io_port0_readOnly_decoder_io_outputs_0_ar_payload_region    ), //o
    .io_outputs_0_ar_payload_len       (io_port0_readOnly_decoder_io_outputs_0_ar_payload_len       ), //o
    .io_outputs_0_ar_payload_size      (io_port0_readOnly_decoder_io_outputs_0_ar_payload_size      ), //o
    .io_outputs_0_ar_payload_burst     (io_port0_readOnly_decoder_io_outputs_0_ar_payload_burst     ), //o
    .io_outputs_0_ar_payload_lock      (io_port0_readOnly_decoder_io_outputs_0_ar_payload_lock      ), //o
    .io_outputs_0_ar_payload_cache     (io_port0_readOnly_decoder_io_outputs_0_ar_payload_cache     ), //o
    .io_outputs_0_ar_payload_qos       (io_port0_readOnly_decoder_io_outputs_0_ar_payload_qos       ), //o
    .io_outputs_0_ar_payload_prot      (io_port0_readOnly_decoder_io_outputs_0_ar_payload_prot      ), //o
    .io_outputs_0_r_valid              (io_out_port_readOnly_arbiter_io_inputs_0_r_valid            ), //i
    .io_outputs_0_r_ready              (io_port0_readOnly_decoder_io_outputs_0_r_ready              ), //o
    .io_outputs_0_r_payload_data       (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_data     ), //i
    .io_outputs_0_r_payload_id         (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_id       ), //i
    .io_outputs_0_r_payload_resp       (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_resp     ), //i
    .io_outputs_0_r_payload_last       (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_last     ), //i
    .clk                               (clk                                                         ), //i
    .reset                             (reset                                                       )  //i
  );
  Axi4WriteOnlyDecoder io_port0_writeOnly_decoder (
    .io_input_aw_valid                 (io_port0_writeOnly_aw_valid                                  ), //i
    .io_input_aw_ready                 (io_port0_writeOnly_decoder_io_input_aw_ready                 ), //o
    .io_input_aw_payload_addr          (io_port0_writeOnly_aw_payload_addr                           ), //i
    .io_input_aw_payload_id            (io_port0_writeOnly_aw_payload_id                             ), //i
    .io_input_aw_payload_region        (io_port0_writeOnly_aw_payload_region                         ), //i
    .io_input_aw_payload_len           (io_port0_writeOnly_aw_payload_len                            ), //i
    .io_input_aw_payload_size          (io_port0_writeOnly_aw_payload_size                           ), //i
    .io_input_aw_payload_burst         (io_port0_writeOnly_aw_payload_burst                          ), //i
    .io_input_aw_payload_lock          (io_port0_writeOnly_aw_payload_lock                           ), //i
    .io_input_aw_payload_cache         (io_port0_writeOnly_aw_payload_cache                          ), //i
    .io_input_aw_payload_qos           (io_port0_writeOnly_aw_payload_qos                            ), //i
    .io_input_aw_payload_prot          (io_port0_writeOnly_aw_payload_prot                           ), //i
    .io_input_w_valid                  (io_port0_writeOnly_w_valid                                   ), //i
    .io_input_w_ready                  (io_port0_writeOnly_decoder_io_input_w_ready                  ), //o
    .io_input_w_payload_data           (io_port0_writeOnly_w_payload_data                            ), //i
    .io_input_w_payload_strb           (io_port0_writeOnly_w_payload_strb                            ), //i
    .io_input_w_payload_last           (io_port0_writeOnly_w_payload_last                            ), //i
    .io_input_b_valid                  (io_port0_writeOnly_decoder_io_input_b_valid                  ), //o
    .io_input_b_ready                  (io_port0_writeOnly_b_ready                                   ), //i
    .io_input_b_payload_id             (io_port0_writeOnly_decoder_io_input_b_payload_id             ), //o
    .io_input_b_payload_resp           (io_port0_writeOnly_decoder_io_input_b_payload_resp           ), //o
    .io_outputs_0_aw_valid             (io_port0_writeOnly_decoder_io_outputs_0_aw_valid             ), //o
    .io_outputs_0_aw_ready             (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire_1  ), //i
    .io_outputs_0_aw_payload_addr      (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_addr      ), //o
    .io_outputs_0_aw_payload_id        (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_id        ), //o
    .io_outputs_0_aw_payload_region    (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_region    ), //o
    .io_outputs_0_aw_payload_len       (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_len       ), //o
    .io_outputs_0_aw_payload_size      (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_size      ), //o
    .io_outputs_0_aw_payload_burst     (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_burst     ), //o
    .io_outputs_0_aw_payload_lock      (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_lock      ), //o
    .io_outputs_0_aw_payload_cache     (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_cache     ), //o
    .io_outputs_0_aw_payload_qos       (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_qos       ), //o
    .io_outputs_0_aw_payload_prot      (io_port0_writeOnly_decoder_io_outputs_0_aw_payload_prot      ), //o
    .io_outputs_0_w_valid              (io_port0_writeOnly_decoder_io_outputs_0_w_valid              ), //o
    .io_outputs_0_w_ready              (io_out_port_writeOnly_arbiter_io_inputs_0_w_ready            ), //i
    .io_outputs_0_w_payload_data       (io_port0_writeOnly_decoder_io_outputs_0_w_payload_data       ), //o
    .io_outputs_0_w_payload_strb       (io_port0_writeOnly_decoder_io_outputs_0_w_payload_strb       ), //o
    .io_outputs_0_w_payload_last       (io_port0_writeOnly_decoder_io_outputs_0_w_payload_last       ), //o
    .io_outputs_0_b_valid              (io_out_port_writeOnly_arbiter_io_inputs_0_b_valid            ), //i
    .io_outputs_0_b_ready              (io_port0_writeOnly_decoder_io_outputs_0_b_ready              ), //o
    .io_outputs_0_b_payload_id         (io_out_port_writeOnly_arbiter_io_inputs_0_b_payload_id       ), //i
    .io_outputs_0_b_payload_resp       (io_out_port_writeOnly_arbiter_io_inputs_0_b_payload_resp     ), //i
    .clk                               (clk                                                          ), //i
    .reset                             (reset                                                        )  //i
  );
  Axi4ReadOnlyDecoder io_port1_readOnly_decoder (
    .io_input_ar_valid                 (io_port1_readOnly_ar_valid                                  ), //i
    .io_input_ar_ready                 (io_port1_readOnly_decoder_io_input_ar_ready                 ), //o
    .io_input_ar_payload_addr          (io_port1_readOnly_ar_payload_addr                           ), //i
    .io_input_ar_payload_id            (io_port1_readOnly_ar_payload_id                             ), //i
    .io_input_ar_payload_region        (io_port1_readOnly_ar_payload_region                         ), //i
    .io_input_ar_payload_len           (io_port1_readOnly_ar_payload_len                            ), //i
    .io_input_ar_payload_size          (io_port1_readOnly_ar_payload_size                           ), //i
    .io_input_ar_payload_burst         (io_port1_readOnly_ar_payload_burst                          ), //i
    .io_input_ar_payload_lock          (io_port1_readOnly_ar_payload_lock                           ), //i
    .io_input_ar_payload_cache         (io_port1_readOnly_ar_payload_cache                          ), //i
    .io_input_ar_payload_qos           (io_port1_readOnly_ar_payload_qos                            ), //i
    .io_input_ar_payload_prot          (io_port1_readOnly_ar_payload_prot                           ), //i
    .io_input_r_valid                  (io_port1_readOnly_decoder_io_input_r_valid                  ), //o
    .io_input_r_ready                  (io_port1_readOnly_r_ready                                   ), //i
    .io_input_r_payload_data           (io_port1_readOnly_decoder_io_input_r_payload_data           ), //o
    .io_input_r_payload_id             (io_port1_readOnly_decoder_io_input_r_payload_id             ), //o
    .io_input_r_payload_resp           (io_port1_readOnly_decoder_io_input_r_payload_resp           ), //o
    .io_input_r_payload_last           (io_port1_readOnly_decoder_io_input_r_payload_last           ), //o
    .io_outputs_0_ar_valid             (io_port1_readOnly_decoder_io_outputs_0_ar_valid             ), //o
    .io_outputs_0_ar_ready             (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_fire_1  ), //i
    .io_outputs_0_ar_payload_addr      (io_port1_readOnly_decoder_io_outputs_0_ar_payload_addr      ), //o
    .io_outputs_0_ar_payload_id        (io_port1_readOnly_decoder_io_outputs_0_ar_payload_id        ), //o
    .io_outputs_0_ar_payload_region    (io_port1_readOnly_decoder_io_outputs_0_ar_payload_region    ), //o
    .io_outputs_0_ar_payload_len       (io_port1_readOnly_decoder_io_outputs_0_ar_payload_len       ), //o
    .io_outputs_0_ar_payload_size      (io_port1_readOnly_decoder_io_outputs_0_ar_payload_size      ), //o
    .io_outputs_0_ar_payload_burst     (io_port1_readOnly_decoder_io_outputs_0_ar_payload_burst     ), //o
    .io_outputs_0_ar_payload_lock      (io_port1_readOnly_decoder_io_outputs_0_ar_payload_lock      ), //o
    .io_outputs_0_ar_payload_cache     (io_port1_readOnly_decoder_io_outputs_0_ar_payload_cache     ), //o
    .io_outputs_0_ar_payload_qos       (io_port1_readOnly_decoder_io_outputs_0_ar_payload_qos       ), //o
    .io_outputs_0_ar_payload_prot      (io_port1_readOnly_decoder_io_outputs_0_ar_payload_prot      ), //o
    .io_outputs_0_r_valid              (io_out_port_readOnly_arbiter_io_inputs_1_r_valid            ), //i
    .io_outputs_0_r_ready              (io_port1_readOnly_decoder_io_outputs_0_r_ready              ), //o
    .io_outputs_0_r_payload_data       (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_data     ), //i
    .io_outputs_0_r_payload_id         (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_id       ), //i
    .io_outputs_0_r_payload_resp       (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_resp     ), //i
    .io_outputs_0_r_payload_last       (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_last     ), //i
    .clk                               (clk                                                         ), //i
    .reset                             (reset                                                       )  //i
  );
  Axi4WriteOnlyDecoder io_port1_writeOnly_decoder (
    .io_input_aw_valid                 (io_port1_writeOnly_aw_valid                                  ), //i
    .io_input_aw_ready                 (io_port1_writeOnly_decoder_io_input_aw_ready                 ), //o
    .io_input_aw_payload_addr          (io_port1_writeOnly_aw_payload_addr                           ), //i
    .io_input_aw_payload_id            (io_port1_writeOnly_aw_payload_id                             ), //i
    .io_input_aw_payload_region        (io_port1_writeOnly_aw_payload_region                         ), //i
    .io_input_aw_payload_len           (io_port1_writeOnly_aw_payload_len                            ), //i
    .io_input_aw_payload_size          (io_port1_writeOnly_aw_payload_size                           ), //i
    .io_input_aw_payload_burst         (io_port1_writeOnly_aw_payload_burst                          ), //i
    .io_input_aw_payload_lock          (io_port1_writeOnly_aw_payload_lock                           ), //i
    .io_input_aw_payload_cache         (io_port1_writeOnly_aw_payload_cache                          ), //i
    .io_input_aw_payload_qos           (io_port1_writeOnly_aw_payload_qos                            ), //i
    .io_input_aw_payload_prot          (io_port1_writeOnly_aw_payload_prot                           ), //i
    .io_input_w_valid                  (io_port1_writeOnly_w_valid                                   ), //i
    .io_input_w_ready                  (io_port1_writeOnly_decoder_io_input_w_ready                  ), //o
    .io_input_w_payload_data           (io_port1_writeOnly_w_payload_data                            ), //i
    .io_input_w_payload_strb           (io_port1_writeOnly_w_payload_strb                            ), //i
    .io_input_w_payload_last           (io_port1_writeOnly_w_payload_last                            ), //i
    .io_input_b_valid                  (io_port1_writeOnly_decoder_io_input_b_valid                  ), //o
    .io_input_b_ready                  (io_port1_writeOnly_b_ready                                   ), //i
    .io_input_b_payload_id             (io_port1_writeOnly_decoder_io_input_b_payload_id             ), //o
    .io_input_b_payload_resp           (io_port1_writeOnly_decoder_io_input_b_payload_resp           ), //o
    .io_outputs_0_aw_valid             (io_port1_writeOnly_decoder_io_outputs_0_aw_valid             ), //o
    .io_outputs_0_aw_ready             (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire_1  ), //i
    .io_outputs_0_aw_payload_addr      (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_addr      ), //o
    .io_outputs_0_aw_payload_id        (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_id        ), //o
    .io_outputs_0_aw_payload_region    (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_region    ), //o
    .io_outputs_0_aw_payload_len       (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_len       ), //o
    .io_outputs_0_aw_payload_size      (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_size      ), //o
    .io_outputs_0_aw_payload_burst     (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_burst     ), //o
    .io_outputs_0_aw_payload_lock      (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_lock      ), //o
    .io_outputs_0_aw_payload_cache     (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_cache     ), //o
    .io_outputs_0_aw_payload_qos       (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_qos       ), //o
    .io_outputs_0_aw_payload_prot      (io_port1_writeOnly_decoder_io_outputs_0_aw_payload_prot      ), //o
    .io_outputs_0_w_valid              (io_port1_writeOnly_decoder_io_outputs_0_w_valid              ), //o
    .io_outputs_0_w_ready              (io_out_port_writeOnly_arbiter_io_inputs_1_w_ready            ), //i
    .io_outputs_0_w_payload_data       (io_port1_writeOnly_decoder_io_outputs_0_w_payload_data       ), //o
    .io_outputs_0_w_payload_strb       (io_port1_writeOnly_decoder_io_outputs_0_w_payload_strb       ), //o
    .io_outputs_0_w_payload_last       (io_port1_writeOnly_decoder_io_outputs_0_w_payload_last       ), //o
    .io_outputs_0_b_valid              (io_out_port_writeOnly_arbiter_io_inputs_1_b_valid            ), //i
    .io_outputs_0_b_ready              (io_port1_writeOnly_decoder_io_outputs_0_b_ready              ), //o
    .io_outputs_0_b_payload_id         (io_out_port_writeOnly_arbiter_io_inputs_1_b_payload_id       ), //i
    .io_outputs_0_b_payload_resp       (io_out_port_writeOnly_arbiter_io_inputs_1_b_payload_resp     ), //i
    .clk                               (clk                                                          ), //i
    .reset                             (reset                                                        )  //i
  );
  Axi4ReadOnlyArbiter io_out_port_readOnly_arbiter (
    .io_inputs_0_ar_valid             (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_valid           ), //i
    .io_inputs_0_ar_ready             (io_out_port_readOnly_arbiter_io_inputs_0_ar_ready                   ), //o
    .io_inputs_0_ar_payload_addr      (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr    ), //i
    .io_inputs_0_ar_payload_id        (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id      ), //i
    .io_inputs_0_ar_payload_region    (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_region  ), //i
    .io_inputs_0_ar_payload_len       (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len     ), //i
    .io_inputs_0_ar_payload_size      (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size    ), //i
    .io_inputs_0_ar_payload_burst     (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst   ), //i
    .io_inputs_0_ar_payload_lock      (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock    ), //i
    .io_inputs_0_ar_payload_cache     (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache   ), //i
    .io_inputs_0_ar_payload_qos       (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_qos     ), //i
    .io_inputs_0_ar_payload_prot      (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot    ), //i
    .io_inputs_0_r_valid              (io_out_port_readOnly_arbiter_io_inputs_0_r_valid                    ), //o
    .io_inputs_0_r_ready              (io_port0_readOnly_decoder_io_outputs_0_r_ready                      ), //i
    .io_inputs_0_r_payload_data       (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_data             ), //o
    .io_inputs_0_r_payload_id         (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_id               ), //o
    .io_inputs_0_r_payload_resp       (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_resp             ), //o
    .io_inputs_0_r_payload_last       (io_out_port_readOnly_arbiter_io_inputs_0_r_payload_last             ), //o
    .io_inputs_1_ar_valid             (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_valid           ), //i
    .io_inputs_1_ar_ready             (io_out_port_readOnly_arbiter_io_inputs_1_ar_ready                   ), //o
    .io_inputs_1_ar_payload_addr      (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr    ), //i
    .io_inputs_1_ar_payload_id        (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id      ), //i
    .io_inputs_1_ar_payload_region    (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_region  ), //i
    .io_inputs_1_ar_payload_len       (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len     ), //i
    .io_inputs_1_ar_payload_size      (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size    ), //i
    .io_inputs_1_ar_payload_burst     (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst   ), //i
    .io_inputs_1_ar_payload_lock      (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock    ), //i
    .io_inputs_1_ar_payload_cache     (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache   ), //i
    .io_inputs_1_ar_payload_qos       (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_qos     ), //i
    .io_inputs_1_ar_payload_prot      (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot    ), //i
    .io_inputs_1_r_valid              (io_out_port_readOnly_arbiter_io_inputs_1_r_valid                    ), //o
    .io_inputs_1_r_ready              (io_port1_readOnly_decoder_io_outputs_0_r_ready                      ), //i
    .io_inputs_1_r_payload_data       (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_data             ), //o
    .io_inputs_1_r_payload_id         (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_id               ), //o
    .io_inputs_1_r_payload_resp       (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_resp             ), //o
    .io_inputs_1_r_payload_last       (io_out_port_readOnly_arbiter_io_inputs_1_r_payload_last             ), //o
    .io_output_ar_valid               (io_out_port_readOnly_arbiter_io_output_ar_valid                     ), //o
    .io_output_ar_ready               (io_out_port_readOnly_ar_ready                                       ), //i
    .io_output_ar_payload_addr        (io_out_port_readOnly_arbiter_io_output_ar_payload_addr              ), //o
    .io_output_ar_payload_id          (io_out_port_readOnly_arbiter_io_output_ar_payload_id                ), //o
    .io_output_ar_payload_region      (io_out_port_readOnly_arbiter_io_output_ar_payload_region            ), //o
    .io_output_ar_payload_len         (io_out_port_readOnly_arbiter_io_output_ar_payload_len               ), //o
    .io_output_ar_payload_size        (io_out_port_readOnly_arbiter_io_output_ar_payload_size              ), //o
    .io_output_ar_payload_burst       (io_out_port_readOnly_arbiter_io_output_ar_payload_burst             ), //o
    .io_output_ar_payload_lock        (io_out_port_readOnly_arbiter_io_output_ar_payload_lock              ), //o
    .io_output_ar_payload_cache       (io_out_port_readOnly_arbiter_io_output_ar_payload_cache             ), //o
    .io_output_ar_payload_qos         (io_out_port_readOnly_arbiter_io_output_ar_payload_qos               ), //o
    .io_output_ar_payload_prot        (io_out_port_readOnly_arbiter_io_output_ar_payload_prot              ), //o
    .io_output_r_valid                (io_out_port_readOnly_r_valid                                        ), //i
    .io_output_r_ready                (io_out_port_readOnly_arbiter_io_output_r_ready                      ), //o
    .io_output_r_payload_data         (io_out_port_readOnly_r_payload_data                                 ), //i
    .io_output_r_payload_id           (io_out_port_readOnly_r_payload_id                                   ), //i
    .io_output_r_payload_resp         (io_out_port_readOnly_r_payload_resp                                 ), //i
    .io_output_r_payload_last         (io_out_port_readOnly_r_payload_last                                 ), //i
    .clk                              (clk                                                                 ), //i
    .reset                            (reset                                                               )  //i
  );
  Axi4WriteOnlyArbiter io_out_port_writeOnly_arbiter (
    .io_inputs_0_aw_valid             (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid           ), //i
    .io_inputs_0_aw_ready             (io_out_port_writeOnly_arbiter_io_inputs_0_aw_ready                   ), //o
    .io_inputs_0_aw_payload_addr      (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr    ), //i
    .io_inputs_0_aw_payload_id        (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id      ), //i
    .io_inputs_0_aw_payload_region    (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_region  ), //i
    .io_inputs_0_aw_payload_len       (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len     ), //i
    .io_inputs_0_aw_payload_size      (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size    ), //i
    .io_inputs_0_aw_payload_burst     (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst   ), //i
    .io_inputs_0_aw_payload_lock      (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock    ), //i
    .io_inputs_0_aw_payload_cache     (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache   ), //i
    .io_inputs_0_aw_payload_qos       (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_qos     ), //i
    .io_inputs_0_aw_payload_prot      (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot    ), //i
    .io_inputs_0_w_valid              (io_port0_writeOnly_decoder_io_outputs_0_w_valid                      ), //i
    .io_inputs_0_w_ready              (io_out_port_writeOnly_arbiter_io_inputs_0_w_ready                    ), //o
    .io_inputs_0_w_payload_data       (io_port0_writeOnly_decoder_io_outputs_0_w_payload_data               ), //i
    .io_inputs_0_w_payload_strb       (io_port0_writeOnly_decoder_io_outputs_0_w_payload_strb               ), //i
    .io_inputs_0_w_payload_last       (io_port0_writeOnly_decoder_io_outputs_0_w_payload_last               ), //i
    .io_inputs_0_b_valid              (io_out_port_writeOnly_arbiter_io_inputs_0_b_valid                    ), //o
    .io_inputs_0_b_ready              (io_port0_writeOnly_decoder_io_outputs_0_b_ready                      ), //i
    .io_inputs_0_b_payload_id         (io_out_port_writeOnly_arbiter_io_inputs_0_b_payload_id               ), //o
    .io_inputs_0_b_payload_resp       (io_out_port_writeOnly_arbiter_io_inputs_0_b_payload_resp             ), //o
    .io_inputs_1_aw_valid             (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid           ), //i
    .io_inputs_1_aw_ready             (io_out_port_writeOnly_arbiter_io_inputs_1_aw_ready                   ), //o
    .io_inputs_1_aw_payload_addr      (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr    ), //i
    .io_inputs_1_aw_payload_id        (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id      ), //i
    .io_inputs_1_aw_payload_region    (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_region  ), //i
    .io_inputs_1_aw_payload_len       (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len     ), //i
    .io_inputs_1_aw_payload_size      (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size    ), //i
    .io_inputs_1_aw_payload_burst     (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst   ), //i
    .io_inputs_1_aw_payload_lock      (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock    ), //i
    .io_inputs_1_aw_payload_cache     (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache   ), //i
    .io_inputs_1_aw_payload_qos       (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_qos     ), //i
    .io_inputs_1_aw_payload_prot      (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot    ), //i
    .io_inputs_1_w_valid              (io_port1_writeOnly_decoder_io_outputs_0_w_valid                      ), //i
    .io_inputs_1_w_ready              (io_out_port_writeOnly_arbiter_io_inputs_1_w_ready                    ), //o
    .io_inputs_1_w_payload_data       (io_port1_writeOnly_decoder_io_outputs_0_w_payload_data               ), //i
    .io_inputs_1_w_payload_strb       (io_port1_writeOnly_decoder_io_outputs_0_w_payload_strb               ), //i
    .io_inputs_1_w_payload_last       (io_port1_writeOnly_decoder_io_outputs_0_w_payload_last               ), //i
    .io_inputs_1_b_valid              (io_out_port_writeOnly_arbiter_io_inputs_1_b_valid                    ), //o
    .io_inputs_1_b_ready              (io_port1_writeOnly_decoder_io_outputs_0_b_ready                      ), //i
    .io_inputs_1_b_payload_id         (io_out_port_writeOnly_arbiter_io_inputs_1_b_payload_id               ), //o
    .io_inputs_1_b_payload_resp       (io_out_port_writeOnly_arbiter_io_inputs_1_b_payload_resp             ), //o
    .io_output_aw_valid               (io_out_port_writeOnly_arbiter_io_output_aw_valid                     ), //o
    .io_output_aw_ready               (io_out_port_writeOnly_aw_ready                                       ), //i
    .io_output_aw_payload_addr        (io_out_port_writeOnly_arbiter_io_output_aw_payload_addr              ), //o
    .io_output_aw_payload_id          (io_out_port_writeOnly_arbiter_io_output_aw_payload_id                ), //o
    .io_output_aw_payload_region      (io_out_port_writeOnly_arbiter_io_output_aw_payload_region            ), //o
    .io_output_aw_payload_len         (io_out_port_writeOnly_arbiter_io_output_aw_payload_len               ), //o
    .io_output_aw_payload_size        (io_out_port_writeOnly_arbiter_io_output_aw_payload_size              ), //o
    .io_output_aw_payload_burst       (io_out_port_writeOnly_arbiter_io_output_aw_payload_burst             ), //o
    .io_output_aw_payload_lock        (io_out_port_writeOnly_arbiter_io_output_aw_payload_lock              ), //o
    .io_output_aw_payload_cache       (io_out_port_writeOnly_arbiter_io_output_aw_payload_cache             ), //o
    .io_output_aw_payload_qos         (io_out_port_writeOnly_arbiter_io_output_aw_payload_qos               ), //o
    .io_output_aw_payload_prot        (io_out_port_writeOnly_arbiter_io_output_aw_payload_prot              ), //o
    .io_output_w_valid                (io_out_port_writeOnly_arbiter_io_output_w_valid                      ), //o
    .io_output_w_ready                (io_out_port_writeOnly_w_ready                                        ), //i
    .io_output_w_payload_data         (io_out_port_writeOnly_arbiter_io_output_w_payload_data               ), //o
    .io_output_w_payload_strb         (io_out_port_writeOnly_arbiter_io_output_w_payload_strb               ), //o
    .io_output_w_payload_last         (io_out_port_writeOnly_arbiter_io_output_w_payload_last               ), //o
    .io_output_b_valid                (io_out_port_writeOnly_b_valid                                        ), //i
    .io_output_b_ready                (io_out_port_writeOnly_arbiter_io_output_b_ready                      ), //o
    .io_output_b_payload_id           (io_out_port_writeOnly_b_payload_id                                   ), //i
    .io_output_b_payload_resp         (io_out_port_writeOnly_b_payload_resp                                 ), //i
    .clk                              (clk                                                                  ), //i
    .reset                            (reset                                                                )  //i
  );
  assign io_out_port_ar_valid = io_out_port_readOnly_ar_valid;
  assign io_out_port_readOnly_ar_ready = io_out_port_ar_ready;
  assign io_out_port_ar_payload_addr = io_out_port_readOnly_ar_payload_addr;
  assign io_out_port_ar_payload_id = io_out_port_readOnly_ar_payload_id;
  assign io_out_port_ar_payload_region = io_out_port_readOnly_ar_payload_region;
  assign io_out_port_ar_payload_len = io_out_port_readOnly_ar_payload_len;
  assign io_out_port_ar_payload_size = io_out_port_readOnly_ar_payload_size;
  assign io_out_port_ar_payload_burst = io_out_port_readOnly_ar_payload_burst;
  assign io_out_port_ar_payload_lock = io_out_port_readOnly_ar_payload_lock;
  assign io_out_port_ar_payload_cache = io_out_port_readOnly_ar_payload_cache;
  assign io_out_port_ar_payload_qos = io_out_port_readOnly_ar_payload_qos;
  assign io_out_port_ar_payload_prot = io_out_port_readOnly_ar_payload_prot;
  assign io_out_port_readOnly_r_valid = io_out_port_r_valid;
  assign io_out_port_r_ready = io_out_port_readOnly_r_ready;
  assign io_out_port_readOnly_r_payload_data = io_out_port_r_payload_data;
  assign io_out_port_readOnly_r_payload_last = io_out_port_r_payload_last;
  assign io_out_port_readOnly_r_payload_id = io_out_port_r_payload_id;
  assign io_out_port_readOnly_r_payload_resp = io_out_port_r_payload_resp;
  assign io_out_port_aw_valid = io_out_port_writeOnly_aw_valid;
  assign io_out_port_writeOnly_aw_ready = io_out_port_aw_ready;
  assign io_out_port_aw_payload_addr = io_out_port_writeOnly_aw_payload_addr;
  assign io_out_port_aw_payload_id = io_out_port_writeOnly_aw_payload_id;
  assign io_out_port_aw_payload_region = io_out_port_writeOnly_aw_payload_region;
  assign io_out_port_aw_payload_len = io_out_port_writeOnly_aw_payload_len;
  assign io_out_port_aw_payload_size = io_out_port_writeOnly_aw_payload_size;
  assign io_out_port_aw_payload_burst = io_out_port_writeOnly_aw_payload_burst;
  assign io_out_port_aw_payload_lock = io_out_port_writeOnly_aw_payload_lock;
  assign io_out_port_aw_payload_cache = io_out_port_writeOnly_aw_payload_cache;
  assign io_out_port_aw_payload_qos = io_out_port_writeOnly_aw_payload_qos;
  assign io_out_port_aw_payload_prot = io_out_port_writeOnly_aw_payload_prot;
  assign io_out_port_w_valid = io_out_port_writeOnly_w_valid;
  assign io_out_port_writeOnly_w_ready = io_out_port_w_ready;
  assign io_out_port_w_payload_data = io_out_port_writeOnly_w_payload_data;
  assign io_out_port_w_payload_strb = io_out_port_writeOnly_w_payload_strb;
  assign io_out_port_w_payload_last = io_out_port_writeOnly_w_payload_last;
  assign io_out_port_writeOnly_b_valid = io_out_port_b_valid;
  assign io_out_port_b_ready = io_out_port_writeOnly_b_ready;
  assign io_out_port_writeOnly_b_payload_id = io_out_port_b_payload_id;
  assign io_out_port_writeOnly_b_payload_resp = io_out_port_b_payload_resp;
  assign io_port0_readOnly_ar_valid = io_port0_ar_valid;
  assign io_port0_ar_ready = io_port0_readOnly_ar_ready;
  assign io_port0_readOnly_ar_payload_addr = io_port0_ar_payload_addr;
  assign io_port0_readOnly_ar_payload_id = io_port0_ar_payload_id;
  assign io_port0_readOnly_ar_payload_region = io_port0_ar_payload_region;
  assign io_port0_readOnly_ar_payload_len = io_port0_ar_payload_len;
  assign io_port0_readOnly_ar_payload_size = io_port0_ar_payload_size;
  assign io_port0_readOnly_ar_payload_burst = io_port0_ar_payload_burst;
  assign io_port0_readOnly_ar_payload_lock = io_port0_ar_payload_lock;
  assign io_port0_readOnly_ar_payload_cache = io_port0_ar_payload_cache;
  assign io_port0_readOnly_ar_payload_qos = io_port0_ar_payload_qos;
  assign io_port0_readOnly_ar_payload_prot = io_port0_ar_payload_prot;
  assign io_port0_r_valid = io_port0_readOnly_r_valid;
  assign io_port0_readOnly_r_ready = io_port0_r_ready;
  assign io_port0_r_payload_data = io_port0_readOnly_r_payload_data;
  assign io_port0_r_payload_last = io_port0_readOnly_r_payload_last;
  assign io_port0_r_payload_id = io_port0_readOnly_r_payload_id;
  assign io_port0_r_payload_resp = io_port0_readOnly_r_payload_resp;
  assign io_port0_writeOnly_aw_valid = io_port0_aw_valid;
  assign io_port0_aw_ready = io_port0_writeOnly_aw_ready;
  assign io_port0_writeOnly_aw_payload_addr = io_port0_aw_payload_addr;
  assign io_port0_writeOnly_aw_payload_id = io_port0_aw_payload_id;
  assign io_port0_writeOnly_aw_payload_region = io_port0_aw_payload_region;
  assign io_port0_writeOnly_aw_payload_len = io_port0_aw_payload_len;
  assign io_port0_writeOnly_aw_payload_size = io_port0_aw_payload_size;
  assign io_port0_writeOnly_aw_payload_burst = io_port0_aw_payload_burst;
  assign io_port0_writeOnly_aw_payload_lock = io_port0_aw_payload_lock;
  assign io_port0_writeOnly_aw_payload_cache = io_port0_aw_payload_cache;
  assign io_port0_writeOnly_aw_payload_qos = io_port0_aw_payload_qos;
  assign io_port0_writeOnly_aw_payload_prot = io_port0_aw_payload_prot;
  assign io_port0_writeOnly_w_valid = io_port0_w_valid;
  assign io_port0_w_ready = io_port0_writeOnly_w_ready;
  assign io_port0_writeOnly_w_payload_data = io_port0_w_payload_data;
  assign io_port0_writeOnly_w_payload_strb = io_port0_w_payload_strb;
  assign io_port0_writeOnly_w_payload_last = io_port0_w_payload_last;
  assign io_port0_b_valid = io_port0_writeOnly_b_valid;
  assign io_port0_writeOnly_b_ready = io_port0_b_ready;
  assign io_port0_b_payload_id = io_port0_writeOnly_b_payload_id;
  assign io_port0_b_payload_resp = io_port0_writeOnly_b_payload_resp;
  assign io_port1_readOnly_ar_valid = io_port1_ar_valid;
  assign io_port1_ar_ready = io_port1_readOnly_ar_ready;
  assign io_port1_readOnly_ar_payload_addr = io_port1_ar_payload_addr;
  assign io_port1_readOnly_ar_payload_id = io_port1_ar_payload_id;
  assign io_port1_readOnly_ar_payload_region = io_port1_ar_payload_region;
  assign io_port1_readOnly_ar_payload_len = io_port1_ar_payload_len;
  assign io_port1_readOnly_ar_payload_size = io_port1_ar_payload_size;
  assign io_port1_readOnly_ar_payload_burst = io_port1_ar_payload_burst;
  assign io_port1_readOnly_ar_payload_lock = io_port1_ar_payload_lock;
  assign io_port1_readOnly_ar_payload_cache = io_port1_ar_payload_cache;
  assign io_port1_readOnly_ar_payload_qos = io_port1_ar_payload_qos;
  assign io_port1_readOnly_ar_payload_prot = io_port1_ar_payload_prot;
  assign io_port1_r_valid = io_port1_readOnly_r_valid;
  assign io_port1_readOnly_r_ready = io_port1_r_ready;
  assign io_port1_r_payload_data = io_port1_readOnly_r_payload_data;
  assign io_port1_r_payload_last = io_port1_readOnly_r_payload_last;
  assign io_port1_r_payload_id = io_port1_readOnly_r_payload_id;
  assign io_port1_r_payload_resp = io_port1_readOnly_r_payload_resp;
  assign io_port1_writeOnly_aw_valid = io_port1_aw_valid;
  assign io_port1_aw_ready = io_port1_writeOnly_aw_ready;
  assign io_port1_writeOnly_aw_payload_addr = io_port1_aw_payload_addr;
  assign io_port1_writeOnly_aw_payload_id = io_port1_aw_payload_id;
  assign io_port1_writeOnly_aw_payload_region = io_port1_aw_payload_region;
  assign io_port1_writeOnly_aw_payload_len = io_port1_aw_payload_len;
  assign io_port1_writeOnly_aw_payload_size = io_port1_aw_payload_size;
  assign io_port1_writeOnly_aw_payload_burst = io_port1_aw_payload_burst;
  assign io_port1_writeOnly_aw_payload_lock = io_port1_aw_payload_lock;
  assign io_port1_writeOnly_aw_payload_cache = io_port1_aw_payload_cache;
  assign io_port1_writeOnly_aw_payload_qos = io_port1_aw_payload_qos;
  assign io_port1_writeOnly_aw_payload_prot = io_port1_aw_payload_prot;
  assign io_port1_writeOnly_w_valid = io_port1_w_valid;
  assign io_port1_w_ready = io_port1_writeOnly_w_ready;
  assign io_port1_writeOnly_w_payload_data = io_port1_w_payload_data;
  assign io_port1_writeOnly_w_payload_strb = io_port1_w_payload_strb;
  assign io_port1_writeOnly_w_payload_last = io_port1_w_payload_last;
  assign io_port1_b_valid = io_port1_writeOnly_b_valid;
  assign io_port1_writeOnly_b_ready = io_port1_b_ready;
  assign io_port1_b_payload_id = io_port1_writeOnly_b_payload_id;
  assign io_port1_b_payload_resp = io_port1_writeOnly_b_payload_resp;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_fire = (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_valid && io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_fire_1 = (io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_valid && io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_valid = io_port0_readOnly_decoder_io_outputs_0_ar_rValid;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr = io_port0_readOnly_decoder_io_outputs_0_ar_payload_addr;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id = io_port0_readOnly_decoder_io_outputs_0_ar_payload_id;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_region = io_port0_readOnly_decoder_io_outputs_0_ar_payload_region;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len = io_port0_readOnly_decoder_io_outputs_0_ar_payload_len;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size = io_port0_readOnly_decoder_io_outputs_0_ar_payload_size;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst = io_port0_readOnly_decoder_io_outputs_0_ar_payload_burst;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock = io_port0_readOnly_decoder_io_outputs_0_ar_payload_lock;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache = io_port0_readOnly_decoder_io_outputs_0_ar_payload_cache;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_qos = io_port0_readOnly_decoder_io_outputs_0_ar_payload_qos;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot = io_port0_readOnly_decoder_io_outputs_0_ar_payload_prot;
  assign io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_ready = io_out_port_readOnly_arbiter_io_inputs_0_ar_ready;
  assign io_port0_readOnly_ar_ready = io_port0_readOnly_decoder_io_input_ar_ready;
  assign io_port0_readOnly_r_valid = io_port0_readOnly_decoder_io_input_r_valid;
  assign io_port0_readOnly_r_payload_data = io_port0_readOnly_decoder_io_input_r_payload_data;
  assign io_port0_readOnly_r_payload_last = io_port0_readOnly_decoder_io_input_r_payload_last;
  assign io_port0_readOnly_r_payload_id = io_port0_readOnly_decoder_io_input_r_payload_id;
  assign io_port0_readOnly_r_payload_resp = io_port0_readOnly_decoder_io_input_r_payload_resp;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire = (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire_1 = (io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_valid = io_port0_writeOnly_decoder_io_outputs_0_aw_rValid;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_id;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_region = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_region;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_len;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_size;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_qos = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_qos;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot = io_port0_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  assign io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_ready = io_out_port_writeOnly_arbiter_io_inputs_0_aw_ready;
  assign io_port0_writeOnly_aw_ready = io_port0_writeOnly_decoder_io_input_aw_ready;
  assign io_port0_writeOnly_w_ready = io_port0_writeOnly_decoder_io_input_w_ready;
  assign io_port0_writeOnly_b_valid = io_port0_writeOnly_decoder_io_input_b_valid;
  assign io_port0_writeOnly_b_payload_id = io_port0_writeOnly_decoder_io_input_b_payload_id;
  assign io_port0_writeOnly_b_payload_resp = io_port0_writeOnly_decoder_io_input_b_payload_resp;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_fire = (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_valid && io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_fire_1 = (io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_valid && io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_ready);
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_valid = io_port1_readOnly_decoder_io_outputs_0_ar_rValid;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_addr = io_port1_readOnly_decoder_io_outputs_0_ar_payload_addr;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_id = io_port1_readOnly_decoder_io_outputs_0_ar_payload_id;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_region = io_port1_readOnly_decoder_io_outputs_0_ar_payload_region;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_len = io_port1_readOnly_decoder_io_outputs_0_ar_payload_len;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_size = io_port1_readOnly_decoder_io_outputs_0_ar_payload_size;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_burst = io_port1_readOnly_decoder_io_outputs_0_ar_payload_burst;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_lock = io_port1_readOnly_decoder_io_outputs_0_ar_payload_lock;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_cache = io_port1_readOnly_decoder_io_outputs_0_ar_payload_cache;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_qos = io_port1_readOnly_decoder_io_outputs_0_ar_payload_qos;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_payload_prot = io_port1_readOnly_decoder_io_outputs_0_ar_payload_prot;
  assign io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_ready = io_out_port_readOnly_arbiter_io_inputs_1_ar_ready;
  assign io_port1_readOnly_ar_ready = io_port1_readOnly_decoder_io_input_ar_ready;
  assign io_port1_readOnly_r_valid = io_port1_readOnly_decoder_io_input_r_valid;
  assign io_port1_readOnly_r_payload_data = io_port1_readOnly_decoder_io_input_r_payload_data;
  assign io_port1_readOnly_r_payload_last = io_port1_readOnly_decoder_io_input_r_payload_last;
  assign io_port1_readOnly_r_payload_id = io_port1_readOnly_decoder_io_input_r_payload_id;
  assign io_port1_readOnly_r_payload_resp = io_port1_readOnly_decoder_io_input_r_payload_resp;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire = (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire_1 = (io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid && io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready);
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_valid = io_port1_writeOnly_decoder_io_outputs_0_aw_rValid;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_addr = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_addr;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_id = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_id;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_region = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_region;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_len = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_len;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_size = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_size;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_burst = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_burst;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_lock = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_lock;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_cache = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_cache;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_qos = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_qos;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_payload_prot = io_port1_writeOnly_decoder_io_outputs_0_aw_payload_prot;
  assign io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_ready = io_out_port_writeOnly_arbiter_io_inputs_1_aw_ready;
  assign io_port1_writeOnly_aw_ready = io_port1_writeOnly_decoder_io_input_aw_ready;
  assign io_port1_writeOnly_w_ready = io_port1_writeOnly_decoder_io_input_w_ready;
  assign io_port1_writeOnly_b_valid = io_port1_writeOnly_decoder_io_input_b_valid;
  assign io_port1_writeOnly_b_payload_id = io_port1_writeOnly_decoder_io_input_b_payload_id;
  assign io_port1_writeOnly_b_payload_resp = io_port1_writeOnly_decoder_io_input_b_payload_resp;
  assign io_out_port_readOnly_ar_valid = io_out_port_readOnly_arbiter_io_output_ar_valid;
  assign io_out_port_readOnly_ar_payload_addr = io_out_port_readOnly_arbiter_io_output_ar_payload_addr;
  assign io_out_port_readOnly_ar_payload_id = io_out_port_readOnly_arbiter_io_output_ar_payload_id;
  assign io_out_port_readOnly_ar_payload_region = io_out_port_readOnly_arbiter_io_output_ar_payload_region;
  assign io_out_port_readOnly_ar_payload_len = io_out_port_readOnly_arbiter_io_output_ar_payload_len;
  assign io_out_port_readOnly_ar_payload_size = io_out_port_readOnly_arbiter_io_output_ar_payload_size;
  assign io_out_port_readOnly_ar_payload_burst = io_out_port_readOnly_arbiter_io_output_ar_payload_burst;
  assign io_out_port_readOnly_ar_payload_lock = io_out_port_readOnly_arbiter_io_output_ar_payload_lock;
  assign io_out_port_readOnly_ar_payload_cache = io_out_port_readOnly_arbiter_io_output_ar_payload_cache;
  assign io_out_port_readOnly_ar_payload_qos = io_out_port_readOnly_arbiter_io_output_ar_payload_qos;
  assign io_out_port_readOnly_ar_payload_prot = io_out_port_readOnly_arbiter_io_output_ar_payload_prot;
  assign io_out_port_readOnly_r_ready = io_out_port_readOnly_arbiter_io_output_r_ready;
  assign io_out_port_writeOnly_aw_valid = io_out_port_writeOnly_arbiter_io_output_aw_valid;
  assign io_out_port_writeOnly_aw_payload_addr = io_out_port_writeOnly_arbiter_io_output_aw_payload_addr;
  assign io_out_port_writeOnly_aw_payload_id = io_out_port_writeOnly_arbiter_io_output_aw_payload_id;
  assign io_out_port_writeOnly_aw_payload_region = io_out_port_writeOnly_arbiter_io_output_aw_payload_region;
  assign io_out_port_writeOnly_aw_payload_len = io_out_port_writeOnly_arbiter_io_output_aw_payload_len;
  assign io_out_port_writeOnly_aw_payload_size = io_out_port_writeOnly_arbiter_io_output_aw_payload_size;
  assign io_out_port_writeOnly_aw_payload_burst = io_out_port_writeOnly_arbiter_io_output_aw_payload_burst;
  assign io_out_port_writeOnly_aw_payload_lock = io_out_port_writeOnly_arbiter_io_output_aw_payload_lock;
  assign io_out_port_writeOnly_aw_payload_cache = io_out_port_writeOnly_arbiter_io_output_aw_payload_cache;
  assign io_out_port_writeOnly_aw_payload_qos = io_out_port_writeOnly_arbiter_io_output_aw_payload_qos;
  assign io_out_port_writeOnly_aw_payload_prot = io_out_port_writeOnly_arbiter_io_output_aw_payload_prot;
  assign io_out_port_writeOnly_w_valid = io_out_port_writeOnly_arbiter_io_output_w_valid;
  assign io_out_port_writeOnly_w_payload_data = io_out_port_writeOnly_arbiter_io_output_w_payload_data;
  assign io_out_port_writeOnly_w_payload_strb = io_out_port_writeOnly_arbiter_io_output_w_payload_strb;
  assign io_out_port_writeOnly_w_payload_last = io_out_port_writeOnly_arbiter_io_output_w_payload_last;
  assign io_out_port_writeOnly_b_ready = io_out_port_writeOnly_arbiter_io_output_b_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_port0_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      io_port0_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      io_port1_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      io_port1_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
    end else begin
      if(io_port0_readOnly_decoder_io_outputs_0_ar_valid) begin
        io_port0_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(io_port0_readOnly_decoder_io_outputs_0_ar_validPipe_fire) begin
        io_port0_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(io_port0_writeOnly_decoder_io_outputs_0_aw_valid) begin
        io_port0_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b1;
      end
      if(io_port0_writeOnly_decoder_io_outputs_0_aw_validPipe_fire) begin
        io_port0_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      end
      if(io_port1_readOnly_decoder_io_outputs_0_ar_valid) begin
        io_port1_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b1;
      end
      if(io_port1_readOnly_decoder_io_outputs_0_ar_validPipe_fire) begin
        io_port1_readOnly_decoder_io_outputs_0_ar_rValid <= 1'b0;
      end
      if(io_port1_writeOnly_decoder_io_outputs_0_aw_valid) begin
        io_port1_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b1;
      end
      if(io_port1_writeOnly_decoder_io_outputs_0_aw_validPipe_fire) begin
        io_port1_writeOnly_decoder_io_outputs_0_aw_rValid <= 1'b0;
      end
    end
  end

endmodule

module Axi4WriteOnlyArbiter (
  input               io_inputs_0_aw_valid,
  output              io_inputs_0_aw_ready,
  input      [31:0]   io_inputs_0_aw_payload_addr,
  input      [2:0]    io_inputs_0_aw_payload_id,
  input      [3:0]    io_inputs_0_aw_payload_region,
  input      [7:0]    io_inputs_0_aw_payload_len,
  input      [2:0]    io_inputs_0_aw_payload_size,
  input      [1:0]    io_inputs_0_aw_payload_burst,
  input      [0:0]    io_inputs_0_aw_payload_lock,
  input      [3:0]    io_inputs_0_aw_payload_cache,
  input      [3:0]    io_inputs_0_aw_payload_qos,
  input      [2:0]    io_inputs_0_aw_payload_prot,
  input               io_inputs_0_w_valid,
  output              io_inputs_0_w_ready,
  input      [63:0]   io_inputs_0_w_payload_data,
  input      [7:0]    io_inputs_0_w_payload_strb,
  input               io_inputs_0_w_payload_last,
  output              io_inputs_0_b_valid,
  input               io_inputs_0_b_ready,
  output     [2:0]    io_inputs_0_b_payload_id,
  output     [1:0]    io_inputs_0_b_payload_resp,
  input               io_inputs_1_aw_valid,
  output              io_inputs_1_aw_ready,
  input      [31:0]   io_inputs_1_aw_payload_addr,
  input      [2:0]    io_inputs_1_aw_payload_id,
  input      [3:0]    io_inputs_1_aw_payload_region,
  input      [7:0]    io_inputs_1_aw_payload_len,
  input      [2:0]    io_inputs_1_aw_payload_size,
  input      [1:0]    io_inputs_1_aw_payload_burst,
  input      [0:0]    io_inputs_1_aw_payload_lock,
  input      [3:0]    io_inputs_1_aw_payload_cache,
  input      [3:0]    io_inputs_1_aw_payload_qos,
  input      [2:0]    io_inputs_1_aw_payload_prot,
  input               io_inputs_1_w_valid,
  output              io_inputs_1_w_ready,
  input      [63:0]   io_inputs_1_w_payload_data,
  input      [7:0]    io_inputs_1_w_payload_strb,
  input               io_inputs_1_w_payload_last,
  output              io_inputs_1_b_valid,
  input               io_inputs_1_b_ready,
  output     [2:0]    io_inputs_1_b_payload_id,
  output     [1:0]    io_inputs_1_b_payload_resp,
  output              io_output_aw_valid,
  input               io_output_aw_ready,
  output     [31:0]   io_output_aw_payload_addr,
  output     [3:0]    io_output_aw_payload_id,
  output     [3:0]    io_output_aw_payload_region,
  output     [7:0]    io_output_aw_payload_len,
  output     [2:0]    io_output_aw_payload_size,
  output     [1:0]    io_output_aw_payload_burst,
  output     [0:0]    io_output_aw_payload_lock,
  output     [3:0]    io_output_aw_payload_cache,
  output     [3:0]    io_output_aw_payload_qos,
  output     [2:0]    io_output_aw_payload_prot,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [63:0]   io_output_w_payload_data,
  output     [7:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               clk,
  input               reset
);
  wire                cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_ready;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [3:0]    cmdArbiter_io_output_payload_region;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                cmdArbiter_io_output_fork_io_input_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_0_valid;
  wire       [31:0]   cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_id;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_region;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_0_payload_prot;
  wire                cmdArbiter_io_output_fork_io_outputs_1_valid;
  wire       [31:0]   cmdArbiter_io_output_fork_io_outputs_1_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_id;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_region;
  wire       [7:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_len;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_size;
  wire       [1:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_payload_prot;
  wire                cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_push_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_valid;
  wire       [0:0]    cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_payload;
  wire       [2:0]    cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_occupancy;
  reg                 _zz_io_output_w_valid;
  reg        [63:0]   _zz_io_output_w_payload_data;
  reg        [7:0]    _zz_io_output_w_payload_strb;
  reg                 _zz_io_output_w_payload_last;
  reg                 _zz_io_output_b_ready;
  wire                cmdArbiter_io_output_fork_io_outputs_1_translated_valid;
  wire                cmdArbiter_io_output_fork_io_outputs_1_translated_ready;
  wire       [0:0]    cmdArbiter_io_output_fork_io_outputs_1_translated_payload;
  wire                io_output_w_fire;
  wire       [0:0]    writeRspIndex;
  wire                writeRspSels_0;
  wire                writeRspSels_1;

  StreamArbiter cmdArbiter (
    .io_inputs_0_valid             (io_inputs_0_aw_valid                      ), //i
    .io_inputs_0_ready             (cmdArbiter_io_inputs_0_ready              ), //o
    .io_inputs_0_payload_addr      (io_inputs_0_aw_payload_addr               ), //i
    .io_inputs_0_payload_id        (io_inputs_0_aw_payload_id                 ), //i
    .io_inputs_0_payload_region    (io_inputs_0_aw_payload_region             ), //i
    .io_inputs_0_payload_len       (io_inputs_0_aw_payload_len                ), //i
    .io_inputs_0_payload_size      (io_inputs_0_aw_payload_size               ), //i
    .io_inputs_0_payload_burst     (io_inputs_0_aw_payload_burst              ), //i
    .io_inputs_0_payload_lock      (io_inputs_0_aw_payload_lock               ), //i
    .io_inputs_0_payload_cache     (io_inputs_0_aw_payload_cache              ), //i
    .io_inputs_0_payload_qos       (io_inputs_0_aw_payload_qos                ), //i
    .io_inputs_0_payload_prot      (io_inputs_0_aw_payload_prot               ), //i
    .io_inputs_1_valid             (io_inputs_1_aw_valid                      ), //i
    .io_inputs_1_ready             (cmdArbiter_io_inputs_1_ready              ), //o
    .io_inputs_1_payload_addr      (io_inputs_1_aw_payload_addr               ), //i
    .io_inputs_1_payload_id        (io_inputs_1_aw_payload_id                 ), //i
    .io_inputs_1_payload_region    (io_inputs_1_aw_payload_region             ), //i
    .io_inputs_1_payload_len       (io_inputs_1_aw_payload_len                ), //i
    .io_inputs_1_payload_size      (io_inputs_1_aw_payload_size               ), //i
    .io_inputs_1_payload_burst     (io_inputs_1_aw_payload_burst              ), //i
    .io_inputs_1_payload_lock      (io_inputs_1_aw_payload_lock               ), //i
    .io_inputs_1_payload_cache     (io_inputs_1_aw_payload_cache              ), //i
    .io_inputs_1_payload_qos       (io_inputs_1_aw_payload_qos                ), //i
    .io_inputs_1_payload_prot      (io_inputs_1_aw_payload_prot               ), //i
    .io_output_valid               (cmdArbiter_io_output_valid                ), //o
    .io_output_ready               (cmdArbiter_io_output_fork_io_input_ready  ), //i
    .io_output_payload_addr        (cmdArbiter_io_output_payload_addr         ), //o
    .io_output_payload_id          (cmdArbiter_io_output_payload_id           ), //o
    .io_output_payload_region      (cmdArbiter_io_output_payload_region       ), //o
    .io_output_payload_len         (cmdArbiter_io_output_payload_len          ), //o
    .io_output_payload_size        (cmdArbiter_io_output_payload_size         ), //o
    .io_output_payload_burst       (cmdArbiter_io_output_payload_burst        ), //o
    .io_output_payload_lock        (cmdArbiter_io_output_payload_lock         ), //o
    .io_output_payload_cache       (cmdArbiter_io_output_payload_cache        ), //o
    .io_output_payload_qos         (cmdArbiter_io_output_payload_qos          ), //o
    .io_output_payload_prot        (cmdArbiter_io_output_payload_prot         ), //o
    .io_chosen                     (cmdArbiter_io_chosen                      ), //o
    .io_chosenOH                   (cmdArbiter_io_chosenOH                    ), //o
    .clk                           (clk                                       ), //i
    .reset                         (reset                                     )  //i
  );
  StreamFork cmdArbiter_io_output_fork (
    .io_input_valid                 (cmdArbiter_io_output_valid                               ), //i
    .io_input_ready                 (cmdArbiter_io_output_fork_io_input_ready                 ), //o
    .io_input_payload_addr          (cmdArbiter_io_output_payload_addr                        ), //i
    .io_input_payload_id            (cmdArbiter_io_output_payload_id                          ), //i
    .io_input_payload_region        (cmdArbiter_io_output_payload_region                      ), //i
    .io_input_payload_len           (cmdArbiter_io_output_payload_len                         ), //i
    .io_input_payload_size          (cmdArbiter_io_output_payload_size                        ), //i
    .io_input_payload_burst         (cmdArbiter_io_output_payload_burst                       ), //i
    .io_input_payload_lock          (cmdArbiter_io_output_payload_lock                        ), //i
    .io_input_payload_cache         (cmdArbiter_io_output_payload_cache                       ), //i
    .io_input_payload_qos           (cmdArbiter_io_output_payload_qos                         ), //i
    .io_input_payload_prot          (cmdArbiter_io_output_payload_prot                        ), //i
    .io_outputs_0_valid             (cmdArbiter_io_output_fork_io_outputs_0_valid             ), //o
    .io_outputs_0_ready             (io_output_aw_ready                                       ), //i
    .io_outputs_0_payload_addr      (cmdArbiter_io_output_fork_io_outputs_0_payload_addr      ), //o
    .io_outputs_0_payload_id        (cmdArbiter_io_output_fork_io_outputs_0_payload_id        ), //o
    .io_outputs_0_payload_region    (cmdArbiter_io_output_fork_io_outputs_0_payload_region    ), //o
    .io_outputs_0_payload_len       (cmdArbiter_io_output_fork_io_outputs_0_payload_len       ), //o
    .io_outputs_0_payload_size      (cmdArbiter_io_output_fork_io_outputs_0_payload_size      ), //o
    .io_outputs_0_payload_burst     (cmdArbiter_io_output_fork_io_outputs_0_payload_burst     ), //o
    .io_outputs_0_payload_lock      (cmdArbiter_io_output_fork_io_outputs_0_payload_lock      ), //o
    .io_outputs_0_payload_cache     (cmdArbiter_io_output_fork_io_outputs_0_payload_cache     ), //o
    .io_outputs_0_payload_qos       (cmdArbiter_io_output_fork_io_outputs_0_payload_qos       ), //o
    .io_outputs_0_payload_prot      (cmdArbiter_io_output_fork_io_outputs_0_payload_prot      ), //o
    .io_outputs_1_valid             (cmdArbiter_io_output_fork_io_outputs_1_valid             ), //o
    .io_outputs_1_ready             (cmdArbiter_io_output_fork_io_outputs_1_translated_ready  ), //i
    .io_outputs_1_payload_addr      (cmdArbiter_io_output_fork_io_outputs_1_payload_addr      ), //o
    .io_outputs_1_payload_id        (cmdArbiter_io_output_fork_io_outputs_1_payload_id        ), //o
    .io_outputs_1_payload_region    (cmdArbiter_io_output_fork_io_outputs_1_payload_region    ), //o
    .io_outputs_1_payload_len       (cmdArbiter_io_output_fork_io_outputs_1_payload_len       ), //o
    .io_outputs_1_payload_size      (cmdArbiter_io_output_fork_io_outputs_1_payload_size      ), //o
    .io_outputs_1_payload_burst     (cmdArbiter_io_output_fork_io_outputs_1_payload_burst     ), //o
    .io_outputs_1_payload_lock      (cmdArbiter_io_output_fork_io_outputs_1_payload_lock      ), //o
    .io_outputs_1_payload_cache     (cmdArbiter_io_output_fork_io_outputs_1_payload_cache     ), //o
    .io_outputs_1_payload_qos       (cmdArbiter_io_output_fork_io_outputs_1_payload_qos       ), //o
    .io_outputs_1_payload_prot      (cmdArbiter_io_output_fork_io_outputs_1_payload_prot      ), //o
    .clk                            (clk                                                      ), //i
    .reset                          (reset                                                    )  //i
  );
  StreamFifoLowLatency cmdArbiter_io_output_fork_io_outputs_1_translated_fifo (
    .io_push_valid      (cmdArbiter_io_output_fork_io_outputs_1_translated_valid                ), //i
    .io_push_ready      (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_push_ready   ), //o
    .io_push_payload    (cmdArbiter_io_output_fork_io_outputs_1_translated_payload              ), //i
    .io_pop_valid       (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_valid    ), //o
    .io_pop_ready       (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_ready    ), //i
    .io_pop_payload     (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_payload  ), //o
    .io_flush           (1'b0                                                                   ), //i
    .io_occupancy       (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_occupancy    ), //o
    .clk                (clk                                                                    ), //i
    .reset              (reset                                                                  )  //i
  );
  always @(*) begin
    case(cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_payload)
      1'b0 : begin
        _zz_io_output_w_valid = io_inputs_0_w_valid;
        _zz_io_output_w_payload_data = io_inputs_0_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_0_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_0_w_payload_last;
      end
      default : begin
        _zz_io_output_w_valid = io_inputs_1_w_valid;
        _zz_io_output_w_payload_data = io_inputs_1_w_payload_data;
        _zz_io_output_w_payload_strb = io_inputs_1_w_payload_strb;
        _zz_io_output_w_payload_last = io_inputs_1_w_payload_last;
      end
    endcase
  end

  always @(*) begin
    case(writeRspIndex)
      1'b0 : begin
        _zz_io_output_b_ready = io_inputs_0_b_ready;
      end
      default : begin
        _zz_io_output_b_ready = io_inputs_1_b_ready;
      end
    endcase
  end

  assign io_inputs_0_aw_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_aw_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_aw_valid = cmdArbiter_io_output_fork_io_outputs_0_valid;
  assign io_output_aw_payload_addr = cmdArbiter_io_output_fork_io_outputs_0_payload_addr;
  assign io_output_aw_payload_region = cmdArbiter_io_output_fork_io_outputs_0_payload_region;
  assign io_output_aw_payload_len = cmdArbiter_io_output_fork_io_outputs_0_payload_len;
  assign io_output_aw_payload_size = cmdArbiter_io_output_fork_io_outputs_0_payload_size;
  assign io_output_aw_payload_burst = cmdArbiter_io_output_fork_io_outputs_0_payload_burst;
  assign io_output_aw_payload_lock = cmdArbiter_io_output_fork_io_outputs_0_payload_lock;
  assign io_output_aw_payload_cache = cmdArbiter_io_output_fork_io_outputs_0_payload_cache;
  assign io_output_aw_payload_qos = cmdArbiter_io_output_fork_io_outputs_0_payload_qos;
  assign io_output_aw_payload_prot = cmdArbiter_io_output_fork_io_outputs_0_payload_prot;
  assign io_output_aw_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign cmdArbiter_io_output_fork_io_outputs_1_translated_valid = cmdArbiter_io_output_fork_io_outputs_1_valid;
  assign cmdArbiter_io_output_fork_io_outputs_1_translated_payload = cmdArbiter_io_chosen;
  assign cmdArbiter_io_output_fork_io_outputs_1_translated_ready = cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_push_ready;
  assign io_output_w_valid = (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_valid && _zz_io_output_w_valid);
  assign io_output_w_payload_data = _zz_io_output_w_payload_data;
  assign io_output_w_payload_strb = _zz_io_output_w_payload_strb;
  assign io_output_w_payload_last = _zz_io_output_w_payload_last;
  assign io_inputs_0_w_ready = ((cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_payload == 1'b0));
  assign io_inputs_1_w_ready = ((cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_valid && io_output_w_ready) && (cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_payload == 1'b1));
  assign io_output_w_fire = (io_output_w_valid && io_output_w_ready);
  assign cmdArbiter_io_output_fork_io_outputs_1_translated_fifo_io_pop_ready = (io_output_w_fire && io_output_w_payload_last);
  assign writeRspIndex = io_output_b_payload_id[3 : 3];
  assign writeRspSels_0 = (writeRspIndex == 1'b0);
  assign writeRspSels_1 = (writeRspIndex == 1'b1);
  assign io_inputs_0_b_valid = (io_output_b_valid && writeRspSels_0);
  assign io_inputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_0_b_payload_id = io_output_b_payload_id[2 : 0];
  assign io_inputs_1_b_valid = (io_output_b_valid && writeRspSels_1);
  assign io_inputs_1_b_payload_resp = io_output_b_payload_resp;
  assign io_inputs_1_b_payload_id = io_output_b_payload_id[2 : 0];
  assign io_output_b_ready = _zz_io_output_b_ready;

endmodule

module Axi4ReadOnlyArbiter (
  input               io_inputs_0_ar_valid,
  output              io_inputs_0_ar_ready,
  input      [31:0]   io_inputs_0_ar_payload_addr,
  input      [2:0]    io_inputs_0_ar_payload_id,
  input      [3:0]    io_inputs_0_ar_payload_region,
  input      [7:0]    io_inputs_0_ar_payload_len,
  input      [2:0]    io_inputs_0_ar_payload_size,
  input      [1:0]    io_inputs_0_ar_payload_burst,
  input      [0:0]    io_inputs_0_ar_payload_lock,
  input      [3:0]    io_inputs_0_ar_payload_cache,
  input      [3:0]    io_inputs_0_ar_payload_qos,
  input      [2:0]    io_inputs_0_ar_payload_prot,
  output              io_inputs_0_r_valid,
  input               io_inputs_0_r_ready,
  output     [63:0]   io_inputs_0_r_payload_data,
  output     [2:0]    io_inputs_0_r_payload_id,
  output     [1:0]    io_inputs_0_r_payload_resp,
  output              io_inputs_0_r_payload_last,
  input               io_inputs_1_ar_valid,
  output              io_inputs_1_ar_ready,
  input      [31:0]   io_inputs_1_ar_payload_addr,
  input      [2:0]    io_inputs_1_ar_payload_id,
  input      [3:0]    io_inputs_1_ar_payload_region,
  input      [7:0]    io_inputs_1_ar_payload_len,
  input      [2:0]    io_inputs_1_ar_payload_size,
  input      [1:0]    io_inputs_1_ar_payload_burst,
  input      [0:0]    io_inputs_1_ar_payload_lock,
  input      [3:0]    io_inputs_1_ar_payload_cache,
  input      [3:0]    io_inputs_1_ar_payload_qos,
  input      [2:0]    io_inputs_1_ar_payload_prot,
  output              io_inputs_1_r_valid,
  input               io_inputs_1_r_ready,
  output     [63:0]   io_inputs_1_r_payload_data,
  output     [2:0]    io_inputs_1_r_payload_id,
  output     [1:0]    io_inputs_1_r_payload_resp,
  output              io_inputs_1_r_payload_last,
  output              io_output_ar_valid,
  input               io_output_ar_ready,
  output     [31:0]   io_output_ar_payload_addr,
  output     [3:0]    io_output_ar_payload_id,
  output     [3:0]    io_output_ar_payload_region,
  output     [7:0]    io_output_ar_payload_len,
  output     [2:0]    io_output_ar_payload_size,
  output     [1:0]    io_output_ar_payload_burst,
  output     [0:0]    io_output_ar_payload_lock,
  output     [3:0]    io_output_ar_payload_cache,
  output     [3:0]    io_output_ar_payload_qos,
  output     [2:0]    io_output_ar_payload_prot,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [63:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               clk,
  input               reset
);
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [3:0]    cmdArbiter_io_output_payload_region;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  reg                 _zz_io_output_r_ready;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  StreamArbiter cmdArbiter (
    .io_inputs_0_valid             (io_inputs_0_ar_valid                 ), //i
    .io_inputs_0_ready             (cmdArbiter_io_inputs_0_ready         ), //o
    .io_inputs_0_payload_addr      (io_inputs_0_ar_payload_addr          ), //i
    .io_inputs_0_payload_id        (io_inputs_0_ar_payload_id            ), //i
    .io_inputs_0_payload_region    (io_inputs_0_ar_payload_region        ), //i
    .io_inputs_0_payload_len       (io_inputs_0_ar_payload_len           ), //i
    .io_inputs_0_payload_size      (io_inputs_0_ar_payload_size          ), //i
    .io_inputs_0_payload_burst     (io_inputs_0_ar_payload_burst         ), //i
    .io_inputs_0_payload_lock      (io_inputs_0_ar_payload_lock          ), //i
    .io_inputs_0_payload_cache     (io_inputs_0_ar_payload_cache         ), //i
    .io_inputs_0_payload_qos       (io_inputs_0_ar_payload_qos           ), //i
    .io_inputs_0_payload_prot      (io_inputs_0_ar_payload_prot          ), //i
    .io_inputs_1_valid             (io_inputs_1_ar_valid                 ), //i
    .io_inputs_1_ready             (cmdArbiter_io_inputs_1_ready         ), //o
    .io_inputs_1_payload_addr      (io_inputs_1_ar_payload_addr          ), //i
    .io_inputs_1_payload_id        (io_inputs_1_ar_payload_id            ), //i
    .io_inputs_1_payload_region    (io_inputs_1_ar_payload_region        ), //i
    .io_inputs_1_payload_len       (io_inputs_1_ar_payload_len           ), //i
    .io_inputs_1_payload_size      (io_inputs_1_ar_payload_size          ), //i
    .io_inputs_1_payload_burst     (io_inputs_1_ar_payload_burst         ), //i
    .io_inputs_1_payload_lock      (io_inputs_1_ar_payload_lock          ), //i
    .io_inputs_1_payload_cache     (io_inputs_1_ar_payload_cache         ), //i
    .io_inputs_1_payload_qos       (io_inputs_1_ar_payload_qos           ), //i
    .io_inputs_1_payload_prot      (io_inputs_1_ar_payload_prot          ), //i
    .io_output_valid               (cmdArbiter_io_output_valid           ), //o
    .io_output_ready               (io_output_ar_ready                   ), //i
    .io_output_payload_addr        (cmdArbiter_io_output_payload_addr    ), //o
    .io_output_payload_id          (cmdArbiter_io_output_payload_id      ), //o
    .io_output_payload_region      (cmdArbiter_io_output_payload_region  ), //o
    .io_output_payload_len         (cmdArbiter_io_output_payload_len     ), //o
    .io_output_payload_size        (cmdArbiter_io_output_payload_size    ), //o
    .io_output_payload_burst       (cmdArbiter_io_output_payload_burst   ), //o
    .io_output_payload_lock        (cmdArbiter_io_output_payload_lock    ), //o
    .io_output_payload_cache       (cmdArbiter_io_output_payload_cache   ), //o
    .io_output_payload_qos         (cmdArbiter_io_output_payload_qos     ), //o
    .io_output_payload_prot        (cmdArbiter_io_output_payload_prot    ), //o
    .io_chosen                     (cmdArbiter_io_chosen                 ), //o
    .io_chosenOH                   (cmdArbiter_io_chosenOH               ), //o
    .clk                           (clk                                  ), //i
    .reset                         (reset                                )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : begin
        _zz_io_output_r_ready = io_inputs_0_r_ready;
      end
      default : begin
        _zz_io_output_r_ready = io_inputs_1_r_ready;
      end
    endcase
  end

  assign io_inputs_0_ar_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_ar_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_ar_valid = cmdArbiter_io_output_valid;
  assign io_output_ar_payload_addr = cmdArbiter_io_output_payload_addr;
  assign io_output_ar_payload_region = cmdArbiter_io_output_payload_region;
  assign io_output_ar_payload_len = cmdArbiter_io_output_payload_len;
  assign io_output_ar_payload_size = cmdArbiter_io_output_payload_size;
  assign io_output_ar_payload_burst = cmdArbiter_io_output_payload_burst;
  assign io_output_ar_payload_lock = cmdArbiter_io_output_payload_lock;
  assign io_output_ar_payload_cache = cmdArbiter_io_output_payload_cache;
  assign io_output_ar_payload_qos = cmdArbiter_io_output_payload_qos;
  assign io_output_ar_payload_prot = cmdArbiter_io_output_payload_prot;
  assign io_output_ar_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == 1'b0);
  assign readRspSels_1 = (readRspIndex == 1'b1);
  assign io_inputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_inputs_0_r_payload_data = io_output_r_payload_data;
  assign io_inputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_0_r_payload_last = io_output_r_payload_last;
  assign io_inputs_0_r_payload_id = io_output_r_payload_id[2 : 0];
  assign io_inputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_inputs_1_r_payload_data = io_output_r_payload_data;
  assign io_inputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_1_r_payload_last = io_output_r_payload_last;
  assign io_inputs_1_r_payload_id = io_output_r_payload_id[2 : 0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

//Axi4WriteOnlyDecoder replaced by Axi4WriteOnlyDecoder

//Axi4ReadOnlyDecoder replaced by Axi4ReadOnlyDecoder

module Axi4WriteOnlyDecoder (
  input               io_input_aw_valid,
  output              io_input_aw_ready,
  input      [31:0]   io_input_aw_payload_addr,
  input      [2:0]    io_input_aw_payload_id,
  input      [3:0]    io_input_aw_payload_region,
  input      [7:0]    io_input_aw_payload_len,
  input      [2:0]    io_input_aw_payload_size,
  input      [1:0]    io_input_aw_payload_burst,
  input      [0:0]    io_input_aw_payload_lock,
  input      [3:0]    io_input_aw_payload_cache,
  input      [3:0]    io_input_aw_payload_qos,
  input      [2:0]    io_input_aw_payload_prot,
  input               io_input_w_valid,
  output              io_input_w_ready,
  input      [63:0]   io_input_w_payload_data,
  input      [7:0]    io_input_w_payload_strb,
  input               io_input_w_payload_last,
  output              io_input_b_valid,
  input               io_input_b_ready,
  output reg [2:0]    io_input_b_payload_id,
  output reg [1:0]    io_input_b_payload_resp,
  output              io_outputs_0_aw_valid,
  input               io_outputs_0_aw_ready,
  output     [31:0]   io_outputs_0_aw_payload_addr,
  output     [2:0]    io_outputs_0_aw_payload_id,
  output     [3:0]    io_outputs_0_aw_payload_region,
  output     [7:0]    io_outputs_0_aw_payload_len,
  output     [2:0]    io_outputs_0_aw_payload_size,
  output     [1:0]    io_outputs_0_aw_payload_burst,
  output     [0:0]    io_outputs_0_aw_payload_lock,
  output     [3:0]    io_outputs_0_aw_payload_cache,
  output     [3:0]    io_outputs_0_aw_payload_qos,
  output     [2:0]    io_outputs_0_aw_payload_prot,
  output              io_outputs_0_w_valid,
  input               io_outputs_0_w_ready,
  output     [63:0]   io_outputs_0_w_payload_data,
  output     [7:0]    io_outputs_0_w_payload_strb,
  output              io_outputs_0_w_payload_last,
  input               io_outputs_0_b_valid,
  output              io_outputs_0_b_ready,
  input      [2:0]    io_outputs_0_b_payload_id,
  input      [1:0]    io_outputs_0_b_payload_resp,
  input               clk,
  input               reset
);
  wire                errorSlave_io_axi_aw_valid;
  wire                errorSlave_io_axi_w_valid;
  wire                errorSlave_io_axi_aw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [2:0]    errorSlave_io_axi_b_payload_id;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                cmdAllowedStart;
  wire                io_input_aw_fire;
  wire                io_input_b_fire;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l494;
  wire                when_Utils_l496;
  wire                io_input_w_fire;
  wire                when_Utils_l469;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire                when_Utils_l494_1;
  wire                when_Utils_l496_1;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_cmdAllowedStart;

  Axi4WriteOnlyErrorSlave errorSlave (
    .io_axi_aw_valid             (errorSlave_io_axi_aw_valid        ), //i
    .io_axi_aw_ready             (errorSlave_io_axi_aw_ready        ), //o
    .io_axi_aw_payload_addr      (io_input_aw_payload_addr          ), //i
    .io_axi_aw_payload_id        (io_input_aw_payload_id            ), //i
    .io_axi_aw_payload_region    (io_input_aw_payload_region        ), //i
    .io_axi_aw_payload_len       (io_input_aw_payload_len           ), //i
    .io_axi_aw_payload_size      (io_input_aw_payload_size          ), //i
    .io_axi_aw_payload_burst     (io_input_aw_payload_burst         ), //i
    .io_axi_aw_payload_lock      (io_input_aw_payload_lock          ), //i
    .io_axi_aw_payload_cache     (io_input_aw_payload_cache         ), //i
    .io_axi_aw_payload_qos       (io_input_aw_payload_qos           ), //i
    .io_axi_aw_payload_prot      (io_input_aw_payload_prot          ), //i
    .io_axi_w_valid              (errorSlave_io_axi_w_valid         ), //i
    .io_axi_w_ready              (errorSlave_io_axi_w_ready         ), //o
    .io_axi_w_payload_data       (io_input_w_payload_data           ), //i
    .io_axi_w_payload_strb       (io_input_w_payload_strb           ), //i
    .io_axi_w_payload_last       (io_input_w_payload_last           ), //i
    .io_axi_b_valid              (errorSlave_io_axi_b_valid         ), //o
    .io_axi_b_ready              (io_input_b_ready                  ), //i
    .io_axi_b_payload_id         (errorSlave_io_axi_b_payload_id    ), //o
    .io_axi_b_payload_resp       (errorSlave_io_axi_b_payload_resp  ), //o
    .clk                         (clk                               ), //i
    .reset                       (reset                             )  //i
  );
  assign io_input_aw_fire = (io_input_aw_valid && io_input_aw_ready);
  assign io_input_b_fire = (io_input_b_valid && io_input_b_ready);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_aw_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(io_input_b_fire) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_willOverflowIfInc = ((pendingCmdCounter_value == 3'b111) && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l494 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l494) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l496) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l496 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign io_input_w_fire = (io_input_w_valid && io_input_w_ready);
  assign when_Utils_l469 = (io_input_w_fire && io_input_w_payload_last);
  always @(*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if(cmdAllowedStart) begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(when_Utils_l469) begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_willOverflowIfInc = ((pendingDataCounter_value == 3'b111) && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  assign when_Utils_l494_1 = (pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l494_1) begin
      pendingDataCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l496_1) begin
        pendingDataCounter_finalIncrement = 3'b111;
      end else begin
        pendingDataCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l496_1 = ((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt);
  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_aw_payload_addr & (~ 32'hffffffff)) == 32'h0) && io_input_aw_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != 3'b000);
  assign cmdAllowedStart = ((io_input_aw_valid && allowCmd) && _zz_cmdAllowedStart);
  assign io_input_aw_ready = ((((decodedCmdSels & io_outputs_0_aw_ready) != 1'b0) || (decodedCmdError && errorSlave_io_axi_aw_ready)) && allowCmd);
  assign errorSlave_io_axi_aw_valid = ((io_input_aw_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_aw_valid = ((io_input_aw_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_aw_payload_addr = io_input_aw_payload_addr;
  assign io_outputs_0_aw_payload_id = io_input_aw_payload_id;
  assign io_outputs_0_aw_payload_region = io_input_aw_payload_region;
  assign io_outputs_0_aw_payload_len = io_input_aw_payload_len;
  assign io_outputs_0_aw_payload_size = io_input_aw_payload_size;
  assign io_outputs_0_aw_payload_burst = io_input_aw_payload_burst;
  assign io_outputs_0_aw_payload_lock = io_input_aw_payload_lock;
  assign io_outputs_0_aw_payload_cache = io_input_aw_payload_cache;
  assign io_outputs_0_aw_payload_qos = io_input_aw_payload_qos;
  assign io_outputs_0_aw_payload_prot = io_input_aw_payload_prot;
  assign io_input_w_ready = ((((pendingSels & io_outputs_0_w_ready) != 1'b0) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign errorSlave_io_axi_w_valid = ((io_input_w_valid && pendingError) && allowData);
  assign io_outputs_0_w_valid = ((io_input_w_valid && pendingSels[0]) && allowData);
  assign io_outputs_0_w_payload_data = io_input_w_payload_data;
  assign io_outputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_outputs_0_w_payload_last = io_input_w_payload_last;
  assign io_input_b_valid = ((io_outputs_0_b_valid != 1'b0) || errorSlave_io_axi_b_valid);
  always @(*) begin
    io_input_b_payload_id = io_outputs_0_b_payload_id;
    if(pendingError) begin
      io_input_b_payload_id = errorSlave_io_axi_b_payload_id;
    end
  end

  always @(*) begin
    io_input_b_payload_resp = io_outputs_0_b_payload_resp;
    if(pendingError) begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_outputs_0_b_ready = io_input_b_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingDataCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
      _zz_cmdAllowedStart <= 1'b1;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart) begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart) begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart) begin
        _zz_cmdAllowedStart <= 1'b0;
      end
      if(io_input_aw_ready) begin
        _zz_cmdAllowedStart <= 1'b1;
      end
    end
  end

endmodule

module Axi4ReadOnlyDecoder (
  input               io_input_ar_valid,
  output              io_input_ar_ready,
  input      [31:0]   io_input_ar_payload_addr,
  input      [2:0]    io_input_ar_payload_id,
  input      [3:0]    io_input_ar_payload_region,
  input      [7:0]    io_input_ar_payload_len,
  input      [2:0]    io_input_ar_payload_size,
  input      [1:0]    io_input_ar_payload_burst,
  input      [0:0]    io_input_ar_payload_lock,
  input      [3:0]    io_input_ar_payload_cache,
  input      [3:0]    io_input_ar_payload_qos,
  input      [2:0]    io_input_ar_payload_prot,
  output reg          io_input_r_valid,
  input               io_input_r_ready,
  output     [63:0]   io_input_r_payload_data,
  output reg [2:0]    io_input_r_payload_id,
  output reg [1:0]    io_input_r_payload_resp,
  output reg          io_input_r_payload_last,
  output              io_outputs_0_ar_valid,
  input               io_outputs_0_ar_ready,
  output     [31:0]   io_outputs_0_ar_payload_addr,
  output     [2:0]    io_outputs_0_ar_payload_id,
  output     [3:0]    io_outputs_0_ar_payload_region,
  output     [7:0]    io_outputs_0_ar_payload_len,
  output     [2:0]    io_outputs_0_ar_payload_size,
  output     [1:0]    io_outputs_0_ar_payload_burst,
  output     [0:0]    io_outputs_0_ar_payload_lock,
  output     [3:0]    io_outputs_0_ar_payload_cache,
  output     [3:0]    io_outputs_0_ar_payload_qos,
  output     [2:0]    io_outputs_0_ar_payload_prot,
  input               io_outputs_0_r_valid,
  output              io_outputs_0_r_ready,
  input      [63:0]   io_outputs_0_r_payload_data,
  input      [2:0]    io_outputs_0_r_payload_id,
  input      [1:0]    io_outputs_0_r_payload_resp,
  input               io_outputs_0_r_payload_last,
  input               clk,
  input               reset
);
  wire                errorSlave_io_axi_ar_valid;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [63:0]   errorSlave_io_axi_r_payload_data;
  wire       [2:0]    errorSlave_io_axi_r_payload_id;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  wire                io_input_ar_fire;
  wire                io_input_r_fire;
  wire                when_Utils_l469;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire                when_Utils_l494;
  wire                when_Utils_l496;
  wire       [0:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [0:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;

  Axi4ReadOnlyErrorSlave errorSlave (
    .io_axi_ar_valid             (errorSlave_io_axi_ar_valid        ), //i
    .io_axi_ar_ready             (errorSlave_io_axi_ar_ready        ), //o
    .io_axi_ar_payload_addr      (io_input_ar_payload_addr          ), //i
    .io_axi_ar_payload_id        (io_input_ar_payload_id            ), //i
    .io_axi_ar_payload_region    (io_input_ar_payload_region        ), //i
    .io_axi_ar_payload_len       (io_input_ar_payload_len           ), //i
    .io_axi_ar_payload_size      (io_input_ar_payload_size          ), //i
    .io_axi_ar_payload_burst     (io_input_ar_payload_burst         ), //i
    .io_axi_ar_payload_lock      (io_input_ar_payload_lock          ), //i
    .io_axi_ar_payload_cache     (io_input_ar_payload_cache         ), //i
    .io_axi_ar_payload_qos       (io_input_ar_payload_qos           ), //i
    .io_axi_ar_payload_prot      (io_input_ar_payload_prot          ), //i
    .io_axi_r_valid              (errorSlave_io_axi_r_valid         ), //o
    .io_axi_r_ready              (io_input_r_ready                  ), //i
    .io_axi_r_payload_data       (errorSlave_io_axi_r_payload_data  ), //o
    .io_axi_r_payload_id         (errorSlave_io_axi_r_payload_id    ), //o
    .io_axi_r_payload_resp       (errorSlave_io_axi_r_payload_resp  ), //o
    .io_axi_r_payload_last       (errorSlave_io_axi_r_payload_last  ), //o
    .clk                         (clk                               ), //i
    .reset                       (reset                             )  //i
  );
  assign io_input_ar_fire = (io_input_ar_valid && io_input_ar_ready);
  assign io_input_r_fire = (io_input_r_valid && io_input_r_ready);
  assign when_Utils_l469 = (io_input_r_fire && io_input_r_payload_last);
  always @(*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if(io_input_ar_fire) begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @(*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(when_Utils_l469) begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_willOverflowIfInc = ((pendingCmdCounter_value == 3'b111) && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  assign when_Utils_l494 = (pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt));
  always @(*) begin
    if(when_Utils_l494) begin
      pendingCmdCounter_finalIncrement = 3'b001;
    end else begin
      if(when_Utils_l496) begin
        pendingCmdCounter_finalIncrement = 3'b111;
      end else begin
        pendingCmdCounter_finalIncrement = 3'b000;
      end
    end
  end

  assign when_Utils_l496 = ((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt);
  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = (((io_input_ar_payload_addr & (~ 32'hffffffff)) == 32'h0) && io_input_ar_valid);
  assign decodedCmdError = (decodedCmdSels == 1'b0);
  assign allowCmd = ((pendingCmdCounter_value == 3'b000) || ((pendingCmdCounter_value != 3'b111) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = ((((decodedCmdSels & io_outputs_0_ar_ready) != 1'b0) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign errorSlave_io_axi_ar_valid = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_id = io_input_ar_payload_id;
  assign io_outputs_0_ar_payload_region = io_input_ar_payload_region;
  assign io_outputs_0_ar_payload_len = io_input_ar_payload_len;
  assign io_outputs_0_ar_payload_size = io_input_ar_payload_size;
  assign io_outputs_0_ar_payload_burst = io_input_ar_payload_burst;
  assign io_outputs_0_ar_payload_lock = io_input_ar_payload_lock;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_qos = io_input_ar_payload_qos;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  always @(*) begin
    io_input_r_valid = (io_outputs_0_r_valid != 1'b0);
    if(errorSlave_io_axi_r_valid) begin
      io_input_r_valid = 1'b1;
    end
  end

  assign io_input_r_payload_data = io_outputs_0_r_payload_data;
  always @(*) begin
    io_input_r_payload_id = io_outputs_0_r_payload_id;
    if(pendingError) begin
      io_input_r_payload_id = errorSlave_io_axi_r_payload_id;
    end
  end

  always @(*) begin
    io_input_r_payload_resp = io_outputs_0_r_payload_resp;
    if(pendingError) begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @(*) begin
    io_input_r_payload_last = io_outputs_0_r_payload_last;
    if(pendingError) begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pendingCmdCounter_value <= 3'b000;
      pendingSels <= 1'b0;
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready) begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready) begin
        pendingError <= decodedCmdError;
      end
    end
  end

endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input      [0:0]    io_push_payload,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg [0:0]    io_pop_payload,
  input               io_flush,
  output     [2:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire       [0:0]    _zz_ram_port0;
  wire       [1:0]    _zz_pushPtr_valueNext;
  wire       [0:0]    _zz_pushPtr_valueNext_1;
  wire       [1:0]    _zz_popPtr_valueNext;
  wire       [0:0]    _zz_popPtr_valueNext_1;
  wire       [0:0]    _zz_ram_port;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [1:0]    pushPtr_valueNext;
  reg        [1:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [1:0]    popPtr_valueNext;
  reg        [1:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                when_Stream_l995;
  wire                when_Stream_l1008;
  wire       [1:0]    ptrDif;
  (* ram_style = "distributed" *) reg [0:0] ram [0:3];

  assign _zz_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign _zz_pushPtr_valueNext = {1'd0, _zz_pushPtr_valueNext_1};
  assign _zz_popPtr_valueNext_1 = popPtr_willIncrement;
  assign _zz_popPtr_valueNext = {1'd0, _zz_popPtr_valueNext_1};
  assign _zz_ram_port = io_push_payload;
  assign _zz_ram_port0 = ram[popPtr_value];
  always @(posedge clk) begin
    if (reset) begin
      ram[0] <= 1'b0;
      ram[1] <= 1'b0;
      ram[2] <= 1'b0;
      ram[3] <= 1'b0;
    end
    else if(_zz_1) begin
      ram[pushPtr_value] <= _zz_ram_port;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 2'b11);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + _zz_pushPtr_valueNext);
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 2'b00;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 2'b11);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + _zz_popPtr_valueNext);
    if(popPtr_willClear) begin
      popPtr_valueNext = 2'b00;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign when_Stream_l995 = (! empty);
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload = _zz_ram_port0;
    end else begin
      io_pop_payload = io_push_payload;
    end
  end

  assign when_Stream_l1008 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pushPtr_value <= 2'b00;
      popPtr_value <= 2'b00;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(when_Stream_l1008) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end

endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [31:0]   io_input_payload_addr,
  input      [2:0]    io_input_payload_id,
  input      [3:0]    io_input_payload_region,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input      [0:0]    io_input_payload_lock,
  input      [3:0]    io_input_payload_cache,
  input      [3:0]    io_input_payload_qos,
  input      [2:0]    io_input_payload_prot,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [31:0]   io_outputs_0_payload_addr,
  output     [2:0]    io_outputs_0_payload_id,
  output     [3:0]    io_outputs_0_payload_region,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output     [0:0]    io_outputs_0_payload_lock,
  output     [3:0]    io_outputs_0_payload_cache,
  output     [3:0]    io_outputs_0_payload_qos,
  output     [2:0]    io_outputs_0_payload_prot,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [31:0]   io_outputs_1_payload_addr,
  output     [2:0]    io_outputs_1_payload_id,
  output     [3:0]    io_outputs_1_payload_region,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output     [0:0]    io_outputs_1_payload_lock,
  output     [3:0]    io_outputs_1_payload_cache,
  output     [3:0]    io_outputs_1_payload_qos,
  output     [2:0]    io_outputs_1_payload_prot,
  input               clk,
  input               reset
);
  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l806;
  wire                when_Stream_l806_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l806) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l806_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l806 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l806_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_region = io_input_payload_region;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_lock = io_input_payload_lock;
  assign io_outputs_0_payload_cache = io_input_payload_cache;
  assign io_outputs_0_payload_qos = io_input_payload_qos;
  assign io_outputs_0_payload_prot = io_input_payload_prot;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_region = io_input_payload_region;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_lock = io_input_payload_lock;
  assign io_outputs_1_payload_cache = io_input_payload_cache;
  assign io_outputs_1_payload_qos = io_input_payload_qos;
  assign io_outputs_1_payload_prot = io_input_payload_prot;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end

endmodule

//StreamArbiter replaced by StreamArbiter

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [31:0]   io_inputs_0_payload_addr,
  input      [2:0]    io_inputs_0_payload_id,
  input      [3:0]    io_inputs_0_payload_region,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input      [0:0]    io_inputs_0_payload_lock,
  input      [3:0]    io_inputs_0_payload_cache,
  input      [3:0]    io_inputs_0_payload_qos,
  input      [2:0]    io_inputs_0_payload_prot,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [31:0]   io_inputs_1_payload_addr,
  input      [2:0]    io_inputs_1_payload_id,
  input      [3:0]    io_inputs_1_payload_region,
  input      [7:0]    io_inputs_1_payload_len,
  input      [2:0]    io_inputs_1_payload_size,
  input      [1:0]    io_inputs_1_payload_burst,
  input      [0:0]    io_inputs_1_payload_lock,
  input      [3:0]    io_inputs_1_payload_cache,
  input      [3:0]    io_inputs_1_payload_qos,
  input      [2:0]    io_inputs_1_payload_prot,
  output              io_output_valid,
  input               io_output_ready,
  output     [31:0]   io_output_payload_addr,
  output     [2:0]    io_output_payload_id,
  output     [3:0]    io_output_payload_region,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output     [0:0]    io_output_payload_lock,
  output     [3:0]    io_output_payload_cache,
  output     [3:0]    io_output_payload_qos,
  output     [2:0]    io_output_payload_prot,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               clk,
  input               reset
);
  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_region = (maskRouted_0 ? io_inputs_0_payload_region : io_inputs_1_payload_region);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_lock = (maskRouted_0 ? io_inputs_0_payload_lock : io_inputs_1_payload_lock);
  assign io_output_payload_cache = (maskRouted_0 ? io_inputs_0_payload_cache : io_inputs_1_payload_cache);
  assign io_output_payload_qos = (maskRouted_0 ? io_inputs_0_payload_qos : io_inputs_1_payload_qos);
  assign io_output_payload_prot = (maskRouted_0 ? io_inputs_0_payload_prot : io_inputs_1_payload_prot);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end

endmodule

//Axi4WriteOnlyErrorSlave replaced by Axi4WriteOnlyErrorSlave

//Axi4ReadOnlyErrorSlave replaced by Axi4ReadOnlyErrorSlave

module Axi4WriteOnlyErrorSlave (
  input               io_axi_aw_valid,
  output              io_axi_aw_ready,
  input      [31:0]   io_axi_aw_payload_addr,
  input      [2:0]    io_axi_aw_payload_id,
  input      [3:0]    io_axi_aw_payload_region,
  input      [7:0]    io_axi_aw_payload_len,
  input      [2:0]    io_axi_aw_payload_size,
  input      [1:0]    io_axi_aw_payload_burst,
  input      [0:0]    io_axi_aw_payload_lock,
  input      [3:0]    io_axi_aw_payload_cache,
  input      [3:0]    io_axi_aw_payload_qos,
  input      [2:0]    io_axi_aw_payload_prot,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [63:0]   io_axi_w_payload_data,
  input      [7:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [2:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  input               clk,
  input               reset
);
  reg                 consumeData;
  reg                 sendRsp;
  reg        [2:0]    id;
  wire                io_axi_aw_fire;
  wire                io_axi_w_fire;
  wire                when_Axi4ErrorSlave_l24;
  wire                io_axi_b_fire;

  assign io_axi_aw_ready = (! (consumeData || sendRsp));
  assign io_axi_aw_fire = (io_axi_aw_valid && io_axi_aw_ready);
  assign io_axi_w_ready = consumeData;
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign when_Axi4ErrorSlave_l24 = (io_axi_w_fire && io_axi_w_payload_last);
  assign io_axi_b_valid = sendRsp;
  assign io_axi_b_payload_resp = 2'b11;
  assign io_axi_b_payload_id = id;
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      consumeData <= 1'b0;
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_aw_fire) begin
        consumeData <= 1'b1;
      end
      if(when_Axi4ErrorSlave_l24) begin
        consumeData <= 1'b0;
        sendRsp <= 1'b1;
      end
      if(io_axi_b_fire) begin
        sendRsp <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if (reset) begin
      id <= 3'b0;
    end else if (io_axi_aw_fire) begin
      id <= io_axi_aw_payload_id;
    end
  end

endmodule

module Axi4ReadOnlyErrorSlave (
  input               io_axi_ar_valid,
  output              io_axi_ar_ready,
  input      [31:0]   io_axi_ar_payload_addr,
  input      [2:0]    io_axi_ar_payload_id,
  input      [3:0]    io_axi_ar_payload_region,
  input      [7:0]    io_axi_ar_payload_len,
  input      [2:0]    io_axi_ar_payload_size,
  input      [1:0]    io_axi_ar_payload_burst,
  input      [0:0]    io_axi_ar_payload_lock,
  input      [3:0]    io_axi_ar_payload_cache,
  input      [3:0]    io_axi_ar_payload_qos,
  input      [2:0]    io_axi_ar_payload_prot,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [63:0]   io_axi_r_payload_data,
  output     [2:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               clk,
  input               reset
);
  reg                 sendRsp;
  reg        [2:0]    id;
  reg        [7:0]    remaining;
  wire                remainingZero;
  wire                io_axi_ar_fire;

  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_ar_fire = (io_axi_ar_valid && io_axi_ar_ready);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_id = id;
  assign io_axi_r_payload_resp = 2'b11;
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      sendRsp <= 1'b0;
    end else begin
      if(io_axi_ar_fire) begin
        sendRsp <= 1'b1;
      end
      if(sendRsp) begin
        if(io_axi_r_ready) begin
          if(remainingZero) begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if (reset) begin
        remaining <= 8'b0;
        id <= 3'b0;
    end else begin
        if(io_axi_ar_fire) begin
            remaining <= io_axi_ar_payload_len;
            id <= io_axi_ar_payload_id;
        end
        if(sendRsp) begin
            if(io_axi_r_ready) begin
                remaining <= (remaining - 8'h01);
            end
        end
    end
  end

endmodule


module ysyx_210101_decoder_5_32(
    input  [ 4:0] in,
    output [31:0] out
);

genvar i;
generate for (i=0; i<32; i=i+1) begin : gen_for_dec_5_32
    assign out[i] = (in == i);
end endgenerate

endmodule

module ysyx_210101_decoder_6_64(
    input  [ 5:0] in,
    output [63:0] out
);

genvar i;
generate for (i=0; i<64; i=i+1) begin : gen_for_dec_6_64
    assign out[i] = (in == i);
end endgenerate

endmodule


module ysyx_210101_tlb
#(parameter TLBNUM = 16)
(
    input                         clk,
    input                         reset,
    // Search Port 0
    input  [                18:0] s0_vpn2,
    input                         s0_odd_page,
    input  [                 7:0] s0_asid,
    output                        s0_found,
    output [$clog2(TLBNUM) - 1:0] s0_index,
    output [                19:0] s0_pfn,
    output [                 2:0] s0_c,
    output                        s0_d,
    output                        s0_v,

    // Search Port 1
    input  [                18:0] s1_vpn2,
    input                         s1_odd_page,
    input  [                 7:0] s1_asid,
    output                        s1_found,
    output [$clog2(TLBNUM) - 1:0] s1_index,
    output [                19:0] s1_pfn,
    output [                 2:0] s1_c,
    output                        s1_d,
    output                        s1_v,

    // Write Port
    input                         we,
    input  [$clog2(TLBNUM) - 1:0] w_index,
    input  [                18:0] w_vpn2,
    input  [                 7:0] w_asid,
    input                         w_g,
    input  [                19:0] w_pfn0,
    input  [                 2:0] w_c0,
    input                         w_d0,
    input                         w_v0,
    input  [                19:0] w_pfn1,
    input  [                 2:0] w_c1,
    input                         w_d1,
    input                         w_v1,

    // Read Port
    input  [$clog2(TLBNUM) - 1:0] r_index,
    output [                18:0] r_vpn2,
    output [                 7:0] r_asid,
    output                        r_g,
    output [                19:0] r_pfn0,
    output [                 2:0] r_c0,
    output                        r_d0,
    output                        r_v0,
    output [                19:0] r_pfn1,
    output [                 2:0] r_c1,
    output                        r_d1,
    output                        r_v1
);

// PTEs
reg [   18:0] tlb_vpn2     [TLBNUM - 1:0];
reg [    7:0] tlb_asid     [TLBNUM - 1:0];
reg           tlb_g        [TLBNUM - 1:0];
reg [   19:0] tlb_pfn0     [TLBNUM - 1:0];
reg [    2:0] tlb_c0       [TLBNUM - 1:0];
reg           tlb_d0       [TLBNUM - 1:0];
reg           tlb_v0       [TLBNUM - 1:0];
reg [   19:0] tlb_pfn1     [TLBNUM - 1:0];
reg [    2:0] tlb_c1       [TLBNUM - 1:0];
reg           tlb_d1       [TLBNUM - 1:0];
reg           tlb_v1       [TLBNUM - 1:0];

wire [TLBNUM - 1:0] s0_match;
wire [TLBNUM - 1:0] s1_match;

/* 
 * Search result Output
 */

// Match
genvar i;
generate for (i = 0; i < TLBNUM; i = i + 1) begin : gen_for_s0_match
    assign s0_match[i] = (s0_vpn2 == tlb_vpn2[i]) && (s0_asid == tlb_asid[i] || tlb_g[i]);
end endgenerate

genvar j;
generate for (j = 0; j < TLBNUM; j = j + 1) begin : gen_for_s1_match
    assign s1_match[j] = (s1_vpn2 == tlb_vpn2[j]) && (s1_asid == tlb_asid[j] || tlb_g[j]);
end endgenerate

// Found
assign s0_found = |s0_match;
assign s1_found = |s1_match;

// Index
ysyx_210101_encoder_16_4 u_s0(
    .in  (s0_match),
    .out (s0_index)
);

ysyx_210101_encoder_16_4 u_s1(
    .in  (s1_match),
    .out (s1_index)
);

// PTE related
assign s0_pfn = ~s0_odd_page ? tlb_pfn0[s0_index] : tlb_pfn1[s0_index];
assign s0_c   = ~s0_odd_page ? tlb_c0  [s0_index] : tlb_c1  [s0_index];
assign s0_d   = ~s0_odd_page ? tlb_d0  [s0_index] : tlb_d1  [s0_index];
assign s0_v   = ~s0_odd_page ? tlb_v0  [s0_index] : tlb_v1  [s0_index];

assign s1_pfn = ~s1_odd_page ? tlb_pfn0[s1_index] : tlb_pfn1[s1_index];
assign s1_c   = ~s1_odd_page ? tlb_c0  [s1_index] : tlb_c1  [s1_index];
assign s1_d   = ~s1_odd_page ? tlb_d0  [s1_index] : tlb_d1  [s1_index];
assign s1_v   = ~s1_odd_page ? tlb_v0  [s1_index] : tlb_v1  [s1_index];

/* 
 * Read Channel
 */
assign r_vpn2 = tlb_vpn2[r_index];
assign r_asid = tlb_asid[r_index];
assign r_g    = tlb_g   [r_index];
assign r_pfn0 = tlb_pfn0[r_index];
assign r_c0   = tlb_c0  [r_index];
assign r_d0   = tlb_d0  [r_index];
assign r_v0   = tlb_v0  [r_index];
assign r_pfn1 = tlb_pfn1[r_index];
assign r_c1   = tlb_c1  [r_index];
assign r_d1   = tlb_d1  [r_index];
assign r_v1   = tlb_v1  [r_index];    

/* 
 * Write Channel
 */
genvar tlb_i;
generate for (tlb_i = 0; tlb_i < TLBNUM; tlb_i = tlb_i + 1) begin:gen_tlb
    always @(posedge clk) begin
        if (reset) begin
            tlb_vpn2[tlb_i] <= 0;
            tlb_asid[tlb_i] <= 0;    
            tlb_g   [tlb_i] <= 0;
            tlb_pfn0[tlb_i] <= 0;
            tlb_c0  [tlb_i] <= 0;
            tlb_d0  [tlb_i] <= 0;
            tlb_v0  [tlb_i] <= 0;
            tlb_pfn1[tlb_i] <= 0;
            tlb_c1  [tlb_i] <= 0;
            tlb_d1  [tlb_i] <= 0;
            tlb_v1  [tlb_i] <= 0;
        end else if (we && w_index == tlb_i) begin
            tlb_vpn2[tlb_i] <= w_vpn2;
            tlb_asid[tlb_i] <= w_asid;    
            tlb_g   [tlb_i] <= w_g;
            tlb_pfn0[tlb_i] <= w_pfn0;
            tlb_c0  [tlb_i] <= w_c0;
            tlb_d0  [tlb_i] <= w_d0;
            tlb_v0  [tlb_i] <= w_v0;
            tlb_pfn1[tlb_i] <= w_pfn1;
            tlb_c1  [tlb_i] <= w_c1;
            tlb_d1  [tlb_i] <= w_d1;
            tlb_v1  [tlb_i] <= w_v1;
        end
    end
end endgenerate
endmodule

module ysyx_210101_encoder_16_4(
    input  [15:0] in,
    output [ 3:0] out 
);

assign out = ({4{in[ 0]}} & 4'd0 )
           | ({4{in[ 1]}} & 4'd1 )
           | ({4{in[ 2]}} & 4'd2 )
           | ({4{in[ 3]}} & 4'd3 )
           | ({4{in[ 4]}} & 4'd4 )
           | ({4{in[ 5]}} & 4'd5 )
           | ({4{in[ 6]}} & 4'd6 )
           | ({4{in[ 7]}} & 4'd7 )
           | ({4{in[ 8]}} & 4'd8 )
           | ({4{in[ 9]}} & 4'd9 )
           | ({4{in[10]}} & 4'd10)
           | ({4{in[11]}} & 4'd11)
           | ({4{in[12]}} & 4'd12)
           | ({4{in[13]}} & 4'd13)
           | ({4{in[14]}} & 4'd14)
           | ({4{in[15]}} & 4'd15);
endmodule

//===============================================================================================================================//
`ifndef CACHE_H
	`define CACHE_H
	`define DATABANK_WID 32
	`define INDEX_ENTRIES 128
	`define OFFSET_WID 5
	`define INDEX_WID 7
	`define TAG_WID 20
	`define INST_REQUEST_BUFFER_WID 32
	`define BlockNum 8
	
	`define ICACHE_RID 4'd1
	`define I_UNCACHE_RID 4'd2
	`define ICACHE_WID 4'd3
	`define I_UNCACHE_WID 4'd4
	`define DCACHE_RID 4'd5
	`define D_UNCACHE_RID 4'd6
	`define DCACHE_WID 4'd7
	`define D_UNCACHE_WID 4'd8
	`define OP_WRIET 1'b1
	`define OP_READ 1'b0
`endif


module ysyx_210101_data_cache_control(
	input 			clk,
	input 			reset,
	////cpu_control
	input           data_req,
    input   [ 1:0]  data_size,
    input           data_op,
    input   [ 6:0]  data_index,
    input   [19:0]  data_tag,
    input   [ 4:0]  data_offset,
    input   [ 3:0]  data_wstrb,
    input   [31:0]  data_wdata,
    output          data_addr_ok,
    output          data_data_ok,
    output  [31:0]  data_rdata,
    input           data_cache,

    //// dcache interface

    output           dcache_req,
    input            dcache_addr_ok,
    input            dcache_data_ok,
    input    [31:0]  dcache_rdata,
    
    //// uncache inst axi control
    output  [3 :0] arid   ,
    output  [31:0] araddr,
    output  [7 :0] arlen  ,
    output  [2 :0] arsize ,
    output  [1 :0] arburst,
    output         arvalid,
    input          arready,
    //r
    input [3 :0] rid    ,
    input [31:0] rdata  ,
    input [1 :0] rresp ,
    input        rlast ,
    input        rvalid ,
    output       rready ,
    //aw
    output  [3 :0] awid   ,
    output  [31:0] awaddr ,
    output  [7 :0] awlen  ,
    output  [2 :0] awsize ,
    output  [1 :0] awburst,
    output         awvalid,
    input          awready,
    //w
    output  [31:0] wdata  ,
    output  [3 :0] wstrb  ,
    output         wlast  ,
    output         wvalid ,
    input          wready ,
    //b
    input [3 :0] bid    ,
    input [1 :0] bresp  ,
    input        bvalid ,
    output       bready 


	);

wire [31:0] dcache_addr;
wire        is_cached;
reg  [31:0] addr_reg;
reg  [31:0] wdata_reg;
reg  [ 3:0] wstrb_reg;
reg  [ 1:0] size_reg;
wire        addr_ok;
wire        data_ok;
reg         dcache_working;
reg [2:0]   state;
reg [2:0]   nextstate;
parameter   IDLE = 3'd1;
parameter   AR   = 3'd2;
parameter   READ = 3'd3;
parameter   AW   = 3'd4;
parameter   WRITE= 3'd5;


assign dcache_addr = {data_tag,data_index,data_offset};
assign dcache_req = data_req && is_cached;

assign is_cached = data_cache && 1'b0;

assign addr_ok = state == IDLE && !is_cached && !dcache_working;
assign data_ok = rlast && rready && rvalid || bvalid && bready;
assign data_addr_ok = (is_cached)? dcache_addr_ok : addr_ok;
assign data_data_ok = (dcache_working)? dcache_data_ok : data_ok;
assign data_rdata = (dcache_working)? dcache_rdata : rdata;

always @(posedge clk) begin
    if (reset) begin
        // reset
        dcache_working <= 1'b0;
    end
    else if (data_req && is_cached) begin
        dcache_working <= 1'b1;
    end
    else if (dcache_data_ok)
        dcache_working <= 1'b0;
end

always @(posedge clk) begin
    if (reset) begin
        // reset
        state <= IDLE;
    end
    else
        state <= nextstate;
end
always @(*) begin
    case(state)
    IDLE:begin
        if(data_req && !is_cached && data_op==`OP_READ )
            nextstate = AR;
        else if (data_req && !is_cached && data_op==`OP_WRIET) begin
            nextstate = AW;
        end else begin
            nextstate = IDLE;
        end
    end
    AR:begin
        if(arready&&arvalid)
            nextstate = READ;
        else
            nextstate = AR;
    end
    READ:begin
        if(data_ok)
            nextstate = IDLE;
        else
            nextstate = READ;
    end
    AW:begin
        if(awready)
            nextstate = WRITE;
        else
            nextstate = AW;
    end
    WRITE:begin
        if(data_ok)
            nextstate = IDLE;
        else
            nextstate = WRITE;
    end
    default:
        nextstate = IDLE;
    endcase
end
always @(posedge clk) begin
    if (reset) begin
        // reset
        addr_reg <= 32'd0;
        wdata_reg <= 32'd0;
        wstrb_reg <= 4'd0;
        size_reg <= 2'd0;
    end
    else if (data_req && !is_cached && addr_ok) begin
        addr_reg <= dcache_addr;
        wdata_reg <= data_wdata;
        wstrb_reg <= data_wstrb;
        size_reg <= data_size;
    end
end

assign arid     = 4'd11;
assign araddr   = addr_reg;
assign arlen    = 8'd0;
assign arsize   = {1'b0, size_reg};
assign arburst  = 2'b00;
assign arvalid  = state == AR;

assign rready = state == READ;

assign awid     = 4'd7;
assign awlen    = 8'd0;
assign awburst  = 2'b00;
assign awsize   = {1'b0, size_reg};
assign awaddr   = addr_reg;
assign awvalid  = state == AW;


assign wdata    = wdata_reg;
assign wvalid   = state == WRITE;
assign wlast    = 1'b1;
assign wstrb    = wstrb_reg;

assign bready   = 1'b1;

endmodule


module ysyx_210101_inst_cache_control(
	input 			clk,
	input 			reset,
	////cpu_control
	input           inst_req,
    input   [ 1:0]  inst_size,
    input           inst_op,
    input   [ 6:0]  inst_index,
    input   [19:0]  inst_tag,
    input   [ 4:0]  inst_offset,
    input   [ 3:0]  inst_wstrb,
    input   [31:0]  inst_wdata,
    output          inst_addr_ok,
    output          inst_data_ok,
    output  [31:0]  inst_rdata,
    input           inst_cache,

    //// dcache interface

    output           icache_req,
    input            icache_addr_ok,
    input            icache_data_ok,
    input    [31:0]  icache_rdata,
    
    //// uncache inst axi control
    output  [3 :0]  arid   ,
    output  [31:0]  araddr,
    output  [7 :0]  arlen  ,
    output  [2 :0]  arsize ,
    output  [1 :0]  arburst,
    output          arvalid,
    input           arready,
    //r
    input [3 :0]  rid    ,
    input [31:0]  rdata  ,
    input [1 :0]  rresp ,
    input         rlast ,
    input         rvalid ,
    output        rready ,
    //aw
    output  [3 :0]  awid   ,
    output  [31:0]  awaddr ,
    output  [7 :0]  awlen  ,
    output  [2 :0]  awsize ,
    output  [1 :0]  awburst,
    output          awvalid,
    input           awready,
    //w
    output  [31:0]  wdata  ,
    output  [3 :0]  wstrb  ,
    output          wlast  ,
    output          wvalid ,
    input           wready ,
    //b
    input [3 :0]  bid    ,
    input [1 :0]  bresp  ,
    input         bvalid ,
    output        bready 

	);

wire [31:0] icache_addr;
wire        is_cached;
reg  [31:0]  addr_reg;
wire         addr_ok;
wire         data_ok;
reg         icache_working;
reg [2:0]   state;
reg [2:0]   nextstate;
parameter   IDLE = 3'd1;
parameter   AR   = 3'd2;
parameter   READ = 3'd3;

assign icache_addr = {inst_tag,inst_index,inst_offset};
assign icache_req = inst_req && is_cached;

assign is_cached = 1'b0;

assign addr_ok =  state == IDLE && !is_cached && !icache_working;
assign data_ok =  rlast &&  rready &&  rvalid;
assign inst_addr_ok = (is_cached)? icache_addr_ok : addr_ok;
assign inst_data_ok = (icache_working)? icache_data_ok : data_ok;
assign inst_rdata = (icache_working)? icache_rdata : rdata;

always @(posedge clk) begin
    if (reset) begin
        // reset
        icache_working <= 1'b0;
    end
    else if (inst_req && is_cached) begin
        icache_working <= 1'b1;
    end
    else if (icache_data_ok)
        icache_working <= 1'b0;
end

always @(posedge clk) begin
    if (reset) begin
        // reset
         state <= IDLE;
    end
    else
         state <= nextstate;
end
always @(*) begin
    case( state)
    IDLE:begin
        if(inst_req && !is_cached && addr_ok  )begin
             nextstate = AR;
        end
        else begin
             nextstate = IDLE;
        end
    end
    AR:begin
        if(arready&&arvalid)
             nextstate = READ;
        else
             nextstate = AR;
    end
    READ:begin
        if(data_ok)
             nextstate = IDLE;
        else
             nextstate = READ;
    end
    default:
         nextstate = IDLE;
    endcase
end
always @(posedge clk) begin
    if (reset) begin
        // reset
         addr_reg <= 32'd0;
    end
    else if (inst_req && !is_cached && addr_ok) begin
        addr_reg <= icache_addr;
    end
end

// not use
assign awid     = 4'd0;
assign awlen    = 8'b0;
assign awburst  = 2'b0;
assign awaddr   = 32'b0;
assign awvalid  = 1'b0;
assign awsize   = 3'd2;

assign wdata    = 32'b0;
assign wstrb    = 4'b0;
assign wvalid   = 1'b0;
assign wlast    = 1'b0;

assign bready   = 1'b0;

// axi read
assign arid     = 4'd3;
assign araddr   = {addr_reg[31:2],2'd0};
assign arlen    = 8'd0;
assign arsize   = 3'd2; 
assign arburst  = 2'b00;
assign arvalid  = state == AR;

assign rready   = state == READ;

endmodule

/*import "DPI-C" function void pc_read(longint pc);
module PC_Read (
  input             clock,
  input             rst,
  input reg [31:0]  pc
);
  always@(posedge clock) begin
    if (!rst) pc_read({32'b0,pc});
  end
endmodule*/