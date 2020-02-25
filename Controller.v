`timescale 1ns / 1ps

module Controller
(
  input [10:0] Instruction,
  input clk,
  output reg [1:0] aluOp,
  output reg aluSrc,
  output reg isZeroBranch,
  output reg isUnconBranch,
  output reg memRead,
  output reg memWrite,
  output reg regWrite,
  output reg mem2reg
);

always @(posedge clk) begin

    
    if (Instruction[10:0] == 11'bX) begin
    // CBZ 
        if (aluOp == 2'b00) begin
    
            //aluOp <= 2'b01; 
            aluSrc <= 1`b0; 
            isZeroBranch <= 1`b1; 
            isUnconBranch <= 1`b0 ; 
            memRead <= 1`b0 ; 
            memWrite <= 1`b0 ; 
            regWrite <= 1`b0 ; 
            mem2reg<= 1`bX ; 
    
    end
    end 
    
end

endmodule
