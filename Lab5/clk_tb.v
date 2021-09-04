module clk_tb();
reg clk,en;
wire clk1,clk2,clk3,clk4;
clockbuf dut(clk,en,clk1,clk2,clk3,clk4);
initial begin
    clk =1;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("@time:%3d,in-clk:%b,out-clk:%b,%b,%b,%b",$time,clk,clk1,clk2,clk3,clk4);
    en = 0 ;
    #40;
    en = 1 ;
    #80;
    $finish;
end
endmodule