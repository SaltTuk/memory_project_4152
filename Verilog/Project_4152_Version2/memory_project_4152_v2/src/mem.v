				   `timescale 1 ns / 1 ps
module mem(RW, addr0,addr1,addr2, i0,i1,i2,i3,i4,i5,i6,i7, o0,o1,o2,o3,o4,o5,o6,o7);
  input  RW,addr0,addr1,addr2, i0,i1,i2,i3,i4,i5,i6,i7;
  output o0,o1,o2,o3,o4,o5,o6,o7;
  wire   Naddr0,Naddr1,Naddr2,s0,s1,s2,s3,s4,s5,s6,s7;
  wire [7:0] o, i; 
  wire RWd;
  
  assign i[0] = i0;
  assign i[1] = i1;
  assign i[2] = i2;
  assign i[3] = i3;
  assign i[4] = i4;
  assign i[5] = i5;
  assign i[6] = i6;
  assign i[7] = i7;
  
  assign o0 = o[0];
  assign o1 = o[1];
  assign o2 = o[2];
  assign o3 = o[3];
  assign o4 = o[4];
  assign o5 = o[5];
  assign o6 = o[6];
  assign o7 = o[7];
  
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
  
 
  word w0 (.RW(RW),.select(s0), .i(i), .o(o));
  word w1 (.RW(RW),.select(s1), .i(i), .o(o));
  word w2 (.RW(RW),.select(s2), .i(i), .o(o));
  word w3 (.RW(RW),.select(s3), .i(i), .o(o));
  word w4 (.RW(RW),.select(s4), .i(i), .o(o)); 
  word w5 (.RW(RW),.select(s5), .i(i), .o(o));
  word w6 (.RW(RW),.select(s6), .i(i), .o(o));
  word w7 (.RW(RW),.select(s7), .i(i), .o(o));
  
endmodule