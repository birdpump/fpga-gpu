module Display_Ready (
    input wire clk,
    input wire [9:0] data1, // First 10-bit array
    input wire [9:0] data2, // Second 10-bit array
    output reg [9:0] posx, // Second 10-bit array
    output reg [9:0] posy, // Second 10-bit array
    output reg ready
);

// Define parameters for the ranges
parameter LOWER_LIMIT1 = 10'd144;
parameter UPPER_LIMIT1 = 10'd784;
parameter LOWER_LIMIT2 = 10'd35;
parameter UPPER_LIMIT2 = 10'd515;


// Register range detection logic
always @(posedge clk) begin
    // Check if data1 is within range
    if (data1 >= LOWER_LIMIT1 && data1 <= UPPER_LIMIT1) begin
			posx <= posx + 1;
    end else begin
			posx <= 10'd0;
	 end
	 
    // Check if data2 is within range
    if (data2 >= LOWER_LIMIT2 && data2 <= UPPER_LIMIT2) begin
			posy <= posy + 1;
    end else begin
			posy <= 10'd0;
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