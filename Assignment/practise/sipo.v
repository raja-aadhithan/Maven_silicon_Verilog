module sipo(input clk,d,rst, output [3:0]y);
reg [2:0]x;
reg [1:0]a;
reg z;

always@(posedge clk)begin
    if(rst) begin
        a<=0;
        z<=0;
    else a <= a+1;
end

always@(posedge clk)begin
    if(rst)begin
        z<=0;
        y<=0;
    end
    else begin
        if(a == 2'b11) z <= !z;
        if(z)begin
            y <= {x[2:0],d};
        end
        else begin
            {x[2:0]} <= {x[1:0],d};
        end
    end
end
endmodule