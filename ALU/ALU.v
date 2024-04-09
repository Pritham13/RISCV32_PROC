`define ADD 4'b0000
`define SUB 4'b1001
`define SLL 4'b0001
`define SLT 4'b0010
`define SLTU 4'b0011
`define XOR 4'b0100
`define SRL 4'b0101
`define SRA 4'b1101
`define OR 4'b0110
`define AND 4'b0111 
module ALU (input [31:0]srca,srcb,
        input [3:0]ALU_control,
        input clk,
        input reset,
        output reg [31:0]ALUResult
        );

always @ (posedge reset)
begin
  ALUResult<=0;
end

always @ (posedge clk)
begin
    case(ALU_control)
      `ADD:ALUResult<=srca+srcb;
      `SUB:ALUResult<=srca-srcb;
      `SLL:ALUResult<=srca<<srcb;
      `SLT:ALUResult<=(srca < srcb) ? 32'b1 :32'b0;
      `SLTU:ALUResult<=(srca < srcb) ? 32'b1 :32'b0;
      `XOR:ALUResult<=srca^srcb;
      `SRL:ALUResult<=(srca>>srcb);
      `SRA:ALUResult<=srca<<<srcb;
      `OR:ALUResult<=srca|srcb;
      `AND :ALUResult<=srca&srcb;
    endcase
end
endmodule
