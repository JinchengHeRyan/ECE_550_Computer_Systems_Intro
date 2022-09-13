module xor_32bit(in, cin, out);
  input [31:0] in;
  input cin; 
  output [31:0] out;

  xor xor_0(out[0], in[0], cin);
  xor xor_1(out[1], in[1], cin);
  xor xor_2(out[2], in[2], cin);
  xor xor_3(out[3], in[3], cin);
  xor xor_4(out[4], in[4], cin);
  xor xor_5(out[5], in[5], cin);
  xor xor_6(out[6], in[6], cin);
  xor xor_7(out[7], in[7], cin);
  xor xor_8(out[8], in[8], cin);
  xor xor_9(out[9], in[9], cin);

  xor xor_10(out[10], in[10], cin);
  xor xor_11(out[11], in[11], cin);
  xor xor_12(out[12], in[12], cin);
  xor xor_13(out[13], in[13], cin);
  xor xor_14(out[14], in[14], cin);
  xor xor_15(out[15], in[15], cin);
  xor xor_16(out[16], in[16], cin);
  xor xor_17(out[17], in[17], cin);
  xor xor_18(out[18], in[18], cin);
  xor xor_19(out[19], in[19], cin);

  xor xor_20(out[20], in[20], cin);
  xor xor_21(out[21], in[21], cin);
  xor xor_22(out[22], in[22], cin);
  xor xor_23(out[23], in[23], cin);
  xor xor_24(out[24], in[24], cin);
  xor xor_25(out[25], in[25], cin);
  xor xor_26(out[26], in[26], cin);
  xor xor_27(out[27], in[27], cin);
  xor xor_28(out[28], in[28], cin);
  xor xor_29(out[29], in[29], cin);

  xor xor_30(out[30], in[30], cin);
  xor xor_31(out[31], in[31], cin);

endmodule
