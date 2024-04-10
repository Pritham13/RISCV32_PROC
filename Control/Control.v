module control(input  [6:0]op,
                input [2:0]funct3,
                input funct7,zero,
                output PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite,
                output [3:0]ALUControl,
                output [1:0]ImmSrc);

always@(op,funct3,funct7)
begin
    PCSrc<= zero&
    ALUSrc<=op[4];
    ALUControl<= {funct7,funct3};

end
endmodule 
