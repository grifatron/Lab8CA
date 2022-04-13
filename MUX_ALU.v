module MUX_ALU(i0, i1, i2, i3, i4, i5, i6, i7, out, S);

input [31:0] i0;
input [31:0] i1;
input [31:0] i2;
input [31:0] i3;
input [31:0] i4;
input [31:0] i5;
input [31:0] i6;
input [31:0] i7;
input [2:0] S;
output reg [31:0] out;


always @(*) begin

case(S) 

3'd0: out = i0;
3'd1: out = i1;
3'd2: out = i2;
3'd3: out = i3;
3'd4: out = i4;
3'd5: out = i5;
3'd6: out = i6;
3'd7: out = i7;

endcase
end

endmodule