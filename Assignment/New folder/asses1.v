module half_sub(input ha,hb, output hby,hd);
assign hd = ha^hb;
assign hby = ~(ha) & hb; 
endmodule