module a(a,b,c, out1, out2);

input a,b,c;
output out1,out2;

wire w1,w2,w3;

xor #(5) a1(w1, a,b);
and #(4) a2(w2,a,b);
xor #(5) a3(out1, w1, c);
and #(4) a4(w3, w1, c);
or #(3) a5(out2,w3,w2);

endmodule
