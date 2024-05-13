module FrameBuffer (
    input wire clk,
    input wire clear,
    input wire swap,
    input wire draw,
    input wire [9:0] position_x,
    input wire [9:0] position_y,
	 
    input wire [9:0] position_x_new,
    input wire [9:0] position_y_new,
    input wire [7:0] color_r_new,
    input wire [7:0] color_g_new,
    input wire [7:0] color_b_new,
	 
    output reg [7:0] output_r,
    output reg [7:0] output_g,
    output reg [7:0] output_b
);

// Frame buffer memories for double buffering
reg [23:0] frame_buffer_1 [0:639][0:479];
reg [23:0] frame_buffer_2 [0:639][0:479];

// Current active buffer selection
reg active_buffer = 0;




// Write to frame buffer based on the active buffer
always @(posedge clk) begin
	  // Write to the active buffer
	  if (active_buffer) begin
			frame_buffer_1[position_x_new][position_y_new] <= {color_r_new, color_g_new, color_b_new};
	  end else begin
			frame_buffer_2[position_x_new][position_y_new] <= {color_r_new, color_g_new, color_b_new};
	  end
end



// Read from frame buffer based on the active buffer and send values to display
always @* begin
    if (draw) begin
        // Read from the active buffer
        if (active_buffer) begin
            output_r = frame_buffer_2[position_x][position_y][23:16];
            output_g = frame_buffer_2[position_x][position_y][15:8];
            output_b = frame_buffer_2[position_x][position_y][7:0];
        end else begin
            output_r = frame_buffer_1[position_x][position_y][23:16];
            output_g = frame_buffer_1[position_x][position_y][15:8];
            output_b = frame_buffer_1[position_x][position_y][7:0];
        end
    end else begin
        // Output black if draw signal is low
        output_r = 8'b00000000;
        output_g = 8'b00000000;
        output_b = 8'b00000000;
    end
end


// Switch between frame buffers based on the swap signal
always @(posedge clk) begin
    if (clear) begin
        // Initialize with buffer 1 as active
        active_buffer <= 0;
    end else begin
        if (swap) begin
            // Toggle active buffer
            active_buffer <= ~active_buffer;
        end
    end
end

endmodule