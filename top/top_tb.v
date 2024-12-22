// `include "top.v"
module top_tb();

reg clk,reset;

top uut (.clk(clk),.reset(reset));
always 
begin
  #5 clk = ~ clk;
end
initial
begin
  clk =1;
  reset = 1;
  #10;
  reset = 0; #100;
  $finish;
end

initial 
begin
  $dumpfile("wave.vcd");
  $dumpvars();
end
endmodule
