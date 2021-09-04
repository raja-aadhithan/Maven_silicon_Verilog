module loop_tb();
reg clk,reset;
wire [7:0] a;

loop dut(clk,reset,a);

initial begin
    clk = 1'b1;
    forever #5 clk = !clk;
end

initial begin
    $monitor("@time:%3d - output %b",$time,a);
    reset = 1'b1;
    #10;
    reset = 1'b0;
    #300;
    $finish;
end
endmodule