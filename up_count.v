module up_count (clk, clr, Cout);
input clk, clr;
output [3:0] Cout;
reg [3:0] Cout;
reg [26:0] temp;

// clock frequency down conversion
// 27MHz to 1Hz
always @ (posedge clk or posedge clr)

begin
	if (clr)
		begin
		temp = 0;
		Cout = 4'b0000;
		end
	else
		begin
			if(temp == 10)//if (temp == 27_000_000)
				begin
				temp = 0;
				Cout = Cout + 4'b0001;
				end
			else
				begin // delay the program for 27M time
				temp = temp + 1;	
				Cout = Cout;
				end
		end
end

endmodule