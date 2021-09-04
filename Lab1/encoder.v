module encoder(input [7:0]in , output [2:0] out);
wire[4:0] x;
wire[5:0] n;
not(n[5],in[5]);
not(n[4],in[4]);
not(n[3],in[3]);
not(n[2],in[6]);
not(n[1],in[2]);
or(out[2],in[7],in[6],in[5],in[4]);
and(x[0],in[3],n[5],n[4]);//!5,!4,3
and(x[1],n[5],n[4],n[3],in[2]);//!5,!4,!3,2
and(x[2],x[0],n[2]);//!6,!5,!4,3
and(x[3],n[2],in[5]);//!6,5
and(x[4],n[2],n[5],n[4],n[3],n[1],in[1]);//!6,!5,!4,!3,!2,1
or(out[1],in[7],in[6],x[0],x[1]);
or(out[0],in[7],x[3],x[4],x[2]);
endmodule