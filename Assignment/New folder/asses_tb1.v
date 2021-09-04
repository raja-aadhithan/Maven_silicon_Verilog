module sub_tb();
reg a,b,c;
wire by,d;
integer i;
full_sub DUT(a,b,c,by,d);
initial
begin
$monitor("@time: %3d : a is %b, b is %b, c is %b where difference is %b and borrow is %b", $time, a,b,c,d,by);
for (i = 0 ; i <8 ; i = i+1)
begin
{a,b,c} = i;
#10;
end
end
endmodule