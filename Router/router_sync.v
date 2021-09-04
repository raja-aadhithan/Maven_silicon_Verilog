module router_sync(input detect_add, write_enb_reg, clock, resetn, 
                         read_enb_0, read_enb_1, read_enb_2,
                         empty_0, empty_1, empty_2, 
                         full_0, full_1, full_2, 
                   input [1:0] data_in,
                   output reg vld_out_0, vld_out_1, vld_out_2,
                   output reg soft_reset_0, soft_reset_1, soft_reset_2, 
                   output reg fifo_full,
                   output reg [2:0] write_enb);

reg [1:0] q;
reg [4:0] count0,count1,count2;

always@(*)begin

    if(detect_add) q<= data_in;
    else q <= q;
    
    vld_out_0 <= !empty_0;
    vld_out_1 <= !empty_1;
    vld_out_2 <= !empty_2;

    case(q)
    2'b00 : begin
            fifo_full = full_0;
            write_enb = {2'b00, write_enb_reg};
            end 
   
    2'b01 : begin
            fifo_full = full_1;
            write_enb = {1'b0, write_enb_reg,1'b0};
            end
    
    2'b10 : begin
            fifo_full = full_2;
            write_enb = {write_enb_reg, 2'b00};
            end

    default : begin
                fifo_full = 0;
                write_enb = 3'd0;
    end
    endcase
end

always@(posedge clock) begin

    if(!resetn)begin
        count0<=5'd0;
        count1<=5'd0;
        count2<=5'd0;
    end


    if (vld_out_0) begin
            if (!read_enb_0) begin
              if (count0 == 5'b11101)begin
                    soft_reset_0 <= 1'b1;
                    count0 <= 5'd0;
                end
                else begin
                    soft_reset_0 <= 1'b0;
                    count0 <= count0 + 1'b1;
                end
            end
    end

    if (vld_out_1) begin
            if (!read_enb_1) begin
              if (count1 == 5'b11101)begin
                    soft_reset_1 <= 1'b1;
                    count1 <= 5'd0;
                end
                else begin
                    soft_reset_1 <= 1'b0;
                    count1 <= count1 + 1'b1;
                end
            end
    end

    if (vld_out_2) begin
            if (!read_enb_2) begin
              if (count2 == 5'b11101)begin
                    soft_reset_2 <= 1'b1;
                    count2 <= 5'd0;
                end
                else begin
                    soft_reset_2 <= 1'b0;
                    count2 <= count2 + 1'b1;
                end
            end
    end

end

endmodule