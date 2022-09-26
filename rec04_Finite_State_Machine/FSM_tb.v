`timescale 1 ns / 100 ps
module FSM_tb();
	reg reset;
	reg clk;
	wire [2:0] state;
	wire cout;
	
	FSM my_fsm(cout, state, clk, reset);
	initial begin
		$display($time, "simulation start");
		reset = 1'b1;
		clk = 1'b0;
		@(negedge clk);
		reset = 1'b0;
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		reset = 1'b1;
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		
		@(negedge clk);
		
		$stop;
		
	end
	always
		#10 clk = ~clk;
endmodule

	