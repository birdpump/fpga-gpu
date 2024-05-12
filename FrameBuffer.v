module FrameBuffer (
    input wire clk,
	 input wire clear,
	 input wire draw,
    input reg [18:0] frame,
 
	 
	 output reg [7:0] output_r,
	 output reg [7:0] output_g,
	 output reg [7:0] output_b
);