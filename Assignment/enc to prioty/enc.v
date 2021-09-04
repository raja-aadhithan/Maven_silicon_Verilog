module PRI(input ap,bp,cp,dp, output yp0,yp1); 
	assign yp0 = ap || cp;
	assign yp1 = ap || bp;
endmodule

module enc(input a,b,c,d, output  y0,y1);
  wire x,yp0,yp1;
  PRI encoder(a,b,c,d,yp0,yp1);
  assign x = yp0 & yp1;
  assign y0 = x ? (a ?  1'b1 : 1'b0 ) : yp0;
  assign y1 = yp1;
endmodule