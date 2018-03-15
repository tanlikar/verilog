module alu_all (a, b , cin, cout, sel, out);

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


module adder8bit (a, b, cin, sum, cout);

input [7:0] a ,b;
input cin;

output [7:0] sum;
output cout;

wire [6:0] w;

fa a1 (a[0], b[0], cin, sum[0], w[0]);
fa a2 (a[1], b[1], w[0], sum[1], w[1]);
fa a3 (a[2], b[2], w[1], sum[2], w[2]);
fa a4 (a[3], b[3], w[2], sum[3], w[3]);
fa a5 (a[4], b[4], w[3], sum[4], w[4]);
fa a6 (a[5], b[5], w[4], sum[5], w[5]);
fa a7 (a[6], b[6], w[5], sum[6], w[6]);
fa a8 (a[7], b[7], w[6], sum[7], cout);

endmodule


module fa(a,b,cin, s, cout);

input a,b,cin;
output s, cout;

wire w1, w2, w3;

xor (w1, a, b);
xor (s, w1, cin);

and (w2, w1, cin);
and (w3, a, b);

or (cout, w2, w3);

endmodule


module sub8bit (a, b, bin, diff, bout);

input [7:0] a, b;
input bin;

output [7:0] diff;
output bout;

wire [6:0] w;

fullsubtractor a1 (a[0], b[0], bin, diff[0], w[0]);
fullsubtractor a2 (a[1], b[1], w[0], diff[1], w[1]);
fullsubtractor a3 (a[2], b[2], w[1], diff[2], w[2]);
fullsubtractor a4 (a[3], b[3], w[2], diff[3], w[3]);
fullsubtractor a5 (a[4], b[4], w[3], diff[4], w[4]);
fullsubtractor a6 (a[5], b[5], w[4], diff[5], w[5]);
fullsubtractor a7 (a[6], b[6], w[5], diff[6], w[6]);
fullsubtractor a8 (a[7], b[7], w[6], diff[7], bout);

endmodule



module fullsubtractor(a,b,bin, diff, bout);

input a,b,bin;
output diff, bout;

wire w1,w2,w3,w4,w5;

not(w1, a);
xor(w2, a,b);
not(w3, w2);
and(w4, w1, b);
and(w5, w3, bin);
or(bout, w5, w4);
xor(diff, bin, w2);

endmodule


module and8bit(a,b, out);

input [7:0] a,b;
output [7:0] out;

and (out[0], a[0], b[0]);
and (out[1], a[1], b[1]);
and (out[2], a[2], b[2]);
and (out[3], a[3], b[3]);
and (out[4], a[4], b[4]);
and (out[5], a[5], b[5]);
and (out[6], a[6], b[6]);
and (out[7], a[7], b[7]);

endmodule


module or8bit (a, b, out);

input [7:0] a, b;
output [7:0] out;

or (out[0], a[0], b[0]);
or (out[1], a[1], b[1]);
or (out[2], a[2], b[2]);
or (out[3], a[3], b[3]);
or (out[4], a[4], b[4]);
or (out[5], a[5], b[5]);
or (out[6], a[6], b[6]);
or (out[7], a[7], b[7]);

endmodule


module mux4to18bit (d1, d2, d3, d4, sel, out);

input [7:0] d1, d2, d3, d4;
input [1:0] sel;

output [7:0] out;

mux4to1 a1 (d1[0], d2[0], d3[0], d4[0],sel, out[0]);
mux4to1 a2 (d1[1], d2[1], d3[1], d4[1],sel, out[1]);
mux4to1 a3 (d1[2], d2[2], d3[2], d4[2],sel, out[2]);
mux4to1 a4 (d1[3], d2[3], d3[3], d4[3],sel, out[3]);
mux4to1 a5 (d1[4], d2[4], d3[4], d4[4],sel, out[4]);
mux4to1 a6 (d1[5], d2[5], d3[5], d4[5],sel, out[5]);
mux4to1 a7 (d1[6], d2[6], d3[6], d4[6],sel, out[6]);
mux4to1 a8 (d1[7], d2[7], d3[7], d4[7],sel, out[7]);

endmodule



module mux4to1 (d1, d2, d3, d4,sel, out);

input d1, d2, d3, d4;
input [1:0] sel;

output out;

wire w1,w2;
wire w3,w4,w5,w6;

not(w1, sel[0]);
not(w2, sel[1]);

and(w3, w1,w2,d1);
and(w4, sel[0], w2, d2);
and(w5, w1, sel[1], d3);
and(w6, sel[1], sel[0], d4);

or(out, w3,w4,w5,w6);

endmodule



