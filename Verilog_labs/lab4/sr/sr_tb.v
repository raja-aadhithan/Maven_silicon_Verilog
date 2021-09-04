module sr_tb();
reg a,b;
wire q,qb;
integer i,j;
sr dut(a,b,q,qb);
initial begin
    $monitor("@time %2d input is %b,%b  - output is %b,%b",$time,a,b,q,qb);
    for (i=0;i<4;i = i+1)
    begin
        {a,b}=i;
        #10;
    end
    for (j=1;j<4;j = j+1)
    begin
        {a,b}=j;
        #10;
    end
    $finish;
end
endmodule