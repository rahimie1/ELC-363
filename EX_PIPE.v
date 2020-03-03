`timescale 1ns / 1ps

    /*
    Luke Zambella
    ELC463 Computer Engineering II
    Pipeline for EX/MEM stage
    */ 

module EX_PIPE(
    
  input CLK,
  input RESET,
  input ZeroBranch_in, 	
  input UnconBranch_in, 	
  input memRead_in, 		
  input memWrite_in, 		
  input regWrite_in, 		
  input mem2Reg_in, 		
  input [63:0] shifted_PC_in,
  input alu_zero_in,
  input [63:0] alu_result_in,
  input [63:0] write_data_mem_in,
  input [4:0] write_reg_in,
  
  output reg ZeroBranch_out, 	
  output reg UnconBranch_out, 
  output reg memRead_out, 		
  output reg memWrite_out, 		
  output reg regWrite_out,		
  output reg mem2Reg_out,		
  output reg [63:0] shifted_PC_out,
  output reg alu_zero_out,
  output reg [63:0] alu_result_out,
  output reg [63:0] write_data_mem_out,
  output reg [4:0] write_reg_out
);

  always @( posedge CLK or posedge RESET) begin
        if(RESET) begin
            ZeroBranch_out <= 0;
            UnconBranch_out <= 0;
  	        memRead_out <= 0;
 	        memWrite_out <= 0;

            regWrite_out <= 0;
  	        mem2Reg_out <= 0;

            shifted_PC_out <= 0;
            alu_zero_out <= 0;
            alu_result_out <= 0;
            write_data_mem_out <= 0;
            write_reg_out <= 0;
    end
    else begin
            ZeroBranch_out <= ZeroBranch_in;
            UnconBranch_out <= UnconBranch_in;
  	        memRead_out <= memRead_in;
 	        memWrite_out <= memWrite_in;

            regWrite_out <= regWrite_in;
  	        mem2Reg_out <= mem2Reg_in;

            shifted_PC_out <= shifted_PC_in;
            alu_zero_out <= alu_zero_in;
            alu_result_out <= alu_result_in;
            write_data_mem_out <= write_data_mem_in;
            write_reg_out <= write_reg_in;         
    end
    
end

endmodule