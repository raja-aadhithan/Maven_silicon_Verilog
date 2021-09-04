module router_fsm_tb();
reg clock, resetn, pkt_valid, parity_done, soft_reset_0, soft_reset_1, soft_reset_2,
    fifo_full, low_pkt_valid, fifo_empty_0, fifo_empty_1, fifo_empty_2;
reg [1:0] data_in;
wire busy, detect_add, ld_state, laf_state, full_state, write_enb_reg, rst_int_reg, lfd_state;

router_fsm dut(clock, resetn, pkt_valid, parity_done, soft_reset_0, soft_reset_1, soft_reset_2,
    fifo_full, low_pkt_valid, fifo_empty_0, fifo_empty_1, fifo_empty_2,data_in,
    busy, detect_add, ld_state, laf_state, full_state, write_enb_reg, rst_int_reg, lfd_state);

initial begin
    clock = 1'b1;
    forever #5 clock = !clock;
end

task ts1();
    begin
        resetn = 0;
        @(negedge clock);
        resetn = 1;
        @(negedge clock);
        pkt_valid = 1'b1;
        data_in = 2'b0;
        fifo_empty_0 = 1'b1;
        @(negedge clock);
        fifo_full = 1'b0;
        pkt_valid = 1'b0;
    end
endtask

task ts2();
begin
    pkt_valid = 1'b1;
    data_in = 2'b10;
    fifo_empty_2 = 1'b1;
    repeat(3)
    @(negedge clock);
    fifo_full = 1'b1;
    @(negedge clock);
    fifo_full = 1'b0;
    @(negedge clock);
    parity_done = 1'b0;
    low_pkt_valid = 1'b1;
    @(negedge clock);
    fifo_full = 1'b0;
    pkt_valid = 1'b0;
end
endtask

task ts3();
begin
    pkt_valid = 1'b1;
    data_in = 2'b10;
    fifo_empty_2 = 1'b1;
    repeat(3)
    @(negedge clock);
    fifo_full = 1'b1;
    @(negedge clock);
    fifo_full = 1'b0;
    @(negedge clock);
    parity_done = 1'b0;
    low_pkt_valid = 1'b0;
    @(negedge clock);
    fifo_full = 1'b0;
    pkt_valid = 1'b0;
end
endtask

task ts4();
begin
    pkt_valid = 1'b1;
    data_in = 2'b0;
    fifo_empty_0 = 1'b0;
    #10;
    fifo_empty_0 = 1'b1;
    @(negedge clock);
    fifo_full = 1'b0;
    pkt_valid = 1'b0;
    @(negedge clock);
    fifo_full = 1'b1;
    @(negedge clock);
    fifo_full = 1'b0;
    parity_done = 1'b1;
end
endtask


initial begin

    ts1();
    #100;
    ts2();
    #100;
    ts3();
    #100;
    ts4();
    #300;
    $finish;
end
endmodule