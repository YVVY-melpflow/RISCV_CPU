# -2048 から +2047 までの加算・減算ができること
addi x1, x0,  2047 # x1 = 2047
addi x1, x1, -2048 # x1 =   -1
addi x1, x1,     1 # x1 =    0
addi x1, x1,     1 # x1 =    1
addi x1, x1,    -1 # x1 =    0
addi x1, x1,    -1 # x1 =   -1
addi x1, x1,  -100 # x1 = -101
addi x1, x1,   101 # x1 =    0
