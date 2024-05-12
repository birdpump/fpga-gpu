module V_Sync (
    input wire clk,
    input wire [9:0] data,
    output reg out
);

// Define parameter for the range
parameter LOWER_LIMIT = 10'd0;
parameter UPPER_LIMIT = 10'd1;

// Register range detection logic
always @(clk) begin
    if (data >= LOWER_LIMIT && data <= UPPER_LIMIT)
        out <= 1'b1;
    else
        out <= 1'b0;
end

endmodule
