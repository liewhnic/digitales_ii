module muxflop(sel,din_0,din_1,muxOut,clk);
  input sel, din_0,din_1,clk;
  output muxOut;
  reg muxOut;
  always @(posedge clk)
    begin
      if(sel==1'b0)
        muxOut = din_0;
      else
        muxOut = din_1;
    end
  endmodule
