module Dff(d,clk,reset,q); 
input d, clk, reset; 
output reg q; 
always@(posedge clk) 
begin
if(reset== 1)
q <= 0;
else 
q <= d;  
end 
endmodule

