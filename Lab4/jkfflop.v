module jkfflop(input j,k,clk,output reg q,wire qb);
parameter HOLD=2'b00, RESET=2'b01, SET=2'b10, TOGGLE=2'b11;
always@(posedge clk)begin
    case({j,k})
    RESET : q <= 0;
    SET   : q <= 1;
    TOGGLE: q <= qb;
    endcase
end 
assign qb = ~q;
endmodule