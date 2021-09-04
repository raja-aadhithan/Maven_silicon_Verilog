module count_tb();
reg clk,reset,load;
reg [3:0]i;
wire [3:0]q;
mod12 dut(clk,reset,load,i,q);
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("@time : %3d - for load = %b output is %b",$time,load,q);
    reset <= 1;
    #15;
    reset <= 0;
    load <= 1;
    i <= 4'b1101;
    #15;
    load <=0;
    #40;
    reset <= 1;
    #15;
    reset <= 0;
    #300;
    $finish;
end
endmodule