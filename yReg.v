module yReg(input[7:0] inst, input clk, reset, en, output reg [7:0] y);

	always@(posedge clk, posedge reset)
	begin
		if(reset)
			y <= 8'd0;
		else if(en)
			y<= inst;
	end
	
endmodule