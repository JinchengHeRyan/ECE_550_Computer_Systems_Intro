`timescale 1 ns / 100 ps

module wtm_tb();
  reg [4:0] in1;
  reg [4:0] in2;

  reg clock;

  wire cout;
  wire [9:0] result;

  integer errors;
  integer successes;

  wtm test_wtm(in1, in2, result, cout);

  initial begin
    $display($time, " << Starting the Simulation >>");

    clock = 1'b0;
    errors = 0;
    successes = 0;

    @(negedge clock);
    assign in1 = 5'd3;
    assign in2 = 5'd8;

    @(negedge clock);
    if (result != 10'd24 || cout != 1'b0) begin
      $display("test 1 failed; expected: %h, actual: %h", 10'd24, result);
      errors = errors + 1;
    end else begin
      successes = successes + 1;
    end


    @(negedge clock);
    assign in1 = 5'd20;
    assign in2 = 5'd0;

    @(negedge clock);
    if (result != 10'd0 || cout != 1'b0) begin
      $display("test 2 failed; expected: %h, actual: %h", 10'd0, result);
      errors = errors + 1;
    end else begin
      successes = successes + 1;
    end


    @(negedge clock);
    assign in1 = 5'd25;
    assign in2 = 5'd16;

    @(negedge clock);
    if (result != 10'd400 || cout != 1'b0) begin
      $display("test 3 failed; expected: %h, actual: %h", 10'd400, result);
      errors = errors + 1;
    end else begin
      successes = successes + 1;
    end

    @(negedge clock);
    assign in1 = 5'd31;
    assign in2 = 5'd1;

    @(negedge clock);
    if (result != 10'd31 || cout != 1'b0) begin
      $display("test 4 failed; expected: %h, actual: %h", 10'd31, result);
      errors = errors + 1;
    end else begin
      successes = successes + 1;
    end


    @(negedge clock);
    if (errors == 0) begin
      $display("Passed all %d tests", successes);
    end

    $stop;
  end

    always
      #10 clock = ~clock;

endmodule

