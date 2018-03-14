// reset = user reset
//sys_reset = system reset
//coin_change = money input - product price

module product_choice(sw, reset, product_price_MSB, product_price_LSB, led_error);
input [8:0] sw; 
input reset;
output [3:0] product_price_MSB, product_price_LSB;
output led_error;

always @(sw or reset)
begin
if(reset)
  begin
   product_price_MSB = 4'd0;
   product_price_LSB = 4'd0;
   led_error = 0;
  end

else if (sw == 9'b000000001)
  begin
   product_price_MSB = 4'd0;
   product_price_LSB = 4'd3;
  end

else if (sw == 9'b000000010)
  begin
   product_price_MSB = 4'd0;
   product_price_LSB = 4'd5;
  end

else if (sw == 9'b000000100)
  begin
   product_price_MSB = 4'd0;
   product_price_LSB = 4'd8;
  end

else if (sw == 9'b000001000)
  begin
   product_price_MSB = 4'd1;
   product_price_LSB = 4'd2;
  end

else if (sw == 9'b000010000)
  begin
   product_price_MSB = 4'd1;
   product_price_LSB = 4'd6;
  end

else if (sw == 9'b000100000)
  begin
   product_price_MSB = 4'd1;
   product_price_LSB = 4'd8;
  end

else if (sw == 9'b001000000)
  begin
   product_price_MSB = 4'd2;
   product_price_LSB = 4'd2;
  end

else if (sw == 9'b010000000)
  begin
   product_price_MSB = 4'd2;
   product_price_LSB = 4'd5;
  end

else if (sw == 9'b100000000)
  begin
   product_price_MSB = 4'd2;
   product_price_LSB = 4'd7;
  end

else
  begin
   led_error = 1;
  end
end
endmodule



module coin_input(clk,reset, coin_input, total_money_LSB, total_money_MSB); // display coin input
input reset
input coin_input[3:0];
output [3:0]  total_money_LSB, total_money_MSB;

reg [3:0]  total_money_LSB, total_money_MSB;
reg coin_input [3:0]; // 3= 100sen, 2= 50 sen , 1 = 20 sen, 0 = 10sen 

always @(reset or coin_input)
begin
if(reset)
  begin
   total_money_LSB = 4'd0;
   total_money_MSB = 4'd0;
  end

else if (coin_input[0] == 1)
  begin 
   if(total_money_LSB !=4'd9)
    begin
     total_money_LSB = total_money_LSB + 4'd1;
     total_money_MSB = total_money_MSB;
    end
   if(total_money_LSB == 4'd9)
    begin
     total_money_LSB = 4'd0;
     total_money_MSB = total_money_MSB + 4'd1;
    end
  end

else if(coin_input[1] == 1)
  begin
   if(total_money_LSB < 4'd8)
    begin
     total_money_LSB = total_money_LSB + 4'd2;
     total_money_MSB = total_money_MSB;
    end

   else if(total_money_LSB >= 4'd8)
    begin
     total_money_LSB = total_money_LSB - 4'd8;
     total_money_MSB = total_money_MSB + 4'd1;
    end 
   end

else if(coin_input [2] == 1)
   begin
    if(total_money_LSB < 4'd5)
     begin
      total_money_LSB = total_money_LSB + 4'd5;
      total_money_MSB = total_money_MSB
     end
    else if (total_moeny_LSB>= 4'd5 && total_money_LSB <= 4'd9)
     begin
      total_money_LSB = total_money_LSB - 4'd5;
      total_money_MSB = total_money_MSB + 4'd1;
     end
   end

else if(coin_input[3]== 1)
   begin
    total_money_MSB = total_money_MSB + 4'd1;
    total_money_LSB = total_money_LSB;
   end
else if(coin_input[0] == 4'd0 && coin_input[1] == 4'd0 && coin_input[2] == 4'd0 && coin_input[3] == 4'd0)
   begin
    total_money_LSB = total_money_LSB;
    total_money_MSB = total_money_MSB;
   end



end
endmodule



module counter ( reset, coin_input,temp_10,temp_20,temp_50,temp_100) // count total coin for sub

input reset;
input coin_input [3:0]; 
output [3:0]count_10, count_20, count_50, count_100;
reg [3:0]temp_10, temp_20, temp_50, temp_100;

always @(reset or coin_input)
begin
if(reset)
   begin
    temp_10 = 0;
    temp_20 = 0;
    temp_50 = 0;
    temp_100 = 0;
   end
else if (coint_input[0]==1)
   begin
    temp_10 = temp_10 + 1;
   end
else if (coin_input[1]==1)
   begin
    temp_20 = temp_20 + 1;
   end
else if(coin_input[2]==1)
   begin
    temp_50 = temp_50 + 1;
   end
else if(coin_input[3]==1)
   begin
    temp_100 = temp_100 + 1;
   end
end
endmodule


module control (reset, cancel, product_price_MSB, product_price_LSB, total_money_LSB, total_money_MSB, product_out, Change_total, cancel_change_LSB, cancel_change_MSB)
//product out = led

input reset, cancel;
input [3:0] product_price_MSB, product_price_LSB;
input [3:0] total_money_LSB, total_money_MSB;
output product_out;
output [3:0] change_total, cancel_change_LSB, cancel_change_MSB;

endmodule
