;set application to console programm
format PE console
;set the first function to start with
entry main

;include default include files
include 'INCLUDE/WIN32A.INC'

;main function like c "int main(){}"
main:
	;push our char message to the stack and call printf in c it would be "printf(msg);"
	push	msg
	call	[printf]
	
	;call the function getChar so the programm will not exit immediately
	call	[getChar]
	
	;push 0 to the stack wich is the exit process code and call ExitProcess
	push	0
	call	[ExitProcess]
	
	;define msg as 1 byte and use \n ($A == 10 == \n) in c it would be "char msg[] = "Hello World\n";"
	msg		db 'Hello World', $A, 0

;import all necessary functions
Data import
	library kernel32, 	'kernel32.dll',\
			msvcrt, 	'msvcrt.dll'
			 
	include 'INCLUDE/API/KERNEL32.INC'

	import	msvcrt,\
			printf, 	'printf',\
			getChar, 	'_fgetchar'

end Data