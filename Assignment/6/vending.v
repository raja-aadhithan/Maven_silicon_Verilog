module vending(input clk,rst,i,j, output x,y);
parameter idle = 3'b000, st1 = 3'b001, st2 = 3'b010, st3 = 3'b011, st4 = 3'b100;
reg[2:0]next_state,state;
always@(*)begin
    case(state)
    idle : next_state = i ? ( j ? idle : st2):( j ? st1 : idle) ;
    st1  : next_state = i ? ( j ? st1 : st3):( j ? st2 : st1) ;
    st2  : next_state = i ? ( j ? st2 : st4):( j ? st3 : st2) ;
    st3  : next_state = idle;
    st4  : next_state = idle;
    default: next_state = idle;
    endcase
end
always@(posedge clk or posedge rst)begin
    if(rst) state<=idle;
    else state<=next_state;
end
assign x = (state==st3)||(state==st4);
assign y = (state==st4);
endmodule