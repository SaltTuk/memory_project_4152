`timescale 1 ns / 1 ps	   

module sr_latch_tb;
  reg S,R;
  wire Q,NQ;
  
  sr_latch sr_1 (  
  .S(S),
  .R(R),
  .Q(Q),
  .NQ(NQ)
  );
  
  initial 
	  begin	 
	        assign S = 1;
		    assign R = 0;
			
        #20 assign S = 0;
		    assign R = 0;  
		
		#20 assign S = 0;
		    assign R = 1;
		
		#20 assign S = 0;
		    assign R = 0;
		
        #20 assign S = 1;
		    assign R = 0;
			
        #20 assign S = 0;
		    assign R = 0;  
		
		#20 assign S = 0;
		    assign R = 1;
		
		#20 assign S = 0;
	     	assign R = 0; 
		
		$finish;
	  end

endmodule