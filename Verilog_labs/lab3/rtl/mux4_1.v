/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   mux4_1.v   

Description :      Mux 4:1 design

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/
 
module mux4_1(input [3:0] data_in, [1:0]sel_in, output y_out);
reg x;	 
   //Step2 : Write the MUX behaviour as a parallel logic using "case" 
always@(*) begin
   case(sel_in)
   2'b00 : x <= data_in[0];
   2'b01 : x <= data_in[1];
   2'b10 : x <= data_in[2];
   2'b11 : x <= data_in[3];
   endcase
end
assign y_out = x;
endmodule
		
