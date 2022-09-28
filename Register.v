module SD_D_Register  (Xn,Clk,Rst,Out);

  input [31:0]Xn;
  input Clk,Rst;
  output [31:0]Out;
  reg [31:0]Out;
  
  always @(posedge Clk)
  begin
  if (Rst)
    Out=32'd0;
  else
    Out=Xn;
  end
  
endmodule