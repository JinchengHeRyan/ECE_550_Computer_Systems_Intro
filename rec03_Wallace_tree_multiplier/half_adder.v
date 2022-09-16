module half_adder(sum, cout, a, b);
  input a, b;
  output sum, cout;

  xor xor_g(sum, a, b);
  and and_g(cout, a, b);

endmodule
