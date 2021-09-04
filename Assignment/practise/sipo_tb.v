module tb();
  reg clk,d,rst;
  wire [3:0] y;
  
  sipo dut(clk,d,rst,y);
  
  initial begin
    clk = 1;
    forever #5 clk =!clk;
  end
  
  task load;
    begin
      d = {$random}%2;
      @(negedge clk);
      d = {$random}%2;
      @(negedge clk);
      d = {$random}%2;
      @(negedge clk);
      d = {$random}%2;
      @(negedge clk);
    end
  endtask
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("@time %3d out is %b d is %b",$time,y,d);
    rst = 1;
    @(negedge clk);
    rst =0;
    @(negedge clk);
    load;
    repeat(4)
    @(negedge clk);
    load;
    repeat(4)
    @(negedge clk);
    #100;
    $finish;
  end
endmodule
        
     