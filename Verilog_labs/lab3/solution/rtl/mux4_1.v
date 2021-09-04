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
 
module mux4_1(data_in,
	      sel_in,
	      y_out);

				 

   //Step1 : Define the port directions with proper size & datatypes 
   input [3:0]data_in;
   input [1:0]sel_in;
   output reg y_out;

   //Step2 : Write the MUX behaviour as a parallel logic using "case" 
   always@(data_in,sel_in)
      begin
	 case(sel_in)
	    2'd0   : y_out = data_in[0];
	    2'd1   : y_out = data_in[1];
	    2'd2   : y_out = data_in[2];
	    2'd3   : y_out = data_in[3];
	    default: y_out = 0;
         endcase
      end 
					

endmodule
		
