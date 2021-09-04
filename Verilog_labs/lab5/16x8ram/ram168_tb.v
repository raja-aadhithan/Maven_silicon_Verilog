module ram168_tb();
reg clk,wr,rd;
reg [3:0] addr_in,addr_out;
reg [7:0]data_wr;
wire [7:0] data_rd;
integer i;
ram168 dut(clk,wr,rd,addr_in,addr_out,data_wr,data_rd);
initial begin
    clk =1;
    forever #5 clk = !clk;
end
initial begin
    wr = 1;
    rd = 0;
    $monitor("@time:%3d-wr:%b,%b,%b-rd:%b,%b,%b",$time,wr,addr_in,data_wr,rd,addr_out,data_rd);
    for (i=0;i<16;i=i+1)begin
        addr_in = i[3:0];
        data_wr = 2*i+1;
        #15;
    end
    rd = 1;
    addr_out = 14;
    #10;
    addr_in = 4'd2;
    data_wr = 8'd43;
    addr_out = 4'd5;
    #10;
    addr_in = 4'd6;
    data_wr = 8'd31;
    addr_out = 4'd7;
    #10;
    addr_in = 4'd12;
    data_wr = 8'd47;
    addr_out = 4'd14;
    #10;
    addr_in = 4'd1;
    data_wr = 8'd4;
    addr_out = 4'd1;
    #10;
    
$finish;
end 
endmodule