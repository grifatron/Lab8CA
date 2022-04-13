module shifter(A, B, ShiftL, ShiftR);
	input [31:0]A;
	input [4:0]B;
	output reg [31:0]ShiftL, ShiftR;
	
	always@(A) begin
	ShiftL = A<<B;
	ShiftR = A>>B;
	end
	
endmodule
