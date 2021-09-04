module coin_tb();
reg clk,reset,i,j;
wire x,y;
vending dut(clk,reset,i,j,x,y);
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("@time:%3d,input (ij) is %b,%b and output (xy) is %b,%b",$time,i,j,x,y);
    reset = 1 ;
    #15;
    reset = 0;
    i = 0;
    j = 1;
    #10;
    i = 0;
    j = 0;
    #10;
    i = 1;
    j = 1;
    #10;
    i = 1;
    j = 0;
    #10;
    i = 0;
    j = 1;
    #10;
    i = 1;
    j = 1;
    #10;
    i = 1;
    j = 1;
    #10;
    i = 1;
    j = 0;
    #10;
    i = 1;
    j = 1;
    #10;
    i = 1;
    j = 0;
    #10;
    i = 0;
    j = 1;
    #10;
    i = 1;
    j = 1;
    #10;
    i = 1;
    j = 1;
    #10;
    i = 1;
    j = 0;
    #10;
    $finish;
end
endmodule