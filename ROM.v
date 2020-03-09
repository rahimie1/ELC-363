/*
    Luke Zambella
    ELC463 Computer Engineering Lab II
    ROM that stores a program, replaces the instruction memory
*/
module ROM(out, address);
    output reg [31:0] out;
    input  [15:0] address; // address- 16 deep memory  
    always @(*) begin
        case (address)
            16'h0000:  out = 32'b11111000010000000000000101000000; // LDUR X0, [X10, #0]
            16'h0001:  out = 32'b11111000010000000000000101100001; // LDUR X1, [X11, #0]
            // Do some other stuff while memory values load
            16'h0002:  out = 32'b10001011000001010000000010000011; // ADD X3, X4, X5
            16'h0003:  out = 32'b11001011000001010000000010000110; // SUB X6, X4, X5
            16'h0004:  out = 32'b10101010000001010000000010000111; // ORR X7, X4, X5
            16'h0005:  out = 32'b10001010000001010000000010001000; // AND X8, X4, X5
            // Now add the loaded values and store back into memory
            16'h0006:  out = 32'b10001011000000010000000000000010; // ADD X2, X0, X1
            // Do some other useless stuff while the result propagates to the writeback
            16'h0007:  out = 32'b10001011000001010000000010000011; // ADD X3, X4, X5
            16'h0008:  out = 32'b11001011000001010000000010000110; // SUB X6, X4, X5
            16'h0009:  out = 32'b10101010000001010000000010000111; // ORR X7, X4, X5
            16'h000A:  out = 32'b10001010000001010000000010001000; // AND X8, X4, X5
            // Finally store the result into the same data memory location H0000 (updates 5 to 8)
            16'h000B:  out = 32'b11111000000000000000000101000010; // STUR X2, [X10, #0]
            // Branch back to the beginning
            16'h000C:  out = 32'b10110100000000000000000000001010; // CBZ X10, 0
            default: out=32'hD60003E0; //BR XZR
        endcase
    end
endmodule