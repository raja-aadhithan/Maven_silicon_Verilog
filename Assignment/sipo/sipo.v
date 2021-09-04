module sipo(input d,clk,shift,load, output reg [3:0] q );
always@(posedge clk)begin
    if (load) begin
        q[3:0] <= {q[2:0], d};
    end
    else if (shift) begin

            q[3] <= q[1];
            q[2] <= q[0];
            q[1] <= q[3];
            q[0] <= q[2];

    end
    else q <= q;
end
endmodule