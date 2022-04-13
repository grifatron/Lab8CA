module PC(clk, rst, PC_in_4, PC_out);

input clk, rst;
input [31:0] PC_in_4;
output reg [31:0] PC_out;

initial begin
PC_out <= 32'b0;
end

always @ (posedge clk) begin

if (rst) begin
PC_out <= 32'b0;
end

else begin
PC_out <= PC_in_4;
end


end


endmodule
