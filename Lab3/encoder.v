module encoder(input [7:0]in , output [2:0] out);
assign out[2] = in[7]|in[6]|in[5]|in[4];
assign out[1] = in[7]|in[6]| (~in[5]&~in[4]&(in[3]|in[2]));
assign out[0] = in[7] | (~in[6]&in[5]) | (~in[6]&~in[5]&~in[4]&~in[3]&~in[2]&in[1]) | (~in[6]&~in[5]&~in[4]&in[3]);
endmodule