	
stringMatch:
	move $t0, $a0
	move $t1, $a1
	li $v0, 0
	
	LLoop_start:
		lb $t2, ($t0)
		lb $t3, ($t1)
		seq $t4, $t2, $zero
		seq $t5, $t3, $zero
		and $t6, $t4, $t5
		beq $t6, 1, LsetTrue
		
		bne $t2, $t3, Lfinish
		
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		
		b LLoop_start
	LsetTrue:
	li $v0, 1
	
	Lfinish:
	
	jr $ra
