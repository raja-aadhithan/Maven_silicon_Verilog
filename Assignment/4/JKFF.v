`include "def.v"
module JKFF(input clk,j,k,reset, output reg q);
always@(posedge clk)begin
    if (reset) q<=1'b0;
    else begin
        case({j,k})
        `HOLD : q <= q;
        `RESET: q <= 1'b0;
        `SET  : q <= 1'b1;
        `TOGGLE: q <= !q;
        endcase
    end
end
endmodule