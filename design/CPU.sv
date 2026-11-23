module myCPU (
  input  logic        i_clock   ,
  input  logic        i_resetn  ,
  input  logic [31:0] i_instData,
  output logic [31:0] o_instAddr
);

  logic [ 4:0] w_rs1;
  logic [ 4:0] w_rd ;
  logic [11:0] w_imm12;

  logic [31:0] w_imm32;
  logic [31:0] w_rs1Data;
  logic [31:0] w_result;

  ProgramCounter u_ProgramCounter (
    .i_clock    (i_clock   ),
    .i_resetn   (i_resetn  ),
    .o_PC       (o_instAddr)
  );

  decoder u_decoder (
    .i_instData (i_instData),
    .o_rs1      (w_rs1     ),
    .o_rd       (w_rd      ),
    .o_imm12    (w_imm12   )
  );

  immExtender u_immExtender (
    .i_imm12    (w_imm12   ),
    .o_imm32    (w_imm32   )
  );

  registerFile u_registerFile (
    .i_clock    (i_clock   ),
    .i_resetn   (i_resetn  ),
    .i_rs1Index (w_rs1     ),
    .i_rdIndex  (w_rd      ),
    .i_writeData(w_result  ),
    .o_rs1Data  (w_rs1Data )
  );

  ALU u_ALU (
    .i_inA      (w_rs1Data ),
    .i_inB      (w_imm32   ),
    .o_out      (w_result  )
  );
endmodule