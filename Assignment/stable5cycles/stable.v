// Code your design here
module stable(input clk,a,output reg y);
  reg [4:0] x,m;
  always@(posedge clk) begin
    if(a) begin
      x <= x+1;
      m <= 0;
    end
    else if(!a)begin
      x <= 0;
      m <= m+1;
    end
  end
  always@(*) begin
    if (x > 4 || m > 4) y <= 1;
    else y <= 0;
  end
endmodule
