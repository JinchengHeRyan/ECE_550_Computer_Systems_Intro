module mux2to1_8bit(out, in0, in1, select);
  output [7:0] out;
  input [7:0] in0;
  input [7:0] in1;
  input select;

  assign out = select ? in1 : in0;


endmodule
