DUT_FILELIST = ../design/filelist.txt
TB_FILE = ../testbench/testbench.sv \
	      ../mem/InstructionMemory.sv

TEST = addi_sim.log

.PHONY: sim run_tests clean

my_design:
	iverilog -o $@ -c $(DUT_FILELIST) $(TB_FILE) -I ../design -g 2012 -Wall | tee compile.log

sim: my_design
	vvp my_design | tee sim.log

run_tests: $(TEST)

%_sim.log: ../testcode/%.mem my_design
	cp $< ../mem/imem.txt
	vvp my_design | tee $@

../testcode/%.mem:
	make -C ../testcode $@

clean:
	rm -f my_design *.log ../mem/imem.txt
