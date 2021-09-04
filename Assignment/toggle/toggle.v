module toggle(input clk,load,input [3:0]d,output reg [3:0]q);
reg [4:0] x = 0;
always@(posedge clk)begin
    if (load) q<= d;
    else begin
        if (x == 5'd30) begin
        q <= ~q;
        x <= 5'd0;
        end
        else x <= x + 1'b1;
    end
end
endmodule