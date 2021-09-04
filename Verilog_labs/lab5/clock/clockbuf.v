module clockbuf(input clk,enb,output clk1,clk2,clk3,clk4);
wire x;
buf(x,clk);
bufif1(clk1,x,enb);
bufif1(clk2,x,enb);
bufif1(clk3,x,enb);
bufif1(clk4,x,enb);
endmodule