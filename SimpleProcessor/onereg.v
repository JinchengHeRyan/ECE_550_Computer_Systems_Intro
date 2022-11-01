module onereg(input_data, output_data, clk, clr, enable);
  input [31:0] input_data;
  input clk, clr, enable;

  output [31:0] output_data;

  /* my implementation */

  genvar i;
  generate
    for (i = 0; i <= 31; i = i + 1) begin:dffe_build
      dffe_ref dffe_i(
        .q (output_data[i]), 
        .d (input_data[i]), 
        .clk (clk), 
        .en (enable), 
        .clr (clr)
      );
    end
  endgenerate

endmodule
