IMEM_DATA := ../memory/InstMemData.txt

.PHONY: clean memdata

memdata: $(IMEM_DATA)

$(IMEM_DATA): ADDI.out
	riscv32-unknown-linux-gnu-objdump -d -j .text $< | grep -E '^\s*[0-9a-f]+:' | cut -f2 > $@

ADDI.out: ADDI.s
	riscv32-unknown-linux-gnu-as $< -o $@

clean:
	rm -f ADDI.out $(IMEM_DATA)
