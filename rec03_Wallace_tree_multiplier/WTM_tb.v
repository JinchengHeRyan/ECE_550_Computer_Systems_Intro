`timescale 1 ns / 100 ps
module WTM_tb();
  reg [4:0] in1;
  reg [4:0] in2;

  reg clock;

  wire cout;
  wire [9:0] result;

  integer errors;
  integer successes;

  WTM test_WTM(in1, in2, result, cout);

  initial begin
    $display($time, " << Starting the Simulation >>");

    clock = 1'b0;
    errors = 0;
    successes = 0;

    @(negedge clock);
    in1 = 5'b10010;
    in2 = 5'b00010;

    @(negedge clock);
    if (result != 10'b0000100100 || cout != 1'b0) begin
      $display("test 1 failed; expected: %h, actual: %h", 10'b0000100100, result);
      errors = errors + 1;
    end else begin
      successes = successes + 1;
    end

    @(negedge clock);
    in1 = 5'b10010;
    in2 = 5'b00011;

    @(negedge clock);
    if (result != 10'b0000110110 || cout != 1'b0) begin
      $display("test 2 failed; expected: %h, actual: %h", 10'b0000110110, result);
      errors = errors + 1;
    end else begin
      successes = successes + 1;
    end

    @(negedge clock);
    if (errors == 0) begin
      $display("passed all %d tests!", successes);
    end

    $stop;
  end

    always
      #10 clock = ~clock;

endmodule

