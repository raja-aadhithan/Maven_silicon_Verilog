module ram168(input clk,wr_in,rd_in,
	   input [3:0]addr_in,addr_out,
	   input [7:0]data_wr, output [7:0] data_rd);
	reg [7:0]out;				

reg [7:0] mem [15:0];

   always@(posedge clk)begin
      if(wr_in) mem[addr_in]=data_wr;
      if(rd_in) out = (rd_in) ? mem[addr_out] : 8'hzz;
   end
   assign data_rd = out;
endmodule 