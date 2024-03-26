// I type inst
`define ysyx_050369_TYPE_I 7'b0010011
`define ysyx_050369_ADDI   3'b000
`define ysyx_050369_SLTI   3'b010
`define ysyx_050369_SLTIU  3'b011
`define ysyx_050369_XORI   3'b100
`define ysyx_050369_ORI    3'b110
`define ysyx_050369_ANDI   3'b111
`define ysyx_050369_SLLI   3'b001
`define ysyx_050369_SRI    3'b101

`define ysyx_050369_TYPE_IW 7'b0011011
`define ysyx_050369_ADDIW  3'b000
`define ysyx_050369_SLLIW  3'b001
`define ysyx_050369_SRIW   3'b101
// L type inst
`define ysyx_050369_TYPE_L 7'b0000011
`define ysyx_050369_LB     3'b000
`define ysyx_050369_LH     3'b001
`define ysyx_050369_LW     3'b010
`define ysyx_050369_LD     3'b011
`define ysyx_050369_LBU    3'b100
`define ysyx_050369_LHU    3'b101
`define ysyx_050369_LWU    3'b110


// S type inst
`define ysyx_050369_TYPE_S 7'b0100011
`define ysyx_050369_SB     3'b000
`define ysyx_050369_SH     3'b001
`define ysyx_050369_SW     3'b010

// R and M type inst
`define ysyx_050369_TYPE_R_M 7'b0110011
// R type inst
`define ysyx_050369_ADD_SUB 3'b000
`define ysyx_050369_SLL    3'b001
`define ysyx_050369_SLT    3'b010
`define ysyx_050369_SLTU   3'b011
`define ysyx_050369_XOR    3'b100
`define ysyx_050369_SR     3'b101
`define ysyx_050369_OR     3'b110
`define ysyx_050369_AND    3'b111

// M type inst
`define ysyx_050369_MUL    3'b000
`define ysyx_050369_MULH   3'b001
`define ysyx_050369_MULHSU 3'b010
`define ysyx_050369_MULHU  3'b011
`define ysyx_050369_DIV    3'b100
`define ysyx_050369_DIVU   3'b101
`define ysyx_050369_REM    3'b110
`define ysyx_050369_REMU   3'b111

`define ysyx_050369_TYPE_R_MW 7'b0111011
`define ysyx_050369_ADD_SUBW 3'b000
`define ysyx_050369_SLLW   3'b001
`define ysyx_050369_SRW    3'b101
`define ysyx_050369_MULW   3'b000
`define ysyx_050369_DIVW   3'b100
`define ysyx_050369_DIVUW  3'b101
`define ysyx_050369_REMW   3'b110
`define ysyx_050369_REMUW  3'b111
// J type inst
`define ysyx_050369_JAL    7'b1101111
`define ysyx_050369_JALR   7'b1100111

`define ysyx_050369_LUI    7'b0110111
`define ysyx_050369_AUIPC  7'b0010111
`define ysyx_050369_NOP    7'h00000013
`define ysyx_050369_NOP_OP 7'b0000001
// `define ysyx_050369_MRET   32'h30200073
`define ysyx_050369_RET    32'h00008067

`define ysyx_050369_FENCE  32'h0000100f
`define ysyx_050369_ECALL  32'h73
`define ysyx_050369_EBREAK 32'h00100073
`define ysyx_050369_MRET   32'h30200073
//CSR
`define ysyx_050369_TYPE_CSR  7'b1110011
`define ysyx_050369_CSREX   3'b000
`define ysyx_050369_CSRRW   3'b001
`define ysyx_050369_CSRRS   3'b010
`define ysyx_050369_CSRRC   3'b011
`define ysyx_050369_CSRRWI  3'b101
`define ysyx_050369_CSRRSI  3'b110
`define ysyx_050369_CSRRCI  3'b111
 
// B type inst
`define ysyx_050369_TYPE_B 7'b1100011
`define ysyx_050369_BEQ    3'b000
`define ysyx_050369_BNE    3'b001
`define ysyx_050369_BLT    3'b100
`define ysyx_050369_BGE    3'b101
`define ysyx_050369_BLTU   3'b110
`define ysyx_050369_BGEU   3'b111

`define ysyx_050369_alu_add      4'b0000
`define ysyx_050369_alu_sll      4'b0001
`define ysyx_050369_alu_less     4'b0010//uless = unsigned less
`define ysyx_050369_alu_setB     4'b0011
`define ysyx_050369_alu_xor      4'b0100
`define ysyx_050369_alu_srl      4'b0101
`define ysyx_050369_alu_or       4'b0110
`define ysyx_050369_alu_and      4'b0111
`define ysyx_050369_alu_mul      4'b1000
`define ysyx_050369_alu_mulh     4'b1001
`define ysyx_050369_alu_mulhu    4'b1011
`define ysyx_050369_alu_mulhsu   4'b1010
`define ysyx_050369_alu_div      4'b1100
`define ysyx_050369_alu_rem      4'b1110

`define ysyx_050369_imm_I        3'b000 
`define ysyx_050369_imm_U        3'b001
`define ysyx_050369_imm_S        3'b010
`define ysyx_050369_imm_B        3'b011
`define ysyx_050369_imm_J        3'b100
`define ysyx_050369_imm_R        3'b111

`define ysyx_050369_CSR_MTVEC    12'h305
`define ysyx_050369_CSR_MCAUSE   12'h342
`define ysyx_050369_CSR_MEPC     12'h341
`define ysyx_050369_CSR_MSTATUS  12'h300
`define ysyx_050369_MIE          12'h304
`define ysyx_050369_MIP          12'h344
`define ysyx_050369_msip         32'h2000000
`define ysyx_050369_mtimecmp     32'h2004000
`define ysyx_050369_mtime        32'h200BFFF
// `define ysyx_050369_BOOTH
`define ysyx_050369_SOC
`define FAST
module ysyx_050369_cache2axi (
    input               clk,    // Clock
    input               rst,  // Asynchronous reset active low
    input       [2:0]   size_t,
    input               axi_read ,
    input               unbrust,
    input               uncache,
    input       [31:0]  i_raddr,
    input       [31:0]  i_waddr,
    input           	axi_write,
    input     [31:0]  	dirty_addr,
    input     [127:0] 	i_wdata,

    output reg  [127:0] cache_wdata,
    output reg          wen ,
    output              wdone,
    output              rdone,



    input             i_awready,              
    output            o_awvalid ,
    output [31:0]     o_awaddr ,
    output [3:0]      o_awid ,
    output [7:0]      o_awlen ,
    output [2:0]      o_awsize ,
    output [1:0]      o_awburst ,

    input             i_wready,                
    output            o_wvalid ,
    output [63:0]     o_wdata ,
    output [7:0]      o_wstrb ,
    output            o_wlast ,
    
    output            o_bready ,                
    input             i_bvalid,
    input  [1:0]      i_bresp,                 
    input  [3:0]      i_bid,

    input             i_arready,                
    output            o_arvalid ,
    output [31:0]     o_araddr ,
    output [3:0]      o_arid ,
    output [7:0]      o_arlen ,
    output [2:0]      o_arsize ,
    output [1:0]      o_arburst ,
    
    output            o_rready ,                 
    input             i_rvalid,                
    input  [1:0]      i_rresp,
    input  [63:0]     i_rdata,
    input             i_rlast,
    input  [3:0]      i_rid

);

reg   [31:0] araddr;
reg   [3:0]  arid;
reg   [7:0]  arlen;
reg          arvalid;
reg          rready;
reg  [2:0]   arsize;
reg  [1:0]   arburst;   
reg          awvalid ;
reg  [31:0]  awaddr;
reg  [3:0]   awid;
reg  [7:0]   awlen ;
reg  [2:0]   awsize ;
reg  [1:0]   awburst ;              
reg          wvalid ;
reg  [7:0]   wstrb ;
reg          bready ;   
reg [63:0]   wdata ;
reg [1:0]  wcnt,wcntm,wcnts;
reg [1:0]  rcnt,rcntm;
reg [2:0]  rstate,rnstate;
reg [2:0]  wstate,wnstate;
reg [1:0]  k;
reg [127:0]cache_rdata;
wire wunbrust;
`ifdef ysyx_050369_SOC
assign wunbrust = ~i_waddr[31]; 
`else
assign wunbrust = i_waddr[31:28]!=4'h8; 
`endif
parameter RIDLE=3'b0,AREAD=3'b001,READ=3'b010,FIN=3'b011,RDONE=3'b100,UBREAD=3'b101,UBREAD_WAIT=3'b111;
parameter WIDLE=3'h0,RCACHE=3'h1,WRITE=3'h2,WRES=3'h3,WDONE=3'h4,RDATA=3'h5;
always @(posedge clk ) begin 
  if(rst) rstate <= RIDLE; 
  else    rstate <= rnstate;
end
always @(*) begin 
    case (rstate)
		RIDLE:    	rnstate = axi_read ? AREAD :RIDLE;
		AREAD:    	rnstate = (o_arvalid&&i_arready)?(unbrust?UBREAD_WAIT:READ):AREAD;
		READ:     	rnstate = i_rlast?FIN:READ;
		UBREAD_WAIT:rnstate = (i_rvalid && o_rready && i_rid==4'b0 && i_rresp<2'b10)?((rcnt==rcntm)?FIN:UBREAD):UBREAD_WAIT;
		UBREAD:   	rnstate = AREAD;
		FIN:    	rnstate = (k==2)?RDONE:FIN;
		RDONE:      rnstate = (rdone&&wdone||wstate==WIDLE)?RIDLE:RDONE;
		default :   rnstate = RIDLE;
    endcase
end
always @(posedge clk) begin 
    if(rst) begin
		araddr      <= 'b0;
		arid        <= 'b0;
		arlen       <= 'b0;
		arvalid     <= 'b0;
      	wen       	<=1'b0;
        arsize      <= 'b0;
        arburst     <= 'b0;
      	cache_wdata <= 'b0;
        rcnt    	<=2'b0;
        rcntm       <=2'b0;
        rready      <=1'b0;
        k           <= 2'b0;
    end else begin
      case (rnstate)
        RIDLE:begin
			araddr  <= 'b0;
			arid    <= 'b0;
			arlen   <= 'b0;
			arvalid <= 'b0;
			wen     <=1'b0;
			rcnt    <=2'b0;
			rcntm   <=2'b0;
			k       <= 2'b0;
        end 
    //ar通道握手
		AREAD:begin
			araddr  <= unbrust?(uncache?i_raddr:{i_raddr[31:4],rcnt,2'b0}):{i_raddr[31:4],4'b0};
			arid    <= 'b0;
			arlen   <= unbrust?8'b0:8'd1;
			arvalid <= 1'b1;
			rready  <= 1'b1;
			arsize  <= unbrust?(uncache? size_t:3'b010):3'b011;
			arburst <= unbrust?2'b0:2'b01;
			rcntm   <= unbrust&&uncache?2'b0:2'b11;
		end
      //read data 通道握手
		READ:begin 
			araddr  <= 'b0;
			arid    <= 'b0;
			arlen   <= 'b0;
			arvalid <= 'b0;
			if (i_rvalid&&o_rready) begin
				cache_wdata [63:0] <= i_rdata;
			end
		end
		UBREAD_WAIT:begin
			araddr  <= 'b0;
			arid    <= 'b0;
			arlen   <= 'b0;
			arvalid <= 'b0;
		end
		UBREAD:begin
			cache_wdata <= 	(rcnt==2'b00)? {cache_wdata[127:32],i_rdata[31:0]}:
							((rcnt==2'b01)? {cache_wdata[127:64],i_rdata[31:0],cache_wdata[31:0]}:
							((rcnt==2'b10)? {cache_wdata[127:96],i_rdata[31:0],cache_wdata[63:0]}:cache_wdata));
			rcnt    <= rcnt+1;
		end
      
		FIN:begin 
			if (k == 0) begin
				cache_wdata <= unbrust? (uncache? {cache_wdata[63:0],i_rdata[63:0]}
										:{i_rdata[31:0],cache_wdata[95:0]})
										:{i_rdata,cache_wdata[63:0]};
				k <= 1; 
			end
			else if (k == 1) begin
				if (wdone||wstate==WIDLE) begin
					wen         <= 1;
					k           <= 2;
				end
			end
		end
		RDONE:begin
			wen     <= 1'b0;
		end
      default : /* default */;
    endcase
  end
end
always @(posedge clk ) begin
    if(rst) wstate <= WIDLE;
    else    wstate <= wnstate;
end
always @(*) begin
    case (wstate)
        WIDLE   :wnstate = axi_write?RCACHE:WIDLE;
        RCACHE  :wnstate = (i_awready&& awvalid)?((wcnts==wcnt)?RDATA:WRITE):RCACHE;
        RDATA   :wnstate = WRITE;
        WRITE   :wnstate = (i_wready&& wvalid)?((wunbrust||(wcnt == wcntm))?WRES:WRITE):WRITE;
        WRES  :wnstate = (i_bvalid&&o_bready && i_bresp<2'b10 &&i_bid==4'b0)?(wunbrust&&(wcnts!=wcntm)?RCACHE:WDONE):WRES;
        WDONE   :wnstate = (((axi_read?rdone:1'b1)&&wdone)||uncache)?WIDLE:WDONE;
        default: wnstate = WIDLE;
    endcase
end
always @(posedge clk ) begin 
    if(rst) begin
        awvalid    <= 'b0;
        awaddr     <= 'b0;
        awid       <= 'b0;
        awlen      <= 'b0;
        awsize     <= 'b0;
        awburst    <= 'b0;
        bready     <= 'b0;
        wstrb      <= 'b0;
        wcnt       <= 'b0;
        wcntm      <= 'b0;
        wcnts      <= 'b0;
        wvalid     <= 'b0;
        cache_rdata<= 'b0;
    end else begin
        case (wnstate)
            WIDLE:begin 
                awvalid    <= 'b0;
                awaddr     <= 'b0;
                awid       <= 'b0;
                awlen      <= 'b0;
                awsize     <= 'b0;
                awburst    <= 'b0;
                wstrb      <= 'b0;
                wcnt       <= 'b0;
                wcntm      <= 'b0;
                wcnts      <= 'b0;
                wvalid     <= 'b0;
                cache_rdata<= 'b0;
            end
            RCACHE:begin 
                awvalid    <= 1'b1;
                awaddr     <= uncache?i_waddr:(wunbrust?{i_waddr[31:4],wcnt,2'b0}:dirty_addr);
                awid       <= 'b0;
                awlen      <= wunbrust?8'b0:8'b1;
                awsize     <= wunbrust?(uncache?size_t:3'b10):3'b011;
                awburst    <= wunbrust?2'b00:2'b01;
                wcntm      <= wunbrust?(uncache?2'b0:2'b11):2'b1;
            end
            RDATA:begin
                awvalid     <= 'b0;
                cache_rdata <= i_wdata;
            end
            WRITE:begin 
                if (o_wvalid&&i_wready) begin
                    wcnt       <= wcnt + 1;
                    wvalid     <= 'b0;
                end
                else begin 
                    awvalid    <= 'b0;
                    // wstrb      <= uncache?wstrb_t:(unbrust?8'h07:8'hf);
                    wstrb      <= uncache?8'hff:(wunbrust?8'hf:8'hff);
                    wvalid     <= 1'b1;
                end
            end
            WRES:begin 
                if (o_wvalid&&i_wready && wunbrust) begin
                    wcnt       <= wcnt + 1;
                    wcnts      <= wcnt;
                    wvalid     <= 'b0;
                end
                bready     <= 1'b1;
                wvalid     <= 'b0;
            end
            WDONE:begin 
            end
            default : /* default */;
        endcase
    end
end
always @(*) begin
    case (wcnt)
        2'b00 : wdata =  wunbrust?{32'b0,cache_rdata[31: 0] }:cache_rdata[63:0];
        2'b01 : wdata =  wunbrust?{32'b0,cache_rdata[63:32] }:cache_rdata[127:64];
        2'b10 : wdata =           {32'b0,cache_rdata[95:64] };
        2'b11 : wdata =           {32'b0,cache_rdata[127:96]};
        default: wdata = 64'b0;
    endcase
end
assign o_wlast          = (wcnt == wcntm)&&o_wvalid&&i_wready;
assign wdone            = wstate == WDONE;
assign rdone            = rstate == RDONE;
assign o_awvalid        = awvalid;
assign o_awaddr         = awaddr;
assign o_awid           = awid;
assign o_awlen          = awlen;
assign o_awsize         = awsize;
assign o_awburst        = awburst ;  
assign o_wvalid         = wvalid;
assign o_wdata          = wdata;
assign o_wstrb          = wstrb;
assign o_bready         = bready ;    
assign o_araddr         =  araddr;
assign o_arid           =  arid;
assign o_arlen          =  arlen;
assign o_arvalid        =  arvalid;
assign o_rready         =  rready;
assign o_arsize         =  arsize;
assign o_arburst        =  arburst ;
endmodule
module RegisterFile (
  input clk,
  input [63:0] wdata,
  input [4:0] waddr,
  input [4:0] raddra,
  input [4:0] raddrb,
  input wen,
  output wire [63:0] rdata,
  output wire [63:0] rdatab
);
  reg [63:0] rf [2**5-1:0];
  always @(posedge clk) begin
    if (wen) rf[waddr] <= wdata;
    rf[0] <=64'b0;
  end
  assign rdata  = (raddra == 0) ? 64'b0 : rf[raddra];
  assign rdatab = (raddrb == 0) ? 64'b0 : rf[raddrb];
// rf为通用寄存器的二维数组变量
endmodule
module ysyx_050369_Par_product (
    input  [2:0]    src,
    input  [65:0]   X,
    output          C,
    output [66:0]   P
);

wire y_add,y,y_sub;
wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;
assign {y_add,y,y_sub} = src;

assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);//=-x
assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);//= x
assign sel_double_negative =  y_add & ~y & ~y_sub;       //=2x
assign sel_double_positive = ~y_add &  y &  y_sub;       //=-2x
assign P =  sel_negative        ?{1'b0,~X}:(
            sel_positive        ?{1'b0, X}:(
            sel_double_negative ?{~X,1'b1}:(
            sel_double_positive ?{ X,1'b0}:'b0)));
assign C =  (sel_double_negative|sel_negative) ?  1'b1 : 1'b0;
endmodule
module ysyx_050369_walloc_n(
    input               clk,
    input               rst,
    input               valid,
    input [131:0]       walloc_in [32:0],
    output reg[131:0]   result_out,
    output reg          out_valid

);
///////////////first////////////////
wire [131:0] first_s       [10:0];
wire [131:0] first_cout    [10:0];
reg  [131:0] first_s_r     [10:0];
reg  [131:0] first_cout_r  [10:0];
reg          first_valid;
reg          secnod_valid;
reg          thrid_valid;
reg          fourth_valid;
reg          fifth_valid;
reg          sixth_valid;
reg          seven_valid;
always @(posedge clk ) begin
    if (rst) begin
        first_valid     <= 1'b0;
        secnod_valid    <= 1'b0;
        thrid_valid     <= 1'b0;
        fourth_valid    <= 1'b0;
        fifth_valid     <= 1'b0;
        sixth_valid     <= 1'b0;
        seven_valid     <= 1'b0;
        out_valid       <= 1'b0;
    end
    else begin
        first_valid     <= valid;
        secnod_valid    <= first_valid;
        thrid_valid     <= secnod_valid;
        fourth_valid    <= thrid_valid;
        fifth_valid     <= fourth_valid;
        sixth_valid     <= fifth_valid;
        seven_valid     <= sixth_valid;
        out_valid       <= seven_valid;
    end
end
genvar i;
generate
for(i=0; i<11; i=i+1)begin
    ysyx_050369_csa_n csa_1_(.a(walloc_in[3*i+0]),.b(walloc_in[3*i+1]),.cin(walloc_in[3*i+2]),.cout(first_cout[i]),.s(first_s[i]));
    always @(posedge clk ) begin
        if (rst) begin 
            first_cout_r[i] <= 132'b0;
            first_s_r[i]    <= 132'b0;
        end
        else begin
            first_cout_r[i] <= {first_cout[i][130:0],1'b0};
            first_s_r[i]    <= first_s[i];
        end
    end
    // assign first_cout_r[i] = {first_cout[i][130:0],1'b0};
end
endgenerate
///////////////secnod//////////////
    wire [131:0] secnod_s   [6:0];
    wire [131:0] secnod_cout[6:0];
    reg  [131:0] secnod_cout_r [6:0];
    reg  [131:0] secnod_s_r [6:0];
    ysyx_050369_csa_n csa_2_01(.a(first_s_r[0])   ,.b(first_s_r[1])   ,.cin(first_s_r[2])   ,.cout(secnod_cout[0]),.s(secnod_s[0]));
    ysyx_050369_csa_n csa_2_02(.a(first_s_r[3])   ,.b(first_s_r[4])   ,.cin(first_s_r[5])   ,.cout(secnod_cout[1]),.s(secnod_s[1]));
    ysyx_050369_csa_n csa_2_03(.a(first_s_r[6])   ,.b(first_s_r[7])   ,.cin(first_s_r[8])   ,.cout(secnod_cout[2]),.s(secnod_s[2]));
    ysyx_050369_csa_n csa_2_04(.a(first_s_r[9])   ,.b(first_s_r[10])  ,.cin(first_cout_r[0]),.cout(secnod_cout[3]),.s(secnod_s[3]));
    ysyx_050369_csa_n csa_2_05(.a(first_cout_r[1]),.b(first_cout_r[2]),.cin(first_cout_r[3]),.cout(secnod_cout[4]),.s(secnod_s[4]));
    ysyx_050369_csa_n csa_2_06(.a(first_cout_r[4]),.b(first_cout_r[5]),.cin(first_cout_r[6]),.cout(secnod_cout[5]),.s(secnod_s[5]));
    ysyx_050369_csa_n csa_2_07(.a(first_cout_r[7]),.b(first_cout_r[8]),.cin(first_cout_r[9]),.cout(secnod_cout[6]),.s(secnod_s[6]));
generate
    for (i=0; i<7; i=i+1) begin
        always @(posedge clk ) begin
            if (rst) begin 
                secnod_cout_r[i] <= 132'b0;
                secnod_s_r[i]    <= 132'b0;
            end
            else begin
                secnod_cout_r[i] <= {secnod_cout[i][130:0],1'b0};
                secnod_s_r[i]    <= secnod_s[i];
            end
        end
    end  
endgenerate
//////////////thrid////////////////
    wire [131:0] thrid_s   [4:0];
    wire [131:0] thrid_cout[4:0];
    reg  [131:0] thrid_cout_r [4:0];
    reg  [131:0] thrid_s_r [4:0];
    ysyx_050369_csa_n csa_3_01(.a(secnod_s_r[0])    ,.b(secnod_s_r[1])    ,.cin(secnod_s_r[2])    ,.cout(thrid_cout[0]),.s(thrid_s[0]));
    ysyx_050369_csa_n csa_3_02(.a(secnod_s_r[3])    ,.b(secnod_s_r[4])    ,.cin(secnod_s_r[5])    ,.cout(thrid_cout[1]),.s(thrid_s[1]));
    ysyx_050369_csa_n csa_3_03(.a(secnod_s_r[6])    ,.b(first_cout_r [10]),.cin(secnod_cout_r[ 0]),.cout(thrid_cout[2]),.s(thrid_s[2]));
    ysyx_050369_csa_n csa_3_04(.a(secnod_cout_r[ 1]),.b(secnod_cout_r[ 2]),.cin(secnod_cout_r[ 3]),.cout(thrid_cout[3]),.s(thrid_s[3]));
    ysyx_050369_csa_n csa_3_05(.a(secnod_cout_r[ 4]),.b(secnod_cout_r[ 5]),.cin(secnod_cout_r[ 6]),.cout(thrid_cout[4]),.s(thrid_s[4]));
generate
    for (i=0; i<5; i=i+1) begin
        always @(posedge clk ) begin
            if (rst) begin 
                thrid_cout_r[i] <= 132'b0;
                thrid_s_r[i]    <= 132'b0;
            end
            else begin
                thrid_cout_r[i] <= {thrid_cout[i][130:0],1'b0};
                thrid_s_r[i]    <= thrid_s[i];
            end
        end
    end  
endgenerate
//////////////fourth////////////////
    wire [131:0] fourth_s   [2:0];
    wire [131:0] fourth_cout[2:0];
    reg  [131:0] fourth_s_r [2:0];
    reg  [131:0] fourth_cout_r [2:0];
    ysyx_050369_csa_n csa_4_01(.a(thrid_s_r[0])    ,.b(thrid_s_r[1])    ,.cin(thrid_s_r[2])   ,.cout(fourth_cout[0]),.s(fourth_s[0]));
    ysyx_050369_csa_n csa_4_02(.a(thrid_s_r[3])    ,.b(thrid_s_r[4])    ,.cin(thrid_cout_r[0]),.cout(fourth_cout[1]),.s(fourth_s[1]));
    ysyx_050369_csa_n csa_4_03(.a(thrid_cout_r[ 1]),.b(thrid_cout_r[ 2]),.cin(thrid_cout_r[3]),.cout(fourth_cout[2]),.s(fourth_s[2]));

always @(posedge clk ) begin
    if (rst) begin
        fourth_cout_r[0] <= 132'b0;
        fourth_cout_r[1] <= 132'b0;
        fourth_cout_r[2] <= 132'b0;
        fourth_s_r[0]    <= 132'b0;
        fourth_s_r[1]    <= 132'b0;
        fourth_s_r[2]    <= 132'b0;
    end
    else begin
        fourth_s_r[0]    <= fourth_s[0];
        fourth_s_r[1]    <= fourth_s[1];
        fourth_s_r[2]    <= fourth_s[2];
        fourth_cout_r[0] <= {fourth_cout[0][130:0],1'b0};
        fourth_cout_r[1] <= {fourth_cout[1][130:0],1'b0};
        fourth_cout_r[2] <= {fourth_cout[2][130:0],1'b0};
    end
end
//////////////fifth/////////////////
    wire [131:0] fifth_s   [1:0];
    wire [131:0] fifth_cout[1:0];
    reg  [131:0] fifth_s_r [1:0];
    reg  [131:0] fifth_cout_r [1:0];
    ysyx_050369_csa_n csa_5_01(.a(fourth_s_r[0])  ,.b(fourth_s_r[1])   ,.cin(fourth_s_r[2])   ,.cout(fifth_cout[0]),.s(fifth_s[0]));
    ysyx_050369_csa_n csa_5_02(.a(thrid_cout_r[4]),.b(fourth_cout_r[0]),.cin(fourth_cout_r[1]),.cout(fifth_cout[1]),.s(fifth_s[1]));
always @(posedge clk ) begin
    if (rst) begin
        fifth_s_r[0]    <= 132'b0;
        fifth_s_r[1]    <= 132'b0;
        fifth_cout_r[0] <= 132'b0;
        fifth_cout_r[1] <= 132'b0;
    end
    else begin
        fifth_s_r[0]    <= fifth_s[0];
        fifth_s_r[1]    <= fifth_s[1];
        fifth_cout_r[0] <= {fifth_cout[0][130:0],1'b0};
        fifth_cout_r[1] <= {fifth_cout[1][130:0],1'b0};
    end
end
///////////////sixth////////////// /
    wire [131:0]sixth_s;
    wire [131:0]sixth_cout;
    reg  [131:0]sixth_s_r;
    reg  [131:0]sixth_cout_r;
    ysyx_050369_csa_n csa_6_01(.a(fifth_s_r[0]),.b(fifth_s_r[1]),.cin(fourth_cout_r[2]) ,.cout(sixth_cout   ),.s(sixth_s   ));
always @(posedge clk ) begin
    if (rst) begin
        sixth_s_r    <= 132'b0;
        sixth_cout_r <= 132'b0;
    end
    else begin
        sixth_s_r    <= sixth_s;
        sixth_cout_r <= {sixth_cout[130:0],1'b0};
    end
end
///////////////seven///////////////
    wire [131:0]seven_s;
    wire [131:0]seven_cout;
    reg  [131:0]seven_s_r;
    reg  [131:0]seven_cout_r;
    ysyx_050369_csa_n csa_7_01(.a(sixth_s_r ),.b(fifth_cout_r[0]),.cin(fifth_cout_r[1]) ,.cout(seven_cout   ),.s(seven_s   ));
always @(posedge clk ) begin
    if (rst) begin
        seven_s_r    <= 132'b0;
        seven_cout_r <= 132'b0;
    end
    else begin
        seven_s_r    <= seven_s;
        seven_cout_r <= {seven_cout[130:0],1'b0};
    end
end
///////////////eight///////////////
    wire [131:0]eight_s;
    wire [131:0]eight_cout;
    ysyx_050369_csa_n csa_8_01(.a(seven_s_r   ),.b(seven_cout_r)    ,.cin(sixth_cout_r)     ,.cout(eight_cout   ),.s(eight_s ));
always @(posedge clk ) begin
    if (rst) begin
        result_out <= 132'b0;
    end
    else begin
        result_out <=eight_s+{eight_cout[130:0],1'b0};
    end
end
endmodule

module ysyx_050369_csa_n(
  input [131:0] a,
  input [131:0] b,
  input [131:0] cin,
  output[131:0] cout,
  output[131:0] s

);
genvar i;
generate
	for(i=0; i<132; i=i+1)begin
		assign s[i]    = a[i] ^ b[i] ^ cin[i];
		assign cout[i] = a[i] & b[i] | b[i] & cin[i] | a[i] & cin[i];  
	end
endgenerate
endmodule
module ysyx_050369_Bmultiplier  (
    input               clk,
    input               rst,
    input               mul_valid,
    input               flush,//  为高表示取消乘法
    input               mulw,//为高表示是 32 位乘法
    input   [1:0]       mul_signed,//2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    input   [63:0]      multiplicand,
    input   [63:0]      multiplier,
    output reg          mul_ready,
    output reg          out_valid,
    output reg [63:0]   result_hi,
    output reg [63:0]   result_lo
);

    wire [65:0] multiplier_temp;
    wire [65:0] multiplicand_temp;
    reg         walloc_ivalid;
    wire        walloc_ovalid;
    wire [131:0]res;
    parameter IDLE = 3'b0,START=3'b1,RUN=3'd2,OUT=3'd3;
    reg [2:0]state,next_state;
    always @(posedge clk ) begin
        if (rst||flush) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end
    always @(*) begin
        if (flush) begin
            next_state = IDLE;
        end
        else begin
            case (state)
                IDLE:  next_state = mul_valid?START:IDLE;
                START: next_state = RUN;
                RUN:   next_state = walloc_ovalid?OUT:RUN;
                OUT:   next_state = IDLE;
                default: next_state = IDLE;
            endcase
        end
        
    end
    always @(posedge clk ) begin
        if (rst||flush) begin
            walloc_ivalid    <= 1'b0;
            mul_ready        <= 1'b0;
            out_valid        <= 1'b0;
            result_hi        <= 64'b0;
            result_lo        <= 64'b0;
        end
        else begin
            case (next_state)
                IDLE:  begin
                    walloc_ivalid    <= 1'b0;
                    mul_ready        <= 1'b1;
                    out_valid        <= 1'b0;
                end
                START: begin
                    walloc_ivalid    <= 1'b1;
                    mul_ready        <= 1'b0;
                    out_valid        <= 1'b0;
                end
                RUN:   begin
                    walloc_ivalid    <= 1'b0; 
                    mul_ready        <= 1'b0;
                    out_valid        <= 1'b0;
                end
                OUT:   begin
                    // result_lo <= mulw?{{32{res[31]}},res[31:0]}:res[63:0];
                    result_hi        <= res[127:64];
                    result_lo        <= mulw?{{32{res[31]}},res[31:0]}:res[63:0];
                    mul_ready        <= 1'b0;
                    out_valid        <= 1'b1;
                end
                default: begin
                    walloc_ivalid    <= 1'b0;
                    mul_ready        <= 1'b0;
                    out_valid        <= 1'b0;
                    result_hi        <= 64'b0;
                    result_lo        <= 64'b0;
                end
            endcase
        end
    end
    assign multiplicand_temp = mul_signed[1]?(mulw?{{34{multiplicand[31]}},multiplicand[31:0]}:{{2{multiplicand[63]}},multiplicand[63:0]})
                                            :(mulw?{{34{1'b0}},multiplicand[31:0]}            :{{2{1'b0}},multiplicand[63:0]});

    assign multiplier_temp   = mul_signed[0]?(mulw?{{34{multiplier[31]}},multiplier[31:0]}:{{2{multiplier[63]}},multiplier[63:0]})
                                            :(mulw?{{34{1'b0}},multiplier[31:0]}          :{{2{1'b0}},multiplier[63:0]});
    wire [66:0] p_temp [32:0];
    wire [131:0] walloc_in [32:0];
    wire [32:0] c_temp;
        ysyx_050369_Par_product Par_0(.src({multiplicand_temp[1:0],1'b0}) ,.X(multiplier_temp),.C(c_temp[0]),.P(p_temp[0]));
  genvar i;
  generate
    for(i=1; i<33; i=i+1)begin
        ysyx_050369_Par_product Par_ (.src(multiplicand_temp[2*i+1:2*i-1]),.X(multiplier_temp),.C(c_temp[i]),.P(p_temp[i]));
    end
    // ysyx_050369_Par_product Par_32 (.src(multiplicand_temp[65:63]),.X(multiplier_temp),.C(),.P(p_temp[32]));
    endgenerate
    assign walloc_in[0] = {{65{p_temp[0][65]}},p_temp[0]};
    generate
    for(i=1; i<33; i=i+1)begin
        assign walloc_in[i] = {{{(65-2*i){p_temp[i][65]}}},p_temp[i] ,1'b0, c_temp[i-1], {(2*i-2){1'b0}}};
    end
    endgenerate
    ysyx_050369_walloc_n walloc_n(
        .clk        (clk),
        .rst        (rst),
        .valid      (walloc_ivalid),
        .walloc_in  (walloc_in),
        .result_out (res),
        .out_valid  (walloc_ovalid)
    );

endmodule
module ysyx_050369_alu(
    input               clk,
    input               rst,
    input [63:0]        op1,
    input [63:0]        op2,
    input [5:0]         ALUctr,
    input               stop,
    output reg [63:0]   res,
    output              ALU_busy ,
    output              op1_eq_op2
);
wire [63:0]add_res;
wire CF,OF,SF;
ysyx_050369_add add(
    .add_op1(op1),
    .add_op2(op2),
    .sub_flag(ALUctr[4]),
    .result(add_res),
    .CF(CF),
    .SF(SF),
    .OF(OF)
);
wire [13:0] res_ctrl;
wire [63: 0]res_sll;
wire [63: 0]res_sllw;
wire [63: 0]res_sll_;
wire [63 :0]res_less;
wire [63: 0]res_xor;
wire [63: 0]res_or;
wire [63: 0]res_and;
wire [63: 0]res_and_;
wire [63: 0]res_srl;
wire [63: 0]res_sra;
wire [63: 0]res_add;
wire [31: 0]res_srlw;
wire [31: 0]res_sraw;
wire [127:0]res_srl_t ;
wire [127:0]res_sra_t ;
wire [63 :0]res_srlw_t;
wire [63 :0]res_sraw_t;
wire [63 :0]res_sr_;
wire [63 :0]res_srw_;
wire [63 :0]res_srl_;
wire    	mul_valid;
wire [1:0]  mul_signed;
wire    	mul_ready;
wire    	mul_out_valid;
wire [63:0] result_hi,result_lo;
wire    	div_valid;
wire    	div_out_valid;
wire    	div_ready;
wire [63:0] quotient,remainder;
assign op1_eq_op2 = (op1 == op2);
assign res_add    = ALUctr[5]? {{32{add_res[31]}},add_res[31:0]} : add_res;
assign res_less   = ALUctr[5]?{63'b0,CF}:{63'b0,SF^OF};

assign res_sll    = op1 << op2[5:0];
assign res_sllw   = {32'b0,op1[31:0] << op2[4:0]};
assign res_sll_   = ALUctr[5]? res_sllw : res_sll;

assign res_xor    = op1 ^ op2;
assign res_or     = op1 | op2;

assign res_and    = op1 & op2;
assign res_and_   =  ALUctr[5]?(op1 & ~op2):res_and;

assign res_srl_t  = {64'b0,op1};
assign res_sra_t  = {{64{op1[63]}},op1};
assign res_srlw_t = {32'b0,op1[31:0]};
assign res_sraw_t = {{32{op1[31]}},op1[31:0]}; 

assign res_srl    = res_srl_t[({1'b0,op2[5:0]})+:64];
assign res_sra    = res_sra_t[({1'b0,op2[5:0]})+:64];
assign res_srlw   = res_srlw_t[({1'b0,op2[4:0]})+:32];
assign res_sraw   = res_sraw_t[({1'b0,op2[4:0]})+:32];

assign res_sr_    = ALUctr[4]?res_sra:res_srl;
assign res_srw_   = ALUctr[4]?{32'b0,res_sraw[31:0]}:{32'b0,res_srlw};
assign res_srl_   = ALUctr[5]?res_srw_:res_sr_;

assign mul_valid  =  (ALUctr[3] && ~ALUctr[2])&mul_ready&stop;
assign div_valid  =  (ALUctr[3] &&  ALUctr[2])&div_ready&stop;
assign ALU_busy   =  (~(mul_ready||mul_out_valid)||mul_valid)||
                    (~(div_ready||div_out_valid)||div_valid);
assign mul_signed[0] = ~ALUctr[1] &&  ALUctr[0];
assign mul_signed[1] =  ALUctr[1] ^   ALUctr[0];
`ifdef ysyx_050369_BOOTH
ysyx_050369_Bmultiplier ysyx_050369_Bmultiplier (
    .clk         (clk),   
    .rst         (rst),
    .mul_valid   (mul_valid),
    .flush       (1'b0),//  为高表示取消乘法
    .mulw        (ALUctr[5]),//为高表示是 32 位乘法
    .mul_signed  (mul_signed),//2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    .multiplicand(op1),
    .multiplier  (op2),
    .mul_ready   (mul_ready),
    .out_valid   (mul_out_valid),
    .result_hi   (result_hi),
    .result_lo   (result_lo)
);
`else
ysyx_050369_Smultiplier ysyx_050369_Smultiplier (
    .clk         (clk),   
    .rst         (rst),
    .mul_valid   (mul_valid),
    .flush       (1'b0),//  为高表示取消乘法
    .mulw        (ALUctr[5]),//为高表示是 32 位乘法
    .mul_signed  (mul_signed),//2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    .multiplicand(op1),
    .multiplier  (op2),
    .mul_ready   (mul_ready),
    .out_valid   (mul_out_valid),
    .result_hi   (result_hi),
    .result_lo   (result_lo)
);
`endif

ysyx_050369_DIV  ysyx_050369_DIV( 
    .clk         (clk),
    .rst         (rst),
    .dividend    (op1),
    .divisor     (op2),
    .div_valid   (div_valid),
    .divw        (ALUctr[5]),
    .div_signed  (ALUctr[4]),
    .flush       (1'b0),
    .div_ready   (div_ready),
    .out_valid   (div_out_valid),
    .quotient    (quotient),//商
    .remainder   (remainder)//  余数
);

assign res_ctrl[ 0] = (ALUctr[3:0] == `ysyx_050369_alu_add   );
assign res_ctrl[ 1] = (ALUctr[3:0] == `ysyx_050369_alu_sll   );
assign res_ctrl[ 2] = (ALUctr[3:0] == `ysyx_050369_alu_less  );
assign res_ctrl[ 3] = (ALUctr[3:0] == `ysyx_050369_alu_setB  );
assign res_ctrl[ 4] = (ALUctr[3:0] == `ysyx_050369_alu_srl   );
assign res_ctrl[ 5] = (ALUctr[3:0] == `ysyx_050369_alu_and   );
assign res_ctrl[ 6] = (ALUctr[3:0] == `ysyx_050369_alu_or    );
assign res_ctrl[ 7] = (ALUctr[3:0] == `ysyx_050369_alu_xor   );
assign res_ctrl[ 8] = (ALUctr[3:0] == `ysyx_050369_alu_mul   );
assign res_ctrl[ 9] = (ALUctr[3:0] == `ysyx_050369_alu_mulh  );
assign res_ctrl[10] = (ALUctr[3:0] == `ysyx_050369_alu_mulhu );
assign res_ctrl[11] = (ALUctr[3:0] == `ysyx_050369_alu_mulhsu);
assign res_ctrl[12] = (ALUctr[3:0] == `ysyx_050369_alu_div   );
assign res_ctrl[13] = (ALUctr[3:0] == `ysyx_050369_alu_rem   );
assign res = 	({64{res_ctrl[ 0]}} & res_add   ) |
                ({64{res_ctrl[ 1]}} & res_sll_	) |  
                ({64{res_ctrl[ 2]}} & res_less	) |  
                ({64{res_ctrl[ 3]}} & op2	    ) | 
                ({64{res_ctrl[ 4]}} & res_srl_  ) |
                ({64{res_ctrl[ 5]}} & res_and_  ) |
                ({64{res_ctrl[ 6]}} & res_or    ) |
                ({64{res_ctrl[ 7]}} & res_xor   ) |
                ({64{res_ctrl[ 8]}} & result_lo ) |
                ({64{res_ctrl[ 9]}} & result_hi ) |
                ({64{res_ctrl[10]}} & result_hi ) |
                ({64{res_ctrl[11]}} & result_hi ) |
                ({64{res_ctrl[12]}} & quotient  ) |
                ({64{res_ctrl[13]}} & remainder );

endmodule
module ysyx_050369_add(
    input   [63:0]  add_op1,
    input   [63:0]  add_op2,
    input           sub_flag,
    output  [63:0] result,
    output  CF,SF,OF
    );
    wire [63:0] add_op2_;
    wire Ctemp,Cout;
	assign    add_op2_=sub_flag?~add_op2:add_op2;
    assign    {Ctemp,result[62:0]}={1'b0,add_op1[62:0]}+{1'b0,add_op2_[62:0]}+{{63{1'b0}},sub_flag};
	assign	  result[63]    	= add_op1[63] ^ add_op2_[63] ^ Ctemp;
	assign 	  Cout 				= add_op1[63] & add_op2_[63] | add_op2_[63] & Ctemp | add_op1[63] & Ctemp; 
    assign    SF=result[63];//判断符号
    assign    OF=Cout^Ctemp;//
    assign    CF=sub_flag^Cout;//减法溢出

endmodule
module ysyx_050369_DIV  ( 
    input              clk,
    input              rst,
    input  [63:0]      dividend,
    input  [63:0]      divisor,
    input              div_valid,
    input              divw,
    input              div_signed,
    input              flush,
    output reg         div_ready,
    output reg         out_valid,
    output reg [63:0]  quotient,//商
    output reg [63:0]  remainder//  余数
);
    parameter IDLE=0,READY=1,RUN=2,RES=3,OUT=4,HIT_RES=5;
    reg  [3: 0]     state,next_state;
    reg  [127:0]    dividend_temp;
    reg  [64:0]     divisor_temp;
    reg  [63:0]     res;
    reg  [6 :0]     cycle;
    reg  [6 :0]     cnt;
    reg [129:0]     input_buffer ;
    reg [127:0]     out_buffer   ;
    wire [1 :0]     sign;
    wire [63:0]     dividend_abs,divisor_abs;
    wire [63:0]     res_w;
    wire [127:0]    dividend_w;
    wire [64:0]     sub_res;
    wire            hit;
    wire [63:0]     dividend_temp_inv;
    wire [63:0]     dividend_inv;
    wire [63:0]     divisor_inv;
    wire [63:0]     res_inv;
    assign dividend_inv = -dividend;
    assign divisor_inv  = -divisor;
    assign res_inv      = -res;
    assign dividend_temp_inv = -dividend_temp[127:64];
    assign sign[1]      = (divw?dividend[31]:dividend[63])&div_signed;
    assign sign[0]      = (divw?divisor[31]:divisor[63])&div_signed;
    assign dividend_abs = (sign[1])?dividend_inv:dividend;
    assign divisor_abs  = (sign[0])?divisor_inv :divisor;
    assign sub_res 		= dividend_temp[127:63]-divisor_temp;
    assign dividend_w 	= {{sign[1]?dividend_temp_inv:dividend_temp[127:64]},dividend_temp[63:0]};
    assign res_w 		= (sign[1]^sign[0])?res_inv: res;
    assign hit 			= ({divw,div_signed,divisor,dividend} == input_buffer) ? 1'b1 :1'b0;
    always @(posedge clk ) begin
        if (rst||flush) state <= IDLE;
        else state <= next_state;
    end
    always @(*) begin
        case (state)
            IDLE: next_state = div_valid? (|hit)? HIT_RES:READY:IDLE;
            READY:next_state = RUN;
            RUN:  next_state = (cnt == cycle)?RES:RUN;
            RES:  next_state = OUT;
            OUT:  next_state = IDLE;
            HIT_RES:next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end
    always @(posedge clk ) begin
        if (rst)begin
            cnt           <= 'b0;
            cycle         <= 'b0;
            dividend_temp <= 'b0;
            divisor_temp  <= 'b0;
            out_valid     <= 'b0; 
            div_ready     <= 'b1;
            quotient      <= 'b0;
            remainder     <= 'b0;
            res           <= 'b0;
            input_buffer  <= 130'b0;
            out_buffer    <= 128'b0;
        end
        else begin
            
            case (next_state)
                IDLE:begin
                    cnt           <= 'b0;
                    cycle         <= 'b0;
                    dividend_temp <= 'b0;
                    divisor_temp  <= 'b0;
                    out_valid     <= 'b0; 
                    div_ready     <= 'b1;
                end 
                READY:begin
                    div_ready <= 1'b0;
                    cycle     <= divw?7'd32:7'd64;
                    dividend_temp <=    {128{ divw}} & {64'b0,dividend_abs[31:0],32'b0} |
                                        {128{~divw}} & {64'b0,dividend_abs};
                    divisor_temp  <=    {65 { divw}} & {33'b0,divisor_abs[31:0]} |
                                        {65 {~divw}} & {1'b0,divisor_abs};
                end
                RUN:begin
                    if (dividend_temp[127:63]>=divisor_temp) begin
                        dividend_temp[127:64] <= sub_res[63:0];
                        res                <= {res[62:0],1'b1};
                    end
                    else begin
                        dividend_temp[127:63] <= dividend_temp[126:62];
                        res                <= {res[62:0],1'b0};
                    end
                    dividend_temp [63:0] <= {dividend_temp [62:0],1'b0};
                    cnt <= cnt +1 ;
                end
                RES:begin
                    quotient <= {64{ divw}} & {{32{res_w[31]}}, res_w[31:0]} |
                                {64{~divw}} & res_w;
                    remainder<= {64{ divw}} & {{32{dividend_w[95]}},dividend_w[95:64]} |
                                {64{~divw}} & dividend_w[127:64];
                end
                OUT:begin
                    out_valid      <= 1'b1;
                    input_buffer   <= {divw,div_signed,divisor,dividend};
                    out_buffer     <= {quotient,remainder};
                    // end
                end
                HIT_RES:begin
                    out_valid       <= 1'b1;
                    remainder       <= out_buffer[63:0];
                    quotient        <= out_buffer[127:64];
                end
                default: begin end
            endcase
        end
    end
endmodule

module ysyx_050369_pc_pre (
    input          clk,
    input          rst,
    input          i_pc_stop,
    input   [31:0] i_if_pc,
    input   [31:0] i_ex_pc,
    input          i_jump_valid,
    input   [31:0] i_nxpc,
    input          i_pre_error,
    output         o_jump_valid,
    output  [31:0] o_pc_pre
);
wire [5:0]  ex_offset;
wire [5:0]  if_offset;
reg  [31:0] jup_pc  [63:0];//存放的是的可能会跳转的pc
reg  [1:0]  pre     [63:0];
reg  [31:0] pre_pc  [63:0]; 
assign ex_offset = i_ex_pc[7:2];
assign if_offset = i_if_pc[7:2];
integer i;
always @(posedge clk ) begin
    if (rst) begin
        for (i = 0; i< 64; i=i+1 ) begin
            jup_pc[i] <= 32'b0;
            pre[i]    <=  2'b0;
            pre_pc[i] <= 32'b0;
        end
    end
    else if(~i_pc_stop) begin
        if (i_pre_error ) begin
            if (pre   [ex_offset] == 0) begin
                jup_pc[ex_offset] <= i_ex_pc;
                pre_pc[ex_offset] <= i_nxpc; 
                pre   [ex_offset] <= 2'b11;
            end
            else begin
                pre   [ex_offset] <= pre   [ex_offset] - 1;
            end
        end
        else if (i_jump_valid ) begin
            if (pre   [ex_offset] < 2'b11 ) begin
                pre   [ex_offset] <= pre   [ex_offset] + 1;
            end
        end
    end
end

assign o_jump_valid =  (jup_pc[if_offset]==i_if_pc)&&(pre[if_offset] > 0);
assign o_pc_pre =  pre_pc[if_offset];

endmodule
module ysyx_050369_ex (
    input           clk,
    input           rst,
    //
    input           ex_ready,
    input           id_valid,         
    //          
    input   [31:0]  i_pc,
    input   [31:0]  i_pre_pc,
    input           i_pre_jump,
    input   [63:0]  i_src1,
    input   [63:0]  i_src2, 
  	input   [4 :0]  i_rs1,
    input   [4 :0]  i_reg_waddr,
    input           i_RegWr,
    input   [1 :0]  i_ALUAsrc,
    input   [2 :0]  i_ALUBsrc,
    input   [5 :0]  i_ALUctr,
    input   [2 :0]  i_Branch,
    input           i_MemtoReg,
    input           i_MemWr,
    input   [63:0]  i_imm,
    input   [7 :0]  i_rmask,
    input   [7 :0]  i_wmask,
    input           i_csr_wen,
    input           i_ecall_flag,
    input           i_mret_flag,
    input           i_fence_flag,
    input           i_dcache_done,
    //to ctrl
    output  [1 :0]  o_fence_flag,
    output          o_mret_flag,
    output          o_ecall_flag,
    //to reg-file
    output  [31:0]  o_pc,
    output          o_reg_wen,
    output  [4 :0]  o_reg_waddr,
    output  [63:0]  o_reg_res,
    output          o_ALU_busy,
    //to cseg
    input   [63:0]  i_csr_rdata,
    output          o_csr_wen,
    output  [11:0]  o_csr_waddr,
    output  [63:0]  o_csr_wdata,
    //to pc
    output          o_jump_valid,
    output          o_pre_error,
    output  [31:0]  o_nxpc,
    output          o_mem_wen,
    output  [31:0]  o_mem_addr,
    output  [63:0]  o_mem_wdata,
    output  [7 :0]  o_mem_wmask,
    output          o_mem_ren,
    output  [7 :0]  o_mem_rmask
    

);
    reg   [31:0]    pc;
    reg             stop;
    reg   [31:0]    pre_pc;
    reg             pre_jump;
    reg   [63:0]    src1;
    reg   [63:0]    src2; 
    reg   [4 :0]    rs1;
    reg   [4 :0]    reg_waddr;
    reg             RegWr;
    reg    [1:0]    ALUAsrc;
    reg    [2:0]    ALUBsrc;
    reg    [5:0]    ALUctr ;
    reg    [2:0]    Branch;
    reg             MemtoReg;
    reg             MemWr;
    reg    [63:0]   imm;
    reg    [7:0]    rmask;
    reg    [7:0]    wmask;
    reg             csr_wen;
    reg    [63:0]   csr_rdata;
   
    reg             ecall_flag;
    reg             mret_flag;
    reg             fence_flag;           
    wire            jump_valid;
    wire [31:0]     nxpc;
    wire [63:0]     op1;
    reg  [63:0]     op2;
    wire [63:0]     res;
    wire            op_eq;
    reg       		fence_flag_d;
    reg  [5 :0]     op2_choose;
    always @(posedge clk ) begin
        if (rst) stop      <= 'b0;
        else stop      <= ex_ready;
    end
    always @(posedge clk )begin
        if (rst|| ~id_valid) begin
            pc        <= 'b0;
            rs1       <= 'b0;
            reg_waddr <= 'b0;
            src1      <= 'b0;
            src2      <= 'b0;
            RegWr     <= 'b0;
            ALUAsrc   <= 'b0;
            ALUBsrc   <= 'b0;
            ALUctr    <= 'b0;
            Branch    <= 'b0;
            MemtoReg  <= 'b0;
            MemWr     <= 'b0;
            imm       <= 'b0;
            rmask     <= 'b0;
            wmask     <= 'b0;
            csr_wen   <= 'b0;
            csr_rdata <= 'b0;
            pre_pc    <= 'b0;
            pre_jump  <= 'b0;
            mret_flag <= 'b0;
            ecall_flag<= 'b0;
            op2_choose<= 'b0;
        end
        else begin
            if (ex_ready) begin
                pc              <= i_pc ;
                rs1             <= i_rs1 ;
                reg_waddr       <= i_reg_waddr ;
                src1            <= i_src1 ;
                src2            <= i_src2 ;
                RegWr           <= i_RegWr ;
                ALUAsrc         <= i_ALUAsrc ;
                ALUBsrc         <= i_ALUBsrc ;
                ALUctr          <= i_ALUctr ;
                Branch          <= i_Branch ;
                MemtoReg        <= i_MemtoReg ;
                MemWr           <= i_MemWr ;
                imm             <= i_imm ;
                rmask           <= i_rmask ;
                wmask           <= i_wmask ;
                pre_pc          <= i_pre_pc ;
                pre_jump        <= i_pre_jump ;
                csr_wen         <= i_csr_wen ;
                csr_rdata       <= i_csr_rdata ;
                mret_flag       <= i_mret_flag;
                ecall_flag      <= i_ecall_flag;
                op2_choose[5]   <=(~i_ALUBsrc[2]) && (~i_ALUBsrc[1]) && (~i_ALUBsrc[0]);
                op2_choose[4]   <=(~i_ALUBsrc[2]) && (~i_ALUBsrc[1]) && ( i_ALUBsrc[0]);
                op2_choose[3]   <=(~i_ALUBsrc[2]) && ( i_ALUBsrc[1]) && (~i_ALUBsrc[0]);
                op2_choose[2]   <=(~i_ALUBsrc[2]) && ( i_ALUBsrc[1]) && ( i_ALUBsrc[0]);
                op2_choose[1]   <=( i_ALUBsrc[2]) && (~i_ALUBsrc[1]) && (~i_ALUBsrc[0]);
                op2_choose[0]   <=( i_ALUBsrc[2]) && (~i_ALUBsrc[1]) && ( i_ALUBsrc[0]);
            end
        end
    end

    

    always @(posedge clk) begin
        if (rst) begin
            fence_flag <= 1'b0;
            fence_flag_d <= 1'b0;
        end
        else begin
            if (i_fence_flag && (~o_pre_error) ) begin
                fence_flag <= 1'b1;
            end
            else if(i_dcache_done) begin
                fence_flag <= 1'b0;
            end
            fence_flag_d <= fence_flag;
        end
    end
    assign o_fence_flag  =  { fence_flag , fence_flag_d};
    assign  op1          =  (ALUAsrc[1])?csr_rdata:
                            (ALUAsrc[0] ?{32'b0,pc}:src1);
	assign  op2          =  ({64{op2_choose[5]}} & src2 		)|
							({64{op2_choose[4]}} & imm 			)|
							({64{op2_choose[3]}} & 64'h4 		)|
							({64{op2_choose[2]}} & {59'b0,rs1} 	)|
							({64{op2_choose[1]}} & csr_rdata 	)|
							({64{op2_choose[0]}} & src1 		);
    assign o_mret_flag   = mret_flag;
    assign o_ecall_flag  = ecall_flag;
    assign o_reg_wen     = RegWr;
    assign o_reg_waddr   = reg_waddr;
    assign o_reg_res     = csr_wen?csr_rdata: res;
    assign o_csr_wen     = csr_wen;
    assign o_csr_waddr   = imm[11:0];
    assign o_csr_wdata   = res;
    assign o_nxpc        = nxpc;
    assign o_jump_valid  = jump_valid;
    assign o_mem_wen     = MemWr;
    assign o_mem_addr    =  res [31:0];
    assign o_mem_wdata   = src2 ;
    assign o_mem_wmask   = wmask;
    assign o_mem_ren     = MemtoReg;
    assign o_mem_rmask   = rmask;
    assign o_pc          = pc;

    ysyx_050369_alu   ysyx_050369_alu(
        .clk        (clk),
        .rst        (rst),
        .op1        (op1),
        .op2        (op2),
        .stop       (stop),
        .ALUctr     (ALUctr),
        .ALU_busy   (o_ALU_busy),
        .res        (res),
        .op1_eq_op2 (op_eq)
    );
    ysyx_050369_next_pc ysyx_050369_nxtpc(
        .rst        (rst),
        .Branch     (Branch),
        .pc         (pc),
        .imm        (imm[31:0]),
        .src1       (src1[31:0]),
        .less       (res[0]),
        .op_eq      (op_eq),
        .nxpc       (nxpc),
        .jump_valid (jump_valid)
    );

    assign o_pre_error =(jump_valid ^ pre_jump)||jump_valid&&(nxpc != pre_pc);
endmodule


module ysyx_050369_Smultiplier (
    input               clk,
    input               rst,
    input               mul_valid,
    input               flush,//    为高表示取消乘法
    input               mulw,//为高表示是 32 位乘法
    input   [1:0]       mul_signed,//2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    input   [63:0]      multiplicand,
    input   [63:0]      multiplier,
    output reg          mul_ready,
    output reg          out_valid,
    output reg[63:0]    result_hi,
    output reg[63:0]    result_lo
);
    reg [3:0]   state,next_state;
    reg [127:0] res;
    reg [63:0]  multiplicand_ ;
    reg [31:0]  cycle;
    reg [63:0]  multiplier_temp;
    reg [127:0] multiplicand_temp;
    reg [31:0]  cnt;
    reg [130:0] input_buffer [1:0];
    reg [127:0] out_buffer   [1:0];
    wire [1:0]  hit;
    wire      hit_num;
    wire    multiplier_sign;
    wire    multiplicand_sign;
    parameter IDLE=0,READY=1,RUN=2,FIN=3,RES=4,HIT_RES=5;
    assign multiplier_sign   = (mulw?multiplier[32]  :multiplier[63]  )&& mul_signed[0];
    assign multiplicand_sign = (mulw?multiplicand[32]:multiplicand[63])&& mul_signed[1];
    genvar j;
    integer i;
    generate
        for (j = 0; j< 2;j=j+1 ) begin
            assign hit[j] = ({mulw,mul_signed,multiplicand,multiplier} == input_buffer[j]) ? 1'b1 :1'b0;
        end
    endgenerate

    always @(posedge clk ) begin
        if (rst || flush)  state <= IDLE;
        else  state <= next_state;
    end
    always @(*) begin
        case (state)
            IDLE: if(mul_valid) begin
                next_state = hit > 0 ?HIT_RES: READY;
            end
            else next_state = IDLE;
            READY: next_state = RUN;
            RUN:begin
               if (cnt == cycle)  next_state = FIN;
               else next_state = RUN;
            end
            FIN:next_state = RES;
            RES:next_state = IDLE;
            HIT_RES:next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end
    always @(posedge clk ) begin
        if (rst) begin
            res             <= 'b0;
            multiplier_temp <= 'b0;
            cycle           <= 'b0;
            multiplicand_temp <= 'b0;
            out_valid       <= 'b0;
            cnt             <= 'b0;
            multiplicand_   <= 'b0;
            for (i = 0; i< 2; i=i+1 ) begin
                input_buffer[i] <= 131'b0;
                out_buffer[i]   <= 128'b0;
            end
            result_lo       <= 'b0;
            result_hi       <= 'b0;
            mul_ready       <= 1'b1;
        end
        else begin
            case (next_state)
                IDLE:begin
                    res             <= 'b0;
                    multiplier_temp <= 'b0;
                    cycle           <= 'b0;
                    multiplicand_temp <= 'b0;
                    out_valid       <= 'b0;
                    cnt             <= 'b0;
                    mul_ready       <= 1'b1;
                    multiplicand_   <= 'b0;
                end 
                READY:begin
                    mul_ready       <= 1'b0;
                    cycle            <= mulw?32'd31:32'd63;
                    multiplicand_temp<= mulw?{64'b0,{32{multiplicand_sign}},multiplicand[31:0]}:{{64{multiplicand_sign}},multiplicand};
                    multiplier_temp  <= multiplier;
                    multiplicand_    <= ~multiplicand+1;
                end
                RUN:begin
                    if (multiplier_temp[0]) begin
                        res <= res+multiplicand_temp;
                    end
                    multiplicand_temp <={multiplicand_temp[126:0] ,1'b0};
                    multiplier_temp <= {1'b0,multiplier_temp[63:1]} ;
                    cnt             <= cnt +1;
                end
                FIN:begin
                    if (multiplier_sign ) begin
                        res <= res +(mulw?{65'b0,multiplicand_[31:0],31'b0}:{1'b0,multiplicand_,63'b0});
                    end
                    else begin
                        if (multiplier_temp[0]) begin
                            res <= res+multiplicand_temp;
                        end
                    end
                end
                RES:begin
                    out_valid       <= 1'b1;
                    // result_lo       <= mulw?{{32{res[31]}},res[31:0]}:res[63:0];
                    result_lo       <= mulw?{{32{res[31]}},res[31:0]}:res[63:0];
                    result_hi       <= res[127:64];
                    input_buffer[0] <= {mulw,mul_signed,multiplicand,multiplier};
                    out_buffer  [0] <= {res[127:64],mulw?{{32{res[31]}},res[31:0]}:res[63:0]};
                    input_buffer[1] <= input_buffer[0];
                    out_buffer  [1] <= out_buffer[0];
                end
                HIT_RES:begin
                    out_valid       <= 1'b1;
                    result_lo       <= out_buffer[hit_num][63:0];
                    result_hi       <= out_buffer[hit_num][127:64];
                end
                default: begin end
            endcase
        end
    end
    assign hit_num  =   (hit == 2'h1)? 1'b0 :
                        (hit == 2'h2)? 1'b1 : 1'b0;
endmodule
module ysyx_050369_ctrl (
    input               rst,
    input   [1:0]       i_ex_fence,
    input  [31:0]       i_nxpc,
    input               i_reg_busy,
    input               i_pre_error,
    input   [31:0]      i_mepc    ,
    input   [31:0]      i_metvc  ,
    input               i_ecall_flag,
    input               i_mret_flag,
    input               i_raise_intr,
    input               i_ALU_busy,
    input               i_dcache_stop,
    input               i_icache_stop,
    output reg[3:0]     o_ready,
    output reg [3:0]    o_valid,
    output              o_jump_valid,
    output      [31:0]  o_nxpc,
    output              o_pc_stop

);

    assign  o_jump_valid = i_pre_error || i_ecall_flag || i_raise_intr || i_mret_flag || i_ex_fence[1];
    assign  o_nxpc      =   (i_ecall_flag || i_raise_intr)  ? i_metvc :
                            i_mret_flag                     ? i_mepc  :
                            i_nxpc  ;
    assign  o_pc_stop   = i_ex_fence[0]||i_icache_stop||i_dcache_stop ||i_ALU_busy||(i_reg_busy &&(~o_jump_valid));
    always @(*) begin
        if(rst)begin
            o_ready     = 'b0;
            o_valid     = 'b0;
        end
        else begin
            if (o_jump_valid && i_dcache_stop &&~i_icache_stop) begin
                o_valid = 4'b0111;
            end
            else if (o_jump_valid&&~i_icache_stop) begin
                o_valid = 4'b0011;
            end
            else begin
                o_valid = 4'hf;
            end
            if (i_icache_stop ) begin
                o_ready  = 4'b0000;
            end
            else if (i_dcache_stop ||i_ALU_busy ) begin
                o_ready  = 4'b0001;
            end
            else if (i_reg_busy &&(~o_jump_valid) ) begin
                o_ready  = 4'b0011;
            end
            else begin
                o_ready  = 4'hf;
            end  

        end
    end
    
endmodule
module ysyx_050369_axi_arbiter (
    input       clk,
    input       rst,
    //ifu
    output  [127:0] o_ic_cache_wdata,
    output          o_ic_cache_wen,
    input           i_ic_axi_read,
    input           i_ic_unbrust,
    input   [31 :0] i_ic_raddr,
    input   [2:0]   i_dc_size_t,
    input           i_dc_axi_read ,
    input           i_dc_unbrust,
    input           i_dc_uncache,
    input   [31:0]  i_dc_raddr,
    input   [31:0]  i_dc_waddr,
    input       	i_dc_axi_write,
    input  [31:0]   i_dc_dirty_addr,
    input   [127:0] i_dc_wdata,
    output  [127:0] o_dc_axi_data,
    output          o_dc_axi_wen ,
    output          o_dc_wdone,
    output          o_dc_rdone,
// slave
    //read addr
    input         i_sl_arready,
    output        o_sl_arvalid,
    output  [31:0]o_sl_araddr,
    output  [3:0] o_sl_arid,
    output  [7:0] o_sl_arlen,
    output  [2:0] o_sl_arsize,
    output  [1:0] o_sl_arburst,
    //read data
    output        o_sl_rready,
    input         i_sl_rvalid,
    input [1:0]   i_sl_rresp,
    input [63:0]  i_sl_rdata,
    input         i_sl_rlast,
    input [3:0]   i_sl_rid,
    //write addr
    input         i_sl_awready,
    output        o_sl_awvalid,
    output  [31:0]o_sl_awaddr,
    output  [3:0] o_sl_awid,
    output  [7:0] o_sl_awlen,
    output  [2:0] o_sl_awsize,
    output  [1:0] o_sl_awburst,
    //write data
    input         i_sl_wready,
    output        o_sl_wvalid,
    output [63:0] o_sl_wdata,
    output [7:0]  o_sl_wstrb,
    output        o_sl_wlast,
    //write res
    output        o_sl_bready,
    input         i_sl_bvalid,
    input  [1:0]  i_sl_bresp,
    input  [3:0]  i_sl_bid
);
  	reg ic_axi_read_r;
  	wire ic_axi_read_v;
  	reg dc_axi_write_r;
    wire  [2:0]  size_t;
    wire         axi_read ;
    wire         unbrust;
    wire         uncache;
    wire  [31:0] raddr;
    wire  [31:0] waddr;
    wire         axi_write;
    wire  [31:0] dirty_addr;
    wire  [127:0]wdata;
    wire  [127:0]axi_data;
    wire         axi_wen ;
    wire         wdone;
    wire         rdone;
	always @(posedge clk ) begin
		if (rst) begin
			ic_axi_read_r <= 'b0;
			dc_axi_write_r <= 'b0;
		end
		else begin
			ic_axi_read_r <= i_ic_axi_read;
			if (~ic_axi_read_r) begin
				dc_axi_write_r <= i_dc_axi_write;
			end
		end 
	end
  	assign ic_axi_read_v 	= 	i_ic_axi_read || ic_axi_read_r;
    assign axi_read         =   i_ic_axi_read || i_dc_axi_read;
    assign size_t           =   ic_axi_read_v ? 3'b010        : i_dc_size_t;
    assign unbrust          =   ic_axi_read_v ? i_ic_unbrust  : i_dc_unbrust;
    assign uncache          =   ic_axi_read_v ? 1'b0          : i_dc_uncache;
    assign raddr            =   ic_axi_read_v ? i_ic_raddr    : i_dc_raddr;
    assign o_ic_cache_wdata =   ic_axi_read_v ? axi_data : 'b0;
    assign o_ic_cache_wen   =   ic_axi_read_v && axi_wen  ;
    assign o_dc_axi_data    =   ic_axi_read_v ? 'b0 : axi_data ;
    assign o_dc_axi_wen     =   i_dc_axi_read && ~ic_axi_read_v&& axi_wen;

    assign waddr            =   ic_axi_read_v ?'b0 :i_dc_waddr;
    assign axi_write        =   ic_axi_read_v ?'b0 :(i_dc_axi_write||dc_axi_write_r);
    assign dirty_addr       =   ic_axi_read_v ?'b0 :i_dc_dirty_addr;
    assign wdata            =   ic_axi_read_v ?'b0 :i_dc_wdata;

    assign o_dc_wdone       =   ~ic_axi_read_v &&wdone    ;
    assign o_dc_rdone       =   ~ic_axi_read_v &&rdone    ;
ysyx_050369_cache2axi cache2axi(
    .clk      	(clk),    // Clock
    .rst      	(rst),  // Asynchronous reset active low
    .size_t     (size_t),
    .axi_read   (axi_read),
    .unbrust    (unbrust),
    .uncache    (uncache),
    .i_raddr    (raddr),
    .axi_write  (axi_write),
    .dirty_addr (dirty_addr),
    .i_waddr    (waddr),
    .i_wdata    (wdata),
    .wdone      (wdone),
    .rdone      (rdone),
    .cache_wdata(axi_data),
    .wen      	(axi_wen),

    .i_awready  (i_sl_awready),              
    .o_awvalid  (o_sl_awvalid),
    .o_awaddr   (o_sl_awaddr),
    .o_awid     (o_sl_awid),
    .o_awlen    (o_sl_awlen),
    .o_awsize   (o_sl_awsize),
    .o_awburst  (o_sl_awburst),
    .i_wready   (i_sl_wready),                
    .o_wvalid   (o_sl_wvalid),
    .o_wdata    (o_sl_wdata),
    .o_wstrb    (o_sl_wstrb),    
    .o_wlast    (o_sl_wlast),
    .o_bready   (o_sl_bready),                
    .i_bvalid   (i_sl_bvalid),
    .i_bresp    (i_sl_bresp),                 
    .i_bid      (i_sl_bid),
    .i_arready  (i_sl_arready),                  
    .o_arvalid  (o_sl_arvalid),   
    .o_araddr   (o_sl_araddr),
    .o_arid     (o_sl_arid),
    .o_arlen    (o_sl_arlen),
    .o_arsize   (o_sl_arsize),
    .o_arburst  (o_sl_arburst),
    .o_rready   (o_sl_rready),                  
    .i_rvalid   (i_sl_rvalid),                
    .i_rresp    (i_sl_rresp),
    .i_rdata    (i_sl_rdata),
    .i_rlast    (i_sl_rlast),
    .i_rid      (i_sl_rid)

);

endmodule
module ysyx_050369_icache (
    input             	clk,    // Clock
    input             	rst,  // Asynchronous reset active low
    input [31:0]      	pc,
    output            	pc_stop,
    input             	i_stop,
    input             	flush,
    input               dc_fdone,
    input             	i_pre_jump,
    input [31:0]        i_pre_pc,
    output    [31:0]    o_inst,
    output reg[31:0]    o_pc,
    output reg[31:0]    o_pre_pc,
    output reg          o_pre_jump,

`ifdef ysyx_050369_SOC
	output [5:0]    io_sram4_addr,
	output          io_sram4_cen,
	output          io_sram4_wen,
	output [127:0]  io_sram4_wmask,
	output [127:0]  io_sram4_wdata,
	input [127:0]   io_sram4_rdata,
	output [5:0]    io_sram5_addr,
	output          io_sram5_cen,
	output          io_sram5_wen,
	output [127:0]  io_sram5_wmask,
	output [127:0]  io_sram5_wdata,
	input [127:0]   io_sram5_rdata,
	output [5:0]    io_sram6_addr,
	output          io_sram6_cen,
	output          io_sram6_wen,
	output [127:0]  io_sram6_wmask,
	output [127:0]  io_sram6_wdata,
	input [127:0]   io_sram6_rdata,
	output [5:0]    io_sram7_addr,
	output          io_sram7_cen,
	output          io_sram7_wen,
	output [127:0]  io_sram7_wmask,
	output [127:0]  io_sram7_wdata,
	input [127:0]   io_sram7_rdata,
`endif
    input  [127:0]  cache_wdata,
    input           cache_wen,
    output          axi_read,
    output          unbrust,
    output [31:0 ]  ic_raddr

);
wire channl0_hit,channl1_hit,channl2_hit,channl3_hit;
wire data_hit;
wire [127:0] inst_data_cache;
wire [31:0] inst_data_temp;
reg  [31:0] de_inst;
wire [5:0]  idx;
wire [21:0] tag;
wire        pc_valid;
////////////////////////////////
//cache中的信息包含
///////////////////////////////
reg [22:0] channl_tag  [63:0][3:0];
reg [1:0]  count       [63:0];
///////////////////////////////
// ///////////////////////////////
wire[3:0]   wen;
reg [3:0]   hit;
reg       de_stop;
always @(posedge clk ) begin
	if(rst || flush)begin
		de_stop <= 'b0;
	end
	else begin
		de_stop <= i_stop || pc_stop;
	end
end
///////////////////////////////////
//////第一个周期的数据处理
///////////////////////////////////

assign idx         = pc[9:4];//16
assign tag         = pc[31:10];
assign channl0_hit = channl_tag[idx][0]=={1'b1,tag} ;
assign channl1_hit = channl_tag[idx][1]=={1'b1,tag} ;
assign channl2_hit = channl_tag[idx][2]=={1'b1,tag} ;
assign channl3_hit = channl_tag[idx][3]=={1'b1,tag} ;
assign data_hit    = channl0_hit||channl1_hit||channl2_hit||channl3_hit;

assign wen[0]    = (cache_wen&&(count[idx]==2'b00))?1'b0:1'b1;
assign wen[1]    = (cache_wen&&(count[idx]==2'b01))?1'b0:1'b1;
assign wen[2]    = (cache_wen&&(count[idx]==2'b10))?1'b0:1'b1;
assign wen[3]    = (cache_wen&&(count[idx]==2'b11))?1'b0:1'b1;
integer  i;
always @(posedge clk ) begin
	if (rst || dc_fdone) begin
		for (i =0 ; i<64 ; i=i+1) begin
			channl_tag[i][0] <= 23'b0;
			channl_tag[i][1] <= 23'b0;
			channl_tag[i][2] <= 23'b0;
			channl_tag[i][3] <= 23'b0;
			count        [i] <= 2'b0;
		end
	end
	else begin
		if (cache_wen) begin
			channl_tag[idx][count[idx]] <= {1'b1,tag};
			count [idx]         <= count[idx] + 1;
		end
	end
end


///////////////////////////////////
//////第二个周期的数据处理
///////////////////////////////////

assign inst_data_cache =hit[0] ? io_sram4_rdata :
                        hit[1] ? io_sram5_rdata :
                        hit[2] ? io_sram6_rdata :
                        hit[3] ? io_sram7_rdata : 'b0;

            
// assign inst_data_temp  = inst_data_cache >> {o_pc[3:0],3'b0};
assign inst_data_temp = (~o_pc[3] && ~o_pc[2]) ?  inst_data_cache[31:0]:
						(~o_pc[3] &&  o_pc[2]) ?  inst_data_cache[63:32]:
						( o_pc[3] && ~o_pc[2]) ?  inst_data_cache[95:64]:
                        inst_data_cache[127:96];

always @(posedge clk ) begin
  	if(rst||flush) begin
		o_pc          <= 'b0;
		o_pre_jump    <= 'b0;
		o_pre_pc      <= 'b0;
		de_inst       <= 'b0;
		hit           <= 'b0;
  	end else begin
    	if (~i_stop  ) begin
			o_pc      <= pc;
			hit       <= {channl3_hit,channl2_hit,channl1_hit,channl0_hit};
		/////////////////////////////
			o_pre_jump  <= i_pre_jump;
			o_pre_pc    <= i_pre_pc  ;
		end
		if (~de_stop) begin
			de_inst   <= inst_data_temp;
		end
  	end
end
assign pc_valid  = |pc;
assign pc_stop   = (pc_valid && (~data_hit) || cache_wen )&&  ~flush;
assign o_inst    = (~de_stop)?inst_data_temp:de_inst ;
assign axi_read  = ~data_hit && pc_valid && ~flush; 
assign ic_raddr  = pc; 
assign unbrust   = ~pc[31];  

`ifndef ysyx_050369_SOC
    wire  [5:0]    io_sram4_addr; 
	wire           io_sram4_cen ;
	wire           io_sram4_wen ;
	wire  [127:0]  io_sram4_wmask;
	wire  [127:0]  io_sram4_wdata;
	wire [127:0]   io_sram4_rdata;
	wire  [5:0]    io_sram5_addr;
	wire           io_sram5_cen;
	wire           io_sram5_wen;
	wire  [127:0]  io_sram5_wmask;
	wire  [127:0]  io_sram5_wdata;
  	wire [127:0]   io_sram5_rdata;
    wire  [5:0]    io_sram6_addr;
	wire           io_sram6_cen;
	wire           io_sram6_wen;
	wire  [127:0]  io_sram6_wmask;
	wire  [127:0]  io_sram6_wdata;
	wire [127:0]   io_sram6_rdata;
    wire  [5:0]    io_sram7_addr;
	wire           io_sram7_cen;
	wire           io_sram7_wen;
	wire  [127:0]  io_sram7_wmask;
	wire  [127:0]  io_sram7_wdata;
	wire [127:0]   io_sram7_rdata;
   S011HD1P_X32Y2D128_BW Icache0(
        .Q      (io_sram4_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram4_cen), 
        .WEN    (io_sram4_wen), 
        .BWEN   (io_sram4_wmask), 
        .A      (io_sram4_addr), 
        .D      (io_sram4_wdata)
    );
   S011HD1P_X32Y2D128_BW Icache1(
        .Q      (io_sram5_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram5_cen), 
        .WEN    (io_sram5_wen), 
        .BWEN   (io_sram5_wmask), 
        .A      (io_sram5_addr), 
        .D      (io_sram5_wdata)
    );
   S011HD1P_X32Y2D128_BW Icache2(
        .Q      (io_sram6_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram6_cen), 
        .WEN    (io_sram6_wen), 
        .BWEN   (io_sram6_wmask), 
        .A      (io_sram6_addr), 
        .D      (io_sram6_wdata)
    );
   S011HD1P_X32Y2D128_BW Icache3(
        .Q      (io_sram7_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram7_cen), 
        .WEN    (io_sram7_wen), 
        .BWEN   (io_sram7_wmask), 
        .A      (io_sram7_addr), 
        .D      (io_sram7_wdata)
    );
`endif 
// assign io_sram4_addr    = wen[0]?data_idx:idx;
assign io_sram4_addr    = idx;
assign io_sram4_cen     = 1'b0; 
assign io_sram4_wen     = wen[0];
assign io_sram4_wmask   = 'b0; 
assign io_sram4_wdata   = cache_wdata;  
assign io_sram5_addr    = idx;
assign io_sram5_cen     = 1'b0;
assign io_sram5_wen     = wen[1];
assign io_sram5_wmask   = 'b0;   
assign io_sram5_wdata   = cache_wdata;   
assign io_sram6_addr    = idx;
assign io_sram6_cen     = 1'b0; 
assign io_sram6_wen     = wen[2];
assign io_sram6_wmask   = 'b0;  
assign io_sram6_wdata   = cache_wdata;  
assign io_sram7_addr    = idx;
assign io_sram7_cen     = 1'b0;
assign io_sram7_wen     = wen[3];
assign io_sram7_wmask   = 'b0; 
assign io_sram7_wdata   = cache_wdata;  

endmodule
module ysyx_050369_if (
    input               clk,
    input               rst,
    input       [31:0]  pc_reg,
    input       [31:0]  pre_pc,
    input               pre_jump,
    input               i_stop,
    input               i_ctrl_jump,
    input               dc_fdone,
    output      [31:0]  o_inst,
    output      [31:0]  o_pc_reg,
    output      [31:0]  o_pre_pc,
    output              o_pre_jump,
    output              o_icache_stop,
`ifdef ysyx_050369_SOC
	output [5:0]    io_sram4_addr,
	output          io_sram4_cen,
	output          io_sram4_wen,
	output [127:0]  io_sram4_wmask,
	output [127:0]  io_sram4_wdata,
	input [127:0]   io_sram4_rdata,
	output [5:0]    io_sram5_addr,
	output          io_sram5_cen,
	output          io_sram5_wen,
	output [127:0]  io_sram5_wmask,
	output [127:0]  io_sram5_wdata,
	input [127:0]   io_sram5_rdata,
	output [5:0]    io_sram6_addr,
	output          io_sram6_cen,
	output          io_sram6_wen,
	output [127:0]  io_sram6_wmask,
	output [127:0]  io_sram6_wdata,
	input [127:0]   io_sram6_rdata,
	output [5:0]    io_sram7_addr,
	output          io_sram7_cen,
	output          io_sram7_wen,
	output [127:0]  io_sram7_wmask,
	output [127:0]  io_sram7_wdata,
	input [127:0]   io_sram7_rdata,
`endif
    input  [127:0]  cache_wdata,
    input           cache_wen,
    output          axi_read,
    output          unbrust,
    output [31:0]   ic_raddr

    
);
ysyx_050369_icache icache(
    .clk        	(clk),    // Clock
    .rst        	(rst),  // Asynchronous reset active low
    .pc         	(pc_reg),
    .pc_stop    	(o_icache_stop),
    .i_stop     	(i_stop),    
    .flush      	(i_ctrl_jump),
    .dc_fdone   	(dc_fdone),
    .i_pre_pc   	(pre_pc),
    .i_pre_jump 	(pre_jump),
    .o_pre_pc   	(o_pre_pc),
    .o_pre_jump 	(o_pre_jump),
    .o_inst     	(o_inst),
    .o_pc       	(o_pc_reg),
`ifdef ysyx_050369_SOC
    .io_sram4_addr  (io_sram4_addr),
    .io_sram4_cen   (io_sram4_cen),
    .io_sram4_wen   (io_sram4_wen),
    .io_sram4_wmask (io_sram4_wmask),
    .io_sram4_wdata (io_sram4_wdata),
    .io_sram4_rdata (io_sram4_rdata),
    .io_sram5_addr  (io_sram5_addr),
    .io_sram5_cen   (io_sram5_cen),
    .io_sram5_wen   (io_sram5_wen),
    .io_sram5_wmask (io_sram5_wmask),
    .io_sram5_wdata (io_sram5_wdata),
    .io_sram5_rdata (io_sram5_rdata),
    .io_sram6_addr  (io_sram6_addr),
    .io_sram6_cen   (io_sram6_cen),
    .io_sram6_wen   (io_sram6_wen),
    .io_sram6_wmask (io_sram6_wmask),
    .io_sram6_wdata (io_sram6_wdata),
    .io_sram6_rdata (io_sram6_rdata),
    .io_sram7_addr  (io_sram7_addr),
    .io_sram7_cen   (io_sram7_cen),
    .io_sram7_wen   (io_sram7_wen),
    .io_sram7_wmask (io_sram7_wmask),
    .io_sram7_wdata (io_sram7_wdata),
    .io_sram7_rdata (io_sram7_rdata),
`endif 
    .cache_wdata    (cache_wdata),
    .cache_wen      (cache_wen),
    .axi_read       (axi_read),
    .unbrust        (unbrust),
    .ic_raddr       (ic_raddr)
);

endmodule
module ysyx_050369_pc_reg(
    input               clk,
    input               rst,
    input  [31:0]       i_nxpc,
    input               i_stop,
    input               i_jump,
    input               pre_jump,
    input  [31:0]       pre_pc,
    output reg [31:0]   pc

);
    always@(posedge clk) begin
        if(rst)begin
    `ifdef ysyx_050369_SOC
            pc <= 32'h30000000;
    `else
            pc <= 32'h80000000;
    `endif
        end
        else if (i_stop) begin
            pc <= pc;
        end
        else if(i_jump)  begin
            pc <= i_nxpc;
        end
        else if (pre_jump)begin
            pc <= pre_pc;
        end
        else begin
            pc <= pc+4;
        end
    end

endmodule
module ysyx_050369_next_pc (
    input           rst,
    input [2:0]     Branch,
    input [31:0]    pc,
    input [31:0]    imm,
    input [31:0]    src1,
    input           less,
    input           op_eq,
    output [31:0]   nxpc,
    output          jump_valid

);
    wire  PcA;
    wire  PcB;//Pca控制pc或src1，pcb控制imm或者4
    wire  op_neq;
    wire  nless;
    wire  djump;
    wire [4:0] Branch_ctrl;
    assign op_neq = ~op_eq;
    assign nless  = ~less;
    assign djump  = Branch[1] || Branch[0];
    assign Branch_ctrl[0] = (~Branch[2]      );
    assign Branch_ctrl[1] = (Branch ==	3'b100);
    assign Branch_ctrl[2] = (Branch ==	3'b101);
    assign Branch_ctrl[3] = (Branch ==	3'b110);
    assign Branch_ctrl[4] = (Branch ==	3'b111);
	// wire  res_or;
	// assign  res_or =|res;
    assign PcA  =   ~Branch[2] && Branch[1] && ~Branch[0];
	assign PcB  =   (Branch_ctrl[0]  &  djump ) |
                    (Branch_ctrl[1]  &  op_eq ) |
                    (Branch_ctrl[2]  &  op_neq) |
                    (Branch_ctrl[3]  &  less  ) |
                    (Branch_ctrl[4]  &  nless ) ;
    // (Branch ==	3'b100)?  op_eq :
	// 			 (Branch ==	3'b101)?  ~op_eq:
	// 			 (Branch ==	3'b110)?  less  :
	// 			 (Branch ==	3'b111)? ~less  :(Branch[1] || Branch[0]);
    assign jump_valid = PcA || PcB;
    assign nxpc = rst?32'h80000000:((PcA?src1:pc)+(PcB?imm:32'h4));
endmodule
module ysyx_050369_csr_reg (
    input           clk,
    input           rst,
    input           csr_wen,
    input [11:0]    csr_waddr,
    input [63:0]    csr_wdata,
    input [11:0]    csr_raddr,
    output reg[63:0]csr_rdata,
    input [31:0]    i_ex_nxpc,
    input           i_pc_stop,
    input           mret_flag,
    input           i_ctime,
    input           i_cmsip,
    input           i_cext,
    input           i_ecall_flag,
    input [31:0]    i_ecall_pc,
    output[31:0]    o_metvc,
    output[31:0]    o_mepc,
    output          timer_valid,
    output          raise_intr
    
);
`define ysyx_050369_MEIP   11
`define ysyx_050369_MSIP   3
`define ysyx_050369_MTIP   7

    wire        ctime;
    wire        cmsip;
    wire        cext;
    reg [63:0]  mepc;
    reg [63:0]  mcause;
    reg [63:0]  mstatus;
    reg [63:0]  metvc;
    reg [15:0]  mie;
    reg [15:0]  mip;
    reg [31:0]  ex_nxpc_r;
    wire    pre_valid;
    assign pre_valid = ~(csr_wen && (csr_waddr==`ysyx_050369_CSR_MSTATUS) && (~csr_wdata[3]));
    always @(posedge clk) begin
        if (rst)  ex_nxpc_r <= 'b0;
        else      ex_nxpc_r <= (i_ex_nxpc[31:4]==0)?ex_nxpc_r:i_ex_nxpc;
    end
    always @(posedge clk) begin
        if (rst) begin
            mstatus <= 64'ha00001800;
            mcause  <= 'b0;
            mepc    <= 'b0;
            metvc   <= 'b0;
            mie     <= 'b0;
            mip     <= 'b0;
        end
        else if(csr_wen) begin
            case (csr_waddr)
                `ysyx_050369_CSR_MEPC:    mepc    <= csr_wdata;
                `ysyx_050369_CSR_MCAUSE:  mcause  <= csr_wdata;
                `ysyx_050369_CSR_MSTATUS: mstatus <= csr_wdata;
                `ysyx_050369_CSR_MTVEC:   metvc   <= csr_wdata;
                `ysyx_050369_MIE:         mie     <= csr_wdata[15:0];     
                `ysyx_050369_MIP:         mip     <= csr_wdata[15:0];
                default: begin end
            endcase
        end
        else begin
            if (i_ctime || i_cmsip || i_cext ) begin
                mip <= {mip[15:12],i_cext,mip[10:8],i_ctime,mip[6:4],i_cmsip,mip[2:0]};
            end
            else begin
                mip <= 'b0;
            end
            if ((raise_intr || i_ecall_flag) && ~i_pc_stop ) begin
                mepc    <=  i_ecall_flag?{32'b0,i_ecall_pc}:{32'b0,i_ecall_pc[31:4]==0?ex_nxpc_r:i_ex_nxpc};
                case ({i_ecall_flag , ctime , cmsip , cext})
                    4'b1000: mcause <= 64'd11;
                    4'b0100: mcause <= 64'h8000_0000_0000_0007;
                    4'b0010: mcause <= 64'h8000_0000_0000_0003;
                    4'b0001: mcause <= 64'h8000_0000_0000_000b;
                    default: mcause <= 64'h0;
                endcase
                mstatus[7] <= mstatus[3];
                mstatus[3] <= 1'b0 ;
            end
            else if (mret_flag) begin
                mstatus[3] <= mstatus[7];
                mstatus[7] <= 1'b1 ;
            end

        end 
    end

    always @(*) begin
        case (csr_raddr)
            `ysyx_050369_CSR_MSTATUS:csr_rdata = mstatus    ;
            `ysyx_050369_CSR_MTVEC  :csr_rdata = metvc      ;
            `ysyx_050369_CSR_MEPC   :csr_rdata = mepc       ;
            `ysyx_050369_CSR_MCAUSE :csr_rdata = mcause     ;
            `ysyx_050369_MIE        :csr_rdata = {48'b0,mie}; 
            `ysyx_050369_MIP        :csr_rdata = {48'b0,mip};
            default: csr_rdata =64'b0;
        endcase
    end

    assign timer_valid  = mstatus[3] && mie[`ysyx_050369_MTIP] && pre_valid;
    assign o_metvc    	= metvc[31:0];
    assign o_mepc     	= mepc[31:0];
    assign ctime        = mie[`ysyx_050369_MTIP] && i_ctime;//定时中断
    assign cmsip        = mie[`ysyx_050369_MSIP] && i_cmsip;
    assign cext         = mie[`ysyx_050369_MEIP] && i_cext;//外部终端
  // always @(posedge clk ) begin
  //  if(rst) raise_intr <= 'b0;
  //  else raise_intr   <= (ctime | cmsip | cext) && mstatus[3]&& pre_valid && (~i_pc_stop);
  // end
    assign raise_intr   = (ctime | cmsip | cext) && mstatus[3]&& pre_valid ;
endmodule
module ysyx_050369_wb (
    input            clk,
    input            rst,
    input            wb_ready,
    input            as_valid,
`ifndef ysyx_050369_SOC
    input [31:0]     i_pc,
    input            i_dev,
`endif
    input [63:0]     i_reg_wdata,
    input            i_reg_wen,
    input [4:0]      i_reg_waddr,
    input [4:0]      i_rs1,
    input [4:0]      i_rs2,
    output [63:0]    o_rd1,
    output [63:0]    o_rd2
);
    // wire mret_flag;
`ifndef ysyx_050369_SOC
    reg [31:0]  pc,inst;
    reg         dev;
`endif 
    reg [4:0]   reg_waddr;
    reg         reg_wen;
    wire [63:0] rd1,rd2;
    reg  [63:0] wdata;
    wire reg_wen_w;
    assign o_rd1 = ((|i_rs1)&&(i_rs1 == reg_waddr)&&reg_wen)?wdata:rd1;
    assign o_rd2 = ((|i_rs2)&&(i_rs2 == reg_waddr)&&reg_wen)?wdata:rd2;
`ifdef ysyx_050369_SOC
    assign reg_wen_w = reg_wen &&(wb_ready);
`else
    assign reg_wen_w = reg_wen &&o_run;
`endif 
    always @(posedge clk) begin
        if (rst || ~as_valid) begin
            wdata       <= 'b0;
            reg_wen     <= 'b0;
            reg_waddr   <= 'b0;
        `ifndef ysyx_050369_SOC
            pc          <=  32'h80000000;
            inst        <= 'b0;
            dev         <= 'b0;
        `endif 
        end
        else begin
            if (wb_ready) begin
                wdata       <= i_reg_wdata;
                reg_wen     <= i_reg_wen;
                reg_waddr   <= i_reg_waddr;
            `ifndef ysyx_050369_SOC
                pc          <= i_pc;
                inst        <= i_inst;
                dev         <= i_dev;
            `endif
            end
            
        end

    end
    RegisterFile ysyx_050369_reg_file(
        .clk        (clk),
        .wen        (reg_wen_w),
        .wdata      (wdata),
        .waddr      (reg_waddr),
        .raddra     (i_rs1),
        .raddrb     (i_rs2),    
        .rdata      (rd1),
        .rdatab     (rd2)
    );


`ifndef ysyx_050369_SOC
    reg      device_en1;
    wire o_run,o_device_en;
    wire device_en;
    assign o_run = (i_pc!=pc)&&(pc>32'h80000000)&&wb_ready;
    wire [31:0] inst_reg [4:0];
    import "DPI-C" function void get_inst(input logic [31:0] a0[]);
    assign   inst_reg[0] = inst;
    assign   inst_reg[1] = pc;
    assign   inst_reg[2] = i_pc;
    assign   inst_reg[3] = {31'b0,device_en};
    assign   inst_reg[4] = {31'b0,o_run};
    // assign   inst_reg[4] = {31'b0,o_raise_intr};
    always @(posedge clk ) begin
        get_inst(inst_reg);
    end 
    always @(posedge clk ) begin
        if (rst) begin
            device_en1 <= 'b0;
        end
        else begin
            device_en1 <= device_en;
        end
    end
    assign o_device_en = device_en||device_en1;
    assign device_en  =dev;
`endif
    
endmodule
module ysyx_050369_id(
    input               clk,
    input               rst,
    input               id_ready,
    input               if_valid,
    input               i_ex_fence,
    input    [31:0]     i_pc,
    input    [31:0]     i_inst,
    input    [31:0]     i_pre_pc,
    input               i_pre_jump,
    output   [31:0]     o_pre_pc,
    output              o_pre_jump,
    output   [31:0]     o_pc,
    output   [4 :0]     o_rs1,
    output   [4 :0]     o_rs2,
    output   [4 :0]     o_rd,
    output              o_RegWr,
    output    [1:0]     o_ALUAsrc,
    output    [2:0]     o_ALUBsrc,
    output    [5:0]     o_ALUctr , 
    output    [2:0]     o_Branch ,
    output              o_MemtoReg ,
    output              o_MemWr ,
    output    [63:0]    o_imm,
    output    [7:0]     o_rmask,
    output    [7:0]     o_wmask,
    output              o_csr_wen,
    output              o_ecall_flag,
    output              o_mret_flag,
    output              o_fence_flag

);
    reg [31:0]    inst,pc;
    reg [31:0]    pre_pc;
    reg           pre_jump;
    wire   [2:0]  ExtOP;
    always @(posedge clk) begin
        if (rst || i_ex_fence || ~if_valid) begin
            inst     <= 32'b0;
            pc       <= 32'b0;
            pre_pc   <= 32'b0;
            pre_jump <= 1'b0;
        end
        else if (id_ready) begin
            inst     <= i_inst    ;
            pc       <= i_pc      ;
            pre_pc   <= i_pre_pc  ;
            pre_jump <= i_pre_jump;
        end
    end 
    assign o_pre_pc    = pre_pc;
    assign o_pre_jump  = pre_jump;
    assign o_pc        = pc;
    ysyx_050369_decoder ysyx_050369_decoder(
        .inst       (inst),
        .rs1        (o_rs1),
        .rs2        (o_rs2),
        .rd         (o_rd),
        .ExtOP      (ExtOP),
        .RegWr      (o_RegWr),
        .ALUAsrc    (o_ALUAsrc),
        .ALUBsrc    (o_ALUBsrc),
        .ALUctr     (o_ALUctr),
        .Branch     (o_Branch),
        .MemtoReg   (o_MemtoReg),
        .MemWr      (o_MemWr),
        .wmask      (o_wmask),
        .rmask      (o_rmask),
        .csr_wen    (o_csr_wen),
        .ecall_flag (o_ecall_flag),
        .mret_flag  (o_mret_flag),
        .fence_flag (o_fence_flag) 
    );
    ysyx_050369_imm   ysyx_050369_res_imm(
        .ExtOP  (ExtOP),
        .inst   (inst),
        .imm    (o_imm)
    );

endmodule
module ysyx_050369_decoder(
    input       [31:0]  inst,
    output      [4:0]   rs1,
    output      [4:0]   rs2,
    output      [4:0]   rd,
    output      [2:0]   ExtOP,
    output              RegWr,
    output      [1:0]   ALUAsrc,
    output      [2:0]   ALUBsrc,
    output      [5:0]   ALUctr,
    output      [2:0]   Branch,
    output              MemtoReg,
    output              MemWr,
    output      [7:0]   rmask,
    output      [7:0]   wmask,
    output              csr_wen,
    output              ecall_flag,
    output              mret_flag,
    output              fence_flag
);

wire [3:0] mask_flag;
wire r_type   ;
wire rw_type  ;
wire iw_type  ;
wire i_type   ;
wire s_type   ;
wire l_type   ;
wire jal_type ;
wire jalr_type;
wire b_type   ;
wire auipc    ;
wire lui      ;
wire m_type   ;
wire mw_type  ;
wire csr_type ;
wire [5:0]  i_ALUctr;
wire [5:0]  r_ALUctr;
wire [5:0]  m_ALUctr;
wire [5:0]  csr_ALUctr;
wire  [2 :0]  func3;
wire  [6 :0]  func7;
wire  [6 :0]  op_code;
assign r_type   = (op_code  == `ysyx_050369_TYPE_R_M  )&& (~func7[0]);
assign rw_type  = (op_code  == `ysyx_050369_TYPE_R_MW )&& (~func7[0]);
assign m_type   = (op_code  == `ysyx_050369_TYPE_R_M  )&& ( func7[0]);
assign mw_type  = (op_code  == `ysyx_050369_TYPE_R_MW )&& ( func7[0]);
assign iw_type  = (op_code  == `ysyx_050369_TYPE_IW   )              ;
assign i_type   = (op_code  == `ysyx_050369_TYPE_I    )              ;
assign s_type   = (op_code  == `ysyx_050369_TYPE_S    )              ;
assign l_type   = (op_code  == `ysyx_050369_TYPE_L    )              ;
assign jal_type = (op_code  == `ysyx_050369_JAL       )              ;
assign jalr_type= (op_code  == `ysyx_050369_JALR      )              ;
assign b_type   = (op_code  == `ysyx_050369_TYPE_B    )              ;
assign auipc    = (op_code  == `ysyx_050369_AUIPC     )              ;
assign lui      = (op_code  == `ysyx_050369_LUI       )              ;
assign csr_type = (op_code  == `ysyx_050369_TYPE_CSR  )&& (func3 != 0); 
assign ecall_flag  = inst==`ysyx_050369_ECALL;
assign mret_flag   = inst==`ysyx_050369_MRET;
assign fence_flag  = inst==`ysyx_050369_FENCE;
assign  op_code= inst[6:0];
assign  func3  = inst[14:12];
assign  func7  = inst[31:25];

assign  rs1    = (jal_type  || lui || auipc)? 'b0 : inst[19:15];
assign  rs2    = (r_type    || rw_type || m_type || mw_type || s_type || b_type )?inst[24:20]:'b0 ;
assign  rd     = (b_type    || s_type ) ?5'b0: inst[11:7];

assign RegWr    = ~(b_type   || s_type  || op_code == 0);
assign ALUAsrc  =   csr_type? 2'b10: 
                    (jal_type || jalr_type || auipc)?2'b01:2'b00;
assign MemtoReg =  l_type;
assign rmask    =  l_type?{func3[2],3'b0,mask_flag}:8'b0;
assign MemWr    =  s_type;
assign wmask    =  s_type?{4'b0,mask_flag}:8'b0;

assign csr_wen  = (csr_type && (func3[1:0]==2'b01 || (func3[1] == 1 && rs1 != 0)))?1'b1:1'b0;

assign ExtOP    =   (i_type || iw_type || l_type || jalr_type || csr_type) ? `ysyx_050369_imm_I :
                    (r_type || rw_type || m_type || mw_type )   ? `ysyx_050369_imm_R :
                    s_type                                      ? `ysyx_050369_imm_S :
                    b_type                                      ? `ysyx_050369_imm_B :
                    jal_type                                    ? `ysyx_050369_imm_J :
                    (lui || auipc)                              ? `ysyx_050369_imm_U : 'b0;

assign Branch   =   jal_type ?  3'b001 :
                    jalr_type?  3'b010 :
                    b_type   ?  {1'b1,func3[2],func3[0]} : 'b0;

assign ALUBsrc  =   (i_type || iw_type || l_type || s_type || lui || auipc ) ? 3'b001:
                    (jal_type || jalr_type )                                 ? 3'b010:
                     csr_type                                                ? {~func3[2],func3[2],1'b1} : 'b0;

assign i_ALUctr =   (~func3[2] &&func3[1]             )?{func3[0],2'b10,func3[2:1],1'b0} :
                    ( func3[2] &&func3[0] && ~func3[1])?{1'b0    ,func7[5],1'b0,func3} :
                    {3'b0,func3};
assign r_ALUctr =   i_ALUctr | {1'b0,~(|func3)&&func7[5],4'b0};
assign m_ALUctr =   {1'b0,func3[2]&&~func3[0],1'b1,func3[2:1],func3[0]&&~func3[2]};
assign csr_ALUctr=  {func3[0]&&func3[1],2'b0,func3[1],1'b1,func3[0]};
assign ALUctr   =   i_type    ? i_ALUctr              :
                    iw_type   ? {1'b1,i_ALUctr[4:0]}  :
                    r_type    ? r_ALUctr              :
                    m_type    ? m_ALUctr              :
                    rw_type   ? {1'b1,r_ALUctr[4:0]}  : 
                    mw_type   ? {1'b1,m_ALUctr[4:0]}  :
                    csr_type  ? csr_ALUctr            :
                    b_type   ? {func3[1],1'b1,2'b0,func3[2],1'b0} :
                    lui      ? 6'b000011 : 'b0 ;
                    

assign  mask_flag = (func3[1:0] == 2'b00)? 4'h1:
                    (func3[1:0] == 2'b01)? 4'h3:
                    (func3[1:0] == 2'b10)? 4'h7:
                    (func3[1:0] == 2'b11)? 4'hf:'b0;

endmodule
module ysyx_050369_imm(
    input  [2:0]    ExtOP,
    input  [31:0]   inst,
    output [63:0]   imm
);


wire [31:0]imm_I,imm_B,imm_U,imm_J,imm_S;
assign imm_I={{20{inst[31]}},inst[31:20]};
assign imm_U={              inst[31:12],12'b0};
assign imm_S={{20{inst[31]}},inst[31:25],inst[11:7]};
assign imm_J={{12{inst[31]}},inst[19:12], inst[20], inst[30:21], 1'b0};
assign imm_B={{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};
assign imm[31:0]=(ExtOP == `ysyx_050369_imm_I) ? imm_I :
                (ExtOP == `ysyx_050369_imm_U) ? imm_U :
                (ExtOP == `ysyx_050369_imm_S) ? imm_S :
                (ExtOP == `ysyx_050369_imm_B) ? imm_B :
                (ExtOP == `ysyx_050369_imm_J) ? imm_J :32'b0;
assign imm[63:32] = {32{inst[31]}};
endmodule
module ysyx_050369_reg_sb ( 
    //reg_data
    input [4:0]  i_id_rs1,
    input [4:0]  i_id_rs2,
        //form ex
    input        i_ex_wen,
    input [4:0]  i_ex_waddr,
    input [63:0] i_ex_wdata,
    input        i_ex_mem2reg,
    input [31:0] i_ex_memraddr,
    input        i_as0_wen,
    input [4:0]  i_as0_waddr,
    input [63:0] i_as0_wdata,
    input        i_as0_memren,
    input        i_as1_wen,
    input [4:0]  i_as1_waddr,
    input [63:0] i_as1_wdata,
    input        i_as1_memren,
    input [31:0] i_as1_memraddr,
        //form wb
    input [63:0] i_rd_1,
    input [63:0] i_rd_2, 
        //to ex
    output[63:0] o_rd1,
    output[63:0] o_rd2,
    output       reg_stop
);
    wire [2:0]rs1_hit;
    wire [2:0]rs1_en;

    assign rs1_hit[0] =  (i_id_rs1 == i_ex_waddr )&& |i_id_rs1;
    assign rs1_hit[1] =  (i_id_rs1 == i_as0_waddr)&& |i_id_rs1;
    assign rs1_hit[2] =  (i_id_rs1 == i_as1_waddr)&& |i_id_rs1;
    assign rs1_en [0] =  i_ex_wen  && rs1_hit[0] &&(~i_ex_mem2reg);
    assign rs1_en [1] =  i_as0_wen && rs1_hit[1] &&(~i_as0_memren);
    assign rs1_en [2] =  i_as1_wen && rs1_hit[2] ;
    assign o_rd1      = rs1_en [0]?i_ex_wdata :
                        rs1_en [1]?i_as0_wdata:
                        rs1_en [2]?i_as1_wdata:
                        i_rd_1;  
    wire [2:0]rs2_hit;
    wire [2:0]rs2_en;
    assign rs2_hit[0] =  (i_id_rs2 == i_ex_waddr ) && |i_id_rs2;
    assign rs2_hit[1] =  (i_id_rs2 == i_as0_waddr) && |i_id_rs2;
    assign rs2_hit[2] =  (i_id_rs2 == i_as1_waddr) && |i_id_rs2;
    assign rs2_en [0] =  i_ex_wen  && rs2_hit[0] &&(~i_ex_mem2reg) ;
    assign rs2_en [1] =  i_as0_wen && rs2_hit[1] &&(~i_as0_memren);
    assign rs2_en [2] =  i_as1_wen && rs2_hit[2] ;
    assign o_rd2      = rs2_en [0]?i_ex_wdata :
                        rs2_en [1]?i_as0_wdata:
                        rs2_en [2]?i_as1_wdata:
                        i_rd_2; 
    wire [1:0]read_done;
    assign read_done[0] =   (i_as1_memren  && rs1_hit[2])?
                            ((i_ex_mem2reg && rs1_hit[0])?
                            ((i_ex_memraddr == i_as1_memraddr  && i_as0_memren )?1'b1:1'b0):1'b0):1'b0;
    assign read_done[1] =   (i_as1_memren  && rs2_hit[2])?
                            ((i_ex_mem2reg && rs2_hit[0])?
                            ((i_ex_memraddr == i_as1_memraddr  && i_as0_memren )?1'b1:1'b0):1'b0):1'b0;
    assign reg_stop =   ((~read_done[0]) && (rs1_hit[0] && (~rs1_en[0])              )) || 
                        ((~read_done[0]) && (rs1_hit[1] && (~rs1_en[0] && ~rs1_en[1] )))|| 
                        ((~read_done[1]) && (rs2_hit[0] && (~rs2_en[0])              )) ||
                        ((~read_done[1]) && (rs2_hit[1] && (~rs2_en[0] && ~rs2_en[1] )));
endmodule
module ysyx_050369_dcache (
    input           clk,
    input           rst,
    input           flush,
    input           i_stop,
    input           i_fence,
    input           i_mem_wen,
    input [31:0]    i_mem_addr,
    input [63:0]    i_mem_wdata,
    input [7 :0]    i_mem_wmask,
    input           i_mem_ren,
    input [7 :0]    i_mem_rmask,
    output reg      o_fdone,
//////////////////////////////////////////
    input  [31:0]   i_pc,
    input           i_reg_wen,
    input [4 :0]    i_reg_waddr,
    input [63:0]    i_reg_res,
    input           i_ctreg_valid,
    input [63:0]    i_ctreg_data,
    output    [63:0]o_reg_wdata, 
    output reg      o_reg_wen, 
    output reg[4:0] o_reg_waddr,
    output reg      o_mem_ren,
    output reg[31:0]o_mem_raddr,
`ifdef ysyx_050369_SOC
	output [5:0]    io_sram0_addr,
	output          io_sram0_cen,
	output          io_sram0_wen,
	output [127:0]  io_sram0_wmask,
	output [127:0]  io_sram0_wdata,
	input [127:0]   io_sram0_rdata,
	output [5:0]    io_sram1_addr,
	output          io_sram1_cen,
	output          io_sram1_wen,
	output [127:0]  io_sram1_wmask,
	output [127:0]  io_sram1_wdata,
	input [127:0]   io_sram1_rdata,
	output [5:0]    io_sram2_addr,
	output          io_sram2_cen,
	output          io_sram2_wen,
	output [127:0]  io_sram2_wmask,
	output [127:0]  io_sram2_wdata,
	input [127:0]   io_sram2_rdata,
	output [5:0]    io_sram3_addr,
	output          io_sram3_cen,
	output          io_sram3_wen,
	output [127:0]  io_sram3_wmask,
	output [127:0]  io_sram3_wdata,
	input [127:0]   io_sram3_rdata,
`else
    output reg[31:0]o_pc, 
`endif 
    output     [2:0]size_t,
    output          axi_read ,
    output          unbrust,
    output          uncache,
    output  [31:0]  i_raddr,
    output  [31:0]  i_waddr,
    output      	axi_write,
    output    [31:0]dirty_addr,
    output  [127:0] i_wdata,

    input   [127:0] i_axi_data,
    input           i_axi_wen ,
    input           wdone,
    input           rdone,
    output          axi_stop
);

`ifndef ysyx_050369_SOC
    wire  [5:0]    io_sram0_addr;
	wire           io_sram0_cen;
	wire           io_sram0_wen;
	wire  [127:0]  io_sram0_wmask;
	wire  [127:0]  io_sram0_wdata;
	wire  [127:0]  io_sram0_rdata;
	wire  [5:0]    io_sram1_addr;
	wire           io_sram1_cen;
	wire           io_sram1_wen;
	wire  [127:0]  io_sram1_wmask;
	wire  [127:0]  io_sram1_wdata;
	wire  [127:0]  io_sram1_rdata;
    wire  [5:0]    io_sram2_addr;
	wire           io_sram2_cen;
	wire           io_sram2_wen;
	wire  [127:0]  io_sram2_wmask;
	wire  [127:0]  io_sram2_wdata;
	wire  [127:0]  io_sram2_rdata;
    wire  [5:0]    io_sram3_addr;
	wire           io_sram3_cen;
	wire           io_sram3_wen;
	wire  [127:0]  io_sram3_wmask;
	wire  [127:0]  io_sram3_wdata;
	wire  [127:0]  io_sram3_rdata;
    reg            mem_wen;
    reg   [31:0]   mem_waddr;
  
`else
    reg [31:0] o_pc;
`endif 
	reg          	o_dev;
	wire [3:0]   	offset;
	wire [5:0]   	idx;
	wire [21:0]  	tag;
	reg  [7  :0]   	mem_rmask;
	reg          	de_ctreg_valid;
	reg  [63 :0]   	de_ctreg_data;
	reg  [63 :0]   	reg_wdata;
	reg  [127:0]  	wdata ;
	reg  [31 :0]  	i_de_pc;
	reg  [31 :0]  	dev_done_pc;
	reg  [3  :0]   	de_hit;
	reg  [63 :0]   	de_mem_rdata;
	reg          	de_stop;
	reg  [63 :0]   	mem_rdata;
	reg  [31 :0] 	de_pc;
	reg  [63 :0] 	dev_data;
	reg          	de_fence;
	wire         	channl0_hit;
	wire         	channl1_hit;
	wire         	channl2_hit;
	wire         	channl3_hit;
	wire         	data_hit;
	wire [3  :0]   	hit;
	wire [7  :0]   	mask;
	wire         	data_dirty;
	wire         	dev;
	wire [3  :0]   	wen;
	wire         	mem_en;
	wire [127:0] 	cache_wmask;
	wire [127:0] 	cache_wdata;
	wire         	i_pc_update;
	wire         	dev_done;
	wire [3  :0]   	cache_wen ;
	wire [63 :0]  	slv_wdate;
	wire [63 :0]  	cache_wmask_t;
	wire [191:0]	mem_rdata_cache;
	wire [63 :0] 	mem_rdata_temp;
	wire         	o_pc_update ;
	wire [63 :0] 	o_mem_rdata;
	wire       		fence_en;
	reg  [3  :0]   	fstate,fnstate;
	reg  [5  :0]   	idx_cnt;
	reg  [1  :0]   	chnl_cnt;
	reg  [127:0] 	fdata;
	reg         	fwen;
always @(posedge clk ) begin
    if (rst) begin
        i_de_pc <= 'b0;
        dev_done_pc <= 'b0;
    end
    else begin
        i_de_pc <= i_pc;
        if (i_pc_update) begin
            dev_done_pc <= 'b0;
        end
        else if (uncache&&(i_mem_ren&&rdone)||(i_mem_wen&&wdone)) begin
            dev_done_pc <= i_pc;
        end
    end
end
assign i_pc_update = i_pc != i_de_pc;
assign dev_done = dev_done_pc == i_pc;
assign mem_en =   i_mem_ren||i_mem_wen;
////////////////////////////////
//cache中的信息包含
///////////////////////////////
reg [21:0] channl_tag [63:0][3:0];
reg [3:0]  valid [63:0];
reg [3:0]  dirty [63:0] ;
reg [1:0]  count [63:0];
integer  i;
always @(posedge clk ) begin
  	if (rst) begin
		for (i =0 ; i<64 ; i=i+1) begin
		channl_tag[i][0] <= 22'b0;
		channl_tag[i][1] <= 22'b0;
		channl_tag[i][2] <= 22'b0;
		channl_tag[i][3] <= 22'b0;
		valid        [i] <= 4'b0;
		count        [i] <= 2'b0;
		dirty[i]       <= 4'b0;
		end
    end
    else begin
		if (i_axi_wen&&~uncache) begin
			channl_tag[idx][count[idx]] <= tag;
			valid [idx][count[idx]]     <= 1'b1;
			dirty [idx][count[idx]]     <= 1'b0;
			count [idx]         <= count[idx] + 1;
		end
        if (~dev&&i_mem_wen&&~i_stop) begin
            dirty[idx]<=dirty[idx] | hit;
        end
    end
end

///////////////////////////////
//////////////////////////////
///////////////////////////////
//第一周期负责解析出各种信息
///////////////////////////////
assign offset      = i_mem_addr[3:0];
assign idx         = i_mem_addr[9:4];
assign tag         = i_mem_addr[31:10];
assign mask        = i_mem_wen?i_mem_wmask:i_mem_rmask;
assign hit       = {channl3_hit,channl2_hit,channl1_hit,channl0_hit};
assign channl0_hit = channl_tag[idx][0]==tag && valid[idx][0];
assign channl1_hit = channl_tag[idx][1]==tag && valid[idx][1];
assign channl2_hit = channl_tag[idx][2]==tag && valid[idx][2];
assign channl3_hit = channl_tag[idx][3]==tag && valid[idx][3];
assign data_hit    = channl0_hit||channl1_hit||channl2_hit||channl3_hit;

assign wen[0]    = (i_axi_wen&&(~count[idx][1] && ~count[idx][0]))?1'b0:1'b1;
assign wen[1]    = (i_axi_wen&&(~count[idx][1] &&  count[idx][0]))?1'b0:1'b1;
assign wen[2]    = (i_axi_wen&&( count[idx][1] && ~count[idx][0]))?1'b0:1'b1;
assign wen[3]    = (i_axi_wen&&( count[idx][1] &&  count[idx][0]))?1'b0:1'b1;
assign data_dirty  = dirty[idx][count[idx]];
assign cache_wen   = (~dev&&i_mem_wen)?(~hit):4'hf;
assign cache_wdata = {64'b0,i_mem_wdata}<<{offset,3'b0};
assign cache_wmask = ({64'b0,cache_wmask_t}<<{offset,3'b0}) ^ 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;

assign axi_stop    = (~i_ctreg_valid&&mem_en&&((~uncache&&~data_hit)||(uncache&&(~dev_done && mem_en))));
`ifdef ysyx_050369_SOC
assign dev         = (mem_en&&(tag[21]==1'h1 || tag[21:18]==4'h3))?1'b0:1'b1;
assign unbrust     = ~tag[21] ;
`else
assign dev         = (mem_en&&(tag[21:18]!=4'h8))?1'b1:1'b0;
assign unbrust     = tag[21:18]!=4'h8;
`endif
assign  dirty_addr =( count[idx]==2'b00)?( fence_en?{channl_tag[idx_cnt][chnl_cnt],idx_cnt,4'b0}:{channl_tag[idx][0],idx,4'b0}):
                    ( count[idx]==2'b01)?( fence_en?{channl_tag[idx_cnt][chnl_cnt],idx_cnt,4'b0}:{channl_tag[idx][1],idx,4'b0}):
                    ( count[idx]==2'b10)?( fence_en?{channl_tag[idx_cnt][chnl_cnt],idx_cnt,4'b0}:{channl_tag[idx][2],idx,4'b0}):
                    ( fence_en?{channl_tag[idx_cnt][chnl_cnt],idx_cnt,4'b0}:{channl_tag[idx][3],idx,4'b0});
assign cache_wmask_t[63:32] = mask[3]?32'hffffffff:'b0;
assign cache_wmask_t[31:16] = mask[2]?16'hffff:'b0;
assign cache_wmask_t[15:8 ] = mask[1]?8'hff:'b0;
assign cache_wmask_t[7 :0 ] = mask[0]?8'hff:'b0;
assign size_t = mask[3] ? 3'h3:
                mask[2] ? 3'h2:
                mask[1] ? 3'h1: 3'h0;

///////////////////////////////
////第二周期判断是否为cache数据，发送读写命令，
///////////////////////////////

always @(posedge clk ) begin
  if(rst)begin
    de_stop <= 'b0;
  end
  else begin
    de_stop <= i_stop;
  end
end
always @(posedge clk ) begin
    if (rst||flush || o_fdone) begin
        o_dev          <= 'b0;
        de_hit          <= 'b0;
        reg_wdata       <= 'b0;
        o_reg_wen       <= 'b0;
        o_reg_waddr     <= 'b0;
        o_pc            <= 'b0;
        o_mem_ren       <= 'b0;
        o_mem_raddr     <= 'b0;
        de_pc           <= 'b0;
        de_ctreg_valid  <= 'b0;
        de_ctreg_data   <= 'b0;
        mem_rmask       <= 'b0;
        dev_data        <= 'b0;
        de_fence        <= 'b0;
    de_mem_rdata  <= 'b0;
    end
    else begin
        if (~i_stop) begin
            de_hit          <= hit;
            o_dev           <= dev;
            reg_wdata       <= i_reg_res ;
            o_reg_wen       <= i_reg_wen;
            o_reg_waddr     <= i_reg_waddr;
            o_pc            <= i_pc;
            o_mem_raddr     <= i_mem_addr;
            o_mem_ren       <= i_mem_ren;
            de_ctreg_valid  <= i_ctreg_valid;
            de_ctreg_data   <= i_ctreg_data;
            mem_rmask       <= i_mem_rmask;
            dev_data        <= i_axi_data[63:0];
            de_fence        <= i_fence;
        end
        de_pc <= o_pc;
        if (~de_stop) begin
            de_mem_rdata<= o_dev?i_axi_data[63:0]:mem_rdata;
        end
    end
end

assign mem_rdata_cache[127:0]=  de_hit[0]? io_sram0_rdata :
                                de_hit[1]? io_sram1_rdata :
                                de_hit[2]? io_sram2_rdata :
                                de_hit[3]? io_sram3_rdata : 'b0;
assign mem_rdata_cache[191:128] = 0;

assign  mem_rdata_temp  = mem_rdata_cache[({1'b0,o_mem_raddr[3:0],3'b0})+:64];

always @(*) begin
    case (mem_rmask)
        8'h01 : mem_rdata = {{56{mem_rdata_temp[ 7]}},mem_rdata_temp[ 7:0]};
        8'h03 : mem_rdata = {{48{mem_rdata_temp[15]}},mem_rdata_temp[15:0]};
        8'h07 : mem_rdata = {{32{mem_rdata_temp[31]}},mem_rdata_temp[31:0]};
        8'h0f : mem_rdata =                           mem_rdata_temp[63:0] ;
        8'h81 : mem_rdata = {56'b0                   ,mem_rdata_temp[ 7:0]};
        8'h83 : mem_rdata = {48'b0                   ,mem_rdata_temp[15:0]};
        8'h87 : mem_rdata = {32'b0                   ,mem_rdata_temp[31:0]};
        default: mem_rdata = 'b0;
    endcase
end
assign o_pc_update      = (o_pc!= de_pc);
assign o_mem_rdata      =   de_ctreg_valid  ?de_ctreg_data  :
                            (o_dev          ?dev_data       : 
                            (o_pc_update    ?mem_rdata:de_mem_rdata));
assign o_reg_wdata      = o_mem_ren ?o_mem_rdata : reg_wdata ;

//////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////fence_i 指令部分
//////////////////////////////////////////////////////////////////////////////////////////////

`ifdef ysyx_050369_SOC
parameter FIDLE=0 ,CHNL0 = 1,CHNL1=2,CHNL2=3,CHNL3=4,READ_CACHE=5,WRITE=6,FIN=7,FDONE=8;
assign slv_wdate =  mask[3]?i_mem_wdata:
                    mask[2]?{2{i_mem_wdata[31:0]}}:
                    mask[1]?{4{i_mem_wdata[15:0]}}:
                    mask[0]?{8{i_mem_wdata[7:0]}}:'b0;

assign fence_en = fnstate > FIDLE;
always @(posedge clk) begin
    if (rst) fstate <= FIDLE;
    else     fstate <= fnstate;
end
always @(*) begin
    case (fstate)
        FIDLE: fnstate = de_fence?CHNL0:FIDLE;
        CHNL0,CHNL1,CHNL2,CHNL3:begin
            if (dirty[idx_cnt][chnl_cnt]) begin
                fnstate = READ_CACHE;
            end
            else if (chnl_cnt==2'b11 && idx_cnt==6'd63) begin
                fnstate = FDONE;
            end
            else begin
                case (chnl_cnt)
                    2'b00:fnstate = CHNL0;
                    2'b01:fnstate = CHNL1;
                    2'b10:fnstate = CHNL2;
                    2'b11:fnstate = CHNL3;
                endcase
            end
        end  
        READ_CACHE: fnstate = WRITE;
        WRITE:      fnstate = wdone?FIN:WRITE;
        FIN:begin 
            if (chnl_cnt==2'b11 && idx_cnt==6'd63) begin
                fnstate = FDONE;
            end
            else begin
                case (chnl_cnt)
                    2'b00:fnstate = CHNL0;
                    2'b01:fnstate = CHNL1;
                    2'b10:fnstate = CHNL2;
                    2'b11:fnstate = CHNL3;
                endcase
            end
            
        end
        FDONE:fnstate = FIDLE;
        default: fnstate = FIDLE;
    endcase
end
always @(posedge clk ) begin 
  if(rst) begin
    idx_cnt <= 'b0;
        fdata   <= 'b0;
        fwen    <= 'b0;
        chnl_cnt<= 'b0;
        o_fdone <= 'b0;
  end 
    else begin
    case (fnstate)
      FIDLE:begin
                idx_cnt <= 'b0;
                fdata   <= 'b0;
                fwen    <= 'b0;
                chnl_cnt<= 'b0;
                o_fdone <= 'b0;
            end
      CHNL0,CHNL1,CHNL2,CHNL3:begin 
                if (idx_cnt == 6'd63 && chnl_cnt != 2'b11) begin
                    chnl_cnt <= chnl_cnt + 1;
                    idx_cnt  <= 6'h0;
                end
        else if (~dirty[idx_cnt][chnl_cnt]) begin
          idx_cnt <= idx_cnt + 1;
        end
      end
      READ_CACHE:begin 
        
      end
      WRITE:begin 
        fwen <= 1'b1;
                case (chnl_cnt)
                    2'b00:fdata <= io_sram0_rdata;
                    2'b01:fdata <= io_sram1_rdata;
                    2'b10:fdata <= io_sram2_rdata;
                    2'b11:fdata <= io_sram3_rdata;
                endcase
      end
      FIN:begin 
                fwen <= 1'b0;
                if (idx_cnt == 6'd63 && chnl_cnt != 2'b11) begin
                    chnl_cnt <= chnl_cnt + 1;
                    idx_cnt  <= 6'h0;
                end
                else if(idx_cnt != 6'd63 || chnl_cnt != 2'b11) begin
                    idx_cnt <= idx_cnt + 1; 
                end
      end
            FDONE: begin
                o_fdone <= 1'b1;
            end
      default : begin end/* default */
    endcase
  end
end
`else
    assign fence_en = 1'b0;
    assign slv_wdate     = i_mem_wdata;
`endif 




`ifdef ysyx_050369_SOC
assign uncache  = ~fence_en&&tag[21]!=1'b1&&tag[21:18]!=4'h3;
assign i_wdata  =  fence_en?fdata:(uncache?{64'b0,slv_wdate}:wdata);
assign axi_read =  fence_en?1'b0:( ~i_ctreg_valid&&((~uncache && (~data_hit) && mem_en) 
                                                  ||( uncache && i_mem_ren   && i_pc_update)));
                
assign axi_write=  fence_en?(fwen&&(~wdone)) :(~i_ctreg_valid&&((~uncache  && data_dirty && (~data_hit)&& mem_en)
                                                   			 	||(uncache  && i_mem_wen  && i_pc_update)));
assign i_raddr  = uncache?{tag,idx,offset}:{tag,idx,4'b0};
assign i_waddr  = fence_en?{channl_tag[idx_cnt][chnl_cnt],idx_cnt,4'b0}:(uncache?{tag,idx,offset}:data_dirty?dirty_addr:{tag,idx,4'b0});

`else


assign uncache  = tag[21:18]!=4'h8 ;
assign i_wdata  =  uncache?{64'b0,slv_wdate}:wdata;
assign axi_read =  ~i_ctreg_valid  &&((~uncache && (~data_hit) && mem_en) 
                                    ||( uncache && i_mem_ren   && ~rdone && ~dev_done));
                
assign axi_write=  ~i_ctreg_valid &&((~uncache  && data_dirty && (~data_hit)&& mem_en)
                                    ||(uncache  && i_mem_wen  && ~wdone &&  ~dev_done));
assign i_raddr  = uncache?{tag,idx,offset}:{tag,idx,4'b0};
assign i_waddr  = uncache?{tag,idx,offset}:data_dirty?dirty_addr:{tag,idx,4'b0};

`endif 
always @(*) begin
    case (count[idx])
        2'b00 : wdata = io_sram0_rdata;
        2'b01 : wdata = io_sram1_rdata;
        2'b10 : wdata = io_sram2_rdata;
        2'b11 : wdata = io_sram3_rdata;
        default: wdata = 'b0;
    endcase
end

`ifndef ysyx_050369_SOC
   S011HD1P_X32Y2D128_BW Icache0(
        .Q      (io_sram0_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram0_cen), 
        .WEN    (io_sram0_wen), 
        .BWEN   (io_sram0_wmask), 
        .A      (io_sram0_addr), 
        .D      (io_sram0_wdata)
    );
   S011HD1P_X32Y2D128_BW Icache1(
        .Q      (io_sram1_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram1_cen), 
        .WEN    (io_sram1_wen), 
        .BWEN   (io_sram1_wmask), 
        .A      (io_sram1_addr), 
        .D      (io_sram1_wdata)
    );
   S011HD1P_X32Y2D128_BW Icache2(
        .Q      (io_sram2_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram2_cen), 
        .WEN    (io_sram2_wen), 
        .BWEN   (io_sram2_wmask), 
        .A      (io_sram2_addr), 
        .D      (io_sram2_wdata)
    );
   S011HD1P_X32Y2D128_BW Icache3(
        .Q      (io_sram3_rdata), 
        .CLK    (clk), 
        .CEN    (io_sram3_cen), 
        .WEN    (io_sram3_wen), 
        .BWEN   (io_sram3_wmask), 
        .A      (io_sram3_addr), 
        .D      (io_sram3_wdata)
    );
`endif

assign io_sram0_addr    = fence_en?idx_cnt:idx;
assign io_sram0_cen     = 'b0;
assign io_sram0_wen     = i_axi_wen?(uncache?1'b1:wen[0]):(uncache?1'b1:cache_wen[0]);
//dev?1'b1:(axi_wreq?axi_wen[0]:cache_wen[0]);
assign io_sram0_wmask   = i_axi_wen?'b0:cache_wmask;
assign io_sram0_wdata   = i_axi_wen?i_axi_data:cache_wdata;
assign io_sram1_addr    = fence_en?idx_cnt:idx;
assign io_sram1_cen     = 'b0;
assign io_sram1_wen     = i_axi_wen?(uncache?1'b1:wen[1]):(uncache?1'b1:cache_wen[1]);
assign io_sram1_wmask   = i_axi_wen?'b0:cache_wmask;
assign io_sram1_wdata   = i_axi_wen?i_axi_data:cache_wdata;
assign io_sram2_addr    = fence_en?idx_cnt:idx;
assign io_sram2_cen     = 'b0;
assign io_sram2_wen     = i_axi_wen?(uncache?1'b1:wen[2]):(uncache?1'b1:cache_wen[2]);
assign io_sram2_wmask   = i_axi_wen?'b0:cache_wmask;
assign io_sram2_wdata   = i_axi_wen?i_axi_data:cache_wdata;
assign io_sram3_addr    = fence_en?idx_cnt:idx;
assign io_sram3_cen     = 'b0;
assign io_sram3_wen     = i_axi_wen?(uncache?1'b1:wen[3]):(uncache?1'b1:cache_wen[3]);
assign io_sram3_wmask   = i_axi_wen?'b0:cache_wmask;
assign io_sram3_wdata   = i_axi_wen?i_axi_data:cache_wdata;

endmodule
module ysyx_050369_as (
    input         clk,
    input         rst,
    input         as_ready,
    input         ex_valid,
    input         i_fence,
    output        o_fdone,
    // input         wb2as_ready,
    input  [31:0] i_pc,
    input         i_reg_wen,
    input [4 :0]  i_reg_waddr,
    input [63:0]  i_reg_res,
    input         i_mem_wen,
    input [31:0]  i_mem_addr,
    input [63:0]  i_mem_wdata,
    input [7 :0]  i_mem_wmask,
    input         i_mem_ren,
    input [7 :0]  i_mem_rmask,
    input [63:0]  i_ctreg_data,
    output   [31:0] o_mem_raddr, 
    output          o_mem_ren, 
    

    output   [63:0] o_reg_wdata, 
    output          o_reg_wen, 
    output   [4:0]  o_reg_waddr,
//to reg sb
    output          o_as0_wen,
    output [4:0]    o_as0_waddr,
    output [63:0]   o_as0_wdata,
    output          o_as0_memren,
`ifdef ysyx_050369_SOC
    output [5:0]    io_sram0_addr,
	output          io_sram0_cen,
	output          io_sram0_wen,
	output [127:0]  io_sram0_wmask,
	output [127:0]  io_sram0_wdata,
	input [127:0]   io_sram0_rdata,
	output [5:0]    io_sram1_addr,
	output          io_sram1_cen,
	output          io_sram1_wen,
	output [127:0]  io_sram1_wmask,
	output [127:0]  io_sram1_wdata,
	input [127:0]   io_sram1_rdata,
    output [5:0]    io_sram2_addr,
	output          io_sram2_cen,
	output          io_sram2_wen,
	output [127:0]  io_sram2_wmask,
	output [127:0]  io_sram2_wdata,
	input [127:0]   io_sram2_rdata,
    output [5:0]    io_sram3_addr,
	output          io_sram3_cen,
	output          io_sram3_wen,
	output [127:0]  io_sram3_wmask,
	output [127:0]  io_sram3_wdata,
	input [127:0]   io_sram3_rdata,
`else 
    output   [31:0] o_pc, 
    
`endif 
    ///////////////////////////////////
    output  [2:0]   size_t,
    output          axi_read ,
    output          unbrust,
    output          uncache,
    output  [31:0]  dc_raddr,
    output  [31:0]  dc_waddr,
    output      	axi_write,
    output [31:0]   dirty_addr,
    output  [127:0] dc_wdata,

    input   [127:0] i_axi_data,
    input           i_axi_wen ,
    input           wdone,
    input           rdone,
    output          axi_stop
);
    reg [31:0]  pc;
    reg         reg_wen;
    reg [4 :0]  reg_waddr;
    reg [63:0]  reg_res;
    reg         mem_wen;
    reg [31:0]  mem_addr;
    reg [63:0]  mem_wdata;
    reg [7 :0]  mem_wmask;
    reg         mem_ren;
    reg [7 :0]  mem_rmask;
    reg [63:0]  ctreg_data;
    wire    ctreg_valid;
    wire    stop_dcache;
    always @(posedge clk) begin
        if (rst || ~ex_valid) begin
            mem_wen     <= 'b0;
            mem_addr   <= 'b0;
            mem_wdata   <= 'b0;
            mem_wmask   <= 'b0;
            mem_ren     <= 'b0;
            mem_rmask   <= 'b0;
            pc          <= 'b0;
            reg_wen     <= 'b0;
            reg_waddr   <= 'b0;
            reg_res     <= 'b0;
            ctreg_data  <= 'b0;
        end
        else  begin
            if (as_ready) begin
                reg_wen     <= i_reg_wen;
                reg_waddr   <= i_reg_waddr;
                reg_res     <= i_reg_res;
                mem_wen     <= i_mem_wen;
                mem_addr    <= i_mem_addr;
                mem_wdata   <= i_mem_wdata;
                mem_wmask   <= i_mem_wmask;
                mem_ren     <= i_mem_ren;
                mem_rmask   <= i_mem_rmask;
                pc          <= i_pc;
                ctreg_data  <= i_ctreg_data;
            end
        end
    end
    assign o_as0_wen    = reg_wen; 
    assign o_as0_waddr  = reg_waddr;
    assign o_as0_wdata  = reg_res;
    assign o_as0_memren = mem_ren;
    assign ctreg_valid =( mem_addr[31:16] == 16'h200);
    assign stop_dcache = ~as_ready;
ysyx_050369_dcache ysyx_0369_dcache(
    .clk            (clk),
    .rst            (rst),
    .flush          (1'b0),
    .i_stop         (stop_dcache),
    .i_fence        (i_fence),
    .i_mem_wen      (mem_wen),
    .i_mem_addr     (mem_addr),
    .i_mem_wdata    (mem_wdata),
    .i_mem_wmask    (mem_wmask),
    .i_mem_ren      (mem_ren),
    .i_mem_rmask    (mem_rmask),
    .o_fdone        (o_fdone),
    .i_pc           (pc),
    .i_reg_wen      (reg_wen),
    .i_reg_waddr    (reg_waddr),
    .i_reg_res      (reg_res),
    .i_ctreg_valid  (ctreg_valid),
    .i_ctreg_data   (ctreg_data),
    .o_reg_wdata    (o_reg_wdata), 
    .o_reg_wen      (o_reg_wen), 
    .o_reg_waddr    (o_reg_waddr),
    .o_mem_ren      (o_mem_ren),
    .o_mem_raddr    (o_mem_raddr),
`ifdef ysyx_050369_SOC
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

`else 
    .o_pc           (o_pc), 
    
`endif 
  .size_t         (size_t),
    .axi_read       (axi_read),
    .unbrust        (unbrust),
    .uncache        (uncache),
    .i_raddr        (dc_raddr),
    .i_waddr        (dc_waddr),
    .axi_write      (axi_write),
    .dirty_addr     (dirty_addr),
    .i_wdata        (dc_wdata),
    .i_axi_data     (i_axi_data),
    .i_axi_wen      (i_axi_wen),
    .wdone          (wdone),
    .rdone          (rdone),
    .axi_stop       (axi_stop)
);

endmodule
module ysyx_050369_clint (
    input        clk,
    input        rst,
    input        i_timer_valid,
    input        pc_stop,
    input [31:0] mem_addr,
    input [63:0] mem_wdata,
    input        mem_wen,
    input [3:0]  mem_wmask,
    output [63:0] mem_rdata,
    output reg   time_intr,
    output       msip_valid
);
    wire [63:0] CtMask;

    reg [63:0] mtimecmp;
    reg [63:0] mtime;
    reg [31:0] msip;
  wire timer_valid;
    // wire mie;
    // assign mie = i_mstatus[3];
    assign msip_valid = msip[0];
    always @(posedge clk ) begin
        if (rst) begin
            mtimecmp <= 64'b0;
            mtime    <= 64'b0;
            msip     <= 32'b0;
      time_intr <= 1'b0;
        end
        else begin
            if (mem_wen) begin
                case (mem_addr)
                    `ysyx_050369_msip    : msip     <= {msip[31:1],mem_wdata[0] & CtMask[0]};
                    `ysyx_050369_mtimecmp: mtimecmp <= mem_wdata & CtMask;
                    `ysyx_050369_mtime:    mtime    <= mem_wdata & CtMask;
                    default: begin      end
                endcase
            end
      if (timer_valid && ~pc_stop && i_timer_valid) begin
        mtime <='b0;
        time_intr <= 1'b1;
      end
      else if (i_timer_valid) begin
        mtime <= mtime + 1;
        time_intr <= 1'b0;
      end
      else begin
        mtime <= mtime;
        time_intr <= 1'b0;
      end
        end
    end
    assign mem_rdata =  (mem_addr == `ysyx_050369_msip    )? {32'b0,msip}:
                        (mem_addr == `ysyx_050369_mtimecmp)? mtimecmp    :
                        (mem_addr == `ysyx_050369_mtime   )? mtime       : 'b0;
    assign timer_valid = mtime >= mtimecmp;
    assign CtMask  =    mem_wmask[3]? 64'hffff_ffff_ffff_ffff:
                        mem_wmask[2]? 64'h0000_0000_ffff_ffff:
                        mem_wmask[1]? 64'h0000_0000_0000_ffff:
                        mem_wmask[0]? 64'h0000_0000_0000_00ff: 64'hffff_ffff_ffff_ffff;

endmodule
`ifdef ysyx_050369_SOC
module ysyx_050369 (
    input           clock,
    input           reset,
    input           io_interrupt,
    input           io_master_awready, 
    output          io_master_awvalid, 
    output [3:0]    io_master_awid,    
    output [31:0]   io_master_awaddr, 
    output [7:0]    io_master_awlen, 
    output [2:0]    io_master_awsize, 
    output [1:0]    io_master_awburst, 
    input           io_master_wready, 
    output          io_master_wvalid, 
    output [63:0]   io_master_wdata,   
    output [7:0]    io_master_wstrb,   
    output          io_master_wlast,   
    output          io_master_bready,  
    input           io_master_bvalid,  
    input [3:0]     io_master_bid,     
    input [1:0]     io_master_bresp,   
    input           io_master_arready, 
    output          io_master_arvalid, 
    output [3:0]    io_master_arid,    
    output [31:0]   io_master_araddr,  
    output [7:0]    io_master_arlen,   
    output [2:0]    io_master_arsize,  
    output [1:0]    io_master_arburst, 
    output          io_master_rready, 
    input           io_master_rvalid,  
    input [3:0]     io_master_rid,     
    input [1:0]     io_master_rresp,   
    input [63:0]    io_master_rdata,   
    input           io_master_rlast,   
    output          io_slave_awready, 
    input           io_slave_awvalid,
    input [3:0]     io_slave_awid,    
    input [31:0]    io_slave_awaddr,  
    input [7:0]     io_slave_awlen,   
    input [2:0]     io_slave_awsize, 
    input [1:0]     io_slave_awburst, 
    output          io_slave_wready,  
    input           io_slave_wvalid,  
    input [63:0]    io_slave_wdata,   
    input [7:0]     io_slave_wstrb,   
    input           io_slave_wlast,   
    input           io_slave_bready,  
    output          io_slave_bvalid,  
    output [3:0]    io_slave_bid,     
    output [1:0]    io_slave_bresp,   
    output          io_slave_arready, 
    input           io_slave_arvalid, 
    input [3:0]     io_slave_arid,    
    input [31:0]    io_slave_araddr,  
    input [7:0]     io_slave_arlen,   
    input [2:0]     io_slave_arsize,  
    input [1:0]     io_slave_arburst, 
    input           io_slave_rready,  
    output          io_slave_rvalid,  
    output [3:0]    io_slave_rid,     
    output [1:0]    io_slave_rresp,   
    output [63:0]   io_slave_rdata,   
    output          io_slave_rlast,
    output [5:0]    io_sram0_addr,
    output          io_sram0_cen,
    output          io_sram0_wen,
    output [127:0]  io_sram0_wmask,
    output [127:0]  io_sram0_wdata,
    input [127:0]   io_sram0_rdata,
    output [5:0]    io_sram1_addr,
    output          io_sram1_cen,
    output          io_sram1_wen,
    output [127:0]  io_sram1_wmask,
    output [127:0]  io_sram1_wdata,
    input [127:0]   io_sram1_rdata,
    output [5:0]    io_sram2_addr,
    output          io_sram2_cen,
    output          io_sram2_wen,
    output [127:0]  io_sram2_wmask,
    output [127:0]  io_sram2_wdata,
    input [127:0]   io_sram2_rdata,
    output [5:0]    io_sram3_addr,
    output          io_sram3_cen,
    output          io_sram3_wen,
    output [127:0]  io_sram3_wmask,
    output [127:0]  io_sram3_wdata,
    input [127:0]   io_sram3_rdata,
    output [5:0]    io_sram4_addr,
    output          io_sram4_cen,
    output          io_sram4_wen,
    output [127:0]  io_sram4_wmask,
    output [127:0]  io_sram4_wdata,
    input [127:0]   io_sram4_rdata,
    output [5:0]    io_sram5_addr,
    output          io_sram5_cen,
    output          io_sram5_wen,
    output [127:0]  io_sram5_wmask,
    output [127:0]  io_sram5_wdata,
    input [127:0]   io_sram5_rdata,
    output [5:0]    io_sram6_addr,
    output          io_sram6_cen,
    output          io_sram6_wen,
    output [127:0]  io_sram6_wmask,
    output [127:0]  io_sram6_wdata,
    input [127:0]   io_sram6_rdata,
    output [5:0]    io_sram7_addr,
    output          io_sram7_cen,
    output          io_sram7_wen,
    output [127:0]  io_sram7_wmask,
    output [127:0]  io_sram7_wdata,
    input [127:0]   io_sram7_rdata  
);
    assign io_slave_awready = 'b0;
    assign io_slave_wready  = 'b0;    
    assign io_slave_bvalid  = 'b0;   
    assign io_slave_bid     = 'b0;         
    assign io_slave_bresp   = 'b0;    
    assign io_slave_arready = 'b0;  
    assign io_slave_rvalid  = 'b0;   
    assign io_slave_rid     = 'b0;       
    assign io_slave_rresp   = 'b0;     
    assign io_slave_rdata   = 'b0;    
    assign io_slave_rlast   = 'b0;  
    wire          clk;
    wire          rst;   
    assign clk = clock;
    assign rst = reset;  
`else
module ysyx_22050369_cpu (
    input           clk,
    input           rst

);
    wire            io_interrupt;
    wire            io_master_awready; 
    wire            io_master_awvalid; 
    wire   [3:0]    io_master_awid;;    
    wire   [31:0]   io_master_awaddr; 
    wire   [7:0]    io_master_awlen; 
    wire   [2:0]    io_master_awsize; 
    wire   [1:0]    io_master_awburst; 
    wire            io_master_wready; 
    wire            io_master_wvalid; 
    wire   [63:0]   io_master_wdata;   
    wire   [7:0]    io_master_wstrb;   
    wire            io_master_wlast;   
    wire            io_master_bready;  
    wire            io_master_bvalid;  
    wire  [3:0]     io_master_bid;     
    wire  [1:0]     io_master_bresp;   
    wire            io_master_arready; 
    wire            io_master_arvalid; 
    wire   [3:0]    io_master_arid;    
    wire   [31:0]   io_master_araddr;  
    wire   [7:0]    io_master_arlen;   
    wire   [2:0]    io_master_arsize;  
    wire   [1:0]    io_master_arburst; 
    wire            io_master_rready; 
    wire            io_master_rvalid;  
    wire  [3:0]     io_master_rid;     
    wire  [1:0]     io_master_rresp;   
    wire  [63:0]    io_master_rdata;   
    wire            io_master_rlast; 
`endif
 
    wire [31:0]   metvc;
    wire [31:0]   mepc;
    wire          timer_valid;
    wire [31:0]   pre_pc;
    wire          pre_jump;
    wire [31:0]   pc;
    wire          icache_stop;
    wire [3:0]    ready_ctrl;
    wire [3:0]    valid_ctrl;
    wire [1:0]    ex_fence_flag;
    wire      dc_fdone;
    wire [31:0]   ctr_nxpc;
    wire      ctr_stop;
    wire      ctr_jump;
    wire [31:0]     if_inst;
    wire [31:0]     if_pc;
    wire [31:0]     if_pre_pc;
    wire            if_pre_jump;
    wire [127:0]    ic_cache_wdata;
    wire            ic_cache_wen;
    wire            ic_axi_read;
    wire            ic_unbrust;
    wire  [31 :0]   ic_raddr;
    wire  [4 :0]    id_rs1;
    wire  [4 :0]    id_rs2;
    wire  [4 :0]    id_rd;
    wire            id_RegWr;
    wire   [1:0]    id_ALUAsrc;
    wire   [2:0]    id_ALUBsrc;
    wire   [5:0]    id_ALUctr ;
    wire   [2:0]    id_Branch ;
    wire            id_MemtoReg ;
    wire            id_MemWr ;
    wire   [63:0]   id_imm;
    wire   [7:0]    id_rmask;
    wire   [7:0]    id_wmask;
    wire            id_csr_wen;
    wire [31:0]     id_pc;
    wire [31:0]     id_pre_pc;
    wire            id_pre_jump;
    wire            id_ecall;
    wire            id_mret;
    wire            id_fence;
    wire      reg_busy;
    wire [63 :0]    sb_src1;
    wire [63 :0]    sb_src2;
    wire [63 :0]    wb_src1;
    wire [63 :0]    wb_src2;
    wire  [63:0]    csr_rdata;
    wire            raise_intr;
    wire  [31:0]    ex_nxpc;
    wire            ex_ALU_busy;
    wire            ex_jump;
    wire            ex_reg_wen;
    wire  [4 :0]    ex_reg_waddr;
    wire  [63:0]    ex_reg_res;
    wire            ex_csr_wen;
    wire  [11:0]    ex_csr_waddr;
    wire  [63:0]    ex_csr_wdata;
    wire            ex_mem_wen;
    wire  [31:0]    ex_mem_addr;
    wire  [63:0]    ex_mem_wdata;
    wire  [7 :0]    ex_mem_wmask;
    wire  [7 :0]    ex_mem_rmask;
    wire            ex_mem_ren;
    wire [31:0]   ex_pc;
    wire      ex_pre_error;
    wire      timer_flag;
    wire      ex_mret;
    wire      ex_ecall;
    // wire wb2as_ready;
    wire [31:0]   as_mem_raddr;
    wire          as_mem_ren;
    wire [63:0]   as_reg_wdata;
    wire          as_reg_wen;
    wire [4:0]    as_reg_waddr;
    wire [2:0]    dc_size_t;
    wire          dc_axi_read;
    wire          dc_unbrust;
    wire          dc_uncache;
    wire [31:0]   dc_raddr;
    wire [31:0]   dc_waddr;
    wire          dc_axi_write;
    wire [31:0]   dc_dirty_addr;
    wire [127:0]  dc_wdata;
    wire [127:0]  dc_axi_data;
    wire          dc_axi_wen;
    wire          dc_wdone;
    wire          dc_rdone;
    wire            as0_wen;
    wire [4:0]      as0_waddr;
    wire [63:0]     as0_wdata;
    wire            as0_memren;
    wire            dcache_stop; 
`ifndef ysyx_050369_SOC
    wire [31:0] as2wb_pc;
`endif 
    wire [63:0] ctreg_data;
    wire msip_valid;
    ysyx_050369_pc_reg  ysyx_050369_pc_reg(
        .clk        (clk),
        .rst        (rst),
        .i_nxpc     (ctr_nxpc),
        .i_stop     (ctr_stop),
        .i_jump     (ctr_jump),
        .pre_jump   (pre_jump),  
        .pre_pc     (pre_pc),
        .pc         (pc)
    );

    ysyx_050369_if ysyx_050369_ifu(
        .clk           (clk),
        .rst           (rst),
        .pc_reg        (pc),
        .pre_pc        (pre_pc),
        .pre_jump      (pre_jump),
        .i_ctrl_jump   (ctr_jump),
        .i_stop        (ctr_stop),
        .o_inst        (if_inst),
        .o_pc_reg      (if_pc),
        .o_pre_pc      (if_pre_pc),
        .o_pre_jump    (if_pre_jump),
        .dc_fdone      (dc_fdone),
        .o_icache_stop (icache_stop),
`ifdef ysyx_050369_SOC
        .io_sram4_addr  (io_sram4_addr),
        .io_sram4_cen   (io_sram4_cen),
        .io_sram4_wen   (io_sram4_wen),
        .io_sram4_wmask (io_sram4_wmask),
        .io_sram4_wdata (io_sram4_wdata),
        .io_sram4_rdata (io_sram4_rdata),
        .io_sram5_addr  (io_sram5_addr),
        .io_sram5_cen   (io_sram5_cen),
        .io_sram5_wen   (io_sram5_wen),
        .io_sram5_wmask (io_sram5_wmask),
        .io_sram5_wdata (io_sram5_wdata),
        .io_sram5_rdata (io_sram5_rdata),
        .io_sram6_addr  (io_sram6_addr),
        .io_sram6_cen   (io_sram6_cen),
        .io_sram6_wen   (io_sram6_wen),
        .io_sram6_wmask (io_sram6_wmask),
        .io_sram6_wdata (io_sram6_wdata),
        .io_sram6_rdata (io_sram6_rdata),
        .io_sram7_addr  (io_sram7_addr),
        .io_sram7_cen   (io_sram7_cen),
        .io_sram7_wen   (io_sram7_wen),
        .io_sram7_wmask (io_sram7_wmask),
        .io_sram7_wdata (io_sram7_wdata),
        .io_sram7_rdata (io_sram7_rdata),
`endif 
        .cache_wdata    (ic_cache_wdata),
        .cache_wen      (ic_cache_wen),
        .axi_read       (ic_axi_read),
        .unbrust        (ic_unbrust),
        .ic_raddr       (ic_raddr)
    );

    ysyx_050369_id    ysyx_050369_idu(
        .clk            (clk),
        .rst            (rst),
        .i_pc           (if_pc),
        .i_inst         (if_inst),
        .i_pre_pc       (if_pre_pc),
        .i_pre_jump     (if_pre_jump),
        .i_ex_fence     (ex_fence_flag[1]),
        .id_ready       (ready_ctrl[3]),
        .if_valid       (valid_ctrl[3]),
        .o_pc           (id_pc),
        .o_pre_pc       (id_pre_pc),
        .o_pre_jump     (id_pre_jump),
        .o_rs1          (id_rs1),
        .o_rs2          (id_rs2),
        .o_rd           (id_rd),
        .o_RegWr        (id_RegWr),
        .o_ALUAsrc      (id_ALUAsrc),
        .o_ALUBsrc      (id_ALUBsrc),
        .o_ALUctr       (id_ALUctr),
        .o_Branch       (id_Branch),
        .o_MemtoReg     (id_MemtoReg),
        .o_MemWr        (id_MemWr),
        .o_imm          (id_imm),
        .o_wmask        (id_wmask),
        .o_rmask        (id_rmask),
        .o_csr_wen      (id_csr_wen ),
        .o_ecall_flag   (id_ecall),
        .o_mret_flag    (id_mret),
        .o_fence_flag   (id_fence)

    );

    ysyx_050369_ex ysyx_050369_exu(
        .clk            (clk),
        .rst            (rst),
        .ex_ready       (ready_ctrl[2]),
        .id_valid       (valid_ctrl[2]),
        .i_dcache_done  (dc_fdone),
        .i_pc           (id_pc),
        .i_rs1          (id_rs1),
        .i_pre_pc       (id_pre_pc),
        .i_pre_jump     (id_pre_jump),
        .i_src1         (sb_src1),
        .i_src2         (sb_src2), 
        .i_reg_waddr    (id_rd),
        .i_RegWr        (id_RegWr),
        .i_ALUAsrc      (id_ALUAsrc),
        .i_ALUBsrc      (id_ALUBsrc),
        .i_ALUctr       (id_ALUctr),
        .i_Branch       (id_Branch),
        .i_MemtoReg     (id_MemtoReg),
        .i_MemWr        (id_MemWr),
        .i_imm          (id_imm),
        .i_wmask        (id_wmask),
        .i_rmask        (id_rmask),
        .i_csr_wen      (id_csr_wen),
        .i_csr_rdata    (csr_rdata),
        .i_ecall_flag   (id_ecall),
        .i_mret_flag    (id_mret),
        .i_fence_flag   (id_fence),
        .o_pc           (ex_pc),
        .o_reg_wen      (ex_reg_wen),
        .o_reg_waddr    (ex_reg_waddr),
        .o_reg_res      (ex_reg_res),
        .o_ALU_busy     (ex_ALU_busy),
        .o_csr_wen      (ex_csr_wen),
        .o_csr_waddr    (ex_csr_waddr),
        .o_csr_wdata    (ex_csr_wdata),
        .o_pre_error    (ex_pre_error),
        .o_jump_valid   (ex_jump),
        .o_nxpc         (ex_nxpc),
        .o_mem_wen      (ex_mem_wen),
        .o_mem_addr     (ex_mem_addr),
        .o_mem_wdata    (ex_mem_wdata),
        .o_mem_wmask    (ex_mem_wmask),
        .o_mem_ren      (ex_mem_ren),
        .o_mem_rmask    (ex_mem_rmask),
        .o_mret_flag    (ex_mret),
        .o_ecall_flag   (ex_ecall),
        .o_fence_flag   (ex_fence_flag)
    );

    ysyx_050369_as ysyx_050369_as(
        .clk            (clk),
        .rst            (rst),
        .as_ready       (ready_ctrl[1]),
        .ex_valid       (valid_ctrl[1]),
        .i_fence        (ex_fence_flag[1]),
        .o_fdone        (dc_fdone),
        .i_pc           (ex_pc),
        .i_reg_wen      (ex_reg_wen),
        .i_reg_waddr    (ex_reg_waddr),
        .i_reg_res      (ex_reg_res),   
        .i_mem_wen      (ex_mem_wen),
        .i_mem_addr     (ex_mem_addr),
        .i_mem_wdata    (ex_mem_wdata),
        .i_mem_wmask    (ex_mem_wmask),
        .i_mem_ren      (ex_mem_ren),
        .i_mem_rmask    (ex_mem_rmask),
        .i_ctreg_data   (ctreg_data),
        .o_mem_raddr    (as_mem_raddr),
        .o_mem_ren      (as_mem_ren),
        .o_reg_wdata    (as_reg_wdata),
        .o_reg_wen      (as_reg_wen),
        .o_reg_waddr    (as_reg_waddr),
        .o_as0_wen      (as0_wen),
        .o_as0_waddr    (as0_waddr),
        .o_as0_wdata    (as0_wdata),
        .o_as0_memren   (as0_memren),
`ifdef ysyx_050369_SOC
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
`else 
        .o_pc           (as_pc),
        
`endif 
///////////////////////////
        .size_t         (dc_size_t),
        .axi_read       (dc_axi_read),
        .unbrust        (dc_unbrust),
        .uncache        (dc_uncache),
        .dc_raddr       (dc_raddr),
        .dc_waddr       (dc_waddr),
        .axi_write      (dc_axi_write),
        .dirty_addr     (dc_dirty_addr),
        .dc_wdata       (dc_wdata),
        .i_axi_data     (dc_axi_data),
        .i_axi_wen      (dc_axi_wen),
        .wdone          (dc_wdone),
        .rdone          (dc_rdone),
        .axi_stop       (dcache_stop)
    );

    ysyx_050369_clint ysyx_050369_clintu(
        .clk          (clk),
        .rst          (rst),
        .i_timer_valid (timer_valid),
        .pc_stop      (ctr_stop),
        .mem_addr     (ex_mem_addr),
        .mem_wdata    (ex_mem_wdata),
        .mem_wmask    (ex_mem_wmask[3:0]),
        .mem_wen      (ex_mem_wen),
        .mem_rdata    (ctreg_data),
        .time_intr    (timer_flag),
        .msip_valid   (msip_valid)
    );

    ysyx_050369_wb ysyx_050369_wbu(
        .clk            (clk),
        .rst            (rst),
        .wb_ready       (ready_ctrl[0]),
        .as_valid       (valid_ctrl[0]),
    `ifndef ysyx_050369_SOC
        .i_pc           (as_pc),
        .i_dev          (as_dev),
    `endif
        .i_reg_wdata    (as_reg_wdata),
        .i_reg_wen      (as_reg_wen),
        .i_reg_waddr    (as_reg_waddr),
        .i_rs1          (id_rs1),
        .i_rs2          (id_rs2),
        .o_rd1          (wb_src1),
        .o_rd2          (wb_src2)
    );

  ysyx_050369_csr_reg ysyx_050369_csr_regu(
    .clk          (clk),
    .rst          (rst),
    .csr_wen      (ex_csr_wen),
    .csr_waddr    (ex_csr_waddr),
    .csr_wdata    (ex_csr_wdata),
    .csr_raddr    (id_imm[11:0]),
    .csr_rdata    (csr_rdata),
    .i_ctime      (timer_flag)    ,   
    .i_cmsip      (msip_valid),
    .i_cext       (io_interrupt),
    .i_pc_stop    (ctr_stop),
    .i_ecall_flag (ex_ecall),
    .i_ecall_pc   (ex_pc),
    .i_ex_nxpc    (ex_nxpc),
    .o_metvc      (metvc),
    .o_mepc       (mepc),
    .timer_valid  (timer_valid),
    .raise_intr   (raise_intr),
    .mret_flag    (ex_mret)
  );
    ysyx_050369_reg_sb ysyx_050369_reg_sbu( 
        .i_id_rs1       (id_rs1),
        .i_id_rs2       (id_rs2),
        .i_ex_wen       (ex_reg_wen),
        .i_ex_waddr     (ex_reg_waddr),
        .i_ex_wdata     (ex_reg_res),
        .i_ex_mem2reg   (ex_mem_ren),
        .i_ex_memraddr  (ex_mem_addr),
        .i_as0_wen      (as0_wen),
        .i_as0_waddr    (as0_waddr),
        .i_as0_wdata    (as0_wdata),
        .i_as0_memren   (as0_memren),
        .i_as1_wen      (as_reg_wen),
        .i_as1_waddr    (as_reg_waddr),
        .i_as1_wdata    (as_reg_wdata),
        .i_as1_memren   (as_mem_ren),
        .i_as1_memraddr (as_mem_raddr),
        .i_rd_1         (wb_src1),
        .i_rd_2         (wb_src2), 
        .o_rd1          (sb_src1),
        .o_rd2          (sb_src2),
        .reg_stop       (reg_busy)
    );
    ysyx_050369_ctrl ysyx_050369_ctrlu(
        .rst            (rst),
        .i_ex_fence     (ex_fence_flag),
        .i_ecall_flag   (ex_ecall),
        .i_mret_flag    (ex_mret),
        .i_mepc         (mepc),
        .i_metvc        (metvc),
        .i_raise_intr   (raise_intr),
        .i_nxpc         (ex_nxpc),
        .i_pre_error    (ex_pre_error),
        .i_reg_busy     (reg_busy),
        .i_ALU_busy     (ex_ALU_busy),
        .i_dcache_stop  (dcache_stop),
        .i_icache_stop  (icache_stop),
        .o_ready        (ready_ctrl), 
        .o_valid        (valid_ctrl),
        .o_jump_valid   (ctr_jump),
        .o_nxpc         (ctr_nxpc),
        .o_pc_stop      (ctr_stop)

    );

ysyx_050369_pc_pre ysyx_050369_pc_pre(
        .clk            (clk),
        .rst            (rst),
        .i_if_pc        (pc),
        .i_pc_stop      (ctr_stop),
        .i_ex_pc        (ex_pc),
        .i_jump_valid   (ex_jump),
        .i_nxpc         (ctr_nxpc),
        .i_pre_error    (ex_pre_error),
        .o_jump_valid   (pre_jump),
        .o_pc_pre       (pre_pc)
);

ysyx_050369_axi_arbiter ysyx_050369_cache_arbiter(
    .clk            (clk),
    .rst            (rst),
    //ifu
    .o_ic_cache_wdata (ic_cache_wdata),
    .o_ic_cache_wen   (ic_cache_wen),
    .i_ic_axi_read    (ic_axi_read),
    .i_ic_unbrust     (ic_unbrust),
    .i_ic_raddr       (ic_raddr),
    .i_dc_size_t      (dc_size_t),
    .i_dc_axi_read    (dc_axi_read),
    .i_dc_unbrust     (dc_unbrust),
    .i_dc_uncache     (dc_uncache),
    .i_dc_raddr       (dc_raddr),
    .i_dc_waddr       (dc_waddr),
    .i_dc_axi_write   (dc_axi_write),
    .i_dc_dirty_addr  (dc_dirty_addr),
    .i_dc_wdata       (dc_wdata),
    .o_dc_axi_data    (dc_axi_data),
    .o_dc_axi_wen     (dc_axi_wen),
    .o_dc_wdone       (dc_wdone),
    .o_dc_rdone       (dc_rdone),
// slave
    //read addr
    .i_sl_arready   (io_master_arready),
    .o_sl_arvalid   (io_master_arvalid),
    .o_sl_araddr    (io_master_araddr),
    .o_sl_arid      (io_master_arid),
    .o_sl_arlen     (io_master_arlen),
    .o_sl_arsize    (io_master_arsize),
    .o_sl_arburst   (io_master_arburst),
    //read data
    .o_sl_rready    (io_master_rready),
    .i_sl_rvalid    (io_master_rvalid),
    .i_sl_rresp     (io_master_rresp),
    .i_sl_rdata     (io_master_rdata),
    .i_sl_rlast     (io_master_rlast),
    .i_sl_rid       (io_master_rid),
    //write addr
    .i_sl_awready   (io_master_awready),
    .o_sl_awvalid   (io_master_awvalid),
    .o_sl_awaddr    (io_master_awaddr),
    .o_sl_awid      (io_master_awid),
    .o_sl_awlen     (io_master_awlen),
    .o_sl_awsize    (io_master_awsize),
    .o_sl_awburst   (io_master_awburst),
    //write data
    .i_sl_wready    (io_master_wready),
    .o_sl_wvalid    (io_master_wvalid),
    .o_sl_wdata     (io_master_wdata),
    .o_sl_wstrb     (io_master_wstrb),
    .o_sl_wlast     (io_master_wlast),
    //write res
    .o_sl_bready    (io_master_bready),
    .i_sl_bvalid    (io_master_bvalid),
    .i_sl_bresp     (io_master_bresp),
    .i_sl_bid       (io_master_bid)
); 

`ifndef ysyx_050369_SOC
axi_slave slave(
    .clk        (clk),    // Clock
    .rst        (rst),  // Asynchronous reset active low
            //read addr
    .o_arready  (io_master_arready),
    .i_arvalid  (io_master_arvalid),
    .i_araddr   (io_master_araddr),
    .i_arid     (io_master_arid),
    .i_arlen    (io_master_arlen),
    .i_arsize   (io_master_arsize),
    .i_arburst  (io_master_arburst),
        //read data
    .i_rready   (io_master_rready),
    .o_rvalid   (io_master_rvalid),
    .o_rresp    (io_master_rresp),
    .o_rdata    (io_master_rdata),
    .o_rlast    (io_master_rlast),
    .o_rid      (io_master_rid),
        //write addr
    .o_awready  (io_master_awready),
    .i_awvalid  (io_master_awvalid),
    .i_awaddr   (io_master_awaddr),
    .i_awid     (io_master_awid),
    .i_awlen    (io_master_awlen),
    .i_awsize   (io_master_awsize),
    .i_awburst  (io_master_awburst),
        //write data
    .o_wready   (io_master_wready),
    .i_wvalid   (io_master_wvalid),
    .i_wdata    (io_master_wdata),
    .i_wstrb    (io_master_wstrb),
    .i_wlast    (io_master_wlast),
        //write res
    .i_bready   (io_master_bready),
    .o_bvalid   (io_master_bvalid),
    .o_bresp    (io_master_bresp),
    .o_bid      (io_master_bid)
    
);
`endif

endmodule
