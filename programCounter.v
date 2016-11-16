module programCounter (input [4:0] inc, input clk, reset, en, output reg [4:0] out);

always @(posedge clk, posedge reset)
begin
	if(reset) out <= 5'b00000;
	else if(en)
		begin
			out <= inc;
		end
end

endmodule