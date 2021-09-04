module toggle_tb();
reg clk,load;
reg [3:0] d;
wire [3:0]q;

toggle dut(clk,load,d,q);
initial begin
    clk = 1;
    forever #5 clk =!clk;
end
initial begin
    $monitor ("@time : %3d output = %b",$time,q);
    load = 1'b1;
    d = 4'd17;
    #10;
    load = 1'b0;
    #3000;
    $finish;
end
endmodule