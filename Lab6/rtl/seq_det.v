module seq_det(input seq_in,clock,reset,output det_o);
reg [1:0]state,next_state;
parameter IDLE=2'b00, STATE1 = 2'b01, STATE2 = 2'b10, STATE3=2'b11;

always@(posedge clock)begin
	if(reset)begin
		state<=IDLE;
	end
	else begin
		state<=next_state;
	end
end
always@(*)begin
	 case(state)
	    IDLE   : next_state = seq_in ? STATE1 : IDLE ;
	    STATE1 : next_state = seq_in ? STATE1 : STATE2 ;
	    STATE2 : next_state = seq_in ? STATE3 : IDLE ;
        STATE3 : next_state = seq_in ? STATE1 : STATE2 ;
	    default: next_state=IDLE;
	 endcase
   end
assign det_o = (state==STATE3);
endmodule