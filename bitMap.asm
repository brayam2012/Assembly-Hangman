#In order for this code to work set connect to the bitmap display with the settings:
#Unit in Pixels (Width and Height) = 8
#Display in Pixels (Width and Height) = 256
#Base address for display = 0x10040000 (heap)

.data
ColorTable:            # Table to track colors RGB
    .word 0x000000     # black (0)
    .word 0x0000FF     # blue (1)
    .word 0x00FF00     # green (2)
    .word 0xFF0000     # red (3)
    .word 0xFFFFFF     # white (4)
    .word 0xFFC0CB	#Pink (5)
    .word 0xFFFF00	#Yellow (6)

.text

#Draws a hagman on the bitmap display making lines using loops
drawHangMan:
	subi	$sp, $sp, 40
	sw	$ra, 36($sp)
	sw	$s0, 32($sp)
	
	li	$s0, 7
	Lloop3:
		bge $s0, 24, Lend3
		move	$a0, $s0	#x-coordinate $a2
		li	$a1, 3		#y-coordinate $a1
		li	$a2, 4		# color in $a2
		jal	DrawDot		#Draw the dot
			
		addi $s0, $s0, 1
		b Lloop3
		
		Lend3:
#######################################
	li	$s0, 3
	Lloop4:
		bge $s0, 29, Lend4
		li	$a0, 7
		move	$a1, $s0	
		li	$a2, 4		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop4
		
		Lend4:
########################################
	li	$s0, 3
	Lloop5:
		bge $s0, 28, Lend5
		move	$a0, $s0
		li	$a1, 29		#y-coordinate (0)
		li	$a2, 4		
		jal	DrawDot		#Draw the dot
			
		addi $s0, $s0, 1
		b Lloop5
		
		Lend5:
#############################################
	li	$s0, 3
	Lloop6:
		bge $s0, 19, Lend6
		li	$a0, 20
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop6
		
		Lend6:
###############################################
	li	$s0, 8
	Lloop7:
		bge $s0, 25, Lend7
		li	$a0, 19
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop7
		
		Lend7:
###############################################
	li	$s0, 8
	Lloop8:
		bge $s0, 25, Lend8
		li	$a0, 21
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop8
		
		Lend8:
#############################################
	li	$s0, 9
	Lloop9:
		bge $s0, 16, Lend9
		li	$a0, 22
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop9
		
		Lend9:
############################################ arm
	li	$s0, 14
	Lloop10:
		bge $s0, 19, Lend10
		li	$a0, 23
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop10
		
		Lend10:
###########################################
	li	$s0, 9
	Lloop11:
		bge $s0, 16, Lend11
		li	$a0, 18
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop11
		
		Lend11:
######################################## arm
	li	$s0, 14
	Lloop12:
		bge $s0, 19, Lend12
		li	$a0, 17
		move	$a1, $s0	
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop12
		
		Lend12:
########################################
	li	$a0, 18
	li	$a1, 12
	li	$a2, 0
	jal	DrawDot
	
	li	$a0, 18
	li	$a1, 13
	li	$a2, 0
	jal	DrawDot
	
	li	$a0, 19
	li	$a1, 13
	li	$a2, 0
	jal	DrawDot
	
	li	$a0, 21
	li	$a1, 13
	li	$a2, 0
	jal	DrawDot
	
	li	$a0, 22
	li	$a1, 13
	li	$a2, 0
	jal	DrawDot
	
	li	$a0, 22
	li	$a1, 12
	li	$a2, 0
	jal	DrawDot
	
	li	$a0, 22
	li	$a1, 24
	li	$a2, 3
	jal	DrawDot
	
	li	$a0, 18
	li	$a1, 24
	li	$a2, 3
	jal	DrawDot
	
	li	$a0, 19
	li	$a1, 10
	li	$a2, 1
	jal	DrawDot
	
	li	$a0, 21
	li	$a1, 10
	li	$a2, 1
	jal	DrawDot
	
	
	li	$v0, 10
	syscall
	
	lw	$s0, 32($sp)
	lw	$ra, 36($sp)
	addi	$sp, $sp, 40
	
	jr	$ra
#######################################
#Draws a Trophy using horizontal lines with loops 
drawTrophy:
	subi	$sp, $sp, 40
	sw	$ra, 36($sp)
	sw	$s0, 32($sp)
	
	li	$s0, 10
	Lloop13:
		bge $s0, 23, Lend13
		move	$a0, $s0
		li	$a1, 7	
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop13
		
		Lend13:
	##########################
	li	$s0, 10
	Lloop14:
		bge $s0, 23, Lend14
		move	$a0, $s0
		li	$a1, 8
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop14
		
		Lend14:
	#############################
	li	$s0, 8
	Lloop15:
		bge $s0, 25, Lend15
		move	$a0, $s0
		li	$a1, 9
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop15
		
		Lend15:
	#######################
	li	$s0, 3
	Lloop16:
		bge $s0, 30, Lend16
		move	$a0, $s0
		li	$a1, 10
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop16
		
		Lend16:
	###########################
	li	$s0, 4
	Lloop17:
		bge $s0, 29, Lend17
		move	$a0, $s0
		li	$a1, 11
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop17
		
		Lend17:
###########################################
	li	$s0, 4
	Lloop18:
		bge $s0, 29, Lend18
		move	$a0, $s0
		li	$a1, 12
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop18
		
		Lend18:
########################################
	li	$s0, 7
	Lloop19:
		bge $s0, 26, Lend19
		move	$a0, $s0
		li	$a1, 13
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop19
		
		Lend19:
#######################################
	li	$s0, 7
	Lloop20:
		bge $s0, 26, Lend20
		move	$a0, $s0
		li	$a1, 14
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop20
		
		Lend20:
######################################
	li	$s0, 7
	Lloop21:
		bge $s0, 26, Lend21
		move	$a0, $s0
		li	$a1, 15
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop21
		
		Lend21:
########################################
	li	$s0, 7
	Lloop22:
		bge $s0, 26, Lend22
		move	$a0, $s0
		li	$a1, 16
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop22
		
		Lend22:
#########################################
	li	$s0, 10
	Lloop23:
		bge $s0, 23, Lend23
		move	$a0, $s0
		li	$a1, 17
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop23
		
		Lend23:
#########################################
	li	$s0, 10
	Lloop24:
		bge $s0, 23, Lend24
		move	$a0, $s0
		li	$a1, 18
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop24
		
		Lend24:
######################################## Bottom of the cup
	li	$s0, 9
	Lloop25:
		bge $s0, 24, Lend25
		move	$a0, $s0
		li	$a1, 28
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop25
		
		Lend25:
######################################
	li	$s0, 9
	Lloop26:
		bge $s0, 24, Lend26
		move	$a0, $s0
		li	$a1, 29
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop26
		
		Lend26:
#######################################
	li	$s0, 9
	Lloop27:
		bge $s0, 24, Lend27
		move	$a0, $s0
		li	$a1, 30
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop27
		
		Lend27:
########################################### Vertical lines
	li	$s0, 19
	Lloop28:
		bge $s0, 28, Lend28
		li	$a0, 15
		move	$a1, $s0
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop28
		
		Lend28:
########################################
	li	$s0, 19
	Lloop29:
		bge $s0, 28, Lend29
		li	$a0, 16
		move	$a1, $s0
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop29
		
		Lend29:
#########################################
	li	$s0, 19
	Lloop30:
		bge $s0, 28, Lend30
		li	$a0, 17
		move	$a1, $s0
		li	$a2, 6		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop30
		
		Lend30:
##########################################  Number 1
	li	$s0, 10
	Lloop31:
		bge $s0, 17, Lend31
		li	$a0, 16
		move	$a1, $s0
		li	$a2, 3		
		jal	DrawDot
			
		addi $s0, $s0, 1
		b Lloop31
		
		Lend31:
		
	li	$a0, 15
	li	$a1, 16
	li	$a2, 3
	jal	DrawDot
	
	li	$a0, 17
	li	$a1, 16
	li	$a2, 3
	jal	DrawDot
	
	li	$a0, 15
	li	$a1, 10
	li	$a2, 3
	jal	DrawDot
		
	lw	$s0, 32($sp)
	lw	$ra, 36($sp)
	addi	$sp, $sp, 40
	
	jr $ra
	
	

# Calculate Address
# Converts an (x, y) coordinate to a memory address
# input = $a0 - x coordinate (0-31)
# input = $a1 - y coordinate (0-31)
# return = $v0 - memory address
CalculateAddress:
    li $v0, 0x10040000 # Initialize base address for display (0x10040000)

    # Memory address = 0x10040000 + 4x + 4y * 32
    sll $t2, $a0, 2    # t2 = x * 4
    sll $t3, $a1, 7    # t3 = y * 32 (y * 4 * 8)
    add $v0, $v0, $t2  # Add x offset to base
    add $v0, $v0, $t3  # Add y offset to base
    
    jr $ra             # Return to caller

# Get Color
# Looks up the color number in the ColorTable
# input = $a2 - color number (0-4)
# return = $v1 - actual color value
GetColor:
    la $t0, ColorTable # Load base address of ColorTable
    sll $a2, $a2, 2    # Multiply color index by 4 (size of word)
    add $a2, $a2, $t0  # Add base address to offset
    lw $v1, 0($a2)     # Load the color value into $v1
    
    jr $ra             # Return to caller

# Draw Dot
# Draws a dot on the bitmap at coordinates (x, y) with specified color
#input - $a0 - x coordinate (0-31)
#input - $a1 - y coordinate (0-31)
#input - $a2 - color number (0,-4)
DrawDot:
    # Check for invalid coordinates (x, y)
    bltz $a0, doneDrawingDot   # x < 0
    bltz $a1, doneDrawingDot   # y < 0
    bgt $a0, 31, doneDrawingDot # x > 31
    bgt $a1, 31, doneDrawingDot # y > 31

    subi $sp, $sp, 20
    sw $ra, 16($sp)

    jal CalculateAddress       # Get the xy coordinate
    jal GetColor               # Get the color

    sw $v1, 0($v0)             # Draw the dot

    lw $ra, 16($sp)
    addi $sp, $sp, 20

    doneDrawingDot:
    jr $ra                     # Return to caller
    

