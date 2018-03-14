module up_counttb ();


reg clk, clr;
wire [3:0] Cout;


 up_count U(clk, clr, Cout);


always
	#1 clk = ~clk;

initial 
begin
      clk = 1;	clr = 0;

end

endmodule