module CPU (
  input  logic        i_clock ,
  input  logic        i_resetn,
  input  logic [31:0] i_instData,
  output logic [31:0] o_instAddr
);

  logic [ 4:0] l_rs1Index;
  logic [ 4:0] l_rd    ;
  logic [ 2:0] l_funct3;
  logic [ 6:0] l_opcode;
  logic [11:0] l_imm12 ;

  logic [31:0] l_rs1Data;

  ProgramCounter PC (
    .i_clock (i_clock   ),
    .i_resetn(i_resetn  ),
    .o_PC    (o_instAddr)
  );

  Decoder decoder (
    .i_instData(i_instData ),
    .o_rs1     (l_rs1Index),
    .o_rd      (l_rd       ),
    .o_funct3  (l_funct3   ),
    .o_opcode  (l_opcode   ),
    .o_imm12   (l_imm12    )
  );

  GeneralRegister generalRegister (
    .i_resetn   (i_resetn  ),
    .i_rs1_index(l_rs1Index),
    .o_rs1_data (l_rs1Data )
  );

endmodule // CPU