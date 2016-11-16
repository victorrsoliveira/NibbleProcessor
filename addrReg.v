module addrReg(input[4:0] addr_in, input clk, reset, en, output reg [4:0] addr_out);

always@(posedge clk, posedge reset)
begin
	if(reset)
		addr_out <= 5'd0;
	else if(en)
		addr_out <= addr_in;
end
endmodule