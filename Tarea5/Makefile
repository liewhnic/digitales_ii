all:
	iverilog -Wall -o registro4B.out comparador.v comparador_tb.v flipflop.v mux.v nand.v nor.v not.v register4B-cond.v register4B-est.v register4B-est_tb.v tester4B.v; vvp registro4B.out; gtkwave desplazador.vcd registro4B.gtkw &

compare:
	iverilog -Wall -o comparador4B.out comparador.v comparador_tb.v flipflop.v mux.v nand.v nor.v not.v register4B-cond.v register4B-est.v tester4B.v; vvp comparador.out; gtkwave comparador4B.vcd comparador.gtkw &

clean:
	rm *.out *vcd
