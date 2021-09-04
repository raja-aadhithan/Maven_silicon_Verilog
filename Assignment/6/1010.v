module seq_det(input x,clk,rst, output y);
parameter idle = 3'b000, s1 = 3'b001, s10 = 3'b010, s101 = 3'b011, s1010 = 3'b100;
reg [2:0] state, next_state;
always@(*)begin
    case(state)
    idle : next_state = x ? s1 : idle ;
    s1   : next_state = x ? s1 : s10 ;
    s10  : next_state = x ? s101 : idle ;
    s101 : next_state = x ? s1 : s1010 ;
    s1010: next_state = x ? s101 : idle ;
    default : next_state = idle;
    endcase
end
always@(posedge clk)begin
    if(rst) state<=idle;
    else begin
        state<=next_state;
    end
end
assign y = (state==s1010);
endmodule