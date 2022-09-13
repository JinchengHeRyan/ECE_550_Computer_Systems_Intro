module add_circuit(result, data_A, data_B);
  output [31:0] result;
  input [31:0] data_A;
  input [31:0] data_B;

  wire cout;
  RCA_32bit add32bit(data_A, data_B, 1'b0, cout, result);

endmodule
