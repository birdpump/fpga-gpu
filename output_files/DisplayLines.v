module DisplayLines (
    input wire clk,
    input wire enable,
    input wire [9:0] input_register,
    output reg [7:0] output_r,
	 output reg [7:0] output_g
);


parameter LOWER_LIMIT = 10'd100;
parameter UPPER_LIMIT = 10'd1;

reg [9:0] speed;


reg [31:0] cnt;
initial begin
    cnt <= 32'h00000000; 
end
always @(posedge clk) begin
    cnt <= cnt + 1; 
end


always @(posedge cnt[19]) begin
	if (enable) begin
		if (speed < 10'd640) begin
			 speed <= speed + 1;
		end else begin
			 speed <= 0;
		end
	end
end



always @(posedge clk) begin
    if (enable) begin
        
        if (input_register >= (speed) && input_register <= (speed)) begin
            output_g <= 8'd0;
            output_r <= 8'd220;
        end else begin
            output_r <= 8'd0;
            output_g <= 8'd220;
        end
    end else begin
        output_r <= 8'd0;
        output_g <= 8'd0;
    end
end


endmodule
