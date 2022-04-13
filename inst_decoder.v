module inst_decoder (instruction, rs1, rs2, rd, imm);
input[31:0] instruction;

output wire[4:0] rs1, rs2, rd;
output wire[11:0] imm;

assign rd = instruction[11:7];
assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign imm = instruction[31:20];

endmodule
