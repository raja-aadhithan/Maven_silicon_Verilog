/*module buffer(input enb, inout a,b);
wire tempa,tempb;
assign tempa = enb ? b : 1'bz;
assign tempb = enb ? 1'bz : a;
assign a = tempa;
assign b = tempb;
endmodule */

module buffer(inout a,b, input enable);
bufif1(b,a,enable);
bufif0(a,b,enable);
endmodule