`timescale 1ns / 1ps 

module ALU
(
  input [63:0] A,       // Input A
  input [63:0] B,       // Input B
  input [10:0] C,        // instruction input fpr determining which operation
  input [1:0] alu_op,   // alu opcode input
  output reg [63:0] R,  // ALU Result
  output wire ZERO       // Outputs true if RES is zero
);



  always @(*) begin
    if (alu_op == 2'b00) begin // memory read/write opcode always pass ADD function
      R <= A + B;
    end else if (alu_op == 2'b01) begin // pass input b
      R <= B;
    end else if (alu_op == 2'b10) begin // check instruction input to determine
      case (C)
        11'b10001010000 : R <= A & B;
        11'b10101010000 : R <= A | B;
        11'b10001011000 : R <= A + B;
        11'b11001011000 : R <= A - B;
     endcase
    end
  end

  assign ZERO = (B == 'h00) ? 'b1 : 'b0;
initial begin
    $dumpvars(0,A);
    $dumpvars(1,B);
    $dumpvars(2,C);
    $dumpvars(3,R);
    $dumpvars(4,alu_op);
end
endmodule