module mass_task(input clk, d, output y);
reg q;
assign y =  q & d;
always@(posedge clk) begin
    q <= d;
end
endmodule