module full_RAM(Address,clk, Write, In, Dout);

input [7:0] Address;
input clk;
input Write;
input [31:0] In;
output [31:0] Dout;

wire [3:0] cs;
wire [31:0] doutsig0;
wire [31:0] doutsig1;
wire [31:0] doutsig2;
wire [31:0] doutsig3;

decoder Dec(Address[7:6], cs);



RAM Ram0(In[7:0], Address[5:0], cs[0], Write, clk, doutsig0[7:0]);
RAM Ram1(In[15:8], Address[5:0], cs[0], Write, clk, doutsig0[15:8]);
RAM Ram2(In[23:16], Address[5:0], cs[0], Write, clk, doutsig0[23:16]);
RAM Ram3(In[31:24], Address[5:0], cs[0], Write, clk, doutsig0[31:24]);

RAM Ram4(In[7:0], Address[5:0], cs[1], Write, clk, doutsig1[7:0]);
RAM Ram5(In[15:8], Address[5:0], cs[1], Write, clk, doutsig1[15:8]);
RAM Ram6(In[23:16], Address[5:0], cs[1], Write, clk, doutsig1[23:16]);
RAM Ram7(In[31:24], Address[5:0], cs[1], Write, clk, doutsig1[31:24]);

RAM Ram8(In[7:0], Address[5:0], cs[2], Write, clk, doutsig2[7:0]);
RAM Ram9(In[15:8], Address[5:0], cs[2], Write, clk, doutsig2[15:8]);
RAM Ram10(In[23:16], Address[5:0], cs[2], Write, clk, doutsig2[23:16]);
RAM Ram11(In[31:24], Address[5:0], cs[2], Write, clk, doutsig2[31:24]);

RAM Ram12(In[7:0], Address[5:0], cs[3], Write, clk, doutsig3[7:0]);
RAM Ram13(In[15:8], Address[5:0], cs[3], Write, clk, doutsig3[15:8]);
RAM Ram14(In[23:16], Address[5:0], cs[3], Write, clk, doutsig3[23:16]);
RAM Ram15(In[31:24], Address[5:0], cs[3], Write, clk, doutsig3[31:24]);

assign Dout = (cs[0] == 1'b1) ? doutsig0 : 32'bz;
assign Dout = (cs[1] == 1'b1) ? doutsig1 : 32'bz;
assign Dout = (cs[2] == 1'b1) ? doutsig2 : 32'bz;
assign Dout = (cs[3] == 1'b1) ? doutsig3 : 32'bz;



endmodule