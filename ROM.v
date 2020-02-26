module ROM(out, address);
    output reg [31:0] out;
    input  [15:0] address; // address- 16 deep memory  
    always @(address) begin
        case (address)
        16'h0000:  out = 32'b10001011000000100000000000100000; // ADD X0, X1, X2
        16'h0001:  out = 32'b11001011000001010000000010000011; // SUB X3, X4, X5
        default: out=32'hD60003E0; //BR XZR
        endcase
    end
endmodule