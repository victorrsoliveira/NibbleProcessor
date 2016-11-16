module opReg(input [2:0] inst, input clk, reset, en, output reg [2:0] op);
	
//	input [2:0] inst;
//	input clk, en;
//	output [2:0] op;
//	
//	wire[2:0] inst;
//	reg[2:0] op;
	
	always@(posedge clk, posedge reset)
	begin
		if(reset)
			op <= 3'd0;
		else if(en)
			op <= inst;
	end
	

endmodule