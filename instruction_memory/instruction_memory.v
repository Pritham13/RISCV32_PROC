
module instruction_memory (
    input [31:0] A,
    input reset,
    output [31:0] RD
);
  reg [7:0] Memory[31:0];  // Byte addressable memory with 32 locations

  // Under normal operation (reset = 1), we assign the instr. code, based on A
  assign RD = {Memory[A+3], Memory[A+2], Memory[A+1], Memory[A]};

  // Initializing memory when reset is zero
  always @(posedge reset) // Use negedge or posedge depending on your requirements
    begin
    if (reset) begin
      //stack 0 FFC4A303 load
      Memory[3]  = 8'hFF;
      Memory[2]  = 8'hC4;
      Memory[1]  = 8'hA3;
      Memory[0]  = 8'h03;
      //stack 1 0<064A423 Sw
      Memory[7]  = 8'h00;
      Memory[6]  = 8'h64;
      Memory[5]  = 8'hA4;
      Memory[4]  = 8'h23;
      //stack 2 0<062E233 0r
      Memory[11] = 8'h00;
      Memory[10] = 8'h62;
      Memory[9]  = 8'hE2;
      Memory[8]  = 8'h33;
      //stack 3 F<E420AE3 Beq
      Memory[15] = 8'hFE;
      Memory[14] = 8'h42;
      Memory[13] = 8'h0A;
      Memory[12] = 8'hE3;
      //stack 4 0<2728863 JAL
      Memory[19] = 8'h02;
      Memory[18] = 8'h72;
      Memory[17] = 8'h88;
      Memory[16] = 8'h63;
      //stack 5
      Memory[23] = 8'h00;
      Memory[22] = 8'h00;
      Memory[21] = 8'h00;
      Memory[20] = 8'h00;
      //stack 6
      Memory[27] = 8'h00;
      Memory[26] = 8'h00;
      Memory[25] = 8'h00;
      Memory[24] = 8'h00;
      //stack 7
      Memory[31] = 8'h00;
      Memory[30] = 8'h00;
      Memory[29] = 8'h00;
      Memory[28] = 8'h00;
    end
  end

endmodule
