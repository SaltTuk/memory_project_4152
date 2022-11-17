`timescale 1 ns / 1 ps
module mem(RW, adr0,adr1,adr2, i0,i1,i2,i3,i4,i5,i6,i7, o0,o1,o2,o3,o4,o5,o6,o7);
  input  RW,adr0,adr1,adr2, i0,i1,i2,i3,i4,i5,i6,i7;
  output o0,o1,o2,o3,o4,o5,o6,o7;
  wire   Nadr0,Nadr1,Nadr2,s0,s1,s2,s3,s4,s5,s6,s7;
  wire [7:0] o0, o1, o2, o3, o4, o5, o6, o7;
  
  nor (s0,adr0,adr1,adr2);     // address bits adr0' * adr1' * adr1' -> (adr0 + adr1 + adr2)'    
  
  not (Nadr2,adr2);
  nor (s1,adr0,adr1,Nadr2);    // address bits adr0' * adr1' * adr1 ->  (adr0 + adr1 + adr2')'  
  
  not (Nadr1,adr1);
  nor (s2,adr0,Nadr1,adr2);    // address bits adr0' * adr1 * adr1' ->  (adr0 + adr1' + adr2)'
  
  nor (s3,Nadr1,Nadr2);        // address bits adr0' * adr1 * adr1 ->  (adr0 + adr1' + adr2')'
  
  not (Nadr0,adr0); 
  nor (s4,Nadr0,adr1,adr2);    // address bits adr0 * adr1' * adr1' ->  (adr0' + adr1 + adr2)'	
  
  nor (s5,Nadr0,adr1,Nadr2);   // address bits adr0 * adr1' * adr1 ->  (adr0' + adr1 + adr2')'
  
  nor (s6,Nadr0,Nadr1,adr2);   // address bits adr0 * adr1 * adr1' ->  (adr0' + adr1' + adr2)'	
  
  nor (s7,Nadr0,Nadr1,Nadr2);  // address bits adr0 * adr1 * adr1 ->  (adr0' + adr1' + adr2')'	
  
  word w0 (.RW(RW),.select(s0), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o0));
  word w1 (.RW(RW),.select(s1), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o1));
  word w2 (.RW(RW),.select(s2), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o2));
  word w3 (.RW(RW),.select(s3), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o3));
  word w4 (.RW(RW),.select(s4), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o4)); 
  word w5 (.RW(RW),.select(s5), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o5));
  word w6 (.RW(RW),.select(s6), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o6));
  word w7 (.RW(RW),.select(s7), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o7));
  
  // Output
  
endmodule