iverilog -o testbench.out ALU.v Controller.v DATA_MEM.v INSTR_PIPE.v ROM.v Testbench.v REG_MEM.v
vvp testbench.out