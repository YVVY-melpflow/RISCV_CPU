module CPU (
  input logic clock ,
  input logic resetn
);

  logic [31:0] PC_out;

  ProgramCounter PC (
    .clock  (clock ),
    .resetn (resetn),
    .out    (PC_out)
  );

endmodule // CPU