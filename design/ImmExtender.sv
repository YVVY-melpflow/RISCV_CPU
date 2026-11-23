module immExtender (
  input  logic [11:0] i_imm12,
  output logic [31:0] o_imm32
);

  assign o_imm32 = 32'(signed'(i_imm12));

endmodule