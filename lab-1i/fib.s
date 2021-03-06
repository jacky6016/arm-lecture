	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	
	push {r3, r4, r5, r6, r7, lr}	@ PROLOG

	@ if(x <= 1) goto BASECASE
	cmp   r0, #1
	ble   BASECASE

	@ fn_2 = 0	
	@ fn_1 = 1
	mov   r4, #0
	mov   r5, #1

	@ for(i=2; i<=x; i++)
	@ {					
	@	fn = fn_1 + fn_2;
	@	temp = fn;
	@	fn_2 = fn_1;		
	@	fn_1 = temp; 
	@ }

	sub r3, r0, #2
	
LOOP:	
	add   r6, r5, r4
	mov   r7, r6
	mov   r4, r5
	mov   r5, r7
	
	subs  r3, r3, #1 
	ite   lt
	movlt r0, r6
	bge   LOOP
	b     END	

BASECASE:
	cmp   r0, #1
	ite   eq
	moveq r0, #1	@ if(x <= 1) return 0
	movne r0, #0	@ if(x == 1) return 1	

END:
	pop {r3, r4, r5, r6, r7,  pc}	@ EPILOG	

	.size fibonacci, .-fibonacci
	.end


