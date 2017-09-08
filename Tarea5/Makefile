all:
	iverilog -Wall -o registro4B.out comparador.v comparador_tb.v flipflop.v mux.v nand.v nor.v not.v register4B-cond.v register4B-est.v register4B-est_tb.v tester4B.v; vvp registro4B.out; gtkwave desplazador.vcd registro4B.gtkw &

compare:
	iverilog -Wall -o comparador4B.out comparador.v comparador_tb.v register4B-cond.v register4B-est.v; vvp comparador4B.out; gtkwave comparador4B.vcd comparador.gtkw &

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
	rm *.out *vcd
