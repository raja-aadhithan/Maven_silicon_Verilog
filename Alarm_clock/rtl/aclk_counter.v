module aclk_counter (input clk,reset,one_minute,load_new_c,
                input[3:0] new_current_time_ms_hr,new_current_time_ms_min,new_current_time_ls_hr,new_current_time_ls_min,
		        output reg [3:0] current_time_ms_hr,current_time_ms_min,current_time_ls_hr,current_time_ls_min);

// Lodable Binary up synchronous Counter logic

// Write an always block with asynchronous reset
always@( posedge clk or posedge reset)                                         
 begin              
    // Check for reset signal and upon reset load the current_time register with default value (1'b0)                                                                                                       
    if(reset)
    begin
        current_time_ms_hr <= 4'd0;
        current_time_ls_hr <= 4'd0;
        current_time_ms_min <= 4'd0;
        current_time_ls_min <= 4'd0;
    end
    // Else if there is no reset, then check for load_new_c signal and load new_current_time to current_time register
    else if (load_new_c) begin
         current_time_ms_hr <= new_current_time_ms_hr;
        current_time_ls_hr <= new_current_time_ls_hr;
        current_time_ms_min <= new_current_time_ms_min;
        current_time_ls_min <= new_current_time_ls_min;
    end                                                                //              0       0       0       9  -> 00:10
    // Else if there is no load_new_c signal, then check for one_minute signal and implement the counting algorithm
    else if(one_minute) begin
        if(current_time_ms_hr == 4'd2 && current_time_ls_hr == 4'd3 && current_time_ms_min == 4'd5 && current_time_ls_min == 4'd9)
        begin
        current_time_ms_hr <= 4'd0;
        current_time_ls_hr <= 4'd0;
        current_time_ms_min <= 4'd0;
        current_time_ls_min <= 4'd0; 
        end
        else if (current_time_ls_hr == 4'd9 && current_time_ms_min == 4'd5 && current_time_ls_min == 4'd9)
        begin
        current_time_ms_hr <= current_time_ms_hr + 1'b1;
        current_time_ls_hr <= 4'd0;
        current_time_ms_min <= 4'd0;
        current_time_ls_min <= 4'd0;
        end
        else if(current_time_ms_min == 4'd5 && current_time_ls_min == 4'd9)
        begin
        current_time_ls_hr <= current_time_ls_hr + 1'b1;
        current_time_ms_min <= 4'd0;
        current_time_ls_min <= 4'd0;
        end
        else if (current_time_ls_min == 4'd9) 
        begin
            current_time_ms_min <= current_time_ms_min + 1'b1;
            current_time_ls_min <= 4'd0;
        end
        else current_time_ls_min <= current_time_ls_min + 1'b1;

    end
 end

endmodule