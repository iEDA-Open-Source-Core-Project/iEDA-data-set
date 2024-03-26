`timescale 1ns / 1ps
///////defines////
`define YSYX210457_ZERO_WORD  64'h00000000_00000000
`define YSYX210457_ZERO_PC    64'h00000000_00000000
`define YSYX210457_ZERO_ADDR  32'h00000000
`define YSYX210457_ZERO_INST  32'h00000000    
`define YSYX210457_REG_BUS    63 : 0 
`define YSYX210457_PC_BUS     63 : 0 
`define YSYX210457_ADDR_BUS   31 : 0  
`define YSYX210457_INST_BUS   31 : 0 
`define YSYX210457_ZERO_ENA   1'b0
`define YSYX210457_ZERO_REG_ADDR   5'b00000
`define YSYX210457_PC_START   64'h00000000_30000000 
//forecase
`define YSYX210457_FORECASE 32
`define YSYX210457_FORECASE_LOG 5
`define YSYX210457_PC 32
`define YSYX210457_PC_LOG 5

//funct3
`define YSYX210457_addi 3'b000
`define YSYX210457_andi 3'b111
`define YSYX210457_xori 3'b100
`define YSYX210457_ori 3'b110
`define YSYX210457_slti 3'b010
`define YSYX210457_sltiu 3'b011
`define YSYX210457_slli 3'b001
`define YSYX210457_srlisrai 3'b101
`define YSYX210457_srlsra 3'b101
`define YSYX210457_addiw 3'b000
`define YSYX210457_slliw 3'b001
`define YSYX210457_sllw 3'b001
`define YSYX210457_srliwsraiw 3'b101
`define YSYX210457_srlwsraw 3'b101

`define YSYX210457_lb 3'b000
`define YSYX210457_lbu 3'b100
`define YSYX210457_ld 3'b011
`define YSYX210457_lh 3'b001
`define YSYX210457_lhu 3'b101
`define YSYX210457_lw 3'b010
`define YSYX210457_lwu 3'b110

`define YSYX210457_sb 3'b000
`define YSYX210457_sh 3'b001
`define YSYX210457_sw 3'b010
`define YSYX210457_sd 3'b011


`define YSYX210457_addsub 3'b000
`define YSYX210457_addwsubw 3'b000
`define YSYX210457_and 3'b111
`define YSYX210457_xor 3'b100
`define YSYX210457_or 3'b110
`define YSYX210457_slt 3'b010
`define YSYX210457_sltu 3'b011
`define YSYX210457_sll 3'b001

`define YSYX210457_beq 3'b000
`define YSYX210457_bge 3'b101
`define YSYX210457_bgeu 3'b111
`define YSYX210457_blt 3'b100
`define YSYX210457_bltu 3'b110
`define YSYX210457_bne 3'b001

`define YSYX210457_system 3'b000
`define YSYX210457_csrrw 3'b001
`define YSYX210457_csrrs 3'b010
`define YSYX210457_csrrc 3'b011
`define YSYX210457_csrrwi 3'b101
`define YSYX210457_csrrsi 3'b110
`define YSYX210457_csrrci 3'b111

`define YSYX210457_fence 3'b000
`define YSYX210457_fencei 3'b001

//funct7
`define YSYX210457_add 7'b0000000
`define YSYX210457_sub 7'b0100000
`define YSYX210457_addw 7'b0000000
`define YSYX210457_subw 7'b0100000
`define YSYX210457_srl 7'b0000000
`define YSYX210457_sra 7'b0100000
`define YSYX210457_srlw 7'b0000000
`define YSYX210457_sraw 7'b0100000
`define YSYX210457_srli 6'b000000
`define YSYX210457_srai 6'b010000
`define YSYX210457_srliw 6'b000000
`define YSYX210457_sraiw 6'b010000
`define YSYX210457_mret 12'b001100000010
`define YSYX210457_ebreak 12'b000000000001
`define YSYX210457_ecall 12'b000000000000

//ALUOP
`define YSYX210457_NO 7'b0000_000
`define YSYX210457_ADD 7'b0000_001
`define YSYX210457_SUB 7'b0000_010
`define YSYX210457_AND 7'b0000_100
`define YSYX210457_XOR 7'b0010_000
`define YSYX210457_OR 7'b0001_000
`define YSYX210457_COMu 7'b0000_011
`define YSYX210457_COM 7'b0000_110
`define YSYX210457_SHIL 7'b0001_100
`define YSYX210457_SHIR 7'b0011_000
`define YSYX210457_SRA 7'b0110_000
`define YSYX210457_LEFT12 7'b1100_000
`define YSYX210457_SHILw 7'b0001_101
`define YSYX210457_SRAw 7'b0110_001
`define YSYX210457_SHIRw 7'b0011_001

//ALUSEL
`define YSYX210457_No 4'b0000
`define YSYX210457_Logic  4'b0001
`define YSYX210457_Arith  4'b0010
`define YSYX210457_Jump  4'b0100
`define YSYX210457_Load  4'b0011
`define YSYX210457_Store  4'b0101
`define YSYX210457_Long  4'b0110
`define YSYX210457_Short  4'b0111
`define YSYX210457_CSRRC  4'b1001
`define YSYX210457_CSRRCI 4'b1010
`define YSYX210457_CSRRS  4'b1011
`define YSYX210457_CSRRSI  4'b1100
`define YSYX210457_CSRRW  4'b1101
`define YSYX210457_CSRRWI  4'b1110
`define YSYX210457_SYSTEM  4'b1111


//MEMOP
`define YSYX210457_R_ONE  5'b00001
`define YSYX210457_R_ONEu  5'b00010
`define YSYX210457_R_DOU  5'b00011
`define YSYX210457_R_DOUu  5'b00100
`define YSYX210457_R_FOR  5'b00101
`define YSYX210457_R_FORu  5'b00110
`define YSYX210457_R_EIG  5'b00111

`define YSYX210457_W_ONE  5'b01000
`define YSYX210457_W_DOU  5'b01001
`define YSYX210457_W_FOR 5'b01010
`define YSYX210457_W_EIG 5'b01011




//CSR_ADDR

`define YSYX210457_mstatus 12'h300
`define YSYX210457_misa 12'h301
`define YSYX210457_medeleg 12'h302
`define YSYX210457_mideleg 12'h303
`define YSYX210457_mie 12'h304
`define YSYX210457_mtvec 12'h305
`define YSYX210457_mcounteren 12'h306
`define YSYX210457_mscratch 12'h340
`define YSYX210457_mepc 12'h341
`define YSYX210457_mcause 12'h342
`define YSYX210457_mtval 12'h343
`define YSYX210457_mip 12'h344
`define YSYX210457_mcycle 12'hb00
`define YSYX210457_minstret 12'hb02
`define YSYX210457_mcycleh 12'hb80         //32
`define YSYX210457_minstreth 12'hb82       //32

`define YSYX210457_sstatus 12'h100


//Clint
`define YSYX210457_msip 32'h2000000
`define YSYX210457_mtimecmp 32'h2004000
`define YSYX210457_mtime 32'h200bff8
`define YSYX210457_TIME 64'd00000


//AXI
`define YSYX210457_AXI_ADDR_WIDTH      32
`define YSYX210457_AXI_DATA_WIDTH      64
`define YSYX210457_AXI_ID_WIDTH        4
`define YSYX210457_AXI_USER_WIDTH      1

`define YSYX210457_SIZE_B              2'b00
`define YSYX210457_SIZE_H              2'b01
`define YSYX210457_SIZE_W              2'b10
`define YSYX210457_SIZE_D              2'b11

`define YSYX210457_REQ_READ            1'b0
`define YSYX210457_REQ_WRITE           1'b1


//aw_axi
// Burst types
`define YSYX210457_AXI_BURST_TYPE_INCR          2'b01

`define YSYX210457_RW_DATA_WIDTH      64
`define YSYX210457_RW_ADDR_WIDTH      64
`define YSYX210457_AXI_DATA_WIDTH     64
`define YSYX210457_AXI_ADDR_WIDTH     32
`define YSYX210457_AXI_ID_WIDTH       4
`define YSYX210457_AXI_USER_WIDTH     1

//axi_rw
`define YSYX210457_W_STATE_IDLE  2'b00
`define YSYX210457_W_STATE_ADDR  2'b01
`define YSYX210457_W_STATE_WRITE 2'b10 
`define YSYX210457_W_STATE_RESP  2'b11
`define YSYX210457_R_STATE_IDLE  2'b00 
`define YSYX210457_R_STATE_VOID  2'b01
`define YSYX210457_R_STATE_ADDR  2'b10
`define YSYX210457_R_STATE_READ  2'b11




module ysyx_210457_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4

)(
    input                               clock,
    input                               reset,

	input                               rw_valid_i,//
    input                               rw_req_i,//
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,//
    input  [RW_DATA_WIDTH-1:0]          data_write_i,
    input  [AXI_ADDR_WIDTH-1:0]         rw_addr_i,//
    input  [1:0]                        rw_size_i,//
    output reg                          stall,
    input [AXI_ID_WIDTH-1:0]            cpu_id,
    output [AXI_ID_WIDTH-1:0]           out_id,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,


    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,

    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,

    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i
);

    wire w_trans    = rw_req_i == `YSYX210457_REQ_WRITE;
    wire r_trans    = rw_req_i == `YSYX210457_REQ_READ;
    wire w_valid    = rw_valid_i & w_trans;                               
    

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;






    
    // ------------------State Machine------------------

    reg [1:0] w_state, r_state;
    wire w_state_idle = w_state == `YSYX210457_W_STATE_IDLE, w_state_addr = w_state == `YSYX210457_W_STATE_ADDR, w_state_write = w_state == `YSYX210457_W_STATE_WRITE, w_state_resp = w_state == `YSYX210457_W_STATE_RESP;
    wire r_state_idle = r_state == `YSYX210457_R_STATE_IDLE, r_state_addr = r_state == `YSYX210457_R_STATE_ADDR, r_state_read  = r_state == `YSYX210457_R_STATE_READ;
    wire r_valid    = (rw_valid_i & r_trans) || (w_valid & ~r_state_read);
    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= `YSYX210457_W_STATE_IDLE;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    `YSYX210457_W_STATE_IDLE: begin w_state <= `YSYX210457_W_STATE_ADDR;   end              
                    `YSYX210457_W_STATE_ADDR:  if (aw_hs)   w_state <= `YSYX210457_W_STATE_WRITE;
                    `YSYX210457_W_STATE_WRITE: if (w_done)  w_state <= `YSYX210457_W_STATE_RESP;
                    `YSYX210457_W_STATE_RESP:  if (b_hs) begin w_state <= `YSYX210457_W_STATE_IDLE;  end   
                endcase
            end
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (reset) begin
            r_state <= `YSYX210457_R_STATE_IDLE;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    `YSYX210457_R_STATE_IDLE:begin r_state <= `YSYX210457_R_STATE_VOID;  end
                    `YSYX210457_R_STATE_VOID:begin r_state <= `YSYX210457_R_STATE_ADDR; end               
                    `YSYX210457_R_STATE_ADDR: if (ar_hs)    r_state <= `YSYX210457_R_STATE_READ;
                    `YSYX210457_R_STATE_READ: if (r_done) begin r_state <= `YSYX210457_R_STATE_IDLE; end   
                    default:;
                endcase
            end
        end
    end

always @(posedge clock) begin
    if(reset) begin
        stall <= 1'b0;
    end
    else if (w_valid) begin
        case (w_state)
            `YSYX210457_W_STATE_IDLE: begin  stall <= 1'b1; end              
            `YSYX210457_W_STATE_RESP: begin 
                if (b_hs) begin 
                    stall <= 1'b0; 
                end 
            end
            default: begin end   
        endcase
    end
    else if (rw_req_i) begin
        stall <= ~axi_b_valid_i;
    end
    if (r_valid) begin
        case (r_state)
            `YSYX210457_R_STATE_IDLE:begin  stall <= 1'b1; end
            `YSYX210457_R_STATE_READ: if (r_done) begin  stall <= 1'b0; end   
            default:begin  end
        endcase
    end
    else if (~rw_req_i) begin
        stall <= ~axi_r_valid_i;
    end
end


    // ------------------Process Data------------------
    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);
    localparam MASK_WIDTH    = AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / AXI_DATA_WIDTH;
    localparam BLOCK_TRANS   = TRANS_LEN > 1 ? 1'b1 : 1'b0;

    wire aligned            = BLOCK_TRANS | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210457_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210457_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210457_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210457_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire overstep           = {{addr_op1 + addr_op2} & 4'b1000} != 0;
    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};    
    wire [2:0] axi_size     = {1'b0, rw_size_i};
    
    wire [OFFSET_WIDTH-1:0] aligned_offset    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}};
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    wire [OFFSET_WIDTH-1:0] aligned_offset_h    = 6'd32 - aligned_offset_l;
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                    ) << aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] mask_l            = mask[AXI_DATA_WIDTH-1:0];
    wire [AXI_DATA_WIDTH-1:0] mask_h            = mask[MASK_WIDTH-1:AXI_DATA_WIDTH];

    wire [AXI_ID_WIDTH-1:0] axi_id              = {cpu_id[AXI_ID_WIDTH-1 : 0]};

    
    reg [3: 0] id;
    wire [3 : 0] out_id_nxt = (axi_r_valid_i) ? axi_r_id_i : (axi_b_valid_i) ? axi_b_id_i : 0;
    always @(posedge clock) begin
        if (reset) begin
            id <= 0;
        end
        else begin
            id <= out_id_nxt;
        end
    end
    assign out_id     = id;




    // ------------------Number of transmission------------------
    reg [7:0] len;
    wire len_reset      = reset | (w_trans & w_state_idle) | (r_trans & r_state_idle);
    wire len_incr_en    = (len != axi_len) & (w_hs | r_hs);
    always @(posedge clock) begin
        if (len_reset) begin
            len <= 0;
        end
        else if (len_incr_en) begin
            len <= len + 1;
        end
    end


    // ------------------Write Transaction------------------

    // Write address channel signals
    assign axi_aw_valid_o   = w_state_addr & w_valid;
    assign axi_aw_addr_o    = rw_addr_i;
    assign axi_aw_id_o      = axi_id;
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = axi_size;
    assign axi_aw_burst_o   = `YSYX210457_AXI_BURST_TYPE_INCR;


    // Write data channel signals
    assign axi_w_valid_o    = w_state_write;
    assign axi_w_strb_o     = (size_b) ? {{AXI_DATA_WIDTH/8-1{1'b0}}, 1'b1} << aligned_offset : 
                              (size_h) ? {{AXI_DATA_WIDTH/8-2{1'b0}}, 2'b11} << aligned_offset :
                              (size_w) ? {{AXI_DATA_WIDTH/8-4{1'b0}}, 4'b1111} << aligned_offset :
                              (size_d) ? {8'b11111111} << aligned_offset : {AXI_DATA_WIDTH/8-0{1'b0}};


    assign  axi_w_data_o  = (data_write_i & mask_l) ;
    //wire [AXI_DATA_WIDTH-1:0] axi_w_data_h  = (data_write_i & mask_h) ;


    assign axi_w_last_o = axi_w_valid_o;

    //Write respond channel signals
    assign axi_b_ready_o    = w_state_resp & w_valid;//




    
    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr & ~w_valid;
    assign axi_ar_addr_o    = rw_addr_i;
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210457_AXI_BURST_TYPE_INCR;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read & ~w_valid;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;

    genvar i;
    generate
        for (i = 0; i < TRANS_LEN; i = i+1) begin : genbit
            always @(posedge clock) begin
                if (reset) begin
                    data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= 0;
                end
                else if (axi_r_ready_o & axi_r_valid_i) begin
                    if (~aligned & overstep) begin
                        if (len[0]) begin
                            data_read_o[AXI_DATA_WIDTH-1:0] <= data_read_o[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                        end
                        else begin
                            data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                        end
                    end
                    else if (len == i) begin
                        data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= axi_r_data_l;
                    end
                end
            end
        end
    endgenerate

endmodule


module ysyx_210457_arbiter (
    input clock,
    input reset,
    input flush,

    output reg [31 : 0] if_data_read,
    input wire if_valid,
    input wire [`YSYX210457_ADDR_BUS] if_addr,
    input wire [1 : 0] if_size,
    input wire if_req,

    output reg [63 : 0] mem_data,
    
    input wire [`YSYX210457_REG_BUS] mem_stor_data,
    input wire mem_valid,
    input wire [`YSYX210457_ADDR_BUS] mem_addr,
    input wire [1 : 0] mem_sel,
    input wire mem_req,


    output reg [`YSYX210457_ADDR_BUS] AXI_addr,
    output reg [`YSYX210457_REG_BUS] AXI_w_data,
    output reg AXI_vaild,
    output reg AXI_req,
    output reg [1 : 0] AXI_size,
    output reg [3:0] AXI_id,

    input wire [3:0] AXI_out_id,
    input wire [`YSYX210457_REG_BUS] AXI_r_data,
    input wire AXI_stall,

    output reg [5 : 0] stall
    
);

reg flush_reg;
always @(posedge clock) begin
    if(reset == 1'b1) begin
        flush_reg <= 1'b0;
    end
    else begin
        if(flush) begin
            flush_reg <= 1'b1;
        end
        if(~AXI_stall) begin
            flush_reg <= 1'b0;
        end
    end
end


always @(*) begin
    if(reset == 1'b1) begin
        AXI_addr = `YSYX210457_ZERO_ADDR;
        AXI_w_data = `YSYX210457_ZERO_WORD;
        AXI_vaild = 1'b0;
        AXI_req = 1'b0;
        AXI_size = 2'b0;
        AXI_id = 4'b0000;
    end
    else begin
        AXI_addr = `YSYX210457_ZERO_ADDR;
        AXI_w_data = `YSYX210457_ZERO_WORD;
        AXI_vaild = 1'b0;
        AXI_req = 1'b0;
        AXI_size = 2'b0;
        AXI_id = 4'b0000;
        if(mem_valid) begin
            AXI_addr = mem_addr;
            AXI_w_data = mem_stor_data;
            AXI_vaild = mem_valid;
            AXI_req = mem_req;
            AXI_size = mem_sel;
            AXI_id = 4'b0001;
        end
        else if(if_valid) begin
            AXI_addr = if_addr;
            AXI_w_data = `YSYX210457_ZERO_WORD;
            AXI_vaild = if_valid;
            AXI_req = if_req;
            AXI_size = if_size;
            AXI_id = 4'b0011;
        end
    end
end




always @(*) begin
    if(reset == 1'b1) begin
        mem_data = `YSYX210457_ZERO_WORD;
        if_data_read = `YSYX210457_ZERO_INST;
    end
    else begin

            if(AXI_out_id == 4'b1) begin
                mem_data = AXI_r_data;
                if_data_read = `YSYX210457_ZERO_INST;
            end
            else if(AXI_out_id == 4'b11) begin
                if_data_read = AXI_r_data[31 : 0];
                mem_data = `YSYX210457_ZERO_WORD;
            end
            else begin
                mem_data = `YSYX210457_ZERO_WORD;
                if_data_read = `YSYX210457_ZERO_INST;
            end
    end
end

always @(*) begin
    if(reset == 1'b1) begin
        stall = 6'b000000;
    end
    else begin
        stall = 6'b000000;
        if(mem_valid & if_valid & ~flush_reg) begin
            if(mem_req) begin
                stall = {3'b111, AXI_stall, AXI_stall, 1'b0};
            end
            else begin
                stall = {5'b11111, 1'b0};
                if(AXI_out_id == 4'b1) begin
                    stall = {3'b111, AXI_stall, AXI_stall, 1'b0};
                end
            end
        end
        else if(mem_valid & ~if_valid & ~flush_reg) begin
            stall = {{5{AXI_stall}}, 1'b0};
        end
        else if(if_valid & ~flush_reg) begin
            stall = {AXI_stall, AXI_stall, AXI_stall, 3'b0};
        end
        if(flush) begin
            stall = 6'b000000;
        end
        else if(flush_reg) begin
            stall = 6'b111110;
        end
    end
end

endmodule



module ysyx_210457_rvcpu(
    input                 clock,
    input                 reset,
    input [5 : 0]         stall,

    input  wire [31 : 0] if_data_read,
    output wire if_valid,
    output wire [`YSYX210457_ADDR_BUS] IF_addr,
    output wire [1 : 0] if_size,
    output wire if_req,

    input  wire [63 : 0] mem_data,
    output wire [63 : 0] MEM_stor_data,
    output wire mem_valid,
    output wire [`YSYX210457_ADDR_BUS] mem_addr,
    output wire [1 : 0] mem_sel,
    output wire mem_req,

    output wire flush

);


//IF_stage -> if_id
wire N_wash;
wire [`YSYX210457_PC_BUS] N_IF_pc;
wire [31 : 0] N_instr;
wire N_if_forecase;
wire [`YSYX210457_PC_BUS] N_if_branch;

assign IF_addr = N_IF_pc[`YSYX210457_ADDR_BUS];

//if_id -> ID_stage
wire [`YSYX210457_INST_BUS] N_id_instr;
wire [`YSYX210457_PC_BUS] N_id_branch;
//if_id -> IF_stage too
wire [`YSYX210457_PC_BUS] N_id_pc;

//if_id -> IF_stage
wire N_id_forecase;

//regfile -> ID_stage
wire [`YSYX210457_REG_BUS] N_r_data1;
wire [`YSYX210457_REG_BUS] N_r_data2;


//ID_stage -> regfile
wire N_reg1_r_ena;
wire N_reg2_r_ena;
wire [4 : 0] N_reg1_addr;
wire [4 : 0] N_reg2_addr;

//ID_stage -> IF_stage
wire [`YSYX210457_PC_BUS] N_branch;
wire N_pc_con;
wire N_mux_pc;
wire N_error_branch;

//ID_stage -> id_ex
wire [`YSYX210457_PC_BUS] N_ID_pc; 
wire [`YSYX210457_INST_BUS] N_ID_instr; 
wire [6 : 0] N_aluop;
wire [3 : 0] N_alusel;
wire [`YSYX210457_REG_BUS] N_reg1_data;
wire [`YSYX210457_REG_BUS] N_reg2_data;
wire [4 : 0] N_w_addr;
wire N_w_ena;
wire [4 : 0] N_memop;
wire [31 : 0] N_imm;
wire N_id_mem_wr;
wire N_id_mem_ena;
wire N_id_csr_ena;


//id_ex -> EX_stage
wire [4 : 0] N_ex_w_addr;
wire N_ex_w_ena;
wire [`YSYX210457_REG_BUS] N_ex_reg1_data;
wire [`YSYX210457_REG_BUS] N_ex_reg2_data;
wire [6 : 0] N_ex_aluop;
wire [3 : 0] N_ex_alusel;
wire [`YSYX210457_PC_BUS] N_ex_pc;
wire [`YSYX210457_INST_BUS] N_ex_instr;
wire [4 : 0] N_ex_memop;
wire [31 : 0] N_ex_imm;
wire N_ex_csr_ena;
//id_ex -> ID_stage too
wire N_ex_mem_wr;
wire N_ex_mem_ena;


//EX_stage -> ex_mem
wire [`YSYX210457_REG_BUS] N_ex_w_data;
wire N_EX_w_ena;
wire [4 : 0] N_EX_w_addr;
wire [`YSYX210457_PC_BUS] N_EX_pc;
wire [`YSYX210457_INST_BUS] N_EX_instr;
wire [4 : 0] N_EX_memop;
wire [`YSYX210457_ADDR_BUS] N_ex_mem_waddr;
wire [`YSYX210457_ADDR_BUS] N_ex_mem_raddr;
wire [`YSYX210457_REG_BUS] N_ex_stor_data;
wire N_EX_mem_wr;
wire N_EX_mem_ena;
wire [11 : 0] N_ex_csr_addr;    //csr read     ///csr o
wire [`YSYX210457_REG_BUS] N_ex_w_csr_data;
wire N_EX_csr_ena;
wire [`YSYX210457_REG_BUS] N_except_type;

//ex_men -> MEM_stage
wire [`YSYX210457_REG_BUS] N_mem_w_data;
wire N_mem_w_ena;
wire [4 : 0] N_mem_w_addr;
wire [`YSYX210457_PC_BUS] N_men_pc;
wire [`YSYX210457_INST_BUS] N_men_instr;
wire [`YSYX210457_ADDR_BUS] N_mem_mem_waddr;
wire [`YSYX210457_ADDR_BUS] N_mem_mem_raddr;
wire [4 : 0] N_mem_memop;
wire [`YSYX210457_REG_BUS] N_mem_stor_data;
wire N_mem_mem_wr;
wire N_mem_mem_ena;
wire N_mem_csr_ena;                 ///csr o
wire [11 : 0] N_mem_csr_addr;         
wire [`YSYX210457_REG_BUS] N_mem_w_csr_data;
wire [`YSYX210457_REG_BUS] N_mem_except_type;

//MEM_stage -> mem_wb
wire [`YSYX210457_REG_BUS] N_MEM_w_data;
wire N_MEM_w_ena;
wire [4 : 0] N_MEM_w_addr;
wire [`YSYX210457_PC_BUS] N_MEM_pc;
wire [11 : 0] N_MEM_csr_addr;         ///csr o
wire [`YSYX210457_REG_BUS] N_MEM_w_csr_data;
wire N_MEM_csr_ena;
wire [`YSYX210457_REG_BUS] N_MEM_except_type;
//MEM_stage -> IF_stage
wire [`YSYX210457_PC_BUS] N_new_pc;

//mem_wb -> WB_stage
wire [`YSYX210457_REG_BUS] N_wb_w_data;
wire N_wb_w_ena;
wire [4 : 0] N_wb_w_addr;
wire [11 : 0] N_wb_csr_addr;        ///csr_o
wire [`YSYX210457_REG_BUS] N_wb_w_csr_data;
wire N_wb_csr_ena;

//WB_stage -> regfile
wire N_WB_w_ena;
wire [`YSYX210457_REG_BUS] N_WB_w_data;
wire [4 : 0] N_WB_w_addr;

//WB_stage -> CSR_reg
wire [11 : 0] N_WB_csr_addr;
wire [`YSYX210457_REG_BUS] N_WB_w_csr_data;
wire N_WB_csr_ena;

//CSR_reg -> EX_stage
wire [`YSYX210457_REG_BUS] N_csr_reg_data;
//CSR_reg -> MEM_stage
wire [`YSYX210457_REG_BUS] N_mtvec;
wire [`YSYX210457_REG_BUS] N_mepc;
wire N_mie;
wire N_mip;
wire N_mstatus;


//Clint -> CSR_reg
wire N_time_inter;
//Clint -> MEM_reg
wire [`YSYX210457_REG_BUS] N_clint_data;




    ysyx_210457_IF_stage IF_stage (
    .reset(reset),
    .clock(clock),
    .branch(N_branch),
    .mux_pc(N_mux_pc),
    .pc_con(N_pc_con),
    .pc_id(N_id_pc),
    .new_pc(N_new_pc),
    .flush(flush),
    .id_forecase(N_id_forecase),
    .error_branch(N_error_branch),
    .stall(stall[5]),

    .if_branch(N_if_branch),
    .if_forecase(N_if_forecase),
    .wash(N_wash),
    .instr(N_instr),

    .if_valid(if_valid),
    .if_data_read(if_data_read),
    .IF_pc(N_IF_pc),
    .if_size(if_size),
    .if_req(if_req)
);

    ysyx_210457_if_id if_id (
    .reset(reset),
    .clock(clock),
    .if_pc(N_IF_pc),
    .if_instr(N_instr),
    .pc_con(N_pc_con),
    .wash(N_wash),
    .flush(flush),
    .if_forecase(N_if_forecase),
    .if_branch(N_if_branch),
    .stall(stall[4:3]),

    .id_branch(N_id_branch),
    .id_forecase(N_id_forecase),
    .id_pc(N_id_pc),
    .id_instr(N_id_instr)
);

    ysyx_210457_regfile regfile(
    .clock(clock),
	.reset(reset),
	
	.w_addr(N_WB_w_addr),
	.w_data(N_WB_w_data),
	.w_ena(N_WB_w_ena),
	
  	.r_addr1(N_reg1_addr),
	.r_ena1(N_reg1_r_ena),
  	.r_data1(N_r_data1),  //OUT1

	.r_addr2(N_reg2_addr),
	.r_ena2(N_reg2_r_ena),
	.r_data2(N_r_data2)  //OUT2
  

);

    ysyx_210457_ID_stage ID_stage (
    .reset(reset),
    .IF_pc(N_id_pc), 
    .IF_instr(N_id_instr),

    .reg_data1(N_r_data1), //
    .reg_data2(N_r_data2), //

    .ex_w_data(N_ex_w_data),    //ex_stage for data
    .ex_w_ena(N_ex_w_ena),
    .ex_w_addr(N_ex_w_addr),

    .mem_w_data(N_MEM_w_data),   //men_stage for data
    .mem_w_ena(N_MEM_w_ena),
    .mem_w_addr(N_MEM_w_addr),

    .idex_mem_ena(N_ex_mem_ena),          //id_ex memory enable
    .idex_mem_wr(N_ex_mem_wr),

    .if_branch(N_id_branch),

    .error_branch(N_error_branch),

    .reg1_r_ena(N_reg1_r_ena),
    .reg2_r_ena(N_reg2_r_ena),

    .reg1_addr(N_reg1_addr),
    .reg2_addr(N_reg2_addr),

    .aluop(N_aluop),          //ALUoptions
    .alusel(N_alusel),

    .reg1_data(N_reg1_data),  //
    .reg2_data(N_reg2_data),  //

    .w_addr(N_w_addr),       
    .w_ena(N_w_ena),                  //write enable

    .ID_pc(N_ID_pc),       //pc now
    .ID_instr(N_ID_instr), 
    .branch(N_branch),    //pc next
    .mux_pc(N_mux_pc),
    .pc_con(N_pc_con),
    .imm_32(N_imm),

    .memop(N_memop),
    .id_mem_wr(N_id_mem_wr),
    .id_mem_ena(N_id_mem_ena),

    .id_csr_ena(N_id_csr_ena) 

);

    ysyx_210457_id_ex id_ex (
    .reset(reset),
    .clock(clock),
    .id_imm(N_imm),

    .id_pc(N_ID_pc),
    .id_instr(N_ID_instr),

    .id_memop(N_memop),
    .id_aluop(N_aluop),
    .id_alusel(N_alusel),
    .id_mem_wr(N_id_mem_wr),
    .id_mem_ena(N_id_mem_ena),

    .id_reg1_data(N_reg1_data),
    .id_reg2_data(N_reg2_data),

    .id_w_ena(N_w_ena),
    .id_w_addr(N_w_addr),
    .flush(flush),
    .stall(stall[3 : 2]),

    .id_csr_ena(N_id_csr_ena),


    .ex_csr_ena(N_ex_csr_ena),

    .ex_w_addr(N_ex_w_addr),
    .ex_w_ena(N_ex_w_ena),

    .ex_reg1_data(N_ex_reg1_data),
    .ex_reg2_data(N_ex_reg2_data),

    .ex_memop(N_ex_memop),
    .ex_aluop(N_ex_aluop),
    .ex_alusel(N_ex_alusel),
    .ex_imm(N_ex_imm),
    .ex_mem_wr(N_ex_mem_wr),
    .ex_mem_ena(N_ex_mem_ena),

    .ex_instr(N_ex_instr),
    .ex_pc(N_ex_pc)
    
); 

    ysyx_210457_EX_stage EX_stage (
    .reset(reset),

    .ID_pc(N_ex_pc),
    .ID_instr(N_ex_instr),

    .id_w_addr(N_ex_w_addr),
    .id_w_ena(N_ex_w_ena),

    .id_reg1_data(N_ex_reg1_data),
    .id_reg2_data(N_ex_reg2_data),
    .id_imm(N_ex_imm),

    .id_memop(N_ex_memop),
    .id_mem_wr(N_ex_mem_wr),
    .id_mem_ena(N_ex_mem_ena),
    .id_aluop(N_ex_aluop),
    .id_alusel(N_ex_alusel),

    .csr_reg_data(N_csr_reg_data),               //csr
    .id_csr_ena(N_ex_csr_ena),

    .mem_csr_addr(N_mem_csr_addr),
    .mem_w_csr_data(N_mem_w_csr_data),
    .mem_csr_ena(N_mem_csr_ena),
    .wb_csr_addr(N_wb_csr_addr),
    .wb_w_csr_data(N_wb_w_csr_data),
    .wb_csr_ena(N_wb_csr_ena),


    .ex_w_data(N_ex_w_data),
    .ex_w_ena(N_EX_w_ena),
    .ex_w_addr(N_EX_w_addr),

    .ex_mem_raddr(N_ex_mem_raddr),
    .ex_mem_waddr(N_ex_mem_waddr),
    .ex_stor_data(N_ex_stor_data),
    .ex_memop(N_EX_memop),
    .ex_mem_wr(N_EX_mem_wr),
    .ex_mem_ena(N_EX_mem_ena),

    .ex_csr_addr(N_ex_csr_addr),         ///csr o
    .ex_w_csr_data(N_ex_w_csr_data),
    .ex_csr_ena(N_EX_csr_ena), 

    .EX_instr(N_EX_instr),
    .EX_pc(N_EX_pc),

    .except_type(N_except_type)
);

    ysyx_210457_ex_mem ex_mem (
    .reset(reset),
    .clock(clock),
    .ex_pc(N_EX_pc),
    .ex_instr(N_EX_instr),
    .ex_w_data(N_ex_w_data),
    .ex_w_ena(N_EX_w_ena),
    .ex_w_addr(N_EX_w_addr),
    .ex_mem_waddr(N_ex_mem_waddr),
    .ex_mem_raddr(N_ex_mem_raddr),
    .ex_memop(N_EX_memop),
    .ex_stor_data(N_ex_stor_data),
    .ex_mem_wr(N_EX_mem_wr),
    .ex_mem_ena(N_EX_mem_ena),

    .ex_csr_ena(N_EX_csr_ena),               ///csr
    .ex_csr_addr(N_ex_csr_addr),         
    .ex_w_csr_data(N_ex_w_csr_data),
    .ex_except_type(N_except_type),
    .flush(flush),
    .stall(stall[2 : 1]),

    .mem_w_data(N_mem_w_data),
    .mem_w_ena(N_mem_w_ena),
    .mem_w_addr(N_mem_w_addr),

    .mem_mem_waddr(N_mem_mem_waddr),
    .mem_mem_raddr(N_mem_mem_raddr),
    .mem_memop(N_mem_memop),
    .mem_stor_data(N_mem_stor_data),
    .mem_mem_wr(N_mem_mem_wr),
    .mem_mem_ena(N_mem_mem_ena),

    .mem_csr_ena(N_mem_csr_ena),             ///csr o
    .mem_csr_addr(N_mem_csr_addr),         
    .mem_w_csr_data(N_mem_w_csr_data),
    .mem_except_type(N_mem_except_type),

    .men_instr(N_men_instr),
    .men_pc(N_men_pc)
);

    ysyx_210457_MEM_stage MEM_stage (
    .reset(reset),
    .time_inter(N_time_inter),
    .ex_w_data(N_mem_w_data),
    .ex_w_ena(N_mem_w_ena),
    .ex_w_addr(N_mem_w_addr),
    .ex_mem_waddr(N_mem_mem_waddr),
    .ex_mem_raddr(N_mem_mem_raddr),
    .ex_stor_data(N_mem_stor_data),
    .ex_memop(N_mem_memop),
    
    .ex_mem_wr(N_mem_mem_wr),
    .ex_mem_ena(N_mem_mem_ena),
    //.mem_data(data),              //delete for AXI

    .ex_pc(N_men_pc),
    .ex_instr(N_men_instr),

    .ex_csr_addr(N_mem_csr_addr),         ///csr
    .ex_w_csr_data(N_mem_w_csr_data),
    .ex_csr_ena(N_mem_csr_ena),
    .ex_except_type(N_mem_except_type),

    
    .mepc(N_mepc),        //csr_read
    .mip(N_mip),
    .mie(N_mie),
    .mtvec(N_mtvec),
    .mstatus(N_mstatus),

    .clint_data(N_clint_data),      //clint

    .mem_csr_addr(N_MEM_csr_addr),         ///csr o
    .mem_w_csr_data(N_MEM_w_csr_data),
    .mem_csr_ena(N_MEM_csr_ena),
    .mem_except_type(N_MEM_except_type),
    .new_pc(N_new_pc),

    .mem_pc(N_MEM_pc),

    .mem_w_data(N_MEM_w_data),
    .mem_w_ena(N_MEM_w_ena),
    .mem_w_addr(N_MEM_w_addr),

    .mem_valid(mem_valid),
    .mem_data(mem_data),
    .mem_stor_data(MEM_stor_data),
    .mem_addr(mem_addr),
    .mem_sel(mem_sel),
    .mem_req(mem_req)
);


    ysyx_210457_mem_wb mem_wb (
    .clock(clock),
    .reset(reset),
    .mem_w_data(N_MEM_w_data),
    .mem_w_ena(N_MEM_w_ena),
    .mem_w_addr(N_MEM_w_addr),
    
    .mem_csr_addr(N_MEM_csr_addr),         //csr
    .mem_w_csr_data(N_MEM_w_csr_data),
    .mem_csr_ena(N_MEM_csr_ena),
    .flush(flush),
    .stall(stall[1:0]),
    

    .wb_csr_addr(N_wb_csr_addr),         ///csr o
    .wb_w_csr_data(N_wb_w_csr_data),
    .wb_csr_ena(N_wb_csr_ena),
    
    .wb_w_data(N_wb_w_data),
    .wb_w_ena(N_wb_w_ena),
    .wb_w_addr(N_wb_w_addr)
);

   ysyx_210457_WB_stage WB_stage (
    .reset(reset),
    .mem_w_ena(N_wb_w_ena),
    .mem_w_data(N_wb_w_data),
    .mem_w_addr(N_wb_w_addr),
    .mem_csr_ena(N_wb_csr_ena),           //csr
    .mem_csr_addr(N_wb_csr_addr),         
    .mem_w_csr_data(N_wb_w_csr_data),

    
    .wb_csr_ena(N_WB_csr_ena),                 ///csr o
    .wb_csr_addr(N_WB_csr_addr),         
    .wb_w_csr_data(N_WB_w_csr_data),
    .wb_w_ena(N_WB_w_ena),
    .wb_w_data(N_WB_w_data),
    .wb_w_addr(N_WB_w_addr)
);

   ysyx_210457_CSR_reg CSR_reg (
    .reset(reset),
    .clock(clock),
    .csr_r_addr(N_ex_csr_addr),

    .csr_w_ena(N_WB_csr_ena),
    .csr_w_addr(N_WB_csr_addr),
    .csr_w_data(N_WB_w_csr_data),
   
    .except_type(N_MEM_except_type),
    .except_pc(N_MEM_pc),             //mem_pc
    .time_inter(N_time_inter),
    .stall(stall[1]),

    .csr_reg_data(N_csr_reg_data),
    .mtvec(N_mtvec),
    .mepc(N_mepc),
    .mie(N_mie),
    .mip(N_mip),
    .mstatus(N_mstatus),


    .flush(flush)
);

    ysyx_210457_Clint Clint (
    .clock(clock),
    .reset(reset),
    .ex_mem_waddr(N_mem_mem_waddr),
    .ex_mem_raddr(N_mem_mem_raddr),
    .ex_stor_data(N_mem_stor_data),
    .ex_mem_wr(N_mem_mem_wr),
    .ex_mem_ena(N_mem_mem_ena),


    .time_inter(N_time_inter),
    .clint_data(N_clint_data)
);

endmodule






module ysyx_210457_IF_stage (
    input wire reset,
    input wire clock,
    input wire [`YSYX210457_PC_BUS] branch,
    input wire mux_pc,
    input wire pc_con,
    input wire [`YSYX210457_PC_BUS] pc_id,
    input wire [`YSYX210457_PC_BUS] new_pc,
    input wire flush,
    input wire stall,
    input wire id_forecase,
    input wire error_branch,

    output wire [`YSYX210457_PC_BUS] if_branch,
    output wire if_forecase,
    output wire wash,
    output wire [`YSYX210457_INST_BUS] instr,

    output wire if_valid,                  //AXI
    input  wire [31 : 0] if_data_read,//
    output wire [`YSYX210457_PC_BUS] IF_pc,//
    output wire [1 : 0] if_size,//
    output wire if_req//

);
wire [`YSYX210457_PC_BUS] pc_i;

assign if_branch = pc_i;

assign if_size = `YSYX210457_SIZE_W;
assign instr = if_data_read;
assign if_req = `YSYX210457_REQ_READ;


ysyx_210457_PC PC(
  .clock(clock),
  .reset(reset),
  .pc_i(pc_i),
  .pc_con(pc_con),
  .new_pc(new_pc),
  .flush(flush),
  .stall(stall),

  .I_M_e(if_valid),
  .pc(IF_pc)
  
);

ysyx_210457_forecase forecase (
    .reset(reset),
    .clock(clock),
    .mux_pc(mux_pc),
    .pc_id(pc_id),
    .IF_pc(IF_pc),
    .branch(branch),
    .stall(stall),
    .id_forecase(id_forecase),
    .error_branch(error_branch),

    .wash(wash),
    .if_forecase(if_forecase),
    .pc(pc_i)
);

endmodule


module ysyx_210457_if_id (
    input wire reset,
    input wire clock,
    input wire [`YSYX210457_PC_BUS] if_pc,
    input wire [`YSYX210457_INST_BUS] if_instr,
    input wire pc_con,
    input wire wash,
    input wire flush,
    input wire if_forecase,
    input wire [`YSYX210457_PC_BUS] if_branch,
    input wire [1: 0] stall,

    output reg [`YSYX210457_PC_BUS] id_branch,
    output reg id_forecase,
    output reg [`YSYX210457_PC_BUS] id_pc,
    output reg [`YSYX210457_INST_BUS] id_instr
);
    always @(posedge clock) begin
        if(reset == 1'b1) begin
            id_pc <= `YSYX210457_PC_START;
            id_instr <= `YSYX210457_ZERO_INST;
            id_forecase <= 1'b0;
            id_branch <= `YSYX210457_ZERO_PC;
        end
        else begin
            if(flush == 1'b1) begin
                id_pc <= `YSYX210457_PC_START;
                id_instr <= `YSYX210457_ZERO_INST;
                id_forecase <= 1'b0;
                id_branch <= `YSYX210457_ZERO_PC;
            end
            else if(stall[1] & ~stall[0]) begin
                id_pc <= `YSYX210457_PC_START;
                id_instr <= `YSYX210457_ZERO_INST;
            end
            else if(~stall[1]) begin
                if(wash == 1'b1) begin
                    if(pc_con == 1'b0) begin
                        id_pc <= `YSYX210457_PC_START;
                        id_instr <= `YSYX210457_ZERO_INST;
                        id_forecase <= 1'b0;
                        id_branch <= `YSYX210457_ZERO_PC;
                    end
                end
                else begin
                    if (pc_con == 1'b0) begin
                        id_pc <= if_pc;
                        id_instr <= if_instr;
                        id_forecase <= if_forecase;
                        id_branch <= if_branch;
                    end 
                end        
            end
        end
    end
endmodule


module ysyx_210457_ID_stage (
    input wire reset,
    input wire [`YSYX210457_PC_BUS] IF_pc, 
    input wire [`YSYX210457_INST_BUS] IF_instr,

    input wire [`YSYX210457_REG_BUS] reg_data1, //
    input wire [`YSYX210457_REG_BUS] reg_data2, //

    input wire [`YSYX210457_REG_BUS] ex_w_data,    //ex_stage for data
    input wire ex_w_ena,
    input wire [4 : 0] ex_w_addr,

    input wire [`YSYX210457_REG_BUS] mem_w_data,   //men_stage for data
    input wire mem_w_ena,
    input wire [4 : 0] mem_w_addr,

    input wire idex_mem_ena,          //id_ex memory enable
    input wire idex_mem_wr,

    
    input wire [`YSYX210457_PC_BUS] if_branch,

    output reg error_branch,

    output reg reg1_r_ena,
    output reg reg2_r_ena,
    output reg [4 : 0] reg1_addr,
    output reg [4 : 0] reg2_addr,

    output reg [6 : 0] aluop,          //ALUoptions
    output reg [3 : 0] alusel,

    output reg [`YSYX210457_REG_BUS] reg1_data,  //
    output reg [`YSYX210457_REG_BUS] reg2_data,  //

    output reg [4 : 0] w_addr,       
    output reg w_ena,                  //write enable

    output wire [`YSYX210457_PC_BUS] ID_pc,    //pc now
    output wire [`YSYX210457_INST_BUS] ID_instr,
    output reg [`YSYX210457_PC_BUS] branch,    //pc next
    output reg mux_pc,
    output reg pc_con,
    output wire [31 : 0] imm_32,

    output reg [4 : 0] memop,
    output reg id_mem_wr,
    output reg id_mem_ena,

    output reg id_csr_ena           //csr_ena

);
    wire [6 : 0] opcode;
    wire [2 : 0] funct3;
    wire [6 : 0] funct7;
    wire [63 : 0] imm;
    
    assign ID_pc = IF_pc;
    assign ID_instr = IF_instr;
    assign opcode = IF_instr[6:0];
    assign funct3 = IF_instr[14 : 12];
    assign funct7 = IF_instr[31 : 25];



    ysyx_210457_IMGN IMGN (
    .instr(IF_instr),

    .imm(imm)
);


assign imm_32 = imm[31 : 0];
    always @(*) begin                 //ID
        if(reset == 1) begin
            reg1_r_ena = `YSYX210457_ZERO_ENA;
            reg2_r_ena = `YSYX210457_ZERO_ENA;
            reg1_addr = `YSYX210457_ZERO_REG_ADDR;
            reg2_addr = `YSYX210457_ZERO_REG_ADDR;
            w_addr = `YSYX210457_ZERO_REG_ADDR;
            w_ena = 1'b0;

            aluop = 7'b0000_000;          //ALUoptions
            alusel = 4'b0000;

            mux_pc = 1'b0;
            branch = `YSYX210457_ZERO_WORD;
            memop = 5'b00000;
            id_mem_wr = 1'b0;
            id_mem_ena = 1'b0;
            pc_con = 1'b0;
            id_csr_ena = 1'b0;
            error_branch = 1'b0;

        end
        else begin
            reg1_r_ena = `YSYX210457_ZERO_ENA;
            reg2_r_ena = `YSYX210457_ZERO_ENA;
            reg1_addr = IF_instr[19 : 15];
            reg2_addr = IF_instr[24 : 20];
            w_addr = IF_instr[11 : 7];
            w_ena = 1'b0;

            aluop = 7'b0000_000;          //ALUoptions
            alusel = 4'b0000;

            mux_pc = 1'b0;
            branch = IF_pc;

            memop = 5'b00000;
            id_mem_wr = 1'b0;
            id_mem_ena = 1'b0;
            pc_con = 1'b0;
            id_csr_ena = 1'b0;

            error_branch = 1'b0;

        case (opcode)
            //I
            7'b0010011:begin
                    w_ena = 1'b1;
                    reg1_r_ena = 1'b1;
                    reg2_r_ena = 1'b0;
                    
                    case (funct3) 
                          `YSYX210457_addi:begin
                                aluop = `YSYX210457_ADD;
                                alusel = `YSYX210457_Arith;
                           end
                          `YSYX210457_andi:begin
                                aluop = `YSYX210457_AND;
                                alusel = `YSYX210457_Arith;
                           end
                           `YSYX210457_xori:begin
                                aluop = `YSYX210457_XOR;
                                alusel = `YSYX210457_Arith;
                           end
                           `YSYX210457_ori:begin
                                aluop = `YSYX210457_OR;
                                alusel = `YSYX210457_Arith;
                           end
                           `YSYX210457_slti:begin
                                aluop = `YSYX210457_COM;
                                alusel = `YSYX210457_Logic;
                           end
                           `YSYX210457_sltiu:begin
                                aluop = `YSYX210457_COMu;
                                alusel = `YSYX210457_Logic;
                           end
                           `YSYX210457_slli:begin
                                aluop = `YSYX210457_SHIL;
                                alusel = `YSYX210457_Arith;
                           end
                           `YSYX210457_srlisrai:begin
                                alusel = `YSYX210457_Arith;
                            case (funct7[6 : 1])
                                `YSYX210457_srli:begin
                                 aluop = `YSYX210457_SHIR;
                                end
                                `YSYX210457_srai:begin
                                 aluop = `YSYX210457_SRA;
                                end
                                default:begin
                                 reg1_r_ena = `YSYX210457_ZERO_ENA;
                                 reg2_r_ena = `YSYX210457_ZERO_ENA;
                                 id_mem_ena = 1'b0;
                                 w_ena = 1'b0;
                                 id_mem_wr = 1'b0;
                                end
                            endcase        
                           end
                    endcase
              end
              //addiw
              7'b0011011:begin
                  case(funct3)
                       `YSYX210457_addiw:begin
                           w_ena = 1'b1;
                           reg1_r_ena = 1'b1;
                           reg2_r_ena = 1'b0;
                           aluop = `YSYX210457_ADD;
                           alusel = `YSYX210457_Short; 
                        end
                        `YSYX210457_slliw:begin
                            if(IF_instr[25] == 0) begin
                                 w_ena = 1'b1;
                                 reg1_r_ena = 1'b1;
                                 reg2_r_ena = 1'b0;
                                 aluop = `YSYX210457_SHIL;
                                 alusel = `YSYX210457_Short;
                            end  
                        end
                        `YSYX210457_srliwsraiw:begin
                            case(funct7[6 : 1])
                                 `YSYX210457_sraiw:begin
                                     if(IF_instr[25] == 0) begin
                                         w_ena = 1'b1;
                                         reg1_r_ena = 1'b1;
                                         reg2_r_ena = 1'b0;
                                         aluop = `YSYX210457_SRAw;
                                         alusel = `YSYX210457_Short;
                                     end  
                                 end
                                 `YSYX210457_srliw:begin
                                      if(IF_instr[25] == 0) begin
                                        w_ena = 1'b1;
                                        reg1_r_ena = 1'b1;
                                        reg2_r_ena = 1'b0;
                                        aluop = `YSYX210457_SHIRw;
                                        alusel = `YSYX210457_Short;
                                      end  
                                 end
                                 default:begin
                                      reg1_r_ena = `YSYX210457_ZERO_ENA;
                                      reg2_r_ena = `YSYX210457_ZERO_ENA;
                                      id_mem_ena = 1'b0;
                                      w_ena = 1'b0;
                                 end
                            endcase
                        end
                        default:begin
                            reg1_r_ena = `YSYX210457_ZERO_ENA;
                            reg2_r_ena = `YSYX210457_ZERO_ENA;
                            id_mem_ena = 1'b0;
                            w_ena = 1'b0;
                        end
                  endcase
              end
              //addw
              7'b0111011:begin
                  case (funct3)
                        `YSYX210457_addwsubw:begin
                            case (funct7)
                                  `YSYX210457_addw:begin
                                         w_ena = 1'b1;
                                         reg1_r_ena = 1'b1;
                                         reg2_r_ena = 1'b1;
                                         aluop = `YSYX210457_ADD;
                                         alusel = `YSYX210457_Short;
                                  end 
                                  `YSYX210457_subw:begin
                                         w_ena = 1'b1;
                                         reg1_r_ena = 1'b1;
                                         reg2_r_ena = 1'b1;
                                         aluop = `YSYX210457_SUB;
                                         alusel = `YSYX210457_Short;
                                  end
                                  default:begin
                                         w_ena = 1'b0;
                                         reg1_r_ena = 1'b0;
                                         reg2_r_ena = 1'b0;
                                         aluop = `YSYX210457_NO;
                                         alusel = `YSYX210457_No;
                                  end  
                            endcase
                        end
                        
                        `YSYX210457_srlwsraw:begin
                            case(funct7)
                                 `YSYX210457_sraw:begin
                                       w_ena = 1'b1;
                                       reg1_r_ena = 1'b1;
                                       reg2_r_ena = 1'b1;
                                       aluop = `YSYX210457_SRAw;
                                       alusel = `YSYX210457_Short; 
                                 end
                                 `YSYX210457_srlw:begin
                                       w_ena = 1'b1;
                                       reg1_r_ena = 1'b1;
                                       reg2_r_ena = 1'b1;
                                       aluop = `YSYX210457_SHIRw;
                                       alusel = `YSYX210457_Short;  
                                 end
                                 default:begin
                                    w_ena = 1'b0;
                                    reg1_r_ena = 1'b0;
                                    reg2_r_ena = 1'b0;
                                    aluop = `YSYX210457_NO;
                                    alusel = `YSYX210457_No; 
                                 end
                            endcase
                        end

                        `YSYX210457_sllw:begin
                              w_ena = 1'b1;
                              reg1_r_ena = 1'b1;
                              reg2_r_ena = 1'b1;
                              aluop = `YSYX210457_SHILw;
                              alusel = `YSYX210457_Short;
                        end

                        default:begin
                                 reg1_r_ena = `YSYX210457_ZERO_ENA;
                                 reg2_r_ena = `YSYX210457_ZERO_ENA;
                                 id_mem_ena = 1'b0;
                                 w_ena = 1'b0;
                        end
                  endcase
              end

              //I-L
              7'b0000011:begin
                    w_ena = 1'b1;
                    reg1_r_ena = 1'b1;
                    reg2_r_ena = 1'b0;
                    id_mem_wr = 1'b0;
                    id_mem_ena = 1'b1;
                    case(funct3)
                         `YSYX210457_lb:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_ONE;
                         end
                         `YSYX210457_lbu:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_ONEu;
                         end
                         `YSYX210457_ld:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_EIG;
                         end
                         `YSYX210457_lh:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_DOU;
                         end
                         `YSYX210457_lhu:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_DOUu;
                         end
                         `YSYX210457_lw:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_FOR;
                         end
                         `YSYX210457_lwu:begin
                             alusel = `YSYX210457_Load;
                             aluop = `YSYX210457_ADD;
                             memop = `YSYX210457_R_FORu;
                         end
                         default:begin
                             w_ena = 1'b0;
                             reg1_r_ena = 1'b0;
                             reg2_r_ena = 1'b0;
                             id_mem_wr = 1'b0;
                             id_mem_ena = 1'b0;
                             alusel = `YSYX210457_No;
                             aluop = `YSYX210457_NO;
                         end
                    endcase
              end


              //R
              7'b0110011:begin
                    w_ena = 1'b1;
                    reg1_r_ena = 1'b1;
                    reg2_r_ena = 1'b1;

                    case(funct3)
                         `YSYX210457_addsub:begin
                             alusel = `YSYX210457_Arith;
                             case(funct7)
                                  `YSYX210457_add:begin
                                      aluop = `YSYX210457_ADD;
                                  end
                                  `YSYX210457_sub:begin
                                      aluop = `YSYX210457_SUB;
                                  end
                                  default:begin
                                      reg1_r_ena = `YSYX210457_ZERO_ENA;
                                      reg2_r_ena = `YSYX210457_ZERO_ENA;
                                      id_mem_ena = 1'b0;
                                      w_ena = 1'b0;
                                  end
                             endcase
                         end
                         `YSYX210457_or:begin
                             aluop = `YSYX210457_OR;
                             alusel = `YSYX210457_Arith;
                         end
                         `YSYX210457_xor:begin
                             aluop = `YSYX210457_XOR;
                             alusel = `YSYX210457_Arith;
                         end
                         `YSYX210457_and:begin
                             aluop = `YSYX210457_AND;
                             alusel = `YSYX210457_Arith;
                         end
                         `YSYX210457_slt:begin
                             aluop = `YSYX210457_COM;
                             alusel = `YSYX210457_Logic;
                         end
                         `YSYX210457_sltu:begin
                             aluop = `YSYX210457_COMu;
                             alusel = `YSYX210457_Logic;
                         end
                         `YSYX210457_sll:begin
                             aluop = `YSYX210457_SHIL;
                             alusel = `YSYX210457_Arith;  
                         end
                         `YSYX210457_srlsra:begin
                            alusel = `YSYX210457_Arith;
                            case (funct7)
                                `YSYX210457_srl:begin
                                 aluop = `YSYX210457_SHIR;
                                end
                                `YSYX210457_sra:begin
                                 aluop = `YSYX210457_SRA;
                                end
                                default:begin
                                 reg1_r_ena = `YSYX210457_ZERO_ENA;
                                 reg2_r_ena = `YSYX210457_ZERO_ENA;
                                 id_mem_ena = 1'b0;
                                 w_ena = 1'b0;
                                end
                            endcase        
                         end
                         default:begin
                            reg1_r_ena = `YSYX210457_ZERO_ENA;
                            reg2_r_ena = `YSYX210457_ZERO_ENA;
                            id_mem_ena = 1'b0;
                            w_ena = 1'b0;
                         end
                    endcase
              end

              //B
              7'b1100011:begin
                    w_ena = 1'b0;
                    reg1_r_ena = 1'b1;
                    reg2_r_ena = 1'b1;
                    branch = IF_pc + imm ;
                    case(funct3)
                         `YSYX210457_beq:begin
                             aluop = `YSYX210457_SUB;
                             alusel = `YSYX210457_Jump;
                             if(reg1_data == reg2_data) begin
                                 mux_pc = 1'b1; 
                             end
                         end
                         `YSYX210457_bge:begin
                             aluop = `YSYX210457_SUB;
                             alusel = `YSYX210457_Jump;
                             if(reg1_data[63] == reg2_data[63]) begin
                                 if(reg1_data >= reg2_data) begin
                                     mux_pc = 1'b1; 
                                     end
                             end
                             else begin
                                 if(reg1_data[63] < reg2_data[63]) begin
                                     mux_pc = 1'b1;
                                 end
                             end  
                         end
                         `YSYX210457_bgeu:begin
                             aluop = `YSYX210457_SUB;
                             alusel = `YSYX210457_Jump;
                             if(reg1_data >= reg2_data) begin
                                 mux_pc = 1'b1; 
                             end
                         end
                         `YSYX210457_blt:begin
                             aluop = `YSYX210457_SUB;
                             alusel = `YSYX210457_Jump;
                             if(reg1_data[63] == reg2_data[63]) begin
                                 if(reg1_data < reg2_data) begin
                                     mux_pc = 1'b1; 
                                     end
                             end
                             else begin
                                 if(reg1_data[63] > reg2_data[63]) begin
                                     mux_pc = 1'b1;
                                 end
                             end  
                         end
                         `YSYX210457_bltu:begin
                             aluop = `YSYX210457_SUB;
                             alusel = `YSYX210457_Jump;
                             if(reg1_data < reg2_data) begin
                                 mux_pc = 1'b1; 
                             end
                         end
                         `YSYX210457_bne:begin
                             aluop = `YSYX210457_SUB;
                             alusel = `YSYX210457_Jump;
                             if(reg1_data != reg2_data) begin
                                 mux_pc = 1'b1; 
                             end
                         end
                         default:begin
                                 reg1_r_ena = `YSYX210457_ZERO_ENA;
                                 reg2_r_ena = `YSYX210457_ZERO_ENA;
                                 id_mem_ena = 1'b0;
                                 w_ena = 1'b0;
                         end
                    endcase
                    if((if_branch != branch) && (mux_pc)) begin
                        error_branch = 1'b1;
                    end
                    
              end
              
              //jal
              7'b1101111:begin
                  w_ena = 1'b1;
                  reg1_r_ena = 1'b0;
                  reg2_r_ena = 1'b0;
                  aluop = `YSYX210457_NO;
                  alusel = `YSYX210457_Jump;
                  branch = IF_pc + imm;
                  mux_pc = 1'b1;
                  if((if_branch != branch) && (mux_pc)) begin
                        error_branch = 1'b1;
                  end
              end

              //jalr
              7'b1100111:begin
                  mux_pc = 1'b1;
                  w_ena = 1'b1;
                  reg1_r_ena = 1'b1;
                  reg2_r_ena = 1'b0;
                  aluop = `YSYX210457_NO;
                  alusel = `YSYX210457_Jump;
                  branch = ((reg1_data + imm) & 64'hffff_ffff_ffff_fffe);
                  if((if_branch != branch) && (mux_pc)) begin
                        error_branch = 1'b1;
                  end
              end

              //S
              7'b0100011:begin
                    w_ena = 1'b0;
                    reg1_r_ena = 1'b1;
                    reg2_r_ena = 1'b1;
                    id_mem_wr = 1'b1;
                    id_mem_ena = 1'b1;
                    case (funct3)
                        `YSYX210457_sb:begin
                            aluop = `YSYX210457_NO;
                            alusel = `YSYX210457_Store;
                            memop = `YSYX210457_W_ONE;
                        end
                        `YSYX210457_sd:begin
                            aluop = `YSYX210457_NO;
                            alusel = `YSYX210457_Store;
                            memop = `YSYX210457_W_EIG;
                        end
                        `YSYX210457_sh:begin
                            aluop = `YSYX210457_NO;
                            alusel = `YSYX210457_Store;
                            memop = `YSYX210457_W_DOU;
                        end
                        `YSYX210457_sw:begin
                            aluop = `YSYX210457_NO;
                            alusel = `YSYX210457_Store;
                            memop = `YSYX210457_W_FOR;
                        end
                        default:begin
                            reg1_r_ena = `YSYX210457_ZERO_ENA;
                            reg2_r_ena = `YSYX210457_ZERO_ENA;
                            id_mem_ena = 1'b0;
                            w_ena = 1'b0;
                        end
                    endcase
              end

              //lui
              7'b0110111:begin
                    w_ena = 1'b1;
                    reg1_r_ena = 1'b0;
                    reg2_r_ena = 1'b0;
                    aluop = `YSYX210457_LEFT12;
                    alusel = `YSYX210457_Arith;
              end

              //auipc
              7'b0010111:begin
                    w_ena = 1'b1;
                    reg1_r_ena = 1'b0;
                    reg2_r_ena = 1'b0;
                    aluop = `YSYX210457_LEFT12;
                    alusel = `YSYX210457_Long;
              end


              //CSR
              7'b1110011:begin
                  id_csr_ena = 1'b1;
                  w_ena = 1'b1;
                  case(funct3)
                       `YSYX210457_csrrw:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_CSRRW;
                           reg1_r_ena = 1'b1;
                           reg2_r_ena = 1'b0;
                       end
                       `YSYX210457_csrrs:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_CSRRS;
                           reg1_r_ena = 1'b1;
                           reg2_r_ena = 1'b0;
                       end
                       `YSYX210457_csrrc:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_CSRRC;
                           reg1_r_ena = 1'b1;
                           reg2_r_ena = 1'b0;
                       end
                       `YSYX210457_csrrwi:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_CSRRWI;
                           reg1_r_ena = 1'b0;
                           reg2_r_ena = 1'b0;
                       end
                       `YSYX210457_csrrsi:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_CSRRSI;
                           reg1_r_ena = 1'b0;
                           reg2_r_ena = 1'b0;
                       end
                       `YSYX210457_csrrci:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_CSRRCI;
                           reg1_r_ena = 1'b0;
                           reg2_r_ena = 1'b0;
                       end
                       `YSYX210457_system:begin
                           case(IF_instr[31 : 20])
                                `YSYX210457_mret:begin
                                   aluop = `YSYX210457_NO;
                                   alusel = `YSYX210457_SYSTEM;
                                   reg1_r_ena = 1'b0;
                                   reg2_r_ena = 1'b0;
                                   w_ena = 1'b0; 
                                end
                                `YSYX210457_ebreak:begin
                                   aluop = `YSYX210457_NO;
                                   alusel = `YSYX210457_SYSTEM;
                                   reg1_r_ena = 1'b0;
                                   reg2_r_ena = 1'b0;
                                   w_ena = 1'b0;
                                end
                                `YSYX210457_ecall:begin
                                   aluop = `YSYX210457_NO;
                                   alusel = `YSYX210457_SYSTEM;
                                   reg1_r_ena = 1'b0;
                                   reg2_r_ena = 1'b0;
                                   w_ena = 1'b0;
                                end
                                default:begin
                                   aluop = `YSYX210457_NO;
                                   alusel = `YSYX210457_No;
                                   reg1_r_ena = 1'b0;
                                   reg2_r_ena = 1'b0;
                                   w_ena = 1'b0;
                                   id_csr_ena = 1'b0;
                                end
                           endcase
                       end

                       default:begin
                           aluop = `YSYX210457_NO;
                           alusel = `YSYX210457_No;
                           reg1_r_ena = 1'b0;
                           reg2_r_ena = 1'b0;
                           id_csr_ena = 1'b0;
                       end
                  endcase
              end

              //fence
              7'b0001111:begin
                    id_mem_ena = 1'b0;
                    w_ena = 1'b0;
                    id_csr_ena = 1'b0;
                    aluop = `YSYX210457_NO;
                    alusel = `YSYX210457_No;
                    reg1_r_ena = 1'b0;
                    reg2_r_ena = 1'b0;
                    case(funct3) 
                        `YSYX210457_fence:begin
                      
                        end
                        `YSYX210457_fencei:begin
                      
                        end
                        default:begin
                            
                        end
                    endcase
              end
              
              default:begin
                    reg1_r_ena = `YSYX210457_ZERO_ENA;
                    reg2_r_ena = `YSYX210457_ZERO_ENA;
                    id_mem_ena = 1'b0;
                    w_ena = 1'b0;
                    id_csr_ena = 1'b0;
              end
        endcase

        if( ((idex_mem_ena == 1'b1) && (idex_mem_wr == 1'b0)) && (ex_w_ena == 1'b1) &&
         ( ((ex_w_addr == reg1_addr) && (ex_w_addr != 5'b00000)) || ((ex_w_addr == reg2_addr) && (ex_w_addr != 5'b00000)) ) ) 
         begin
            id_mem_ena = 1'b0;
            w_ena = 1'b0;
            pc_con = 1'b1;
            id_mem_wr = 1'b0;
            id_csr_ena = 1'b0;
         end
    end
end

    always @(*) begin
        if(reset == 1'b1) begin
            reg1_data = `YSYX210457_ZERO_WORD;
        end
        else if(reg1_r_ena == 1'b1) begin
            if((ex_w_ena == 1'b1) && (ex_w_addr == reg1_addr) && (ex_w_addr != 5'b00000)) begin
                reg1_data = ex_w_data;
            end
            else if((mem_w_ena == 1'b1) && (mem_w_addr == reg1_addr) && (mem_w_addr != 5'b00000)) begin
                reg1_data = mem_w_data;
            end
            else begin
                reg1_data = reg_data1;
            end
        end
        else if(reg1_r_ena == 1'b0) begin
            reg1_data = imm;
        end
        else begin
            reg1_data = `YSYX210457_ZERO_WORD;
        end
    end

    always @(*) begin
        if(reset == 1'b1) begin
            reg2_data = `YSYX210457_ZERO_WORD;
        end
        else if(reg2_r_ena == 1'b1) begin
            if((ex_w_ena == 1'b1) && (ex_w_addr == reg2_addr) && (ex_w_addr != 5'b00000)) begin
                reg2_data = ex_w_data;
            end
            else if((mem_w_ena == 1'b1) && (mem_w_addr == reg2_addr) && (mem_w_addr != 5'b00000)) begin
                reg2_data = mem_w_data;
            end
            else begin
                reg2_data = reg_data2;
            end
        end
        else if(reg2_r_ena == 1'b0) begin
            reg2_data = imm;
        end
        else begin
            reg2_data = `YSYX210457_ZERO_WORD;
        end
    end

endmodule

module ysyx_210457_id_ex (
    input wire reset,
    input wire clock,
    input wire [31 : 0] id_imm,

    input wire [`YSYX210457_PC_BUS] id_pc,
    input wire [`YSYX210457_INST_BUS] id_instr,

    input wire [4 : 0] id_memop,
    input wire [6 : 0] id_aluop,
    input wire [3 : 0] id_alusel,
    input wire id_mem_wr,
    input wire id_mem_ena,

    input wire [`YSYX210457_REG_BUS] id_reg1_data,
    input wire [`YSYX210457_REG_BUS] id_reg2_data,

    input wire id_w_ena,
    input wire [4 : 0] id_w_addr,
    input wire flush,
    input wire [1: 0] stall,

    input wire id_csr_ena,           //csr

    output reg ex_csr_ena,

    output reg [4 : 0] ex_w_addr,
    output reg ex_w_ena,

    output reg [`YSYX210457_REG_BUS] ex_reg1_data,
    output reg [`YSYX210457_REG_BUS] ex_reg2_data,

    output reg [4 : 0] ex_memop,
    output reg [6 : 0] ex_aluop,
    output reg [3 : 0] ex_alusel,
    output reg [31 : 0] ex_imm,
    output reg ex_mem_wr,
    output reg ex_mem_ena,

    output reg [`YSYX210457_INST_BUS] ex_instr,
    output reg [`YSYX210457_PC_BUS] ex_pc

); 

always @(posedge clock) begin
    if (reset == 1'b1) begin
        ex_w_addr <= `YSYX210457_ZERO_REG_ADDR;
        ex_w_ena <= 1'b0;

        ex_reg1_data <= `YSYX210457_ZERO_WORD;
        ex_reg2_data <= `YSYX210457_ZERO_WORD;

        ex_memop <= 5'b00000;
        ex_aluop <= 7'b0000000;
        ex_alusel <= 4'b000;
        ex_imm <= 32'h0;
        ex_mem_wr <= 1'b0;
        ex_mem_ena <= 1'b0;

        ex_pc <= `YSYX210457_PC_START;
        ex_instr <= `YSYX210457_ZERO_INST;

        ex_csr_ena <= 1'b0;
    end
    else begin
        if(flush == 1'b1) begin
            ex_w_addr <= `YSYX210457_ZERO_REG_ADDR;
            ex_w_ena <= 1'b0;

            ex_reg1_data <= `YSYX210457_ZERO_WORD;
            ex_reg2_data <= `YSYX210457_ZERO_WORD;

            ex_memop <= 5'b00000;
            ex_aluop <= 7'b0000000;
            ex_alusel <= 4'b000;
            ex_imm <= 32'h0;
            ex_mem_wr <= 1'b0;
            ex_mem_ena <= 1'b0;

            ex_pc <= `YSYX210457_PC_START;
            ex_instr <= `YSYX210457_ZERO_INST;
            ex_csr_ena <= 1'b0;
        end
        else if(stall[1] & ~stall[0]) begin
            ex_w_addr <= `YSYX210457_ZERO_REG_ADDR;
            ex_w_ena <= 1'b0;

            ex_reg1_data <= `YSYX210457_ZERO_WORD;
            ex_reg2_data <= `YSYX210457_ZERO_WORD;

            ex_memop <= 5'b00000;
            ex_aluop <= 7'b0000000;
            ex_alusel <= 4'b000;
            ex_imm <= 32'h0;
            ex_mem_wr <= 1'b0;
            ex_mem_ena <= 1'b0;

            ex_pc <= `YSYX210457_PC_START;
            ex_instr <= `YSYX210457_ZERO_INST;
            ex_csr_ena <= 1'b0;
        end
        else if(~stall[1]) begin
            
            ex_w_addr <= id_w_addr;
            ex_w_ena <= id_w_ena;

            ex_reg1_data <= id_reg1_data;
            ex_reg2_data <= id_reg2_data;

            ex_memop <= id_memop;
            ex_aluop <= id_aluop;
            ex_alusel <= id_alusel;
            ex_imm <= id_imm;
            ex_mem_wr <= id_mem_wr;
            ex_mem_ena <= id_mem_ena;

            ex_pc <= id_pc;
            ex_instr <= id_instr;
            ex_csr_ena <= id_csr_ena;
            
        end
    end
  end
endmodule

module ysyx_210457_EX_stage (
    input wire reset,

    input wire [`YSYX210457_PC_BUS] ID_pc,
    input wire [`YSYX210457_INST_BUS] ID_instr,

    input wire [4 : 0] id_w_addr,
    input wire id_w_ena,

    input wire [`YSYX210457_REG_BUS] id_reg1_data,
    input wire [`YSYX210457_REG_BUS] id_reg2_data,
    input wire [31 : 0] id_imm,

    input wire [4 : 0] id_memop,
    input wire id_mem_wr,
    input wire id_mem_ena,
    input wire [6 : 0] id_aluop,
    input wire [3 : 0] id_alusel,

    input wire [`YSYX210457_REG_BUS] csr_reg_data,     //csr
    input wire id_csr_ena,
    
    input wire[11 : 0] mem_csr_addr,        //qian di
    input wire [`YSYX210457_REG_BUS] mem_w_csr_data,
    input wire mem_csr_ena,
    input wire [11 : 0] wb_csr_addr,
    input wire [`YSYX210457_REG_BUS] wb_w_csr_data,
    input wire wb_csr_ena,

    output reg [`YSYX210457_REG_BUS] ex_w_data,
    output reg ex_w_ena,
    output reg [4 : 0] ex_w_addr,

    output reg [`YSYX210457_ADDR_BUS] ex_mem_raddr,
    output reg [`YSYX210457_ADDR_BUS] ex_mem_waddr,
    output reg [`YSYX210457_REG_BUS] ex_stor_data,
    output reg [4 : 0] ex_memop,
    output reg ex_mem_wr,
    output reg ex_mem_ena,

    output reg [11 : 0] ex_csr_addr,         ///csr o
    output reg [`YSYX210457_REG_BUS] ex_w_csr_data,
    output reg ex_csr_ena, 

    output wire [`YSYX210457_INST_BUS] EX_instr,
    output wire [`YSYX210457_PC_BUS] EX_pc,

    output wire [`YSYX210457_REG_BUS] except_type
);
    wire [`YSYX210457_REG_BUS] result;
    assign EX_pc = ID_pc;
    assign EX_instr = ID_instr;

    reg mret;
    reg ebreak;
    reg ecall;
    assign except_type = {45'b0, mret, ebreak, ecall, 16'b0};

ysyx_210457_ALU ALU(
    .num1(id_reg1_data),
    .num2(id_reg2_data),
    .op(id_aluop),
    
    .out(result)
);
    reg [`YSYX210457_REG_BUS] csr_data;
    always @(*) begin
        if(reset == 1'b1) begin
            csr_data =`YSYX210457_ZERO_WORD;
        end
        else begin
            csr_data =`YSYX210457_ZERO_WORD;
            if(ex_csr_ena == 1'b1) begin
                if((mem_csr_ena == 1'b1) && (ex_csr_addr == mem_csr_addr)) begin
                    csr_data = mem_w_csr_data;
                end
                else if((wb_csr_ena == 1'b1) && (ex_csr_addr == wb_csr_addr)) begin
                    csr_data = wb_w_csr_data;
                end
                else begin
                    csr_data = csr_reg_data;
                end
            end
        end
    end

 
    always @(*) begin
        if(reset == 1'b1) begin
            ex_w_data = `YSYX210457_ZERO_WORD;
            ex_w_ena = 1'b0;
            ex_w_addr = `YSYX210457_ZERO_REG_ADDR;
            ex_stor_data = `YSYX210457_ZERO_WORD;
            ex_mem_wr = 1'b0;
            ex_mem_ena = 1'b0;
            ex_mem_raddr = `YSYX210457_ZERO_ADDR;
            ex_mem_waddr = `YSYX210457_ZERO_ADDR;
            ex_memop = 5'h00;
            ex_csr_ena = 1'b0;
            ex_csr_addr = 12'h000;
            ex_w_csr_data = `YSYX210457_ZERO_WORD;
            mret = 1'b0;
            ebreak = 1'b0;
            ecall = 1'b0;

        end
        else begin
            ex_w_ena = id_w_ena;
            ex_w_addr = id_w_addr;
            ex_w_data = `YSYX210457_ZERO_WORD;
            ex_mem_raddr = `YSYX210457_ZERO_ADDR;
            ex_mem_waddr = `YSYX210457_ZERO_ADDR;
            ex_stor_data = `YSYX210457_ZERO_WORD;
            ex_mem_wr = 1'b0;
            ex_mem_ena = id_mem_ena;
            ex_memop = id_memop;
            ex_csr_ena = id_csr_ena;
            ex_csr_addr = 12'h000;
            ex_w_csr_data = `YSYX210457_ZERO_WORD;
            mret = 1'b0;
            ebreak = 1'b0;
            ecall = 1'b0;

            case (id_alusel)
                  `YSYX210457_Logic:begin
                      if(result == 64'h0000_0000_0000_0001) begin  
                           ex_w_data = 64'h0000_0000_0000_0001;
                      end
                      else begin
                           ex_w_data = 64'h00000000_00000000;
                      end           
                  end 
                  `YSYX210457_Arith:begin
                      ex_w_data = result;
                  end
                  `YSYX210457_Jump:begin
                      ex_w_data = ID_pc + 4;
                  end
                  `YSYX210457_Load:begin
                      ex_mem_raddr = result[`YSYX210457_ADDR_BUS];
                      ex_mem_wr = id_mem_wr;
                  end
                  `YSYX210457_Store:begin
                      ex_mem_waddr = {id_reg1_data[`YSYX210457_ADDR_BUS] + id_imm[`YSYX210457_ADDR_BUS]} ;
                      ex_stor_data = id_reg2_data;
                      ex_mem_wr = id_mem_wr;
                  end
                  `YSYX210457_Long:begin
                      ex_w_data = ID_pc + result;
                  end
                  `YSYX210457_Short:begin
                      ex_w_data = {{32{result[31]}}, result[31 : 0]};
                  end
                  `YSYX210457_CSRRC:begin
                      ex_w_data = csr_data;
                      ex_w_csr_data = csr_data & (~id_reg1_data);
                      ex_csr_addr = id_imm[11 : 0];

                  end
                  `YSYX210457_CSRRCI:begin
                      ex_w_data = csr_data;
                      ex_w_csr_data = csr_data & (~{59'b0, ID_instr[19 : 15]});
                      ex_csr_addr = id_imm[11 : 0];

                  end
                  `YSYX210457_CSRRS:begin
                      ex_w_data = csr_data;
                      ex_w_csr_data = csr_data | id_reg1_data;
                      ex_csr_addr = id_imm[11 : 0];

                  end
                  `YSYX210457_CSRRSI:begin
                      ex_w_data = csr_data;
                      ex_w_csr_data = csr_data | {59'b0, ID_instr[19 : 15]};
                      ex_csr_addr = id_imm[11 : 0];

                  end
                  `YSYX210457_CSRRW:begin
                      ex_w_data = csr_data;
                      ex_w_csr_data = id_reg1_data;
                      ex_csr_addr = id_imm[11 : 0];

                  end
                  `YSYX210457_CSRRWI:begin
                      ex_w_data = csr_data;
                      ex_w_csr_data = {59'b0, ID_instr[19 : 15]};
                      ex_csr_addr = id_imm[11 : 0];

                  end
                  `YSYX210457_SYSTEM:begin
                      ex_w_data = `YSYX210457_ZERO_WORD;
                      ex_w_csr_data = `YSYX210457_ZERO_WORD;
                      ex_csr_addr = id_imm[11 : 0];
                      ex_csr_ena = 1'b0;
                      mret =  ~id_imm[0] & id_imm[1] & id_imm[8] & id_imm[9];
                      ebreak = id_imm[0] & ~id_imm[1] & ~id_imm[8] & ~id_imm[9];
                      ecall = ~id_imm[0] & ~id_imm[1] & ~id_imm[8] & ~id_imm[9];
                  end
                  default: begin
                      ex_w_data = `YSYX210457_ZERO_WORD;
                      ex_mem_waddr = `YSYX210457_ZERO_ADDR;
                      ex_mem_raddr = `YSYX210457_ZERO_ADDR;
                      ex_stor_data = `YSYX210457_ZERO_WORD;
                      ex_w_csr_data = `YSYX210457_ZERO_WORD;
                      ex_csr_addr = 12'h000;
                      ex_csr_ena = 1'b0;
            
                  end
            endcase
        end
    end
endmodule

module ysyx_210457_ex_mem (
    input wire reset,
    input wire clock,
    input wire [`YSYX210457_PC_BUS] ex_pc,
    input wire [`YSYX210457_INST_BUS] ex_instr,
    input wire  [`YSYX210457_REG_BUS] ex_w_data,
    input wire ex_w_ena,
    input wire [4 : 0] ex_w_addr,
    input wire [`YSYX210457_ADDR_BUS] ex_mem_waddr,
    input wire [`YSYX210457_ADDR_BUS] ex_mem_raddr,
    input wire [4 : 0] ex_memop,
    input wire [`YSYX210457_REG_BUS] ex_stor_data,
    input wire ex_mem_wr,
    input wire ex_mem_ena,

    input wire ex_csr_ena,               ///csr
    input wire [11 : 0] ex_csr_addr,         
    input wire [`YSYX210457_REG_BUS] ex_w_csr_data,
    input wire [`YSYX210457_REG_BUS] ex_except_type,
    input wire flush,
    input wire [1 : 0] stall,

    output reg [`YSYX210457_REG_BUS] mem_w_data,
    output reg mem_w_ena,
    output reg [4 : 0] mem_w_addr,

    output reg [`YSYX210457_ADDR_BUS] mem_mem_waddr,
    output reg [`YSYX210457_ADDR_BUS] mem_mem_raddr,
    output reg [4 : 0] mem_memop,
    output reg [`YSYX210457_REG_BUS] mem_stor_data,
    output reg mem_mem_wr,
    output reg mem_mem_ena,

    output reg mem_csr_ena,             ///csr o
    output reg [11 : 0] mem_csr_addr,         
    output reg [`YSYX210457_REG_BUS] mem_w_csr_data,
    output reg [`YSYX210457_REG_BUS] mem_except_type,

    output reg [`YSYX210457_INST_BUS] men_instr,
    output reg [`YSYX210457_PC_BUS] men_pc 
);
    always @(posedge clock) begin
        if(reset == 1'b1) begin
            mem_w_data <= `YSYX210457_ZERO_WORD;
            mem_w_ena <= 1'b0;
            mem_w_addr <= `YSYX210457_ZERO_REG_ADDR;
            mem_mem_waddr <= `YSYX210457_ZERO_ADDR;
            mem_mem_raddr <= `YSYX210457_ZERO_ADDR;
            mem_memop <= 5'b00000;
            mem_stor_data <= `YSYX210457_ZERO_WORD;
            mem_mem_wr <= 1'b0;
            mem_mem_ena <= 1'b0;
            men_pc <= `YSYX210457_PC_START;
            men_instr <= `YSYX210457_ZERO_INST;
            mem_csr_addr <= 12'h000;
            mem_w_csr_data <= `YSYX210457_ZERO_WORD;
            mem_csr_ena <= 1'b0;
            mem_except_type <= `YSYX210457_ZERO_WORD;
        end
        else begin
            if(flush == 1'b1) begin
                mem_w_data <= `YSYX210457_ZERO_WORD;
                mem_w_ena <= 1'b0;
                mem_w_addr <= `YSYX210457_ZERO_REG_ADDR;
                mem_mem_waddr <= `YSYX210457_ZERO_ADDR;
                mem_mem_raddr <= `YSYX210457_ZERO_ADDR;
                mem_memop <= 5'b00000;
                mem_stor_data <= `YSYX210457_ZERO_WORD;
                mem_mem_wr <= 1'b0;
                mem_mem_ena <= 1'b0;
                men_pc <= `YSYX210457_PC_START;
                men_instr <= `YSYX210457_ZERO_INST;
                mem_csr_ena <= 1'b0;
                mem_csr_addr <= 12'h000;
                mem_w_csr_data <= `YSYX210457_ZERO_WORD;
                mem_except_type <= `YSYX210457_ZERO_WORD;
            end
            else if(stall[1] & ~stall[0]) begin
                mem_w_data <= `YSYX210457_ZERO_WORD;
                mem_w_ena <= 1'b0;
                mem_w_addr <= `YSYX210457_ZERO_REG_ADDR;
                mem_mem_waddr <= `YSYX210457_ZERO_ADDR;
                mem_mem_raddr <= `YSYX210457_ZERO_ADDR;
                mem_memop <= 5'b00000;
                mem_stor_data <= `YSYX210457_ZERO_WORD;
                mem_mem_wr <= 1'b0;
                mem_mem_ena <= 1'b0;
                men_pc <= `YSYX210457_PC_START;
                men_instr <= `YSYX210457_ZERO_INST;
                mem_csr_addr <= 12'h000;
                mem_w_csr_data <= `YSYX210457_ZERO_WORD;
                mem_csr_ena <= 1'b0;
                mem_except_type <= `YSYX210457_ZERO_WORD;
            end
            else if(~stall[1]) begin
                mem_w_data <= ex_w_data;
                mem_w_ena <= ex_w_ena;
                mem_w_addr <= ex_w_addr;
                mem_mem_waddr <= ex_mem_waddr;
                mem_mem_raddr <= ex_mem_raddr;
                mem_memop <= ex_memop;
                mem_stor_data <= ex_stor_data;
                mem_mem_wr <= ex_mem_wr;
                mem_mem_ena <= ex_mem_ena;
                men_pc <= ex_pc;
                men_instr <= ex_instr;
                mem_csr_addr <= ex_csr_addr;
                mem_w_csr_data <= ex_w_csr_data;
                mem_csr_ena <= ex_csr_ena;
                mem_except_type <= ex_except_type;
            end   
        end
    end
endmodule

module ysyx_210457_MEM_stage (
    input wire reset,
    input wire time_inter,
    input wire [`YSYX210457_REG_BUS] ex_w_data,
    input wire ex_w_ena,
    input wire [4 : 0] ex_w_addr,
    
    input wire [`YSYX210457_ADDR_BUS] ex_mem_waddr,
    input wire [`YSYX210457_ADDR_BUS] ex_mem_raddr,
    input wire [`YSYX210457_REG_BUS] ex_stor_data,
    input wire [4 : 0] ex_memop,

    input wire ex_mem_wr,
    input wire ex_mem_ena,

    input wire [`YSYX210457_PC_BUS] ex_pc,
    input wire [`YSYX210457_INST_BUS] ex_instr,

    input wire [11 : 0] ex_csr_addr,         ///csr
    input wire [`YSYX210457_REG_BUS] ex_w_csr_data,
    input wire ex_csr_ena,
    input wire [`YSYX210457_REG_BUS] ex_except_type,

    input wire [`YSYX210457_REG_BUS] mepc,        //csr_read
    input wire mip,
    input wire mie,
    input wire [`YSYX210457_REG_BUS] mtvec,
    input wire mstatus,

    input wire [`YSYX210457_REG_BUS] clint_data,      //clint

    
    output reg [11 : 0] mem_csr_addr,         ///csr o
    output reg [`YSYX210457_REG_BUS] mem_w_csr_data,
    output reg mem_csr_ena,
    output reg [`YSYX210457_REG_BUS] mem_except_type,
    output reg [`YSYX210457_PC_BUS] new_pc,

    output wire [`YSYX210457_PC_BUS] mem_pc,

    output reg [`YSYX210457_REG_BUS] mem_w_data,
    output reg mem_w_ena,
    output reg [4 : 0] mem_w_addr,


    output wire mem_valid,  //                //AXI
    input  wire [63 : 0] mem_data,//
    output reg [`YSYX210457_REG_BUS] mem_stor_data,
    output wire [`YSYX210457_ADDR_BUS] mem_addr,//
    output reg [1 : 0] mem_sel,//
    output wire mem_req//

);


    reg [`YSYX210457_ADDR_BUS] mem_mem_waddr;
    reg [`YSYX210457_ADDR_BUS] mem_mem_raddr;
    reg mem_wr;
    reg mem_mem_ena;



assign mem_valid = mem_mem_ena;
assign mem_req = mem_wr;
assign mem_addr = mem_wr ? mem_mem_waddr : mem_mem_raddr;
assign mem_pc = ex_pc;


    always @(*) begin
        if(reset == 1'b1) begin
            mem_w_data = `YSYX210457_ZERO_WORD;
            mem_w_ena = 1'b0;
            mem_w_addr = `YSYX210457_ZERO_REG_ADDR;
            mem_mem_waddr = `YSYX210457_ZERO_ADDR;
            mem_mem_raddr = `YSYX210457_ZERO_ADDR;
            mem_sel = `YSYX210457_SIZE_B;
            mem_stor_data = `YSYX210457_ZERO_WORD;
            mem_wr = 1'b0;
            mem_mem_ena = 1'b0;
        end
        else begin
            mem_w_data = ex_w_data;
            mem_w_ena = ex_w_ena;
            mem_w_addr = ex_w_addr;
            mem_mem_waddr = ex_mem_waddr;
            mem_mem_raddr = ex_mem_raddr;
            mem_stor_data = `YSYX210457_ZERO_WORD;
            mem_sel = `YSYX210457_SIZE_B;
            mem_wr = ex_mem_wr;
            mem_mem_ena = (ex_mem_ena && (mem_except_type == 64'h0));////////////////////////
            case(ex_memop)
                 `YSYX210457_R_ONE:begin
                     mem_sel = `YSYX210457_SIZE_B;
                     mem_w_data = {{56{mem_data[7]}} , mem_data[7 : 0]}; 
                 end
                 `YSYX210457_R_ONEu:begin   
                     mem_sel = `YSYX210457_SIZE_B;
                     mem_w_data = {{56{1'b0}} , mem_data[7 : 0]};                   
                 end
                 `YSYX210457_R_DOU:begin
                     mem_sel = `YSYX210457_SIZE_H;
                     mem_w_data = {{48{mem_data[15]}} , mem_data[15 : 0]};
                 end
                 `YSYX210457_R_DOUu:begin
                     mem_sel = `YSYX210457_SIZE_H;
                     mem_w_data = {{48{1'b0}} , mem_data[15 : 0]};
                 end
                 `YSYX210457_R_FOR:begin
                     mem_sel = `YSYX210457_SIZE_W;
                     mem_w_data = {{32{mem_data[31]}} , mem_data[31 : 0]};
                 end
                 `YSYX210457_R_FORu:begin
                     mem_sel = `YSYX210457_SIZE_W;
                     mem_w_data = {{32{1'b0}} , mem_data[31 : 0]};
                 end
                 `YSYX210457_R_EIG:begin
                     mem_sel = `YSYX210457_SIZE_D;
                     mem_w_data = mem_data;
                     if((ex_mem_raddr == `YSYX210457_msip) || (ex_mem_raddr == `YSYX210457_mtimecmp) || (ex_mem_raddr == `YSYX210457_mtime)) begin  ////////////
                         mem_mem_ena = 1'b0;
                         mem_w_data = clint_data;
                     end
                 end

                 //write
                 `YSYX210457_W_ONE:begin
                     case(ex_mem_waddr[2 : 0])
                         3'b000:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {56'b0, ex_stor_data[7 : 0]};
                         end
                         3'b001:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {48'b0, ex_stor_data[7 : 0], 8'b0};
                         end
                         3'b010:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {40'b0, ex_stor_data[7 : 0], 16'b0};
                         end
                         3'b011:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {32'b0, ex_stor_data[7 : 0], 24'b0};
                         end
                         3'b100:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {24'b0, ex_stor_data[7 : 0], 32'b0};
                         end
                         3'b101:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {16'b0, ex_stor_data[7 : 0], 40'b0};
                         end
                         3'b110:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {8'b0, ex_stor_data[7 : 0], 48'b0};
                         end
                         3'b111:begin
                             mem_sel = `YSYX210457_SIZE_B;
                             mem_stor_data = {ex_stor_data[7 : 0], 56'b0};
                         end
                     endcase  
                 end
                 `YSYX210457_W_DOU:begin
                     case(ex_mem_waddr[2 : 1])
                         2'b00:begin
                             mem_sel = `YSYX210457_SIZE_H;
                             mem_stor_data = {48'b0, ex_stor_data[15 : 0]};
                         end
                         2'b01:begin
                             mem_sel = `YSYX210457_SIZE_H;
                             mem_stor_data = {32'b0, ex_stor_data[15 : 0], 16'b0};
                         end
                         2'b10:begin
                             mem_sel = `YSYX210457_SIZE_H;
                             mem_stor_data = {16'b0, ex_stor_data[15 : 0], 32'b0};
                         end
                         2'b11:begin
                             mem_sel = `YSYX210457_SIZE_H;
                             mem_stor_data = {ex_stor_data[15 : 0], 48'b0};
                         end 
                     endcase
                 end
                 `YSYX210457_W_FOR:begin
                     case(ex_mem_waddr[2])
                         1'b0:begin
                             mem_sel = `YSYX210457_SIZE_W;
                             mem_stor_data = {32'b0, ex_stor_data[31 : 0]};
                         end
                         1'b1:begin
                             mem_sel = `YSYX210457_SIZE_W;
                             mem_stor_data = {ex_stor_data[31 : 0], 32'b0};
                         end
                     endcase
                 end
                 `YSYX210457_W_EIG:begin
                     mem_sel = `YSYX210457_SIZE_D;
                     mem_stor_data = ex_stor_data;
                     if((ex_mem_waddr == `YSYX210457_msip) || (ex_mem_waddr == `YSYX210457_mtimecmp) || (ex_mem_waddr == `YSYX210457_mtime)) begin  ////////////
                         mem_mem_ena = 1'b0;
                     end
                 end
                 default:begin
                     mem_w_data = ex_w_data;
                     mem_sel = `YSYX210457_SIZE_B;
                     mem_wr = 1'b0;
                     mem_mem_ena = 1'b0;
                 end
            endcase
        end
    end

    always @(*) begin                    //csr
        if(reset == 1'b1) begin
            mem_csr_addr = 12'h000;
            mem_w_csr_data = `YSYX210457_ZERO_WORD;
            mem_csr_ena = 1'b0;
        end
        else begin
            mem_csr_addr = ex_csr_addr;
            mem_w_csr_data = ex_w_csr_data;
            mem_csr_ena = ex_csr_ena;
        end
    end
        

    always @(*) begin
        if(reset == 1'b1) begin
            mem_except_type = `YSYX210457_ZERO_WORD;
            new_pc = `YSYX210457_ZERO_WORD;
        end
        else begin
            mem_except_type = `YSYX210457_ZERO_WORD;
            new_pc = `YSYX210457_ZERO_WORD;
            if(mem_pc != `YSYX210457_ZERO_WORD) begin
                if(((mstatus & mie & time_inter) || (mstatus & mie & mip)) && (ex_instr != 32'h0) && ~ex_mem_wr) begin                             //time_interrupt
                    mem_except_type = 64'h1;
                    new_pc = mtvec;
                end
                else if(ex_except_type == 64'h10000) begin                          //syscall
                    mem_except_type = 64'h2;
                    new_pc = mtvec;
                end
                else if(ex_except_type == 64'h20000) begin                          //ebreak
                    mem_except_type = 64'h3;
                    new_pc = mtvec;
                end  
                else if(ex_except_type == 64'h40000) begin                          //mret
                    mem_except_type = 64'h4;
                    new_pc = mepc;
                end 

            end
        end
    end


endmodule

module ysyx_210457_mem_wb (
    input wire clock,
    input wire reset,
    input wire [`YSYX210457_REG_BUS] mem_w_data,
    input wire mem_w_ena,
    input wire [4 : 0] mem_w_addr,

    input wire [11 : 0] mem_csr_addr,         //csr
    input wire [`YSYX210457_REG_BUS] mem_w_csr_data,
    input wire mem_csr_ena,
    input wire flush,
    input wire [1 : 0] stall,

    output reg [11 : 0] wb_csr_addr,         ///csr o
    output reg [`YSYX210457_REG_BUS] wb_w_csr_data,
    output reg wb_csr_ena,
    
    output reg [`YSYX210457_REG_BUS] wb_w_data,
    output reg wb_w_ena,
    output reg [4 : 0] wb_w_addr
);
    always @(posedge clock) begin
        if(reset == 1'b1) begin
            wb_w_data <= `YSYX210457_ZERO_WORD;
            wb_w_ena <= 1'b0;
            wb_w_addr <= `YSYX210457_ZERO_REG_ADDR;
            wb_csr_addr <= 12'h000;
            wb_w_csr_data <= `YSYX210457_ZERO_WORD;
            wb_csr_ena <= 1'b0;
        end
        else begin
            if(flush == 1'b1) begin
                wb_w_data <= `YSYX210457_ZERO_WORD;
                wb_w_ena <= 1'b0;
                wb_w_addr <= `YSYX210457_ZERO_REG_ADDR;
                
                wb_csr_addr <= 12'h000;
                wb_w_csr_data <= `YSYX210457_ZERO_WORD;
                wb_csr_ena <= 1'b0;
            end
            else if(stall[1] & ~stall[0]) begin
                wb_w_data <= `YSYX210457_ZERO_WORD;
                wb_w_ena <= 1'b0;
                wb_w_addr <= `YSYX210457_ZERO_REG_ADDR;
                wb_csr_addr <= 12'h000;
                wb_w_csr_data <= `YSYX210457_ZERO_WORD;
                wb_csr_ena <= 1'b0;
            end
            else if(~stall[1]) begin
                wb_w_data <= mem_w_data;
                wb_w_ena <= mem_w_ena;
                wb_w_addr <= mem_w_addr;
                wb_csr_addr <= mem_csr_addr;
                wb_w_csr_data <= mem_w_csr_data;
                wb_csr_ena <= mem_csr_ena;
            end
        end
    end
endmodule

module ysyx_210457_WB_stage (
    input wire reset,
    input wire mem_w_ena,
    input wire [`YSYX210457_REG_BUS] mem_w_data,
    input wire [4 : 0] mem_w_addr,
    input wire mem_csr_ena,                 //csr
    input wire [11 : 0] mem_csr_addr,         
    input wire [`YSYX210457_REG_BUS] mem_w_csr_data,
    

    output reg wb_csr_ena,                 ///csr o
    output reg [11 : 0] wb_csr_addr,         
    output reg [`YSYX210457_REG_BUS] wb_w_csr_data,
    output reg wb_w_ena,
    output reg [`YSYX210457_REG_BUS] wb_w_data,
    output reg [4 : 0] wb_w_addr
);

    always @( * ) begin
        if(reset == 1'b1) begin
            wb_w_ena = 1'b0;
            wb_w_data = `YSYX210457_ZERO_WORD;
            wb_w_addr = `YSYX210457_ZERO_REG_ADDR;
        end
        else begin
            wb_w_ena = mem_w_ena;
            wb_w_addr = mem_w_addr;
            wb_w_data = mem_w_data;
        end
    end

    always @(*) begin                    //csr
        if(reset == 1'b1) begin
            wb_csr_addr = 12'h000;
            wb_w_csr_data = `YSYX210457_ZERO_WORD;
            wb_csr_ena = 1'b0;
        end
        else begin
            wb_csr_addr = mem_csr_addr;
            wb_w_csr_data = mem_w_csr_data;
            wb_csr_ena = mem_csr_ena;
        end
    end

endmodule


module ysyx_210457_ALU(
    input wire [63:0] num1,
    input wire [63:0] num2,
    input wire [6:0] op,

    output reg [63:0] out
);
wire signed [63 : 0] num1_s;
wire signed [31 : 0] num1_sw;

assign num1_s = num1;
assign num1_sw = num1[31 : 0];
 
    always @(*) begin
        case (op)
            7'b0000_001: begin
                out = num1 + num2;
            end
            7'b0000_010: begin
                out = num1 - num2;
            end
            7'b0000_100: begin
                out = num1 & num2;
            end
            7'b0001_000: begin
                out = num1 | num2;
            end
            7'b0010_000: begin
                out = num1 ^ num2;
            end
            7'b0100_000: begin
                out = ~num1;
            end
            7'b1000_000: begin
                out = ~num2;
            end
            7'b0000_110: begin
                if(num1[63] == num2[63]) begin
                    if(num1[62 :0] < num2[62 :0]) begin
                        out = 1;
                    end
                    else begin
                        out = 0;
                    end
                end
                else begin
                    if(num1[63] > num2[63]) begin
                        out = 1;
                    end
                    else begin
                        out = 0;
                    end
                end
            end
            7'b0000_011: begin
                if(num1 < num2)
                out = 1;
                else
                out = 0;
            end
            7'b0001_100:begin
                out = num1 << num2[5 : 0];
            end
            7'b0001_101:begin
                out = num1 << num2[4 : 0];
            end
            7'b0011_000:begin
                out = num1 >> num2[5 : 0];
            end
            7'b0011_001:begin
                out = {{32{1'b0}} , {num1[31 : 0] >> num2[4 : 0]}};
            end
            7'b0110_000:begin
                //num1_s = num1;
                out =  num1_s >>> num2[5 : 0];
            end    
            7'b0110_001:begin
                //num1_sw = num1[31 : 0];
                out =  {{32{num1_sw[31]}} , {num1_sw >>> num2[4 : 0]}};
            end   
            7'b1100_000:begin
                out = num1 << 12;
            end       
            default: begin
                out = 64'h00000000_00000000;
            end
        endcase
    end
endmodule

module ysyx_210457_Clint (
    input wire clock,
    input wire reset,
    input wire [`YSYX210457_ADDR_BUS] ex_mem_waddr,
    input wire [`YSYX210457_ADDR_BUS] ex_mem_raddr,
    input wire [`YSYX210457_REG_BUS] ex_stor_data,
    input wire ex_mem_wr,
    input wire ex_mem_ena,


    output reg time_inter,
    output reg [`YSYX210457_REG_BUS] clint_data

);
    reg [`YSYX210457_REG_BUS] msip;
    reg [`YSYX210457_REG_BUS] mtime;
    reg [`YSYX210457_REG_BUS] mtimecmp;


    always @(posedge clock) begin
        if(reset == 1'b1) begin
            mtime <= `YSYX210457_ZERO_WORD;
            mtimecmp <= `YSYX210457_TIME;
            msip <= `YSYX210457_ZERO_WORD;
            time_inter <= 1'b0;
        end
        else begin
            if(mtime != 64'hffff_ffff_ffff_ffff) begin
                mtime <= mtime + 1;
            end
            else begin
                mtime <= 64'h0;
            end

            if(mtime >= mtimecmp) begin
                time_inter <= 1'b1;
            end
            else begin
                time_inter <= 1'b0;
            end

            if(ex_mem_wr & ex_mem_ena) begin
                case(ex_mem_waddr)
                 `YSYX210457_msip:begin
                     msip <= ex_stor_data;
                 end
                 `YSYX210457_mtimecmp:begin
                     mtimecmp <= ex_stor_data;
                 end
                 `YSYX210457_mtime:begin
                     mtime <= ex_stor_data;
                 end
                 default:begin
                    
                 end
                endcase
            end

        end  
    end









    always @( * ) begin                      //read
        if (reset == 1'b1) begin
			clint_data = `YSYX210457_ZERO_WORD;
		end
        else begin
            clint_data = `YSYX210457_ZERO_WORD;
            if(~ex_mem_wr & ex_mem_ena) begin
                case(ex_mem_raddr)
                     `YSYX210457_msip:begin
                         clint_data = msip;
                     end
                     `YSYX210457_mtimecmp:begin
                         clint_data = mtimecmp;
                     end
                     `YSYX210457_mtime:begin
                         clint_data = mtime;
                     end
                     default:begin
                         clint_data = `YSYX210457_ZERO_WORD;
                     end
                endcase
            end
            else begin
                clint_data = `YSYX210457_ZERO_WORD;
            end 
        end
    end

endmodule

module ysyx_210457_CSR_reg (
   input wire reset,
   input wire clock,
   input wire [11 : 0] csr_r_addr,

   input wire csr_w_ena,
   input wire [11 : 0] csr_w_addr,
   input wire [`YSYX210457_REG_BUS] csr_w_data,
   
   input wire [`YSYX210457_REG_BUS] except_type,
   input wire [`YSYX210457_PC_BUS] except_pc,             //mem_pc
   input wire time_inter,
   input wire stall,


   output reg [`YSYX210457_REG_BUS] csr_reg_data,
   output wire mstatus,
   output wire [`YSYX210457_REG_BUS] mtvec,
   output wire [`YSYX210457_REG_BUS] mepc,
   output wire mie,
   output wire mip,

   output reg flush
   

);


   
   reg [`YSYX210457_REG_BUS] csr_mepc;
   reg [`YSYX210457_REG_BUS] csr_mstatus;
   reg [`YSYX210457_REG_BUS] csr_mip;
   reg [`YSYX210457_REG_BUS] csr_mie;
   reg [`YSYX210457_REG_BUS] csr_mtvec;
   
   reg [`YSYX210457_REG_BUS] csr_mscratch;        
   reg [`YSYX210457_REG_BUS] csr_mcause;   
   reg [`YSYX210457_REG_BUS] csr_mcycle;
   reg [`YSYX210457_REG_BUS] csr_minstret;
   reg [`YSYX210457_REG_BUS] csr_sstatus;

    always @(posedge clock) begin                //write csr
        if(reset == 1'b1) begin
            csr_mtvec <= `YSYX210457_ZERO_WORD;
            csr_mepc <= `YSYX210457_ZERO_WORD;
            csr_mcause <= `YSYX210457_ZERO_WORD;
            csr_mstatus <= `YSYX210457_ZERO_WORD;
            csr_mie <= `YSYX210457_ZERO_WORD;
            csr_mip <= `YSYX210457_ZERO_WORD;
            csr_mcycle <= `YSYX210457_ZERO_WORD;
            csr_minstret <= 64'h1;
            csr_mscratch <= `YSYX210457_ZERO_WORD;
            csr_sstatus <= `YSYX210457_ZERO_WORD;
        end
        else begin

            csr_mcycle <= csr_mcycle + 1;        //cycle

            csr_mip[7] <= time_inter;            //interrpt

            if((except_pc != `YSYX210457_PC_START) && (except_type != 64'h1) && (stall != 1'b1)) begin
                csr_minstret <= csr_minstret + 1;
            end

            if(csr_w_ena == 1'b1) begin
                case(csr_w_addr)
                    `YSYX210457_mstatus:begin
                        csr_mstatus[62 : 0] <= csr_w_data[62 : 0];
                        csr_mstatus[63] <= (csr_w_data[13] & csr_w_data[14]) | (csr_w_data[15] & csr_w_data[16]);
                        csr_sstatus[63] <= (csr_w_data[13] & csr_w_data[14]) | (csr_w_data[15] & csr_w_data[16]);
                        csr_sstatus[16 : 13] <= csr_w_data[16 : 13];
                    end
                     `YSYX210457_mtvec:begin
                        csr_mtvec <= csr_w_data;
                    end
                    `YSYX210457_mie:begin
                        csr_mie <= csr_w_data;
                    end
                    `YSYX210457_mepc:begin
                        csr_mepc <= csr_w_data;
                    end
                    `YSYX210457_mcause:begin
                        csr_mcause <= csr_w_data;
                    end
                    `YSYX210457_mscratch:begin
                        csr_mscratch <= csr_w_data;
                    end
                    `YSYX210457_mcycle:begin
                        csr_mcycle <= csr_w_data;
                    end
                    `YSYX210457_minstret:begin
                        csr_minstret <= csr_w_data;
                    end
                    `YSYX210457_mip:begin
                        csr_mip[3 : 0] <= csr_w_data[3 : 0];
                    end
                    `YSYX210457_sstatus:begin
                        csr_sstatus <= csr_w_data;
                    end
                    default:begin
                        
                    end
                endcase
            end
            

            case(except_type)
                 64'h1:begin            ////time_interrupt
                    csr_mstatus[7] <= csr_mstatus[3];    //MPIE
                    csr_mstatus[3] <= 1'b0;          //MIE->0
                    csr_mstatus[12 : 11] <= 2'b11;   //MPP
                    csr_mcause <= {1'b1, 63'h7};
                    csr_mepc <= except_pc;
                    csr_mip[7] <= 1'b0;
                 end

                 64'h2:begin           ////ecall
                    csr_mstatus[7] <= csr_mstatus[3];    //MPIE
                    csr_mstatus[3] <= 1'b0;          //MIE->0
                    csr_mstatus[12 : 11] <= 2'b11;   //MPP
                    csr_mcause <= {1'b0, 59'h0, 4'b1011};
                    csr_mepc <= except_pc;
                 end

                 64'h3:begin           ////ebreak
                    csr_mstatus[7] <= csr_mstatus[3];    //MPIE
                    csr_mstatus[3] <= 1'b0;          //MIE->0
                    csr_mstatus[12 : 11] <= 2'b11;   //MPP
                    csr_mcause <= {1'b0, 59'h0, 4'b0011};
                    csr_mepc <= except_pc;
                 end

                 64'h4:begin           ////mret                   
                    csr_mstatus[3] <= csr_mstatus[7];
                    csr_mstatus[7] <= 1'b1;
                    csr_mstatus[12 : 11] <= 2'b00;
                    //csr_mepc <= except_pc;
                 end

                 default:begin
                     
                 end
            endcase
        end
    end

    always @(*) begin                          //read csr
        if(reset == 1'b1) begin
            csr_reg_data = `YSYX210457_ZERO_WORD;
        end
        else if((csr_w_ena == 1'b1) && (csr_r_addr == csr_w_addr)) begin
            csr_reg_data = csr_w_data;
        end
        else begin
            case(csr_r_addr)
                `YSYX210457_mstatus:begin
                    csr_reg_data = csr_mstatus;
                end
                `YSYX210457_mtvec:begin
                    csr_reg_data = csr_mtvec;
                end
                `YSYX210457_mie:begin
                    csr_reg_data = csr_mie;
                end
                `YSYX210457_mepc:begin
                    csr_reg_data = csr_mepc;
                end
                `YSYX210457_mcause:begin
                    csr_reg_data = csr_mcause;
                end
                `YSYX210457_mcycle:begin
                    csr_reg_data = csr_mcycle;
                end
                `YSYX210457_minstret:begin
                    csr_reg_data = csr_minstret;
                end
                `YSYX210457_mip:begin
                    csr_reg_data = csr_mip;
                end
                `YSYX210457_mscratch:begin
                    csr_reg_data = csr_mscratch;
                end
                `YSYX210457_sstatus:begin
                    csr_reg_data = csr_sstatus;
                end
                default:begin
                    csr_reg_data = `YSYX210457_ZERO_WORD;    
                end
            endcase
        end
    end


 assign mstatus = ((csr_w_ena == 1'b1) & (csr_w_addr == `YSYX210457_mstatus)) ? csr_w_data[3] : csr_mstatus[3]; 
 assign mepc = ((csr_w_ena == 1'b1) & (csr_w_addr == `YSYX210457_mepc)) ? csr_w_data : csr_mepc;
 assign mip = ((csr_w_ena == 1'b1) & (csr_w_addr == `YSYX210457_mip)) ? csr_w_data[7] :csr_mip[7]; 
 assign mie = ((csr_w_ena == 1'b1) & (csr_w_addr == `YSYX210457_mie)) ? csr_w_data[7] : csr_mie[7];
 assign mtvec = ((csr_w_ena == 1'b1) & (csr_w_addr == `YSYX210457_mtvec)) ? csr_w_data : csr_mtvec;


    always @(*) begin                          //Ctrl
        if(reset == 1'b1) begin
            flush = 1'b0;         
        end
        else begin
            if(except_type != `YSYX210457_ZERO_WORD) begin
                flush = 1'b1;
            end
            else begin
                flush = 1'b0;
            end
        end
    end


endmodule

module ysyx_210457_forecase (
    input wire reset,
    input wire clock,
    input wire mux_pc,
    input wire [`YSYX210457_PC_BUS] pc_id,
    input wire [`YSYX210457_PC_BUS] IF_pc,
    input wire [`YSYX210457_PC_BUS] branch,
    input wire id_forecase,
    input wire error_branch,
    input wire stall,

    output reg wash,
    output reg if_forecase,
    output reg [`YSYX210457_PC_BUS] pc
);
    integer i;
    reg [1 : 0] fore;
    reg [`YSYX210457_PC_BUS] fore_branch[`YSYX210457_FORECASE-1 : 0];
    reg [`YSYX210457_PC_BUS] pc_now[`YSYX210457_PC-1 : 0];
    reg [`YSYX210457_PC_BUS] add_pc;



reg [1 : 0] timeo;
always @(posedge clock) begin   //count
    if(reset == 1'b1) begin
        timeo <= 2'b0;
    end
    else begin
        if(pc_id == `YSYX210457_PC_START) begin
           if(timeo < 2) begin
               timeo <= timeo + 1 ;
           end
        end
    end
end

reg [`YSYX210457_PC_BUS] pc_s;
always @(posedge clock) begin
    if(reset == 1'b1) begin
        fore <= 2'b00; 
        pc_s <= `YSYX210457_ZERO_WORD;       
        for(i=0; i<`YSYX210457_PC; i=i+1) begin
            pc_now[i] <= `YSYX210457_ZERO_WORD; 
        end
        for(i=0; i<`YSYX210457_FORECASE; i=i+1) begin
            fore_branch[i] <= `YSYX210457_ZERO_WORD; 
        end
    end
    else begin
    pc_s <= pc_id + 4;
        if(~stall) begin
            if((timeo < 2) || (pc_id != `YSYX210457_PC_START)) begin
                if(mux_pc == 1'b1) begin
                    if(fore_branch[pc_s[`YSYX210457_FORECASE_LOG+1 : 2]] != branch) begin
                        fore_branch[pc_s[`YSYX210457_FORECASE_LOG+1 : 2]] <= branch; 
                        pc_now[pc_s[`YSYX210457_PC_LOG+1 : 2]] <= pc_id + 4;
                    end
                    if(fore < 2'b11) begin
                        fore <= fore + 1;
                    end
                end
            
                else begin
                    if(pc_now[pc_s[`YSYX210457_PC_LOG+1 : 2]] == pc_s) begin
                        if(fore > 2'b00) begin
                            fore <= fore - 1;
                        end
                    end
                end
            end
        end
    end
end



   always @(*) begin
        if(reset == 1'b1) begin
            add_pc = `YSYX210457_ZERO_WORD;
            wash = 1'b0;
            pc = `YSYX210457_ZERO_WORD;
            if_forecase = 1'b0;
        end
        else if(~stall) begin
            add_pc = IF_pc + 4;
            wash = 1'b0;
            pc = add_pc;
            if_forecase = 1'b0;
            if((timeo < 2) || (pc_id != `YSYX210457_PC_START)) begin
                if(add_pc == pc_now[add_pc[`YSYX210457_PC_LOG + 1 : 2]]) begin
                    if(fore >= 2'b10) begin
                        pc = fore_branch[add_pc[`YSYX210457_FORECASE_LOG + 1 : 2]];
                        if_forecase = 1'b1;
                    end
                    else begin
                        pc = add_pc;
                        if_forecase = 1'b0;
                    end
                end
                else begin
                    if_forecase = 1'b0;
                    pc = add_pc;
                end

                if(mux_pc == 1'b1) begin
                    if((mux_pc != id_forecase) || (error_branch)) begin  
                        wash = 1'b1;
                        pc = branch;
                        if_forecase = 1'b0;
                    end
                end
                
                if(mux_pc == 1'b0) begin
                    if(mux_pc != id_forecase) begin
                        wash = 1'b1;
                        pc = pc_id + 4;
                        if_forecase = 1'b0;
                    end
                end
            end
        end
        else begin
            add_pc = IF_pc + 4;
            wash = 1'b0;
            pc = add_pc;
            if_forecase = 1'b0;
        end 
    end

endmodule


module ysyx_210457_IMGN (
    input wire [31:0] instr,

    output reg [63 : 0] imm
);

    wire [4 : 0] op;
    assign op[4] = (~instr[6] & ~instr[5] & ~instr[2]) | (instr[6] & instr[5] & ~instr[3] & instr[2]) | (instr[6] & instr[5] & instr[4]);
    assign op[3] = ~instr[6] & instr[5] & ~instr[4] & instr[1] & instr[0];
    assign op[2] = instr[6] & instr[5] & ~instr[4] & ~instr[2];
    assign op[1] = instr[6] & instr[5] & instr[3] & instr[1] & instr[0];
    assign op[0] = (~instr[6] & instr[5] & instr[2]) | (~instr[6] & ~instr[5] & instr[2]);

    always @ (*) begin
        case(op)
             5'b10000://I-type
             begin
                 imm = {{52{instr[31]}}, instr[31:20]};
             end
             5'b01000://S-type
             begin
                 imm = {{52{instr[31]}}, instr[31:25], instr[11:7]};
             end
             5'b00100://B-type
             begin
                 imm = {{51{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
             end
             5'b00010://J-type
             begin
                 imm = {{43{instr[31]}}, instr[31], instr[19 : 12], instr[20], instr[30 : 21], 1'b0};
             end
             5'b00001://U_type
             begin
                 imm = {{44{instr[31]}}, instr[31 : 12]};  //ex alu had <<12
             end
             default:
             begin
                 imm = 64'b00000000_00000000;
             end
         endcase
    end

endmodule

module ysyx_210457_PC(
  input wire clock,
  input wire reset,
  input wire [`YSYX210457_PC_BUS] pc_i,
  input wire pc_con,
  input wire [`YSYX210457_PC_BUS] new_pc,
  input wire flush,	
  input wire stall,                

  output reg I_M_e,
  output reg [`YSYX210457_PC_BUS] pc
                           
);

always@( posedge clock ) begin
    if( reset == 1'b1 ) begin
      I_M_e <= 1'b0;
    end
    else begin
      I_M_e <= 1'b1;
    end
end


always@( posedge clock ) begin
    if(reset == 1'b1) begin
       pc <= `YSYX210457_PC_START ;
    end
    else begin
        if( I_M_e == 1'b0 ) begin
            pc <= `YSYX210457_PC_START ;
        end
        else begin  
            if(flush == 1'b1) begin
               pc <= new_pc;
            end  
            else if(~stall) begin
                if (pc_con == 1'b0) begin
                    pc <= pc_i;
                end
            end 
        end
    end
end
endmodule


module ysyx_210457_regfile(
    input  wire clock,
	input  wire reset,
	
	input  wire  [4  : 0] w_addr,
	input  wire  [`YSYX210457_REG_BUS] w_data,
	input  wire 		  w_ena,
	
	input  wire  [4  : 0] r_addr1,
	input  wire 		  r_ena1,
	output reg   [`YSYX210457_REG_BUS] r_data1,  //OUT1

	input  wire  [4  : 0] r_addr2,
	input  wire 		  r_ena2,
	output reg   [`YSYX210457_REG_BUS] r_data2   //OUT2


    );

    // 32 registers
	reg [`YSYX210457_REG_BUS] 	regs[0 : 31];
	
	always @(posedge clock) 
	begin
		if ( reset == 1'b1 ) 
		begin
			regs[ 0] <= `YSYX210457_ZERO_WORD;  //0
			regs[ 1] <= `YSYX210457_ZERO_WORD;
			regs[ 2] <= `YSYX210457_ZERO_WORD;
			regs[ 3] <= `YSYX210457_ZERO_WORD;
			regs[ 4] <= `YSYX210457_ZERO_WORD;
			regs[ 5] <= `YSYX210457_ZERO_WORD;
			regs[ 6] <= `YSYX210457_ZERO_WORD;
			regs[ 7] <= `YSYX210457_ZERO_WORD;
			regs[ 8] <= `YSYX210457_ZERO_WORD;
			regs[ 9] <= `YSYX210457_ZERO_WORD;
			regs[10] <= `YSYX210457_ZERO_WORD;
			regs[11] <= `YSYX210457_ZERO_WORD;
			regs[12] <= `YSYX210457_ZERO_WORD;
			regs[13] <= `YSYX210457_ZERO_WORD;
			regs[14] <= `YSYX210457_ZERO_WORD;
			regs[15] <= `YSYX210457_ZERO_WORD;
			regs[16] <= `YSYX210457_ZERO_WORD;
			regs[17] <= `YSYX210457_ZERO_WORD;
			regs[18] <= `YSYX210457_ZERO_WORD;
			regs[19] <= `YSYX210457_ZERO_WORD;
			regs[20] <= `YSYX210457_ZERO_WORD;
			regs[21] <= `YSYX210457_ZERO_WORD;
			regs[22] <= `YSYX210457_ZERO_WORD;
			regs[23] <= `YSYX210457_ZERO_WORD;
			regs[24] <= `YSYX210457_ZERO_WORD;
			regs[25] <= `YSYX210457_ZERO_WORD;
			regs[26] <= `YSYX210457_ZERO_WORD;
			regs[27] <= `YSYX210457_ZERO_WORD;
			regs[28] <= `YSYX210457_ZERO_WORD;
			regs[29] <= `YSYX210457_ZERO_WORD;
			regs[30] <= `YSYX210457_ZERO_WORD;
			regs[31] <= `YSYX210457_ZERO_WORD;
		end
		else 
		begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	
				regs[w_addr] <= w_data;
		end
	end
	
	always @(*) begin
		if (reset == 1'b1) begin
			r_data1 = `YSYX210457_ZERO_WORD;
		end
		else if (r_ena1 == 1'b1) begin
			if((r_addr1 == w_addr) && (w_addr != 5'h00) && (w_ena == 1'b1)) begin
				r_data1 = w_data;
			end
			else begin
				r_data1 = regs[r_addr1];
			end
		end
		else begin
			r_data1 = `YSYX210457_ZERO_WORD;
		end
	end
	
	always @(*) begin
		if (reset == 1'b1) begin
			r_data2 = `YSYX210457_ZERO_WORD;
		end
		else if (r_ena2 == 1'b1) begin
			if((r_addr2 == w_addr) && (w_addr != 5'h00) && (w_ena == 1'b1)) begin
				r_data2 = w_data;
			end
			else begin
				r_data2 = regs[r_addr2];
			end
		end	
		else begin
			r_data2 = `YSYX210457_ZERO_WORD;
		end
	end
endmodule


module ysyx_210457(
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


    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210457_AXI_ADDR_WIDTH-1:0] aw_addr;
    wire [`YSYX210457_AXI_ID_WIDTH-1:0] aw_id;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;

    wire w_ready;
    wire w_valid;
    wire [`YSYX210457_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210457_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
    
    wire b_ready;
    wire b_valid;
    wire [`YSYX210457_AXI_ID_WIDTH-1:0] b_id;

    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210457_AXI_ADDR_WIDTH-1:0] ar_addr;
    wire [`YSYX210457_AXI_ID_WIDTH-1:0] ar_id;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    
    wire r_ready;
    wire r_valid;
    wire [`YSYX210457_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210457_AXI_ID_WIDTH-1:0] r_id;



//CPU -> arbiter
    wire cpu_if_valid;
    wire [`YSYX210457_ADDR_BUS] cpu_IF_pc;
    wire [1 : 0] cpu_if_size;
    wire cpu_if_req;
////////////////
    wire cpu_mem_valid;
    wire [`YSYX210457_ADDR_BUS] cpu_mem_addr;
    wire [63 : 0] cpu_MEM_stor_data;
    wire [1 : 0] cpu_mem_sel;
    wire cpu_mem_req;   
    wire cpu_flush;

//arbiter -> CPU
   wire [31 : 0] cpu_if_data_read;
///////////////
   wire [63 : 0] cpu_mem_data;

//arbiter -> AXI
   wire [`YSYX210457_ADDR_BUS] AXI_addr;
   wire [`YSYX210457_REG_BUS] AXI_w_data;
   wire AXI_vaild;
   wire AXI_req;
   wire [1 : 0] AXI_size;
   wire [3 : 0] AXI_id;
   wire [5 : 0] cpu_stall;

//AXI -> arbiter
   wire [3 : 0] AXI_out_id;
   wire [`YSYX210457_REG_BUS] AXI_r_data;
   wire AXI_stall;







assign io_slave_awready = 1'b0;
assign io_slave_wready = 1'b0;
assign io_slave_bvalid = 1'b0;
assign io_slave_bresp = 2'b0;
assign io_slave_bid = 4'b0;
assign io_slave_arready = 1'b0;
assign io_slave_rvalid = 1'b0;
assign io_slave_rresp = 2'b0;
assign io_slave_rdata = 64'h00000000_00000000;
assign io_slave_rlast = 1'b0;
assign io_slave_rid = 4'b0;

    

    assign aw_ready                                 = io_master_awready;
    assign io_master_awvalid                        = aw_valid;               //
    assign io_master_awaddr                         = aw_addr[31 : 0];          //
    assign io_master_awid                           = aw_id;      //
    assign io_master_awlen                          = aw_len;     //
    assign io_master_awsize                         = aw_size;    //
    assign io_master_awburst                        = aw_burst;    //

    assign w_ready                                  = io_master_wready;
    assign io_master_wvalid                         = w_valid;   //
    assign io_master_wdata                          = w_data;  // 
    assign io_master_wstrb                          = w_strb;  //
    assign io_master_wlast                          = w_last;   //

    assign io_master_bready                         = b_ready;  //
    assign b_valid                                  = io_master_bvalid;
    //assign b_resp                                   = io_master_bresp;
    assign b_id                                     = io_master_bid;

    assign ar_ready                                 = io_master_arready;
    assign io_master_arvalid                        = ar_valid;   //
    assign io_master_araddr                         = ar_addr[31 : 0];  //
    assign io_master_arid                           = ar_id; //
    assign io_master_arlen                          = ar_len; //
    assign io_master_arsize                         = ar_size;  //
    assign io_master_arburst                        = ar_burst;  //

    assign io_master_rready                         = r_ready;   //
    assign r_valid                                  = io_master_rvalid;
    //assign r_resp                                   = io_master_rresp;
    assign r_data                                   = io_master_rdata;
    assign r_last                                   = io_master_rlast;
    assign r_id                                     = io_master_rid;





    ysyx_210457_axi_rw u_axi_rw (
        .clock                          (clock),
        .reset                          (reset),

        .rw_valid_i                     (AXI_vaild),
        .rw_req_i                       (AXI_req),
        .data_read_o                    (AXI_r_data),
        .data_write_i                   (AXI_w_data),
        .rw_addr_i                      (AXI_addr),
        .rw_size_i                      (AXI_size),
        .stall                          (AXI_stall),
        .cpu_id                         (AXI_id),
        .out_id                         (AXI_out_id),

        .axi_aw_ready_i                 (aw_ready),
        .axi_aw_valid_o                 (aw_valid),
        .axi_aw_addr_o                  (aw_addr),
        .axi_aw_id_o                    (aw_id),
        .axi_aw_len_o                   (aw_len),
        .axi_aw_size_o                  (aw_size),
        .axi_aw_burst_o                 (aw_burst),

        .axi_w_ready_i                  (w_ready),
        .axi_w_valid_o                  (w_valid),
        .axi_w_data_o                   (w_data),
        .axi_w_strb_o                   (w_strb),
        .axi_w_last_o                   (w_last),
        
        .axi_b_ready_o                  (b_ready),
        .axi_b_valid_i                  (b_valid),
        //.axi_b_resp_i                   (b_resp),
        .axi_b_id_i                     (b_id),


        .axi_ar_ready_i                 (ar_ready),
        .axi_ar_valid_o                 (ar_valid),
        .axi_ar_addr_o                  (ar_addr),
        .axi_ar_id_o                    (ar_id),
        .axi_ar_len_o                   (ar_len),
        .axi_ar_size_o                  (ar_size),
        .axi_ar_burst_o                 (ar_burst),
  
        .axi_r_ready_o                  (r_ready),
        .axi_r_valid_i                  (r_valid),
        //.axi_r_resp_i                   (r_resp),
        .axi_r_data_i                   (r_data),
        .axi_r_last_i                   (r_last),
        .axi_r_id_i                     (r_id)

    );


ysyx_210457_arbiter arbiter (
    .clock(clock),
    .reset(reset),
    .flush(cpu_flush),

    .if_data_read(cpu_if_data_read),

    .if_valid(cpu_if_valid),
    .if_addr(cpu_IF_pc),
    .if_size(cpu_if_size),
    .if_req(cpu_if_req),

    .mem_data(cpu_mem_data),
    
    .mem_stor_data(cpu_MEM_stor_data),
    .mem_valid(cpu_mem_valid),
    .mem_addr(cpu_mem_addr),
    .mem_sel(cpu_mem_sel),
    .mem_req(cpu_mem_req),


    .AXI_addr(AXI_addr),
    .AXI_w_data(AXI_w_data),
    .AXI_vaild(AXI_vaild),
    .AXI_req(AXI_req),
    .AXI_size(AXI_size),
    .AXI_id(AXI_id),

    .AXI_out_id(AXI_out_id),
    .AXI_r_data(AXI_r_data),

    .AXI_stall(AXI_stall),

    .stall(cpu_stall)
    
);

ysyx_210457_rvcpu rvcpu(
    .clock(clock),
    .reset(reset),
    .stall(cpu_stall),

    .if_data_read(cpu_if_data_read),
    .if_valid(cpu_if_valid),
    .IF_addr(cpu_IF_pc),
    .if_size(cpu_if_size),
    .if_req(cpu_if_req),

    .mem_data(cpu_mem_data),
    .MEM_stor_data(cpu_MEM_stor_data),
    .mem_valid(cpu_mem_valid),
    .mem_addr(cpu_mem_addr),
    .mem_sel(cpu_mem_sel),
    .mem_req(cpu_mem_req),

    .flush(cpu_flush)

);

endmodule
