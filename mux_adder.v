module mux_adder(i0,i1,mux_select,mux_result);

    input [31:0] i0,i1;
    input mux_select;
    output reg [31:0] mux_result;

     always @(*) begin
	  case (mux_select)
	  
	  1'b0: mux_result = i0;
	  1'b1: mux_result = i1;
	  
	
	  endcase
	  end
	  
endmodule