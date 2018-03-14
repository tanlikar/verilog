module alu (a, b , cin, cout, sel, out);

input [7:0] a,b;
input [1:0] sel;
input cin;

output [7:0] out;
output cout;

wire [7:0] temp1, temp2, temp3, temp4;
wire tempcout1, tempcout2;

adder8bit a1(a, b, cin, temp1, tempcout1);
sub8bit a2(a, b, cin, temp2, tempcout2);
and8bit a3(a, b, temp3);
or8bit a4(a, b, temp4);


mux4to18bit a5(temp1, temp2, temp3, temp4, sel, out);
mux4to1 a6(tempcout1, tempcout2, 0, 0,sel, cout);

endmodule


