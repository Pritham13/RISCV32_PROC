module Mux(
output [31:0] Y,
input [31:0] D0, D1,
input S
);

assign Y=(S)?D1:D0;

endmodule
