module router_fifo(input clock, resetn, write_enb, read_enb, soft_reset, lfd_state,
                   input [7:0] data_in, output full, empty, output [7:0] data_out);

reg [8:0] mem [0:15];
reg [3:0] rd_pointer, wr_pointer;
reg [8:0] packet_out;
wire [8:0]packet;
reg [5:0] length;
reg [4:0] status_count = 0;

assign empty = (status_count == 0 ) ? 1'b1 : 1'b0 ;
assign full = (status_count == 5'd16) ? 1'b1 : 1'b0 ;
assign packet[7:0] = data_in[7:0];
assign packet[8] = lfd_state;
assign data_out = resetn ?  packet_out[7:0] : 8'd0;



always@(posedge clock) begin
    if(full == 1'b0 && write_enb & empty == 1'b0 && read_enb) status_count <= status_count;
    else if (full == 1'b0 && write_enb) status_count <= status_count + 1'b1;
    else if(empty == 1'b0 && read_enb ) status_count <= status_count - 1'b1;
    else status_count <= status_count;
end



//write block:
always@(posedge clock) begin

    if(!resetn || soft_reset) begin //reset
        wr_pointer <= 4'd0;
    end
    else if(full == 1'b0 && write_enb) begin //only write
            mem[wr_pointer[3:0]] <= packet;
            wr_pointer <= wr_pointer + 1'b1;
    end
end



//read block:
always@(posedge clock) begin

    if(!resetn || soft_reset) begin //reset
        rd_pointer <= 4'd0;
        packet_out <= 8'dz;
    end
    else begin 
        if(empty == 1'b0 && read_enb ) begin //only write
                packet_out <= mem[rd_pointer[3:0]];
                rd_pointer <= rd_pointer + 1'b1;
        end
        if (length == 0 && !mem[rd_pointer[3:0]][8]) packet_out <= 8'bz;
    end
end




always@(posedge clock)begin
    if (!resetn || soft_reset) begin
        length <= 0;
    end
    else if(empty == 1'b0 && read_enb ) begin

        if(mem[rd_pointer[3:0]][8])begin
                length <= mem[rd_pointer[3:0]][7:2] + 1'b1;
        end

        else if (length != 0)  begin
                length <= length - 1'b1;
        end
    end
end

endmodule

// Code your design here
module counter(output reg [3:0] q, input clk,reset,up_down);
  always @(posedge clk) begin
    if(reset==1)
      q<=0;
    else begin
      if(up_down==1) q <= q+1;
      else if(up_down==0) q <= q-1;
    end
  end
endmodule