module dataflow_fulladder(input a,b,c,d,s2,s1, output x);
assign x = s1 ? (s2 ? d : c) : (s2 ? b :a );
endmodule 