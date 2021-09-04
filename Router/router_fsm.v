module router_fsm(input clock, resetn, pkt_valid, parity_done, soft_reset_0, soft_reset_1, soft_reset_2,
                        fifo_full, low_pkt_valid, fifo_empty_0, fifo_empty_1, fifo_empty_2,
                  input [1:0] data_in,
                  output busy, detect_add, ld_state, laf_state, full_state, write_enb_reg, rst_int_reg, lfd_state);
parameter Decode_Address = 3'b000, 
          Load_First_Data = 3'b001,
          Wait_Till_Empty = 3'b010,
          Load_Data = 3'b011,
          Check_Parity_Error = 3'b100,
          Load_Parity = 3'b101,
          Fifo_Full_State = 3'b110,
          Load_After_Full = 3'b111;
reg [2:0] state, next_state;

always @(posedge clock) begin
    if (!resetn) state <= Decode_Address;
    else if((soft_reset_0 && (data_in[1:0] == 0)) | (soft_reset_1 && (data_in[1:0] == 1)) | (soft_reset_2 && (data_in[1:0] == 2))) state <= Decode_Address;
    else state <= next_state; 
end


always @(*) begin

    case(state)
    
    Decode_Address : begin //1st case
        if(pkt_valid & (data_in[1:0] == 0 & fifo_empty_0 | data_in[1:0] == 1 & fifo_empty_1 | data_in[1:0] == 2 & fifo_empty_2))
        begin
            next_state = Load_First_Data;
        end
        else if(pkt_valid & (data_in[1:0] == 0 & !fifo_empty_0 | data_in[1:0] == 1 & !fifo_empty_1 | data_in[1:0] == 2 & !fifo_empty_2))
        begin
            next_state = Wait_Till_Empty;
        end
        else next_state = Decode_Address;
    end

    Load_First_Data : next_state = Load_Data; //2nd case

    Wait_Till_Empty : begin //3rd case
        if( (fifo_empty_0 && (data_in[1:0] == 0)) || (fifo_empty_1 && (data_in[1:0] == 1)) || (fifo_empty_2 && (data_in[1:0] == 2)) ) begin
            next_state = Load_First_Data;
        end
        else next_state = Wait_Till_Empty;
    end

    Load_Data : begin //4th case
        if(fifo_full) next_state = Fifo_Full_State;
        else if (!fifo_full & !pkt_valid) next_state = Load_Parity;
        else next_state = Load_Data;
    end

    Fifo_Full_State : begin //5th case
        if(!fifo_full) next_state = Load_After_Full;
        else next_state = Fifo_Full_State;
    end

    Load_Parity : next_state = Check_Parity_Error; //6th case

    Check_Parity_Error : begin //7th case
        if(fifo_full) next_state= Fifo_Full_State;
        else next_state = Decode_Address;
    end

    Load_After_Full : begin //8th case
        if (parity_done) next_state = Decode_Address;
        else if(low_pkt_valid) next_state = Load_Parity;
        else next_state = Load_Data;
    end
    endcase
end


assign detect_add = (state == Decode_Address);
assign lfd_state = (state == Load_First_Data);
assign busy = (state == Load_First_Data) || (state == Load_Parity) || (state == Fifo_Full_State) || (state == Load_After_Full) || (state == Wait_Till_Empty) || (state == Check_Parity_Error);
assign ld_state = (state == Load_Data)||(state == Load_Parity) ;
assign write_enb_reg = (state == Load_First_Data)|(state == Load_Data)||(state == Load_Parity);
assign full_state = (state == Fifo_Full_State);
assign laf_state = (state == Load_After_Full);  
assign rst_int_reg = (state == Check_Parity_Error);

endmodule