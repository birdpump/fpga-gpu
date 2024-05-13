module TestBuffer (
    input wire clk,
    output reg swap,
	 
	 output reg [9:0] position_x_new,
    output reg [9:0] position_y_new,
	 
    output reg [7:0] output_r,
    output reg [7:0] output_g,
	 output reg [7:0] output_b
);



reg [9:0] pos_x;
reg [9:0] pos_y;

// vinteger i;
//always @(posedge clk) begin
//	 for (i=0; i<200; i=i+1) frame_buffer[i][0] <= {8'b11111111, 8'b00000000, 8'b00000000}; // Red color;
//end

always @(posedge clk) begin
		  
	  for (pos_y = 0; pos_y < 100; pos_y = pos_y + 1) begin

			output_r <= 8'd66;
			output_g <= 8'd233;
			output_b <= 8'd245;
			
			
			position_x_new <= pos_y;
			position_y_new <= pos_y;
			
	  end
	
	 
	 swap <= ~swap;
	 
	 
end


endmodule