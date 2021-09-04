module fifo (clk,reset,read,write,data_in,full,empty,data_out);

parameter WIDTH = 8;
parameter DEPTH = 16;

output reg [WIDTH-1 : 0] data_out;
output full;
output empty;

input [WIDTH-1 : 0] data_in;
input clk;
input reset,read,write;
wire a;

reg [WIDTH-1 : 0] mem [DEPTH-1 : 0];
reg [4 : 0] rd_pointer;
reg [4 : 0] wr_pointer;

assign a = wr_pointer[4]^rd_pointer[4];
assign empty = ((wr_pointer - rd_pointer) == 0) ? 1'b1 : 1'b0;
assign full  = ((wr_pointer[3:0] - rd_pointer[3:0]) == 0 & a) ? 1'b1 : 1'b0;

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		// reset
		wr_pointer <= 0;
		rd_pointer <= 0;
	end
	else begin
		if (full == 1'b0 & write) begin
			mem[wr_pointer[3:0]] <= data_in;
			wr_pointer <= wr_pointer + 1;
		end
		if (empty == 1'b0 & read) begin
			data_out <= mem[rd_pointer[3:0]];
			rd_pointer <= rd_pointer + 1;
		end
	end
end
endmodule