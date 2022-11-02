`timescale 1ns/100ps
module SimpleProcessor_tb();
    // inputs
    reg clock, ctrl_reset;

    // outputs
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
    wire[31:0] data_readRegA, data_readRegB, q_dmem;

    // Tracking the number of errors
    integer errors;
    integer index;    // for testing...
    reg[31:0] ans_list[0:12];
    // instantiate
    skeleton_test my_skeleton(clock, ctrl_reset, imem_clock, dmem_clock, processor_clock, regfile_clock, data_readRegA, data_readRegB, q_dmem);


    // setting the initial values of all the reg
    initial
        begin
            $display($time, " << Starting the Simulation >>");
            clock = 1'b0;    // at time 0
            errors = 0;

            ans_list[0] = 5;
            ans_list[1] = 3;
            ans_list[2] = 8;
            ans_list[3] = 2;
            ans_list[4] = 0;
            ans_list[5] = 1;
            ans_list[6] = 3;
            ans_list[7] = 20;
            ans_list[8] = 4;
            ans_list[9] = 345;
            ans_list[10] = 567;
            ans_list[11] = 345;
            ans_list[12] = 567;

            ctrl_reset = 1'b1;    // assert reset
            @(negedge clock);    // wait until next negative edge of clock
            ctrl_reset = 1'b0;    // de-assert reset

            // Begin testing... (loop over registers)
            for (index = 0; index < 13; index = index+1)
                begin
                    @(negedge clock);
                    @(negedge clock);
                    if (data_readRegA != 0 && data_readRegB != ans_list[index])
                        begin
                            $display("**Error on read index %d exp: %d output: %d**", index, ans_list[index], data_readRegB);
                            errors = errors+1;
                        end
                end


            if (errors == 0) begin
                $display("The simulation completed without errors");
            end
            else begin
                $display("The simulation failed with %d errors", errors);
            end

            $stop;
        end


    // Clock generator
    always
        #10 clock = ~clock;    // toggle

endmodule