//IE-0523 Circuitos Digitales II
//IE-0523 Circuitos Digitales II
//Tarea 5. Test Bench 2 del Registro Desplazable de 4 bits Sintetizado.
//Estudiante:	Cesar Valverde Zuñiga		A86605		
//				Isaac Gómez Sánchez			B32919
//II Ciclo 2017

// Se define un modulo de prueba.
module testbench();                                

	wire [1:0] mode_sintetizado;
	wire [3:0] d_sintetizado;
	output wire [3:0] q_sintetizado;

	wire clk_sintetizado,enb_sintetizado,dir_sintetizado,s_in_sintetizado, s_out_sintetizado;

//Intanciando Modulos del Sintetizado.
tester tst1_sin(clk_sintetizado,enb_sintetizado,dir_sintetizado,s_in_sintetizado,mode_sintetizado,d_sintetizado);
registrodesp reg_sin(clk_sintetizado,enb_sintetizado,dir_sintetizado,s_in_sintetizado,mode_sintetizado,d_sintetizado,q_sintetizado,s_out_sintetizado);

//Resultados en Terminal
initial // Bloque que se ejecuta al inicio
  begin
    $dumpfile("register4B_tb2.vcd"); // El resultado se guarda en register4B_tb1.vcd
    $dumpvars;
    $display ("time\t clk enb dir mode d s_in q s_out");
    $monitor ("%g\t    %b  %b  %b  %b %b %b %b  %b",
    $time, clk, enb, dir, mode, d, s_in, q, s_out);

  end

endmodule // test
