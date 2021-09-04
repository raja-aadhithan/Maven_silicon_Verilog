module loop(input clk,reset, output [7:0]a);
reg [7:0] s,c;
reg x;
assign s = 8'd1;

always@(posedge clk)begin
    if(reset) c <= 8'd1;
    else begin
        if (s == c) c << 1'b1;
        if(x) a <= s;
        else if(!x) begin
            a <= c;
            c <= c <<1'b1;
        end
    x =!x; 
    end
end
endmodule