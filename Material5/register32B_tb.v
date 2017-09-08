module testbench();
wire [1:0] mode;
wire [31:0] d;
output wire [31:0] q;

tester32 tst1(clk,enb,dir,s_in,mode,d);
register_32 reg1(q,s_out,clk,enb,dir,s_in,mode,d);


initial
  begin
    $dumpfile("register32.vcd");
    $dumpvars;
    $display ("time\t clk enb dir mode d s_in q s_out");
    $monitor ("%g\t    %b  %b  %b  %b %h %b %h  %b",
    $time, clk, enb, dir, mode, d, s_in, q, s_out);

  end


endmodule
