`include "top.v"
module top_tb();

reg clk,reset;

top uut (.clk(clk),.reset(reset));
always 
begin
  #5 clk = ~ clk;
end
initial
begin
  clk =0;
  reset = 1;
  #10;
  reset = 0; #1000;
  $finish;
end

initial 
begin
  $dumpfile("waves.vcd");
  $dumpvars();
end
endmodule
