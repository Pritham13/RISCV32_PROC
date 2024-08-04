module tb_extend;

    // Testbench signals
    reg [31:0] instr;
    reg [1:0] ImmSrc;
    wire [31:0] ImmExt;

    // Instantiate the extend module
    extend uut (
        .instr(instr),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );

    // Test procedure
    initial begin
        // Initialize signals
        instr = 32'd0;
        ImmSrc = 2'b00;
        
        // Wait for a short time
        #10;

        // Test case 1: I-type instruction (ImmSrc = 2'b00)
        instr = 32'hFFFFF000; // Example I-type instruction with 20-bit immediate
        ImmSrc = 2'b00;
        #10;
        $display("Test case 1: ImmSrc = %b, Instr = %h, ImmExt = %h", ImmSrc, instr, ImmExt);
        
        // Test case 2: S-type instruction (ImmSrc = 2'b01)
        instr = 32'hFF00FF00; // Example S-type instruction
        ImmSrc = 2'b01;
        #10;
        $display("Test case 2: ImmSrc = %b, Instr = %h, ImmExt = %h", ImmSrc, instr, ImmExt);
        
        // Test case 3: B-type instruction (ImmSrc = 2'b10)
        instr = 32'hFFFFF123; // Example B-type instruction
        ImmSrc = 2'b10;
        #10;
        $display("Test case 3: ImmSrc = %b, Instr = %h, ImmExt = %h", ImmSrc, instr, ImmExt);
        
        // Test case 4: Default case
        ImmSrc = 2'b11; // Invalid ImmSrc value
        #10;
        $display("Test case 4: ImmSrc = %b, Instr = %h, ImmExt = %h", ImmSrc, instr, ImmExt);
        
        // End simulation
        $finish;
    end

endmodule

