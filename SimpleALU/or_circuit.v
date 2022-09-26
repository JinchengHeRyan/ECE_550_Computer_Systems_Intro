module or_circuit(result, data_A, data_B);
  output [31:0] result;
  input  [31:0] data_A;
  input  [31:0] data_B;

  or or_gate_00(result[0], data_A[0], data_B[0]);
  or or_gate_01(result[1], data_A[1], data_B[1]);
  or or_gate_02(result[2], data_A[2], data_B[2]);
  or or_gate_03(result[3], data_A[3], data_B[3]);
  or or_gate_04(result[4], data_A[4], data_B[4]);
  or or_gate_05(result[5], data_A[5], data_B[5]);
  or or_gate_06(result[6], data_A[6], data_B[6]);
  or or_gate_07(result[7], data_A[7], data_B[7]);
  or or_gate_08(result[8], data_A[8], data_B[8]);
  or or_gate_09(result[9], data_A[9], data_B[9]);

  or or_gate_10(result[10], data_A[10], data_B[10]);
  or or_gate_11(result[11], data_A[11], data_B[11]);
  or or_gate_12(result[12], data_A[12], data_B[12]);
  or or_gate_13(result[13], data_A[13], data_B[13]);
  or or_gate_14(result[14], data_A[14], data_B[14]);
  or or_gate_15(result[15], data_A[15], data_B[15]);
  or or_gate_16(result[16], data_A[16], data_B[16]);
  or or_gate_17(result[17], data_A[17], data_B[17]);
  or or_gate_18(result[18], data_A[18], data_B[18]);
  or or_gate_19(result[19], data_A[19], data_B[19]);

  or or_gate_20(result[20], data_A[20], data_B[20]);
  or or_gate_21(result[21], data_A[21], data_B[21]);
  or or_gate_22(result[22], data_A[22], data_B[22]);
  or or_gate_23(result[23], data_A[23], data_B[23]);
  or or_gate_24(result[24], data_A[24], data_B[24]);
  or or_gate_25(result[25], data_A[25], data_B[25]);
  or or_gate_26(result[26], data_A[26], data_B[26]);
  or or_gate_27(result[27], data_A[27], data_B[27]);
  or or_gate_28(result[28], data_A[28], data_B[28]);
  or or_gate_29(result[29], data_A[29], data_B[29]);

  or or_gate_30(result[30], data_A[30], data_B[30]);
  or or_gate_31(result[31], data_A[31], data_B[31]);


endmodule
