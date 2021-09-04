module mux4_1(a_in,
              sel_in,
              y_out);

   //Ports declaration
   input [3:0] a_in;
   input [1:0] sel_in;
   output y_out;

   //Internal wires
   wire w1,w2;

   //Instances of 2:Muxes
   mux2_1 M1(.a(a_in[2]),.b(a_in[3]),.sel(sel_in[0]),.y(w1));
   mux2_1 M2(.a(a_in[0]),.b(a_in[1]),.sel(sel_in[0]),.y(w2));
   mux2_1 M3(.a(w2),.b(w1),.sel(sel_in[1]),.y(y_out));

endmodule

module mux_tb();
reg [3:0] a;
reg [1:0] s;
wire y;
integer i;

mux4_1 dut(a,s,y);

initial begin
    $monitor("input = %b, sel = %b, output = %b"a,s,y);
    for (i=0; i<64; i=i+1) begin
        {a[3:0], s[1:0]} = i;
        #10;
    end
    $finish;
end
endmodule
