module Display_Ready (
    input wire clk,
    input wire [9:0] data1, // First 10-bit array
    input wire [9:0] data2, // Second 10-bit array
    output reg [9:0] posx, // Second 10-bit array
    output reg [9:0] posy, // Second 10-bit array
    output reg ready
);

// Define parameters for the ranges - stinky hack values because horizontal is on the clock, they are +1 or -1 wanted value, make assign at current clock later by using a fster clock
parameter LOWER_LIMIT1 = 10'd143;
parameter UPPER_LIMIT1 = 10'd782;
parameter LOWER_LIMIT2 = 10'd35;
parameter UPPER_LIMIT2 = 10'd514;

reg line;

// Register range detection logic
always @(posedge clk) begin
    // Check if data1 is within range
    if (data1 > LOWER_LIMIT1 && data1 <= UPPER_LIMIT1) begin
			posx <= posx + 1;
			line <= 1;
    end else begin
			posx <= 10'd0;
			
			if(line == 1) begin
				if (data2 >= LOWER_LIMIT2 && data2 <= UPPER_LIMIT2) begin
						posy <= posy + 1;
						line <= 0;
				end else begin
						posy <= 10'd0;
						line <= 0;
					
				end
			end
	 end
	 
end


// Set ready output based on both conditions
always @(posedge clk) begin
    if ((data1 >= LOWER_LIMIT1 && data1 <= UPPER_LIMIT1) && 
        (data2 >= LOWER_LIMIT2 && data2 <= UPPER_LIMIT2))
        ready <= 1'b1;
    else
        ready <= 1'b0;
end

endmodule