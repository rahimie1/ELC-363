`timescale 1ns / 1ps

    /*
    Luke Zambella
    ELC463 Computer Engineering II
    Pipeline for ID/EX stage
    */  
module ID_PIPE(
    input CLK,  
    input RESET,
    input [31:0] SIGN_EXT, RS_READ, RT_READ, NEW_PC,
    input [26:0] LOWER_BITS,
    input [9:0] CONTROL_SIGNALS,
    output reg [163:0] NEW_CONTENT
    
);

always @( posedge CLK or posedge RESET) begin
    if(RESET) begin
            NEW_CONTENT <= {SIGN_EXT, RS_READ, RT_READ, NEW_PC, LOWER_BITS, NEW_PC, CONTROL_SIGNALS};
    end
    else begin
            NEW_CONTENT <= 164'b0;
    end
    


end
   
endmodule