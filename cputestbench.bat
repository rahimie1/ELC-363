iverilog -o cpu.a ALU.v Controller.v CPU.v DATA_MEM.v EX_PIPE.v ID_PIPE.v INSTR_PIPE.v MEM_PIPE.v REG_MEM.v ROM.v CPU_testbench.v
vvp cpu.a