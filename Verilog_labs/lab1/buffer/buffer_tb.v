module buffer_tb();
reg a,b,enable;
wire d,e;
integer i;
buffer dut(a,b,enable,d,e);
initial begin
    for (i=0;i<16;i=i+1)
    begin
        {a,b,enable}=i[2:0];
        #10;
    end
end
initial $monitor("@time = %3d: The value of a is %b and b is %b \n enable is %b \n output ar is %b and br is %b ",$time,a,b,enable,d,e);
initial #200 $finish;
endmodule