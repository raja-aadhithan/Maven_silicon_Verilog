module sipo_tb();
reg clk,d,shift,load;
wire [3:0] q;
sipo dut(d,clk,shift,load,q);

initial begin
    clk = 1'b1;
    forever #5 clk = !clk;
end

task loading(input x);
begin
    load = 1'b1;
    d = x;
    #10;
    load = 1'b0;
end
endtask

initial begin
    $monitor("@time : %3d, shift = %b, load = %b, output = %b",$time,shift,load,q);
    loading(1'b1);
    loading(1'b0);
    loading(1'b1);
    loading(1'b1);
    shift = 1'b1;
    #10;
    shift = 1'b1;
    #20;
    $finish;
end
endmodule