CASE      := $(basename $(notdir $(wildcard ../test/*.s)))
IMEM_DATA := $(addsuffix _mem.txt,$(CASE))

.PHONY: clean 

all: $(IMEM_DATA)

%_mem.txt: %.out
	riscv32-unknown-linux-gnu-objdump -d -j .text $< | grep -E '^\s*[0-9a-f]+:' | cut -f2 > $@

%.out: %.s
	riscv32-unknown-linux-gnu-as $< -o $@

clean:
	rm -f *.out *_mem.txt
