// Stuff left :setup the special registers such as CPSR ,LR ,etc
module registers(
    input [4:0] A1,A2,A3,
    input [31:0] WD3,
    input WE3,reset,clk,
    output reg [31:0]RD1,RD2
);
    integer i;
    reg [31:0] register [31:0];
    reg CPSR, LR;
    always @(posedge reset) 
    begin
        for (i=0;i<32;i=i+1)
            begin
                register[i] <= 32'h0; 
            end  
        RD1<=0;
        RD2<=0;
    end
    // The register file will always output the vaules corresponding to read register numbers 
    // It is independent of any other signal
    always @(posedge clk)
    begin
        if(!WE3)
            begin
                RD1 <= register[A1];
                RD2 <= register[A2];
            end
        else
            begin
                register[A3]<=WD3;
            end
    end
endmodule

