INCLUDE Irvine32.inc
INCLUDE Macros.inc


AddNum PROTO, 
	val1:sdword, val2:sdword

SubNum PROTO,
	val1:sdword, val2:sdword

DivNum PROTO,
	val1:sdword, val2:sdword

MulNum PROTO,
	val1:sdword, val2:sdword




.data
										;MAIN MENU VARIABLES
MenuMsg BYTE "Select an option:",0Ah,0
Op1 BYTE "1.GPA Calculator",0Ah,0
Op2 BYTE "2.Basic Calculator",0Ah,0
Op3 BYTE "3.Exponent Calculator",0Ah,0
Op4 BYTE "4.Unit Convertor",0Ah,0
Op5 BYTE "5.Quadratic Equation Calculator",0Ah,0
OpDef BYTE "Invalid Input!",0Ah,0		;Default case for incorrect input

;-------------------------------------------------------------------------


.code
main PROC
	call MainMenu
EXIT
main ENDP

;-----------------------------------------------------------------------
MainMenu PROC
;	This function allows the user to view the options from the Main Menu
;	and select an option which sends them to another function.
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
							;This part is for printing the menu and options
	mov dx,010Fh
	call GotoXY
	mov edx,OFFSET MenuMsg
	call writestring

	mov dx,030Fh
	call GotoXY
	mov edx,OFFSET Op1
	call writestring
	
	mov dx,040Fh
	call GotoXY
	mov edx,OFFSET Op2
	call writestring
	
	mov dx,050Fh
	call GotoXY
	mov edx,OFFSET Op3
	call writestring

	mov dx,060Fh
	call GotoXY
	mov edx,OFFSET Op4
	call writestring

	mov dx,070Fh
	call GotoXY
	mov edx,OFFSET Op5
	call writestring
						;Takes the option as input and compares, then jumps to that func
	mov dx,080Fh
	call GotoXY
	call readint		
	CMP eax,1
	je GPA
	CMP eax,2
	je Basics
	CMP eax,3
	je Expo
	CMP eax,4
	je Convertors
	CMP eax,5
	je Quad
	jne defaultcase
						;Respective functions will be executed
	GPA:
		call GPACalc
		jmp selected

	Basics:
		call BasicCalc
		jmp selected

	Expo:
		call ExpCalc
		jmp selected

	Convertors:
		call ConvertorMenu
		jmp selected

	Quad:
		call QuadraticCalc
		jmp selected

	defaultcase:
		mov edx,OFFSET OpDef
		call writestring
		call waitmsg
		jmp selected
						;After a func is selected and executed it jumps here so other funcs don't run
	selected:
	ret
MainMenu ENDP

;-----------------------------------------------------------------------
GPACalc PROC
;	Let user enter no. of courses and set a max limit and min limit
;	Let them enter GPA and Credit Hrs for each course
;	Then Calculate and Display the SGPA
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
							;Take input of no. of courses and check bounds
							
							;Set a loop of count=no. of courses,then input GPA and crd hrs for each course

							;Apply the formula on the inputs

							;Display the result at the end
		ret
GPACalc ENDP

;-----------------------------------------------------------------------
BasicCalc PROC
LOCAL num1:sdword,num2:sdword



;	Let user select from addition, subtraction, multiplication and division
;	Jump to chosen options and ask for 2 inputs
;	Then Calculate and Display the Result
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
							;Take input of option

							;Compare options and If invalid option then print msg
							
							;Ask for 2 inputs (no need to do it for each option so do it before jumping)
							
							;then jump to the appropriate option and calculate the results

	

	call clrscr
	mov dx,030Fh
	call GotoXY
	mWriteln "1.Addition"	

	
	mov dx,040Fh
	call GotoXY
	mWriteln "2.Subtraction"	
	
	mov dx,050Fh
	call GotoXY
	mWriteln "3.Multiplication"	

	mov dx,060Fh
	call GotoXY
	mWriteln "4.Division"	

	mov dx,080Fh
	call GotoXY
	call readint	
	push eax		;storying user's choice as we have to use eax to store numbers

					;input numbers
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWriteln "Enter two numbers: "

	mov dx,020Fh
	call GotoXY
	call readint	;read num1
	mov num1,eax

	mov dx,030Fh
	call GotoXY
	call readint	;read num2
	mov num2,eax

	pop eax

	CMP eax,1
	je Addition
	CMP eax,2
	je Subtraction
	CMP eax,3
	je Multiplication
	CMP eax,4
	je Division


	Addition:
	INVOKE AddNum, num1,num2		;function call
	ret

	Subtraction:
	INVOKE SubNum, num1,num2
	ret

	Multiplication:
	INVOKE MulNum, num1, num2
	ret

	Division:
	INVOKE DivNum, num1,num2
							
	ret
BasicCalc ENDP

;-----------------------------------------------------------------------
AddNum PROC,
	val1:sdword,val2:sdword
;	Function to add two variables
;	Receives: 2 values va1 and val2
;	Returns: their total
;-----------------------------------------------------------------------

							;Apply the formula on the inputs

							;Display the result at the end
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWrite "--- Addition ---"

	mov dx,020Fh
	call GotoXY
	mWrite "First Number = "
	mov eax,val1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,val2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A + B = "
						;calculation
	mov eax,val1
	add eax,val2
	call writeint

		ret

AddNum ENDP

;-----------------------------------------------------------------------
SubNum PROC,
	val1:sdword,val2:sdword

;	Function that calculates and displays their subtraction result
;	Receives: 2 values va1 and val2
;	Returns: the result of their subtraction
;-----------------------------------------------------------------------

							;Apply the formula on the inputs

							;Display the result at the end
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWrite "--- Subtraction ---"
	mov dx,020Fh
	call GotoXY
	mWrite "First Number= "
	mov eax,val1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,val2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A - B = "
						;calculation
	mov eax,val1
	sub eax,val2
	call writeint

		ret

SubNum ENDP

;-----------------------------------------------------------------------
DivNum PROC,
	val1:sdword,val2:sdword
;	Function to divide two variables
;	Receives: 2 values va1 and val2
;	Returns: answer to their division
;-----------------------------------------------------------------------

							;Apply the formula on the inputs

							;Display the result at the end
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWrite "--- Division ---"
	mov dx,020Fh
	call GotoXY
	mWrite "First Number= "
	mov eax,val1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,val2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A / B = "
						;calculation from here onwards
	mov eax,val1
	cdq
	mov ebx,val2
	mov edx,0			;initialising
	idiv ebx
	push edx		;saving edx value
	call writeint

	mWriteLn " "		;new line
	mov dx,050Fh
	call GotoXY
	mWrite "Remainder = "
	pop edx
	mov eax,edx			;edx saves the remainder so moving that into eax so that we can output it
	call writeint


		ret

DivNum ENDP

;-----------------------------------------------------------------------
MulNum PROC,
	val1:sdword,val2:sdword
;	Function to divide two variables
;	Receives: 2 values va1 and val2
;	Returns: answer to their division
;-----------------------------------------------------------------------

							;Apply the formula on the inputs

							;Display the result at the end
	call clrscr			
					;msgs displayed
	mov dx,010Fh
	call GotoXY
	mWrite "--- Multiplication ---"
	mov dx,020Fh
	call GotoXY
	mWrite "First Number= "
	mov eax,val1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,val2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A * B = "
				
				;actual calculation from here onwards

	mov ax, sword ptr val1
	mov bx,sword ptr val2
	imul bx
	shl edx,16
	or eax,edx
	call writeint
	


		ret

MulNum ENDP

;-----------------------------------------------------------------------
ExpCalc PROC
;	Ask for 2 inputs, Base and Exponent
;	Then Calculate and Display the Result
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
	LOCAL exp:BYTE,base:WORD
	call clrscr
	mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,0
jmp input

invalidinput:
	mWriteln "Input was Invalid!"
	call crlf
input:
	mWrite "Enter a 16 bit base: "
	call readdec
	cmp ax,0
je  invalidinput
	mov base,ax

	mWrite "Enter a 8 bit exponent: "
	call readdec
	cmp al,0
je  invalidinput
	mov exp,al
	
	movzx ecx,exp	;if exp is 3 multiplies by itself 3 times
	mov eax,1		;initially eax is 1 so after 1 loop(exp=1), it becomes base
	movzx ebx,base	;base will multiply by itself
Lexp:
		mul ebx
LOOP Lexp
	cmp edx,0
jnz	outofrange
	mWrite "Result is: "
	call writedec
jmp endexp
outofrange:
	mWrite "ERROR: Result is greater than 32 bits and cannot be displayed"
endexp:
	ret
ExpCalc ENDP

;-----------------------------------------------------------------------
ConvertorMenu PROC
;	This function allows the user to view the options from the Convertor Menu
;	and select an option which sends them to another function.
;	Options will be different types of Physical Quantities
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
	
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWriteln "Choose An Option:"

	mov dx,030Fh
	call GotoXY
	mWriteln "1.Length Convertor"
	
	mov dx,040Fh
	call GotoXY
	mWriteln "2.Mass Convertor"
	
	mov dx,050Fh
	call GotoXY
	mWriteln "3.Temperature Convertor"

	mov dx,060Fh
	call GotoXY
	call readint
	
	CMP eax,1
	je LLength
	CMP eax,2
	je Mass
	CMP eax,3
	je Temperature
	jne defaultconv
	
	LLength:
		;TODO LENGTH unit func where option will be picked and result shown in same fuc
		ret

	Mass:
		ret
	
	Temperature:
		ret

	defaultconv:
		mWriteln "Invalid Input!"
		call waitmsg
	ret
ConvertorMenu ENDP

;-----------------------------------------------------------------------
QuadraticCalc PROC
;	Ask for 3 inputs: a, b, c
;	Calculate Discriminants
;	Apply the appropriate quadratic formula according to discriminants
;	Display the roots
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------

	ret
QuadraticCalc ENDP

END main