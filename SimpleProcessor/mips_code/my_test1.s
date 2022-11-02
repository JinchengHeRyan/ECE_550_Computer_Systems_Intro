# $20 is always used for test
addi $1, $0, 5
add $20, $0, $1 # test $1
addi $2, $0, 3
add $20, $0, $2 #test $2
add  $3, $1, $2 
add $20, $0, $3 #test $3

sub $4, $1, $2
add $20, $0, $4 # test $4
and $5, $0, $1
add $20, $0, $5 # test $5
and $6, $1, $2
add $20, $0, $6 # test $6
or  $7, $0, $2
add $20, $0, $7 # test $7


sll $8, $1, 2
add $20, $0, $8 # test $8
sra $9, $3, 1
add $20, $0, $9 # test $9

addi $10, $0, 345
add $20, $0, $10 # test $10
addi $11, $0, 567
add $20, $0, $11 # test $11

sw $10, 1($0)
sw $11, 2($0)
lw $12, 1($0)
add $20, $0, $12 # test $12
lw $13, 2($0)
add $20, $0, $13 # test $13
 