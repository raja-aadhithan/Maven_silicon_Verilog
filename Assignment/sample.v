module (input ckl, d, output reg y);
reg [4:0] x;
always@(posedge clk)begin
    if(d==0) begin
       x <= 0; 
    end 
    else if(d==1) begin
    x[4:0] <= {x[3:0],1'b1};
    end
    y <= $x;
end
endmodule