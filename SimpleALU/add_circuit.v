module add_circuit(result, data_A, data_B, cin);
  output [31:0] result;
  input [31:0] data_A;
  input [31:0] data_B;
  input cin;

  wire cout;
  wire [31:0] data_B_new;

  xor_32bit xor_gate(data_B, cin, data_B_new);

  RCA_32bit add32bit(data_A, data_B_new, cin, cout, result);

endmodule
