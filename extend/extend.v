module extend(input [11:0]ext,
                output [31:0]ImmExt);
    

assign ImmExt={ {20{ext[11]}},ext };
endmodule