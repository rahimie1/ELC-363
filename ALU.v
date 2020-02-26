`timescale 1ns / 1ps 

module ALU
(
  input [63:0] A,       // Input A
  input [63:0] B,       // Input B
  input [3:0] C,        // ALU Control input
  output reg [63:0] R,  // ALU Result
  output wire ZERO       // Outputs true if RES is zero
);



  always @(*) begin
    case (C)
      4'b0000 : R <= A & B;
      4'b0001 : R <= A | B;
      4'b0010 : R <= A + B;
      4'b0110 : R <= A - B;
      4'b0111 : R <= B;
      4'b1100 : R <= 64'hxxxxxxxx;
    endcase
  end

  assign ZERO = (B == 'h00) ? 'b1 : 'b0;

endmodule