module mainProcessor(input clk, reset, output [7:0] r, x,y, output [4:0] addr, output [2:0] op);

	wire[4:0] pc_inc, pc_out;
	wire[23:0] rom_out, inst_out;
	wire[7:0] ram_out;
	wire[1:0] en;

	wire[7:0] d_x, d_y, x_out, y_out, r_out;
	wire[4:0] d_addr, addr_out;
	wire[7:0] mux_mem_out, mux_op_out;
	wire[2:0] d_op, op_out;
	wire [7:0] result;

	assign pc_inc = pc_out + 5'd1;

	programCounter(pc_inc, clk, reset, en[1],  pc_out);
	single_port_rom(pc_out, clk, rom_out);
	instructionReg(rom_out, clk, reset, en[1], inst_out);

	assign d_addr = inst_out[20:16];
	assign d_y = inst_out[7:0];
	assign d_op = inst_out[23:21];
	assign d_x = inst_out[15:8];

	addrReg(d_addr, clk, reset, en[1], addr_out);
	yReg(d_y, clk, reset, en[1], y_out);
	opReg(d_op, clk, reset, en[1], op_out);
	xReg(d_x, clk, reset, en[1], x_out);

	centralControl_v(reset,clk,{op_out[2],op_out[0]},en);

	mux2_1 mux_mem(op_out[0], y_out,ram_out,mux_mem_out);
	mux2_1 mux_op(op_out[1],x_out,1+~x_out,mux_op_out);

	assign result = mux_mem_out + mux_op_out;

	rReg(result, clk, reset, en[0],r_out);

	assign r = r_out; 
	assign x = x_out;
	assign y = y_out;
	assign addr = addr_out;
	assign op = op_out;

	single_port_ram(r_out,addr_out,en[1],clk,ram_out);

endmodule