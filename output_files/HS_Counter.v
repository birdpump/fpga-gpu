module HS_Counter (
    input wire clk,       // Clock input
    input wire reset,     // Reset signal
    output reg next,     // Enable signal for VS counter
    output reg [9:0] count // 10-bit counter output
);


// Initialize count register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0; // Reset count to 0
    end else begin
        if (count == 799) begin
            count <= 0; // Reset count back to 0 when it reaches 799
            next <= 1;  // Enable VS counter
        end else begin
            count <= count + 1; // Increment count
            next <= 0;          // Disable VS counter
        end
    end
end

endmodule
