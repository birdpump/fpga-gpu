module ColorScaler (
    input wire [2:0] reg_r,
    input wire [2:0] reg_g,
    input wire [2:0] reg_b,
    output wire [7:0] vga_r,
    output wire [7:0] vga_g,
    output wire [7:0] vga_b
);

assign vga_r = reg_r * 85;
assign vga_g = reg_g * 85;
assign vga_b = reg_b * 85;

endmodule