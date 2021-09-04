module aclk_lcd_driver (input [3:0] alarm_time,key,current_time,input show_alarm,show_new_time,
                            output reg [7:0] display_time,output reg sound_alarm);

reg [3:0]display_value ;//Defining the internal signals  

//Define the Parameter constants to represent LCD numbers
parameter ZERO = 8'h30,ONE = 8'h31,TWO = 8'h32, THREE = 8'h33, FOUR = 8'h34, FIVE = 8'h35,
          SIX = 8'h36, SEVEN = 8'h37, EIGHT = 8'h38, NINE = 8'h39, ERROR  = 8'h3A;

always @ (alarm_time or current_time or show_alarm or show_new_time or key) begin
    
    case({show_alarm,show_new_time})
        2'b00 : display_value = current_time;
        2'b01 : display_value = key;
        2'b10 : display_value = alarm_time;
        default: display_value = display_value;
    endcase
    
    //Generates sound_alarm logic i,e when current_time is equal to alarm_time
    sound_alarm <= (current_time == alarm_time);

  end

//Decoder logic 
always @ (display_value)
  begin
    // For number stored in display_value register, load display_time register with LCD equivalent
    case (display_value)
        4'd0 : display_time = ZERO;
        4'd1 : display_time = ONE;
        4'd2 : display_time = TWO;
        4'd3 : display_time = THREE;
        4'd4 : display_time = FOUR;
        4'd5 : display_time = FIVE;
        4'd6 : display_time = SIX;
        4'd7 : display_time = SEVEN;
        4'd8 : display_time = EIGHT;
        4'd9 : display_time = NINE;
       default : display_time = ERROR;
    endcase
   end 
endmodule	    