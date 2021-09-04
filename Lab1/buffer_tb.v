module buffer_tb();
reg a,s;
wire b,d;
integer i;
buffer DUT(a,s,b,d);
initial begin 
    a = 0;
    s = 0;
end
initial begin
    for ( i = 0 ; i < 4 ; i = i+1)
    begin
        {a,s} = i;
        #10;
    end
end
initial $monitor("The value of a is %b and s is %b for b is %b",i[1],i[0],b);
initial #200 $finish;
endmodule