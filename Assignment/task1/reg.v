module regis(input clk,reset, output reg [7:0] a);
wire [7:0] x,y,z,w,s;
reg [7:0] c;
always@(posedge clk)begin
    a <= reset ? 8'd0 : x;
    c <= s; 
end
assign x = a[0] ? c : 8'd255;
assign y = a[0] ? c : z;
assign z = c[7] ? 8'd2 : w;
assign w = c << 1'b1;
assign s = reset ? 8'd255 : y;
endmodule