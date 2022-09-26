module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //

   wire [31:0] add_sub_output;
   wire [31:0] and_output;
   wire [31:0] or_output;
   wire [31:0] leftshift_output;
   wire [31:0] rightshift_output;
   wire add_circuit_cout;
   wire A_B_xor;

   wire add_or_sub;  // controled by Opcode
   assign add_or_sub = ctrl_ALUopcode[0] ? 1'b1 : 1'b0;

   add_circuit add_c(add_sub_output, overflow, isNotEqual, isLessThan, data_operandA, data_operandB, add_or_sub);

   // and or result
   and_circuit and_c(and_output, data_operandA, data_operandB);
   or_circuit  or_c(or_output, data_operandA, data_operandB);

   // left and right shift
   left_shifter ls_c(leftshift_output, data_operandA, ctrl_shiftamt);
   right_shifter rs_c(rightshift_output, data_operandA, ctrl_shiftamt);

   chooseOp choose_op(add_sub_output,
                      add_sub_output,
                      and_output,
                      or_output,
                      leftshift_output,
                      rightshift_output,
                      ctrl_ALUopcode,
                      data_result);


endmodule
