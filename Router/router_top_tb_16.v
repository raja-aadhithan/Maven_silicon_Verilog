module router_top_tb_16();
reg clock, resetn, read_enb_0, read_enb_1, read_enb_2, pkt_valid;
reg [7:0] data_in; 
wire [7:0] data_out_0, data_out_1, data_out_2;
wire valid_out_0, valid_out_1, valid_out_2, error, busy;
integer i;

router_top dut(clock, resetn, read_enb_0, read_enb_1, read_enb_2, pkt_valid,data_in,
               data_out_0, data_out_1, data_out_2, valid_out_0, valid_out_1, valid_out_2, error, busy);

initial begin 
    clock = 1;
    forever #5 clock = !clock;
end

task reset();
begin
    @(negedge clock);
    resetn =1'b0;
    #10;
    resetn = 1'b1;
end
endtask

task pkt16();
reg [7:0] parity;
reg [5:0] payload_len;
begin
    wait(!busy);
    begin
        @(negedge clock);
        payload_len = 6'b010000;
        pkt_valid = 1'b1;
        data_in = {payload_len,2'b10};
        parity = data_in;
    end
    for(i=0 ; i < payload_len; i=i+1 )
    begin
        wait(!busy)
        @(negedge clock)
        data_in = i*2;
        parity = parity^data_in;
    end
    wait(!busy);
    @(negedge clock)
    pkt_valid = 1'b0;
    data_in = parity;
    repeat(30)
    @(negedge clock);
    data_in = 8'bx;
    read_enb_2 = 1'b1;

end
endtask



task pkt14();
reg [7:0] parity;
reg [5:0] payload_len;
begin
    wait(!busy);
    begin
        @(negedge clock);
        payload_len = 6'b001110;
        pkt_valid = 1'b1;
        data_in = {payload_len,2'b10};
        parity = data_in;
    end
    for(i=0 ; i < payload_len; i=i+1 )
    begin
        wait(!busy)
        @(negedge clock)
        data_in = i*2;
        parity = parity^data_in;
    end
    wait(!busy);
    @(negedge clock)
    pkt_valid = 1'b0;
    data_in = parity;
    repeat(30)
    @(negedge clock);
    data_in = 8'bx;
    read_enb_0 = 1'b1;
end
endtask

task pkt17();
reg [7:0] parity;
reg [5:0] payload_len;
begin
    wait(!busy);
    begin
        @(negedge clock);
        payload_len = 6'b010001;
        pkt_valid = 1'b1;
        data_in = {payload_len,2'b10};
        parity = data_in;
    end
    for(i=0 ; i < payload_len; i=i+1 )
    begin
        wait(!busy)
        @(negedge clock)
        data_in = i*2;
        parity = parity^data_in;
    end
    wait(!busy);
    @(negedge clock)
    pkt_valid = 1'b0;
    data_in = parity;
    repeat(30)
    @(negedge clock);
    data_in = 8'bx;
    read_enb_1 = 1'b1;
end
endtask

initial begin
    reset;
    pkt16;
    pkt14;
    pkt17;
    #1000;
    $finish;
end
endmodule