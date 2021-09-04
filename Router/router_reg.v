module router_reg(input clock, resetn, pkt_valid, fifo_full, rst_int_reg, detect_add, 
                        ld_state, laf_state, full_state, lfd_state, 
                  output reg parity_done, low_pkt_valid, err, 
                  input [7:0] data_in, output reg [7:0] dout);
reg [7:0] a,c,d,e;
reg [8:0] b [31:0];
reg [4:0] count_b,count_a ;
always@(posedge clock) begin
    if(!resetn) begin
        dout <= 8'd0;
        parity_done <= 1'b0;
        low_pkt_valid <= 1'b0;
        err <= 1'b0;
        count_b <= 0;
        count_a <= 0;
    end

    else begin
    parity_done <= ((ld_state & !fifo_full & !pkt_valid) | (laf_state & low_pkt_valid & !parity_done)) & !detect_add;
    low_pkt_valid <= (ld_state & !pkt_valid);
        if(pkt_valid) begin
            if(detect_add) begin
                dout <= data_in;
                c <= data_in;
            end
            else if(ld_state||lfd_state) begin
                if(full_state) begin
                    b[count_b] <= data_in;
                    count_b <= count_b + 1;
                end
                else if(!full_state) begin
                    if(laf_state) begin
                        dout <= b[count_a];
                        count_a <= count_a + 1;
                    end
                    else begin
                        c <= c^data_in;
                        dout <= data_in;
                    end
                end 
            end 
        end
        
        else begin
            d <= data_in;
            dout <= data_in;
        end
    end
err <= (c==d) ? 0 : 1 ;
//dout <= resetn ? ( lfd_state ? a : ( laf_state ? b : (ld_state ? (pkt_valid e : dout) ) ) : 8'd0;
end
endmodule