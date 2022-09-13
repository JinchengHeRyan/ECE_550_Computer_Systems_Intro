module mux2to1_16bit(out, in0, in1, select);
  output [15:0] out;
  input  [15:0] in0;
  input  [15:0] in1;
  input select;

  assign out = select ? in1 : in0;


endmodule
