module PC_adder(PC, add, PC_out);

input [32:0] PC, add;
output reg[32:0] PC_out;

always @* begin
PC_out <= PC + add;
end

endmodule
