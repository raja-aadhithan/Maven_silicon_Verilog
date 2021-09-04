module mux4_1_tb();
		reg [3:0] a;
      reg[1:0] s;
      wire y;		
      integer i;				
mux4_1 dut(a,s,y);
initial begin
   a = 4'b0000;
   s = 2'b00;
end
initial begin
   $monitor("@time %3d: select line: %b, data: %b, output: %b",$time,s,a,y);
   for (i=0;i<64;i=i+1)
   begin
      {s,a}=i;
      #10;
   end
   $finish;
end
endmodule