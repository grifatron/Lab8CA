module register(Dc, write, rs1, rs2, rd, clk, reset, Da, Db);
input [31:0] Dc;
input write, clk, reset;
input [4:0] rs1, rs2, rd;
output wire [31:0] Da, Db;

wire [31:0] X;
wire [31:0] load;
wire [31:0] reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,reg30, reg31;

//decode the input location
Decoder start(rd[4:0], X[31:0]);

//and the decoder outputs with write to get load
assign load[0] = X[0] & write;
assign load[1] = X[1] & write;
assign load[2] = X[2] & write;
assign load[3] = X[3] & write;
assign load[4] = X[4] & write;
assign load[5] = X[5] & write;
assign load[6] = X[6] & write;
assign load[7] = X[7] & write;
assign load[8] = X[8] & write;
assign load[9] = X[9] & write;
assign load[10] = X[10] & write;
assign load[11] = X[11] & write;
assign load[12] = X[12] & write;
assign load[13] = X[13] & write;
assign load[14] = X[14] & write;
assign load[15] = X[15] & write;
assign load[16] = X[16] & write;
assign load[17] = X[17] & write;
assign load[18] = X[18] & write;
assign load[19] = X[19] & write;
assign load[20] = X[20] & write;
assign load[21] = X[21] & write;
assign load[22] = X[22] & write;
assign load[23] = X[23] & write;
assign load[24] = X[24] & write;
assign load[25] = X[25] & write;
assign load[26] = X[26] & write;
assign load[27] = X[27] & write;
assign load[28] = X[28] & write;
assign load[29] = X[29] & write;
assign load[30] = X[30] & write;
assign load[31] = X[31] & write;

//save the dc input to the currectly active register determined by load
Register one(Dc[31:0], load[0], clk, reset, reg0);
Register two(Dc[31:0], load[1], clk, reset, reg1);
Register three(Dc[31:0], load[2], clk, reset, reg2);
Register four(Dc[31:0], load[3], clk, reset, reg3);
Register five(Dc[31:0], load[4], clk, reset, reg4);
Register six(Dc[31:0], load[5], clk, reset, reg5);
Register seven(Dc[31:0], load[6], clk, reset, reg6);
Register eight(Dc[31:0], load[7], clk, reset, reg7);
Register nine(Dc[31:0], load[8], clk, reset, reg8);
Register ten(Dc[31:0], load[9], clk, reset, reg9);
Register eleven(Dc[31:0], load[10], clk, reset, reg10);
Register twelve(Dc[31:0], load[11], clk, reset, reg11);
Register thirteen(Dc[31:0], load[12], clk, reset, reg12);
Register fourteen(Dc[31:0], load[13], clk, reset, reg13);
Register fifteen(Dc[31:0], load[14], clk, reset, reg14);
Register sixteen(Dc[31:0], load[15], clk, reset, reg15);
Register seventeen(Dc[31:0], load[16], clk, reset, reg16);
Register eighteen(Dc[31:0], load[17], clk, reset, reg17);
Register nineteen(Dc[31:0], load[18], clk, reset, reg18);
Register twenty(Dc[31:0], load[19], clk, reset, reg19);
Register twentyone(Dc[31:0], load[20], clk, reset, reg20);
Register twentytwo(Dc[31:0], load[21], clk, reset, reg21);
Register twentythree(Dc[31:0], load[22], clk, reset, reg22);
Register twentyfour(Dc[31:0], load[23], clk, reset, reg23);
Register twentyfive(Dc[31:0], load[24], clk, reset, reg24);
Register twentysix(Dc[31:0], load[25], clk, reset, reg25);
Register twentyseven(Dc[31:0], load[26], clk, reset, reg26);
Register twentyeight(Dc[31:0], load[27], clk, reset, reg27);
Register twentynine(Dc[31:0], load[28], clk, reset, reg28);
Register thirty(Dc[31:0], load[29], clk, reset, reg29);
Register thirtyone(Dc[31:0], load[30], clk, reset, reg30);
Register thirtytwo(Dc[31:0], load[31], clk, reset, reg31);

//mux to choose which register should be outputted
Mux_A A(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,
reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,
reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,
reg30,reg31,rs1[4:0], Da[31:0]);

Mux_A B(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,
reg10,reg11,reg12,reg13,reg14,reg15,reg16,reg17,reg18,reg19,
reg20,reg21,reg22,reg23,reg24,reg25,reg26,reg27,reg28,reg29,
reg30,reg31,rs2[4:0], Db[31:0]);

endmodule



module Register(Din, load, clk, reset, Dout);
input [31:0] Din;
input load, clk, reset;
output reg [31:0] Dout;

always @(posedge clk)
begin
	if (reset == 1)
		Dout[31:0] = 32'b00000000000000000000000000000000;
	else if (reset == 0 & load == 1)
		Dout[31:0] = Din[31:0];
	else
		Dout[31:0] = Dout[31:0];
end
endmodule



module Decoder(select, dout);

input [4:0] select;
output [31:0] dout;

//this one assigns output based off of input
assign dout[0] = ~select[4] & ~select[3] & ~select[2] & ~select[1] & ~select[0];
assign dout[1] = ~select[4] & ~select[3] & ~select[2] & ~select[1] & select[0];
assign dout[2] = ~select[4] & ~select[3] & ~select[2] & select[1] & ~select[0];
assign dout[3] = ~select[4] & ~select[3] & ~select[2] & select[1] & select[0];
assign dout[4] = ~select[4] & ~select[3] & select[2] & ~select[1] & ~select[0];
assign dout[5] = ~select[4] & ~select[3] & select[2] & ~select[1] & select[0];
assign dout[6] = ~select[4] & ~select[3] & select[2] & select[1] & ~select[0];
assign dout[7] = ~select[4] & ~select[3] & select[2] & select[1] & select[0];
assign dout[8] = ~select[4] & select[3] & ~select[2] & ~select[1] & ~select[0];
assign dout[9] = ~select[4] & select[3] & ~select[2] & ~select[1] & select[0];
assign dout[10] = ~select[4] & select[3] & ~select[2] & select[1] & ~select[0];
assign dout[11] = ~select[4] & select[3] & ~select[2] & select[1] & select[0];
assign dout[12] = ~select[4] & select[3] & select[2] & ~select[1] & ~select[0];
assign dout[13] = ~select[4] & select[3] & select[2] & ~select[1] & select[0];
assign dout[14] = ~select[4] & select[3] & select[2] & select[1] & ~select[0];
assign dout[15] = ~select[4] & select[3] & select[2] & select[1] & select[0];
assign dout[16] = select[4] & ~select[3] & ~select[2] & ~select[1] & ~select[0];
assign dout[17] = select[4] & ~select[3] & ~select[2] & ~select[1] & select[0];
assign dout[18] = select[4] & ~select[3] & ~select[2] & select[1] & ~select[0];
assign dout[19] = select[4] & ~select[3] & ~select[2] & select[1] & select[0];
assign dout[20] = select[4] & ~select[3] & select[2] & ~select[1] & ~select[0];
assign dout[21] = select[4] & ~select[3] & select[2] & ~select[1] & select[0];
assign dout[22] = select[4] & ~select[3] & select[2] & select[1] & ~select[0];
assign dout[23] = select[4] & ~select[3] & select[2] & select[1] & select[0];
assign dout[24] = select[4] & select[3] & ~select[2] & ~select[1] & ~select[0];
assign dout[25] = select[4] & select[3] & ~select[2] & ~select[1] & select[0];
assign dout[26] = select[4] & select[3] & ~select[2] & select[1] & ~select[0];
assign dout[27] = select[4] & select[3] & ~select[2] & select[1] & select[0];
assign dout[28] = select[4] & select[3] & select[2] & ~select[1] & ~select[0];
assign dout[29] = select[4] & select[3] & select[2] & ~select[1] & select[0];
assign dout[30] = select[4] & select[3] & select[2] & select[1] & ~select[0];
assign dout[31] = select[4] & select[3] & select[2] & select[1] & select[0];

endmodule 

module Mux_A(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,
reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,
reg27,reg28,reg29,reg30,reg31,s, Mux_out_A);

input [31:0] reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12,
reg13,reg14,reg15,reg16,reg17,reg18,reg19,reg20,reg21,reg22,reg23,reg24,reg25,reg26,
reg27,reg28,reg29,reg30,reg31;

input [4:0] s;
output reg [31:0] Mux_out_A;

always @(*) begin
	case(s) 
	
	5'b00000: Mux_out_A = reg0;
	5'b00001: Mux_out_A = reg1;
	5'b00010: Mux_out_A = reg2;
	5'b00011: Mux_out_A = reg3;
	5'b00100: Mux_out_A = reg4;
	5'b00101: Mux_out_A = reg5;
	5'b00110: Mux_out_A = reg6;
	5'b00111: Mux_out_A = reg7;
	5'b01000: Mux_out_A = reg8; 
	5'b01001: Mux_out_A = reg9;
	5'b01010: Mux_out_A = reg10;
	5'b01011: Mux_out_A = reg11;
	5'b01100: Mux_out_A = reg12;
	5'b01101: Mux_out_A = reg13;
	5'b01110: Mux_out_A = reg14;
	5'b01111: Mux_out_A = reg15;
	5'b10000: Mux_out_A = reg16;
	5'b10001: Mux_out_A = reg17;
	5'b10010: Mux_out_A = reg18;
	5'b10011: Mux_out_A = reg19;
	5'b10100: Mux_out_A = reg20;
	5'b10101: Mux_out_A = reg21;
	5'b10110: Mux_out_A = reg22;
	5'b10111: Mux_out_A = reg23;
	5'b11000: Mux_out_A = reg24;
	5'b11001: Mux_out_A = reg25;
	5'b11010: Mux_out_A = reg26;
	5'b11011: Mux_out_A = reg27;
	5'b11100: Mux_out_A = reg28;
	5'b11101: Mux_out_A = reg29;
	5'b11110: Mux_out_A = reg30;
	5'b11111: Mux_out_A = reg31;

	endcase
	end
	
	endmodule
	