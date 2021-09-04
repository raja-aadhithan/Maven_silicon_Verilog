module decoder_tb();
reg [2:0]a;
wire [7:0]y;
integer i;
decoder dut(a,y);
initial begin
    $monitor("@time: %2dps - input is %b , output is %b",$time,a,y);
    for(i=0;i<8;i=i+1)begin
        a = i;
        #10;
    end
    $finish;
end
endmodule