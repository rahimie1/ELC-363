`timescale 1ns / 1ps

    /*
    Luke Zambella
    ELC463 Computer Engineering II
    Pipeline for MEM/WB stage
    */ 

module MEM_PIPE(
    input CLK,
    input RESET,
    input [63:0] mem_address_in,
    input [63:0] mem_data_in,
    input [4:0] write_reg_in,
    input regWrite_in,
    input mem2Reg_in,
    
    output reg [63:0] mem_address_out,
    output reg [63:0] mem_data_out,
    output reg [4:0] write_reg_out,
    output reg regWrite_out,
    output reg mem2Reg_out
     
);

always @( posedge CLK or posedge RESET) begin
    if(RESET) begin
            regWrite_out <= 0;
            mem2Reg_out <= 0;
            mem_address_out <= 0;
            mem_data_out <= 0;
            write_reg_out <= 0;  
    end
    else begin
            regWrite_out <= regWrite_in;
            mem2Reg_out <= mem2Reg_in;
            mem_address_out <= mem_address_in;
            mem_data_out <= mem_data_in;
            write_reg_out <= write_reg_in;        
    end
    
end

endmodule

