module mux2to1_4bit(out, in0, in1, select);
  output [3:0] out;
  input [3:0] in0;
  input [3:0] in1;
  input select;

  assign out = select ? in1 : in0;


endmodule

