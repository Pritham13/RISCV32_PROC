module controlUnit(input  [6:0]op,
                input [2:0]funct3,
                input funct7,zero,
                output reg  PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite,
                output [3:0]ALUControl,
                output reg [1:0]ImmSrc);

localparam [6:0]R_TYPE  = 7'b0110011,
                I_TYPE  = 7'b0010011,
                S_TYPE  = 7'b0100011,
                LOAD    = 7'b0000011,
                BRANCH  = 7'b1100011,
                JALR    = 7'b1100111,
                JAL     = 7'b1101111;


//assign ALUControl = {funct7, funct3};
always @(funct3,funct7,op,zero) begin
    case (op)
        //R-Type instruction
        R_TYPE :begin
            RegWrite <= 1;
            MemWrite <= 0;
            ResultSrc <= 2'b00;
            PCsrc <= 0;
            ALUSrc<=0;
        end

        LOAD :begin
            MemWrite<=0;
            RegWrite<=1;
            ALUcontrol<=4'b0000;
            ImmSrc<=2'b00;
            ALUSrc<=1;
            ResultSrc<=2'b01;
            PCsrc <= 0;
        end

        S_TYPE :begin
            MemWrite<=1;
            RegWrite<=0;
            ALUcontrol<=4'b0000;
            ImmSrc<=2'b01;
            ALUSrc<=1;
            PCsrc <= 0;
        end

        BRANCH :begin
            MemWrite<=0;
            RegWrite<=0;
            ALUcontrol<=4'b0001;
            ImmSrc<=2'b10;
            ALUSrc<=0;
            branch <= 1;
            PCsrc <= branch | zero;
        end

        JAL :begin
            MemWrite<=0;
            RegWrite<=1;
            ImmSrc<=2'b11;
            branch <= 0;
            ResultSrc<=2'b10;
            end

        I_TYPE :begin
            RegWrite <= 1;
            MemWrite <= 0;
            ImmSrc<=2'b00;
            ALUSrc <= 1;
            ResultSrc <= 2'b00;
            end
    endcase
end
endmodule 
