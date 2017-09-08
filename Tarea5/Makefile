#IE-0523 Circuitos Digitales II
#Tarea 5. Makefile.
#Estudiante:	César Valverde Zuñiga
#				Isaac Gomez Sanchez
#A86605	/ B32919	II Ciclo 2017

#conductual:
	#iverilog -o registro register4B-cond.v  registrodesp_tb.v tester.v
	#vvp registro
	#gtkwave registro.vcd registro4B.gtkw &
	
estructural:
	iverilog -o registroest register4B-est.v  register4B-est_tb.v tester.v
	vvp registroest
	gtkwave desplazador.vcd

compare:
	iverilog -Wall -o comparador4B comparador.v comparador_tb.v register4B-cond.v register4B-est.v tester.v
	vvp comparador4B
	gtkwave comparador4B.vcd comparador.gtkw &
	
yosys:
	read_verilog register-cond.v
	hierarchy -check -top register-cond
	show -prefix original
	proc; show -prefix proc
	opt; show -prefix proc_opt
	fsm; show -prefix fsm
	opt; show -prefix fsm_opt
	memory; show -prefix memory
	opt; show -prefix memory_opt
	techmap; show -prefix techmap
	opt; show -prefix techmap_opt
	write_verilog rtlil.v
	dfflibmap -liberty cmos_cells.lib; show -prefix dff_seq -lib cmos_cells.v
	abc -liberty cmos_cells.lib; show -prefix abc_comb -lib cmos_cells.v
	clean
	show -prefix synth -lib cmos_cells.v
	write_verilog sintetizado.v

clean:
	rm -f registroest desplazador.vcd
	rm -f registro registro.vcd
	rm -f comparador4B comparador4B.vcd 
