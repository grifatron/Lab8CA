module Adder_4 (rst, PC_in, PC_out_4);

input rst;
input [31:0] PC_in;
output reg [31:0] PC_out_4;

initial begin 
PC_out_4 <= 32'b00000100;
end


always @ (PC_in) begin

if (rst) begin

PC_out_4 <= 32'b00000000;
end

PC_out_4 <= PC_in+32'b00000100;

end

endmodule