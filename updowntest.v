module updowntest;
reg clk,rst,up;
wire [3:0]q;

updowncounter c1(q,clk,rst,up);

initial 
begin
rst=1;
up=0;
clk=1;
end
always #5 clk=~clk;
always #80 rst=~rst;
always #160 up=~up;

endmodule
