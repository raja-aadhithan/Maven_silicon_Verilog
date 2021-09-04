module top;
  bit [7:5][3:0][5:8] mem [5:3][3][1:6];
  bit [7:0]  tst1 [7:3]; bit [31:0] tst2 [8:16];
  
  initial begin
    $display (" $left(mem) = %0d", $left(mem));
    $display (" $right(mem) = %0d", $right(mem));
    $display (" $low(mem) = %0d", $low(mem));
    $display (" $high(mem) = %0d", $high(mem));
    $display (" $increment(mem) = %0d", $increment(mem));
    $display (" $size(mem) = %0d", $size(mem));
    $display (" $dimensions(mem) = %0d", $dimensions(mem));
      
    for (int i = $right(mem); i < ($size(mem) + $right(mem)); i++)
      mem[i][1][5] = $random;
                                  
    if($increment(tst1)) begin
    	for(int i = $right(tst1); i <= $left(tst1); i++)
          tst1[i] = $random; 
    end
    else begin
      for(int i = $left(tst1); i >= $right(tst1); i--)
        tst1[i] = (i * 5); 
    end
    
    if($increment(tst2)) begin
      for(int i = $right(tst2); i >= $left(tst2); i--)
        tst2[i] = (i % 2); 
    end
    else begin
      for(int i = $left(tst2); i <= $right(tst2); i++)
        tst2[i] = (i * 2); 
    end
                                  
    $display (" mem = %p", mem);
    $display (" tst1 = %p", tst1);
    $display (" tst2 = %p", tst2);
    $finish;
  end
endmodule

$left(mem) = 5
$right(mem) = 3
$low(mem) = 3
$high(mem) = 5
$increment(mem) = 1
$size(mem) = 3
$dimensions(mem) = 6
mem = '{'{'{'h0, 'h0, 'h0, 'h0, 'h0, 'h0}, '{'h0, 'h0, 'h0, 'h0, 'hffff8484d609, 'h0}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0}}, '{'{'h0, 'h0, 'h0, 'h0, 'h0, 'h0}, '{'h0, 'h0, 'h0, 'h0, 'hffffc0895e81, 'h0}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0}}, '{'{'h0, 'h0, 'h0, 'h0, 'h0, 'h0}, '{'h0, 'h0, 'h0, 'h0, 'h12153524, 'h0}, '{'h0, 'h0, 'h0, 'h0, 'h0, 'h0}}}
tst1 = '{'h12, 'h65, 'h8d, 'hd, 'h63}
tst2 = '{'h0, 'h1, 'h0, 'h1, 'h0, 'h1, 'h0, 'h1, 'h0}
$finish called from file "testbench.sv", line 43.
$finish at simulation time                    0

module system_variable();
bit signed [2:0]abc;
initial
begin
$display(“$typename of abc is %s”, $typename(abc));
$display(“$bits of abc is %0d”, $bits(abc));
end
endmodule

$typename of abc is bit signed[2:0]
$bits of abc is 3

$root.A.B   //item B within top instance A
$root.A.B.c //item C within instance B within            instance A


