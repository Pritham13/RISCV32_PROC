`include "../ALU/ALU.v"
`include "../data_memory/data_memory.v"
`include "../Registers/Register.v"
`include "../adder/adder.v"
module top(input clk,reset);
wire Result;
wire [31:0] PC;
wire PCSrc;
wire [31:0]instr;
wire ResultSrc,MemWrite,ALUSrc,ImmSrc,RegWrite;
wire [2:0]ALUControl;
wire [31:0] SrcA,SrcB;
wire [31:0] SrcB_mux,ImmExt,Zero;


instruction_memory inst_mem (.A(PC),.reset(reset),.RD(instr));

registers register (.A1(instr[19:15]),.A2(instr[24:20]),.A3(instr[11:7]),.clk(clk),.WD3(Result),.RD1(SrcA),.RD2(SrcB_mux),.WE3(RegWrite));
controlUnit control(.op(instr[6:0],.funct3(instr),.funct7));
ALU alu(.SrcA(SrcA),.SrcB(SrcB),.ALUControl(ALUControl),.reset(reset),.clk(clk),.Zero(Zero));
mux 
endmodule
