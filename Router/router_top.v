module router_top(input clock, resetn, read_enb_0, read_enb_1, read_enb_2, pkt_valid,
                  input [7:0] data_in, output [7:0] data_out_0, data_out_1, data_out_2,
                  output valid_out_0, valid_out_1, valid_out_2, error, busy);

wire parity_done,detect_add;
wire ld_state, laf_state, full_state, write_enb_reg, rst_int_reg, lfd_state;
wire [2:0] fifo_empty, full,w_enb, write_enb, soft_reset_temp;
wire fifo_full,low_pkt_valid,soft_reset_0,soft_reset_1,soft_reset_2;
wire [7:0] dout;

wire read_enb_temp[2:0];
wire [7:0] data_out_temp[2:0];
assign soft_reset_temp[0] = soft_reset_0;
assign soft_reset_temp[1] = soft_reset_2;
assign soft_reset_temp[2] = soft_reset_1;
assign read_enb_temp[0] = read_enb_0;
assign read_enb_temp[1] = read_enb_1;
assign read_enb_temp[2] = read_enb_2;
assign data_out_0 = data_out_temp[0];
assign data_out_1 = data_out_temp[1];
assign data_out_2 = data_out_temp[2];


router_fsm dut1(.clock(clock),
                .resetn(resetn),
                .pkt_valid(pkt_valid),
                .parity_done(parity_done),
                .soft_reset_0(soft_reset_0),
                .soft_reset_1(soft_reset_1),
                .soft_reset_2(soft_reset_2),
                .fifo_full(fifo_full),
                .low_pkt_valid(low_pkt_valid),
                .fifo_empty_0(fifo_empty[0]),
                .fifo_empty_1(fifo_empty[1]),
                .fifo_empty_2(fifo_empty[2]),
                .data_in(data_in[1:0]),
                .busy(busy),
                .detect_add(detect_add),
                .ld_state(ld_state),
                .laf_state(laf_state),
                .full_state(full_state),
                .write_enb_reg(write_enb_reg),
                .rst_int_reg(rst_int_reg),
                .lfd_state(lfd_state));

router_reg dut2(.clock(clock),
                .resetn(resetn),
                .pkt_valid(pkt_valid),
                .fifo_full(fifo_full),
                .detect_add(detect_add),
                .ld_state(ld_state),
                .laf_state(laf_state),
                .full_state(full_state),
                .rst_int_reg(rst_int_reg),
                .lfd_state(lfd_state),
                .parity_done(parity_done),
                .low_pkt_valid(low_pkt_valid),
                .err(error),
                .data_in(data_in),
                .dout(dout));

router_sync dut3(.clock(clock),
                .resetn(resetn),
                .detect_add(detect_add),
                .read_enb_0(read_enb_0),
                .read_enb_1(read_enb_1),
                .read_enb_2(read_enb_2),
                .write_enb_reg(write_enb_reg),
                .empty_0(fifo_empty[0]),
                .empty_1(fifo_empty[1]),
                .empty_2(fifo_empty[2]),
                .full_0(full[0]),
                .full_1(full[1]),
                .full_2(full[2]),
                .data_in(data_in[1:0]),
                .vld_out_0(valid_out_0),
                .vld_out_1(valid_out_1),
                .vld_out_2(valid_out_2),
                .soft_reset_0(soft_reset_0),
                .soft_reset_1(soft_reset_1),
                .soft_reset_2(soft_reset_2),
                .fifo_full(fifo_full),
                .write_enb(w_enb));

genvar x;
generate for (x= 0 ; x<3 ; x = x+1)

begin:fifo
	router_fifo f(.clock(clock),
                  .resetn(resetn), 
                  .soft_reset(soft_reset_temp[x]),
	              .lfd_state(lfd_state),
                  .write_enb(w_enb[x]),
                  .data_in(dout), 
                  .read_enb(read_enb_temp[x]),
	              .full(full[x]), 
                  .empty(fifo_empty[x]), 
                  .data_out(data_out_temp[x]));
end
endgenerate	

endmodule