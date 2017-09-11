//IE-0523 Circuitos Digitales II
//Tarea 5. Descripcion Conductual Registro Desplazable de 4 bits
//Estudiante:	Cesar Valverde Zuñiga		A86605		
//				Isaac Gómez Sánchez			B32919
//II Ciclo 2017

//Definicion del modulo
module registrodesp(clk,enb,dir,s_in,mode,d,q,s_out);
	//Entradas
	input clk,enb,dir,s_in;	
	input [1:0] mode;
	input [3:0] d;
	//Salidas.
	output reg [3:0] q;	
	output reg s_out;
always @(posedge clk)
  begin
	//Siempre que enb=1/ habilitado para funcionar.
    if(enb==1'b1)	
      begin
        if(mode==2'b00)
          begin
            if(dir==1'b0)	//Rotacion a la Izquierda.
              begin
                q<={q[2:0],s_in};
                s_out=q[3];
              end
            else if(dir==1'b1)	//Rotacion a la Derecha.
              begin
                q<={s_in,q[3:1]};
                s_out<=q[0];
              end
          end
        else if(mode ==2'b01)
          begin
            if(dir==1'b0)	//Rotacion Circular a la Izquierda.
              begin
                s_out<=0;
                q<={q[2:0],q[3]};
              end
            else if(dir==1'b1)	//Rotacion Circular a la Derecha.
              begin
                s_out<=0;
                q<={q[0],q[3:1]};
              end
          end
        else if(mode == 2'b10)	//Carga en paralelo.
          begin
            s_out<=0;
            q<=d;
          end
      end
  end
endmodule
