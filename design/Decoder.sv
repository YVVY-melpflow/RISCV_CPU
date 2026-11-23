module decoder (
  input  logic [31:0] i_instData,
  output logic [ 4:0] o_rs1     ,
  output logic [ 4:0] o_rd      ,
  output logic [11:0] o_imm12
);

  assign o_rs1   = i_instData[19:15];
  assign o_rd    = i_instData[11: 7];
  assign o_imm12 = i_instData[31:20];

endmodule