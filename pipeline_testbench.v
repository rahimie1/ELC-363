`timescale 1ns/1ps
/*
    Luke Zambella
    ENG463 CENG Lab II
    Testbench for testing pipelining
*/
module pipeline_testbench();
    reg clock;
    reg [5:0] pc;
    wire [5:0] pc_passthrough;

    reg [10:0] instr;
    wire [10:0] instr_passthrough;

    wire [10:0] instr_b_pass;
    wire [10:0] instr_c_pass;

    INSTR_PIPE pipe_a(.CLK(clock),
                        .INSTR_IN(instr),
                        .COUNTER_IN(PC),
                        .INSTR_OUT(instr_passthrough),
                        .COUNTER_OUT(pc_passthrough));

    INSTR_PIPE pipe_b(.CLK(clock),
                        .INSTR_IN(instr_passthrough),
                        .COUNTER_IN(PC),
                        .INSTR_OUT(instr_b_pass),
                        .COUNTER_OUT(pc_passthrough));
    INSTR_PIPE pipe_c(.CLK(clock),
                        .INSTR_IN(instr_b_pass),
                        .COUNTER_IN(PC),
                        .INSTR_OUT(instr_c_pass),
                        .COUNTER_OUT(pc_passthrough));
    always begin
        #10
        clock = ~clock;
    end
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,clock);
        $dumpvars(1, instr_passthrough);
        $dumpvars(2, instr_b_pass);
        $dumpvars(3, instr_c_pass);
        clock = 0;
        // Initial instruction
        instr <= 11'b11111111111;
        // Clock cycles are every 20
        #20
        instr <= 11'b00000000000; // Update it again so it has a different input
        
        // new instruction should be at the input with the old one at the output
        $display("Time: %d |1st stage| i_out: %11b |2nd stage|  i_out %11b |3rd stage|  i_out: %11b", $time, instr_passthrough, instr_b_pass, instr_c_pass);
        #20
        instr <= 11'b11010110101;
        $display("Time: %d |1st stage| i_out: %11b |2nd stage|  i_out %11b |3rd stage|  i_out: %11b", $time, instr_passthrough, instr_b_pass, instr_c_pass);        // have to wait until it gets the new input
        #20 
        $display("Time: %d |1st stage| i_out: %11b |2nd stage|  i_out %11b |3rd stage|  i_out: %11b", $time, instr_passthrough, instr_b_pass, instr_c_pass);
        #20
        $display("Time: %d |1st stage| i_out: %11b |2nd stage|  i_out %11b |3rd stage|  i_out: %11b", $time, instr_passthrough, instr_b_pass, instr_c_pass);
        #20
        $display("Time: %d |1st stage| i_out: %11b |2nd stage|  i_out %11b |3rd stage|  i_out: %11b", $time, instr_passthrough, instr_b_pass, instr_c_pass);
        #20
        $display("Time: %d |1st stage| i_out: %11b |2nd stage|  i_out %11b |3rd stage|  i_out: %11b", $time, instr_passthrough, instr_b_pass, instr_c_pass);
        $finish;
    end 
endmodule