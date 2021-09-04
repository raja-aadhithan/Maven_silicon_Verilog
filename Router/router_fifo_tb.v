module router_fifo_tb();

reg clock, resetn, write_enb, read_enb, soft_reset, lfd_state;
reg [7:0] data_in;
wire full, empty; 
wire [7:0] data_out;

router_fifo DUT(clock, resetn, write_enb, read_enb, soft_reset, lfd_state, data_in, full, empty, data_out);

initial begin
    clock = 1'b1;
    forever #5 clock = !clock;
end

task write(input [7:0]data);
    begin
        lfd_state = 0;
        write_enb = 1;
        data_in = data;
        #10;
        write_enb = 0;
    end
endtask

task header(input [5:0]data,input [1:0]set);
    begin
        write_enb = 1;
        lfd_state = 1;
        data_in = {data,set};
        #10;
        write_enb = 0;
    end
endtask

task read();
    begin
        read_enb = 1;
        #10;
        read_enb = 0;
    end
endtask

task readandwrite(input [7:0]data);
begin
        lfd_state = 0;
        write_enb = 1;
        data_in = data;
        read_enb = 1;
        #10;
        read_enb = 0;
        write_enb = 0;
    end
endtask


initial begin
    $monitor("@time: %t, data_in: %h, data_out: %h, lfd: %b, full: %b, empty: %b",$time, data_in, data_out, lfd_state, full, empty);
    resetn = 1'b0;
    repeat(3)
    @(negedge clock);
    resetn = 1'b1;

    header(6'd14,{$random}%3);// 6'dx denotes the paylength, %3 selects the fifo from 0 to 2
    repeat(15) // payload length is denoted here
    write({$random}%256);
    repeat(15)
    read();
    repeat(3)
    readandwrite({$random}%256);
    repeat(15)
    read();
    soft_reset = 1'b1;
    #20;
    soft_reset = 1'b0;
    #20;
    header(6'd4,{$random}%3);
    repeat(4) // payload length is denoted here
    write({$random}%256);
    repeat(15)
    read();
    $finish;
end
endmodule