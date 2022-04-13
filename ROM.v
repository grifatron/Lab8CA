module ROM(Address, InstOut, clk);
	input[31:0]Address;
	input clk;
	
	output reg[31:0] InstOut;
	
	reg[31:0]Instructions[18:0];
	
	initial begin
		Instructions[0] = 32'h00450693;
		Instructions[1] = 32'h00100713;
		Instructions[2] = 32'h00b76463;
		Instructions[3] = 32'h00008067;
		Instructions[4] = 32'h0006a803;
		Instructions[5] = 32'h00068613;
		Instructions[6] = 32'h00070793;
		Instructions[7] = 32'hffc62883;
		Instructions[8] = 32'h01185a63;
		Instructions[9] = 32'h01162023;
		Instructions[10] = 32'hfff78793;
		Instructions[11] = 32'hffc60613;
		Instructions[12] = 32'hfe0796e3;
		Instructions[13] = 32'h00279793;
		Instructions[14] = 32'h00f507b3;
		Instructions[15] = 32'h0107a023;
		Instructions[16] = 32'h00170713;
		Instructions[17] = 32'h00468693;
		Instructions[18] = 32'hfc1ff06f;
	end

	always @(posedge clk) begin
		case (Address) 
			32'h0 : InstOut = Instructions[0];
			32'h4 : InstOut = Instructions[1];
			32'h8 : InstOut = Instructions[2];
			32'hc : InstOut = Instructions[3];
			32'h10 : InstOut = Instructions[4];
			32'h14 : InstOut = Instructions[5];
			32'h18 : InstOut = Instructions[6];
			32'h1c : InstOut = Instructions[7];
			32'h20 : InstOut = Instructions[8];
			32'h24 : InstOut = Instructions[9];
			32'h28 : InstOut = Instructions[10];
			32'h2c : InstOut = Instructions[11];
			32'h30 : InstOut = Instructions[12];
			32'h34 : InstOut = Instructions[13];
			32'h38 : InstOut = Instructions[14];
			32'h3c : InstOut = Instructions[15];
			32'h40 : InstOut = Instructions[16];
			32'h44 : InstOut = Instructions[17];
			32'h48 : InstOut = Instructions[18];
		endcase
	end
endmodule