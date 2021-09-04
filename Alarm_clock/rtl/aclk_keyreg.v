module aclk_keyreg(input reset,clock,shift, input[3:0]key,
                   output reg [3:0] key_buffer_ls_min, key_buffer_ms_min, key_buffer_ls_hr, key_buffer_ms_hr);
// This procedure stores the last 4 keys pressed. The FSM block
// detects the new key value and triggers the shift pulse to shift
// in the new key value.
///////////////////////////////////////////////////////////////////
always @(posedge clock or posedge reset) begin
  // For asynchronous reset, reset the key_buffer output register to 1'b0
    if(reset) begin
        key_buffer_ls_min <= 4'b0;
        key_buffer_ms_min <= 4'b0;
        key_buffer_ls_hr <= 4'b0;
        key_buffer_ms_hr <= 4'b0;
    end
  // Else if there is a shift, perform left shift from LS_MIN to MS_HR
    else if(shift) begin
        key_buffer_ls_min <= key;
        key_buffer_ms_min <= key_buffer_ls_min;
        key_buffer_ls_hr <= key_buffer_ms_min;
        key_buffer_ms_hr <= key_buffer_ls_hr;
    end
end
endmodule