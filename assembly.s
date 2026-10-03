.file	"Project.c"                # Source file name
.text                             # Beginning of the text (code) section
.section	.rodata.str1.8,"aMS",@progbits,1   # Read-only data section for strings
.align 8                          # Align to an 8-byte boundary
.LC0:                             # Label for the error message
	.string	"Min number can't be more than max number, try again."  # Error message string

.section	.rodata.str1.1,"aMS",@progbits,1   # Another read-only data section for strings
.LC1:                             # Label for the input prompt
	.string	"Enter min and max number: "      # Prompt to enter min and max numbers
.LC2:                             # Label for the input format
	.string	"%d %d"                         # Format specifier for two integers

.text                             # Switch back to the text (code) section
.globl	randomInRange              # Declare the function `randomInRange` as globally accessible
.type	randomInRange, @function    # Specify that `randomInRange` is a function
randomInRange:                    # Start of the `randomInRange` function
.LFB39:                           # Label for function frame information
	.cfi_startproc                # Start debugging information for this function
	endbr64                       # Indirect branch protection (security feature)
	subq	$24, %rsp              # Allocate 24 bytes on the stack for local variables
	.cfi_def_cfa_offset 32        # Update stack frame information
	movl	%edi, 12(%rsp)        # Store the first argument (min) at offset 12 on the stack
	movl	%esi, 8(%rsp)         # Store the second argument (max) at offset 8 on the stack
	jmp	.L2                     # Jump to label `.L2`

.L3:                              # Label for error-handling loop
	leaq	.LC0(%rip), %rdi      # Load the address of the error message into %rdi
	call	puts@PLT               # Print the error message
	leaq	.LC1(%rip), %rdi      # Load the address of the input prompt into %rdi
	call	puts@PLT               # Print the input prompt
	leaq	8(%rsp), %rdx         # Load the address of `max` on the stack into %rdx
	leaq	12(%rsp), %rsi        # Load the address of `min` on the stack into %rsi
	leaq	.LC2(%rip), %rdi      # Load the address of the format string into %rdi
	movl	$0, %eax              # Clear the register %eax
	call	__isoc99_scanf@PLT    # Call scanf to read min and max values

.L2:                              # Label to check input validity
	movl	8(%rsp), %eax         # Load `max` from the stack into %eax
	cmpl	%eax, 12(%rsp)        # Compare `min` with `max`
	jg	.L3                     # If min > max, jump back to `.L3` to retry

	call	rand@PLT               # Generate a random number
	movl	12(%rsp), %esi        # Load `min` from the stack into %esi
	movl	8(%rsp), %ecx         # Load `max` from the stack into %ecx
	subl	%esi, %ecx            # Calculate (max - min)
	addl	$1, %ecx              # Add 1 to the difference
	cltd                         # Sign-extend %eax into %edx for division
	idivl	%ecx                  # Divide %eax by (max - min + 1)
	leal	(%rsi,%rdx), %eax     # Add `min` to the remainder of the division
	addq	$24, %rsp             # Restore the stack pointer
	.cfi_def_cfa_offset 8        # Update stack frame information
	ret                          # Return the random number
	.cfi_endproc                 # End debugging information for this function

.LFE39:                           # End of the function `randomInRange`
	.size	randomInRange, .-randomInRange  # Calculate the size of the function

.section	.rodata.str1.8         # Another read-only data section for strings
.align 8                          # Align to an 8-byte boundary
.LC3:                             # Label for the game welcome message
	.string	"Welcome To Our Guessing Game!!!!!\n******************"  # Welcome message

.align 8                          # Align to an 8-byte boundary
.LC4:                             # Label for the difficulty selection prompt
	.string	"Please enter the difficulty you want, press\n E for Easy (6 attempts) \n M for Medium (4 attempts) \n H for Hard (2 attempts)"  # Difficulty selection prompt

.section	.rodata.str1.1         # Another read-only data section for strings
.LC5:                             # Label for a single-character input format
	.string	"%c"                  # Format specifier for a single character

.section	.rodata.str1.8         # Another read-only data section for strings
.align 8                          # Align to an 8-byte boundary
.LC6:                             # Label for an invalid choice message
	.string	"Wrong choice, please enter a choice from the given options."  # Error message for invalid choice

.section	.rodata.str1.1         # Another read-only data section for strings
.LC7:                             # Label for the prompt to enter min and max numbers
	.string	"Enter Min and Max number:"  # Prompt for min and max input
.LC8:                             # Label for the message for 6 attempts
	.string	"You got 6 attempts."        # Message indicating 6 attempts
.LC9:                             # Label for the guess prompt
	.string	"Guess no. %d:\n"           # Format for displaying the guess number
.LC10:                            # Label for the format specifier for an integer
	.string	"%d"                       # Format specifier for an integer

.section	.rodata.str1.8         # Another read-only data section for strings
.align 8                          # Align to an 8-byte boundary
.LC11:                            # Label for the correct guess message
	.string	"You guessed it right good job!!! ;)"  # Success message

.section	.rodata.str1.1         # Another read-only data section for strings
.LC12:                            # Label for the wrong guess message
	.string	"Wrong guess, Try again!"  # Message for a wrong guess
.LC13:                            # Label for remaining attempts message
	.string	"Left attempts: %d , "    # Format for displaying remaining attempts
.LC14:                            # Label for the higher number hint
	.string	"Number is higher!"       # Hint that the number is higher
.LC15:                            # Label for the lower number hint
	.string	"Number is lower!"        # Hint that the number is lower
.LC16:                            # Label for the game-over message
	.string	"You Lost! , GAME OVER :( "  # Game-over message
.LC17:                            # Label for revealing the correct number
	.string	"The number was: %d \n"   # Format for displaying the correct number
.LC18:                            # Label for the message for 4 attempts
	.string	"You got 4 attempts."     # Message indicating 4 attempts
.LC19:                            # Label for the message for 2 attempts
	.string	"You got 2 attempts."     # Message indicating 2 attempts

.text                             # Switch back to the text (code) section
.globl	main                      # Declare the `main` function as globally accessible
.type	main, @function           # Specify that `main` is a function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	11(%rsp), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	jmp	.L6
.L8:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	11(%rsp), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
.L6:
	movzbl	11(%rsp), %ecx
	cmpb	$69, %cl
	setne	%dl
	cmpb	$101, %cl
	setne	%al
	testb	%al, %dl
	je	.L7
	subl	$72, %ecx
	cmpb	$37, %cl
	ja	.L8
	movabsq	$141733920801, %rax
	shrq	%cl, %rax
	testb	$1, %al
	je	.L8
.L7:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	leaq	16(%rsp), %rdx
	leaq	12(%rsp), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	16(%rsp), %esi
	movl	12(%rsp), %edi
	call	randomInRange
	movl	%eax, %ebx
	movzbl	11(%rsp), %edx
	cmpb	$69, %dl
	sete	%al
	cmpb	$101, %dl
	sete	%dl
	orb	%dl, %al
	jne	.L33
.L9:
	movzbl	11(%rsp), %edx
	cmpb	$77, %dl
	sete	%al
	cmpb	$109, %dl
	sete	%dl
	orb	%dl, %al
	jne	.L34
.L17:
	movzbl	11(%rsp), %edx
	cmpb	$72, %dl
	sete	%al
	cmpb	$104, %dl
	sete	%dl
	orb	%dl, %al
	jne	.L35
	movl	$0, %eax
.L5:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L36
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L33:
	.cfi_restore_state
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebp
	jmp	.L10
.L38:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L5
.L39:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L14
.L15:
	movl	%r12d, %ebp
.L10:
	cmpl	$5, %ebp
	jg	.L37
	leal	1(%rbp), %r12d
	movl	%r12d, %edx
	leaq	.LC9(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	20(%rsp), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	%ebx, 20(%rsp)
	je	.L38
	cmpl	$4, %ebp
	jg	.L13
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L13:
	movl	$5, %edx
	subl	%ebp, %edx
	leaq	.LC13(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	cmpl	%ebx, 20(%rsp)
	jl	.L39
.L14:
	cmpl	%ebx, 20(%rsp)
	jle	.L15
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L15
.L37:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	%ebx, %edx
	leaq	.LC17(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L9
.L34:
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebp
	jmp	.L18
.L41:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L5
.L42:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L21
.L22:
	movl	%r12d, %ebp
.L18:
	cmpl	$3, %ebp
	jg	.L40
	leal	1(%rbp), %r12d
	movl	%r12d, %edx
	leaq	.LC9(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	20(%rsp), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	%ebx, 20(%rsp)
	je	.L41
	cmpl	$2, %ebp
	jg	.L20
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L20:
	movl	$3, %edx
	subl	%ebp, %edx
	leaq	.LC13(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	cmpl	%ebx, 20(%rsp)
	jl	.L42
.L21:
	cmpl	%ebx, 20(%rsp)
	jle	.L22
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L22
.L40:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	%ebx, %edx
	leaq	.LC17(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L17
.L35:
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebp
	jmp	.L24
.L46:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L5
.L26:
	movl	$1, %edx
	subl	%ebp, %edx
	leaq	.LC13(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	cmpl	%ebx, 20(%rsp)
	jl	.L43
.L27:
	cmpl	%ebx, 20(%rsp)
	jg	.L44
.L28:
	movl	%r12d, %ebp
.L24:
	cmpl	$1, %ebp
	jg	.L45
	leal	1(%rbp), %r12d
	movl	%r12d, %edx
	leaq	.LC9(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	20(%rsp), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	%ebx, 20(%rsp)
	je	.L46
	testl	%ebp, %ebp
	jg	.L26
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	jmp	.L26
.L43:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L44:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L28
.L45:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	%ebx, %edx
	leaq	.LC17(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	jmp	.L5
.L36:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4: