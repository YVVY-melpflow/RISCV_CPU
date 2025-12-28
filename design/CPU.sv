`include "CPU.svh"

module CPU (
  input  logic i_clock,
  input  logic i_resetn
);

  logic [31:0] w_PC;

  ProgramCounter ProgramCounter (
    .i_clock  (i_clock ),
    .i_resetn (i_resetn),
    .o_PC     (w_PC    )
  );

endmodule