module mux2to1_1bit(out, in0, in1, select);
  output out;
  input  in0;
  input  in1;
  input  select;

  assign out = select ? in1 : in0;


endmodule
