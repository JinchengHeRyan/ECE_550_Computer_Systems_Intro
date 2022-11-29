nop

addi $1, $0, 5

j _jump1

addi $1, $0, 6      # should not be executed

_jump1:
add $20, $0, $1     # test $1

# ====================
# Test bne, jal, jr
addi $1, $0, 1      # $1 = 1
addi $2, $0, 4      # $2 = 4

_for_loop_1:
bne $1, $2, _else_1
j _out_for_loop_1


_else_1:
jal _func_1
add $20, $3, $0     # $20 = 2, 4, 6
addi $1, $1, 1
j _for_loop_1

_out_for_loop_1:
halt

_func_1:
add $3, $1, $1
jr $ra
