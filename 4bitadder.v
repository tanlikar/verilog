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