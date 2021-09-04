module dfflop(input clock,reset,d_in, output Q_out,Qb_out);
reg x;
   always@(posedge clock) begin
	 if(reset) x <= 1'b0;
	 else x <= d_in;	
   end	
   assign Q_out = x;
   assign Qb_out = !x;
endmodule          