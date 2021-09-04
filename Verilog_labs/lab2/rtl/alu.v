/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 

All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   alu.v   

Description :      Arithmetic Logic Unit Design

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module alu(input [7:0]a,b,
           input [3:0]command_in,
	   input oe,
	   output [15:0]d_out);

   parameter 	 ADD  = 4'b0000, // Add two 8 bit numbers a and b.
		 INC  = 4'b0001, // Increment a by 1. 
		 SUB  = 4'b0010, // Subtracts b from a.
		 DEC  = 4'b0011, // Decrement a by 1.
		 MUL  = 4'b0100, // Multiply 4 bit numbers a and b.( note : 4 bits ? )
		 DIV  = 4'b0101, // Divide a by b.
		 SHL  = 4'b0110, // Shift a to left side by 1 bit.
		 SHR  = 4'b0111, // Shift a to right by 1 bit.
		 AND  = 4'b1000, // Logical AND operation
	     OR   = 4'b1001, // Logical OR operation
		 INV  = 4'b1010, // Logical Negation
		 NAND = 4'b1011, // Bitwise NAND
		 NOR  = 4'b1100, // Bitwise NOR
		 XOR  = 4'b1101, // Bitwise XOR
		 XNOR = 4'b1110, // Bitwise XNOR
		 BUF  = 4'b1111; // BUF

   //Internal variable used during ALU operation
   reg  [15:0]out;


   /*Step1 : Write down the functionality of ALU based on the commands given above.
	        *Use arithmetic and logical operators* */
   always@(command_in)
      begin
	 case(command_in)
            ADD : out <= a+b;
			INC : out <= a+1;
			SUB : out <= b-a;
			DEC : out <= a-1;
			MUL : out <= a*b;
			DIV : out <= a/b;
			SHL : out <= a<<1;
			SHR : out <= a>>1;
			AND : out <= a&&b;
			OR  : out <= a||b;
			INV : out <= !a;
			NAND: out <= ~(a&b);
			NOR : out <= ~(a|b);
			XOR : out <= a^b;
			XNOR: out <= ~(a^b);
			BUF : out <= a;

	 endcase
      end

   //Understand the tri-state logic for actual output
   assign d_out = (oe) ? out : 16'hzzzz;
		
endmodule
