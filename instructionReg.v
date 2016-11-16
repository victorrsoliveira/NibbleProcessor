module instructionReg(input [23:0]  q, input clk, reset, en, output reg [23:0] inst);
	
always @(posedge clk, posedge reset)
begin
	if(reset)
		inst <= 24'd0;
	else if(en)
		inst<= q;
end

endmodule