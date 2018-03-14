module adderSubTb ();
 reg [3:0] A, B; 
 reg Op;
 wire [3:0] S;
 wire Cout;
 
 adderSub U1 (A, B, S, Cout, Op);

 initial 
begin 
     A = 4'b1010; B = 4'b0101; Op = 0;
 #10 A = 4'b1011; B = 4'b1001; Op = 1;
 #10 A = 4'b1000; B = 4'b0010; Op = 1;
 #10 A = 4'b0001; B = 4'b0010; Op = 1;
 #10 A = 4'b1111; B = 4'b1111; Op = 0; 
 #10 A = 4'b1111; B = 4'b1111; Op = 1; 

end endmodule
