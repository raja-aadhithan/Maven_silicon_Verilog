module vending_tb();
reg clk,reset;
reg [1:0]coin;
wire pr_en;
integer i;

vending dut(clk,reset,coin, pr_en);

initial begin
    clk = 1'b1;
    forever #5 clk = !clk;
end

initial begin
    reset = 1'b1;
    @(negedge clk);
    reset = 1'b0;
    coin = 2'b10;
    @(negedge clk);
    coin = 2'b11;
    #30;
    @(negedge clk);
    coin = 2'b00;
    @(negedge clk);
    coin = 2'b01;
    @(negedge clk);
    coin = 2'b00;
    @(negedge clk);
    @(negedge clk);
    coin = 2'b01;
    @(negedge clk);
    coin = 2'b11;
    for(i =0 ; i < 1300 ; i = i+1)begin
        @(negedge clk);
    end
    $finish;
end
endmodule