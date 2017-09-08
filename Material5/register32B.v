`include "register4B.v"
`include "mux.v"
`include "muxflop.v"

module register_32(Q,s_out,clk,enb,dir,s_in,mode,D);
  output wire [31:0] Q;
  output wire s_out;
  input wire clk,enb,dir;
  input wire s_in;
  input wire [1:0] mode;
  input wire [31:0] D;

  reg s_inF;
  reg [1:0] modeF;
  wire s_in1,s_in2,s_in3,s_in4,s_in5,s_in6,s_in7,s_in8;
  wire s_out1,s_out2,s_out3,s_out4,s_out5,s_out6,s_out7,s_out8;

  reg sel;

  always@(*)
    begin
      if(mode == 2'b01)
        begin
          if(dir==0)
            begin
              s_inF = Q[31];
            end
          else
            begin
              s_inF =Q[0];
            end
          sel = 1'b0;
          modeF = 2'b00;
        end
      else
        if(mode == 2'b10)
        begin
          s_inF = s_in;
          modeF=mode;
          sel = 1'b0;
        end
        else
          begin
          s_inF = s_in;
          modeF=mode;
          sel = 1'b1;
          end
      end


    reg_desp reg1(.q(Q[3:0]),.s_out(s_out1),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in1),.mode(modeF),.d(D[3:0]));
    reg_desp reg2(.q(Q[7:4]),.s_out(s_out2),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in2),.mode(modeF),.d(D[7:4]));
    reg_desp reg3(.q(Q[11:8]),.s_out(s_out3),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in3),.mode(modeF),.d(D[11:8]));
    reg_desp reg4(.q(Q[15:12]),.s_out(s_out4),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in4),.mode(modeF),.d(D[15:12]));
    reg_desp reg5(.q(Q[19:16]),.s_out(s_out5),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in5),.mode(modeF),.d(D[19:16]));
    reg_desp reg6(.q(Q[23:20]),.s_out(s_out6),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in6),.mode(modeF),.d(D[23:20]));
    reg_desp reg7(.q(Q[27:24]),.s_out(s_out7),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in7),.mode(modeF),.d(D[27:24]));
    reg_desp reg8(.q(Q[31:28]),.s_out(s_out8),.clk(clk),.enb(enb),.dir(dir),.s_in(s_in8),.mode(modeF),.d(D[31:28]));

    mux m1(dir, s_inF , Q[4] , s_in1);
    mux m2(dir, Q[3] , Q[8], s_in2);
    mux m3(dir, Q[7], Q[12], s_in3);
    mux m4(dir,Q[11],Q[16],s_in4);
    mux m5(dir,Q[15],Q[20],s_in5);
    mux m6(dir,Q[19],Q[24],s_in6);
    mux m7(dir,Q[23],Q[28],s_in7);
    mux m8(dir,Q[27],s_inF,s_in8);
    mux m9(dir,Q[31],s_out1,s0);
    muxflop mF(sel,0,s0,s_out,clk);
  endmodule
