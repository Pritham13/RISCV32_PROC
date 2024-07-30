`define ADD 4'b0000
`define SUB 4'b1000
`define SLL 4'b0001
`define SLT 4'b0010
`define SLTU 4'b0011
`define XOR 4'b0100
`define SRL 4'b0101
`define SRA 4'b1101
`define OR 4'b0110
`define AND 4'b0111 
module ALU (input [31:0]SrcA,SrcB,
        input [3:0]ALUControl,
        input clk,
        input reset,
        output reg [31:0]ALUResult,
        output reg Zero
        );

always @ (posedge reset)
begin
  ALUResult<=0;
  Zero<=0;
end

always @ (posedge clk)
begin
    case(ALUControl)
      `ADD:ALUResult<=SrcA+SrcB;
      `SUB:ALUResult<=SrcA-SrcB;
      `SLL:ALUResult<=SrcA<<SrcB;
      `SLT:ALUResult<=(SrcA < SrcB) ? 32'b1 :32'b0;
      `SLTU:ALUResult<=(SrcA < SrcB) ? 32'b1 :32'b0;
      `XOR:ALUResult<=SrcA^SrcB;
      `SRL:ALUResult<=(SrcA>>SrcB);
      `SRA:ALUResult<=SrcA<<<SrcB;
      `OR:ALUResult<=SrcA|SrcB;
      `AND :ALUResult<=SrcA&SrcB;
    endcase
  if (ALUResult==0)
    Zero<=1;
  else 
    Zero<=0;
end
endmodule
