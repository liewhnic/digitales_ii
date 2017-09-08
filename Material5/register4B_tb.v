module testbench();

wire [1:0] mode;
wire [3:0] d;
output wire [3:0] q;

tester tst1(clk,enb,dir,s_in,mode,d);
reg_desp reg1(q,s_out,clk,enb,dir,s_in,mode,d);


initial
  begin
    $dumpfile("register.vcd");
    $dumpvars;
    $display ("time\t clk enb dir mode d s_in q s_out");
    $monitor ("%g\t    %b  %b  %b  %b %b %b %b  %b",
    $time, clk, enb, dir, mode, d, s_in, q, s_out);

  end


endmodule
