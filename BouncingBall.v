module BouncingBall (
    input wire clk,
    output reg swap,
    output reg [8:0] data,
    output reg [18:0] address
);

reg [2:0] color_r = 3'b000;
reg [2:0] color_g = 3'b000;
reg [2:0] color_b = 3'b000;

reg [9:0] posy = 0;
reg [9:0] posx = 0;
reg [9:0] counter;

always @* begin
    address = (posy * 640) + posx;
end




reg [9:0] speed;
reg dir;
reg [31:0] cnt;
initial begin
    cnt <= 32'h00000000; 
end
always @(posedge clk) begin
    cnt <= cnt + 1; 
end

always @(posedge cnt[19]) begin
    if (dir == 1'b0) begin
        if (speed < 10'd620) begin
            speed <= speed + 1;
        end else begin
            dir <= 1'b1;
        end
    end else begin
        if (speed > 10'd0) begin
            speed <= speed - 1;
        end else begin
            dir <= 1'b0;
        end
    end
end

always @(posedge clk) begin
    if (posx < 639) begin
        posx <= posx + 1;
    end else if (posy < 479) begin
        posx <= 0;
        posy <= posy + 1;
    end else begin
        posx <= 0;
        posy <= 0;
		  swap <= ~swap;
    end

end


integer dx = 1;
integer dy = -1;

integer x = 320;
integer y = 240;

integer ballSize = 10;

reg color = 0;


always @(posedge cnt[18]) begin
	 if (x + dx >= 638 - ballSize || x + dx < 1) begin
		dx <= -dx;
		color <= ~color;
	 end
	 
	 if (y + dy >= 479 - ballSize || y + dy < 1) begin
		dy <= -dy;
		color <= ~color;
	 end

	 x <= x + dx;
    y <= y + dy;
end


always @(posedge clk) begin
	 
	 if ((posx > (x) && posx < (x + 10)) && (posy > (y) && posy < (y + 10))) begin
			if(color == 0) data <= {3'b000, 3'b111, 3'b111};
			if(color == 1) data <= {3'b111, 3'b000, 3'b111};
	 end else begin
			data <= {3'b000, 3'b000, 3'b000};
	 end

end

endmodule
