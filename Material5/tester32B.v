module tester32(clk,enb,dir,s_in,mode,d);
output reg clk,enb,dir,s_in;
output reg [1:0] mode;
output reg [31:0] d;


//Senal de reloj
always #5 clk = !clk;

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
  d<=32'h0;
  #10 ;

  $display("Inicia prueba #1, rotacion a la izquierda");
  mode <= 2'b00;
  #320;

  $display("Inicia prueba #5, carga en paralelo");
  mode <= 2'b10;
  d<=32'h0;
  #10 ;

  $display("Inicia prueba #2, rotacion a la derecha");
  mode <= 2'b00;
  dir    <= 1'b1;
  #320;

  $display("Inicia prueba #5, carga en paralelo");
  mode <= 2'b10;
  d <=32'h0001;
  #10;

  $display("Inicia prueba #3, rotacion circular a la izquierda");
  mode <= 2'b01;
  dir    <= 1'b0;
  #320;

  $display("Inicia prueba #4, rotacion circular a la derecha");
  mode <= 2'b01;
  dir    <= 1'b1;
  #320
  $finish;
  end
endmodule
