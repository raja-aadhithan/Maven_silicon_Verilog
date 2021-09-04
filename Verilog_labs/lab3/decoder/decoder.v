module decoder(input [2:0] in, output [7:0] out);
reg [7:0]temp;
always@(*)begin
    case(in)
    3'd0: temp <= 8'd1;
    3'd1: temp <= 8'd2;
    3'd2: temp <= 8'd4;
    3'd3: temp <= 8'd8;
    3'd4: temp <= 8'd16;
    3'd5: temp <= 8'd32;
    3'd6: temp <= 8'd64;
    3'd7: temp <= 8'd128;
    default : temp <= 8'd0;
    endcase 
end
assign out = temp;
endmodule;