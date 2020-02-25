`timescale 1ns / 1ps 

module ALU
(
  input [63:0] A,
  input [63:0] B,
  input [3:0] C,
  output reg [63:0] R,
  output reg ZERO
);

  always @(*) begin
    case (C)
      4'b0000 : R = A & B;
      4'b0001 : R = A | B;
      4'b0010 : R = A + B;
      4'b0110 : R = A - B;
      4'b0111 : R = B;
      4'b1100 : R = 64'hxxxxxxxx;
    endcase

    if (R == 0) begin
      ZERO = 1'b1;
    end else if (R != 0) begin
      ZERO = 1'b0;
    end else begin
      ZERO = 1'bx;
    end
  end
  
endmodule