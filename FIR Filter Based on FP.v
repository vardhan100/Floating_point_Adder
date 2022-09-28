module FIR_Filter_Based_FP (Clk,Rst,Xn,b0,b1,b2,b3,Yn);
  input Clk,Rst;
  input [31:0]Xn,b0,b1,b2,b3;
  output [31:0]Yn;
  wire [31:0]X1,X2,X3;
  wire [31:0]A0,A1,A2,A3;
  wire [31:0]Add0,Add1;
  

  SD_D_Register MS0 (
    .Xn(Xn),
    .Clk(Clk),
    .Rst(Rst),
    .Out(X1)
    );

  SD_D_Register MS1 (
    .Xn(X1),
    .Clk(Clk),
    .Rst(Rst),
    .Out(X2)
    );
      

  SD_D_Register MS2 (
    .Xn(X2),
    .Clk(Clk),
    .Rst(Rst),
    .Out(X3)
    );

  FP_Multiplier_Single MSB0 (
    .A(Xn),
    .B(b0),
    .Out(A0)
    );
  
  FP_Multiplier_Single MSB1 (
    .A(X1),
    .B(b1),
    .Out(A1)
    );

  FP_Multiplier_Single MSB2 (
    .A(X2),
    .B(b2),
    .Out(A2)
    );
    
 FP_Multiplier_Single MSB3 (
    .A(X3),
    .B(b3),
    .Out(A3)
    );
	
Floating_Point_Addition_New Adder0 (
  .A(A0),
  .B(A1),
  .S(Add0)
  );

Floating_Point_Addition_New Adder1 (
  .A(Add0),
  .B(A2),
  .S(Add1)
  );
  
Floating_Point_Addition_New Adder2 (
  .A(Add1),
  .B(A3),
  .S(Yn)
  );	

     
endmodule