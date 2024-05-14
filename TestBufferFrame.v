module TestBufferFrame (
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

// Write to frame buffer
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
            dir <= 1'b1; // Use non-blocking assignment for sequential logic
        end
    end else begin
        if (speed > 10'd0) begin
            speed <= speed - 1;
        end else begin
            dir <= 1'b0; // Use non-blocking assignment for sequential logic
        end
    end
end

always @(posedge clk) begin
    // Update posx and posy sequentially
    if (posx < 639) begin
        posx <= posx + 1;
    end else if (posy < 479) begin
        posx <= 0;
        posy <= posy + 1;
    end else begin
        // Reset to beginning after reaching the end of the frame
        posx <= 0;
        posy <= 0;
		  swap <= ~swap;
    end

end



always @(posedge clk) begin
    // Update posx and posy sequentially
    //if (posx > (speed) && posx < (speed + 20)) begin
	//		data <= {3'b111, 3'b111, 3'b111}; // Red color
	 //end else begin
	//		data <= {3'b000, 3'b000, 3'b000}; // Red color
	 //end
	 
	 
	 if ((posx > 20 && posx < 40) && (posy > 20 && posy < 40)) begin
			data <= {3'b111, 3'b111, 3'b111}; // Red color
	 end else begin
			data <= {3'b000, 3'b000, 3'b000}; // Red color
	 end

end

endmodule
