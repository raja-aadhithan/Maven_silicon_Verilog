module shift(input clk,data, output out);
reg [3:0] regis;
always@(posedge clk)begin
    regis[3] <= data;
    regis[2] <= regis[3];
    regis[1] <= regis[2];
    regis[0] <= regis[1];
end
assign out = regis[0];
endmodule