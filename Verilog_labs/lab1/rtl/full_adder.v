/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   full_adder.v   

Description :      One bit Full adder Design

Author Name :      Susmita

Version     : 	   1.0
*********************************************************************************************/

module full_adder( input a_in,
                  b_in,
		  c_in,
		  output sum_out,
		  carry_out);

wire w1,w2,w3;

half_adder ha1(.a(a_in), .b(b_in), .sum(w1), .carry(w2));
half_adder ha2(.a(c_in), .b(w1), .sum(sum_out), .carry(w3));
or or1(carry_out, w2,w3);



endmodule

