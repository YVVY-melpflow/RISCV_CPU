module ALU (
  input  logic [31:0] i_inA,
  input  logic [31:0] i_inB,
  output logic [31:0] o_out
);

  assign o_out = i_inA + i_inB;

endmodule