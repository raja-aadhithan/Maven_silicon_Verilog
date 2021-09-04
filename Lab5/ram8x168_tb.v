module ram8x16_tb();
reg wr,rd;
reg [2:0] addr_in,addr_out;
reg [15:0]data_wr;
wire [15:0] data_rd;
integer i;
aram8x16 dut(wr,rd,addr_in,addr_out,data_wr,data_rd);
initial begin
    wr = 1;
    rd = 0;
    $monitor("@time:%3d-wr:%b,%b,%b-rd:%b,%b,%b",$time,wr,addr_in,data_wr,rd,addr_out,data_rd);
    for (i=0;i<8;i=i+1)begin
        addr_in = i[2:0];
        data_wr = 2*i+1;
        #15;
    end
    rd = 1;
    addr_out = 7;
    #10;
    addr_in = 3'd2;
    data_wr = 16'd43;
    addr_out = 3'd5;
    #10;
    addr_in = 3'd6;
    data_wr = 16'd31;
    addr_out = 3'd7;
    #10;
    addr_in = 3'd4;
    data_wr = 16'd47;
    addr_out = 3'd1;
    #10;
    addr_in = 3'd1;
    data_wr = 16'd114;
    addr_out = 3'd1;
    #10;
    
$finish;
end 
endmodule