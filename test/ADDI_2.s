# ゼロレジスタに結果は保存されず，常に 0 が読みだされること
addi  x1,  x0,  10 #  x1 =  10
addi  x0,  x1,  10 #  x0 =  20 (not written)
addi x10,  x0, -10 # x10 = -10
addi  x0, x10, -10 #  x0 = -20 (not written)
addi  x0,  x0, 100 #  x0 = 100 (not written)
addi  x0,  x0,   0 #  x0 =   0
addi  x0,  x0,   0 #  x0 =   0
addi  x0,  x0,   0 #  x0 =   0
