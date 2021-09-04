module loop(input clk,reset, output reg [7:0]a);
reg [7:0] s,c;
reg x;

always@(posedge clk)begin
    if(reset) begin
        c <= 8'd1;
        x <= 1'b0;
        s <= 8'd1;
    end
    else begin
        if (c == 8'd0) c <= 8'd2;
        if(x) a <= s;
        else if(!x) begin
            a <= c;
            c <= {c[6:0],1'b0};
        end
    x =!x; 
    end
end
endmodule