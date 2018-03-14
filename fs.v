
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
