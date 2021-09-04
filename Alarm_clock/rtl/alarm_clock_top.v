module alarm_clock_top(input clock,reset,time_button,alarm_button,fast_watch,input [3:0] key,
		       			 output [7:0] ms_hour,ls_hour,ms_minute,ls_minute,output alarm_sound);
//Define the Interconnecting internal wires
wire reset_count, one_minute, one_second, load_new_c, show_current_time, show_a, load_new_a, shift;
wire [3:0] alarm_time_ms_hr, alarm_time_ls_hr, alarm_time_ms_min, alarm_time_ls_min,
			current_time_ms_hr, current_time_ms_min, current_time_ls_hr, current_time_ls_min,
			key_buffer_ls_min, key_buffer_ms_min, key_buffer_ls_hr, key_buffer_ms_hr; 


// Instantiate the timing generator module
aclk_timegen timegen(clock,reset,reset_count,fast_watch,one_minute,one_second);

// Instantiate the counter module

aclk_counter counter(clock, reset, one_minute, load_new_c,
				key_buffer_ms_hr, key_buffer_ms_min, key_buffer_ls_hr, key_buffer_ls_min,
		        current_time_ms_hr, current_time_ms_min, current_time_ls_hr, current_time_ls_min);

// Instantiate the alarm register module
aclk_areg alrm_reg(load_new_a, clock, reset,
                  key_buffer_ms_hr, key_buffer_ls_hr, key_buffer_ms_min, key_buffer_ls_min,
                  alarm_time_ms_hr, alarm_time_ls_hr, alarm_time_ms_min, alarm_time_ls_min );

// Instantiate the key register module
aclk_keyreg key_reg(reset,clock,shift, key,
                   key_buffer_ls_min, key_buffer_ms_min, key_buffer_ls_hr, key_buffer_ms_hr); 

// Instantiate the FSM controller
aclk_controller fsm(clock, reset, one_second, alarm_button, time_button,  key,
                        reset_count, load_new_c, show_current_time, show_a, load_new_a, shift);
// Instantiate the lcd_driver_4 module
aclk_lcd_display display(alarm_time_ms_hr, alarm_time_ls_hr, alarm_time_ms_min, alarm_time_ls_min,
                        current_time_ms_hr, current_time_ls_hr, current_time_ms_min, current_time_ls_min,
                        key_buffer_ms_hr, key_buffer_ls_hr, key_buffer_ms_min, key_buffer_ls_min,

                       show_a, show_current_time,

                      ms_hour,ls_hour,ms_minute,ls_minute, //done

                       alarm_sound); 

endmodule