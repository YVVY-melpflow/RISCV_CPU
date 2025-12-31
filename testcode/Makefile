.PHONY: all clean

all: addi.mem

%.mem: %.verimem gen_memdata.out
	./gen_memdata.out < $< > $@

%.verimem: %.S_out
	riscv32-unknown-linux-gnu-objcopy -O verilog $< $@

%.S_out: %.S
	riscv32-unknown-linux-gnu-as $< -o $@

gen_memdata.out:
	g++ gen_memdata.cpp -o gen_memdata.out

clean:
	rm -f gen_memdata.out *.S_out *.verimem *.mem
