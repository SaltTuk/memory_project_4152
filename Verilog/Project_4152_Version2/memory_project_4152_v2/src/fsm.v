`timescale 1 ns / 1 ps
module fsm(i0,i1,i2,i3,i4,i5,i6,i7,adr0,adr1,adr2,R,W,CLK, o0,o1,o2,o3,o4,o5,o6,o7);

 input  i0,i1,i2,i3,i4,i5,i6,i7,adr0,adr1,adr2,CLK,R,W;
 output o0,o1,o2,o3,o4,o5,o6,o7;  			   
 wire   Q1,Q2,NQ1,NQ2,RW, D1,D2, Rn,Wn;
	   
 d_flip_flop A(.D (D1),
                .CLK(CLK),
                .Q (Q1),
                .NQ (NQ1));	
  
 d_flip_flop B(.D (D2),
                .CLK(CLK),
                .Q (Q2),
                .NQ (NQ2));
				
 not(Rn, R);
 not(Wn, W);
				
 nor(D1, Rn, Q1, Q2);		 
 nor(D2, Wn, R, Q1, Q2);	
 
   
 mem mem_1(.RW(NQ2),.addr0(adr0),.addr1(adr1),.addr2(adr2), 
	         .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), 
	         .o0(o0),.o1(o1),.o2(o2),.o3(o3),.o4(o4),.o5(o5),.o6(o6),.o7(o7));


endmodule