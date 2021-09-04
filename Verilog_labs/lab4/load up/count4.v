module count4(input clk,reset,load,[3:0]i,output reg [3:0]q);
always@(posedge clk)begin
    if(reset) q <= 4'd0;
    else if (load) q <= i;
    else q <= q+1;
end
endmodule