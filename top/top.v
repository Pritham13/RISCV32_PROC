`include "../ALU/ALU.v"
`include "../data_memory/data_memory.v"
`include "../Registers/Register.v"
`include "../adder/adder.v"
`include "../Dff/Dff.sv"
`include "../Mux/Mux.sv"
`include "../extend/extend.v"
`include "../Control/Control.v"
`include "../instruction_memory/instruction_memory.v"
module top(input clk,reset);
wire [31:0]Result;
wire [31:0] PC;
wire PCSrc;
wire [31:0]instr;
wire ResultSrc,MemWrite,ALUSrc,RegWrite;
wire [1:0]ImmSrc;
wire [3:0]ALUControl;
wire [31:0] SrcA,SrcB;
wire [31:0] WriteData,ImmExt,ALUResult;
wire Zero;
wire [31:0] ReadData;
wire [31:0] PCTarget,PCPlus4,PCNext;


instruction_memory inst_mem (
  .A(PC),
  .reset(reset),
  .RD(instr)
);

registers register (
  .A1(instr[19:15]),
  .A2(instr[24:20]),
  .A3(instr[11:7]),
  .clk(clk),
  .WD3(Result),
  .RD1(SrcA),
  .RD2(WriteData),
  .WE3(RegWrite)
);
controlUnit control(
  .op(instr[6:0]),
  .funct3(instr[14:12]),
  .funct7(instr[30])
);

ALU alu(
  .SrcA(SrcA),
  .SrcB(SrcB),
  .ALUControl(ALUControl),
  .reset(reset),
  .clk(clk),
  .Zero(Zero),
  .ALUResult(ALUResult)
);

extend extender(
  .instr(instr),
  .ImmSrc(ImmSrc),
  .ImmExt(ImmExt)
);
Mux mux_alu(
  .D0(WriteData),
  .D1(ImmExt),
  .S(ALUSrc),
  .Y(SrcB)
);

data_memory datamem (
  .A(ALUResult),
  .WD(WriteData),
  .RD(ReadData),
  .WE(MemWrite)
);

Mux mux_dataMem (
  .D0(ALUResult),
  .D1(ReadData),
  .S(ResultSrc),
  .Y(Result)
);

adder adder_branch (
  .a(PC),
  .b(ImmExt),
  .out(PCTarget)
);

adder adder_PC (
  .a(PC),
  .b(32'd4),
  .out(PCPlus4)
);

Mux mux_PC (
  .D0(PCPlus4),
  .D1(PCTarget),
  .S(PCSrc),
  .Y(PCNext)
);

Dff dff (
  .d(PCNext),
  .q(PC),
  .clk(clk),
  .reset(reset)
);
endmodule
