module decode5to32(input_data, output_onehot);

  input [4:0] input_data;
  output [31:0] output_onehot;


  assign output_onehot[0]   =  (~input_data[4]) & (~input_data[3]) & (~input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[1]   =  (~input_data[4]) & (~input_data[3]) & (~input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[2]   =  (~input_data[4]) & (~input_data[3]) & (~input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[3]   =  (~input_data[4]) & (~input_data[3]) & (~input_data[2]) & ( input_data[1]) & ( input_data[0]);

  assign output_onehot[4]   =  (~input_data[4]) & (~input_data[3]) & ( input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[5]   =  (~input_data[4]) & (~input_data[3]) & ( input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[6]   =  (~input_data[4]) & (~input_data[3]) & ( input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[7]   =  (~input_data[4]) & (~input_data[3]) & ( input_data[2]) & ( input_data[1]) & ( input_data[0]);


  assign output_onehot[8]   =  (~input_data[4]) & ( input_data[3]) & (~input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[9]   =  (~input_data[4]) & ( input_data[3]) & (~input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[10]  =  (~input_data[4]) & ( input_data[3]) & (~input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[11]  =  (~input_data[4]) & ( input_data[3]) & (~input_data[2]) & ( input_data[1]) & ( input_data[0]);

  assign output_onehot[12]  =  (~input_data[4]) & ( input_data[3]) & ( input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[13]  =  (~input_data[4]) & ( input_data[3]) & ( input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[14]  =  (~input_data[4]) & ( input_data[3]) & ( input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[15]  =  (~input_data[4]) & ( input_data[3]) & ( input_data[2]) & ( input_data[1]) & ( input_data[0]);


  assign output_onehot[16]  =  ( input_data[4]) & (~input_data[3]) & (~input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[17]  =  ( input_data[4]) & (~input_data[3]) & (~input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[18]  =  ( input_data[4]) & (~input_data[3]) & (~input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[19]  =  ( input_data[4]) & (~input_data[3]) & (~input_data[2]) & ( input_data[1]) & ( input_data[0]);

  assign output_onehot[20]  =  ( input_data[4]) & (~input_data[3]) & ( input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[21]  =  ( input_data[4]) & (~input_data[3]) & ( input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[22]  =  ( input_data[4]) & (~input_data[3]) & ( input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[23]  =  ( input_data[4]) & (~input_data[3]) & ( input_data[2]) & ( input_data[1]) & ( input_data[0]);


  assign output_onehot[24]  =  ( input_data[4]) & ( input_data[3]) & (~input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[25]  =  ( input_data[4]) & ( input_data[3]) & (~input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[26]  =  ( input_data[4]) & ( input_data[3]) & (~input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[27]  =  ( input_data[4]) & ( input_data[3]) & (~input_data[2]) & ( input_data[1]) & ( input_data[0]);

  assign output_onehot[28]  =  ( input_data[4]) & ( input_data[3]) & ( input_data[2]) & (~input_data[1]) & (~input_data[0]);
  assign output_onehot[29]  =  ( input_data[4]) & ( input_data[3]) & ( input_data[2]) & (~input_data[1]) & ( input_data[0]);
  assign output_onehot[30]  =  ( input_data[4]) & ( input_data[3]) & ( input_data[2]) & ( input_data[1]) & (~input_data[0]);
  assign output_onehot[31]  =  ( input_data[4]) & ( input_data[3]) & ( input_data[2]) & ( input_data[1]) & ( input_data[0]);


endmodule
