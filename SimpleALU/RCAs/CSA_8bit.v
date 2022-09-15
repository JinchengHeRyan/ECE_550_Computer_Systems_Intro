module CSA_8bit(in1, in2, cin, cout, sum);
	input cin;
	input [7:0]in1, in2;
	output [7:0] sum;
	output cout;

  wire select, cout_temp_0, cout_temp_1;
  wire [3:0] sum_temp_0, sum_temp_1;


  RCA_4bit add_0(in1[3:0], in2[3:0], cin, select, sum[3:0]);

  RCA_4bit add_1_0(in1[7:4], in2[7:4], 1'b0, cout_temp_0, sum_temp_0);
  RCA_4bit add_1_1(in1[7:4], in2[7:4], 1'b1, cout_temp_1, sum_temp_1);

  mux2to1_4bit mux_4bit(sum[7:4], sum_temp_0, sum_temp_1, select);

  mux2to1_1bit mux_1bit(cout, cout_temp_0, cout_temp_1, select);

endmodule
