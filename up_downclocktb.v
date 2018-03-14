module up_downclocktb ();

reg clk, clr, mode, srt;
wire [27:0] SegOut;

up_downclock U(clk, clr, mode, srt, SegOut);

always
#1 clk = ~clk;

initial
begin
	clr=0; mode = 0; srt=0; clk=0;
#10	clr=1;
#10	clr=0;
#5000	clr=1; mode = 1;
#10	mode =1; clr = 0;
#5000	$stop;

end

endmodule
