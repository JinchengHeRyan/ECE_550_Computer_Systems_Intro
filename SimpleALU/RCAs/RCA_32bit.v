module RCA_32bit(in1, in2, cin, cout, sum);
	input cin;
	input [31:0]in1, in2;
	output [31:0] sum;
	output cout;

  wire select, cout_temp_0, cout_temp_1;
  wire [15:0] sum_temp_0, sum_temp_1;

  RCA_16bit add_0(in1[15:0], in2[15:0], cin, select, sum[15:0]);

  RCA_16bit add_1_0(in1[31:16], in2[31:16], 1'b0, cout_temp_0, sum_temp_0);
  RCA_16bit add_1_1(in1[31:16], in2[31:16], 1'b1, cout_temp_1, sum_temp_1);

  mux2to1_16bit mux_16bit(sum[31:16], sum_temp_0, sum_temp_1, select);

  mux2to1_1bit mux_1bit(cout, cout_temp_0, cout_temp_1, select);

endmodule
