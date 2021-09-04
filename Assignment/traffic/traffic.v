module traffic(input clk,rst);
reg [1:0] state,next_state;
parameter north = 2'd0, south = 2'd1, east = 2'd2, west = 2'd3;
reg ng, ny, sg, sy, eg, ey, wg, wy;
reg [3:0] q;

always@(*)begin
    case(state)
    north : next_state = south;
    south : next_state = east;
    east  : next_state = west;
    west  : next_state = north;
    endcase
end

task eight();
q = 0;
always@(posedge clk)begin
    
    q <= q + 1;
end

always@(posedge clk)begin
    if(rst) state <= north;
    else begin
        if (state == north) begin
            ng <= 1'b1;
            repeat(8) begin @(posedge clk); end
            ny <= 1'b1;
            ng <= 1'b0;
            repeat(4) @(posedge clk);
            ny <= 1'b0;
        end
        else if (state == south) begin
            sg <= 1'b1;
            repeat(8) @(posedge clk);
            sy <= 1'b1;
            sg <= 1'b0;
            repeat(4) @(posedge clk);
            sy <= 1'b0;
        end
        else if (state == west) begin
            wg <= 1'b1;
            repeat(8) @(posedge clk);
            wy <= 1'b1;
            wg <= 1'b0;
            repeat(4) @(posedge clk);
            wy <= 1'b0;
        end
        else if (state == east) begin
            eg <= 1'b1;
            repeat(8) @(posedge clk);
            ey <= 1'b1;
            eg <= 1'b0;
            repeat(4) @(posedge clk);
            ey <= 1'b0;
        end
        state <= next_state;
    end
end 
endmodule