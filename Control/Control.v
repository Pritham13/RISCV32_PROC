module control(input  [6:0]op,
                input [2:0]funct3,
                input funct7,zero,
                output PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite,
                output [3:0]ALUControl,
                output [1:0]ImmSrc);


assign PCSrc = {zero, op[6]};//needs to be checked

assign ALUSrc = op[4];

assign ALUControl = {funct7, funct3}; 
assign ResultSrc = ;
assign MemWrite = ; 
assign ImmSrc = ; 
assign RegWrite = ; 
endmodule 
