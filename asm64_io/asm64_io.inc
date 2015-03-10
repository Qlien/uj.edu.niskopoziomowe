	extern  read_int, read_string, read_char
  extern  print_int,  print_string, print_char
	extern	println_int,  println_string, println_char, print_nl 
	extern  sub_dump_regs, sub_dump_mem, sub_dump_math, sub_dump_stack
    
    

%macro 	dump_regs 1
	push	  dword %1
	call	  sub_dump_regs
%endmacro

