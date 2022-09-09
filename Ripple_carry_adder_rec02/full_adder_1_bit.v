module full_adder_1_bit(sum, c_out, a, b, c_in);
	input a, b, c_in;
	output sum, c_out;
	wire xor_o1, and_o1, and_o2;
	
	xor xor_1(xor_o1, a, b);
	
	xor xor_2(sum, c_in, xor_o1);
	
	and and_1(and_o1, c_in, xor_o1);
	and and_2(and_o2, a, b);
	
	or or_output(c_out, and_o1, and_o2);

endmodule
