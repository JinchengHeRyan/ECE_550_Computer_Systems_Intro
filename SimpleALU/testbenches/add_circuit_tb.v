`timescale 1 ns / 100ps
module add_circuit_tb();
    reg            clock;
    reg [31:0] data_operandA, data_operandB, data_expected;

    wire [31:0] data_result;

    integer errors;
    integer index;    // for testing...
    
    add_circuit ac_ut(data_result, data_operandA, data_operandB, 1'b0);

    initial begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;

        checkAdd();

        $stop;
    end

    // Clock generator
    always
         #10     clock = ~clock;

    task checkAdd;
        begin
            @(negedge clock);
            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in ADD (test 9); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            for(index = 0; index < 31; index = index + 1)
            begin
                @(negedge clock);
                assign data_operandA = 32'h00000001 << index;
                assign data_operandB = 32'h00000001 << index;

                assign data_expected = 32'h00000001 << (index + 1);

                @(negedge clock);
                if(data_result !== data_expected) begin
                    $display("**Error in ADD (test 17 part %d); expected: %h, actual: %h", index, data_expected, data_result);
                    errors = errors + 1;
                end else begin
                  $display("passed, expected: %h, actual: %h", data_expected, data_result);
                end
            end
        end
    endtask

endmodule
