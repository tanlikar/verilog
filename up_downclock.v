module up_downclock (clk, clr, mode, srt, SegOut);
input clk, clr, mode, srt;
output [27:0] SegOut;
reg [27:0] SegOut;
reg [15:0] timer; //timer[3:0] = sec1 ,timer[7:4] = sec2 ,timer[11:8]= min1, timer[15:12]=min2
reg [26:0] temp, clk_counter;
integer a;

// clock frequency down conversion
// 27MHz to 1Hz
always @ (posedge clk or posedge clr)

begin
     if(~srt)
       begin
	if (clr)
	  begin
		temp = 0;
		    
		    if(mode == 0)//count up reset to 0 min 0 sec
		      begin
		        for (a =0 ; a<=3 ; a=a+1)
		        begin
	   	       	 timer[(a*4)+:4] = 4'b0000;
			end
	   	     end
	   	  else // count down reset to 10 min 0 sec
          	    begin
             	     timer[15:12] = 4'b0000;
          	     timer[11:8] = 4'b1001;
		     timer[7:4] = 4'b0101;
		     timer[3:0] = 4'b1010;
          	     end
  	  end
	
	else
		begin
			if (temp == 10)//if (temp == 27_000_000)
				begin
				temp = 0;
				clk_counter = clk_counter + 1;
				
				
				if(mode == 0)// count up
				  begin
				    timer[3:0] = timer[3:0] + 4'b0001;
				  
				    if (timer[3:0]== 4'b1010)
				      begin
				        timer[3:0] = 4'b0000;
				         timer[7:4] = timer[7:4] + 4'b0001;
				      end
				      
				    if (timer[7:4] == 4'b0110)
				        begin
				          timer[7:4] = 4'b0000;
				          timer[11:8] = timer[11:8] + 4'b0001;
				        end
				        
				    if (timer[11:8] == 4'b1010)
				      begin
				         timer[11:8] = 4'b0000;
				         timer[15:12] = timer[15:12] + 4'b0001;
				      end
				    if (timer[15:12] == 4'b1010)
				      begin
				        timer[15:12] = 4'b0000;
				      end 
				   end				        
				        
				else // count down
				  begin

				    timer[3:0] = timer[3:0] - 4'b0001;
				    				  
				   if(timer[3:0]== 4'b1111)
				     begin
				       timer[3:0] = 4'b1001;
				       timer[7:4] = timer[7:4]- 4'b0001;
				     end
				    if(timer[7:4] == 4'b1111)
				      begin
				        timer[7:4] = 4'b0101;
				        timer[11:8] = timer[11:8] - 4'b0001;
				      end
				    if(timer[11:8] == 4'b1111)
				     begin
				       timer[11:8]= 4'b1001;
				     end
				  end
			   
			 for(a = 0; a<=3; a=a+1 ) 
			 begin
			     
        case (timer[(a*4)+:4])
          
          4'b0000: SegOut[(a*7)+:7] = 7'b100_0000;
          4'b0001: SegOut[(a*7)+:7] = 7'b111_1001;
          4'b0010: SegOut[(a*7)+:7] = 7'b010_0100;
          4'b0011: SegOut[(a*7)+:7] = 7'b011_0000;
          4'b0100: SegOut[(a*7)+:7] = 7'b001_1001;
          4'b0101: SegOut[(a*7)+:7] = 7'b001_0010;
          4'b0110: SegOut[(a*7)+:7] = 7'b000_0010;
          4'b0111: SegOut[(a*7)+:7] = 7'b111_1000;
          4'b1000: SegOut[(a*7)+:7] = 7'b000_0000;
          4'b1001: SegOut[(a*7)+:7] = 7'b001_1000;
          default: SegOut[(a*7)+:7] = 7'b111_1111;

         endcase
        end
					   
				end
				
			else
				begin // delay the program for 27M time
				temp = temp + 1;
				timer = timer;
				end
		end
	end
end

endmodule


