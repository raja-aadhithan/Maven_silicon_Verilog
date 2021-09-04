module sipo(input d,clk,shift,load output [3:0] q );
always@(posedge clk)begin
    if (load) q[0] <= d ;
    else if (shift) begin

            q[3] <= q[1];
            q[2] <= q[0];
            q[1] <= q[3];
            q[0] <= q[2];

    end
end
endmodule