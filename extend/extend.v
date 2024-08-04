module extend(
    input [31:0] instr,
    input [1:0] ImmSrc,
    output reg [31:0] ImmExt
);

always @(*) begin
    case (ImmSrc)
        2'b00: ImmExt = {{20{instr[31]}}, instr[31:20]};   // I-type
        2'b01: ImmExt = {{20{instr[31]}}, instr[31:25], instr[11:7]};  // S-type
        2'b10: ImmExt = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; // B-type
        default: ImmExt = 32'd0; // R-type
        endcase
end

endmodule

