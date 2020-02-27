`timescale 1ns / 1ps

module Controller
(
  input [10:0] Instruction,
  output reg isZeroBranch,
  output reg isUnconBranch,

  output reg reg2loc,
  output reg [1:0] aluOp,
  output reg aluSrc,
  output reg memRead,
  output reg memWrite,
  output reg regWrite,
  output reg mem2reg,
  output reg branch
);
  /* OPCode macros */
  `define OPERATION_ADD               'b10001011000
  `define OPERATION_SUB               'b11001011000
  `define OPERATION_AND               'b10001010000
  `define OPERATION_ORR               'b10101010000
  
  `define OPERATION_LDUR              'b11111000010
  `define OPERATION_STUR              'b11111000000
  
  `define OPERATION_CBZ               'b00101101000
  `define OPERATION_B                 'b00000000101

  // Update control lines with each instruction
  always @(Instruction) begin 
    case (Instruction)
      // R-Types have the same control outputs
      `OPERATION_ADD,
      `OPERATION_SUB,
      `OPERATION_AND,
      `OPERATION_ORR: begin
        reg2loc <= 0;
        aluOp <= 2'b10;
        aluSrc <= 0;
        branch <= 0;
        memRead <= 0;
        memWrite <= 0;
        regWrite <= 1;
        mem2reg <= 0;
      end
      `OPERATION_LDUR: begin
        reg2loc <= 'bx;
        aluOp <= 2'b00;
        aluSrc <= 1;
        branch <= 0;
        memRead <= 1;
        memWrite <= 0;
        regWrite <= 1;
        mem2reg <= 1;
      end
      `OPERATION_STUR: begin
        reg2loc <= 1'b1;
        aluOp <= 2'b01;
        aluSrc <= 1;
        branch <= 0;
        memRead <= 1;
        memWrite <= 1;
        regWrite <= 0;
        mem2reg <= 1'bx;
      end
      `OPERATION_CBZ: begin
        reg2loc <= 1'b1;
        aluOp <= 2'b01;
        aluSrc <= 0;
        branch <= 1;
        memRead <= 0;
        memWrite <= 0;
        regWrite <= 0;
        mem2reg <= 1'bx;
      end
    endcase
  end

endmodule
