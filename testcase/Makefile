OUT = ADDI_mem.txt

testcase: $(OUT)

%_mem.txt: %.dis.tmp
	awk '{print $$2}' $< > $@

%.dis.tmp: %.dis
	sed -e '1,7d' $< > $@

%.dis: %.out
	riscv32-unknown-linux-gnu-objdump -d $< > $@

%.out: %.s
	riscv32-unknown-linux-gnu-as $< -o $@

clean:
	rm -f *_mem.txt *.dis.tmp *.dis *.out
