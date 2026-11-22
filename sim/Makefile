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
	echo 00008888  > $(IMEM_DATA)
	echo 11119999 >> $(IMEM_DATA)
	echo 2222AAAA >> $(IMEM_DATA)
	echo 3333BBBB >> $(IMEM_DATA)
	echo 4444CCCC >> $(IMEM_DATA)
	echo 5555DDDD >> $(IMEM_DATA)
	echo 6666EEEE >> $(IMEM_DATA)
	echo 7777FFFF >> $(IMEM_DATA)

clean:
	rm -f runsim *.vcd $(IMEM_DATA)
