/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output[11:0] address_imem;
    input[31:0] q_imem;

    // Dmem
    output[11:0] address_dmem;
    output[31:0] data;
    output wren;
    input[31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output[4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output[31:0] data_writeReg;
    input[31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */

    /* ========== wire declaration ========== */
    wire[31:0] PC_input;
    wire[31:0] PC_output;
    wire[31:0] pc_alu_output;

    wire[4:0] opcode, Rd, Rs, Rt, shamt, ALUop;
    wire[16:0] imm;
    wire[26:0] target;
    wire rstatus_isAdd, rstatus_isAddi, rstatus_isSub;

    wire[4:0] ALUop_ctrl;
    wire br_ctrl, jp_ctrl, ALUinB_ctrl, DMwe_ctrl, Rwe_ctrl, Rtar_ctrl, Rwd_ctrl, JP_ctrl;

    wire[31:0] rstatus_sig;
    wire isNotEqual_alu, isLessThan_alu, overflow_alu;
    wire[31:0] alu_output;

    wire[31:0] imm_sx;

    /* ========== PC register ========== */

    assign PC_input = JP_ctrl ? {{5{1'b0}}, target[26:0]}:pc_alu_output;

    onereg PC_reg(PC_input, PC_output, clock, reset, 1'b1);

    assign address_imem = PC_output[11:0];

    // PC = PC + 1 (not PC = PC + 4!)

    alu pc_alu(
        .data_operandA(PC_output),
        .data_operandB(32'h00000001),
        .ctrl_ALUopcode(5'b00000),
        .ctrl_shiftamt(5'b00000),
        .data_result(pc_alu_output)
    );

    /* ========== Instruction Decode ==========*/
    instruction_decoder instDecoder(
        .instruction(q_imem),
        .opcode(opcode),
        .Rd(Rd),
        .Rs(Rs),
        .Rt(Rt),
        .ALUop(ALUop),
        .shamt(shamt),
        .imm(imm),
        .target(target),
        .rstatus_isAdd(rstatus_isAdd),
        .rstatus_isAddi(rstatus_isAddi),
        .rstatus_isSub(rstatus_isSub)
    );

    /* ======== Control Signal settings ======== */

    control_signal ctrlSig(
        opcode, shamt, ALUop,
        br_ctrl,
        jp_ctrl,
        ALUinB_ctrl,
        ALUop_ctrl,
        DMwe_ctrl,
        Rwe_ctrl,
        Rtar_ctrl,
        Rwd_ctrl,
        JP_ctrl
    );

    /* ======== Register File ======== */

    // Determine the rstatus value
    assign rstatus_sig = overflow_alu ?
        (rstatus_isAdd ?
            32'h00000001:(rstatus_isAddi ?
            32'h00000002:(rstatus_isSub ?
            32'h00000003:32'hzzzzzzzz))):32'h00000000;

    assign ctrl_writeReg = overflow_alu ? 5'b11110:Rd;
    assign ctrl_readRegA = Rs;
    assign ctrl_readRegB = Rtar_ctrl ? Rd:Rt;

    assign data_writeReg = overflow_alu ? rstatus_sig:(Rwd_ctrl ? q_dmem:alu_output);

    assign ctrl_writeEnable = Rwe_ctrl;

    /* ================== ALU ================== */

    // Sign extension for immediate
    signExtension immSX(imm, imm_sx);

    alu alu_circ(
        .data_operandA(data_readRegA),
        .data_operandB(ALUinB_ctrl ? imm_sx:data_readRegB),
        .ctrl_ALUopcode(ALUop_ctrl),
        .ctrl_shiftamt(shamt),
        .data_result(alu_output),
        .isNotEqual(isNotEqual_alu),
        .isLessThan(isLessThan_alu),
        .overflow(overflow_alu)
    );

    /* ================== Data Memory ================== */

    assign address_dmem = alu_output;
    assign data = data_readRegB;
    assign wren = DMwe_ctrl;


endmodule
