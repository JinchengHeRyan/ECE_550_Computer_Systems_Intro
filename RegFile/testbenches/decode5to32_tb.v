`timescale 1 ns / 100ps
module decode5to32_tb();
  reg clock;
  reg [4:0] input_data;

  wire [31:0] result;

  integer index;
  integer errors;
  integer successes;

  decode5to32 dc_test(input_data, result);

  initial begin
    $display("simulation start");
    clock = 1'b0;
    errors = 0;
    successes = 0;


    for (index = 0; index <= 31; index = index + 1) begin
      @(negedge clock);
      assign input_data = 5'b00000 + index;

      @(negedge clock);
      if (result != (32'h00000001 << index)) begin
        $display("Error!, expected: %h, actual: %h", (32'h00000001 << index), result);
        errors = errors + 1;
      end else begin
        successes = successes + 1;
      end

    end

    if(errors == 0) begin
        $display("The simulation completed without errors");
        $display("Simulation passed all %d tests", successes);
    end
    else begin
        $display("The simulation failed with %d errors", errors);
    end

    $stop;

  end

  always
    #10 clock = ~clock;


endmodule
