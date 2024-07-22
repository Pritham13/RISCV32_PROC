//TODO check if memwrite and ResektSrc can be merged
//TODO check if PCSrc is correct
module controlUnit(input  [6:0]op,
                input [2:0]funct3,
                input funct7,zero,
                output PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite,
                output [3:0]ALUControl,
                output [1:0]ImmSrc);


assign PCSrc = op[6];

assign ALUSrc = op[5];

assign ALUControl = {funct7, funct3}; 
assign ResultSrc = ~op[4];
assign MemWrite = ~op[4];
assign ImmSrc = ;
assign RegWrite = ;
endmodule 
