module mux4to1tb ();

reg d1,d2,d3,d4;
reg [1:0] sel;
wire out;

mux4to1 a1(d1, d2, d3, d4,sel, out);

initial 
begin
	$monitor($time, "d1=%b, d2=%b, d3=%b, d4 = %b, sel=%b, out=%b\n", d1,d2,d3,d4,sel,out);
end

initial
begin
d1=1'b1; d2=1'b0; d3=1'b0; d4=1'b0; sel = 2'b00;
#10 d1=1'b0; d2=1'b1; d3=1'b0; d4=1'b0; sel = 2'b01;
#10 d1=1'b0; d2=1'b0; d3=1'b1; d4=1'b0; sel = 2'b10;
#10 d1=1'b0; d2=1'b0; d3=1'b0; d4=1'b1; sel = 2'b11;
#10 $stop;
end

endmodule