module signExtension(input_data, output_data);

    input[16:0] input_data;
    output[31:0] output_data;

    assign output_data = {{15{input_data[16]}}, input_data[16:0]};

endmodule