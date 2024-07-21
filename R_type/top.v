`include "../ALU/ALU.v"
`include "../data_memory/data_memory.v"
`include "../Registers/Register.v"
`include "../adder/adder.v"
module top(input clk,reset);
wire [31:0] PC =0;
wire PCSrc;
wire [31:0]instr;
wire ResultSrc,MemWrite,ALUSrc,ImmSrc,RegWrite;
wire [2:0]ALUControl;
wire [31:0] SrcA,SrcB;
instruction_memory inst_mem (.A(PC),.reset(reset),.RD(instr));
//TODO Add WD3 
registers(.A1(instr[19:15]),.A2(instr[24:20]),.A3(instr[11:7]),.clk(clk),.WD3(),.RD1(SrcA),.RD2(SrcB),.WE3(RegWrite));
controlUnit(.op(instr[6:0],.funct3(instr),.funct7))
endmodule
