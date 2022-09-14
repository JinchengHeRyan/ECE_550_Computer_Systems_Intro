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
  xor xor_A_B(A_B_xor, data_A[31], data_B_new[31]);
  xor xor_cout_sum(cout_sum_xor, result[31], cout);
  xor xor_overflow(overflow, A_B_xor, cout_sum_xor);

endmodule
