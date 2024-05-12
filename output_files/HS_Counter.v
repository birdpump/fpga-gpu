module HS_Counter (
    input wire clk,       // Clock input
    input wire reset,     // Reset signal
    output reg next,     // Enable signal for VS counter
    output reg [9:0] count // 10-bit counter output
);


// remove reset later
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0; // Reset count to 0
    end else begin
        if (count == 799) begin
            count <= 0; // Reset count back to 0 when it reaches 799
        end else begin
            count <= count + 1; // Increment count
        end
    end
end



always @(posedge clk) begin
	  if (count == 798) begin
			next <= 1;  // Enable VS counter
	  end else begin
			next <= 0;          // Disable VS counter
	  end
end

endmodule