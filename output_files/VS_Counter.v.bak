module VS_Counter (
    input wire clk,       // Clock input
    input wire reset,     // Reset signal
    input wire enable,    // Enable signal
    output reg [9:0] count // 10-bit counter output
);

// Initialize count register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0; // Reset count to 0
    end else if (enable) begin
        if (count == 524) begin
            count <= 0; // Reset count back to 0 when it reaches 524
        end else begin
            count <= count + 1; // Increment count if enable is active
        end
    end
end

endmodule
