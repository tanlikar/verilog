module test;

reg a,b,c;
wire out1, out2;

a a1(a,b,c,out1,out2);

initial 
begin
	$monitor($time, "a=%b, b=%b, c=%b, out1=%b, out2=%b\n", a,b,c,out1,out2 );
end

initial
begin
a=1'b0; b=1'b0; c=1'b0;
#10 a=1'b1; b=1'b0; c=1'b0;
#20 a=1'b1; b=1'b1; c=1'b0;
#20 a=1'b1; b=1'b1; c=1'b1;
end
endmodule