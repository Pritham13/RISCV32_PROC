
module instruction_memory(
    input [31:0] A,
    input reset,
    output [31:0] RD
);
    reg [7:0] Memory [31:0]; // Byte addressable memory with 32 locations

    // Under normal operation (reset = 1), we assign the instr. code, based on A
    assign RD = {Memory[A+3], Memory[A+2], Memory[A+1], Memory[A]};

    // Initializing memory when reset is zero
    always @(negedge reset) // Use negedge or posedge depending on your requirements
    begin
        if(!reset)
        begin
            // Set instructions in the memory array
            Memory[0]  = 8'h33; // LSB of 0x00940333
            Memory[1]  = 8'h03;
            Memory[2]  = 8'h94;
            Memory[3]  = 8'h00; // MSB of 0x00940333
            
            Memory[4]  = 8'hb3; // LSB of 0x413903b3
            Memory[5]  = 8'h03;
            Memory[6]  = 8'h39;
            Memory[7]  = 8'h41; // MSB of 0x413903b3
            
            Memory[8]  = 8'hb3; // LSB of 0x035a02b3
            Memory[9]  = 8'h02;
            Memory[10] = 8'h5a;
            Memory[11] = 8'h03; // MSB of 0x035a02b3
            
            Memory[12] = 8'h33; // LSB of 0x017b4e33
            Memory[13] = 8'h4e;
            Memory[14] = 8'h7b;
            Memory[15] = 8'h01; // MSB of 0x017b4e33

            Memory[16] = 8'hb3; // LSB of 0x019ceb3
            Memory[17] = 8'hce;
            Memory[18] = 8'h9c;
            Memory[19] = 8'h01; // MSB of 0x019ceb3
            
            Memory[20] = 8'h33; // LSB of 0x01bd5f33
            Memory[21] = 8'h5f;
            Memory[22] = 8'hbd;
            Memory[23] = 8'h01; // MSB of 0x01bd5f33
            
            Memory[24] = 8'hb3; // LSB of 0x00d67fb3
            Memory[25] = 8'h7f;
            Memory[26] = 8'hd6;
            Memory[27] = 8'h00; // MSB of 0x00d67fb3
            
            Memory[28] = 8'hb3; // LSB of 0x00f768b3
            Memory[29] = 8'h68;
            Memory[30] = 8'hf7;
            Memory[31] = 8'h00; // MSB of 0x00f768b3
        end
    end

endmodule
