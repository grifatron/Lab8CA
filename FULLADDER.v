module FULLADDER(A,B,Cin, S, Cout);
input [31:0]A;
input [31:0]B;
input Cin;
output [31:0]S;
output wire Cout;

wire [31:0]Co;
genvar w;


OneBitAdder half(A[0],B[0],Cin,S[0],Co[0]);
generate
for(w = 1; w < 32; w=w+1) 
begin : fulladd

OneBitAdder full(A[w],B[w],Co[w-1],S[w],Co[w]);

end
endgenerate

assign Cout = Co[31];

endmodule