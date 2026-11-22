RTL_LIST := ../design/filelist.f
RTL      := $(shell cat $(RTL_LIST))
TB       := ../testbench/myTestbench.sv

.PHONY: sim clean

runsim: $(RTL_LIST) $(RTL) $(TB)
	iverilog -g2012 -o $@ -f $(RTL_LIST) $(TB)

sim: runsim
	vvp runsim

clean:
	rm -f runsim *.vcd
