module instruction_decoder(
    instruction,
    opcode,
    Rd,
    Rs,
    Rt,
    shamt,
    imm,
    rstatus_isAdd,
    rstatus_isAddi,
    rstatus_isSub,
);
    input[31:0] instruction;

    output[4:0] opcode, Rd, Rs, Rt, shamt;
    output[16:0] imm;

    output rstatus_isAdd, rstatus_isAddi, rstatus_isSub;

    assign opcode[4:0] = instruction[31:27];
    assign Rd[4:0] = instruction[26:22];
    assign Rs[4:0] = instruction[21:17];
    assign Rt[4:0] = instruction[16:12];

    assign shamt[4:0] = instruction[11:7];

    assign imm[16:0] = instruction[16:0];

    /* ========== ALU optype configure ========== */

    wire[31:0] onehot_op, onehot_shamt;
    decode5to32 decode_opcode(opcode, onehot_op);
    decode5to32 decode_shamt(shamt, onehot_shamt);

    /* ========== rstatus signal ========== */

    assign rstatus_isAdd = onehot_op[0] ? (onehot_shamt[0] ? 1'b1:1'b0):1'b0;
    assign rstatus_isAddi = onehot_op[5] ? 1'b1:1'b0;
    assign rstatus_isSub = onehot_op[0] ? (onehot_shamt[1] ? 1'b1:1'b0):1'b0;


endmodule
