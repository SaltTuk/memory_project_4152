`timescale 1 ns / 1 ps
module word(RW, select, i, o);
  input  RW, select;
  input  [7:0] i;
  output [7:0] o;
  
  bitcell b0(.select(select), .RW(RW), .input_bit(i[0]), .output_bit(o[0]));
  bitcell b1(.select(select), .RW(RW), .input_bit(i[1]), .output_bit(o[1]));
  bitcell b2(.select(select), .RW(RW), .input_bit(i[2]), .output_bit(o[2]));
  bitcell b3(.select(select), .RW(RW), .input_bit(i[3]), .output_bit(o[3]));
  bitcell b4(.select(select), .RW(RW), .input_bit(i[4]), .output_bit(o[4]));
  bitcell b5(.select(select), .RW(RW), .input_bit(i[5]), .output_bit(o[5]));
  bitcell b6(.select(select), .RW(RW), .input_bit(i[6]), .output_bit(o[6]));
  bitcell b7(.select(select), .RW(RW), .input_bit(i[7]), .output_bit(o[7]));
   
endmodule



 