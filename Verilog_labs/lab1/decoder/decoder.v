/*module decoder(input [1:0] in, output [3:0] out);
always@(*)begin
    case(in)
    2'b11 : out <= 4'b1000;
    2'b10 : out <= 4'b0100;
    2'b01 : out <= 4'b0010;
    2'b00 : out <= 4'b0001;
    default: out <= 0;
    endcase
end
endmodule*/
module decoder(
    input [1:0] in,
    output [3:0] out
    );
  assign out[0] = (~in[1]) & (~in[0]) ;
  assign out[1] = ( in[1]) & (~in[0]) ;
  assign out[2] = (~in[1]) & ( in[0]) ;
  assign out[3] = ( in[1]) & ( in[0]) ;

endmodule
