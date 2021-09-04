module encoder_tb();
reg [7:0] x;
wire [2:0] y;
integer i;
encoder dat(x,y);
initial begin
    for(i=0; i<8; i = i+1)
    begin
        x = 2**i;
        #10;
        x=2*i;
        #10;
    end
$finish;
end

initial $monitor("@ time: %3dps the input is %8b output is %3b",$time,x,y);

endmodule