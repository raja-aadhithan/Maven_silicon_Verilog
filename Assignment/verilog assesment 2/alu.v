module alu(input [63:0] ld,input [1:0]shift, input reset, clk, load, output reg [63:0]q );
parameter leftb = 2'b00, rightb = 2'b01, leftBy = 2'b10, rightBy = 2'b11;

always@(posedge clk) begin
    if (reset) begin
        q <= 64'd0;
    end
    else if(load) begin
        q <= ld;
    end
    else begin
        case (shift)
        leftb : q[63:0] <= {q[62:0], 1'b0};
        rightb: q[63:0] <= {1'b0,q[63:1]};
        leftBy : q[63:0] <= {q[55:0], 8'b0};
        rightBy: q[63:0] <= {8'b0,q[63:8]};
        default: q[63:0] <= q[63:0];
        endcase
    end
end
endmodule