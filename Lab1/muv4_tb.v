module mux4_tb();
reg a,b,c,d,s1,s2;
wire x;
integer i;
mux4 DUT(a,b,c,d,s1,s2,x);
initial begin
   a=0;b=0;c=0;d=0;s1=0;s2=0; 
end
initial begin
    for(i=0;i<64;i=i+1)
    begin
        {s1,s2,a,b,c,d}=i;
        #10;
end
end
initial #1000 $finish;
endmodule