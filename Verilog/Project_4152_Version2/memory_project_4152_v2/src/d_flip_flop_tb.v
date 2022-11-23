`timescale 1 ns / 1 ps	   
module d_flip_flop_tb;
  reg  D,CLK = 0;
  wire Q,NQ;
  
  d_flip_flop f_1 (  
    .D(D),
    .CLK(CLK),
    .Q(Q),
    .NQ(NQ)
  );
  
  always
  begin
    CLK = 0; #10;
    CLK = 1; #10; 
  end
	
  initial 
	  begin	 
	        assign D = 1;
			
        #10 assign D = 0; 
		
		#20 assign D = 0;
		
		#20 assign D = 0;
		
        #20 assign D = 1;
			
        #20 assign D = 1;  
		
		#20 assign D = 1;
		
		#20 assign D = 0;  
		
		#20		
		$finish;
	  end

endmodule