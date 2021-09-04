module d_latch(input d,ctrl ,output q);
assign q = ctrl ? d : q;
endmodule