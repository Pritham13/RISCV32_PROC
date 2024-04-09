`timescale 1ns / 10ps

module barrel_shifter(
    input  [31:0] data,
    input  [4:0] amt,
    input  dir_lr, // 1 rotate left, 0 rotate right
    output  [31:0] out
);
    wire [31:0] out_right;
    wire [31:0] out_left;
     reg ROTATE_LEFT = 1'b1;
     reg ROTATE_RIGHT = 1'b0;
    
    
    barrel_shifter_32_right bsr(.data(data), .amt(amt) , .out(out_right));
    barrel_shifter_32_left bsl(.data(data), .amt(amt) , .out(out_left));
    
     // if rotate right use rotated output  
    assign  out = (dir_lr == ROTATE_RIGHT) ? out_left:out_right;

endmodule

// rotates amt bits of data to the right
module barrel_shifter_32_right(
    input  [31:0] data,
    input  [4:0] amt,
    output  [31:0] out
);

    wire [31:0] s0;
    wire [31:0] s1;    
    wire [31:0] s2;
    wire [31:0] s3;
    
    //stage 0, shift 0 or 1 bit
    assign s0 =  amt[0]? {data[0], data[31:1]} :data ;
    //stage 1, shift 0 or 2 bits
    assign s1 =  amt[1]? {s0[1:0], s0[31:2]} :s0 ;
    //stage 2, shift 0 or 4 bits
    assign s2 = amt[2]?{s1[3:0], s1[31:4]} :s1;
    //stage 3, shift 0 or 8 bits
    assign s3 = amt[3]?{s2[7:0], s2[31:8]} :s2;
    //stage 4, shift 0 or 16 bits
    assign out = amt[4]?{s3[15:0], s3[31:16]} :s3;

endmodule

// rotates amt bits of data to the left
module barrel_shifter_32_left(
    input  [31:0] data,
    input  [4:0] amt,
    output  [31:0] out
);

    wire [31:0] s0;
    wire [31:0] s1;    
    wire [31:0] s2;
    wire [31:0] s3;

    //stage 0, shift 0 or 1 bit
    assign s0 =  amt[0]? {data[30:0], data[31]} :data ;
    //stage 1, shift 0 or 2 bits
    assign s1 =  amt[1]? {s0[29:0], s0[31:30]} :s0 ;
    //stage 2, shift 0 or 4 bits
    assign s2 = amt[2]?{s1[27:0], s1[31:28]} :s1;
    //stage 3, shift 0 or 8 bits
    assign s3 = amt[3]?{s2[23:0], s2[31:24]} :s2;
    //stage 4, shift 0 or 16 bits
    assign out = amt[4]?{s3[15:0], s3[31:16]} :s3;

endmodule