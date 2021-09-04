module swap(input a,b, output x,y);
  assign x = a ^ (a ^ b );
  assign y = b ^ (a ^ b );
endmodule