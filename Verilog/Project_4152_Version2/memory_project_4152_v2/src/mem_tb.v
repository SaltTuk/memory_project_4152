`timescale 1 ns / 1 ps
module mem_tb;
  reg  RW;
  reg  [7:0] i;	 
  reg  [2:0] addr;
  wire [7:0] o;
  
  mem mem_DUT(.RW(RW), .addr0(addr[0]), .addr1(addr[1]),. addr2(addr[2]), 
              .i0(i[0]),.i1(i[1]),.i2(i[2]),.i3(i[3]),.i4(i[4]),.i5(i[5]),.i6(i[6]),.i7(i[7]), 
              .o0(o[0]),.o1(o[1]),.o2(o[2]),.o3(o[3]),.o4(o[4]),.o5(o[5]),.o6(o[6]),.o7(o[7]));
  
  initial 
	  begin	 
		    // Write ADR 7 Value 4
		    assign RW    = 0;  
		    assign addr  = 7; 
			assign i     = 4;			
        #20	
		    // Write ADR 3 Value 2  
		    assign RW    = 0;  
		    assign addr  = 3; 
			assign i     = 2;				
		#20	
		    // Read ADR 3
		    assign RW    = 1;  
		    assign addr  = 3;
			assign i     = 0;
		#20	
		    // Read ADR 7 
		    assign RW    = 1;  
		    assign addr  = 7;
			assign i     = 0;
		#20	
		    // Read ADR 1
		    assign RW    = 1;  
		    assign addr  = 1;
			assign i     = 5;
		#20	
		    // Read ADR 3
		    assign RW    = 1;  
		    assign addr  = 3;
			assign i     = 5;
	    #20
		    $finish;
	  end

endmodule