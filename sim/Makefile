
sim: run_sim
	vvp run_sim

build: run_sim

run_sim:
	iverilog -o run_sim ../design/ProgramCounter.sv ../design/CPU.sv ../testbench/testbench.sv ../testbench/InstructionMemory.sv -g 2012 -Wall

clean:
	rm -f run_sim
	rm -f *.vcd
