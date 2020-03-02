`timescale 1ns / 1ps

    /*
    Luke Zambella
    ELC463 Computer Engineering II
    Pipeline for MEM/WB stage
    */ 

module MEM_PIPE(
    input CLK,  
    input RESET,
    input [31:0] MEM_DATA, ALU_VAL, 
    input [4:0] REG_DESTINATION,
    input [1:0] ALU_CONTROL,
    
    output reg [31:0] MEM_DATA_OUT, ALU_VAL_OUT,
    output reg [4:0] REG_DESTINATION_OUT,
    output reg [1:0] ALU_CONTROL_OUT
     
);

always @( posedge CLK or posedge RESET) begin
    if(RESET) begin
            MEM_DATA_OUT        <= 0;
            ALU_VAL_OUT         <= 0;
            REG_DESTINATION_OUT <= 0;
            ALU_CONTROL_OUT     <= 0;
    end
    else begin
            MEM_DATA_OUT        <= MEM_DATA;
            ALU_VAL_OUT         <= ALU_VAL;
            REG_DESTINATION_OUT <= REG_DESTINATION;
            ALU_CONTROL_OUT     <= ALU_CONTROL;
         
    end
    
end

endmodule
