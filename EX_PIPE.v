`timescale 1ns / 1ps

    /*
    Luke Zambella
    ELC463 Computer Engineering II
    Pipeline for EX/MEM stage
    */ 

module EX_PIPE(
    input CLK,  
    input RESET,
    input ZERO,
    input [31:0] BRANCH, ALU_VAL, RT_READ, 
    input [4:0] REG_DESTINATION,
    input [5:0] ALU_CONTROL,
    
    output reg [31:0] BRANCH_OUT, RT_READ_OUT, ALU_VAL_OUT,
    output reg [4:0] REG_DESTINATION_OUT,
    output reg [5:0] ALU_CONTROL_OUT,
    output reg ZERO_OUT
     
);

always @( posedge CLK or posedge RESET) begin
    if(RESET) begin
            BRANCH_OUT        <= 0;
            ALU_VAL_OUT         <= 0;
            RT_READ_OUT         <= 0;
            REG_DESTINATION_OUT <= 0;
            ALU_CONTROL_OUT     <= 0;
            ZERO_OUT            <= 0;
    end
    else begin
            BRANCH_OUT        <= BRANCH;
            ALU_VAL_OUT         <= ALU_VAL;
            RT_READ_OUT         <= RT_READ;
            REG_DESTINATION_OUT <= REG_DESTINATION;
            ALU_CONTROL_OUT     <= ALU_CONTROL;
            ZERO_OUT            <= ZERO;         
    end
    
end

endmodule