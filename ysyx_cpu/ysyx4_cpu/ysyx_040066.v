module ysyx_040066_Wb(
    input clk,rst,

    input wen_in,MemRd_in,MemWr_in,done_in,valid_in,error_in,block,
    input [4:0] rd_in,
    input [63:0] data_in,
    input [63:0] data_Rd,
    input [63:0] nxtpc_in,
    input [2:0] MemOp_in,
    input data_error,
    input [2:0] addr_lowbit_in,

    output [4:0] rd,
    output [63:0] data,
    output wen
);
    wire error;
    wire [63:0] nxtpc;
    wire done,valid;


    reg wen_native,MemRd_native,MemWr_native,valid_native;
    reg done_native;
    reg error_native;
    reg [4:0] rd_native;
    reg [63:0] data_native;
    reg [63:0] nxtpc_native;
    reg [2:0] MemOp_native;  
    reg [2:0] addr_lowbit_native;
    always @(posedge clk) begin
        if(rst) valid_native<=0;
        else if(~block) valid_native<=valid_in;
    end

    always @(posedge clk) if(~block) begin
        wen_native<=wen_in&&valid_in;MemRd_native<=MemRd_in;MemWr_native<=MemWr_in;done_native<=done_in;
        rd_native<=rd_in;data_native<=data_in;nxtpc_native<=nxtpc_in;
        error_native<=error_in;MemOp_native<=MemOp_in;addr_lowbit_native<=addr_lowbit_in;
    end

    assign error=error_native||(data_error&&(MemRd_native||MemWr_native));
    assign wen=~rst&&wen_native&&~error&&~block;
    wire [63:0] real_read_data;

    ysyx_040066_data_choose data_choose(
        .MemOp(MemOp_native),.addr_low(addr_lowbit_native),.basic_data(data_Rd),
        .data(real_read_data)
    );

    assign data=MemRd_native?real_read_data:data_native;
    assign rd=rd_native;
    assign nxtpc=nxtpc_native;

    assign done=done_native;
    assign valid=valid_native;//||Multi_wen_native||Div_wen_native;

    `ifdef INSTR
    always @(*) begin
        if(~rst&&~clk) $display("WB:nxtpc=%h,data=%h,valid=%b,done=%b,error=%b",nxtpc,data,valid,done,error);
    end
    `endif
endmodule

module ysyx_040066_data_choose(
    input [2:0] MemOp,
    input [2:0] addr_low,
    input [63:0] basic_data,

    output reg [63:0] data
);
    reg [7:0] b_Rd;
    reg [15:0] h_Rd;
    reg [31:0] w_Rd;
    always @(*) begin
        case(addr_low)
            3'b000:begin b_Rd=basic_data[ 7: 0]; h_Rd=basic_data[15: 0]; w_Rd=basic_data[31: 0];end
            3'b001:begin b_Rd=basic_data[15: 8]; h_Rd=basic_data[15: 0]; w_Rd=basic_data[31: 0];end
            3'b010:begin b_Rd=basic_data[23:16]; h_Rd=basic_data[31:16]; w_Rd=basic_data[31: 0];end
            3'b011:begin b_Rd=basic_data[31:24]; h_Rd=basic_data[31:16]; w_Rd=basic_data[31: 0];end
            3'b100:begin b_Rd=basic_data[39:32]; h_Rd=basic_data[47:32]; w_Rd=basic_data[63:32];end
            3'b101:begin b_Rd=basic_data[47:40]; h_Rd=basic_data[47:32]; w_Rd=basic_data[63:32];end
            3'b110:begin b_Rd=basic_data[55:48]; h_Rd=basic_data[63:48]; w_Rd=basic_data[63:32];end
            3'b111:begin b_Rd=basic_data[63:56]; h_Rd=basic_data[63:48]; w_Rd=basic_data[63:32];end
        endcase
    end

    wire w;
    assign w=~MemOp[2];
    always @(*) begin
        case(MemOp[1:0])
            2'b00: data={{56{b_Rd[7]&&w}},b_Rd};
            2'b01: data={{48{h_Rd[15]&&w}},h_Rd};
            2'b10: data={{32{w_Rd[31]&&w}},w_Rd};
            default:data=basic_data;
        endcase
    //    $display("addr=%h,addr_low=%b",addr,addr[2:0]);
    //    $display("b=%h,h=%h,w=%h,q=%h,final=%h",b_Rd,h_Rd,w_Rd,basic_data,data);
    end
endmodule
module ysyx_040066_Registers(
    input clk,
    input wen,
    input [4:0] rd,
    input [63:0] data,

    input [4:0] ex_rd,
    input ex_wen,
    input ex_valid,
    input [63:0] ex_data,

    input [4:0] m_rd,
    input m_wen,
    input m_valid,
    input [63:0] m_data,

/*    input [4:0] multi_rd1,
    input [4:0] multi_rd2,
    input multi_valid1,multi_valid2,
    input [63:0] multi_result,

    input [4:0] div_rd1,
    input [4:0] div_rd2,
    input div_valid1,div_valid2,
    input [63:0] div_result,*/

    input [4:0] rs1,
    output reg rs1_valid,

    input [4:0] rs2,
    output reg rs2_valid
);
    ysyx_040066_Regs module_regs(
        .clk(clk),.wdata(data),.waddr(rd),.wen(wen&&rd!=5'b00000)
    );
    
    reg [63:0] src1;
    reg [63:0] src2;

    always @(*) begin
        if(rs1==5'b00000) begin 
            src1=64'h0;
            rs1_valid=1;
        end else if(rs1==ex_rd&&ex_wen) begin
            src1=ex_data;
            rs1_valid=ex_valid;
        end else if(rs1==m_rd&&m_wen) begin
            src1=m_data;
            rs1_valid=m_valid;
        end else if(rs1==rd&&wen) begin
            src1=data;
            rs1_valid=1;
        end else begin
            src1=module_regs.rf[rs1];
            rs1_valid=1;
        end
    end

    always @(*) begin
        if(rs2==5'b00000) begin 
            src2=64'h0;
            rs2_valid=1;
        end else if(rs2==ex_rd&&ex_wen) begin
            src2=ex_data;
            rs2_valid=ex_valid;
        end else if(rs2==m_rd&&m_wen) begin
            src2=m_data;
            rs2_valid=m_valid;
        end else if(rs2==rd&&wen) begin
            src2=data;
            rs2_valid=1;
        end else begin 
            src2=module_regs.rf[rs2];
            rs2_valid=1;
        end
    end
endmodule
module ysyx_040066_Regs #(ADDR_WIDTH = 5, DATA_WIDTH = 64) (
  input clk,
  input [DATA_WIDTH-1:0] wdata,
  input [ADDR_WIDTH-1:0] waddr,
  input wen
);
  reg [DATA_WIDTH-1:0] rf [31:0];
  always @(posedge clk) begin
    if (wen) begin 
//      $display("in:addr=%h,data=%h",waddr,wdata);
      rf[waddr] <= wdata;
    end
  end
endmodule
module ysyx_040066_cpu(
    input clk,rst,
    input [31:0] instr_rd,
    input [63:0] data_Rd,
    input instr_valid,instr_error,
    input data_valid,data_error,

    output reg error,done,
    output MemWr,MemRd,fence_i,instr_read,
    output [63:0] pc_rd,
    output reg [63:0] pc_nxt,
    output reg out_valid,
    output [63:0] addr,
    output [2:0] wr_len,
    output [7:0] wr_mask,
    output [63:0] data_Wr
);
    //ID
    wire id_rs1_valid,id_rs2_valid;
    //EX
    wire ex_valid,ex_wen,ex_isex,ex_is_jmp,ex_ecall,ex_mret,ex_csr,ex_done;
    wire [4:0] ex_rd;
    wire [63:0] ex_data;
    wire [11:0] ex_csr_addr;
    wire [63:0] ex_nxtpc;
    wire [63:0] ex_csr_wdata;
    wire [63:0] ex_pc;
    reg [31:0] ex_instr; always@(posedge clk) ex_instr<=instr_rd;
    //M
    wire m_valid,m_wen,m_MemRd;
    wire [4:0] m_rd;
    wire [63:0] m_data;
    //Div
    wire div_ready;
    //WB
    wire wb_wen;
    wire [4:0] wb_rd;
    wire [63:0] wb_data;
    wire [63:0] wb_pc,wb_addr;
    //CSR
    wire [63:0] csr_nxtpc;
    wire csr_jmp;

    wire [31:15] instr;

    wire div_block,instr_block,mem_block,id_block;
    assign div_block=~div_ready;
    assign instr_block=~instr_valid;
    assign mem_block=(MemRd||MemWr)&&~data_valid;
    wire m_block,global_block;
    assign m_block=div_block||mem_block;
    assign global_block=instr_block||m_block;

    ysyx_040066_IF module_if(
        .clk(clk),.rst(rst),
        .block(global_block),.id_block(id_block),
        .is_jmp(ex_is_jmp||csr_jmp),
        .nxtpc(csr_jmp?csr_nxtpc:ex_nxtpc),.native_pc(pc_rd)
    );
    
    ysyx_040066_Registers module_regs(
        .clk(clk),.wen(wb_wen),.rd(wb_rd),.data(wb_data),
        .ex_rd(ex_rd),.ex_wen(ex_wen&&ex_valid),.ex_data(ex_data),.ex_valid(ex_isex),
        .m_rd(m_rd),.m_wen(m_wen&&m_valid),.m_data(m_data),.m_valid(~m_MemRd),
        .rs1(instr[19:15]),.rs1_valid(id_rs1_valid),
        .rs2(instr[24:20]),.rs2_valid(id_rs2_valid)
    );

    wire raise_intr,ex_valid_native,intr_time,clear_mip;
    wire intr_ecall,intr_t,intr_ins_ac,intr_ins_dec,intr_rd,intr_wr;
    wire [63:0] NO,mstatus,mie,tval;
    assign intr_ecall=ex_ecall&&ex_valid_native;
    assign intr_t=intr_time&&mstatus[3]&&mie[7]&&ex_valid_native;
    assign raise_intr=intr_ecall||intr_t||intr_ins_ac||intr_ins_dec||intr_rd||intr_wr;
    assign NO[62:0]=intr_rd?63'd5:intr_wr?63'd7:
                    intr_ecall?63'd11:
                    intr_ins_ac?63'd1:intr_ins_dec?63'd2:
                    intr_t?63'd7:63'd0;
    assign NO[63]=~intr_rd&&~intr_wr&&~intr_ecall&&~intr_ins_ac&&~intr_ins_dec&&intr_t;
    assign tval=(intr_rd||intr_wr)?wb_addr:intr_ins_ac?ex_pc:intr_ins_dec?{32'h0,ex_instr}:64'b0;
    ysyx_040066_csr module_csr(
        .rst(rst),.clk(clk),.clear_mip(clear_mip),
        .csr_rd_addr(instr[31:20]),
        .csr_wr_addr(ex_csr_addr),.in_data(ex_csr_wdata),.wen(ex_valid&&ex_csr&&~ex_ecall&&~ex_mret&&~ex_done),
        .raise_intr(raise_intr&&~global_block),.NO(NO),.pc((intr_rd||intr_wr)?wb_pc:ex_pc),.tval(tval),
        .ret(ex_mret&&ex_valid&&~global_block),.mstatus(mstatus),.mie(mie),
        .jmp(csr_jmp),.nxtpc(csr_nxtpc)
    );

    ysyx_040066_ID module_id(
        .clk(clk),.rst(rst),.block(global_block||id_block),
        .rs1_valid(id_rs1_valid),.rs2_valid(id_rs2_valid),.jmp((ex_is_jmp&&ex_valid)||csr_jmp),      
        .valid_in(module_if.valid),.instr_read(instr_rd),.pc_in(module_if.pc),.instr_error_rd(instr_error),
        .csr_error(module_csr.rd_err),.rs_block(id_block)
    );
    assign instr=module_id.instr[31:15];
    assign instr_read=~(global_block||id_block);
    ysyx_040066_EX module_ex(
        .clk(clk),.rst(rst),.block(global_block),
        .valid_in(module_id.valid),.raise_intr(intr_t||intr_rd||intr_wr),
        .valid(ex_valid),.error_in(module_id.error),.rd_in(module_id.rd),
        .src1_in(module_regs.src1),.src2_in(module_regs.src2),.imm_in(module_id.imm),.pc_in(module_id.pc),
        .csr_data_in(module_csr.csr_data),.csr_addr_in(module_id.csr_addr),.csr_in(module_id.csr),
        .ecall_in(module_id.ecall),.mret_in(module_id.mret),
        .ALUAsrc_in(module_id.ALUASrc),.ALUBsrc_in(module_id.ALUBSrc),.ALUctr_in(module_id.ALUctr),.Branch_in(module_id.Branch),
        .MemOp_in(module_id.MemOp),.MemRd_in(module_id.MemRd),.MemWr_in(module_id.MemWr),.done_in(module_id.done),
        .RegWr_in(module_id.RegWr),.rs1_in(instr[19:15]),.fence_i_in(module_id.fence_i),
        
        .nxtpc(ex_nxtpc),.is_jmp(ex_is_jmp),.result(ex_data),.rd(ex_rd),.RegWr(ex_wen),.valid_native(ex_valid_native),
        .is_ex(ex_isex),.ecall(ex_ecall),.mret(ex_mret),.csr_addr(ex_csr_addr),.csr(ex_csr),.done(ex_done),.pc(ex_pc)
    );
    assign intr_ins_ac=module_ex.error[0]&&module_ex.valid;
    assign intr_ins_dec=module_ex.error[1]&&module_ex.valid;


    wire [63:0] mul_result;

    `ifdef EMU_MULTI
    multi_dummy module_mutli(
        .clk(clk),.block(global_block),
        .src1_in(module_regs.src1),.src2_in(module_regs.src2),.ALUctr_in(module_id.ALUctr[1:0]),
        .ALUctr(module_ex.ALUctr_native[1:0]),.is_w(module_ex.ALUctr_native[4]),
        .result(mul_result)
    );
    `else
    ysyx_040066_booth_walloc module_mutli(
        .clk(clk),.block(global_block),
        .src1_in(module_regs.src1),.src2_in(module_regs.src2),.ALUctr_in(module_id.ALUctr[1:0]),
        .ALUctr(module_ex.ALUctr_native[1:0]),.is_w(module_ex.ALUctr_native[4]),
        .result(mul_result)
    );
    `endif

    ysyx_040066_csrwork csrwork(
        .csr_data(module_ex.csr_data),.rs1(module_ex.src1),.zimm(module_ex.rs1),.csrctl(module_ex.MemOp),.data(ex_csr_wdata)
    );

    wire div_valid;
    wire [63:0] div_result;
    ysyx_040066_Div module_div(
        .clk(clk),.rst(rst||intr_rd||intr_wr),
        .src1_in(module_ex.src1_native),.src2_in(module_ex.src2_native),
        .is_w(module_ex.ALUctr_native[4]),.ALUctr_in(module_ex.ALUctr_native[1:0]),
        .in_valid(module_ex.valid&&module_ex.is_div&&~global_block),
        .out_valid(div_valid),.in_ready(div_ready),.result(div_result)
    );

    wire MemWr_line,MemRd_line;
    ysyx_040066_M module_m(
        .clk(clk),.rst(rst),.valid(m_valid),.block(m_block),
        .nxtpc_in(csr_jmp?csr_nxtpc:module_ex.nxtpc),.done_in(module_ex.done),.valid_in(module_ex.valid&&~instr_block),
        .MemRd_in(module_ex.MemRd),.ex_result(module_ex.result),.error_in(module_ex.error[0]||module_ex.error[1]),
        .data_Wr_in(module_ex.data_Wr),.wr_mask_in(module_ex.wmask),.RegWr_in(module_ex.RegWr),.MemWr_in(module_ex.MemWr),
        .MemOp_in(module_ex.MemOp),.rd_in(module_ex.rd),.fence_i_in(module_ex.fence_i),
        .is_mul_in(module_ex.is_mul),.mul_result(mul_result),
        .is_div_in(module_ex.is_div),.div_valid(div_valid),.div_result(div_result),
        .RegWr(m_wen),.rd(m_rd),.wr_mask(wr_mask),.wr_len(wr_len),
        .MemRd_native(MemRd_line),.MemWr_native(MemWr_line),.addr(addr),.data_Wr(data_Wr),.fence_i(fence_i)
    );
    assign m_MemRd=MemRd_line;
    assign m_data=module_m.data;

    wire [63:0] client_data;
    wire rd_time,t_err;
    ysyx_040066_clinet module_client(
        .clk(clk),.rst(rst),.addr(addr),.data(data_Wr),
        .MemRd(MemRd_line&&module_m.valid),.MemWr(MemWr_line&&module_m.valid),
        .MemRd_real(MemRd),.MemWr_real(MemWr),.intr(intr_time),
        .data_rd(client_data),.MemRd_time(rd_time),.error(t_err)
    );
    assign clear_mip=MemWr_line&&module_m.valid&&~MemWr;

    ysyx_040066_Wb module_wb(
        .clk(clk),.rst(rst),.block((intr_rd||intr_wr)&&~(csr_jmp&&global_block)),
        .valid_in(module_m.valid&&~m_block&&~intr_rd&&~intr_wr),.data_error(rd_time?t_err:data_error),
        .wen_in(module_m.RegWr&&module_m.valid),.MemRd_in(module_m.MemRd_native),.MemWr_in(module_m.MemWr_native),
        .done_in(module_m.done&&module_m.valid),.rd_in(module_m.rd),.data_in(module_m.data),
        .data_Rd(rd_time?client_data:data_Rd),.MemOp_in(module_m.MemOp_native),.addr_lowbit_in(module_m.addr[2:0]),
        .error_in(module_m.error),.nxtpc_in(module_m.nxtpc),
        .rd(wb_rd),.data(wb_data),.wen(wb_wen)
    );
    assign intr_rd=module_wb.data_error&&module_wb.valid&&module_wb.MemRd_native;
    assign intr_wr=module_wb.data_error&&module_wb.valid&&module_wb.MemWr_native;
    assign wb_pc=module_wb.nxtpc-64'h4;
    assign wb_addr=module_wb.data_native;

    always @(posedge clk) begin
        pc_nxt<=module_wb.nxtpc;
        out_valid<=module_wb.valid;
        done<=~rst&&module_wb.done;
        error<=module_wb.error||module_csr.wr_err;
        /*if(out_valid&&error) begin
            $display("ERROR DECTED! nxtpc=%h",pc_nxt);
            $finish;
        end*/
//        $display("error:%b %b,data_valid=%b",error,module_wb.error,data_Rd_error);
    end

    `ifdef INSTR
    always @(*) if(!rst) begin        
        if(~clk) $display("done:nxtpc=%h,out_valid=%b,error=%b,global_block=%b,intr=%b",pc_nxt,out_valid,error,global_block,raise_intr);        
        //if(~clk&&pc_nxt[31:0]>=32'h30000ee0&&pc_nxt[31:0]<=32'h30000fec)$display("%h:s0=%h,a0=%h,circle=%d",pc_nxt[31:0],module_regs.module_regs.rf[8],module_regs.module_regs.rf[10],module_client.mtime);
//        if(clk) $display("iscsr?%b,Funct3=%b,csrwen=",iscsr,instr[14:12],csr_wen&&~error_temp);
    end
    `endif
endmodule
module yxys_220066_jmp_control(
    input Zero,Result_0,
    input [2:0] Branch,
    output NxtASrc,
    output reg NxtBSrc
    );
    assign NxtASrc=(Branch==3'b010);
    always @(*)
    case (Branch)
        3'b000:NxtBSrc=0;
        3'b001:NxtBSrc=1;
        3'b010:NxtBSrc=1;
        3'b011:NxtBSrc=1;
        3'b100:NxtBSrc=Zero;
        3'b101:NxtBSrc=!Zero;
        3'b110:NxtBSrc=Result_0;
        3'b111:NxtBSrc=Zero|(!Result_0);
    endcase
endmodule

module ysyx_040066_nxtPC(
    output [63:0] nxtpc,
    output is_jmp,
    input [63:0] in_pc,
    input [63:0] BusA,
    input [63:0] Imm,
    input Zero,
    input Result_0,
    input [2:0] Branch
    );
    wire NxtASrc,NxtBSrc;
    yxys_220066_jmp_control jmp(Zero,Result_0,Branch,NxtASrc,NxtBSrc);
    assign nxtpc=(NxtASrc?BusA:in_pc)+(NxtBSrc?Imm:64'h4);
    assign is_jmp=NxtASrc||NxtBSrc;
    
    //always @(*) begin
        //$display("nxtPC:A=%b,B=%b",NxtASrc,NxtBSrc);
    //end

endmodule
module ysyx_040066_EX(
    input clk,rst,block,valid_in,
    input [1:0] error_in,
    output valid,

    input [63:0] src1_in,
    input [63:0] src2_in,
    input [31:0] imm_in,
    input [63:0] csr_data_in,
    input [63:0] pc_in,
    input [11:0] csr_addr_in,
    input ALUAsrc_in,done_in,csr_in,
    input ecall_in,mret_in,
    input [1:0] ALUBsrc_in,
    input [5:0] ALUctr_in,
    input [4:0] rd_in,
    input [4:0] rs1_in,
    input [2:0] Branch_in,
    input [2:0] MemOp_in,
    input MemRd_in,MemWr_in,RegWr_in,
    input raise_intr,
    input fence_i_in,

    output [63:0] nxtpc,
    output [63:0] pc,
    output is_jmp,
    output [4:0] rd,
    output [63:0] result,
    output [11:0] csr_addr,
    output is_ex,RegWr,ecall,mret,csr,done,
    output reg valid_native
);
    wire [2:0] MemOp;
    wire [4:0] rs1;
    wire [63:0] src1;
    wire [63:0] csr_data;
    wire MemRd,MemWr;
    wire [1:0] error;
    reg [7:0] wmask;
    reg [63:0] data_Wr;

    reg [1:0] error_native;
    reg csr_native,ecall_native,mret_native;
    reg [63:0] src1_native;
    reg [63:0] src2_native;
    reg [31:0] imm_native;
    reg [63:0] csr_data_native;
    reg [63:0] pc_native;
    reg ALUAsrc_native,done_native;
    reg [1:0] ALUBsrc_native;
    reg [5:0] ALUctr_native;
    reg [2:0] Branch_native;
    reg [2:0] MemOp_native;
    reg MemRd_native,MemWr_native,RegWr_native;
    reg [11:0] csr_addr_native;
    reg [4:0] rd_native;
    reg [4:0] rs1_native;
    reg fence_i;

    always @(posedge clk) valid_native<=~rst&&(block?valid_native:valid_in);
    
    always @(posedge clk) if(~block) begin
        error_native<=error_in;
        src1_native<=src1_in;
        src2_native<=src2_in;
        imm_native<=imm_in;
        csr_data_native<=csr_data_in;
        pc_native<=pc_in;
        ALUAsrc_native<=ALUAsrc_in;
        ALUBsrc_native<=ALUBsrc_in;
        done_native<=done_in;
        ALUctr_native<=ALUctr_in;
        rs1_native<=rs1_in;
        Branch_native<=Branch_in;
        MemOp_native<=MemOp_in;
        rd_native<=rd_in;
        MemRd_native<=MemRd_in;
        MemWr_native<=MemWr_in;
        RegWr_native<=RegWr_in;
        csr_addr_native<=csr_addr_in;
        csr_native<=csr_in;ecall_native<=ecall_in;mret_native<=mret_in;
        fence_i<=fence_i_in;
    end

    assign valid=valid_native&&(ecall_native||~raise_intr);
    assign done=done_native;
    assign MemOp=MemOp_native;
    assign MemRd=MemRd_native;
    assign MemWr=MemWr_native;
    assign src1=src1_native;
    assign csr_addr=csr_addr_native;
    assign csr_data=csr_data_native;
    assign ecall=ecall_native;
    assign mret=mret_native;
    assign rd=rd_native;
    assign RegWr=RegWr_native;
    assign rs1=rs1_native;
    assign csr=csr_native;
    assign pc=pc_native;

    wire [63:0] imm_use;
    assign imm_use={{32{imm_native[31]}},imm_native};

    reg [63:0] datab;
    always @(*) case(ALUBsrc_native)
        2'b00:datab=src2_native;
        2'b01:datab=64'h4;
        2'b10:datab=imm_use;
        2'b11:datab=csr_data_native;
    endcase
    wire zero;
    wire [2:0] add_lowbit;

    ysyx_040066_ALU alu(
        .data_input(ALUAsrc_native?pc_native:src1_native),.datab_input(datab),
        .aluctr(ALUctr_native[4:0]),.zero(zero),.result(result),.add_lowbit(add_lowbit)
    );

    wire is_mul,is_div;
    assign is_mul=ALUctr_native[5]&&~ALUctr_native[2];
    assign is_div=ALUctr_native[5]&&ALUctr_native[2];
    assign is_ex=~MemRd_native&&~ALUctr_native[5];

    wire is_jmp_line;
    ysyx_040066_nxtPC nxtPC(
        .nxtpc(nxtpc),.is_jmp(is_jmp_line),.in_pc(pc_native),.BusA(src1_native),.Imm(imm_use),.Zero(zero),
        .Result_0(result[0]),.Branch(Branch_native)
    );

    assign error=error_native;//||(ALUctr_native[5]&&error_div);
    assign is_jmp=(is_jmp_line||fence_i)&&valid_native;
//    assign result=ALUctr_native[5]?mul_result:result_line;

    always @(*) case (MemOp[1:0])
        2'b00: begin
            data_Wr={8{src2_native[7:0]}};
            wmask[0]=(add_lowbit==3'o0);
            wmask[1]=(add_lowbit==3'o1);
            wmask[2]=(add_lowbit==3'o2);
            wmask[3]=(add_lowbit==3'o3);
            wmask[4]=(add_lowbit==3'o4);
            wmask[5]=(add_lowbit==3'o5);
            wmask[6]=(add_lowbit==3'o6);
            wmask[7]=(add_lowbit==3'o7);
        end
        2'b01: begin
            data_Wr={4{src2_native[15:0]}};
            wmask[1:0]={2{add_lowbit[2:1]==2'o0}};
            wmask[3:2]={2{add_lowbit[2:1]==2'o1}};
            wmask[5:4]={2{add_lowbit[2:1]==2'o2}};
            wmask[7:6]={2{add_lowbit[2:1]==2'o3}};
        end
        2'b10: begin
            data_Wr={2{src2_native[31:0]}};
            wmask[3:0]={4{~add_lowbit[2]}};
            wmask[7:4]={4{add_lowbit[2]}};
        end
        2'b11: begin
            data_Wr=src2_native;
            wmask=8'hff;
        end
    endcase

    `ifdef INSTR
    always @(*) begin
        if(~rst&&~clk) $display("EX:nxtpc=%h,valid=%b,csr_addr=%h,result=%h,is_jmp=%b,is_csr=%b,MemWr=%b,error=%b,done=%b,zero=%b",nxtpc,valid,csr_addr,result,is_jmp,csr_native,MemWr_native,error,done,zero);
        //if(~rst&&~clk&&~block) $display("EX2:x=%h,y=%h,src1=%h,src2=%h",ALUAsrc_native?pc_native:src1_native,datab,src1_native,src2_native);        
    end
    `endif
endmodule
module ysyx_040066_ALU(
    input [63:0] data_input,
    input [63:0] datab_input,
    input [4:0] aluctr,
    output zero,
    output [2:0] add_lowbit,
    output reg [63:0] result
    );
    wire ALctr,SUBctr,Wctr,CF,SF,OF;
    wire [63:0] Add_result;
    ysyx_040066_ALU_decode alu_decode(aluctr[4:3],aluctr[1],ALctr,SUBctr,Wctr);
    wire [31:0] data_sll;
    assign data_sll=(data_input[31:0]<<datab_input[4:0]);
    wire [31:0] data_srl;
    assign data_srl=(data_input[31:0]>>datab_input[4:0]);
    wire [31:0] data_sra;
    assign data_sra=$signed($signed(data_input[31:0])>>>$signed(datab_input[4:0]));

    ysyx_040066_Adder adder(data_input,datab_input,SUBctr,Add_result,CF,SF,OF);
    always @(*)
    case (aluctr[2:0])
        3'o0: result={Wctr?{32{Add_result[31]}}:Add_result[63:32],Add_result[31:0]};
        3'o1: result=Wctr?{{32{data_sll[31]}},data_sll}:data_input<<datab_input[5:0];
        3'o2: result={{63{1'b0}},OF^SF};
        3'o3: result={{63{1'b0}},CF};
        3'o4: result=data_input^datab_input;
        3'o5: result=~Wctr?
                    (ALctr?($signed(($signed(data_input))>>>datab_input[5:0])):data_input>>datab_input[5:0]):
                    (ALctr?{{32{data_sra[31]}},data_sra}:{{32{data_srl[31]}},data_srl});
        3'o6: result=data_input|datab_input;
        3'o7: result=({64{aluctr[3]}}|data_input)&datab_input;
    endcase

    assign add_lowbit=Add_result[2:0];
    assign zero=~|(data_input^datab_input);

//    always @(*) begin
//        $display("ALU:data_input=%x,datab_input=%x,Add_result=%x,result=%x,aluctr=%b,zero=%b",data_input,datab_input,Add_result,result,aluctr,zero);
//    end

endmodule

module ysyx_040066_Adder(
    input [63:0] x,
    input [63:0] y,
    input SUBctr,
    output reg [63:0] result,
    output reg CF,SF,OF
    );
    reg [63:0] y_;
    reg Ctemp,Cout;
    always @(*) begin
        y_=SUBctr?~y:y;
        {Ctemp,result[62:0]}={1'b0,x[62:0]}+{1'b0,y_[62:0]}+{{63{1'b0}},SUBctr};
        {Cout,result[63]}={1'b0,x[63]}+{1'b0,y_[63]}+{1'b0,Ctemp};
        SF=result[63];
        OF=Cout^Ctemp;
        CF=SUBctr^Cout;
    end
endmodule

module ysyx_040066_ALU_decode(
    input [4:3] ALUctr,
    input ALUctr_1,
    output ALctr,SUBctr,Wctr
    );
    assign SUBctr=ALUctr[3]|ALUctr_1;
    assign ALctr=ALUctr[3];
    assign Wctr=ALUctr[4];
endmodule
module ysyx_040066_csr (
    input rst,clk,
    input [11:0] csr_rd_addr,
    input [11:0] csr_wr_addr,
    input wen,
    input [63:0] in_data,//for csr instruction
    
    input raise_intr,
    input [63:0] NO,
    input [63:0] tval,
    input [63:0] pc,

    input ret,clear_mip,

    output jmp,
    output [63:0] nxtpc,

    output reg [63:0] mie,
    output reg [63:0] mstatus
);
    wire [63:0] csr_data;
    reg [63:0] csr_data_native;
    reg rd_err;
    wire wr_err;

    reg [63:0] mepc;
    reg [63:0] mcause;
    reg [63:0] mtvec;
    reg [63:0] mip;
    reg [63:0] mtval;
    reg [63:0] mscratch;

    assign nxtpc=ret?mepc:mtvec;
    assign jmp=ret||raise_intr;

    always @(*) case(csr_rd_addr)
        12'hf14: begin csr_data_native=64'h0; rd_err=0; end
        12'h341: begin csr_data_native=mepc; rd_err=0; end
        12'h300: begin csr_data_native=mstatus; rd_err=0; end
        12'h342: begin csr_data_native=mcause; rd_err=0; end
        12'h305: begin csr_data_native=mtvec; rd_err=0; end
        12'h304: begin csr_data_native=mie; rd_err=0; end
        12'h344: begin csr_data_native=mip; rd_err=0; end
        12'h343: begin csr_data_native=mtval; rd_err=0; end
        12'h340: begin csr_data_native=mscratch; rd_err=0; end
        default: begin csr_data_native=64'h0; rd_err=1; end
    endcase

    assign csr_data=(csr_rd_addr==csr_wr_addr&&wen)?in_data:csr_data_native;
    `ifdef WORKBENCH
    import "DPI-C" function void raise_intr_timer(input longint NO, input longint pc);
    `endif
    assign wr_err=wen&&
                    (csr_wr_addr!=12'h341)&&
                    (csr_wr_addr!=12'h300)&&
                    (csr_wr_addr!=12'h342)&&
                    (csr_wr_addr!=12'h305)&&
                    (csr_wr_addr!=12'h304)&&
                    (csr_wr_addr!=12'h340)&&
                    (csr_wr_addr!=12'h343)&&
                    (csr_wr_addr!=12'h344)&&
                    (csr_wr_addr!=12'hf14);

    always @(posedge clk) begin
        if(rst) begin
            mstatus<=64'ha00001800;
            mie<=64'h0;
            mip<=64'h0;
        end else begin
            if(ret) begin
                mstatus[12:11]<=2'b00;
                mstatus[3]<=mstatus[7];
                mstatus[7]<=1'b1;
            end else begin
                if(wen) begin 
                    case(csr_wr_addr)
                        12'h341: mepc<=in_data;
                        12'h300: mstatus<=in_data;
                        12'h342: mcause<=in_data;
                        12'h305: mtvec<=in_data;
                        12'h304: mie<=in_data;
                        12'h340: mscratch<=in_data;
                        12'h343: mtval<=in_data;
                        12'h344: mip<=in_data;
                        default: begin end
                    endcase
                    //$display("csr_addr=%h,in_data=%h",csr_wr_addr,in_data);
                end else begin
                    if(raise_intr) begin
                        mcause <= NO;
                        mepc <= pc;
                        mtval <= tval;
                        mstatus[12:11]<=2'b11;
                        mstatus[7]<=mstatus[3];
                        mstatus[3]<=1'b0;
                        mip[7]<=NO[63];  
                    end else if(clear_mip) mip[7]<=0;
                end
            end
        end
    end

    `ifdef INSTR
    always @(*) begin
        if(~rst&&~clk&&wen) $display("CSR:write %h",csr_wr_addr);
    end 
    `endif
    `ifdef WORKBENCH
    always @(*) begin
        if(~rst&&~clk&&raise_intr&&NO[63]) raise_intr_timer(NO,pc);
    end
    `endif

endmodule

module ysyx_040066_csrwork(
    input [63:0] csr_data,
    input [63:0] rs1,
    input [4:0] zimm,
    input [2:0] csrctl,
    
    output reg [63:0] data
);
    wire [63:0] data2;
    assign data2=csrctl[2]?{59'b0,zimm}:rs1;
    always @(*) case(csrctl[1:0])
        2'b01: data=data2;
        2'b10: data=csr_data|data2;
        2'b11: data=csr_data&~data2;
        default: data=64'h114514;
    endcase

//    always@(*) begin
//        $display("csrctl=%h,csr_data=%h,data2=%h,data=%h",csrctl,csr_data,data2,data);
//    end
endmodule
module ysyx_040066_clinet (
    input clk,rst,
    input [63:0] addr,
    input MemRd,MemWr,
    input [63:0] data,

    output MemRd_real,MemWr_real,intr,
    output reg [63:0] data_rd,
    output reg MemRd_time,error
);
    reg [63:0] mtime,mtimecmp;
    wire data_valid;
    assign data_valid=(addr>=64'h2000000)&&(addr<64'h200c000);
    assign MemRd_real=MemRd&&~data_valid;
    assign MemWr_real=MemWr&&~data_valid;

    always @(posedge clk) MemRd_time<=~MemRd_real;
    always @(posedge clk) error<=addr[15:0]!=16'h4000&&addr[15:0]!=16'hbff8&&data_valid;

    `ifdef WORKBENCH
        import "DPI-C" function void skip_ref();
    `endif

    always @(posedge clk) begin
        if(rst) begin
            mtime<=0;
            mtimecmp<=64'h100;
        end else if(MemWr&&data_valid) begin
            mtime<=(addr[15:0]==16'hbff8)?data:mtime+64'h1;
            mtimecmp<=(addr[15:0]==16'h4000)?data:mtimecmp;
        end else mtime<=mtime+64'h1;
        `ifdef WORKBENCH
            if((MemRd||MemWr)&&data_valid) skip_ref();
        `endif
    end

    assign intr=(mtime>mtimecmp);
    always @(posedge clk) data_rd<=(addr[15:0]==16'h4000)?mtimecmp:mtime;

    //always @(*) begin
        //if(~clk&&~rst) $display("CLIENT:%h,%h",mtime,mtimecmp);
    //end
endmodule
module ysyx_040066_IF (
    input clk,rst,block,id_block,

    input is_jmp,
    input [63:0] nxtpc,
    output reg [63:0] native_pc
);
    wire valid;
    wire [63:0] pc;
    always @(posedge clk) begin
        if(rst) native_pc<=64'h3000_0000;
        else if(block) native_pc<=native_pc;
        else native_pc<=is_jmp?nxtpc:id_block?native_pc:native_pc+4;
    end

    assign pc=native_pc;
    assign valid=~is_jmp;

    `ifdef INSTR
    always @(*) begin
        if(~rst&&~clk) $display("IF:pc=%h,valid=%b,block=%b",pc,valid,block);
    end
    `endif
endmodule
module ysyx_040066_M (
    input clk,rst,valid_in,block,
    output valid,

    input RegWr_in,MemRd_in,MemWr_in,done_in,
    input [63:0] ex_result,
    input [63:0] data_Wr_in,
    input [63:0] nxtpc_in,
    input [2:0] MemOp_in,
    input [4:0] rd_in,
    input error_in,fence_i_in,
    input is_mul_in,is_div_in,div_valid,
    input [63:0] mul_result,
    input [63:0] div_result,
    input [7:0] wr_mask_in,

    output reg MemRd_native,MemWr_native,fence_i,
    output reg [63:0] addr,
    output reg [63:0] data_Wr,
    output [4:0] rd,
    output reg [7:0] wr_mask,
    output reg [2:0] wr_len,
    output RegWr
);
    wire error,done;
    wire [63:0] nxtpc;
    wire [63:0] data;

    reg valid_native;
    always @(posedge clk) valid_native<=~rst&&(block?valid_native:valid_in);

    reg done_native,error_native,RegWr_native;
    reg [63:0] nxtpc_native;
    reg [4:0] rd_native;
    reg [2:0] MemOp_native;
    reg is_mul_native,is_div_native;

    always @(posedge clk) if(~block) begin
        MemRd_native<=MemRd_in;
        MemWr_native<=MemWr_in;
        RegWr_native<=RegWr_in;
        done_native<=done_in;
        addr<=ex_result;
        error_native<=error_in;
        nxtpc_native<=nxtpc_in;
        data_Wr<=data_Wr_in;
        MemOp_native<=MemOp_in;
        rd_native<=rd_in;
        is_mul_native<=is_mul_in;
        is_div_native<=is_div_in;
        wr_mask<=wr_mask_in;
        fence_i<=fence_i_in&&valid_in&&~error_in;
        wr_len<={1'b0,MemOp_in[1:0]};
        /*case (MemOp_in[1:0])
            2'b00:wr_len<=3'b011;
            2'b01:wr_len<=3'b100;
            2'b10:wr_len<=3'b101;
            2'b11:wr_len<=3'b110;
        endcase*/
    end

    assign valid=valid_native&&(div_valid||~is_div_native);
    assign done=done_native;
    assign error=error_native;
    assign nxtpc=nxtpc_native;
    assign RegWr=RegWr_native;
    assign rd=rd_native;
    assign data=is_mul_native?mul_result:(is_div_native?div_result:addr);

    `ifdef INSTR
    always @(*) begin
        if(~rst&&~clk) $display("M:nxtpc=%h,valid=%b,Memrd=%b,MemWr=%b,data=%h,error=%b",nxtpc,valid,MemRd_native,MemWr_native,data,error);
    end
    `endif 

endmodule
module ysyx_040066_Div(
    input clk,rst,

    input [63:0] src1_in,
    input [63:0] src2_in,
    input is_w,
    input [1:0] ALUctr_in,
    input in_valid,
    output reg in_ready,
    output out_valid,
    output [63:0] result
);
    //prework
    wire [63:0] src1,src2,x_abs,y_abs;
    wire div_signed,x_sign,y_sign;
    assign div_signed=~ALUctr_in[0];
    assign src1={is_w?{32{src1_in[31]&&div_signed}}:src1_in[63:32],src1_in[31:0]};
    assign src2={is_w?{32{src2_in[31]&&div_signed}}:src2_in[63:32],src2_in[31:0]};

    assign x_sign=src1[63]&&div_signed;
    assign y_sign=src2[63]&&div_signed;
    assign x_abs=x_sign?(~src1+64'b1):src1;
    assign y_abs=y_sign?(~src2+64'b1):src2;
    //control_regs
    reg doing;
    reg [5:0] count;//in_ready
    assign out_valid = doing && in_ready;
    wire ready_to_doing;
    assign ready_to_doing = in_ready&&in_valid;

    always @(posedge clk) begin
        if(rst||(&count)) in_ready<=1;
        else if(ready_to_doing) in_ready<=0;
    end

    always @(posedge clk) begin
        if(rst) doing<=0;
        else if(ready_to_doing) doing<=1;
        else if(out_valid) doing<=0;
    end

    always @(posedge clk) begin
        if(rst||ready_to_doing) count<=6'b0;
        else if(doing) count<=count+6'b1;
    end
    //calculate regs
    reg dividend_s,divisor_s,aluctr;

    always @(posedge clk) if(ready_to_doing) begin
        dividend_s<=x_sign;
        divisor_s<=y_sign;
        aluctr<=ALUctr_in[1];
    end

    reg [127:0] dividend;
    reg [63:0] divisor;

    wire sub_cout;
    wire [63:0] sub_result;
    assign {sub_cout,sub_result}=dividend[127:63]-{1'b0,divisor};

    always @(posedge clk) begin
        if(ready_to_doing) begin
            dividend <= {64'b0,x_abs};
            divisor <= y_abs;
        end else if(doing) begin
            dividend <= {sub_cout?dividend[126:63]:sub_result[63:0],dividend[62:0],~sub_cout};
        end
    end

    wire [63:0] qutient,remain,qutient_real,remain_real;
    assign {remain,qutient}=dividend;
    assign qutient_real=(dividend_s^divisor_s)?-qutient:qutient;
    assign remain_real=dividend_s?-remain:remain;
    assign result=aluctr?remain_real:qutient_real;

    `ifdef INSTR
    always @(*) begin
        //if(~rst&&~clk)$display("DIV:count=%h,the long=%h",count,dividend);
    end
    `endif
endmodule
module ysyx_040066_walloc_prework(
    input [129:0] src,
    input [2:0] sel,
    output reg [129:0] data,
    output cout 
);
    assign cout=sel[2]&&(~sel[1]||~sel[0]);
    always @(*) case(sel)
        3'b000,3'b111:data=130'h0;
        3'b001,3'b010:data=src;
        3'b101,3'b110:data=~src;
        3'b011:data={src[128:0],1'b0};
        3'b100:data={~src[128:0],1'b1};
    endcase
endmodule
module ysyx_040066_booth_walloc(
    input clk,block,
    input [63:0] src1_in,//clk0
    input [63:0] src2_in,//clk0
    input [1:0] ALUctr_in,//clk0
    input [1:0] ALUctr,//clk1
    input is_w,//clk1

    output [63:0] result
);
    reg [129:0] x;
    reg [65:0] y;
    always @(posedge clk) if(~block) begin
        x[63:0]<=src1_in;
        x[129:64]<={66{src1_in[63]&&(ALUctr_in[1]^ALUctr_in[0])}};
        y[63:0]<=src2_in;
        y[65:64]<={2{src2_in[63]&&~ALUctr_in[1]}};
    end

    //pre_work
    wire [4289:0] part_group;
    wire [32:0] part_cout;
    ysyx_040066_walloc_prework part0(
        .src(x),.sel({y[1:0],1'b0}),
        .data(part_group[129:0]),.cout(part_cout[0])
    );

    genvar i;
    generate for(i=1;i<33;i=i+1) begin:gen_walloc_prework
        ysyx_040066_walloc_prework part(
            .src({x[129-2*i:0],{2*i{1'b0}}}),.sel(y[i*2+1:i*2-1]),
            .data(part_group[(i+1)*130-1:i*130]),.cout(part_cout[i])
        );
    end endgenerate
    
    //switch
    wire [1429:0] part11,part12,part13;//130*11
    ysyx_040066_switch switch(.part_group(part_group),.sw_group1(part11),.sw_group2(part12),.sw_group3(part13));
    //always @(*) if(~clk)$display("CALC_NOW:%d %d",x,y);
    //walloc_tree
    //first
    wire [1429:0] wt_cout1,wt_s1;//11*130
    assign wt_cout1 = ( part11 & part12 ) | ( part11 & part13 ) | ( part12 & part13 );
    assign wt_s1= part11 ^ part12 ^ part13 ;
    /*always @(*) begin
        if(~clk) $display("11:%b %b %b,%b %b",part11[32:0],part12[32:0],part13[32:0],wt_cout1[32:0],wt_s1[32:0]);
    end*/

    //second
    wire [909:0] wt_cout2,wt_s2,part21,part22,part23; //7*130 22
    assign {part21[6:0],part22[6:0],part23[6:0]}={wt_s1[10:0],part_cout[9:0]};
    genvar x2;
    generate for(x2=1;x2<130;x2=x2+1) begin
        assign {part21[x2*7+6:x2*7],part22[x2*7+6:x2*7],part23[x2*7+6:x2*7]}={
            wt_s1[x2*11+10:x2*11],
            wt_cout1[x2*11+9-11:x2*11-11]
            };
    end endgenerate
    assign wt_cout2 = ( part21 & part22 ) | ( part21 & part23 ) | ( part22 & part23 );
    assign wt_s2= part21 ^ part22 ^ part23 ;
    /*always @(*) begin
        if(~clk) $display("22:%b %b %b,%b %b",part21[32:0],part22[32:0],part23[32:0],wt_cout2[32:0],wt_s2[32:0]);
    end*/

    //third
    wire [649:0] wt_cout3,wt_s3,part31,part32,part33; //5*130 15
    assign {part31[4:0],part32[4:0],part33[4:0]}={wt_s2[6:0],part_cout[17:10]};
    genvar x3;
    generate for(x3=1;x3<130;x3=x3+1) begin
        assign {part31[x3*5+4:x3*5],part32[x3*5+4:x3*5],part33[x3*5+4:x3*5]}={
            wt_s2[x3*7+6:x3*7],
            wt_cout1[x3*11+10-11],wt_cout2[x3*7+6-7:x3*7-7]
            };
    end endgenerate
    assign wt_cout3 = ( part31 & part32 ) | ( part31 & part33 ) | ( part32 & part33 );
    assign wt_s3= part31 ^ part32 ^ part33 ;
    /*always @(*) begin
        if(~clk) $display("33:%b %b %b,%b %b",part31[32:0],part32[32:0],part33[32:0],wt_cout3[32:0],wt_s3[32:0]);
    end*/

    //fourth
    wire [389:0] wt_cout4,wt_s4,part41,part42,part43; //3*130 10
    genvar x4;
    assign {part41[2:0],part42[2:0],part43[2:0]}={wt_s3[4:0],part_cout[21:18]};
    generate for(x4=1;x4<130;x4=x4+1) begin
        assign {part41[x4*3+2:x4*3],part42[x4*3+2:x4*3],part43[x4*3+2:x4*3]}={
            wt_s3[x4*5+4:x4*5],
            wt_cout3[x4*5+3-5:x4*5-5]
            };
    end endgenerate
    assign wt_cout4 = ( part41 & part42 ) | ( part41 & part43 ) | ( part42 & part43 );
    assign wt_s4= part41 ^ part42 ^ part43 ;
    /*always @(*) begin
        if(~clk) $display("44:%b %b %b,%b %b",part41[32:0],part42[32:0],part43[32:0],wt_cout4[32:0],wt_s4[32:0]);
    end*/

    //fifth
    wire [259:0] wt_cout5,wt_s5,part51,part52,part53;//2*130 7
    assign {part51[1:0],part52[1:0],part53[1:0]}={wt_s4[2:0],part_cout[24:22]};
    genvar x5;
    generate for(x5=1;x5<130;x5=x5+1) begin
        assign {part51[x5*2+1:x5*2],part52[x5*2+1:x5*2],part53[x5*2+1:x5*2]}={
            wt_s4[x5*3+2:x5*3],
            wt_cout3[x5*5+4-5],wt_cout4[x5*3+1-3:x5*3-3]
            };
    end endgenerate
    assign wt_cout5 = ( part51 & part52 ) | ( part51 & part53 ) | ( part52 & part53 );
    assign wt_s5= part51 ^ part52 ^ part53 ;
    /*always @(*) begin
        if(~clk) $display("55:%b %b %b,%b %b",part51[32:0],part52[32:0],part53[32:0],wt_cout5[32:0],wt_s5[32:0]);
    end*/

    //sixth
    wire [129:0] wt_cout6,wt_s6,part61,part62,part63;//5
    genvar x6;
    assign {part61[0],part62[0],part63[0]}={wt_s5[1:0],part_cout[25]};
    generate for(x6=1;x6<130;x6=x6+1) begin 
        assign {part61[x6],part62[x6],part63[x6]}={
            wt_s5[x6*2+1:x6*2],
            wt_cout4[x6*3+2-3]
            };
    end endgenerate
    assign wt_cout6 = ( part61 & part62 ) | ( part61 & part63 ) | ( part62 & part63 );
    assign wt_s6= part61 ^ part62 ^ part63 ;
    /*always @(*) begin
        if(~clk) $display("66:%b %b %b,%b %b",part61[32:0],part62[32:0],part63[32:0],wt_cout6[32:0],wt_s6[32:0]);
    end*/

    //seventh
    wire [129:0] wt_cout7,wt_s7,part71,part72,part73;//4
    genvar x7;
    assign {part71[0],part72[0],part73[0]}={wt_s6[0],part_cout[27:26]};
    generate for(x7=1;x7<130;x7=x7+1) begin
        assign {part71[x7],part72[x7],part73[x7]}={
            wt_s6[x7],
            wt_cout5[x7*2+1-2:x7*2-2]
            };
    end endgenerate
    assign wt_cout7 = ( part71 & part72 ) | ( part71 & part73 ) | ( part72 & part73 );
    assign wt_s7= part71 ^ part72 ^ part73 ;
    /*always @(*) begin
        if(~clk) $display("77:%b %b %b,%b %b",part71[32:0],part72[32:0],part73[32:0],wt_cout7[32:0],wt_s7[32:0]);
    end*/

    //finial    
    wire [129:0] wt_c;
    wire [129:0] wt_s,partf1,partf2,partf3;
    genvar xf;
    assign {partf1[0],partf2[0],partf3[0]}={wt_s7[0],part_cout[29:28]};
    generate for(xf=1;xf<130;xf=xf+1) begin
        assign {partf1[xf],partf2[xf],partf3[xf]}={
            wt_s7[xf],
            wt_cout6[xf-1],wt_cout7[xf-1]
            };
    end endgenerate
    assign wt_c=( partf1 & partf2 ) | ( partf1 & partf3 ) | ( partf2 & partf3 );
    assign wt_s= partf1 ^ partf2 ^ partf3;
    /*always @(*) begin
        if(~clk) $display("ff:%b %b %b,%b %b",partf1[32:0],partf2[32:0],partf3[32:0],wt_c[32:0],wt_s[32:0]);
    end*/

    reg is_long;
    reg is_w_native;
    reg [129:0] wt_c_native;
    reg [129:0] wt_s_native;
    reg [1:0] part_cout_native;

    always @(posedge clk) if(~block) begin
        is_long<=ALUctr[0]||ALUctr[1];
        is_w_native<=is_w;
        wt_c_native<={wt_c[128:0],part_cout[30]};
        wt_s_native<=wt_s;
        part_cout_native[1]<=part_cout[32]||part_cout[31];
        part_cout_native[0]<=part_cout[32]^part_cout[31];
    end

    wire [129:0] final_line;
    assign final_line=wt_c_native+wt_s_native+{128'b0,part_cout_native};
    assign result=is_long?final_line[127:64]:(is_w_native?{{32{final_line[31]}},final_line[31:0]}:final_line[63:0]);
    //always @(*) begin
        //if(~clk) $display("final_line=%h",final_line);
    //end
endmodule
module ysyx_040066_switch (
    input [4289:0] part_group,

    output [1429:0] sw_group1,sw_group2,sw_group3
);
    wire [129:0] po32,po31,po30,po29,po28,po27,po26,po25,po24,po23,po22,po21,po20,po19,po18,po17,po16,po15,po14,po13,po12,po11,po10,po09,po08,po07,po06,po05,po04,po03,po02,po01,po00;

    assign {po32,po31,po30,po29,po28,po27,po26,po25,po24,po23,po22,po21,po20,po19,po18,po17,po16,po15,po14,po13,po12,po11,po10,po09,po08,po07,po06,po05,po04,po03,po02,po01,po00}=part_group;

    genvar x;
    generate
        for(x=0;x<130;x=x+1) begin : genswitch
            assign sw_group1[x*11+10:x*11]={po32[x],po31[x],po30[x],po29[x],po28[x],po27[x],po26[x],po25[x],po24[x],po23[x],po22[x]};
            assign sw_group2[x*11+10:x*11]={po21[x],po20[x],po19[x],po18[x],po17[x],po16[x],po15[x],po14[x],po13[x],po12[x],po11[x]};
            assign sw_group3[x*11+10:x*11]={po10[x],po09[x],po08[x],po07[x],po06[x],po05[x],po04[x],po03[x],po02[x],po01[x],po00[x]};
        end
    endgenerate

endmodule
module ysyx_040066_ID (
    input clk,rst,block,

    input valid_in,instr_error_rd,csr_error,rs1_valid,rs2_valid,jmp,
    input [31:0] instr_read,
    input [63:0] pc_in,
    output reg rs_block
);
    wire valid;

    wire [31:0] imm;
    wire [4:0] rd;
    wire [1:0] ALUBSrc;
    wire ALUASrc;
    wire [5:0] ALUctr;
    wire [2:0] Branch;
    wire MemWr,MemRd;
    wire RegWr;
    wire csr,ecall,mret;
    wire [2:0] MemOp;
    wire [11:0] csr_addr;
    wire [1:0] error;
    wire [63:0] pc;
    wire done;
    wire fence_i;

    reg valid_native;
    reg [63:0] pc_native;
    always @(posedge clk) if(~block) begin
        pc_native<=pc_in;
    end

    always @(posedge clk) valid_native<=~rst&&(block?valid_native:valid_in);

    reg [31:0] prev_instr;
    wire [31:0] instr;
    reg prev_block,instr_error_prev;
    always @(posedge clk) prev_instr<=instr;
    always @(posedge clk) if(~block) instr_error_prev<=instr_error_rd;
    always @(posedge clk) prev_block<=block;
    wire instr_error;
    assign instr=prev_block?prev_instr:instr_read;
    assign instr_error=prev_block?instr_error_prev:instr_error_rd;
    assign fence_i=(instr==32'h0000_100f);

    wire [2:0] ExtOp;
    wire err_temp;
    wire [5:0] ALUctr_line;


    ysyx_040066_Decode decode(
        .OP(instr[6:0]),.Funct3(instr[14:12]),.Funct7(instr[31:25]),
        .ExtOp(ExtOp),.RegWr(RegWr),.ALUASrc(ALUASrc),.ALUBSrc(ALUBSrc),.ALUctr_out(ALUctr_line),.MemRd(MemRd),
        .Branch(Branch),.MemWr(MemWr),.MemOp(MemOp),.csr(csr),.error(err_temp)
    );

    ysyx_040066_IMM ysyx_040066_imm(
        .instr(instr[31:7]),.ExtOp(ExtOp),.imm(imm)
    );

    assign error[0]=instr_error;
    assign error[1]=err_temp||(csr&&(
            (instr[14:12]==3'b000&&(instr!=32'h0010_0073&&instr!=32'h0000_0073&&instr!=32'h3020_0073))||
            (instr[14:12]!=3'b000&&csr_error)))||
            (instr[6:2]==5'b00011&&!fence_i);

    assign done=(instr==32'h0010_0073);
    assign ecall=(instr==32'h0000_0073);
    assign mret=(instr==32'h3020_0073);
    assign rd=instr[11:7];
    assign pc=pc_native;
    assign ALUctr=ALUctr_line;
    assign csr_addr=instr[31:20];
//    assign is_Multi=ALUctr_line[5]&&~ALUctr_line[4];
//    assign is_Div=ALUctr_line[5]&&ALUctr_line[4];
//    assign is_ex=~ALUctr_line[5];

    always @(*) case(ExtOp[1:0])
        2'b00:rs_block=~rs1_valid&&~jmp&&valid_native;
        2'b10,2'b11:rs_block=(~rs1_valid||~rs2_valid)&&~jmp&&valid_native;
        default:rs_block=0;
    endcase

    assign valid=valid_native&&~rs_block&&~jmp;

    `ifdef INSTR
    always @(*) begin
        if(~rst&&~clk) $display("ID:pc=%h,instr=%h,valid=%h,MemWr=%b,rs_block=%b,error=%b",pc,instr,valid,MemWr,rs_block,error);
//        $display("Instr=%h,error=%h",instr,error);
    end
    `endif

endmodule

module ysyx_040066_Decode (
    input [6:0] OP,
    input [2:0] Funct3,
    input [6:0] Funct7,
    output reg [2:0] ExtOp,
    output reg [1:0] ALUBSrc,
    output ALUASrc,
    output [5:0] ALUctr_out,
    output reg [2:0] Branch,
    output MemWr,MemRd,RegWr,
    output [2:0] MemOp,
    output csr,
    output error
);
    assign MemOp=Funct3;
    assign MemWr=(OP[6:2]==5'b01000);
    assign MemRd=(OP[6:2]==5'b00000);
    assign RegWr=(OP[6:2]!=5'b11000&&OP[6:2]!=5'b01000);
    assign ALUASrc=(OP[6:2]==5'b00101||OP[6:2]==5'b11011||OP[6:2]==5'b11001);
    reg [3:0] ALUctr;reg err;
    assign ALUctr_out[5]=((OP[6:2]==5'b01110||OP[6:2]==5'b01100)&&Funct7[0]);
    assign ALUctr_out[4]=OP[3]&~OP[2];
    assign ALUctr_out[3:0]=ALUctr;
    assign csr=(OP[6:2]==5'b11100);
    always @(*)//ALUctr
    case(OP[6:2])//ExtOp:I=000,U=101,B=011,S=010,J=001
        5'b00011:begin ExtOp=3'b000;ALUBSrc=0;ALUctr=4'b0000;Branch=3'b000;err=0; end
        5'b11100:begin ExtOp=3'b000;ALUBSrc=3;ALUctr=4'b1111;Branch=3'b000; case(Funct3)
            3'b000,//ecall,ebreak,mret
            3'b001,//csrrw
            3'b101,//csrrwi
            3'b010,//csrrs
            3'b110,//csrrsi
            3'b011,//csrrc
            3'b111: begin                                                  err=0; end//csrrci
           default: begin                                                  err=1; end 
        endcase end
        5'b01101:begin ExtOp=3'b101;ALUBSrc=2;ALUctr=4'b1111;Branch=3'b000;err=0; end//lui
        5'b00101:begin ExtOp=3'b101;ALUBSrc=2;ALUctr=4'b0000;Branch=3'b000;err=0; end//auipc
        5'b11011:begin ExtOp=3'b001;ALUBSrc=1;ALUctr=4'b0000;Branch=3'b001;err=0; end//jal
        5'b11001:begin ExtOp=3'b000;ALUBSrc=1;ALUctr=4'b0000;Branch=3'b010; case(Funct3)
            3'b000:begin                                                   err=0; end//jalr
           default:begin                                                   err=1; end//ERROR
        endcase end
        5'b11000:begin ExtOp=3'b011;ALUBSrc=0;case(Funct3) 
            3'b000:begin                        ALUctr=4'b0010;Branch=3'b100;err=0; end//beq
            3'b001:begin                        ALUctr=4'b0010;Branch=3'b101;err=0; end//bne
            3'b100:begin                        ALUctr=4'b0010;Branch=3'b110;err=0; end//blt
            3'b101:begin                        ALUctr=4'b0010;Branch=3'b111;err=0; end//bge
            3'b110:begin                        ALUctr=4'b0011;Branch=3'b110;err=0; end//bltu
            3'b111:begin                        ALUctr=4'b0011;Branch=3'b111;err=0; end//bgeu
           default:begin                        ALUctr=4'b0000;Branch=3'b000;err=1; end//ERROR
        endcase end
        5'b00000:begin ExtOp=3'b000;ALUBSrc=2;ALUctr=4'b0000;Branch=3'b000; case(Funct3) 
            3'b000,//lb
            3'b001,//lh
            3'b010,//lw
            3'b011,//ld
            3'b100,//lbu
            3'b101,//lhu
            3'b110:begin                                                     err=0; end//lwu
           default:begin                                                     err=1; end//ERROR
        endcase end
        5'b01000:begin ExtOp=3'b010;ALUBSrc=2;ALUctr=4'b0000;Branch=3'b000; case(Funct3) 
            3'b000,//sb
            3'b001,//su
            3'b010,//sw
            3'b011:begin                                                     err=0; end//sd
           default:begin                                                     err=1; end//ERROR
        endcase end
        5'b00100:begin //addi.. 
            ExtOp=3'b000;ALUBSrc=2;ALUctr[2:0]=Funct3;Branch=3'b000;
            ALUctr[3]=Funct7[5]&&(Funct3==3'b101);
            err=(Funct3==3'b001&&Funct7[6:1]!=6'b000000)||(Funct3==3'b101&&(Funct7[6:1]!=6'b000000&&Funct7[6:1]!=6'b010000)); 
        end
        5'b00110:begin //addiw..
            ExtOp=3'b000;ALUBSrc=2;ALUctr[2:0]=Funct3;Branch=3'b000;
            ALUctr[3]=Funct7[5]&&(Funct3==3'b101);
            err=(Funct3!=3'b000)&&(Funct3!=3'b001||Funct7!=7'b0000000)&&(Funct3!=3'b101||(Funct7!=7'b0000000&&Funct7!=7'b0100000)); 
        end
        5'b01100:begin //add..
            ExtOp=3'b010;ALUBSrc=0;ALUctr[2:0]=Funct3;Branch=3'b000;
            ALUctr[3]=Funct7[5];
            err=(Funct7!=7'b0000000&&Funct7!=7'b0100000&&Funct7!=7'b0000001);
        end
        5'b01110:begin //addw..
            ExtOp=3'b010;ALUBSrc=0;ALUctr[2:0]=Funct3;Branch=3'b000;
            ALUctr[3]=Funct7[5];
            err=(Funct7!=7'b0000000&&Funct7!=7'b0100000&&!(Funct3==3'b000||Funct3==3'b001||Funct3==3'b101))&&(Funct7!=7'b0000001||Funct3==3'b001||Funct3==3'b010||Funct3==3'b011);
        end
        default :begin ExtOp=3'b000;ALUBSrc=0;ALUctr=4'b0000;Branch=3'b000;err=1; end//ERROR
    endcase

    assign error=err||!(OP[1:0]==2'b11);

    //always @(*) begin
        
        //$display("OP=%b,done=%b",OP,done);
    //end

endmodule

module ysyx_040066_IMM (
    input [31:7] instr,
    input [2:0] ExtOp,
    output [31:0] imm
);//ExtOp:I=000,U=101,B=011,S=010,J=001
    assign imm[31]=instr[31];
    assign imm[30:20]=ExtOp[2]?instr[30:20]:{11{instr[31]}};
    assign imm[19:12]=(~ExtOp[1]&ExtOp[0])?instr[19:12]:{8{instr[31]}};
    assign imm[11]   =ExtOp[2]?1'b0://U
                      ~ExtOp[0]?instr[31]://IS
                      ExtOp[1] ?instr[7] :instr[20];//B-J
    assign imm[10: 5]=ExtOp[2] ?{6{1'b0}}:instr[30:25];
    assign imm[ 4: 1]=ExtOp[2] ?{4{1'b0}}:
                      ExtOp[1] ?instr[11:8]:instr[24:21];
    assign imm[ 0]   =ExtOp[0] ?1'b0://BUJ
                      ExtOp[1] ?instr[7]:instr[20];//S-B
endmodule
module ysyx_040066_cache_top(
    input clk,rst,force_update,
    input valid,op,read,
    input [4:0] index,
    input [20:0] tag,
    input [2:0] offset,
    input [7:0] wstrb,
    input [63:0] wdata,
    output ok,
    output ready,
    output [63:0] rdata,
    output rw_error,
    input fence,

    `ifndef TEST_CACHE
    input [127:0] ram_Q [3:0],
    output [127:0] ram_D [3:0],
    output [127:0] ram_BWEN,
    output [5:0] ram_A,
    output ram_WEN,
    `endif

    //AXI
    output [31:0] addr,
    output rd_req,
    input rd_ready,
    input rd_error,
    input rd_last,
    input [63:0] rd_data,
    output wr_req,
    output [511:0] wr_data,
    input wr_ready,wr_error
);
    `ifdef TEST_CACHE
    wire [127:0] ram_Q [3:0];
    wire [127:0] ram_D [3:0];
    wire [127:0] ram_BWEN;
    wire ram_WEN;
    wire [5:0] ram_A;
    `endif

    ysyx_040066_cache cache(
        .clk(clk),.rst(rst),.force_update(force_update),

        .valid(valid),.op(op),.read(read),
        .index(index),.tag(tag),.offset(offset),
        .wstrb(wstrb),.wdata(wdata),.ok(ok),.ready(ready),
        .rdata(rdata),.rw_error(rw_error),.fence(fence),

        .addr(addr),.rd_req(rd_req),.rd_ready(rd_ready),
        .rd_error(rd_error),.rd_last(rd_last),.rd_data(rd_data),
        .wr_req(wr_req),.wr_data(wr_data),.wr_ready(wr_ready),.wr_error(wr_error),

        .Q(ram_Q),.D(ram_D),.A(ram_A),.BWEN(ram_BWEN),.WEN(ram_WEN)
    );

    `ifdef TEST_CACHE
    genvar x;generate for(x=0;x<4;x=x+1) begin: SRAM
        S011HD1P_X32Y2D128_BW sram(
            .Q(ram_Q[x]),.CLK(clk),.CEN(1'b0),.BWEN(ram_BWEN),
            .A(ram_A),.D(ram_D[x]),.WEN(ram_WEN)
        );
    end endgenerate
    `endif

endmodule
module ysyx_040066_cache #(TAG_LEN=21,IDNEX_LEN=5,OFFSET_LEN=3,INDEX_NUM=64,LINE_LEN=512)(
    input clk,rst,force_update,

    //CPU
    //[63:32] [31:11] [10:6] [5:3] [2:0]
    input valid,op,read,//op 0:read,1:write
    input [IDNEX_LEN-1:0] index,
    input [TAG_LEN-1:0] tag,
    input [OFFSET_LEN-1:0] offset,
    input [7:0] wstrb,
    input [63:0] wdata,
    output ok,
    output ready,
    output reg [63:0] rdata,
    output reg rw_error,
    input fence,

    //AXI
    output reg [31:0] addr,
    output reg rd_req,
    input rd_ready,
    input rd_error,
    input rd_last,
    input [63:0] rd_data,
    output reg wr_req,
    output [LINE_LEN-1:0] wr_data,
    input wr_ready,wr_error,

    //CACHE
    input [127:0] Q [3:0],
    output [127:0] D [3:0],
    output [5:0] A,
    output WEN,
    output [127:0] BWEN
);
    wire uncache;
    assign uncache=~tag[TAG_LEN-1]&&valid;
    //data:
    reg [TAG_LEN-1:0] cache_tag [INDEX_NUM-1:0];
    reg [INDEX_NUM-1:0] cache_valid;
    reg [INDEX_NUM-1:0] cache_dirty;
    reg [(INDEX_NUM/2)-1:0] cache_freq;
    //control
    reg [1:0] status;//00:valid,10:waiting for read,11:wating for write,01:fence
    reg [IDNEX_LEN:0] count;

    wire hit,hit_0,hit_1;
    assign hit_0=(tag==cache_tag[{index,1'b0}])&&cache_valid[{index,1'b0}];
    assign hit_1=(tag==cache_tag[{index,1'b1}])&&cache_valid[{index,1'b1}];
    assign hit=(hit_0||hit_1)&&(status==2'b00);
    wire miss,refill_pos,dirty;
    assign miss=~hit_0&&~hit_1&&(status==2'b00);
    assign refill_pos=(~cache_valid[{index,1'b0}]||~cache_valid[{index,1'b1}])?cache_valid[{index,1'b0}]:
                    ( (cache_dirty[{index,1'b0}]^cache_dirty[{index,1'b1}])?cache_dirty[{index,1'b0}]:~cache_freq[index] );
    assign dirty=cache_dirty[{index,refill_pos}]&&cache_valid[{index,refill_pos}];
    assign ready=(status!=2'b01);

    wire ready_to_read,ready_to_write;
    assign ready_to_read=rd_req&&rd_ready;
    assign ready_to_write=wr_ready&&wr_req;

    reg uncached_done;
    always @(posedge clk) begin
        if(rst) status<=2'b00;
        else if(fence&&status==2'b00) status<=2'b01;
        else if(valid&&miss&&~uncached_done) status<={1'b1,uncache?op:dirty};
        else if(ready_to_read&&rd_last) status<=2'b00;
        else if(status==2'b11&&ready_to_write) status<=uncache?2'b00:2'b10;
        else if(status==2'b01&&(&count)&&(ready_to_write||~cache_dirty[{(IDNEX_LEN+1){1'b1}}]||~cache_valid[{(IDNEX_LEN+1){1'b1}}])) status<=2'b00;
    end

    reg nxt_clear;
    always @(posedge clk)begin
        if(rst||(ready_to_read&&rd_last)) nxt_clear<=0;
        else if(rd_req&&force_update) nxt_clear<=1; 
    end

    reg [2:0] rd_count;
    always @(posedge clk) begin
        if(rst||(ready_to_read&&rd_last)) rd_count<=3'b0;
        else if(ready_to_read&&!uncache) rd_count<=rd_count+3'b1;
        else if(status!=2'b10) rd_count<=3'b0;
    end

    wire [LINE_LEN-1:0] rd;

    reg [63:0] uncached_data;
    always @(posedge clk) if(~uncached_done) uncached_data<=rd_data;
    always @(posedge clk) begin
        if(rst) uncached_done<=0;
        else if(uncache&&(ready_to_read&&status==2'b10||ready_to_write&&status==2'b11)) uncached_done<=1;
        else if(uncache&&uncached_done&&read) uncached_done<=0;
    end

    assign ok=uncache?uncached_done:hit;

    reg [OFFSET_LEN-1:0] offset_native;
    always@(posedge clk) offset_native<=offset;
    reg uncache_native;
    always@(posedge clk) uncache_native<=uncache;

    always @(*) begin 
        if(uncache_native) rdata=uncached_data; 
        else case (offset_native)
            3'b000:rdata=rd[ 63:  0];
            3'b001:rdata=rd[127: 64];
            3'b010:rdata=rd[191:128];
            3'b011:rdata=rd[255:192];
            3'b100:rdata=rd[319:256];
            3'b101:rdata=rd[383:320];
            3'b110:rdata=rd[447:384];
            3'b111:rdata=rd[511:448];
        endcase
    end
    assign wr_data=uncache?{rd[511:64],wdata}:rd;
    always @(posedge clk) rw_error<=uncache&&(op?wr_error:rd_error);

    always @(posedge clk) begin
        if(rst||force_update) begin
            cache_valid<={INDEX_NUM{1'b0}};
            cache_freq<={(INDEX_NUM/2){1'b0}};
        end else if(valid&&hit) begin
            if(op) begin
                cache_dirty[{index,hit_1}]<=1;
                `ifdef R_W
                $display("simple write on %b,tag=%h,index=%h,offset=%h,data=%h,wmask=%b,hit_0=%b,tt=%h",hit_1,tag,index,offset,wdata,wstrb,hit_0,cache_tag[{index,hit_1}]);
                `endif
            end
            cache_freq[index]<=hit_1;
        end else if(ready_to_read&&rd_last&&~uncache) begin
            //cache_data[{index,refill_pos}]<=rd_data;
            cache_tag[{index,refill_pos}]<=tag;
            cache_valid[{index,refill_pos}]<=~nxt_clear;
            cache_dirty[{index,refill_pos}]<=0;
            `ifdef R_W
            $display("Read on %b tag=%h,index=%h",refill_pos,tag,index);
            //for(xx=0;xx<8;xx=xx+1) $display("rd_data[%d]=%h",xx[2:0],rd_data[{509'h0,xx[2:0]}*{512'd64}+{512'd63}:{509'h0,xx[2:0]}*{512'd64}]);
            `endif
        end else if(ready_to_write) begin
            if(status==2'b11&&~uncache) cache_dirty[{index,refill_pos}]<=0;
            else if(status==2'b01) cache_dirty[count]<=0;
            `ifdef R_W
            $display("Write on %b tag=%h,index=%h",refill_pos,tag,index);
            //for(xx=0;xx<8;xx++) $display("wr_data[%d]=%h",xx[2:0],wr_data[{509'h0,xx[2:0]}*{512'd64}+{512'd63}:{509'h0,xx[2:0]}*{512'd64}]);
            `endif
        end
    end

    always @(posedge clk) begin
        if(rst||status!=2'b01) count<={(IDNEX_LEN+1){1'b0}};
        else count<=count+{{IDNEX_LEN{1'b0}},ready_to_write||~cache_dirty[count]||~cache_valid[count]};
    end

    reg start_fence;
    always @(posedge clk) start_fence<=fence&&(status==2'b00);

    always @(posedge clk) begin
        if(rst) {rd_req,wr_req}<=2'b00;
        else if(valid&&miss&&~uncached_done) begin
            rd_req<=uncache?~op:~dirty;
            wr_req<=uncache?op:dirty;
            addr<={dirty&&~uncache?cache_tag[{index,refill_pos}]:tag,index,6'b0};
        end else if(status==2'b11&&ready_to_write) begin
            rd_req<=~uncache;wr_req<=0;
            addr<={tag,index,6'b0};
        end else if(ready_to_read&&rd_last) begin
            rd_req<=0;
        end else if(status==2'b01) begin
            addr<={cache_tag[count],count[IDNEX_LEN:1],6'b0};
            wr_req<=cache_valid[count]&&cache_dirty[count]&&~ready_to_write&&~start_fence;
        end
    end

    genvar i,j;
    generate for(i=0;i<8;i=i+1) for(j=0;j<8;j=j+1) 
        assign BWEN[j*2+1+i*16:j*2+i*16]=~{2{ready_to_read?rd_count==i[2:0]:(offset==i[2:0])&&wstrb[j]}};     
    endgenerate    

    assign WEN=(~(valid&&hit&&op)&&~ready_to_read)||rst||uncache;
    assign A=(status==2'b01)?count:{index,hit?hit_1:refill_pos};

    wire [LINE_LEN-1:0] wrr_data;
    assign wrr_data={8{ready_to_read?rd_data:wdata}};
    genvar x,y;generate for(x=0;x<4;x=x+1) for(y=0;y<64;y=y+1) begin
        assign rd[x*2+1+y*8:x*2+y*8]=Q[x][y*2+1:y*2];
        assign D[x][y*2+1:y*2]=wrr_data[x*2+1+y*8:x*2+y*8];
    end endgenerate

    `ifdef fully_info
    always @(*) begin
        if(~rst&&~clk)begin
            $display("Cache:status=%b,tag=%h,index=%h,offset_native=%h,hit_0=%b,hit_1=%b,uncache=%b,valid=%b,rd_count=%b,ready_to_read=%b,last=%b",status,tag,index,offset_native,hit_0,hit_1,uncache,valid,rd_count,ready_to_read,rd_last);
            //$display("Cache:wen=%h,rd=%h",BWEN,rd);
        end
    end
    `endif
endmodule
module ysyx_040066 (
    input                               clock,
    input                               reset,
    input                               io_interrupt,

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

    output [5:0]                        io_sram0_addr,
    output                              io_sram0_cen,
    output                              io_sram0_wen,
    output [127:0]                      io_sram0_wmask,
    output [127:0]                      io_sram0_wdata,
    input  [127:0]                      io_sram0_rdata,
    output [5:0]                        io_sram1_addr,
    output                              io_sram1_cen,
    output                              io_sram1_wen,
    output [127:0]                      io_sram1_wmask,
    output [127:0]                      io_sram1_wdata,
    input  [127:0]                      io_sram1_rdata,
    output [5:0]                        io_sram2_addr,
    output                              io_sram2_cen,
    output                              io_sram2_wen,
    output [127:0]                      io_sram2_wmask,
    output [127:0]                      io_sram2_wdata,
    input  [127:0]                      io_sram2_rdata,
    output [5:0]                        io_sram3_addr,
    output                              io_sram3_cen,
    output                              io_sram3_wen,
    output [127:0]                      io_sram3_wmask,
    output [127:0]                      io_sram3_wdata,
    input  [127:0]                      io_sram3_rdata,
    output [5:0]                        io_sram4_addr,
    output                              io_sram4_cen,
    output                              io_sram4_wen,
    output [127:0]                      io_sram4_wmask,
    output [127:0]                      io_sram4_wdata,
    input  [127:0]                      io_sram4_rdata,
    output [5:0]                        io_sram5_addr,
    output                              io_sram5_cen,
    output                              io_sram5_wen,
    output [127:0]                      io_sram5_wmask,
    output [127:0]                      io_sram5_wdata,
    input  [127:0]                      io_sram5_rdata,
    output [5:0]                        io_sram6_addr,
    output                              io_sram6_cen,
    output                              io_sram6_wen,
    output [127:0]                      io_sram6_wmask,
    output [127:0]                      io_sram6_wdata,
    input  [127:0]                      io_sram6_rdata,
    output [5:0]                        io_sram7_addr,
    output                              io_sram7_cen,
    output                              io_sram7_wen,
    output [127:0]                      io_sram7_wmask,
    output [127:0]                      io_sram7_wdata,
    input  [127:0]                      io_sram7_rdata,

    
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
    output [3:0] io_slave_rid
);
    //dummy for slave
    assign io_slave_awready=0;
    assign io_slave_wready=0;
    assign io_slave_bvalid=0;
    assign io_slave_bresp=2'b11;
    assign io_slave_bid={4{1'b0}};
    assign io_slave_arready=0;
    assign io_slave_rvalid=0;
    assign io_slave_rresp=2'b11;
    assign io_slave_rdata=64'b0;
    assign io_slave_rlast=0;
    assign io_slave_rid={4{1'b0}};

    reg [63:0] rd_data;
    reg [63:0] ins_data;
    wire [511:0] wr_data;

    wire ins_req,ins_burst,ins_ready,ins_err,ins_last;
    wire [63:0] ins_addr;
	wire done,error,valid;

    wire rd_req,rd_burst,rd_ready,rd_err,rd_last;
    wire [2:0] rd_len;
    wire [63:0] rd_addr;

    wire wr_req,wr_burst,wr_ready,wr_err;
    wire [2:0] wr_len;
    wire [7:0] wr_mask;
    wire [63:0] wr_addr;

    wire [127:0] ram_Q [7:0];
    wire [127:0] ram_D [7:0];
    wire [127:0] ram_BWEN [1:0];
    wire [5:0] ram_A [1:0];
    wire ram_WEN [1:0];

    wire rst; assign rst=reset;
    wire clk; assign clk=clock;


    ysyx_040066_top top(
        .clk(clock),.rst(rst),.done(done),.error(error),.valid(valid),
        .ins_req(ins_req),.ins_burst(ins_burst),.ins_addr(ins_addr),.ins_last(ins_last),
        .ins_ready(ins_ready),.ins_err(ins_err),.ins_data(ins_data),

        .rd_req(rd_req),.rd_burst(rd_burst),.rd_len(rd_len),.rd_addr(rd_addr),.rd_last(rd_last),
        .rd_ready(rd_ready),.rd_err(rd_err),.rd_data(rd_data),

        .wr_req(wr_req),.wr_burst(wr_burst),.wr_len(wr_len),.wr_addr(wr_addr),
        .wr_ready(wr_ready),.wr_err(wr_err),.wr_mask(wr_mask),.wr_data(wr_data),

        .ram_Q(ram_Q),.ram_D(ram_D),.ram_BWEN(ram_BWEN),.ram_A(ram_A),.ram_WEN(ram_WEN)
    );

    `ifdef WORKBENCH
    genvar x;generate for(x=0;x<8;x=x+1) begin:sram
        S011HD1P_X32Y2D128_BW ram(
            .CLK(clk),.CEN(0),
            .WEN(ram_WEN[x<4?0:1]),.BWEN(ram_BWEN[x<4?0:1]),.A(ram_A[x<4?0:1]),
            .Q(ram_Q[x]),.D(ram_D[x])
        );
    end endgenerate
    `else
    assign io_sram0_addr=ram_A[0];
    assign io_sram0_cen=0;
    assign io_sram0_wen=ram_WEN[0];
    assign io_sram0_wmask=ram_BWEN[0];
    assign io_sram0_wdata=ram_D[0];
    assign ram_Q[0]=io_sram0_rdata;
    assign io_sram1_addr=ram_A[0];
    assign io_sram1_cen=0;
    assign io_sram1_wen=ram_WEN[0];
    assign io_sram1_wmask=ram_BWEN[0];
    assign io_sram1_wdata=ram_D[1];
    assign ram_Q[1]=io_sram1_rdata;
    assign io_sram2_addr=ram_A[0];
    assign io_sram2_cen=0;
    assign io_sram2_wen=ram_WEN[0];
    assign io_sram2_wmask=ram_BWEN[0];
    assign io_sram2_wdata=ram_D[2];
    assign ram_Q[2]=io_sram2_rdata;
    assign io_sram3_addr=ram_A[0];
    assign io_sram3_cen=0;
    assign io_sram3_wen=ram_WEN[0];
    assign io_sram3_wmask=ram_BWEN[0];
    assign io_sram3_wdata=ram_D[3];
    assign ram_Q[3]=io_sram3_rdata;
    assign io_sram4_addr=ram_A[1];
    assign io_sram4_cen=0;
    assign io_sram4_wen=ram_WEN[1];
    assign io_sram4_wmask=ram_BWEN[1];
    assign io_sram4_wdata=ram_D[4];
    assign ram_Q[4]=io_sram4_rdata;
    assign io_sram5_addr=ram_A[1];
    assign io_sram5_cen=0;
    assign io_sram5_wen=ram_WEN[1];
    assign io_sram5_wmask=ram_BWEN[1];
    assign io_sram5_wdata=ram_D[5];
    assign ram_Q[5]=io_sram5_rdata;
    assign io_sram6_addr=ram_A[1];
    assign io_sram6_cen=0;
    assign io_sram6_wen=ram_WEN[1];
    assign io_sram6_wmask=ram_BWEN[1];
    assign io_sram6_wdata=ram_D[6];
    assign ram_Q[6]=io_sram6_rdata;
    assign io_sram7_addr=ram_A[1];
    assign io_sram7_cen=0;
    assign io_sram7_wen=ram_WEN[1];
    assign io_sram7_wmask=ram_BWEN[1];
    assign io_sram7_wdata=ram_D[7];
    assign ram_Q[7]=io_sram7_rdata;
    `endif

    // ------------------State Machine------------------
    //read
    //ins ID:1111,rd ID:0000
    reg ins_ar_done,rd_ar_done; reg [2:0] done_status;//[0]:last,[1]:which,[2]:onecircle
    reg [63:0] rdata;
    reg [1:0] rresp;
    reg [3:0] rid;

    wire ar_ins,ar_rd,ins_done,rd_done;
    assign ar_ins=ins_req&&~ins_ar_done;
    assign ar_rd=~ar_ins&&rd_req&&~rd_ar_done;
    assign ins_done=done_status[0]&&done_status[1];
    assign rd_done=done_status[0]&&~done_status[1];
    always @(posedge clk) begin
        if(rst) {ins_ar_done,rd_ar_done}<=2'b00;
        else begin
            if(ar_ins && io_master_arready && io_master_arvalid) ins_ar_done<=1;
            else if(ins_done) ins_ar_done<=0;

            if(ar_rd  && io_master_arready && io_master_arvalid) rd_ar_done <=1;
            else if(rd_done ) rd_ar_done <=0;
        end
    end
    always @(posedge clk) begin
        if(rst) done_status<=3'b00;
        else if(io_master_rready&&io_master_rvalid) begin
            rdata<=io_master_rdata;
            rid<=io_master_rid;
            rresp<=io_master_rresp;
            done_status<={1'b1,io_master_rid[0],io_master_rlast};
        end else done_status<=3'b00;
    end
    assign ins_ready=rid[0]&&done_status[2];
    assign rd_ready=~rid[0]&&done_status[2];
    assign ins_data=rdata;         assign rd_data=rdata;
    assign ins_last=done_status[0];assign rd_last=done_status[0];
    assign ins_err =rresp[1];      assign rd_err =rresp[1];

    //write
    reg [2:0] count;
    reg aw_done,w_done,b_done;
    reg [1:0] bresp;
    always @(posedge clk) begin
        if(rst) aw_done<=0;
        else if(io_master_awready && io_master_awvalid ) aw_done<=1;
        else if(b_done) aw_done<=0;
    end
    always @(posedge clk) begin
        if(rst) w_done<=0;
        else if(io_master_wready  && io_master_wvalid  ) w_done<=io_master_wlast;
        else if(b_done) w_done<=0;
    end
    always @(posedge clk) begin
        if(rst) count<=3'b0;
        else if(io_master_wready  && io_master_wvalid  && wr_burst) count<=count+3'b1;
    end
    always @(posedge clk) begin
        if(~rst&&io_master_bready && io_master_bvalid) begin
            bresp<=io_master_bresp;
            b_done<=1;
        end
        else b_done<=0;
    end
    assign wr_err=bresp[1];
    assign wr_ready=b_done;
    wire [63:0] wr_r_data [7:0];
    genvar i;generate for(i=0;i<8;i++)
        assign wr_r_data[i]=wr_data[i*64+63:i*64];
    endgenerate

    // ------------------Write Transaction------------------
    wire [3:0] axi_id              = {4{1'b0}};
    // 写地址通道  以下没有备注初始化信号的都可能是你需要产生和用到的
    assign io_master_awvalid   = wr_req&&~aw_done;
    assign io_master_awaddr    = wr_addr[31:0];
    assign io_master_awid      = axi_id;                                                                      //初始化信号即可
    assign io_master_awlen     = wr_burst?8'h7:8'b0;
    assign io_master_awsize    = wr_burst?3'b011:wr_len;
    assign io_master_awburst   = 2'b01;                                                          //初始化信号即可

    // 写数据通道
    assign io_master_wvalid    = wr_req&&aw_done&&~w_done;
    assign io_master_wdata     = wr_r_data[count];
    assign io_master_wstrb     = wr_burst?8'hff:wr_mask;
    assign io_master_wlast     = ~wr_burst||(count==3'h7);                                                    //初始化信号即可

    // 写应答通道
    assign io_master_bready    = 1'b1;

    // ------------------Read Transaction------------------

    // Read address channel signals
    assign io_master_arvalid   = ar_rd||ar_ins;
    assign io_master_araddr    = ar_ins?ins_addr[31:0]:rd_addr[31:0];
    assign io_master_arid      = {(4){ar_ins}};                                                                           //初始化信号即可                        
    assign io_master_arlen     = (ar_ins&&ins_burst||ar_rd&&rd_burst)?8'h7:8'b0;                                                                          
    assign io_master_arsize    = ar_ins?(ins_burst?3'b011:3'b010):(rd_burst?3'b011:rd_len);
    assign io_master_arburst   = 2'b01;
    
    // Read data channel signals
    assign io_master_rready    = 1'b1;


    `ifdef INSTR
    always @(*) if(~clk&&reset) begin
        $display("axi: wr_req=%b,aw=%b,w=%b,count=%b,b=%b,burst=%b,addr=%h",wr_req,aw_done,w_done,count,b_done,wr_burst,wr_addr[31:0]);
        $display("axi:ins_req=%b,ar=%b,r=%b,is_ins=%b,size=%b,addr=%h",ins_req,ins_ar_done,ins_done,ar_ins,io_master_arsize,ins_addr[31:0]);
        $display("axi: rd_req=%b,ar=%b,r=%b,is_rd =%b,len=%b,addr=%h",rd_req,rd_ar_done,rd_done,ar_rd,io_master_arlen,rd_addr[31:0]);
    end
    `endif
endmodule
//`timescale 1ns/1ps
module ysyx_040066_top(
  input clk,rst,
  output done,error,valid,

  output ins_req,ins_burst,
  output [63:0] ins_addr,
  input ins_ready,ins_err,ins_last,
  input [63:0] ins_data,

  output rd_req,rd_burst,
  output [2:0] rd_len,
  output [63:0] rd_addr,
  input rd_ready,rd_err,rd_last,
  input [63:0] rd_data,

  output wr_req,wr_burst,
  output [2:0] wr_len,
  output [7:0] wr_mask,
  output [63:0] wr_addr,
  input wr_ready,wr_err,
  output [511:0] wr_data,

  input [127:0] ram_Q [7:0],
  output [127:0] ram_D [7:0],
  output [127:0] ram_BWEN [1:0],
  output [5:0] ram_A [1:0],
  output ram_WEN [1:0]
);
  wire MemWr,MemRd;
  wire [63:0] addr;
  wire [63:0] data_Rd;
  wire [63:0] pc_rd;
  wire [63:0] data_Wr;
  wire [31:0] instr;
  wire instr_valid,instr_error,instr_read;
  wire data_valid,data_error;
  wire fence_i,d_ready;
  //wire error,done,valid;
  wire [63:0] pc_nxt,pc_m;

  ysyx_040066_cpu cpu(
    .clk(clk),.rst(rst),
    .pc_nxt(pc_nxt),.instr_read(instr_read),
    .pc_rd(pc_rd),.instr_rd(instr),.instr_valid(instr_valid&&d_ready),.instr_error(instr_error),
    .addr(addr),.wr_mask(wr_mask),.MemRd(MemRd),.MemWr(MemWr),
    .data_valid(data_valid),.data_error(data_error),
    .data_Rd(data_Rd),.data_Wr(data_Wr),.wr_len(wr_len),
    .error(error),.done(done),.out_valid(valid),.fence_i(fence_i)
  );
  assign rd_len=wr_len;
  wire [63:0] instr_line;
  wire [31:0] icache_addr;
  wire icahce_req,icache_ready;//unused
  wire [511:0] icache_data;//unused
  ysyx_040066_cache_top icache(
    .clk(clk),.rst(rst),.force_update(fence_i),

    .valid(1'b1),.op(1'b0),.read(instr_read),
    .tag(pc_rd[31:11]),.index(pc_rd[10:6]),.offset(pc_rd[5:3]),
    .wstrb(8'b0),.wdata(64'h0),.fence(1'b0),
    .ok(instr_valid),.ready(icache_ready),.rdata(instr_line),.rw_error(instr_error),

    .addr(icache_addr),.rd_req(ins_req),.rd_ready(ins_ready),.rd_last(ins_last),.rd_error(ins_err),
    .rd_data(ins_data),.wr_req(icahce_req),.wr_data(icache_data),.wr_ready(1'b0),.wr_error(1'b0),

    .ram_Q(ram_Q[3:0]),.ram_D(ram_D[3:0]),.ram_BWEN(ram_BWEN[0]),.ram_A(ram_A[0]),.ram_WEN(ram_WEN[0])
  );
  reg pc_2;always@(posedge clk) pc_2<=pc_rd[2];
  assign instr=pc_2?instr_line[63:32]:instr_line[31:0];
  assign ins_burst=pc_rd[31];
  assign ins_addr=ins_burst?{32'h0,icache_addr}:pc_rd;

  wire [31:0] dcache_addr;
  ysyx_040066_cache_top dcache(
    .clk(clk),.rst(rst),.force_update(1'b0),

    .valid(MemRd||MemWr),.op(MemWr),.read(1'b1),
    .tag(addr[31:11]),.index(addr[10:6]),.offset(addr[5:3]),
    .wstrb(wr_mask),.wdata(data_Wr),.ok(data_valid),.ready(d_ready),
    .rdata(data_Rd),.rw_error(data_error),.fence(fence_i),
    
    .addr(dcache_addr),
    .rd_req(rd_req),.rd_ready(rd_ready),.rd_last(rd_last),.rd_error(rd_err),.rd_data(rd_data),
    .wr_req(wr_req),.wr_data(wr_data),.wr_ready(wr_ready),.wr_error(wr_err),

    .ram_Q(ram_Q[7:4]),.ram_D(ram_D[7:4]),.ram_BWEN(ram_BWEN[1]),.ram_A(ram_A[1]),.ram_WEN(ram_WEN[1])
  );

  assign rd_burst=dcache_addr[31];
  assign wr_burst=dcache_addr[31];
  assign rd_addr=rd_burst?{32'h0,dcache_addr}:addr;
  assign wr_addr=rd_addr;

`ifdef WORKBENCH
  import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
  initial set_gpr_ptr(cpu.module_regs.module_regs.rf);
  import "DPI-C" function void set_pc_ptr(input logic [63:0] pc []);
  initial set_pc_ptr(pc_nxt);
  import "DPI-C" function void set_pc_m_ptr(input logic [63:0] pc_m []);
  initial set_pc_m_ptr(pc_m);
  `endif
  assign pc_m=cpu.module_m.nxtpc;
endmodule
