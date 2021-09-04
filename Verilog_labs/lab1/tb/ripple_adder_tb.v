module ripple_adder_tb();
reg [3:0]a,b;
reg c;
wire [3:0]s;
wire cy;
integer i;
initial begin 
a=0;
b=0;
c=0; end

ripple_adder DUT(a,b,c,s,cy);
initial begin
for (i=0;i<16;i=i+1)
begin
a=i;
b=i;
c=!c;
#10;
end
end
initial 
      $monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",a,b,c,s,cy);
									
   //Process to terminate simulation after 100ns
   initial #100 $finish;
			
   
endmodule
