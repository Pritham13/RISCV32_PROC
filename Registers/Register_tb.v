`include "Register.v"
module registers_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units
    parameter SIM_TIME = 100;   // Simulation time in time units
    
    // Signals
    reg clk;
    reg [4:0] A1, A2, A3;
    reg [31:0] WD3;
    reg WE3, reset;
    wire [31:0] RD1, RD2;
    
    // Instantiate the registers module
    registers dut( 
	    .clk(clk),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(WD3),
        .WE3(WE3),
        .reset(reset),
        .RD1(RD1),
        .RD2(RD2)
    );

    // File Declaration for Dumping VCD File
    initial begin
        $dumpfile("registers_tb.vcd");
        $dumpvars(0, registers_tb);
    end

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;
    
    // Stimulus
    initial begin
        clk = 0;
        reset = 1; // Initially assert reset
        A1 = 5; // Read register 5
        A2 = 10; // Read register 10
        A3 = 15; // Write to register 15
        WD3 = 32'hABCDEF01; // Data to be written
        WE3 = 1; // Enable write
        
        // Release reset
        #10;
        reset = 0;

        // Write operation
        #20;
        WE3 = 0; // Disable write
        
        // Read operation
        #20;
        A1 = 15; // Change read register to the one written
        A2 = 0; // Change read register to check initial value
        WE3 = 0; // Ensure no write operation
        #20;
        $finish;
    end
    
    // Clock driver
    always begin
        #((CLK_PERIOD/2));
    end
    
endmodule
