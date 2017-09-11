//IE-0523 Circuitos Digitales II
//Tarea 5. Test Bench 1 del Registro Desplazable de 4 bits.
//Estudiante:	Cesar Valverde Zuñiga		A86605		
//				Isaac Gómez Sánchez			B32919
//II Ciclo 2017

// Se define un modulo de prueba.
module testbench(); 

	wire [1:0] mode;
	wire [3:0] d;
	output wire [3:0] q;

	wire clk,enb,dir,s_in, s_out;

//Intanciando Modulos.
tester tst1(clk,enb,dir,s_in,mode,d);
registrodesp reg1(clk,enb,dir,s_in,mode,d,q,s_out);

//Resultados en Terminal
initial // Bloque que se ejecuta al inicio
  begin
    $dumpfile("register4B_tb1.vcd"); // El resultado se guarda en register4B_tb1.vcd
    $dumpvars;
    $display ("time\t clk enb dir mode d s_in q s_out");
    $monitor ("%g\t    %b  %b  %b  %b %b %b %b  %b",
    $time, clk, enb, dir, mode, d, s_in, q, s_out);

  end

endmodule//test.
