module mux4_tb();
reg a,b,c,d;
reg [1:0] s;
wire x;
integer i;
mux_dec DUT(a,b,c,d,s,x);
initial begin
   a=0;b=0;c=0;d=0;s = 0; 
end
initial begin
    for(i=0;i<64;i=i+1)
    begin
        {s,a,b,c,d}=i;
        #10;
end
end
initial #1000 $finish;
endmodule