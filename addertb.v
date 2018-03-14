
module adder2_tb ();
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;
adder1 U1 (A, B, Cin, Sum, Cout);
initial
begin
A = 4'b1010; B = 4'b0101; Cin = 0;
#10 A = 4'b0011; B = 4'b1101; Cin = 1;
#10 A = 4'b1111; B = 4'b1111; Cin = 0;
end
endmodule