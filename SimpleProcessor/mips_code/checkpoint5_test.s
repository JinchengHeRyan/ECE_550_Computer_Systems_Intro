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

addi $1, $0, 1      # $1 = 1
addi $2, $0, 4      # $2 = 4

_for_loop_2:
blt $1, $2, _else_2
j _out_for_loop_2

_else_2:
jal _func_1
add $20, $3, $0     # $20 = 2, 4, 6
addi $1, $1, 1
j _for_loop_2

_out_for_loop_2:

bex rstatus_not_0
addi $20, $0, 10        # should be executed

setx 10
bex rstatus_not_0
addi $20, $0, 20        # should not be executed

rstatus_not_0:
addi $20, $0, 30        # should be executed

halt

_func_1:
add $3, $1, $1
jr $ra
