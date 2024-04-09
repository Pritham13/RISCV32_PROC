module instruction_memory(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
);
    reg [7:0] Memory [31:0]; // Byte addressable memory with 32 locations

    // Under normal operation (reset = 1), we assign the instr. code, based on PC
    assign Instruction_Code = {Memory[PC+3],Memory[PC+2],Memory[PC+1],Memory[PC]};

    // Initializing memory when reset is zero
    always @(reset)
    begin
        if(reset == 0)
        begin
            // Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
            Memory[3:0] = 32'h00940333;
            // Setting 32-bit instruction: sub t2, s2, s3 => 0x413903b3
            Memory[7:4] = 32'h413903b3;
            // Setting 32-bit instruction: mul t0, s4, s5 => 0x035a02b3
            Memory[11:8] = 32'h035a02b3;
            // Setting 32-bit instruction: xor t3, s6, s7 => 0x017b4e33
            Memory[15:12] = 32'h017b4e33;            
            // Setting 32-bit instruction: sll t4, s8, s9 => 0x019ceb3
            Memory[19:16] = 32'h019ceb3;
            // Setting 32-bit instruction: srl t5, s10, s11 => 0x01bd5f33
            Memory[23:20] = 32'h01bd5f33;
            // Setting 32-bit instruction: and t6, a2, a3 => 0x00d67fb3
            Memory[27] = 32'h00d67fb3;
            // Setting 32-bit instruction: or a7, a4, a5 => 0x00f768b3
            Memory[31:28] = 32'h00f768b3;
        end
    end

endmodule