
module adder2 (A, B, Cin, Sum, Cout);
input [3:0] A, B;
input Cin;
output [3:0] Sum;
output Cout;
wire C0, C1, C2;
fulladder M1 (A[0], B[0], Cin, Sum[0], C0);
fulladder M2 (A[1], B[1], C0, Sum[1], C1);
fulladder M3 (A[2], B[2], C1, Sum[2], C2);
fulladder M4 (A[3], B[3], C2, Sum[3], Cout);
endmodule


module fulladder (A, B, Cin, Sum, Cout);
input A, B, Cin;
output Sum, Cout;
wire n1, n2, x1;
xor u1 (x1, A, B);
xor u2 (Sum, x1, Cin);
and u3 (n1, Cin, x1);
and u4 (n2, A, B);
or u5 (Cout, n1, n2);
endmodule