module divide(input [10:0] y,input [3:0] x, output reg[10:0] q,r);
  always@(*) begin  
    q <= y / x;
    r <= y%x;
  end
endmodule