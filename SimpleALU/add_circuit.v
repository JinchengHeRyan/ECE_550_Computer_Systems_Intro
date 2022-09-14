module add_circuit(result, overflow, data_A, data_B, cin);
  output [31:0] result;
  output overflow;

  input [31:0] data_A;
  input [31:0] data_B;
  input cin;

  wire [31:0] data_B_new;

  xor_32bit xor_gate(data_B, cin, data_B_new);

  RCA_32bit add32bit(data_A, data_B_new, cin, cout, result);

  // determine overflow
  xor_1bit_4in xor_4in(data_A[31], data_B_new[31], result[31], cout, overflow);

endmodule
