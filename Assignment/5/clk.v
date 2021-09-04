`timescale 1ns/1ps
module clk();
reg clk;
initial begin
    clk=1'b1;
    forever #5 clk=!clk;
end
endmodule