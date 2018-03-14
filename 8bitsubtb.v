module sub8bittb();

reg [7:0] a,b;
reg bin;
wire [7:0] diff;
wire bout;

sub8bit a1(a, b, bin, diff, bout);

initial 
begin
	$monitor($time, "a=%b, b=%b, bin=%b, bout=%b, diff=%b\n", a,b,bin,bout,diff);
end

initial
begin

#10 a=8'b00000001; b=8'b00000000; bin=1'b0; 
#10 a=8'b00010000; b=8'b00000100; bin=1'b0; 
#10 a=8'b00010000; b=8'b00000001; bin=1'b1; 
#10 a=8'b00001000; b=8'b10000000; bin=1'b0; 
#10 a=8'b11000000; b=8'b00010001; bin=1'b1;
#10 $stop;
end

endmodule