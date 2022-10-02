module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
   
   wire [31:0] writeReg_onehot, regA_onehot, regB_onehot;
   
   decode5to32 decode_writeReg(ctrl_writeReg, writeReg_onehot);
   decode5to32 decode_regA(ctrl_readRegA, regA_onehot);
   decode5to32 decode_regB(ctrl_readRegB, regB_onehot);
   
   genvar i;
   generate
     for (i = 0; i <= 31; i = i + 1) begin:regs_build
       wire [31:0] reg_output_i;
       onereg reg_i(
         .input_data  (data_writeReg), 
         .output_data (reg_output_i), 
         .clk         (clock), 
         .clr         (ctrl_reset), 
         .enable      (ctrl_writeEnable & writeReg_onehot[i])
       );

     end
   endgenerate


   generate
     for (i = 0; i <= 31; i = i + 1) begin:read_A_block
       assign data_readRegA = regA_onehot[i] ? regs_build[i].reg_output_i : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
       assign data_readRegB = regB_onehot[i] ? regs_build[i].reg_output_i : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

     end
   endgenerate


endmodule
