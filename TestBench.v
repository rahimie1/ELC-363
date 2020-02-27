/*
    Luke Zambella
    ELC463 Computer Engineering Lab II
    Test bench file for testing all components of the CPU
*/
module TestBench();
    reg clock;
    reg [63:0] in_a, in_b; 
    reg [3:0] in_c;
    wire [63:0] out;

    reg [10:0] instr;
    wire [6:0] control_out;
    wire [1:0] alu_out;

    reg mem_write, mem_read;
    reg [63:0] mem_addr;
    reg [63:0] write_data;
    wire [63:0] data_out;

    ALU alu(.A(in_a),
            .B(in_b),
            .C(in_c),
            .R(out));

    Controller control(.Instruction(instr),
                        .reg2loc(control_out[0]),
                        .aluSrc(control_out[1]),
                        .memRead(control_out[2]),
                        .memWrite(control_out[3]),
                        .regWrite(control_out[4]),
                        .mem2reg(control_out[5]),
                        .branch(control_out[6]),
                        .aluOp(alu_out));

    DATA_MEM mem_unit(.CLK(clock),
                      .MEM_WRITE(mem_write),
                      .MEM_READ(mem_read),
                      .MEM_ADDR_IN(mem_addr),
                      .WRITE_DATA(write_data),
                      .DATA_OUT(data_out));

    always begin
        #5
        clock <= ~clock;
    end

    initial begin
        // Monitor the output
        $monitor("Time: %4d ALU Res: %4d Control out: %7b Mem enables: R %b W %b Mem Addr: %4h Write_data: %4h Data out: %4h", $time, out, control_out, mem_read, mem_write, mem_addr, write_data, data_out);
        in_c <= 4'b0000;
        in_a <= 5;
        in_b <= 5;

        instr <='b10001011000;

        mem_read <= 1;
        mem_addr <= 4'h0;
        write_data <= 16'h1234;

        clock <= 0;

        #10
        in_a <= 10;
        in_b <= 10;
        in_c <= 4'b0001;

        instr <= 'b11001011000;

        mem_addr <= 4'h1;
  
        #10
        // write a unique value to memory
        mem_addr <= 4'h2;
        mem_write <= 1;
        mem_read <= 0;

        in_a <= 43;
        in_b <= 27;
        in_c <= 4'b0010;

        instr <= 'b10001010000;

        #10
        in_c <= 4'b0110;
        instr <= 'b10101010000;

        // Read stored data
        mem_write <= 0;
        mem_read <= 1;

        #10
        in_c <= 4'b0111;
        instr <='b11111000010;

        #10
        in_c <= 4'b0111;
        instr <= 'b11111000000;

        $finish;
    end
endmodule