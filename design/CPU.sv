module CPU (
  input logic clock ,
  input logic resetn,
  input logic [31:0] instData,
  output logic [31:0] instAddr
);

  ProgramCounter PC (
    .clock  (clock ),
    .resetn (resetn),
    .out    (instAddr)
  );

endmodule // CPU