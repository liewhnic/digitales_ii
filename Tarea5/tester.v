//IE-0523 Circuitos Digitales II
//Tarea 2. Tester de Regitro Desplazable de 4 bits
//Estudiante:	Cesar Valverde Zuñiga		A86605		
//II Ciclo 2017

//Modulo Tester 4 bits
module tester(clk,enb,dir,s_in,modo,d);
	//Salidas.
	output reg clk,enb,dir,s_in;
	output reg [1:0] modo;
	output reg [3:0] d;

//Señal de Reloj / Frecuencia del reloj
always #2 clk = !clk;

initial begin
	//Valores Iniciales
	enb <= 0;
	clk <=0;
	dir <= 0;
	s_in <= 1;
	modo <= 2'b00;
    
	$display("Inicia Prueba #5, Carga en Paralelo");
	modo <= 2'b10;
	enb <= 1'b1;
	d <= 4'b0001;
	#4; //Retardo
   
	$display("Inicia Prueba #4, Rotacion Circular a la Derecha");
	modo <= 2'b01;
	dir <= 1'b1;
	#16

	$display("Inicia Prueba #3, Rotacion Circular a la Izquierda");
	modo <= 2'b01;
	dir <= 1'b0;
	#16;
  
	$display("Inicia Prueba #2, Rotacion a la Derecha");
	modo <= 2'b00;
	dir <= 1'b1;
	#16;
	
	//$display("Inicia Prueba #1, Rotacion a la Izquierda");
	modo <= 2'b10;
	enb <= 1'b1;
	d <= 4'b0001;
	#4;
     
	$display("Inicia Prueba #1, Rotacion a la Izquierda");
	modo <= 2'b00;
	dir <= 1'b0;
	#16;
	$finish;
    end
endmodule
