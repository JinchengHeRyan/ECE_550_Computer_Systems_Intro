### Simple Processor

Name: Jincheng He, NetID: jh622

Partner Name: Zhou An, NetID: za53

### Idea of implementing the processor

Our idea of implementing this processor is the following.

In `instruction_decoder.v`, it is the instruction decoder which inputs the 32-bit instruction and outputs opcode, Rd,
Rs, Rt, shamt, imm, and some rstatus related signal.

In `control_signal.v`, it handles all the control signal to the processor, for the current checkpoint (PC4), it
handles `BR, JP, ALUinB, ALUop, DMwe, Rwe, Rdst, Rwd`. 
