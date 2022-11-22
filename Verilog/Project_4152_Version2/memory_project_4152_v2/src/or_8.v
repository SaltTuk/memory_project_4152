`timescale 1 ns / 1 ps
module or_8(i0,i1,i2,i3,i4,i5,i6,i7,o);
  input  i0,i1,i2,i3,i4,i5,i6,i7;
  output o;
  wire o1, o2;
  
  
  or (o1, i0, i1, i2, i3);	// 10
  or (o2, i4, i5, i6, i7);  // 10 
  or (o,o1,o2); //6			
  
endmodule