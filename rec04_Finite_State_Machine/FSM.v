module FSM(cout, state_now, clk, reset);
	input clk, reset;
	output reg cout;
	output reg [2:0] state_now;
	localparam [2:0] 
    zero = 3'b000,
    one = 3'b001,
	 two = 3'b010,
	 three = 3'b011,
	 four = 3'b100,
	 five = 3'b101,
	 six = 3'b110,
	 seven = 3'b111;
	
	reg[2:0] state_next;
	always @(posedge clk, posedge reset)
	begin
		 if(reset) // go to state zero if rese
			  begin
			  state_now <= zero;
			  end
		 else // otherwise update the states
			  begin
			  state_now <= state_next;
			  end
	end
	
	always @(state_now, posedge clk)
	begin
		 // store current state as next
		 state_next = state_now; // required: when no case statement is satisfied
		 
		 cout = 1'b0; 
		 case(state_now)
			  zero: 
					if(clk) 
						 state_next = one;
			  one:
					if(clk) 
						 state_next = two;
			  two:
					if(clk) 
						 state_next = three;
			  three:
					if(clk) 
							 state_next = four;
			  four:
					begin
						cout = 1'b1;
						if(clk) 
							 state_next = zero;
					end
			  five:
					state_next = zero;
			  six:
					state_next = zero;
			  seven:
					state_next = zero;   
		 endcase
	end
endmodule
	