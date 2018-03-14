module and8bittb ();

reg [7:0] a, b;
wire [7:0] out;

and8bit a1(a,b, out);

initial 
begin
	$monitor($time, "a=%b, b=%b, out=%b\n", a,b,out);
end

initial
begin

#10 a=8'b00000001; b=8'b00000000; 
#10 a=8'b00010000; b=8'b00000100; 
#10 a=8'b00010000; b=8'b00000001;  
#10 a=8'b00001000; b=8'b10000000;  
#10 a=8'b11000001; b=8'b00010001; 
#10 $stop;
end

endmodule