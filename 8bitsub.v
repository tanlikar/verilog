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
