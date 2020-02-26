module TestBench();
    reg clock;
    reg [63:0] in_a, in_b; 
    reg [3:0] in_c;
    wire [63:0] out;
    ALU alu(.A(in_a),
            .B(in_b),
            .C(in_c),
            .R(out));

    always begin
        #5
        clock <= ~clock;
    end

    initial begin
        // Monitor the output
        $monitor("Time: %d ALU Res: %d", $time, out);
        in_c <= 4'b0000;
        in_a <= 5;
        in_b <= 5;
        clock <= 0;
        #10
        in_a <= 10;
        in_b <= 10;
        in_c <= 4'b0001;
        #10
        in_a <= 27;
        in_b <= 43;
        in_c <= 4'b0010;
        #10
        in_c <= 4'b0110;
        #10
        in_c <= 4'b0111;
        #10
        in_c <= 4'b0111;
        $finish;
    end
endmodule