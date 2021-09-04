module count_tb();
reg rst,clk;
wire [5:0] y;

counter dut(rst,clk,y);

initial begin
    clk = 1;
    forever #5 clk = !clk;
end

initial begin
  $monitor("@time %3d : y is %b = %d",$time,y,y);
    rst = 1'b1;
    @(negedge clk);
    rst = 1'b0;
    #100;
    $finish;
end
endmodule