module tb_aclk_timegen();
reg clk,reset,reset_count,fast_watch;
wire one_minute, one_second;
aclk_timegen dut(clk,reset,reset_count,fast_watch,one_minute, one_second);
initial begin
    clk = 1;
    forever #5 clk = !clk;
end
initial begin
    #15;
    reset = 1;
    #30
    reset = 0;
    fast_watch = 0;
    #10;
    #20000;
    $finish;
end
endmodule