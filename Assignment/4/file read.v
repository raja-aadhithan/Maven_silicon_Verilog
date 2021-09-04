module tb();
reg clk;
reg [7:0] array [7:0];
integer i;
initial begin
    $readmemb("/home/user1/sim/file.txt",array);
    for(i=0;i<8;i=i+1)
    begin
        @(negedge clk);
        data_in = array[i];
    end
end