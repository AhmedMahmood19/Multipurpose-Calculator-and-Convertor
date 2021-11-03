INCLUDE Irvine32.inc
.data
										;MAIN MENU VARIABLES
MenuMsg BYTE "Select an option:",0Ah,0
Op1 BYTE "1.GPA Calculator",0Ah,0
Op2 BYTE "2.Basic Calculator",0Ah,0
Op3 BYTE "3.Exponent Calculator",0Ah,0
Op4 BYTE "4.Unit Convertor",0Ah,0
Op5 BYTE "5.Quadratic Equation Calculator",0Ah,0
OpDef BYTE "Invalid Input!",0Ah,0		;Default case for incorrect input

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
	ret
BasicCalc ENDP

;-----------------------------------------------------------------------
ExpCalc PROC
;	Ask for 2 inputs, Base and Exponent
;	Then Calculate and Display the Result
;	Receives: NONE
;	Returns: NONE
;-----------------------------------------------------------------------

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