module aram8x16(input wr_in,rd_in,
	   input [2:0]addr_in,addr_out,
	   input [15:0]data_wr, output [15:0] data_rd);
	reg [7:0]out;				

reg [15:0] mem [7:0];

   always@(*)begin
      if(wr_in) mem[addr_in]=data_wr;
      if(rd_in) out = (rd_in) ? mem[addr_out] : 16'hzz;
   end
   assign data_rd = out;
endmodule 