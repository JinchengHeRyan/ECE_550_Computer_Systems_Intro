module chooseOp(add_result, sub_result, and_result, or_result, leftshift_result, rightshift_result, Opcode, result);
  input [31:0] add_result;
  input [31:0] sub_result;
  input [31:0] and_result;
  input [31:0] or_result;
  input [31:0] leftshift_result;
  input [31:0] rightshift_result;
  input [4:0] Opcode;
  output [31:0] result;

  assign result = Opcode[2] ? (Opcode[0] ? rightshift_result : leftshift_result) :  
                              (Opcode[1] ? (Opcode[0] ? or_result : and_result) : 
                                           (Opcode[0] ? sub_result : add_result));


endmodule
