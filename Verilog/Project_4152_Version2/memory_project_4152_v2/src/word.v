`timescale 1 ns / 1 ps
module word(RW, select, i0,i1,i2,i3,i4,i5,i6,i7,o);
  input  RW,select , i0,i1,i2,i3,i4,i5,i6,i7;
  output [7:0] o;
  
  bitcell b0(.select(select), .RW(RW), .input_bit(i0), .output_bit(o[0]));
  bitcell b1(.select(select), .RW(RW), .input_bit(i1), .output_bit(o[1]));
  bitcell b2(.select(select), .RW(RW), .input_bit(i2), .output_bit(o[2]));
  bitcell b3(.select(select), .RW(RW), .input_bit(i3), .output_bit(o[3]));
  bitcell b4(.select(select), .RW(RW), .input_bit(i4), .output_bit(o[4]));
  bitcell b5(.select(select), .RW(RW), .input_bit(i5), .output_bit(o[5]));
  bitcell b6(.select(select), .RW(RW), .input_bit(i6), .output_bit(o[6]));
  bitcell b7(.select(select), .RW(RW), .input_bit(i7), .output_bit(o[7]));
   
endmodule



 