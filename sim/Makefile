DUT_FILELIST = ../design/filelist.txt
TB_FILE = ../testbench/testbench.sv \
	      ../mem/InstructionMemory.sv

include ../testcode/testcase_list.txt

DIFFS = $(addsuffix _sim.diff, $(TESTS))

.PHONY: sim run_tests clean

my_design:
	iverilog -o $@ -c $(DUT_FILELIST) $(TB_FILE) -I ../design -g 2012 -Wall | tee compile.log

sim: my_design
	vvp my_design | tee sim.log

run_tests: $(DIFFS)
	@$(foreach tests, $(TESTS), \
	  if diff -q $(tests)_sim.diff ../testcode/$(tests).ans ; then \
	    echo "Test $(tests): PASS"; \
	  else \
	    echo "Test $(tests): FAIL"; \
	  fi;)

%_sim.log: ../testcode/%.mem my_design
	cp $< ../mem/imem.txt
	vvp my_design | tee $@

%_sim.diff: %_sim.log
	sed -e s/At.*:\ // $< -e /===/d -e /xxx/d -e /finish/d > $@

../testcode/%.mem:
	make -C ../testcode $@

clean:
	rm -f my_design *.log ../mem/imem.txt *.diff
	make clean -C ../testcode
