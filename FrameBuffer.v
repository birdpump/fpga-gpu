module FrameBuffer (
    input wire clk,
    input wire clear,
    input wire swap,
    input wire draw,
    input wire [307200:0] frame,
    input wire [9:0] position_x,
    input wire [9:0] position_y,
    output reg [7:0] output_r,
    output reg [7:0] output_g,
    output reg [7:0] output_b
);

// Frame buffer memory
reg [23:0] frame_buffer [0:639][0:479];





// Write to frame buffer
integer i;
always @(posedge clk) begin
	 for (i=0; i<200; i=i+1) frame_buffer[i][i] <= {8'b11111111, 8'b00000000, 8'b00000000}; // Red color;
end

// Read from frame buffer
always @* begin
    if (draw) begin
        // Output pixel color at specified coordinates
        output_r = frame_buffer[position_x][position_y][23:16];
        output_g = frame_buffer[position_x][position_y][15:8];
        output_b = frame_buffer[position_x][position_y][7:0];
    end else begin
        // Output black if draw signal is low
        output_r = 8'b00000000;
        output_g = 8'b00000000;
        output_b = 8'b00000000;
    end
end

endmodule
