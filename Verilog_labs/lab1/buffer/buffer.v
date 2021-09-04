module buffer(input at,bt,enb, output ar,br);
wire tempa,tempb;
assign tempa = enb ? at : 1'bz;
assign br = enb ? tempa : 1'bz;
assign tempb = enb ? 1'bz : bt;
assign ar = enb ? 1'bz : tempb;
endmodule 