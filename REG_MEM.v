/*
    Luke Zambella
    ELC463 Computer Engineering Lab II
    Module containg each of the 32 registers and read/write enables
*/
module REG_MEM(
        input CLK,                  // System clock
        input  [4:0] READ_REG_A,    // read from registser A
        input  [4:0] READ_REG_B,    // read from register b
        input  [4:0] WRITE_REG,     // write WRITE_DATA to this register (if regwrite enabled)
        input  [63:0] WRITE_DATA,   // Data to write to register
        input  REG_WRITE_ENABLE,    // enable for writing to register
        output reg [63:0] DATA_OUT_A,   // data read from register input a
        output reg [63:0] DATA_OUT_B    // data read from register input b
    );
    
        reg [63:0] REGISTER [31:0];      // 32 general purpose registers holding 64 bits each
        // Asyncronous read
        always @ (READ_REG_A or READ_REG_B) begin        
            DATA_OUT_B <= REGISTER[READ_REG_B];
            DATA_OUT_A <= REGISTER[READ_REG_A];
        end

        // Syncronous write
        always @ (posedge CLK) begin
            if (REG_WRITE_ENABLE == 1'b1) begin
                REGISTER[WRITE_REG] <= WRITE_DATA;
            end
        end
        // lets give some registers initial values
        initial begin
            $monitor("Time: %d REG_A output: %4h REG_B output: %4h", $time, DATA_OUT_A, DATA_OUT_B);
            REGISTER[0] = 'h0000;
            REGISTER[1] = 'h0005;
            REGISTER[2] = 'h0005;
            REGISTER[3] = 'hFFFF;
            REGISTER[4] = 'h0001;
            REGISTER[5] = 'h0000;
        end
endmodule