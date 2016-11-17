module centralControl_v(input reset, clk, input [1:0] op, output [1:0] y);

	reg [1:0] state, nextstate;
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;
	
	always@(posedge clk, posedge reset)
	begin
		if (reset) state = S0;
		else state = nextstate;
	end
	
	always @(*)
	begin
		case(state)
			S0: nextstate = S1;
			S1: case (op)
						2'b00: nextstate = S0;
						2'b01: nextstate = S3;
						default: nextstate = S2;
					endcase
			S2: nextstate = S2;
			S3: nextstate = S0;
			default: nextstate = S0;
		endcase
	end
	
	assign y[1] = ~state[1] & ~state[0];//~(state[1] | state[0]);
	assign y[0] = state[0];
endmodule