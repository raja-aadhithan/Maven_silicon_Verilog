module count_tb();
reg clk,reset,load,up;
reg [3:0]i;
wire [3:0]q;
count4 dut(clk,reset,load,up,i,q);
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("@time : %3d - for load = %b for operation up =%b  output is %b",$time,load,up,q);
    reset <= 1;
    #15;
    reset <= 0;
    up <=1;
    load <= 1;
    i <= 4'b1101;
    #15;
    load <=0;
    #40;
    up <=0;
    #40;
    reset <= 1;
    #15;
    reset <= 0;
    #300;
    up<=1;
    #300;
    up<=0;
    #300;
    $finish;
end
endmodule