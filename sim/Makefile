
sim: run_sim
	vvp run_sim

build: run_sim

run_sim: mem
	iverilog -o run_sim ../design/ProgramCounter.sv ../design/CPU.sv ../testbench/testbench.sv ../testbench/InstructionMemory.sv -g 2012 -Wall

mem:
	@echo "00000000" >  ../memory/imem.txt
	@echo "01010101" >> ../memory/imem.txt
	@echo "02020202" >> ../memory/imem.txt
	@echo "03030303" >> ../memory/imem.txt
	@echo "04040404" >> ../memory/imem.txt
	@echo "05050505" >> ../memory/imem.txt
	@echo "06060606" >> ../memory/imem.txt
	@echo "07070707" >> ../memory/imem.txt

clean:
	rm -f run_sim
	rm -f *.vcd
	rm -f ../memory/imem.txt
