module tfflop(input t,clk,reset,output reg q, wire qb);
wire d;
assign d = t^q;
assign qb = !q;
always@(posedge clk)begin
    if (reset) q<=0;
    else q<=d;
end
endmodule