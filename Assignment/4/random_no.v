module random_no();
integer i;
initial begin
    repeat(5)begin
        #10;
        i = (2*({$random}%5))+1'b1;
    end
end
endmodule