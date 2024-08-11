module Dff(
input [31:0]d,
input clk, reset,
output reg [31:0]q
);
always@(posedge clk) 
begin
if(reset== 1)
q <= 0;
else 
q <= d;  
end 
endmodule

