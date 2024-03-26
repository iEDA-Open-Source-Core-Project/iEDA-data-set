
`define YSYX210438_AXI_ADDR_WIDTH      32
`define YSYX210438_AXI_DATA_WIDTH      64
`define YSYX210438_AXI_ID_WIDTH        4
`define YSYX210438_AXI_USER_WIDTH      1024

//# RV32I opcode field
`define YSYX210438_OP_IMM      7'b001_0011
`define YSYX210438_LUI         7'b011_0111
`define YSYX210438_AUIPC       7'b001_0111
`define YSYX210438_OP          7'b011_0011
`define YSYX210438_JAL         7'b110_1111
`define YSYX210438_JALR        7'b110_0111
`define YSYX210438_BRANCH      7'b110_0011
`define YSYX210438_LOAD        7'b000_0011
`define YSYX210438_STORE       7'b010_0011
`define YSYX210438_MISC_MEM    7'b000_1111
`define YSYX210438_SYSTEM      7'b111_0011

//# RV64I extended opcode field
`define YSYX210438_OP_IMM_32   7'b001_1011
`define YSYX210438_OP_32       7'b011_1011

`define YSYX210438_BUS_WIDTH   63:0
`define YSYX210438_ZERO_WORD   64'd0

//# CSR addr
`define YSYX210438_M_CYCLE     12'hb00    
`define YSYX210438_MSTATUS     12'h300
`define YSYX210438_MIE         12'h304
`define YSYX210438_MTVEC       12'h305    
`define YSYX210438_MEPC        12'h341
`define YSYX210438_MCAUSE      12'h342
`define YSYX210438_MTVAL       12'h343
`define YSYX210438_MINSTRET    12'hb02
`define YSYX210438_MSCRATCH    12'h340
`define YSYX210438_MIP         12'h344

module ysyx_210438(
    input         clock			,
    input         reset			,
	input         io_interrupt 	,

    input                               io_master_awready ,
    output                              io_master_awvalid ,
    output [31:0]        				io_master_awaddr  ,
    //output [2:0]                        top_aw_bits_prot  ,
    output [3:0]          				io_master_awid    ,
    //output [`YSYX210438_AXI_USER_WIDTH-1:0]        top_aw_bits_user  ,
    output [7:0]                        io_master_awlen   ,
    output [2:0]                        io_master_awsize  ,
    output [1:0]                        io_master_awburst ,
    //output                              top_aw_bits_lock  ,
    //output [3:0]                        top_aw_bits_cache ,
    //output [3:0]                        top_aw_bits_qos   ,
    
    input                               io_master_wready  ,
    output                              io_master_wvalid  ,
    output [63:0]       				io_master_wdata   ,
    output [7:0]      					io_master_wstrb   ,
    output                              io_master_wlast   ,
    
    output                              io_master_bready  ,
    input                               io_master_bvalid  ,
    input  [1:0]                        io_master_bresp   ,
    input  [3:0]			          	io_master_bid     ,
    //input  [`YSYX210438_AXI_USER_WIDTH-1:0]        top_b_bits_user   ,

    input                               io_master_arready ,
    output                              io_master_arvalid ,
    output [31:0]        				io_master_araddr  ,
    //output [2:0]                        top_ar_bits_prot  ,
    output [3:0]          				io_master_arid    ,
    //output [`YSYX210438_AXI_USER_WIDTH-1:0]        top_ar_bits_user  ,
    output [7:0]                        io_master_arlen   ,
    output [2:0]                        io_master_arsize  ,
    output [1:0]                        io_master_arburst ,
    //output                              top_ar_bits_lock  ,
    //output [3:0]                        top_ar_bits_cache ,
    //output [3:0]                        top_ar_bits_qos   ,
    
    output                              io_master_rready  ,
    input                               io_master_rvalid  ,
    input  [1:0]                        io_master_rresp   ,
    input  [63:0]       		 		io_master_rdata   ,
    input                               io_master_rlast   ,
    input  [3:0]          				      io_master_rid     ,
    //input  [`YSYX210438_AXI_USER_WIDTH-1:0]        top_r_bits_user 



    output                             	io_slave_awready ,
    input                              	io_slave_awvalid ,
    input [31:0]        			   	io_slave_awaddr  ,
    //input [2:0]                        top_aw_bits_prot  ,
    input [3:0]          				io_slave_awid    ,
    //input [`YSYX210438_AXI_USER_WIDTH-1:0]        top_aw_bits_user  ,
    input [7:0]                        	io_slave_awlen   ,
    input [2:0]                        	io_slave_awsize  ,
    input [1:0]                        	io_slave_awburst ,
    //input                              top_aw_bits_lock  ,
    //input [3:0]                        top_aw_bits_cache ,
    //input [3:0]                        top_aw_bits_qos   ,
    
    output                              io_slave_wready  ,
    input                              	io_slave_wvalid  ,
    input [63:0]        				io_slave_wdata   ,
    input [7:0]      					io_slave_wstrb   ,
    input                              	io_slave_wlast   ,
    
    input                              	io_slave_bready  ,
    output                              io_slave_bvalid  ,
    output  [1:0]                       io_slave_bresp   ,
    output  [3:0]          				io_slave_bid     ,
    //output  [`YSYX210438_AXI_USER_WIDTH-1:0]        top_b_bits_user   ,

    output                              io_slave_arready ,
    input                              	io_slave_arvalid ,
    input [31:0]        				io_slave_araddr  ,
    //input [2:0]                        top_ar_bits_prot  ,
    input [3:0]          				io_slave_arid    ,
    //input [`YSYX210438_AXI_USER_WIDTH-1:0]        top_ar_bits_user  ,
    input [7:0]                        	io_slave_arlen   ,
    input [2:0]                        	io_slave_arsize  ,
    input [1:0]                        	io_slave_arburst ,
    //input                              top_ar_bits_lock  ,
    //input [3:0]                        top_ar_bits_cache ,
    //input [3:0]                        top_ar_bits_qos   ,
    
    input                              	io_slave_rready  ,
    output                              io_slave_rvalid  ,
    output  [1:0]                       io_slave_rresp   ,
    output  [63:0]       				io_slave_rdata   ,
    output                              io_slave_rlast   ,
    output  [3:0]         				io_slave_rid     
    //output  [`YSYX210438_AXI_USER_WIDTH-1:0]        top_r_bits_user 
  // ......
);


// AXI parameter
// localparam   DATA_WIDTH  = 64  ;             // 数据位宽
// localparam   ADDR_WIDTH  = 64  ;             // 地址位宽              
// localparam   ID_WIDTH    = 4   ;             // ID位宽
// localparam   USER_WIDTH  = 1024;             // USER位宽
// localparam   STRB_WIDTH  = 8   ;

// unuseful port
// wire [2:0]                        top_aw_bits_prot  ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]        top_aw_bits_user  ;
// wire                              top_aw_bits_lock  ;
// wire [3:0]                        top_aw_bits_cache ;
// wire [3:0]                        top_aw_bits_qos   ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]        top_b_bits_user   ;
// wire [2:0]                        top_ar_bits_prot  ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]        top_ar_bits_user  ;
// wire                              top_ar_bits_lock  ;
// wire [3:0]                        top_ar_bits_cache ;
// wire [3:0]                        top_ar_bits_qos   ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]        top_r_bits_user   ;

// assign top_b_bits_user =1024'd0 ;
// assign top_r_bits_user =1024'd0 ;

// cpu port
wire [31:0]	inst            ;
wire        inst_valid      ;
wire [`YSYX210438_AXI_ADDR_WIDTH-1-2:0]	inst_addr       ;
// wire		inst_ena        ;
wire        inst_addr_valid ;

wire		    data_wr_en      ;
wire		    data_rd_en      ;
wire [7:0]	data_wmask      ;
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]	data_addr       ;
wire [63:0]	data_wr         ;
wire [63:0]	data_rd         ;
wire        data_rd_valid   ;
wire        data_wr_ready   ;


wire		w_dmem_data_wr_en ;
wire		w_dmem_data_rd_en ;
wire [7:0]	w_dmem_data_wmask ;
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]	w_dmem_data_addr  ;
wire [63:0]	w_dmem_data_wr    ;
wire [63:0]	w_dmem_data_rd    ;
wire		w_dmem_data_rd_valid ;
wire		w_dmem_data_wr_ready ;

wire		w_clint_data_wr_en    ;
wire		w_clint_data_rd_en    ;
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]	w_clint_data_addr     ;
wire [63:0]	w_clint_data_wr       ;
wire [63:0]	w_clint_data_rd       ;
wire		w_clint_rd_data_valid ;
wire		w_clint_wr_ready      ;

// ysyx_210438_mem_ctrl port
wire		data_wr_en_ram    ;
wire		data_rd_en_ram    ;
wire [7:0]	data_wmask_ram    ;
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]	data_addr_ram     ;
wire [63:0]	data_wr_ram       ;
wire [63:0]	data_rd_ram       ;

// timer IRQ PORT
wire   w_clint_timer_irq ;
wire   w_timer_irq_ready ;  // only for timer interrupt

// TOP AXI interface 
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]  ar_addr   ;
wire                        ar_valid  ;
wire                        ar_ready  ;
wire [7:0]                  ar_len    ;
wire [`YSYX210438_AXI_ID_WIDTH-1:0]    ar_id     ;
wire [2:0]                  ar_size   ;
wire [1:0]                  ar_burst  ;
// wire                        ar_lock   ;
// wire [3:0]                  ar_cache  ;
// wire [2:0]                  ar_prot   ;
// wire [3:0]                  ar_qos    ;
// wire [3:0]                  ar_region ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  ar_user   ;

wire [`YSYX210438_AXI_DATA_WIDTH-1:0]  r_data    ;   
wire                        r_last    ; 
wire                        r_valid   ;
wire                        r_ready   ;
wire [`YSYX210438_AXI_ID_WIDTH-1:0]    r_id      ;
// wire [1:0]                  r_resp    ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  r_user    ;

wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]  aw_addr   ;
wire                        aw_valid  ;
wire                        aw_ready  ;
wire [7:0]                  aw_len    ;
wire [`YSYX210438_AXI_ID_WIDTH-1:0]    aw_id     ;
wire [2:0]                  aw_size   ;
wire [1:0]                  aw_burst  ;
// wire                        aw_lock   ; 
// wire [3:0]                  aw_cache  ;   
// wire [2:0]                  aw_prot   ;
// wire [3:0]                  aw_qos    ;
// wire [3:0]                  aw_region ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  aw_user   ;

wire [`YSYX210438_AXI_DATA_WIDTH-1:0]  w_data    ;
wire                        w_last    ;
wire                        w_valid   ;
wire                        w_ready   ;
wire [`YSYX210438_AXI_DATA_WIDTH/8-1:0]w_strb    ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  w_user    ;

// wire [`YSYX210438_AXI_ID_WIDTH-1:0]    b_id      ;  
// wire [1:0]                  b_resp    ;
wire                        b_valid   ;
wire                        b_ready   ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  b_user    ;

// Instruction fetch AXI interface 
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]  if_axi_ar_addr   ;
wire                        if_axi_ar_valid  ;
wire                        if_axi_ar_ready  ;
wire [7:0]                  if_axi_ar_len    ;
wire [`YSYX210438_AXI_ID_WIDTH-1:0]    if_axi_ar_id     ;
wire [2:0]                  if_axi_ar_size   ;
wire [1:0]                  if_axi_ar_burst  ;
// wire                        if_axi_ar_lock   ;
// wire [3:0]                  if_axi_ar_cache  ;
// wire [2:0]                  if_axi_ar_prot   ;
// wire [3:0]                  if_axi_ar_qos    ;
// wire [3:0]                  if_axi_ar_region ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  if_axi_ar_user   ;

wire [`YSYX210438_AXI_DATA_WIDTH-1:0]  if_axi_r_data    ;   
wire                        if_axi_r_last    ; 
wire                        if_axi_r_valid   ;
wire                        if_axi_r_ready   ;
// wire [`YSYX210438_AXI_ID_WIDTH-1:0]    if_axi_r_id      ;
// wire [1:0]                  if_axi_r_resp    ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  if_axi_r_user    ;

// Mem AXI interface 
wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]  mem_axi_ar_addr   ;
wire                        mem_axi_ar_valid  ;
wire                        mem_axi_ar_ready  ;
wire [7:0]                  mem_axi_ar_len    ;
wire [`YSYX210438_AXI_ID_WIDTH-1:0]    mem_axi_ar_id     ;
wire [2:0]                  mem_axi_ar_size   ;
wire [1:0]                  mem_axi_ar_burst  ;
// wire                        mem_axi_ar_lock   ;
// wire [3:0]                  mem_axi_ar_cache  ;
// wire [2:0]                  mem_axi_ar_prot   ;
// wire [3:0]                  mem_axi_ar_qos    ;
// wire [3:0]                  mem_axi_ar_region ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  mem_axi_ar_user   ;

wire [`YSYX210438_AXI_DATA_WIDTH-1:0]  mem_axi_r_data    ;   
// wire                        mem_axi_r_last    ; 
wire                        mem_axi_r_valid   ;
wire                        mem_axi_r_ready   ;
// wire [`YSYX210438_AXI_ID_WIDTH-1:0]    mem_axi_r_id      ;
// wire [1:0]                  mem_axi_r_resp    ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  mem_axi_r_user    ;

wire [`YSYX210438_AXI_ADDR_WIDTH-1:0]  mem_axi_aw_addr   ;
wire                        mem_axi_aw_valid  ;
wire                        mem_axi_aw_ready  ;
wire [7:0]                  mem_axi_aw_len    ;
wire [`YSYX210438_AXI_ID_WIDTH-1:0]    mem_axi_aw_id     ;
wire [2:0]                  mem_axi_aw_size   ;
wire [1:0]                  mem_axi_aw_burst  ;
// wire                        mem_axi_aw_lock   ; 
// wire [3:0]                  mem_axi_aw_cache  ;   
// wire [2:0]                  mem_axi_aw_prot   ;
// wire [3:0]                  mem_axi_aw_qos    ;
// wire [3:0]                  mem_axi_aw_region ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  mem_axi_aw_user   ;

wire [`YSYX210438_AXI_DATA_WIDTH-1:0]  mem_axi_w_data    ;
wire                        mem_axi_w_last    ;
wire                        mem_axi_w_valid   ;
wire                        mem_axi_w_ready   ;
wire [`YSYX210438_AXI_DATA_WIDTH/8-1:0]mem_axi_w_strb    ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  mem_axi_w_user    ;

// wire [`YSYX210438_AXI_ID_WIDTH-1:0]    mem_axi_b_id      ;  
// wire [1:0]                  mem_axi_b_resp    ;
wire                        mem_axi_b_valid   ;
wire                        mem_axi_b_ready   ;
// wire [`YSYX210438_AXI_USER_WIDTH-1:0]  mem_axi_b_user    ;

// ysyx_210438_axi_interconnect to top (assign)

assign ar_ready                  = io_master_arready;
assign io_master_arvalid         = ar_valid;
assign io_master_araddr          = ar_addr[31:0];
// assign top_ar_bits_prot          = ar_prot;
assign io_master_arid            = ar_id;
// assign top_ar_bits_user          = ar_user;
assign io_master_arlen           = ar_len;
assign io_master_arsize          = ar_size;
assign io_master_arburst         = ar_burst;
// assign top_ar_bits_lock          = ar_lock;
// assign top_ar_bits_cache         = ar_cache;
// assign top_ar_bits_qos           = ar_qos;
    
assign io_master_rready          = r_ready;
assign r_valid                   = io_master_rvalid ;
// assign r_resp                    = io_master_rresp ;
assign r_data                    = io_master_rdata ;
assign r_last                    = io_master_rlast ;
assign r_id                      = io_master_rid   ;
// assign r_user                    = top_r_bits_user ;

assign aw_ready                  =   io_master_awready  ;
assign io_master_awaddr          =   aw_addr[31:0]   ;
assign io_master_awvalid         =   aw_valid  ;

assign io_master_awlen           =   aw_len    ;
assign io_master_awid            =   aw_id     ;
assign io_master_awsize          =   aw_size   ;
assign io_master_awburst         =   aw_burst  ;
// assign top_aw_bits_lock          =   aw_lock   ;
// assign top_aw_bits_cache         =   aw_cache  ;
// assign top_aw_bits_prot          =   aw_prot   ;
// assign top_aw_bits_qos           =   aw_qos    ;
                                      //aw_region 
// assign top_aw_bits_user          =   aw_user   ;

assign w_ready                   = io_master_wready ;
assign io_master_wdata           = w_data      ;
assign io_master_wlast           = w_last      ;
assign io_master_wvalid          = w_valid     ;
assign io_master_wstrb           = w_strb      ;

assign io_master_bready          = b_ready          ;
assign b_valid                   = io_master_bvalid ;
// assign b_resp                    = io_master_bresp  ;
// assign b_id                      = io_master_bid    ;
// assign b_user                    = top_b_bits_user  ;

assign io_slave_awready = 0 ;
assign io_slave_wready  = 0 ;
assign io_slave_bvalid  = 0 ;
assign io_slave_bresp   = 2'b00;
assign io_slave_bid     = 4'b0000;
assign io_slave_arready = 1'b0 ;

assign io_slave_rvalid  = 1'b0  ;
assign io_slave_rresp   = 2'b00 ;  
assign io_slave_rdata   = 64'd0 ;  
assign io_slave_rlast   = 1'b0  ;  
assign io_slave_rid     = 4'd0  ;


ysyx_210438_riscv #(
	.IBUS_DATA_WIDTH(32),               // instruction bus data width
    .DBUS_DATA_WIDTH(64),               // data bus data width
    .RF_ADDR_WIDTH  (5),       // register file address width
    .IMEM_ADDR_WIDTH(`YSYX210438_AXI_ADDR_WIDTH),     // instruction memory address width
    .DMEM_ADDR_WIDTH(`YSYX210438_AXI_ADDR_WIDTH)     // data memory address width
) U_RISCV(
	.clk		(clock),
	.sft_rst	(reset),     // synchronous reset
	
    // INST and DATA port
	.i_inst   		  (inst           ),
  	.i_inst_valid     (inst_valid     ),
	.o_inst_addr      (inst_addr      ),
  	.o_inst_addr_valid(inst_addr_valid),

	.o_data_wr_en  	(data_wr_en),
	.o_data_rd_en  	(data_rd_en),
  	.o_data_wmask 	(data_wmask),
	.o_data_addr  	(data_addr ),
	.o_data_wr    	(data_wr   ),
	.i_data_rd      (data_rd   ),
  	.i_data_rd_valid(data_rd_valid),
  	.i_data_wr_ready(data_wr_ready),
  
  	.i_clint_timer_irq(w_clint_timer_irq),
  	.o_timer_irq_ready(w_timer_irq_ready)    // only for timer interrupt
	
);

ysyx_210438_if_axi_rw #(
    .DATA_WIDTH(64  ) ,  //数据位宽
    .ADDR_WIDTH(`YSYX210438_AXI_ADDR_WIDTH  ) ,  //地址位宽              
    .ID_WIDTH  (4   )   //ID位宽
    // .USER_WIDTH(1024)    //USER位宽
) U_IF_AXI_RW (
	.clk				(clock) , // input           	
	.rst				(reset) , // input	   	 

	.inst				(inst           ) , // output	 [31:0]				  
	.inst_addr			(inst_addr[`YSYX210438_AXI_ADDR_WIDTH-1-2:0] ) , // input	 [63:0]		
	.inst_valid		  	(inst_valid     ) , // output
	.inst_addr_valid	(inst_addr_valid) , // input	   	   				
	
	.M00_AXI_ARADDR               (if_axi_ar_addr   ),  // output reg [ADDR_WIDTH-1:0]      
	.M00_AXI_ARVALID              (if_axi_ar_valid  ),  // output reg                       
	.M00_AXI_ARREADY              (if_axi_ar_ready  ),  // input                            
	.M00_AXI_ARLEN                (if_axi_ar_len    ),  // output     [7:0]               
	.M00_AXI_ARID                 (if_axi_ar_id     ),  // output     [ID_WIDTH-1:0]        
	.M00_AXI_ARSIZE               (if_axi_ar_size   ),  // output     [2:0]                 
	.M00_AXI_ARBURST              (if_axi_ar_burst  ),  // output     [1:0]                 
	// .M00_AXI_ARLOCK               (if_axi_ar_lock   ),  // output                           
	// .M00_AXI_ARCACHE              (if_axi_ar_cache  ),  // output     [3:0]                 
	// .M00_AXI_ARPROT               (if_axi_ar_prot   ),  // output     [2:0]                 
	// .M00_AXI_ARQOS                (if_axi_ar_qos    ),  // output     [3:0]               
	// .M00_AXI_ARREGION             (if_axi_ar_region ),  // output     [3:0]              
    // .M00_AXI_ARUSER			     (if_axi_ar_user   ),  // output     [USER_WIDTH-1:0]   
		      
	.M00_AXI_RDATA                (if_axi_r_data    ),  // input      [DATA_WIDTH-1:0]      
	.M00_AXI_RLAST                (if_axi_r_last    ),  // input                            
	.M00_AXI_RVALID               (if_axi_r_valid   ),  // input                            
	.M00_AXI_RREADY               (if_axi_r_ready   )   // output                         
	// .M00_AXI_RID                  (if_axi_r_id      )   // input      [ID_WIDTH-1:0]        
	// .M00_AXI_RRESP                (if_axi_r_resp    )   // input      [1:0]               
	// .M00_AXI_RUSER				 (if_axi_r_user    )   // input      [USER_WIDTH-1:0]	  
);


ysyx_210438_riscv_router #(
  	.DBUS_DATA_WIDTH (64),
  	.DMEM_ADDR_WIDTH (`YSYX210438_AXI_ADDR_WIDTH)
) U_RISCV_ROUTER(

  	.i_core_data_wr_en    (data_wr_en   ),
  	.i_core_data_rd_en    (data_rd_en   ),
  	.i_core_data_mask     (data_wmask   ),
  	.i_core_addr          (data_addr    ),
  	.i_core_wdata         (data_wr      ),
  	.o_core_rdata         (data_rd      ),
  	.o_core_rdata_valid   (data_rd_valid),  
  	.o_core_data_wr_ready (data_wr_ready),

  	.o_port0_wr_en        (w_dmem_data_wr_en    ), // to  ysyx_210438_mem_ctrl 
  	.o_port0_rd_en        (w_dmem_data_rd_en    ), // to  ysyx_210438_mem_ctrl
  	.o_port0_data_mask    (w_dmem_data_wmask    ), // to ysyx_210438_mem_axi_rw 
  	.o_port0_addr         (w_dmem_data_addr     ), // to or ysyx_210438_mem_ctrl
  	.o_port0_wdata        (w_dmem_data_wr       ), // to  ysyx_210438_mem_ctrl
  	.i_port0_rdata        (w_dmem_data_rd       ), // to  ysyx_210438_mem_ctrl
  	.i_port0_rdata_valid  (w_dmem_data_rd_valid ), // to ysyx_210438_mem_axi_rw   
  	.i_port0_wr_ready	    (w_dmem_data_wr_ready ), // to ysyx_210438_mem_axi_rw   

  	.o_port1_wr_en        (w_clint_data_wr_en   ),
  	.o_port1_rd_en        (w_clint_data_rd_en   ),
  	.o_port1_addr         (w_clint_data_addr    ),
  	.o_port1_wdata        (w_clint_data_wr      ),
  	.i_port1_rdata        (w_clint_data_rd      ),
  	.i_port1_rdata_valid  (w_clint_rd_data_valid),
  	.i_port1_wr_ready     (w_clint_wr_ready     )

);


ysyx_210438_riscv_clint #(
  	.ADDR_WIDTH  (`YSYX210438_AXI_ADDR_WIDTH),
  	.D_BUS_WIDTH (64)
)U_RISCV_CLINT(
  	.clk                  (clock                  ),
  	.rst                  (reset                  ),
  	.wr_en                (w_clint_data_wr_en     ),
  	.rd_en                (w_clint_data_rd_en     ),
  	.rw_addr              (w_clint_data_addr      ),
  	.wr_data              (w_clint_data_wr        ),
  	.rd_data              (w_clint_data_rd        ),
  	.o_clint_rd_data_valid(w_clint_rd_data_valid  ),
  	.o_clint_wr_ready     (w_clint_wr_ready       ),
  	.i_core_ready         (w_timer_irq_ready      ),
  	.o_clint_timer_irq    (w_clint_timer_irq      )  

);
     
ysyx_210438_mem_ctrl U_mem_ctrl(
  	.rst(reset),
  	// CPU端接口
  	.mem_byte_enble (w_dmem_data_wmask ),
  	.mem_addr       (w_dmem_data_addr  ),
  	.mem_rd_en      (w_dmem_data_rd_en ),
  	.mem_wr_en      (w_dmem_data_wr_en ),
  	.mem_wr_data    (w_dmem_data_wr    ),
  	.mem_rd_data    (w_dmem_data_rd    ),
  	// 内存接口
  	.ram_addr   (data_addr_ram  ) ,
  	.ram_wr_en  (data_wr_en_ram ) ,
  	.ram_wmask  (data_wmask_ram ) , 
  	.ram_wr_data(data_wr_ram    ) ,
  	.ram_rd_en  (data_rd_en_ram ) ,
  	.ram_rd_data(data_rd_ram    )   
);  

ysyx_210438_mem_axi_rw #(
	.DATA_WIDTH(64  ),             	//数据位宽
	.ADDR_WIDTH(`YSYX210438_AXI_ADDR_WIDTH  ),               //地址位宽              
	.ID_WIDTH  (4   ),               	//ID位宽
	// .USER_WIDTH(1024),             //USER位宽
	.STRB_WIDTH(8   )
) U_MEM_AXI_RW(
	.clk			                    (clock),
	.rst			                    (reset),

	.data_addr  				(data_addr_ram        ), //input  [63:0] 	  		    
	.data_rd_addr_valid         (data_rd_en_ram       ), //input 					          
	.data_rd     				(data_rd_ram          ), //output [DATA_WIDTH-1:0]   
	.data_rd_valid				(w_dmem_data_rd_valid ), //output					          
	.data_wr_valid  		    (data_wr_en_ram       ), //input 					          
    .data_wmask 				(data_wmask_ram       ), //input  [7:0] 		  	      
	.data_wr    				(data_wr_ram          ), //input  [DATA_WIDTH-1:0]   
	.data_wr_ready				(w_dmem_data_wr_ready ), //output	reg				        
	
  	.M01_AXI_ARADDR               (mem_axi_ar_addr   ),	//output [ADDR_WIDTH-1:0]      
  	.M01_AXI_ARVALID              (mem_axi_ar_valid  ),	//output                       
  	.M01_AXI_ARREADY              (mem_axi_ar_ready  ),	//input                        
  	.M01_AXI_ARLEN                (mem_axi_ar_len    ),	//output [7:0]               
  	.M01_AXI_ARID                 (mem_axi_ar_id     ),	//output [ID_WIDTH-1:0]        
  	.M01_AXI_ARSIZE               (mem_axi_ar_size   ),	//output [2:0]                 
  	.M01_AXI_ARBURST              (mem_axi_ar_burst  ),	//output [1:0]                 
  	// .M01_AXI_ARLOCK               (mem_axi_ar_lock   ),	//output                       
  	// .M01_AXI_ARCACHE              (mem_axi_ar_cache  ),	//output [3:0]                 
  	// .M01_AXI_ARPROT               (mem_axi_ar_prot   ),	//output [2:0]                 
  	// .M01_AXI_ARQOS                (mem_axi_ar_qos    ),	//output [3:0]               
  	// .M01_AXI_ARREGION             (mem_axi_ar_region ),	//output [3:0]              
  	// .M01_AXI_ARUSER			   	 (mem_axi_ar_user   ), //output [USER_WIDTH-1:0]   
	
	.M01_AXI_RDATA                (mem_axi_r_data    ), //input [DATA_WIDTH-1:0]       
	// .M01_AXI_RLAST             	 (mem_axi_r_last    ), //input                        
	.M01_AXI_RVALID               (mem_axi_r_valid   ), //input                        
	.M01_AXI_RREADY               (mem_axi_r_ready   ), //output                     
	// .M01_AXI_RID                  (mem_axi_r_id      ), //input [ID_WIDTH-1:0]         
	// .M01_AXI_RRESP                (mem_axi_r_resp    ), //input [1:0]                
	// .M01_AXI_RUSER				 (mem_axi_r_user    ), //input [USER_WIDTH-1:0]	  

	.M01_AXI_AWADDR               (mem_axi_aw_addr   ), //output [ADDR_WIDTH-1:0]    
	.M01_AXI_AWVALID              (mem_axi_aw_valid  ), //output                     
	.M01_AXI_AWREADY              (mem_axi_aw_ready  ), //input                      
	.M01_AXI_AWLEN                (mem_axi_aw_len    ), //output [7:0]               
	.M01_AXI_AWID                 (mem_axi_aw_id     ), //output [ID_WIDTH-1:0]      
	.M01_AXI_AWSIZE               (mem_axi_aw_size   ), //output [2:0]               
	.M01_AXI_AWBURST              (mem_axi_aw_burst  ), //output [1:0]               
	// .M01_AXI_AWLOCK               (mem_axi_aw_lock   ), //output                     
	// .M01_AXI_AWCACHE              (mem_axi_aw_cache  ), //output [3:0]               
	// .M01_AXI_AWPROT               (mem_axi_aw_prot   ), //output [2:0]               
	// .M01_AXI_AWQOS                (mem_axi_aw_qos    ), //output [3:0]              	
	// .M01_AXI_AWREGION			 (mem_axi_aw_region ), //output [3:0]              
    // .M01_AXI_AWUSER				 (mem_axi_aw_user   ), //output [USER_WIDTH-1:0]   
	
	.M01_AXI_WDATA                (mem_axi_w_data    ), //output [DATA_WIDTH-1:0] 
	.M01_AXI_WLAST                (mem_axi_w_last    ), //output                  
	.M01_AXI_WVALID               (mem_axi_w_valid   ), //output                  
	.M01_AXI_WREADY               (mem_axi_w_ready   ), //input                   
	.M01_AXI_WSTRB                (mem_axi_w_strb    ), //output [STRB_WIDTH-1:0] 
  	// .M01_AXI_WUSER				     (mem_axi_w_user    ), //output [USER_WIDTH-1:0]	
	
	// .M01_AXI_BID                  (mem_axi_b_id      ), //input [USER_WIDTH-1:0] 
	// .M01_AXI_BRESP                (mem_axi_b_resp    ), //input [1:0]            
	.M01_AXI_BVALID               (mem_axi_b_valid   ), //input                  
	.M01_AXI_BREADY               (mem_axi_b_ready   )  //output                 
	// .M01_AXI_BUSER			     (mem_axi_b_user    )  //input [USER_WIDTH-1:0]	  	
);

ysyx_210438_axi_interconnect #(
    .DATA_WIDTH  (64   ),   //数据位宽
    .ADDR_WIDTH  (`YSYX210438_AXI_ADDR_WIDTH   ),   //地址位宽              
    .ID_WIDTH    (4    ),   //ID位宽
    // .USER_WIDTH  (1024 ),   //USER位宽
    .STRB_WIDTH  (8    ) 	//STRB位宽
) U_AXI_INTERCONNECT (
	
	.clk                          (clock),   
	.sft_rst                      (reset),

    /**********master0:if_axi port**********/

	.S00_AXI_ARADDR               (if_axi_ar_addr   ), // input 		[ADDR_WIDTH-1:0]      
	.S00_AXI_ARVALID              (if_axi_ar_valid  ), // input                    	      
	.S00_AXI_ARREADY              (if_axi_ar_ready  ), // output reg               	      
	.S00_AXI_ARLEN                (if_axi_ar_len    ), // input 		[7:0]               
	.S00_AXI_ARID                 (if_axi_ar_id     ), // input 		[3:0]                 
	.S00_AXI_ARSIZE               (if_axi_ar_size   ), // input 		[2:0]                 
	.S00_AXI_ARBURST              (if_axi_ar_burst  ), // input 		[1:0]                 
	// .S00_AXI_ARLOCK               (if_axi_ar_lock   ), // input 		                      
	// .S00_AXI_ARCACHE              (if_axi_ar_cache  ), // input 		[3:0]                 
	// .S00_AXI_ARPROT               (if_axi_ar_prot   ), // input 		[2:0]                 
	// .S00_AXI_ARQOS                (if_axi_ar_qos    ), // input 		[3:0]               
	// .S00_AXI_ARREGION             (if_axi_ar_region ), // input 		[3:0]              
  	// .S00_AXI_ARUSER				 (if_axi_ar_user   ), // input 		[USER_WIDTH-1:0]   
	
	.S00_AXI_RDATA                (if_axi_r_data    ), // output reg	[DATA_WIDTH-1:0]     
	.S00_AXI_RLAST                (if_axi_r_last    ), // output reg                       
	.S00_AXI_RVALID               (if_axi_r_valid   ), // output reg                       
	.S00_AXI_RREADY               (if_axi_r_ready   ), // input                    	     
	// .S00_AXI_RID                  (if_axi_r_id      ), // output reg  [3:0]                
	// .S00_AXI_RRESP                (if_axi_r_resp    ), // output reg	[1:0]              
	// .S00_AXI_RUSER				 (if_axi_r_user    ), // output reg	[USER_WIDTH-1:0]   

    /**********master1:mem axi port **********/	

	.S01_AXI_ARADDR               (mem_axi_ar_addr   ),  // input 		[ADDR_WIDTH-1:0]      
	.S01_AXI_ARVALID              (mem_axi_ar_valid  ),  // input 		                      
	.S01_AXI_ARREADY              (mem_axi_ar_ready  ),  // output reg		                  
	.S01_AXI_ARLEN                (mem_axi_ar_len    ),  // input 		[7:0]               
	.S01_AXI_ARID                 (mem_axi_ar_id     ),  // input 		[3:0]                 
	.S01_AXI_ARSIZE               (mem_axi_ar_size   ),  // input 		[2:0]                 
	.S01_AXI_ARBURST              (mem_axi_ar_burst  ),  // input 		[1:0]                 
	// .S01_AXI_ARLOCK               (mem_axi_ar_lock   ),  // input 		                      
	// .S01_AXI_ARCACHE              (mem_axi_ar_cache  ),  // input 		[3:0]                 
	// .S01_AXI_ARPROT               (mem_axi_ar_prot   ),  // input 		[2:0]                 
	// .S01_AXI_ARQOS                (mem_axi_ar_qos    ),  // input 		[3:0]               
	// .S01_AXI_ARREGION             (mem_axi_ar_region ),  // input 		[3:0]              
  	// .S01_AXI_ARUSER				 (mem_axi_ar_user   ),  // input 		[USER_WIDTH-1:0]   
	
	.S01_AXI_RDATA                (mem_axi_r_data    ),  // output reg  [DATA_WIDTH-1:0]      
	// .S01_AXI_RLAST                (mem_axi_r_last    ),  // output reg                        
	.S01_AXI_RVALID               (mem_axi_r_valid   ),  // output reg                        
	.S01_AXI_RREADY               (mem_axi_r_ready   ),  // input                           
	// .S01_AXI_RID                  (mem_axi_r_id      ),  // output reg  [3:0]                 
	// .S01_AXI_RRESP                (mem_axi_r_resp    ),  // output reg  [1:0]              
	// .S01_AXI_RUSER				 (mem_axi_r_user    ),  // output reg  [USER_WIDTH-1:0]   	 	
	
	.S01_AXI_AWADDR               (mem_axi_aw_addr   ),  // input 		[ADDR_WIDTH-1:0]      
	.S01_AXI_AWVALID              (mem_axi_aw_valid  ),  // input 		                      
	.S01_AXI_AWREADY              (mem_axi_aw_ready  ),  // output reg	                    
	.S01_AXI_AWLEN                (mem_axi_aw_len    ),  // input 		[7:0]               
	.S01_AXI_AWID                 (mem_axi_aw_id     ),  // input 		[ID_WIDTH-1:0]        
	.S01_AXI_AWSIZE               (mem_axi_aw_size   ),  // input 		[2:0]                 
	.S01_AXI_AWBURST              (mem_axi_aw_burst  ),  // input 		[1:0]                 
	// .S01_AXI_AWLOCK               (mem_axi_aw_lock   ),  // input 		                      
	// .S01_AXI_AWCACHE              (mem_axi_aw_cache  ),  // input 		[3:0]                 
	// .S01_AXI_AWPROT               (mem_axi_aw_prot   ),  // input 		[2:0]                 
	// .S01_AXI_AWQOS                (mem_axi_aw_qos    ),  // input 		[3:0]              	
	// .S01_AXI_AWREGION			 (mem_axi_aw_region ),  // input 		[3:0]              
    // .S01_AXI_AWUSER				 (mem_axi_aw_user   ),  // input 		[USER_WIDTH-1:0]   
	
	.S01_AXI_WDATA                (mem_axi_w_data    ),  // input 		[DATA_WIDTH-1:0]      
	.S01_AXI_WLAST                (mem_axi_w_last    ),  // input 		                      
	.S01_AXI_WVALID               (mem_axi_w_valid   ),  // input 		                      
	.S01_AXI_WREADY               (mem_axi_w_ready   ),  // output reg		                
	.S01_AXI_WSTRB                (mem_axi_w_strb    ),  // input 		[STRB_WIDTH-1:0]    
    // .S01_AXI_WUSER				 (mem_axi_w_user    ),  // input 		[USER_WIDTH-1:0]   	
			
	// .S01_AXI_BID                 (mem_axi_b_id      ),  // output reg  [USER_WIDTH-1:0]      
	// .S01_AXI_BRESP               (mem_axi_b_resp    ),  // output reg  [1:0]                 
	.S01_AXI_BVALID               (mem_axi_b_valid   ),  // output reg                        
	.S01_AXI_BREADY               (mem_axi_b_ready   ),  // input  		                      
	// .S01_AXI_BUSER			    (mem_axi_b_user    ),  // output reg  [USER_WIDTH-1:0]   
	

	/********** slave0 : axi top**********/
	
	.M00_AXI_ARADDR              (ar_addr   ), // output reg	[ADDR_WIDTH-1:0]      
	.M00_AXI_ARVALID             (ar_valid  ), // output reg	                      
	.M00_AXI_ARREADY             (ar_ready  ), // input   	                        
	.M00_AXI_ARLEN               (ar_len    ), // output reg	[7:0]               
	.M00_AXI_ARID                (ar_id     ), // output reg	[3:0]                 
	.M00_AXI_ARSIZE              (ar_size   ), // output reg	[2:0]                 
	.M00_AXI_ARBURST             (ar_burst  ), // output reg	[1:0]                 
	// .M00_AXI_ARLOCK              (), // output reg	                      
	// .M00_AXI_ARCACHE             (), // output reg	[3:0]                 
	// .M00_AXI_ARPROT              (), // output reg	[2:0]                 
	// .M00_AXI_ARQOS               (), // output reg	[3:0]               
	// .M00_AXI_ARREGION            (), // output reg	[3:0]              
    // .M00_AXI_ARUSER			    (), // output reg	[USER_WIDTH-1:0]   
	
	.M00_AXI_RDATA               (r_data    ), // input       [DATA_WIDTH-1:0]      
	.M00_AXI_RLAST               (r_last    ), // input                     	      
	.M00_AXI_RVALID              (r_valid   ), // input                             
	.M00_AXI_RREADY              (r_ready   ), // output reg                      
	.M00_AXI_RID                 (r_id      ), // input		[3:0]                     
	// .M00_AXI_RRESP               (r_resp    ), // input		[1:0]                  
	// .M00_AXI_RUSER			    (), // input 		[USER_WIDTH-1:0]     	 	
														  
	.M00_AXI_AWADDR              (aw_addr   ), // output reg  [ADDR_WIDTH-1:0]      
	.M00_AXI_AWVALID             (aw_valid  ), // output reg                        
	.M00_AXI_AWREADY             (aw_ready  ), // input                             
	.M00_AXI_AWLEN               (aw_len    ), // output reg  [7:0]               
	.M00_AXI_AWID                (aw_id     ), // output reg  [ID_WIDTH-1:0]        
	.M00_AXI_AWSIZE              (aw_size   ), // output reg  [2:0]                 
	.M00_AXI_AWBURST             (aw_burst  ), // output reg  [1:0]                 
	// .M00_AXI_AWLOCK              (), // output reg                        
	// .M00_AXI_AWCACHE             (), // output reg  [3:0]                 
	// .M00_AXI_AWPROT              (), // output reg  [2:0]                 
	// .M00_AXI_AWQOS               (), // output reg  [3:0]              	
	// .M00_AXI_AWREGION			(), // output reg  [3:0]              
    // .M00_AXI_AWUSER			    (), // output reg  [USER_WIDTH-1:0]   
														  
	.M00_AXI_WDATA               (w_data    ), // output reg  [DATA_WIDTH-1:0]      
	.M00_AXI_WLAST               (w_last    ), // output reg                        
	.M00_AXI_WVALID              (w_valid   ), // output reg                        
	.M00_AXI_WREADY              (w_ready   ), // input                           
	.M00_AXI_WSTRB               (w_strb    ), // output reg  [STRB_WIDTH-1:0]    
  	// .M00_AXI_WUSER			         (), // output reg  [USER_WIDTH-1:0]   	
							                           
	// .M00_AXI_BID                 (b_id      ), // input 		[USER_WIDTH-1:0]      
	// .M00_AXI_BRESP               (b_resp    ), // input 		[1:0]                 
	.M00_AXI_BVALID              (b_valid   ), // input 		                      
	.M00_AXI_BREADY              (b_ready   )  // output reg	                  
	// .M00_AXI_BUSER				       ()  // input 		[USER_WIDTH-1:0]   
);

endmodule




module ysyx_210438_axi_interconnect#(
    parameter   DATA_WIDTH  = 64,             	//数据位宽
    parameter   ADDR_WIDTH  = 32,               //地址位宽              
    parameter   ID_WIDTH    = 4,               	//ID位宽
    // parameter   USER_WIDTH  = 1024,             //USER位宽
    parameter   STRB_WIDTH  = 8   				//STRB位宽
)(

	input   wire   clk,
    input   wire   sft_rst,     // synchronous reset
    /**********master0**********/

	input 		[ADDR_WIDTH-1:0]   S00_AXI_ARADDR               ,   
	input                    	   S00_AXI_ARVALID              ,   
	output reg               	   S00_AXI_ARREADY              ,   
	input 		[7:0]              S00_AXI_ARLEN                , 
	input 		[3:0]              S00_AXI_ARID                 ,   
	input 		[2:0]              S00_AXI_ARSIZE               ,   
	input 		[1:0]              S00_AXI_ARBURST              ,   
	// input 		                   S00_AXI_ARLOCK               ,   
	// input 		[3:0]              S00_AXI_ARCACHE              ,   
	// input 		[2:0]              S00_AXI_ARPROT               ,   
	// input 		[3:0]              S00_AXI_ARQOS                , 
	// input 		[3:0]              S00_AXI_ARREGION             ,
    // input 		[USER_WIDTH-1:0]   S00_AXI_ARUSER				,
	
	output reg	[DATA_WIDTH-1:0]   S00_AXI_RDATA                ,   
	output reg                     S00_AXI_RLAST                ,   
	output reg                     S00_AXI_RVALID               ,   
	input                    	   S00_AXI_RREADY               , 
	// output reg  [3:0]              S00_AXI_RID                  ,   
	// output reg	[1:0]              S00_AXI_RRESP                , 
	// output reg	[USER_WIDTH-1:0]   S00_AXI_RUSER				,
    /**********master1**********/	

	input 		[ADDR_WIDTH-1:0]   S01_AXI_ARADDR               ,   
	input 		                   S01_AXI_ARVALID              ,   
	output reg		               S01_AXI_ARREADY              ,   
	input 		[7:0]              S01_AXI_ARLEN                , 
	input 		[3:0]              S01_AXI_ARID                 ,   
	input 		[2:0]              S01_AXI_ARSIZE               ,   
	input 		[1:0]              S01_AXI_ARBURST              ,   
	// input 		                   S01_AXI_ARLOCK               ,   
	// input 		[3:0]              S01_AXI_ARCACHE              ,   
	// input 		[2:0]              S01_AXI_ARPROT               ,   
	// input 		[3:0]              S01_AXI_ARQOS                , 
	// input 		[3:0]              S01_AXI_ARREGION             ,
    // input 		[USER_WIDTH-1:0]   S01_AXI_ARUSER				,
	
	output reg  [DATA_WIDTH-1:0]   S01_AXI_RDATA                ,   
	// output reg                     S01_AXI_RLAST                ,   
	output reg                     S01_AXI_RVALID               ,   
	input                          S01_AXI_RREADY               , 
	// output reg  [3:0]              S01_AXI_RID                  ,   
	// output reg  [1:0]              S01_AXI_RRESP                ,
	// output reg  [USER_WIDTH-1:0]   S01_AXI_RUSER				,	 	
	
	input 		[ADDR_WIDTH-1:0]   S01_AXI_AWADDR               ,   
	input 		                   S01_AXI_AWVALID              ,   
	output reg	                   S01_AXI_AWREADY              ,   
	input 		[7:0]              S01_AXI_AWLEN                , 
	input 		[ID_WIDTH-1:0]     S01_AXI_AWID                 ,   
	input 		[2:0]              S01_AXI_AWSIZE               ,   
	input 		[1:0]              S01_AXI_AWBURST              ,   
	// input 		                   S01_AXI_AWLOCK               ,   
	// input 		[3:0]              S01_AXI_AWCACHE              ,   
	// input 		[2:0]              S01_AXI_AWPROT               ,   
	// input 		[3:0]              S01_AXI_AWQOS                ,	
	// input 		[3:0]              S01_AXI_AWREGION			    ,
    // input 		[USER_WIDTH-1:0]   S01_AXI_AWUSER				,
	
	input 		[DATA_WIDTH-1:0]   S01_AXI_WDATA                ,   
	input 		                   S01_AXI_WLAST                ,   
	input 		                   S01_AXI_WVALID               ,   
	output reg		               S01_AXI_WREADY               , 
	input 		[STRB_WIDTH-1:0]   S01_AXI_WSTRB                , 
    // input 		[USER_WIDTH-1:0]   S01_AXI_WUSER				,	
			
	// output reg  [ID_WIDTH-1:0]     S01_AXI_BID                  ,   
	// output reg  [1:0]              S01_AXI_BRESP                ,   
	output reg                     S01_AXI_BVALID               ,   
	input  		                   S01_AXI_BREADY               ,
	// output reg  [USER_WIDTH-1:0]   S01_AXI_BUSER				,
	

	/********** slave0 **********/
	
	output reg	[ADDR_WIDTH-1:0]   M00_AXI_ARADDR              ,   
	output reg	                   M00_AXI_ARVALID             ,   
	input   	                   M00_AXI_ARREADY             ,   
	output reg	[7:0]              M00_AXI_ARLEN               , 
	output reg	[3:0]              M00_AXI_ARID                ,   
	output reg	[2:0]              M00_AXI_ARSIZE              ,   
	output reg	[1:0]              M00_AXI_ARBURST             ,   
	// output reg	                   M00_AXI_ARLOCK              ,   
	// output reg	[3:0]              M00_AXI_ARCACHE             ,   
	// output reg	[2:0]              M00_AXI_ARPROT              ,   
	// output reg	[3:0]              M00_AXI_ARQOS               , 
	// output reg	[3:0]              M00_AXI_ARREGION            ,
    // output reg	[USER_WIDTH-1:0]   M00_AXI_ARUSER			   ,
	
	input       [DATA_WIDTH-1:0]   M00_AXI_RDATA               ,   
	input                     	   M00_AXI_RLAST               ,   
	input                          M00_AXI_RVALID              ,   
	output reg                     M00_AXI_RREADY              , 
	input		[3:0]              M00_AXI_RID                 ,   
	// input		[1:0]              M00_AXI_RRESP               ,
	// input 		[USER_WIDTH-1:0]   M00_AXI_RUSER			   ,	 	
														  
	output reg  [ADDR_WIDTH-1:0]   M00_AXI_AWADDR              ,   
	output reg                     M00_AXI_AWVALID             ,   
	input                          M00_AXI_AWREADY             ,   
	output reg  [7:0]              M00_AXI_AWLEN               , 
	output reg  [ID_WIDTH-1:0]     M00_AXI_AWID                ,   
	output reg  [2:0]              M00_AXI_AWSIZE              ,   
	output reg  [1:0]              M00_AXI_AWBURST             ,   
	// output reg                     M00_AXI_AWLOCK              ,   
	// output reg  [3:0]              M00_AXI_AWCACHE             ,   
	// output reg  [2:0]              M00_AXI_AWPROT              ,   
	// output reg  [3:0]              M00_AXI_AWQOS               ,	
	// output reg  [3:0]              M00_AXI_AWREGION			   ,
    // output reg  [USER_WIDTH-1:0]   M00_AXI_AWUSER			   ,
														  
	output reg  [DATA_WIDTH-1:0]   M00_AXI_WDATA               ,   
	output reg                     M00_AXI_WLAST               ,   
	output reg                     M00_AXI_WVALID              ,   
	input                          M00_AXI_WREADY              , 
	output reg  [STRB_WIDTH-1:0]   M00_AXI_WSTRB               , 
    // output reg  [USER_WIDTH-1:0]   M00_AXI_WUSER			   ,	
							                           
	// input 		[ID_WIDTH-1:0]     M00_AXI_BID                 ,   
	// input 		[1:0]              M00_AXI_BRESP               ,   
	input 		                   M00_AXI_BVALID              ,   
	output reg	                   M00_AXI_BREADY               
	// input 		[USER_WIDTH-1:0]   M00_AXI_BUSER				   
);

wire  s0_addr_ring	;
wire  s1_addr_ring	;
wire  s0_data_ring	;
wire  s1_data_ring	;


// assign   s0_addr_ring  =	S00_AXI_ARVALID && ~s1_addr_ring	;
// assign	 s1_addr_ring  =	S01_AXI_ARVALID ;

assign	 s0_data_ring  =	M00_AXI_RVALID && (M00_AXI_RID == 'd0) ;
assign	 s1_data_ring  =	M00_AXI_RVALID && (M00_AXI_RID == 'd1) ;

reg  [1:0]   R_state		;
localparam   [1:0]    S_IDLE   =   'd0			;
localparam   [1:0]    S_S01	   =   'd1			;
localparam   [1:0]    S_S00	   =   'd2			;
always@(posedge clk) begin
	if(sft_rst) begin
		R_state		<=			S_IDLE	;
	end
	else case(R_state)
		S_IDLE:begin
			if(S01_AXI_ARVALID) 
				R_state		<=			S_S01   ;
			else if(S00_AXI_ARVALID)
				R_state     <=			S_S00	;
		end
		S_S01:begin
			if(~S01_AXI_ARVALID)
				R_state		<=			S_IDLE	;
		end
		S_S00:begin
			if(~S00_AXI_ARVALID)
				R_state		<=			S_IDLE	;
		end
		default:begin
			R_state	 <=	R_state	;
		end
		
	endcase
end

assign   s0_addr_ring  =	(R_state == S_S00) ;
assign	 s1_addr_ring  =	(R_state == S_S01) ;

//读地址和读数据
always@(*) begin
	case({s1_addr_ring,s0_addr_ring}) 
		2'b01:begin
			M00_AXI_ARADDR     =	 S00_AXI_ARADDR     ;
		    M00_AXI_ARVALID    =     S00_AXI_ARVALID    ;   
		    M00_AXI_ARLEN      =     S00_AXI_ARLEN      ;
		    M00_AXI_ARID       =     S00_AXI_ARID       ;
		    M00_AXI_ARSIZE     =     S00_AXI_ARSIZE     ;
		    M00_AXI_ARBURST    =     S00_AXI_ARBURST    ;
		    // M00_AXI_ARLOCK     =     S00_AXI_ARLOCK     ;
		    // M00_AXI_ARCACHE    =     S00_AXI_ARCACHE    ;
		    // M00_AXI_ARPROT     =     S00_AXI_ARPROT     ;
		    // M00_AXI_ARQOS      =     S00_AXI_ARQOS      ;
		    // M00_AXI_ARREGION   =     S00_AXI_ARREGION   ;
		    // M00_AXI_ARUSER	   =     S00_AXI_ARUSER		;
			//M00_AXI_RREADY	   =     S00_AXI_RREADY		;
			S00_AXI_ARREADY	   =	 M00_AXI_ARREADY	;
			S01_AXI_ARREADY	   =	 'b0				;
		end
		2'b10:begin
			M00_AXI_ARADDR     =	 S01_AXI_ARADDR     ;			
		    M00_AXI_ARVALID    =     S01_AXI_ARVALID    ;		
		    M00_AXI_ARLEN      =     S01_AXI_ARLEN      ;		
		    M00_AXI_ARID       =     S01_AXI_ARID       ;		
		    M00_AXI_ARSIZE     =     S01_AXI_ARSIZE     ;		
		    M00_AXI_ARBURST    =     S01_AXI_ARBURST    ;		
		    // M00_AXI_ARLOCK     =     S01_AXI_ARLOCK     ;		
		    // M00_AXI_ARCACHE    =     S01_AXI_ARCACHE    ;		
		    // M00_AXI_ARPROT     =     S01_AXI_ARPROT     ;		
		    // M00_AXI_ARQOS      =     S01_AXI_ARQOS      ;		
		    // M00_AXI_ARREGION   =     S01_AXI_ARREGION   ;		
		    // M00_AXI_ARUSER	   =     S01_AXI_ARUSER		;
			// M00_AXI_RREADY	   =     S01_AXI_RREADY		;
			S00_AXI_ARREADY	   =	 'b0				;
			S01_AXI_ARREADY	   =	 M00_AXI_ARREADY	;
		end
		default:begin
			M00_AXI_ARADDR     =	 'b0				;			
		    M00_AXI_ARVALID    =     'b0				;		
		    M00_AXI_ARLEN      =     'b0				;		
		    M00_AXI_ARID       =     'b0				;		
		    M00_AXI_ARSIZE     =     'b0				;		
		    M00_AXI_ARBURST    =     'b0				;		
		    // M00_AXI_ARLOCK     =     'b0				;		
		    // M00_AXI_ARCACHE    =     'b0				;		
		    // M00_AXI_ARPROT     =     'b0				;		
		    // M00_AXI_ARQOS      =     'b0				;		
		    // M00_AXI_ARREGION   =     'b0				;		
		    // M00_AXI_ARUSER	   =     'b0				;
			//M00_AXI_RREADY	   =     'b0				;
			S00_AXI_ARREADY	   =	 'b0				;
			S01_AXI_ARREADY	   =	 'b0				;
		end
	endcase
end

always@(*) begin
	case({s1_data_ring,s0_data_ring}) 
		2'b01:begin
			M00_AXI_RREADY	   =    S00_AXI_RREADY		;
		
			S00_AXI_RDATA  	   =	M00_AXI_RDATA 		;
			S00_AXI_RLAST      =    M00_AXI_RLAST		; 
			S00_AXI_RVALID     =    M00_AXI_RVALID		;
			// S00_AXI_RID        =    M00_AXI_RID			;   
			// S00_AXI_RRESP      =    M00_AXI_RRESP		; 
			// S00_AXI_RUSER	   =    M00_AXI_RUSER		;
					
			S01_AXI_RDATA  	   =	'b0					;
			// S01_AXI_RLAST      =    'b0					; 
			S01_AXI_RVALID     =    'b0					;
			// S01_AXI_RID        =    'b0					;   
			// S01_AXI_RRESP      =    'b0					; 
			// S01_AXI_RUSER	   =    'b0					;
		end
		2'b10:begin
			M00_AXI_RREADY	   =    S01_AXI_RREADY		;
						
			S00_AXI_RDATA  	   =	'b0					;
			S00_AXI_RLAST      =    'b0					;
			S00_AXI_RVALID     =    'b0					;
			// S00_AXI_RID        =    'b0					;
			// S00_AXI_RRESP      =    'b0					;
			// S00_AXI_RUSER	   =    'b0					;	
			
			S01_AXI_RDATA  	   =	M00_AXI_RDATA 		;
			// S01_AXI_RLAST      =    M00_AXI_RLAST		;
			S01_AXI_RVALID     =    M00_AXI_RVALID		;
			// S01_AXI_RID        =    M00_AXI_RID			;
			// S01_AXI_RRESP      =    M00_AXI_RRESP		;
			// S01_AXI_RUSER	   =    M00_AXI_RUSER		;
		end
		default:begin
			M00_AXI_RREADY	   =	'b0					;
			
			S00_AXI_RDATA  	   =	'b0					;		
			S00_AXI_RLAST      =    'b0					;		
			S00_AXI_RVALID     =    'b0					;		
			// S00_AXI_RID        =    'b0					;		
			// S00_AXI_RRESP      =    'b0					;		
			// S00_AXI_RUSER	   =    'b0					;		
						            
			S01_AXI_RDATA  	   =	'b0					;		
			// S01_AXI_RLAST      =    'b0					;		
			S01_AXI_RVALID     =    'b0					;		
			// S01_AXI_RID        =    'b0					;		
			// S01_AXI_RRESP      =    'b0					;		
			// S01_AXI_RUSER	   =    'b0					;
		end                         					
	endcase
end

//写地址和写数据、写相应
always@(*) begin
			M00_AXI_AWADDR 	   = 	S01_AXI_AWADDR      ;
	        M00_AXI_AWVALID    =    S01_AXI_AWVALID     ;
            M00_AXI_AWLEN      =    S01_AXI_AWLEN       ;
            M00_AXI_AWID       =    S01_AXI_AWID        ;
            M00_AXI_AWSIZE     =    S01_AXI_AWSIZE      ;
            M00_AXI_AWBURST    =    S01_AXI_AWBURST     ;
		    // M00_AXI_AWLOCK     =    S01_AXI_AWLOCK      ;
		    // M00_AXI_AWCACHE    =    S01_AXI_AWCACHE     ;
		    // M00_AXI_AWPROT     =    S01_AXI_AWPROT      ;
		    // M00_AXI_AWQOS      =    S01_AXI_AWQOS       ;
		    // M00_AXI_AWREGION   =    S01_AXI_AWREGION    ;
		    // M00_AXI_AWUSER	   =    S01_AXI_AWUSER	    ;
			S01_AXI_AWREADY    =    M00_AXI_AWREADY     ;
													    
		    M00_AXI_WDATA      =    S01_AXI_WDATA       ;
		    M00_AXI_WLAST      =    S01_AXI_WLAST       ;
		    M00_AXI_WVALID     =    S01_AXI_WVALID      ;
		    M00_AXI_WSTRB      =    S01_AXI_WSTRB       ;
		    // M00_AXI_WUSER	   =    S01_AXI_WUSER	    ;
			S01_AXI_WREADY     =    M00_AXI_WREADY      ;
			
			// S01_AXI_BID    	   =	M00_AXI_BID    		;
			// S01_AXI_BRESP      =	M00_AXI_BRESP       ;
			S01_AXI_BVALID     =	M00_AXI_BVALID      ;
			// S01_AXI_BUSER	   =	M00_AXI_BUSER	    ;
			M00_AXI_BREADY     =	S01_AXI_BREADY      ;
end
endmodule




module ysyx_210438_if_axi_rw#(
    parameter   DATA_WIDTH  = 64,             	//数据位宽
    parameter   ADDR_WIDTH  = 32,               //地址位宽              
    parameter   ID_WIDTH    = 4                	//ID位宽
    // parameter   USER_WIDTH  = 1024              //USER位宽
)(
	input           			  clk					       ,
	input	   	 				  rst					       ,
								  
	input	   					  inst_addr_valid		       ,
	input 	   [ADDR_WIDTH-3:0]   inst_addr			           ,
	output	   [31:0]		      inst				           ,
	output	   				      inst_valid			       ,
	
	output reg [ADDR_WIDTH-1:0]   M00_AXI_ARADDR               ,   
	output reg                    M00_AXI_ARVALID              ,   
	input                         M00_AXI_ARREADY              ,   
	output     [7:0]              M00_AXI_ARLEN                , 
	output     [ID_WIDTH-1:0]     M00_AXI_ARID                 ,   
	output     [2:0]              M00_AXI_ARSIZE               ,   
	output     [1:0]              M00_AXI_ARBURST              ,   		      
	input      [DATA_WIDTH-1:0]   M00_AXI_RDATA                ,   
	input                         M00_AXI_RLAST                ,   
	input                         M00_AXI_RVALID               ,   
	output                        M00_AXI_RREADY                
);



assign   M00_AXI_ARLEN   =   8'b00000000;
assign   M00_AXI_ARID	 =   'd0		;
assign   M00_AXI_ARSIZE  =   3'b010		;
assign	 M00_AXI_ARBURST =   2'b01		;
//assign   M00_AXI_RREADY	 =	 'b1		;


wire	 			addr_hit			;
reg      [ADDR_WIDTH-3:0]		axi_addr	;
assign   addr_hit	=	(inst_addr == axi_addr)	;

reg     	[1:0]		R_state   	 ;
localparam	[1:0]		S_IDLE  	=  'd0		;
localparam  [1:0]		S_AXI_RD	=  'd1		;

always@(posedge clk) begin
	if(rst) begin
		R_state <=  S_IDLE			;
	end
	else case(R_state)
		S_IDLE:begin
			if(inst_addr_valid)
				R_state  <=  S_AXI_RD  ;
		end
		S_AXI_RD:begin
			if(M00_AXI_RLAST & M00_AXI_RVALID)
				R_state  <=  S_IDLE	;
		end
		default:	R_state <= S_IDLE;
	endcase
end	

assign      M00_AXI_RREADY	 =	 (R_state == S_AXI_RD) && ~M00_AXI_ARVALID	;
assign      inst = (inst_addr[0] == 'b1)? M00_AXI_RDATA[63:32]:M00_AXI_RDATA[31:0]		;
assign		inst_valid = M00_AXI_RVALID && addr_hit && M00_AXI_RREADY	;

always@(posedge clk) begin
	if(rst) begin
		axi_addr <=	'b0						;
	end
	else if((R_state == S_IDLE) && inst_addr_valid) 
		axi_addr <= inst_addr				;
end

always@(posedge clk) begin
	if(rst) begin
		M00_AXI_ARADDR	<=	'b0				;
		M00_AXI_ARVALID	<=	'b0				;
	end
	else if((R_state == S_IDLE) && inst_addr_valid) begin
		M00_AXI_ARADDR	<=	{inst_addr,2'b0};
		M00_AXI_ARVALID	<=	'b1				;
	end
	else if((R_state == S_AXI_RD)&& M00_AXI_ARVALID && M00_AXI_ARREADY) begin
		M00_AXI_ARVALID	<=	'b0				;
	end
end
endmodule


module ysyx_210438_mem_axi_rw #(
    parameter   DATA_WIDTH  = 64,             	//数据位宽
    parameter   ADDR_WIDTH  = 32,               //地址位宽              
    parameter   ID_WIDTH    = 4,               	//ID位宽
	parameter	STRB_WIDTH  = 8
)(
	input        			clk			,
	input		 			rst			,

	input  [ADDR_WIDTH-1:0]   data_addr  				   ,
	input 					  data_rd_addr_valid  		   ,
	output [DATA_WIDTH-1:0]   data_rd     				   ,
	output					  data_rd_valid				   ,
	input 					  data_wr_valid  		   	   ,
    input  [7:0] 		  	  data_wmask 				   ,
	input  [DATA_WIDTH-1:0]   data_wr    				   ,
	output	reg				  data_wr_ready				   ,
	
	output reg [ADDR_WIDTH-1:0]   M01_AXI_ARADDR               ,   
	output reg                    M01_AXI_ARVALID              ,   
	input                     M01_AXI_ARREADY              ,   
	output [7:0]              M01_AXI_ARLEN                , 
	output [ID_WIDTH-1:0]     M01_AXI_ARID                 ,   
	output [2:0]              M01_AXI_ARSIZE               ,   
	output [1:0]              M01_AXI_ARBURST              ,   

	
	input [DATA_WIDTH-1:0]    M01_AXI_RDATA                ,     
	input                     M01_AXI_RVALID               ,   
	output                    M01_AXI_RREADY               , 


	output [ADDR_WIDTH-1:0]   M01_AXI_AWADDR               , 
	output                    M01_AXI_AWVALID              , 
	input                     M01_AXI_AWREADY              , 
	output [7:0]              M01_AXI_AWLEN                , 
	output [ID_WIDTH-1:0]     M01_AXI_AWID                 , 
	output [2:0]              M01_AXI_AWSIZE               , 
	output [1:0]              M01_AXI_AWBURST              , 

	output [DATA_WIDTH-1:0]   M01_AXI_WDATA                , 
	output                    M01_AXI_WLAST                , 
	output                    M01_AXI_WVALID               , 
	input                     M01_AXI_WREADY               , 
	output [STRB_WIDTH-1:0]   M01_AXI_WSTRB                , 
	input                     M01_AXI_BVALID               , 
	output                    M01_AXI_BREADY                			  	
);

reg		  [1:0]  R_rd_state 		;
localparam [1:0]  S_IDLE = 'd0	;
localparam [1:0]  S_ADDR_OVER = 'd1 ;
always@(posedge clk) begin
	if(rst) begin
		R_rd_state <=  S_IDLE			;
	end
	else case(R_rd_state) 
		S_IDLE: begin
			if(data_rd_addr_valid) 
				R_rd_state	<=	S_ADDR_OVER	;
		end
		S_ADDR_OVER:begin
			if(M01_AXI_RVALID)
				R_rd_state 	<=	S_IDLE		;
		end
		default:begin
			R_rd_state	<=	S_IDLE			;
		end
	endcase
end
	
			   
assign    M01_AXI_ARLEN 	 =	  'd0				;     
assign    M01_AXI_ARID		 =	  'd1				;       
assign    M01_AXI_ARSIZE	 = (data_addr[31] == 'b1)?'b011:'b010;     
assign    M01_AXI_ARBURST	 =	  'b001				;      
assign    data_rd 			 = 	M01_AXI_RDATA		;	           
assign    data_rd_valid		 =	M01_AXI_RVALID		;     
assign    M01_AXI_RREADY 	 = (R_rd_state == S_ADDR_OVER)&&~M01_AXI_ARVALID	;    

always@(posedge clk) begin
	if(rst) begin
		M01_AXI_ARADDR	<=	'b0				;
		M01_AXI_ARVALID	<=	'b0				;
	end
	else if((R_rd_state == S_IDLE) && data_rd_addr_valid) begin
		M01_AXI_ARADDR	<=	data_addr		;
		M01_AXI_ARVALID	<=	'b1				;
	end
	else if((R_rd_state == S_ADDR_OVER)&& M01_AXI_ARVALID && M01_AXI_ARREADY) begin
		M01_AXI_ARVALID	<=	'b0				;
	end
end

reg  [1:0]  R_wr_state 	        	;
localparam [1:0]	S_DEAL		 = 'd2	;
localparam [1:0]	S_OVER		 = 'd3	;

always@(posedge clk) begin
	if(rst)
		R_wr_state <= S_IDLE		;
	else begin
		case(R_wr_state)
			S_IDLE:begin
				// if(data_wr_valid && M01_AXI_AWREADY && M01_AXI_WREADY)
				// 	R_wr_state  <= S_OVER		;
				// else 
				if(data_wr_valid && M01_AXI_AWREADY)
					R_wr_state	<=	S_ADDR_OVER	;
			end
			S_ADDR_OVER:begin
				if(data_wr_valid && M01_AXI_WREADY)
					R_wr_state  <=  S_OVER		;
				else if(~data_wr_valid) 
					R_wr_state 	<=  S_DEAL		;
			end
			S_DEAL:begin
				if(M01_AXI_WREADY)
					R_wr_state   <=    S_OVER		;
			end
			S_OVER:begin
				if(M01_AXI_BVALID)
					R_wr_state  <=	S_IDLE		;
			end
			default:begin
				R_wr_state	<=	S_IDLE			;
			end
		endcase
	end
end
	
always@(*) begin
	case(R_wr_state)
	S_OVER:
		data_wr_ready = M01_AXI_BVALID;
	default:
		data_wr_ready = 'b0				;
	endcase
end

assign	  M01_AXI_AWADDR	 =  data_addr			;     
assign    M01_AXI_AWVALID 	 =(R_wr_state == S_IDLE)?	data_wr_valid:'b0;       
assign    M01_AXI_AWLEN		 =	  'd0				; 					    
assign    M01_AXI_AWID       =	  'd1				; 
assign    M01_AXI_AWSIZE     = (data_addr[31] == 'b1)?'b011:'b10;
assign    M01_AXI_AWBURST    =	  'b01				; 
// assign    M01_AXI_AWLOCK     =  	'd0				;
// assign    M01_AXI_AWCACHE    =    	'd0				;
// assign    M01_AXI_AWPROT     =     	'd0				;
// assign    M01_AXI_AWQOS      =		'd0				;
// assign    M01_AXI_AWREGION	 =  	'd0				;
// assign    M01_AXI_AWUSER	 =      'd0				;	
   
assign    M01_AXI_WDATA		 =	data_wr				;      
assign    M01_AXI_WLAST      = M01_AXI_WVALID		;
assign    M01_AXI_WVALID	 =  ((R_wr_state == S_ADDR_OVER))? data_wr_valid:((R_wr_state == S_DEAL)?'b1:'b0)		;	        
// assign    M01_AXI_WVALID	 =  ((R_wr_state == S_IDLE && M01_AXI_AWREADY)||(R_wr_state == S_ADDR_OVER))? data_wr_valid:((R_wr_state == S_DEAL)?'b1:'b0)		;	        

assign    M01_AXI_WSTRB 	 =	(R_wr_state == S_DEAL)?'b0:data_wmask			;    
// assign    M01_AXI_WUSER		 =	'd0					;
        
assign    M01_AXI_BREADY	 =	(R_wr_state == S_OVER)					;  





endmodule  
		
		
module ysyx_210438_mem_ctrl(
    input rst,

    // CPU端接口
    input [7:0]mem_byte_enble,
    input [32-1:0]mem_addr,
    input mem_rd_en,
    input mem_wr_en,
    input [`YSYX210438_BUS_WIDTH]mem_wr_data,
    output reg [`YSYX210438_BUS_WIDTH]mem_rd_data,

    // 内存接口
    output  [32-1:0]ram_addr,
    output  ram_wr_en,
    output reg  [7:0] ram_wmask,
    output reg  [`YSYX210438_BUS_WIDTH]ram_wr_data,
    output  ram_rd_en,
    input    [`YSYX210438_BUS_WIDTH]ram_rd_data
);  

    reg [7:0] sb_ram_wmask   ;
    reg [`YSYX210438_BUS_WIDTH] sb_ram_wr_data ;
    reg [7:0] sh_ram_wmask   ;
    reg [`YSYX210438_BUS_WIDTH] sh_ram_wr_data ;
    reg [7:0] sw_ram_wmask   ;
    reg [`YSYX210438_BUS_WIDTH] sw_ram_wr_data ;
    reg [7:0] sd_ram_wmask   ;
    reg [`YSYX210438_BUS_WIDTH] sd_ram_wr_data ;

    reg [`YSYX210438_BUS_WIDTH] lb_ram_rd_data ;
    reg [`YSYX210438_BUS_WIDTH] lh_ram_rd_data ;
    reg [`YSYX210438_BUS_WIDTH] lw_ram_rd_data ;
    reg [`YSYX210438_BUS_WIDTH] ld_ram_rd_data ;

    assign ram_addr = mem_addr;
    assign ram_wr_en = rst ? 0 : mem_wr_en;
    assign ram_rd_en = rst ? 0 : mem_rd_en;

    wire sb_signal = mem_wr_en & (mem_byte_enble == 8'b0000_0001);
    wire sh_signal = mem_wr_en & (mem_byte_enble == 8'b0000_0011);
    wire sw_signal = mem_wr_en & (mem_byte_enble == 8'b0000_1111);
    wire sd_signal = mem_wr_en & (mem_byte_enble == 8'b1111_1111);

    wire lb_signal = mem_rd_en & (mem_byte_enble == 8'b0000_0001);
    wire lh_signal = mem_rd_en & (mem_byte_enble == 8'b0000_0011);
    wire lw_signal = mem_rd_en & (mem_byte_enble == 8'b0000_1111);
    wire ld_signal = mem_rd_en & (mem_byte_enble == 8'b1111_1111);

    // 写MUX
    always @(*) begin
        if(rst)begin
            ram_wmask   = 8'd0;
            ram_wr_data = `YSYX210438_ZERO_WORD;
        end 
        else if(sb_signal)begin
            ram_wmask   = sb_ram_wmask  ;
            ram_wr_data = sb_ram_wr_data;
        end 
        else if(sh_signal)begin
            ram_wmask   = sh_ram_wmask  ;
            ram_wr_data = sh_ram_wr_data;
        end
        else if(sw_signal)begin
            ram_wmask   = sw_ram_wmask  ;
            ram_wr_data = sw_ram_wr_data;           
        end
        else if(sd_signal)begin
            ram_wmask   = sd_ram_wmask  ;
            ram_wr_data = sd_ram_wr_data;        
        end
        else begin
            ram_wmask   = 8'd0;
            ram_wr_data = `YSYX210438_ZERO_WORD;
        end
    end

    // 读MUX
    always @(*) begin
        if(rst)
            mem_rd_data = `YSYX210438_ZERO_WORD;
        else if(lb_signal)
            mem_rd_data = lb_ram_rd_data;
        else if(lh_signal)
            mem_rd_data = lh_ram_rd_data;
        else if(lw_signal)
            mem_rd_data = lw_ram_rd_data;
        else if(ld_signal)
            mem_rd_data = ld_ram_rd_data;
        else
            mem_rd_data = `YSYX210438_ZERO_WORD;
    end

    // 写字节的处理
    always @(sb_signal or mem_addr[2:0] or mem_wr_data[7:0]) begin
        if(sb_signal)begin
            case(mem_addr[2:0])
                3'd0:begin 
                    sb_ram_wmask   = 8'b0000_0001;
                    sb_ram_wr_data = {56'd0,mem_wr_data[7:0]};
                end
                3'd1:begin 
                    sb_ram_wmask   = 8'b0000_0010;
                    sb_ram_wr_data = {48'd0,mem_wr_data[7:0],8'd0};
                end
                3'd2:begin 
                    sb_ram_wmask   = 8'b0000_0100;
                    sb_ram_wr_data = {40'd0,mem_wr_data[7:0],16'd0};
                end
                3'd3:begin 
                    sb_ram_wmask   = 8'b0000_1000;
                    sb_ram_wr_data = {32'd0,mem_wr_data[7:0],24'd0};
                end
                3'd4:begin 
                    sb_ram_wmask   = 8'b0001_0000;
                    sb_ram_wr_data = {24'd0,mem_wr_data[7:0],32'd0};
                end
                3'd5:begin 
                    sb_ram_wmask   = 8'b0010_0000;
                    sb_ram_wr_data = {16'd0,mem_wr_data[7:0],40'd0};
                end
                3'd6:begin 
                    sb_ram_wmask   = 8'b0100_0000;
                    sb_ram_wr_data = {8'd0,mem_wr_data[7:0],48'd0};
                end
                3'd7:begin 
                    sb_ram_wmask   = 8'b1000_0000;
                    sb_ram_wr_data = {mem_wr_data[7:0],56'd0};
                end
            endcase
        end
        else begin
            sb_ram_wmask   = 8'd0;
            sb_ram_wr_data = `YSYX210438_ZERO_WORD;
        end
    end

    // 写双字的处理
    always @(sh_signal or mem_addr[2:1] or mem_wr_data[15:0]) begin
        if(sh_signal)begin
            case(mem_addr[2:1])
                2'd0:begin  
                    sh_ram_wmask   = 8'b0000_0011;
                    sh_ram_wr_data = {48'd0,mem_wr_data[15:0]};
                end
                2'd1:begin  
                    sh_ram_wmask   = 8'b0000_1100;
                    sh_ram_wr_data = {32'd0,mem_wr_data[15:0],16'd0};
                end
                2'd2:begin  
                    sh_ram_wmask   = 8'b0011_0000;
                    sh_ram_wr_data = {16'd0,mem_wr_data[15:0],32'd0};
                end
                2'd3:begin  
                    sh_ram_wmask   = 8'b1100_0000;
                    sh_ram_wr_data = {mem_wr_data[15:0],48'd0};
                end
            endcase
        end
        else begin
            sh_ram_wmask   = 8'd0;
            sh_ram_wr_data = `YSYX210438_ZERO_WORD;
        end
    end

    // 4字节写
    always @(sw_signal or mem_addr[2] or mem_wr_data[31:0]) begin
        if(sw_signal)begin
            case(mem_addr[2])
                1'b0:begin  
                    sw_ram_wmask   = 8'b0000_1111;
                    sw_ram_wr_data = {32'd0,mem_wr_data[31:0]};
                end
                1'b1:begin  
                    sw_ram_wmask   = 8'b1111_0000;
                    sw_ram_wr_data = {mem_wr_data[31:0],32'd0};
                end
            endcase
        end
        else begin
            sw_ram_wmask   = 8'd0;
            sw_ram_wr_data = `YSYX210438_ZERO_WORD;
        end
    end

    // 8字节写
    always @(sd_signal or mem_wr_data) begin
        if(sd_signal) begin
            sd_ram_wmask   = 8'b1111_1111;
            sd_ram_wr_data = mem_wr_data;
        end
        else begin
            sd_ram_wmask   = 8'd0;
            sd_ram_wr_data = `YSYX210438_ZERO_WORD;
        end
    end
    

    // 读字节处理
    always @(lb_signal or mem_addr[2:0] or ram_rd_data) begin
        if(lb_signal)
            case(mem_addr[2:0])
                3'd0:lb_ram_rd_data = {56'd0,ram_rd_data[ 7: 0]};
                3'd1:lb_ram_rd_data = {56'd0,ram_rd_data[15: 8]};
                3'd2:lb_ram_rd_data = {56'd0,ram_rd_data[23:16]};
                3'd3:lb_ram_rd_data = {56'd0,ram_rd_data[31:24]};
                3'd4:lb_ram_rd_data = {56'd0,ram_rd_data[39:32]};
                3'd5:lb_ram_rd_data = {56'd0,ram_rd_data[47:40]};
                3'd6:lb_ram_rd_data = {56'd0,ram_rd_data[55:48]};
                3'd7:lb_ram_rd_data = {56'd0,ram_rd_data[63:56]};
            endcase
        else 
            lb_ram_rd_data = `YSYX210438_ZERO_WORD;
    end

    // 读双字节
    always @(lh_signal or mem_addr[2:1] or ram_rd_data) begin
        if(lh_signal)
            case(mem_addr[2:1])
                2'd0:lh_ram_rd_data = {48'd0,ram_rd_data[15: 0]};
                2'd1:lh_ram_rd_data = {48'd0,ram_rd_data[31:16]};
                2'd2:lh_ram_rd_data = {48'd0,ram_rd_data[47:32]};
                2'd3:lh_ram_rd_data = {48'd0,ram_rd_data[63:48]};
            endcase
        else
            lh_ram_rd_data = `YSYX210438_ZERO_WORD;
    end
    // 读四字节
    always @(lw_signal or mem_addr[2] or ram_rd_data) begin
        if(lw_signal)
            case(mem_addr[2])
            1'b0:lw_ram_rd_data = {32'd0,ram_rd_data[31: 0]};
            1'b1:lw_ram_rd_data = {32'd0,ram_rd_data[63:32]};
            endcase
        else
            lw_ram_rd_data = `YSYX210438_ZERO_WORD;
    end

    // 读八字节
    always @(ld_signal or ram_rd_data) begin
        if(ld_signal)
            ld_ram_rd_data = ram_rd_data;
        else
            ld_ram_rd_data = `YSYX210438_ZERO_WORD;
    end

endmodule


module ysyx_210438_riscv_adder #(
    parameter   DATA_WIDTH  = 64
) (
    input      [DATA_WIDTH-1:0]    a,
    input      [DATA_WIDTH-1:0]    b,
    output     [DATA_WIDTH-1:0]    s
);

    assign s = a + b;

endmodule


module ysyx_210438_riscv_alu #(
    parameter   WIDTH   = 64
) (
    input   signed	   [WIDTH-1:0]     a,
    input   signed	   [WIDTH-1:0]     b,
    input   	   	   [3:0]           alu_ctrl,   // {ainvert, bnegate, operation[1:0]}
    output reg signed  [WIDTH-1:0]     alu_out,
    output  	                   	   zero
);

	wire   [WIDTH-1:0]   ua;
	wire   [WIDTH-1:0]   ub;
	wire   [WIDTH-1:0]	 add_data;
	wire   [WIDTH-1:0]	 sub_data;
	wire   [31:0]		sllw_data;
	wire  signed [31:0]	sraw_data;
	wire   [31:0]		srlw_data;
	assign ua  =  a	 ;
	assign ub  =  b   ;
	assign add_data =  a + b;
	assign sub_data  =  a - b;
	assign sllw_data =a[31:0] << b[4:0];  	
	assign sraw_data =a[31:0];
	assign srlw_data =a[31:0]>> b[4:0];
    always@(*) begin
        case (alu_ctrl)
            4'b0000 :   alu_out = add_data ;								//add,addi
			4'b0001 :   alu_out = a << b[5:0];								//sll,slli
            4'b0010 :   alu_out = (a < b) ? 'd1 : 'd0;						//slt,slti
            4'b0011 :   alu_out = (ua < ub) ? 'd1 : 'd0;					//sltu,sltiu
			4'b0100	:	alu_out = a ^ b	;									//xor,xori
            4'b0101 :   alu_out = a >> b[5:0];								//srl,srli
            4'b0110 :   alu_out = a | b ; 									//or,ori
			4'b0111 :	alu_out = a & b ;									//and,andi
			4'b1000 :   alu_out = sub_data ;								//sub
			4'b1001 : 	alu_out = {{32{add_data[31]}},add_data[31:0]};		//addw,addiw
			4'b1010 :	alu_out = {{32{sub_data[31]}},sub_data[31:0]};		//subw
			4'b1011 :   alu_out = {{32{sllw_data[31]}},sllw_data};			//sllw,slliw
			4'b1100 :   alu_out = {{32{srlw_data[31]}},srlw_data};				//srlw,srliw
			4'b1101 :   alu_out = a >>> b[5:0];								//sra,srai
			4'b1110 :   alu_out = {{32{a[31]}},sraw_data >>>b[4:0]};		//sraw,sraiw							
            default :   alu_out = 'd0;
        endcase
    end

    assign zero = (alu_out == 'd0);

endmodule



module ysyx_210438_riscv_alu_ctrl (
    input      		[2:0]   alu_op,
    input      		[3:0]   func_code,
    output  reg   	[3:0]   alu_ctrl
);

    //always_comb begin
    //    case ({alu_op, func_code})
    //        6'b10_0000  : alu_ctrl = 4'b0010;   // add
    //        6'b10_0010  : alu_ctrl = 4'b0110;   // sub
    //        6'b10_0100  : alu_ctrl = 4'b0000;   // and
    //        6'b10_0101  : alu_ctrl = 4'b0001;   // or
    //        6'b10_0111  : alu_ctrl = 4'b1100;   // nor
    //        6'b10_1010  : alu_ctrl = 4'b0111;   // slt
    //        default     : alu_ctrl = 4'b1111;
    //    endcase
    //end

    // assign alu_ctrl[3] = 1'b0;
    // assign alu_ctrl[2] = (~alu_op[1] & alu_op[0]) | (alu_op[1] & func_code[1]);
    // assign alu_ctrl[1] = ~alu_op[1] | ~func_code[2];
    // assign alu_ctrl[0] = (alu_op[1] & func_code[0]) | (alu_op[1] & func_code[3]);
	always@(*) begin
		if(alu_op == 3'b000)
			alu_ctrl = 4'b0000;
		else if(alu_op == 3'b001)
			alu_ctrl = 4'b1000;
		else if(alu_op == 3'b010)
			case(func_code)
				4'b0000 : alu_ctrl = 4'b0000;   // add
				4'b1000 : alu_ctrl = 4'b1000;   // sub
				4'b0001	: alu_ctrl = 4'b0001;	// sll
				4'b0010	: alu_ctrl = 4'b0010;	// slt1
				4'b0011	: alu_ctrl = 4'b0011;	// sltu
				4'b0100	: alu_ctrl = 4'b0100;	// xor
				4'b0101	: alu_ctrl = 4'b0101;	// srl
				4'b1101	: alu_ctrl = 4'b1101;	// sra
				4'b0110 : alu_ctrl = 4'b0110;   // or
				4'b0111 : alu_ctrl = 4'b0111;   // and
			default     : alu_ctrl = 4'b1111;
			endcase
		else if(alu_op == 3'b011)
			casez(func_code)
				4'b?000 : alu_ctrl = 4'b0000;   // add					
				4'b0001	: alu_ctrl = 4'b0001;	// sll			
				4'b?010	: alu_ctrl = 4'b0010;	// slt			
				4'b?011	: alu_ctrl = 4'b0011;	// sltu			
				4'b?100	: alu_ctrl = 4'b0100;	// xor			
				4'b0101	: alu_ctrl = 4'b0101;	// srl			
				4'b1101	: alu_ctrl = 4'b1101;	// sra			
				4'b?110 : alu_ctrl = 4'b0110;   // or			
				4'b?111 : alu_ctrl = 4'b0111;   // and			
			default     : alu_ctrl = 4'b1111;			
			endcase	
		else if(alu_op == 3'b110)
			case(func_code)
				4'b0000	: alu_ctrl = 4'b1001;	// addw
				4'b1000 : alu_ctrl = 4'b1010;	// subw
				4'b0001 : alu_ctrl = 4'b1011;	// sllw
				4'b0101 : alu_ctrl = 4'b1100;	// srlw
				4'b1101 : alu_ctrl = 4'b1110;	// sraw
			default		: alu_ctrl = 4'b1111;
			endcase
		else if(alu_op == 3'b111)
			case(func_code)
				4'b0000,4'b1000 : alu_ctrl = 4'b1001;	// addw
				4'b0001 : alu_ctrl = 4'b1011;	// sllw
				4'b0101 : alu_ctrl = 4'b1100;	// srlw
				4'b1101 : alu_ctrl = 4'b1110;	// sraw
			default		: alu_ctrl = 4'b1111;
			endcase	
		else
			alu_ctrl = 4'b1111;
	end
endmodule


module ysyx_210438_riscv_branch (
    input      			    		branch,
    input      		[2:0]   		func_code,
	input			            	alu_out,
	input							rs1,
	input							rs2,
	input							zero,
    output  reg   		    		branch_out
);

	wire    alu_out1	;
	wire    alu_out2	;
	assign  alu_out1		= (rs1&~rs2)|((rs1^~rs2)&alu_out)	;	//rs1 <  rs2
	assign  alu_out2		= (~rs1&rs2)|((rs1^~rs2)&alu_out)	;	//rs1 <  rs2(无符号数比较)
	always@(*) begin
		if(branch == 'b1)
			case(func_code)
				3'b000 	:branch_out = zero	; 
				3'b001	:branch_out = ~zero	;
				3'b100	:branch_out = alu_out1	;	
				3'b101	:branch_out = ~alu_out1	;
				3'b110 	:branch_out = alu_out2	; 
				3'b111 	:branch_out = ~alu_out2	;
			default     :branch_out = 'b0		;
			endcase
		else
			branch_out = 'b0					;
	end
endmodule



module ysyx_210438_riscv_clint #(
    parameter ADDR_WIDTH  = 32,
    parameter D_BUS_WIDTH = 64
)(
    input                              clk                   ,
    input                              rst                   ,

    input                              wr_en                 ,
    input                              rd_en                 ,
    input          [ADDR_WIDTH-1:0]    rw_addr               ,
    input          [D_BUS_WIDTH-1:0]   wr_data               ,
    output  reg    [D_BUS_WIDTH-1:0]   rd_data               ,
    output                             o_clint_rd_data_valid ,
    output                             o_clint_wr_ready      ,
    
    input                              i_core_ready          ,
    output  reg                        o_clint_timer_irq ='d0   

);

reg [D_BUS_WIDTH-1:0] mtime     ;
reg [D_BUS_WIDTH-1:0] mtimecmp  ; 

assign o_clint_wr_ready         = 1 ;    
assign o_clint_rd_data_valid    = 1 ;

always @(posedge clk) begin
    if(rst) begin
        mtime <= 'd0;
    end
    else begin
        mtime <= mtime + 1 ;
    end
end

always @(posedge clk ) begin
    if(rst) begin
        mtimecmp <= 'd0;
    end
    else begin
        //if(wr_en && rw_addr == 64'h0000_0000_0200_4000)
        if(wr_en && rw_addr == 32'h0200_4000) // using in ysyxsoc
        //if(wr_en && rw_addr == 32'h8003_0000) // using in dramsim difftest
            mtimecmp <= wr_data ;
        else 
            mtimecmp <= mtimecmp ;
    end
end

always @(*) begin
    if(rd_en) begin

        //if(rw_addr == 32'h8003_0000)        rd_data = mtimecmp ;
        if(rw_addr == 32'h0200_4000)        rd_data = mtimecmp ;
        else if(rw_addr == 32'h0200_BFF8)   rd_data = mtime    ;
        else rd_data = 'd0 ;
    end
    else begin
        rd_data = 'd0 ;
    end
end

always @(posedge clk) begin
    if(rst) begin
        o_clint_timer_irq <= 0;
    end
    else if(mtime == mtimecmp) begin
        o_clint_timer_irq <= 1 ;
    end
    else if(i_core_ready) begin
        o_clint_timer_irq <= 0 ;
    end    
    else begin
        o_clint_timer_irq <= o_clint_timer_irq ;
    end
end

endmodule



module ysyx_210438_riscv #(
	parameter   IBUS_DATA_WIDTH = 32,               // instruction bus data width
    parameter   DBUS_DATA_WIDTH = 64,               // data bus data width
    parameter   RF_ADDR_WIDTH   = 5 ,//$clog2(32),       // register file address width
    parameter   IMEM_ADDR_WIDTH = 32,     // instruction memory address width
    parameter   DMEM_ADDR_WIDTH = 32     // data memory address width

) (
	input   wire   clk,
    input   wire   sft_rst,     // synchronous reset

    // INST and DATA port
	input   wire   [IBUS_DATA_WIDTH-1:0]	i_inst   				,
	input                                   i_inst_valid            ,
	output  wire   [IMEM_ADDR_WIDTH-1-2:0] 	o_inst_addr    			,
	output	wire							o_inst_addr_valid		,
		
		
	output  wire   							o_data_wr_en  			,
	input	wire							i_data_wr_ready			,
	output  wire  						 	o_data_rd_en  			,
	input   wire   [DBUS_DATA_WIDTH-1 : 0] 	i_data_rd       		,
	input									i_data_rd_valid			,
    output  wire   [8-1 : 0] 				o_data_wmask 			,
	output  wire   [DMEM_ADDR_WIDTH -1 : 0] o_data_addr  			,
	output  wire   [DBUS_DATA_WIDTH-1 : 0] 	o_data_wr    			,

	// IRQ PORT
    input   i_clint_timer_irq,
	output  o_timer_irq_ready    // only for timer interrupt

			    
);


	//----------------------------------------
    // Declarations
    //----------------------------------------
	
	reg		[DBUS_DATA_WIDTH-1:0]   pc ;		
	
	wire							inst_stall;
	wire                            pc_stall ;
	
	//  PC self-increment result
	wire	[DBUS_DATA_WIDTH-1:0]   pc_seq_if_stage;
	
	//	IF stage
	wire	[IBUS_DATA_WIDTH-1:0]	instr_if_stage;

	
	//  IF to ID FFs	
	wire	[IBUS_DATA_WIDTH-1:0]	instr_if2id_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	pc_if2id_ff;

	//ID stage	
	// ID opcode
	wire	[6:0]	opcode_id_stage;
	wire 	[2:0]	funct_code_id_stage;
	// wire			ecall_if_stage;

	//opcode decode result
	wire	                        alu_src_id_stage;
    wire	[2:0]                   mem2reg_id_stage;
    wire	                        reg_write_id_stage;
    wire	                        mem_read_id_stage;
    wire	                        mem_write_id_stage;
    wire	                        branch_id_stage;
    wire	[2:0]                   alu_op_id_stage;
	// wire	[1:0]					pc_src_id_stage;
	wire							csr_rd_id_stage;

	reg		[DBUS_DATA_WIDTH-1:0]	adder_s1_id_stage;
	reg		[DBUS_DATA_WIDTH-1:0]	adder_s2_id_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	pc_jump_id_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	rf_s1_id_stage;
	wire							jump_signal;
	
	wire    [RF_ADDR_WIDTH-1:0]     rf_rd1_addr_id_stage;
	wire    [RF_ADDR_WIDTH-1:0]     rf_rd2_addr_id_stage;
	wire    [DBUS_DATA_WIDTH-1:0]	rf_rd1_data_id_stage;
	wire    [DBUS_DATA_WIDTH-1:0]	rf_rd2_data_id_stage;
	wire    [DBUS_DATA_WIDTH-1:0]   imm_id_stage;
	wire	[3:0]					alu_ctrl_id_stage;
	
	wire							stall_hzd;//stall signal
	wire	[1:0]					fwd_jalr;
	wire							stall_jalr;
	//  ID to EX FFs	
	//opcode decode result ff
	wire	                        alu_src_id2ex_ff;
    wire	[2:0]                   mem2reg_id2ex_ff;
    wire	   	                    reg_write_id2ex_ff;
    wire	       	                mem_read_id2ex_ff;
    wire	           	            mem_write_id2ex_ff;
    wire	               	        branch_id2ex_ff;
    // wire	[2:0]                   alu_op_id2ex_ff;
	// wire	[1:0]					pc_src_id2ex_ff;
	wire	[3:0]					alu_ctrl_id2ex_ff;
	wire							csr_rd_id2ex_ff;

	wire	[IBUS_DATA_WIDTH-1:0] 	instr_id2ex_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	imm_id2ex_ff;
	wire   	[DBUS_DATA_WIDTH-1:0]   rf_rd1_data_id2ex_ff;
	wire 	[DBUS_DATA_WIDTH-1:0]   rf_rd2_data_id2ex_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	pc_id2ex_ff;
	
	
	//EX stage
	reg		[DBUS_DATA_WIDTH-1:0]	alu_s1_data_ex_stage;
	reg		[DBUS_DATA_WIDTH-1:0]	alu_s2_data_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	adder_b_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	adder_s_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	imm_ls_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	alu_a_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	alu_b_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	alu_out_ex_stage;
	wire	[DBUS_DATA_WIDTH-1:0]	store_rd2_data_ex_stage;
	reg		[DBUS_DATA_WIDTH-1:0]	result_ex_stage;
	wire							zero_ex_stage;
	wire							branch_out_signal;
	wire	[1:0]					fwd_a;
	wire	[1:0]					fwd_b;
	
	//EX to MEM FFs
	wire	[2:0]                   mem2reg_ex2mem_ff;
    wire	   	                    reg_write_ex2mem_ff;
    wire	       	                mem_read_ex2mem_ff;
    wire	           	            mem_write_ex2mem_ff;
	
	wire	[DBUS_DATA_WIDTH-1:0]	adder_s_ex2mem_ff;	
	wire	[IBUS_DATA_WIDTH-1:0] 	instr_ex2mem_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	imm_ls_ex2mem_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	pc_ex2mem_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	alu_out_ex2mem_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	result_ex2mem_ff;
	// wire   	[DBUS_DATA_WIDTH-1:0]   rf_rd1_data_ex2mem_ff;
	wire 	[DBUS_DATA_WIDTH-1:0]   rf_rd2_data_ex2mem_ff;
	wire 							csr_rd_ex2mem_ff;			
	//MEM stage
	wire 	[DBUS_DATA_WIDTH-1:0]   rd_data_mem_stage;
	wire 	[DBUS_DATA_WIDTH-1:0]   load_data_mem_stage;
	wire							mem_stall;
	
	//MEM to WB FFs
	wire	[IBUS_DATA_WIDTH-1:0] 	instr_mem2wb_ff;
	// wire	[DBUS_DATA_WIDTH-1:0]	result_mem2wb_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	rd_data_mem2wb_stage;
	wire	[2:0]                   mem2reg_mem2wb_ff;
    wire	   	                    reg_write_mem2wb_ff;
	wire 							csr_rd_mem2wb_ff;	
	wire	[DBUS_DATA_WIDTH-1:0]	adder_s_mem2wb_ff;
	//wire	[IBUS_DATA_WIDTH-1:0]	instr_mem2wb_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	imm_ls_mem2wb_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	pc_mem2wb_ff;
	wire	[DBUS_DATA_WIDTH-1:0]	alu_out_mem2wb_ff;
	//WB stage
	reg		[DBUS_DATA_WIDTH-1:0]	wr_data_wb_stage;
	wire 	[DBUS_DATA_WIDTH-1:0]	rd_csr_data;
	reg		[DBUS_DATA_WIDTH-1:0]	wr_csr_data;
	wire                            reg_write_wb_stage  ;

	//CSR interface
	wire    [DBUS_DATA_WIDTH-3:0]   w_pc_mtvec 			;
	wire    [DBUS_DATA_WIDTH-1:0]   w_pc_mepc 			;
	wire    						w_excep_flush		;
	wire  							w_irq_flush			;
	wire 	[1:0]					w_excep_csr_upd 	;
	wire							w_mret_csr_upd  	;                                                    
	wire    						w_mie_MIE           ;
    wire    					 	w_mstatus_MIE       ;  
	//----------------------------------------
    // Implementations
    //----------------------------------------
	
	always @(posedge clk) begin
		if (sft_rst) begin
            pc <= 64'h3000_0000;
        end
		else if (w_mret_csr_upd) begin
			pc <= w_pc_mepc ;
		end
		else if (w_excep_flush | w_irq_flush) begin
			pc <= {w_pc_mtvec,2'b0} ;
		end
        else if (branch_out_signal) begin
            pc <= adder_s_ex_stage;
        end
		else if(jump_signal) begin
			pc <= pc_jump_id_stage;
		end
		//stall the pipeline
		else if (stall_hzd | stall_jalr | inst_stall | mem_stall)begin//not implemented
			pc <= pc;
		end
		else if (instr_if_stage[6:0] == `YSYX210438_JALR)begin
			pc <= {pc_seq_if_stage[DBUS_DATA_WIDTH-1:1],1'b0};
		end
		// else if (ecall_if_stage)begin
		// 	pc <= {U_CSR.csr_rg[`mtvec][63:2],2'b0};
		// end
		//pc+4 or jump instruction
        else begin
            pc <= pc_seq_if_stage;
        end
    end
	
	
	
	//----------------------------------------
    // IF stage
    //----------------------------------------

	assign instr_if_stage 		= (o_inst_addr_valid & i_inst_valid)?i_inst:'d0					;
	assign o_inst_addr    		= {pc[IMEM_ADDR_WIDTH-1:2]}  									;
	assign inst_stall			= o_inst_addr_valid && !i_inst_valid							;
	
	assign pc_stall = stall_hzd | stall_jalr | (mem_stall) 					    				;
	assign o_inst_addr_valid	= (o_inst_addr != 'd0) & !(pc_stall)							;//not implemented
	
	
	
	// assign ecall_if_stage = (instr_if_stage[6:0] == `YSYX210438_SYSTEM && instr_if_stage[14:12] == 3'b000) ;


	ysyx_210438_riscv_adder #(
        .DATA_WIDTH (DBUS_DATA_WIDTH    )
    ) U_RISCV_ADDER_IF (
        .a          (pc				    ), // I
        .b          (64'd4			    ), // I
        .s          (pc_seq_if_stage    )  // O
    );
	
	// always@(*)begin
		// case(instr_if_stage[6:0])
			// `YSYX210438_JALR:begin	
				// if(fwd_jalr == 2'b01)	adder_s1_if_stage = result_ex2mem_ff;
				// else if(fwd_jalr == 2'b10)	adder_s1_if_stage = wr_data_wb_stage;
				// else adder_s1_if_stage = rf_s1_if_stage;		
			// end
			// default:	adder_s1_if_stage = pc;
		// endcase
	// end
	
	// always@(*)begin
		// case(instr_if_stage[6:0])
			// `YSYX210438_JAL:	adder_s2_if_stage = {{43{instr_if_stage[31]}},instr_if_stage[31],instr_if_stage[19:12],instr_if_stage[20],instr_if_stage[30:21],1'b0};
			// `YSYX210438_JALR:	adder_s2_if_stage = {{52{instr_if_stage[31]}},instr_if_stage[31:20]};
			// default:	adder_s2_if_stage = 64'd4;
		// endcase
	// end
	
	// riscv_jalr_hzd_detect_unit#(
		// .RF_ADDR_WIDTH(RF_ADDR_WIDTH),
		// .IBUS_DATA_WIDTH(IBUS_DATA_WIDTH)
	// ) U_RISCV_JALR_HZD_DETECT_UNIT_IF(

		// .instr_if_stage(instr_if_stage),
		// .instr_if2id_ff(instr_if2id_ff),
		// .reg_write_id_stage(reg_write_id_stage),
		// .rd_id2ex_ff(instr_id2ex_ff[11:7]),
		// .reg_write_id2ex_ff(reg_write_id2ex_ff),
		// .rd_ex2mem_ff(instr_ex2mem_ff[11:7]),
		// .mem_read_ex2mem_ff(mem_read_ex2mem_ff),
		// .reg_write_ex2mem_ff(reg_write_ex2mem_ff),	
		// .rd_mem2wb_ff(instr_mem2wb_ff[11:7]),
		// .reg_write_mem2wb_ff(reg_write_mem2wb_ff),
		// .fwd_jalr(fwd_jalr),
		// .stall_jalr(stall_jalr)
	// );
	//funct_code_id_stage
	//----------------------------------------
    // IF to ID FFs
    //----------------------------------------
	ysyx_210438_riscv_rs_96 #(
		.DATA_WIDTH(IBUS_DATA_WIDTH+DBUS_DATA_WIDTH)
	)U_RISCV_RS_IF2ID (
		.clk(clk),
		.sft_rst(sft_rst),
		.din({instr_if_stage,pc}),
		.flush(w_irq_flush | w_excep_flush | w_mret_csr_upd),//when excep occurs, this instr should not be executed
		
		
		.stall(stall_hzd | mem_stall | stall_jalr),
		
		
		.en(!branch_out_signal & !inst_stall & !jump_signal),//two scenes:stall the pipeline or branch instruction
		.dout({instr_if2id_ff,pc_if2id_ff})
	);
	
	//----------------------------------------
    // ID stage
    //----------------------------------------
	
	assign opcode_id_stage = instr_if2id_ff[6:0];
	assign funct_code_id_stage = instr_if2id_ff[14:12];
	assign jump_signal = (opcode_id_stage == `YSYX210438_JAL) | (opcode_id_stage == `YSYX210438_JALR);
	
	ysyx_210438_riscv_adder #(
      .DATA_WIDTH (DBUS_DATA_WIDTH    )
    ) U_RISCV_ADDER_ID (
        .a          (adder_s1_id_stage  ), // I
        .b          (adder_s2_id_stage  ), // I
        .s          (pc_jump_id_stage   )  // O  // pc_jalr_id_stage => pc_jump_id_stage
    );
	
	always@(*)begin
		case(opcode_id_stage)
			`YSYX210438_JALR:begin	
				if(fwd_jalr == 2'b01)	adder_s1_id_stage = result_ex2mem_ff;
				else if(fwd_jalr == 2'b10)	adder_s1_id_stage = wr_data_wb_stage;
				else adder_s1_id_stage = rf_s1_id_stage;		
			end
			default:	adder_s1_id_stage = pc_if2id_ff;
		endcase
	end
	
	always@(*)begin
		case(opcode_id_stage)
			`YSYX210438_JAL:	adder_s2_id_stage = {{43{instr_if2id_ff[31]}},instr_if2id_ff[31],instr_if2id_ff[19:12],instr_if2id_ff[20],instr_if2id_ff[30:21],1'b0};
			`YSYX210438_JALR:	adder_s2_id_stage = {{52{instr_if2id_ff[31]}},instr_if2id_ff[31:20]};
			default:	adder_s2_id_stage = 64'd0;
		endcase
	end
	
	ysyx_210438_riscv_jalr_hzd_detect_unit#(
		.RF_ADDR_WIDTH(RF_ADDR_WIDTH),
		.IBUS_DATA_WIDTH(IBUS_DATA_WIDTH)
	) U_RISCV_JALR_HZD_DETECT_UNIT_ID(
		.instr_if2id_ff({instr_if2id_ff[19:15],instr_if2id_ff[6:0]}),
		.rd_id2ex_ff(instr_id2ex_ff[11:7]),
		.reg_write_id2ex_ff(reg_write_id2ex_ff),
		.rd_ex2mem_ff(instr_ex2mem_ff[11:7]),
		.mem_read_ex2mem_ff(mem_read_ex2mem_ff),
		.reg_write_ex2mem_ff(reg_write_ex2mem_ff),	
		.rd_mem2wb_ff(instr_mem2wb_ff[11:7]),
		.reg_write_mem2wb_ff(reg_write_mem2wb_ff),
		.fwd_jalr(fwd_jalr),
		.stall_jalr(stall_jalr)
	);

	
	ysyx_210438_riscv_ctrl U_RISCV_CTRL (
        .opcode     (opcode_id_stage    ), // I
		.funct_code	(funct_code_id_stage),
        .alu_src    (alu_src_id_stage   ), // O
        .mem2reg    (mem2reg_id_stage   ), // O
        .reg_write  (reg_write_id_stage ), // O
        .mem_read   (mem_read_id_stage  ), // O
        .mem_write  (mem_write_id_stage ), // O
        .branch     (branch_id_stage    ), // O
		//.pc_src_ctrl(pc_src_id_stage	), // O
        .alu_op     (alu_op_id_stage    ),  // O
		.csr_rd		(csr_rd_id_stage	)
    );
	
	ysyx_210438_riscv_alu_ctrl U_RISCV_ALU_CTRL(
		.alu_op(alu_op_id_stage),
		.func_code({instr_if2id_ff[30],instr_if2id_ff[14:12]}),
		.alu_ctrl(alu_ctrl_id_stage)
	);
	
	assign rf_rd1_addr_id_stage = instr_if2id_ff[19:15];
    assign rf_rd2_addr_id_stage = instr_if2id_ff[24:20];
	wire    [DBUS_DATA_WIDTH-1:0] rf_rd4_data_id_stage;
	
	ysyx_210438_riscv_rf #(
        .DATA_WIDTH (DBUS_DATA_WIDTH    ),
        .ADDR_WIDTH (RF_ADDR_WIDTH      )
    ) U_RISCV_RF (
        .clk        (clk                ), // I
		.rst		(sft_rst			),
        .rd1_addr   (rf_rd1_addr_id_stage), // I
        .rd1_en     (1'b1               ), // I
        .rd1_data   (rf_rd1_data_id_stage), // O
        .rd2_addr   (rf_rd2_addr_id_stage), // I
        .rd2_en     (1'b1               ), // I
        .rd2_data   (rf_rd2_data_id_stage), // O
		
		//YSYX210438_JALR read register in IF stage 
		.rd3_addr   (instr_if2id_ff[19:15]),
		.rd3_en     (1'b1               ), // I
        .rd3_data   (rf_s1_id_stage		), // O

		.rd4_addr	(instr_mem2wb_ff[19:15]),
		.rd4_data	(rf_rd4_data_id_stage),
		
        .wr_addr    (instr_mem2wb_ff[11:7]), // I
        .wr_en      (reg_write_wb_stage), // I
        .wr_data    (wr_data_wb_stage)
    );
	
	ysyx_210438_riscv_imm_gen #(
        .IBUS_DATA_WIDTH(IBUS_DATA_WIDTH),
        .DBUS_DATA_WIDTH(DBUS_DATA_WIDTH)
    ) U_RISCV_IMM_GEN (
        .instr      (instr_if2id_ff     ), // I
        .imm        (imm_id_stage       )  // O
    );

	ysyx_210438_riscv_hzd_detect_unit#(
		.RF_ADDR_WIDTH(RF_ADDR_WIDTH)
	)U_RISCV_HZD_DETECT_UNIT (
		.rs1_if2id_ff(instr_if2id_ff[19:15]),
		.rs2_if2id_ff(instr_if2id_ff[24:20]),
		
		.rd_id2ex_ff(instr_id2ex_ff[11:7]),
		.csr_rd_id2ex_ff(csr_rd_id2ex_ff),
		//.csr_rd_ex2mem_ff(csr_rd_ex2mem_ff),
		.mem_read_id2ex_ff(mem_read_id2ex_ff),
	    
		.stall(stall_hzd)
	);
	
	//---------------------------------riscv_rs-------
    // ID to EX FFs
    //----------------------------------------
	ysyx_210438_riscv_rs_301 #(
		.DATA_WIDTH(1+1+3+1+1+1+1+4+IBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH)
	)U_RISCV_RS_ID2EX (
		.clk(clk),
		.sft_rst(sft_rst),
		.stall(mem_stall),
		.flush(w_irq_flush | w_excep_flush | w_mret_csr_upd),
		.din({
			alu_src_id_stage,
			mem2reg_id_stage,
			reg_write_id_stage,
			mem_read_id_stage,
			mem_write_id_stage,
			branch_id_stage,
			// alu_op_id_stage,
			// pc_src_id_stage,
			alu_ctrl_id_stage,
			csr_rd_id_stage,
			instr_if2id_ff,
			imm_id_stage,
			rf_rd1_data_id_stage,
			rf_rd2_data_id_stage,
			pc_if2id_ff
		}),
		.en(!branch_out_signal & !stall_hzd & !stall_jalr),//branch instruction
		.dout({
			alu_src_id2ex_ff,
		    mem2reg_id2ex_ff,
		    reg_write_id2ex_ff,
		    mem_read_id2ex_ff,
		    mem_write_id2ex_ff,
		    branch_id2ex_ff,
		    // alu_op_id2ex_ff,
		    // pc_src_id2ex_ff,
		    alu_ctrl_id2ex_ff,
			csr_rd_id2ex_ff,
			instr_id2ex_ff,
			imm_id2ex_ff,
			rf_rd1_data_id2ex_ff,
			rf_rd2_data_id2ex_ff,
			pc_id2ex_ff
		})
	);
	
	//----------------------------------------
    // EX Stage
    //----------------------------------------	
	
	assign alu_a_ex_stage = alu_s1_data_ex_stage;
	assign alu_b_ex_stage = (alu_src_id2ex_ff == 1)?imm_id2ex_ff:alu_s2_data_ex_stage;

	always@(*)begin
		case(fwd_a)
			2'b10:	alu_s1_data_ex_stage = result_ex2mem_ff;
			2'b01:	alu_s1_data_ex_stage = wr_data_wb_stage;
			default:	alu_s1_data_ex_stage = rf_rd1_data_id2ex_ff[DBUS_DATA_WIDTH-1:0];
		endcase
	end
	
	always@(*)begin
		case(fwd_b)
			2'b10:	alu_s2_data_ex_stage = result_ex2mem_ff;
			2'b01:	alu_s2_data_ex_stage = wr_data_wb_stage;
			default:	alu_s2_data_ex_stage = rf_rd2_data_id2ex_ff[DBUS_DATA_WIDTH-1:0];
		endcase
	end
	
	ysyx_210438_riscv_alu #(
        .WIDTH      (DBUS_DATA_WIDTH    )
    ) U_RISCV_ALU (
        .a          (alu_a_ex_stage     ), // I
        .b          (alu_b_ex_stage     ), // I
        .alu_ctrl   (alu_ctrl_id2ex_ff  ), // I
        .alu_out    (alu_out_ex_stage   ), // O
        .zero       (zero_ex_stage      )  // O
    );
	
	ysyx_210438_riscv_branch U_RISCV_BRANCH(
		.branch(branch_id2ex_ff),
		.func_code(instr_id2ex_ff[14:12]),
		.alu_out(alu_out_ex_stage[DBUS_DATA_WIDTH-1]),
		.rs1(alu_a_ex_stage[DBUS_DATA_WIDTH-1]),
		.rs2(alu_b_ex_stage[DBUS_DATA_WIDTH-1]),
		.zero(zero_ex_stage),
		.branch_out(branch_out_signal)
	);

	ysyx_210438_riscv_adder #(
        .DATA_WIDTH (DBUS_DATA_WIDTH    )
    ) U_RISCV_ADDER_EX (
        .a          (pc_id2ex_ff        ), // I
        .b          (adder_b_ex_stage   ), // I
        .s          (adder_s_ex_stage   )  // O
    );
	
	//立即数左移12位结果,符号扩展已在立即数生成时完成
	assign imm_ls_ex_stage = imm_id2ex_ff<<12;
	
	//指令是AUIPC、分支指令时需特殊对待
	assign adder_b_ex_stage = (mem2reg_id2ex_ff == 3'b100)?imm_ls_ex_stage:((branch_id2ex_ff == 1)?imm_id2ex_ff:64'd4);
	
	ysyx_210438_riscv_fwd_unit #(
    .RF_ADDR_WIDTH(RF_ADDR_WIDTH)
	) U_RISCV_FWD_UNIT(
		.rs1_id2ex_ff(instr_id2ex_ff[19:15]),
		.rs2_id2ex_ff(instr_id2ex_ff[24:20]),
		
		.rd_ex2mem_ff(instr_ex2mem_ff[11:7]),
		.rd_mem2wb_ff(instr_mem2wb_ff[11:7]),
	
		.reg_write_ex2mem_ff(reg_write_ex2mem_ff),
		.reg_write_mem2wb_ff(reg_write_mem2wb_ff),
	
		.fwd_a(fwd_a),
		.fwd_b(fwd_b)
	);
	
	always@(*)begin
		case(mem2reg_id2ex_ff)
			3'b000:	result_ex_stage = alu_out_ex_stage;
			3'b001:	result_ex_stage = alu_out_ex_stage;
			3'b010:	result_ex_stage = imm_ls_ex_stage;
			3'b011:	result_ex_stage = adder_s_ex_stage;
			3'b100:	result_ex_stage = adder_s_ex_stage;
			default:	result_ex_stage = alu_out_ex_stage;
		endcase
	end
	
	wire[7:0]	data_wmask;

	ysyx_210438_riscv_store#(
    .WIDTH (DBUS_DATA_WIDTH)
	) RISCV_STORE_EX(
		.mem_read(mem_read_id2ex_ff),
		.mem_write(mem_write_id2ex_ff),
		.func_code(instr_id2ex_ff[14:12]),
		.reg2_out(alu_s2_data_ex_stage[DBUS_DATA_WIDTH-1:0]),
		.store_out(store_rd2_data_ex_stage),
		.mask_out(data_wmask)
	);
	
	//----------------------------------------
    // EX to MEM FFs
    //----------------------------------------
	ysyx_210438_riscv_rs_431 #(
		.DATA_WIDTH(1+8+3+1+1+1+DBUS_DATA_WIDTH+IBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH)
	)U_RISCV_RS_EX2MEM (
		.clk(clk),
		.sft_rst(sft_rst),
		.stall(mem_stall),
		.flush(w_irq_flush | w_excep_flush | w_mret_csr_upd),
		.din({
			mem2reg_id2ex_ff,
			reg_write_id2ex_ff,
			mem_read_id2ex_ff,
			mem_write_id2ex_ff,
			csr_rd_id2ex_ff,
			data_wmask,
			adder_s_ex_stage,
			instr_id2ex_ff,
			imm_ls_ex_stage,
			pc_id2ex_ff,
			alu_out_ex_stage,
			result_ex_stage,
			// rf_rd1_data_id2ex_ff,
			store_rd2_data_ex_stage
		}),
		.en(1'b1), // 1'b1
		.dout({
			mem2reg_ex2mem_ff,
			reg_write_ex2mem_ff,
			mem_read_ex2mem_ff,
			mem_write_ex2mem_ff,
			csr_rd_ex2mem_ff,
			o_data_wmask,
			adder_s_ex2mem_ff,
			instr_ex2mem_ff,
			imm_ls_ex2mem_ff,
			pc_ex2mem_ff,
			alu_out_ex2mem_ff,
			result_ex2mem_ff,
			// rf_rd1_data_ex2mem_ff,
			rf_rd2_data_ex2mem_ff
		})
	);
	
	//----------------------------------------
    // MEM stage
    //----------------------------------------
	
	assign o_data_wr_en  	= (mem_read_ex2mem_ff | mem_write_ex2mem_ff) &   mem_write_ex2mem_ff & !(w_irq_flush | w_excep_flush | w_mret_csr_upd);
	assign o_data_rd_en  	= (mem_read_ex2mem_ff | mem_write_ex2mem_ff) & (~mem_write_ex2mem_ff) & !(w_irq_flush | w_excep_flush | w_mret_csr_upd);
	assign o_data_addr  	= {alu_out_ex2mem_ff[DMEM_ADDR_WIDTH-1:0]};
	assign o_data_wr    	= rf_rd2_data_ex2mem_ff;
	assign rd_data_mem_stage  = i_data_rd    		;

	ysyx_210438_riscv_load #(
		.WIDTH (DBUS_DATA_WIDTH)
	) RISCV_LOAD_DMEM(
		.mem_read(mem_read_ex2mem_ff),
		.func_code(instr_ex2mem_ff[14:12]),
		.mem_out(rd_data_mem_stage),
		.load_out(load_data_mem_stage)
	);

	assign mem_stall = {o_data_wr_en & !i_data_wr_ready} | (o_data_rd_en & !i_data_rd_valid);
	
	// wire [DMEM_ADDR_WIDTH-1:0]	o_data_addr_mem2wb_ff;

	//----------------------------------------
    // MEM to WB FFs
    //----------------------------------------
	ysyx_210438_riscv_rs_357 #(
		.DATA_WIDTH(1+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+3+1+DBUS_DATA_WIDTH+DBUS_DATA_WIDTH+IBUS_DATA_WIDTH)
	)U_RISCV_RS_MEM2WB (
		.clk(clk),
		.sft_rst(sft_rst),
		.stall(1'd0),
		.flush(w_irq_flush | w_excep_flush | w_mret_csr_upd),
		.din({
			load_data_mem_stage, // DBUS_DATA_WIDTH
			mem2reg_ex2mem_ff,   // 3
			reg_write_ex2mem_ff, // 1 
			csr_rd_ex2mem_ff,    // 2
			imm_ls_ex2mem_ff,    // DBUS_DATA_WIDTH
			pc_ex2mem_ff,        // DBUS_DATA_WIDTH
			alu_out_ex2mem_ff,   // DBUS_DATA_WIDTH
			instr_ex2mem_ff,     // IBUS_DATA_WIDTH
			// result_ex2mem_ff,
			adder_s_ex2mem_ff    // DBUS_DATA_WIDTH
			// o_data_addr          // DMEM_ADDR_WIDTH
		}),
		.en(!mem_stall), //1'b1
		.dout({
			rd_data_mem2wb_stage,
			mem2reg_mem2wb_ff,
			reg_write_mem2wb_ff,
			csr_rd_mem2wb_ff,
			imm_ls_mem2wb_ff,
			pc_mem2wb_ff,
			alu_out_mem2wb_ff,
			instr_mem2wb_ff,
			// result_mem2wb_ff,
			adder_s_mem2wb_ff 
			// o_data_addr_mem2wb_ff
		})
	);
	//----------------------------------------
    // WB stage
    //----------------------------------------
	
	always@(*)begin
		if(reg_write_mem2wb_ff && (instr_mem2wb_ff[11:7] != 0))begin
			case(mem2reg_mem2wb_ff)
				3'b000:	wr_data_wb_stage = alu_out_mem2wb_ff;
				3'b001:	wr_data_wb_stage = rd_data_mem2wb_stage;
				3'b010:	wr_data_wb_stage = imm_ls_mem2wb_ff;
				3'b011:	wr_data_wb_stage = adder_s_mem2wb_ff;
				3'b100:	wr_data_wb_stage = adder_s_mem2wb_ff;
				3'b101:	wr_data_wb_stage = rd_csr_data;
				default:	wr_data_wb_stage = 64'd0;
			endcase
		end
		else	wr_data_wb_stage = 64'd0;
	end
	// wire [64-1:0] rd1_csr_data ;
	ysyx_210438_riscv_csr #(
    	.ADDR_WIDTH(12),
		.I_BUS_WIDTH(32),
    	.D_BUS_WIDTH(64)
	) U_CSR (
	    .clk(clk),
	    .rst(sft_rst),

	    .wr_en(csr_rd_mem2wb_ff),
	    .wr_addr(instr_mem2wb_ff[31:20]),
	    .wr_data(wr_csr_data),
        .rd_en(csr_rd_mem2wb_ff),
	    .rd_addr(instr_mem2wb_ff[31:20]),
	    .rd_data(rd_csr_data),

		// .rd1_addr(instr_mem2wb_ff[31:20]),
		// .rd1_data(rd1_csr_data),

		.o_pc_mtvec       (w_pc_mtvec 	   ) ,
		.o_pc_mepc		  (w_pc_mepc       ) ,
		// .instr_if_stage	 (instr_if_stage  ),
		// .instr_if2id_ff   (instr_if2id_ff  ),
		// .instr_id2ex_ff	 (instr_id2ex_ff  ) ,
		// .instr_ex2mem_ff  (instr_ex2mem_ff ) ,
		.instr_mem2wb_ff  (instr_mem2wb_ff ) ,
		.pc_if2id_ff	  (pc_if2id_ff     ),
		.pc_id2ex_ff  	  (pc_id2ex_ff     ),
		.pc_ex2mem_ff     (pc_ex2mem_ff    ),
		.pc_mem2wb_ff	  (pc_mem2wb_ff    ) ,
		.pc_if_stage	  (pc			   ) ,
    	.i_excep_csr_upd  (w_excep_csr_upd ) ,
    	.i_mret_csr_upd   (w_mret_csr_upd  ) ,
    	.o_mie_MIE        (w_mie_MIE       ) ,
    	.o_mstatus_MIE    (w_mstatus_MIE   ) 
	);

	ysyx_210438_riscv_excep_detect_unit#(
		// .ADDR_WIDTH (12),
		.I_BUS_WIDTH(32)
		//.D_BUS_WIDTH(64)
	) U_RISCV_EXCEP_DETECT_UNIT (
		.i_instr_mem2wb_ff ({instr_mem2wb_ff[31:20],instr_mem2wb_ff[6:0]} ) ,
		//.i_instr_if_stage  (pc				),
		.i_clint_timer_irq (i_clint_timer_irq),
		.i_mie_MIE         (w_mie_MIE  		) ,
		.i_mstatus_MIE     (w_mstatus_MIE 	) ,
		.o_excep_stall     (w_excep_flush	) ,  // 
		.o_irq_stall       (w_irq_flush		) ,  // 计时器中断引起的stall
		.o_excep_csr_upd   (w_excep_csr_upd ) ,  // output to csr to uopdate  the CSRs by ecall instruction and so on
		.o_mret_csr_upd    (w_mret_csr_upd  ) ,  // output to csr to uopdate  the CSRs by mret instruction
		.o_core_ready	   (o_timer_irq_ready)

	);
       
	assign reg_write_wb_stage = (w_irq_flush) ? 0:reg_write_mem2wb_ff ;

	always@(*)begin
		case(instr_mem2wb_ff[14:12])
			3'b001:	wr_csr_data	= rf_rd4_data_id_stage;
			3'b010:	wr_csr_data	= rf_rd4_data_id_stage | rd_csr_data; // rd1_csr_data
			3'b011:	wr_csr_data	= ~rf_rd4_data_id_stage & rd_csr_data; // rd1_csr_data
			3'b101:	wr_csr_data = {59'd0,instr_mem2wb_ff[19:15]};
			3'b110:	wr_csr_data = {59'd0,instr_mem2wb_ff[19:15]} | rd_csr_data; // rd1_csr_data
			3'b111:	wr_csr_data = ~{59'd0,instr_mem2wb_ff[19:15]} & rd_csr_data; // rd1_csr_data
			default:wr_csr_data = 64'd0;
		endcase
	end

	//test putch implementation

	// integer	handle1;
	// initial begin
	// 	handle1=$fopen("/home/wyf/RISCV-CPU/test.txt","w");
	// end
	// always@(posedge clk)begin
	// 	if(instr_mem2wb_ff == 32'h7b)begin
	// 		//$fdisplay(handle1,"%c",o_rf_10);
	// 		$write("%c",U_RISCV_RF.rf[10]);
	// 	end
	// end


endmodule




module ysyx_210438_riscv_csr #(
    parameter ADDR_WIDTH  = 12,
    parameter I_BUS_WIDTH = 32,
    parameter D_BUS_WIDTH = 64
)(
    input                              clk              ,
    input                              rst              ,

    input                              wr_en            ,
    input          [ADDR_WIDTH-1:0]    wr_addr          ,
    input          [D_BUS_WIDTH-1:0]   wr_data          ,
  
    input                              rd_en            ,
    input          [ADDR_WIDTH-1:0]    rd_addr          ,
    output  reg    [D_BUS_WIDTH-1:0]   rd_data          ,

    // input          [ADDR_WIDTH-1:0]    rd1_addr         ,
    // output  reg    [D_BUS_WIDTH-1:0]   rd1_data         ,

    output         [D_BUS_WIDTH-3:0]   o_pc_mtvec       ,  // 中断服务函数入口
    output         [D_BUS_WIDTH-1:0]   o_pc_mepc        ,  // 中断函数返回地址
    //input          [D_BUS_WIDTH-1:0]   pc_if2id_ff      ,
    // input          [I_BUS_WIDTH-1:0]   instr_if_stage   ,
    // input          [I_BUS_WIDTH-1:0]   instr_if2id_ff   ,
    // input          [I_BUS_WIDTH-1:0]   instr_id2ex_ff   ,
    // input          [I_BUS_WIDTH-1:0]   instr_ex2mem_ff  ,
    input          [I_BUS_WIDTH-1:0]   instr_mem2wb_ff  ,
    input          [D_BUS_WIDTH-1:0]   pc_if2id_ff      ,
    input          [D_BUS_WIDTH-1:0]   pc_id2ex_ff      ,
    input          [D_BUS_WIDTH-1:0]   pc_ex2mem_ff     ,
    input          [D_BUS_WIDTH-1:0]   pc_mem2wb_ff     ,
    input          [D_BUS_WIDTH-1:0]   pc_if_stage      ,
    input          [1:0]               i_excep_csr_upd  ,
    input                              i_mret_csr_upd   ,
    output                             o_mie_MIE        ,
    output                             o_mstatus_MIE        
);

// reg    [D_BUS_WIDTH-1:0] csr_rg  [2**ADDR_WIDTH-1:0];

reg [D_BUS_WIDTH-1:0] csr_rg_m_cycle	;
reg [D_BUS_WIDTH-1:0] csr_rg_mstatus	;
reg [D_BUS_WIDTH-1:0] csr_rg_mie		;
reg [D_BUS_WIDTH-1:0] csr_rg_mtvec		;
reg [D_BUS_WIDTH-1:0] csr_rg_mepc		;
reg [D_BUS_WIDTH-1:0] csr_rg_mcause		;
reg [D_BUS_WIDTH-1:0] csr_rg_mtval		; 
reg [D_BUS_WIDTH-1:0] csr_rg_minstret 	;
reg [D_BUS_WIDTH-1:0] csr_rg_mscratch 	; 
reg [D_BUS_WIDTH-1:0] csr_rg_mip	 	; 

// assign rd1_data = csr_rg[rd1_addr];
// assign rd1_data = rd_en ? csr_rg[rd1_addr] : 'd0;

// always@(*)begin
//     if(rst) rd1_data = 'd0;
//     else if(rd_en)  begin
// 		case(rd1_addr)
// 			`YSYX210438_M_CYCLE  : rd1_data = csr_rg_m_cycle	;
// 			`YSYX210438_MSTATUS  : rd1_data = csr_rg_mstatus	;
// 			`YSYX210438_MIE      : rd1_data = csr_rg_mie		;
// 			`YSYX210438_MTVEC    : rd1_data = csr_rg_mtvec	;
// 			`YSYX210438_MEPC     : rd1_data = csr_rg_mepc	;
// 			`YSYX210438_MCAUSE   : rd1_data = csr_rg_mcause	;
// 			`YSYX210438_MTVAL    : rd1_data = csr_rg_mtval	;
// 			`YSYX210438_MINSTRET : rd1_data = csr_rg_minstret;
// 			`YSYX210438_MSCRATCH : rd1_data = csr_rg_mscratch;
// 			`YSYX210438_MIP      : rd1_data = csr_rg_mip	 	;
// 			default: begin
// 				rd1_data = 'd0	;
// 			end
// 		endcase
// 	end
//     else rd1_data = 'd0;
// end

//rd_data
// always@(*)begin
//     if(rst) rd_data = 'd0;
//     else if(rd_en)  rd_data = csr_rg[rd_addr];
//     else rd_data = 'd0;
// end

always@(*)begin
    if(rst) rd_data = 'd0;
    else if(rd_en)  begin
		case(rd_addr)
			`YSYX210438_M_CYCLE  : rd_data = csr_rg_m_cycle	;
			`YSYX210438_MSTATUS  : rd_data = csr_rg_mstatus	;
			`YSYX210438_MIE      : rd_data = csr_rg_mie		;
			`YSYX210438_MTVEC    : rd_data = csr_rg_mtvec	;
			`YSYX210438_MEPC     : rd_data = csr_rg_mepc	;
			`YSYX210438_MCAUSE   : rd_data = csr_rg_mcause	;
			`YSYX210438_MTVAL    : rd_data = csr_rg_mtval	;
			`YSYX210438_MINSTRET : rd_data = csr_rg_minstret;
			`YSYX210438_MSCRATCH : rd_data = csr_rg_mscratch;
			`YSYX210438_MIP      : rd_data = csr_rg_mip	 	;
			default: begin
				rd_data = 'd0	;
			end
		endcase
	end
    else rd_data = 'd0;
end



//m_cycle(csr_rg[])
always@(posedge clk)begin
    if(rst) csr_rg_m_cycle <= 'd0;
    else if(wr_en && wr_addr == `YSYX210438_M_CYCLE)  csr_rg_m_cycle <= wr_data;
    else csr_rg_m_cycle <= csr_rg_m_cycle + 'd1;
end

// mstatus

assign o_mstatus_MIE = csr_rg_mstatus[3]  ;

always@(posedge clk)begin
    if(rst) csr_rg_mstatus <= 'd0;
    else if(i_excep_csr_upd!=2'b00)
        csr_rg_mstatus <= {csr_rg_mstatus[D_BUS_WIDTH-1:13],2'b11,csr_rg_mstatus[10:8],csr_rg_mstatus[3],csr_rg_mstatus[6:4],1'b0,csr_rg_mstatus[2:0]} ;
    else if(i_mret_csr_upd)
        csr_rg_mstatus <= {csr_rg_mstatus[D_BUS_WIDTH-1:13],2'b11,csr_rg_mstatus[10:8],1'b1,csr_rg_mstatus[6:4],csr_rg_mstatus[7],csr_rg_mstatus[2:0]} ;    
    else if(wr_en && wr_addr == `YSYX210438_MSTATUS)begin
         csr_rg_mstatus <= {((wr_data[16:15] == 2'b11) | (wr_data[14:13] == 2'b11)),wr_data[62:0]};
    end 
    else csr_rg_mstatus <= csr_rg_mstatus ;
end

// mie 
assign o_mie_MIE = csr_rg_mie[7] ;
always@(posedge clk)begin
    if(rst) csr_rg_mie <= 'd0;
    else if(wr_en && wr_addr == `YSYX210438_MIE)  csr_rg_mie <= wr_data;
    else csr_rg_mie <= csr_rg_mie ;
end

// mtvec 
assign o_pc_mtvec = csr_rg_mtvec[D_BUS_WIDTH-1:2];

always@(posedge clk)begin
    if(rst) csr_rg_mtvec <= 'd0;
    else if(wr_en && wr_addr == `YSYX210438_MTVEC)  csr_rg_mtvec <= wr_data;
    else csr_rg_mtvec <= csr_rg_mtvec ;
end

// mepc
// reg    [I_BUS_WIDTH-1:0] r_mepc_instr ;
assign o_pc_mepc =csr_rg_mepc ;

always@(posedge clk)begin
    if(rst) begin 
        // r_mepc_instr  <= 'd0 ;
       csr_rg_mepc <= 'd0 ;
    end
    else if(i_excep_csr_upd == 2'b01) begin
       csr_rg_mepc <= pc_mem2wb_ff ;  // 保存进入trap前的pc
        // r_mepc_instr  <= instr_mem2wb_ff ;
    end
    else if(i_excep_csr_upd == 2'b10) begin
        if(pc_mem2wb_ff != 'd0) begin
            // r_mepc_instr  <= instr_mem2wb_ff ;
           csr_rg_mepc <= pc_mem2wb_ff;
        end
        else if(pc_ex2mem_ff != 'd0) begin
            // r_mepc_instr  <= instr_ex2mem_ff ;
           csr_rg_mepc <= pc_ex2mem_ff;
        end
        else if(pc_if2id_ff != 'd0) begin
            // r_mepc_instr  <= instr_id2ex_ff ;
           csr_rg_mepc <= pc_id2ex_ff;    
        end
        else begin
            // r_mepc_instr  <= instr_id2ex_ff ;  // attention
           csr_rg_mepc <= pc_if_stage;    
        end     
    end
    else if(wr_en && wr_addr == `YSYX210438_MEPC)  begin
       csr_rg_mepc <= wr_data;
        // r_mepc_instr  <= r_mepc_instr ;
    end
    else begin
       csr_rg_mepc <=csr_rg_mepc ;
        // r_mepc_instr  <= r_mepc_instr ;
    end
end

// mcause

always@(posedge clk)begin
    if(rst) csr_rg_mcause <= 'd0;
    else if(i_excep_csr_upd==2'b01) 
        csr_rg_mcause <= 64'd11 ;
    else if(i_excep_csr_upd==2'b10) 
        csr_rg_mcause <= 64'h8000_0000_8000_0007 ;
    else if(wr_en && wr_addr == `YSYX210438_MCAUSE)  csr_rg_mcause <= wr_data;
    else csr_rg_mcause <= csr_rg_mcause ;
end

//mtval

always@(posedge clk)begin
    csr_rg_mtval <= 64'd0;
end

//minstret

always@(posedge clk)begin
    if(rst) csr_rg_minstret <= 'd0;
    else if(i_excep_csr_upd != 2'b10 && instr_mem2wb_ff != 'd0)   csr_rg_minstret <= csr_rg_minstret + 64'd1;
    else csr_rg_minstret <= csr_rg_minstret;
end

//mscratch

always@(posedge clk)begin
    if(rst) csr_rg_mscratch <= 'd0;
    else if(wr_en && wr_addr == `YSYX210438_MSCRATCH)  csr_rg_mscratch <= wr_data;
    else csr_rg_mscratch <= csr_rg_mscratch ;
end

// mip

always@(posedge clk)begin
    if(rst) 
        csr_rg_mip <= 'd0;
    else if(i_excep_csr_upd == 2'b10) begin
        csr_rg_mip <= {csr_rg_mip[D_BUS_WIDTH-1:8],1'b1,csr_rg_mip[6:0]} ;
    end
    else begin
        csr_rg_mip <= {csr_rg_mip[D_BUS_WIDTH-1:8],1'b0,csr_rg_mip[6:0]} ;
    end
end

endmodule



module ysyx_210438_riscv_ctrl (
    input   wire  [6:0]   opcode, // instruction[6:0]
	input	wire  [2:0]	  funct_code,
    output  reg           alu_src,
    output  reg   [2:0]   mem2reg,//000代表ALU提供寄存器输入，001代表存储器提供寄存器输入，010代表立即数提供寄存器输入，011代表PC+4提供寄存器输入,100代表PC+立即数提供寄存器输入
								  //101代表csr提供输入
    output  reg           reg_write,
    output  reg           mem_read,
    output  reg           mem_write,
    output  reg           branch,
	// output  reg	  [1:0]	  pc_src_ctrl,//10寄存器加立即数计算结果跳转,01无条件跳转,00无强制跳转
    output  reg   [2:0]   alu_op,
	output	reg			  csr_rd
);

    //	ECALL,EBREAK unimplemented,maybe additional siganls need to be added
    always@(*) begin
        case (opcode)
            7'b000_0000 :   {csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_0000_000;
			//YSYX210438_LUI                                                                                             
            `YSYX210438_LUI 		:   {csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00010_1000_000;
			//YSYX210438_AUIPC                                                                                           
			`YSYX210438_AUIPC 		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00100_1000_000;
			//YSYX210438_JAL                                                                                             
			`YSYX210438_JAL 		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00011_1000_000;
			//YSYX210438_JALR                                                                                            
			`YSYX210438_JALR 		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00011_1000_000;
			//BEQ,BNE,BLT,BGE,BLTU,BGEU                                                                       
			`YSYX210438_BRANCH 	:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_0001_001;
			//LB,LH,LW,LBU,LHU                                                                                
			`YSYX210438_LOAD 		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b01001_1100_000;
			//SB,SH,SW                                                                                        
			`YSYX210438_STORE 		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b01000_0010_000;
			//ADDI,SLTI,SLTIU,XORI,ORI,ANNDI,SLLI,SRLI,SRAI                                                   
			`YSYX210438_OP_IMM 	:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b01000_1000_011;
			//ADD,SUB,SLL,SLT,SLTU,XOR,SRL,SRA,OR,AND                                                         
			`YSYX210438_OP 		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_1000_010;
			//FENCE                                                                                           
			`YSYX210438_MISC_MEM 	:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_0000_000;
			//CSRRW,CSRRS,CSRRC,CSRRWI,CSRRSI,CSRRCI                                                                             
			`YSYX210438_SYSTEM 	:begin
				if(funct_code == 3'b000)begin
					{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_0000_000;
				end
				else begin
					{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b10101_1000_000;
				end
			end
			//ADDIW,SLLIW,SRLIW,SRAIW                                                                                      
			`YSYX210438_OP_IMM_32	:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b01000_1000_111;
			//ADDW,SUBW,SLLW,SRLW,SRAW
			`YSYX210438_OP_32		:	{csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_1000_110;
			default     :   {csr_rd,alu_src, mem2reg, reg_write, mem_read, mem_write, branch, alu_op} = 12'b00000_0000_000;
        endcase
    end

endmodule



module ysyx_210438_riscv_excep_detect_unit #(
    // parameter ADDR_WIDTH  = 12,
    parameter I_BUS_WIDTH = 32
    //parameter D_BUS_WIDTH = 64
)(
    input [I_BUS_WIDTH-1-13:0] i_instr_mem2wb_ff,
    //input [I_BUS_WIDTH-1:0] i_instr_if_stage ,
    input                   i_clint_timer_irq,

    input                   i_mie_MIE        ,
    input                   i_mstatus_MIE    ,  

    output                  o_excep_stall    ,  // 
    output                  o_irq_stall      ,  // 
    output  reg   [1:0]     o_excep_csr_upd  ,  // output to csr to update the CSRs by ecall instruction and so on
    output                  o_mret_csr_upd   ,  // output to csr to update the CSRs by mret instruction
    output                  o_core_ready 

);
    wire clint_timer_irq_vld ;
    // wire excep_vld ;

    assign o_core_ready        = i_mstatus_MIE & i_mie_MIE ;
    assign clint_timer_irq_vld = i_clint_timer_irq & i_mstatus_MIE & i_mie_MIE ;
    assign o_excep_stall       = (i_instr_mem2wb_ff[6:0] == 7'b1110011 && i_instr_mem2wb_ff[18:7] == 12'd0);  //仅支持了 ecall 指令
    assign o_irq_stall         = clint_timer_irq_vld ;
    assign o_mret_csr_upd      = (i_instr_mem2wb_ff[6:0] == 7'b1110011 && i_instr_mem2wb_ff[18:7] == 12'b0011_0000_0010) ;

    always@(*)begin
        if(o_excep_stall)  // 异常发生
            o_excep_csr_upd = 2'b01 ;
        else if(clint_timer_irq_vld)  // 计时器中断，在 MTIE和 MIE位有效时
            o_excep_csr_upd = 2'b10 ;
        else
            o_excep_csr_upd = 2'b00 ;
    end

endmodule




module ysyx_210438_riscv_ext_i #(
    parameter   IS_SIGNED = 1,     // 0: unsigned, otherwise: signed
    parameter   DATA_WIDTH_I = 12,
    parameter   DATA_WIDTH_O = 64
) (
    input   wire   [DATA_WIDTH_I-1:0]  data_i,
    output  reg	   [DATA_WIDTH_O-1:0]  data_o
);
	genvar i ;
	generate
		if(IS_SIGNED == 0) begin : ext_i_select
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
			end
		end
		else begin
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
			end
		end
	endgenerate

    // always@(*)begin
    //    if (IS_SIGNED == 0) begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
    //    end
    //    else begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
    //    end
	// end

endmodule

module ysyx_210438_riscv_ext_s #(
    parameter   IS_SIGNED = 1,     // 0: unsigned, otherwise: signed
    parameter   DATA_WIDTH_I = 12,
    parameter   DATA_WIDTH_O = 64
) (
    input   wire   [DATA_WIDTH_I-1:0]  data_i,
    output  reg	   [DATA_WIDTH_O-1:0]  data_o
);

	genvar i ;
	generate
		if(IS_SIGNED == 0) begin : ext_s_select
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
			end
		end
		else begin
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
			end
		end
	endgenerate

   	// always@(*)begin
    //    if (IS_SIGNED == 0) begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
    //    end
    //    else begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
    //    end
	// end


endmodule

module ysyx_210438_riscv_ext_b #(
    parameter   IS_SIGNED = 1,     // 0: unsigned, otherwise: signed
    parameter   DATA_WIDTH_I = 13,
    parameter   DATA_WIDTH_O = 64
) (
    input   wire   [DATA_WIDTH_I-1:0]  data_i,
    output  reg	   [DATA_WIDTH_O-1:0]  data_o
);

	genvar i ;
	generate
		if(IS_SIGNED == 0) begin : ext_b_select
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
			end
		end
		else begin
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
			end
		end
	endgenerate

    // always@(*)begin
    //    if (IS_SIGNED == 0) begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
    //    end
    //    else begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
    //    end
	// end

endmodule

module ysyx_210438_riscv_ext_u #(
    parameter   IS_SIGNED = 1,     // 0: unsigned, otherwise: signed
    parameter   DATA_WIDTH_I = 20,
    parameter   DATA_WIDTH_O = 64
) (
    input   wire   [DATA_WIDTH_I-1:0]  data_i,
    output  reg	   [DATA_WIDTH_O-1:0]  data_o
);

	genvar i ;
	generate
		if(IS_SIGNED == 0) begin : ext_u_select
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
			end
		end
		else begin
			always@(*)begin
				data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
			end
		end
	endgenerate

   	// always@(*)begin
    //    if (IS_SIGNED == 0) begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
    //    end
    //    else begin
    //        data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
    //    end
	// end
endmodule

module ysyx_210438_riscv_ext_j #(
    parameter   IS_SIGNED = 1,     // 0: unsigned, otherwise: signed
    parameter   DATA_WIDTH_I = 21,
    parameter   DATA_WIDTH_O = 64
) (
    input   wire   [DATA_WIDTH_I-1:0]  data_i,
    output  reg	   [DATA_WIDTH_O-1:0]  data_o
);

   always@(*)begin
       if (IS_SIGNED == 0) begin
           data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){1'b0}}, data_i};
       end
       else begin
           data_o = {{(DATA_WIDTH_O-DATA_WIDTH_I){data_i[DATA_WIDTH_I-1]}}, data_i};
       end
end
endmodule

/// forwarding unit

module ysyx_210438_riscv_fwd_unit #(
    parameter   RF_ADDR_WIDTH   = 5		

) (
    input    	[RF_ADDR_WIDTH-1:0] rs1_id2ex_ff,
    input    	[RF_ADDR_WIDTH-1:0] rs2_id2ex_ff,
	
    input    	[RF_ADDR_WIDTH-1:0] rd_ex2mem_ff,
    input    	[RF_ADDR_WIDTH-1:0] rd_mem2wb_ff,
	
    input    	                    reg_write_ex2mem_ff,
    input    	                    reg_write_mem2wb_ff,
	
    output   reg	[1:0]               fwd_a,
    output   reg	[1:0]               fwd_b
);

    always@(*) begin
        if (reg_write_ex2mem_ff && (rd_ex2mem_ff != 'd0) && (rd_ex2mem_ff == rs1_id2ex_ff)) begin
            fwd_a = 2'b10;
        end
        else if (reg_write_mem2wb_ff && (rd_mem2wb_ff != 'd0) && (rd_mem2wb_ff == rs1_id2ex_ff)) begin
            fwd_a = 2'b01;
        end
        else begin
            fwd_a = 2'b00;
        end
    end

    always@(*) begin
        if (reg_write_ex2mem_ff && (rd_ex2mem_ff != 'd0) && (rd_ex2mem_ff == rs2_id2ex_ff)) begin
            fwd_b = 2'b10;
        end
        else if (reg_write_mem2wb_ff && (rd_mem2wb_ff != 'd0) && (rd_mem2wb_ff == rs2_id2ex_ff)) begin
            fwd_b = 2'b01;
        end
        else begin
            fwd_b = 2'b00;
        end
    end

endmodule



/// hazard detection unit
module ysyx_210438_riscv_hzd_detect_unit#(
    parameter   RF_ADDR_WIDTH   = 5
) (
    input   	[RF_ADDR_WIDTH-1:0] rs1_if2id_ff,
    input   	[RF_ADDR_WIDTH-1:0] rs2_if2id_ff,
	
    input   	[RF_ADDR_WIDTH-1:0] rd_id2ex_ff,
	input   	                    mem_read_id2ex_ff,
    input                           csr_rd_id2ex_ff,
    
    //input   	[RF_ADDR_WIDTH-1:0] rd_ex2mem_ff,
    //input       [1:0]               csr_rd_ex2mem_ff,
    output 	reg 	                stall
);
//notice that instr_id2ex may not have rs2
    always@(*) begin
        if ((mem_read_id2ex_ff | (csr_rd_id2ex_ff != 0)) && ((rd_id2ex_ff == rs1_if2id_ff) || (rd_id2ex_ff == rs2_if2id_ff)) && (rd_id2ex_ff!=0)) begin
            stall = 1'b1;
        end
        //else if(csr_rd_ex2mem_ff != 0) && ((rd_ex2mem_ff == rs1_if2id_ff) || (rd_ex2mem_ff == rs2_if2id_ff)) && (rd_ex2mem_ff!=0))begin
        //    stall = 1'b1;
        //end
		else stall = 1'b0;
    end

endmodule



module ysyx_210438_riscv_imm_gen #(
    parameter   IBUS_DATA_WIDTH = 32,
    parameter   DBUS_DATA_WIDTH = 64
) (
    input   	    [IBUS_DATA_WIDTH-1:0]   instr,
    output  reg    [DBUS_DATA_WIDTH-1:0]   imm
);

    wire  [6:0] opcode;

    reg   is_rtype;
    reg   is_itype;
    reg   is_stype;
    reg   is_btype;
    reg   is_utype;
    reg   is_jtype;

    wire   [11:0]  imm_itype;
    wire   [11:0]  imm_stype;
    wire   [12:0]  imm_btype;
    wire   [19:0]  imm_utype;
    wire   [20:0]  imm_jtype;

    wire   [DBUS_DATA_WIDTH-1:0]   imm_sext_itype;
    wire   [DBUS_DATA_WIDTH-1:0]   imm_sext_stype;
    wire   [DBUS_DATA_WIDTH-1:0]   imm_sext_btype;
    wire   [DBUS_DATA_WIDTH-1:0]   imm_sext_utype;
    wire   [DBUS_DATA_WIDTH-1:0]   imm_sext_jtype;

    // TODO
	
	// assign is_rtype;
    // assign is_itype;
    // assign is_stype;
    // assign is_btype;
    // assign is_utype;
    // assign is_jtype;
	
	always@(*) begin
        case (opcode)
			`YSYX210438_OP					            :	{is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b00_0001;
			`YSYX210438_JALR,`YSYX210438_LOAD,`YSYX210438_OP_IMM,`YSYX210438_OP_IMM_32	:   {is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b00_0010;
            `YSYX210438_STORE  			            :   {is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b00_0100;
            `YSYX210438_BRANCH 			            :   {is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b00_1000;
            `YSYX210438_LUI,`YSYX210438_AUIPC  		            :   {is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b01_0000;
            `YSYX210438_JAL  				            :   {is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b10_0000;
            default     		            :   {is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype} = 6'b00_0000;
        endcase
    end
	
    assign opcode = instr[6:0];

    assign imm_itype = instr[31:20];
    assign imm_stype = {instr[31:25], instr[11:7]};
    assign imm_btype = {instr[31], instr[7], instr[30:25], instr[11:8],1'b0};
    assign imm_utype = instr[31:12];
    assign imm_jtype = {instr[31], instr[19:12], instr[20], instr[30:21],1'b0};

    ysyx_210438_riscv_ext_i #(
        .IS_SIGNED      (1              ),
        .DATA_WIDTH_I   (12             ),
        .DATA_WIDTH_O   (DBUS_DATA_WIDTH)
    ) U_RISCV_SEXT_ITYPE (
        .data_i         (imm_itype      ),
        .data_o         (imm_sext_itype )
    );

    ysyx_210438_riscv_ext_s #(
        .IS_SIGNED      (1              ),
        .DATA_WIDTH_I   (12             ),
        .DATA_WIDTH_O   (DBUS_DATA_WIDTH)
    ) U_RISCV_SEXT_STYPE (
        .data_i         (imm_stype      ),
        .data_o         (imm_sext_stype )
    );

    ysyx_210438_riscv_ext_b #(
        .IS_SIGNED      (1              ),
        .DATA_WIDTH_I   (13             ),
        .DATA_WIDTH_O   (DBUS_DATA_WIDTH)
    ) U_RISCV_SEXT_BTYPE (
        .data_i         (imm_btype      ),
        .data_o         (imm_sext_btype )
    );

    ysyx_210438_riscv_ext_u #(
        .IS_SIGNED      (1              ),
        .DATA_WIDTH_I   (20             ),
        .DATA_WIDTH_O   (DBUS_DATA_WIDTH)
    ) U_RISCV_SEXT_UTYPE (
        .data_i         (imm_utype      ),
        .data_o         (imm_sext_utype )
    );

    ysyx_210438_riscv_ext_j #(
        .IS_SIGNED      (1              ),
        .DATA_WIDTH_I   (21             ),
        .DATA_WIDTH_O   (DBUS_DATA_WIDTH)
    ) U_RISCV_SEXT_JTYPE (
        .data_i         (imm_jtype      ),
        .data_o         (imm_sext_jtype )
    );

    // one-hot code
    always@(*) begin
        case ({is_jtype, is_utype, is_btype, is_stype, is_itype, is_rtype})
            6'b00_0001  :   imm = 'd0;
            6'b00_0010  :   imm = imm_sext_itype;
            6'b00_0100  :   imm = imm_sext_stype;
            6'b00_1000  :   imm = imm_sext_btype;
            6'b01_0000  :   imm = imm_sext_utype;
            6'b10_0000  :   imm = imm_sext_jtype;
            default     :   imm = 'd0;
        endcase
    end

endmodule



module ysyx_210438_riscv_jalr_hzd_detect_unit#(
    parameter   RF_ADDR_WIDTH   = 5			,
	parameter	IBUS_DATA_WIDTH = 32
) (
	input		[IBUS_DATA_WIDTH-1-20:0]	instr_if2id_ff,

	input   	[RF_ADDR_WIDTH-1:0] 	rd_id2ex_ff,
    input   	                    	reg_write_id2ex_ff,
	
	input   	[RF_ADDR_WIDTH-1:0] 	rd_ex2mem_ff,
	input								mem_read_ex2mem_ff,
    input   	                    	reg_write_ex2mem_ff,	
	
	input   	[RF_ADDR_WIDTH-1:0] 	rd_mem2wb_ff,
    input   	                    	reg_write_mem2wb_ff,
	
	output	reg	[1:0]					fwd_jalr,
    output 	reg 	                	stall_jalr
);

    always@(*) begin
        if (instr_if2id_ff[6:0]	== `YSYX210438_JALR) begin
			if(instr_if2id_ff[11:7] == rd_id2ex_ff && reg_write_id2ex_ff)begin
				stall_jalr = 1'b1;
			end
			else if(instr_if2id_ff[11:7] == rd_ex2mem_ff && mem_read_ex2mem_ff)begin
				stall_jalr = 1'b1;
			end
			else stall_jalr = 1'b0;
		end
		else stall_jalr = 1'b0;
    end
	
	always@(*)begin
		if(instr_if2id_ff[6:0]	== `YSYX210438_JALR)begin
			if(instr_if2id_ff[11:7] == rd_ex2mem_ff && reg_write_ex2mem_ff && !mem_read_ex2mem_ff)begin
				fwd_jalr = 2'b01;
			end
			else if(instr_if2id_ff[11:7] == rd_mem2wb_ff && reg_write_mem2wb_ff)begin
				fwd_jalr = 2'b10;
			end
			else fwd_jalr = 2'b00;
		end
		else fwd_jalr = 2'b00;
	end
endmodule




module ysyx_210438_riscv_load #(
    parameter   WIDTH   = 64
) (
    input      		     	  		mem_read,
    input      		[2:0]   		func_code,
	input			[WIDTH-1:0]     mem_out,
    output  reg   	[WIDTH-1:0]	    load_out
);

	always@(*) begin
		if(mem_read == 'b1)
			case(func_code)
				3'b000 	:load_out = {{56{mem_out[7]}},mem_out[7:0]}		; 
				3'b001	:load_out = {{48{mem_out[15]}},mem_out[15:0]}	;
				3'b010  :load_out = {{32{mem_out[31]}},mem_out[31:0]}	;
				3'b011	:load_out = mem_out								;
				3'b100	:load_out = {56'b0,mem_out[7:0]}				;	
				3'b101	:load_out = {48'b0,mem_out[15:0]}				;
				3'b110 	:load_out = {32'b0,mem_out[31:0]}				;
			default     :load_out = 'b0									;
			endcase
		else
			load_out = 'b0					;
	end
endmodule



/// register file
module ysyx_210438_riscv_rf #(
    parameter   DATA_WIDTH  = 64,
    parameter   ADDR_WIDTH  = 5
) (
    input   	                      clk,
	input							  rst,
    input  		  [ADDR_WIDTH-1:0]    rd1_addr,
    input  		                      rd1_en,
    output 	reg	  [DATA_WIDTH-1:0]    rd1_data,   
		
    input  		  [ADDR_WIDTH-1:0]    rd2_addr,
    input  		                      rd2_en,
    output 	reg	  [DATA_WIDTH-1:0]    rd2_data,   
		
	input  		  [ADDR_WIDTH-1:0]    rd3_addr,
    input  		                      rd3_en,
    output 	reg	  [DATA_WIDTH-1:0]    rd3_data,

	input         [ADDR_WIDTH-1:0]    rd4_addr,
	output 	   	  [DATA_WIDTH-1:0]    rd4_data,   
			
    input  		  [ADDR_WIDTH-1:0]    wr_addr,
    input  		                      wr_en,
    input  		  [DATA_WIDTH-1:0]    wr_data
);

    reg   [DATA_WIDTH-1:0]    rf  [2**ADDR_WIDTH-1:0];    // register file
	assign rd4_data = rf[rd4_addr];
    always @(*) begin
		if (rst)
			rd1_data = 'd0;
        else if (rd1_en) begin
            if((rd1_addr == wr_addr) && wr_en)begin
                rd1_data = wr_data;
            end
            else rd1_data = rf[rd1_addr];
        end
		else begin
			rd1_data = 'd0;
		end
    end

    always @(*) begin
		if (rst)
			rd2_data = 'd0;
        else if (rd2_en) begin
            if((rd2_addr == wr_addr) && wr_en)begin
                rd2_data = wr_data;
            end
            else rd2_data = rf[rd2_addr];
        end
		else begin
			rd2_data = 'd0;
		end
    end

	always @(*) begin
		if (rst)
			rd3_data = 'd0;
        else if (rd3_en) begin
            if((rd3_addr == wr_addr) && wr_en)begin
                rd3_data = wr_data;
            end
            else rd3_data = rf[rd3_addr];
        end
		else begin
			rd3_data = 'd0;
		end
    end
	
    // always @(posedge clk) begin
    //     if (wr_en) begin
    //         rf[wr_addr] <= wr_data;
    //     end
    // end

    genvar i;

    generate 
        for(i = 0; i < 32; i = i + 1) begin: inst
            always @(posedge clk) begin
                if(rst)begin
                    rf[i] <= 'd0;
                end 
                else if (wr_en && (wr_addr == i)) begin
                    rf[i] <= wr_data;
                end
                else begin
                    rf[i] <= rf[i];
                end
            end            

        end
    endgenerate

endmodule



module ysyx_210438_riscv_router #(
    parameter DBUS_DATA_WIDTH      = 64,               // data bus data width
    parameter DMEM_ADDR_WIDTH      = 32                // data memory address width
)(
    // CPU core interface
    input                              i_core_data_wr_en    ,  // from cpu
    input                              i_core_data_rd_en    ,  // from cpu
    input [7:0]                        i_core_data_mask     ,  // from cpu
    input [DMEM_ADDR_WIDTH-1 : 0]      i_core_addr          ,  // from cpu
    input [DBUS_DATA_WIDTH-1 : 0]      i_core_wdata         ,  // from cpu
    output reg [DBUS_DATA_WIDTH-1 : 0] o_core_rdata         ,  // to cpu
    output reg                         o_core_rdata_valid   ,  // to cpu
    output reg                         o_core_data_wr_ready ,  // to cpu
    // data mem interface
    output reg                         o_port0_wr_en        ,  // data_wr_valid
    output reg                         o_port0_rd_en        ,  // data_rd_addr_valid
    output reg [7:0]                   o_port0_data_mask    ,  // data_wmask
    output reg [DMEM_ADDR_WIDTH-1 : 0] o_port0_addr         ,  // data_addr
    output reg [DBUS_DATA_WIDTH-1 : 0] o_port0_wdata        ,  // data_wr
    input      [DBUS_DATA_WIDTH-1 : 0] i_port0_rdata        ,  // data_rd
    input                              i_port0_rdata_valid  ,  // data_rd_valid
    input     				           i_port0_wr_ready	    ,  // data_wr_ready
    // clint interface
    output reg                         o_port1_wr_en     ,
    output reg                         o_port1_rd_en     ,
    output reg [DMEM_ADDR_WIDTH-1 : 0] o_port1_addr      , 
    output reg [DBUS_DATA_WIDTH-1 : 0] o_port1_wdata     ,
    input      [DBUS_DATA_WIDTH-1 : 0] i_port1_rdata     ,
    input    				           i_port1_wr_ready	    ,  // data_wr_ready
    input                              i_port1_rdata_valid     // data_rd_valid     

);

localparam PORT0_ADDR_PATTERN   = 32'h8000_0000  ;  // data mem map 0x8000_0000 and above
localparam PORT1_ADDR_PATTERN   = 32'h0200_0000  ;  // clint address map 0x0200_0000 to 0x0200_ffff
localparam PORT0_ADDR_MASK      = 32'hFFFF_0000  ;
localparam PORT1_ADDR_MASK      = 32'hFFFF_0000  ;

reg [1:0] port_sel ;


// always @(*) begin
//     if((i_core_addr) == PORT1_ADDR_PATTERN)       port_sel = 2'b01 ; // data from clint
//     //else if((i_core_addr & PORT0_ADDR_MASK) == PORT0_ADDR_PATTERN)  port_sel = 2'b00 ; // data from data mem
//     else port_sel = 2'b00 ;
// end

always @(*) begin
    if((i_core_addr & PORT1_ADDR_MASK) == PORT1_ADDR_PATTERN)       port_sel = 2'b01 ; // data from clint
    //if(i_core_addr == 32'h8003_0000)       port_sel = 2'b01 ; // data from clint
    else if((i_core_addr & PORT0_ADDR_MASK) == PORT0_ADDR_PATTERN)  port_sel = 2'b00 ; // data from data mem
    else port_sel = 2'b00 ;
end

always@(*) begin
    case(port_sel)
        2'b00 : begin 
            o_core_rdata        = i_port0_rdata        ;
            o_core_data_wr_ready= i_port0_wr_ready	   ;
            o_core_rdata_valid  = i_port0_rdata_valid  ;
        end
        2'b01 : begin 
            o_core_rdata        = i_port1_rdata ;
            o_core_data_wr_ready= i_port1_wr_ready	   ;
            o_core_rdata_valid  = i_port1_rdata_valid  ;
        end
        default : begin 
            o_core_rdata        = i_port0_rdata ;
            o_core_data_wr_ready= i_port0_wr_ready	   ;
            o_core_rdata_valid  = i_port0_rdata_valid  ;
        end
    endcase
end

always@(*) begin
    if(port_sel ==2'b00) begin
        o_port0_wdata = i_core_wdata        ;
        o_port0_addr  = i_core_addr         ;
        o_port0_wr_en = i_core_data_wr_en   ;
        o_port0_rd_en = i_core_data_rd_en   ;
        o_port0_data_mask  =  i_core_data_mask ;   
    end
    else begin
        o_port0_wdata = {(DBUS_DATA_WIDTH){1'b0}} ;
        o_port0_addr  = {(DMEM_ADDR_WIDTH){1'b0}} ;
        o_port0_wr_en = 1'b0 ;
        o_port0_rd_en = 1'b0 ;   
        o_port0_data_mask  =  8'd0 ;       
    end
end

// always@(*) begin
//     o_port0_wdata = i_core_wdata        ;
//     o_port0_addr  = i_core_addr         ;
//     o_port0_wr_en = i_core_data_wr_en   ;
//     o_port0_rd_en = i_core_data_rd_en   ;
//     o_port0_data_mask  =  i_core_data_mask ;   
// end

always@(*) begin
    if(port_sel ==2'b01) begin
        o_port1_wdata = i_core_wdata        ;
        o_port1_addr  = i_core_addr         ;
        o_port1_wr_en = i_core_data_wr_en   ;
        o_port1_rd_en = i_core_data_rd_en   ;
    end
    else begin
        o_port1_wdata = {(DBUS_DATA_WIDTH){1'b0}} ;
        o_port1_addr  = {(DMEM_ADDR_WIDTH){1'b0}} ;
        o_port1_wr_en = 1'b0 ;
        o_port1_rd_en = 1'b0 ;         
    end
end


endmodule


/// sequential logic
/// register slices

module ysyx_210438_riscv_rs_96 #(
    parameter   DATA_WIDTH  = 96
) (
    input   	                        clk,
    input   	                        sft_rst,
    input   	    [DATA_WIDTH-1:0]    din,
    input   	                        en,
    //input                             stall_IF2ID_ff,
	input								stall,
    //input                             excep_stall,
    input								flush,
	output  reg     [DATA_WIDTH-1:0]    dout
);

    always @(posedge clk) begin
        if (sft_rst) begin
            dout <= 'd0;
        end
        //else if(excep_stall)begin
		else if(flush)begin
			dout <= 'd0;
        end
        else if(stall)begin
            dout <= dout;
        end
        else if (en) begin
            dout <= din;
        end
		else	dout <='d0;
    end

endmodule

module ysyx_210438_riscv_rs_301 #(
    parameter   DATA_WIDTH  = 301
) (
    input   	                        clk,
    input   	                        sft_rst,
    input   	    [DATA_WIDTH-1:0]    din,
    input   	                        en,
    //input                             stall_IF2ID_ff,
	input								stall,
    //input                             excep_stall,
    input								flush,
	output  reg     [DATA_WIDTH-1:0]    dout
);

    always @(posedge clk) begin
        if (sft_rst) begin
            dout <= 'd0;
        end
        //else if(excep_stall)begin
		else if(flush)begin
			dout <= 'd0;
        end
        else if(stall)begin
            dout <= dout;
        end
        else if (en) begin
            dout <= din;
        end
		else	dout <='d0;
    end

endmodule

module ysyx_210438_riscv_rs_431 #(
    parameter   DATA_WIDTH  = 431
) (
    input   	                        clk,
    input   	                        sft_rst,
    input   	    [DATA_WIDTH-1:0]    din,
    input   	                        en,
    //input                             stall_IF2ID_ff,
	input								stall,
    //input                             excep_stall,
    input								flush,
	output  reg     [DATA_WIDTH-1:0]    dout
);

    always @(posedge clk) begin
        if (sft_rst) begin
            dout <= 'd0;
        end
        //else if(excep_stall)begin
		else if(flush)begin
			dout <= 'd0;
        end
        else if(stall)begin
            dout <= dout;
        end
        else if (en) begin
            dout <= din;
        end
		else	dout <='d0;
    end

endmodule

module ysyx_210438_riscv_rs_357 #(
    parameter   DATA_WIDTH  = 357
) (
    input   	                        clk,
    input   	                        sft_rst,
    input   	    [DATA_WIDTH-1:0]    din,
    input   	                        en,
    //input                             stall_IF2ID_ff,
	input								stall,
    //input                             excep_stall,
    input								flush,
	output  reg     [DATA_WIDTH-1:0]    dout
);

    always @(posedge clk) begin
        if (sft_rst) begin
            dout <= 'd0;
        end
        //else if(excep_stall)begin
		else if(flush)begin
			dout <= 'd0;
        end
        else if(stall)begin
            dout <= dout;
        end
        else if (en) begin
            dout <= din;
        end
		else	dout <='d0;
    end

endmodule


module ysyx_210438_riscv_store #(
    parameter   WIDTH   = 64
) (
    input      			    		mem_write,
	input							mem_read ,
    input      		[2:0]   		func_code,
	input			[WIDTH-1:0]     reg2_out,
    output  reg   	[WIDTH-1:0]    	store_out,
	output	reg		[7:0]			mask_out
);

	always@(*) begin
		if((mem_write == 'b1)||(mem_read == 'b1))
			case(func_code)
				3'b100,3'b000 	:begin
					store_out = {{56{reg2_out[7]}},reg2_out[7:0]}	; 
					mask_out  = 8'b0000_0001						;
					end
				3'b101,3'b001	:begin
					store_out = {{48{reg2_out[15]}},reg2_out[15:0]}	;
					mask_out  = 8'b0000_0011 						;
					end
				3'b110,3'b010  :begin
					store_out = {{32{reg2_out[31]}},reg2_out[31:0]}	;
					mask_out  = 8'b0000_1111						;
					end
				3'b011	:begin
					store_out = reg2_out							;
					mask_out = 8'b1111_1111							;
					end
			default     :begin
				store_out =64'b0									;
				mask_out = 8'b0										;
				end	
			endcase
		else begin
			store_out = 'b0											;
			mask_out  = 'b0											;
		end
		end
endmodule


