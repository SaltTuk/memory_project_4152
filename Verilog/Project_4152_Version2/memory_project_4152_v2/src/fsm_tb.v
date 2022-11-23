`timescale 1 ns / 1 ps	   
module fsm_tb;
  reg  R,W,CLK = 0;
  wire i0,i1,i2,i3,i4,i5,i6,i7,adr0,adr1,adr2, o0,o1,o2,o3,o4,o5,o6,o7;								
  reg [7:0] i;
  wire [7:0] o;
  reg [2:0] addr;
  
  fsm fsm_1 (  
  	.i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
  	.adr0(adr0), .adr1(adr1), .adr2(adr2), .R(R), .W(W), .CLK(CLK), 
	.o0(o0), .o1(o1), .o2(o2), .o3(o3), .o4(o4), .o5(o5), .o6(o6), .o7(o7)
  );
  
  assign adr0 = addr[0];
  assign adr1 = addr[1];
  assign adr2 = addr[2];
  
  assign i0 = i[0];
  assign i1 = i[1];
  assign i2 = i[2];
  assign i3 = i[3];
  assign i4 = i[4];
  assign i5 = i[5];
  assign i6 = i[6];
  assign i7 = i[7];
  
  assign o[0] = o0;
  assign o[1] = o1;
  assign o[2] = o2;
  assign o[3] = o3;
  assign o[4] = o4;
  assign o[5] = o5;
  assign o[6] = o6;
  assign o[7] = o7;
  
  always
  begin
    CLK = 0; #10;
    CLK = 1; #10; 
  end
	
  initial 
	  begin	 
		  assign addr = 0; 
		  assign i = 0;
		  assign R = 0;
		  assign W = 0;
			
      #29.9  assign addr = 0; 
		  assign i = 73;
		  assign R = 0;
		  assign W = 1;
		  
      #40 assign addr = 1; 
		  assign i = 97;
		  assign R = 0;
		  assign W = 1;
		  
      #40 assign addr = 0; 
		  assign i = 0;
		  assign R = 1;
		  assign W = 0;
	  
      #40 assign addr = 1; 
		  assign i = 0;
		  assign R = 1;
		  assign W = 0;
	  
      #40  
		$finish;
	  end

endmodule