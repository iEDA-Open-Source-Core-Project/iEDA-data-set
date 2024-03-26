
/**/
`timescale 1ns / 1ps
  `define YSYX210302_ZERO_WORD         64'h00000000_00000000
  `define YSYX210302_REG_BUS           63 : 0
  `define YSYX210302_PC_START          64'h00000000_30000000
  `define YSYX210302_LEN               63
// 各类命令的opcode
  `define YSYX210302_J_TYPE            7'b1101111
  `define YSYX210302_R_TYPE            7'b0110011
  `define YSYX210302_I_TYPE1           7'b1100111
  `define YSYX210302_I_TYPE2           7'b0000011
  `define YSYX210302_I_TYPE3           7'b0010011
  `define YSYX210302_S_TYPE            7'b0100011
  `define YSYX210302_U_TYPE1           7'b0110111
  `define YSYX210302_U_TYPE2           7'b0010111
  `define YSYX210302_B_TYPE            7'b1100011
  `define YSYX210302_R_TYPEW           7'b0111011
  `define YSYX210302_I_TYPE3W          7'b0011011
  `define YSYX210302_CSR_TYPE1         7'b0001111
  `define YSYX210302_CSR_TYPE2         7'b1110011

// alu类指令的funct3
  `define YSYX210302_ADDI_ADD_SUB 	    3'b000
  `define YSYX210302_SLL_SLLI     	    3'b001
  `define YSYX210302_SLT_SLTI 		    3'b010
  `define YSYX210302_SLTU_STLIU        3'b011
  `define YSYX210302_XOR_XORI          3'b100
  `define YSYX210302_SRL_SRA_SRLI_SRAI 3'b101
  `define YSYX210302_OR_ORI 			3'b110
  `define YSYX210302_AND_ANDI 		    3'b111
// 条件跳转指令的funct3
  `define YSYX210302_BEQ      		    3'b000
  `define YSYX210302_BNE      		    3'b001
  `define YSYX210302_BLT      		    3'b100
  `define YSYX210302_BGE      		    3'b101
  `define YSYX210302_BLTU              3'b110
  `define YSYX210302_BGEU     		    3'b111
// 访存指令的funct3
  `define YSYX210302_LB     		    3'b000
  `define YSYX210302_LH     		    3'b001
  `define YSYX210302_LW     		    3'b010
  `define YSYX210302_LD     		    3'b011
  `define YSYX210302_LBU     		    3'b100
  `define YSYX210302_LHU     		    3'b101
  `define YSYX210302_LWU     		    3'b110


  `define YSYX210302_AXI_ADDR_WIDTH      32
  `define YSYX210302_AXI_DATA_WIDTH      64
  `define YSYX210302_AXI_ID_WIDTH        4
//   `define YSYX210302_AXI_USER_WIDTH      1

  `define YSYX210302_SIZE_B              2'b00
  `define YSYX210302_SIZE_H              2'b01
  `define YSYX210302_SIZE_W              2'b10
  `define YSYX210302_SIZE_D              2'b11

  `define YSYX210302_REQ_READ            1'b0
  `define YSYX210302_REQ_WRITE           1'b1


  `define YSYX210302_CLINT_MTIMECMP_ADDR 32'h02004000
  `define YSYX210302_CLINT_MTIME_ADDR    32'h0200bff8
  `define YSYX210302_APB_END_ADDR        32'h40000000
  `define YSYX210302_UART16550_BEG_ADDR  32'h10000000
  `define YSYX210302_UART16550_END_ADDR  32'h10000fff   
  `define YSYX210302_SPI_FLASH_BEG_ADDR  32'h30000000
  `define YSYX210302_SPI_FLASH_END_ADDR  32'h3fffffff
  `define YSYX210302_MEM_BEG_ADDR        32'h80000000


  `define YSYX210302_AXI_BURST_TYPE_INCR                                 2'b01





/**********************************************模块源代码**************************************************/

module ysyx_210302_alu(
           input  wire [ 5 : 0 ]     EXE_shamt,
           input  wire [ 6 : 0 ]     EXE_funct7,
           input  wire [ `YSYX210302_REG_BUS ]  EXE_op1,
           input  wire [ `YSYX210302_REG_BUS ]  EXE_op2,
           input  wire               EXE_alu_en,
           input  wire               EXE_sub_en,
           input       [63 :  0]     EXE_ext_ui_imm,
           input       [63 :  0]     EXE_myinst_addr, 
           input                     EXE_store_en,

           input  wire               reset,
           input  wire [ 2 : 0 ]     EXE_funct3,
           input  wire [ 6 : 0 ]     EXE_opcode,

           output reg  [63 :  0]     EXE_store_data,
           output reg  [ `YSYX210302_REG_BUS ]  EXE_rd_data);
    
    reg [ 126:0 ] rd_127;
    
   always@( * )
    begin
            EXE_rd_data     = `YSYX210302_ZERO_WORD;
            rd_127          = 127'b0;
            EXE_store_data  = 64'b0;
        if ( reset == 1'b1 )begin
            EXE_rd_data     = `YSYX210302_ZERO_WORD;
            rd_127          = 127'b0;
            EXE_store_data  = 64'b0;

        end
        else if ( EXE_alu_en  == 1'b1 )
        begin
            case( EXE_funct3 )
                `YSYX210302_ADDI_ADD_SUB:begin
                    case( EXE_sub_en )
                    1'b1:begin EXE_rd_data = EXE_op1 - EXE_op2; end
                    1'b0:begin EXE_rd_data = EXE_op1 + EXE_op2; end
                    endcase
                    if ( ( EXE_opcode == `YSYX210302_R_TYPEW ) || ( EXE_opcode == `YSYX210302_I_TYPE3W ) )    // addiw addw
                        EXE_rd_data = { {32{EXE_rd_data[ 31 ]}} , EXE_rd_data[ 31 : 0 ]};
                    
                end
                `YSYX210302_SLL_SLLI: begin EXE_rd_data = EXE_op1 << EXE_shamt;
                if ( ( EXE_opcode == `YSYX210302_R_TYPEW ) || ( EXE_opcode == `YSYX210302_I_TYPE3W ) )    // slliw sllw
                    EXE_rd_data = { {32{EXE_rd_data[ 31 ]}} , EXE_rd_data[ 31 : 0 ]};
                    end
                `YSYX210302_SLT_SLTI:begin
                    if ( EXE_op1[ 63 ] > EXE_op2[ 63 ] )
                        EXE_rd_data = 64'b1;
                    else if ( EXE_op1[ 63 ] == EXE_op2[ 63 ] )
                        if ( ( EXE_op1[ 63 ] & ( EXE_op1[ 62:0 ] < EXE_op2[ 62:0 ] ) ) || ( ~EXE_op1[ 63 ] & ~( EXE_op1[ 62:0 ] >= EXE_op2[ 62:0 ] ) ) )
                            EXE_rd_data = 64'b1;
                        else
                            EXE_rd_data      = 64'b0;
                    else EXE_rd_data = 64'b0;
                        end
                `YSYX210302_SLTU_STLIU:begin
                        if ( EXE_op1 < EXE_op2 ) EXE_rd_data = 64'd1;
                        else EXE_rd_data             = 64'd0;
                        end
                `YSYX210302_XOR_XORI:	begin EXE_rd_data = EXE_op1 ^ EXE_op2; end
                `YSYX210302_SRL_SRA_SRLI_SRAI:begin
                        case ( EXE_funct7 )
                            7'b0100000,7'b0100001: begin
                                if ( EXE_opcode[ 3 ] == 1'b1 )begin
                                    rd_127  = { {95{EXE_op1[ 31 ]}}, EXE_op1[ 31:0 ]} >> EXE_shamt;    // srlw srliw
                                    EXE_rd_data = {{32{rd_127[ 31 ]}},rd_127[ 31:0 ]};
                                end
                                else
                                rd_127  = { {63{EXE_op1[ 63 ]}}, EXE_op1} >> EXE_shamt;    // srl srli
                                EXE_rd_data = rd_127[ 63:0 ];
                            end
                            7'b0000000,7'b0000001: begin    // SRA
                                if ( EXE_opcode[ 3 ] == 1'b1 )begin
                                    rd_127  = { {95{1'b0}} , EXE_op1[ 31:0 ]} >> EXE_shamt;
                                    EXE_rd_data = {{32{rd_127[ 31 ]}},rd_127[ 31:0 ]};    // sraw sraiw
                                end
                                else
                                EXE_rd_data = EXE_op1 >> EXE_shamt;    // sra srai
                            end
                        default:    begin EXE_rd_data = `YSYX210302_ZERO_WORD;end
                        endcase
                        end
                `YSYX210302_OR_ORI:	begin EXE_rd_data = EXE_op1 | EXE_op2; end
                `YSYX210302_AND_ANDI:  begin EXE_rd_data = EXE_op1 & EXE_op2; end
                default:    begin EXE_rd_data = `YSYX210302_ZERO_WORD;rd_127 = rd_127;end
            endcase
        end
        else if ( EXE_opcode[ 6 ] ) begin 
            EXE_rd_data = EXE_myinst_addr +4; // jal jalr
            end 
        else if (  EXE_opcode[ 5 ] & EXE_opcode[ 2 ] ) begin
            EXE_rd_data = EXE_ext_ui_imm; // lui c
        end
        else if ( EXE_opcode[ 2 ] ) begin
            EXE_rd_data = EXE_myinst_addr +EXE_ext_ui_imm; // auipc
        end
        else if (EXE_store_en) begin EXE_store_data = EXE_op2;end
        else begin EXE_rd_data = `YSYX210302_ZERO_WORD; end

     end         
endmodule

module ysyx_210302_axi_arbiter_r (  input                       clk,
	                    input      	                rst,
	                    input                       ar_valid_m0,
	                    input      	                r_ready_m0,
                        input                       r_valid_m0,
                        input                       r_last_m0,
	                    input                       ar_valid_m1,
	                    input      	                r_ready_m1,
                        input                       r_valid_m1,
                        input                       r_last_m1,
                        output                      r_switch_m0,
                             	                    r_switch_m1
 );

    localparam  [1:0]   AXI_MASTER_0    = 2'b01,
					    AXI_MASTER_1    = 2'b10,
                        AXI_MASTER_021  = 2'b00,
                        AXI_MASTER_120  = 2'b11;
    reg         [1:0]   R_curr_state,
                        R_next_state; 

    always@(*) begin
        if (rst) begin
            R_next_state    = AXI_MASTER_0;
        end
        else begin
    case (R_curr_state)
        AXI_MASTER_0:begin  
             if ( ar_valid_m0 )begin                              //0号主机请求总线
                R_next_state = AXI_MASTER_0;
            end
            else if ( r_ready_m0 & (!r_valid_m0) )begin                //0号主机正在读取数据
                R_next_state = AXI_MASTER_0;
            end
            else if ( r_valid_m0 & r_last_m0 )begin                   //0号主机数据读取完毕,r_valid_m0 和 !r_ready_m0
                R_next_state = AXI_MASTER_021;                //下一次优先级更换为1号主机，是的下次优先级顺序为1→0
            end
            else if ( ar_valid_m1 )begin
                R_next_state = AXI_MASTER_1;                //优先级更换为1号主机
            end   
            else begin
                R_next_state = AXI_MASTER_0;                //否则仍为0号主机 
            end
        end
        AXI_MASTER_1:begin
            
            if ( ar_valid_m1 ) begin                             //1号主机请求总线
                R_next_state = AXI_MASTER_1;
            end
            else if ( r_ready_m1 & (!r_valid_m1))begin        //1号主机正在读取数据
                R_next_state = AXI_MASTER_1;
            end
            else if ( r_valid_m1  & r_last_m1 )begin              //1号主机数据读取完毕
                R_next_state = AXI_MASTER_120;               //下一次优先级更换为0号主机，是的下次优先级顺序为0→1
            end
            else if ( ar_valid_m0 )begin
                R_next_state = AXI_MASTER_0;                //优先级更换为0号主机
            end
            else begin
                R_next_state = AXI_MASTER_1;                //否则仍为1号主机
            end
        end
        AXI_MASTER_021: begin   R_next_state = AXI_MASTER_1;end
        AXI_MASTER_120: begin   R_next_state = AXI_MASTER_0;end
        default:begin
                R_next_state = AXI_MASTER_0;   
        end
    endcase   
        end                     
    end

    always @(posedge clk)begin
    if ( rst == 1 )
        R_curr_state <= AXI_MASTER_0;
    else
        R_curr_state <= R_next_state;
    end

    assign r_switch_m0 = R_curr_state == AXI_MASTER_0 /*| R_curr_state == AXI_MASTER_021 */?  1'b1 : 1'b0;
    assign r_switch_m1 = R_curr_state == AXI_MASTER_1 /*| R_curr_state == AXI_MASTER_120 */? 1'b1 : 1'b0;
endmodule

module ysyx_210302_axi_interconnect (
    /***********时钟&复位**********/
	input                       clk,
	input      	                rst,
    /********** 0号主机 **********/

    //读地址通道
    output                                  ar_ready_m0,
    input                                   ar_valid_m0,
    input       [`YSYX210302_AXI_ADDR_WIDTH-1:0]       ar_addr_m0,
    input       [`YSYX210302_AXI_ID_WIDTH-1:0]         ar_id_m0,
    input       [7:0]                       ar_len_m0,
    input       [2:0]                       ar_size_m0,
    input       [1:0]                       ar_burst_m0,

    //读数据通道
    input                                   r_ready_m0,
    output                                  r_valid_m0,
    output      [1:0]                       r_resp_m0,
    output      [`YSYX210302_AXI_DATA_WIDTH-1:0]        r_data_m0,
    output                                  r_last_m0,
    /********** 1号主机 **********/
    //写地址通道
    output                                  aw_ready_m1,
    input                                   aw_valid_m1,
    input	    [`YSYX210302_AXI_ADDR_WIDTH-1:0]        aw_addr_m1,
    input       [`YSYX210302_AXI_ID_WIDTH-1:0]          aw_id_m1,
    input       [7:0]                       aw_len_m1,
    input       [2:0]                       aw_size_m1,
    input       [1:0]                       aw_burst_m1,
    //写数据通道
    output                                 w_ready_m1,
    input                                   w_valid_m1,
    input       [`YSYX210302_AXI_DATA_WIDTH-1:0]        w_data_m1,
    input       [`YSYX210302_AXI_DATA_WIDTH/8-1:0]      w_strb_m1,
    input                                   w_last_m1,
    //写响应通道
    input                                   b_ready_m1,
    output                                  b_valid_m1,
    output      [1:0]                       b_resp_m1,
    //读地址通道
    output                                  ar_ready_m1,
    input                                   ar_valid_m1,
    input       [`YSYX210302_AXI_ADDR_WIDTH-1:0]        ar_addr_m1,
    input       [`YSYX210302_AXI_ID_WIDTH-1:0]          ar_id_m1,
    input       [7:0]                       ar_len_m1,
    input       [2:0]                       ar_size_m1,
    input       [1:0]                       ar_burst_m1,

    //读数据通道
    input                                   r_ready_m1,
    output                                  r_valid_m1,
    output      [1:0]                       r_resp_m1,
    output      [`YSYX210302_AXI_DATA_WIDTH-1:0]       r_data_m1,
    output                                  r_last_m1,

    /********** 0号从机 **********/
    //写地址通道
    input                                   aw_ready_s0,
    output                                  aw_valid_s0,
    output      [`YSYX210302_AXI_ADDR_WIDTH-1:0]       aw_addr_s0,
    output      [`YSYX210302_AXI_ID_WIDTH-1:0]         aw_id_s0,
    output      [7:0]                       aw_len_s0,
    output      [2:0]                       aw_size_s0,
    output      [1:0]                       aw_burst_s0,
    //写数据通道
    input                                   w_ready_s0,
    output                                  w_valid_s0,
    output      [`YSYX210302_AXI_DATA_WIDTH-1:0]        w_data_s0,
    output      [`YSYX210302_AXI_DATA_WIDTH/8-1:0]      w_strb_s0,
    output                                  w_last_s0,
    //写响应通道
    output                                  b_ready_s0,
    input                                   b_valid_s0,
    input       [1:0]                       b_resp_s0,

    //读地址通道
    input                                   ar_ready_s0,
    output                                  ar_valid_s0,
    output      [`YSYX210302_AXI_ADDR_WIDTH-1:0]        ar_addr_s0,
    output      [`YSYX210302_AXI_ID_WIDTH-1:0]          ar_id_s0,
    output      [7:0]                       ar_len_s0,
    output      [2:0]                       ar_size_s0,
    output      [1:0]                       ar_burst_s0,
    //读数据通道
    output                                  r_ready_s0,
    input                                   r_valid_s0,
    input       [1:0]                       r_resp_s0,
    input       [`YSYX210302_AXI_DATA_WIDTH-1:0]       r_data_s0,
    input                                   r_last_s0
  );

    wire                    r_switch_m0 ;
    wire                    r_switch_m1 ;


    ysyx_210302_axi_arbiter_r ysyx_210302_axi_arbiter_r(
    .clk                    (clk),
    .rst                    (rst),
    .ar_valid_m0            (ar_valid_m0),
    .r_ready_m0             (r_ready_m0),
    .r_valid_m0             (r_valid_s0),
    .r_last_m0              (r_last_s0),
    .ar_valid_m1            (ar_valid_m1),
    .r_ready_m1             (r_ready_m1),
    .r_valid_m1             (r_valid_s0),
    .r_last_m1              (r_last_s0),
    .r_switch_m0             (r_switch_m0),
    .r_switch_m1             (r_switch_m1)
    );


    assign r_valid_m0   =   r_switch_m0 == 1 ? r_valid_s0    : 1'b0 ;

    assign ar_ready_m0  =   r_switch_m0 == 1 ? ar_ready_s0   : 1'b0 ;
    assign r_data_m0    =   r_switch_m0 == 1 ? r_data_s0     : 64'b0 ;
    assign r_resp_m0    =   r_switch_m0 == 1 ? r_resp_s0     : 2'b0 ;
    assign r_last_m0    =   r_switch_m0 == 1 ? r_last_s0     : 1'b0 ;



    assign r_valid_m1   =   r_switch_m1 == 1 ? r_valid_s0    : 1'b0 ;
    assign ar_ready_m1  =   r_switch_m1 == 1 ? ar_ready_s0   : 1'b0 ;
    assign r_data_m1    =   r_switch_m1 == 1 ? r_data_s0     : 64'b0 ;
    assign r_resp_m1    =   r_switch_m1 == 1 ? r_resp_s0     : 2'b0 ;
    assign r_last_m1    =   r_switch_m1 == 1 ? r_last_s0     : 1'b0 ;



    assign r_ready_s0   =   r_switch_m0 == 1 ? r_ready_m0    : ( r_switch_m1 == 1 ? r_ready_m1 : 1'b0) ;
    assign ar_valid_s0  =   r_switch_m0 == 1 ? ar_valid_m0   : ( r_switch_m1 == 1 ? ar_valid_m1 : 1'b0) ;
    assign ar_addr_s0   =   r_switch_m0 == 1 ? ar_addr_m0    : ( r_switch_m1 == 1 ? ar_addr_m1 : 32'b0) ;
    assign ar_id_s0     =   r_switch_m0 == 1 ? ar_id_m0      : ( r_switch_m1 == 1 ? ar_id_m1 : 4'b0) ;
    assign ar_len_s0    =   r_switch_m0 == 1 ? ar_len_m0     : ( r_switch_m1 == 1 ? ar_len_m1 : 8'b0) ;
    assign ar_size_s0   =   r_switch_m0 == 1 ? ar_size_m0    : ( r_switch_m1 == 1 ? ar_size_m1 : 3'b0) ;
    assign ar_burst_s0  =   r_switch_m0 == 1 ? ar_burst_m0   : ( r_switch_m1 == 1 ? ar_burst_m1 : 2'b0) ;




    assign  aw_ready_m1     =   aw_ready_s0;
    assign  aw_valid_s0     =   aw_valid_m1;
    assign  aw_addr_s0      =   aw_addr_m1;
    assign  aw_id_s0        =   aw_id_m1;
    assign  aw_len_s0       =   aw_len_m1;
    assign  aw_size_s0      =   aw_size_m1;
    assign  aw_burst_s0     =   aw_burst_m1;


    assign  w_ready_m1      =   w_ready_s0;
    assign  w_valid_s0      =   w_valid_m1;
    assign  w_data_s0       =   w_data_m1;
    assign  w_strb_s0       =   w_strb_m1;
    assign  w_last_s0       =   w_last_m1;


    assign  b_ready_s0      =   b_ready_m1;
    assign  b_valid_m1      =   b_valid_s0;
    assign  b_resp_m1       =   b_resp_s0;

endmodule


module ysyx_210302_dfflrs #( parameter WIDTH = 64 )
                (input                  write_en,
                 input  [ WIDTH-1:0 ]   write_data,
                 output [ WIDTH-1:0 ]   read_data,
                 input                  clk,
                 input                  rst);
    reg [ WIDTH-1:0 ] read_data_r;
    
    always @( posedge clk)
        begin
        if ( rst == 1'b1 )
            read_data_r <= {WIDTH{1'b1}};
        else if ( write_en == 1'b1 )
            read_data_r <= write_data;
        end
    
    assign read_data = read_data_r;
endmodule
module ysyx_210302_dfflriv #( parameter WIDTH = 64 )
                (input                  write_en,
                 input  [ WIDTH-1:0 ]   write_data,
                 output [ WIDTH-1:0 ]   read_data,
                 input                  clk,
                 input                  rst,
                 input  [ WIDTH-1:0 ]	Initial_value);
    reg [ WIDTH-1:0 ] read_data_r;
    
    always @( posedge clk )
        begin
        if ( rst == 1'b1 )
            read_data_r <= Initial_value;
        else if ( write_en == 1'b1 )
            read_data_r <= write_data;
        end
    
    assign read_data = read_data_r;
endmodule
module ysyx_210302_dfflr #( parameter WIDTH = 64 )
                (input                  write_en,
                 input  [ WIDTH-1:0 ]   write_data,
                 output [ WIDTH-1:0 ]   read_data,
                 input                  clk,
                 input                  rst);
    reg [ WIDTH-1:0 ] read_data_r;
    
    always @( posedge clk)
        begin
        if ( rst == 1'b1 )
            read_data_r <= {WIDTH{1'b0}}; 
        else if ( write_en == 1'b1 )begin
            read_data_r <= write_data;
        end
        end
    
    assign read_data = read_data_r;
endmodule


module ysyx_210302_dffrs #( parameter WIDTH = 64 )
                (
                 input  [ WIDTH-1:0 ]   write_data,
                 output [ WIDTH-1:0 ]   read_data,
                 input                  clk,
                 input                  rst);
    reg [ WIDTH-1:0 ] read_data_r;
    
    always @( posedge clk )
        begin
        if ( rst == 1'b1 )
            read_data_r <= {WIDTH{1'b1}};
        else 
            read_data_r <= write_data;
        end
    
    assign read_data = read_data_r;
endmodule

module ysyx_210302_dffr #( parameter WIDTH = 64 )
                (
                 input  [ WIDTH-1:0 ]   write_data,
                 output [ WIDTH-1:0 ]   read_data,
                 input                  clk,
                 input                  rst);
    reg [ WIDTH-1:0 ] read_data_r;
    
    always @( posedge clk )
        begin
        if ( rst == 1'b1 )
            read_data_r <= {WIDTH{1'b0}};
        else 
            read_data_r <= write_data;
        end
    
    assign read_data = read_data_r;
endmodule
module ysyx_210302_csr( input                   clk,
            input                   rst,
            input                   IF_module_work,
            input                   if_axi_ar_ready,
            input [ 11:0 ]          csr_addr,
            input                   csr_wr_en,
            input [ 63 : 0 ]        myinst_addr,
            input [ 63 : 0 ]        MEM_myinst_addr,
            input [ 63 : 0 ]        EXE_myinst_addr,
            input [ 63 : 0 ]        ID_myinst_addr,
            input [ 63 : 0 ]        csr_wr_data,
            input [ 2  : 0 ]        funct3,
            input                   ecall_en,
                                    mret_en,
                                    mtimecmp_flag,
            output                  time_intr_pc,
            output [ `YSYX210302_LEN :0 ]      mtvec_read,
                                    mepc_read,        
           output reg [ `YSYX210302_LEN : 0 ]  csr2reg_write);

    wire [ `YSYX210302_LEN :0 ]                mtvec_write,
                                    mepc_write,
                                    mstatus_write,
                                    mcause_write,
                                    mip_write,
                                    mie_write,
                                    mscratch_write,
                                    mstatus_read,
                                    mcause_read,
                                    mip_read,
                                    mie_read,
                                    mscratch_read,
                                    csr_read;
    wire [ `YSYX210302_LEN:0 ]                 mcycle_read;


    //reg intr_begin;
    reg [63 :  0]   intr_next_inst;
    reg mtimecmp_realflag;
    reg [63:0] curr_inst;
    wire wr_ok = curr_inst != myinst_addr;
    always @(posedge clk) begin

    if (rst) begin
        csr2reg_write       <= 64'b0;
        curr_inst           <= 64'b0;
        intr_next_inst      <= 64'b0;
        mtimecmp_realflag   <= 1'b0;
    end
    else begin
        if (csr_wr_en & wr_ok & IF_module_work)begin
            csr2reg_write   <= csr_read;
            curr_inst       <= myinst_addr;
        end
        else begin 
            csr2reg_write   <= csr2reg_write;
            curr_inst       <= myinst_addr;
        end
        if (mtimecmp_realflag )
            if ( MEM_myinst_addr != 0)
                intr_next_inst  <= MEM_myinst_addr;
            else if (EXE_myinst_addr != 0)
                intr_next_inst  <= EXE_myinst_addr;
            else if (ID_myinst_addr != 0)
                intr_next_inst  <= ID_myinst_addr;

        if (mtimecmp_flag & if_axi_ar_ready)
            mtimecmp_realflag   <= 1'b1;
        else if(mtimecmp_flag == 0)
            mtimecmp_realflag   <= 1'b0;
        end
    end


    wire                time_intr_start       =      IF_module_work & mtimecmp_realflag & mstatus_read[3] & mie_read[7];
    assign              time_intr_pc          =      mtimecmp_realflag & mstatus_read[3] & mie_read[7];
    /****************************write****************************/
    wire                sel_mcycle          = ( csr_addr == 12'hb00 );
    wire                sel_mstatus         = ( csr_addr == 12'h300 );
    wire                sel_mtvec           = ( csr_addr == 12'h305 );
    wire                sel_mepc            = ( csr_addr == 12'h341 );
    wire                sel_mcause          = ( csr_addr == 12'h342 );
    wire                sel_mip             = ( csr_addr == 12'h344 );   
    wire                sel_mie             = ( csr_addr == 12'h304 );     
    wire                sel_mscratch        = ( csr_addr == 12'h340 );   
    assign csr_read                 = sel_mcycle    ?   mcycle_read  : 
                                    ( sel_mstatus   ?   mstatus_read : 
                                    ( sel_mtvec     ?   mtvec_read   : 
                                    ( sel_mepc      ?   mepc_read    :
                                    ( sel_mcause    ?   mcause_read  : 
                                    ( sel_mip       ?   mip_read     :
                                    ( sel_mie       ?   mie_read     : 
                                    ( sel_mscratch  ?   mscratch_read: 0)))))));

    wire [`YSYX210302_LEN : 0] csr_write   = ( funct3 == 3'b001 | funct3 == 3'b101) ? csr_wr_data : ( ( funct3[1:0] == 2'b10 ) ? csr_wr_data | csr_read : ( ~csr_wr_data ) & csr_read );

    /****************************mcycle****************************/
    wire                mcycle_wr_en        = csr_wr_en & sel_mcycle;
    wire [ `YSYX210302_LEN:0 ]     mcycle_write        = mcycle_wr_en  ? csr_write : ( mcycle_read+1 );
    wire                mcycle_enable       = 1'b1;
    ysyx_210302_dfflr #( `YSYX210302_LEN + 1) ysyx_210302_mcycle_dfflr ( mcycle_enable, mcycle_write, mcycle_read , clk, rst );

    /****************************mstatus****************************/

    wire                mstatus_wr_en       = (( sel_mstatus & csr_wr_en ) | ecall_en | mret_en | time_intr_start );
    wire [ `YSYX210302_LEN:0 ]     mstatus_wr_data     = {(csr_write[13]&csr_write[14]) | (csr_write[15]&csr_write[16]),csr_write[62:0]};
    assign              mstatus_write       = ( ecall_en &IF_module_work ) | time_intr_start ? {mstatus_read[`YSYX210302_LEN:13],2'b11,mstatus_read[10:8],mstatus_read[3:3],mstatus_read[6:4],1'b0,mstatus_read[2:0]} :   //ecall执行
                                            ( mret_en & IF_module_work? {mstatus_read[63:63],46'b0,mstatus_read[16:13],5'b0,1'b1,mstatus_read[6:4],mstatus_read[7:7],mstatus_read[2:0]} :    //mret返回
                                            ( mstatus_wr_en & !ecall_en & !mret_en ? mstatus_wr_data : mstatus_read ) ) ;          //csr写指令,为了防止ecall_en时反复读值，所以加了个IF_module_work
    ysyx_210302_dfflriv #( `YSYX210302_LEN + 1 ) ysyx_210302_mstatus_dfflriv ( mstatus_wr_en , mstatus_write, mstatus_read , clk, rst ,64'h0000000000000000 );
    /****************************mtvec****************************/
    //wire [ `YSYX210302_LEN:0 ]     mtvec_read;
    wire                mtvec_wr_en         = ( sel_mtvec & csr_wr_en ) ;
    assign              mtvec_write         = mtvec_wr_en  ? csr_write : 0;
    ysyx_210302_dfflr #( `YSYX210302_LEN + 1 ) ysyx_210302_mtvec_dfflr ( mtvec_wr_en , mtvec_write, mtvec_read , clk, rst );
    /****************************mepc****************************/
    wire                mepc_wr_en          = ( sel_mepc & csr_wr_en ) | ecall_en | time_intr_start;
    assign              mepc_write          = ecall_en  ? myinst_addr :             //环境调用异常保存当前PC值
                                            ( time_intr_start ? intr_next_inst :    //时钟中断保存下一条指令PC值
                                            ( mepc_wr_en ? csr_write : 0 ) );       //csr写指令写对应值
    ysyx_210302_dfflr #( `YSYX210302_LEN + 1 ) ysyx_210302_mepc_dfflr ( mepc_wr_en , mepc_write, mepc_read , clk, rst );
    /****************************mcause****************************/

    wire                mcause_wr_en        = ( sel_mcause & csr_wr_en ) | ecall_en | time_intr_start;
    assign              mcause_write        = ecall_en ? {1'b0,{(`YSYX210302_LEN -4){1'b0}},4'b1011} : 
                                            ( time_intr_start ? 64'h80000000_00000007 :       //时钟中断
                                            ( mcause_wr_en ? csr_write : 0 ) );
    ysyx_210302_dfflr #( `YSYX210302_LEN + 1 ) ysyx_210302_mcause_dfflr ( mcause_wr_en , mcause_write, mcause_read , clk, rst);
    /**************************** mip ****************************/  
    assign              mip_write           = { {(`YSYX210302_LEN -7){1'b0}} , 1'b0 , 7'b0};
    ysyx_210302_dffr #( `YSYX210302_LEN + 1 ) ysyx_210302_mip_dffr ( mip_write , mip_read , clk, rst);
    /**************************** mie ****************************/
    wire                mie_wr_en           = ( sel_mie & csr_wr_en ) ;
    assign              mie_write           = mie_wr_en  ? csr_write : 0;
    ysyx_210302_dfflr #( `YSYX210302_LEN + 1 ) ysyx_210302_mie_dfflr ( mie_wr_en, mie_write , mie_read , clk, rst);
    /**************************** mscratch ****************************/
    wire                mscratch_wr_en           = ( sel_mscratch & csr_wr_en ) ;
    assign              mscratch_write           = mscratch_wr_en  ? csr_write : 0;
    ysyx_210302_dfflr #( `YSYX210302_LEN + 1 ) ysyx_210302_mscratch_dfflr ( mscratch_wr_en, mscratch_write , mscratch_read , clk, rst);

    //assign sstatus_read  =   mstatus_read & 64'h80000003000DE122;


endmodule



module ysyx_210302_forward_ID_forward_unit(
    input   [4  :  0]   MEM_rd_addr,
    input   [4  :  0]   WB_rd_addr,
    input   [4  :  0]   EXE_rd_addr,
    input   [4  :  0]   ID_rs1_addr,
    input   [4  :  0]   ID_rs2_addr,
    input               MEM_load_en,
    input               MEM_ready,
    input               EXE_csr_en,
    input               MEM_csr_en,
    input               WB_csr_en,

    output              ID_jump_forward_ready,
    output  [2  :  0]   ID_forward_rs1,
    output  [2  :  0]   ID_forward_rs2);
    wire    EXE2ID_rs1;
    wire    EXE2ID_rs2;
    wire    MEM2ID_rs1;
    wire    MEM2ID_rs2;
    wire    WB2ID_rs1;
    wire    WB2ID_rs2;

    wire    csr_stall;
    
    assign  csr_stall  = WB_csr_en & MEM_csr_en & EXE_csr_en & ( WB_rd_addr != 0) & ( WB_rd_addr == ID_rs1_addr | WB_rd_addr == ID_rs2_addr);//由于csr发生的数据冲突产生阻塞的情况应该转发WB级的数据,并且需要csr指令已经流到WB级（即此时EXE MEM WB级全是该csr指令）

    assign  EXE2ID_rs1 =   ( EXE_rd_addr != 0 ) & ( EXE_rd_addr == ID_rs1_addr ) & (!csr_stall);
    assign  EXE2ID_rs2 =   ( EXE_rd_addr != 0 ) & ( EXE_rd_addr == ID_rs2_addr ) & (!csr_stall);//跨一级流水前递（rd_addr=0时或csr前递时不前递）

    assign  MEM2ID_rs1  =   ( MEM_rd_addr != 0 ) & ( MEM_rd_addr == ID_rs1_addr ) & ( EXE_rd_addr != ID_rs1_addr)& (!csr_stall);
    assign  MEM2ID_rs2  =   ( MEM_rd_addr != 0 ) & ( MEM_rd_addr == ID_rs2_addr ) & ( EXE_rd_addr != ID_rs2_addr)& (!csr_stall);//跨两级流水前递（rd_addr=0时或csr前递时不前递）


    assign  WB2ID_rs1  =   (csr_stall & WB_rd_addr == ID_rs1_addr) | ( ( WB_rd_addr != 0 ) & ( WB_rd_addr == ID_rs1_addr ) & ( EXE_rd_addr != ID_rs1_addr) & ( MEM_rd_addr != ID_rs1_addr));
    assign  WB2ID_rs2  =   (csr_stall & WB_rd_addr == ID_rs2_addr) | ( ( WB_rd_addr != 0 ) & ( WB_rd_addr == ID_rs2_addr ) & ( EXE_rd_addr != ID_rs2_addr) & ( MEM_rd_addr != ID_rs2_addr));//跨两级流水前递

    assign  ID_forward_rs1 =   {WB2ID_rs1 , MEM2ID_rs1 , EXE2ID_rs1};
    assign  ID_forward_rs2 =   {WB2ID_rs2 , MEM2ID_rs2 , EXE2ID_rs2};

    assign  ID_jump_forward_ready = (MEM2ID_rs1 | MEM2ID_rs2) & MEM_load_en ? MEM_ready : 1; //MEM的前递如果时load指令，需要等load到数据后才能前递

endmodule


module ysyx_210302_load_hazard_unit(
    input               EXE_load_en,
    input   [4  :  0]   EXE_rd_addr,
    input   [4  :  0]   ID_rs1_addr,
    input   [4  :  0]   ID_rs2_addr,

    output              load_hazard);

    assign  load_hazard = EXE_load_en & ( EXE_rd_addr == ID_rs1_addr | EXE_rd_addr == ID_rs2_addr) & ( EXE_rd_addr != 0);
endmodule

module ysyx_210302_csr_hazard_unit (  
    input   [4  :  0]   MEM_rd_addr,
    input   [4  :  0]   WB_rd_addr,
    input   [4  :  0]   EXE_rd_addr,
    input   [4  :  0]   ID_rs1_addr,
    input   [4  :  0]   ID_rs2_addr,
    input               EXE_csr_en,
    input               MEM_csr_en,
    input               WB_csr_en,

    output              csr_hazard );
    wire hazard_end;
    assign  hazard_end = WB_csr_en & ( WB_rd_addr == ID_rs1_addr | WB_rd_addr == ID_rs2_addr ) & (WB_rd_addr == MEM_rd_addr);
    assign  csr_hazard = ( ( MEM_csr_en & ( MEM_rd_addr == ID_rs1_addr | MEM_rd_addr == ID_rs2_addr ) & ( MEM_rd_addr != 0) & ( MEM_rd_addr != EXE_rd_addr)/*如果rd中途又被赋值，则不需要阻塞*/)
                       | (EXE_csr_en & ( EXE_rd_addr == ID_rs1_addr | EXE_rd_addr == ID_rs2_addr ) & ( EXE_rd_addr != 0) ) )            
                        & ( !hazard_end );
    // 由于csr的操作在WB阶段，所以当csr的下一条指令用到了csr的目的寄存器，就会发生数据冒险。
    // 跟通用寄存器产生的冒险不同，csr寄存器产生的冒险放在EXE阶段解决，所以当产生冒险的csr指令在MEM，下一指令在EXE时需要阻塞流水线一周期，这样才能让当前指令流到wb级取到正确的数据
endmodule


module ysyx_210302_id_stage(
                input wire [ 31 : 0 ]   ID_inst,
                input wire [ `YSYX210302_REG_BUS ] ID_rs1_data,
                input wire [ `YSYX210302_REG_BUS ] ID_rs2_data,
                input wire              ID_jump_yes,
                input                   ID_pc_handshake,

                output wire [ 6 : 0 ]   ID_funct7,
                output wire [ 6 : 0 ]   ID_opcode,
                output wire [ 2 : 0 ]   ID_funct3,


                output wire             ID_jumpr_en,
                                        ID_jumpb_en,
                                        ID_jump_judge_en,
                output wire [ 63 : 0 ]  ID_offset,

                output wire             ID_rs1_en,
                output wire [ 4 : 0 ]   ID_rs1_addr,
                output wire             ID_rs2_en,
                output wire [ 4 : 0 ]   ID_rs2_addr,
                output wire             ID_rd_en,
                output wire [ 4 : 0 ]   ID_rd_addr,
                output wire [ 5 : 0 ]   ID_shamt,
                output wire             ID_sub_en,
                output wire             ID_alu_en,
                output wire [ `YSYX210302_REG_BUS ]ID_op1,
                output wire [ `YSYX210302_REG_BUS ]ID_op2,
                output wire [ 63 : 0 ]  ID_ext_ui_imm,


                output wire             ID_csr_en,
                                        ID_csr_wr_en,
                                        ID_ecall_en,
                                        ID_mret_en,
                output wire [ 11 : 0]   ID_csr_addr,
                output wire [ 63 : 0]   ID_csr_wr_data,



                output [31:0]           ID_mem_addr,
                output [1:0]            ID_mem_size,
                output                  ID_mem_valid,
                output                  ID_mem_req,
                output wire             ID_load_en,
                                        ID_store_en,

                output                  ID_clint_write_en,
                output                  ID_clint_read_en,
                output                  ID_clint_mtimecmp_en,
                output                  ID_clint_mtime_en
                );
    
    
    
    
    wire [ 4  : 0 ]rs1 , rs2 , rd;
    wire [ 11 : 0 ]imm_12;
    wire [ 63 : 0 ]jump_offset;
    wire [ 19 : 0 ]ui_imm;
    wire [63 :  0]   ID_ext_imm_62;
    
    
    // 译码
    assign ID_opcode       = ID_inst[ 6  :  0 ];
    assign ID_funct7       = ID_inst[ 31 : 25 ];
    assign rs2          = ID_inst[ 24 : 20 ];
    assign rs1          = ID_inst[ 19 : 15 ];
    assign ID_funct3    = ID_inst[ 14 : 12 ];
    assign rd           = ID_inst[ 11 :  7 ];
    assign ui_imm       = ID_inst[ 31 : 12 ];
    assign ID_ext_imm_62   = { {52{imm_12[ 11 ]}} , imm_12 } ;
    assign ID_ext_ui_imm   = { {32{ui_imm[ 19 ]}} , ui_imm ,12'b0 } ;
    assign ID_csr_addr     = ID_inst[ 31 : 20 ];
    assign jump_offset  = { {44{ID_inst[ 19 ]}} , ID_inst[ 19 : 12 ] ,  ID_inst[ 20 ] , ID_inst[ 30 : 21 ] , 1'b0 };                                          
    assign imm_12       = ( ID_opcode[ 6 ]  &  ID_opcode[ 5 ] & ~ID_opcode[ 4 ] & ~ID_opcode[ 3 ] &  ID_opcode[ 2 ] & ID_opcode[ 1 ] & ID_opcode[ 0 ] ) ? ID_inst[ 31:20 ] :    // 无条件跳转jalr指令
    ( ( ID_opcode[ 6 ]  &  ID_opcode[ 5 ] & ~ID_opcode[ 4 ] & ~ID_opcode[ 3 ] & ~ID_opcode[ 2 ] & ID_opcode[ 1 ] & ID_opcode[ 0 ] ) ? { ID_inst[ 31 ], ID_inst[ 7 ] , ID_inst[ 30:25 ] , ID_inst[ 11:8 ] }:
    ( ( ~ID_opcode[ 6 ] & ~ID_opcode[ 5 ] & ~ID_opcode[ 4 ] & ~ID_opcode[ 3 ] & ~ID_opcode[ 2 ] & ID_opcode[ 1 ] & ID_opcode[ 0 ] )? ID_inst[ 31:20 ]:                         // 读存储器lw指令
    ( ( ~ID_opcode[ 6 ] &  ID_opcode[ 5 ] & ~ID_opcode[ 4 ] & ~ID_opcode[ 3 ] & ~ID_opcode[ 2 ] & ID_opcode[ 1 ] & ID_opcode[ 0 ] ) ? { ID_inst[ 31:25 ] , ID_inst[ 11:7 ] } :    // 写存储器sw指令
    ( ( ~ID_opcode[ 6 ] & ~ID_opcode[ 5 ] &  ID_opcode[ 4 ] & ~ID_opcode[ 3 ] & ~ID_opcode[ 2 ] & ID_opcode[ 1 ] & ID_opcode[ 0 ] ) ? ID_inst[ 31:20 ] :                       // 立即数运算指
    ( ( ~ID_opcode[ 6 ] & ~ID_opcode[ 5 ] &  ID_opcode[ 4 ] &  ID_opcode[ 3 ] & ~ID_opcode[ 2 ] & ID_opcode[ 1 ] & ID_opcode[ 0 ] ) ? ID_inst[ 31:20 ] : 0 ) ) ) ) );          // 立即数字运算指令

    wire    YSYX210302_R_TYPE      =   ID_opcode == `YSYX210302_R_TYPE;
    wire    YSYX210302_I_TYPE1     =   ID_opcode == `YSYX210302_I_TYPE1;
    wire    YSYX210302_I_TYPE2     =   ID_opcode == `YSYX210302_I_TYPE2;
    wire    YSYX210302_I_TYPE3     =   ID_opcode == `YSYX210302_I_TYPE3;
    wire    YSYX210302_I_TYPE3W    =   ID_opcode == `YSYX210302_I_TYPE3W;
    wire    YSYX210302_S_TYPE      =   ID_opcode == `YSYX210302_S_TYPE;
    wire    YSYX210302_B_TYPE      =   ID_opcode == `YSYX210302_B_TYPE;
    wire    YSYX210302_R_TYPEW     =   ID_opcode == `YSYX210302_R_TYPEW;
    wire    YSYX210302_CSR_TYPE2   =   ID_opcode == `YSYX210302_CSR_TYPE2;
    wire    YSYX210302_U_TYPE1     =   ID_opcode == `YSYX210302_U_TYPE1;
    wire    YSYX210302_U_TYPE2     =   ID_opcode == `YSYX210302_U_TYPE2;
    wire    YSYX210302_J_TYPE      =   ID_opcode == `YSYX210302_J_TYPE;





    // 寄存器地址
    assign ID_rs1_addr   = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_I_TYPE1 ) || ( YSYX210302_I_TYPE2 ) || ( YSYX210302_I_TYPE3W )
    || ( YSYX210302_I_TYPE3 ) || ( YSYX210302_S_TYPE ) || ( YSYX210302_B_TYPE ) || ( YSYX210302_R_TYPEW ) || ( YSYX210302_CSR_TYPE2 ) ) ? rs1 : 0 ;
    assign ID_rs2_addr   = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_S_TYPE ) || ( YSYX210302_B_TYPE ) || ( YSYX210302_R_TYPEW ) ) ? rs2 : 0 ;
    assign ID_rd_addr    = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_I_TYPE1 ) || ( YSYX210302_I_TYPE2 ) || ( YSYX210302_I_TYPE3W )
    || ( YSYX210302_I_TYPE3 ) || ( YSYX210302_U_TYPE1 ) || ( YSYX210302_U_TYPE2 ) || ( YSYX210302_J_TYPE ) || ( YSYX210302_R_TYPEW )  || ( YSYX210302_CSR_TYPE2 ) ) ? rd : 0 ;
    
    // 控制信号
    assign ID_rd_en = ID_pc_handshake &( ( YSYX210302_R_TYPE ) || ( YSYX210302_J_TYPE ) || ( YSYX210302_I_TYPE1 ) || ( YSYX210302_I_TYPE2 )
    || ( YSYX210302_I_TYPE3 ) || ( YSYX210302_U_TYPE1 ) || ( YSYX210302_U_TYPE2 ) || ( YSYX210302_R_TYPEW ) || ( YSYX210302_I_TYPE3W ) || ( YSYX210302_CSR_TYPE2 )) ? 1'b1 : 1'b0 ;
    assign ID_rs1_en = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_I_TYPE1 ) || ( YSYX210302_I_TYPE2 || ( YSYX210302_I_TYPE3W ) )
    || ( YSYX210302_I_TYPE3 ) || ( YSYX210302_S_TYPE ) || ( YSYX210302_B_TYPE ) || ( YSYX210302_R_TYPEW ) || ( YSYX210302_CSR_TYPE2 ) ) ? 1'b1 : 1'b0 ;
    assign ID_rs2_en = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_I_TYPE1 ) || ( YSYX210302_I_TYPE2 )
    || ( YSYX210302_I_TYPE3 ) || ( YSYX210302_S_TYPE ) || ( YSYX210302_B_TYPE ) || ( YSYX210302_R_TYPEW ) ) ? 1'b1 : 1'b0 ;
    assign ID_sub_en       = ( ( ( YSYX210302_R_TYPE ) & ( ID_funct7 == 7'b0100000 ) )  || ( ( YSYX210302_R_TYPEW ) & ( ID_funct7 == 7'b0100000 ) ) ) ? 1'b1 : 1'b0;
    //assign ID_jump_en      = ( YSYX210302_J_TYPE ) ? 1'b1 : 1'b0;                    // jal指令
    assign ID_jumpr_en     = ( YSYX210302_I_TYPE1 ) ? 1'b1 : 1'b0;                  // jarl指令
    assign ID_jumpb_en     = ( ( YSYX210302_B_TYPE ) & ID_jump_yes ) ? 1'b1 : 1'b0;    // B类指令
    assign ID_load_en      = ( YSYX210302_I_TYPE2 ) ? 1'b1 : 1'b0;
    assign ID_store_en     = ( YSYX210302_S_TYPE ) ? 1'b1 : 1'b0;
    assign ID_csr_en       = ( YSYX210302_CSR_TYPE2 ) ? 1'b1 : 1'b0;
    assign ID_csr_wr_en    = ( YSYX210302_CSR_TYPE2 & ID_funct3 != 3'b000 ) ? 1'b1 : 1'b0;
    assign ID_csr_wr_data  = ( ID_funct3 >= 3'b101 ) ?  {59'b0 , ID_inst[ 19 : 15 ]}: ID_rs1_data;
    assign ID_ecall_en     = ( ID_inst == 32'h00000073 & ID_pc_handshake );
    assign ID_mret_en      = ( ID_inst == 32'h30200073 & ID_pc_handshake );//注意删除

 
    
    
    assign ID_alu_en       = ( ( ( YSYX210302_R_TYPE ) & ( ID_funct7 == 7'b0000000 ) )
    + ( ( YSYX210302_R_TYPE ) & ( ID_funct7 == 7'b0100000 ) & ( ( ID_funct3 == 3'b000 ) || ( ID_funct3 == 3'b101 ) ) )
    + ( ( YSYX210302_I_TYPE3 ) & ( ~( ( ~ID_funct3[ 2 ] & ~ID_funct3[ 1 ] & ID_funct3[ 0 ] ) || ( ID_funct3[ 2 ] & ~ ID_funct3[ 1 ] & ID_funct3[ 0 ] ) ) ) )
    + ( ( YSYX210302_I_TYPE3 ) & ( ( ID_funct7[ 6:1 ] == 6'b010000 ) || ( ID_funct7[ 6:1 ] == 6'b000000 ) ) & ( ID_funct3 == 3'b101 ) )
    + ( ( YSYX210302_I_TYPE3 ) & ( ID_funct7[ 6:1 ] == 6'b000000 ) & ( ID_funct3 == 3'b001 ) )
    +( ( YSYX210302_R_TYPEW ) & ( ( ID_funct7 == 7'b0 ) || ( ID_funct7 == 7'b0100000 ) ) )
    +( YSYX210302_I_TYPE3W ) );
    assign ID_jump_judge_en = ( YSYX210302_B_TYPE ) ? 1 : 0;
    
    
    // 取操作数
    assign ID_op1              = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_I_TYPE3 ) || ( YSYX210302_R_TYPEW ) || ( YSYX210302_I_TYPE3W ) ) ? ID_rs1_data : 0 ;
    assign ID_op2              = ( ( YSYX210302_R_TYPE ) || ( YSYX210302_R_TYPEW ) || ( YSYX210302_S_TYPE ) ) ? ID_rs2_data :  ( ( ( YSYX210302_I_TYPE3 ) || ( YSYX210302_I_TYPE3W ) )? ID_ext_imm_62 : 0 ) ;
    assign ID_shamt            = ID_opcode[ 5 ] ? ( ID_opcode[3] ? {1'b0,ID_op2[ 4:0 ]} : ID_op2[ 5:0 ] ) : ( ID_opcode[ 3 ] ? ( ID_inst[ 25:20 ]& {6{~ID_inst[ 25 ]}} ):  ID_inst[ 25:20 ] );

    assign ID_offset           = ( YSYX210302_J_TYPE ) ? jump_offset : ( ( YSYX210302_I_TYPE1 ) ? ( ID_rs1_data  + ID_ext_imm_62 ) :
    ( ( YSYX210302_B_TYPE ) ? { ID_ext_imm_62[62:0] , 1'b0}  : ( ( YSYX210302_U_TYPE2 )?  ID_ext_ui_imm : 0 ) ) );
    


    assign ID_mem_valid         = ( ID_load_en | ID_store_en ) & ( !ID_clint_write_en ) & ( !ID_clint_read_en );
    assign ID_clint_mtime_en    =   ID_mem_addr == `YSYX210302_CLINT_MTIME_ADDR;
    assign ID_clint_mtimecmp_en =   ID_mem_addr == `YSYX210302_CLINT_MTIMECMP_ADDR;
    assign ID_clint_write_en    = (ID_clint_mtime_en | ID_clint_mtimecmp_en) & ID_store_en ;
    assign ID_clint_read_en     = (ID_clint_mtime_en | ID_clint_mtimecmp_en) & ID_load_en ;
    assign ID_mem_req           =  ID_store_en == 1 ? `YSYX210302_REQ_WRITE : `YSYX210302_REQ_READ;
    assign ID_mem_addr          = ID_ext_imm_62[31:0] + ID_rs1_data[31:0];
    assign ID_mem_size =   ( ID_funct3 == `YSYX210302_LB || ID_funct3 == `YSYX210302_LBU ) ? `YSYX210302_SIZE_B : 
                       ( ( ID_funct3 == `YSYX210302_LH || ID_funct3 == `YSYX210302_LHU ) ? `YSYX210302_SIZE_H :
                       ( ( ID_funct3 == `YSYX210302_LW || ID_funct3 == `YSYX210302_LWU ) ? `YSYX210302_SIZE_W :
                       ( ( ID_funct3 == `YSYX210302_LD  ) ? `YSYX210302_SIZE_D : 0 ) ) );
    
endmodule


module ysyx_210302_if_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter YSYX210302_AXI_DATA_WIDTH    = 64,
    parameter YSYX210302_AXI_ADDR_WIDTH    = 32,
    parameter YSYX210302_AXI_ID_WIDTH      = 4)(
    input                               clock,
    input                               reset,

	input                               rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,
    input  [YSYX210302_AXI_ADDR_WIDTH-1:0]         rw_addr_i,
    input  [1:0]                        rw_size_i,
    output [1:0]                        rw_resp_o,
    output                              if_ar_ready,


    // Advanced eXtensible Interface
    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [YSYX210302_AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [YSYX210302_AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,


    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [YSYX210302_AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i);

    assign  if_ar_ready =   axi_ar_ready_i;
    wire r_trans    = rw_req_i == `YSYX210302_REQ_READ;
    wire r_valid    = rw_valid_i & r_trans;

    // handshake

    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i ;


    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = r_done;

    
    // ------------------State Machine------------------

    wire    [1:0]   R_STATE_IDLE = 2'b00;
    wire    [1:0]   R_STATE_ADDR = 2'b01;
    wire    [1:0]   R_STATE_READ  = 2'b10;

    reg [1:0] r_state;
    
    wire /*r_state_idle = r_state == R_STATE_IDLE, */r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine

    // Read State Machine
    always @(posedge clock) begin
        if (reset) begin
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



    // ------------------Process Data------------------
    localparam ALIGNED_WIDTH = $clog2(YSYX210302_AXI_DATA_WIDTH / 8);
    localparam OFFSET_WIDTH  = $clog2(YSYX210302_AXI_DATA_WIDTH);
    localparam AXI_SIZE      = $clog2(YSYX210302_AXI_DATA_WIDTH / 8);
    localparam MASK_WIDTH    = YSYX210302_AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / YSYX210302_AXI_DATA_WIDTH;

    wire aligned            = TRANS_LEN != 1 | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210302_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210302_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210302_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210302_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end<4'b1000 ?  addr_end[3:ALIGNED_WIDTH] != 0 : addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    wire [YSYX210302_AXI_ADDR_WIDTH-1:0] axi_addr    = (rw_addr_i < `YSYX210302_MEM_BEG_ADDR) ?{rw_addr_i[31:2], {2{1'b0}}}:{rw_addr_i[YSYX210302_AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}};
    wire [2:0] axi_size     = axi_addr >= `YSYX210302_APB_END_ADDR ? AXI_SIZE[2:0] : 3'b010; 
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    wire [6:0] aligned_offset_h_tem             = YSYX210302_AXI_DATA_WIDTH - aligned_offset_l;
    wire [OFFSET_WIDTH-1:0] aligned_offset_h    = aligned_offset_h_tem[6] ? aligned_offset_h_tem[5:0]:aligned_offset_h_tem[5:0];
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                    ) << aligned_offset_l;
    wire [YSYX210302_AXI_DATA_WIDTH-1:0] mask_l      = mask[YSYX210302_AXI_DATA_WIDTH-1:0];
    wire [YSYX210302_AXI_DATA_WIDTH-1:0] mask_h      = mask[MASK_WIDTH-1:YSYX210302_AXI_DATA_WIDTH];

    wire [YSYX210302_AXI_ID_WIDTH-1:0] axi_id        = {YSYX210302_AXI_ID_WIDTH{1'b0}};


    reg rw_ready;
    wire rw_ready_nxt = trans_done;
    wire rw_ready_en      = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 1'b0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
        end
    end
    assign rw_ready_o     = rw_ready;

    reg [1:0] rw_resp;
    wire rw_resp_nxt = axi_r_resp_i[0];
    wire resp_en = trans_done;
    always @(posedge clock) begin
        if (reset) begin
            rw_resp <= 2'b0;
        end
        else if (resp_en) begin
            rw_resp <= {axi_r_resp_i[1]&1'b0,rw_resp_nxt};
        end
    end
    assign rw_resp_o      = rw_resp;
    // ------------------Number of transmission------------------
    wire  [7:0] len =8'h00;
    // wire len_reset      = reset | (r_trans & r_state_idle);
    // wire len_incr_en    = (len != axi_len) & (r_hs);
    // always @(posedge clock) begin
    //     if (len_reset) begin
    //         len <= 8'b0;
    //     end
    //     else if (len_incr_en) begin
    //         len <= len + 1;
    //     end
    // end

    

    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = axi_addr;

    assign axi_ar_id_o      = axi_id;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210302_AXI_BURST_TYPE_INCR;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    wire [YSYX210302_AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [YSYX210302_AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;

    //generate
    //    for (genvar i = 0; i < TRANS_LEN; i += 1) begin
            always @(posedge clock) begin
                if (reset) begin
                    data_read_o <= 64'b0;
                end
                else if (axi_r_ready_o & axi_r_valid_i) begin
                    if (~aligned & overstep) begin
                        if (len[0]) begin
                            data_read_o[YSYX210302_AXI_DATA_WIDTH-1:0] <= data_read_o[YSYX210302_AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                        end
                        else begin
                            data_read_o[YSYX210302_AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                        end
                    end
                    else if (len == 0) begin
                        data_read_o[0*YSYX210302_AXI_DATA_WIDTH+:YSYX210302_AXI_DATA_WIDTH] <= axi_r_data_l;
                    end
                end
            end
        //end
    //endgenerate

endmodule


module ysyx_210302_mem_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter YSYX210302_AXI_DATA_WIDTH    = 64,
    parameter YSYX210302_AXI_ADDR_WIDTH    = 32,
    parameter YSYX210302_AXI_ID_WIDTH      = 4)(
    input                               clock,
    input                               reset,
    input                               r_ready_m0,

	input                               rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH -1:0]     data_read_o,
    input  [RW_DATA_WIDTH-1:0]          data_write_i,
    input  [YSYX210302_AXI_ADDR_WIDTH-1:0]         rw_addr_i,
    input  [1:0]                        rw_size_i,
    output [1:0]                        rw_resp_o,
    output [1:0]                        rw_w_state,
    output [1:0]                        rw_r_state,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [YSYX210302_AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [YSYX210302_AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,


    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output reg [YSYX210302_AXI_DATA_WIDTH-1:0]     axi_w_data_o,
    output reg [YSYX210302_AXI_DATA_WIDTH/8-1:0]   axi_w_strb_o,
    output reg                          axi_w_last_o,

    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,


    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [YSYX210302_AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [YSYX210302_AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,


    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [YSYX210302_AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i);

    reg [1:0] w_state, r_state;
    wire w_trans    = (rw_req_i == `YSYX210302_REQ_WRITE ); //w_state需要进入idle才可以跳转，防止新的指令来的时候b_valid还没出现，导致w_trans变化使得状态机异常
    wire r_trans    = rw_req_i == `YSYX210302_REQ_READ;
    wire w_valid    = (rw_valid_i & w_trans )| (w_state > 2'b01);
    wire r_valid    = (rw_valid_i & r_trans); 

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i ;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i ;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = w_valid ? b_hs : r_done;

        reg rw_ready;
    wire rw_ready_nxt = trans_done;
    wire rw_ready_en      = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 1'b0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
        end
    end
    assign rw_ready_o     = rw_ready;

    
    // ------------------State Machine------------------
    wire [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    wire [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    wire /*w_state_idle = w_state == W_STATE_IDLE, */w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
    wire /*r_state_idle = r_state == R_STATE_IDLE,*/ r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= R_STATE_IDLE;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE:  if ( r_ready_m0 == 0 & rw_ready == 0) w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
                    W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_IDLE;
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
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE: if ( r_ready_m0 == 0 & rw_ready == 0) r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (r_done)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end


  


    // ------------------Process Data------------------
    localparam ALIGNED_WIDTH = $clog2(YSYX210302_AXI_DATA_WIDTH / 8);
    // localparam OFFSET_WIDTH  = $clog2(YSYX210302_AXI_DATA_WIDTH);
    localparam AXI_SIZE      = $clog2(YSYX210302_AXI_DATA_WIDTH / 8);
    // localparam MASK_WIDTH    = YSYX210302_AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / YSYX210302_AXI_DATA_WIDTH;

    wire aligned            = TRANS_LEN != 1 | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210302_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210302_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210302_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210302_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end<4'b1000 ?  addr_end[3:ALIGNED_WIDTH] != 0 : addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    wire [YSYX210302_AXI_ADDR_WIDTH-1:0] axi_addr    = (`YSYX210302_UART16550_BEG_ADDR<rw_addr_i)& (rw_addr_i < `YSYX210302_UART16550_END_ADDR) ? rw_addr_i[31 : 0]: //UART地址不用对齐
                                           ( (`YSYX210302_SPI_FLASH_BEG_ADDR<rw_addr_i)& (rw_addr_i < `YSYX210302_SPI_FLASH_END_ADDR) ? {rw_addr_i[31 : 2],2'b0}: //flash4位对齐
                                            {rw_addr_i[YSYX210302_AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}});//mem 3bit对齐
    wire [2:0] axi_size     = axi_addr >= `YSYX210302_APB_END_ADDR ? AXI_SIZE[2:0] : 3'b010; 
    // wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    // wire [6:0] aligned_offset_h_tem             = YSYX210302_AXI_DATA_WIDTH - aligned_offset_l;
    // wire [OFFSET_WIDTH-1:0] aligned_offset_h    = aligned_offset_h_tem[6] ? aligned_offset_h_tem[5:0]:aligned_offset_h_tem[5:0];
    // wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
    //                                                 | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
    //                                                 | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
    //                                                 | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
    //                                                 ) << aligned_offset_l;
    // wire [YSYX210302_AXI_DATA_WIDTH-1:0] mask_l      = mask[YSYX210302_AXI_DATA_WIDTH-1:0];
    // wire [YSYX210302_AXI_DATA_WIDTH-1:0] mask_h      = mask[MASK_WIDTH-1:YSYX210302_AXI_DATA_WIDTH];

    wire [YSYX210302_AXI_ID_WIDTH-1:0] axi_id        = {YSYX210302_AXI_ID_WIDTH{1'b1}};
    wire [63:0] mask64_tem = size_b ? 64'h00000000_000000ff : (size_h ? 64'h00000000_0000ffff : ( size_w ? 64'h00000000_ffffffff : (size_d ? 64'hffffffff_ffffffff : 64'h0)));
    wire [2:0] aligned_offset_tem = rw_addr_i[2:0];
    wire [5:0] aligned_offset = {3'b0,aligned_offset_tem} << 2'b11;
    wire [7:0] mask8_tem   = {mask64_tem[63],mask64_tem[55],mask64_tem[47],mask64_tem[39],mask64_tem[31],mask64_tem[23],mask64_tem[15],mask64_tem[7]};
    wire [7:0] mask_ram = mask8_tem << aligned_offset_tem;
    wire [63:0] data_w_ram = (data_write_i << aligned_offset);
    wire [63:0] data_r_ram = ((axi_r_data_i >> aligned_offset ) & mask64_tem);
 



    reg [1:0] rw_resp;
    wire rw_resp_nxt = w_trans ? axi_b_resp_i[0] : axi_r_resp_i[0];
    wire resp_en = trans_done;
    always @(posedge clock) begin
        if (reset) begin
            rw_resp <= 2'b0;
        end
        else if (resp_en) begin
            rw_resp <= {((axi_b_resp_i[1] | axi_r_resp_i[1])&1'b0),rw_resp_nxt};
        end
    end
    assign rw_resp_o      = rw_resp;

      // ------------------Number of transmission------------------
    wire [7:0] len = 8'h00;
    // wire len_reset      = reset | (w_trans & w_state_idle) | (r_trans & r_state_idle);
    // wire len_incr_en    = (len != axi_len) & (w_hs | r_hs);
    // always @(posedge clock) begin
    //     if (len_reset) begin
    //         len <= 8'b0;
    //     end
    //     else if (len_incr_en) begin
    //         len <= len + 1;
    //     end
    // end


    // ------------------Write Transaction------------------
    assign rw_w_state       = w_state;
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = axi_addr;
    assign axi_aw_id_o      = w_trans ? axi_id  : 0;
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = axi_size;
    assign axi_aw_burst_o   = `YSYX210302_AXI_BURST_TYPE_INCR;

    // wire [YSYX210302_AXI_DATA_WIDTH-1:0] axi_w_data_l  = (mask_l & ( data_write_i << aligned_offset_l ) );
    // wire [YSYX210302_AXI_DATA_WIDTH-1:0] axi_w_data_h  = (mask_h & ( data_write_i >> aligned_offset_h ) );
    //generate
        //for (genvar i = 0; i < TRANS_LEN; i += 1) begin
            always @(negedge clock) begin
                if (reset) begin
                    axi_w_data_o[0*YSYX210302_AXI_DATA_WIDTH+:YSYX210302_AXI_DATA_WIDTH] <= 64'b0; //
                    axi_w_strb_o                                   <= 8'b0;
                    axi_w_last_o                                   <= 1'b0;
                end
                else if (2'b00<w_state/*axi_w_ready_i *//*& axi_w_valid_o*/) begin
                    if (axi_addr<`YSYX210302_APB_END_ADDR)begin
                        if (axi_addr[1:0] == 2'b0) begin
                            axi_w_data_o    <= {32'b0,data_write_i[31:0]};
                            axi_w_strb_o    <= 8'h01;
                        end
                        else if (axi_addr[1:0] == 2'b01) begin
                            axi_w_data_o    <= {32'b0,16'b0,data_write_i[7:0],8'b0};
                            axi_w_strb_o    <= 8'h02;
                        end
                        else if (axi_addr[1:0] == 2'b10) begin
                            axi_w_data_o    <= {32'b0,8'b0,data_write_i[7:0],16'b0};
                            axi_w_strb_o    <= 8'h04;
                        end
                        else begin
                            axi_w_data_o    <= {32'b0,data_write_i[7:0],24'b0};
                            axi_w_strb_o    <= 8'h08;
                        end
                    end
                    else begin
                        axi_w_data_o <= data_w_ram;
                        axi_w_strb_o <= mask_ram;
                    end
                end
                if ( len == axi_len )
                    axi_w_last_o <= 1'b1;
                else
                    axi_w_last_o <= 1'b0;
            end
        //end
    //endgenerate
            
    assign axi_w_valid_o    = w_state_write;


    assign axi_b_ready_o    = w_state_resp;

    
    // ------------------Read Transaction------------------

    // Read address channel signals
    assign rw_r_state       = r_state;
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = axi_addr;
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210302_AXI_BURST_TYPE_INCR;


    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    // wire [YSYX210302_AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    // wire [YSYX210302_AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;

    //generate
        //for (genvar i = 0; i < TRANS_LEN; i += 1) begin
            always @(posedge clock) begin
                if (reset) begin
                    data_read_o <= 64'b0;
                end
                else if (axi_r_ready_o & axi_r_valid_i) begin
                    if (axi_addr<`YSYX210302_APB_END_ADDR)begin

                            if (rw_addr_i[1:0] == 2'b00) begin
                                data_read_o    <= {32'b0,axi_r_data_i[31:0]};
                            end
                            else if (rw_addr_i[1:0] == 2'b01) begin
                                data_read_o    <= {40'b0,axi_r_data_i[31:8]};
                            end
                            else if (rw_addr_i[1:0] == 2'b10) begin
                                data_read_o    <= {48'b0,axi_r_data_i[31:16]};
                            end
                            else data_read_o    <= {56'b0,axi_r_data_i[31:24]};

                    end
                    // else if (~aligned & overstep) begin
                    //     if (len[0]) begin
                    //         data_read_o[YSYX210302_AXI_DATA_WIDTH-1:0] <= data_read_o[YSYX210302_AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                    //     end
                    //     else begin
                    //         data_read_o[YSYX210302_AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                    //     end
                    // end
                    else begin
                        data_read_o <= data_r_ram;
                    end
                end
            end
        //end
    //endgenerate

endmodule



module ysyx_210302_if_stage(input wire              clk,
                input wire              rst,
                input                   load_hazard,
                input                   csr_hazard,
                input wire              jumpb_en,
                input wire              jumpr_en,
                input                   time_intr_pc,
                input      [ `YSYX210302_LEN :0 ]  WB_mtvec_read,
                                        WB_mepc_read,
                input       [1  :  0]   mem_w_state,
                input       [1  :  0]   mem_r_state,
                input       [1  :  0]   if_axi_resp,
                input       [ 63 : 0 ]  if_axi_data_read,
                input                   if_axi_ready,
                output                  if_axi_req,
                output      [ 31 : 0 ]  if_axi_addr,
                output      [  1 : 0 ]  if_axi_size,
                output                  if_axi_valid,
                input       [ 63 : 0 ]  ID_offset,
                input       [63 :  0]   ID_myinst_addr,
                output reg  [ 63 : 0 ]  IF_myinst_addr,
                output reg  [ 31 : 0 ]  IF_inst,
                output                  IF_pc_handshake,
                output reg              IF_module_work,
                output reg              IF_fetch_wrong,
                output reg              IF_intr_refetch);
    
    reg [ `YSYX210302_REG_BUS ]pc;
    wire   pc_stall;
    assign pc_stall = csr_hazard | load_hazard; 
    assign if_axi_size = `YSYX210302_SIZE_W;
    assign if_axi_addr = pc[31:0];
    assign if_axi_req = `YSYX210302_REQ_READ;

    reg intr_refetch_ok;
    always @( posedge clk )begin
        if (rst) begin
            intr_refetch_ok     <= 1'b0;
            IF_inst             <= 32'b0;
            IF_myinst_addr      <= 64'b0;
            IF_module_work      <= 1'b0;
        end
        else begin
            if (IF_pc_handshake) begin  
                if (IF_intr_refetch)begin
                    intr_refetch_ok      <= 1'b1;
                end
                else begin
                    /*if (mem_w_state>2'b01)begin
                        IF_inst         <= 32'b0;
                        intr_refetch_ok      <= 0;           //取到正确指令，握手信号置低
                        IF_myinst_addr  <= pc;
                        IF_module_work  <= 1;
                    end
                    else begin*/
                    IF_inst         <= if_axi_data_read[31 : 0];
                    intr_refetch_ok      <= 1'b0;           //取到正确指令，握手信号置低
                    IF_myinst_addr  <= pc;
                    IF_module_work  <= 1'b1;
                    
                end
            end
            else IF_module_work <=1'b0;
        end
    end




    assign if_axi_valid = !if_axi_ready;
    assign IF_pc_handshake = if_axi_ready & (if_axi_resp == 2'b00)&(mem_w_state==2'b00)&(mem_r_state==2'b00);
    always@( posedge clk )
    begin

        if ( rst == 1'b1 ) begin
            pc              <= `YSYX210302_PC_START;
            IF_fetch_wrong  <= 1'b0;
            IF_intr_refetch <= 1'b0;
        end
        else begin


            if ( jumpb_en ) begin
                if (IF_myinst_addr != ID_offset + ID_myinst_addr ) begin    //B类指令是否跳错
                    pc <= ID_offset + ID_myinst_addr;
                    IF_fetch_wrong <= 1'b1;
                end
                else IF_fetch_wrong <= 1'b0;
            end
            else if  ( jumpr_en )begin  //jalr是否跳错
                if (IF_myinst_addr != {ID_offset[ 63:1 ],ID_offset[ 0 ]& 1'b0} ) begin
                    pc <= {ID_offset[ 63:1 ],ID_offset[ 0 ]& 1'b0} ;
                    IF_fetch_wrong <= 1'b1;
                end 
                else IF_fetch_wrong <= 1'b0;
            end

            if ( time_intr_pc & pc != WB_mtvec_read & IF_myinst_addr != WB_mtvec_read)begin  //若已经取到了中断处理程序的指令，则不用跳入此分支
                pc      <= WB_mtvec_read;       //时钟中断
                IF_intr_refetch <= 1'b1;
            end
            else if ( IF_pc_handshake & ( !IF_intr_refetch ) /*&(mem_w_state==2'b00|mem_w_state==2'b01)*/) begin
                if ( if_axi_data_read[6:0] ==`YSYX210302_J_TYPE )begin  //jal
                    pc  <= pc + { {44{if_axi_data_read[ 19 ]}} , if_axi_data_read[ 19 : 12 ] ,  if_axi_data_read[ 20 ] , if_axi_data_read[ 30 : 21 ] , 1'b0 };     
                    IF_fetch_wrong  <= 1'b0;
                end
                else if ( if_axi_data_read[6:0] ==`YSYX210302_B_TYPE )begin //B类
                    pc  <= pc + 4;
                    IF_fetch_wrong  <= 1'b0;
                end
                else if (if_axi_data_read == 64'h00000073)begin  //ecall
                    pc  <= WB_mtvec_read;
                end
                else if (if_axi_data_read == 64'h30200073)begin  //mret
                    pc  <= WB_mepc_read;
                end
                else begin
                    pc  <= pc + 4;
                    IF_fetch_wrong  <= 1'b0;
                end   

            end


            if ( IF_pc_handshake) begin
                IF_fetch_wrong  <= 1'b0;
            end
            if (pc_stall & (!IF_pc_handshake))begin  //在需要pc不加的时候IF_pc_handshake=0，需要pc加的时候IF_pc_handshake=1
                pc <= IF_myinst_addr;                   //发生load-use数据冒险，pc不增加;
            end
            if (intr_refetch_ok) begin
                IF_intr_refetch <= 1'b0;
            end
        end

    end 
endmodule


module ysyx_210302_IFID  (
    input               i_IFID_last_valid,
    input               i_IFID_next_allowin,
    input               i_IFID_clk,
    input               i_IFID_rst,
    input   [63:0]      i_IFID_myinst_addr,
    input   [31:0]      i_IFID_inst,
    input               i_IFID_pc_handshake,
    input               i_IFID_flush,
    input               i_IFID_stall,
    input               i_intr_flush,
           
    output              o_IFID_next_valid,
    output              o_IFID_last_allowin,
    output  [63:0]      o_IFID_myinst_addr,
    output  [31:0]      o_IFID_inst,
    output              o_IFID_pc_handshake
    );

    wire            IFID_ready_go;
    reg             IFID_valid;                      //本级是否有有效信号

    reg             IFID_pc_handshake;
    reg     [63:0]  IFID_myinst_addr;
    reg     [31:0]  IFID_inst;



    assign      IFID_ready_go       = !i_IFID_stall;        //是否允许将本级信号给下一级
    assign      o_IFID_last_allowin = !IFID_valid  || IFID_ready_go & i_IFID_next_allowin;        //是否允许接受上一级的数据
    assign      o_IFID_next_valid   = IFID_valid & IFID_ready_go;             //是否有数据需要传给下一级（当前级有有效数据且允许将将本级信号给下一级时有效）  
    assign      o_IFID_pc_handshake = IFID_pc_handshake;
    assign      o_IFID_myinst_addr  = IFID_myinst_addr;
    assign      o_IFID_inst         = IFID_inst;  
    always @(posedge i_IFID_clk) begin
        if ( i_IFID_rst ) begin
            IFID_valid          <=  1'b0;
            IFID_myinst_addr    <=  64'b0;
            IFID_inst           <=  32'b0;
            IFID_pc_handshake   <=  1'b0;
        end   
        else begin
            if ( o_IFID_last_allowin )begin
                IFID_valid   <= i_IFID_last_valid;
            end
            if ( (i_IFID_flush & o_IFID_last_allowin & i_IFID_last_valid & !i_IFID_stall) | i_intr_flush)begin
                IFID_myinst_addr    <=  64'b0;
                IFID_inst           <=  32'b0;
            end

            else if ( o_IFID_last_allowin & i_IFID_last_valid )begin
                IFID_pc_handshake   <=  i_IFID_pc_handshake;
                IFID_myinst_addr    <=  i_IFID_myinst_addr;
                IFID_inst           <=  i_IFID_inst;

            end
        end
    end

     
endmodule


module ysyx_210302_IDEXE  (
    input               i_IDEXE_last_valid,
    input               i_IDEXE_next_allowin,
    input               i_IDEXE_clk,
    input               i_IDEXE_rst,
    input   [63 :  0]   i_IDEXE_myinst_addr,
    input               i_IDEXE_rd_en,
    input   [4  :  0]   i_IDEXE_rd_addr,
    input   [5  :  0]   i_IDEXE_shamt,
    input   [6  :  0]   i_IDEXE_funct7,
    input   [6  :  0]   i_IDEXE_opcode,
    input   [2  :  0]   i_IDEXE_funct3,
    input               i_IDEXE_sub_en,
    input               i_IDEXE_load_en,
    input               i_IDEXE_alu_en,
    input               i_IDEXE_store_en,
    input               i_IDEXE_csr_en,
    input               i_IDEXE_csr_wr_en,
    input               i_IDEXE_ecall_en,
    input               i_IDEXE_mret_en,
    input   [11 :  0]   i_IDEXE_csr_addr,
    input   [63 :  0]   i_IDEXE_csr_wr_data,
    input   [63 :  0]   i_IDEXE_ext_ui_imm,
    input   [31 :  0]   i_IDEXE_mem_addr,
    input   [1  :  0]   i_IDEXE_mem_size,
    input               i_IDEXE_mem_valid,
    input               i_IDEXE_mem_req,
    input               i_IDEXE_clint_write_en,
    input               i_IDEXE_clint_read_en,
    input               i_IDEXE_clint_mtime_en,
    input               i_IDEXE_clint_mtimecmp_en,
    input   [63 :  0]   i_IDEXE_op1,
    input   [63 :  0]   i_IDEXE_op2,
    input               i_IF_pc_handshake,     
    input               IDEXE_flush,
    input               i_IDEXE_stall,


    output              o_IDEXE_next_valid,
    output              o_IDEXE_last_allowin,
    output  [63 :  0]   o_IDEXE_myinst_addr,
    output              o_IDEXE_rd_en,
    output  [4  :  0]   o_IDEXE_rd_addr,
    output  [5  :  0]   o_IDEXE_shamt,
    output  [6  :  0]   o_IDEXE_funct7,
    output  [6  :  0]   o_IDEXE_opcode,
    output  [2  :  0]   o_IDEXE_funct3,
    output              o_IDEXE_sub_en,
    output              o_IDEXE_load_en,
    output              o_IDEXE_alu_en,
    output              o_IDEXE_store_en,
    output              o_IDEXE_csr_en,
    output              o_IDEXE_csr_wr_en,
    output              o_IDEXE_ecall_en,
    output              o_IDEXE_mret_en,
    output  [11 :  0]   o_IDEXE_csr_addr,
    output  [63 :  0]   o_IDEXE_csr_wr_data,
    output  [63 :  0]   o_IDEXE_ext_ui_imm,
    output  [31 :  0]   o_IDEXE_mem_addr,
    output  [1  :  0]   o_IDEXE_mem_size,
    output              o_IDEXE_mem_valid,
    output              o_IDEXE_mem_req,
    output              o_IDEXE_clint_write_en,
    output              o_IDEXE_clint_read_en,
    output              o_IDEXE_clint_mtime_en,
    output              o_IDEXE_clint_mtimecmp_en,
    output  [63 :  0]   o_IDEXE_op1,
    output  [63 :  0]   o_IDEXE_op2
    );

    wire                  IDEXE_ready_go;
    reg                   IDEXE_valid;                      //本级是否有有效信号
    reg     [63 :  0]     IDEXE_myinst_addr;
    reg                   IDEXE_rd_en;
    reg     [4  :  0]     IDEXE_rd_addr;
    reg     [5  :  0]     IDEXE_shamt;
    reg     [6  :  0]     IDEXE_funct7;
    reg     [6  :  0]     IDEXE_opcode;
    reg     [2  :  0]     IDEXE_funct3;
    reg                   IDEXE_sub_en;
    reg                   IDEXE_load_en;
    reg                   IDEXE_alu_en;
    reg                   IDEXE_store_en;
    reg                   IDEXE_csr_en;
    reg                   IDEXE_csr_wr_en;
    reg                   IDEXE_ecall_en;
    reg                   IDEXE_mret_en;
    reg     [11 :  0]     IDEXE_csr_addr;
    reg     [63 :  0]     IDEXE_csr_wr_data;
    reg     [63 :  0]     IDEXE_ext_ui_imm;
    reg     [31 :  0]     IDEXE_mem_addr;
    reg     [1  :  0]     IDEXE_mem_size;
    reg                   IDEXE_mem_valid;
    reg                   IDEXE_mem_req;
    reg                   IDEXE_clint_write_en;
    reg                   IDEXE_clint_read_en;
    reg                   IDEXE_clint_mtime_en;
    reg                   IDEXE_clint_mtimecmp_en;
    reg     [63 :  0]     IDEXE_op1;
    reg     [63 :  0]     IDEXE_op2;


  

    assign      IDEXE_ready_go          = !i_IDEXE_stall ;        //是否允许将本级信号给下一级
    assign      o_IDEXE_last_allowin    = !IDEXE_valid  || IDEXE_ready_go & i_IDEXE_next_allowin;        //是否允许接受上一级的数据
    assign      o_IDEXE_next_valid      = IDEXE_valid & IDEXE_ready_go;             //是否有数据需要传给下一级（当前级有有效数据且允许将将本级信号给下一级时有效）  
    assign      o_IDEXE_myinst_addr     = IDEXE_myinst_addr;
    assign      o_IDEXE_rd_en           = IDEXE_rd_en;
    assign      o_IDEXE_rd_addr         = IDEXE_rd_addr;
    assign      o_IDEXE_shamt           = IDEXE_shamt;
    assign      o_IDEXE_funct7          = IDEXE_funct7;
    assign      o_IDEXE_opcode          = IDEXE_opcode;
    assign      o_IDEXE_funct3          = IDEXE_funct3;
    assign      o_IDEXE_sub_en          = IDEXE_sub_en;
    assign      o_IDEXE_load_en         = IDEXE_load_en;
    assign      o_IDEXE_alu_en          = IDEXE_alu_en;
    assign      o_IDEXE_store_en        = IDEXE_store_en;
    assign      o_IDEXE_csr_en          = IDEXE_csr_en;
    assign      o_IDEXE_csr_wr_en       = IDEXE_csr_wr_en;
    assign      o_IDEXE_ecall_en        = IDEXE_ecall_en;
    assign      o_IDEXE_mret_en         = IDEXE_mret_en;
    assign      o_IDEXE_csr_addr        = IDEXE_csr_addr;
    assign      o_IDEXE_csr_wr_data     = IDEXE_csr_wr_data;
    assign      o_IDEXE_ext_ui_imm      = IDEXE_ext_ui_imm;
    assign      o_IDEXE_mem_addr        = IDEXE_mem_addr;
    assign      o_IDEXE_mem_size        = IDEXE_mem_size;
    assign      o_IDEXE_mem_valid       = IDEXE_mem_valid;
    assign      o_IDEXE_mem_req         = IDEXE_mem_req;
    assign      o_IDEXE_clint_write_en  = IDEXE_clint_write_en;
    assign      o_IDEXE_clint_read_en   = IDEXE_clint_read_en;
    assign      o_IDEXE_clint_mtime_en  = IDEXE_clint_mtime_en;
    assign      o_IDEXE_clint_mtimecmp_en = IDEXE_clint_mtimecmp_en;
    assign      o_IDEXE_op1             = IDEXE_op1;
    assign      o_IDEXE_op2             = IDEXE_op2;  






    always @(posedge i_IDEXE_clk) begin
        if ( i_IDEXE_rst ) begin
            IDEXE_myinst_addr    <=  64'b0;
            IDEXE_rd_en          <=  1'b0;
            IDEXE_rd_addr        <=  5'b0;
            IDEXE_shamt          <=  6'b0;
            IDEXE_funct7         <=  7'b0;
            IDEXE_opcode         <=  7'b0;
            IDEXE_funct3         <=  3'b0;
            IDEXE_sub_en         <=  1'b0;
            IDEXE_load_en        <=  1'b0;
            IDEXE_alu_en         <=  1'b0;
            IDEXE_store_en       <=  1'b0;
            IDEXE_csr_en         <=  1'b0;
            IDEXE_csr_wr_en      <=  1'b0;
            IDEXE_ecall_en       <=  1'b0;
            IDEXE_mret_en        <=  1'b0;
            IDEXE_csr_addr       <=  12'b0;
            IDEXE_csr_wr_data    <=  64'b0;
            IDEXE_ext_ui_imm     <=  64'b0;
            IDEXE_mem_addr       <=  32'b0;
            IDEXE_mem_size       <=  2'b0;
            IDEXE_mem_valid      <=  1'b0;
            IDEXE_mem_req        <=  1'b0;
            IDEXE_clint_write_en <=  1'b0;
            IDEXE_clint_read_en  <=  1'b0;
            IDEXE_clint_mtime_en <=  1'b0;
            IDEXE_clint_mtimecmp_en <= 1'b0;
            IDEXE_op1            <=  64'b0;
            IDEXE_op2            <=  64'b0;
            IDEXE_valid          <=  1'b0;

        end   
        else begin
            if ( o_IDEXE_last_allowin )begin
                IDEXE_valid   <= i_IDEXE_last_valid;
            end
            if ( !i_IDEXE_stall & o_IDEXE_last_allowin & i_IF_pc_handshake)begin
                if (IDEXE_flush) begin
                IDEXE_myinst_addr    <=  64'b0;
                IDEXE_rd_en          <=  1'b0;
                IDEXE_rd_addr        <=  5'b0;
                IDEXE_shamt          <=  6'b0;
                IDEXE_funct7         <=  7'b0;
                IDEXE_opcode         <=  7'b0;
                IDEXE_funct3         <=  3'b0;
                IDEXE_sub_en         <=  1'b0;
                IDEXE_load_en        <=  1'b0;
                IDEXE_alu_en         <=  1'b0;
                IDEXE_store_en       <=  1'b0;
                IDEXE_csr_en         <=  1'b0;
                IDEXE_csr_wr_en      <=  1'b0;
                IDEXE_ecall_en       <=  1'b0;
                IDEXE_mret_en        <=  1'b0;
                IDEXE_csr_addr       <=  12'b0;
                IDEXE_csr_wr_data    <=  64'b0;
                IDEXE_ext_ui_imm     <=  64'b0;
                IDEXE_mem_addr       <=  32'b0;
                IDEXE_mem_size       <=  2'b0;
                IDEXE_mem_valid      <=  1'b0;
                IDEXE_mem_req        <=  1'b0;
                IDEXE_clint_write_en <=  1'b0;
                IDEXE_clint_read_en  <=  1'b0;
                IDEXE_clint_mtime_en <=  1'b0;
                IDEXE_clint_mtimecmp_en <=  1'b0;
                IDEXE_op1            <=  64'b0;
                IDEXE_op2            <=  64'b0;
                end
                else begin
                IDEXE_myinst_addr    <=  i_IDEXE_myinst_addr;
                IDEXE_rd_en          <=  i_IDEXE_rd_en;
                IDEXE_rd_addr        <=  i_IDEXE_rd_addr;
                IDEXE_shamt          <=  i_IDEXE_shamt;
                IDEXE_funct7         <=  i_IDEXE_funct7;
                IDEXE_opcode         <=  i_IDEXE_opcode;
                IDEXE_funct3         <=  i_IDEXE_funct3;
                IDEXE_sub_en         <=  i_IDEXE_sub_en;
                IDEXE_load_en        <=  i_IDEXE_load_en;
                IDEXE_alu_en         <=  i_IDEXE_alu_en;
                IDEXE_store_en       <=  i_IDEXE_store_en;
                IDEXE_csr_en         <=  i_IDEXE_csr_en;
                IDEXE_csr_wr_en      <=  i_IDEXE_csr_wr_en;
                IDEXE_ecall_en       <=  i_IDEXE_ecall_en;
                IDEXE_mret_en        <=  i_IDEXE_mret_en;
                IDEXE_csr_addr       <=  i_IDEXE_csr_addr;
                IDEXE_csr_wr_data    <=  i_IDEXE_csr_wr_data;
                IDEXE_ext_ui_imm     <=  i_IDEXE_ext_ui_imm;
                IDEXE_mem_addr       <=  i_IDEXE_mem_addr;
                IDEXE_mem_size       <=  i_IDEXE_mem_size;
                IDEXE_mem_valid      <=  i_IDEXE_mem_valid;
                IDEXE_mem_req        <=  i_IDEXE_mem_req;
                IDEXE_clint_write_en <=  i_IDEXE_clint_write_en;
                IDEXE_clint_read_en  <=  i_IDEXE_clint_read_en;
                IDEXE_clint_mtime_en <=  i_IDEXE_clint_mtime_en;
                IDEXE_clint_mtimecmp_en <= i_IDEXE_clint_mtimecmp_en;
                IDEXE_op1            <=  i_IDEXE_op1;
                IDEXE_op2            <=  i_IDEXE_op2;
                end
            end
        end
    end

     
endmodule


module ysyx_210302_EXEMEM  (
    input               i_EXEMEM_last_valid,
    input               i_EXEMEM_next_allowin,
    input               i_EXEMEM_clk,
    input               i_EXEMEM_rst,
    input   [63 :  0]   i_EXEMEM_myinst_addr,
    input               i_EXEMEM_rd_en,
    input   [4  :  0]   i_EXEMEM_rd_addr,
    input   [63 :  0]   i_EXEMEM_store_data,
    input   [6  :  0]   i_EXEMEM_opcode,
    input   [2  :  0]   i_EXEMEM_funct3,
    input               i_EXEMEM_load_en,
    input               i_EXEMEM_csr_en,
    input               i_EXEMEM_csr_wr_en,
    input               i_EXEMEM_ecall_en,
    input               i_EXEMEM_mret_en,
    input   [11 :  0]   i_EXEMEM_csr_addr,
    input   [63 :  0]   i_EXEMEM_csr_wr_data,
    input   [31 :  0]   i_EXEMEM_mem_addr,
    input   [1  :  0]   i_EXEMEM_mem_size,
    input               i_EXEMEM_mem_valid,
    input               i_EXEMEM_mem_req,
    input               i_EXEMEM_clint_write_en,
    input               i_EXEMEM_clint_read_en,
    input               i_EXEMEM_clint_mtime_en,
    input               i_EXEMEM_clint_mtimecmp_en,
    input   [63 :  0]   i_EXEMEM_rd_data,
    input               i_IF_pc_handshake,   
    input               i_EXEMEM_stall,
    input               i_EXEMEM_flush,
  
           
    output              o_EXEMEM_next_valid,
    output              o_EXEMEM_last_allowin,
    output  [63 :  0]   o_EXEMEM_myinst_addr,
    output              o_EXEMEM_rd_en,
    output  [4  :  0]   o_EXEMEM_rd_addr,
    output  [63 :  0]   o_EXEMEM_store_data,
    output  [6  :  0]   o_EXEMEM_opcode,
    output  [2  :  0]   o_EXEMEM_funct3,
    output              o_EXEMEM_load_en,
    output              o_EXEMEM_csr_en,
    output              o_EXEMEM_csr_wr_en,
    output              o_EXEMEM_ecall_en,
    output              o_EXEMEM_mret_en,
    output  [11 :  0]   o_EXEMEM_csr_addr,
    output  [63 :  0]   o_EXEMEM_csr_wr_data,
    output  [31 :  0]   o_EXEMEM_mem_addr,
    output  [1  :  0]   o_EXEMEM_mem_size,
    output              o_EXEMEM_mem_valid,
    output              o_EXEMEM_mem_req,
    output              o_EXEMEM_clint_write_en,
    output              o_EXEMEM_clint_read_en,
    output              o_EXEMEM_clint_mtime_en,
    output              o_EXEMEM_clint_mtimecmp_en,
    output  [63 :  0]   o_EXEMEM_rd_data

    );

    wire                  EXEMEM_ready_go;
    reg                   EXEMEM_valid;                      //本级是否有有效信号
    reg     [63 :  0]     EXEMEM_myinst_addr;
    reg                   EXEMEM_rd_en;
    reg     [4  :  0]     EXEMEM_rd_addr;
    reg     [63 :  0]     EXEMEM_store_data;
    reg     [6  :  0]     EXEMEM_opcode;
    reg     [2  :  0]     EXEMEM_funct3;
    reg                   EXEMEM_load_en;
    reg                   EXEMEM_csr_en;
    reg                   EXEMEM_csr_wr_en;
    reg                   EXEMEM_ecall_en;
    reg                   EXEMEM_mret_en;
    reg     [11 :  0]     EXEMEM_csr_addr;
    reg     [63 :  0]     EXEMEM_csr_wr_data;
    reg     [31 :  0]     EXEMEM_mem_addr;
    reg     [1  :  0]     EXEMEM_mem_size;
    reg                   EXEMEM_mem_valid;
    reg                   EXEMEM_mem_req;
    reg                   EXEMEM_clint_write_en;
    reg                   EXEMEM_clint_read_en;
    reg                   EXEMEM_clint_mtime_en;
    reg                   EXEMEM_clint_mtimecmp_en;
    reg     [63 :  0]     EXEMEM_rd_data;  



  

    assign     EXEMEM_ready_go          = !i_EXEMEM_stall;        //是否允许将本级信号给下一级
    assign     o_EXEMEM_last_allowin    = !EXEMEM_valid  || EXEMEM_ready_go & i_EXEMEM_next_allowin;        //是否允许接受上一级的数据
    assign     o_EXEMEM_next_valid      = EXEMEM_valid & EXEMEM_ready_go;             //是否有数据需要传给下一级（当前级有有效数据且允许将将本级信号给下一级时有效）  
    assign     o_EXEMEM_myinst_addr     = EXEMEM_myinst_addr;
    assign     o_EXEMEM_rd_en           = EXEMEM_rd_en;
    assign     o_EXEMEM_rd_addr         = EXEMEM_rd_addr;
    assign     o_EXEMEM_store_data      = EXEMEM_store_data;
    assign     o_EXEMEM_opcode          = EXEMEM_opcode;
    assign     o_EXEMEM_funct3          = EXEMEM_funct3;
    assign     o_EXEMEM_load_en         = EXEMEM_load_en;
    assign     o_EXEMEM_csr_en          = EXEMEM_csr_en;
    assign     o_EXEMEM_csr_wr_en       = EXEMEM_csr_wr_en;
    assign     o_EXEMEM_ecall_en        = EXEMEM_ecall_en;
    assign     o_EXEMEM_mret_en         = EXEMEM_mret_en;
    assign     o_EXEMEM_csr_addr        = EXEMEM_csr_addr;
    assign     o_EXEMEM_csr_wr_data     = EXEMEM_csr_wr_data;
    assign     o_EXEMEM_mem_addr        = EXEMEM_mem_addr;
    assign     o_EXEMEM_mem_size        = EXEMEM_mem_size;
    assign     o_EXEMEM_mem_valid       = EXEMEM_mem_valid;
    assign     o_EXEMEM_mem_req         = EXEMEM_mem_req;
    assign     o_EXEMEM_clint_write_en  = EXEMEM_clint_write_en;
    assign     o_EXEMEM_clint_read_en   = EXEMEM_clint_read_en;
    assign     o_EXEMEM_clint_mtime_en  = EXEMEM_clint_mtime_en;
    assign     o_EXEMEM_clint_mtimecmp_en = EXEMEM_clint_mtimecmp_en;
    assign     o_EXEMEM_rd_data         = EXEMEM_rd_data;



    always @(posedge i_EXEMEM_clk) begin
        if ( i_EXEMEM_rst ) begin
            EXEMEM_valid          <=  1'b0;
            EXEMEM_myinst_addr    <=  64'b0;
            EXEMEM_rd_en          <=  1'b0;
            EXEMEM_rd_addr        <=  5'b0;
            EXEMEM_store_data     <=  64'b0;
            EXEMEM_opcode         <=  7'b0;
            EXEMEM_funct3         <=  3'b0;
            EXEMEM_load_en        <=  1'b0;
            EXEMEM_csr_en         <=  1'b0;
            EXEMEM_csr_wr_en      <=  1'b0;
            EXEMEM_ecall_en       <=  1'b0;
            EXEMEM_mret_en        <=  1'b0;
            EXEMEM_csr_addr       <=  12'b0;
            EXEMEM_csr_wr_data    <=  64'b0;
            EXEMEM_mem_addr       <=  32'b0;
            EXEMEM_mem_size       <=  2'b0;
            EXEMEM_mem_valid      <=  1'b0;
            EXEMEM_mem_req        <=  1'b0;
            EXEMEM_clint_write_en <=  1'b0;
            EXEMEM_clint_read_en  <=  1'b0;
            EXEMEM_clint_mtime_en <=  1'b0;
            EXEMEM_clint_mtimecmp_en    <=  1'b0;
            EXEMEM_rd_data        <=  64'b0;
        end   
        else begin
            if ( o_EXEMEM_last_allowin )begin
                EXEMEM_valid   <= i_EXEMEM_last_valid;
            end
            if ( i_EXEMEM_flush & o_EXEMEM_last_allowin /*& i_EXEMEM_last_valid */& i_IF_pc_handshake)begin
                EXEMEM_myinst_addr    <=  64'b0;
                EXEMEM_rd_en          <=  1'b0;
                EXEMEM_rd_addr        <=  5'b0;
                EXEMEM_store_data     <=  64'b0;
                EXEMEM_opcode         <=  7'b0;
                EXEMEM_funct3         <=  3'b0;
                EXEMEM_load_en        <=  1'b0;
                EXEMEM_csr_en         <=  1'b0;
                EXEMEM_csr_wr_en      <=  1'b0;
                EXEMEM_ecall_en       <=  1'b0;
                EXEMEM_mret_en        <=  1'b0;
                EXEMEM_csr_addr       <=  12'b0;
                EXEMEM_csr_wr_data    <=  64'b0;
                EXEMEM_mem_addr       <=  32'b0;
                EXEMEM_mem_size       <=  2'b0;
                EXEMEM_mem_valid      <=  1'b0;
                EXEMEM_mem_req        <=  1'b0;
                EXEMEM_clint_write_en <=  1'b0;
                EXEMEM_clint_read_en    <=  1'b0;
                EXEMEM_clint_mtime_en    <=  1'b0;
                EXEMEM_clint_mtimecmp_en    <=  1'b0;
                EXEMEM_rd_data        <=  64'b0;
            end

            else if ( !i_EXEMEM_stall & o_EXEMEM_last_allowin /*& i_EXEMEM_last_valid */& i_IF_pc_handshake)begin
                EXEMEM_myinst_addr    <=  i_EXEMEM_myinst_addr;
                EXEMEM_rd_en          <=  i_EXEMEM_rd_en;
                EXEMEM_rd_addr        <=  i_EXEMEM_rd_addr;
                EXEMEM_store_data     <=  i_EXEMEM_store_data;
                EXEMEM_opcode         <=  i_EXEMEM_opcode;
                EXEMEM_funct3         <=  i_EXEMEM_funct3;
                EXEMEM_load_en        <=  i_EXEMEM_load_en;
                EXEMEM_csr_en         <=  i_EXEMEM_csr_en;
                EXEMEM_csr_wr_en      <=  i_EXEMEM_csr_wr_en;
                EXEMEM_ecall_en       <=  i_EXEMEM_ecall_en;
                EXEMEM_mret_en        <=  i_EXEMEM_mret_en;
                EXEMEM_csr_addr       <=  i_EXEMEM_csr_addr;
                EXEMEM_csr_wr_data    <=  i_EXEMEM_csr_wr_data;
                EXEMEM_mem_addr       <=  i_EXEMEM_mem_addr;
                EXEMEM_mem_size       <=  i_EXEMEM_mem_size;
                EXEMEM_mem_valid      <=  i_EXEMEM_mem_valid;
                EXEMEM_mem_req        <=  i_EXEMEM_mem_req;
                EXEMEM_clint_write_en    <=  i_EXEMEM_clint_write_en;
                EXEMEM_clint_read_en    <=  i_EXEMEM_clint_read_en;
                EXEMEM_clint_mtime_en    <=  i_EXEMEM_clint_mtime_en;
                EXEMEM_clint_mtimecmp_en    <=  i_EXEMEM_clint_mtimecmp_en;
                EXEMEM_rd_data        <=  i_EXEMEM_rd_data;



            end
        end
    end

     
endmodule


module ysyx_210302_MEMWB  (
    input               i_MEMWB_last_valid,
    input               i_MEMWB_next_allowin,
    input               i_MEMWB_clk,
    input               i_MEMWB_rst,
    input   [63 :  0]   i_MEMWB_myinst_addr,
    input               i_MEMWB_rd_en,
    input   [4  :  0]   i_MEMWB_rd_addr,
    input   [6  :  0]   i_MEMWB_opcode,
    input   [2  :  0]   i_MEMWB_funct3,
    input               i_MEMWB_csr_en,
    input               i_MEMWB_csr_wr_en,
    input               i_MEMWB_ecall_en,
    input               i_MEMWB_mret_en,
    input   [11 :  0]   i_MEMWB_csr_addr,
    input   [63 :  0]   i_MEMWB_csr_wr_data,
    input   [63 :  0]   i_MEMWB_rd_data,
    input               i_IF_pc_handshake,   
    input               i_MEMWB_flush,
  
           

    output              o_MEMWB_last_allowin,
    output   [63 :  0]  o_MEMWB_myinst_addr,
    output              o_MEMWB_rd_en,
    output   [4  :  0]  o_MEMWB_rd_addr,
    output   [6  :  0]  o_MEMWB_opcode,
    output   [2  :  0]  o_MEMWB_funct3,
    output              o_MEMWB_csr_en,
    output              o_MEMWB_csr_wr_en,
    output              o_MEMWB_ecall_en,
    output              o_MEMWB_mret_en,
    output   [11 :  0]  o_MEMWB_csr_addr,
    output   [63 :  0]  o_MEMWB_csr_wr_data,
    output   [63 :  0]  o_MEMWB_rd_data



    );

    wire             MEMWB_ready_go;
    reg              MEMWB_valid;                      //本级是否有有效信号
    reg   [63 :  0]  MEMWB_myinst_addr;
    reg              MEMWB_rd_en;
    reg   [4  :  0]  MEMWB_rd_addr;
    reg   [6  :  0]  MEMWB_opcode;
    reg   [2  :  0]  MEMWB_funct3;
    reg              MEMWB_csr_en;
    reg              MEMWB_csr_wr_en;
    reg              MEMWB_ecall_en;
    reg              MEMWB_mret_en;
    reg   [11 :  0]  MEMWB_csr_addr;
    reg   [63 :  0]  MEMWB_csr_wr_data;
    reg   [63 :  0]  MEMWB_rd_data;





  

    assign     MEMWB_ready_go           = 1'b1;        //是否允许将本级信号给下一级
    assign     o_MEMWB_last_allowin     = !MEMWB_valid  || MEMWB_ready_go & i_MEMWB_next_allowin;       //是否允许接受上一级的数据
    assign     o_MEMWB_myinst_addr      = MEMWB_myinst_addr;
    assign     o_MEMWB_rd_en            = MEMWB_rd_en;
    assign     o_MEMWB_rd_addr          = MEMWB_rd_addr;
    assign     o_MEMWB_opcode           = MEMWB_opcode;
    assign     o_MEMWB_funct3           = MEMWB_funct3;
    assign     o_MEMWB_csr_en           = MEMWB_csr_en;
    assign     o_MEMWB_csr_wr_en        = MEMWB_csr_wr_en;
    assign     o_MEMWB_ecall_en         = MEMWB_ecall_en;
    assign     o_MEMWB_mret_en          = MEMWB_mret_en;
    assign     o_MEMWB_csr_addr         = MEMWB_csr_addr;
    assign     o_MEMWB_csr_wr_data      = MEMWB_csr_wr_data;
    assign     o_MEMWB_rd_data          = MEMWB_rd_data;

    always @(posedge i_MEMWB_clk) begin
        if ( i_MEMWB_rst ) begin
                MEMWB_myinst_addr     <=  64'b0;
                MEMWB_rd_en           <=  1'b0;
                MEMWB_rd_addr         <=  5'b0;
                MEMWB_opcode          <=  7'b0;
                MEMWB_funct3          <=  3'b0;
                MEMWB_csr_en          <=  1'b0;
                MEMWB_csr_wr_en       <=  1'b0;
                MEMWB_ecall_en        <=  1'b0;
                MEMWB_mret_en         <=  1'b0;
                MEMWB_csr_addr        <=  12'b0;
                MEMWB_csr_wr_data     <=  64'b0;
                MEMWB_rd_data         <=  64'b0;
                MEMWB_valid           <=  1'b0;
        end   
        else begin
            if ( o_MEMWB_last_allowin )begin
                MEMWB_valid   <= i_MEMWB_last_valid;
            end

            if ( o_MEMWB_last_allowin /*& i_MEMWB_last_valid */& i_IF_pc_handshake)begin
                if (i_MEMWB_flush)begin
                    MEMWB_myinst_addr     <=  64'b0;
                    MEMWB_rd_en           <=  1'b0;
                    MEMWB_rd_addr         <=  5'b0;
                    MEMWB_opcode          <=  7'b0;
                    MEMWB_funct3          <=  3'b0;
                    MEMWB_csr_en          <=  1'b0;
                    MEMWB_csr_wr_en       <=  1'b0;
                    MEMWB_ecall_en        <=  1'b0;
                    MEMWB_mret_en         <=  1'b0;
                    MEMWB_csr_addr        <=  12'b0;
                    MEMWB_csr_wr_data     <=  64'b0;
                    MEMWB_rd_data         <=  64'b0;             
                end
                else begin
                    MEMWB_myinst_addr     <=  i_MEMWB_myinst_addr;
                    MEMWB_rd_en           <=  i_MEMWB_rd_en;
                    MEMWB_rd_addr         <=  i_MEMWB_rd_addr;
                    MEMWB_opcode          <=  i_MEMWB_opcode;
                    MEMWB_funct3          <=  i_MEMWB_funct3;
                    MEMWB_csr_en          <=  i_MEMWB_csr_en;
                    MEMWB_csr_wr_en       <=  i_MEMWB_csr_wr_en;
                    MEMWB_ecall_en        <=  i_MEMWB_ecall_en;
                    MEMWB_mret_en         <=  i_MEMWB_mret_en;
                    MEMWB_csr_addr        <=  i_MEMWB_csr_addr;
                    MEMWB_csr_wr_data     <=  i_MEMWB_csr_wr_data;
                    MEMWB_rd_data         <=  i_MEMWB_rd_data;
                end


            end
        end
    end

     
endmodule


module ysyx_210302_jump_judge(
                  input                 rst,
                  input [ 63 : 0 ]      rs1_data,
                  input [ 63 : 0 ]      rs2_data,
                  input [ 2:0 ]         funct3,
                  input wire            jump_judge_en,
                  input                 jump_forward_ready,
                  output reg            jump_yes);
    
    always@( * )
        if (rst) jump_yes = 1'b0;
        else if ( jump_judge_en & jump_forward_ready )//MEM的前递如果时load指令，需要等load到数据后jump_forward_ready才为1，如果不是MEM前递，则一直为1
        begin
            case( funct3 )
                `YSYX210302_BEQ:
                if ( rs1_data == rs2_data ) jump_yes = 1'b1;
                else jump_yes       = 1'b0;
                `YSYX210302_BNE:
                if ( rs1_data != rs2_data ) jump_yes = 1'b1;
                else jump_yes       = 1'b0;
                `YSYX210302_BLT:begin
                    if ( rs1_data[ 63 ] > rs2_data[ 63 ] )
                        jump_yes    = 1'b1;
                    else if ( rs1_data[ 63 ] == rs2_data[ 63 ] )
                        if ( ( rs1_data[ 63 ] & ( ( rs1_data[ 62:0 ] - 1 ) < ( rs2_data[ 62:0 ] - 1 ) ) ) || ( ~rs1_data[ 63 ] & ~( rs1_data[ 62:0 ]  >= rs2_data[ 62:0 ] ) ) )
                            jump_yes      = 1'b1;
                        else
                            jump_yes      = 1'b0;
                    else jump_yes = 1'b0;
                        end
                `YSYX210302_BGE:begin
                        if ( rs1_data[ 63 ] > rs2_data[ 63 ] )
                            jump_yes = 1'b0;
                        else if ( rs1_data[ 63 ] == rs2_data[ 63 ] )
                            if ( ( rs1_data[ 63 ] & ( ( rs1_data[ 62:0 ] - 1 ) < ( rs2_data[ 62:0 ] - 1 ) ) ) || ( ~rs1_data[ 63 ] & ~( rs1_data[ 62:0 ]  >= rs2_data[ 62:0 ] ) ) )
                                jump_yes        = 1'b0;
                            else
                                jump_yes        = 1'b1;
                        else 
							jump_yes = 1'b1;
                            end
                `YSYX210302_BLTU:
                            if ( rs1_data < rs2_data ) jump_yes = 1'b1;
                            else jump_yes       = 1'b0;
                `YSYX210302_BGEU:
                    if ( rs1_data >= rs2_data ) jump_yes   = 1'b1;
                    else jump_yes       = 1'b0;
                default: jump_yes       = 1'b0;
            endcase
        end
        else jump_yes = 1'b0;
                    
endmodule


module ysyx_210302_mem_connector(
    input       [ 63:0 ]        mem_data_read,
    input       [ 2:0 ]         funct3,
    input                       clock,
    input                       rst,
    input                       MEM_mem_valid,
    input                       EXE_mem_req,
    input                       IF_pc_handshake,
    input                       MEM_mem_req,
    input                       mem_ready,
    input       [63 :  0]       MEM_store_data,
    input       [31 :  0]       MEM_mem_addr,
    input       [1  :  0]       MEM_mem_size,
    input       [1  :  0]       mem_resp,
    input       [63 :  0]       clint_data_read,
    input       [63 :  0]       MEM_rdtem_data,
    input                       MEM_load_en,
    input                       MEM_clint_write_en,
    input                       MEM_clint_read_en,
    input                       MEM_clint_mtime_en,
    input                       MEM_clint_mtimecmp_en,



    output                      MEM_ready,
    output                      mem_valid,
    output                      mem_req,
    output      [63 :  0]       mem_data_write,
    output      [31 :  0]       mem_addr,
    output      [1  :  0]       mem_size,
    output      [63 :  0]       MEM_rd_data,
    output                      clint_write_en,
    output                      clint_read_en,
    output                      clint_mtime_en,
    output                      clint_mtimecmp_en);
    reg mem_valid_en;
    reg mem_valid_en_next;
    always@(posedge clock)begin
        if (rst) begin
            mem_valid_en     <=1'b1;
            mem_valid_en_next<=1'b0;
        end
        else begin
            if (mem_valid & mem_ready)begin
                mem_valid_en <= mem_valid_en_next;      //取到数据了，将valid请求关闭
                mem_valid_en_next   <= 1'b0;
            end
            else if (IF_pc_handshake)
                /*if(mem_valid)begin
                    mem_valid_en_next   <= 1;  //说明一个周期内没有访存结束，当次访存结束后mem_valid_en_next需要为1
                end
                else */begin
                    mem_valid_en        <= 1'b1;
                    mem_valid_en_next   <= 1'b0;
                end
        end
    end   

    reg [63 :  0]  load_data;
    always @( * ) begin
        if (rst)    load_data = 64'b0;
        else begin
        case ( funct3 )
        `YSYX210302_LB : begin load_data = { {56{mem_data_read[ 7 ]}}, mem_data_read[ 7:0 ]};end
    	`YSYX210302_LBU: begin load_data = { 56'b0, mem_data_read[ 7:0 ]};end
		`YSYX210302_LH : begin load_data = { {48{mem_data_read[ 15 ]}}, mem_data_read[ 15:0 ]};end
		`YSYX210302_LHU: begin load_data = { 48'b0, mem_data_read[ 15:0 ]};end
		`YSYX210302_LD : begin load_data = mem_data_read;end
		`YSYX210302_LW : begin load_data = { {32{mem_data_read[ 31 ]}}, mem_data_read[ 31:0 ]};end
		`YSYX210302_LWU: begin load_data = { 32'b0, mem_data_read[ 31:0 ]};end
        default: begin 
            if(mem_resp == 2'b00)
                load_data    = 64'b0;
            else 
                load_data    = 64'h0;
        end
        endcase
        end
    end
    assign  mem_valid           = MEM_mem_valid & mem_valid_en ;
    assign  mem_req             = (EXE_mem_req & IF_pc_handshake | MEM_mem_req); //提前一拍送上mem请求
    assign  MEM_ready           = mem_ready;
    assign  mem_data_write      = MEM_store_data;
    assign  mem_addr            = MEM_mem_addr;
    assign  mem_size            = MEM_mem_size;
    assign  MEM_rd_data         = MEM_clint_read_en ? clint_data_read : (MEM_load_en ? load_data : MEM_rdtem_data);
    assign  clint_write_en      = MEM_clint_write_en;
    assign  clint_read_en       = MEM_clint_read_en;
    assign  clint_mtime_en      = MEM_clint_mtime_en;
    assign  clint_mtimecmp_en   = MEM_clint_mtimecmp_en;



endmodule

module ysyx_210302_forward_rs_sel (
    input   [63 :  0]   ID_rs,
    input   [2  :  0]   forward_result,
    input   [63 :  0]   EXE_rd_data,
    input   [63 :  0]   MEM_rd_data,
    input   [63 :  0]   WB_rd_data,

    output  [63 :  0]   ID_final_jumprs);
    assign  ID_final_jumprs     =   forward_result == 3'b100 ? WB_rd_data  :
                              ( forward_result == 3'b010 ? MEM_rd_data :
                              ( forward_result == 3'b001 ? EXE_rd_data : ID_rs )) ;


    
endmodule


module ysyx_210302_reg_dataw_sel(input [ 63 : 0 ]   rd_data,
                     input [ 63 : 0 ]   csr_read,
                     input [6 : 0]      opcode,
                     output [ 63:0 ]    reg_dataw);
    
    assign reg_dataw = opcode== `YSYX210302_CSR_TYPE2 ? csr_read :rd_data;

endmodule

module ysyx_210302_regfile(input wire               clk,
               input                    rst,
               input      [ 4 : 0 ]     w_addr,
               input      [ `YSYX210302_REG_BUS ]  w_data,
               input     		        w_ena,
               input      [ 4 : 0 ]     r_addr1,
               output     [ `YSYX210302_REG_BUS ]  r_data1,
               input      		        r_ena1,
               input      [ 4 : 0 ]     r_addr2,
               output     [ `YSYX210302_REG_BUS ]  r_data2,
               input      		        r_ena2);
    

    reg [ 63:0 ] 	regs[ 31 : 0 ];
    always @( negedge clk )
    begin
        if ( rst == 1'b1 ) begin
            regs[ 0 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 1 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 2 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 3 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 4 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 5 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 6 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 7 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 8 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 9 ]  <= `YSYX210302_ZERO_WORD;
            regs[ 10 ] <= `YSYX210302_ZERO_WORD;
            regs[ 11 ] <= `YSYX210302_ZERO_WORD;
            regs[ 12 ] <= `YSYX210302_ZERO_WORD;
            regs[ 13 ] <= `YSYX210302_ZERO_WORD;
            regs[ 14 ] <= `YSYX210302_ZERO_WORD;
            regs[ 15 ] <= `YSYX210302_ZERO_WORD;
            regs[ 16 ] <= `YSYX210302_ZERO_WORD;
            regs[ 17 ] <= `YSYX210302_ZERO_WORD;
            regs[ 18 ] <= `YSYX210302_ZERO_WORD;
            regs[ 19 ] <= `YSYX210302_ZERO_WORD;
            regs[ 20 ] <= `YSYX210302_ZERO_WORD;
            regs[ 21 ] <= `YSYX210302_ZERO_WORD;
            regs[ 22 ] <= `YSYX210302_ZERO_WORD;
            regs[ 23 ] <= `YSYX210302_ZERO_WORD;
            regs[ 24 ] <= `YSYX210302_ZERO_WORD;
            regs[ 25 ] <= `YSYX210302_ZERO_WORD;
            regs[ 26 ] <= `YSYX210302_ZERO_WORD;
            regs[ 27 ] <= `YSYX210302_ZERO_WORD;
            regs[ 28 ] <= `YSYX210302_ZERO_WORD;
            regs[ 29 ] <= `YSYX210302_ZERO_WORD;
            regs[ 30 ] <= `YSYX210302_ZERO_WORD;
            regs[ 31 ] <= `YSYX210302_ZERO_WORD;
        end
        else begin
            if ( ( w_ena  == 1'b1 ) && ( w_addr != 5'h00 )  )begin

                regs[ w_addr ] <= w_data;
            end
                end
                end

            assign r_data1 = ( rst == 1'b1 ) ? 0 : ( ( r_ena1 == 1'b1 ) ? regs[ r_addr1 ] : 0 );
            assign r_data2 = ( rst == 1'b1 ) ? 0 : ( ( r_ena2 == 1'b1 ) ? regs[ r_addr2 ] : 0 );
            
endmodule


module ysyx_210302_clint(
    input                   clock,
    input                   rst,
    input                   clint_write_en,
    input                   clint_read_en,
    input                   clint_mtime_en,
    input                   clint_mtimecmp_en,
    input                   if_axi_ready,
    input       [63 :  0]   clint_data_write,


    output  reg [63 :  0]   clint_data_read,
    output  reg             mtimecmp_flag);


    reg [63:0] mtime;
    reg [63:0] mtimecmp; //500000会在跳转指令进入中断，nemu会判断mepc为跳转后的指令，记得判断500200

    
    always @ (posedge clock)begin
        if (rst) begin
            mtime   <= 64'b0;
            mtimecmp_flag   <= 1'b0;
            mtimecmp        <= 64'b0;
            clint_data_read <= 64'b0;
        end

        else begin
            mtime <= mtime + 1;
            if (mtime >= mtimecmp  ) begin
                if(if_axi_ready)
                    mtimecmp_flag   <= 1'b1;
            end
            else begin
                mtimecmp_flag <= 1'b0;
            end


            if (clint_write_en & if_axi_ready ) begin  //因为一条指令时间内只能增加一次值，而一个指令时间内有很多周期，所以用if_ready限制使其只增加一次
                if(clint_mtimecmp_en)
                    mtimecmp <= clint_data_write; 
                else if (clint_mtime_en)
                    mtime <= clint_data_write; 
            end

            if (clint_read_en) begin  //因为一条指令时间内只能增加一次值，而一个指令时间内有很多周期，所以用if_ready限制使其只增加一次
                if(clint_mtimecmp_en)
                    clint_data_read <= mtimecmp; 
                else if (clint_mtime_en)
                    clint_data_read <= mtime; 
            end
        end
    end
endmodule

module ysyx_210302_cpu(
    input                               clock,
    input                               reset,

    input                               mtimecmp_flag,
    output                              clint_write_en,
    output                              clint_read_en,
    output                              clint_mtime_en,
    output                              clint_mtimecmp_en,
    input [63:0]                        clint_data_read,
    
    output                              if_axi_valid,
    output                              if_axi_req,
    input                               if_axi_ready,
    input  [63:0]                       if_axi_data_read,
    output [31:0]                       if_axi_addr,
    output [1:0]                        if_axi_size,
    input  [1:0]                        if_axi_resp,
    input                               if_axi_ar_ready,

    input  [1:0]                        mem_w_state,
    input  [1:0]                        mem_r_state,
    output                              mem_valid,
    output                              mem_req,
    input                               mem_ready,
    input  [63:0]                       mem_data_read,
    output [63:0]                       mem_data_write,
    output [31:0]                       mem_addr,
    output [1:0]                        mem_size,
    input  [1:0]                        mem_resp);//resp信号不用需要删除

// IF
    // IF -> ysyx_210302_IFID
    wire [63 :  0]  IF_myinst_addr;
    wire [31 :  0]  IF_inst;
    wire            IF_pc_handshake;
    wire            IF_module_work;
    wire            IF_fetch_wrong;
    wire            IF_intr_refetch;

// ID
    // ID -> IF
    wire            ID_jumpb_en;
    wire            ID_jumpr_en;
    wire            ID_jump_judge_en;
    wire            ID_jump_yes;


    // ID -> IDEXE
    wire [31 :  0]  ID_inst;
    wire            ID_pc_handshake;
    wire [63 :  0]  ID_myinst_addr;
    wire            ID_csr_wr_en;
    wire            ID_csr_en;
    wire            ID_ecall_en;
    wire            ID_mret_en;
    wire [11 :  0]  ID_csr_addr;
    wire [63 :  0]  ID_csr_wr_data;


    wire [6  : 0]   ID_opcode;
    wire [63 : 0]   ID_ext_ui_imm;
    wire            ID_rs1_en;
    wire [4 : 0]    ID_rs1_addr;
    wire            ID_rs2_en;
    wire [63 :  0]  ID_rs1;
    wire [63 :  0]  ID_rs2;
    wire [4 : 0]    ID_rs2_addr;
    wire            ID_rd_en;
    wire [4  :  0]  ID_rd_addr;
    wire [63 :  0]  ID_offset;
    wire [5  :  0]  ID_shamt;
    wire            ID_sub_en;
    wire            ID_alu_en;
    wire [6  :  0]  ID_funct7;
    wire [2  :  0]  ID_funct3;    
    wire [63 :  0]  ID_op1;
    wire [63 :  0]  ID_op2;


    wire            ID_store_en;
    wire            ID_load_en;
    wire            ID_mem_valid;
    wire            ID_mem_req;
    wire [31 :  0]  ID_mem_addr;
    wire [1  :  0]  ID_mem_size;


    wire            ID_clint_write_en;
    wire            ID_clint_read_en;
    wire            ID_clint_mtime_en;
    wire            ID_clint_mtimecmp_en;

    // jumpJUD_forward_unit -> ID2jumpJUD_rs_sel
    wire [2  :  0]  ID_forward_rs1;
    wire [2  :  0]  ID_forward_rs2;
    wire            ID_jump_forward_ready;
    //ID2jumpJUD_rs_sel -> jump_juege
    wire [63 :  0]  ID_rs1_data;
    wire [63 :  0]  ID_rs2_data;
    // regfile -> IDEXE



    
// EXE
    // EXE -> ALU
    wire [5  :  0]  EXE_shamt;
    wire [6  :  0]  EXE_funct7;
    wire            EXE_alu_en;
    wire            EXE_sub_en;
    wire [ 2 : 0 ]  EXE_funct3;
    wire [ 6 : 0 ]  EXE_opcode;
    wire [ 63: 0 ]  EXE_rd_data;


    // EXE -> EXEMEM

    wire [63 :  0]  EXE_myinst_addr;
    wire            EXE_csr_wr_en;
    wire            EXE_csr_en;
    wire            EXE_ecall_en;
    wire            EXE_mret_en;
    wire [11 :  0]  EXE_csr_addr;
    wire [63 :  0]  EXE_csr_wr_data;

    wire [63 : 0]   EXE_ext_ui_imm;
    wire            EXE_rd_en;
    wire [4  :  0]  EXE_rd_addr;
  


    wire            EXE_store_en;
    wire            EXE_load_en;
    wire            EXE_mem_valid;
    wire            EXE_mem_req;
    wire [31 :  0]  EXE_mem_addr;
    wire [1  :  0]  EXE_mem_size;
    wire [63 :  0]  EXE_store_data;

    wire            EXE_clint_write_en;
    wire            EXE_clint_read_en;
    wire            EXE_clint_mtime_en;
    wire            EXE_clint_mtimecmp_en;
    // EXE -> EXE2alu_op_sel
    wire [63 :  0]  EXE_op1;
    wire [63 :  0]  EXE_op2;
    // forward_unit -> EXE2alu_op_sel

    // EXE2alu_op_sel -> alu

    wire            load_hazard;
    wire            csr_hazard;
           

// MEM
    // MEM -> AXI
    wire            MEM_load_en;
    wire            MEM_mem_valid;
    wire            MEM_mem_req;
    wire [31 :  0]  MEM_mem_addr;
    wire [1  :  0]  MEM_mem_size;
    wire [63 :  0]  MEM_store_data;
    wire            MEM_ready;

    // MEM -> MEMWB

    wire [63 :  0]  MEM_myinst_addr;
    
    wire [2  :  0]  MEM_funct3;
    wire [6  :  0]  MEM_opcode;

    wire            MEM_csr_wr_en;
    wire            MEM_csr_en;
    wire            MEM_ecall_en;
    wire            MEM_mret_en;
    wire [11 :  0]  MEM_csr_addr;
    wire [63 :  0]  MEM_csr_wr_data;


    wire            MEM_rd_en;
    wire [4  :  0]  MEM_rd_addr;
    wire [63 :  0]  MEM_rd_data;
    wire [63 :  0]  MEM_rdtem_data;


    wire            MEM_clint_write_en;
    wire            MEM_clint_read_en;
    wire            MEM_clint_mtime_en;
    wire            MEM_clint_mtimecmp_en;

// WB
    // WB -> regfile

    wire            WB_rd_en;
    wire [4  :  0]  WB_rd_addr;
    wire [63 :  0]  WB_rd_data;
    wire [63 :  0]  WB_rdtem_data;

    // WB -> csr
    wire            WB_csr_wr_en;
    wire            WB_csr_en;
    wire            WB_ecall_en;
    wire            WB_mret_en;
    wire [11 :  0]  WB_csr_addr;
    wire [63 :  0]  WB_csr_wr_data;


    
    // WB->other
    wire [2  :  0]  WB_funct3;
    wire [6  :  0]  WB_opcode;



    wire [63 :  0]  WB_myinst_addr;
    wire            time_intr_pc;

    // regfile -> difftest

    
    // csr
    // csr -> reg_dataw_sel
     wire [63:0]WB_csr2reg_write;
    // csr -> ysyx_210302_if_stage
     wire [63:0] WB_mtvec_read,WB_mepc_read;




    // Access memory
    










//流水线握手信号 
    wire ID2IF_allowin,IF2ID_valid,IF2IN_allowin;  //IF
    wire EXE2ID_allowin,ID2EXE_valid;//ID

    wire MEM2EXE_allowin,EXE2MEM_valid;//EXE
    //wire MEM2OUT_valid;//MEM

    wire IFID_flush,IDEXE_flush,EXEMEM_flush,MEMWB_flush;
    wire IFID_stall,IDEXE_stall,EXEMEM_stall;
    wire IN2IF_valid =IF_pc_handshake & (! load_hazard) &(!time_intr_pc);
    wire OUT2MEM_allowin =1'b1 |IF2IN_allowin ;

    assign  IFID_flush      = IF_intr_refetch | IF_fetch_wrong;  //跳转指令取错，或者响应中断是取错刷新IDIF级流水线寄存器
    assign  IDEXE_flush     = load_hazard | IF_intr_refetch;
    assign  EXEMEM_flush    = IF_intr_refetch;
    assign  MEMWB_flush     = IF_intr_refetch;  //时钟中断来临了，只有处于WB级的指令允许执行完，其他流水级中的指令都需要清空

    assign  IFID_stall      = csr_hazard;
    assign  IDEXE_stall     = csr_hazard;
    assign  EXEMEM_stall    = 1'b0;


ysyx_210302_if_stage ysyx_210302_If_stage(
    .clk                    ( clock ),
    .rst                    ( reset ),
    .load_hazard            ( load_hazard ),
    .csr_hazard             ( csr_hazard ),
    .jumpb_en               ( ID_jumpb_en ),
    .jumpr_en               ( ID_jumpr_en ),
    .time_intr_pc           ( time_intr_pc ),
    .WB_mtvec_read          ( WB_mtvec_read ),
    .WB_mepc_read           ( WB_mepc_read ),
    .mem_w_state            ( mem_w_state ),
    .mem_r_state            ( mem_r_state ),
    .if_axi_resp            ( if_axi_resp ),
    .if_axi_addr            ( if_axi_addr ),
    .if_axi_size            ( if_axi_size ),
    .if_axi_req             ( if_axi_req ),
    .if_axi_data_read       ( if_axi_data_read ),
    .if_axi_valid           ( if_axi_valid ),
    .if_axi_ready           ( if_axi_ready ),
    .ID_offset              ( ID_offset ),
    .ID_myinst_addr         ( ID_myinst_addr ),
    .IF_myinst_addr         ( IF_myinst_addr ),
    .IF_inst                ( IF_inst ),
    .IF_pc_handshake        ( IF_pc_handshake ),
    .IF_module_work         ( IF_module_work ),
    .IF_fetch_wrong         ( IF_fetch_wrong ),
    .IF_intr_refetch        ( IF_intr_refetch )

);

ysyx_210302_IFID ysyx_210302_IFID(
    .i_IFID_last_valid      ( IN2IF_valid ),
    .i_IFID_next_allowin    ( ID2IF_allowin ),
    .i_IFID_clk             ( clock ),
    .i_IFID_rst             ( reset ),
    .i_IFID_myinst_addr     ( IF_myinst_addr ),
    .i_IFID_inst            ( IF_inst ),
    .i_IFID_pc_handshake    ( IF_pc_handshake ),
    .i_IFID_flush           ( IFID_flush ),
    .i_intr_flush           ( IF_intr_refetch),
    .i_IFID_stall           ( IFID_stall ),

    .o_IFID_next_valid      ( IF2ID_valid ),
    .o_IFID_last_allowin    ( IF2IN_allowin ),
    .o_IFID_myinst_addr     ( ID_myinst_addr ),
    .o_IFID_inst            ( ID_inst ),
    .o_IFID_pc_handshake    ( ID_pc_handshake )
) ;
ysyx_210302_csr_hazard_unit ysyx_210302_Csr_hazard_unit(
    .MEM_rd_addr        ( MEM_rd_addr ),
    .WB_rd_addr         ( WB_rd_addr ),
    .EXE_rd_addr        ( EXE_rd_addr ),
    .ID_rs1_addr        ( ID_rs1_addr ),
    .ID_rs2_addr        ( ID_rs2_addr ),
    .EXE_csr_en         ( EXE_csr_en ),
    .MEM_csr_en         ( MEM_csr_en ),
    .WB_csr_en          ( WB_csr_en ),

    .csr_hazard         ( csr_hazard )
);
ysyx_210302_jump_judge ysyx_210302_Jump_judge(
    .rst                    ( reset ),
    .rs1_data               ( ID_rs1_data ),
    .rs2_data               ( ID_rs2_data ),
    .funct3                 ( ID_funct3 ),
    .jump_yes               ( ID_jump_yes ),
    .jump_judge_en          ( ID_jump_judge_en ),
    .jump_forward_ready  ( ID_jump_forward_ready )
);
ysyx_210302_regfile ysyx_210302_Regfile(
    .clk                  ( clock ),
    .rst                  ( reset ),
    .w_addr               ( WB_rd_addr ),
    .w_data               ( WB_rd_data ),
    .w_ena                ( WB_rd_en ),
    
    .r_addr1              ( ID_rs1_addr ),
    .r_data1              ( ID_rs1 ),
    .r_ena1               ( ID_rs1_en ),
    .r_addr2              ( ID_rs2_addr ),
    .r_data2              ( ID_rs2),
    .r_ena2               ( ID_rs2_en )
);

ysyx_210302_id_stage ysyx_210302_Id_stage(
    .ID_inst                ( ID_inst ),
    .ID_rs1_data            ( ID_rs1_data ),
    .ID_rs2_data            ( ID_rs2_data ),
    .ID_jump_yes            ( ID_jump_yes ),
    .ID_pc_handshake        ( ID_pc_handshake ),


    .ID_funct7              ( ID_funct7 ),
    .ID_opcode              ( ID_opcode ),
    .ID_funct3              ( ID_funct3 ),

    .ID_jumpr_en            ( ID_jumpr_en ),
    .ID_jumpb_en            ( ID_jumpb_en ),
    .ID_jump_judge_en       ( ID_jump_judge_en ),
    .ID_offset              ( ID_offset ),

    .ID_rs1_en              ( ID_rs1_en ),
    .ID_rs1_addr            ( ID_rs1_addr ),
    .ID_rs2_en              ( ID_rs2_en ),
    .ID_rs2_addr            ( ID_rs2_addr ),
    .ID_rd_en               ( ID_rd_en ),
    .ID_rd_addr             ( ID_rd_addr ),
    .ID_shamt               ( ID_shamt ),
    .ID_sub_en              ( ID_sub_en ),
    .ID_alu_en              ( ID_alu_en ),
    .ID_op1                 ( ID_op1 ),
    .ID_op2                 ( ID_op2 ),
    .ID_ext_ui_imm          ( ID_ext_ui_imm ),

    .ID_csr_en              ( ID_csr_en ),
    .ID_csr_wr_en           ( ID_csr_wr_en ),
    .ID_ecall_en            ( ID_ecall_en ),
    .ID_mret_en             ( ID_mret_en ),
    .ID_csr_addr            ( ID_csr_addr ),
    .ID_csr_wr_data         ( ID_csr_wr_data ),


    .ID_mem_addr            ( ID_mem_addr ),
    .ID_mem_size            ( ID_mem_size ),
    .ID_mem_valid           ( ID_mem_valid ),
    .ID_mem_req             ( ID_mem_req ),
    .ID_load_en             ( ID_load_en ),
    .ID_store_en            ( ID_store_en ),

    .ID_clint_write_en      ( ID_clint_write_en ),
    .ID_clint_read_en       ( ID_clint_read_en ),
    .ID_clint_mtimecmp_en   ( ID_clint_mtimecmp_en ),
    .ID_clint_mtime_en      ( ID_clint_mtime_en )
);
ysyx_210302_forward_rs_sel   ysyx_210302_forward_rs1_sel(
    .ID_rs                  ( ID_rs1 ),
    .forward_result         ( ID_forward_rs1 ),
    .EXE_rd_data            ( EXE_rd_data ),
    .MEM_rd_data            ( MEM_rd_data ),
    .WB_rd_data             ( WB_rd_data ),

    .ID_final_jumprs        ( ID_rs1_data )  
);
ysyx_210302_forward_rs_sel   ysyx_210302_forward_rs2_sel(
    .ID_rs                  ( ID_rs2),
    .forward_result         ( ID_forward_rs2 ),
    .EXE_rd_data            ( EXE_rd_data ),
    .MEM_rd_data            ( MEM_rd_data ),
    .WB_rd_data             ( WB_rd_data ),

    .ID_final_jumprs        ( ID_rs2_data )  
);

ysyx_210302_forward_ID_forward_unit ysyx_210302_forward_ID_forward_unit(
    .MEM_rd_addr            ( MEM_rd_addr ),
    .WB_rd_addr             ( WB_rd_addr ),
    .EXE_rd_addr            ( EXE_rd_addr ),
    .ID_rs1_addr            ( ID_rs1_addr ),
    .ID_rs2_addr            ( ID_rs2_addr ),
    .EXE_csr_en             ( EXE_csr_en ),
    .MEM_csr_en             ( MEM_csr_en ),
    .WB_csr_en              ( WB_csr_en ),

    .ID_forward_rs1         ( ID_forward_rs1 ),
    .ID_forward_rs2         ( ID_forward_rs2 ),
    .ID_jump_forward_ready  ( ID_jump_forward_ready ),
    .MEM_load_en            ( MEM_load_en),
    .MEM_ready              ( MEM_ready )
);


ysyx_210302_IDEXE ysyx_210302_IDEXE(
    .i_IF_pc_handshake          ( IF_pc_handshake ),
    .i_IDEXE_last_valid         ( IF2ID_valid ),
    .i_IDEXE_next_allowin       ( EXE2ID_allowin ),
    .i_IDEXE_clk                ( clock ),
    .i_IDEXE_rst                ( reset ),
    .i_IDEXE_myinst_addr        ( ID_myinst_addr ),
    .i_IDEXE_rd_en              ( ID_rd_en ),
    .i_IDEXE_rd_addr            ( ID_rd_addr ),
    .i_IDEXE_shamt              ( ID_shamt ),
    .i_IDEXE_funct7             ( ID_funct7 ),
    .i_IDEXE_opcode             ( ID_opcode ),
    .i_IDEXE_funct3             ( ID_funct3 ),
    .i_IDEXE_sub_en             ( ID_sub_en ),
    .i_IDEXE_load_en            ( ID_load_en ),
    .i_IDEXE_alu_en             ( ID_alu_en ),
    .i_IDEXE_store_en           ( ID_store_en ),
    .i_IDEXE_csr_en             ( ID_csr_en ),
    .i_IDEXE_csr_wr_en          ( ID_csr_wr_en ),
    .i_IDEXE_ecall_en           ( ID_ecall_en ),
    .i_IDEXE_mret_en            ( ID_mret_en ),
    .i_IDEXE_csr_addr           ( ID_csr_addr ),
    .i_IDEXE_csr_wr_data        ( ID_csr_wr_data ),
    .i_IDEXE_ext_ui_imm         ( ID_ext_ui_imm ),
    .i_IDEXE_mem_addr           ( ID_mem_addr ),
    .i_IDEXE_mem_size           ( ID_mem_size ),
    .i_IDEXE_mem_valid          ( ID_mem_valid ),
    .i_IDEXE_mem_req            ( ID_mem_req ),
    .i_IDEXE_clint_write_en     ( ID_clint_write_en ),
    .i_IDEXE_clint_read_en      ( ID_clint_read_en ),
    .i_IDEXE_clint_mtime_en     ( ID_clint_mtime_en ),
    .i_IDEXE_clint_mtimecmp_en  ( ID_clint_mtimecmp_en ),
    .i_IDEXE_op1                ( ID_op1 ),
    .i_IDEXE_op2                ( ID_op2 ),
    .IDEXE_flush                ( IDEXE_flush),
    .i_IDEXE_stall              ( IDEXE_stall ),
    

    .o_IDEXE_next_valid         ( ID2EXE_valid ),
    .o_IDEXE_last_allowin       ( ID2IF_allowin ),
    .o_IDEXE_myinst_addr        ( EXE_myinst_addr ),
    .o_IDEXE_rd_en              ( EXE_rd_en ),
    .o_IDEXE_rd_addr            ( EXE_rd_addr ),
    .o_IDEXE_shamt              ( EXE_shamt ),
    .o_IDEXE_funct7             ( EXE_funct7 ),
    .o_IDEXE_opcode             ( EXE_opcode ),
    .o_IDEXE_funct3             ( EXE_funct3 ),
    .o_IDEXE_sub_en             ( EXE_sub_en ),
    .o_IDEXE_load_en            ( EXE_load_en ),
    .o_IDEXE_alu_en             ( EXE_alu_en ),
    .o_IDEXE_store_en           ( EXE_store_en ),
    .o_IDEXE_csr_en             ( EXE_csr_en ),
    .o_IDEXE_csr_wr_en          ( EXE_csr_wr_en ),
    .o_IDEXE_ecall_en           ( EXE_ecall_en ),
    .o_IDEXE_mret_en            ( EXE_mret_en ),
    .o_IDEXE_csr_addr           ( EXE_csr_addr ),
    .o_IDEXE_csr_wr_data        ( EXE_csr_wr_data ),
    .o_IDEXE_ext_ui_imm         ( EXE_ext_ui_imm ),
    .o_IDEXE_mem_addr           ( EXE_mem_addr ),
    .o_IDEXE_mem_size           ( EXE_mem_size ),
    .o_IDEXE_mem_valid          ( EXE_mem_valid ),
    .o_IDEXE_mem_req            ( EXE_mem_req ),
    .o_IDEXE_clint_write_en     ( EXE_clint_write_en ),
    .o_IDEXE_clint_read_en      ( EXE_clint_read_en ),
    .o_IDEXE_clint_mtime_en     ( EXE_clint_mtime_en ),
    .o_IDEXE_clint_mtimecmp_en  ( EXE_clint_mtimecmp_en ),
    .o_IDEXE_op1                ( EXE_op1 ),
    .o_IDEXE_op2                ( EXE_op2 )

);
ysyx_210302_load_hazard_unit ysyx_210302_load_hazard_unit(
    .EXE_load_en            ( EXE_load_en ),
    .EXE_rd_addr            ( EXE_rd_addr ),
    .ID_rs1_addr            ( ID_rs1_addr ),
    .ID_rs2_addr            ( ID_rs2_addr ),

    .load_hazard            ( load_hazard )
);


ysyx_210302_alu ysyx_210302_Alu(
    .reset                    ( reset ),
    
    .EXE_funct3               ( EXE_funct3 ),
    .EXE_funct7              ( EXE_funct7 ),
    .EXE_opcode               ( EXE_opcode ),
    .EXE_shamt                ( EXE_shamt ),
    .EXE_alu_en               ( EXE_alu_en ),
    .EXE_sub_en               ( EXE_sub_en ),
    .EXE_op1                  ( EXE_op1),
    .EXE_op2                  ( EXE_op2),
    .EXE_ext_ui_imm           ( EXE_ext_ui_imm ),
    .EXE_myinst_addr          ( EXE_myinst_addr ),   
    .EXE_store_en             ( EXE_store_en ),     

    .EXE_store_data           ( EXE_store_data ),  
    .EXE_rd_data              ( EXE_rd_data )
);
ysyx_210302_EXEMEM  ysyx_210302_EXEMEM(
    .i_IF_pc_handshake       ( IF_pc_handshake ),
    .i_EXEMEM_last_valid     ( ID2EXE_valid ),
    .i_EXEMEM_next_allowin   ( MEM2EXE_allowin ),
    .i_EXEMEM_clk            ( clock ),
    .i_EXEMEM_rst            ( reset ),
    .i_EXEMEM_myinst_addr    ( EXE_myinst_addr ),
    .i_EXEMEM_rd_en          ( EXE_rd_en ),
    .i_EXEMEM_rd_addr        ( EXE_rd_addr ),
    .i_EXEMEM_store_data     ( EXE_store_data ),
    .i_EXEMEM_opcode         ( EXE_opcode ),
    .i_EXEMEM_funct3         ( EXE_funct3 ),
    .i_EXEMEM_load_en        ( EXE_load_en ),
    .i_EXEMEM_csr_en         ( EXE_csr_en ),
    .i_EXEMEM_csr_wr_en      ( EXE_csr_wr_en ),
    .i_EXEMEM_ecall_en       ( EXE_ecall_en ),
    .i_EXEMEM_mret_en        ( EXE_mret_en ),
    .i_EXEMEM_csr_addr       ( EXE_csr_addr ),
    .i_EXEMEM_csr_wr_data    ( EXE_csr_wr_data ),
    .i_EXEMEM_mem_addr       ( EXE_mem_addr ),
    .i_EXEMEM_mem_size       ( EXE_mem_size ),
    .i_EXEMEM_mem_valid      ( EXE_mem_valid ),
    .i_EXEMEM_mem_req        ( EXE_mem_req ),
    .i_EXEMEM_clint_write_en ( EXE_clint_write_en ),
    .i_EXEMEM_clint_read_en  ( EXE_clint_read_en ),
    .i_EXEMEM_clint_mtime_en ( EXE_clint_mtime_en),
    .i_EXEMEM_clint_mtimecmp_en  ( EXE_clint_mtimecmp_en),   
    .i_EXEMEM_rd_data        ( EXE_rd_data ),
    .i_EXEMEM_stall          ( EXEMEM_stall ),
    .i_EXEMEM_flush          ( EXEMEM_flush ),

    .o_EXEMEM_next_valid     ( EXE2MEM_valid ),
    .o_EXEMEM_last_allowin   ( EXE2ID_allowin ),
    .o_EXEMEM_myinst_addr    ( MEM_myinst_addr ),
    .o_EXEMEM_rd_en          ( MEM_rd_en ),
    .o_EXEMEM_rd_addr        ( MEM_rd_addr ),
    .o_EXEMEM_store_data     ( MEM_store_data ),
    .o_EXEMEM_opcode         ( MEM_opcode ),
    .o_EXEMEM_funct3         ( MEM_funct3 ),
    .o_EXEMEM_load_en        ( MEM_load_en ),
    .o_EXEMEM_csr_en         ( MEM_csr_en ),
    .o_EXEMEM_csr_wr_en      ( MEM_csr_wr_en ),
    .o_EXEMEM_ecall_en       ( MEM_ecall_en ),
    .o_EXEMEM_mret_en        ( MEM_mret_en ),
    .o_EXEMEM_csr_addr       ( MEM_csr_addr ),
    .o_EXEMEM_csr_wr_data    ( MEM_csr_wr_data ),
    .o_EXEMEM_mem_addr       ( MEM_mem_addr ),
    .o_EXEMEM_mem_size       ( MEM_mem_size ),
    .o_EXEMEM_mem_valid      ( MEM_mem_valid ),
    .o_EXEMEM_mem_req        ( MEM_mem_req ),
    .o_EXEMEM_clint_write_en ( MEM_clint_write_en ),
    .o_EXEMEM_clint_read_en  ( MEM_clint_read_en ),
    .o_EXEMEM_clint_mtime_en ( MEM_clint_mtime_en),
    .o_EXEMEM_clint_mtimecmp_en  ( MEM_clint_mtimecmp_en),   
    .o_EXEMEM_rd_data        ( MEM_rdtem_data )

);

ysyx_210302_mem_connector ysyx_210302_Mem_connector(
    .mem_data_read          ( mem_data_read ),
    .funct3                 ( MEM_funct3 ),
    .clock                  ( clock ),
    .rst                    ( reset ),
    .MEM_mem_valid          ( MEM_mem_valid ),
    .EXE_mem_req            ( EXE_mem_req ),
    .IF_pc_handshake        ( IF_pc_handshake ),
    .MEM_mem_req            ( MEM_mem_req ),
    .mem_ready              ( mem_ready ),
    .MEM_store_data         ( MEM_store_data ),
    .MEM_mem_addr           ( MEM_mem_addr ),
    .MEM_mem_size           ( MEM_mem_size ),
    .mem_resp               ( mem_resp ),
    .clint_data_read        ( clint_data_read ),
    .MEM_rdtem_data         ( MEM_rdtem_data ),
    .MEM_load_en            ( MEM_load_en ),
    .MEM_clint_write_en     ( MEM_clint_write_en ),
    .MEM_clint_read_en      ( MEM_clint_read_en ),
    .MEM_clint_mtime_en     ( MEM_clint_mtime_en ),
    .MEM_clint_mtimecmp_en  ( MEM_clint_mtimecmp_en ),

    .MEM_ready              ( MEM_ready ),
    .mem_valid              ( mem_valid ),
    .mem_req                ( mem_req ),
    .mem_data_write         ( mem_data_write ),
    .mem_addr               ( mem_addr ),
    .mem_size               ( mem_size ),
    .MEM_rd_data            ( MEM_rd_data ),
    .clint_write_en         ( clint_write_en ),
    .clint_read_en          ( clint_read_en ),
    .clint_mtime_en         ( clint_mtime_en ),
    .clint_mtimecmp_en      ( clint_mtimecmp_en )
);



ysyx_210302_MEMWB ysyx_210302_MEMWB(
    .i_IF_pc_handshake      ( IF_pc_handshake ),
    .i_MEMWB_last_valid     ( EXE2MEM_valid ),
    .i_MEMWB_next_allowin   ( OUT2MEM_allowin ),
    .i_MEMWB_clk            ( clock ),
    .i_MEMWB_rst            ( reset ),
    .i_MEMWB_myinst_addr    ( MEM_myinst_addr ),

    .i_MEMWB_rd_en          ( MEM_rd_en ),
    .i_MEMWB_rd_addr        ( MEM_rd_addr ),
    .i_MEMWB_opcode         ( MEM_opcode ),
    .i_MEMWB_funct3         ( MEM_funct3 ),
    .i_MEMWB_csr_en         ( MEM_csr_en ),
    .i_MEMWB_csr_wr_en      ( MEM_csr_wr_en ),
    .i_MEMWB_ecall_en       ( MEM_ecall_en ),
    .i_MEMWB_mret_en        ( MEM_mret_en ),
    .i_MEMWB_csr_addr       ( MEM_csr_addr ),
    .i_MEMWB_csr_wr_data    ( MEM_csr_wr_data ),
    .i_MEMWB_rd_data        ( MEM_rd_data ),
    .i_MEMWB_flush          ( MEMWB_flush ),

    .o_MEMWB_last_allowin   ( MEM2EXE_allowin ),
    .o_MEMWB_myinst_addr    ( WB_myinst_addr ),
    .o_MEMWB_rd_en          ( WB_rd_en ),
    .o_MEMWB_rd_addr        ( WB_rd_addr ),
    .o_MEMWB_opcode         ( WB_opcode ),
    .o_MEMWB_funct3         ( WB_funct3 ),
    .o_MEMWB_csr_en         ( WB_csr_en ),
    .o_MEMWB_csr_wr_en      ( WB_csr_wr_en ),
    .o_MEMWB_ecall_en       ( WB_ecall_en ),
    .o_MEMWB_mret_en        ( WB_mret_en ),
    .o_MEMWB_csr_addr       ( WB_csr_addr ),
    .o_MEMWB_csr_wr_data    ( WB_csr_wr_data ),
    .o_MEMWB_rd_data        ( WB_rdtem_data )

);
ysyx_210302_csr ysyx_210302_csr(
    .clk                    ( clock ),
    .rst                    ( reset ),
    .IF_module_work         ( IF_module_work ),
    .if_axi_ar_ready        ( if_axi_ar_ready ),

    .funct3                 ( WB_funct3 ),
    .ecall_en               ( WB_ecall_en ),
    .mret_en                ( WB_mret_en ),
    .mtimecmp_flag          ( mtimecmp_flag ),
    .time_intr_pc           ( time_intr_pc ),
    .myinst_addr            ( WB_myinst_addr ),
    .MEM_myinst_addr        ( MEM_myinst_addr ),
    .EXE_myinst_addr        ( EXE_myinst_addr ),
    .ID_myinst_addr         ( ID_myinst_addr ),
    .csr_addr               ( WB_csr_addr ),
    .csr_wr_en              ( WB_csr_wr_en ),
    .csr2reg_write          ( WB_csr2reg_write ),
    .csr_wr_data            ( WB_csr_wr_data ),
    .mtvec_read             ( WB_mtvec_read ),
    .mepc_read              ( WB_mepc_read )
);

ysyx_210302_reg_dataw_sel ysyx_210302_Reg_dataw_sel(
    .rd_data              ( WB_rdtem_data ),
    .opcode               ( WB_opcode ),
    .csr_read             ( WB_csr2reg_write ),
    .reg_dataw            ( WB_rd_data )
    );
    



endmodule








module ysyx_210302(
    input                       clock,
    input                       reset,
    input                       io_interrupt,
    // AXI4 Master总线	
    input		                io_master_awready,
    output		                io_master_awvalid,
    output	[31:0]	            io_master_awaddr,
    output	[3:0]	            io_master_awid,
    output	[7:0]	            io_master_awlen,
    output	[2:0]	            io_master_awsize,
    output	[1:0]	            io_master_awburst,
    input		                io_master_wready,
    output		                io_master_wvalid,
    output	[63:0]	            io_master_wdata,
    output	[7:0]	            io_master_wstrb,
    output		                io_master_wlast,
    output		                io_master_bready,
    input		                io_master_bvalid,	
    input	[1:0]	            io_master_bresp,
    input	[3:0]	            io_master_bid,
    input		                io_master_arready,
    output		                io_master_arvalid,
    output	[31:0]	            io_master_araddr,
    output	[3:0]	            io_master_arid,
    output	[7:0]	            io_master_arlen,
    output	[2:0]	            io_master_arsize,
    output	[1:0]	            io_master_arburst,
    output		                io_master_rready,
    input		                io_master_rvalid,
    input	[1:0]	            io_master_rresp,
    input	[63:0]	            io_master_rdata,
    input		                io_master_rlast,
    input	[3:0]	            io_master_rid,
    // AXI4 Slave总线

    output		                io_slave_awready,
    input		                io_slave_awvalid,
    input	[31:0]	            io_slave_awaddr,
    input	[3:0]	            io_slave_awid,
    input	[7:0]	            io_slave_awlen,
    input	[2:0]	            io_slave_awsize,
    input	[1:0]	            io_slave_awburst,
    output		                io_slave_wready,
    input		                io_slave_wvalid,
    input	[63:0]	            io_slave_wdata,
    input	[7:0]	            io_slave_wstrb,
    input		                io_slave_wlast,
    input		                io_slave_bready,
    output		                io_slave_bvalid,
    output	[1:0]	            io_slave_bresp,
    output	[3:0]	            io_slave_bid,
    output		                io_slave_arready,
    input		                io_slave_arvalid,
    input	[31:0]	            io_slave_araddr,
    input	[3:0]	            io_slave_arid,
    input	[7:0]	            io_slave_arlen,
    input	[2:0]	            io_slave_arsize,
    input	[1:0]	            io_slave_arburst,
    input		                io_slave_rready,
    output		                io_slave_rvalid,
    output	[1:0]	            io_slave_rresp,
    output	[63:0]	            io_slave_rdata,
    output		                io_slave_rlast,
    output	[3:0]	            io_slave_rid
    
    );
    
    assign  io_slave_awready        =   1'b0;
    assign  io_slave_wready         =   1'b0;
    assign  io_slave_bvalid         =   1'b0;
    assign  io_slave_bresp          =   2'b0;
    assign  io_slave_bid            =   4'b0;
    assign  io_slave_arready        =   1'b0;
    assign  io_slave_rvalid         =   1'b0;
    assign  io_slave_rresp          =   2'b0;
    assign  io_slave_rdata          =   64'b0;
    assign  io_slave_rlast          =   1'b0;
    assign  io_slave_rid            =   4'b0;
    

    
    //主机0参数定义

    wire ar_ready_m0;
    wire ar_valid_m0;
    wire [`YSYX210302_AXI_ADDR_WIDTH-1:0] ar_addr_m0;
    wire [`YSYX210302_AXI_ID_WIDTH-1:0] ar_id_m0;
    wire [7:0] ar_len_m0;
    wire [2:0] ar_size_m0;
    wire [1:0] ar_burst_m0;


    

    wire r_ready_m0;
    wire r_valid_m0;
    wire [1:0] r_resp_m0;
    wire [`YSYX210302_AXI_DATA_WIDTH-1:0] r_data_m0;
    wire r_last_m0;


    //主机1参数定义
	wire aw_ready_m1;
	wire aw_valid_m1;
	wire [`YSYX210302_AXI_ADDR_WIDTH-1:0] aw_addr_m1;
	wire [`YSYX210302_AXI_ID_WIDTH-1:0] aw_id_m1;
	wire [7:0] aw_len_m1;
	wire [2:0] aw_size_m1;
	wire [1:0] aw_burst_m1;



	wire w_ready_m1;
	wire w_valid_m1;
	wire [`YSYX210302_AXI_DATA_WIDTH-1:0] w_data_m1 ;
	wire [`YSYX210302_AXI_DATA_WIDTH/8-1:0] w_strb_m1;
	wire w_last_m1;

	wire b_ready_m1;
	wire b_valid_m1;
	wire [1:0] b_resp_m1;


	wire ar_ready_m1;
	wire ar_valid_m1;
	wire [`YSYX210302_AXI_ADDR_WIDTH-1:0] ar_addr_m1;
	wire [`YSYX210302_AXI_ID_WIDTH-1:0] ar_id_m1;
	wire [7:0] ar_len_m1;
	wire [2:0] ar_size_m1;
	wire [1:0] ar_burst_m1;



	wire r_ready_m1;
	wire r_valid_m1;
	wire [1:0] r_resp_m1;
	wire [`YSYX210302_AXI_DATA_WIDTH-1:0] r_data_m1;
	wire r_last_m1;


    //从机0参数定义
    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210302_AXI_ADDR_WIDTH-1:0] aw_addr;
    wire [`YSYX210302_AXI_ID_WIDTH-1:0] aw_id;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;



    wire w_ready;
    wire w_valid;
    wire [`YSYX210302_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210302_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;


    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;

    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210302_AXI_ADDR_WIDTH-1:0] ar_addr;
    wire [`YSYX210302_AXI_ID_WIDTH-1:0] ar_id;


    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;


    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210302_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    //axi_rw模块参数
    wire if_axi_valid;
    wire if_axi_ready;
    wire if_axi_req ;
    wire [63:0] if_axi_data_read;
    wire [31:0] if_axi_addr;
    wire [1:0] if_axi_size;
    wire [1:0] if_axi_resp;

    wire mem_valid;
    wire mem_ready;
    wire mem_req ;
    wire [63:0] mem_data_read;
    wire [63:0] mem_data_write;
    wire [31:0] mem_addr;
    wire [1:0] mem_size;
    wire [1:0] mem_resp;
    wire [1:0] mem_w_state;
    wire [1:0] mem_r_state;



    wire if_axi_ar_ready;
    wire mtimecmp_flag;
    wire clint_write_en;
    wire clint_read_en;
    wire clint_mtime_en;
    wire clint_mtimecmp_en;
    wire [63:0] clint_data_read;

    assign  aw_ready                =   io_master_awready;
    assign  io_master_awvalid       =   aw_valid;
    assign  io_master_awaddr        =   aw_addr;
    assign  io_master_awid          =   aw_id;
    assign  io_master_awlen         =   aw_len;
    assign  io_master_awsize        =   aw_size;
    assign  io_master_awburst       =   aw_burst;
    assign  w_ready                 =   io_master_wready;
    assign  io_master_wvalid        =   w_valid;
    assign  io_master_wdata         =   w_data;
    assign  io_master_wstrb         =   w_strb;
    assign  io_master_wlast         =   w_last;
    assign  io_master_bready        =   b_ready;
    assign  b_valid                 =   io_master_bvalid;
    assign  b_resp                  =   io_master_bresp;
    assign  ar_ready                =   io_master_arready;
    assign  io_master_arvalid       =   ar_valid;
    assign  io_master_araddr        =   ar_addr;
    assign  io_master_arid          =   ar_id;
    assign  io_master_arlen         =   ar_len;
    assign  io_master_arsize        =   ar_size;
    assign  io_master_arburst       =   ar_burst;
    assign  io_master_rready        =   r_ready;
    assign  r_valid                 =   io_master_rvalid;
    assign  r_resp                  =   io_master_rresp;
    assign  r_data                  =   io_master_rdata;
    assign  r_last                  =   io_master_rlast;


ysyx_210302_if_axi_rw ysyx_210302_If_axi_rw (
        .clock                          (clock),
        .reset                          (reset),
    //与cpu交互信号
        .rw_valid_i                     (if_axi_valid),
        .rw_ready_o                     (if_axi_ready),
        .rw_req_i                       (if_axi_req),
        .data_read_o                    (if_axi_data_read),
        .rw_addr_i                      (if_axi_addr),
        .rw_size_i                      (if_axi_size),
        .rw_resp_o                      (if_axi_resp),
        .if_ar_ready                    (if_axi_ar_ready),
    //读地址通道
        .axi_ar_ready_i                 (ar_ready_m0),
        .axi_ar_valid_o                 (ar_valid_m0),
        .axi_ar_addr_o                  (ar_addr_m0),
        .axi_ar_id_o                    (ar_id_m0),
        .axi_ar_len_o                   (ar_len_m0),
        .axi_ar_size_o                  (ar_size_m0),
        .axi_ar_burst_o                 (ar_burst_m0),

    //读数据通道    
        .axi_r_ready_o                  (r_ready_m0),
        .axi_r_valid_i                  (r_valid_m0),
        .axi_r_resp_i                   (r_resp_m0),
        .axi_r_data_i                   (r_data_m0),
        .axi_r_last_i                   (r_last_m0)
);

ysyx_210302_mem_axi_rw ysyx_210302_Mem_axi_rw (
        .clock                          (clock),
        .reset                          (reset),
        .r_ready_m0                     (r_ready_m0),
    //与cpu交互信号
        .rw_valid_i                     (mem_valid),
        .rw_ready_o                     (mem_ready),
        .rw_req_i                       (mem_req),
        .data_read_o                    (mem_data_read),
        .data_write_i                   (mem_data_write),
        .rw_addr_i                      (mem_addr),
        .rw_size_i                      (mem_size),
        .rw_resp_o                      (mem_resp),
        .rw_w_state                     (mem_w_state),
        .rw_r_state                     (mem_r_state),
    //写地址通道
        .axi_aw_ready_i                 (aw_ready_m1),
        .axi_aw_valid_o                 (aw_valid_m1),
        .axi_aw_addr_o                  (aw_addr_m1),
        .axi_aw_id_o                    (aw_id_m1),
        .axi_aw_len_o                   (aw_len_m1),
        .axi_aw_size_o                  (aw_size_m1),
        .axi_aw_burst_o                 (aw_burst_m1),
    //写数据通道
        .axi_w_ready_i                  (w_ready_m1),
        .axi_w_valid_o                  (w_valid_m1),
        .axi_w_data_o                   (w_data_m1),
        .axi_w_strb_o                   (w_strb_m1),
        .axi_w_last_o                   (w_last_m1),
    //写相应通道    
        .axi_b_ready_o                  (b_ready_m1),
        .axi_b_valid_i                  (b_valid_m1),
        .axi_b_resp_i                   (b_resp_m1),

    //读地址通道
        .axi_ar_ready_i                 (ar_ready_m1),
        .axi_ar_valid_o                 (ar_valid_m1),
        .axi_ar_addr_o                  (ar_addr_m1),
        .axi_ar_id_o                    (ar_id_m1),
        .axi_ar_len_o                   (ar_len_m1),
        .axi_ar_size_o                  (ar_size_m1),
        .axi_ar_burst_o                 (ar_burst_m1),
    //读数据通道    
        .axi_r_ready_o                  (r_ready_m1),
        .axi_r_valid_i                  (r_valid_m1),
        .axi_r_resp_i                   (r_resp_m1),
        .axi_r_data_i                   (r_data_m1),
        .axi_r_last_i                   (r_last_m1)
);

ysyx_210302_axi_interconnect ysyx_210302_Axi_interconnect(
        .clk                         (clock),
        .rst                         (reset),
    //读地址通道
        .ar_ready_m0                 (ar_ready_m0),
        .ar_valid_m0                 (ar_valid_m0),
        .ar_addr_m0                  (ar_addr_m0),
        .ar_id_m0                    (ar_id_m0),
        .ar_len_m0                   (ar_len_m0),
        .ar_size_m0                  (ar_size_m0),
        .ar_burst_m0                 (ar_burst_m0),
    //读数据通道        
        .r_ready_m0                  (r_ready_m0),
        .r_valid_m0                  (r_valid_m0),
        .r_resp_m0                   (r_resp_m0),
        .r_data_m0                   (r_data_m0),
        .r_last_m0                   (r_last_m0),

    
    /********************* 1号主机 *********************/
    //写地址通道
        .aw_ready_m1                 (aw_ready_m1),
        .aw_valid_m1                 (aw_valid_m1),
        .aw_addr_m1                  (aw_addr_m1),
        .aw_id_m1                    (aw_id_m1),
        .aw_len_m1                   (aw_len_m1),
        .aw_size_m1                  (aw_size_m1),
        .aw_burst_m1                 (aw_burst_m1),
    //写数据通道
        .w_ready_m1                  (w_ready_m1),
        .w_valid_m1                  (w_valid_m1),
        .w_data_m1                   (w_data_m1),
        .w_strb_m1                   (w_strb_m1),
        .w_last_m1                   (w_last_m1),
    //写响应通道    
        .b_ready_m1                  (b_ready_m1),
        .b_valid_m1                  (b_valid_m1),
        .b_resp_m1                   (b_resp_m1),
    //读地址通道
        .ar_ready_m1                 (ar_ready_m1),
        .ar_valid_m1                 (ar_valid_m1),
        .ar_addr_m1                  (ar_addr_m1),
        .ar_id_m1                    (ar_id_m1),
        .ar_len_m1                   (ar_len_m1),
        .ar_size_m1                  (ar_size_m1),
        .ar_burst_m1                 (ar_burst_m1),

    //读数据通道   
        .r_ready_m1                  (r_ready_m1),
        .r_valid_m1                  (r_valid_m1),
        .r_resp_m1                   (r_resp_m1),
        .r_data_m1                   (r_data_m1),
        .r_last_m1                   (r_last_m1),
    /********************* 0号从机 *********************/
    //写地址通道
        .aw_ready_s0                    (aw_ready),
        .aw_valid_s0                    (aw_valid),
        .aw_addr_s0                     (aw_addr),
        .aw_id_s0                       (aw_id),
        .aw_len_s0                      (aw_len),
        .aw_size_s0                     (aw_size),
        .aw_burst_s0                    (aw_burst),

    //写数据通道
        .w_ready_s0                     (w_ready),
        .w_valid_s0                     (w_valid),
        .w_data_s0                      (w_data),
        .w_strb_s0                      (w_strb),
        .w_last_s0                      (w_last),

    //写响应通道
        .b_ready_s0                     (b_ready),
        .b_valid_s0                     (b_valid),
        .b_resp_s0                      (b_resp),
    //读地址通道
        .ar_ready_s0                    (ar_ready),
        .ar_valid_s0                    (ar_valid),
        .ar_addr_s0                     (ar_addr),
        .ar_id_s0                       (ar_id),
        .ar_len_s0                      (ar_len),
        .ar_size_s0                     (ar_size),
        .ar_burst_s0                    (ar_burst),

    //读数据通道
        .r_ready_s0                     (r_ready),
        .r_valid_s0                     (r_valid),
        .r_resp_s0                      (r_resp),
        .r_data_s0                      (r_data),
        .r_last_s0                      (r_last)

);

ysyx_210302_clint ysyx_210302_Clint(
    .rst                ( reset ),
    .clock              ( clock ),
    .clint_write_en     ( clint_write_en ),
    .clint_read_en      ( clint_read_en ),
    .clint_mtime_en     ( clint_mtime_en ),
    .clint_mtimecmp_en  ( clint_mtimecmp_en ),
    .if_axi_ready       ( if_axi_ready ),
    .clint_data_write   ( mem_data_write ),

    .clint_data_read    ( clint_data_read ),
    .mtimecmp_flag      ( mtimecmp_flag )
);


ysyx_210302_cpu ysyx_210302_Cpu(
        .clock                          (clock),
        .reset                          (reset),

        .mtimecmp_flag                  (mtimecmp_flag),
        .clint_write_en                 (clint_write_en),
        .clint_read_en                  (clint_read_en),
        .clint_mtime_en                 (clint_mtime_en),
        .clint_mtimecmp_en              (clint_mtimecmp_en),
        .clint_data_read                (clint_data_read),


        .if_axi_valid                   (if_axi_valid),
        .if_axi_ready                   (if_axi_ready),
        .if_axi_data_read               (if_axi_data_read),
        .if_axi_addr                    (if_axi_addr),
        .if_axi_size                    (if_axi_size),
        .if_axi_req                     (if_axi_req),
        .if_axi_resp                    (if_axi_resp),
        .if_axi_ar_ready                (if_axi_ar_ready),

        .mem_w_state                    (mem_w_state),
        .mem_r_state                    (mem_r_state),
        .mem_valid                      (mem_valid),
	    .mem_ready                      (mem_ready),
	    .mem_data_read                  (mem_data_read),
        .mem_data_write                 (mem_data_write),
	    .mem_addr                       (mem_addr),
	    .mem_size                       (mem_size),
	    .mem_req                        (mem_req),
	    .mem_resp                       (mem_resp)
);
endmodule




























