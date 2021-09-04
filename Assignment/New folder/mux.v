module mux(input [7:0]d, input [2:0]s, output y);
assign y = s[2] ? (s[1] ? (s[0] ? d[7] : d[6]) : (s[0] ? d[5] : d[4]) ) : (s[1] ? (s[0] ? d[3] : d[3]) : (s[0] ? d[1] : d[0]) )  ;
endmodule