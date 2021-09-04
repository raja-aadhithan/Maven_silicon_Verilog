module counter(input rst,clk,output reg [5:0]y);

always@(*)begin
    y[0] <= 1'b1;
  y[2] <= y[3] | ~y[1];
  y[4] <= ~y[3] | y[1];
    y[5] <= !(y[3]&y[1]);
end

always@(posedge clk)begin
    if (rst) {y[3],y[1]} = 2'b00;
    else {y[3],y[1]} = {y[3],y[1]} +1'b1;
end
endmodule