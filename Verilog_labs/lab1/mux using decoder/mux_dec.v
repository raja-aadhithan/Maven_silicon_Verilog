module mux_dec(input A,B,C,D, input [1:0] in, output Y);
wire [3:0] out;
reg x;
  assign out[0] = (~in[1]) & (~in[0]) ;
  assign out[1] = ( in[1]) & (~in[0]) ;
  assign out[2] = (~in[1]) & ( in[0]) ;
  assign out[3] = ( in[1]) & ( in[0]) ;
  always@(*)begin
      case(in)
      2'b00:x <= out[0] ? A : 1'bz;
      2'b01:x <= out[2] ? B : 1'bz ;
      2'b10:x <= out[1] ? C : 1'bz ;
      2'b11:x <= out[3] ? D : 1'bz ;
      endcase
  end
assign Y = x;
endmodule