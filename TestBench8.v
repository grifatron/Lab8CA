module TestBench8(e,r);
input e;
output r;

reg clk, reset, RegWrite, PCSrc, ALUSrc, write, MemtoReg;
reg [4:0] ALU_operation;
wire [31:0] register_write;

Lab8CA dut0(clk, reset, RegWrite, PCSrc, ALUSrc, ALU_operation, write, MemtoReg, register_write);

initial begin
clk =1'd0;
reset = 1'd1;
RegWrite = 1'd0;
PCSrc = 1'd0;
ALUSrc = 1'd1;
write = 1'd1;
MemtoReg = 1'd1;
ALU_operation = 5'd4;
end

always begin


#5 clk <= ~clk;
#5 clk <= ~clk;
reset <= 1'd0;
RegWrite = 1'd1;
#5 clk <= ~clk;
#5 clk <= ~clk;
#5 clk <= ~clk;
#5 clk <= ~clk;
RegWrite = 0;
write = 0;
PCSrc = 1;
#5 clk <= ~clk;
#5 clk <= ~clk;
$stop;


end


endmodule