RTL_LIST  := ../design/filelist.f
RTL       := $(shell cat $(RTL_LIST))
TB        := ../testbench/myTestbench.sv ../memory/InstMem.sv

CASE      := $(basename $(notdir $(wildcard ../test/*.s)))
NOW_CASE  := ADDI_0
IMEM_DATA := ../memory/InstMemData.txt

.PHONY: sim clean

../test/%_mem.txt: ../test/%.s
	make -C ../test $*_mem.txt

runsim: $(RTL_LIST) $(RTL) $(TB) $(IMEM_DATA)
	iverilog -g2012 -o $@ -f $(RTL_LIST) $(TB)

sim: runsim
	vvp runsim

$(IMEM_DATA): | ../test/$(NOW_CASE)_mem.txt
	cp $< $(IMEM_DATA)

check-%: ../test/%_mem.txt
	cp $< $(IMEM_DATA)
	make runsim
	make sim | tee sim_log.txt
	grep -o "PC.*" sim_log.txt > actual.txt
	@if diff -q actual.txt ../test/$*_exp.txt > /dev/null; then \
		echo $* Pass; \
	else \
		echo $* Fail; \
		diff -u actual.txt ../test/$*_exp.txt; \
	fi;

regression:
	pass=0; fail=0; \
	for case in $(CASE); do \
		if $(MAKE) --no-print-directory check-$$case; then \
			pass=$$((pass + 1)); \
		else \
	        fail=$$((fail + 1)); \
	    fi; \
	done; \
	echo "======================="; \
	echo "PASS=$$pass FAIL=$$fail"; \
	echo "======================="; \
	test "$$fail" -eq 0

clean:
	make -C ../test clean
	rm -f runsim *.vcd $(IMEM_DATA)
