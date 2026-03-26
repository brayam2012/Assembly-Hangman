	.include "StringMatchFunction.asm"
	.include "bitMap.asm"
	
	.data
space:		.space 21
blank:		.asciiz	"_____"
enterHint:	.asciiz	"\n\nEnter a letter guess: "

animal:		.asciiz	"horse",
			 "tiger",
			 "camel",
			 "panda",
			 "skunk",
			 "lemur",
			 "shark",
			 "snake",
			 "gecko",
			 "raven"

prompt:		.asciiz	"Guess the 5 letter animal!!!!! \nHINT: "
			
horse:		.asciiz "You can ride him                 "
tiger:		.asciiz	"Cat with stripes                 "
camel:		.asciiz	"Has a hump in his back           "
panda:		.asciiz	"Chinese black and white bear     "
skunk:		.asciiz	"Stinks, black and white          "
lemur:		.asciiz	"Madagascar funny animal          "
shark:		.asciiz	"Deadly sea animal with big teeth "
snake:		.asciiz	"Rattle _______                   "
gecko:		.asciiz	"Insurance company pet            "
raven:		.asciiz	"Black bird                       "

strings:	.word	horse, tiger, camel, panda, skunk, lemur, shark, snake, gecko, raven
			
	.text
	.globl main
main:
	subi	$sp, $sp, 40
	sw	$ra, 36($sp)
	sw	$s0, 32($sp)
	sw	$s1, 28($sp)
	
	li	$v0, 42		#genearte a random number 0-9
	li	$a1, 9
	syscall
	move	$s0, $a0	#stores the offset 
	
	mul	$t0, $a0, 6	#add the offset to the array to get the animal
	la	$t1, animal
	add	$a0, $t0, $t1
	move	$s1, $a0	#STORES THE ADRESS OF THE ANIMAL STRING INTO $S1
	
	
	jal printPrompt
	
########################################
	
	jal getLetter
	
	la	$a0, blank
	move	$a1, $s1
	jal stringMatch		#checks if the guess from the user equals the animal 
	
	beqz   $v0, Llose	#if loser then draws hangman
	
	jal drawTrophy		#if winner then draws a trophy
	b LContinue
	
	Llose:
	jal drawHangMan
	
	LContinue:
	
	lw	$s1, 28($sp)
	lw	$s0, 32($sp)
	lw	$ra, 36($sp)
	addi	$sp, $sp, 40
	
	jr $ra
	
printPrompt:
	la $a0, prompt		#print the prompt
	li $v0, 4
	syscall
	
	lw	$t0, strings
	mul	$t1, $s0, 34	#Calculates the adress of the hint
	add	$a0, $t0, $t1
	
	li $v0, 4		#Print the hint
	syscall
	
	jr $ra
#Loops 8 times getting an imput from the user and fill the blanks in the buffer
getLetter:
	subi	$sp, $sp, 24
	sw	$ra, 20($sp)
	sw	$s2, 16($sp)
	
    	li $s2, 0
    
    LLoop_begin:
        bge $s2, 8, Lend	#check the number of tryes to guess a letter
        
        la $a0, enterHint	#print the prompt to enter a letter
        li $v0, 4
        syscall
    
        li $v0, 8
        la $a0, space		#stores the string entered by the user
        li $a1, 20
        syscall
        
        
        # Load the FIRST character from user input
        la $t4, space      # Load address of input buffer
        lb $t5, 0($t4)     # Load first byte (character) from input
        
        li $t2, 0
        LLoop_begin2:
            bge $t2, 5, Lend2
            
            # Load current character from animal string
            add $t3, $s1, $t2  # $t3 = address of animal char at position $t2
            lb $t6, 0($t3)     #Load the character from animal string
            
            # Compare the characters (bytes)
            beq $t5, $t6, match  #Compare actual character values
            Lcontinue:
            
            addi $t2, $t2, 1
            b LLoop_begin2
            
        match:
        	la $t7, blank
        	add $t7, $t7, $t2
            	sb $t5, ($t7)
            b Lcontinue
        
        Lend2:
        la $a0, blank
        li $v0, 4
        syscall
        
        addi $s2, $s2, 1
        b LLoop_begin
	Lend:
	
	lw	$s2, 16($sp)
	lw	$ra, 20($sp)
	addi	$sp, $sp, 24
	
	jr $ra
    
    
    
