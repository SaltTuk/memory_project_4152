`timescale 1 ns / 1 ps

module bitcell ( select ,RW ,input_bit ,output_bit);

 input  select,RW,input_bit;
 output output_bit;
 wire   n_select,n_input_bit,Q,NQ,R,S;
  
  not (n_select,select);
  not (n_input_bit,input_bit);
  
  nor(R,n_select,RW,input_bit);
  nor(S,n_select,RW,n_input_bit);
  
  sr_latch latch1(
    .R  (R),
    .S  (S),
	.Q  (Q),
	.NQ (NQ)
  ); 
  
  cmos (output_bit,Q, select, n_select);
  
  //and (output_bit,select,RW,Q);
endmodule
