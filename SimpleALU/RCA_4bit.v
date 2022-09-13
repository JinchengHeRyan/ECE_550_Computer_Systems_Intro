module RCA_4bit(in1, in2, cin, cout, sum);
	output [3:0] sum;
	output cout;
	input cin;
	input [3:0]in1, in2;

	wire cout0, cout1, cout2;

	full_adder fa_1(sum[0], cout0, in1[0], in2[0], cin);
	full_adder fa_2(sum[1], cout1, in1[1], in2[1], cout0);
	full_adder fa_3(sum[2], cout2, in1[2], in2[2], cout1);
	full_adder fa_4(sum[3], cout,  in1[3], in2[3], cout2);



endmodule
