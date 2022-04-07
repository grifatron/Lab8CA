module imm_generator(imm_in,imm_out);

input [11:0] imm_in;
output [31:0] imm_out;

assign imm_out[31:12] = {20{imm_in[11]}};
assign imm_out[11:0] = imm_in;

endmodule
