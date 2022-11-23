nop

addi $1, $0, 5

j _jump1

addi $1, $0, 6      # should not be executed

_jump1:
add $20, $0, $1     # test $1
