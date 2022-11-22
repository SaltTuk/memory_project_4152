`timescale 1 ns / 1 ps
module word_tb;
  reg  RW;
  reg  [7:0] i;	 
  reg  select;
  wire [7:0] o;
  
  word word_DUT(.RW(RW), .select(select), .i(i), .o(o));
  
  initial 
	  begin	 
		    assign RW     = 0;  
		    assign select = 0; 
			assign i      = 9;			
        #20	
		    assign RW     = 0;  
		    assign select = 1; 
			assign i      = 4;			
        #20	
		    assign RW     = 1;  
		    assign select = 1; 
			assign i      = 3;			
        #20	
		    assign RW     = 1;  
		    assign select = 0; 
			assign i      = 2;			
        #20	
		    assign RW     = 0;  
		    assign select = 0; 
			assign i      = 5;			
        #20	
		    assign RW     = 0;  
		    assign select = 1; 
			assign i      = 8;			
        #20	
		    assign RW     = 0;  
		    assign select = 0; 
			assign i      = 4;			
        #20	
		    assign RW     = 0;  
		    assign select = 0; 
			assign i      = 4;			
        #20	
		    $finish;
	  end

endmodule