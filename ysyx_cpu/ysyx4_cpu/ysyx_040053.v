module ysyx_040053_Adder64(//y turn into ~y outside when to sub
    output [63:0] result,
    output cout,OF,SF,ZF,CF,
    input [63:0] x,y,
    input sub
);
/*
    wire [31:0] res_l, res_h;
    wire c_l;
    ysyx_040053_Adder32 adder_low(res_l, c_l, x[31:0], y[31:0], sub);
    ysyx_040053_Adder32 adder_high(res_h, cout, x[63:32], y[63:32], c_l);
    assign result = {res_h, res_l};
*/
    assign {cout, result} = {1'b0,x} + {1'b0,y} + {64'b0,sub};
    assign OF = (~x[63] & ~y[63] & result[63]) | (x[63] & y[63] & ~result[63]);
    assign SF = result[63];
    assign ZF = (result == 64'h0000000000000000 ? 1 : 0);
    assign CF = cout ^ sub;
endmodule

module ysyx_040053_FA(
    output f,cout,
    input x,y,cin
);
    assign f= x ^ y ^ cin;
    assign cout= (x & y) | (x & cin) | (y & cin);
endmodule

module ysyx_040053_CLU4(
    input [3:0] p,g,
    input c0,
    output [3:0] c
);
    wire c1,c2,c3,c4;
    assign c1=g[0] | (p[0] & c0);
    assign c2=g[1] | (p[1] & c1);
    assign c3=g[2] | (p[2] & c2);
    assign c4=g[3] | (p[3] & c3);
    assign c = {c4,c3,c2,c1};
endmodule

module ysyx_040053_CLA4(
    output [3:0] f,
    output cout,
    input [3:0] x,y,
    input cin
);
    wire [4:1] p,g;
    wire [4:1] c;
    assign p=x|y;
    assign g=x&y;
    ysyx_040053_CLU4 gen(
        .c0(cin),
        .p(p),
        .g(g),
        .c(c)
    );
    genvar i;
    wire cout_miss_fa;
    ysyx_040053_FA adder(
        .x(x[0]),
        .y(y[0]),
        .cin(cin),
        .f(f[0]),
        .cout(cout_miss_fa)
    );
    wire [3:1] cout_miss;
    generate
        for (i=1;i<=3;i=i+1) begin
            ysyx_040053_FA adder(
                .cout(cout_miss[i]),
                .x(x[i]),
                .y(y[i]),
                .cin(c[i]),
                .f(f[i])
            );
        end
    endgenerate
    assign cout = c[4];
endmodule

module ysyx_040053_CLA8(
    output [7:0] f,
    output cout,
    input [7:0] x,y,
    input cin
);
    wire cin2;
    wire [3:0] p,g;
    assign p=x[3:0] | y[3:0];
    assign g=x[3:0] & y[3:0];
    assign cin2=g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&cin);
    wire cout_miss_l;
    ysyx_040053_CLA4 adder_low(
        .x(x[3:0]),
        .y(y[3:0]),
        .cin(cin),
        .f(f[3:0]),
        .cout(cout_miss_l)
    );
    ysyx_040053_CLA4 adder_high(
        .x(x[7:4]),
        .y(y[7:4]),
        .cin(cin2),
        .f(f[7:4]),
        .cout(cout)
    );
endmodule


module ysyx_040053_Adder32(
    output [31:0] result,
    output cout,
    input [31:0] x,
    input [31:0] y,
    input sub
);

    //parameter t=32;
    wire [3:0] Gg,Pg;
    wire [7:0] p[3:0],g[3:0];
    wire [4:0] c;
    wire [3:0] cout_temp;
    genvar i;
    generate
        for (i=0;i<=3;i=i+1) begin
            assign p[i]=x[i*8+7:i*8] | y[i*8+7:i*8];
            assign g[i]=x[i*8+7:i*8] & y[i*8+7:i*8];
            assign Pg[i] = (p[i]==8'hff ? 1 : 0);
            assign Gg[i] = g[i][7] | (p[i][7] & g[i][6]) | (p[i][7] & p[i][6] & g[i][5]) | (p[i][7] & p[i][6] & p[i][5] & g[i][4]) 
            | (p[i][7] & p[i][6] & p[i][5] & p[i][4] & g[i][3]) | (p[i][7] & p[i][6] & p[i][5] & p[i][4] & p[i][3] & g[i][2]) | 
            (p[i][7] & p[i][6] & p[i][5] & p[i][4] & p[i][3] & p[i][2] & g[i][1]) | (p[i][7] & p[i][6] & p[i][5] & p[i][4] & p[i][3] & p[i][2] & p[i][1] & p[i][0] & g[i][0]);
        end
    endgenerate
    ysyx_040053_CLU4 gen(
        .p(Pg),
        .g(Gg),
        .c0(sub),
        .c(c[4:1])
    );
    assign c[0]=sub;
    wire [7:0] ff[3:0];
    generate
        for (i=0;i<=3;i=i+1) begin
            ysyx_040053_CLA8 adder8(
                .x(x[i*8+7:i*8]),
                .y(y[i*8+7:i*8]),
                .cin(c[i]),
                .cout(cout_temp[i]),
                .f(ff[i])
            );
        end
    endgenerate

    assign result = {ff[3], ff[2], ff[1], ff[0]};
    assign cout = cout_temp[3];
endmodule


module ysyx_040053_ALU(
    input clk,
    input rst,
    input src_valid,
    input mwb_block,
    output alu_busy,
    
    input [63:0] inputa, inputb,
    input [4:0] ALUOp,
    input [1:0] MulOp,
    output zero,
    output reg [63:0] result
);

    wire SUBctr, SIGctr, ALctr, SFTctr, Wctr;
    wire [3:0] OPctr;
    wire [63:0] adderres;
    wire [63:0] res0, res1, res2, res3, res4, res5, res6, res8, res9;
    reg  [63:0] res7;
    ///adder,and,or,xor,shift,inputb,cmp
    wire [63:0] adderb;
    assign adderb = inputb ^ {64{SUBctr}};
    wire CF, SF, OF, ZF;
    wire cout_miss;
    ysyx_040053_ALUSig alusig(.ALUOp(ALUOp), .SUBctr(SUBctr), .SIGctr(SIGctr), .ALctr(ALctr), .SFTctr(SFTctr), .OPctr(OPctr), .Wctr(Wctr));
    ysyx_040053_Adder64 adder(.result(adderres),.x(inputa),.y(adderb),.sub(SUBctr),.CF(CF),.OF(OF),.SF(SF),.ZF(ZF),.cout(cout_miss));
    assign res0 = (Wctr == 1'b0) ? adderres : {{32{adderres[31]}}, adderres[31:0]};
    assign res1 = inputa & inputb;
    assign res2 = inputa | inputb;
    assign res3 = inputa ^ inputb;
    wire [31:0] sllWres, srWres, lower32;
    assign lower32 = inputa[31:0];
    wire [5:0] shamt = inputb[5:0];//not consider the valid bit
    wire [4:0] shamtW = inputb[4:0];
    wire [63:0] srres, shiftL, shiftR;
 //shift   
    assign sllWres = lower32 << shamtW;
    assign srWres = (ALctr == 1'b0) ? lower32 >> shamtW : $signed($signed(lower32) >>> shamtW);
    assign shiftL = (Wctr == 1'b0) ? (inputa << shamt) : {{32{sllWres[31]}}, sllWres[31:0]};
    assign srres = (ALctr == 1'b0) ? inputa >> shamt : $signed($signed(inputa) >>> shamt);
    assign shiftR = (Wctr == 1'b0) ? srres : {{32{srWres[31]}}, srWres[31:0]};
    
    assign res4 = (SFTctr == 1'b0) ? shiftL : shiftR;//not finish ysyx_040053_Shifter shifter(.dout(res4),.din(inputa),.shamt(shamt),.AL(ALctr),.LR(SFTctr));
    assign res5 = inputb;
    assign res6 = {{63{1'b0}},{(SIGctr == 1'b1) ? OF ^ SF : CF}}; //cmp,not finish

    
//mul
    wire op_mul = src_valid & ~OPctr[3] & OPctr[2] & OPctr[1] & OPctr[0];//res7
    wire [64:0] multiplicand, multiplier;
    wire [63:0] result_hi, result_lo;
    
    assign multiplicand = (Wctr == 1'b0) ? {MulOp[1] & inputa[63],inputa} : {{33{inputa[31]}},inputa[31:0]};
    assign multiplier  = (Wctr == 1'b0) ? {MulOp[1] & MulOp[0] & inputb[63],inputb} : {{33{inputb[31]}},inputb[31:0]};

    reg [63:0] result_hi_r, result_lo_r;
    reg  mul_doing;
    wire mul_ready, mul_out_valid, mul_valid;
    ysyx_040053_mulu mulu(
        .clk(clk),
        .rst(rst),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .mul_valid(mul_valid),
        .mul_ready(mul_ready),
        .out_valid(mul_out_valid),
        .result({result_hi,result_lo})
    );
    reg old_mul;
    assign mul_valid = op_mul && !mul_doing && !mul_out_valid && !old_mul;

    always @(posedge clk) begin
        if(rst || !mwb_block) begin
            old_mul <= 1'b0;
        end
        else if(mul_out_valid && mwb_block) begin
            old_mul <= 1'b1;
        end
    end
    always @(posedge clk) begin
        if(rst) begin
            mul_doing <= 1'b0;
            result_hi_r <= 64'b0;
            result_lo_r <= 64'b0;
        end
        /*除法结果输出后需要将div_doing置零*/
        else if(mul_out_valid) begin
            mul_doing <= 1'b0;
            result_hi_r <= result_hi;
            result_lo_r <= result_lo;
        end
        /*握手成功后，也就是除法器接受输入的数据后需要把div_doing置高*/
        else if(mul_valid && mul_ready) begin
            mul_doing <= 1'b1;
        end
    end
    
    wire [63:0] rhi, rlo;
    assign rhi = (!mwb_block && old_mul) ? result_hi_r : result_hi;
    assign rlo = (!mwb_block && old_mul) ? result_lo_r : result_lo;
    
    always @(*)begin
        if(MulOp == 2'b00) begin
            res7 = (Wctr == 1'b0) ? rlo : {{32{rlo[31]}},rlo[31:0]};
        end
        else res7 = rhi;
    end
    
/*
    reg [127:0] mulres;
    wire [63:0] mulresW;

    assign mulresW = inputa[31:0] * inputb[31:0];
    always@(*) begin
        case(MulOp)
            2'b00: mulres = {{64{1'b0}},inputa} * {{64{1'b0}},inputb};
            2'b01: mulres = {{64{1'b0}},inputa} * {{64{1'b0}},inputb};
            2'b10: mulres = $signed($signed({{64{inputa[63]}},inputa}) * {{64{1'b0}},inputb});
            default: mulres = $signed($signed({{64{inputa[63]}},inputa}) * $signed({{64{inputb[63]}},inputb}));
        endcase
    end

    always@(*) begin
        if(MulOp == 2'b00) begin
            res7 = (Wctr == 1'b0) ? mulres[63:0] : {{32{mulresW[31]}},mulresW[31:0]};
        end
        else res7 = mulres[127:64];
    end
*/
//div & rem
    wire op_div = src_valid & OPctr[3];
    wire [63:0] dividend, divisor, quotient, remainder;
    
    assign dividend = (Wctr == 1'b0) ? inputa : {{32{SIGctr & inputa[31]}},inputa[31:0]};
    assign divisor  = (Wctr == 1'b0) ? inputb : {{32{SIGctr & inputb[31]}},inputb[31:0]};

    reg [63:0] quotient_r, remainder_r;
    reg  div_doing;
    wire div_ready, out_valid, div_valid;
    ysyx_040053_divu divu(
        .clk(clk),
        .rst(rst),
        .dividend(dividend),
        .divisor(divisor),
        .div_valid(div_valid),
        .div_signed(SIGctr),
        .flush(1'b0),
        .div_ready(div_ready),
        .out_valid(out_valid),
        .quotient(quotient),
        .remainder(remainder)
    );
    //假设新的op_div = 0
    // out_valid = 1 -> 则alu_busy = 0，div_valid = 0，准备保存结果，div_doing准备拉低,新的op_div准备进入
    //                  该周期结束后应当有新的op_div进入，所以若此时m/wb_block = 1，
    //                  则下个周期alu_busy = 0，div_valid = 0；
    //out_valid = 0 -> 新的op_div进来，保存的结果出去，div_ready拉高, alu_busy = 0, div_valid = 0;
    //                  若M.WB阻塞，则新的op_div进不来, alu_busy = 1, div_valid = 1;
    //                  也就是在这个周期开始前enable为0
    //                  ->加入m/wb_block控制。
    //如果下个周期新指令进不来，就说明下个周期alu_busy,div_valid都是低
    reg old_div;
    assign div_valid = op_div && !div_doing && !out_valid && !old_div;
    assign alu_busy = (op_div && !out_valid && !old_div) | (op_mul && !mul_out_valid && !old_mul);
    always @(posedge clk) begin
        if(rst || !mwb_block) begin
            old_div <= 1'b0;
        end
        else if(out_valid && mwb_block) begin
            old_div <= 1'b1;
        end
    end
    always @(posedge clk) begin
        if(rst) begin
            div_doing <= 1'b0;
            quotient_r <= 64'b0;
            remainder_r <= 64'b0;
        end
        /*除法结果输出后需要将div_doing置零*/
        else if(out_valid) begin
            div_doing <= 1'b0;
            quotient_r <= quotient;
            remainder_r <= remainder;
        end
        /*握手成功后，也就是除法器接受输入的数据后需要把div_doing置高*/
        else if(div_valid && div_ready) begin
            div_doing <= 1'b1;
        end
    end
    assign res8 = (!mwb_block && old_div) ? quotient_r : quotient;
    assign res9 = (!mwb_block && old_div) ? remainder_r : remainder;
/*
    wire [63:0] divres;
    wire [31:0] divresW;
    assign divres =(OPctr == 4'd8) ? ( (SIGctr == 1'b0) ? inputa / inputb : $signed($signed(inputa) / $signed(inputb))) : 0; 
    assign divresW =(OPctr == 4'd8) ? ( (SIGctr == 1'b0) ? inputa[31:0] / inputb[31:0] : $signed($signed(inputa[31:0]) / $signed(inputb[31:0]))) : 0; 
    assign res8 = (Wctr == 1'b0) ? divres : {{32{divresW[31]}}, divresW[31:0]};

    wire [63:0] remres;
    wire [31:0] remresW;
    assign remres =(OPctr == 4'd9) ? ( (SIGctr == 1'b0) ? inputa % inputb : $signed($signed(inputa) % $signed(inputb))) : 0; 
    assign remresW =(OPctr == 4'd9) ? ( (SIGctr == 1'b0) ? inputa[31:0] % inputb[31:0] : $signed($signed(inputa[31:0]) % $signed(inputb[31:0]))) : 0; 
    assign res9 = (Wctr == 1'b0) ? remres : {{32{remresW[31]}}, remresW[31:0]};
*/
    always@(*) begin
        case(OPctr)
         0: result = res0;
         1: result = res1;
         2: result = res2;
         3: result = res3;
         4: result = res4;
         5: result = res5;
         6: result = res6;
         7: result = res7;
         8: result = res8;
         default: result = res9;
        endcase
    end
    assign zero = ZF;
endmodule

module ysyx_040053_ALU_lite(
    input [63:0] inputa, inputb,
    input [4:0] ALUOp,
    output zero,
    output reg [63:0] result
);

    wire SUBctr, SIGctr, ALctr, SFTctr, Wctr;
    wire [3:0] OPctr;
    wire [63:0] adderres;
    wire [63:0] res0, res6;
    wire cout_miss;
    ///adder,and,or,xor,shift,inputb,cmp
    wire [63:0] adderb;
    assign adderb = inputb ^ {64{SUBctr}};
    wire CF, SF, OF, ZF;
    ysyx_040053_ALUSig alusig(.ALUOp(ALUOp), .SUBctr(SUBctr), .SIGctr(SIGctr), .ALctr(ALctr), .SFTctr(SFTctr), .OPctr(OPctr), .Wctr(Wctr));
    ysyx_040053_Adder64 adder(.result(adderres),.x(inputa),.y(adderb),.sub(SUBctr),.CF(CF),.OF(OF),.SF(SF),.ZF(ZF), .cout(cout_miss));
    
    assign res0 = (Wctr == 1'b0) ? adderres : {{32{adderres[31]}}, adderres[31:0]};

    assign res6 = {{63{1'b0}},{(SIGctr == 1'b1) ? OF ^ SF : CF}}; //cmp,not finish

    always@(*) begin
        case(OPctr)
         0: result = res0;
         default: result = res6;
        endcase
    end
    assign zero = ZF;
endmodule


module ysyx_040053_ALUSig(
    input [4:0] ALUOp,
    output reg SUBctr,SIGctr,ALctr,SFTctr,Wctr,
    output reg [3:0] OPctr
);
    always@(*) begin
        case(ALUOp)
            5'b00000: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0000; end
            5'b10000: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b0000; end

            5'b00001: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0100; end
            5'b10001: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b0100; end

            5'b00010: begin SUBctr = 1; SIGctr = 1; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0110; end
            5'b00011: begin SUBctr = 1; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0110; end
            5'b00100: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0011; end
            
            5'b00101: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 1; Wctr = 0; OPctr = 4'b0100; end
            5'b10101: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 1; Wctr = 1; OPctr = 4'b0100; end

            5'b00110: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0010; end
            5'b00111: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0001; end

            5'b01000: begin SUBctr = 1; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0000; end
            5'b11000: begin SUBctr = 1; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b0000; end

            5'b01101: begin SUBctr = 0; SIGctr = 0; ALctr = 1; SFTctr = 1; Wctr = 0; OPctr = 4'b0100; end
            5'b11101: begin SUBctr = 0; SIGctr = 0; ALctr = 1; SFTctr = 1; Wctr = 1; OPctr = 4'b0100; end

            5'b01111: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0101; end

            5'b01001: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0111; end
            5'b01010: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b1000; end
            5'b01011: begin SUBctr = 0; SIGctr = 1; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b1000; end
            5'b01100: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b1001; end
            5'b01110: begin SUBctr = 0; SIGctr = 1; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b1001; end
            
            5'b11001: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b0111; end
            5'b11010: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b1000; end
            5'b11011: begin SUBctr = 0; SIGctr = 1; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b1000; end
            5'b11100: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b1001; end
            5'b11110: begin SUBctr = 0; SIGctr = 1; ALctr = 0; SFTctr = 0; Wctr = 1; OPctr = 4'b1001; end

            default: begin SUBctr = 0; SIGctr = 0; ALctr = 0; SFTctr = 0; Wctr = 0; OPctr = 4'b0000; end
        endcase
    end
endmodule




module ysyx_040053_arbiter(
    input clk,
    input rst,
//icache <-> arbiter
    input              i_acq,
    input  [63:0]      i_rw_addr_i,
    input              i_rw_req_i,//
    input              i_rw_valid_i,
    output [127:0]     i_data_read_o,//finish burst
    output reg         i_rw_ready_o,//data_read_i in ram
    input [7:0]        i_rw_size_o,
    input              i_rw_dev_o,
    input [3:0]        i_rw_bytes_o,
//dcache <-> arbiter
    input              d_acq,
    input  [63:0]      d_rw_addr_i,
    input              d_rw_req_i,//
    input              d_rw_valid_i,
    input  [127:0]     d_rw_w_data_i,
    output [127:0]     d_data_read_o,//finish burst
    output reg         d_rw_ready_o,//ready to give data or fetch data
    input [7:0]        d_rw_size_o,
    input              d_rw_dev_o,
    input [3:0]        d_rw_bytes_o,
//arbiter<->memory
    output reg [63:0]   rw_addr_o,
    output reg          rw_req_o,//
    output reg          rw_valid_o,
    output [127:0]      rw_w_data_o,
    input  [127:0]      data_read_i,//finish burst
    input               rw_ready_i,//data_read_i in ram
    output reg [7:0]    rw_size_o,
    output reg          rw_dev_o,
    output reg [3:0]    rw_bytes_o
);  
    //wire cache_valid =  d_rw_valid_i || i_rw_valid_i;
    parameter [1:0] IDLE = 2'b00, ICACHE = 2'b01, DCACHE = 2'b10;
    reg [1:0] cur_status, next_status;
    always @(posedge clk) begin
        if(rst) cur_status <= IDLE;
        else cur_status <= next_status;
    end

    always @(*) begin
        case (cur_status)
            IDLE: begin
                if(d_acq) next_status = DCACHE;
                else if(i_acq) next_status = ICACHE;
                else next_status = IDLE;
            end
            DCACHE: begin
                if(d_acq) next_status = DCACHE;
                else next_status = IDLE;
            end
            ICACHE: begin
                if(i_acq) next_status = ICACHE;
                else next_status = IDLE;
            end
            default: next_status = IDLE;
        endcase
    end

    always @(*) begin
        case (cur_status)
            DCACHE: begin
                rw_addr_o   = d_rw_addr_i;
                rw_req_o    = d_rw_req_i;
                rw_valid_o  = d_rw_valid_i;
                i_rw_ready_o = 1'b0;
                d_rw_ready_o = rw_ready_i;
                rw_size_o   = d_rw_size_o;
                rw_dev_o = d_rw_dev_o;
                rw_bytes_o = d_rw_bytes_o;
            end
            ICACHE: begin
                rw_addr_o    = i_rw_addr_i;
                rw_req_o     = i_rw_req_i;
                rw_valid_o   = i_rw_valid_i;
                i_rw_ready_o = rw_ready_i;
                d_rw_ready_o = 1'b0;
                rw_size_o   = i_rw_size_o;
                rw_dev_o = i_rw_dev_o;
                rw_bytes_o = i_rw_bytes_o;
            end
            default: begin
                rw_addr_o   = 0;
                rw_req_o    = 0;
                rw_valid_o  = 0;
                i_rw_ready_o = 1'b0;
                d_rw_ready_o = 1'b0;
                rw_size_o   = 0;
                rw_dev_o = 0;
                rw_bytes_o = 0;
            end
        endcase
    end

    assign i_data_read_o = data_read_i;
    assign d_data_read_o = data_read_i;
    assign rw_w_data_o   = d_rw_w_data_i;

endmodule




// Burst types
`define ysyx_040053_AXI_BURST_TYPE_FIXED                                2'b00               //突发类型  FIFO
`define ysyx_040053_AXI_BURST_TYPE_INCR                                 2'b01               //ram  
`define ysyx_040053_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define ysyx_040053_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define ysyx_040053_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define ysyx_040053_AXI_PROT_SECURE_ACCESS                              3'b000
`define ysyx_040053_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define ysyx_040053_AXI_PROT_DATA_ACCESS                                3'b000
`define ysyx_040053_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define ysyx_040053_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_040053_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_040053_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_040053_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_040053_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define ysyx_040053_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define ysyx_040053_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define ysyx_040053_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_040053_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define ysyx_040053_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define ysyx_040053_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define ysyx_040053_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define ysyx_040053_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_040053_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_040053_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_040053_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_040053_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define ysyx_040053_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define ysyx_040053_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define ysyx_040053_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_040053_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define ysyx_040053_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define ysyx_040053_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define ysyx_040053_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define ysyx_040053_AXI_SIZE_BYTES_1                                    3'b000                //突发宽度一个数据的宽度
`define ysyx_040053_AXI_SIZE_BYTES_2                                    3'b001
`define ysyx_040053_AXI_SIZE_BYTES_4                                    3'b010
`define ysyx_040053_AXI_SIZE_BYTES_8                                    3'b011
`define ysyx_040053_AXI_SIZE_BYTES_16                                   3'b100
`define ysyx_040053_AXI_SIZE_BYTES_32                                   3'b101
`define ysyx_040053_AXI_SIZE_BYTES_64                                   3'b110
`define ysyx_040053_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_040053_axi_rw # (
    parameter RW_DATA_WIDTH     = 128,
    parameter RW_ADDR_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8
)(
    input                               clock,
    input                               reset,

	input                               rw_req_i,           //IF&MEM输入信号
    input                               rw_valid_i,         //IF&MEM输入信号
	output                              rw_ready_o,         //IF&MEM输入信号
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,        //IF&MEM输入信号
    input  [RW_DATA_WIDTH-1:0]          rw_w_data_i,        //IF&MEM输入信号
    input  [RW_ADDR_WIDTH-1:0]          rw_addr_i,          //IF&MEM输入信号
    input  [AXI_STRB_WIDTH - 1:0]       rw_size_i,          //IF&MEM输入信号
    input                               rw_dev_i,
    input  [3:0]                        rw_bytes_i,

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
    input  [1:0]                        axi_b_resp_i,                 
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
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i
);

// ------------------State Machine------------------TODO
    localparam [2:0] W_IDLE = 3'b000, W_WRITE = 3'b010, W_RESP = 3'b011, W_DONE = 3'b100;
    localparam [2:0] R_IDLE = 3'b000, R_ADDR = 3'b001, R_READ = 3'b010, R_DONE = 3'b100;
    reg [2:0] w_status, r_status;
    wire r_state_idle = (r_status == R_IDLE);
    wire r_state_addr = (r_status == R_ADDR);
    wire r_state_read = (r_status == R_READ);
    wire w_state_idle = (w_status == W_IDLE);
    wire w_state_resp = (w_status == W_RESP);
    
    // 写通道状态切换
//握手信号
    wire aw_fire = axi_aw_ready_i & axi_aw_valid_o;
    wire w_fire  = axi_w_ready_i  & axi_w_valid_o;
    wire b_fire  = axi_b_ready_o  & axi_b_valid_i;

    wire w_last = w_fire & axi_w_last_o;//now is trans the last
    reg aw_valid_r, w_valid_r;
    always @(posedge clock) begin
        if(reset) aw_valid_r <= 1'b0;
        else if(aw_fire) aw_valid_r <= 1'b0;
        else if(w_state_idle && rw_valid_i && rw_req_i) aw_valid_r <= 1'b1;
    end

    always @(posedge clock) begin
        if(reset) w_valid_r <= 1'b0;
        else if(w_last) w_valid_r <= 1'b0;
        else if(w_state_idle && rw_valid_i && rw_req_i) w_valid_r <= 1'b1;
    end

    always @(posedge clock) begin
        if(reset) begin
            w_status <= W_IDLE;
        end
        else begin
            if((rw_valid_i == 1'b1) && (rw_req_i == 1'b1)) begin//now write
                case(w_status)
                    W_IDLE: w_status <= W_WRITE;
                    W_WRITE: begin
                        if(w_last) w_status <= W_RESP;
                        else w_status <= W_WRITE;
                    end
                    W_RESP: begin
                        if(b_fire) w_status <= W_DONE;//wait valid down
                        else w_status <= W_RESP;
                    end
                    W_DONE: w_status <= W_IDLE;
                    default: w_status <= W_IDLE;
                endcase
            end
        end
    end

    // 读通道状态切换
//握手信号
    wire ar_fire = axi_ar_ready_i & axi_ar_valid_o;
    wire r_fire  = axi_r_ready_o  & axi_r_valid_i;

    wire r_last = r_fire & axi_r_last_i;

    always @(posedge clock) begin
        if(reset) begin
            r_status <= R_IDLE;
        end
        else begin
            if((rw_valid_i == 1'b1) && (rw_req_i == 1'b0)) begin//now read
                case(r_status)
                    R_IDLE: r_status <= R_ADDR;
                    R_ADDR: begin
                        if(ar_fire) r_status <= R_READ;
                        else r_status <= R_ADDR;
                    end
                    R_READ: begin
                        if(r_last) r_status <= R_DONE;//wait valid down
                        else r_status <= R_READ;
                    end
                    R_DONE: r_status <= R_IDLE;
                    default: r_status <= R_IDLE;
                endcase
            end
        end
    end


    reg rw_ready_r;
    always @(posedge clock) begin
        if(reset) begin
            rw_ready_r <= 1'b0;
        end
        else if(((rw_req_i == 1'b1) && b_fire) || ((rw_req_i == 1'b0) && r_last)) begin
            rw_ready_r <= 1'b1;
        end
        else rw_ready_r <= 1'b0;
    end
    assign rw_ready_o = rw_ready_r;

    /////////burst number////////
    wire [7:0] axi_len;
    reg [7:0] rcnt,wcnt;
    always @(posedge clock) begin
        if(reset || ((rw_req_i == 1'b0) && (r_state_idle == 1'b1))) begin
            rcnt <= 0;
        end
        else if((rcnt != axi_len) && r_fire) begin
            rcnt <= rcnt + 1;
        end
    end
    always @(posedge clock) begin
        if(reset || (rw_req_i && w_state_idle)) begin
            wcnt <= 0;
        end
        else if((wcnt != axi_len) && w_fire) begin
            wcnt <= wcnt + 1;
        end
    end
// ------------------Write Transaction------------------
    localparam AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
    reg [2:0] dev_size;
    always @(*)begin
        case(rw_bytes_i)
            4'h1: dev_size = 0;
            4'h2: dev_size = 1;
            4'h4: dev_size = 2;
            default dev_size = 2;
        endcase
    end
    wire [AXI_ID_WIDTH-1:0] axi_id              = {AXI_ID_WIDTH{1'b0}};
    assign axi_len      = (rw_dev_i == 1'b0) ? 1 : 0;
    wire [2:0] axi_size     = (rw_dev_i == 1'b0) ? AXI_SIZE[2:0] : dev_size;

    // 写地址通道  以下没有备注初始化信号的都可能是你需要产生和用到的
    assign axi_aw_valid_o   = aw_valid_r;//
    assign axi_aw_addr_o    = rw_addr_i[31:0];//
    assign axi_aw_id_o      = axi_id;                                                                           //初始化信号即可
    assign axi_aw_len_o     = axi_len;//
    assign axi_aw_size_o    = axi_size;//
    assign axi_aw_burst_o   = `ysyx_040053_AXI_BURST_TYPE_INCR;//                                                             

    // 写数据通道
/*    
    reg [AXI_DATA_WIDTH - 1: 0] rw_w_data_r;
    reg [AXI_DATA_WIDTH/8-1:0] rw_size_r;
    always @(posedge clock) begin
        if(reset) begin
            rw_w_data_r <= 0;
            rw_size_r <= 0;
        end
        else if(w_state_idle && rw_valid_i && rw_req_i) begin//写地址时就开始存待写的值，这样写数据时就赶上了
            rw_w_data_r <= rw_w_data_i[wcnt*AXI_DATA_WIDTH +: AXI_DATA_WIDTH];
            rw_size_r <= rw_size_i;
        end
    end
*/
/*
写地址：
如果突发传2个8字节：
握手时的上升沿之后-> wcnt=1,rw_w_data_r写入
如果传1个8字节：
握手时上升沿之后->wcnt=0，rw_w_data_r写入
写数据：
如果突发传2个8字节：
握手时上升沿之后->wcnt=1，第二个rw_w_data_r写入,w_last拉高。
突发传1个8字节：
握手时需要w_last是高的。
*/
/*
    reg axi_w_last_r;
    always @(posedge clock) begin
        if(reset) begin
            axi_w_last_r <= 0;
        end
        else if(w_fire && (wcnt == axi_len)) begin//写数据且达到最后一个
            axi_w_last_r <= 1'b1;
        end
        else if(b_fire) begin
            axi_w_last_r <= 0;
        end
    end
*/


    assign axi_w_valid_o    = w_valid_r;//
    assign axi_w_data_o     = rw_w_data_i[wcnt*AXI_DATA_WIDTH +: AXI_DATA_WIDTH];//
    assign axi_w_strb_o     = rw_size_i;//
    assign axi_w_last_o     = (wcnt == axi_len);//

    // 写应答通道
    assign axi_b_ready_o    = w_state_resp;//

// ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;//
    assign axi_ar_addr_o    = rw_addr_i[31:0];//
    assign axi_ar_id_o      = axi_id;                                                                           //初始化信号即可                        
    assign axi_ar_len_o     = axi_len;//                                                                          
    assign axi_ar_size_o    = axi_size;//
    assign axi_ar_burst_o   = `ysyx_040053_AXI_BURST_TYPE_INCR;//
    // Read data channel signals
    //low 64
    always @(posedge clock) begin
        if(reset) begin
            data_read_o[AXI_DATA_WIDTH - 1:0] <= 0;
        end
        else if(r_fire && (rcnt == 0)) begin//r_trans0
            data_read_o[AXI_DATA_WIDTH - 1:0] <= axi_r_data_i;
        end
    end
    //high 64
    always @(posedge clock) begin
        if(reset) begin
            data_read_o[2*AXI_DATA_WIDTH - 1:AXI_DATA_WIDTH] <= 0;
        end
        else if(r_fire && (rcnt == 1)) begin//r_trans1
            data_read_o[2*AXI_DATA_WIDTH - 1:AXI_DATA_WIDTH] <= axi_r_data_i;
        end
    end



    assign axi_r_ready_o    = r_state_read;//

endmodule



module ysyx_040053_icache(
    input clk,
    input rst,
    //cpu<->cache
    input [63:0] cpu_req_addr,
    input cpu_req_valid,
    output reg [63:0] cpu_data_read,
    output reg cpu_ready,
    output cache_idle,
    //cache<->memory
    output reg [63:0]   rw_addr_o,
    output reg          rw_req_o,//
    output reg          rw_valid_o,
    input [127:0]       data_read_i,//finish burst
    input               rw_ready_i,//data_read_i in ram
    input cpu_dev,
    
    output[5:0] io_sram0_addr,
	output io_sram0_cen,
	output io_sram0_wen,
	output[127:0] io_sram0_wdata,
	input[127:0] io_sram0_rdata,

	output[5:0] io_sram1_addr,
	output io_sram1_cen, 
	output io_sram1_wen, 		
	output[127:0] io_sram1_wdata,
	input[127:0] io_sram1_rdata,

	output[5:0] io_sram2_addr,	
	output io_sram2_cen, 
	output io_sram2_wen, 
	output[127:0] io_sram2_wdata, 
	input[127:0] io_sram2_rdata, 

	output[5:0] io_sram3_addr, 
	output io_sram3_cen, 
	output io_sram3_wen, 
	output[127:0] io_sram3_wdata, 
	input[127:0] io_sram3_rdata
);
    parameter nline = 256;
    reg V [0:nline - 1];
    reg [19:0] tag [0:nline - 1];

    wire [7:0] cpu_index;
    wire [3:0] cpu_offset;
    wire [19:0] cpu_tag;

    assign cpu_offset = cpu_req_addr[3:0];
    assign cpu_index = cpu_req_addr[11:4];
    assign cpu_tag = cpu_req_addr[31:12];

    wire hit;

    //status transform

    parameter [2:0] IDLE = 3'b000, CompareTag = 3'b001, Allocate = 3'b010, Readin = 3'b011, DEV = 3'b100;

    reg [2:0] cur_status, next_status;

    always @(posedge clk) begin
        if(rst) cur_status <= IDLE;
        else cur_status <= next_status;
    end
    assign cache_idle = (cur_status == IDLE);
    always @(*) begin
        case (cur_status)
            IDLE: begin
                if(cpu_req_valid) begin
                    if(cpu_dev) next_status = DEV;
                    else next_status = CompareTag;
                end
                else next_status = IDLE;
            end
            CompareTag: begin
                if(hit) next_status = Readin;
                else next_status = Allocate;
            end
            Allocate: begin
                if(rw_ready_i) begin
                    next_status = CompareTag;
                end
                else next_status = Allocate;
            end
            Readin: next_status = IDLE;//RETN;
            DEV: begin
                if(rw_ready_i) begin
                    next_status = IDLE;
                end
                else next_status = DEV;
            end
            default: next_status = IDLE;
        endcase
    end

    //cache line
    wire [127:0] line_o [0:3];
    wire line_wen [0:3];

    assign io_sram0_addr = cpu_index[5:0];
	assign io_sram0_cen = 1'b0;
	assign io_sram0_wen = line_wen[0];
	assign io_sram0_wdata = data_read_i;
	assign line_o[0] = io_sram0_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram0(.Q(line_o[0]),.CLK(clk),.CEN(1'b0),.WEN(line_wen[0]),.A(cpu_index[5:0]),.D(data_read_i));

	assign io_sram1_addr = cpu_index[5:0];
	assign io_sram1_cen = 1'b0;
	assign io_sram1_wen = line_wen[1];
	assign io_sram1_wdata = data_read_i;
	assign line_o[1] = io_sram1_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram1(.Q(line_o[1]),.CLK(clk),.CEN(1'b0),.WEN(line_wen[1]),.A(cpu_index[5:0]),.D(data_read_i));

	assign io_sram2_addr = cpu_index[5:0];
	assign io_sram2_cen = 1'b0;
	assign io_sram2_wen = line_wen[2];
	assign io_sram2_wdata = data_read_i;
	assign line_o[2] = io_sram2_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram2(.Q(line_o[2]),.CLK(clk),.CEN(1'b0),.WEN(line_wen[2]),.A(cpu_index[5:0]),.D(data_read_i));

	assign io_sram3_addr = cpu_index[5:0];
	assign io_sram3_cen = 1'b0;
	assign io_sram3_wen = line_wen[3];
	assign io_sram3_wdata = data_read_i;
	assign line_o[3] = io_sram3_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram3(.Q(line_o[3]),.CLK(clk),.CEN(1'b0),.WEN(line_wen[3]),.A(cpu_index[5:0]),.D(data_read_i));
    
    //CompareTag
    assign hit = (cur_status == CompareTag && V[cpu_index] && tag[cpu_index] == cpu_tag);
    /*
    always @(*) begin
        if(cur_status == CompareTag && V[cpu_index] && tag[cpu_index] == cpu_tag)
            hit=1'b1;
        else hit=1'b0;
    end
    */
    always @(posedge clk) begin
        if(rst) begin
            cpu_data_read <= 0;
            cpu_ready <= 1'b0;
        end
        else if(cur_status == Readin) begin
            cpu_ready <= 1'b1;
            case(cpu_index[7:6])
                2'b00: cpu_data_read <= cpu_offset[3] ? line_o[0][127:64] : line_o[0][63:0];
                2'b01: cpu_data_read <= cpu_offset[3] ? line_o[1][127:64] : line_o[1][63:0];
                2'b10: cpu_data_read <= cpu_offset[3] ? line_o[2][127:64] : line_o[2][63:0];
                default: cpu_data_read <= cpu_offset[3] ? line_o[3][127:64] : line_o[3][63:0];
            endcase
        end
        else if(cur_status == DEV && rw_ready_i) begin
            cpu_ready <= 1'b1;
            cpu_data_read <= data_read_i[63:0];
        end
        else cpu_ready <= 1'b0;
    end

    //Allocate
    assign line_wen[0] = !(cpu_index[7:6] == 2'b00 && cur_status == Allocate && rw_ready_i);
    assign line_wen[1] = !(cpu_index[7:6] == 2'b01 && cur_status == Allocate && rw_ready_i);
    assign line_wen[2] = !(cpu_index[7:6] == 2'b10 && cur_status == Allocate && rw_ready_i);
    assign line_wen[3] = !(cpu_index[7:6] == 2'b11 && cur_status == Allocate && rw_ready_i);
 
    integer  i;
    always @(posedge clk) begin
        if(rst) begin
            rw_req_o <= 1'b0;
            rw_valid_o <= 1'b0;
            rw_addr_o <= 0;
            for (i = 0; i < 64; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
            for (i = 64; i < 128; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
            for (i = 128; i < 192; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
            for (i = 192; i < nline; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
        end
        else if(cur_status == Allocate) begin//read new block from memory to cache
            if(!rw_ready_i) begin// not finish
                rw_addr_o <= {cpu_req_addr[63:4],4'b0000};
                rw_req_o <= 1'b0;
                rw_valid_o <= 1'b1;
            end
            else begin
                rw_valid_o <= 1'b0;
                V[cpu_index] <= 1'b1;
                tag[cpu_index] <= cpu_tag;
            end
        end
        else if(cur_status == DEV) begin
            if(!rw_ready_i) begin
                rw_addr_o <= cpu_req_addr;//{cpu_req_addr[63:3],3'b000};
                rw_req_o  <= 1'b0;
                rw_valid_o <= 1'b1;
            end
            else begin
                rw_valid_o <= 1'b0;
            end
        end
        else begin
            rw_valid_o <= 1'b0;
        end
    end
endmodule

module ysyx_040053_dcache (
    input clk,
    input rst,
    //cpu<->cache
    input [63:0] cpu_req_addr,
    input cpu_req_rw,
    input cpu_req_valid,
    input [63:0] cpu_data_write,
    input [7:0]  cpu_wmask,
    output reg [63:0] cpu_data_read,
    output reg cpu_ready,
    output cache_idle,
    //cache<->memory
    output reg [63:0]   rw_addr_o,
    output reg          rw_req_o,//
    output reg          rw_valid_o,
    output reg [127:0]  rw_w_data_o,
    input [127:0]       data_read_i,//finish burst
    input               rw_ready_i,//ready to give data or fetch data
    input Fence_i,
    output reg [7:0] rw_size_o,
    input cpu_dev,

    output[5:0] io_sram4_addr, 
	output io_sram4_cen, 
	output io_sram4_wen, 
	output[127:0] io_sram4_wdata, 
	input[127:0] io_sram4_rdata, 

	output[5:0] io_sram5_addr, 
	output io_sram5_cen, 
	output io_sram5_wen, 
	output[127:0] io_sram5_wdata, 
	input[127:0] io_sram5_rdata, 

	output[5:0] io_sram6_addr, 
	output io_sram6_cen, 
	output io_sram6_wen, 
	output[127:0] io_sram6_wdata, 
	input[127:0] io_sram6_rdata, 
    
	output[5:0] io_sram7_addr, 
	output io_sram7_cen, 
	output io_sram7_wen, 
	output[127:0] io_sram7_wdata,
	input[127:0] io_sram7_rdata
);
    parameter nline = 256;
    reg V [0:nline - 1], D [0:nline - 1];
    reg [19:0] tag [0:nline - 1];

    wire [7:0] cpu_index;
    wire [3:0] cpu_offset;
    wire [19:0] cpu_tag;

    assign cpu_offset = cpu_req_addr[3:0];
    assign cpu_index = cpu_req_addr[11:4];
    assign cpu_tag = cpu_req_addr[31:12];

    reg hit;
    reg [7:0] idx_cnt;
    //status transform

    parameter [3:0] IDLE = 4'b0000, CompareTag = 4'b0001, Allocate = 4'b0010, Readin = 4'b0011;
    parameter [3:0] WriteBack = 4'b0100, Readout = 4'b0101, Writein = 4'b0110, FENCE_I = 4'b0111; //RETN = 3'b111;
    parameter [3:0] DEV = 4'b1000; //RETN = 3'b111;

    reg [3:0] cur_status, next_status;
    assign cache_idle = (cur_status == IDLE);
    
    always @(posedge clk) begin
        if(rst || (cur_status == IDLE && Fence_i)) idx_cnt <= 0;
        else if(next_status == Readout) begin
            idx_cnt <= idx_cnt + 1;
        end
    end

    always @(posedge clk) begin
        if(rst) cur_status <= IDLE;
        else cur_status <= next_status;
    end

    always @(*) begin
        case (cur_status)
            IDLE: begin
                if(cpu_req_valid)begin
                    if(Fence_i) next_status = FENCE_I;
                    else if(cpu_dev) next_status = DEV;
                    else next_status = CompareTag;
                end
                else next_status = IDLE;
            end
            CompareTag: begin
                if(hit) next_status = Readin;
                else if(V[cpu_index] && D[cpu_index]) next_status = WriteBack;
                else next_status = Allocate;
            end
            Allocate: begin
                if(rw_ready_i) begin
                    next_status = CompareTag;
                end
                else next_status = Allocate;
            end
            Readin: begin
                if(cpu_req_rw) next_status = Writein;
                else next_status = IDLE;
            end
            WriteBack: begin
                if(rw_ready_i) begin
                    next_status = Allocate;
                end
                else next_status = WriteBack;
            end
            Writein: next_status = IDLE;////
            //RETN: next_status = IDLE;
            FENCE_I: begin
                if(rw_ready_i || !V[idx_cnt]) begin
                    if(idx_cnt == 8'd255) next_status = IDLE;
                    else next_status = Readout;
                end
                else next_status = FENCE_I;
            end
            Readout: next_status = FENCE_I;
            DEV: begin
                if(rw_ready_i) next_status = IDLE;
                else next_status = DEV;
            end
            default: next_status = IDLE;
        endcase
    end
    //cache line
    wire [127:0] data_in_ram;
    reg  [127:0] bwen;
    wire [127:0] line_o [0:3];
    wire line_wen [0:3];
    wire [5:0] ram_addr = (Fence_i) ? idx_cnt[5:0] : cpu_index[5:0];

    assign io_sram4_addr = ram_addr;
    assign io_sram4_cen = 1'b0;
    assign io_sram4_wen = line_wen[0];
    assign io_sram4_wdata = data_in_ram;
    assign line_o[0] = io_sram4_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram0(.Q(line_o[0]),.CLK(clk),.CEN(1'b0),.WEN(line_wen [0]),.A(ram_addr),.D(data_in_ram));
    assign io_sram5_addr = ram_addr;
    assign io_sram5_cen = 1'b0;
    assign io_sram5_wen = line_wen[1];
    assign io_sram5_wdata = data_in_ram;
    assign line_o[1] = io_sram5_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram1(.Q(line_o[1]),.CLK(clk),.CEN(1'b0),.WEN(line_wen [1]),.A(ram_addr),.D(data_in_ram));
    assign io_sram6_addr = ram_addr;
    assign io_sram6_cen = 1'b0;
    assign io_sram6_wen = line_wen[2];
    assign io_sram6_wdata = data_in_ram;
    assign line_o[2] = io_sram6_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram2(.Q(line_o[2]),.CLK(clk),.CEN(1'b0),.WEN(line_wen [2]),.A(ram_addr),.D(data_in_ram));
    assign io_sram7_addr = ram_addr;
    assign io_sram7_cen = 1'b0;
    assign io_sram7_wen = line_wen[3];
    assign io_sram7_wdata = data_in_ram;
    assign line_o[3] = io_sram7_rdata;
    //ysyx_040053_S011HD1P_X32Y2D128 ram3(.Q(line_o[3]),.CLK(clk),.CEN(1'b0),.WEN(line_wen [3]),.A(ram_addr),.D(data_in_ram));
    
    integer  i;
    //CompareTag
    always @(*) begin
        if(cur_status == CompareTag && V[cpu_index] && tag[cpu_index] == cpu_tag)
            hit=1'b1;
        else hit=1'b0;
    end

    always @(posedge clk) begin
        if(rst) begin
            cpu_data_read <= 0;
            cpu_ready <= 1'b0;
        end
        else if(cur_status == Readin) begin
            cpu_ready <= 1'b1;
            if(cpu_req_rw == 1'b0) begin//read hit
                case(cpu_index[7:6])
                    2'b00: cpu_data_read <= cpu_offset[3] ? line_o[0][127:64] : line_o[0][63:0];
                    2'b01: cpu_data_read <= cpu_offset[3] ? line_o[1][127:64] : line_o[1][63:0];
                    2'b10: cpu_data_read <= cpu_offset[3] ? line_o[2][127:64] : line_o[2][63:0];
                    default: cpu_data_read <= cpu_offset[3] ? line_o[3][127:64] : line_o[3][63:0];
                endcase
            end
        end
        else if((cur_status == FENCE_I || cur_status == Readout) && next_status == IDLE) cpu_ready <= 1'b1;
        else if(cur_status == DEV && rw_ready_i) begin
            cpu_ready <= 1'b1;
            if(cpu_req_rw == 1'b0) begin//read hit
                cpu_data_read <= data_read_i[63:0];
            end
        end
        else cpu_ready <= 1'b0;
    end

    always @(posedge clk)begin
       if(rst) begin
           bwen <= 0;
       end
       else if(cur_status == Readin && cpu_req_rw) begin//write hit
            for(i = 0; i < 8; i = i + 1)begin
                bwen[i*8 +: 8] <= {8{(~cpu_offset[3] & cpu_wmask[i])}};
            end
            for(i = 8; i < 16; i = i + 1)begin
                bwen[i*8 +: 8] <= {8{(cpu_offset[3] & cpu_wmask[i-8])}};
            end
       end
       else begin//write back
            bwen <= 0;
       end
    end
    wire [127:0] dinram = ({cpu_data_write,cpu_data_write} & bwen) | (line_o[cpu_index[7:6]] & ~bwen); 
    assign data_in_ram = (cur_status == Writein) ? dinram : data_read_i;


    //Allocate
    assign line_wen[0] = !(cpu_index[7:6] == 2'b00 && (cur_status == Allocate && rw_ready_i || cur_status == Writein));
    assign line_wen[1] = !(cpu_index[7:6] == 2'b01 && (cur_status == Allocate && rw_ready_i || cur_status == Writein));
    assign line_wen[2] = !(cpu_index[7:6] == 2'b10 && (cur_status == Allocate && rw_ready_i || cur_status == Writein));
    assign line_wen[3] = !(cpu_index[7:6] == 2'b11 && (cur_status == Allocate && rw_ready_i || cur_status == Writein));

    always @(posedge clk) begin//dirty bit
        if(rst) begin
            for (i = 0; i < 64; i = i + 1)begin
                D[i] <= 1'b0;
            end
            for (i = 64; i < 128; i = i + 1)begin
                D[i] <= 1'b0;
            end
            for (i = 128; i < 192; i = i + 1)begin
                D[i] <= 1'b0;
            end
            for (i = 192; i < nline; i = i + 1)begin
                D[i] <= 1'b0;
            end
        end
        else if(cur_status == Allocate && rw_ready_i) D[cpu_index] <= 1'b0;
        else if(cur_status == Readin && cpu_req_rw) D[cpu_index] <= 1'b1;
        else if(cur_status == FENCE_I && rw_ready_i) D[idx_cnt] <= 1'b0;
    end

    always @(posedge clk) begin
        if(rst) begin
            rw_req_o <= 1'b0;
            rw_valid_o      <= 1'b0;
            rw_addr_o <= 0;
            rw_w_data_o <= 0;
            rw_size_o <= 0;
            for (i = 0; i < 64; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
            for (i = 64; i < 128; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
            for (i = 128; i < 192; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
            for (i = 192; i < nline; i = i + 1)begin
                V[i] <= 1'b0;
                tag[i]  <= 0;
            end
        end
        else if(cur_status == Allocate) begin//read new block from memory to cache
            if(!rw_ready_i) begin// not finish
                rw_addr_o <= {cpu_req_addr[63:4],4'b0000};
                rw_req_o <= 1'b0;
                rw_valid_o <= 1'b1;
                rw_size_o <= 8'hff;
            end
            else begin
                rw_valid_o <= 1'b0;
                rw_size_o <= 0;
                V[cpu_index] <= 1'b1;
                tag[cpu_index] <= cpu_tag;
            end
        end
        else if(cur_status == WriteBack) begin
            if(!rw_ready_i) begin
                rw_addr_o <= {32'b0,tag[cpu_index],cpu_index,4'b0000};
                rw_req_o  <= 1'b1;
                rw_w_data_o <= line_o[cpu_index[7:6]];
                rw_valid_o <= 1'b1;
                rw_size_o <= 8'hff;
            end
            else begin
                rw_valid_o <= 1'b0;
                rw_size_o <= 0;
            end
        end
        else if(cur_status == FENCE_I) begin
            if(!rw_ready_i && V[idx_cnt]) begin
                rw_addr_o <= {32'b0,tag[idx_cnt],idx_cnt,4'b0000};
                rw_req_o  <= 1'b1;
                rw_w_data_o <= line_o[idx_cnt[7:6]];
                rw_valid_o <= 1'b1;
                rw_size_o <= 8'hff;
            end
            else begin
                rw_valid_o <= 1'b0;
                rw_size_o <= 0;
            end
        end
        else if(cur_status == DEV) begin
            if(!rw_ready_i) begin
                rw_addr_o <= cpu_req_addr;//{cpu_req_addr[63:3],3'b000};
                rw_req_o  <= cpu_req_rw;
                rw_w_data_o <= {{64{1'b0}},cpu_data_write};
                rw_valid_o <= 1'b1;
                rw_size_o <= cpu_wmask;
            end
            else begin
                rw_valid_o <= 1'b0;
                rw_size_o <= 0;
            end
        end
        else begin
            rw_valid_o <= 1'b0;
            rw_size_o <= 0;
        end
    end
endmodule

module ysyx_040053_controler(
    input [31:0] instr_i,
    input [6:0] op,
    input [2:0] func3,
    input [6:0] func7,
    output reg ALUSrcA, //0:pc,1:busa
    output reg [1:0] ALUSrcB,//0:busb,1:imm,2:4
    output reg [2:0] ExtOp,
    output reg [4:0] ALUOp,
    output reg [2:0] Branch,
    output reg [2:0] MemOp,
    output reg [1:0] MulOp,
    output reg MemToReg, wen, MemWen,
    output reg Ecall, Mret, Csrwen, CsrToReg,
    output reg [2:0]CsrOp,
    output reg Ebreak,
    output reg Fence_i,
    output reg Csri
);

parameter ysyx_040053_I = 0;
parameter ysyx_040053_U = 1;
parameter ysyx_040053_S = 2;
parameter ysyx_040053_B = 3;
parameter ysyx_040053_J = 4;
parameter ysyx_040053_R = 5;

    always @(*) begin
        case(op)
            7'b0110111://lui
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b01111; ExtOp = ysyx_040053_U; wen = 1;
                end
            7'b0010111://auipc
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; ALUSrcA = 0; ALUSrcB = 1; ALUOp = 5'b00000; ExtOp = ysyx_040053_U; wen = 1;
                end
            7'b1101111://jal
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 3'b001; ALUSrcA = 0; ALUSrcB = 2; ALUOp = 5'b00000; ExtOp = ysyx_040053_J; wen = 1;
                end
            7'b1100111://jalr
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemOp = 0; MemOp = 0; MemToReg = 0; Branch = 3'b010; ALUSrcA = 0; ALUSrcB = 2; ALUOp = 5'b00000; ExtOp = ysyx_040053_I; wen = 1;
                end
            7'b0010011://addi
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; //wen = 1;
                    case(func3)
                        3'b000: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b010: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00010; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b011: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00011; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b100: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00100; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b110: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00110; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b111: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00111; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b001: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00001; ExtOp = ysyx_040053_I; wen = 1; end
                        default: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = (instr_i[30] == 1'b0) ? 5'b00101 : 5'b01101; ExtOp = ysyx_040053_I; wen = 1; end
                    endcase
                end
            7'b0110011://add MulOp = 0; 
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; //wen = 1;
                    if(func7 == 7'b0000001) begin//mul div rem
                        case(func3)
                            3'b000: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b01001; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b001: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b11; ALUOp = 5'b01001; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b010: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b10; ALUOp = 5'b01001; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b011: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b01; ALUOp = 5'b01001; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b100: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b01011; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b101: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b01010; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b110: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b01110; ExtOp = ysyx_040053_R; wen = 1; end
                            default:begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b01100; ExtOp = ysyx_040053_R; wen = 1; end
                        endcase//7'b0000001: begin  end
                    end
                    else begin
                        MulOp = 0; 
                        case(func3)
                            3'b000: begin//add sub
                                    ALUSrcA = 1; ALUSrcB = 0; ExtOp = ysyx_040053_R; wen = 1; 
                                    case(func7) 
                                        7'b0100000: ALUOp = 5'b01000; 
                                        default: ALUOp = 5'b00000; 
                                    endcase 
                                end
                            3'b010: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00010; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b011: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00011; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b100: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00100; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b110: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00110; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b111: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00111; ExtOp = ysyx_040053_R; wen = 1; end
                            3'b001: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00001; ExtOp = ysyx_040053_R; wen = 1; end
                            default: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = (instr_i[30] == 1'b0) ? 5'b00101 : 5'b01101; ExtOp = ysyx_040053_R; wen = 1; end
                            //srl/sra
                        endcase
                    end
                end
/*
  INSTPAT("0000000 ????? ????? 000 ????? 01100 11", add    , R, R(dest) = src1 + src2);
  INSTPAT("0100000 ????? ????? 000 ????? 01100 11", sub    , R, R(dest) = src1 - src2);
  INSTPAT("0000000 ????? ????? 001 ????? 01100 11", sll    , R, R(dest) = src1 << (src2 & 0x3f));
  INSTPAT("0000000 ????? ????? 010 ????? 01100 11", slt    , R, R(dest) = ( (int64_t)src1 < (int64_t)src2 ));
  INSTPAT("0000000 ????? ????? 011 ????? 01100 11", sltu   , R, R(dest) = ( (uint64_t)src1 < (uint64_t)src2 ));
  INSTPAT("0000000 ????? ????? 100 ????? 01100 11", xor    , R, R(dest) = src1 ^ src2);
  INSTPAT("0000000 ????? ????? 101 ????? 01100 11", srl    , R, R(dest) = (src1 << (src2 & 0x3f)));
  INSTPAT("0100000 ????? ????? 101 ????? 01100 11", sra    , R, R(dest) = (word_t)((int64_t)src1 >> (src2 & 0x3f)));
  INSTPAT("0000000 ????? ????? 110 ????? 01100 11", or     , R, R(dest) = src1 | src2);
  INSTPAT("0000000 ????? ????? 111 ????? 01100 11", and    , R, R(dest) = src1 & src2);
  
  INSTPAT("0000001 ????? ????? 000 ????? 01100 11", mul    , R, R(dest) = (word_t)(src1 * src2));
  INSTPAT("0000001 ????? ????? 001 ????? 01100 11", mulh   , R, R(dest) = (word_t)(((__int128_t)((__int128_t)src1 * (__int128_t)src2)) >> 64));
  INSTPAT("0000001 ????? ????? 010 ????? 01100 11", mulhsu , R, R(dest) = (word_t)(((__int128_t)((__uint128_t)((src1 >= 0) ? src1 : -src1) * (__uint128_t)src2) * ((src1 >= 0) ? 1 : -1) ) >> 64));
  INSTPAT("0000001 ????? ????? 011 ????? 01100 11", mulhu  , R, R(dest) = (word_t)(((__int128_t)((__uint128_t)src1 * (__uint128_t)src2)) >> 64));
  INSTPAT("0000001 ????? ????? 100 ????? 01100 11", div    , R, R(dest) = (word_t)((int64_t)src1 / (int64_t)src2));
  INSTPAT("0000001 ????? ????? 101 ????? 01100 11", divu   , R, R(dest) = src1 / src2);
  INSTPAT("0000001 ????? ????? 110 ????? 01100 11", rem    , R, R(dest) = (word_t)((int64_t)src1 % (int64_t)src2));
  INSTPAT("0000001 ????? ????? 111 ????? 01100 11", remu   , R, R(dest) = src1 % src2);
*/
            7'b1100011://beq
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemOp = 0; MemToReg = 0;  //wen = 1;
                    case(func3)
                        3'b000: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00010; ExtOp = ysyx_040053_B; Branch = 3'b100; wen = 0; end
                        3'b001: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00010; ExtOp = ysyx_040053_B; Branch = 3'b101; wen = 0; end
                        3'b100: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00010; ExtOp = ysyx_040053_B; Branch = 3'b110; wen = 0; end
                        3'b101: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00010; ExtOp = ysyx_040053_B; Branch = 3'b111; wen = 0; end
                        3'b110: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00011; ExtOp = ysyx_040053_B; Branch = 3'b110; wen = 0; end
                        3'b111: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00011; ExtOp = ysyx_040053_B; Branch = 3'b111; wen = 0; end
                        default: begin
                            ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; ExtOp = ysyx_040053_B; Branch = 3'b000; wen = 0;
                        end
                    endcase
                end
/*
  INSTPAT("??????? ????? ????? 000 ????? 11000 11", beq    , B, s->dnpc = (src1 == src2) ? (dest + s->pc) : s->snpc);
  INSTPAT("??????? ????? ????? 001 ????? 11000 11", bne    , B, s->dnpc = (src1 != src2) ? (dest + s->pc) : s->snpc);
  INSTPAT("??????? ????? ????? 100 ????? 11000 11", blt    , B, s->dnpc = ((int64_t)src1 < (int64_t)src2) ? (dest + s->pc) : s->snpc);
  INSTPAT("??????? ????? ????? 101 ????? 11000 11", bge    , B, s->dnpc = ((int64_t)src1 >= (int64_t)src2) ? (dest + s->pc) : s->snpc);
  INSTPAT("??????? ????? ????? 110 ????? 11000 11", bltu   , B, s->dnpc = ((uint64_t)src1 < (uint64_t)src2) ? (dest + s->pc) : s->snpc);
  INSTPAT("??????? ????? ????? 111 ????? 11000 11", bgeu   , B, s->dnpc = ((uint64_t)src1 >= (uint64_t)src2) ? (dest + s->pc) : s->snpc);
*/
            7'b0000011://ld
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 0; MemToReg = 1; Branch = 0; //wen = 1;
                    case(func3)
                        3'b000: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b001; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b001: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b010; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b010: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b000; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b011: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b011; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b100: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b101; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b101: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b110; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b110: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b100; ExtOp = ysyx_040053_I; wen = 1; end
                        default: begin
                            ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; MemOp = 0; ExtOp = ysyx_040053_I; wen = 0;
                        end
                    endcase
                end
/*
  INSTPAT("??????? ????? ????? 000 ????? 00000 11", lb     , I, R(dest) = SEXT(Mr(src1 + src2, 1), 8));
  INSTPAT("??????? ????? ????? 001 ????? 00000 11", lh     , I, R(dest) = SEXT(Mr(src1 + src2, 2), 16));
  INSTPAT("??????? ????? ????? 010 ????? 00000 11", lw     , I, R(dest) = SEXT(Mr(src1 + src2, 4), 32));
  INSTPAT("??????? ????? ????? 011 ????? 00000 11", ld     , I, R(dest) = Mr(src1 + src2, 8));
  INSTPAT("??????? ????? ????? 100 ????? 00000 11", lbu    , I, R(dest) = Mr(src1 + src2, 1));
  INSTPAT("??????? ????? ????? 101 ????? 00000 11", lhu    , I, R(dest) = Mr(src1 + src2, 2));
  INSTPAT("??????? ????? ????? 110 ????? 00000 11", lwu    , I, R(dest) = Mr(src1 + src2, 4));
*/
            7'b0100011://sd
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MulOp = 0; MemWen = 1; MemToReg = 0; Branch = 0; //wen = 1;
                    case(func3)
                        3'b000: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b001; ExtOp = ysyx_040053_S; wen = 0; end
                        3'b001: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b010; ExtOp = ysyx_040053_S; wen = 0; end
                        3'b010: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b000; ExtOp = ysyx_040053_S; wen = 0; end
                        3'b011: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; MemOp = 3'b011; ExtOp = ysyx_040053_S; wen = 0; end
                        default: begin
                            ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; MemOp = 0; ExtOp = ysyx_040053_S; wen = 0;
                        end
                    endcase
                end
/*
  INSTPAT("??????? ????? ????? 000 ????? 01000 11", sb     , S, Mw(src1 + dest, 1, src2));
  INSTPAT("??????? ????? ????? 001 ????? 01000 11", sh     , S, Mw(src1 + dest, 2, src2));
  INSTPAT("??????? ????? ????? 010 ????? 01000 11", sw     , S, Mw(src1 + dest, 4, src2));
  INSTPAT("??????? ????? ????? 011 ????? 01000 11", sd     , S, Mw(src1 + dest, 8, src2));
*/
            7'b0011011://addiw
                begin
                    MulOp = 0;
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; //wen = 1;
                    case(func3)
                        3'b000: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b10000; ExtOp = ysyx_040053_I; wen = 1; end
                        3'b001: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b10001; ExtOp = ysyx_040053_I; wen = 1; end
                        default: begin ALUSrcA = 1; ALUSrcB = 1; ALUOp = (instr_i[30] == 1'b0) ? 5'b10101 : 5'b11101; ExtOp = ysyx_040053_I; wen = 1; end
                    endcase
                end
/*

  INSTPAT("??????? ????? ????? 000 ????? 00110 11", addiw  , I, R(dest) = SEXT((src1 + src2) & 0xffffffff, 32));
  INSTPAT("0000000 ????? ????? 001 ????? 00110 11", slliw  , I, R(dest) = SEXT((src1 << (src2 & 0x1f)) & 0xffffffff, 32));
  INSTPAT("0000000 ????? ????? 101 ????? 00110 11", srliw  , I, R(dest) = SEXT(((src1 & 0xffffffff) >> (src2 & 0x1f)), 32));
  INSTPAT("0100000 ????? ????? 101 ????? 00110 11", sraiw  , I, R(dest) = SEXT((int64_t)(((int32_t)(src1 & 0xffffffff)) >> ((uint32_t)(src2 & 0x1f))), 32));
*/
            7'b0111011://addw MulOp = 0; 
                begin
                    Ebreak = 0; Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; Csrwen = 0; Fence_i = 0; Csri = 0;
                    MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; //wen = 1;
                    if(func7 == 7'b0000001) begin//mulw divw remw
                            case(func3)
                                3'b100: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b11011; ExtOp = ysyx_040053_R; wen = 1; end
                                3'b101: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b11010; ExtOp = ysyx_040053_R; wen = 1; end
                                3'b110: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b11110; ExtOp = ysyx_040053_R; wen = 1; end
                                3'b111: begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b11100; ExtOp = ysyx_040053_R; wen = 1; end
                                default:begin ALUSrcA = 1; ALUSrcB = 0; MulOp = 2'b00; ALUOp = 5'b11001; ExtOp = ysyx_040053_R; wen = 1; end
                            endcase//7'b0000001: begin  end
                        end
                    else begin
                        MulOp = 0;
                        case(func3)
                            3'b000: begin//addw subw mulw divw  乘除法还没做
                                    ALUSrcA = 1; ALUSrcB = 0; ExtOp = ysyx_040053_R; wen = 1; 
                                    case(func7) 
                                        7'b0100000: ALUOp = 5'b11000;
                                        default: ALUOp = 5'b10000;
                                    endcase 
                                end
                            3'b001: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b10001; ExtOp = ysyx_040053_R; wen = 1; end
                            default: begin ALUSrcA = 1; ALUSrcB = 0; ALUOp = (instr_i[30] == 1'b0) ? 5'b10101 : 5'b11101; ExtOp = ysyx_040053_R; wen = 1; end
                            //srl/sra
                        endcase
                    end
                end
/*
  INSTPAT("0000000 ????? ????? 000 ????? 01110 11", addw   , R, R(dest) = SEXT((src1 + src2) & 0xffffffff, 32));
  INSTPAT("0100000 ????? ????? 000 ????? 01110 11", subw   , R, R(dest) = SEXT((src1 - src2) & 0xffffffff, 32));
  INSTPAT("0000000 ????? ????? 001 ????? 01110 11", sllw   , R, R(dest) = SEXT((src1 << (src2 & 0x1f)) & 0xffffffff, 32));
  INSTPAT("0000000 ????? ????? 101 ????? 01110 11", srlw   , R, R(dest) = SEXT(((src1 & 0xffffffff) >> (src2 & 0x1f)), 32));
  INSTPAT("0100000 ????? ????? 101 ????? 01110 11", sraw   , R, R(dest) = SEXT((int64_t)(((int32_t)(src1 & 0xffffffff)) >> ((uint32_t)(src2 & 0x1f))), 32));
*/
            7'b1110011://ebreak, mret, ecall, csrrw, csrrc, csrrs
             	begin
                    ExtOp = ysyx_040053_I; MulOp = 0;
                    MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0; Fence_i = 0;
                    case(func3)
                        3'b000: 
                            begin
                                Csri = 0;
                                case(instr_i[31:20])
                                    0://ecall
                                        begin
                                            Ebreak = 0; Csrwen = 0;  Ecall = 1; Mret = 0; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 0;
                                        end
                                    1: //ebreak
                                        begin 
                                            Ebreak = 1; Csrwen = 0;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 0; 
                                            //c_trap(1); 
                                        end
                                    12'h302://mret
                                        begin
                                            Ebreak = 0; Csrwen = 0;  Ecall = 0; Mret = 1; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 0;
                                        end
                                    default: begin
                                        Ebreak = 0; Csrwen = 0;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; wen = 0;           
                                    end
                                endcase
                            end
                        3'b001://csrrw
                            begin
                                Csri = 0; Ebreak = 0; Csrwen = 1;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 1; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 1;
                            end
                        3'b010://csrrs
                            begin
                                Csri = 0; Ebreak = 0; Csrwen = 1;  Ecall = 0; Mret = 0; CsrOp = 1; CsrToReg = 1; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 1;
                            end
                        3'b011://csrrc
                            begin
                                Csri = 0; Ebreak = 0; Csrwen = 1;  Ecall = 0; Mret = 0; CsrOp = 2; CsrToReg = 1; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 1;
                            end
                        3'b101://csrrwi
                            begin
                                Csri = 1; Ebreak = 0; Csrwen = 1;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 1; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 1;
                            end
                        3'b110://csrrsi
                            begin
                                Csri = 1; Ebreak = 0; Csrwen = 1;  Ecall = 0; Mret = 0; CsrOp = 1; CsrToReg = 1; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 1;
                            end
                        3'b111://csrrci
                            begin
                                Csri = 1; Ebreak = 0; Csrwen = 1;  Ecall = 0; Mret = 0; CsrOp = 2; CsrToReg = 1; ALUSrcA = 1; ALUSrcB = 1; ALUOp = 5'b00000; wen = 1;
                            end
                        default: begin
                            Csri = 0; Ebreak = 0; Csrwen = 0;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; wen = 0;           
                        end
                    endcase
             	end
            7'b0001111://fence.i
                begin
                    ExtOp = ysyx_040053_I; MulOp = 0; Fence_i = 1; Csri = 0;
                    MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0;
                    Ebreak = 0; Csrwen = 0;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; wen = 0;

                end
            default: begin
                //$display("no, op=%x",op);
                ExtOp = ysyx_040053_I; MulOp = 0; Fence_i = 0; Csri = 0;
                MemWen = 0; MemOp = 0; MemToReg = 0; Branch = 0;
                Ebreak = 0; Csrwen = 0;  Ecall = 0; Mret = 0; CsrOp = 0; CsrToReg = 0; ALUSrcA = 1; ALUSrcB = 0; ALUOp = 5'b00000; wen = 0;           
            end
        endcase
    end
/*
  INSTPAT("??????? ????? ????? 001 ????? 11100 11", csrrw   , I, {int t = CSR(src2); CSR(src2) = src1; R(dest) = t;});
  INSTPAT("??????? ????? ????? 010 ????? 11100 11", csrrs   , I, {R(dest) = CSR(src2); CSR(src2) |= src1;});
  INSTPAT("??????? ????? ????? 011 ????? 11100 11", csrrc   , I, {R(dest) = CSR(src2); CSR(src2) &= (~src1);});
  
  INSTPAT("0000000 00000 00000 000 00000 11100 11", ecall  , N, s->dnpc = isa_raise_intr(R(17), s->pc);); // R(10) is $a0
  INSTPAT("0000000 00001 00000 000 00000 11100 11", ebreak , N, NEMUTRAP(s->pc, R(10))); // R(10) is $a0
  INSTPAT("0011000 00010 00000 000 00000 11100 11", mret  , N, s->dnpc = CSR(0x341);); //MEPC
*/
endmodule




module ysyx_040053_core(
  input clk,
  input rst,
  output [31:0] instr,//debug instr fetched
  output [63:0] pc,//debug pc of instr fetched
  output wb_commit,//debug commit an instr
  output [63:0] wb_pc,//debug pc of instr committed
  output [31:0] wb_instr,//debug instr committrd
  output [63:0] next_pc,//debug dnpc of instr committed
  output  [63:0]   rw_addr_o,
  output           rw_req_o,
  output           rw_valid_o,
  output [127:0]   rw_w_data_o,
  input  [127:0]   data_read_i,//finish burst
  input            rw_ready_i,//data_read_i in ram
  output [7:0]     rw_size_o,
  output           rw_dev_o,
  output reg wb_dev_o,//debug instr committed read dev
  output [3:0] rw_bytes_o,

    output[5:0] io_sram0_addr,
	output io_sram0_cen,
	output io_sram0_wen,
	output[127:0] io_sram0_wdata,
	input[127:0] io_sram0_rdata,

	output[5:0] io_sram1_addr,
	output io_sram1_cen, 
	output io_sram1_wen, 		
	output[127:0] io_sram1_wdata,
	input[127:0] io_sram1_rdata,

	output[5:0] io_sram2_addr,	
	output io_sram2_cen, 
	output io_sram2_wen, 
	output[127:0] io_sram2_wdata, 
	input[127:0] io_sram2_rdata, 

	output[5:0] io_sram3_addr, 
	output io_sram3_cen, 
	output io_sram3_wen, 
	output[127:0] io_sram3_wdata, 
	input[127:0] io_sram3_rdata,	

	output[5:0] io_sram4_addr, 
	output io_sram4_cen, 
	output io_sram4_wen, 
	output[127:0] io_sram4_wdata, 
	input[127:0] io_sram4_rdata, 

	output[5:0] io_sram5_addr, 
	output io_sram5_cen, 
	output io_sram5_wen, 
	output[127:0] io_sram5_wdata, 
	input[127:0] io_sram5_rdata, 

	output[5:0] io_sram6_addr, 
	output io_sram6_cen, 
	output io_sram6_wen, 
	output[127:0] io_sram6_wdata, 
	input[127:0] io_sram6_rdata, 
    
	output[5:0] io_sram7_addr, 
	output io_sram7_cen, 
	output io_sram7_wen, 
	output[127:0] io_sram7_wdata,
	input[127:0] io_sram7_rdata
);
    /////////////wires///////////////
    wire [63:0] i_rw_addr_o;
    wire i_rw_req_o;
    wire i_rw_valid_o;
    wire  [127:0] i_data_read_i;
    wire  i_rw_ready_i;
    
    wire [63:0]     d_rw_addr_o;
    wire            d_rw_req_o;//
    wire            d_rw_valid_o;
    wire [127:0]    d_rw_w_data_o;
    wire  [127:0]    d_data_read_i;//finish burst
    wire             d_rw_ready_i;
    wire mstatus_MIE;
    wire mie_MITE;
    wire Time_interrupt;
    ////////////////////////all/////////////////////////
    wire [31:0] if_instr_o, id_instr_o, ex_instr_o, m_instr_o, wb_instr_o;
    wire [63:0] if_pc_o, id_pc_o, ex_pc_o, m_pc_o, wb_pc_o;
    wire id_valid_i, ex_valid_i, m_valid_i, wb_valid_i;
    wire id_en, ex_en, m_en, wb_en; 
    wire id_flush, ex_flush, m_flush, wb_flush; 
    wire id_valid_o, ex_valid_o, m_valid_o, wb_valid_o;
    wire if_block, id_block, ex_block, m_block, wb_block;
    /////////////////ID////////////////////////////////
    wire [63:0] id_csrres_o;
    wire [4:0]  id_rd_o, id_rs1, id_rs2;//id 段输出
    wire [63:0] id_busa_o, id_busb_o;
    wire [63:0] id_imm_o;
    wire id_ALUSrcA_o;
    wire id_MemToReg_o;
    wire id_MemWen_o;
    wire id_wen_o;
    wire id_CsrToReg_o;
    wire id_Ebreak_o;
    wire id_Fence_i_o;
    wire id_Csri_o;
    wire [1:0] id_ALUSrcB_o;
    wire [2:0] id_MemOp_o;
    wire [4:0] id_ALUOp_o;
    wire [1:0] id_MulOp_o;
    wire [2:0] id_CsrOp;
    wire id_Ecall, id_Mret, id_Csrwen;
    wire [63:0] id_dnpc;
    wire [63:0] id_busa, id_busb;
    wire [63:0] id_mtvec, id_mepc;
    wire [11:0] id_CsrId;
    /////////////EX/////////////////////////////
    wire [4:0]  ex_rd_i;//ex 段输入
    wire [63:0] ex_busa_i, ex_busb_i;
    wire [63:0] ex_imm_i;
    wire [63:0] ex_csrres_i;
    wire ex_ALUSrcA_i;
    wire ex_MemToReg_i;
    wire ex_MemWen_i;
    wire ex_wen_i;
    wire ex_CsrToReg_i;
    wire ex_Ebreak_i;
    wire ex_Fence_i_i;
    wire [1:0] ex_ALUSrcB_i;
    wire [2:0] ex_MemOp_i;
    wire [4:0] ex_ALUOp_i;
    wire [1:0] ex_MulOp_i;
    
    wire [63:0] ex_ALURes_o;//ex 段输出
    //////////////M////////////////////////////
    //m 段输入
    wire [2:0]  m_MemOp_i;
    wire [63:0] m_raddr_i;
    wire m_MemWen_i;
    wire [63:0] m_wdata_i;
    wire [63:0] m_Csrres_i;
    wire [4:0]  m_rd_i;
    wire m_wen_i, m_MemToReg_i, m_CsrToReg_i;
    wire m_Ebreak_i;
    wire m_Fence_i_i;
    wire [63:0] m_rfdata_o;//m 段输出
    wire is_cmp;
    //////////////WB///////////////////////////
    wire wb_wen_i;
    wire [63:0] wb_wdata_i;
    wire [4:0] wb_waddr_i;//wb 段输入
    wire wb_Ebreak_i;
    wire wb_Fence_i_i;
    //wb 段输出
    ////////////////others//////////////////////
    wire ebreak_commit;
    /////////////////hazard and block/////////////
    wire id_use_rd, ex_has_rd, m_has_rd, wb_has_rd, rs1_need, rs2_need;
    wire [6:0] id_op = id_instr_o[6:0];
    wire [6:0] ex_op = ex_instr_o[6:0];
    
    assign id_use_rd = id_valid_o & (~(id_op == 7'b0110111 || id_op == 7'b0010111 || id_op == 7'b1101111 || id_Ebreak_o == 1'b1 || id_Mret == 1'b1 || id_Ecall == 1'b1 || id_Csri_o == 1'b1)); //|| id_op == 7'b1110011
    assign ex_has_rd = ex_valid_o & ex_wen_i;
    assign m_has_rd = m_valid_o & m_wen_i;
    assign wb_has_rd = wb_valid_o & wb_wen_i;
    
    reg id_ex_hazard, id_m_hazard, id_wb_hazard;
    always@(*) begin
      if( id_use_rd && ex_has_rd && ((id_rs1 == ex_rd_i && id_rs1 != 5'b0) || (id_rs2 == ex_rd_i && id_rs2 != 5'b0))) begin
        id_ex_hazard = 1'b1;
      end
      else id_ex_hazard = 1'b0;
    end
    always@(*) begin
      if(id_use_rd && m_has_rd && ((id_rs1 == m_rd_i && id_rs1 != 5'b0) || (id_rs2 == m_rd_i && id_rs2 != 5'b0))) begin
        id_m_hazard = 1'b1;
      end
      else id_m_hazard = 1'b0;
    end
    always@(*) begin
      if(id_use_rd && wb_has_rd && ((id_rs1 == wb_waddr_i && id_rs1 != 5'b0) || (id_rs2 == wb_waddr_i && id_rs2 != 5'b0))) begin
        id_wb_hazard = 1'b1;
      end
      else id_wb_hazard = 1'b0;
    end
    reg load_use;
    always@(*) begin//load-use
      if(id_ex_hazard && ex_op == 7'b0000011) begin
        load_use = 1'b1;
      end
      else load_use = 1'b0;
    end
    //wire hazard = id_ex_hazard | id_m_hazard | id_wb_hazard;
    assign rs1_need = (id_ex_hazard && id_rs1 == ex_rd_i) || (id_m_hazard && id_rs1 == m_rd_i) || (id_wb_hazard && id_rs1 == wb_waddr_i);
    assign rs2_need = (id_ex_hazard && id_rs2 == ex_rd_i) || (id_m_hazard && id_rs2 == m_rd_i) || (id_wb_hazard && id_rs2 == wb_waddr_i);
    reg [63:0] forward_data1, forward_data2;
    always@(*) begin
      if(id_ex_hazard && id_rs1 == ex_rd_i) forward_data1 = (ex_CsrToReg_i == 1'b0) ? ex_ALURes_o : ex_csrres_i;
      else if(id_m_hazard && id_rs1 == m_rd_i) forward_data1 = m_rfdata_o;
      else if(id_wb_hazard && id_rs1 == wb_waddr_i) forward_data1 = wb_wdata_i;
      else forward_data1 = 64'b0;
    end

    always@(*) begin
      if(id_ex_hazard && id_rs2 == ex_rd_i) forward_data2 = (ex_CsrToReg_i == 1'b0) ? ex_ALURes_o : ex_csrres_i;
      else if(id_m_hazard && id_rs2 == m_rd_i) forward_data2 = m_rfdata_o;
      else if(id_wb_hazard && id_rs2 == wb_waddr_i) forward_data2 = wb_wdata_i;
      else forward_data2 = 64'b0;
    end

    reg fence_i_commit;
    assign Time_interrupt = mie_MITE & mstatus_MIE & is_cmp;
    /////////////IF/////////////////
    wire has_fence_i = ((id_Fence_i_o && id_valid_o) || (ex_Fence_i_i && ex_valid_o) || (m_Fence_i_i && m_valid_o)) & ~fence_i_commit;
    wire if_busy;
    wire cpu_halt;
    wire dnpc_valid = (id_valid_o & ~has_fence_i) | (wb_Fence_i_i & wb_valid_o);
    wire i_rw_dev_o;
    wire [7:0] i_rw_size_o;
    wire [3:0] i_rw_bytes_o;
    ysyx_040053_IFU my_ifu(
      .clk(clk),
      .rst(rst),
      .Fence_i(has_fence_i),
      .dnpc(id_dnpc),
      .pc(if_pc_o),
      .instr_o(if_instr_o),
      .dnpc_valid(dnpc_valid),
      .block(cpu_halt),
      .if_busy(if_busy),
      .i_rw_addr_o(i_rw_addr_o),
      .i_rw_req_o(i_rw_req_o),
      .i_rw_valid_o(i_rw_valid_o),
      .i_data_read_i(i_data_read_i),
      .i_rw_ready_i(i_rw_ready_i),
      .id_en_i(id_en),
      .i_rw_dev_o(i_rw_dev_o),
      .i_rw_size_o(i_rw_size_o),
      .i_rw_bytes_o(i_rw_bytes_o),
      .io_sram0_addr(io_sram0_addr),.io_sram0_cen(io_sram0_cen),.io_sram0_wen(io_sram0_wen),.io_sram0_wdata(io_sram0_wdata),.io_sram0_rdata(io_sram0_rdata),
      .io_sram1_addr(io_sram1_addr),.io_sram1_cen(io_sram1_cen),.io_sram1_wen(io_sram1_wen),.io_sram1_wdata(io_sram1_wdata),.io_sram1_rdata(io_sram1_rdata),
      .io_sram2_addr(io_sram2_addr),.io_sram2_cen(io_sram2_cen),.io_sram2_wen(io_sram2_wen),.io_sram2_wdata(io_sram2_wdata),.io_sram2_rdata(io_sram2_rdata),
      .io_sram3_addr(io_sram3_addr),.io_sram3_cen(io_sram3_cen),.io_sram3_wen(io_sram3_wen),.io_sram3_wdata(io_sram3_wdata),.io_sram3_rdata(io_sram3_rdata)
    );
    assign pc = if_pc_o;
    assign instr = if_instr_o;
    assign cpu_halt = id_Ebreak_o & id_valid_o | rst;
    assign if_block = id_Ebreak_o & id_valid_o | if_busy;
    assign id_en = ~(id_block | ex_block | m_block | wb_block);
    assign id_valid_i = ~(rst | if_block | cpu_halt | has_fence_i);
    /////////////////////////////////
    ysyx_040053_ID_Reg ID_Reg(
      .clk(clk),
      .flush(rst),
      .valid_i(id_valid_i),
      .enable(id_en),
      .valid_o(id_valid_o),

      .pc_i(if_pc_o),
      .instr_i(if_instr_o),
      .pc_o(id_pc_o),
      .instr_o(id_instr_o)
    );
    ////////////ID///////////////////
    wire [63:0] ex_dnpc,m_dnpc,wb_dnpc;
    ysyx_040053_IDU my_idu(
      .instr_i(id_instr_o),
      .rd(id_rd_o),
      .imm(id_imm_o),
      .ALUSrcA(id_ALUSrcA_o),
      .ALUSrcB(id_ALUSrcB_o),
      .ALUOp(id_ALUOp_o),
      .MemOp(id_MemOp_o),
      .MemToReg(id_MemToReg_o),
      .MemWen(id_MemWen_o),
      .MulOp(id_MulOp_o),
      .wen(id_wen_o),
      .CsrToReg(id_CsrToReg_o),
      .Ecall(id_Ecall),
      .Mret(id_Mret),
      .Csrwen(id_Csrwen),
      .CsrOp(id_CsrOp),
      .rs1(id_rs1),
      .rs2(id_rs2),
      .dnpc(id_dnpc),
      .pc(id_pc_o),
      .busa(id_busa_o),
      .busb(id_busb_o),
      .mtvec(id_mtvec),
      .mepc(id_mepc),
      .CsrId(id_CsrId),
      .Ebreak(id_Ebreak_o),
      .Fence_i(id_Fence_i_o),
      .Csri(id_Csri_o),
      .Time_interrupt(Time_interrupt)
      );
      assign id_flush = rst;
      wire is_Csrwen = (~id_flush) & id_Csrwen & id_valid_o;
      assign id_block = load_use | has_fence_i;//id_Ebreak_o;   //load_use
      assign id_busa_o = (rs1_need == 1'b0) ? id_busa : forward_data1;
      assign id_busb_o = (rs2_need == 1'b0) ? id_busb : forward_data2;
      assign ex_en = ~(ex_block | m_block | wb_block);//还未处理阻塞
      assign ex_valid_i = id_valid_o & (~id_block | (id_Fence_i_o & ~ex_Fence_i_i)) & ~Time_interrupt;//还未处理冒险
    /////////////////////////////
    ysyx_040053_EX_Reg EX_Reg(
      //control
      .clk(clk),
      .flush(ex_flush),
      .valid_i(ex_valid_i),
      .enable(ex_en),
      .valid_o(ex_valid_o),
      //data
      .pc_i(id_pc_o),
      .instr_i(id_instr_o),
      .pc_o(ex_pc_o),
      .instr_o(ex_instr_o),

      .rd_i(id_rd_o),
      .busa_i(id_busa_o),
      .busb_i(id_busb_o),
      .imm_i(id_imm_o),
      .ALUSrcA_i(id_ALUSrcA_o),
      .MemToReg_i(id_MemToReg_o),
      .MemWen_i(id_MemWen_o),
      .ALUSrcB_i(id_ALUSrcB_o),
      .MemOp_i(id_MemOp_o),
      .ALUOp_i(id_ALUOp_o),
      .MulOp_i(id_MulOp_o),
      .wen_i(id_wen_o),
      .CsrToReg_i(id_CsrToReg_o),
      .Csrres_i(id_csrres_o),
      .Ebreak_i(id_Ebreak_o),
      .Fence_i_i(id_Fence_i_o),

      .rd_o(ex_rd_i),
      .busa_o(ex_busa_i),
      .busb_o(ex_busb_i),
      .imm_o(ex_imm_i),
      .ALUSrcA_o(ex_ALUSrcA_i),
      .MemToReg_o(ex_MemToReg_i),
      .MemWen_o(ex_MemWen_i),
      .ALUSrcB_o(ex_ALUSrcB_i),
      .MemOp_o(ex_MemOp_i),
      .ALUOp_o(ex_ALUOp_i),
      .MulOp_o(ex_MulOp_i),
      .wen_o(ex_wen_i),
      .CsrToReg_o(ex_CsrToReg_i),
      .Csrres_o(ex_csrres_i),
      .Ebreak_o(ex_Ebreak_i),
      .Fence_i_o(ex_Fence_i_i)

      ,.dnpc_i(id_dnpc),
      .dnpc_o(ex_dnpc)
    );
    ///////////EX////////////////
    wire alu_busy;

    ysyx_040053_EXU my_exu(
      .clk(clk),
      .rst(rst),
      .busa(ex_busa_i),
      .busb(ex_busb_i),
      .ALUSrcA(ex_ALUSrcA_i),
      .ALUSrcB(ex_ALUSrcB_i),
      .ALUOp(ex_ALUOp_i),
      .MulOp(ex_MulOp_i),
      .pc(ex_pc_o),
      .imm(ex_imm_i),
      .ALURes(ex_ALURes_o),
      .mwb_block(m_block | wb_block),
      .alu_busy(alu_busy),
      .src_valid(ex_valid_o)
    );
    assign ex_flush = rst | fence_i_commit;
    assign ex_block = alu_busy;
    assign m_en = ~(m_block | wb_block);//还未处理阻塞
    assign m_valid_i = ex_valid_o & (~ex_block);//还未处理冒险
    /////////////////////////////
    ysyx_040053_M_Reg M_Reg(
//control
    .clk(clk),
    .flush(m_flush),
    .valid_i(m_valid_i),
    .enable(m_en),
    .valid_o(m_valid_o),
//data
    .pc_i(ex_pc_o),
    .instr_i(ex_instr_o),
    .pc_o(m_pc_o),
    .instr_o(m_instr_o),

    .MemOp_i(ex_MemOp_i),
    .raddr_i(ex_ALURes_o),
    .MemWen_i(ex_MemWen_i),
    .wdata_i(ex_busb_i),
    .Csrres_i(ex_csrres_i),
    .rd_i(ex_rd_i),
    .wen_i(ex_wen_i),
    .MemToReg_i(ex_MemToReg_i),
    .CsrToReg_i(ex_CsrToReg_i),
    .Ebreak_i(ex_Ebreak_i),
    .Fence_i_i(ex_Fence_i_i),

    .rd_o(m_rd_i),
    .wen_o(m_wen_i),
    .MemOp_o(m_MemOp_i),
    .raddr_o(m_raddr_i),
    .MemWen_o(m_MemWen_i),
    .wdata_o(m_wdata_i),
    .Csrres_o(m_Csrres_i),
    .MemToReg_o(m_MemToReg_i),
    .CsrToReg_o(m_CsrToReg_i),
    .Ebreak_o(m_Ebreak_i),
    .Fence_i_o(m_Fence_i_i)


      ,.dnpc_i(ex_dnpc),
      .dnpc_o(m_dnpc)
  );
  
    ///////////M/////////////////
    wire m_busy;
    wire [7:0] d_rw_size_o;
    wire d_rw_dev_o;
    wire [3:0] d_rw_bytes_o;
    wire is_Fence_i = m_Fence_i_i & m_valid_o;
    wire is_MemToReg = m_MemToReg_i & (~m_flush) & m_valid_o;
    wire is_men = m_MemWen_i & (~m_flush) & m_valid_o;

    ysyx_040053_MU my_mu(
      .clk(clk), 
      .rst(rst),
      .MemOp(m_MemOp_i),
      .MemToReg(is_MemToReg),
      .MemWen(is_men),
      .CsrToReg(m_CsrToReg_i),
      .raddr(m_raddr_i),//load指令的读取地址，save指令的waddr，其他指令的ALURes
      .wdata(m_wdata_i),
      .csrres(m_Csrres_i),
      .rfdata(m_rfdata_o),
      .m_busy(m_busy),
      .d_rw_addr_o(d_rw_addr_o),
      .d_rw_req_o(d_rw_req_o),//
      .d_rw_valid_o(d_rw_valid_o),
      .d_rw_w_data_o(d_rw_w_data_o),
      .d_data_read_i(d_data_read_i),//finish burst
      .d_rw_ready_i(d_rw_ready_i),
      .Fence_i(is_Fence_i),
      .is_cmp(is_cmp),
      .d_rw_size_o(d_rw_size_o),
      .d_rw_dev_o(d_rw_dev_o),
      .d_rw_bytes_o(d_rw_bytes_o),
        .io_sram4_addr(io_sram4_addr),.io_sram4_cen(io_sram4_cen),.io_sram4_wen(io_sram4_wen),.io_sram4_wdata(io_sram4_wdata),.io_sram4_rdata(io_sram4_rdata),
        .io_sram5_addr(io_sram5_addr),.io_sram5_cen(io_sram5_cen),.io_sram5_wen(io_sram5_wen),.io_sram5_wdata(io_sram5_wdata),.io_sram5_rdata(io_sram5_rdata),
        .io_sram6_addr(io_sram6_addr),.io_sram6_cen(io_sram6_cen),.io_sram6_wen(io_sram6_wen),.io_sram6_wdata(io_sram6_wdata),.io_sram6_rdata(io_sram6_rdata),
        .io_sram7_addr(io_sram7_addr),.io_sram7_cen(io_sram7_cen),.io_sram7_wen(io_sram7_wen),.io_sram7_wdata(io_sram7_wdata),.io_sram7_rdata(io_sram7_rdata)
    );
    assign m_flush = rst | fence_i_commit;
    assign m_block = m_busy;
    assign wb_en = ~wb_block;//还未处理阻塞
    assign wb_valid_i = m_valid_o & (~m_block);//还未处理冒险

    wire dev_i = m_valid_o && (m_raddr_i[31:28] == 4'ha) && (is_men == 1'b0);
    wire dev_o;
    /////////////////////////////
    ysyx_040053_WB_Reg WB_Reg(
//control
    .clk(clk),
    .flush(wb_flush),
    .valid_i(wb_valid_i),
    .enable(wb_en),
    .valid_o(wb_valid_o),
//data
    .pc_i(m_pc_o),
    .instr_i(m_instr_o),
    .pc_o(wb_pc_o),
    .instr_o(wb_instr_o),
    
    .wen_i(m_wen_i),
    .wdata_i(m_rfdata_o),
    .waddr_i(m_rd_i),
    .Ebreak_i(m_Ebreak_i),
    .Fence_i_i(m_Fence_i_i),

    .wen_o(wb_wen_i),
    .wdata_o(wb_wdata_i),
    .waddr_o(wb_waddr_i),
    .Ebreak_o(wb_Ebreak_i),
    .Fence_i_o(wb_Fence_i_i)

    ,.dnpc_i(m_dnpc),
      .dnpc_o(wb_dnpc)
    ,.dev_i(dev_i),
    .dev_o(dev_o)
    );
    ///////////WB////////////////
    assign wb_block = 1'b0;
    assign wb_flush = rst;
    wire is_wen = (~wb_flush) & wb_wen_i & wb_valid_o;
    ///commit a finish instr
    reg wb_commit_r;
    reg [63:0] wb_pc_r;
    reg [31:0] wb_instr_r;
    reg [63:0] next_pc_r;
    reg ebreak_commit_r;
    always@(posedge clk) begin
        if(wb_flush)begin 
            wb_commit_r <= 1'b0;
            wb_pc_r    <= 64'b0;
            wb_instr_r <= 32'b0;
            next_pc_r <= 64'b0;
            wb_dev_o <= 0;
            fence_i_commit <= 0;
            ebreak_commit_r <= 0;
        end
        else begin
          if(wb_valid_o)begin
            wb_commit_r <= wb_valid_o;
            wb_pc_r    <= wb_pc_o;
            wb_instr_r <= wb_instr_o;
            next_pc_r <= wb_dnpc;
            wb_dev_o <= dev_o;
            fence_i_commit <= wb_Fence_i_i;
            ebreak_commit_r <= wb_Ebreak_i;
          end
          else begin
            wb_commit_r <= 1'b0;
            wb_pc_r    <= 64'b0;
            wb_instr_r <= 32'b0;
            next_pc_r <= 64'b0;
            wb_dev_o <= 0;
            fence_i_commit <= 0;
            ebreak_commit_r <= 0;
          end
        end
    end
    assign wb_commit = wb_commit_r;
    assign wb_pc = wb_pc_r;
    assign wb_instr = wb_instr_r;
    assign ebreak_commit = ebreak_commit_r;
    assign next_pc = next_pc_r;
    //always@(*) begin
    //  if(ebreak_commit) c_trap(1);
    //end
    ///////////Regfile///////////
    ysyx_040053_RegisterFile regfile(.clk(clk),
                                              .rst(rst),
                                              .raaddr(id_rs1),
                                              .rbaddr(id_rs2),
                                              .radata(id_busa),
                                              .rbdata(id_busb),
                                              .wdata(wb_wdata_i),//WB
                                              .waddr(wb_waddr_i),//WB
                                              .wen(is_wen)//WB
                                            );
    //////////Csr////////////////
    //Csrwen:阻塞时不能写,还没完成这里的逻辑，阻塞和冒险判断放在top里
    wire [63:0] Csr_datain = (id_Csri_o == 1'b1) ? {{59{1'b0}},id_rs1} : id_busa_o;
    ysyx_040053_CSR csrfile( .clk(clk), .rst(rst), .Csrwen(is_Csrwen), .CsrOp(id_CsrOp), .CsrId(id_CsrId), .datain(Csr_datain),
                             .mepc_o(id_mepc), .csrres(id_csrres_o), .mtvec_o(id_mtvec), .Ecall(id_Ecall & id_valid_o),
                             .epc_in(id_pc_o),.Mret(id_Mret & id_valid_o),
                             .mstatus_MIE(mstatus_MIE), .mie_MITE(mie_MITE), .Time_interrupt(Time_interrupt & id_valid_o));
    
    //////////Arbiter//////////////
    ysyx_040053_arbiter arbiter(
    clk,rst,
  //icache <-> arbiter
    if_busy,i_rw_addr_o,i_rw_req_o,i_rw_valid_o,i_data_read_i,i_rw_ready_i,i_rw_size_o,i_rw_dev_o,i_rw_bytes_o,
  //dcache <-> arbiter
    m_busy,d_rw_addr_o,d_rw_req_o,d_rw_valid_o,d_rw_w_data_o,d_data_read_i,d_rw_ready_i,d_rw_size_o,d_rw_dev_o,d_rw_bytes_o,
  //arbiter<->memory
    rw_addr_o,rw_req_o,rw_valid_o,rw_w_data_o,data_read_i,rw_ready_i,rw_size_o,rw_dev_o,rw_bytes_o
    );
endmodule



module ysyx_040053_CSR(
    input clk,rst,
    input Csrwen, Ecall, Mret,
    input [2:0] CsrOp,
    input [11:0] CsrId,
    input [63:0] datain,
    input [63:0] epc_in,
    output [63:0] mepc_o, mtvec_o,
    output reg [63:0] csrres,
    output mstatus_MIE,
    output mie_MITE,
    input  Time_interrupt
);
/*
#define MSTATUS   0x300
MIE               0x304
#define MTVEC     0x305
#define MSCRATCH  0x340
#define MEPC      0x341
#define MCAUSE    0x342
MIP               0x344
*/

    reg [63:0] csrin;//data to be written
    /////////////////////write////////////////////
    /////////////////////mtvec////////////////////
    reg [63:0] mtvec;
    always@(posedge clk) begin
        if(rst) begin
            mtvec <= 0;
        end
        else if(CsrId == 12'h305 && Csrwen == 1'b1) begin
            mtvec <= csrin;
        end
    end

    /////////////////////mepc//////////////////////
    reg [63:0] mepc;
    always@(posedge clk) begin
        if(rst) begin
            mepc <= 0;
        end
        else if(Ecall == 1'b1 || Time_interrupt == 1'b1) begin
            mepc <= epc_in;
        end
        else if(CsrId == 12'h341 && Csrwen == 1'b1) begin
            mepc <= csrin;
        end
    end
    /////////////////////mcause////////////////////
    reg [63:0] mcause;
    always@(posedge clk) begin
        if(rst) begin
            mcause <= 0;
        end
        else if(Time_interrupt == 1'b1) begin
            mcause <= 64'h8000000000000007;
        end
        else if(Ecall == 1'b1) begin
            mcause <= {{60{1'b0}},4'hb};
        end
        else if(CsrId == 12'h342 && Csrwen == 1'b1) begin
            mcause <= csrin;
        end
    end
    /////////////////////mstatus///////////////////
    reg [63:0] mstatus;
    always@(posedge clk) begin
        if(rst) begin
            mstatus <= 64'ha00001800;
        end
        else if(Ecall == 1'b1 || Time_interrupt == 1'b1) begin
            mstatus <= {mstatus[63:13],1'b0,1'b0,mstatus[10:8],mstatus_MIE,mstatus[6:4],1'b0,mstatus[2:0]};
        end
        else if(Mret == 1'b1) begin
            mstatus <= {mstatus[63:13],1'b1,1'b1,mstatus[10:8],1'b1,mstatus[6:4],mstatus[7],mstatus[2:0]};
        end
        else if(CsrId == 12'h300 && Csrwen == 1'b1) begin
            mstatus <= csrin;
        end
        else mstatus <= {mstatus[63:13],1'b1,1'b1,mstatus[10:0]};
    end
    assign mstatus_MIE = mstatus[3];
    /////////////////////mscratch///////////////////
    reg [63:0] mscratch;
    always@(posedge clk) begin
        if(rst) begin
            mscratch <= 0;
        end
        else if(CsrId == 12'h340 && Csrwen == 1'b1) begin
            mscratch <= csrin;
        end
    end
    ///////////////////mie/////////////////////////
    reg [63:0] mie;
    always@(posedge clk) begin
        if(rst) begin
            mie <= 0;
        end
        else if(CsrId == 12'h304 && Csrwen == 1'b1) begin
            mie <= csrin;
        end
    end
    assign mie_MITE = mie[7];
    ///////////////////mip/////////////////////////
    reg [63:0] mip;
    always@(posedge clk) begin
        if(rst) begin
            mip <= 0;
        end
        else if(Time_interrupt) begin
            mip <= {mip[63:8],1'b1,mip[6:0]};
        end
        else if(CsrId == 12'h344 && Csrwen == 1'b1) begin
            mip <= csrin;
        end
        else mip <= {mip[63:8],1'b0,mip[6:0]};
    end
    //////////////////////read/////////////////////
    always@(*) begin
        case(CsrId)
            12'h300:  csrres = mstatus;
            12'h304:  csrres = mie;
            12'h305:  csrres = mtvec;
            12'h340:  csrres = mscratch;
            12'h341:  csrres = mepc;
            12'h342:  csrres = mcause;
            12'h344:  csrres = mip;
            default: csrres = 0;
        endcase
    end

    always@(*) begin
        case(CsrOp)
            3'b000:  csrin = datain;
            3'b001:  csrin = csrres | datain;
            3'b010:  csrin = csrres & (~datain);
            default: csrin = 0;
        endcase
    end
    assign mtvec_o = mtvec;
    assign mepc_o = mepc;
endmodule




`define ysyx_040053_XLEN 64
`define ysyx_040053_XXLEN 128

module ysyx_040053_divu(
    input clk,
    input rst,
    input [`ysyx_040053_XLEN - 1:0] dividend,
    input [`ysyx_040053_XLEN - 1:0] divisor,
    input div_valid,
    input div_signed,
    input flush,
    output div_ready,
    output out_valid,
    output [`ysyx_040053_XLEN - 1:0] quotient,
    output [`ysyx_040053_XLEN - 1:0] remainder
);
    reg running_r;
    reg ready_r, valid_r;
    reg [6:0] cnt;
    reg [`ysyx_040053_XXLEN - 1:0] udividend_r;
    reg [`ysyx_040053_XLEN - 1:0] udivisor_r, quotient_r, remainder_r;
    reg dividend_s, divisor_s;
    wire [`ysyx_040053_XLEN - 1:0] dividend_abs, divisor_abs;
    wire [`ysyx_040053_XLEN - 1 : 0] sub;
    wire sub_s;

//abs
    assign dividend_abs = ~dividend + `ysyx_040053_XLEN'b1;
    assign divisor_abs  = ~divisor  + `ysyx_040053_XLEN'b1;

//status
    wire div_fire = ready_r && div_valid;//握手成功，准备开始
    wire done = running_r && cnt == 7'h40;
    always @(posedge clk) begin
        if(rst || flush  || valid_r) begin
            ready_r <= 1'b1;
        end
        else if(div_fire) begin
            ready_r <= 1'b0;
        end 
    end

    always @(posedge clk) begin
        if(rst || flush || done ) begin
            running_r <= 1'b0;
        end
        else if(div_fire) begin
            running_r <= 1'b1;
        end 
    end

    always @(posedge clk) begin
        if(rst || flush || valid_r) begin
            valid_r <= 1'b0;
        end
        else if(done) begin
            valid_r <= 1'b1;
        end 
    end

//sign
    always @(posedge clk)begin
        if(rst || flush) begin
            dividend_s <= 1'b0;
            divisor_s  <= 1'b0;
        end
        else if(div_fire) begin
            dividend_s <= div_signed & dividend[`ysyx_040053_XLEN - 1];
            divisor_s  <= div_signed & divisor[`ysyx_040053_XLEN - 1];
        end
    end

//cnt
    always @(posedge clk) begin
        if(rst || flush || valid_r) begin
            cnt <= 7'b0;
        end
        else if(running_r) begin
            cnt <= cnt + 1'b1;
        end
    end

//calculate
    always @(posedge clk) begin
        if(rst) begin
            udividend_r <= 0;
            udivisor_r <= 0;
        end
        else if(div_fire) begin
            udividend_r <= div_signed & dividend[`ysyx_040053_XLEN - 1] ? {`ysyx_040053_XLEN'b0, dividend_abs} : {`ysyx_040053_XLEN'b0, dividend};
            udivisor_r  <= div_signed & divisor[`ysyx_040053_XLEN - 1]  ? divisor_abs : divisor;
        end
        else if(running_r) begin
            udividend_r <= sub_s ? {udividend_r[`ysyx_040053_XXLEN - 2 : 0],1'b0} : {sub[`ysyx_040053_XLEN - 1:0], udividend_r[`ysyx_040053_XLEN - 2 : 0], 1'b0};
        end
    end 

    adder_XLEN1 suber(.src1(udividend_r[`ysyx_040053_XXLEN - 1: `ysyx_040053_XLEN - 1]),
                      .src2({1'b1,~udivisor_r}),
                      .cin(1'b1),
                      .cout(sub_s),
                      .result(sub)
                      );

    always @(posedge clk) begin
        if(rst || flush || div_fire) begin
            remainder_r <= `ysyx_040053_XLEN'b0;
            quotient_r  <= `ysyx_040053_XLEN'b0;
        end
        else if(done) begin
            remainder_r <= udividend_r[`ysyx_040053_XXLEN - 1: `ysyx_040053_XLEN]; 
            quotient_r  <= quotient_r;
        end
        else if(running_r) begin
            quotient_r <= {quotient_r[`ysyx_040053_XLEN - 2 : 0], ~sub_s};
        end 
    end
//correct result
    assign quotient = dividend_s ^ divisor_s ? ~quotient_r + `ysyx_040053_XLEN'b1 : quotient_r;
    assign remainder = dividend_s ? ~remainder_r + `ysyx_040053_XLEN'b1 : remainder_r;
    
    assign div_ready = ready_r;
    assign out_valid = valid_r;

endmodule

module adder_XLEN1(
    input [`ysyx_040053_XLEN:0] src1,
    input [`ysyx_040053_XLEN:0] src2,
    input cin,
    output cout,
    output [`ysyx_040053_XLEN - 1:0] result
);
assign {cout, result} = src1 + src2 + {`ysyx_040053_XLEN'b0,cin};
endmodule



module ysyx_040053_EXU(
    input clk, rst,
    input [63:0] busa,
    input [63:0] busb,
    input ALUSrcA,
    input [1:0] ALUSrcB,
    input [4:0] ALUOp,
    input [1:0] MulOp,
    input [63:0] pc,
    input [63:0] imm,
    input mwb_block,
    input src_valid,
    output [63:0] ALURes,
    output alu_busy
);
    wire zero;
    wire [63:0] res;
    wire [63:0] alu_inA, alu_inB;
    
    assign alu_inA = (ALUSrcA == 1'b1) ? busa : pc;
    assign alu_inB = (ALUSrcB == 2'b01) ? imm : ((ALUSrcB == 2'b00) ? busb : 4);
    
    ysyx_040053_ALU alu64(
                            .clk(clk),
                            .rst(rst),
                            .src_valid(src_valid),
                            .mwb_block(mwb_block),
                            .alu_busy(alu_busy),
                            .inputa(alu_inA), .inputb(alu_inB), .ALUOp(ALUOp), .MulOp(MulOp), .result(res), .zero(zero));
        //busa + immI; //addi
    assign ALURes = res;
endmodule

//import "DPI-C" function void c_trap(input bit done);

module ysyx_040053_IDU(
    input  [31:0] instr_i,
    input  [63:0] pc,
    input  [63:0] busa, busb,
    input  [63:0] mtvec, mepc,

    output [63:0] dnpc,
    output [4:0]  rd,
    output [4:0]  rs1,
    output [4:0]  rs2,
    output [63:0] imm,
    output ALUSrcA, MemToReg, MemWen,
    output [1:0] ALUSrcB,
    output [2:0] MemOp,
    output [4:0] ALUOp,
    output [1:0] MulOp,
    output wen,
    output Ecall, Mret, Csrwen, CsrToReg,
    output [2:0]CsrOp,
    output [11:0] CsrId,
    output Ebreak,
    output Fence_i,
    output Csri,
    input Time_interrupt
);
    wire [6:0]  op;
    wire [2:0]  func3;
    wire [6:0]  func7;
    wire [2:0] ExtOp;
    wire [2:0] Branch;
    ysyx_040053_InstrToImm insttoimm(instr_i, ExtOp, imm);
    //controler
    ysyx_040053_controler control(.instr_i(instr_i), .op(op), .func3(func3), .func7(func7),
                                 .ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB), 
                                 .Branch(Branch), .MemOp(MemOp), .MemToReg(MemToReg),
                                 .ExtOp(ExtOp), .ALUOp(ALUOp), .wen(wen), .MemWen(MemWen),
                                 .MulOp(MulOp),
                                 .Ecall(Ecall), .Mret(Mret), .Csrwen(Csrwen), .CsrToReg(CsrToReg), .CsrOp(CsrOp), .Ebreak(Ebreak)
                                 ,.Fence_i(Fence_i), .Csri(Csri));
    wire ecall = Ecall;
    assign CsrId = (ecall == 0) ? imm[11:0] : 12'h342;//ecall mcause
    wire [63:0] addr_res;
    wire [63:0] alu_inA, alu_inB;
    
    assign alu_inA = (ALUSrcA == 1'b1) ? busa : pc;
    assign alu_inB = (ALUSrcB == 2'b01) ? imm : ((ALUSrcB == 2'b00) ? busb : 4);
    wire Trap = Time_interrupt | Ecall;
    wire zero = (alu_inA == alu_inB);
    wire res0 = ALUOp[0] ? (alu_inA < alu_inB) : ($signed(alu_inA) < $signed(alu_inB));

    //ysyx_040053_ALU_lite na_alu(.inputa(alu_inA), .inputb(alu_inB), .ALUOp(ALUOp), .result(res), .zero(zero));
    ysyx_040053_NexAddr nextaddr(.mtvec(mtvec), .Trap(Trap), .mepc(mepc), .Mret(Mret),
                                 .Zero(zero), .res0(res0), .Branch(Branch), .pc(pc),
                                 .imm(imm), .busa(busa), .dnpc(addr_res));
    
    assign dnpc = {addr_res[63:1], 1'b0};

    assign op = instr_i[6:0];
    assign rd = instr_i[11:7];
    assign func3 = instr_i[14:12];
    assign rs1 = instr_i[19:15];// : instr_i[11:7];//ecall a7
    assign rs2 = instr_i[24:20];
    assign func7 = instr_i[31:25];

endmodule


module ysyx_040053_IFU(
    input clk,
    input rst,
    input Fence_i,
    input dnpc_valid, block,
    input [63:0] dnpc,
    output reg [63:0] pc,
    output [31:0] instr_o,
    output if_busy,
    
    output [63:0] i_rw_addr_o,
    output i_rw_req_o,
    output i_rw_valid_o,
    input  [127:0] i_data_read_i,
    input  i_rw_ready_i,
    input  id_en_i,
    output i_rw_dev_o,
    output [7:0] i_rw_size_o,
    output [3:0] i_rw_bytes_o,

    output[5:0] io_sram0_addr,
	output io_sram0_cen,
	output io_sram0_wen,
	output[127:0] io_sram0_wdata,
	input[127:0] io_sram0_rdata,

	output[5:0] io_sram1_addr,
	output io_sram1_cen, 
	output io_sram1_wen, 		
	output[127:0] io_sram1_wdata,
	input[127:0] io_sram1_rdata,

	output[5:0] io_sram2_addr,	
	output io_sram2_cen, 
	output io_sram2_wen, 
	output[127:0] io_sram2_wdata, 
	input[127:0] io_sram2_rdata, 

	output[5:0] io_sram3_addr, 
	output io_sram3_cen, 
	output io_sram3_wen, 
	output[127:0] io_sram3_wdata, 
	input[127:0] io_sram3_rdata
);  
    wire cache_idle;
    reg old_instr, cache_doing;
    reg [31:0] instr_read_r;

    wire [63:0] cpu_data_read;
    //wire [63:0] now_pc, rdata, snpc;
    //assign pc = (block == 1'b1 | dnpc_valid == 1'b0) ? now_pc : valid_dnpc;
    //assign snpc = now_pc + 4;
    //always@(*) begin  pmem_read(pc, rdata, 4); end
    //always@(*) begin get_instr(instr_o); end
    assign instr_o = (id_en_i && old_instr) ? instr_read_r : ((pc[2]) ? cpu_data_read[63:32] : cpu_data_read[31:0]);//(pc[2] == 0) ? rdata[31:0] : rdata[63:32];
    assign i_rw_size_o = (pc[2] == 1'b0) ? 8'h0f : 8'hf0; 
    assign i_rw_bytes_o = 4'h4;
   // wire [63:0] valid_dnpc = (dnpc_valid == 1'b0) ? snpc : dnpc;
    wire pcen = ~block & dnpc_valid;

    always @(posedge clk)begin
        if(rst) begin
            pc <= 64'h30000000;
        end
        else if(pcen) begin
            pc <= dnpc;
        end
    end

    //ysyx_040053_Reg #(64, 64'h80000000) PC(.clk(clk), .rst(rst), valid_dnpc, pc, pcen);
    //未取到：取指令
    //取到了：不取
    wire i_cpu_ready;
    wire cpu_req_valid;
    always @(posedge clk) begin
        if(rst || id_en_i) begin
            old_instr <= 1'b0;
        end
        else if(i_cpu_ready && !id_en_i) begin
            old_instr <= 1'b1;
        end
    end

    reg start;
    always @(posedge clk)begin
        if(rst) begin
            start <= 1'b1;
        end
        else start <= 1'b0;
    end
    always @(posedge clk) begin
        if(rst) begin
            cache_doing <= 1'b0;
            instr_read_r <= 0;
        end
        else if(i_cpu_ready) begin
            cache_doing <= 1'b0;
            instr_read_r <= (pc[2]) ? cpu_data_read[63:32] : cpu_data_read[31:0];
        end
        else if(cpu_req_valid && cache_idle) begin
            cache_doing <= 1'b1;
        end
    end
    wire [63:0] cache_pc = (cpu_req_valid) ? dnpc : pc;
    assign cpu_req_valid = start | (!cache_doing && !i_cpu_ready && !old_instr && !Fence_i);// && !(dnpc[31:28] == 4'h8 && dnpc_valid && pc[31:28] == 4'h3));
    assign if_busy = (!i_cpu_ready && !old_instr && !Fence_i);
    wire cpu_dev = (cache_pc[31:28] == 4'h3);
    assign i_rw_dev_o = cpu_dev;
    wire flush = rst | Fence_i;
    
    ysyx_040053_icache icache(
         clk,flush,
        //cpu<->cache
         cache_pc,cpu_req_valid,cpu_data_read,i_cpu_ready,cache_idle,
         //cache<->memory
         i_rw_addr_o, i_rw_req_o,i_rw_valid_o,i_data_read_i,i_rw_ready_i,
         cpu_dev,
         io_sram0_addr,io_sram0_cen,io_sram0_wen,io_sram0_wdata,io_sram0_rdata,
         io_sram1_addr,io_sram1_cen,io_sram1_wen,io_sram1_wdata,io_sram1_rdata,
         io_sram2_addr,io_sram2_cen,io_sram2_wen,io_sram2_wdata,io_sram2_rdata, 
         io_sram3_addr,io_sram3_cen,io_sram3_wen,io_sram3_wdata,io_sram3_rdata
    );
    //assign rdata = cpu_data_read_r;
endmodule


module ysyx_040053_InstrToImm(
	input [31:0] instr,
    input [2:0] ExtOp,
    output reg [63:0] imm
);
	always @(*) begin
		case(ExtOp)
			0: begin // I-type
				imm = {{52{instr[31]}}, instr[31:20]};                               		
			end
			1: begin // U-type
				imm = {{32{instr[31]}},instr[31:12], 12'b0};
			end
			2: begin // S-type
				imm = {{52{instr[31]}}, instr[31:25], instr[11:7]};                  
			end
			3: begin // B-type
				imm = {{52{instr[31]}}, instr[7], instr[30:25], instr[11:8],1'b0};   
			end
			4: begin // J-type
				imm = {{44{instr[31]}}, instr[19:12], instr[20], instr[30:21],1'b0}; 
			end
			default: begin // R-type
				imm = 0;
			end
		endcase
	end
endmodule



module ysyx_040053_Mem(
    input clk,
    input rst,
    input [2:0] MemOp,
    input [63:0] raddr, wdata,
    input MemWen,
    input vis_mem,
    input req_rw,
    output reg [63:0] rdata,
    output m_busy,
    output [63:0]     d_rw_addr_o,
    output            d_rw_req_o,
    output            d_rw_valid_o,
    output [127:0]    d_rw_w_data_o,
    output [7:0]      d_rw_size_o,
    output            d_rw_dev_o,
    input  [127:0]    d_data_read_i,
    input             d_rw_ready_i,
    output reg [3:0]  d_rw_bytes_o,
    input Fence_i,
    output is_cmp,

    output[5:0] io_sram4_addr, 
	output io_sram4_cen, 
	output io_sram4_wen, 
	output[127:0] io_sram4_wdata, 
	input[127:0] io_sram4_rdata, 

	output[5:0] io_sram5_addr, 
	output io_sram5_cen, 
	output io_sram5_wen, 
	output[127:0] io_sram5_wdata, 
	input[127:0] io_sram5_rdata, 

	output[5:0] io_sram6_addr, 
	output io_sram6_cen, 
	output io_sram6_wen, 
	output[127:0] io_sram6_wdata, 
	input[127:0] io_sram6_rdata, 
    
	output[5:0] io_sram7_addr, 
	output io_sram7_cen, 
	output io_sram7_wen, 
	output[127:0] io_sram7_wdata,
	input[127:0] io_sram7_rdata
);
//不支持不对齐访问
    wire [63:0] dataout;
    reg [7:0] wmask;
    wire [2:0] offs = raddr[2:0];
    //integer st_bit = {{26{1'b0}},raddr[2:0],{3{1'b0}}};
    wire [63:0] wdatad = wdata[63:0];
    wire [31:0] wdataw = wdata[31:0];
    wire [15:0] wdatah = wdata[15:0];
    wire [7:0]  wdatab = wdata[7:0];
    reg [63:0] datain;

    wire [63:0] cpu_req_addr = raddr;
    wire cpu_req_rw = req_rw;
    wire cpu_req_valid;
    wire [63:0] cpu_data_write = datain;
    wire [7:0]  cpu_wmask = wmask;
    wire cache_idle;

    wire d_cpu_ready;
    wire [63:0] cpu_data_read;
    reg cache_doing;

    wire vis_dev = (raddr[31:24] == 8'h2);//0x 0200 0000
    wire vis_clint = (raddr[31:24] == 8'h2);
    wire clint_wen = MemWen & vis_clint;
    wire [63:0] clint_rdata;
    ysyx_040053_CLint clint(
        .clk(clk),.rst(rst),.clint_wen(clint_wen),.wdata(wdata),.rdata(clint_rdata),.is_cmp(is_cmp)
    );

    assign d_rw_dev_o = (raddr[31:28] == 4'h1) || (raddr[31:28] == 4'h2) || (raddr[31:28] == 4'h3) || (raddr[31:28] == 4'h4) || (raddr[31:28] == 4'h5) || (raddr[31:28] == 4'h6) || (raddr[31:28] == 4'h7);
    wire cpu_dev = d_rw_dev_o;//(raddr[31:28] == 4'h1) || (raddr[31:28] == 4'h3) || (raddr[31:28] == 4'h4);
    always @(posedge clk) begin
        if(rst) begin
            cache_doing <= 1'b0;
        end
        else if(d_cpu_ready) begin
            cache_doing <= 1'b0;
        end
        else if(cpu_req_valid && cache_idle) begin
            cache_doing <= 1'b1;
        end
    end
    assign cpu_req_valid = (!cache_doing && !d_cpu_ready && vis_mem && !vis_dev);
    assign m_busy = (!d_cpu_ready && vis_mem && !vis_dev);

    ysyx_040053_dcache dcache(
      clk,rst,
    //cpu<->cache
      cpu_req_addr,cpu_req_rw,cpu_req_valid,cpu_data_write,cpu_wmask,cpu_data_read,d_cpu_ready,cache_idle,
    //cache<->memory
      d_rw_addr_o,d_rw_req_o,d_rw_valid_o,d_rw_w_data_o,d_data_read_i,d_rw_ready_i,
    //fence.i
      Fence_i, d_rw_size_o, cpu_dev,
      io_sram4_addr,io_sram4_cen,io_sram4_wen,io_sram4_wdata,io_sram4_rdata,
      io_sram5_addr,io_sram5_cen,io_sram5_wen,io_sram5_wdata,io_sram5_rdata,
      io_sram6_addr,io_sram6_cen,io_sram6_wen,io_sram6_wdata,io_sram6_rdata, 
      io_sram7_addr,io_sram7_cen,io_sram7_wen,io_sram7_wdata,io_sram7_rdata
    );
    //wire [63:0] dev_dataout;
    assign dataout = (vis_clint) ? clint_rdata : cpu_data_read;
    /*
    always @(*) begin
        pmem_read(raddr, dev_dataout, bytes);
    end
    always @(posedge clk) begin
        if(vis_dev && !vis_clint && MemWen == 1'b1) pmem_write(raddr, datain, wmask);
    end
    */
    always@(*) begin
        case(MemOp[1:0])
            2'b00: d_rw_bytes_o = 4'h4;
            2'b01: d_rw_bytes_o = 4'h1;
            2'b10: d_rw_bytes_o = 4'h2;
            default: d_rw_bytes_o = 4'h8;
        endcase
    end
    //write
    always@(*) begin
        case(MemOp[1:0])
            2'b00: begin //4byte
                case(offs)
                    3'b000: wmask = 8'h0f;
                    3'b100: wmask = 8'hf0;
                    default: wmask = 8'h00;
                endcase
                datain = {wdataw, wdataw};
            end   
            2'b01: begin //1byte
                case(offs)
                    3'b000: wmask = 8'h01;
                    3'b001: wmask = 8'h02;
                    3'b010: wmask = 8'h04;
                    3'b011: wmask = 8'h08;
                    3'b100: wmask = 8'h10;
                    3'b101: wmask = 8'h20;
                    3'b110: wmask = 8'h40;                   
                    default: wmask = 8'h80;
                endcase
                datain = {wdatab, wdatab, wdatab, wdatab, wdatab, wdatab, wdatab, wdatab};
            end
            2'b10: begin //2byte
                case(offs)
                    3'b000: wmask = 8'h03;
                    3'b010: wmask = 8'h0c;
                    3'b100: wmask = 8'h30;
                    3'b110: wmask = 8'hc0;                
                    default: wmask = 8'h00;
                endcase
                datain = {wdatah, wdatah, wdatah, wdatah};
            end
            default: begin//8byte
                datain = wdatad;
                wmask = 8'hff;
            end
        endcase
    end

    wire [63:0] datad;
    wire [31:0] dataw;
    wire [15:0] datah;
    wire [7:0]  datab;
    //read
    assign dataw = dataout[offs*8+: 32];
    assign datab = dataout[offs*8+: 8];
    assign datah = dataout[offs*8+: 16];
    assign datad = dataout;

    always@(*) begin
        case(MemOp)
            3'b000: rdata = {{32{dataw[31]}},dataw};
            3'b001: rdata = {{56{datab[7]}},datab};
            3'b010: rdata = {{48{datah[15]}},datah};
            3'b011: rdata = datad;
            3'b100: rdata = {{32{1'b0}},dataw};
            3'b101: rdata = {{56{1'b0}},datab};
            3'b110: rdata = {{48{1'b0}},datah};
            default: rdata = 0;
        endcase
    end
endmodule
module ysyx_040053_CLint(
    input clk,
    input rst,
    input clint_wen,
    input [63:0] wdata,
    output [63:0] rdata,
    output is_cmp
);
    reg [63:0] mtime, mtimecmp;
    assign rdata = mtimecmp;
    assign is_cmp = (mtime >= mtimecmp);
    
    always @(posedge clk) begin
        if(rst) begin
            mtime <= 0;
        end
        else begin
            mtime <= mtime + 1;
        end
    end

    always @(posedge clk) begin
        if(rst) begin
            mtimecmp <= 0;
        end
        else if(clint_wen) begin
            mtimecmp <= wdata;
        end
    end
endmodule



`define ysyx_040053_COMPUTER_WIDTH 64
//32
`define ysyx_040053_WIDTH 66
//34
// `ysyx_040053_COMPUTER_WIDTH+2

module ysyx_040053_mulu (
  input  clk,
  input  rst,
  input  [`ysyx_040053_COMPUTER_WIDTH:0] multiplicand,//33bits * 33bits
  input  [`ysyx_040053_COMPUTER_WIDTH:0] multiplier,
  input         mul_valid,
  output reg    mul_ready,
  output reg    out_valid,
  output [`ysyx_040053_COMPUTER_WIDTH*2-1:0] result
);
//`ysyx_040053_WIDTH = 34
//68bits
//32+1+1+1bits
    reg [`ysyx_040053_WIDTH*2-1:0] tmp_result, multiplicand_r;//68
    reg [`ysyx_040053_WIDTH:0] multiplier_r;//34+1
    reg running_r;
    wire mul_fire, done;
    wire [`ysyx_040053_WIDTH*2-1:0] p_result;
    reg [6:0] cnt;
//cnt
    always @(posedge clk) begin
        if(rst || out_valid) begin
            cnt <= 7'b0;
        end
        else if(running_r) begin
            cnt <= cnt + 1'b1;
        end
    end

    assign mul_fire = mul_valid && mul_ready;
//whether running
    always @(posedge clk) begin
        if(rst) begin
            running_r <= 1'b0;
        end
        else if(mul_fire) begin
            running_r <= 1'b1;
        end
        else if(done) begin
            running_r <= 1'b0;
        end    
    end
//valid and ready
    always @(posedge clk) begin
        if(rst) begin
            mul_ready <= 1'b1;
        end
        else if(mul_fire) begin
            mul_ready <= 1'b0;
        end
        else if(out_valid) begin
            mul_ready <= 1'b1;
        end    
    end

    always @(posedge clk) begin
        if(rst) begin
            out_valid <=1'b0;
        end   
        else if(out_valid)  begin
            out_valid <=1'b0;
        end
        else if(done) begin
            out_valid <= 1'b1;
        end
    end

//calculate multiplicand_r and multiplier_r
    always @(posedge clk) begin
        if(rst) begin
            multiplicand_r <= 0;
            multiplier_r <= 0;
        end
        else if(mul_fire) begin
            multiplicand_r <= {{`ysyx_040053_WIDTH{multiplicand[`ysyx_040053_COMPUTER_WIDTH]}},multiplicand[`ysyx_040053_COMPUTER_WIDTH],multiplicand};
            //68  

            multiplier_r <= {multiplier[`ysyx_040053_COMPUTER_WIDTH],multiplier,1'b0};// lowest bit is 0;
            //34+1
        end
        else if(running_r) begin //multiplicand_r << 2,  multiplier_r >> 2
            multiplicand_r <= {multiplicand_r[`ysyx_040053_WIDTH*2-3:0],2'b0};//65:0->66
            multiplier_r <= {2'b0,multiplier_r[`ysyx_040053_WIDTH:2]};
        end
    end

    assign done = running_r && (cnt == 7'h20 ||multiplier_r[`ysyx_040053_WIDTH:0] == {{`ysyx_040053_WIDTH{1'b0}},1'b0});//34 == 34
   
    wire partial_cout;
    ysyx_040053_partial partial(.x_src(multiplicand_r),.y_src(multiplier_r[2:0]),.p_result(p_result),.cout(partial_cout));
//33 32 31
//7 6 5 4 3 2 1 0 -1
// `ysyx_040053_WIDTH*2-bit adder
    wire [`ysyx_040053_WIDTH*2-1:0] adder_result;
    wire adder_cout;
    assign {adder_cout, adder_result} = p_result + tmp_result + {{`ysyx_040053_WIDTH*2-1{1'b0}},partial_cout};

// Temporary Results or Final Results
    always @(posedge clk) begin
        if(mul_fire) begin
            tmp_result <= {`ysyx_040053_WIDTH*2{1'b0}};
        end
        else if(running_r) begin
            tmp_result <= adder_result;
        end
    end

    assign result = tmp_result[127:0];

endmodule

module ysyx_040053_sel_gen(
  input [2:0] src,
  output [3:0] sel
);
    ///y+1,y,y-1///
    wire y_add,y,y_sub;
    wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;

    assign {y_add,y,y_sub} = src;

    assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
    assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
    assign sel_double_negative =  y_add & ~y & ~y_sub;
    assign sel_double_positive = ~y_add &  y &  y_sub;

    assign sel = {sel_negative,sel_positive,sel_double_negative,sel_double_positive};
endmodule

module ysyx_040053_res_sel(
  input [3:0] sel,
  input [1:0] src,
  output p 
);
    ////x,x-1////
    wire x,x_sub;
    wire sel_negative, sel_double_negative, sel_positive, sel_double_positive;
    assign {sel_negative,sel_positive,sel_double_negative,sel_double_positive} = sel;
    assign {x,x_sub} =src;
    assign p = ~(~(sel_negative & ~x) & ~(sel_double_negative & ~x_sub) 
            & ~(sel_positive & x ) & ~(sel_double_positive &  x_sub));
endmodule

module ysyx_040053_partial(
  input [2*`ysyx_040053_WIDTH-1:0]  x_src,
  input [2:0] y_src,
  output [2*`ysyx_040053_WIDTH-1:0]   p_result,
  output  cout
);

    ///y+1,y,y-1///

    wire [3:0] sel;
    wire sel_negative = sel[3];
    wire sel_double_negative = sel[1];

    assign cout = sel_negative || sel_double_negative;
    ysyx_040053_sel_gen sel_gen(.src(y_src),.sel(sel));

    ysyx_040053_res_sel p_res0(.sel (sel), .src ({x_src[0],1'b0}), .p (p_result[0]));
    genvar x;
    generate 
        for ( x = 1; x < `ysyx_040053_WIDTH * 2; x = x + 1) begin
            ysyx_040053_res_sel p_res(.sel (sel), .src (x_src[x:x-1]), .p (p_result[x]));
        end 
    endgenerate
endmodule



module ysyx_040053_MU(
    input clk, rst,
    input [2:0] MemOp,
    input MemToReg,//1->load, 0-> not load or not valid
    input MemWen,//1->save, 0-> not save or not valid
    input CsrToReg,
    input [63:0] raddr,//load指令的读取地址，save指令的waddr，其他指令的ALURes
    input [63:0] wdata,
    input [63:0] csrres,
    output [63:0] rfdata,
    output m_busy,
    output [63:0]     d_rw_addr_o,
    output            d_rw_req_o,//
    output            d_rw_valid_o,
    output [127:0]    d_rw_w_data_o,
    input  [127:0]    d_data_read_i,//finish burst
    input             d_rw_ready_i,
    output [7:0]      d_rw_size_o,
    output            d_rw_dev_o,
    output [3:0]      d_rw_bytes_o,
    input Fence_i,
    output is_cmp,


    output[5:0] io_sram4_addr, 
	output io_sram4_cen, 
	output io_sram4_wen, 
	output[127:0] io_sram4_wdata, 
	input[127:0] io_sram4_rdata, 

	output[5:0] io_sram5_addr, 
	output io_sram5_cen, 
	output io_sram5_wen, 
	output[127:0] io_sram5_wdata, 
	input[127:0] io_sram5_rdata, 

	output[5:0] io_sram6_addr, 
	output io_sram6_cen, 
	output io_sram6_wen, 
	output[127:0] io_sram6_wdata, 
	input[127:0] io_sram6_rdata, 
    
	output[5:0] io_sram7_addr, 
	output io_sram7_cen, 
	output io_sram7_wen, 
	output[127:0] io_sram7_wdata,
	input[127:0] io_sram7_rdata
);
    wire vis_mem = MemToReg | MemWen | Fence_i;
    wire req_rw  = ~MemToReg;
    wire [63:0] mdata, regsin;
    ysyx_040053_Mem mem(.clk(clk),.rst(rst), .MemOp(MemOp), .raddr(raddr), .MemWen(MemWen),.req_rw(req_rw), .wdata(wdata), .rdata(mdata), .vis_mem(vis_mem)
        ,.m_busy(m_busy), .d_rw_addr_o(d_rw_addr_o), .d_rw_req_o(d_rw_req_o), .d_rw_valid_o(d_rw_valid_o), .d_rw_w_data_o(d_rw_w_data_o),
        .d_data_read_i(d_data_read_i), .d_rw_ready_i(d_rw_ready_i),.Fence_i(Fence_i), .is_cmp(is_cmp),
        .d_rw_size_o(d_rw_size_o), .d_rw_dev_o(d_rw_dev_o),.d_rw_bytes_o(d_rw_bytes_o),
        .io_sram4_addr(io_sram4_addr),.io_sram4_cen(io_sram4_cen),.io_sram4_wen(io_sram4_wen),.io_sram4_wdata(io_sram4_wdata),.io_sram4_rdata(io_sram4_rdata),
        .io_sram5_addr(io_sram5_addr),.io_sram5_cen(io_sram5_cen),.io_sram5_wen(io_sram5_wen),.io_sram5_wdata(io_sram5_wdata),.io_sram5_rdata(io_sram5_rdata),
        .io_sram6_addr(io_sram6_addr),.io_sram6_cen(io_sram6_cen),.io_sram6_wen(io_sram6_wen),.io_sram6_wdata(io_sram6_wdata),.io_sram6_rdata(io_sram6_rdata),
        .io_sram7_addr(io_sram7_addr),.io_sram7_cen(io_sram7_cen),.io_sram7_wen(io_sram7_wen),.io_sram7_wdata(io_sram7_wdata),.io_sram7_rdata(io_sram7_rdata)
    );//M
    
    assign regsin = (MemToReg == 1'b0) ? raddr : mdata;//WB
    assign rfdata = (CsrToReg == 1'b0) ? regsin : csrres;//WB
endmodule



module ysyx_040053_NexAddr(
    input Zero, res0,
    input [2:0] Branch,
    input [63:0] pc, imm, busa, mepc, mtvec,
    input Mret, Trap,
    output [63:0] dnpc
);
    reg NexA, NexB;//A:0:pc,1:busa //B: 0:4, 1:imm
    wire [63:0] SrcA, SrcB;
    always@(*) begin
        case(Branch)
            3'b001: begin NexA = 1'b0; NexB = 1'b1; end
            3'b010: begin NexA = 1'b1; NexB = 1'b1; end
            3'b100: begin NexA = 1'b0; NexB = Zero; end
            3'b101: begin NexA = 1'b0; NexB = ~Zero; end
            3'b110: begin NexA = 1'b0; NexB = res0; end
            3'b111: begin NexA = 1'b0; NexB = Zero | (~res0); end
            default: begin NexA = 1'b0; NexB = 1'b0; end
        endcase
    end
    assign SrcA = (NexA == 1'b0) ? pc : busa;
    assign SrcB = (NexB == 1'b0) ? 4 : imm;
    wire [63:0] respc;
    wire pc_cout,of_miss,sf_miss,cf_miss,zf_miss;
    ysyx_040053_Adder64 pcadder(.result(respc), .x(SrcA), .y(SrcB), .sub(1'b0), .cout(pc_cout), .OF(of_miss), .CF(cf_miss), .SF(sf_miss), .ZF(zf_miss));
    assign dnpc = (Trap == 1'b0) ? ((Mret == 1'b0) ? respc : mepc) : mtvec;
 //   always@(*) begin
  //      $display("pc = %x, dnpc=%x",pc,dnpc);
  //  end
endmodule



module ysyx_040053_ID_Reg(
//control
    input clk,
    input flush,
    input valid_i,
    input enable,
    output valid_o,
//data
    input  [63:0] pc_i,
    input  [31:0] instr_i,
    output [63:0] pc_o,
    output [31:0] instr_o
);
    reg valid_r;
    reg [31:0] instr_r;
    reg [63:0] pc_r;
    //control_r
    always@(posedge clk) begin
        if(flush) begin
            valid_r <= 1'b0;
        end
        else if(enable) valid_r <= valid_i;
    end
    //data_r
    always@(posedge clk) begin
        if(flush) begin
            instr_r <= 32'b0;
            pc_r    <= 64'b0;
        end
        else if(enable) begin
            instr_r <= instr_i;
            pc_r    <= pc_i;
        end
    end
    assign instr_o = instr_r;
    assign pc_o    = pc_r;
    assign valid_o = valid_r;
endmodule

module ysyx_040053_EX_Reg(
//control
    input clk,
    input flush,
    input valid_i,
    input enable,
    output valid_o,
//data
    input  [63:0] pc_i,
    input  [31:0] instr_i,
    output [63:0] pc_o,
    output [31:0] instr_o,

    input [4:0]  rd_i,
    input [63:0] busa_i, busb_i,
    input [63:0] imm_i,
    input ALUSrcA_i, MemToReg_i, MemWen_i,
    input [1:0] ALUSrcB_i,
    input [2:0] MemOp_i,
    input [4:0] ALUOp_i,
    input [1:0] MulOp_i,
    input wen_i,
    input CsrToReg_i,
    input [63:0] Csrres_i,
    input Ebreak_i,
    input Fence_i_i,

    output Fence_i_o,
    output Ebreak_o,
    output [63:0] Csrres_o,
    output [4:0] rd_o,
    output [63:0] busa_o, busb_o,
    output wen_o, ALUSrcA_o, MemToReg_o, MemWen_o, CsrToReg_o,
    output [1:0] ALUSrcB_o,
    output [4:0] ALUOp_o,
    output [2:0] MemOp_o,
    output [1:0] MulOp_o,
    output [63:0] imm_o

    ,input  [63:0] dnpc_i,
    output reg [63:0] dnpc_o
);
    reg valid_r;
    reg [31:0] instr_r;
    reg [63:0] pc_r;
    reg [4:0]  rd_r;
    reg [63:0] busa_r, busb_r;
    reg [63:0] imm_r;
    reg ALUSrcA_r;
    reg MemToReg_r;
    reg MemWen_r;
    reg wen_r;
    reg CsrToReg_r;
    reg [1:0] ALUSrcB_r;
    reg [2:0] MemOp_r;
    reg [4:0] ALUOp_r;
    reg [1:0] MulOp_r;
    reg [63:0] Csrres_r;
    reg Ebreak_r;
    reg Fence_i_r;
    //control_r
    always@(posedge clk) begin
        if(flush)begin
            valid_r <= 1'b0;
        end
        else if(enable) valid_r <= valid_i;
    end
    //data_r
    always@(posedge clk) begin
        if(flush)begin
            instr_r    <= 32'b0;
            pc_r       <= 64'b0;
            rd_r       <= 5'b0;
            busa_r     <= 64'b0;
            busb_r     <= 64'b0;
            imm_r      <= 64'b0;
            ALUSrcA_r  <= 1'b0;
            MemToReg_r <= 1'b0;
            MemWen_r   <= 1'b0;
            wen_r      <= 1'b0;
            CsrToReg_r <= 1'b0;
            ALUSrcB_r  <= 2'b0;
            MemOp_r    <= 3'b0;
            ALUOp_r    <= 5'b0;
            MulOp_r    <= 2'b0;
            Csrres_r   <= 64'b0;
            Ebreak_r   <= 1'b0;
            Fence_i_r  <= 1'b0;
            
            dnpc_o <=0;
        end
        else if(enable)begin
            instr_r    <= instr_i;
            pc_r       <= pc_i;
            rd_r       <= rd_i;
            busa_r      <= busa_i;
            busb_r      <= busb_i;
            imm_r      <= imm_i;
            ALUSrcA_r  <= ALUSrcA_i;
            MemToReg_r <= MemToReg_i;
            MemWen_r   <= MemWen_i;
            wen_r      <= wen_i;
            CsrToReg_r <= CsrToReg_i;
            ALUSrcB_r  <= ALUSrcB_i;
            MemOp_r    <= MemOp_i;
            ALUOp_r    <= ALUOp_i;
            MulOp_r    <= MulOp_i;
            Csrres_r   <= Csrres_i;
            Ebreak_r   <= Ebreak_i;
            Fence_i_r  <= Fence_i_i;

            dnpc_o <=dnpc_i;
        end
    end
    assign instr_o = instr_r;
    assign pc_o    = pc_r;
    assign valid_o = valid_r;
    assign rd_o    = rd_r;
    assign busa_o    = busa_r;
    assign busb_o    = busb_r;
    assign wen_o = wen_r;
    assign ALUSrcA_o = ALUSrcA_r;
    assign MemToReg_o = MemToReg_r;
    assign MemWen_o = MemWen_r;
    assign CsrToReg_o = CsrToReg_r;
    assign ALUSrcB_o = ALUSrcB_r;
    assign ALUOp_o = ALUOp_r;
    assign MemOp_o = MemOp_r;
    assign MulOp_o = MulOp_r;
    assign imm_o = imm_r;
    assign Csrres_o = Csrres_r;
    assign Ebreak_o = Ebreak_r;
    assign Fence_i_o = Fence_i_r;
endmodule

module ysyx_040053_M_Reg(
//control
    input clk,
    input flush,
    input valid_i,
    input enable,
    output valid_o,
//data
    input  [63:0] pc_i,
    input  [31:0] instr_i,
    output [63:0] pc_o,
    output [31:0] instr_o,

    input [2:0]  MemOp_i,
    input [63:0] raddr_i,
    input MemWen_i,
    input [63:0] wdata_i,
    input [63:0] Csrres_i,
    input [4:0]  rd_i,
    input wen_i, MemToReg_i, CsrToReg_i,
    input Ebreak_i,
    input Fence_i_i,

    output Fence_i_o,
    output Ebreak_o,
    output [4:0] rd_o,
    output wen_o, MemToReg_o, CsrToReg_o,
    output [2:0]  MemOp_o,
    output [63:0] raddr_o,
    output MemWen_o,
    output [63:0] wdata_o,
    output [63:0] Csrres_o


    ,input  [63:0] dnpc_i,
    output reg [63:0] dnpc_o
);
    reg valid_r;
    reg [31:0] instr_r;
    reg [63:0] pc_r;
    reg [2:0]  MemOp_r;
    reg [63:0] raddr_r;
    reg MemWen_r;
    reg [63:0] wdata_r;
    reg [63:0] Csrres_r;
    reg [4:0]  rd_r;
    reg wen_r;
    reg MemToReg_r;
    reg CsrToReg_r;
    reg Ebreak_r;
    reg Fence_i_r;
    //control_r
    always@(posedge clk) begin
        if(flush)begin
            valid_r <= 1'b0;
        end
        else if(enable) valid_r <= valid_i;
    end
    //data_r
    always@(posedge clk) begin
        if(flush)begin
            instr_r  <= 32'b0;
            pc_r     <= 64'b0;
            MemOp_r  <= 3'b0;
            raddr_r  <= 64'b0;
            MemWen_r <= 1'b0;
            wdata_r  <= 64'b0; 
            Csrres_r  <= 64'b0;
            rd_r     <= 5'b0;
            wen_r    <= 1'b0;
            MemToReg_r <= 1'b0;
            CsrToReg_r <= 1'b0;
            Ebreak_r  <= 1'b0;
            Fence_i_r <= 1'b0;

            dnpc_o <= 0;
        end
        else if(enable)begin
            instr_r  <= instr_i;
            pc_r     <= pc_i;
            MemOp_r  <= MemOp_i;
            raddr_r  <= raddr_i;
            MemWen_r <= MemWen_i;
            wdata_r  <= wdata_i; 
            Csrres_r  <= Csrres_i;
            rd_r     <= rd_i;
            wen_r    <= wen_i;
            MemToReg_r <= MemToReg_i;
            CsrToReg_r <= CsrToReg_i;
            Ebreak_r <= Ebreak_i;
            Fence_i_r <= Fence_i_i;

            dnpc_o <= dnpc_i;
        end
    end
    assign instr_o = instr_r;
    assign pc_o    = pc_r;
    assign valid_o = valid_r;
    assign MemOp_o = MemOp_r;
    assign raddr_o = raddr_r;
    assign MemWen_o = MemWen_r;
    assign wdata_o = wdata_r;
    assign Csrres_o = Csrres_r;
    assign rd_o    = rd_r;
    assign wen_o = wen_r;
    assign MemToReg_o = MemToReg_r;
    assign CsrToReg_o = CsrToReg_r;
    assign Ebreak_o = Ebreak_r;
    assign Fence_i_o = Fence_i_r;
endmodule

module ysyx_040053_WB_Reg(
//control
    input clk,
    input flush,
    input valid_i,
    input enable,
    output valid_o,
//data
    input  [63:0] pc_i,
    input  [31:0] instr_i,
    output [63:0] pc_o,
    output [31:0] instr_o,
    
    input  wen_i,
    input  [63:0] wdata_i,
    input  [4:0] waddr_i,
    input Ebreak_i,
    input Fence_i_i,

    output Fence_i_o,
    output Ebreak_o,
    output wen_o,
    output [63:0] wdata_o,
    output [4:0] waddr_o

    ,input  [63:0] dnpc_i,
    output reg [63:0] dnpc_o
    ,input  dev_i,
    output reg dev_o
);
    reg valid_r;
    reg [31:0] instr_r;
    reg [63:0] pc_r;
    reg wen_r;
    reg [63:0] wdata_r;
    reg [4:0] waddr_r;
    reg Ebreak_r;
    reg Fence_i_r;
    //control_r
    always@(posedge clk) begin
        if(flush)begin
            valid_r <= 1'b0;
        end
        else if(enable) valid_r <= valid_i;
    end
    //data_r
    always@(posedge clk) begin
        if(flush)begin
            instr_r <= 32'b0;
            pc_r    <= 64'b0;
            wen_r   <= 1'b0;
            wdata_r <= 64'b0;
            waddr_r <= 5'b0;
            Ebreak_r <= 1'b0;
            Fence_i_r <= 1'b0;

            dnpc_o <= 0;
            dev_o <= 0;
        end
        else if(enable)begin
            instr_r <= instr_i;
            pc_r    <= pc_i;
            wen_r   <= wen_i;
            wdata_r <= wdata_i;
            waddr_r <= waddr_i;
            Ebreak_r <= Ebreak_i;
            Fence_i_r <= Fence_i_i;

            dnpc_o <= dnpc_i;
            dev_o <= dev_i;
        end
    end
    assign instr_o = instr_r;
    assign pc_o    = pc_r;
    assign valid_o = valid_r;
    assign wen_o   = wen_r;
    assign wdata_o = wdata_r;
    assign waddr_o = waddr_r;
    assign Ebreak_o = Ebreak_r;
    assign Fence_i_o = Fence_i_r;
endmodule



module ysyx_040053_Shifter(
    input [63:0] din,
    input [5:0] shamt,
    input AL,
    input LR,
    output reg [63:0] dout
);
    wire sgn; assign sgn = (AL == 1'b1) ? din[63] : 1'b0;
    integer i;
    always @(*) begin
        if(LR == 0) begin // left shift
            for (i = 0; i <= 63; i = i + 1) begin
                if(i >= shamt) dout[i] = din[i - {26'b0, shamt}]; else dout[i] = 1'b0;
            end
        end
        else begin // right shift 
            for (i = 0; i <= 63; i= i + 1) begin
                if(i >= 64 - {26'b0, shamt}) dout[i] = sgn; else dout[i] = din[i + {26'b0, shamt}];
            end
        end
    end
endmodule

module ysyx_040053_Reg #(WIDTH = 1, RESET_VAL = 0) (
  input clk,
  input rst,
  input [WIDTH-1:0] din,
  output reg [WIDTH-1:0] dout,
  input wen
);
  always @(posedge clk) begin
    if(rst) dout <= RESET_VAL;
    else if(wen) dout <= din;
  end
endmodule

module ysyx_040053_MuxKeyInternal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1, HAS_DEFAULT = 0) (
  output reg [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  localparam PAIR_LEN = KEY_LEN + DATA_LEN;
  wire [PAIR_LEN-1:0] pair_list [NR_KEY-1:0];
  wire [KEY_LEN-1:0] key_list [NR_KEY-1:0];
  wire [DATA_LEN-1:0] data_list [NR_KEY-1:0];

  generate
    for (genvar n = 0; n < NR_KEY; n = n + 1) begin
      assign pair_list[n] = lut[PAIR_LEN*(n+1)-1 : PAIR_LEN*n];
      assign data_list[n] = pair_list[n][DATA_LEN-1:0];
      assign key_list[n]  = pair_list[n][PAIR_LEN-1:DATA_LEN];
    end
  endgenerate

  reg [DATA_LEN-1 : 0] lut_out;
  reg hit;
  integer i;
  always @(*) begin
    lut_out = 0;
    hit = 0;
    for (i = 0; i < NR_KEY; i = i + 1) begin
      lut_out = lut_out | ({DATA_LEN{key == key_list[i]}} & data_list[i]);
      hit = hit | (key == key_list[i]);
    end
    if(!HAS_DEFAULT) out = lut_out;
    else out = (hit ? lut_out : default_out);
  end
endmodule

// 不带默认值的选择器模板
module ysyx_040053_MuxKey #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_040053_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 0) i0 (out, key, {DATA_LEN{1'b0}}, lut);
endmodule

// 带默认值的选择器模板
module ysyx_040053_MuxKeyWithDefault #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_040053_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 1) i0 (out, key, default_out, lut);
endmodule
module ysyx_040053_mux21(a,b,s,y);
  input   a,b,s;
  output  y;

  // 通过MuxKey实现如下always代码
  // always @(*) begin
  //  case (s)
  //    1'b0: y = a;
  //    1'b1: y = b;
  //  endcase
  // end
  ysyx_040053_MuxKey #(2, 1, 1) i0 (y, s, {
    1'b0, a,
    1'b1, b
  });
endmodule

module ysyx_040053_mux41(a,s,y);
  input  [3:0] a;
  input  [1:0] s;
  output y;

  // 通过MuxKeyWithDefault实现如下always代码
  // always @(*) begin
  //  case (s)
  //    2'b00: y = a[0];
  //    2'b01: y = a[1];
  //    2'b10: y = a[2];
  //    2'b11: y = a[3];
  //    default: y = 1'b0;
  //  endcase
  // end
  ysyx_040053_MuxKeyWithDefault #(4, 2, 1) i0 (y, s, 1'b0, {
    2'b00, a[0],
    2'b01, a[1],
    2'b10, a[2],
    2'b11, a[3]
  });
endmodule

module ysyx_040053_RegisterFile (
  input clk,
  input rst,
  input [5-1:0] raaddr,
  input [5-1:0] rbaddr,
  output [64-1:0] radata,
  output [64-1:0] rbdata,

  input [64-1:0] wdata,
  input [5-1:0] waddr,
  input wen
);
  reg [64-1:0] rf [(1 << 5)-1:0];
  assign  radata = (raaddr == 0) ? 0 : rf[raaddr];
  assign  rbdata = (rbaddr == 0) ? 0 : rf[rbaddr];
  integer i;
  always @(posedge clk) begin
    if(rst) begin
        for (i = 0; i < 32; i = i + 1) begin
            rf[i] <= 0;
        end
    end
    else if(wen) rf[waddr] <= wdata;
  end
  //import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
 // initial set_gpr_ptr(rf);  // rf为通用寄存器的二维数组变量
/*  always @(*)begin
    $display("wen = %d,raaddr=%d, radata=%x, rbddr=%d, rbdata=%x, wdata= %x, waddr = %x", wen,raaddr, radata,rbaddr, rbdata, wdata, waddr);
    $display("0#: %x",rf[0]);
    $display("1#: %x",rf[1]);
    $display("2#: %x",rf[2]);
    $display("3#: %x",rf[3]);
  end
*/
endmodule





module ysyx_040053(
    input clock,
    input reset,
    input io_interrupt,
    input                               io_master_awready,              
    output                              io_master_awvalid,
    output [31:0]                       io_master_awaddr,
    output [3:0]                        io_master_awid,
    output [7:0]                        io_master_awlen,
    output [2:0]                        io_master_awsize,
    output [1:0]                        io_master_awburst,
    input                               io_master_wready,                
    output                              io_master_wvalid,
    output [63:0]                       io_master_wdata,
    output [7:0]                        io_master_wstrb,
    output                              io_master_wlast,
    output                              io_master_bready,                
    input                               io_master_bvalid,
    input  [1:0]                        io_master_bresp,                 
    input  [3:0]                        io_master_bid,
    input                               io_master_arready,                
    output                              io_master_arvalid,
    output [31:0]                       io_master_araddr,
    output [3:0]                        io_master_arid,
    output [7:0]                        io_master_arlen,
    output [2:0]                        io_master_arsize,
    output [1:0]                        io_master_arburst,
    output                              io_master_rready,                 
    input                               io_master_rvalid,                
    input  [1:0]                        io_master_rresp,
    input  [63:0]                       io_master_rdata,
    input                               io_master_rlast,
    input  [3:0]                        io_master_rid,
    output                              io_slave_awready,              
    input                               io_slave_awvalid,
    input [31:0]                        io_slave_awaddr,
    input [3:0]                         io_slave_awid,
    input [7:0]                         io_slave_awlen,
    input [2:0]                         io_slave_awsize,
    input [1:0]                         io_slave_awburst,
    output                              io_slave_wready,                
    input                               io_slave_wvalid,
    input [63:0]                        io_slave_wdata,
    input [7:0]                         io_slave_wstrb,
    input                               io_slave_wlast,
    input                               io_slave_bready,                
    output                              io_slave_bvalid,
    output  [1:0]                       io_slave_bresp,                 
    output  [3:0]                       io_slave_bid,
    output                              io_slave_arready,                
    input                               io_slave_arvalid,
    input [31:0]                        io_slave_araddr,
    input [3:0]                         io_slave_arid,
    input [7:0]                         io_slave_arlen,
    input [2:0]                         io_slave_arsize,
    input [1:0]                         io_slave_arburst,
    input                               io_slave_rready,                 
    output                              io_slave_rvalid,                
    output  [1:0]                       io_slave_rresp,
    output  [63:0]                      io_slave_rdata,
    output                              io_slave_rlast,
    output  [3:0]                       io_slave_rid,
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
    assign io_sram0_wmask = 0; 
	assign io_sram1_wmask = 0;
	assign io_sram2_wmask = 0;
	assign io_sram3_wmask = 0;
	assign io_sram4_wmask = 0;
	assign io_sram5_wmask = 0;
	assign io_sram6_wmask = 0;
	assign io_sram7_wmask = 0;

    wire  [63:0]   rw_addr_o;
    wire           rw_req_o;//
    wire           rw_valid_o;
    wire [127:0]   rw_w_data_o;
    wire  [127:0]   data_read_i;//finish burst
    wire            rw_ready_i;//data_read_i in ram
    wire [7:0]     rw_size_o;
    wire           rw_dev_o;
    
    wire [31:0] instr;
    wire [63:0] pc;
    wire wb_commit;
    wire [63:0] wb_pc;
    wire [31:0] wb_instr;
    wire [63:0] next_pc;
    wire wb_dev_o;
    wire [3:0] rw_bytes_o;
    ysyx_040053_core core(
        .clk(clock),.rst(reset),
        .instr(instr),.pc(pc),.wb_commit(wb_commit),.wb_pc(wb_pc),.wb_instr(wb_instr),.next_pc(next_pc),.wb_dev_o(wb_dev_o),
        .rw_addr_o(rw_addr_o),.rw_req_o(rw_req_o),.rw_valid_o(rw_valid_o),.rw_w_data_o(rw_w_data_o),
        .data_read_i(data_read_i),.rw_ready_i(rw_ready_i),.rw_size_o(rw_size_o),
        .rw_dev_o(rw_dev_o), .rw_bytes_o(rw_bytes_o),
        .io_sram0_addr(io_sram0_addr),.io_sram0_cen(io_sram0_cen),.io_sram0_wen(io_sram0_wen),.io_sram0_wdata(io_sram0_wdata),.io_sram0_rdata(io_sram0_rdata),
        .io_sram1_addr(io_sram1_addr),.io_sram1_cen(io_sram1_cen),.io_sram1_wen(io_sram1_wen),.io_sram1_wdata(io_sram1_wdata),.io_sram1_rdata(io_sram1_rdata),
        .io_sram2_addr(io_sram2_addr),.io_sram2_cen(io_sram2_cen),.io_sram2_wen(io_sram2_wen),.io_sram2_wdata(io_sram2_wdata),.io_sram2_rdata(io_sram2_rdata),
        .io_sram3_addr(io_sram3_addr),.io_sram3_cen(io_sram3_cen),.io_sram3_wen(io_sram3_wen),.io_sram3_wdata(io_sram3_wdata),.io_sram3_rdata(io_sram3_rdata),
        .io_sram4_addr(io_sram4_addr),.io_sram4_cen(io_sram4_cen),.io_sram4_wen(io_sram4_wen),.io_sram4_wdata(io_sram4_wdata),.io_sram4_rdata(io_sram4_rdata),
        .io_sram5_addr(io_sram5_addr),.io_sram5_cen(io_sram5_cen),.io_sram5_wen(io_sram5_wen),.io_sram5_wdata(io_sram5_wdata),.io_sram5_rdata(io_sram5_rdata),
        .io_sram6_addr(io_sram6_addr),.io_sram6_cen(io_sram6_cen),.io_sram6_wen(io_sram6_wen),.io_sram6_wdata(io_sram6_wdata),.io_sram6_rdata(io_sram6_rdata),
        .io_sram7_addr(io_sram7_addr),.io_sram7_cen(io_sram7_cen),.io_sram7_wen(io_sram7_wen),.io_sram7_wdata(io_sram7_wdata),.io_sram7_rdata(io_sram7_rdata)

    );
    ysyx_040053_axi_rw axi(
        clock,
        reset,

        rw_req_o,           //IF&MEM输入信号
        rw_valid_o,         //IF&MEM输入信号
        rw_ready_i,         //IF&MEM输入信号
        data_read_i,        //IF&MEM输入信号
        rw_w_data_o,        //IF&MEM输入信号
        rw_addr_o,          //IF&MEM输入信号
        rw_size_o,          //IF&MEM输入信号
        rw_dev_o,          //IF&MEM输入信号
        rw_bytes_o,


        // Advanced eXtensible Interface
        io_master_awready,
        io_master_awvalid,
        io_master_awaddr,
        io_master_awid,
        io_master_awlen,
        io_master_awsize,
        io_master_awburst,

        io_master_wready,
        io_master_wvalid,
        io_master_wdata,
        io_master_wstrb,
        io_master_wlast,

        io_master_bready,
        io_master_bvalid,
        io_master_bresp,
        io_master_bid,

        io_master_arready,
        io_master_arvalid,
        io_master_araddr,
        io_master_arid,
        io_master_arlen,
        io_master_arsize,
        io_master_arburst,

        io_master_rready,
        io_master_rvalid,
        io_master_rresp,
        io_master_rdata,
        io_master_rlast,
        io_master_rid
    );

    assign io_slave_awready = 0;              

    assign io_slave_wready = 0;                
            
    assign io_slave_bvalid = 0;
    assign io_slave_bresp = 0;                 
    assign io_slave_bid = 0;

    assign io_slave_arready = 0;                
                     
    assign io_slave_rvalid = 0;                
    assign io_slave_rresp = 0;
    assign io_slave_rdata = 0;
    assign io_slave_rlast = 0;
    assign io_slave_rid = 0;

endmodule
