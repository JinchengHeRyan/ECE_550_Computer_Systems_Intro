module mux_2to1(out, high, low, choice);
  input low, high, choice; 
  output out;

  assign out = choice ? high : low;
endmodule


module left_shifter(result, data, shiftamt, shift_in);
  input [31:0] data;
  input [4:0] shiftamt;
  input shift_in;

  output [31:0] result;

  wire [31:0] level_4_output;
  wire [31:0] level_3_output;
  wire [31:0] level_2_output;
  wire [31:0] level_1_output;

  genvar i;

  // level 4
  generate
    for (i = 0; i <= 15; i = i + 1) begin:level_4_0
      mux_2to1 mux_i(
        .out (level_4_output[i]), 
        .high (shift_in), 
        .low (data[i]), 
        .choice (shiftamt[4])
      );
    end
  endgenerate

  generate
    for (i = 16; i <= 31; i = i + 1) begin:level_4_1
      mux_2to1 mux_i(
        .out (level_4_output[i]), 
        .high (data[i-16]), 
        .low (data[i]), 
        .choice (shiftamt[4])
      );
    end
  endgenerate


  // level 3
  generate
    for (i = 0; i <= 7; i = i + 1) begin:level_3_0
      mux_2to1 mux_i(
        .out (level_3_output[i]), 
        .high (shift_in), 
        .low (level_4_output[i]), 
        .choice (shiftamt[3])
      );
    end
  endgenerate

  generate
    for (i = 8; i <= 31; i = i + 1) begin:level_3_1
      mux_2to1 mux_i(
        .out (level_3_output[i]), 
        .high (level_4_output[i-8]), 
        .low (level_4_output[i]), 
        .choice (shiftamt[3])
      );
    end
  endgenerate


  // level 2
  generate
    for (i = 0; i <= 3; i = i + 1) begin:level_2_0
      mux_2to1 mux_i(
        .out (level_2_output[i]), 
        .high (shift_in), 
        .low (level_3_output[i]), 
        .choice (shiftamt[2])
      );
    end
  endgenerate

  generate
    for (i = 4; i <= 31; i = i + 1) begin:level_2_1
      mux_2to1 mux_i(
        .out (level_2_output[i]), 
        .high (level_3_output[i-4]), 
        .low (level_3_output[i]), 
        .choice (shiftamt[2])
      );
    end
  endgenerate


  // level 1
  generate
    for (i = 0; i <= 1; i = i + 1) begin:level_1_0
      mux_2to1 mux_i(
        .out (level_1_output[i]), 
        .high (shift_in), 
        .low (level_2_output[i]), 
        .choice (shiftamt[1])
      );
    end
  endgenerate

  generate
    for (i = 2; i <= 31; i = i + 1) begin:level_1_1
      mux_2to1 mux_i(
        .out (level_1_output[i]), 
        .high (level_2_output[i-2]), 
        .low (level_2_output[i]), 
        .choice (shiftamt[1])
      );
    end
  endgenerate


  // level 0
  generate
    for (i = 0; i <= 0; i = i + 1) begin:level_0_0
      mux_2to1 mux_i(
        .out (result[i]), 
        .high (shift_in), 
        .low (level_1_output[i]), 
        .choice (shiftamt[0])
      );
    end
  endgenerate

  generate
    for (i = 1; i <= 31; i = i + 1) begin:level_0_1
      mux_2to1 mux_i(
        .out (result[i]), 
        .high (level_1_output[i-1]), 
        .low (level_1_output[i]), 
        .choice (shiftamt[0])
      );
    end
  endgenerate

endmodule
