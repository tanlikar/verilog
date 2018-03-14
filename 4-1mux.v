
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
