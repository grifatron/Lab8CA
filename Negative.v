module Negative(in, out);

input in;
output out;

assign out = (in == 1'b1) ? 1:0;

endmodule