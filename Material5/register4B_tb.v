module testbench();

wire [1:0] mode;
wire [3:0] d;
output wire [3:0] q;

tester tst1(clk,enb,dir,s_in,mode,d, q_c, q_e s_out_c, s_out_e);
reg_cond reg1(q_c,s_out_c,clk,enb,dir,s_in,mode,d);
reg_estruc reg2(q_e,s_out_e,clk,enb,dir,s_in,mode,d);


initial
  begin
    $dumpfile("register.vcd");
    $dumpvars;
    $display ("time\t clk enb dir mode d s_in q s_out");
    $monitor ("%g\t    %b  %b  %b  %b %b %b %b  %b",
    $time, clk, enb, dir, mode, d, s_in, q, s_out);

  end


endmodule
