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
										;FLOATING POINT VARIABLES
ConstMtoK REAL8 1.0E-3
ConstItoF REAL8 8.3333333E-2
ConstMtoF REAL8 3.28084E+0
ConstFtoM REAL8 0.3048E+0
ConstKtoP REAL8 2.20462E+0
ConstPtoK REAL8 0.453592E+0
ConstOtoP REAL8 0.0625E+0
ConstCtoF REAL8 1.8E+0			 ;9/5
ConstFtoC REAL8 0.55555555555E+0 ;5/9
Const32	  REAL8 32.0
Const273  REAL8 273.15
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
	push eax		;storing user's choice as we have to use eax to store numbers

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

	;--------------Addition---------------
	Addition:
	INVOKE AddNum, num1,num2	;function call
	push eax
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWrite "--- Addition ---"

	mov dx,020Fh
	call GotoXY
	mWrite "First Number = "
	mov eax,num1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,num2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A + B = " 
	pop eax
	call writeint
	ret

	;------------Subtraction------------
	Subtraction:
	INVOKE SubNum, num1,num2
	push eax
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWrite "--- Subtraction ---"
	mov dx,020Fh
	call GotoXY
	mWrite "First Number= "
	mov eax,num1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,num2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A - B = "
	pop eax
	call writeint
	ret

	;----------Multiplication------------
	Multiplication:
	INVOKE MulNum, num1, num2
	push eax
	call clrscr			
					;msgs displayed
	mov dx,010Fh
	call GotoXY
	mWrite "--- Multiplication ---"
	mov dx,020Fh
	call GotoXY
	mWrite "First Number= "
	mov eax,num1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,num2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A * B = "
	pop eax
	call writeint
	ret

	;-----------Division--------------
	Division:
	INVOKE DivNum, num1,num2
	push edx
	push eax 
	call clrscr
	mov dx,010Fh
	call GotoXY
	mWrite "--- Division ---"
	mov dx,020Fh
	call GotoXY
	mWrite "First Number= "
	mov eax,num1
	call writeint
	call crlf

	mov dx,030Fh
	call GotoXY
	mWrite "Second Number = "
	mov eax,num2
	call writeint
	call crlf

	mov dx,040Fh
	call GotoXY
	mWrite "A / B = "
	pop eax
	call writeint

	mov dx,050Fh
	call GotoXY
	pop edx
	mov eax,edx
	mWrite "Remainder = "
	call writeint
							
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
	
	COMMENT @
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
	@
						;calculation
	mov eax,val1
	add eax,val2
	;call writeint

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
	COMMENT @
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
	@
						;calculation
	mov eax,val1
	sub eax,val2
	;call writeint

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
	COMMENT @
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
	@
						;calculation from here onwards
	mov eax,val1
	cdq
	mov ebx,val2
	mov edx,0			;initialising
	idiv ebx
	push edx		;saving edx value
	;call writeint

	pop edx

	;mov eax,edx			;edx saves the remainder so moving that into eax so that we can output it
	;call writeint


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
	COMMENT @
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
	@			
				;actual calculation from here onwards

	mov ax, sword ptr val1
	mov bx,sword ptr val2
	imul bx
	shl edx,16
	or eax,edx
	;call writeint
	


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
	jmp defaultconv
	
	LLength:
		call LengthConvertor
		ret

	Mass:
		call MassConvertor
		ret
	
	Temperature:
		call TemperatureConvertor
		ret

	defaultconv:
		mWriteln "Invalid Input!"
		call waitmsg
	ret
ConvertorMenu ENDP

;-----------------------------------------------------------------------
LengthConvertor PROC
;	User picks an option from the different unit conversions of length
;	Then user enters a value and the result after conversion is displayed
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
	LOCAL value:DWORD

	call clrscr
	mov dx,010Fh
	call GotoXY
	mWriteln "Choose An Option:"

	mov dx,030Fh
	call GotoXY
	mWriteln "1. Meters to Kilometers"
	
	mov dx,040Fh
	call GotoXY
	mWriteln "2. Kilometers to Meters"
	
	mov dx,050Fh
	call GotoXY
	mWriteln "3. Inches to Feet"

	mov dx,060Fh
	call GotoXY
	mWriteln "4. Feet to Inches"

	mov dx,070Fh
	call GotoXY
	mWriteln "5. Meters to Feet"

	mov dx,080Fh
	call GotoXY
	mWriteln "6. Feet to Meters"

	mov dx,090Fh
	call GotoXY
	call readint
	push eax

	call ClrScr
	mWriteln "Enter a Positive Integer Value:"
	call readdec
	mov value,eax
	pop eax

	CMP eax,1
	je MtoK
	CMP eax,2
	je KtoM
	CMP eax,3
	je ItoF
	CMP eax,4
	je FtoI
	CMP eax,5
	je MtoF
	CMP eax,6
	je FtoM
	jmp defaultconv
	
	MtoK:
		mWriteln "Meters to Kilometers:"
		fld ConstMtoK		;load 1/1000 into ST(0)
		fimul value		;mul value by 1/1000
		call writefloat
	ret

	KtoM:
		mWriteln "Kilometers to Meters:"
		INVOKE MulNum,value,1000	;multiply by 1000
		call writedec
	ret

	ItoF:
		mWriteln "Inches to Feet:"
		fld ConstItoF		;load 1/12 into ST(0)
		fimul value		;mul value by 1/12
		call writefloat
	ret

	FtoI:
		mWriteln "Feet to Inches:"
		INVOKE MulNum,value,12	;multiply by 12
		call writedec
	ret

	MtoF:
		mWriteln "Meters to Feet:"
		fld ConstMtoF		;load 3.28084 into ST(0)
		fimul value		;mul value by 3.28084
		call writefloat
	ret

	FtoM:
		mWriteln "Feet to Meters:"
		fld ConstFtoM		;load 0.3048 into ST(0)
		fimul value		;mul value by 0.3048
		call writefloat
	ret

	defaultconv:
		mWriteln "Invalid Input!"
		call waitmsg
	ret
LengthConvertor ENDP

;-----------------------------------------------------------------------
MassConvertor PROC
;	User picks an option from the different unit conversions of mass
;	Then user enters a value and the result after conversion is displayed
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
	LOCAL value:DWORD

	call clrscr
	mov dx,010Fh
	call GotoXY
	mWriteln "Choose An Option:"

	mov dx,030Fh
	call GotoXY
	mWriteln "1. Grams to Kilograms"
	
	mov dx,040Fh
	call GotoXY
	mWriteln "2. Kilograms to Grams"
	
	mov dx,050Fh
	call GotoXY
	mWriteln "3. Kilograms to Pounds"

	mov dx,060Fh
	call GotoXY
	mWriteln "4. Pounds to Kilograms"

	mov dx,070Fh
	call GotoXY
	mWriteln "5. Ounces to Pounds"

	mov dx,080Fh
	call GotoXY
	mWriteln "6. Pounds to Ounces"

	mov dx,090Fh
	call GotoXY
	call readint
	push eax

	call ClrScr
	mWriteln "Enter a Positive Integer Value:"
	call readdec
	mov value,eax
	pop eax

	CMP eax,1
	je GtoK
	CMP eax,2
	je KtoG
	CMP eax,3
	je KtoP
	CMP eax,4
	je PtoK
	CMP eax,5
	je OtoP
	CMP eax,6
	je PtoO
	jmp defaultconv
	
	GtoK:
		mWriteln "Grams to Kilograms:"
		fld ConstMtoK
		fimul value		;mul value by 1/1000
		call writefloat
	ret

	KtoG:
		mWriteln "Kilograms to Grams:"
		INVOKE MulNum,value,1000	;multiply by 1000
		call writedec
	ret

	KtoP:
		mWriteln "Kilograms to Pounds:"
		fld ConstKtoP
		fimul value		;mul value by 2.20462
		call writefloat
	ret

	PtoK:
		mWriteln "Pounds to Kilograms:"
		fld ConstPtoK
		fimul value		;mul value by 0.453592
		call writefloat
	ret

	OtoP:
		mWriteln "Ounces to Pounds:"
		fld ConstOtoP
		fimul value		;mul value by 0.0625
		call writefloat
	ret

	PtoO:
		mWriteln "Pounds to Ounces:"
		INVOKE MulNum,value,16	;multiply by 16
		call writedec
	ret

	defaultconv:
		mWriteln "Invalid Input!"
		call waitmsg
	ret
MassConvertor ENDP

;-----------------------------------------------------------------------
TemperatureConvertor PROC
;	User picks an option from the different unit conversions of Temperature
;	Then user enters a value and the result after conversion is displayed
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------
	LOCAL value:SDWORD		;since temp can be negative and positive

	call clrscr
	mov dx,010Fh
	call GotoXY
	mWriteln "Choose An Option:"

	mov dx,030Fh
	call GotoXY
	mWriteln "1. Celsius to Fahrenheit"
	
	mov dx,040Fh
	call GotoXY
	mWriteln "2. Fahrenheit to Celsius"
	
	mov dx,050Fh
	call GotoXY
	mWriteln "3. Celsius to Kelvin"

	mov dx,060Fh
	call GotoXY
	mWriteln "4. Kelvin to Celsius"

	mov dx,070Fh
	call GotoXY
	mWriteln "5. Fahrenheit to Kelvin"

	mov dx,080Fh
	call GotoXY
	mWriteln "6. Kelvin to Fahrenheit"

	mov dx,090Fh
	call GotoXY
	call readint
	push eax

	call ClrScr
	mWriteln "Enter an Integer Value:"
	call readint
	mov value,eax
	pop eax

	CMP eax,1
	je CtoF
	CMP eax,2
	je FtoC
	CMP eax,3
	je CtoK
	CMP eax,4
	je KtoC
	CMP eax,5
	je FtoK
	CMP eax,6
	je KtoF
	jmp defaultconv
	
	CtoF:
		mWriteln "Celsius to Fahrenheit:"
		fild value
		fmul ConstCtoF		;mul value by 9/5
		fadd Const32		;add 32
		call writefloat
	ret

	FtoC:
		mWriteln "Fahrenheit to Celsius:"
		fild value
		fsub Const32		;minus 32
		fmul ConstFtoC		;mul value by 5/9
		call writefloat
	ret

	CtoK:
		mWriteln "Celsius to Kelvin:"
		fild value
		fadd Const273
		call writefloat
	ret

	KtoC:
		mWriteln "Kelvin to Celsius:"
		fild value
		fsub Const273
		call writefloat
	ret

	FtoK:
		mWriteln "Fahrenheit to Kelvin:"
		fild value
		fsub const32
		fmul constftoc
		fadd const273
		call writefloat
	ret

	KtoF:
		mWriteln "Kelvin to Fahrenheit:"
		fild value
		fsub const273
		fmul constctof
		fadd const32
		call writefloat
	ret

	defaultconv:
		mWriteln "Invalid Input!"
		call waitmsg
	ret
TemperatureConvertor ENDP

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