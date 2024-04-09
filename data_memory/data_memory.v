module data_memory(input [31:0]A,//address 
                    input [31:0]WD,//data
                    input WE,clk,//write enalble , clock
                    output reg [31:0]RD
                    );
reg [31:0]register[31:0];
always@(posedge clk)
begin
  if(WE)
    register[A]<=WD;
  else
    RD<=register[A];
end


endmodule