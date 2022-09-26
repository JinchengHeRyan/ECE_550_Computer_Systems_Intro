`timescale 1 ns / 100ps
module left_shifter_tb();
  reg [31:0] data;
  reg [4:0]  shiftamt;

  reg clock;
  wire [31:0] result;

  left_shifter ls_test(result, data, shiftamt);

  initial begin
    $display("simulation start");
    clock = 1'b0;

    @(negedge clock);
    data = 32'h0000ffff;
    shiftamt = 5'b10000;

    @(negedge clock);
    if (result == 32'hffff0000) begin
      $display("success!");
    end else begin
      $display("error!");
    end

    @(negedge clock);
    data = 32'h0000ffff;
    shiftamt = 5'b10001;

    @(negedge clock);
    if (result == 32'hfffe0000) begin
      $display("success!");
    end else begin
      $display("error!");
    end

    $stop;

  end

  always
    #10 clock = ~clock;

endmodule
