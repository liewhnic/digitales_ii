//IE-0523 Circuitos Digitales II
//Tarea 2. Test Bench del Registro Desplazable de 4 bits
//Estudiante:	Cesar Valverde Zuñiga		A86605		
//II Ciclo 2017

//Definicion del modulo
module testbench();

wire [1:0] modo;
wire [3:0] d;
output wire [3:0] q;

//Intanciando Modulos
tester test1(clk,enb,dir,s_in,modo,d);
reg_desp reg1(s_out,clk,enb,dir,s_in,modo,d,q);

//Resultados en Terminal
initial
  begin
    $dumpfile("registro.vcd");
    $dumpvars;
    $display ("time\t clk enb dir s_in modo d q s_out");
    $monitor ("%g\t    %b  %b  %b  %b %b %b %b  %b",
    $time, clk, enb, dir, s_in, modo, d, q, s_out);
  end
endmodule
