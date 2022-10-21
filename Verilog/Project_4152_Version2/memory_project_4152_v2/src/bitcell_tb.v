`timescale 1 ns / 1 ps
module bitcell_tb;
  reg  select,RW,input_bit;
  wire output_bit;
  
  bitcell bitcell_DUT(  
  .select(select),
  .RW(RW),
  .input_bit(input_bit),
  .output_bit(output_bit)
  );
  
  initial 
	  begin	         
		    assign select    = 0;  
		    assign RW        = 0;
		    assign input_bit = 0;
        #20
		    assign select    = 0;  
		    assign RW        = 0;
		    assign input_bit = 1;
        #20
		    assign select    = 0;  
		    assign RW        = 1;
		    assign input_bit = 0;
		#20
		    assign select    = 0;  
		    assign RW        = 1;
		    assign input_bit = 1;	  
        #20
		    assign select    = 1;  
		    assign RW        = 0;
		    assign input_bit = 0;
        #20
		    assign select    = 1;  
		    assign RW        = 0;
		    assign input_bit = 1;
        #20
		    assign select    = 1;  
		    assign RW        = 1;
		    assign input_bit = 0;
        #20
		    assign select    = 1;  
		    assign RW        = 1;
		    assign input_bit = 1;	
        #20
		    assign select    = 1;  
		    assign RW        = 0;
		    assign input_bit = 0;
        #20
		    assign select    = 1;  
		    assign RW        = 1;
		    assign input_bit = 1;			
		#20		 
		    $finish;
	  end

endmodule