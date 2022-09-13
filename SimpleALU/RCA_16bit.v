module RCA_16bit(in1, in2, cin, cout, sum);
	input cin;
	input [15:0]in1, in2;
	output [15:0] sum;
	output cout;

  wire select, cout_temp_0, cout_temp_1;
  wire [7:0] sum_temp_0, sum_temp_1;

  RCA_8bit add_0(in1[7:0], in2[7:0], cin, select, sum[7:0]);

  RCA_8bit add_1_0(in1[15:8], in2[15:8], 1'b0, cout_temp_0, sum_temp_0);
  RCA_8bit add_1_1(in1[15:8], in2[15:8], 1'b1, cout_temp_1, sum_temp_1);

  mux2to1_8bit mux_8bit(sum[15:8], sum_temp_0, sum_temp_1, select);

  mux2to1_1bit mux_1bit(cout, cout_temp_0, cout_temp_1, select);

endmodule

