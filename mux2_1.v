module mux2_1(input sel, input [7:0] a,b, output reg [7:0] y);

	always @(*)
	begin
		if(sel)
			y = b;
		else
			y = a;
	end

endmodule