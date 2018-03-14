module adder8bittb();

reg [7:0] a,b;
reg cin;
wire [7:0] sum;
wire cout;

adder8bit a1(a, b, cin, sum, cout);

initial 
begin
	$monitor($time, "a=%b, b=%b, cin=%b, cout=%b, sum=%b\n", a,b,cin,cout,sum);
end

initial
begin

    a=8'b00000001; b=8'b00001000; cin=1'b0; 
#10 a=8'b01000001; b=8'b00010000; cin=1'b0; 
#10 a=8'b00000001; b=8'b00000001; cin=1'b0; 
#10 a=8'b00000001; b=8'b00000001; cin=1'b1;
#10 a=8'b10000001; b=8'b10000000; cin=1'b1; 
#10 $stop;
end

endmodule