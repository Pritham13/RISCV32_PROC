`timescale 1ns / 1ps // Adjust the timescale as needed
`include "extend.v"
module extend_tb;

reg [11:0] ext;
wire [31:0] ImmExt;

// Instantiate the module
extend uut (
    .ext(ext),
    .ImmExt(ImmExt)
);

// Stimulus generation
initial begin
    ext = 12'hABC; // Input value
    #10; // Delay for 10 time units
    $finish; // Finish simulation
end

// Dumping the waveform
initial begin
    $dumpfile("extend_tb.vcd"); // Specify the name of the dump file
    $dumpvars(0, extend_tb); // Dump all variables in the module
    #0; // Delay for 0 time units to start dumping
end

endmodule
