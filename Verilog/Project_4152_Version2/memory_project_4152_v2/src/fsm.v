`timescale 1 ns / 1 ps
module fsm(i0,i1,i2,i3,i4,i5,i6,i7,adr0,adr1,adr2,R,W,CLK, o0,o1,o2,o3,o4,o5,o6,o7);

 input  i0,i1,i2,i3,i4,i5,i6,i7,adr0,adr1,adr2,CLK,R,W;
 output o0,o1,o2,o3,o4,o5,o6,o7;  			   
 wire   Q1,Q2,NQ1,NQ2;
	   
   d_flip_flop A(.D (),
                .CLK(CLK),
                .Q (Q1),
                .NQ (NQ1));	
  
  d_flip_flop B(.D (),
                .CLK(CLK),
                .Q (Q2),
                .NQ (NQ2));
				
   
   mem mem_1(.RW(),.addr0(),.addr1(),.addr2(), 
             .i0(),.i1(),.i2(),.i3(),.i4(),.i5(),.i6(),.i7(), 
             .o0(),.o1(),.o2(),.o3(),.o4(),.o5(),.o6(),.o7());


endmodule

