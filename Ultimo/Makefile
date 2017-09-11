#IE-0523 Circuitos Digitales II
#Tarea 5. Makefile.
#Estudiantes:	César Valverde Zuñiga
#				Isaac Gomez Sanchez
#A86605	/ B32919	II Ciclo 2017

all: register4B.v sintetizado.v tester4B.v register4B_tbprin.v cmos_cells.v
	iverilog -o todo tester4B.v register4B_tbprin.v  register4B.v sintetizado.v cmos_cells.v
	vvp todo
	gtkwave testbenchprincipal.gtkw &

sintesis: sintetizado.v tester4B.v register4B_tb2.v cmos_cells.v
	iverilog -o sintetizado tester4B.v register4B_tb2.v sintetizado.v cmos_cells.v
	vvp sintetizado
	gtkwave testbench2.gtkw	&

conductual: register4B.v tester4B.v register4B_tb1.v 
	iverilog -o conductual tester4B.v register4B_tb1.v register4B.v
	vvp conductual
	gtkwave testbench1.gtkw	&
	
clean:
	rm -f todo testbenchprincipal.vcd
	rm -f sintetizado testbench2.vcd
	rm -f conductual testbench1.vcd

#yosys:
#	read_verilog register-cond.v
#	hierarchy -check -top register-cond
#	show -prefix original
#	proc; show -prefix proc
#	opt; show -prefix proc_opt
#	fsm; show -prefix fsm
#	opt; show -prefix fsm_opt
#	memory; show -prefix memory
#	opt; show -prefix memory_opt
#	techmap; show -prefix techmap
#	opt; show -prefix techmap_opt
#	write_verilog rtlil.v
#	dfflibmap -liberty cmos_cells.lib; show -prefix dff_seq -lib cmos_cells.v
#	abc -liberty cmos_cells.lib; show -prefix abc_comb -lib cmos_cells.v
#	clean
#	show -prefix synth -lib cmos_cells.v
#	write_verilog sintetizado.v

