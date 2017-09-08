module mux(sel,din_0,din_1,muxOut);
  input sel, din_0,din_1;
  output muxOut;
  reg muxOut;
  always @(sel or din_0 or din_1)
    begin
      if(sel==0)
        begin
          muxOut = din_0;
        end
      else
        begin
          muxOut = din_1;
        end
    end
endmodule
