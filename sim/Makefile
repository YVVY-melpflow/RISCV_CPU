RTL_LIST  := ../design/filelist.f
RTL       := $(shell cat $(RTL_LIST))
TB        := ../testbench/myTestbench.sv ../memory/InstMem.sv
IMEM_DATA := ../memory/InstMemData.txt

.PHONY: sim clean

runsim: $(RTL_LIST) $(RTL) $(TB) $(IMEM_DATA)
	iverilog -g2012 -o $@ -f $(RTL_LIST) $(TB)

sim: runsim
	vvp runsim

$(IMEM_DATA):
	make memdata -C ../test

clean:
	rm -f runsim *.vcd $(IMEM_DATA)
