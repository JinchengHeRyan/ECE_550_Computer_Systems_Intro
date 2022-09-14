module chooseOp(in0, in1, Opcode, result);
  input [31:0] in0;
  input [31:0] in1;
  input [4:0] Opcode;
  output [31:0] result;

  assign result = Opcode[0]? in1 : in0;


endmodule
