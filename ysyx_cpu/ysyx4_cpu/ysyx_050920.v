module ysyx_050920(
  input clock,
  input reset,
  input io_interrupt,

  input io_master_awready,
  output io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0] io_master_awid,
  output [7:0] io_master_awlen,
  output [2:0] io_master_awsize,
  output [1:0] io_master_awburst,

  input io_master_wready,
  output io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0] io_master_wstrb,
  output io_master_wlast,

  output io_master_bready,
  input io_master_bvalid,
  input [1:0] io_master_bresp,
  input [3:0] io_master_bid,

  input io_master_arready,
  output io_master_arvalid,
  output [31:0] io_master_araddr,
  output [3:0] io_master_arid,
  output [7:0] io_master_arlen,
  output [2:0] io_master_arsize,
  output [1:0] io_master_arburst,

  output io_master_rready,
  input io_master_rvalid,
  input [1:0] io_master_rresp,
  input [63:0] io_master_rdata,
  input io_master_rlast,
  input [3:0] io_master_rid,

  output io_slave_awready,
  input io_slave_awvalid,
  input [31:0] io_slave_awaddr,
  input [3:0] io_slave_awid,
  input [7:0] io_slave_awlen,
  input [2:0] io_slave_awsize,
  input [1:0] io_slave_awburst,

  output io_slave_wready,
  input io_slave_wvalid,
  input [63:0] io_slave_wdata,
  input [7:0] io_slave_wstrb,
  input io_slave_wlast,

  input io_slave_bready,
  output io_slave_bvalid,
  output [1:0] io_slave_bresp,
  output [3:0] io_slave_bid,

  output io_slave_arready,
  input io_slave_arvalid,
  input [31:0] io_slave_araddr,
  input [3:0] io_slave_arid,
  input [7:0] io_slave_arlen,
  input [2:0] io_slave_arsize,
  input [1:0] io_slave_arburst,

  input io_slave_rready,
  output io_slave_rvalid,
  output [1:0] io_slave_rresp,
  output [63:0] io_slave_rdata,
  output io_slave_rlast,
  output [3:0] io_slave_rid,

  output [5:0] io_sram0_addr,
  output io_sram0_cen,
  output io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input [127:0] io_sram0_rdata,
  
  output [5:0] io_sram1_addr,
  output io_sram1_cen,
  output io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input [127:0] io_sram1_rdata,

  output [5:0] io_sram2_addr,
  output io_sram2_cen,
  output io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input [127:0] io_sram2_rdata,

  output [5:0] io_sram3_addr,
  output io_sram3_cen,
  output io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input [127:0] io_sram3_rdata,

  output [5:0] io_sram4_addr,
  output io_sram4_cen,
  output io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input [127:0] io_sram4_rdata,

  output [5:0] io_sram5_addr,
  output io_sram5_cen,
  output io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input [127:0] io_sram5_rdata,

  output [5:0] io_sram6_addr,
  output io_sram6_cen,
  output io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input [127:0] io_sram6_rdata,

  output [5:0] io_sram7_addr,
  output io_sram7_cen,
  output io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input [127:0] io_sram7_rdata
);
  wire clk = clock;
  wire rst = reset;

  
  wire [63:0] icache_rdata;
  wire [63:0] dcache_rdata;
  wire [3:0] dcache_rsize;
  wire icache_ren,dcache_ren;
  wire [63:0] icache_raddr,dcache_raddr;
  wire dcache_rdata_valid;
  wire icache_rdata_valid;
  wire icache_invalid;


  wire [63:0] dcache_waddr,dcache_wdata;
  wire dcache_wen;
  wire [3:0] dcache_wsize;

  wire icache_wbusy;
  wire icache_rbusy;


  wire dcache_rbusy,dcache_wbusy;
  //all store through dcache, but only mem load through dcache
  wire dcache_direct = (dcache_ren&(dcache_raddr[31:28]!=4'h8 && dcache_raddr[31:28]!=4'hf))|(dcache_wen&(dcache_waddr[31:28]!=4'h8 && dcache_waddr[31:28]!=4'hf));
  wire icache_direct = (icache_ren&(icache_raddr[31:28]!=4'h8 && icache_raddr[31:28]!=4'hf));
  wire msip_o;
  wire msip_valid_o;
  wire msip_i;
  wire tim_int_req;
  wire mtip_clear;
  ysyx_050920_toy_cpu inst_toy_cpu(
    .clk                (clk),
    .rst                (rst),
    .ex_intr            (io_interrupt),
    .icache_ren         (icache_ren),
    .icache_raddr       (icache_raddr),
    .icache_rbusy       (icache_rbusy),
    .icache_rdata       (icache_rdata[31:0]),
    .icache_rdata_valid (icache_rdata_valid),
    .icache_invalid     (icache_invalid),
    .mtip_clear         (mtip_clear),
    .msip_i             (msip_o),
    .msip_valid_i       (msip_valid_o),
    .msip_o             (msip_i),
    .tim_int_req        (tim_int_req),
    .dcache_ren         (dcache_ren),
    .dcache_raddr       (dcache_raddr),
    .dcache_rbusy       (dcache_rbusy),
    .dcache_rdata       (dcache_rdata),
    .dcache_rsize       (dcache_rsize),
    .dcache_rdata_valid (dcache_rdata_valid),
    .dcache_wbusy       (dcache_wbusy),
    .dcache_wen         (dcache_wen),
    .dcache_waddr       (dcache_waddr),
    .dcache_wdata       (dcache_wdata),
    .dcache_wsize       (dcache_wsize)
  );


  wire icache_mem_rbusy;
  wire icache_mem_ren;
  wire [3:0] icache_mem_rsize;
  wire [31:0] icache_mem_raddr;
  wire [63:0] icache_mem_rdata;
  wire icache_mem_rdata_valid;

  wire icache_mem_wbusy = 1'b0;
  wire icache_mem_wen;
  wire [3:0] icache_mem_wsize;
  wire [31:0] icache_mem_waddr;
  wire [63:0] icache_mem_wdata;

  ysyx_050920_cache inst_icache
  (
    .clk         (clk),
    .rst         (rst),
    .direct      (icache_direct),
    .invalid     (icache_invalid),
    .ren         (icache_ren),
    .raddr       (icache_raddr),
    .rsize       (4'h4),
    .rbusy       (icache_rbusy),
    .rdata       (icache_rdata),
    .rdata_valid (icache_rdata_valid),
    .wbusy       (icache_wbusy),
    .wen         (1'b0),
    .waddr       (64'b0),
    .wdata       (64'b0),
    .wsize       (4'b0),
    .io_sram0_addr  (io_sram0_addr),
    .io_sram0_cen   (io_sram0_cen),
    .io_sram0_wen   (io_sram0_wen),
    .io_sram0_wmask (io_sram0_wmask),
    .io_sram0_wdata (io_sram0_wdata),
    .io_sram0_rdata (io_sram0_rdata),
    .io_sram1_addr  (io_sram1_addr),
    .io_sram1_cen   (io_sram1_cen),
    .io_sram1_wen   (io_sram1_wen),
    .io_sram1_wmask (io_sram1_wmask),
    .io_sram1_wdata (io_sram1_wdata),
    .io_sram1_rdata (io_sram1_rdata),
    .io_sram2_addr  (io_sram2_addr),
    .io_sram2_cen   (io_sram2_cen),
    .io_sram2_wen   (io_sram2_wen),
    .io_sram2_wmask (io_sram2_wmask),
    .io_sram2_wdata (io_sram2_wdata),
    .io_sram2_rdata (io_sram2_rdata),
    .io_sram3_addr  (io_sram3_addr),
    .io_sram3_cen   (io_sram3_cen),
    .io_sram3_wen   (io_sram3_wen),
    .io_sram3_wmask (io_sram3_wmask),
    .io_sram3_wdata (io_sram3_wdata),
    .io_sram3_rdata (io_sram3_rdata),
    .mem_rbusy       (icache_mem_rbusy),
    .mem_ren         (icache_mem_ren),
    .mem_rsize       (icache_mem_rsize),
    .mem_raddr       (icache_mem_raddr),
    .mem_rdata       (icache_mem_rdata),
    .mem_rdata_valid (icache_mem_rdata_valid),
    .mem_wbusy       (icache_mem_wbusy),
    .mem_wen         (icache_mem_wen),
    .mem_wsize       (icache_mem_wsize),
    .mem_waddr       (icache_mem_waddr),
    .mem_wdata       (icache_mem_wdata)

  );

  wire dcache_mem_rbusy;
  wire dcache_mem_ren;
  wire [3:0] dcache_mem_rsize;
  wire [31:0] dcache_mem_raddr;
  wire [63:0] dcache_mem_rdata;
  wire dcache_mem_rdata_valid;

  wire dcache_mem_wbusy;
  wire dcache_mem_wen;
  wire [3:0] dcache_mem_wsize;
  wire [31:0] dcache_mem_waddr;
  wire [63:0] dcache_mem_wdata;
  ysyx_050920_cache inst_dcache
  (
    .clk         (clk),
    .rst         (rst),
    .direct      (dcache_direct),
    .invalid     (icache_invalid),
    .ren         (dcache_ren),
    .raddr       (dcache_raddr),
    .rsize       (dcache_rsize),
    .rbusy       (dcache_rbusy),
    .rdata       (dcache_rdata),
    .rdata_valid (dcache_rdata_valid),
    .wbusy       (dcache_wbusy),
    .wen         (dcache_wen),
    .waddr       (dcache_waddr),
    .wdata       (dcache_wdata),
    .wsize       (dcache_wsize),
    .io_sram0_addr  (io_sram4_addr),
    .io_sram0_cen   (io_sram4_cen),
    .io_sram0_wen   (io_sram4_wen),
    .io_sram0_wmask (io_sram4_wmask),
    .io_sram0_wdata (io_sram4_wdata),
    .io_sram0_rdata (io_sram4_rdata),
    .io_sram1_addr  (io_sram5_addr),
    .io_sram1_cen   (io_sram5_cen),
    .io_sram1_wen   (io_sram5_wen),
    .io_sram1_wmask (io_sram5_wmask),
    .io_sram1_wdata (io_sram5_wdata),
    .io_sram1_rdata (io_sram5_rdata),
    .io_sram2_addr  (io_sram6_addr),
    .io_sram2_cen   (io_sram6_cen),
    .io_sram2_wen   (io_sram6_wen),
    .io_sram2_wmask (io_sram6_wmask),
    .io_sram2_wdata (io_sram6_wdata),
    .io_sram2_rdata (io_sram6_rdata),
    .io_sram3_addr  (io_sram7_addr),
    .io_sram3_cen   (io_sram7_cen),
    .io_sram3_wen   (io_sram7_wen),
    .io_sram3_wmask (io_sram7_wmask),
    .io_sram3_wdata (io_sram7_wdata),
    .io_sram3_rdata (io_sram7_rdata),
    .mem_rbusy       (dcache_mem_rbusy),
    .mem_ren         (dcache_mem_ren),
    .mem_rsize       (dcache_mem_rsize),
    .mem_raddr       (dcache_mem_raddr),
    .mem_rdata       (dcache_mem_rdata),
    .mem_rdata_valid (dcache_mem_rdata_valid),
    .mem_wbusy       (dcache_mem_wbusy),
    .mem_wen         (dcache_mem_wen),
    .mem_wsize       (dcache_mem_wsize),
    .mem_waddr       (dcache_mem_waddr),
    .mem_wdata       (dcache_mem_wdata)
    
  );
  
  wire clint_wen;
  wire clint_ren;
  wire [31:0] clint_raddr;
  wire [31:0] clint_waddr;
  wire [63:0] clint_wdata;
  wire [3:0] clint_wsize;
  wire [63:0] clint_rdata;
  wire [3:0] clint_rsize;
  wire clint_rdata_valid;

  ysyx_050920_MemBus inst_MemBus
    (
      .clk                    (clk),
      .rst                    (rst),
      .dcache_mem_rbusy       (dcache_mem_rbusy),
      .dcache_mem_ren         (dcache_mem_ren),
      .dcache_mem_rsize       (dcache_mem_rsize),
      .dcache_mem_raddr       (dcache_mem_raddr),
      .dcache_mem_rdata       (dcache_mem_rdata),
      .dcache_mem_rdata_valid (dcache_mem_rdata_valid),
      .dcache_mem_wbusy       (dcache_mem_wbusy),
      .dcache_mem_wen         (dcache_mem_wen),
      .dcache_mem_wsize       (dcache_mem_wsize),
      .dcache_mem_waddr       (dcache_mem_waddr),
      .dcache_mem_wdata       (dcache_mem_wdata),
      .icache_mem_rbusy       (icache_mem_rbusy),
      .icache_mem_ren         (icache_mem_ren),
      .icache_mem_rsize       (icache_mem_rsize),
      .icache_mem_raddr       (icache_mem_raddr),
      .icache_mem_rdata       (icache_mem_rdata),
      .icache_mem_rdata_valid (icache_mem_rdata_valid),
      .clint_wen              (clint_wen),
      .clint_ren              (clint_ren),
      .clint_raddr            (clint_raddr),
      .clint_waddr            (clint_waddr),
      .clint_wdata            (clint_wdata),
      .clint_wsize            (clint_wsize),
      .clint_rdata            (clint_rdata),
      .clint_rsize            (clint_rsize),
      .clint_rdata_valid      (clint_rdata_valid),
      .io_master_awready      (io_master_awready),
      .io_master_awvalid      (io_master_awvalid),
      .io_master_awaddr       (io_master_awaddr),
      .io_master_awid         (io_master_awid),
      .io_master_awlen        (io_master_awlen),
      .io_master_awsize       (io_master_awsize),
      .io_master_awburst      (io_master_awburst),
      .io_master_wready       (io_master_wready),
      .io_master_wvalid       (io_master_wvalid),
      .io_master_wdata        (io_master_wdata),
      .io_master_wstrb        (io_master_wstrb),
      .io_master_wlast        (io_master_wlast),
      .io_master_bready       (io_master_bready),
      .io_master_bvalid       (io_master_bvalid),
      .io_master_bresp        (io_master_bresp),
      .io_master_bid          (io_master_bid),
      .io_master_arready      (io_master_arready),
      .io_master_arvalid      (io_master_arvalid),
      .io_master_araddr       (io_master_araddr),
      .io_master_arid         (io_master_arid),
      .io_master_arlen        (io_master_arlen),
      .io_master_arsize       (io_master_arsize),
      .io_master_arburst      (io_master_arburst),
      .io_master_rready       (io_master_rready),
      .io_master_rvalid       (io_master_rvalid),
      .io_master_rresp        (io_master_rresp),
      .io_master_rdata        (io_master_rdata),
      .io_master_rlast        (io_master_rlast),
      .io_master_rid          (io_master_rid)
    );
    

    ysyx_050920_CoreLocalInterrupt inst_CoreLocalInterrupt
    (
      .clk          (clk),
      .rst          (rst),
      .wen          (clint_wen),
      .ren          (clint_ren),
      .raddr        (clint_raddr),
      .waddr        (clint_waddr),
      .wdata        (clint_wdata),
      .wsize        (clint_wsize),
      .rsize        (clint_rsize),
      .rdata        (clint_rdata),
      .rdata_valid  (clint_rdata_valid),
      .tim_int_req  (tim_int_req),
      .mtip_clear   (mtip_clear),
      .msip_i       (msip_i),
      .msip_o       (msip_o),
      .msip_valid_o (msip_valid_o)
    );



  assign io_slave_awready = 1'b0;
  assign io_slave_wready = 1'b0;
  assign io_slave_bvalid = 1'b0;
  assign io_slave_bresp = 2'b0;
  assign io_slave_bid = 4'b0;
  assign io_slave_arready = 1'b0;
  assign io_slave_rvalid = 1'b0;
  assign io_slave_rresp = 2'b0;
  assign io_slave_rdata = 64'b0;
  assign io_slave_rlast = 1'b0;
  assign io_slave_rid = 4'b0;


endmodule
module ysyx_050920_Hazards_ctrl (
  input clk,
  input rst,
  
  output [4:0] enable/*verilator public_flat*/,
  output [3:0] flush/*verilator public_flat*/,
  input  [4:0] ready/*verilator public_flat*/,
  input  [4:0] busy/*verilator public_flat*/,

  /* The data_valid signal is for difftest. */
  // output [4:0] data_valid,

  // input [4:0] id_rs1,
  // input [4:0] id_rs2,
  // input [4:0] id_dst,
  // input [4:0] exe_dst,
  // input [4:0] mem_dst,
  // input [4:0] wb_dst,

  /* These data come from pipeline regs. */
  input [4:0] id_rs1_r,
  input [4:0] id_rs2_r,
  input [63:0] id_src1_r,
  input [63:0] id_src2_r,

  input exe_dst_valid_r,
  input exe_data_valid_r,
  input [4:0] exe_dst_r,
  input [63:0] exe_data_r,
  input mem_dst_valid_r,
  input mem_data_valid_r,
  input [4:0] mem_dst_r,
  input [63:0] mem_data_r,
  /* This data comes from writenack unit. */
  input wb_en_i,
  input [4:0] wb_dst_i,
  input [63:0] wb_data_i,

  /* These data go to execute unit. */
  output reg [63:0] id_src1_o,
  output reg [63:0] id_src2_o,



  input branch_miss
  // ,
  // input icache_busy,
  // input dcache_busy,

  // input id_rs1_valid,
  // input id_rs2_valid,
  // input id_dst_valid

);

  reg [4:0] enable_r;
  reg [3:0] flush_r;
  reg [4:0] wb_dst_r;
  reg [63:0] wb_data_r;
  reg [1:0] data_relayed;
  reg [1:0] state;
  reg [4:0] pause;
  reg [63:0] src1,src2;
  reg src1_valid,src2_valid;
  localparam FSM_IDLE = 2'b00;
  localparam FSM_CONF = 2'b01;/* FSM_CONF means that the data conflict can't use data-relay to solve. */

  wire src1_zero = id_rs1_r == 5'b0;
  wire src2_zero = id_rs2_r == 5'b0;
  wire [4:2] src1_conflict;
  wire [4:2] src2_conflict;
  wire src1_relay_conflict = ((|src1_conflict)&~data_relayed[0]);
  wire src2_relay_conflict = ((|src2_conflict)&~data_relayed[1]);
  wire relay_conflict = (src1_relay_conflict|src2_relay_conflict)|((state == FSM_CONF)&(~(&data_relayed)));

  reg wb_en_r;
  always @(posedge clk) begin
    if(rst) begin
      wb_en_r <= 1'b0;
      wb_dst_r <= 5'b0;
      wb_data_r <= 64'b0;
    end begin
      if(wb_en_i) begin
        wb_dst_r <= wb_dst_i;
        wb_data_r <= wb_data_i;
      end
      wb_en_r <= wb_en_i;
    end
  end

  
  
  /* Judge whether has data conflict. */
  assign src1_conflict[2] = enable_r[3]&~src1_zero&exe_dst_valid_r&(id_rs1_r == exe_dst_r);
  assign src1_conflict[3] = enable_r[4]&~src1_zero&mem_dst_valid_r&(id_rs1_r == mem_dst_r);
  assign src1_conflict[4] = ~src1_zero&(id_rs1_r == wb_dst_r);

  assign src2_conflict[2] = enable_r[3]&~src2_zero&exe_dst_valid_r&(id_rs2_r == exe_dst_r);
  assign src2_conflict[3] = enable_r[4]&~src2_zero&mem_dst_valid_r&(id_rs2_r == mem_dst_r);
  assign src2_conflict[4] = ~src2_zero&(id_rs2_r == wb_dst_r);
  

  always @(posedge clk) begin
    if(rst) state <= FSM_IDLE;
    else begin
      case(state)
      FSM_IDLE: if(relay_conflict|(|busy[4:2])) state <= FSM_CONF;
      FSM_CONF: if(~(relay_conflict|(|busy[4:2]))) state <= FSM_IDLE;
      default: state <= FSM_IDLE;
      endcase
    end
  end

  always @(posedge clk) begin
    if(rst) begin
      src1 <= 64'b0;
      src2 <= 64'b0;
      src1_valid <= 1'b0;
      src2_valid <= 1'b0;
    end else begin
      case(state)
      FSM_IDLE: begin
        src1_valid <= ~src1_relay_conflict;
        src2_valid <= ~src2_relay_conflict;
        src1 <= id_src1_o;
        src2 <= id_src2_o; 
      end
      FSM_CONF: begin
        // if(~src1_valid) begin
        if(src1_conflict[4:2] == 3'b100) begin
          if(wb_en_r && id_rs1_r == wb_dst_r)
          begin
            src1_valid <= 1'b1;
            src1 <= wb_data_r;
          end
        end
        // if(~src2_valid) begin
        if(src2_conflict[4:2] == 3'b100) begin
          if(wb_en_r && id_rs2_r == wb_dst_r)
          begin
            src2_valid <= 1'b1;
            src2 <= wb_data_r;
          end
        end
      end
      default: begin
        src1_valid <= 1'b0;
        src2_valid <= 1'b0;
        src1 <= 64'b0;
        src2 <= 64'b0;
      end
      endcase
    end
  end

  /* Judge whether data conflict has been relayed. */

  always@(*) begin
    data_relayed = 2'b0;
    id_src1_o = 64'b0;
    id_src2_o = 64'b0;
    case(state)
    FSM_IDLE: begin
      if(src1_zero) begin
        id_src1_o = 64'b0;
        data_relayed[0] = 1'b1;
      end else if(src1_conflict[2]) begin
        if(~exe_data_valid_r) begin
          id_src1_o = 64'b0;
          data_relayed[0] = 1'b0;
        end else begin
          id_src1_o = exe_data_r;
          data_relayed[0] = ~busy[2];     
        end
      end else if(src1_conflict[3]) begin
        id_src1_o = mem_data_r;
        data_relayed[0] = ~busy[3];
        if(~mem_data_valid_r) begin
          id_src1_o = 64'b0;
          data_relayed[0] = 1'b0;
        end
      end else if(src1_conflict[4]) begin
        id_src1_o = wb_data_r;
        data_relayed[0] = 1'b1;
      end else begin 
        id_src1_o = id_src1_r;
        data_relayed[0] = 1'b0;
      end
  
      if(src2_zero) begin
        id_src2_o = 64'b0;
        data_relayed[1] = 1'b1;
      end else if(src2_conflict[2]) begin
        if(~exe_data_valid_r) begin
          id_src2_o = 64'b0;
          data_relayed[1] = 1'b0;
        end else begin
          id_src2_o = exe_data_r;
          data_relayed[1] = ~busy[2];     
        end
      end else if(src2_conflict[3]) begin
        id_src2_o = mem_data_r;
        data_relayed[1] = ~busy[3];
        if(~mem_data_valid_r) begin
          id_src2_o = 64'b0;
          data_relayed[1] = 1'b0;
        end
      end else if(src2_conflict[4]) begin
        id_src2_o = wb_data_r;
        data_relayed[1] = 1'b1;
      end else begin 
        id_src2_o = id_src2_r;
        data_relayed[1] = 1'b0;
      end
    end
    FSM_CONF: begin
      id_src1_o = src1;
      id_src2_o = src2;
      data_relayed[0] = src1_valid;
      data_relayed[1] = src2_valid;
    end
    default: begin
      id_src1_o = 64'b0;
      id_src2_o = 64'b0;
      data_relayed[0] = 1'b0;
      data_relayed[1] = 1'b0;
    end
    endcase
    
  end



  // /* If decode is conflict or any stage is busy, pause the frontend. */
  // wire pause_frontend = |conflict | |busy;

  /* If any stage is busy, pause the frontend. */
  wire pause_frontend = |busy;

  always @(*) begin
    pause = 5'b0;
    if(pause_frontend) pause[1:0] = ~2'b0;
    if(relay_conflict) pause[2:0] = ~3'b0;
    /* If any backend stage is busy, pause the stage and all stages before it. Besides, make the stage output is invalid. */
    if(busy[2]) pause[3:0] = ~4'b0;
    if(busy[3]) pause[4:0] = ~5'b0;

    flush_r = 4'b0;
    /* If branch predict mistake or other unpredicted branch occur, flush the frontend. */
    if(branch_miss) flush_r[1:0] = ~2'b0;
    
  end

  // integer i;
  always @(posedge clk) begin
    if(rst) begin
      enable_r <= 5'b0;
    end else begin
      /* Stage enable input must be zero if the stage before it is pause or flush. */
      enable_r <= {enable_r[3:0]&~(pause[3:0]|flush[3:0]),1'b1};
      /* If a branch predict is mistake, the frontend data will be flush in the next cycle. */
      if(branch_miss) begin
        enable_r[2:1] <= 2'b0;
      end
      /* If a stage is pause and not flush, the stage's data should be kept. */
      // for (i = 0; i < 5; i = i + 1 ) begin
        // if(pause[i]&~flush[i]) begin
          // enable_r[i] <= enable_r[i];
        // end
      // end
      if(pause[0]&~flush[0]) begin
        enable_r[0] <= enable_r[0];
      end
      if(pause[1]&~flush[1]) begin
        enable_r[1] <= enable_r[1];
      end
      if(pause[2]&~flush[2]) begin
        enable_r[2] <= enable_r[2];
      end
      if(pause[3]&~flush[3]) begin
        enable_r[3] <= enable_r[3];
      end
      /* There is no flush[4], because flush[4] signal is unuseful. */
      if(pause[4]) begin 
        enable_r[4] <= enable_r[4];
      end
    end
  end

  assign enable = (~pause)&enable_r;
  assign flush = flush_r;
  
  // assign data_valid = enable_r&~flush;
endmodule
module ysyx_050920_Reg #(WIDTH = 1, RESET_VAL = 0) (
  input clk,
  input rst,
  input [WIDTH-1:0] din,
  output reg [WIDTH-1:0] dout,
  input wen
);
  always @(posedge clk) begin
    if (rst) dout <= RESET_VAL;
    else if (wen) dout <= din;
  end
  
endmodule
module tag(
  input clk,
  input rst,
  input we,
  input sel,
  input [7:0] index,
  input [31:11] wtag0,wtag1,
  output reg [31:11] rtag0,rtag1
);

  reg [31:11] TAG0 [255:0];
  reg [31:11] TAG1 [255:0];
  integer i;
  always@(posedge clk) begin
    if(rst) begin
      rtag0 <= 21'b0;
      rtag1 <= 21'b0;
      for (i = 0; i < 256; i = i + 1) begin
        TAG0[i] <= 21'b0;
        TAG1[i] <= 21'b0;
      end
    end else begin
      if(we) begin 
        if(sel == 1'b0) TAG0[index] <= wtag0;
        if(sel == 1'b1) TAG1[index] <= wtag1;
        rtag0 <= 21'b0;
        rtag1 <= 21'b0;
      end else begin
        rtag0 <= TAG0[index];
        rtag1 <= TAG1[index];
      end
      
    end
  end

endmodule
module ysyx_050920_sram4K(
  input clk,
  input rst,


  output [5:0] io_sram0_addr,
  output io_sram0_cen,
  output io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input [127:0] io_sram0_rdata,
  
  output [5:0] io_sram1_addr,
  output io_sram1_cen,
  output io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input [127:0] io_sram1_rdata,

  output [5:0] io_sram2_addr,
  output io_sram2_cen,
  output io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input [127:0] io_sram2_rdata,

  output [5:0] io_sram3_addr,
  output io_sram3_cen,
  output io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input [127:0] io_sram3_rdata,

  input wen,
  input [15:0] wstrb,
  input [127:0] wdata,
  input [7:0] addr,
  output [127:0] rdata

  
);
  wire [5:0] paddr = addr[7:2];
  wire [1:0] sel = addr[1:0];


  wire [127:0] bstrb = {
    {8{wstrb[15]}},{8{wstrb[14]}},{8{wstrb[13]}},{8{wstrb[12]}},{8{wstrb[11]}},{8{wstrb[10]}},{8{wstrb[9]}},{8{wstrb[8]}},
    {8{wstrb[7]}},{8{wstrb[6]}},{8{wstrb[5]}},{8{wstrb[4]}},{8{wstrb[3]}},{8{wstrb[2]}},{8{wstrb[1]}},{8{wstrb[0]}}
    };
  wire [127:0] bwen = bstrb;//(hsb==1'b1)?{bstrb,64'b0}:{64'b0,bstrb};

  wire [127:0] ram_d = wdata;//(hsb==1'b1)?{wdata,64'b0}:{64'b0,wdata};
  wire [127:0] ram_q[3:0];

  wire [1:0] addr_0;
  ysyx_050920_Reg #(.WIDTH(2), .RESET_VAL(2'h0)) reg_ram_sel (.clk(clk), .rst(rst), .din(addr[1:0]), .dout(addr_0), .wen(1'b1));
  
  wire [127:0] data = ram_q[addr_0[1:0]];
  assign rdata = data;//(addr_0[2]==1'b1)?data[127:64]:data[63:0];

  
  assign io_sram0_addr = paddr;
  assign io_sram0_cen = ~1'b1;
  assign io_sram0_wen = ~(wen&&(sel==2'd0));
  assign io_sram0_wmask = ~bwen;
  assign io_sram0_wdata = ram_d;
  assign ram_q[0] = io_sram0_rdata;

  assign io_sram1_addr = paddr;
  assign io_sram1_cen = ~1'b1;
  assign io_sram1_wen = ~(wen&&(sel==2'd1));
  assign io_sram1_wmask = ~bwen;
  assign io_sram1_wdata = ram_d;
  assign ram_q[1] = io_sram1_rdata;

  assign io_sram2_addr = paddr;
  assign io_sram2_cen = ~1'b1;
  assign io_sram2_wen = ~(wen&&(sel==2'd2));
  assign io_sram2_wmask = ~bwen;
  assign io_sram2_wdata = ram_d;
  assign ram_q[2] = io_sram2_rdata;

  assign io_sram3_addr = paddr;
  assign io_sram3_cen = ~1'b1;
  assign io_sram3_wen = ~(wen&&(sel==2'd3));
  assign io_sram3_wmask = ~bwen;
  assign io_sram3_wdata = ram_d;
  assign ram_q[3] = io_sram3_rdata;
  
  
  // generate
  //   genvar i;
  //   for (i = 0; i < 4; i = i + 1)
  //   begin : sram4K
  //     S011HD1P_X32Y2D128_BW isnt_S011HD1P_X32Y2D128_BW(
  //       .Q(ram_q[i]),
  //       .CLK(clk),
  //       .CEN(~1'b1),
  //       .WEN(~(wen&&(sel==i))),
  //       .BWEN(~bwen),
  //       .A(paddr),
  //       .D(ram_d)
  //     );
  //   end
  // endgenerate
  

endmodule
module ysyx_050920_cache(
  input clk,
  input rst,

  input direct,

  input invalid,

  input ren,
  input [63:0] raddr,
  input [3:0] rsize,
  output rbusy,
  output reg [63:0] rdata, 
  output rdata_valid,

  output wbusy,
  input wen,
  input [63:0] waddr,
  input [63:0] wdata, 
  input [3:0] wsize,

  output [5:0] io_sram0_addr,
  output io_sram0_cen,
  output io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input [127:0] io_sram0_rdata,
  
  output [5:0] io_sram1_addr,
  output io_sram1_cen,
  output io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input [127:0] io_sram1_rdata,

  output [5:0] io_sram2_addr,
  output io_sram2_cen,
  output io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input [127:0] io_sram2_rdata,

  output [5:0] io_sram3_addr,
  output io_sram3_cen,
  output io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input [127:0] io_sram3_rdata,

  input mem_rbusy,
  output reg mem_ren,
  output reg [3:0] mem_rsize,
  output reg [31:0] mem_raddr,
  input [63:0] mem_rdata,
  input mem_rdata_valid,
  input mem_wbusy,
  output reg mem_wen,
  output reg [3:0] mem_wsize,
  output reg [31:0] mem_waddr,
  output reg [63:0] mem_wdata
  

);

  wire [63:0] mem_rdata_r;
  wire mem_rdata_valid_r;
  ysyx_050920_Reg #(.WIDTH(65), .RESET_VAL(65'b0)) reg_rdata (.clk(clk), .rst(rst), .din({mem_rdata_valid,mem_rdata}), .dout({mem_rdata_valid_r,mem_rdata_r}), .wen(1'b1));

  wire [31:11] rtag0,rtag1;
  reg  [31:11] wtag0,wtag1;
  reg  [7:0] tag_index;
  reg  tag_wen,tag_sel;
  tag inst_tag
    (
      .clk   (clk),
      .rst   (rst),
      .we    (tag_wen),
      .sel   (tag_sel),
      .index (tag_index),
      .wtag0 (wtag0),
      .wtag1 (wtag1),
      .rtag0 (rtag0),
      .rtag1 (rtag1)
    );
  wire busy;
  // reg [31:11] TAG0 [255:0];
  // reg [31:11] TAG1 [255:0];
  reg [255:0] VALID_0 ;
  reg [255:0] VALID_1 ;
  reg [255:0] TURN;

  reg [7:0] valid_index;
  reg [7:0] turn_index;
  reg turn_we,valid_0_we,valid_1_we;
  reg wturn,wvalid_0,wvalid_1;
  reg rturn,rvalid_0,rvalid_1;
  always@(posedge clk) begin
    if(rst|invalid) begin
      VALID_0 <= 256'b0;
      VALID_1 <= 256'b0;
      TURN <= 256'b0;
      rvalid_0 <= 1'b0;
      rvalid_1 <= 1'b0;
      rturn <= 1'b0;
    end else begin
      if(turn_we) TURN[turn_index] <= wturn;
      if(valid_0_we) VALID_0[valid_index] <= wvalid_0;
      if(valid_1_we) VALID_1[valid_index] <= wvalid_1;
      rvalid_0 <= VALID_0[valid_index];
      rvalid_1 <= VALID_1[valid_index];
      rturn <= TURN[turn_index];
    end
  end


  wire [7:0] rindex  = raddr[10:3];
  wire [7:0] windex  = waddr[10:3];
  

  
  wire ren_r,wen_r;
  ysyx_050920_Reg #(.WIDTH(2), .RESET_VAL(2'b0)) reg_rwen (.clk(clk), .rst(rst|invalid), .din({ren,wen}&{2{~(busy|direct)}}), .dout({ren_r,wen_r}), .wen(1'b1));
  wire rdirect = ren&direct&~busy;
  wire wdirect = wen&direct&~busy;


  reg ram_wen;
  reg [15:0] ram_wstrb;
  reg [7:0] ram_addr;
  reg [127:0] ram_wdata;
  wire [127:0] ram_rdata;


  reg adirect;
  reg [10:0] araddr;
  reg [3:0] arsize;
  wire [7:0] mem_rindex  = araddr[10:3];
  wire [2:0] mem_roffset = araddr[2:0];

  wire [7:0] mem_windex  = mem_waddr[10:3];
  wire [2:0] mem_woffset = mem_waddr[2:0];
  
  wire rhit0  = ren_r & ( rtag0 == mem_raddr[31:11]) &   rvalid_0;
  wire rhit1  = ren_r & ( rtag1 == mem_raddr[31:11]) &   rvalid_1;
  wire rmiss0 = ren_r & ((rtag0 != mem_raddr[31:11]) | (~rvalid_0));
  wire rmiss1 = ren_r & ((rtag1 != mem_raddr[31:11]) | (~rvalid_1));
  wire whit0  = wen_r & ( rtag0 == mem_waddr[31:11]) &   rvalid_0;
  wire whit1  = wen_r & ( rtag1 == mem_waddr[31:11]) &   rvalid_1;
  wire wmiss0 = wen_r & ((rtag0 != mem_waddr[31:11]) | (~rvalid_0));
  wire wmiss1 = wen_r & ((rtag1 != mem_waddr[31:11]) | (~rvalid_1));

  wire rmiss = rmiss0&rmiss1;
  wire rhit = rhit0|rhit1;
  wire wmiss = wmiss0&wmiss1;
  wire whit = whit0|whit1;

  wire [63:0] hitway_rdata = (rhit1==1'b1)?ram_rdata[127:64]:ram_rdata[63:0];

  reg write_miss;

  localparam FSM_IDLE  = 4'b0001;
  localparam FSM_READ  = 4'b0010; /* Load data and allocate cacheline. */
  localparam FSM_WRITE = 4'b0100; /* Store data to memory and cacheline. */
  localparam FSM_WAIT  = 4'b1000; 
  reg [3:0] state;

  always @(posedge clk) begin
    if(rst) state <= FSM_IDLE; 
    else begin
      state <= state;
      case(state)
        FSM_IDLE: if(rmiss|rdirect|wmiss) state <= FSM_READ; else if(whit|wdirect) state <= FSM_WRITE;
        FSM_READ: if(mem_rdata_valid_r) 
                    if(write_miss) state <= FSM_WRITE; 
                    else state <= FSM_IDLE; 
        FSM_WRITE: if(mem_wen&(~mem_wbusy)) state <= FSM_IDLE;
        FSM_WAIT: state <= FSM_IDLE;
        default: state <= FSM_IDLE;
      endcase
    end
  end


  always @(posedge clk) begin
    if(rst) begin
      // VALID_0 <= 256'b0;
      // VALID_1 <= 256'b0;
      // TURN <= 256'b0;
      mem_raddr <= 32'b0;
      mem_waddr <= 32'b0;
      mem_ren <= 1'b0;
      mem_wen <= 1'b0;
      mem_rsize <= 4'b0;
      mem_wsize <= 4'b0;
      mem_wdata <= 64'b0;
      araddr <= 11'b0;
      arsize <= 4'b0;
      write_miss <= 1'b0;
      adirect <= 1'b0;
      tag_sel <= 1'b0;
      wtag0 <= 21'b0;
      wtag1 <= 21'b0;
    end else begin
      // if(invalid) begin
      //   VALID_0 <= 256'b0;
      //   VALID_1 <= 256'b0;
      // end
      case(state)
        FSM_IDLE: begin
          tag_sel <= rturn;
          if(~busy) begin
            adirect <= direct;
            if(wen) begin
              wtag0 <= waddr[31:11];
              wtag1 <= waddr[31:11];
            end
            else begin
              // tag_sel <= rturn;
              wtag0 <= raddr[31:11];
              wtag1 <= raddr[31:11];
            end
            araddr <= raddr[10:0];
            if(direct) begin 
              arsize <= rsize;
              mem_rsize <= rsize;
              mem_raddr <= raddr[31:0];
            end else begin
              arsize <= rsize;
              mem_rsize <= 4'b1000;
              mem_raddr <= {raddr[31:3],3'b0};
            end
            mem_wsize <= wsize;
            mem_waddr <= waddr[31:0];
            case(wsize)
            4'b0001: begin mem_wdata <= {8{wdata[0+: 8]}}; end
            4'b0010: begin mem_wdata <= {4{wdata[0+:16]}}; end
            4'b0100: begin mem_wdata <= {2{wdata[0+:32]}}; end
            4'b1000: begin mem_wdata <= {1{wdata[0+:64]}}; end
            default: begin mem_wdata <= 64'b0; end
            endcase 
          end

          mem_wen <= 1'b0;
          mem_ren <= 1'b0;
          write_miss <= wmiss;
          // if(rhit0) TURN[mem_rindex] <= 1'b1;
          // else if(rhit1) TURN[mem_rindex] <= 1'b0;
          // else if(whit0) TURN[mem_windex] <= 1'b1;
          // else if(whit1) TURN[mem_windex] <= 1'b0;
          /* If read or write access is miss, load data from memory. */
          if(rmiss|rdirect|wmiss) begin
            mem_ren <= 1'b1;
          end
          if(whit|wdirect) begin
            mem_wen <= wdirect;
          end
        end
        FSM_READ: begin
          if(mem_ren&(~mem_rbusy)) mem_ren <= 1'b0;
          if(mem_rdata_valid_r&~adirect&~write_miss) begin
            if(tag_sel == 1'b0) begin
              // TURN[mem_rindex] <= 1'b1;
              // VALID_0[mem_rindex] <= 1'b1;
              // TAG0[mem_rindex] <= mem_raddr[31:11];
            end else begin
              // TURN[mem_rindex] <= 1'b0;
              // VALID_1[mem_rindex] <= 1'b1;
              // TAG1[mem_rindex] <= mem_raddr[31:11];
            end 
          end
          if(mem_rdata_valid_r&~adirect&write_miss)
          begin
            if(tag_sel == 1'b0) begin
              // TURN[mem_windex] <= 1'b1;
              // VALID_0[mem_windex] <= 1'b1;
              // TAG0[mem_windex] <= mem_waddr[31:11];
            end else begin
              // TURN[mem_windex] <= 1'b0;
              // VALID_1[mem_windex] <= 1'b1;
              // TAG1[mem_windex] <= mem_waddr[31:11];
            end 
            mem_wdata <= mem_rdata_r;
            mem_wen <= 1'b1;
            mem_wsize <= 4'b1000;
            mem_waddr[2:0] <= 3'b0;
            case(mem_wsize)
            4'b0001: mem_wdata[{mem_waddr[2:0],3'b0}+: 8] <= mem_wdata[0+: 8];
            4'b0010: mem_wdata[{mem_waddr[2:1],4'b0}+:16] <= mem_wdata[0+:16];
            4'b0100: mem_wdata[{mem_waddr[2:2],5'b0}+:32] <= mem_wdata[0+:32];
            4'b1000: mem_wdata <= mem_wdata;
            default: ;
            endcase
          end
        end
        FSM_WRITE: begin
          
          if(~mem_wen) begin
            // mem_wdata <= hitway_rdata;
            mem_wdata <= ((rtag1==mem_waddr[31:11])&&rvalid_1)?ram_rdata[127:64]:ram_rdata[63:0];
            mem_wen <= 1'b1;
            mem_wsize <= 4'b1000;
            mem_waddr[2:0] <= 3'b0;
            case(mem_wsize)
            4'b0001: mem_wdata[{mem_waddr[2:0],3'b0}+: 8] <= mem_wdata[0+: 8];
            4'b0010: mem_wdata[{mem_waddr[2:1],4'b0}+:16] <= mem_wdata[0+:16];
            4'b0100: mem_wdata[{mem_waddr[2:2],5'b0}+:32] <= mem_wdata[0+:32];
            4'b1000: mem_wdata <= mem_wdata;
            default: ;
            endcase
          end
          /* Data has send to BUS. */
          if(mem_wen&(~mem_wbusy)) begin 
            mem_wen <= 1'b0;
            write_miss <= 1'b0;
          end
        end
        FSM_WAIT: begin
          
        end
        default: begin
          // VALID_0 <= 256'b0;
          // VALID_1 <= 256'b0;
          mem_raddr <= 32'b0;
          mem_waddr <= 32'b0;
          mem_ren <= 1'b0;
          mem_wen <= 1'b0;
          mem_rsize <= 4'b0;
          mem_wsize <= 4'b0;
          mem_wdata <= 64'b0;
          araddr <= 11'b0;
          arsize <= 4'b0;
          write_miss <= 1'b0;
          adirect <= 1'b0;
        end
      endcase
    end
  end

  
  always@(*) begin
    tag_wen = 1'b0;
    tag_index = ram_addr;
    valid_index = ram_addr;
    turn_index = ram_addr;
    turn_we = 1'b0;
    valid_0_we = 1'b0;
    valid_1_we = 1'b0;
    wvalid_0 = 1'b1;
    wvalid_1 = 1'b1;
    wturn = ~tag_sel;
    case(state)
    FSM_IDLE: begin
      
    end
    FSM_READ: begin 
      if(mem_rdata_valid_r&~adirect) begin
        tag_wen = 1'b1;
        turn_we = 1'b1;
        valid_0_we = ~tag_sel;
        valid_1_we = tag_sel;
      end
    end
    FSM_WRITE: begin
      
    end
    default: ;
    endcase
  end

  always @(*) begin
    ram_wen = 1'b0;
    ram_wstrb = 16'h0;
    ram_addr = 8'b0;
    ram_wdata = 128'b0;
    case(state)
    FSM_IDLE: begin
      ram_wen = 1'b0;
      ram_wstrb = 16'h0;
      case({ren,wen,whit})
      3'b100: ram_addr = rindex;
      3'b010: ram_addr = windex;
      3'b001: ram_addr = mem_windex;
      default: ram_addr = 8'b0;
      endcase
      // if(ren) ram_addr = rindex;
      // if(wen) ram_addr = windex;
      // if(whit) ram_addr = mem_windex;
      ram_wdata = 128'b0;
    end
    FSM_READ: begin 
      if(write_miss) ram_addr = mem_windex;
      else ram_addr = mem_rindex;
      if(mem_rdata_valid_r&(~adirect)) begin
        ram_wen = 1'b1;
        
        if(tag_sel) begin
          ram_wstrb = 16'hff00;
          ram_wdata = {mem_rdata_r,64'b0};
        end else begin
          ram_wstrb = 16'h00ff;
          ram_wdata = {64'b0,mem_rdata_r};
        end
        
      end
    end
    FSM_WRITE: begin
      ram_addr = {mem_windex};
      case(mem_wsize)
      4'b0001: begin ram_wdata = {16{mem_wdata[0+:8]}}; ram_wstrb = 16'b1  << {write_miss?tag_sel:(rtag1 == mem_waddr[31:11]&&rvalid_1) ? 1'b1 : 1'b0 ,mem_woffset[2:0]}; end
      4'b0010: begin ram_wdata = {8{mem_wdata[0+:16]}}; ram_wstrb = 16'b11 << {write_miss?tag_sel:(rtag1 == mem_waddr[31:11]&&rvalid_1) ? 1'b1 : 1'b0 ,mem_woffset[2:1],1'b0}; end
      4'b0100: begin ram_wdata = {4{mem_wdata[0+:32]}}; ram_wstrb = 16'hf  << {write_miss?tag_sel:(rtag1 == mem_waddr[31:11]&&rvalid_1) ? 1'b1 : 1'b0 ,mem_woffset[2:2],2'b0}; end
      4'b1000: begin ram_wdata = {2{mem_wdata[0+:64]}}; ram_wstrb = 16'hff << {write_miss?tag_sel:(rtag1 == mem_waddr[31:11]&&rvalid_1) ? 1'b1 : 1'b0 ,3'b0}; end
      default: begin ram_wdata = 128'b0; ram_wstrb = 16'b0; end
      endcase  
      if(mem_wen&(~mem_wbusy)&(~adirect)) begin
        if(rtag0 == mem_waddr[31:11]&&rvalid_0) begin
          ram_wen = 1'b1;
        end else if(rtag1 == mem_waddr[31:11]&&rvalid_1) begin
          ram_wen = 1'b1;
        end
        if(write_miss) ram_wen = 1'b1;
      end
    end
    default: ;
    endcase
  end

  always @(*) begin
    rdata = 64'b0;
      case(state)
      FSM_IDLE: begin
        // if(rdata_valid)
        case(arsize) 
        4'b0001: rdata[ 7:0] = hitway_rdata[{mem_roffset[2:0],3'b0}+: 8];
        4'b0010: rdata[15:0] = hitway_rdata[{mem_roffset[2:1],4'b0}+:16];
        4'b0100: rdata[31:0] = hitway_rdata[{mem_roffset[2:2],5'b0}+:32];
        4'b1000: rdata = hitway_rdata;
        default: rdata = 64'h0;
        endcase
      end
      FSM_READ: begin 
        case(arsize)
        4'b0001: rdata[ 7:0] = mem_rdata_r[{mem_roffset[2:0],3'b0}+: 8];
        4'b0010: rdata[15:0] = mem_rdata_r[{mem_roffset[2:1],4'b0}+:16];
        4'b0100: rdata[31:0] = mem_rdata_r[{mem_roffset[2:2],5'b0}+:32];
        4'b1000: rdata = mem_rdata_r;
        default: rdata = 64'h0;
        endcase
      end
      default: rdata = 64'h0;
      endcase
  end

  ysyx_050920_sram4K inst_sram4K(
    .clk(clk),
    .rst(rst),
    .io_sram0_addr(io_sram0_addr),
    .io_sram0_cen(io_sram0_cen),
    .io_sram0_wen(io_sram0_wen),
    .io_sram0_wmask(io_sram0_wmask),
    .io_sram0_wdata(io_sram0_wdata),
    .io_sram0_rdata(io_sram0_rdata),
    .io_sram1_addr(io_sram1_addr),
    .io_sram1_cen(io_sram1_cen),
    .io_sram1_wen(io_sram1_wen),
    .io_sram1_wmask(io_sram1_wmask),
    .io_sram1_wdata(io_sram1_wdata),
    .io_sram1_rdata(io_sram1_rdata),
    .io_sram2_addr(io_sram2_addr),
    .io_sram2_cen(io_sram2_cen),
    .io_sram2_wen(io_sram2_wen),
    .io_sram2_wmask(io_sram2_wmask),
    .io_sram2_wdata(io_sram2_wdata),
    .io_sram2_rdata(io_sram2_rdata),
    .io_sram3_addr(io_sram3_addr),
    .io_sram3_cen(io_sram3_cen),
    .io_sram3_wen(io_sram3_wen),
    .io_sram3_wmask(io_sram3_wmask),
    .io_sram3_wdata(io_sram3_wdata),
    .io_sram3_rdata(io_sram3_rdata),
    .wen(ram_wen),
    .wstrb(ram_wstrb),
    .wdata(ram_wdata),
    .addr(ram_addr),
    .rdata(ram_rdata)
  );
  
  assign rdata_valid = rhit|(mem_rdata_valid_r&(~write_miss));
  assign busy = (state != FSM_IDLE) ? 1'b1 : (rmiss|wen_r);
  assign rbusy = busy;
  assign wbusy = busy;
endmodule
module ysyx_050920_MemBus(
  input clk,
  input rst,

  output dcache_mem_rbusy,
  input dcache_mem_ren,
  input [3:0] dcache_mem_rsize,
  input [31:0] dcache_mem_raddr,
  output reg [63:0] dcache_mem_rdata,
  output reg dcache_mem_rdata_valid,

  output dcache_mem_wbusy,
  input dcache_mem_wen,
  input [3:0] dcache_mem_wsize,
  input [31:0] dcache_mem_waddr,
  input [63:0] dcache_mem_wdata,

  output icache_mem_rbusy,
  input icache_mem_ren,
  input [3:0] icache_mem_rsize,
  input [31:0] icache_mem_raddr,
  output reg [63:0] icache_mem_rdata,
  output reg icache_mem_rdata_valid,


  output clint_wen,
  output clint_ren,
  output [31:0] clint_raddr,
  output [31:0] clint_waddr,
  output [63:0] clint_wdata,
  output [3:0] clint_wsize,
  input [63:0] clint_rdata,
  output [3:0] clint_rsize,
  input clint_rdata_valid,

  input io_master_awready,
  output io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0] io_master_awid,
  output [7:0] io_master_awlen,
  output [2:0] io_master_awsize,
  output [1:0] io_master_awburst,

  input io_master_wready,
  output io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0] io_master_wstrb,
  output io_master_wlast,

  output io_master_bready,
  input io_master_bvalid,
  input [1:0] io_master_bresp,
  input [3:0] io_master_bid,

  input io_master_arready,
  output io_master_arvalid,
  output [31:0] io_master_araddr,
  output [3:0] io_master_arid,
  output [7:0] io_master_arlen,
  output [2:0] io_master_arsize,
  output [1:0] io_master_arburst,

  output io_master_rready,
  input io_master_rvalid,
  input [1:0] io_master_rresp,
  input [63:0] io_master_rdata,
  input io_master_rlast,
  input [3:0] io_master_rid
);
  localparam FSM_SEL_ICACHE = 1'b0;
  localparam FSM_SEL_DCACHE = 1'b1;
  reg [0:0] rstate;
  
  wire sel_clint_w = dcache_mem_waddr[31:16] == 16'h0200;
  wire sel_clint_r = dcache_mem_raddr[31:16] == 16'h0200;
  
  reg icache_reading,dcache_reading;
  always@(posedge clk) begin
    if(rst) begin
      icache_reading <= 1'b0;
      dcache_reading <= 1'b0;
    end else begin
      if(rstate == FSM_SEL_ICACHE) begin
        if(icache_mem_ren) icache_reading <= 1'b1;
        if(icache_mem_rdata_valid) icache_reading <= 1'b0;
      end else begin
        icache_reading <= 1'b0;
      end
      if(rstate == FSM_SEL_DCACHE) begin
        if(dcache_mem_ren) dcache_reading <= 1'b1;
        if(dcache_mem_rdata_valid) dcache_reading <= 1'b0;
      end else begin
        dcache_reading <= 1'b0;
      end
    end
  end

  always@(posedge clk)begin
    if(rst) rstate <= FSM_SEL_ICACHE;
    else 
    case(rstate)
    FSM_SEL_ICACHE: if(dcache_mem_ren&(~icache_mem_ren)&(~icache_reading)) rstate <= FSM_SEL_DCACHE;
    FSM_SEL_DCACHE: if(icache_mem_ren&(~dcache_mem_ren)&(~dcache_reading)) rstate <= FSM_SEL_ICACHE;
    default:;
    endcase
  end

  always @(*) begin
    icache_mem_rdata = 64'b0;
    icache_mem_rdata_valid = 1'b0;
    dcache_mem_rdata = 64'b0;
    dcache_mem_rdata_valid = 1'b0;
    case(rstate)
    FSM_SEL_ICACHE: begin
      icache_mem_rdata         = io_master_rdata;
      icache_mem_rdata_valid   = io_master_rvalid;
    end
    FSM_SEL_DCACHE: begin
      dcache_mem_rdata         = {64{io_master_rvalid}}&io_master_rdata | {64{clint_rdata_valid}}&clint_rdata;
      dcache_mem_rdata_valid   = io_master_rvalid|clint_rdata_valid;
    end
    default:;
    endcase
  end

  assign icache_mem_rbusy = rstate != FSM_SEL_ICACHE;
  assign dcache_mem_rbusy = rstate != FSM_SEL_DCACHE;
  // assign dcache_mem_wbusy = awvalid|wvalid;

  localparam BYTES_TRANS_1 = 3'b000;
  localparam BYTES_TRANS_2 = 3'b001;
  localparam BYTES_TRANS_4 = 3'b010;
  localparam BYTES_TRANS_8 = 3'b011;

  reg [31:0] awaddr;
  reg [2:0] awsize;
  reg [7:0] wstrb;
  reg awvalid;
  reg wvalid;
  reg [63:0] wdata;

  reg wstate;

  assign dcache_mem_wbusy = wstate;
  always @(posedge clk) begin
    if(rst) wstate <= 1'b0;
    else
      case(wstate)
      1'b0: if(dcache_mem_wen&(~sel_clint_w)) wstate <= 1'b1;
      1'b1: if(wvalid&io_master_wready) wstate <= 1'b0;
      default: wstate <= 1'b0;
      endcase
      
      
  end
  always @(posedge clk) begin
    if(rst) begin
      awaddr <= 32'b0;
      awsize <= 3'b0;
      awvalid <= 1'b0;
      wvalid <= 1'b0;
      wdata <= 64'b0;
      wstrb <= 8'b0;
    end else begin
      case(wstate)
      1'b0: begin
        wvalid <= 1'b0;
        if(dcache_mem_wen&(~sel_clint_w)) begin
          awvalid <= 1'b1;
          awaddr <= dcache_mem_waddr;
          wdata <= dcache_mem_wdata;
          case(dcache_mem_wsize)
          4'b0001:begin awsize <= BYTES_TRANS_1; wstrb <= 8'h01 << dcache_mem_waddr[2:0];end
          4'b0010:begin awsize <= BYTES_TRANS_2; wstrb <= 8'h03 << {dcache_mem_waddr[2:1],1'b0};end
          4'b0100:begin awsize <= BYTES_TRANS_4; wstrb <= 8'h0f << {dcache_mem_waddr[2:2],2'b0};end
          4'b1000:begin awsize <= BYTES_TRANS_8; wstrb <= 8'hff; end
          default: begin awsize <= 3'b000; wstrb <= 8'h00;end 
          endcase 
        end
      end
      1'b1: begin
        if(wvalid&io_master_wready) begin
          wvalid <= 1'b0;
        end
        if(awvalid&io_master_awready) begin
          wvalid <= 1'b1;
          awvalid <= 1'b0;
        end
      end
      default: begin
        awvalid <= 1'b0;
        wvalid <= 1'b0;
      end
      endcase
      
      
    end
  end
  reg arvalid;
  reg [31:0] araddr;
  reg [2:0] arsize;
  always @(posedge clk) begin
    if(rst) begin
      arvalid <= 1'b0;
      araddr <= 32'b0;
      arsize <= 3'b0;
    end else begin
      case(rstate)
      FSM_SEL_ICACHE: begin
        if(arvalid&io_master_arready) arvalid <= 1'b0;
        if(icache_mem_ren) begin
          arvalid <= 1'b1;
          araddr <= icache_mem_raddr;
          case(icache_mem_rsize)
          4'b0001:arsize <= BYTES_TRANS_1;
          4'b0010:arsize <= BYTES_TRANS_2;
          4'b0100:arsize <= BYTES_TRANS_4;
          4'b1000:arsize <= BYTES_TRANS_8;
          default: arsize <= 3'b000;
          endcase
        end
      end
      FSM_SEL_DCACHE: begin
        if(arvalid&io_master_arready) arvalid <= 1'b0;
        if(dcache_mem_ren&(~sel_clint_r)) begin
          arvalid <= 1'b1;
          araddr <= dcache_mem_raddr;
          case(dcache_mem_rsize)
          4'b0001:arsize <= BYTES_TRANS_1;
          4'b0010:arsize <= BYTES_TRANS_2;
          4'b0100:arsize <= BYTES_TRANS_4;
          4'b1000:arsize <= BYTES_TRANS_8;
          default: arsize <= 3'b000;
          endcase
        end
      end
      default: arvalid <= 1'b0;
      endcase
    end
  end
  

  assign clint_ren = (~dcache_mem_rbusy)&dcache_mem_ren&sel_clint_r;
  assign clint_wen = (~dcache_mem_wbusy)&dcache_mem_wen&sel_clint_w;
  assign clint_raddr = dcache_mem_raddr;
  assign clint_waddr = dcache_mem_waddr;
  assign clint_wsize = dcache_mem_wsize;
  assign clint_rsize = dcache_mem_rsize;
  assign clint_wdata = dcache_mem_wdata;

  assign io_master_awvalid = awvalid;
  assign io_master_awaddr = awaddr;
  assign io_master_awid = 4'b0;
  assign io_master_awlen = 8'b0;
  assign io_master_awsize = awsize;
  assign io_master_awburst = 2'b0;

  assign io_master_wvalid = wvalid;
  assign io_master_wdata = wdata;
  assign io_master_wstrb = wstrb;
  assign io_master_wlast = 1'b1;

  assign io_master_bready= 1'b1;

  assign io_master_arvalid = arvalid;
  assign io_master_araddr = araddr;
  assign io_master_arid = 4'b0;
  assign io_master_arlen = 8'b0;
  assign io_master_arsize = arsize;
  assign io_master_arburst = 2'b0;
  assign io_master_rready = 1'b1;
endmodule
module ysyx_050920_Fetch(

  input enable,
  // input flush,
  output ready,

//from reg PC
  input [63:0] pc_i,
//to reg PC
  output [63:0] next_pc_o,
  output branch_valid_o,
//memory interface
  input rdata_valid,
  input [31:0] rdata,
  output [63:0] raddr,
  output ren,
//from execute stage
  input [63:0] branch_pc,
  input branch_valid_i,
//to decode stage
  output [63:0] pc_o,
  output [31:0] inst_o,
  output valid_o
);

  wire branch = branch_valid_i;
  wire no_branch = !branch;
  assign next_pc_o = {64{no_branch}}&(pc_i + 64'h4) | {64{branch}}&branch_pc;
  assign branch_valid_o = branch_valid_i;
  assign raddr = pc_i;
  assign pc_o = raddr;
  assign inst_o = rdata;
  assign valid_o = rdata_valid;
  assign ren = enable;
  assign ready = enable;
endmodule
module ysyx_050920_IF_reg(
  input clk,
  input rst,
//pipeline signals
  input flush,
  input enable,
  input ready,

//from ysyx_050920_Fetch unit
  input valid_i,
  input [63:0] inst_pc_i,
  input [31:0] inst_i,

//to ysyx_050920_Decode uint
  output [63:0] inst_pc_o,
  output [31:0] inst_o,
  output valid_o

);

  ysyx_050920_Reg #(.WIDTH(64), .RESET_VAL(64'b0)) reg_inst_pc (.clk(clk), .rst(rst|flush), .din(inst_pc_i), .dout(inst_pc_o), .wen(enable));

  wire [31:0] inst_last;
  // wire inst_valid_last;
  ysyx_050920_Reg #(.WIDTH(32), .RESET_VAL(32'b0)) reg_inst_last (.clk(clk), .rst(rst|flush), .din(inst_i), .dout(inst_last), .wen(valid_i));
  // ysyx_050920_Reg #(.WIDTH(1), .RESET_VAL(1'b0)) reg_inst_valid_last (.clk(clk), .rst(rst|ready), .din(valid_i), .dout(inst_valid_last), .wen(valid_i));

  assign inst_o = {32{valid_i}}&inst_i | {32{~valid_i}}&inst_last;
  assign valid_o = valid_i&ready;
  
endmodule
module ysyx_050920_PC(
  input clk,
  input rst,
  input [63:0] next_pc_i,
  input next_pc_valid_i,

  output [63:0] pc_o/*verilator public_flat*/
);

  ysyx_050920_Reg #(.WIDTH(64), .RESET_VAL(64'h3000_0000)) reg_pc (.clk(clk), .rst(rst), .din(next_pc_i), .dout(pc_o), .wen(next_pc_valid_i));

endmodule
module ysyx_050920_ID_reg(
  input clk,
  input rst,
  input enable,
  input flush,
  input ready,

  //from ysyx_050920_Decode uint
  // input valid_i,

  // input [31:0] inst_i,

  input [63:0] pc_i,
  input [63:0] src1_i,
  input [63:0] src2_i,
  input [4:0] rs1_i,
  input [4:0] rs2_i,
  input [63:0] imm_i,
  input [4:0] dest_i,

  input [6:0] arithmetic_op_i,
  input [21:0] logic_op_i,
  input [7:0] branch_op_i,
  input [7:0] load_op_i,
  input [3:0] store_op_i,
  input [4:0] mul_op_i,
  input [7:0] div_op_i,
  input [7:0] csr_op_i,
  input [0:0] fence_op_i,
  // input [1:0] other_op_i,
  input [0:0] unsupport_op_i,

  // output [31:0] inst_o,

  output [63:0] pc_o,
  output [63:0] src1_o,
  output [63:0] src2_o,
  output [4:0] rs1_o,
  output [4:0] rs2_o,
  output [63:0] imm_o,
  output [4:0] dest_o,

  output [6:0] arithmetic_op_o,
  output [21:0] logic_op_o,
  output [7:0] branch_op_o,
  output [7:0] load_op_o,
  output [3:0] store_op_o,
  output [4:0] mul_op_o,
  output [7:0] div_op_o,
  output [7:0] csr_op_o,
  output [0:0] fence_op_o,
  // output [1:0] other_op_o,
  output [0:0] unsupport_op_o
  // ,
  // output valid_o
);
  localparam NUM_WIDTH = 64+64+64+5+5+64+5;
  wire [NUM_WIDTH-1:0] inst_num_i = {pc_i,src1_i,src2_i,rs1_i,rs2_i,imm_i,dest_i};
  wire [NUM_WIDTH-1:0] inst_num_o;
  ysyx_050920_Reg #(.WIDTH(NUM_WIDTH), .RESET_VAL({NUM_WIDTH{1'b0}})) reg_num (.clk(clk), .rst(rst|flush), .din(inst_num_i), .dout(inst_num_o), .wen(enable));
  assign {pc_o,src1_o,src2_o,rs1_o,rs2_o,imm_o,dest_o} = inst_num_o;
  
  localparam OP_WIDTH = 7+22+8+8+4+5+8+8+1/*+2*/+1;
  wire [OP_WIDTH-1:0] inst_op_i = {arithmetic_op_i,logic_op_i,branch_op_i,load_op_i,store_op_i,mul_op_i,div_op_i,csr_op_i,fence_op_i/*,other_op_i*/,unsupport_op_i};
  wire [OP_WIDTH-1:0] inst_op_o;
  ysyx_050920_Reg #(.WIDTH(OP_WIDTH), .RESET_VAL({OP_WIDTH{1'b0}})) reg_op (.clk(clk), .rst(rst|flush), .din(inst_op_i), .dout(inst_op_o), .wen(enable));
  assign {arithmetic_op_o,logic_op_o,branch_op_o,load_op_o,store_op_o,mul_op_o,div_op_o,csr_op_o,fence_op_o/*,other_op_o*/,unsupport_op_o} = inst_op_o&{OP_WIDTH{ready}};
  
  // wire op_valid_o;
  // ysyx_050920_Reg #(.WIDTH( 1), .RESET_VAL(1'b0)) reg_valid (.clk(clk), .rst(rst|flush), .din(valid_i),   .dout(op_valid_o), .wen(enable));
  // assign valid_o = op_valid_o&ready;

  // ysyx_050920_Reg #(.WIDTH(32), .RESET_VAL(32'b0)) reg_inst (.clk(clk), .rst(rst|flush), .din(inst_i),   .dout(inst_o), .wen(enable));


endmodule
module ysyx_050920_RegisterFile #(ADDR_WIDTH = 1, DATA_WIDTH = 1) (
  input clk,
  input [DATA_WIDTH-1:0] wdata,
  input [ADDR_WIDTH-1:0] waddr,
  input wen,
  input [ADDR_WIDTH-1:0] raddr1,
  input [ADDR_WIDTH-1:0] raddr2,
  output reg [DATA_WIDTH-1:0] rdata1,
  output reg [DATA_WIDTH-1:0] rdata2

);
  reg [DATA_WIDTH-1:0] rf [2**ADDR_WIDTH-1:0];

  always@(posedge clk) begin
    if (wen) rf[waddr] <= wdata;
    rf[0] <= {DATA_WIDTH{1'b0}};
  end

  always@(*) begin
    rdata1 = rf[raddr1];
    rdata2 = rf[raddr2];
  end
endmodule
module ysyx_050920_Decode(
  input clk,
  // input rst,

  input enable,
  output ready,
//from fetch stage
  input [31:0] inst_i,
  input inst_valid,
  input [63:0] pc_i,
//from writeback stage
  input [4:0] waddr,
  input wen,
  input [63:0] wdata,

  // output src1_valid,
  // output src2_valid,
  // output dest_valid,
//to execute stage
  output [63:0] pc_o,
  output [63:0] src1,
  output [63:0] src2,
  output [4:0] rs1,
  output [4:0] rs2,
  output [63:0] imm,
  output [4:0] dest,

  // output [31:0] inst_o,

//to execute stage
  // output op_valid_o,
//to arithmetic unit
  output [6:0] arithmetic_op,
//to logic unit
  output [21:0] logic_op,
//to branch unit
  output [7:0] branch_op,
//to load store unit
  output [7:0] load_op,
  output [3:0] store_op,
//to mul div unit
  output [4:0] mul_op,
  output [7:0] div_op,
//to CSR ctrl unit
  output [7:0] csr_op,
//fence op
  output [0:0] fence_op,
//other op
  // output [1:0] other_op,
//unsupport op
  output [0:0] unsupport_op
);

  wire src1_valid;
  wire src2_valid;
  // assign op_valid_o = inst_valid;
  // assign inst_o = inst_i;
  wire [31:0] inst = inst_i;
  assign rs1 = {5{src1_valid}}&inst[19:15];
  assign rs2 = {5{src2_valid}}&inst[24:20];
  wire [4:0]  rd   = inst[11:7];

  wire [63:0] immI  = {{52{inst[31]}},inst[31:20]};
  wire [63:0] immU  = {{32{inst[31]}},inst[31:12],12'b0};
  wire [63:0] immS  = {{52{inst[31]}},inst[31:25],inst[11:7]};
  wire [63:0] immJ  = {{43{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
  wire [63:0] immB  = {{51{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0};

  wire [6:0] opcode  = inst[6:0];
  wire [2:0] funct3  = inst[14:12];
  wire [6:0] funct7  = inst[31:25];

  wire [63:0] rdata1;
  wire [63:0] rdata2;

  wire op_auipc      =     opcode == 7'b00101_11;                                                  //32'bxxxxxxx_xxxxx_xxxxx_xxx_xxxxx_00101_11;
  wire op_lui        =     opcode == 7'b01101_11;                                                  //32'bxxxxxxx_xxxxx_xxxxx_xxx_xxxxx_01101_11;
  wire op_addiw      =     opcode == 7'b00110_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_00110_11;
  wire op_addw       =     opcode == 7'b01110_11 && funct3 == 3'b000 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_000_xxxxx_01110_11;
  wire op_ld         =     opcode == 7'b00000_11 && funct3 == 3'b011;                              //32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_00000_11;
  wire op_lwu        =     opcode == 7'b00000_11 && funct3 == 3'b110;                              //32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_00000_11;
  wire op_sd         =     opcode == 7'b01000_11 && funct3 == 3'b011;                              //32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_01000_11;
  wire op_slli       =     opcode == 7'b00100_11 && funct3 == 3'b001 && funct7[6:1] == 6'b000000;  //32'b000000x_xxxxx_xxxxx_001_xxxxx_00100_11;
  wire op_slliw      =     opcode == 7'b00110_11 && funct3 == 3'b001 && funct7[6:1] == 6'b000000;  //32'b000000x_xxxxx_xxxxx_001_xxxxx_00110_11;
  wire op_sllw       =     opcode == 7'b01110_11 && funct3 == 3'b001 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_001_xxxxx_01110_11;
  wire op_srai       =     opcode == 7'b00100_11 && funct3 == 3'b101 && funct7[6:1] == 6'b010000;  //32'b010000x_xxxxx_xxxxx_101_xxxxx_00100_11;
  wire op_sraiw      =     opcode == 7'b00110_11 && funct3 == 3'b101 && funct7 == 7'b0100000;      //32'b0100000_xxxxx_xxxxx_101_xxxxx_00110_11;
  wire op_sraw       =     opcode == 7'b01110_11 && funct3 == 3'b101 && funct7 == 7'b0100000;      //32'b0100000_xxxxx_xxxxx_101_xxxxx_01110_11;
  wire op_srli       =     opcode == 7'b00100_11 && funct3 == 3'b101 && funct7[6:1] == 6'b000000;  //32'b000000x_xxxxx_xxxxx_101_xxxxx_00100_11;
  wire op_srliw      =     opcode == 7'b00110_11 && funct3 == 3'b101 && funct7[6:1] == 6'b000000;  //32'b000000x_xxxxx_xxxxx_101_xxxxx_00110_11;
  wire op_srlw       =     opcode == 7'b01110_11 && funct3 == 3'b101 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_101_xxxxx_01110_11;
  wire op_subw       =     opcode == 7'b01110_11 && funct3 == 3'b000 && funct7 == 7'b0100000;      //32'b0100000_xxxxx_xxxxx_000_xxxxx_01110_11;
  wire op_DIVUW      =     opcode == 7'b01110_11 && funct3 == 3'b101 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_101_xxxxx_01110_11;
  wire op_DIVW       =     opcode == 7'b01110_11 && funct3 == 3'b100 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_100_xxxxx_01110_11;
  wire op_REMUW      =     opcode == 7'b01110_11 && funct3 == 3'b111 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_111_xxxxx_01110_11;
  wire op_REMW       =     opcode == 7'b01110_11 && funct3 == 3'b110 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_110_xxxxx_01110_11;
  wire op_MULW       =     opcode == 7'b01110_11 && funct3 == 3'b000 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_000_xxxxx_01110_11;
  wire op_DIV        =     opcode == 7'b01100_11 && funct3 == 3'b100 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_100_xxxxx_01100_11;
  wire op_DIVU       =     opcode == 7'b01100_11 && funct3 == 3'b101 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_101_xxxxx_01100_11;
  wire op_REMU       =     opcode == 7'b01100_11 && funct3 == 3'b111 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_111_xxxxx_01100_11;
  wire op_REM        =     opcode == 7'b01100_11 && funct3 == 3'b110 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_110_xxxxx_01100_11;
  wire op_MUL        =     opcode == 7'b01100_11 && funct3 == 3'b000 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_000_xxxxx_01100_11;
  wire op_MULH       =     opcode == 7'b01100_11 && funct3 == 3'b001 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_001_xxxxx_01100_11;
  wire op_MULHSU     =     opcode == 7'b01100_11 && funct3 == 3'b010 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_010_xxxxx_01100_11;
  wire op_MULHU      =     opcode == 7'b01100_11 && funct3 == 3'b011 && funct7 == 7'b0000001;      //32'b0000001_xxxxx_xxxxx_011_xxxxx_01100_11;
  wire op_add        =     opcode == 7'b01100_11 && funct3 == 3'b000 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_000_xxxxx_01100_11;
  wire op_addi       =     opcode == 7'b00100_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_00100_11;
  wire op_and        =     opcode == 7'b01100_11 && funct3 == 3'b111 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_111_xxxxx_01100_11;
  wire op_andi       =     opcode == 7'b00100_11 && funct3 == 3'b111;                              //32'bxxxxxxx_xxxxx_xxxxx_111_xxxxx_00100_11;
  wire op_beq        =     opcode == 7'b11000_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_11000_11;
  wire op_bge        =     opcode == 7'b11000_11 && funct3 == 3'b101;                              //32'bxxxxxxx_xxxxx_xxxxx_101_xxxxx_11000_11;
  wire op_bgeu       =     opcode == 7'b11000_11 && funct3 == 3'b111;                              //32'bxxxxxxx_xxxxx_xxxxx_111_xxxxx_11000_11;
  wire op_blt        =     opcode == 7'b11000_11 && funct3 == 3'b100;                              //32'bxxxxxxx_xxxxx_xxxxx_100_xxxxx_11000_11;
  wire op_bltu       =     opcode == 7'b11000_11 && funct3 == 3'b110;                              //32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_11000_11;
  wire op_bne        =     opcode == 7'b11000_11 && funct3 == 3'b001;                              //32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_11000_11;
  wire op_ecall      =     inst == 32'b0000000_00000_00000_000_00000_11100_11;
  wire op_fence      =     opcode == 7'b00011_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_00011_11;
  wire op_jal        =     opcode == 7'b11011_11;                                                  //32'bxxxxxxx_xxxxx_xxxxx_xxx_xxxxx_11011_11;
  wire op_jalr       =     opcode == 7'b11001_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_11001_11;
  wire op_lb         =     opcode == 7'b00000_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_00000_11;
  wire op_lbu        =     opcode == 7'b00000_11 && funct3 == 3'b100;                              //32'bxxxxxxx_xxxxx_xxxxx_100_xxxxx_00000_11;
  wire op_lh         =     opcode == 7'b00000_11 && funct3 == 3'b001;                              //32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_00000_11;
  wire op_lhu        =     opcode == 7'b00000_11 && funct3 == 3'b101;                              //32'bxxxxxxx_xxxxx_xxxxx_101_xxxxx_00000_11;
  wire op_lw         =     opcode == 7'b00000_11 && funct3 == 3'b010;                              //32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_00000_11;
  wire op_or         =     opcode == 7'b01100_11 && funct3 == 3'b110 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_110_xxxxx_01100_11;
  wire op_ori        =     opcode == 7'b00100_11 && funct3 == 3'b110;                              //32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_00100_11;
  wire op_sb         =     opcode == 7'b01000_11 && funct3 == 3'b000;                              //32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_01000_11;
  wire op_sh         =     opcode == 7'b01000_11 && funct3 == 3'b001;                              //32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_01000_11;
  wire op_sw         =     opcode == 7'b01000_11 && funct3 == 3'b010;                              //32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_01000_11;
  wire op_sll        =     opcode == 7'b01100_11 && funct3 == 3'b001 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_001_xxxxx_01100_11;
  wire op_slt        =     opcode == 7'b01100_11 && funct3 == 3'b010 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_010_xxxxx_01100_11;
  wire op_slti       =     opcode == 7'b00100_11 && funct3 == 3'b010;                              //32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_00100_11;
  wire op_sltiu      =     opcode == 7'b00100_11 && funct3 == 3'b011;                              //32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_00100_11;
  wire op_sltu       =     opcode == 7'b01100_11 && funct3 == 3'b011;                              //32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_01100_11;
  wire op_sra        =     opcode == 7'b01100_11 && funct3 == 3'b101 && funct7 == 7'b0100000;      //32'b0100000_xxxxx_xxxxx_101_xxxxx_01100_11;
  wire op_srl        =     opcode == 7'b01100_11 && funct3 == 3'b101 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_101_xxxxx_01100_11;
  wire op_sub        =     opcode == 7'b01100_11 && funct3 == 3'b000 && funct7 == 7'b0100000;      //32'b0100000_xxxxx_xxxxx_000_xxxxx_01100_11;
  wire op_xor        =     opcode == 7'b01100_11 && funct3 == 3'b100 && funct7 == 7'b0000000;      //32'b0000000_xxxxx_xxxxx_100_xxxxx_01100_11;
  wire op_xori       =     opcode == 7'b00100_11 && funct3 == 3'b100;                              //32'bxxxxxxx_xxxxx_xxxxx_100_xxxxx_00100_11;
  wire op_ebreak     =     inst == 32'b0000000_00001_00000_000_00000_11100_11;

  wire op_csrrw      =     opcode == 7'b11100_11 && funct3 == 3'b001;                              //32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_11100_11;
  wire op_csrrs      =     opcode == 7'b11100_11 && funct3 == 3'b010;                              //32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_11100_11;
  wire op_csrrc      =     opcode == 7'b11100_11 && funct3 == 3'b011;                              //32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_11100_11;
  wire op_csrrwi     =     opcode == 7'b11100_11 && funct3 == 3'b101;                              //32'bxxxxxxx_xxxxx_xxxxx_101_xxxxx_11100_11;
  wire op_csrrsi     =     opcode == 7'b11100_11 && funct3 == 3'b110;                              //32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_11100_11;
  wire op_csrrci     =     opcode == 7'b11100_11 && funct3 == 3'b111;                              //32'bxxxxxxx_xxxxx_xxxxx_111_xxxxx_11100_11;
  wire op_mert       =     inst == 32'b0011000_00010_00000_000_00000_11100_11;

  wire op_fence_i    =     inst == 32'b0000000_00000_00000_001_00000_00011_11;
//RV64I RV32I
  wire type_I  = op_addiw|op_slli|op_slliw|op_srai|op_sraiw|op_srli|op_srliw|op_addi|op_andi|op_ori|op_slti|op_sltiu|op_xori|op_ld|op_lwu|op_jalr|op_lb|op_lbu|op_lh|op_lhu|op_lw|op_csrrw|op_csrrs|op_csrrc|op_csrrwi|op_csrrsi|op_csrrci;
  wire type_U  = op_auipc|op_lui;
  wire type_S  = op_sd|op_sb|op_sh|op_sw;
  wire type_J  = op_jal;
  wire type_B  = op_beq|op_bge|op_bgeu|op_blt|op_bltu|op_bne;
  wire type_R  = op_addw|op_sllw|op_sraw|op_srlw|op_subw|op_add|op_and|op_or|op_sll|op_slt|op_sltu|op_sra|op_srl|op_sub|op_xor|op_DIVUW|op_DIVW|op_REMUW|op_REMW|op_DIV|op_DIVU|op_REMU|op_REM|op_MULW|op_MUL|op_MULH|op_MULHSU|op_MULHU;
  // wire type_N  = op_fence|op_ecall|op_ebreak;

  // assign dest_valid = type_R|type_I|type_U|type_J;
  assign src1_valid = type_R|type_I|type_S|type_B;
  assign src2_valid = type_R|type_S|type_B;
  assign src1 = ({64{src1_valid}}&rdata1);
  assign src2 = ({64{src2_valid}}&rdata2);
  
  assign imm  = ({64{type_I}}&immI) |
                ({64{type_U}}&immU) |
                ({64{type_S}}&immS) |
                ({64{type_J}}&immJ) |
                ({64{type_B}}&immB) ;
  
  assign dest = rd;

  assign pc_o = pc_i;

  //7 ops
  assign arithmetic_op  = {op_addw,op_addiw,op_subw,op_add,op_addi,
                          op_sub,op_auipc};
  //22 ops
  assign logic_op       = {op_slli,op_slliw,op_sllw,op_srai,op_sraiw,
                          op_sraw,op_srli,op_srliw,op_srlw,op_and,
                          op_andi,op_or,op_ori,op_sll,op_slt,
                          op_slti,op_sltiu,op_sltu,op_sra,op_srl,
                          op_xor,op_xori};
  //8 ops
  assign branch_op      = {op_beq,op_bge,op_bgeu,op_blt,op_bltu,
                          op_bne,op_jal,op_jalr};
  //8 ops
  assign load_op        = {op_ld,op_lw,op_lwu,op_lh,op_lhu,
                          op_lb,op_lbu,op_lui};
  //4 ops
  assign store_op       = {op_sd,op_sw,op_sh,op_sb};
  //2 ops
  wire [1:0] other_op       = {op_fence,op_ebreak};
  //8 ops
  assign div_op         = {op_DIVUW,op_DIVW,op_REMUW,op_REMW,op_DIV,op_DIVU,op_REMU,op_REM};
  //5 ops
  assign mul_op         = {op_MULW,op_MUL,op_MULH,op_MULHSU,op_MULHU};
  //8 ops
  assign csr_op         = {op_csrrw,op_csrrs,op_csrrc,op_csrrwi,op_csrrsi,op_csrrci,op_mert,op_ecall};
  //1 ops
  assign fence_op       = {op_fence_i};
  //1 ops
  assign unsupport_op   = ~{(|arithmetic_op)|(|logic_op)|(|branch_op)|(|load_op)|(|store_op)|(|mul_op)|(|div_op)|(|csr_op)|(|fence_op)|(|other_op)};
  ysyx_050920_RegisterFile #(
    .ADDR_WIDTH(5),
    .DATA_WIDTH(64)
        )
  inst_RegisterFile (
    .clk    (clk),
    .wdata  (wdata),
    .waddr  (waddr),
    .wen    (wen),
    .raddr1 (inst[19:15]),
    .raddr2 (inst[24:20]),
    .rdata1 (rdata1),
    .rdata2 (rdata2)
  );

  assign ready = enable;
endmodule
module ysyx_050920_IRQ (
  input enable,

  input ecall,
  input mret,
  input [63:0] pc_i,

  input unsupport_op,
  input ex_intr,
  input mie_i,

  input [63:0] mtvec_i,
  input [63:0] mepc_i,

  output raise_intr,
  output raise_hard_intr,

  output [63:0] mepc_o,
  output mepc_valid_o,
  output [63:0] mcause_o,
  output mcause_valid_o,
  output [63:0] pc_o,
  output pc_valid_o

);
  localparam MCAUSE_INTR = {1'b1,63'b0};
  localparam MCAUSE_ECALL_M  = 64'd11|MCAUSE_INTR;
  localparam MCAUSE_EX_INT_M = 64'd7|MCAUSE_INTR;
  localparam MCAUSE_ILLEGAL_INSTRUCTION = 64'd2;


  wire soft_intr = ecall|unsupport_op;
  wire hard_intr = mie_i & (ex_intr);
   
  wire [63:0] hard_intr_cause = {64{ex_intr}}&MCAUSE_EX_INT_M;
  wire [63:0] sort_intr_cause = {64{ecall}}&{MCAUSE_ECALL_M}|{64{unsupport_op}}&MCAUSE_ILLEGAL_INSTRUCTION;
  assign raise_intr = enable&(soft_intr | hard_intr)&~mret;

  // assign mepc_o = {64{soft_intr}}&pc_i|{64{(~soft_intr)&hard_intr}}&{pc_i+64'h4};
  assign mepc_o = pc_i;
  assign mepc_valid_o = raise_intr;
  assign mcause_o = {64{soft_intr}}&sort_intr_cause | {64{(~soft_intr)&hard_intr}}&hard_intr_cause;
  assign mcause_valid_o = raise_intr;
  assign pc_o = {64{raise_intr}}&mtvec_i | {64{mret}}&mepc_i;
  assign pc_valid_o = enable&(raise_intr|mret);
  
  assign raise_hard_intr = enable&(hard_intr&~(soft_intr|mret));
endmodule
module ysyx_050920_CSRsFile (
  input clk,
  input rst,
  input exe_inst,
//normal csr r/w port
  input [11:0] csr_addr,
  input csr_read,
  input csr_write,
  input csr_set,
  input csr_clear,
  input [63:0] csr_wdata,
  output reg [63:0] csr_rdata,
//specific csr r/w port

  input raise_intr,
  input op_mret,


  input tim_int_req,

  input mtip_clear,
  input msip_i,
  input msip_valid_i,
  output msip_o,

  output mtip,

  output reg csr_mie_rdata,
//CSR mepc
  output reg [63:0] csr_mepc_rdata,
  input csr_mepc_write,
  input [63:0] csr_mepc_wdata,
//CSR mcause
  input csr_mcause_write,
  input [63:0] csr_mcause_wdata,
//CSR mtvec
  output reg [63:0] csr_mtvec_rdata

);
  localparam MSTATUS_ADDR = 12'h300;
  localparam MTVEC_ADDR = 12'h305;
  localparam MEPC_ADDR = 12'h341;
  localparam MCAUSE_ADDR = 12'h342;
  localparam MIE_ADDR = 12'h304;
  localparam MIP_ADDR = 12'h344;
 
  localparam MSTATUS_MIE = 3;
  localparam MSTATUS_MPIE = 7;
  localparam MIE_MTIE = 7;
  localparam MIP_MTIP = 7;
  localparam MIP_MSIP = 3;
  reg [63:0] mepc,mcause,mtvec,mstatus,mip,mie;

  reg [63:0] cycle_r,instret_r;
  localparam CYCLE_R_ADDR = 12'hc00;
  localparam INSTRET_R_ADDR = 12'hc02;

  assign mtip = mip[MIP_MTIP];
  assign msip_o = mip[MIP_MSIP];
  //csr read
  always @(*) begin
    csr_rdata = 64'b0;
    csr_mepc_rdata = mepc;
    csr_mtvec_rdata = mtvec;
    csr_mie_rdata = mstatus[MSTATUS_MIE];
    if(csr_read)
      case(csr_addr)
      MSTATUS_ADDR: csr_rdata = mstatus;
      MTVEC_ADDR: csr_rdata = mtvec;
      MEPC_ADDR: csr_rdata = mepc;
      MCAUSE_ADDR: csr_rdata = mcause;
      MIP_ADDR: csr_rdata = mip;
      MIE_ADDR: csr_rdata = mie;
      CYCLE_R_ADDR: csr_rdata = cycle_r;
      INSTRET_R_ADDR: csr_rdata = instret_r;
      default: csr_rdata = 64'b0;
      endcase
  end
  //csr write
  always @(posedge clk) begin
    if(rst) begin
      mepc <= 64'b0;
      mcause <= 64'b0;
      mtvec <= 64'b0;
      mstatus <= 64'ha00001800;
      mip <= 64'b0;
      mie <= 64'b0;
      cycle_r <= 64'b0;
      instret_r <= 64'b0;
    end else begin
      cycle_r <= cycle_r + 64'b1;
      if(exe_inst) instret_r <= instret_r + 64'b1;
      if(tim_int_req & mstatus[MSTATUS_MIE] & mie[MIE_MTIE]) mip[MIP_MTIP] <= 1'b1;
      if(mtip_clear) mip[MIP_MTIP] <= 1'b0;
      if(msip_valid_i) mip[MIP_MSIP] <= msip_i;
      if(csr_write) begin
        case(csr_addr)
        MSTATUS_ADDR:     mstatus  <= csr_wdata;
        MTVEC_ADDR:       mtvec    <= csr_wdata;
        MEPC_ADDR:        mepc     <= csr_wdata;
        MCAUSE_ADDR:      mcause   <= csr_wdata;
        MIP_ADDR:         mip      <= csr_wdata;
        MIE_ADDR:         mie      <= csr_wdata;
        CYCLE_R_ADDR:     cycle_r  <= csr_wdata;
        INSTRET_R_ADDR:   instret_r<= csr_wdata;
        default: ;
        endcase
      end else if(csr_set) begin
        case(csr_addr)
        MSTATUS_ADDR:     mstatus  <= mstatus  | csr_wdata;
        MTVEC_ADDR:       mtvec    <= mtvec    | csr_wdata;
        MEPC_ADDR:        mepc     <= mepc     | csr_wdata;
        MCAUSE_ADDR:      mcause   <= mcause   | csr_wdata;
        MIP_ADDR:         mip      <= mip      | csr_wdata;
        MIE_ADDR:         mie      <= mie      | csr_wdata;
        CYCLE_R_ADDR:     cycle_r  <= cycle_r  | csr_wdata;
        INSTRET_R_ADDR:   instret_r<= instret_r| csr_wdata;
        default: ;
        endcase
      end else if(csr_clear) begin
        case(csr_addr)
        MSTATUS_ADDR:     mstatus  <= mstatus  &(~csr_wdata);
        MTVEC_ADDR:       mtvec    <= mtvec    &(~csr_wdata);
        MEPC_ADDR:        mepc     <= mepc     &(~csr_wdata);
        MCAUSE_ADDR:      mcause   <= mcause   &(~csr_wdata);
        MIP_ADDR:         mip      <= mip      &(~csr_wdata);
        MIE_ADDR:         mie      <= mie      &(~csr_wdata);
        CYCLE_R_ADDR:     cycle_r  <= cycle_r  &(~csr_wdata);
        INSTRET_R_ADDR:   instret_r<= instret_r&(~csr_wdata);
        default: ;
        endcase
      end
      if(csr_mepc_write) mepc <= csr_mepc_wdata;
      if(csr_mcause_write) mcause <= csr_mcause_wdata;
      if(raise_intr) begin 
        mstatus[MSTATUS_MPIE] <= mstatus[MSTATUS_MIE];
        mstatus[MSTATUS_MIE] <= 1'b0;
      end
      if(op_mret) begin
        mstatus[MSTATUS_MIE] <= mstatus[MSTATUS_MPIE];
        mstatus[MSTATUS_MPIE] <= 1'b1;
      end
    end
    
  end

endmodule
module ysyx_050920_arithmetic_unit(
  input [6:0] op,
  input [63:0] src1,
  input [63:0] src2,
  input [63:0] imm,
  input [63:0] pc_i,

  output [63:0] res,
  output valid_o
);
  wire op_addw,op_addiw,op_subw,op_add,op_addi,op_sub,op_auipc;
  assign {op_addw,op_addiw,op_subw,op_add,op_addi,
                          op_sub,op_auipc} = op;

  wire [63:0] src1_w = {{32{src1[31]}},src1[31:0]};
  wire [63:0] src2_w = {{32{src2[31]}},src2[31:0]};
  wire [63:0] imm_w = {{32{imm[31]}},imm[31:0]};

  wire [63:0] op_val_1 = ({64{op_addw|op_addiw|op_subw}}&src1_w) | ({64{op_add|op_addi|op_sub}}&src1) | ({64{op_auipc}}&pc_i);
  wire [63:0] op_val_2 = ({64{op_addw|op_subw}}&src2_w) | ({64{op_addiw}}&imm_w) | ({64{op_add|op_sub}}&src2) | ({64{op_addi|op_auipc}}&imm) ;

  wire sub = op_sub|op_subw;
  wire [63:0] mid_val_1 = {64{sub}}&((~op_val_2)+64'b1);
  wire [63:0] mid_val_2 = ({64{!sub}}&op_val_2);
  wire [63:0] res_mid = op_val_1 + ( mid_val_1 | mid_val_2);

  assign res = {{32{op_addiw|op_addw|op_subw}}&{32{res_mid[31]}} | {32{op_addi|op_add|op_sub|op_auipc}}&res_mid[63:32],res_mid[31:0]};
  assign valid_o = |op;
endmodule
module ysyx_050920_basemul(
  input clk,
  input rst,
  
  input valid_i,
  input flush,

  input mulw,
  input [1:0] mul_signed,
  input [63:0] src1,
  input [63:0] src2,
  
  output reg ready,
  // output reg valid_o,
  output [63:0] res_hi,
  output [63:0] res_lo
);
  reg [128:0] res;
  reg [127:0] multiplicand;
  reg [63:0] multiplier;
  reg [6:0] cnt;
  reg res_sign;
  reg res_w;
  wire [128:0] res_next = multiplier[0] ? (res + multiplicand) : res;
  reg [127:0] res_out;
  always @(posedge clk) begin
    if(rst|flush) begin   
      multiplicand    <= 128'b0;
      multiplier      <= 64'b0;
      // valid_o <= 1'b0;
      ready <= 1'b1;
      res_sign <= 1'b0;
      res <= 129'b0;
      cnt <= 7'b0;
      res_w <= 1'b0;
      res_out <= 128'b0;
    end else begin 
      // valid_o <= 1'b0;
      res <= 129'b0;
      res_out <= 128'b0;
      if(ready&valid_i) begin
        res_sign <= ^mul_signed;
        ready <= 1'b0;
        res_w <= mulw;
        if(mulw) begin
          if(mul_signed[1]&src1[31]) multiplicand  <= {96'b0,{(~src1[31:0])+32'b1}}; 
          else multiplicand <= {96'b0,src1[31:0]}; 
          if(mul_signed[0]&src2[31]) multiplier    <= {32'b0,{(~src2[31:0])+32'b1}}; 
          else multiplier   <= {32'b0,src2[31:0]};
          cnt <= 7'd32;
        end else begin
          if(mul_signed[1]&src1[63]) multiplicand  <= {64'b0,(~src1)+64'b1}; 
          else multiplicand <= {64'b0,src1}; 
          if(mul_signed[0]&src2[63]) multiplier    <= {(~src2)+64'b1}; 
          else multiplier   <= src2; 
          cnt <= 7'd64;
        end
      end else if(ready == 1'b0) begin
        // if(multiplier[0]) res <= res_next;
        // else res <= res;
        res <= res_next;
        multiplier <= multiplier >> 1;
        multiplicand <= multiplicand << 1;
        cnt <= cnt - 7'd1;
        if(cnt == 7'd1) begin
          ready <= 1'b1;
          res_out <= res_sign?(~res_next[127:0] + 128'b1):res_next[127:0];
          // valid_o <= 1'b1;
        end
      end
    end
  end

  // wire [127:0] res_out = res_sign?(~res[127:0] + 128'b1):res[127:0];
  assign res_hi = res_out[127:64];
  assign res_lo[63:32] = res_w?{32{res_out[31]}}:res_out[63:32];
  assign res_lo[31:0]  = res_out[31:0];
  
endmodule
module ysyx_050920_csr_unit(
  input enable,
  input [7:0] op,
  input [63:0] src1,
  // input [63:0] src2,
  input [11:0] imm,
  input [63:0] pc_i,

  input [4:0] dest,
  input [4:0] rs1,

  input unsupport_op,
  input ex_intr,
  input csr_mie_rdata,
//normal csr r/w port
  output [11:0] csr_addr,
  output csr_read,
  output csr_write,
  output csr_set,
  output csr_clear,
  output [63:0] csr_wdata,
  input [63:0] csr_rdata,
//specific csr r/w port
  output raise_intr,
  output raise_hard_intr,
  output op_mret,
//CSR mepc
  input [63:0] csr_mepc_rdata,
  output csr_mepc_write,
  output [63:0] csr_mepc_wdata,
//CSR mcause
  output csr_mcause_write,
  output [63:0] csr_mcause_wdata,
//CSR mtvec
  input [63:0] csr_mtvec_rdata,

  output [63:0] pc_o,
  output pc_valid_o,

  output [63:0] res,
  output valid_o
);
  wire op_csrrw,op_csrrs,op_csrrc,op_csrrwi,op_csrrsi,op_csrrci,op_mert,op_ecall;
  assign {op_csrrw,op_csrrs,op_csrrc,op_csrrwi,op_csrrsi,op_csrrci,op_mert,op_ecall} = op;
  
  assign op_mret = op_mert; /*an oolong event*/

  wire zicsr = {op_csrrw|op_csrrs|op_csrrc|op_csrrwi|op_csrrsi|op_csrrci};

  assign csr_addr = {12{zicsr}}&imm[11:0];

  assign csr_read = zicsr&!((op_csrrw|op_csrrwi)&dest==5'b0);
  assign csr_write = op_csrrw|op_csrrwi;
  assign csr_set = op_csrrs|(op_csrrsi&rs1!=5'b0);
  assign csr_clear = op_csrrc|(op_csrrci&rs1!=5'b0);

  assign csr_wdata = {64{op_csrrw|op_csrrs|op_csrrc}}&src1 | { 59'b0,{{5{op_csrrwi|op_csrrsi|op_csrrci}}&rs1}};

  assign res = csr_rdata;
  assign valid_o = csr_read;

  ysyx_050920_IRQ inst_IRQ
  (
    .enable         (enable),
    .ecall          (op_ecall),
    .mret           (op_mret),
    .pc_i           (pc_i),
    .unsupport_op   (unsupport_op),
    .ex_intr        (ex_intr&~(|op)),/* Make sure all csr operations will success affect intrrupt. */
    .mie_i          (csr_mie_rdata),
    .mtvec_i        (csr_mtvec_rdata),
    .mepc_i         (csr_mepc_rdata),
    .raise_intr     (raise_intr),
    .raise_hard_intr(raise_hard_intr),
    .mepc_o         (csr_mepc_wdata),
    .mepc_valid_o   (csr_mepc_write),
    .mcause_o       (csr_mcause_wdata),
    .mcause_valid_o (csr_mcause_write),
    .pc_o           (pc_o),
    .pc_valid_o     (pc_valid_o)
  );

endmodule
module ysyx_050920_load_unit(
  input [7:0] op,
  input [63:0] src1,
  // input [63:0] src2,
  input [63:0] imm,

  output sign,
  output [63:0] addr,
  output [3:0] bytes,
  output ren,

  output [63:0] res,
  output valid_o

);

wire op_ld,op_lw,op_lwu,op_lh,op_lhu,op_lb,op_lbu,op_lui;
assign {op_ld,op_lw,op_lwu,op_lh,op_lhu,op_lb,op_lbu,op_lui} = op; 

assign sign = op_lw|op_lh|op_lb;
assign addr = src1 + imm;
assign bytes = {op_ld,op_lw|op_lwu,op_lh|op_lhu,op_lb|op_lbu};

assign ren = op_ld|op_lw|op_lwu|op_lh|op_lhu|op_lb|op_lbu;
assign valid_o = op_lui;
assign res = {64{op_lui}}&imm;
endmodule
module ysyx_050920_mul_unit(
  input clk,
  input rst,
  input flush,

  input [4:0] op,
  input [63:0] src1,
  input [63:0] src2,
  // input [63:0] imm,

  output ready,
  output [63:0] res,
  output valid_o
);
  wire op_MULW,op_MUL,op_MULH,op_MULHSU,op_MULHU;
  assign {op_MULW,op_MUL,op_MULH,op_MULHSU,op_MULHU} = op;

  wire src1_sign = op_MULW | op_MUL | op_MULH | op_MULHSU;
  wire src2_sign = op_MULW | op_MUL | op_MULH;
  // wire src1_unsign = op_MULHU;
  // wire src2_unsign = op_MULHSU | op_MULHU;
  // wire res_sign = op_MULW|op_MUL|op_MULH|op_MULHSU;

  wire [63:0] src1_w = {{32{src1[31]}},src1[31:0]};
  wire [63:0] src2_w = {{32{src2[31]}},src2[31:0]};

  wire op_w = op_MULW;
  wire [63:0] op_val_1 = {64{op_w}}&src1_w | {64{!op_w}}&src1;
  wire [63:0] op_val_2 = {64{op_w}}&src2_w | {64{!op_w}}&src2;
  

  wire [63:0] res_h;
  wire [63:0] res_l;
  
  wire valid_i = |op;
  wire sel_lo = op_MULW | op_MUL;
  wire sel_hi = op_MULH|op_MULHSU|op_MULHU;
  wire sel_lo_r,sel_hi_r;
  ysyx_050920_Reg #(.WIDTH(2), .RESET_VAL(2'b0)) reg_sel (.clk(clk), .rst(rst|flush), .din({sel_hi,sel_lo}), .dout({sel_hi_r,sel_lo_r}), .wen(valid_i));


  assign res = {64{sel_lo_r}}&res_l | {64{sel_hi_r}}&res_h;
  // wire mul_valid_o;
  assign valid_o = valid_i;

  ysyx_050920_basemul inst_basemul
    (
      .clk        (clk),
      .rst        (rst),
      .valid_i    (valid_i),
      .flush      (flush),
      .mulw       (op_w),
      .mul_signed ({src1_sign&op_val_1[63],src2_sign&op_val_2[63]}),
      .src1       (op_val_1),
      .src2       (op_val_2),
      .ready      (ready),
      // .valid_o    (mul_valid_o),
      .res_hi     (res_h),
      .res_lo     (res_l)
    );

endmodule
module ysyx_050920_basediv(
  input clk,
  input rst,
  
  input valid_i,
  input flush,

  input divw,
  input div_signed,
  input [63:0] src1,
  input [63:0] src2,
  
  output reg ready,
  // output reg valid_o,
  output [63:0] quotient,
  output [63:0] remainder
);
  reg [127:0] rem;
  reg [63:0] quo;
  reg [127:0] divisor;
  reg [6:0] cnt;
  reg quo_sign,rem_sign;
  reg res_w;
  wire src1_sign = div_signed&(divw?src1[31]:src1[63]);
  wire src2_sign = div_signed&(divw?src2[31]:src2[63]);
  reg [63:0] quotient_out;
  reg [63:0] remainder_out;

  wire [127:0] rem_next = rem>=divisor?(rem-divisor):rem;
  wire [63:0] quo_next = {quo[62:0], (rem>=divisor?1'b1:1'b0)};
  
  always @(posedge clk) begin
    if(rst|flush) begin
      quo <= 64'b0;
      rem <= 128'b0;
      divisor <= 128'b0;
      cnt <= 7'b0;
      quo_sign <= 1'b0;
      rem_sign <= 1'b0;
      // valid_o <= 1'b0;
      ready <= 1'b1;
      res_w <= 1'b0;
      quotient_out <= 64'b0;
      remainder_out <= 64'b0;
    end else begin
      quo <= 64'b0;
      rem <= 128'b0;
      quotient_out <= 64'b0;
      remainder_out <= 64'b0;
      // valid_o <= 1'b0;
      if(valid_i&ready) begin
        ready <= 1'b0;
        quo <= quo&64'b0;
        res_w <= divw;
        if(divw) begin
          if(div_signed&src1[31]) rem  <= {96'b0,{(~src1[31:0])+32'b1}}; 
          else rem <= {96'b0,src1[31:0]}; 
          if(div_signed&src2[31]) divisor  <= {33'b0,32'b0,{(~src2[31:0])+32'b1},31'b0}; 
          else divisor <= {33'b0,32'b0,src2[31:0],31'b0};
          cnt <= 7'd32;
        end else begin
          if(div_signed&src1[63]) rem  <= {64'b0,(~src1)+64'b1}; 
          else rem <= {64'b0,src1}; 
          if(div_signed&src2[63]) divisor  <= {1'b0,{(~src2)+64'b1},63'b0}; 
          else divisor <= {1'b0,src2,63'b0}; 
          cnt <= 7'd64;
        end
        if(src1_sign != src2_sign) quo_sign <= 1'b1;
        else quo_sign <= 1'b0;
        rem_sign <= src1_sign;
      end else if(ready == 1'b0) begin
        quo <= quo_next;
        rem <= rem_next;
        // quo[63:1] <= quo[62:0];
        // if(rem >= divisor) begin
        //   rem <= rem - divisor;
        //   quo[0] <= 1'b1;
        // end else begin
        //   rem <= rem;
        //   quo[0] <= 1'b0;
        // end
        divisor <= divisor >> 1;
        cnt <= cnt - 7'd1;
        if(cnt == 7'd1) begin
          ready <= 1'b1;
          quotient_out <= quo_sign?((~quo_next)+64'b1):quo_next;
          remainder_out <= rem_sign?((~rem_next[63:0])+64'b1):rem_next[63:0];
          // valid_o <= 1'b1;
        end
      end
    end
  end
  // wire [63:0] quotient_out = quo_sign?((~quo)+64'b1):quo;
  // wire [63:0] remainder_out = rem_sign?((~rem[63:0])+64'b1):rem[63:0];
  assign quotient[31:0] = quotient_out[31:0];
  assign quotient[63:32] = res_w?{32{quotient_out[31]}}:quotient_out[63:32];
  assign remainder[31:0] = remainder_out[31:0];
  assign remainder[63:32] = res_w?{32{remainder_out[31]}}:remainder_out[63:32];
endmodule
module ysyx_050920_branch_unit(
  input [7:0] op,
  input [63:0] src1,
  input [63:0] src2,
  input [63:0] imm,
  input [63:0] pc_i,

  output [63:0] pc_o,
  output pc_valid_o,
  output [63:0] res,
  output valid_o
);
  wire op_beq,op_bge,op_bgeu,op_blt,op_bltu,op_bne,op_jal,op_jalr;
  assign {op_beq,op_bge,op_bgeu,op_blt,op_bltu,op_bne,op_jal,op_jalr} = op;

  wire [63:0] pc_temp = {{64{op_jal|op_beq|op_bne|op_bge|op_bgeu|op_blt|op_bltu}}&(pc_i+imm) | {64{op_jalr}}&(src1+imm)};
  wire [63:1] pc_r = pc_temp[63:1];

  assign pc_o = {pc_r[63:1],1'b0};

  wire eq  = src1==src2;
  wire ne  = !eq;
  wire ge  = $signed(src1) >= $signed(src2);
  wire geu = src1 >= src2;
  wire lt  = !ge;
  wire ltu = !geu;

  assign res = {64{valid_o}}&(pc_i + 64'h4);
  assign pc_valid_o = op_jal | op_jalr | (op_beq&eq) | (op_bne&ne) | (op_bge&ge) | (op_bgeu&geu) | (op_blt&lt) | (op_bltu&ltu); 
  assign valid_o = op_jal | op_jalr;
endmodule
module ysyx_050920_div_unit(
  input clk,
  input rst,
  input flush,

  input [7:0] op,
  input [63:0] src1,
  input [63:0] src2,
  // input [63:0] imm,
  
  output ready,
  output [63:0] res,
  output valid_o
);
  wire op_DIVUW,op_DIVW,op_REMUW,op_REMW,op_DIV,op_DIVU,op_REMU,op_REM;
  assign {op_DIVUW,op_DIVW,op_REMUW,op_REMW,op_DIV,op_DIVU,op_REMU,op_REM} = op;

  wire op_rem = op_REMUW|op_REMW|op_REMU|op_REM;
  wire op_div = op_DIVUW|op_DIVW|op_DIVU|op_DIV;

  wire op_w = op_REMUW|op_REMW|op_DIVUW|op_DIVW;
  wire op_sign = op_REMW|op_REM|op_DIVW|op_DIV;

  wire [63:0] src1_w = {{32{src1[31]}},src1[31:0]};
  wire [63:0] src2_w = {{32{src2[31]}},src2[31:0]};

  wire [63:0] op_val_1 = {64{op_w}}&src1_w | {64{!op_w}}&src1;
  wire [63:0] op_val_2 = {64{op_w}}&src2_w | {64{!op_w}}&src2;

  wire valid_i = |op;
  // wire div_valid_o;
  assign valid_o = valid_i;
  
  wire op_div_r,op_rem_r;
  ysyx_050920_Reg #(.WIDTH(2), .RESET_VAL(2'b0)) reg_sel (.clk(clk), .rst(rst|flush), .din({op_div,op_rem}), .dout({op_div_r,op_rem_r}), .wen(valid_i));
  wire [63:0] res_quo,res_rem;

  assign res = {64{op_div_r}}&res_quo | {64{op_rem_r}}&res_rem;

  ysyx_050920_basediv inst_basediv
  (
    .clk        (clk),
    .rst        (rst),
    .valid_i    (valid_i),
    .flush      (flush),
    .divw       (op_w),
    .div_signed (op_sign),
    .src1       (op_val_1),
    .src2       (op_val_2),
    .ready      (ready),
    // .valid_o    (div_valid_o),
    .quotient   (res_quo),
    .remainder  (res_rem)
  );

endmodule
module ysyx_050920_logic_unit(
  input [21:0] op,

  input [63:0] src1,
  input [63:0] src2,
  input [63:0] imm,
  // input [63:0] pc_i,

  output [63:0] res,
  output valid_o
);
  wire op_slli,op_slliw,op_sllw,op_srai,op_sraiw,
  op_sraw,op_srli,op_srliw,op_srlw,op_and,op_andi,
  op_or,op_ori,op_sll,op_slt,op_slti,op_sltiu,
  op_sltu,op_sra,op_srl,op_xor,op_xori;

  wire left         = op_slli|op_sllw|op_slliw|op_sll;
  wire right_arith  = op_sra|op_srai|op_sraw|op_sraiw;
  wire right_logic  = op_srl|op_srli|op_srliw|op_srlw;
  assign {op_slli,op_slliw,op_sllw,op_srai,op_sraiw,
                          op_sraw,op_srli,op_srliw,op_srlw,op_and,
                          op_andi,op_or,op_ori,op_sll,op_slt,
                          op_slti,op_sltiu,op_sltu,op_sra,op_srl,
                          op_xor,op_xori} = op;
  wire op_w = op_slliw|op_sllw|op_sraiw|op_sraw|op_srliw|op_srlw;

  wire [63:0] src1_w_s = {{32{src1[31]}},src1[31:0]};
  wire [63:0] src1_w_u = {{32{1'b0}},src1[31:0]};

  wire [63:0] src1_w = {64{right_arith}}&src1_w_s | {64{!right_arith}}&src1_w_u ;
  wire [63:0] src2_w = {{32{src2[31]}},src2[31:0]};
  wire [63:0] imm_w = {{32{imm[31]}},imm[31:0]};

  wire op_value_1_src = op_slli|op_srai|op_srli|op_and|op_andi|op_or|op_ori|op_sll|op_slt|op_slti|op_sltiu|op_sltu|op_sra|op_srl|op_xor|op_xori;
  wire op_value_1_src_w = op_slliw|op_sllw|op_sraiw|op_sraw|op_srliw|op_srlw;

  wire op_value_2_src = op_and|op_or|op_sll|op_slt|op_sltu|op_sra|op_srl|op_xor;
  wire op_value_2_src_w = op_sllw|op_sraw|op_srlw;
  wire op_value_2_imm = op_slli|op_srai|op_srli|op_andi|op_ori|op_slti|op_sltiu|op_xori;
  wire op_value_2_imm_w = op_slliw|op_sraiw|op_srliw;

  wire [63:0] op_value_1 = ({64{op_value_1_src}}&src1) | ({64{op_value_1_src_w}}&src1_w);
  wire [63:0] op_value_2 = ({64{op_value_2_src}}&src2) | ({64{op_value_2_src_w}}&src2_w) | ({64{op_value_2_imm}}&imm) | ({64{op_value_2_imm_w}}&imm_w);
  wire [5:0] shift_amount = {op_value_2[5]&(!op_w),op_value_2[4:0]};

  wire lower_res = (op_sltiu|op_sltu)&(op_value_1<op_value_2) | (op_slt|op_slti)&($signed(op_value_1) < $signed(op_value_2));

  wire [63:0] shift_res = {64{left}}&(op_value_1 << shift_amount) | 
                          {64{right_arith}}&({$signed(op_value_1) >>> shift_amount}) | 
                          {64{right_logic}}&(op_value_1 >> shift_amount);
  wire [63:0] and_res   = {64{op_and|op_andi}}&(op_value_1&op_value_2);
  wire [63:0] or_res    = {64{op_or|op_ori}}&(op_value_1|op_value_2);
  wire [63:0] xor_res   = {64{op_xor|op_xori}}&(op_value_1^op_value_2);

  wire [63:0] res_mid = {63'b0,lower_res} | shift_res | and_res | or_res | xor_res;
  assign res = { ({32{op_w&res_mid[31]}} | {32{!op_w}}&res_mid[63:32] ) ,res_mid[31:0]};
  assign valid_o = |op;
  endmodule
module ysyx_050920_store_unit(
  input [3:0] op,
  input [63:0] src1,
  input [63:0] src2,
  input [63:0] imm,

  output [63:0] addr,
  output [63:0] data,
  output [3:0] bytes,
  output valid_o

);

wire op_sd,op_sw,op_sh,op_sb;
assign {op_sd,op_sw,op_sh,op_sb} = op;
assign bytes = {op_sd,op_sw,op_sh,op_sb};
assign addr = src1 + imm;
assign data = src2;
assign valid_o = |op;
endmodule
module ysyx_050920_Execute(
  input clk,
  input rst,

  input enable,
  input flush,
  output ready,
  output mul_ready,
  output div_ready,
//from decode stage
  // input [31:0] inst_i,
  input [63:0] pc_i,
  input [63:0] src1,
  input [63:0] src2,
  input [63:0] imm,
  input [4:0] dest_i,
  input [4:0] rs1_i,
  // input [4:0] rs2_i,

  input [6:0] arithmetic_op,
  input [21:0] logic_op,
  input [7:0] branch_op,
  input [7:0] load_op,
  input [3:0] store_op,
  // input [1:0] other_op,
  input [4:0] mul_op,
  input [7:0] div_op,
  input [7:0] csr_op,
  input [0:0] fence_op,
  input [0:0] unsupport_op,

  input ex_intr,
  input mtip_clear,
  input tim_int_req,
  input msip_i,
  input msip_valid_i,
  output msip_o,


  output icache_invalid,

  // output [63:0] pc_o,
  // output difftest_raise_hard_intr,
//to PC
  // output [31:0] inst_o,
  output [63:0] target_pc_o,
  output target_pc_valid_o,
//to memory stage
  // output [1:0] other_op_o,
  output load_valid,
  output [63:0] load_addr,
  output [3:0] load_bytes,
  output load_sign,

  output store_valid,
  output [63:0] store_addr,
  output [63:0] store_data,
  output [3:0] store_bytes,

  output [63:0] mul_res,
  output [63:0] div_res,

  output [4:0] dest_o,
  output [63:0] dest_data,
  output dest_valid_o

);
  // assign pc_o = pc_i;
  assign dest_o = dest_i;
  // assign inst_o = inst_i;
  // assign other_op_o = other_op;
  wire [11:0] csr_reg_addr_i;
  wire csr_reg_read_i;
  wire csr_reg_write_i;
  wire csr_reg_set_i;
  wire csr_reg_clear_i;
  wire [63:0] csr_reg_wdata_i;
  wire [63:0] csr_reg_rdata_o;

  wire csr_reg_raise_intr_i;
  wire csr_reg_op_mret_i;
  wire [63:0] csr_reg_mepc_rdata_o;
  wire csr_reg_mepc_write_i;
  wire [63:0] csr_reg_mepc_wdata_i;
  wire csr_reg_mcause_write_i;
  wire [63:0] csr_reg_mcause_wdata_i;
  wire [63:0] csr_reg_mtvec_rdata_o;
  wire csr_mie_rdata_o;

  wire tim_intr;

  wire raise_hard_intr;
  // assign difftest_raise_hard_intr = raise_hard_intr;
  ysyx_050920_CSRsFile inst_CSRsFile(
    .clk              (clk),
    .rst              (rst),
    .exe_inst         (enable),
    .csr_addr         (csr_reg_addr_i),
    .csr_read         (csr_reg_read_i),
    .csr_write        (csr_reg_write_i),
    .csr_set          (csr_reg_set_i),
    .csr_clear        (csr_reg_clear_i),
    .csr_wdata        (csr_reg_wdata_i),
    .csr_rdata        (csr_reg_rdata_o),
    .raise_intr       (csr_reg_raise_intr_i),
    .tim_int_req      (tim_int_req),
    .mtip_clear       (mtip_clear),
    .msip_i           (msip_i),
    .msip_valid_i     (msip_valid_i),
    .msip_o           (msip_o),
    .mtip             (tim_intr),
    .op_mret          (csr_reg_op_mret_i),
    .csr_mie_rdata    (csr_mie_rdata_o),
    .csr_mepc_rdata   (csr_reg_mepc_rdata_o),
    .csr_mepc_write   (csr_reg_mepc_write_i),
    .csr_mepc_wdata   (csr_reg_mepc_wdata_i),
    .csr_mcause_write (csr_reg_mcause_write_i),
    .csr_mcause_wdata (csr_reg_mcause_wdata_i),
    .csr_mtvec_rdata  (csr_reg_mtvec_rdata_o)
  );


  wire [63:0] arithmetic_res;
  wire arithmetic_valid;
  ysyx_050920_arithmetic_unit inst_arithmetic_unit (.op(arithmetic_op), .src1(src1), .src2(src2), .imm(imm), .pc_i(pc_i), .res(arithmetic_res), .valid_o(arithmetic_valid));

  wire [63:0] logic_res;
  wire logic_valid;
  ysyx_050920_logic_unit inst_logic_unit (.op(logic_op), .src1(src1), .src2(src2), .imm(imm), /*.pc_i(pc_i),*/ .res(logic_res), .valid_o(logic_valid));

  wire [63:0] branch_res;
  wire branch_valid;
  wire [63:0] branch_pc_o;
  wire branch_pc_valid_o;
  ysyx_050920_branch_unit inst_branch_unit(
      .op         (branch_op),
      .src1       (src1),
      .src2       (src2),
      .imm        (imm),
      .pc_i       (pc_i),
      .pc_o       (branch_pc_o),
      .pc_valid_o (branch_pc_valid_o),
      .res        (branch_res),
      .valid_o    (branch_valid)
    );

  wire load_dest_valid;
  wire [63:0] load_res;
  ysyx_050920_load_unit inst_load_unit(
      .op      ({8{(~raise_hard_intr)}}&load_op),
      .src1    (src1),
      // .src2    (src2),
      .imm     (imm),
      .sign    (load_sign),
      .bytes   (load_bytes),
      .addr    (load_addr),
      .ren     (load_valid),
      .res     (load_res),
      .valid_o (load_dest_valid)
    );  

  ysyx_050920_store_unit inst_store_unit(
      .op      (store_op),
      .src1    (src1),
      .src2    (src2),
      .imm     (imm),
      .addr    (store_addr),
      .data    (store_data),
      .bytes   (store_bytes),
      .valid_o (store_valid)
    );
  // wire [63:0] mul_res;
  wire mul_valid;
  // wire mul_ready;
  ysyx_050920_mul_unit inst_mul_unit(
      .clk       (clk),
      .rst       (rst),
      .flush     (flush),
      .op        (mul_op),
      .src1      (src1),
      .src2      (src2),
      // .imm       (imm),
      .ready     (mul_ready),
      .res       (mul_res),
      .valid_o   (mul_valid)
    );
  // wire [63:0] div_res;
  wire div_valid;
  // wire div_ready;
  ysyx_050920_div_unit inst_div_unit(
      .clk       (clk),
      .rst       (rst),
      .flush     (flush),
      .op        (div_op),
      .src1      (src1),
      .src2      (src2),
      // .imm       (imm),
      .ready     (div_ready),
      .res       (div_res),
      .valid_o   (div_valid)
    );

  wire [63:0] csr_res;
  wire csr_valid;
  wire [63:0] csr_pc_o;
  wire csr_pc_valid_o;
  ysyx_050920_csr_unit inst_csr_unit(
      .enable           (enable),
      .op               (csr_op),
      .src1             (src1),
      // .src2             (src2),
      .imm              (imm[11:0]),
      .pc_i             (pc_i),
      .dest             (dest_i),
      .rs1              (rs1_i),
      .csr_addr         (csr_reg_addr_i),
      .csr_read         (csr_reg_read_i),
      .csr_write        (csr_reg_write_i),
      .csr_set          (csr_reg_set_i),
      .csr_clear        (csr_reg_clear_i),
      .csr_wdata        (csr_reg_wdata_i),
      .csr_rdata        (csr_reg_rdata_o),
      .unsupport_op     (unsupport_op),
      .ex_intr          ((ex_intr|tim_intr)),
      .raise_intr       (csr_reg_raise_intr_i),
      .raise_hard_intr  (raise_hard_intr),
      .op_mret          (csr_reg_op_mret_i),
      .csr_mie_rdata    (csr_mie_rdata_o),
      .csr_mepc_rdata   (csr_reg_mepc_rdata_o),
      .csr_mepc_write   (csr_reg_mepc_write_i),
      .csr_mepc_wdata   (csr_reg_mepc_wdata_i),
      .csr_mcause_write (csr_reg_mcause_write_i),
      .csr_mcause_wdata (csr_reg_mcause_wdata_i),
      .csr_mtvec_rdata  (csr_reg_mtvec_rdata_o),
      .pc_o             (csr_pc_o),
      .pc_valid_o       (csr_pc_valid_o),
      .res              (csr_res),
      .valid_o          (csr_valid)
    );

  assign dest_valid_o = (~raise_hard_intr)&(branch_valid | arithmetic_valid | logic_valid | load_dest_valid | mul_valid | div_valid | csr_valid);

  assign dest_data = arithmetic_res | logic_res | branch_res | load_res | csr_res;

  wire branch_op_pc_valid = (~raise_hard_intr)&branch_pc_valid_o;
  assign target_pc_valid_o = branch_op_pc_valid | csr_pc_valid_o;
  assign target_pc_o = {64{branch_op_pc_valid}}&branch_pc_o | {64{(~branch_op_pc_valid)&csr_pc_valid_o}}&csr_pc_o;

  assign icache_invalid = enable&fence_op[0];

  assign ready = mul_ready & div_ready & enable;
endmodule
module ysyx_050920_EXE_reg(
  input clk,
  input rst,
  input flush,
  input enable,
  input ready,

  // input difftest_raise_hard_intr_i,
  // input [63:0] pc_i,
  // input [31:0] inst_i,
  input load_valid_i,
  input [63:0] load_addr_i,
  input [3:0] load_bytes_i,
  input load_sign_i,
  input store_valid_i,
  input [63:0] store_addr_i,
  input [63:0] store_data_i,
  input [3:0] store_bytes_i,
  input [4:0] dest_i,
  input [63:0] dest_data_i,
  input dest_valid_i,
  input [63:0] mul_res_i,
  input [63:0] div_res_i,
  // input [1:0] other_op_i,
  
  // output difftest_raise_hard_intr_o,
  // output [63:0] pc_o,
  // output [31:0] inst_o,
  output load_valid_o,
  output [63:0] load_addr_o,
  output [3:0] load_bytes_o,
  output load_sign_o,
  output store_valid_o,
  output [63:0] store_addr_o,
  output [63:0] store_data_o,
  output [3:0] store_bytes_o,
  output [4:0] dest_o,
  output [63:0] dest_data_o,
  output dest_valid_o,
  // output [1:0] other_op_o,


  output hazards_dst_valid_o,
  output [63:0] hazards_data_o,
  output [4:0] hazards_dest_o,
  output hazards_data_valid_o
);
  localparam VALID_WIDTH = 3;
  wire [VALID_WIDTH-1:0] valid_i = {load_valid_i,store_valid_i,dest_valid_i};
  wire [VALID_WIDTH-1:0] valid_o;
  ysyx_050920_Reg #(.WIDTH(VALID_WIDTH), .RESET_VAL({VALID_WIDTH{1'b0}})) reg_valid (.clk(clk), .rst(rst|flush), .din(valid_i), .dout(valid_o), .wen(enable));
  assign {load_valid_o,store_valid_o,dest_valid_o} = valid_o&{VALID_WIDTH{ready}};

  // wire [1:0] other_op_r;
  // ysyx_050920_Reg #(.WIDTH(2), .RESET_VAL(2'b0)) reg_other_op (.clk(clk), .rst(rst|flush), .din(other_op_i), .dout(other_op_r), .wen(enable));
  // assign other_op_o = other_op_r&{2{ready}};

  wire [63:0] dest_data_o_r;
  assign dest_data_o = dest_data_o_r|mul_res_i|div_res_i;
  localparam DATA_WIDTH = 64+4+1+64+64+4+5+64;
  wire [DATA_WIDTH-1:0] data_i = {load_addr_i,load_bytes_i,load_sign_i,store_addr_i,store_data_i,store_bytes_i,dest_i,dest_data_i};
  wire [DATA_WIDTH-1:0] data_o;
  ysyx_050920_Reg #(.WIDTH(DATA_WIDTH), .RESET_VAL({DATA_WIDTH{1'b0}})) reg_data (.clk(clk), .rst(rst|flush), .din(data_i), .dout(data_o), .wen(enable));
  assign {load_addr_o,load_bytes_o,load_sign_o,store_addr_o,store_data_o,store_bytes_o,dest_o,dest_data_o_r} = data_o;

  // ysyx_050920_Reg #(.WIDTH(97), .RESET_VAL(97'b0)) reg_pc_inst (.clk(clk), .rst(rst|flush), .din({inst_i,pc_i,difftest_raise_hard_intr_i}),   .dout({inst_o,pc_o,difftest_raise_hard_intr_o}), .wen(enable));

  assign hazards_dst_valid_o = valid_o[0]|valid_o[2];
  assign hazards_data_valid_o = valid_o[0];
  assign hazards_data_o = dest_data_o;
  assign hazards_dest_o = dest_o;
endmodule
module ysyx_050920_MEM_reg(
  input clk,
  input rst,
  input flush,
  input enable,
  input ready,
  
  // input [63:0] pc_i,
  // input [31:0] inst_i,
  // input difftest_raise_hard_intr_i,
  // input difftest_memory_op_i,
  // input [63:0] difftest_memory_addr_i,
  
  input [63:0] dest_data_i,
  input [4:0] dest_i,
  input dest_valid_i,
  input [63:0] load_data_i,
  input load_valid_i,
  input load_data_valid_i,

  input load_sign_i,
  input [3:0] load_bytes_i,
  // input [1:0] other_op_i,

  
  // output [63:0] pc_o,
  // output [31:0] inst_o,
  // output difftest_raise_hard_intr_o,
  // output difftest_memory_op_o,
  // output [63:0] difftest_memory_addr_o,
  output [3:0] load_bytes_o,
  output load_sign_o,

  output [63:0] dest_data_o,
  output [4:0] dest_o,
  output dest_valid_o,
  output [63:0] load_data_o,
  output load_valid_o,
  // output [1:0] other_op_o,

  output [63:0] hazards_data_o,
  output [4:0] hazards_dest_o,
  output hazards_dst_valid_o,
  output hazards_data_valid_o
  
);

  localparam VALID_WIDTH = 1+1;
  wire [VALID_WIDTH-1:0]valid_i = {dest_valid_i,load_valid_i};
  wire [VALID_WIDTH-1:0]valid_o;
  ysyx_050920_Reg #(.WIDTH(VALID_WIDTH), .RESET_VAL({VALID_WIDTH{1'b0}})) reg_valid (.clk(clk), .rst(rst|flush), .din(valid_i), .dout(valid_o), .wen(enable));
  assign {dest_valid_o,load_valid_o} = valid_o&{VALID_WIDTH{ready}};

  wire [63:0] load_data_last;
  ysyx_050920_Reg #(.WIDTH(64), .RESET_VAL(64'b0)) reg_load_data_last (.clk(clk), .rst(rst), .din(load_data_i), .dout(load_data_last), .wen(load_data_valid_i));

  // wire [1:0] other_op_r;
  // ysyx_050920_Reg #(.WIDTH(2), .RESET_VAL(2'b0)) reg_other_op (.clk(clk), .rst(rst|flush), .din(other_op_i), .dout(other_op_r), .wen(enable));
  // assign other_op_o = other_op_r&{2{ready}};

  localparam DATA_WIDTH = 64+5+4+1;
  wire [DATA_WIDTH-1:0] data_i = {dest_data_i,dest_i,load_bytes_i,load_sign_i};
  wire [DATA_WIDTH-1:0] data_o;
  ysyx_050920_Reg #(.WIDTH(DATA_WIDTH), .RESET_VAL({DATA_WIDTH{1'b0}})) reg_data (.clk(clk), .rst(rst|flush), .din(data_i), .dout(data_o), .wen(enable));
  assign {dest_data_o,dest_o,load_bytes_o,load_sign_o} = data_o;

  assign {load_data_o} = {64{load_data_valid_i}}&load_data_i|{64{~load_data_valid_i}}&load_data_last;

  // ysyx_050920_Reg #(.WIDTH(97), .RESET_VAL(97'b0)) reg_pc_inst (.clk(clk), .rst(rst|flush), .din({inst_i,pc_i,difftest_raise_hard_intr_i}),   .dout({inst_o,pc_o,difftest_raise_hard_intr_o}), .wen(enable));

  // ysyx_050920_Reg #(.WIDTH(65), .RESET_VAL(65'b0)) reg_mem_access (.clk(clk), .rst(rst|flush), .din({difftest_memory_op_i,difftest_memory_addr_i}),   .dout({difftest_memory_op_o,difftest_memory_addr_o}), .wen(enable));

  assign hazards_dst_valid_o = |valid_o;
  assign hazards_data_valid_o = valid_o[1]; /* load op */
  assign hazards_data_o = dest_data_o;
  assign hazards_dest_o = dest_o;
endmodule
module ysyx_050920_Memory(
  input enable,
  output ready,

//memory interface
  output dcache_ren,
  output [63:0] dcache_raddr,
  output [3:0] dcache_rsize,
  input [63:0] dcache_rdata, 
  input [3:0] dcache_rbytes, 
  // input dcache_rdata_valid,
  input dcache_rbusy,

  output dcache_wen,
  output [63:0] dcache_waddr,
  output [63:0] dcache_wdata, 
  output [3:0] dcache_wsize,
  input dcache_wbusy,
  

//from execute stage
  // input [31:0] inst_i,
  // input [63:0] pc_i,
  // input difftest_raise_hard_intr_i,
  // input [1:0] other_op_i,

  input load_valid/*verilator public_flat*/,
  input [63:0] load_addr/*verilator public_flat*/,
  input [3:0] load_bytes,
  input load_sign,

  input store_valid/*verilator public_flat*/,
  input [63:0] store_addr/*verilator public_flat*/,
  input [63:0] store_data,
  input [3:0] store_bytes,

  input [4:0] dest_i,
  input [63:0] dest_data_i,
  input dest_valid_i,
//to writeback stage
  // output [1:0] other_op_o,
  // output [31:0] inst_o,
  // output [63:0] pc_o,
  // output difftest_raise_hard_intr_o,
  // output difftest_memory_op_o,
  // output [63:0] difftest_memory_addr_o,

  output [63:0] load_data_o,
  output load_valid_o,

  output [63:0] dest_data_o,
  output [4:0] dest_o,
  output dest_valid_o

);
  // assign pc_o = pc_i;
  // assign inst_o = inst_i;
  // assign other_op_o = other_op_i;
  // assign difftest_memory_op_o = load_valid|store_valid;
  // assign difftest_memory_addr_o = {64{load_valid}}&load_addr|{64{store_valid}}&store_addr;
  // assign difftest_raise_hard_intr_o = difftest_raise_hard_intr_i;
  assign dcache_ren = load_valid;
  assign dcache_raddr = load_addr;

  wire [63:0] rdata = dcache_rdata;

  wire [63:0] dest_data_signed    = {64{dcache_rbytes[0]}}&{{56{rdata[ 7]}},rdata[ 7:0]} |
                                    {64{dcache_rbytes[1]}}&{{48{rdata[15]}},rdata[15:0]} |
                                    {64{dcache_rbytes[2]}}&{{32{rdata[31]}},rdata[31:0]} |
                                    {64{dcache_rbytes[3]}}&{rdata[63:0]};
  wire [63:0] dest_data_unsigned  = {64{dcache_rbytes[0]}}&{56'b0,rdata[ 7:0]} |
                                    {64{dcache_rbytes[1]}}&{48'b0,rdata[15:0]} |
                                    {64{dcache_rbytes[2]}}&{32'b0,rdata[31:0]} |
                                    {64{dcache_rbytes[3]}}&{rdata[63:0]};
  assign dest_data_o = {64{dest_valid_i}}&dest_data_i;

  assign dcache_wen = store_valid;
  assign dcache_waddr = store_addr;
  assign dcache_wdata = store_data; 
  assign dcache_wsize = store_bytes;
  assign dcache_rsize = load_bytes;
  assign dest_o = dest_i;
  assign dest_valid_o = dest_valid_i;

  assign load_valid_o = load_valid;
  assign load_data_o = {64{load_sign}}&dest_data_signed | {64{!load_sign}}&dest_data_unsigned;
  assign ready = enable&(~(dcache_rbusy|dcache_wbusy));
endmodule
module ysyx_050920_Writeback(
  input enable,
  output ready,
//from memnory stage
  // input [31:0] inst_i,
  // input [63:0] pc_i,
  // input [1:0] other_op_i,
  // input difftest_raise_hard_intr_i,
  // input difftest_memory_op_i,
  // input [63:0] difftest_memory_addr_i,
  input [63:0] dest_data_i,
  input [4:0] dest_i,
  input dest_valid_i,
  
  input [63:0] load_data_i,
  input load_valid_i,

//to decode stage   
  // output [31:0] inst_o,
  // output [63:0] pc_o,
  // output [1:0] other_op_o,
  // output difftest_raise_hard_intr_o,
  // output difftest_memory_op_o,
  // output [63:0] difftest_memory_addr_o,
  output [4:0] waddr,
  output wen,
  output [63:0] wdata
);

  assign wen = dest_valid_i|load_valid_i;
  assign waddr = dest_i;
  assign wdata = {64{dest_valid_i}}&dest_data_i | {64{load_valid_i}}&load_data_i;
  assign ready = enable;

  // assign pc_o = pc_i;
  // assign inst_o = inst_i;
  // assign other_op_o = other_op_i;
  // assign difftest_raise_hard_intr_o = difftest_raise_hard_intr_i;
  // assign difftest_memory_op_o = difftest_memory_op_i;
  // assign difftest_memory_addr_o = difftest_memory_addr_i;
endmodule
module ysyx_050920_CoreLocalInterrupt(
  input clk,
  input rst,

  input wen,
  input ren,
  input [31:0] raddr,
  input [31:0] waddr,
  input [63:0] wdata,
  input [3:0] wsize,
  input [3:0] rsize,
  output reg [63:0] rdata,
  output reg rdata_valid,
  
  output tim_int_req,

  output mtip_clear,


  input msip_i,
  output msip_o,
  output msip_valid_o
);
  localparam BASE_ADDR = 32'h0200_0000;
  localparam MSIP_ADDR = BASE_ADDR+32'h0;
  localparam MTIMECMP_ADDR = BASE_ADDR+32'h4000;
  localparam MTIME_ADDR = BASE_ADDR+32'hBFF8;

  reg [63:0] mtimecmp,mtime;
  always @(posedge clk) begin
    if(rst) begin
      mtimecmp <= 64'b0;
      mtime <= 64'b0;
    end else begin
      mtime <= mtime + 64'b1;
      if(wen&&(wsize==4'b1000)) 
        case(waddr)
        MTIMECMP_ADDR: mtimecmp <= wdata;
        MTIME_ADDR: mtime <= wdata;
        default:;
        endcase
    end
  end

  always @(posedge clk) begin
    if(rst) begin 
      rdata <= 64'b0;
      rdata_valid <= 1'b0;
    end else begin
      rdata_valid <= ren;
      if(ren&&(rsize==4'b1000))
        case(raddr)
        MSIP_ADDR: rdata <= {63'b0,msip_i};
        MTIMECMP_ADDR: rdata <= mtimecmp;
        MTIME_ADDR: rdata <= mtime;
        default: rdata <= 64'b0;
        endcase
      else 
        rdata <= 64'b0;
    end
  end


  assign mtip_clear = wen&(waddr==MTIMECMP_ADDR);
  assign msip_o = wdata[0];
  assign msip_valid_o = wen&(waddr==MSIP_ADDR);
  assign tim_int_req = mtime>=mtimecmp;
endmodule
module ysyx_050920_toy_cpu(
  input clk,
  input rst,

  input ex_intr,
  input mtip_clear,
  input msip_i,
  input msip_valid_i,
  output msip_o,
  input tim_int_req,
  //icache interface
  output icache_ren,
  output [63:0] icache_raddr,
  input icache_rbusy,
  input [31:0] icache_rdata, 
  input icache_rdata_valid,
  output icache_invalid,

  //dcache interface
  output dcache_ren,
  output [63:0] dcache_raddr,
  output [3:0] dcache_rsize,
  input dcache_rbusy,
  input [63:0] dcache_rdata, 
  input dcache_rdata_valid,

  input  dcache_wbusy,
  output dcache_wen,
  output [63:0] dcache_waddr,
  output [63:0] dcache_wdata, 
  output [3:0] dcache_wsize

);
  wire fetch_enable,decode_enable,execute_enable,memory_enable,writeback_enable;
  wire fetch_ready,decode_ready,execute_ready,memory_ready,writeback_ready;
  wire fetch_flush,decode_flush,execute_flush,memory_flush/*,writeback_flush*/;
  wire writeback_busy,memory_busy,execute_busy,decode_busy,fetch_busy;
  wire mul_ready,div_ready;
  assign fetch_busy = icache_rbusy;
  assign decode_busy = 1'b0;
  assign execute_busy = ~(mul_ready&div_ready);
  assign memory_busy = dcache_rbusy|dcache_wbusy;
  assign writeback_busy = 1'b0;
  wire [63:0] next_pc,pc;
  wire next_pc_valid;
  ysyx_050920_PC inst_PC
  (
    .clk             (clk),
    .rst             (rst),
    .next_pc_i       (next_pc),
    .next_pc_valid_i (next_pc_valid),
    .pc_o            (pc)
  );
  wire fetch_branch_valid_i,fetch_rdata_valid_i,fetch_ren_o;
  wire [31:0] fetch_rdata_i,fetch_inst_o;
  wire [63:0] fetch_raddr_o,fetch_pc_o,fetch_pc_i,fetch_next_pc_o,fetch_branch_pc_i;
  wire fetch_valid_o,fetch_branch_valid_o;



  assign fetch_rdata_i = icache_rdata;
  assign icache_raddr = fetch_raddr_o;
  assign icache_ren = fetch_ren_o;
  assign fetch_rdata_valid_i = icache_rdata_valid;

  assign fetch_pc_i = pc;
  assign next_pc_valid = fetch_branch_valid_o|fetch_enable;
  assign next_pc = fetch_next_pc_o;

  ysyx_050920_Fetch inst_Fetch
  (
    .enable         (fetch_enable),
    // .flush          (fetch_flush),
    .ready          (fetch_ready),
    .pc_i           (fetch_pc_i),
    .next_pc_o      (fetch_next_pc_o),
    .branch_valid_o (fetch_branch_valid_o),
    .rdata_valid    (fetch_rdata_valid_i),
    .rdata          (fetch_rdata_i),
    .raddr          (fetch_raddr_o),
    .ren            (fetch_ren_o),
    .branch_pc      (fetch_branch_pc_i),
    .branch_valid_i (fetch_branch_valid_i),
    .pc_o           (fetch_pc_o),
    .inst_o         (fetch_inst_o),
    .valid_o        (fetch_valid_o)
  );
  wire decode_inst_valid_i;
  wire [31:0] decode_inst_i;
  wire [63:0] decode_pc_i;
  ysyx_050920_IF_reg inst_IF_reg
  (
    .clk       (clk),
    .rst       (rst),
    .flush     (fetch_flush),
    .enable    (fetch_enable),
    .ready     (decode_ready),
    .valid_i   (fetch_valid_o),
    .inst_pc_i (fetch_pc_o),
    .inst_i    (fetch_inst_o),
    .inst_pc_o (decode_pc_i),
    .inst_o    (decode_inst_i),
    .valid_o   (decode_inst_valid_i)
  );

  wire [63:0] decode_wdata_i;
  wire [4:0] decode_waddr_i;
  wire decode_wen_i;
  

  // wire [31:0] decode_inst_o;
  // wire decode_op_valid_o;
  wire [63:0] decode_pc_o,decode_src1_o,decode_src2_o,decode_imm_o;
  wire [4:0] decode_dest_o,decode_rs1_o,decode_rs2_o;
  wire [6:0] decode_arithmetic_op_o;
  wire [21:0] decode_logic_op_o;
  wire [7:0] decode_branch_op_o;
  wire [7:0] decode_load_op_o;
  wire [3:0] decode_store_op_o;
  wire [4:0] decode_mul_op_o;
  wire [7:0] decode_div_op_o;
  wire [7:0] decode_csr_op_o;
  wire [0:0] decode_fence_op_o;
  // wire [1:0] decode_other_op_o;
  wire [0:0] decode_unsupport_op_o;
  // wire decode_src1_valid_o;
  // wire decode_src2_valid_o;
  // wire decode_dest_valid_o;
  ysyx_050920_Decode inst_Decode
  (
    .clk                  (clk),
    // .rst                  (rst),
    .enable               (decode_enable),
    .ready                (decode_ready),
    .inst_i               (decode_inst_i),
    .inst_valid           (decode_inst_valid_i),
    .pc_i                 (decode_pc_i),
    .waddr                (decode_waddr_i),
    .wen                  (decode_wen_i),
    .wdata                (decode_wdata_i),

    // .inst_o               (decode_inst_o),
    // .src1_valid           (decode_src1_valid_o),
    // .src2_valid           (decode_src2_valid_o),
    // .dest_valid           (decode_dest_valid_o),
    .pc_o                 (decode_pc_o),
    .src1                 (decode_src1_o),
    .src2                 (decode_src2_o),
    .rs1                  (decode_rs1_o),
    .rs2                  (decode_rs2_o),
    .imm                  (decode_imm_o),
    .dest                 (decode_dest_o),
    // .op_valid_o           (decode_op_valid_o),
    .arithmetic_op        (decode_arithmetic_op_o),
    .logic_op             (decode_logic_op_o),
    .branch_op            (decode_branch_op_o),
    .load_op              (decode_load_op_o),
    .store_op             (decode_store_op_o),
    .mul_op               (decode_mul_op_o),
    .div_op               (decode_div_op_o),
    .csr_op               (decode_csr_op_o),
    .fence_op             (decode_fence_op_o),
    // .other_op             (decode_other_op_o),
    .unsupport_op         (decode_unsupport_op_o)
  );

  // wire [31:0] execute_inst_i;
  wire [63:0] execute_pc_i/*verilator public_flat*/,execute_src1_i,execute_src2_i,execute_imm_i;
  wire [4:0] execute_dest_i,execute_rs1_i,execute_rs2_i;
  wire [6:0] execute_arithmetic_op_i;
  wire [21:0] execute_logic_op_i;
  wire [7:0] execute_branch_op_i;
  wire [7:0] execute_load_op_i;
  wire [3:0] execute_store_op_i;
  wire [4:0] execute_mul_op_i;
  wire [7:0] execute_div_op_i;
  wire [7:0] execute_csr_op_i;
  wire [0:0] execute_fence_op_i;
  // wire [1:0] execute_other_op_i;
  wire [0:0] execute_unsupport_op_i;
  // wire execute_op_valid_i;

  ysyx_050920_ID_reg inst_ID_reg
  (
    .clk               (clk),
    .rst               (rst),
    .enable            (decode_enable),
    .flush             (decode_flush),
    .ready             (execute_ready),
    // .valid_i           (decode_op_valid_o),
    // .inst_i            (decode_inst_o),
    .pc_i              (decode_pc_o),
    .src1_i            (decode_src1_o),
    .src2_i            (decode_src2_o),
    .rs1_i             (decode_rs1_o),
    .rs2_i             (decode_rs2_o),
    .imm_i             (decode_imm_o),
    .dest_i            (decode_dest_o),
    .arithmetic_op_i   (decode_arithmetic_op_o),
    .logic_op_i        (decode_logic_op_o),
    .branch_op_i       (decode_branch_op_o),
    .load_op_i         (decode_load_op_o),
    .store_op_i        (decode_store_op_o),
    .mul_op_i          (decode_mul_op_o),
    .div_op_i          (decode_div_op_o),
    .csr_op_i          (decode_csr_op_o),
    .fence_op_i        (decode_fence_op_o),
    // .other_op_i        (decode_other_op_o),
    .unsupport_op_i    (decode_unsupport_op_o),
    
    // .inst_o            (execute_inst_i),
    .pc_o              (execute_pc_i),
    .src1_o            (execute_src1_i),
    .src2_o            (execute_src2_i),
    .rs1_o             (execute_rs1_i),
    .rs2_o             (execute_rs2_i),
    .imm_o             (execute_imm_i),
    .dest_o            (execute_dest_i),
    .arithmetic_op_o   (execute_arithmetic_op_i),
    .logic_op_o        (execute_logic_op_i),
    .branch_op_o       (execute_branch_op_i),
    .load_op_o         (execute_load_op_i),
    .store_op_o        (execute_store_op_i),
    .mul_op_o          (execute_mul_op_i),
    .div_op_o          (execute_div_op_i),
    .csr_op_o          (execute_csr_op_i),
    .fence_op_o        (execute_fence_op_i),
    // .other_op_o        (execute_other_op_i),
    .unsupport_op_o    (execute_unsupport_op_i)
    // ,
    // .valid_o           (execute_op_valid_i)
  );
  // wire [31:0] execute_inst_o;
  // wire [63:0] execute_pc_o;
  // wire [1:0] execute_other_op_o;
  // wire execute_difftest_raise_hard_intr_o;
  wire [63:0] execute_target_pc_o;
  wire execute_target_pc_valid_o;
  wire execute_load_valid_o;
  wire [63:0] execute_load_addr_o;
  wire [3:0] execute_load_bytes_o;
  wire execute_load_sign_o;
  wire execute_store_valid_o;
  wire [63:0] execute_store_addr_o;
  wire [63:0] execute_store_data_o;
  wire [3:0] execute_store_bytes_o;
  wire [4:0] execute_dest_o;
  wire [63:0] execute_dest_data_o;
  wire [63:0] execute_mul_res_o;
  wire [63:0] execute_div_res_o;
  wire execute_dest_valid_o;

  wire [63:0] hazards_src1_o;
  wire [63:0] hazards_src2_o;

  ysyx_050920_Execute inst_Execute
  (
    .clk           (clk),
    .rst           (rst),
    .enable        (execute_enable),
    .flush         (execute_flush),
    .ready         (execute_ready),
    .div_ready     (div_ready),
    .mul_ready     (mul_ready),
    // .inst_i        (execute_inst_i),
    .pc_i          (execute_pc_i),
    .src1          (hazards_src1_o),
    .src2          (hazards_src2_o),
    .imm           (execute_imm_i),
    .dest_i        (execute_dest_i),
    .rs1_i         (execute_rs1_i),
    // .rs2_i         (execute_rs2_i),
    .arithmetic_op (execute_arithmetic_op_i),
    .logic_op      (execute_logic_op_i),
    .branch_op     (execute_branch_op_i),
    .load_op       (execute_load_op_i),
    .store_op      (execute_store_op_i),
    // .other_op      (execute_other_op_i),
    .mul_op        (execute_mul_op_i),
    .div_op        (execute_div_op_i),
    .fence_op      (execute_fence_op_i),
    .csr_op        (execute_csr_op_i),
    .unsupport_op  (execute_unsupport_op_i),
    .ex_intr       (ex_intr),
    .mtip_clear    (mtip_clear),
    .msip_i        (msip_i),
    .msip_valid_i  (msip_valid_i),
    .msip_o        (msip_o),
    .icache_invalid(icache_invalid),
    .tim_int_req   (tim_int_req),
    // .inst_o        (execute_inst_o),
    // .pc_o          (execute_pc_o),
    // .other_op_o    (execute_other_op_o),
    // .difftest_raise_hard_intr(execute_difftest_raise_hard_intr_o),
    .target_pc_o          (execute_target_pc_o),
    .target_pc_valid_o    (execute_target_pc_valid_o),
    .load_valid    (execute_load_valid_o),
    .load_addr     (execute_load_addr_o),
    .load_bytes    (execute_load_bytes_o),
    .load_sign     (execute_load_sign_o),
    .store_valid   (execute_store_valid_o),
    .store_addr    (execute_store_addr_o),
    .store_data    (execute_store_data_o),
    .store_bytes   (execute_store_bytes_o),
    .mul_res       (execute_mul_res_o),
    .div_res       (execute_div_res_o),
    .dest_o        (execute_dest_o),
    .dest_data     (execute_dest_data_o),
    .dest_valid_o  (execute_dest_valid_o)
  );
  // wire [31:0] memory_inst_i;
  // wire [63:0] memory_pc_i;
  // wire [1:0]  memory_other_op_i;
  // wire memory_difftest_raise_hard_intr_i;
  wire        memory_load_valid_i;
  wire [63:0] memory_load_addr_i;
  wire [3:0]  memory_load_bytes_i;
  wire        memory_load_sign_i;
  wire        memory_store_valid_i;
  wire [63:0] memory_store_addr_i;
  wire [63:0] memory_store_data_i;
  wire [3:0]  memory_store_bytes_i;
  wire [4:0]  memory_dest_i;
  wire [63:0] memory_dest_data_i;
  wire        memory_dest_valid_i;
  wire [63:0] exe_reg_hazards_data_o;
  wire [4:0]  exe_reg_hazards_dest_o;
  wire        exe_reg_hazards_data_valid_o;
  wire        exe_reg_hazards_dst_valid_o;
  ysyx_050920_EXE_reg inst_EXE_reg
  (
    .clk               (clk),
    .rst               (rst),
    .flush             (execute_flush),
    .enable            (execute_enable),
    .ready             (memory_ready),
    // .inst_i            (execute_inst_o),
    // .pc_i              (execute_pc_o),
    // .other_op_i        (execute_other_op_o),
    // .difftest_raise_hard_intr_i(execute_difftest_raise_hard_intr_o),
    .load_valid_i      (execute_load_valid_o),
    .load_addr_i       (execute_load_addr_o),
    .load_bytes_i      (execute_load_bytes_o),
    .load_sign_i       (execute_load_sign_o),
    .store_valid_i     (execute_store_valid_o),
    .store_addr_i      (execute_store_addr_o),
    .store_data_i      (execute_store_data_o),
    .store_bytes_i     (execute_store_bytes_o),
    .dest_i            (execute_dest_o),
    .dest_data_i       (execute_dest_data_o),
    .dest_valid_i      (execute_dest_valid_o),
    .mul_res_i         (execute_mul_res_o),
    .div_res_i         (execute_div_res_o),
    // .inst_o            (memory_inst_i),
    // .pc_o              (memory_pc_i),
    // .other_op_o        (memory_other_op_i),
    // .difftest_raise_hard_intr_o(memory_difftest_raise_hard_intr_i),
    .load_valid_o      (memory_load_valid_i),
    .load_addr_o       (memory_load_addr_i),
    .load_bytes_o      (memory_load_bytes_i),
    .load_sign_o       (memory_load_sign_i),
    .store_valid_o     (memory_store_valid_i),
    .store_addr_o      (memory_store_addr_i),
    .store_data_o      (memory_store_data_i),
    .store_bytes_o     (memory_store_bytes_i),
    .dest_o            (memory_dest_i),
    .dest_data_o       (memory_dest_data_i),
    .dest_valid_o      (memory_dest_valid_i),
    .hazards_data_o(exe_reg_hazards_data_o),
    .hazards_dest_o(exe_reg_hazards_dest_o),
    .hazards_data_valid_o(exe_reg_hazards_data_valid_o),
    .hazards_dst_valid_o(exe_reg_hazards_dst_valid_o)
  );
  assign fetch_branch_pc_i = {64{execute_target_pc_valid_o}}&execute_target_pc_o;
  assign fetch_branch_valid_i = (execute_target_pc_valid_o);

  // wire [31:0] memory_inst_o;
  // wire [63:0] memory_pc_o;
  // wire [1:0]  memory_other_op_o;
  // wire        memory_difftest_raise_hard_intr_o;
  // wire        memory_difftest_memory_op_o;
  // wire [63:0] memory_difftest_memory_addr_o;
  wire        memory_load_sign_o;
  wire        memory_dcache_ren_o;
  wire [63:0] memory_dcache_raddr_o;
  wire [3:0]  memory_dcache_rsize_o;
  wire [63:0] memory_dcache_rdata_i;
  wire [3:0]  memory_dcache_rbytes_i;
  // wire        memory_dcache_rdata_valid_i;
  wire        memory_dcache_wen_o;
  wire [63:0] memory_dcache_waddr_o;
  wire [63:0] memory_dcache_wdata_o;
  wire [3:0]  memory_dcache_wsize_o;
  wire [63:0] memory_load_data_o;
  wire        memory_load_valid_o;
  wire [4:0]  memory_dest_o;
  wire [63:0] memory_dest_data_o;
  wire        memory_dest_valid_o;
  wire        memory_dcache_rbusy_i;
  wire        memory_dcache_wbusy_i;
  assign dcache_ren = memory_dcache_ren_o&memory_enable;
  assign dcache_raddr = memory_dcache_raddr_o;
  assign dcache_rsize = memory_dcache_rsize_o;
  assign dcache_wen = memory_dcache_wen_o&memory_enable;
  assign dcache_waddr = memory_dcache_waddr_o;
  assign dcache_wdata = memory_dcache_wdata_o;
  assign dcache_wsize = memory_dcache_wsize_o;
  assign memory_dcache_rdata_i = dcache_rdata;
  // assign memory_dcache_rdata_valid_i = dcache_rdata_valid;
  assign memory_dcache_rbusy_i = dcache_rbusy;
  assign memory_dcache_wbusy_i = dcache_wbusy;
  ysyx_050920_Memory inst_Memory
  (
    .enable             (memory_enable),
    .ready              (memory_ready),
    .dcache_ren         (memory_dcache_ren_o),
    .dcache_raddr       (memory_dcache_raddr_o),
    .dcache_rsize       (memory_dcache_rsize_o),
    .dcache_rdata       (memory_dcache_rdata_i),
    .dcache_rbytes      (memory_dcache_rbytes_i),
    // .dcache_rdata_valid (memory_dcache_rdata_valid_i),
    .dcache_rbusy       (memory_dcache_rbusy_i),
    .dcache_wen         (memory_dcache_wen_o),
    .dcache_waddr       (memory_dcache_waddr_o),
    .dcache_wdata       (memory_dcache_wdata_o),
    .dcache_wsize       (memory_dcache_wsize_o),
    .dcache_wbusy       (memory_dcache_wbusy_i),
    // .inst_i             (memory_inst_i),
    // .pc_i               (memory_pc_i),
    // .other_op_i         (memory_other_op_i),
    // .difftest_raise_hard_intr_i(memory_difftest_raise_hard_intr_i),
    .load_valid         (memory_load_valid_i),
    .load_addr          (memory_load_addr_i),
    .load_bytes         (memory_load_bytes_i),
    .load_sign          (memory_load_sign_o),
    .store_valid        (memory_store_valid_i),
    .store_addr         (memory_store_addr_i),
    .store_data         (memory_store_data_i),
    .store_bytes        (memory_store_bytes_i),
    .dest_i             (memory_dest_i),
    .dest_data_i        (memory_dest_data_i),
    .dest_valid_i       (memory_dest_valid_i),
    // .inst_o             (memory_inst_o),
    // .pc_o               (memory_pc_o),
    // .other_op_o         (memory_other_op_o),
    // .difftest_raise_hard_intr_o(memory_difftest_raise_hard_intr_o),
    // .difftest_memory_op_o(memory_difftest_memory_op_o),
    // .difftest_memory_addr_o(memory_difftest_memory_addr_o),

    .load_data_o        (memory_load_data_o),
    .load_valid_o       (memory_load_valid_o),
    .dest_data_o        (memory_dest_data_o),
    .dest_o             (memory_dest_o),
    .dest_valid_o       (memory_dest_valid_o)
  );
  // wire [31:0] writeback_inst_i;
  // wire [63:0] writeback_pc_i;
  // wire [1:0]  writeback_other_op_i;
  // wire        writeback_difftest_raise_hard_intr_i;
  // wire        writeback_difftest_memory_op_i;
  // wire [63:0] writeback_difftest_memory_addr_i;
  wire [4:0]  writeback_dest_i;
  wire [63:0] writeback_dest_data_i;
  wire        writeback_dest_valid_i;
  wire [63:0] writeback_load_data_i;
  wire        writeback_load_valid_i;
  wire [63:0] mem_reg_hazards_data_o;
  wire [4:0]  mem_reg_hazards_dest_o;
  wire        mem_reg_hazards_dst_valid_o;
  wire        mem_reg_hazards_data_valid_o;
  ysyx_050920_MEM_reg inst_MEM_reg
  (
    .clk          (clk),
    .rst          (rst),
    .flush        (memory_flush),
    .enable       (memory_enable),
    .ready        (writeback_ready),
    // .inst_i       (memory_inst_o),
    // .pc_i         (memory_pc_o),
    // .other_op_i   (memory_other_op_o),
    // .difftest_raise_hard_intr_i(memory_difftest_raise_hard_intr_o),
    // .difftest_memory_op_i(memory_difftest_memory_op_o),
    // .difftest_memory_addr_i(memory_difftest_memory_addr_o),
    .dest_data_i  (memory_dest_data_o),
    .dest_i       (memory_dest_o),
    .dest_valid_i (memory_dest_valid_o),
    .load_data_i  (memory_load_data_o),
    .load_valid_i (memory_load_valid_o),
    .load_sign_i  (memory_load_sign_i),
    .load_bytes_i (memory_dcache_rsize_o),
    .load_data_valid_i(dcache_rdata_valid),
    .load_bytes_o (memory_dcache_rbytes_i),
    .load_sign_o  (memory_load_sign_o),
    // .inst_o       (writeback_inst_i),
    // .pc_o         (writeback_pc_i),
    // .other_op_o   (writeback_other_op_i),
    // .difftest_raise_hard_intr_o(writeback_difftest_raise_hard_intr_i),
    // .difftest_memory_op_o(writeback_difftest_memory_op_i),
    // .difftest_memory_addr_o(writeback_difftest_memory_addr_i),
    .dest_data_o  (writeback_dest_data_i),
    .dest_o       (writeback_dest_i),
    .dest_valid_o (writeback_dest_valid_i),
    .load_data_o  (writeback_load_data_i),
    .load_valid_o (writeback_load_valid_i),
    .hazards_data_o(mem_reg_hazards_data_o),
    .hazards_dest_o(mem_reg_hazards_dest_o),
    .hazards_dst_valid_o(mem_reg_hazards_dst_valid_o),
    .hazards_data_valid_o(mem_reg_hazards_data_valid_o)
  );
  // wire [31:0] writeback_inst_o;
  // wire [63:0] writeback_pc_o;
  // wire [1:0]  writeback_other_op_o;
  // wire writeback_difftest_raise_hard_intr_o;
  // wire writeback_difftest_memory_op_o;
  // wire [63:0] writeback_difftest_memory_addr_o;
  wire [4:0] writeback_waddr_o;
  wire writeback_wen_o;
  wire [63:0] writeback_wdata_o;
  assign decode_waddr_i = writeback_waddr_o;
  assign decode_wen_i = writeback_wen_o&writeback_enable;
  assign decode_wdata_i = writeback_wdata_o;
  ysyx_050920_Writeback inst_Writeback
  (
    .enable       (writeback_enable),
    .ready        (writeback_ready),
    // .inst_i       (writeback_inst_i),
    // .pc_i         (writeback_pc_i),
    // .other_op_i   (writeback_other_op_i),
    // .difftest_raise_hard_intr_i(writeback_difftest_raise_hard_intr_i),
    // .difftest_memory_op_i(writeback_difftest_memory_op_i),
    // .difftest_memory_addr_i(writeback_difftest_memory_addr_i),
    .dest_data_i  (writeback_dest_data_i),
    .dest_i       (writeback_dest_i),
    .dest_valid_i (writeback_dest_valid_i),
    .load_data_i  (writeback_load_data_i),
    .load_valid_i (writeback_load_valid_i),
    // .inst_o       (writeback_inst_o),
    // .pc_o         (writeback_pc_o),
    // .other_op_o   (writeback_other_op_o),
    // .difftest_raise_hard_intr_o(writeback_difftest_raise_hard_intr_o),
    // .difftest_memory_op_o(writeback_difftest_memory_op_o),
    // .difftest_memory_addr_o(writeback_difftest_memory_addr_o),
    .waddr        (writeback_waddr_o),
    .wen          (writeback_wen_o),
    .wdata        (writeback_wdata_o)
  );

  wire [4:0] Hazards_enable,Hazards_ready,Hazards_busy;
  wire [3:0] Hazards_flush;
  assign {writeback_enable,memory_enable,execute_enable,decode_enable,fetch_enable} = Hazards_enable;
  assign Hazards_ready = {writeback_ready,memory_ready,execute_ready,decode_ready,fetch_ready};
  assign Hazards_busy = {writeback_busy,memory_busy,execute_busy,decode_busy,fetch_busy};
  assign {memory_flush,execute_flush,decode_flush,fetch_flush} = Hazards_flush;

  // wire [4:0] Hazards_data_valid;
  ysyx_050920_Hazards_ctrl inst_Hazards_ctrl
  (
    .clk          (clk),
    .rst          (rst),
    .enable       (Hazards_enable),
    .flush        (Hazards_flush),
    .ready        (Hazards_ready),
    .busy         (Hazards_busy),
    // .data_valid   (Hazards_data_valid),
    // .id_rs1       (decode_rs1_o),
    // .id_rs2       (decode_rs2_o),
    // .id_dst       (decode_dest_o),
    // .exe_dst      (execute_dest_o),
    // .mem_dst      (memory_dest_o),
    // .wb_dst       (writeback_waddr_o),
    .branch_miss  (execute_target_pc_valid_o),
    // .icache_busy  (icache_rbusy),
    // .dcache_busy  (dcache_rbusy|dcache_wbusy),
    // .id_rs1_valid (decode_src1_valid_o),
    // .id_rs2_valid (decode_src2_valid_o),
    // .id_dst_valid (decode_dest_valid_o),

      /* These data come from pipeline regs. */
    .id_rs1_r(execute_rs1_i),
    .id_rs2_r(execute_rs2_i),
    .id_src1_r(execute_src1_i),
    .id_src2_r(execute_src2_i),

    .exe_dst_valid_r(exe_reg_hazards_dst_valid_o),
    .exe_data_valid_r(exe_reg_hazards_data_valid_o),
    .exe_dst_r(exe_reg_hazards_dest_o),
    .exe_data_r(exe_reg_hazards_data_o),
    .mem_dst_valid_r(mem_reg_hazards_dst_valid_o),
    .mem_data_valid_r(mem_reg_hazards_data_valid_o),
    .mem_dst_r(mem_reg_hazards_dest_o),
    .mem_data_r(mem_reg_hazards_data_o),
    /* This data comes from writenack unit. */
    .wb_en_i(writeback_wen_o),
    .wb_dst_i(writeback_waddr_o),
    .wb_data_i(writeback_wdata_o),
    /* These data go to execute unit. */
    .id_src1_o(hazards_src1_o),
    .id_src2_o(hazards_src2_o)
  );

  // difftest inst_difftest
  // (
  //   .clk            (clk),
  //   .rst            (rst),
  //   .data_valid     (Hazards_data_valid),
  //   .writeback_enable(writeback_enable),
  //   .writeback_inst (writeback_inst_o),
  //   .writeback_difftest_raise_hard_intr(writeback_difftest_raise_hard_intr_o),
  //   .writeback_other_op(writeback_other_op_o),
  //   .difftest_memory_op_i(writeback_difftest_memory_op_o),
  //   .difftest_memory_addr_i(writeback_difftest_memory_addr_o),
  //   .fetch_pc       (fetch_pc_o),
  //   .decode_pc      (decode_pc_o),
  //   .execute_pc     (execute_pc_o),
  //   .memory_pc      (memory_pc_o),
  //   .writeback_pc   (writeback_pc_o)
  // );


endmodule
