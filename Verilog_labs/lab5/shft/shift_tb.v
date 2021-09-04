module shift_tb();
reg clk,data;
wire out;
shift dut(clk,data,out);
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("@time:%3d, in data is %b, out data is %b",$time,data,out);
    data = 1;
    #10;
    data = 1;
    #10;
    data = 0;
    #10;
    data = 1;
    #10;
    data = 0;
    #10;
    data = 0;
    #10;
    data = 1;
    #10;
    data = 0;
    #10;
    data = 1;
    #10;
    data = 1;
    #10;
    data = 0;
    #10;
    data = 1;
    #10;
    data = 0;
    #10;
$finish;
end
endmodule