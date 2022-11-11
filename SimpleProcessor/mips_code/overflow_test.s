nop

addi $1, $0, 1           # $1 = 1
sll  $1, $1, 30          # $1 = 0x40000000

addi $2, $0, 1           # $2 = 1
sll  $2, $2, 30          # $2 = 0x40000000

add  $3, $1, $2          # add overflow happens

add  $20, $0, $1         # $20 = 0x40000000
