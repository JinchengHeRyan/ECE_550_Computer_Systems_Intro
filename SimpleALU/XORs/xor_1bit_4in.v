module xor_1bit_4in(in0, in1, in2, in3, out);
  input in0, in1, in2, in3;
  output out;

  wire temp_0, temp_1;

  xor xor_0(temp_0, in0, in1);
  xor xor_1(temp_1, in2, in3);

  xor xor_final(out, temp_0, temp_1);

endmodule
