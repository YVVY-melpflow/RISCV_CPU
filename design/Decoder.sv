module Decoder (
  input  logic [31:0] i_instData,
  output logic [ 4:0] o_rs1     ,
  output logic [ 4:0] o_rd      ,
  output logic [ 2:0] o_funct3  ,
  output logic [ 6:0] o_opcode  ,
  output logic [11:0] o_imm12
);

  // register
  assign o_rs1    = i_instData[19:15];
  assign o_rd     = i_instData[11: 7];

  // opcode / funct
  assign o_funct3 = i_instData[14:12];
  assign o_opcode = i_instData[ 6: 0];

  // immediate
  assign o_imm12  = i_instData[31:20];

endmodule // Decoder