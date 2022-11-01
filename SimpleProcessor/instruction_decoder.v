module instruction_decoder(
    instruction,
    opcode,
    Rd,
    Rs,
    Rt,
    shamt,
    alu_op,
    imm
);
    input[31:0] instruction;

    output[4:0] opcode, Rd, Rs, Rt, shamt, alu_op;
    output[16:0] imm;

    assign opcode[4:0] = instruction[31:27];
    assign Rd[4:0] = instruction[26:22];
    assign Rs[4:0] = instruction[21:17];
    assign Rt[4:0] = instruction[16:12];

    assign shamt[4:0] = instruction[11:7];

    assign imm[16:0] = instruction[16:0];

    /* ========== ALU optype configure ========== */

    wire[31:0] onehot_op;
    decode5to32 decode_opcode(opcode, onehot_op);

    assign alu_op[4:0] = onehot_op[0] ? instruction[6:2]:5'bzzzzz;  // R-type, opcode is always zero

    /* ========================================== */

endmodule
