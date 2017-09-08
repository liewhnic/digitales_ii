module testbench();

wire [1:0] MODE;
wire [3:0] D;


output wire [3:0] Qcond;
output wire [3:0] Qest;

output wire  Sreal;
output wire  Qreal;

tester tst1(CLK,ENB,DIR,S_IN,MODE,D);

reg_desp Rcond(s_outcond,CLK,ENB,DIR,S_IN,MODE,D,Qcond);
register Rest(s_outest,CLK,ENB,DIR,S_IN,MODE,D,Qest);

comparador4BQ compaQ(Qcond,Qest,Qreal);
comparador4BS compaS(s_outcond,s_outest,Sreal);

initial
  begin
    $dumpfile("comparador4B.vcd");
    $dumpvars;
    $display ("CLK,	 ENB, 	 DIR, 	  MODE,   D,   S_IN, Qcond,    Qest,   s_outC,   s_outE,   Sreal,Qreal ");
    $monitor (" %b 	 %b 	  %b 	   %b	  %h 	 %b    %h       %h        %b 	 %b	   %b	 %b",
    CLK, ENB, DIR, MODE, D, S_IN, Qcond,Qest, s_outcond, s_outest, Sreal, Qreal);

  end


endmodule
