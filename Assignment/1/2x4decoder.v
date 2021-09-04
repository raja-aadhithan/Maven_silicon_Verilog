module 2x4decoder(input a,b output s,d,f,g);
assign s = ~a&~b;
assign d = ~a& b;
assign f =  a&~b;
assign g =  a& b;
endmodule