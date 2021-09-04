module vending(input clk,reset,input [1:0]coin, output pr_en);
reg s;
reg [10:0] count;
parameter s0 = 3'b000, s25 = 3'b001, s50 = 3'b010, s75 = 3'b011, s100 = 3'b100;
reg [2:0] state , next_state;

always@(*)begin
    case(state)
    s0 : next_state = coin[1] ? (coin [0] ? s0 : s100) : (coin [0] ? s50 : s25) ;
    s25 : next_state =  coin[1] ? (coin [0] ?  s25 :  s100) : (coin [0] ?  s75 :  s50) ;
    s50 :next_state =  coin[1] ? (coin [0] ?  s50 :  s100) : (coin [0] ?  s100 :  s75) ;
    s75 : next_state = coin[1] ? (coin [0] ?  s75 :  s100) : (coin [0] ?  s100 :  s100) ;
    s100 : next_state = s0;

    endcase
end

always@(posedge clk)begin
    if(reset) state <= s0;
    else if(!s) state <= s0;
    else begin
        state<= next_state;
        if(count == 11'd1280) s <= 1'b0;
        else s <= 1'b1;
    end 
end

always@(posedge clk)begin
    if(coin != 2'b11) count <= 11'd0;
    else if(coin == 2'b11)begin
        count <= count + 1'b1;
    end
end

assign pr_en = (state == s100) ? 1 : 0;
endmodule