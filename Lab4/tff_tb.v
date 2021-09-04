module tff_tb();
reg t,clk,reset;
wire q,qb;
integer i;
tfflop dut(t,clk,reset,q,qb);
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end
initial begin
    $monitor("@time = %3d: T is %b and outputs are %b - %b",$time,t,q,qb);
    reset = 1'b1;
    #5;
    reset = 1'b0;
    for(i=0;i<8;i=i+1)
    begin
        t = i[0];
        #10;
    end
    $finish;
end
endmodule