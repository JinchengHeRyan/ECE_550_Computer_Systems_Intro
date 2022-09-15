`timescale 1 ns / 100ps
module CSA_8bit_tb();
  reg [7:0] in0;
  reg [7:0] in1;
  reg cin;

  reg clock;
  wire [7:0] sum;
  wire out;

  CSA_8bit test_CSA(in0, in1, cin, out, sum);

  initial begin
    $display("simulation start");
    clock = 1'b0;

    @(negedge clock);
      in0 = 8'b10001100;
      in1 = 8'b00001100;
      cin = 1'b0;

    @(negedge clock);
    if (sum == 8'b10011000 && out == 1'b0) begin
      $display("test 1 passed");
    end

    @(negedge clock);
      in0 = 8'b10000100;
      in1 = 8'b00000100;
      cin = 1'b0;

    @(negedge clock);
    if (sum == 8'b10001000 && out == 1'b0) begin
      $display("test 2 passed");
    end

    @(negedge clock);
      in0 = 8'b10000100;
      in1 = 8'b10000100;
      cin = 1'b0;

    @(negedge clock);
    if (sum == 8'b00001000 && out == 1'b1) begin
      $display("test 3 passed");
    end

    @(negedge clock);
      in0 = 8'b10000100;
      in1 = 8'b10000100;
      cin = 1'b1;

    @(negedge clock);
    if (sum == 8'b00001001 && out == 1'b1) begin
      $display("test 4 passed");
    end

    $stop;

  end

  always
    #10 clock = ~clock;

endmodule
