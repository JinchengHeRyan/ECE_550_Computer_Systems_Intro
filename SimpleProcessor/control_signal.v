module control_signal(
    opcode, shamt,
    br_ctrl,
    jp_ctrl,
    ALUinB_ctrl,
    ALUop_ctrl,
    DMwe_ctrl,
    Rwe_ctrl,
    Rdst_ctrl,
    Rwd_ctrl
);

    input[4:0] opcode, shamt;
    output[4:0] ALUop_ctrl;

    output br_ctrl, jp_ctrl, ALUinB_ctrl, DMwe_ctrl, Rwe_ctrl, Rdst_ctrl, Rwd_ctrl;

    // checkpoint 4 needed instructions
    wire is_Rtype, is_addi, is_sw, is_lw;

    wire[31:0] onehot_op;

    decode5to32 op_decoder(opcode, onehot_op);

    // Determine instructions
    assign is_Rtype = onehot_op[0] ? 1'b1:1'b0;
    assign is_addi = onehot_op[5] ? 1'b1:1'b0;
    assign is_sw = onehot_op[7] ? 1'b1:1'b0;
    assign is_lw = onehot_op[8] ? 1'b1:1'b0;

    assign ALUinB_ctrl = (is_addi | is_lw | is_sw) ? 1'b1:1'b0;
    assign ALUop_ctrl = is_Rtype ? shamt:5'b00000;
    assign DMwe_ctrl = is_sw ? 1'b1:1'b0;
    assign Rwe_ctrl = (is_Rtype | is_addi | is_lw) ? 1'b1:1'b0;
    assign Rdst_ctrl = is_Rtype ? 1'b1:1'b0;
    assign Rwd_ctrl = is_lw ? 1'b1:1'b0;


endmodule
