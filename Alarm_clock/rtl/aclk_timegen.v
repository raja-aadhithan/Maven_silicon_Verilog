module aclk_timegen(input clk,reset,reset_count,fast_watch, output reg one_minute, one_second);
reg [14:0] i = 15'd0;
always@(posedge clk or posedge reset)begin
    if(reset) begin
        one_minute <= 0;
        one_second <= 0;
    end
    else if(reset_count) begin
        one_minute <= 0;
        one_second <= 0;
    end
    else if(!fast_watch)begin
            if (i[7:0] == 8'd255) one_second <= 1;
            else one_second <= 0;
            if (i[13:0] == 14'd15359) begin
                one_minute <= 1;
                i = 15'd0;
            end
            else one_minute <= 0;
            i = i + 1'b1;
        end
    
    else if(fast_watch)begin
        if (i[7:0] == 8'd255)  one_minute <= 1;
        else one_minute <= 0;
        i = i + 1'b1;
    end
end
endmodule