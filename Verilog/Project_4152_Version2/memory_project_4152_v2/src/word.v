`timescale 1 ns / 1 ps
module word(RW, select, i0,i1,i2,i3,i4,i5,i6,i7,o);
  input  RW,select , i0,i1,i2,i3,i4,i5,i6,i7;
  output [7:0] o;
  
  bitcell b0(.Select(select), .RW(RW), .InputBit(i0), .OutputBit(o[0]));
  bitcell b1(.Select(select), .RW(RW), .InputBit(i1), .OutputBit(o[1]));
  bitcell b2(.Select(select), .RW(RW), .InputBit(i2), .OutputBit(o[2]));
  bitcell b3(.Select(select), .RW(RW), .InputBit(i3), .OutputBit(o[3]));
  bitcell b4(.Select(select), .RW(RW), .InputBit(i4), .OutputBit(o[4]));
  bitcell b5(.Select(select), .RW(RW), .InputBit(i5), .OutputBit(o[5]));
  bitcell b6(.Select(select), .RW(RW), .InputBit(i6), .OutputBit(o[6]));
  bitcell b7(.Select(select), .RW(RW), .InputBit(i7), .OutputBit(o[7]));
   
endmodule



 