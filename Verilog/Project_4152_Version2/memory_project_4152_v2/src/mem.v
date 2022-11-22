`timescale 1 ns / 1 ps
module mem(RW, addr0,addr1,addr2, i0,i1,i2,i3,i4,i5,i6,i7, o0,o1,o2,o3,o4,o5,o6,o7);
  input  RW,addr0,addr1,addr2, i0,i1,i2,i3,i4,i5,i6,i7;
  output o0,o1,o2,o3,o4,o5,o6,o7;
  wire   Naddr0,Naddr1,Naddr2,s0,s1,s2,s3,s4,s5,s6,s7;
  wire [7:0] o0, o1, o2, o3, o4, o5, o6, o7;
  
  // Selects 6*5 + 8*3  = 54 transistors   ----------
  nor (s0,addr2,addr1,addr0);     // address bits adr0' * adr1' * adr1' -> (adr2 + adr1 + adr0)'    
  
  not (Naddr0,addr0);
  nor (s1,addr2,addr1,Naddr0);    // address bits adr0' * adr1' * adr1 ->  (adr2 + adr1 + adr0')'  
  
  not (Naddr1,addr1);
  nor (s2,addr2,Naddr1,addr0);    // address bits adr0' * adr1 * adr1' ->  (adr2 + adr1' + adr0)'
  
  nor (s3,addr2,Naddr1,Naddr0);   // address bits adr0' * adr1 * adr1 ->  (adr2 + adr1' + adr0')'
  
  not (Naddr2,addr2); 
  nor (s4,Naddr2,addr1,addr0);    // address bits adr0 * adr1' * adr1' ->  (adr2' + adr1 + adr0)'	
  
  nor (s5,Naddr2,addr1,Naddr0);   // address bits adr0 * adr1' * adr1 ->  (adr2' + adr1 + adr0')'
  							
  nor (s6,Naddr2,Naddr1,addr0);   // address bits adr0 * adr1 * adr1' ->  (adr2' + adr1' + adr0)'	
  
  nor (s7,Naddr2,Naddr1,Naddr0);  // address bits adr0 * adr1 * adr1 ->  (adr2' + adr1' + adr0')'	
  
  // 
  word w0 (.RW(RW),.select(s0), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o0));
  word w1 (.RW(RW),.select(s1), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o1));
  word w2 (.RW(RW),.select(s2), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o2));
  word w3 (.RW(RW),.select(s3), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o3));
  word w4 (.RW(RW),.select(s4), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o4)); 
  word w5 (.RW(RW),.select(s5), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o5));
  word w6 (.RW(RW),.select(s6), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o6));
  word w7 (.RW(RW),.select(s7), .i0(i0),.i1(i1),.i2(i2),.i3(i3),.i4(i4),.i5(i5),.i6(i6),.i7(i7), .o(o7));
  
  
  // Output	26*8 208 transistors 
  or_8 or0 (.o(o0), .i0(o0[0]),.i1(o1[0]),.i2(o2[0]),.i3(o3[0]),.i4(o4[0]),.i5(o5[0]),.i6(o6[0]),.i7(o7[0]));  // Bit 0
  or_8 or1 (.o(o1), .i0(o0[1]),.i1(o1[1]),.i2(o2[1]),.i3(o3[1]),.i4(o4[1]),.i5(o5[1]),.i6(o6[1]),.i7(o7[1]));  // Bit 1
  or_8 or2 (.o(o2), .i0(o0[2]),.i1(o1[2]),.i2(o2[2]),.i3(o3[2]),.i4(o4[2]),.i5(o5[2]),.i6(o6[2]),.i7(o7[2]));  // Bit 2
  or_8 or3 (.o(o3), .i0(o0[3]),.i1(o1[3]),.i2(o2[3]),.i3(o3[3]),.i4(o4[3]),.i5(o5[3]),.i6(o6[3]),.i7(o7[3]));  // Bit 3
  or_8 or4 (.o(o4), .i0(o0[4]),.i1(o1[4]),.i2(o2[4]),.i3(o3[4]),.i4(o4[4]),.i5(o5[4]),.i6(o6[4]),.i7(o7[4]));  // Bit 4
  or_8 or5 (.o(o5), .i0(o0[5]),.i1(o1[5]),.i2(o2[5]),.i3(o3[5]),.i4(o4[5]),.i5(o5[5]),.i6(o6[5]),.i7(o7[5]));  // Bit 5
  or_8 or6 (.o(o6), .i0(o0[6]),.i1(o1[6]),.i2(o2[6]),.i3(o3[6]),.i4(o4[6]),.i5(o5[6]),.i6(o6[6]),.i7(o7[6]));  // Bit 6
  or_8 or7 (.o(o7), .i0(o0[7]),.i1(o1[7]),.i2(o2[7]),.i3(o3[7]),.i4(o4[7]),.i5(o5[7]),.i6(o6[7]),.i7(o7[7]));  // Bit 7 
  
  
  
endmodule