module rtl(input clk,x1,x2,x3, output reg f,g);
wire a,b;
assign a = x3|f;
assign b = x1&x2;
always@(posedge clk)begin
    g<=a;
    f<=b;
end
endmodule