module mux2(input a,b,s, output x);
assign x = s ? b : a;
endmodule