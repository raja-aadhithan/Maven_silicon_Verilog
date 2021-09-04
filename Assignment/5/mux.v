module mux(input [7:0]a, input [2:0]s, output reg y);
integer i;
always@(*)begin
    for (i=0;i<8;i=i+1)
    begin
        if(s==i) y = a[i];
    end
end
endmodule