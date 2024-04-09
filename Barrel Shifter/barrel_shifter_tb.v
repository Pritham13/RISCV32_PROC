module barrel_shifter_tb;
    reg [31:0] data;
    reg [4:0] amt;
    reg rotation;
    wire [31:0] out;

    barrel_shifter bs (
        .data(data),
        .amt(amt),
        .dir_lr(rotation),
        .out(out)
    );
    integer i;
    // Initial block for testbench
    initial begin
        // Left rotation test
        for ( i = 0; i < 32; i=i+1) begin
            data = 32'b1;
            amt = i;
            rotation = 1'b1; // Set 'rotation' for left rotation
            #10; // Delay for simulation
        end

        // Right rotation test
        for ( i = 0; i < 32; i=i+1) begin
            data = 32'b1;
            amt = i;
            rotation = 1'b0; // Set 'rotation' for right rotation
            #10; // Delay for simulation
        end

        // Stop simulation
        $stop;
    end
endmodule