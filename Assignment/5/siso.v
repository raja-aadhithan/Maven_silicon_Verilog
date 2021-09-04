module siso(input d,clk,output reg y);
reg[1:0]x;
always@(posedge clk)begin
    x[1]<=d;
    x[0]<=x[1];
    y<=x[0];
end
endmodule