`timescale 1 ns / 1 ps
module d_flip_flop(D, CLK ,Q, NQ);

input  D, CLK;
output Q, NQ;
wire   S2,R2,Q1, NQ1,NCLK,ND;  

  // A		   
  not  (ND,D);
  nor (S1,D,CLK);
  nor (R1,CLK,ND);	 
  
  nor (Q1,S1,NQ1);
  nor (NQ1,R1,Q1);
  	
  // B
  not (NCLK,CLK);
  nor (S2,Q1,NCLK);
  nor (R2,NCLK,NQ1);
  
  nor (Q,S2,NQ);
  nor (NQ,R2,Q);

endmodule

