module CPU (
  input  logic        i_clock ,
  input  logic        i_resetn,
  input  logic [31:0] i_instData,
  output logic [31:0] o_instAddr
);

  ProgramCounter PC (
    .i_clock (i_clock   ),
    .i_resetn(i_resetn  ),
    .o_PC    (o_instAddr)
  );

endmodule // CPU