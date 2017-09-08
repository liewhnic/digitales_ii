module tester(clk,enb,dir,s_in,mode,d q_c, q_e, s_out_c, s_out_e);
   output reg clk,enb,dir,s_in;
   output reg [1:0] mode;
   output reg [3:0] d;
   input wire [3:0] q_c;
   input wire [3:0] q_e;
   input wire       s_out_c;
   input wire       s_out_e;


   //Senal de reloj
   always #6 clk = !clk;

   //valores iniciales
   initial begin
      clk<=0;
      enb <= 0;
      dir <= 0;
      s_in <= 1;
      mode <= 2'b00;

      $display("Inicia prueba #5, carga en paralelo");
      mode <= 2'b10;
      enb <= 1'b1;
      d<=4'b1010;
      #500 ;

      $display("Inicia prueba #1, rotacion a la izquierda");
      mode <= 2'b00;
      #500;

      $display("Inicia prueba #5, carga en paralelo");
      mode <= 2'b10;
      d<=4'b1010;
      #500;

      $display("Inicia prueba #2, rotacion a la derecha");
      mode <= 2'b00;
      dir    <= 1'b1;
      #500;

      $display("Inicia prueba #5, carga en paralelo");
      mode <= 2'b10;
      d <=4'b0001;
      #500;

      $display("Inicia prueba #3, rotacion circular a la izquierda");
      mode <= 2'b01;
      dir    <= 1'b0;
      #500;

      $display("Inicia prueba #4, rotacion circular a la derecha");
      mode <= 2'b01;
      dir    <= 1'b1;
      #500 $finish;
   end

   always @ (*)
     begin
        if (s_out_c != s_out_e)
          begin
             $monitor("S_OUT conductual y estructural diferentes.");
          end

        else if (q_c[3:0] != q_e[3:0])
          begin
             $monitor ("Q conuctual y estructural diferentes");
          end
     end

endmodule
