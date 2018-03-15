module test();

reg [7:0] a, b;
reg cin;
reg [1:0] sel;

reg [20:0] test1;

wire [7:0] out;
wire cout;

alu_all a1(a, b , cin, cout, sel, out);

initial 
begin
	$monitor($time, "a=%b, b=%b, cin=%b, sel = %b, cout=%b, out=%b\n", a,b,cin,sel,cout,out);
end

initial
begin
   
	for(test1 = 0; test1<=19'd524287 ; test1 = test1 +1) begin
		a = test1[7:0];
		b = test1[15:8];
		cin = test1[16];
		sel = test1[18:17];
		#10;
	end


	if(sel == 2'b00) begin
	 	if ({cout, out} !== a + b + cin) begin
		      $display("***ERROR at time = %0d ***", $time);
		      $display("a = %b, b = %b, sum = %b;  cin = %b, cout = %b, sel = %b",
	               a, b, out, cin, cout, sel);
		      $stop;
		    end
		#10;
	end

	if(sel == 2'b01) begin
	 	if ({cout, out} !== {(a ^ b ^ cin), ((~a & b) | (~(a ^ b) & cin))}) begin
		      $display("***ERROR at time = %0d ***", $time);
		      $display("a = %b, b = %b, diff = %b;  bin = %b, bout = %b, sel = %b",
	               a, b, out, cin, cout, sel);
		      $stop;
		    end
		#10;
	end

	if(sel == 2'b10) begin
	 	if (out !== (a & b) ) begin
		      $display("***ERROR at time = %0d ***", $time);
		      $display("a = %b, b = %b, out = %b;  cin = %b, cout = %b, sel = %b",
	               a, b, out, cin, cout, sel);
		      $stop;
		    end
		#10;
	end

	if(sel == 2'b11) begin
	 	if (out !== (a | b) ) begin
		      $display("***ERROR at time = %0d ***", $time);
		      $display("a = %b, b = %b, out = %b;  cin = %b, cout = %b, sel = %b",
	               a, b, out, cin, cout, sel);
		      $stop;
		    end
		#10;
	end


end
endmodule
