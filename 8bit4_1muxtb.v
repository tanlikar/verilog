module mux8bit4_1tb ();

reg [7:0] d1,d2,d3,d4;
reg[1:0] sel;

wire [7:0] out;


mux4to18bit a1(d1, d2, d3, d4, sel, out);

initial 
begin
	$monitor($time, "d1=%b, d2=%b, d3=%b, d4 = %b, sel=%b, out=%b\n", d1,d2,d3,d4,sel,out);
end

initial
begin
d1=8'b00000001; d2=8'b00000000; d3=8'b000000000; d4=8'b00000000; sel = 2'b00;
#10 d1=8'b00000000; d2=8'b00000001; d3=8'b00000000; d4=8'b00000000; sel = 2'b01;
#10 d1=8'b00000000; d2=8'b00000000; d3=8'b00000001; d4=8'b00000000; sel = 2'b10;
#10 d1=8'b00000000; d2=8'b00000000; d3=8'b00000000; d4=8'b00000001; sel = 2'b11;
#10 $stop;
end

endmodule

