module ripple_adder(input [3:0] a,b, input cin,
			 output[3:0] sum,output carry);
wire [2:0] w;

full_adder FA1(a[0],b[0],cin,sum[0],w[0]);
full_adder FA2(a[1],b[1],w[0],sum[1],w[1]);
full_adder FA3(a[2],b[2],w[1],sum[2],w[2]);
full_adder FA4(a[3],b[3],w[2],sum[3],carry);
endmodule 