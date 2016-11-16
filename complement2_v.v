module complement2_v(input [7:0] in, output [7:0] out);

	assign out = 1+ ~in;

endmodule