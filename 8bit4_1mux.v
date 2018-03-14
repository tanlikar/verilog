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
