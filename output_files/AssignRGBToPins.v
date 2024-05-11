module AssignRGBToPins (
    input wire [7:0] reg_r, // 8-bit register R
	 input wire [7:0] reg_g, // 8-bit register G
	 input wire [7:0] reg_b, // 8-bit register B
	 
    output wire vga_r_0,
	 output wire vga_r_1,
	 output wire vga_r_2,
	 output wire vga_r_3,
	 output wire vga_r_4,
	 output wire vga_r_5,
	 output wire vga_r_6,
	 output wire vga_r_7,
	 
	 output wire vga_g_0,
	 output wire vga_g_1,
	 output wire vga_g_2,
	 output wire vga_g_3,
	 output wire vga_g_4,
	 output wire vga_g_5,
	 output wire vga_g_6,
	 output wire vga_g_7,
    
	 output wire vga_b_0,
	 output wire vga_b_1,
	 output wire vga_b_2,
	 output wire vga_b_3,
	 output wire vga_b_4,
	 output wire vga_b_5,
	 output wire vga_b_6,
	 output wire vga_b_7
);


assign vga_r_0 = reg_r[0];
assign vga_r_1 = reg_r[1];
assign vga_r_2 = reg_r[2];
assign vga_r_3 = reg_r[3];
assign vga_r_4 = reg_r[4];
assign vga_r_5 = reg_r[5];
assign vga_r_6 = reg_r[6];
assign vga_r_7 = reg_r[7];

assign vga_g_0 = reg_g[0];
assign vga_g_1 = reg_g[1];
assign vga_g_2 = reg_g[2];
assign vga_g_3 = reg_g[3];
assign vga_g_4 = reg_g[4];
assign vga_g_5 = reg_g[5];
assign vga_g_6 = reg_g[6];
assign vga_g_7 = reg_g[7];

assign vga_b_0 = reg_b[0];
assign vga_b_1 = reg_b[1];
assign vga_b_2 = reg_b[2];
assign vga_b_3 = reg_b[3];
assign vga_b_4 = reg_b[4];
assign vga_b_5 = reg_b[5];
assign vga_b_6 = reg_b[6];
assign vga_b_7 = reg_b[7];



endmodule