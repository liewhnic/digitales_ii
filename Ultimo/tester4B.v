//IE-0523 Circuitos Digitales II
//Tarea 5. Tester del Registro Desplazable de 4 bits
//Estudiante:	Cesar Valverde Zuñiga		A86605		
//				Isaac Gómez Sánchez			B32919
//II Ciclo 2017

module tester(clk,enb,dir,s_in,mode,d); // Se declara el inicio del modulo probador.

output reg clk,enb,dir,s_in;	// Reloj del contador/Habilitador/Direccion/EntradaSerial.
output reg [1:0] mode;	//	Modo de Direccionamiento.
output reg [3:0] d;	//	Dato carga en paralelo.

//Señal de reloj
always #1 clk = !clk;  // Cada unidad de tiempo el clk cambia.


initial begin
	//Valores Iniciales.
    clk<=0;
    enb <= 0;
    dir <= 0;
    s_in <= 1;
    mode <= 2'b00;

	$display("Inicia prueba #5, carga en paralelo");
	mode <= 2'b10;
	enb <= 1'b1;
	d<=4'b1010;
	#10 ;

	$display("Inicia prueba #1, rotacion a la izquierda");
	mode <= 2'b00;
	#40;

	$display("Inicia prueba #5, carga en paralelo");
	mode <= 2'b10;
	d<=4'b1010;
	#10;

	$display("Inicia prueba #2, rotacion a la derecha");
	mode <= 2'b00;
	dir    <= 1'b1;
	#40;

	$display("Inicia prueba #5, carga en paralelo");
	mode <= 2'b10;
	d <=4'b0001;
	#10;

	$display("Inicia prueba #3, rotacion circular a la izquierda");
	mode <= 2'b01;
	dir    <= 1'b0;
	#40;

	$display("Inicia prueba #4, rotacion circular a la derecha");
	mode <= 2'b01;
	dir    <= 1'b1;
	#40 $finish;
    end
endmodule
