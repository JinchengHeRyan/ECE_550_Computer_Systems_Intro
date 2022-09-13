`timescale 1 ns / 100ps
module mux2to1_4bit_tb();
  reg [3:0] in0;
  reg [3:0] in1;
  reg select;

  reg clock;
  wire [3:0] out;

  mux2to1_4bit test_mux(out, in0, in1, select);

  initial begin
    $display("simulation start");
    clock = 1'b0;

    @(negedge clock);
      in0 = 4'b1100;
      in1 = 4'b1001;
      select = 1'b1;

    @(negedge clock);
    if (out == 4'b1001) begin
      $display("test 1 passed");
    end

    @(negedge clock);
      in0 = 4'b1100;
      in1 = 4'b1001;
      select = 1'b0;

    @(negedge clock);
    if (out == 4'b1100) begin
      $display("test 1 passed");
    end

    $stop;

  end

  always
    #10 clock = ~clock;

endmodule

