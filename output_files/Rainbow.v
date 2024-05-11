module RainbowPattern (
    input wire clk,
    input wire enable,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

reg [31:0] counter;

always @(posedge clk) begin
    if (enable) begin
        counter <= counter + 1;
        
        // Rainbow pattern generation
        red   <= 8'd((counter >> 24) & 8'hFF);   // Red component
        green <= 8'd((counter >> 16) & 8'hFF);   // Green component
        blue  <= 8'd((counter >> 8)  & 8'hFF);   // Blue component
    end
end

endmodule
