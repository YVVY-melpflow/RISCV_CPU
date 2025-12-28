SOURCE = ../testbench/testbench.sv \
         ../design/CPU.sv \
	     ../design/ProgramCounter.sv \
	     ../mem/InstructionMemory.sv

.PHONY: sim clean

my_design: $(SOURCE)
	iverilog -o my_design $(SOURCE) -I ../design -g 2012 -Wall | tee compile.log

memdata:
	./gen_memdata.sh > ../mem/imem.txt

sim: my_design memdata
	vvp my_design | tee sim.log

clean:
	rm -f my_design compile.log sim.log ../mem/imem.txt
