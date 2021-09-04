module ram168_tb();
reg clk,wr,rd;
reg [3:0] addr_in,addr_out;
reg [7:0]data_wr;
wire [7:0] data_rd;
integer i,j;

ram168 dut(clk,wr,rd,addr_in,addr_out,data_wr,data_rd);


parameter thold = 5 , tsetup = 5, clock = 100;

initial begin
    clk =1;
    forever #(clock/2) clk = !clk;
end

task check();
begin
    @(posedge clk);
    rd = 0;
    wr = 1;
    i = {$random}%16;
    addr_in = i;
    j = {$random}%256;
    data_wr = j;
    @(posedge clk);
    rd = 1;
    wr = 0;
    addr_out = i;
    @(posedge clk);
    #thold;
    if(data_rd !== j)begin
        $display("read not working");
        $stop;
    end
    $display("read is working");

end
endtask

initial begin
    check;
$finish;
end 
endmodule