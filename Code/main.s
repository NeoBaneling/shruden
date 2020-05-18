	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStartState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStartState, %function
goToStartState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L4
	ldr	r7, .L4+4
	sub	sp, sp, #12
	ldr	r5, .L4+8
	ldr	r3, .L4+12
	str	r1, [r2]
	ldr	r6, .L4+16
	mov	lr, pc
	bx	r3
	mov	r0, r7
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+24
	str	r5, [sp]
	mov	r3, #62
	mov	r2, #16
	mov	r1, #90
	mov	r0, #54
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+28
	mov	r2, r6
	ldr	r3, .L4+32
	mov	r1, #100
	mov	r0, #58
	mov	lr, pc
	bx	r4
	mov	r3, r7
	mov	r2, r6
	mov	r1, #99
	mov	r0, #57
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+36
	mov	r1, #66
	mov	r0, #130
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+40
	mov	r1, #36
	mov	r0, #142
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	21647
	.word	32767
	.word	waitForVBlank
	.word	.LC0
	.word	fillScreen
	.word	drawRect
	.word	drawString
	.word	32736
	.word	.LC1
	.word	.LC2
	.size	goToStartState, .-goToStartState
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L6
	ldr	r3, .L13+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
.L6:
	pop	{r4, lr}
	bx	lr
.L12:
	pop	{r4, lr}
	b	goToStartState
.L14:
	.align	2
.L13:
	.word	waitForVBlank
	.word	drawWin
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L27
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L16
	ldr	r2, .L27+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L25
.L16:
	tst	r3, #4
	beq	.L15
	ldr	r3, .L27+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L26
.L15:
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	pop	{r4, r5, r6, lr}
	b	goToStartState
.L25:
	ldr	r5, .L27+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldr	r3, .L27+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L27+20
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L16
.L28:
	.align	2
.L27:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	drawInit
	.word	drawGame
	.word	state
	.size	pauseState, .-pauseState
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L36
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L36+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L35
.L29:
	pop	{r4, lr}
	bx	lr
.L35:
	pop	{r4, lr}
	b	goToStartState
.L37:
	.align	2
.L36:
	.word	waitForVBlank
	.word	drawLose
	.word	oldButtons
	.word	buttons
	.size	loseState, .-loseState
	.align	2
	.global	goToGameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameState, %function
goToGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L40+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	waitForVBlank
	.word	drawGame
	.word	state
	.size	goToGameState, .-goToGameState
	.align	2
	.global	goToPauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPauseState, %function
goToPauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, r5, r6, lr}
	ldr	r2, .L44
	ldr	r5, .L44+4
	sub	sp, sp, #8
	ldr	r6, .L44+8
	ldr	r3, .L44+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, r5
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L44+20
	str	r6, [sp]
	mov	r3, #228
	mov	r2, #94
	mov	r1, #6
	mov	r0, #16
	mov	lr, pc
	bx	r4
	ldr	r4, .L44+24
	mov	r3, r5
	ldr	r2, .L44+28
	mov	r1, #9
	mov	r0, #24
	mov	lr, pc
	bx	r4
	mov	r1, #60
	mov	r3, r5
	mov	r0, r1
	ldr	r2, .L44+32
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L44+36
	mov	r1, #42
	mov	r0, #96
	mov	lr, pc
	bx	r4
	mov	r3, r6
	ldr	r2, .L44+40
	mov	r1, #54
	mov	r0, #130
	mov	lr, pc
	bx	r4
	mov	r3, r6
	ldr	r2, .L44+44
	mov	r1, #66
	mov	r0, #142
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	state
	.word	32767
	.word	21647
	.word	waitForVBlank
	.word	fillScreen
	.word	drawRect
	.word	drawString
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	goToPauseState, .-goToPauseState
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L58
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L47
	ldr	r2, .L58+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L56
.L47:
	tst	r3, #4
	beq	.L46
	ldr	r3, .L58+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L57
.L46:
	pop	{r4, lr}
	bx	lr
.L57:
	pop	{r4, lr}
	b	goToPauseState
.L56:
	ldr	r3, .L58+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+20
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L58+24
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L47
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	initGame
	.word	buttons
	.word	drawInit
	.word	waitForVBlank
	.word	drawGame
	.word	state
	.size	startState, .-startState
	.align	2
	.global	goToWinState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWinState, %function
goToWinState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	push	{r4, lr}
	ldr	r2, .L62
	ldr	r3, .L62+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, #992
	ldr	r3, .L62+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L62+12
	ldr	r3, .L62+16
	ldr	r2, .L62+20
	mov	r1, #88
	mov	r0, #110
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	state
	.word	waitForVBlank
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC8
	.size	goToWinState, .-goToWinState
	.align	2
	.global	goToLoseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLoseState, %function
goToLoseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, lr}
	ldr	r2, .L66
	ldr	r3, .L66+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L66+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+12
	ldr	r3, .L66+16
	ldr	r2, .L66+20
	mov	r1, #88
	mov	r0, #110
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	state
	.word	waitForVBlank
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC8
	.size	goToLoseState, .-goToLoseState
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L79+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L69:
	ldr	r4, .L79+20
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L77
	cmn	r3, #1
	beq	.L78
.L68:
	pop	{r4, lr}
	bx	lr
.L77:
	bl	goToWinState
	ldr	r3, [r4]
	cmn	r3, #1
	bne	.L68
.L78:
	pop	{r4, lr}
	b	goToLoseState
.L76:
	bl	goToPauseState
	b	.L69
.L80:
	.align	2
.L79:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	coinsRemaining
	.size	gameState, .-gameState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L93
	push	{r4, r7, fp, lr}
	ldr	r3, .L93+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L93+8
	ldr	r7, .L93+12
	ldr	r5, .L93+16
	ldr	fp, .L93+20
	ldr	r10, .L93+24
	ldr	r9, .L93+28
	ldr	r8, .L93+32
	ldr	r4, .L93+36
.L82:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L83:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L83
.L85:
	.word	.L84
	.word	.L86
	.word	.L87
	.word	.L88
	.word	.L89
.L89:
	ldr	r3, .L93+40
	mov	lr, pc
	bx	r3
	b	.L82
.L88:
	mov	lr, pc
	bx	r8
	b	.L82
.L87:
	mov	lr, pc
	bx	r9
	b	.L82
.L86:
	mov	lr, pc
	bx	r10
	b	.L82
.L84:
	mov	lr, pc
	bx	fp
	b	.L82
.L94:
	.align	2
.L93:
	.word	1027
	.word	goToStartState
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState
	.word	67109120
	.word	loseState
	.size	main, .-main
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStartState
	.size	initialize, .-initialize
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SHRUDEN\000"
.LC1:
	.ascii	"Press START to Play\000"
.LC2:
	.ascii	"Press SELECT for Instructions\000"
	.space	2
.LC3:
	.ascii	"Use UP, DOWN, LEFT, and RIGHT to move\000"
	.space	2
.LC4:
	.ascii	"Collect COINS to win\000"
	.space	3
.LC5:
	.ascii	"Don't let ENEMIES touch you\000"
.LC6:
	.ascii	"Press START to Continue\000"
.LC7:
	.ascii	"Press SELECT to End\000"
.LC8:
	.ascii	"Press START\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
