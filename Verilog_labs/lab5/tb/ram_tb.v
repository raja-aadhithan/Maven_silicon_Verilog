/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   ram_tb.v   

Description :      Testbench for Single Port RAM


Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module ram_tb;
   wire [7:0] data;
   reg  [3:0] addr;
   reg  we,enable;
   reg  [7:0] tempd;

   integer l;

   //Step1 : Instantiate the RAM module and connect the ports
   ram dut(we,enable,addr,data); 
   //Understand how the wire data acts like an input during write operation
   assign data=(we && !enable) ? tempd : 8'hzz;

    //Tasks for Initialising the inputs
   task initialize();
      begin
	 we=1'b0; enable=1'b0; tempd=8'h00;
      end
   endtask

   /*Step2 : Write a task named "stimulus" to assign data into
   "addr" and "tempd" inputs through i and j variables*/
   task stimulus(input [3:0]i,
		 input [7:0]j);
      begin
	 addr = i;
	 tempd = j;
      end
   endtask

   //Understand the various tasks used in this testbench
   task write();
      begin
	 we=1'b1;
	 enable=1'b0;
      end
   endtask

   task read();
      begin
	 we=1'b0;
	 enable=1'b1;
      end
   endtask

   task delay;
      begin
	 #10;
      end
   endtask
		
   //Process to generate stimulus using for loop
   initial
      begin
         $monitor("@time: %3d enable is %b, Write is %b address is %b, data is %b",$time,enable ,we, addr,data);
	 initialize;
	 delay;
	 write;
	 for(l=0;l<16;l=l+1)
	    begin
	       stimulus(l,l);
	       delay;
	    end
	 initialize;
	 delay;
	 read;
	 for(l=0;l<16;l=l+1)
	    begin
	       stimulus(l,l);
	       delay;
	    end
	 delay;
	 $finish;
      end
			
   

endmodule
