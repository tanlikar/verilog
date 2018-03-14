
module adderSub (A, B, S, Cout, op);
 input [3:0] A, B;
 input op;
 output [3:0] S;
 output Cout;

 	wire C0, C1, C2, C3;
	wire b0, b1, b2;
	
	xor(b0, B[0], op);
	xor(b1, B[1], op);
	xor(b2, B[2], op);
	xor(b3, B[3], op);

 	fulladder M1 (A[0], b0, op, S[0], C0);
 	fulladder M2 (A[1], b1, C0, S[1], C1);
	fulladder M3 (A[2], b2, C1, S[2], C2);
	fulladder M4 (A[3], b3, C2, S[3], C3);

	xor(Cout, C3, op);

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
