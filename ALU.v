module ALU (A, B, Cin, select_in, F, status);

input [31:0] A, B;
input Cin;
input [4:0] select_in;
output [31:0] F;
output [3:0] status;

wire [31:0] XOR, AND, OR, NOR,S_out, F_out, Select_out, SLL_out, SR_out, Mux_out;
wire V, N, C, Z;



wire [31:0] A_out, B_out;
wire [31:0] A_not, B_not;
wire MUX_A, MUX_B;
wire [2:0] stat;


mux_adder DUTA(.i0(A),.i1(A_not),.mux_select(MUX_A),.mux_result(A_out));
mux_adder DUTB(.i0(B),.i1(B_not),.mux_select(MUX_B),.mux_result(B_out));


assign A_not = ~A;
assign B_not = ~B;


FULLADDER DUT1(.A(A_out), .B(B_out), .Cin(Cin), .S(S_out), .Cout(C));
shifter DUT6(.A(A), .B(B), .ShiftL(SLL_out), .ShiftR(SR_out));
MUX_ALU DUT2 (.i0(XOR), .i1(AND), .i2(OR), .i3(NOR), .i4(S_out), .i5(SLL_out), .i6(SR_out), .i7(32'b0), .out(Mux_out), .S(stat)); 

assign XOR = (A_out ^ B_out);
assign AND = (A_out & B_out);
assign OR = (A_out | B_out);
assign NOR = ~(A_out | B_out);
assign stat = select_in [2:0];
assign MUX_A = select_in[4];
assign MUX_B = select_in[3];


assign F = Mux_out;

assign V = (~(A_out[31] ^ B_out[31])) & (F[31] ^ A_out[31]);
Negative DUT3(.in(F[31]), .out(N));
assign Z = (F ==32'b0) ? 1:0;


assign status = {V, C, N, Z}; 

endmodule