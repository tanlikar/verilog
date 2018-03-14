module test();

reg [7:0] a, b;
reg cin;
reg [1:0] sel;

wire [7:0] out;
wire cout;

alu a1(a, b , cin, cout, sel, out);

initial 
begin
	$monitor($time, "a=%b, b=%b, cin=%b, sel = %b, cout=%b, out=%b\n", a,b,cin,sel,cout,out);
end

initial
begin
    a=8'b00000001; b=8'b00001000; cin=1'b0; sel = 2'b00;
#10 a=8'b01000001; b=8'b00010000; cin=1'b0; sel = 2'b00;
#10 a=8'b00000001; b=8'b00000001; cin=1'b0; sel = 2'b00;
#10 a=8'b00000001; b=8'b00000001; cin=1'b1; sel = 2'b00;
#10 a=8'b10000001; b=8'b10000000; cin=1'b1; sel = 2'b00;

#10 a=8'b00000001; b=8'b00000000; cin=1'b0; sel = 2'b01;
#10 a=8'b00010000; b=8'b00000100; cin=1'b0; sel = 2'b01;
#10 a=8'b00010000; b=8'b00000001; cin=1'b1; sel = 2'b01;
#10 a=8'b00001000; b=8'b10000000; cin=1'b0; sel = 2'b01;
#10 a=8'b11000000; b=8'b00010001; cin=1'b1; sel = 2'b01;

#10 a=8'b00000001; b=8'b00000000; cin=1'b0; sel = 2'b10;
#10 a=8'b00010000; b=8'b00000100; cin=1'b0; sel = 2'b10;
#10 a=8'b00010000; b=8'b00000001; cin=1'b1; sel = 2'b10;
#10 a=8'b00001000; b=8'b10000000; cin=1'b0; sel = 2'b10;
#10 a=8'b11000000; b=8'b00010001; cin=1'b1; sel = 2'b10;

#10 a=8'b00000001; b=8'b00000000; cin=1'b0; sel = 2'b11;
#10 a=8'b00010000; b=8'b00000100; cin=1'b0; sel = 2'b11;
#10 a=8'b00010000; b=8'b00000001; cin=1'b1; sel = 2'b11;
#10 a=8'b00001000; b=8'b10000000; cin=1'b0; sel = 2'b11;
#10 a=8'b11000000; b=8'b00010001; cin=1'b1; sel = 2'b11;


#10 $stop;

end
endmodule
