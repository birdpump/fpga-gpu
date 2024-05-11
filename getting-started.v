module blink (
    input wire clk, 
    output wire LED, 
    output wire LE,
    output wire always_on_pin
);

reg [31:0] cnt;

initial begin
    cnt <= 32'h00000000; 
end

always @(posedge clk) begin
    cnt <= cnt + 1; 
end

assign LED = cnt[24];
assign LE = cnt[25];
assign always_on_pin = 1'b1; // Always set to high

endmodule
