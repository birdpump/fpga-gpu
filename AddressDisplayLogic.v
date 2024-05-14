module AddressDisplayLogic(
    input wire [9:0] posx,
    input wire [9:0] posy,
    output reg [18:0] address,
	 
	 input wire draw,
	 input wire [8:0] data,
	 output reg [2:0] output_r,
    output reg [2:0] output_g,
    output reg [2:0] output_b
);

always @* begin
    address = (posy * 640) + posx;
end

always @* begin
    if (draw) begin
        // Output pixel color at specified coordinates
        output_r = data[8:6];
        output_g = data[5:3];
        output_b = data[2:0];
    end else begin
        // Output black if draw signal is low
        output_r = 3'b000;
        output_g = 3'b000;
        output_b = 3'b000;
    end
end

endmodule
