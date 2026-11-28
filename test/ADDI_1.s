# 演算結果が rd レジスタに保存されていること
addi  x1,  x0,  10 #  x1 = 10
addi  x2,  x1,  10 #  x2 = 20
addi x10,  x2,  10 # x10 = 30
addi x20, x10,  10 # x20 = 40
addi x31, x20,  10 # x31 = 50
addi x15, x31, -20 # x15 = 30
addi x20, x10, -20 # x20 = 10
addi x10,  x2, -10 # x10 = 10
