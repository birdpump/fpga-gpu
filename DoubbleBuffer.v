module DoubbleBuffer (
    input wire clk,
	 input wire swap,
	 
	 output reg wren_1,
	 output reg [8:0] data_1,
	 output reg [18:0] addr_1,
	 input wire [8:0] q_1,
	 
	 output reg wren_2,
	 output reg [8:0] data_2,
	 output reg [18:0] addr_2,
	 input wire [8:0] q_2,
	 
	 
	 output reg [8:0] select_data, //buffer being displayed / show display
	 input wire [18:0] in_addr_1, //input from show display
	 
	 
	 input wire [18:0] in_addr_2, //input from renderer
	 input wire [8:0] in_data_2 //input from renderer
);

reg active_buffer = 0; // 0 - display buffer



// Write to frame buffer
always @(posedge clk) begin
  if (swap) begin
		// Toggle active buffer
		active_buffer <= ~active_buffer;
  end

end


always @* begin

  if (swap) begin
		//display second buffer, write other
		wren_2 = 0;
		select_data = q_2;
		addr_2 = in_addr_1;
		
		wren_1 = 1;
		addr_1 = in_addr_2;
		data_1 = in_data_2;
  end else begin
		//display the first buffer, write the second
		wren_1 = 0;
		select_data = q_1;
		addr_1 = in_addr_1;
		
		wren_2 = 1;
		addr_2 = in_addr_2;
		data_2 = in_data_2;
		
  end

end



endmodule
