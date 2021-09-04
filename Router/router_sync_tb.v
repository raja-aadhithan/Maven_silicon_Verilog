module router_sync_tb();
  reg detect_add, write_enb_reg, clock, resetn, 
      read_enb_0, read_enb_1, read_enb_2,
      empty_0, empty_1, empty_2,   
  	  full_0, full_1, full_2;
  reg [1:0] data_in;
  wire vld_out_0, vld_out_1, vld_out_2,
       soft_reset_0, soft_reset_1, soft_reset_2, 
       fifo_full;
  wire [2:0] write_enb;
  
  router_sync dut(detect_add, write_enb_reg, clock, resetn, 
                  read_enb_0, read_enb_1, read_enb_2,
                  empty_0, empty_1, empty_2, 
                  full_0, full_1, full_2,data_in,vld_out_0, 						  vld_out_1, vld_out_2,
                  soft_reset_0, soft_reset_1, soft_reset_2, 
                  fifo_full,write_enb);
  
  initial begin
    clock = 1'b1;
    forever #5 clock = !clock;
  end
  
  initial begin
    
    $monitor("@%3dns : q = %b, vldout = %b,%b,%b",$time,soft_reset_0,vld_out_0, vld_out_1, vld_out_2);
    resetn = 1'b0;
    #10;
    resetn = 1'b1;

    empty_0 = 1'b1;
    empty_1 = 1'b0;
    empty_2 = 1'b0;
    data_in = 2'b01;

    detect_add = 1'b1;
    #10;
    detect_add = 1'b0;


    full_1 = 0;
    read_enb_1 = 1'b1;
    read_enb_2 = 1'b0;
    write_enb_reg = 1'b1;
    #10;
    full_1 = 1;
    write_enb_reg = 1'b0;
    #3000;

    read_enb_2 = 1'b1;
    detect_add = 1'b1;
    data_in =2'b10;
    #10;
    detect_add = 1'b0;

    full_2 = 0;
    write_enb_reg = 1'b1;
    #30;
    full_2 = 1;
    write_enb_reg = 1'b0;
    #1000;
    $finish;
  end
endmodule