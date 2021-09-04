module bufer_tb();
wire a,b;
reg c,ta,tb;
integer i;
bufer dut(a,b,c);
initial begin
for(i=0;i<8;i=i+1)
begin
        {ta,tb,c}=i[2:0];
        #10;
end
end
assign a = c ? ta : 1'bz;
assign b = c ? 1'bz : tb;
endmodule