module MUX2to1(i0, i1, select, result);

input [31:0] i0, i1;
input select;
output reg [31:0] result;

always @(*) begin

case (select)
1'b0: result = i0;
1'b1: result = i1;

endcase
end
endmodule