module Lab8CA(clk, reset, RegWrite, PCSrc, ALUSrc, ALU_operation, write, MemtoReg, register_write);

input clk, reset, RegWrite, PCSrc, ALUSrc, write, MemtoReg;
input [4:0] ALU_operation;
output [31:0] register_write;

wire [31:0] PC_out, PC_in, PC_add4, PC_addnum, imm_32, ROM_inst;
wire [31:0] reg_out1, reg_out2, ALU_in2, ReadData, ALU_out;
wire [4:0] rs1, rs2, rd;
wire [11:0] imm_12;
wire [3:0] status;

PC mod1 (clk, reset, PC_in, PC_out);
Adder_4 mod2 (reset, PC_out, PC_add4);
ROM mod4 (PC_out, ROM_inst, clk);
inst_decoder mod5 (ROM_inst, rs1, rs2, rd, imm_12);
register mod6 (register_write, RegWrite, rs1, rs2, rd, clk, reset, reg_out1, reg_out2);
imm_generator mod7 (imm_12, imm_32);
PC_adder mod3 (PC_out, imm_32, PC_addnum);
MUX2to1 mod8 (PC_add4, PC_addnum, PCSrc, PC_in);
MUX2to1 mod9 (reg_out2, imm_32, ALUSrc, ALU_in2);
ALU mod10 (reg_out1, ALU_in2, 0, ALU_operation, ALU_out, status);
full_RAM mod11 (ALU_out[7:0], clk, write, reg_out2, ReadData);
MUX2to1 mod12 (ReadData, ALU_out, MemtoReg, register_write);

endmodule
