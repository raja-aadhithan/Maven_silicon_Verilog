module hs(input a,b, output d,by);
assign d = a^b;
assign by = ~a&b;
endmodule