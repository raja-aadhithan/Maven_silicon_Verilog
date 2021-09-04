module sub(input a,b,bin, output d,by);
wire w1,w2,w3;
hs dut1(a,b,w1,w2);
hs dut2(bin,w1,d,w3);
or (by,w2,w3);
endmodule