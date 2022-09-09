// set the timescale
`timescale 1 ns / 100 ps
module RCA_tb(); // testbenches take no arguments
 	// set up inputs of NAND gate as registers so they can be manipulated at will
 	reg [3:0]in1;
 	reg [3:0]in2;
	reg cin;
 	
 	// clocks are useful for testbenches because they allow you to check your
 	// circuit at regular intervals large enough for signals to propagate
 	reg clock;
 	
 	// set up output of NAND gate as wire
 	wire cout;
	wire [3:0] sum;
 	
 	// prepare any other variables you want - nothing is off-limits in a TB
 	integer num_errors;
	integer num_success;
 	
 	// instantiate the RCA
 	RCA test_RCA (in1, in2, cin,cout,sum);
 	
 	// begin simulation
 	initial begin
       	$display($time, " simulation start");
       	
       	clock = 1'b0;
			
			num_errors = 0;
			num_success = 0;
 
   @(negedge clock);
       	in1 = 4'b1101;
       	in2 = 4'b1000;
	      cin = 1'b1;
			
	@(negedge clock);
			if (sum != 4'b0110 || cout != 1) begin
				num_errors = num_errors + 1;
			end else begin
				num_success = num_success + 1;
			end
			
			
	@(negedge clock); // wait for the clock to go negative
			$display("hello world");
       	in1 = 4'b1010;
       	in2 = 4'b1001;
	      cin = 1'b0;
	
	@(negedge clock);
			if (sum != 4'b0011 || cout != 1'b1) begin
				num_errors = num_errors + 1;
			end else begin
				num_success = num_success + 1;
			end
		
		
	if (num_errors == 0) begin
		$display("success");
	end
	
	$stop;

	
   //@(negedge clock);
	  //    $stop;
	   
 	end
 	
 	always
       	#10 clock = ~clock; // toggle clock every 10 timescale units
 	
endmodule
