module jk_tb();
reg j,k,clk;
wire q,qb;
integer i;
jkfflop dut(j,k,clk,q,qb);
initial begin 
    clk = 1'b1;
    forever #5 clk = ~clk;
end 
initial begin
    $monitor("@time : %3d: j is %b, k is %b, output is %b-%b",$time,j,k,q,qb);
    for(i=0;i<8;i=i+1)
    begin
        {j,k}=i[1:0];
        #10;
    end
    $finish;
end
endmodule