runsim:
	iverilog -o runsim ../testbench/myTestbench.sv ../design/CPU.sv ../design/ProgramCounter.sv -g 2012

sim: runsim
	vvp runsim

clean:
	rm -rf runsim *.vcd
