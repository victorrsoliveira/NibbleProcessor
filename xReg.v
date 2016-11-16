module xReg(input [7:0] inst, input clk, reset, en, output reg [7:0] x);
	
	always@(posedge clk, posedge reset)
	begin
		if(reset)
			x <= 8'd0;
		else if(en)
			x <= inst;
	end
endmodule