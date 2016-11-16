module rReg (input [7:0] result, input clk, reset, en, output reg [7:0]  r);

	always@(posedge clk, posedge reset)
	begin
		if(reset)
			r <= 8'd0;
		else if(en)
			r <= result;
	end

endmodule