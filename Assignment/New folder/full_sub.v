module full_sub(input a,b,c, output by,d);
wire x,y,z;
half_sub hs1(a,b,x,y);
half_sub hs2(y,c,z,d);
assign by = z | x;
endmodule
