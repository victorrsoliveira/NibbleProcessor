module fullAdder8Bits_v(input [7:0]  in1, in2,output reg ovf, output reg [7:0] out);

	reg a, b;
	
	always @(*) begin
		{a, out[6:0]} = in1[6:0] + in2[6:0];
		{b,out[7]} = in1[7] + in2[7] + a;
		ovf = a ^ b;
	end
		
endmodule