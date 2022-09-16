module wtm(a, b, result, cout);

  // ==========
  // init setting
  input [4:0] a;
  input [4:0] b;

  output [9:0] result;
  output cout;

  // ==========


  // ==========
  // level 1

  wire a1b0,
       a2b0,
       a3b0,
       a4b0,

       a0b1,
       a1b1,
       a2b1,
       a3b1,
       a4b1,

       a0b2,
       a1b2,
       a2b2,
       a3b2,
       a4b2,
        
       a0b3,
       a1b3,
       a2b3,
       a3b3,
       a4b3,

       a0b4,
       a1b4,
       a2b4,
       a3b4,
       a4b4;


  and and_g00(result[0], a0, b0);
  and and_g01(a1b0, a1, b0);
  and and_g02(a2b0, a2, b0);
  and and_g03(a3b0, a3, b0);
  and and_g04(a4b0, a4, b0);

  and and_g10(a0b1, a0, b1);
  and and_g11(a1b1, a1, b1);
  and and_g12(a2b1, a2, b1);
  and and_g13(a3b1, a3, b1);
  and and_g14(a4b1, a4, b1);

  and and_g20(a0b2, a0, b2);
  and and_g21(a1b2, a1, b2);
  and and_g22(a2b2, a2, b2);
  and and_g23(a3b2, a3, b2);
  and and_g24(a4b2, a4, b2);

  and and_g30(a0b3, a0, b3);
  and and_g31(a1b3, a1, b3);
  and and_g32(a2b3, a2, b3);
  and and_g33(a3b3, a3, b3);
  and and_g34(a4b3, a4, b3);

  and and_g40(a0b4, a0, b4);
  and and_g41(a1b4, a1, b4);
  and and_g42(a2b4, a2, b4);
  and and_g43(a3b4, a3, b4);
  and and_g44(a4b4, a4, b4);

  // ==========
  // level 2
  wire s2, 
       s3, 
       s4, 
       s5, 
       s6, 
       s7, 
       c1,
       c2,
       c3,
       c4,
       c5,
       c6,
       c7;

  half_adder(result[1], c1, a1bo, a0b1);
  full_adder(s2, c2, a2b0, a1b1, a0b2);
  full_adder(s3, c3, a3b0, a2b2, a1b2);
  full_adder(s4, c4, a4b0, a3b2, a2b2);
  full_adder(s5, c5, a4b2, a3b2, a2b3);
  full_adder(s6, c6, a4b2, a3b3, a2b4);
  half_adder(s7, c7, a4b3, a3b4);

  // ==========
  // level 3
  wire c8,  
       s9, c9,  
       s10, c10,
       s11, c11,
       s12, c12,
       s13, c13,
       s14, c14;

  half_adder(result[2], c8,   s2, c1);
  full_adder(s9, c9,   s3, c2, a0b3);
  full_adder(s10, c10, s4, c3, a1b3);
  full_adder(s11, c11, s5, c4, a1b4);
  half_adder(s12, c12, s6, c5);
  half_adder(s13, c13, s7, c6);
  half_adder(s14, c14, a4b4, c7);

  // ==========
  // level 4
  wire s16,c15,
       s17,c16,
       s18,c17,
       s19,c18,
       s20,c19,
       c20;


  half_adder(result[3], c15, s9,  c8);
  full_adder(s16,       c16, s10, c9, a0b4);
  half_adder(s17,       c17, s11, c10);
  half_adder(s18,       c18, s12, c11);
  half_adder(s19,       c19, s13, c12);
  half_adder(s20,       c20, s14, c13);

  // ==========
  // level 5
  wire c21,
       c22,
       c23,
       c24,
       c25;

  half_adder(result[4], c21, s16, c15);
  full_adder(result[5], c22, s17, c16, c21);
  full_adder(result[6], c23, s18, c17, c22);
  full_adder(result[7], c24, s19, c18, c23);
  full_adder(result[8], c25, s20, c19, c24);
  full_adder(result[9], cout, c14, c20, c25);

endmodule

