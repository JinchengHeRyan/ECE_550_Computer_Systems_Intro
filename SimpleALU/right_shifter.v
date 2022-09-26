module right_shifter(result, data, shiftamt);
  input [31:0] data;
  input [4:0] shiftamt;

  output [31:0] result;

  wire [31:0] reverse;
  wire [31:0] temp_result;

  genvar i;

  generate
    for (i = 0; i < 32; i = i + 1) begin: reverse_bit
      assign reverse[i] = data[31-i];
    end
  endgenerate

  left_shifter ls(temp_result, reverse, shiftamt);

  generate
    for (i = 0; i < 32; i = i + 1) begin: reverse_back
      assign result[i] = temp_result[31-i];
    end
  endgenerate

endmodule
