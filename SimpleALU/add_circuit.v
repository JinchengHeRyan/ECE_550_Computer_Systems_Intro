module add_circuit(result, overflow, isNotEqual, data_A, data_B, cin);
  output [31:0] result;
  output overflow;
  output isNotEqual;

  input [31:0] data_A;
  input [31:0] data_B;
  input cin;

  wire [31:0] data_B_new;

  wire cout;

  xor_32bit xor_gate(data_B, cin, data_B_new);

  CSA_32bit add32bit(data_A, data_B_new, cin, cout, result);

  // determine overflow
  xor_1bit_4in xor_4in(data_A[31], data_B_new[31], result[31], cout, overflow);

  or or_biggate(isNotEqual, 
                  result[0], 
                  result[1], 
                  result[2], 
                  result[3], 
                  result[4], 
                  result[5], 
                  result[6], 
                  result[7], 
                  result[8], 
                  result[9], 
                  result[10], 
                  result[11], 
                  result[12], 
                  result[13], 
                  result[14], 
                  result[15], 
                  result[16], 
                  result[17], 
                  result[18], 
                  result[19], 
                  result[20], 
                  result[21], 
                  result[22], 
                  result[23], 
                  result[24], 
                  result[25], 
                  result[26], 
                  result[27], 
                  result[28], 
                  result[29], 
                  result[30], 
                  result[31]);

endmodule
