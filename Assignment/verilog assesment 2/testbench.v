module testbench();
reg clk,reset,load;
reg [1:0] shift;
reg [63:0] ld;
wire [63:0] q;
integer i;

alu dut(ld,shift,reset,clk,load,q);
initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
end

task loading();
begin
load = 1'b1;
for (i = 0; i<64; i = i+1)
begin
   ld[i] = {$random}%2; 
end
#10;
load = 1'b0; 
end
endtask

initial begin
    $monitor("@time = %4d, load = %b, shift = %b, q = %h",$time,load,shift,q);
    reset = 1'b1;
    #10;
    reset = 1'b0;
    loading;
    shift = 2'd0;
    #20;
    shift = 2'd1;
    #20;
    shift = 2'd2;
    #20;
    shift = 2'd3;
    #20;
$finish;
end
endmodule