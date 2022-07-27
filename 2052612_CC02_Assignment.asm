.data
        array: .asciiz "|   |   |   |\n|   |   |   |\n|   |   |   |\n"
        Input: .asciiz "Player   please pick your move (1-9): "
        Invalid: .asciiz "Invalid! Please choose again!\n"
        playerX: .asciiz "X" 
        playerO: .asciiz "O"
	line: .asciiz "\n"
	winx: .asciiz "\nPlayer X is the Champion.\n"
	wino: .asciiz "\nPlayer O is the Champion.\n"
	Tie: .asciiz  "\nIt is a Tie."
	Option: .asciiz "\n\nAgain? 1-YES | 2-NO \nYour choice: "
	num1: .byte '1'
	num2: .byte '2'
	num3: .byte '3'
	num4: .byte '4'
	num5: .byte '5'
	num6: .byte '6'
	num7: .byte '7'
	num8: .byte '8'
	num9: .byte '9'
.text
main:
        move $t1, $zero       #reset value to 0
        move $t2, $zero       #each spot has it own counter
        move $t3, $zero
        move $t4, $zero
        move $t5, $zero
        move $t6, $zero
        move $t7, $zero
        move $t8, $zero
        move $t9, $zero
        
        move $s1, $zero       #move count 
        la $s2, array
        la $s3, Input
        
        lb $a1, num1
        sb $a1, 2($s2)
        lb $a1, num2
        sb $a1, 6($s2)
        lb $a1, num3
        sb $a1, 10($s2)
        lb $a1, num4
        sb $a1, 16($s2)
        lb $a1, num5
        sb $a1, 20($s2)
        lb $a1, num6
        sb $a1, 24($s2)
        lb $a1, num7
        sb $a1, 30($s2)
        lb $a1, num8
        sb $a1, 34($s2)
        lb $a1, num9
        sb $a1, 38($s2)
print:
        li $v0, 4
        la $a0, line
        syscall
        li $v0, 4
        la $a0, array
        syscall
        
        beq $s1, 9, tie
        rem $t0, $s1, 2
        addi $s1, $s1, 1	
        bne $t0, $zero, MoveO
        j MoveX
MoveX:
        lb $a1, playerX
        sb $a1, 7($s3)
        j tictac
MoveO:
        lb $a1, playerO
        sb $a1, 7($s3)
        j tictac
tictac:
        li $v0, 4
        la $a0, Input
        syscall
        li $v0, 5
        syscall 
        move $s5, $v0
        
        beq $s5, 1, Lmeo1
        beq $s5, 2, Lmeo2
        beq $s5, 3, Lmeo3
        beq $s5, 4, Lmeo4
        beq $s5, 5, Lmeo5
        beq $s5, 6, Lmeo6
        beq $s5, 7, Lmeo7
        beq $s5, 8, Lmeo8
        beq $s5, 9, Lmeo9
        j invalid

Lmeo1:
        bne $t1, $zero, invalid
        bne $t0, $zero, O1
        j X1
        
        X1:
        addi $t1, $t1, 1
        sb $a1, 2($s2)
        j wincondition
        
        O1:
        addi $t1, $t1, -1
        sb $a1, 2($s2)
        j wincondition
        
Lmeo2:
        bne $t2, $zero, invalid
        bne $t0, $zero, O2
        j X2
        
        X2:
        addi $t2, $t2, 1
        sb $a1, 6($s2)
        j wincondition
        
        O2:
        addi $t2, $t2, -1
        sb $a1, 6($s2)
        j wincondition
        
Lmeo3:
        bne $t3, $zero, invalid
        bne $t0, $zero, O3
        j X3
        
        X3:
        addi $t3, $t3, 1
        sb $a1, 10($s2)
        j wincondition
        
        O3:
        addi $t3, $t3, -1
        sb $a1, 10($s2)
        j wincondition
        
Lmeo4:
        bne $t4, $zero, invalid
        bne $t0, $zero, O4
        j X4
        
        X4:
        addi $t4, $t4, 1
        sb $a1, 16($s2)
        j wincondition
        
        O4:
        addi $t4, $t4, -1
        sb $a1, 16($s2)
        j wincondition
        
Lmeo5:
        bne $t5, $zero, invalid
        bne $t0, $zero, O5
        j X5
        
        X5:
        addi $t5, $t5, 1
        sb $a1, 20($s2)
        j wincondition
        
        O5:
        addi $t5, $t5, -1
        sb $a1, 20($s2)
        j wincondition
        
Lmeo6:
        bne $t6, $zero, invalid
        bne $t0, $zero, O6
        j X6
        
        X6:
        addi $t6, $t6, 1
        sb $a1, 24($s2)
        j wincondition
        
        O6:
        addi $t6, $t6, -1
        sb $a1, 24($s2)
        j wincondition
        
Lmeo7:
        bne $t7, $zero, invalid
        bne $t0, $zero, O7
        j X7
        
        X7:
        addi $t7, $t7, 1
        sb $a1, 30($s2)
        j wincondition
        
        O7:
        addi $t7, $t7, -1
        sb $a1, 30($s2)
        j wincondition
        
Lmeo8:
        bne $t8, $zero, invalid
        bne $t0, $zero, O8
        j X8
        
        X8:
        addi $t8, $t8, 1
        sb $a1, 34($s2)
        j wincondition
        
        O8:
        addi $t8, $t8, -1
        sb $a1, 34($s2)
        j wincondition

Lmeo9:
        bne $t9, $zero, invalid
        bne $t0, $zero, O9
        j X9
        
        X9:
        addi $t9, $t9, 1
        sb $a1, 38($s2)
        j wincondition
        
        O9:
        addi $t9, $t9, -1
        sb $a1, 38($s2)
        j wincondition

wincondition:
        move $s6, $zero
        add $s6, $t1, $t4
        add $s6, $s6, $t7
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t2, $t5
        add $s6, $s6, $t8
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t3, $t6
        add $s6, $s6, $t9
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t1, $t2
        add $s6, $s6, $t3
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t4, $t5
        add $s6, $s6, $t6
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t7, $t8
        add $s6, $s6, $t9
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t1, $t5
        add $s6, $s6, $t9
        beq $s6, 3, winX
        beq $s6, -3, winO
        
        move $s6, $zero
        add $s6, $t3, $t5
        add $s6, $s6, $t7
        beq $s6, 3, winX
        beq $s6, -3, winO
        j print
        
invalid:
        li $v0, 4
        la $a0, Invalid
        syscall
        j tictac
winX: 
        li $v0, 4
        la $a0, array
        syscall
        
        li $v0, 4
        la $a0, winx
        syscall
        
        j endgame
winO: 
        li $v0, 4
        la $a0, array
        syscall
        
        li $v0, 4
        la $a0, wino
        syscall
        
        j endgame
tie: 
        li $v0, 4
        la $a0, Tie
        syscall
endgame:
        li $v0, 4
        la $a0, Option
        syscall
        li $v0, 5
        syscall
        beq $v0, 1, main
        beq $v0, 2, realend
        li $v0, 4
        la $a0, Invalid
        syscall
        j endgame
realend:
        li $v0, 10
        syscall