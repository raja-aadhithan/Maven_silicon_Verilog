`timescale 1us/1ps
module clock();
reg clk;
initial begin
    forever #0.0005 clk = !clk;
end
endmodule