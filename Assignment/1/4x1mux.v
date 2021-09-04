module 4x1mux(input a,b,c,d,s1,s2,output y);
wire w1,w2;
2x1mux dut1(a,b,s2,w1);
2x1mux dut2(c,d,s2,w2);
2x1mux dut1(w1,w2,s1,y);
endmodule