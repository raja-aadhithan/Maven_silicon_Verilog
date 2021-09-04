module 2x1(input a,b,s, output y);
wire r,w1,w2;
not(r,s);
and(w1,b,s);
and(w2,a,r);
or(y,w1,w2);
endmodule