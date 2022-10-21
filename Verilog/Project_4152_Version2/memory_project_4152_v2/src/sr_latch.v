`timescale 1 ns / 1 ps

module sr_latch ( S ,R ,Q ,NQ );

input S,R;
output Q,NQ;

  nor (Q,R,NQ);
  nor (NQ,S,Q);
  

endmodule
