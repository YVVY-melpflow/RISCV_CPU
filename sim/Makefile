
sim: run_sim
	vvp run_sim

build: run_sim

run_sim: mem
	iverilog -o run_sim -f ../design/filelist.f -f ../testbench/filelist.f -g 2012 -Wall

mem:
	make testcase -C ../testcase
	cp ../testcase/ADDI_mem.txt ../memory/imem.txt

clean:
	rm -f run_sim
	rm -f *.vcd
	rm -f ../memory/imem.txt
	make clean -C ../testcase
