`timescale 1ns / 1ps
`include "CPU.svh"

module CPU (
  input  logic i_clock,
  input  logic i_resetn,

  input  logic [31:0] i_imemData,
  output logic [31:0] o_imemAddr
);

  logic [31:0] w_PC     ;
  logic [31:0] w_instr  ;
  logic [ 4:0] w_rs1Addr;
  logic [31:0] w_rs1Data;
  logic [ 4:0] w_rdAddr ;
  logic [31:0] w_imm    ;
  logic [31:0] w_result ;

  ProgramCounter ProgramCounter (
    .i_clock  (i_clock ),
    .i_resetn (i_resetn),
    .o_PC     (w_PC    )
  );

  assign o_imemAddr = w_PC;
  assign w_instr    = i_imemData;

  Decoder Decoder (
    .i_instr  (w_instr   ),
    .o_rs1Addr(w_rs1Addr ),
    .o_rdAddr (w_rdAddr  ),
    .o_imm    (w_imm     )
  );

  GPRegister GPRegister (
    .i_resetn (i_resetn  ),
    .i_rs1Addr(w_rs1Addr ),
    .o_rs1Data(w_rs1Data )
  );

  ALU ALU (
    .i_inA   (w_rs1Data ),
    .i_inB   (w_imm     ),
    .o_result(w_result  )
  );

`ifdef LOG_OUT
  LogWriter LogWriter (
    .i_clock    (i_clock   ),
    .i_resetn   (i_resetn  ),
    .i_PC       (w_PC      ),
    .i_imemAddr (o_imemAddr),
    .i_imemData (i_imemData),
    .i_instr    (w_instr   ),
    .i_rs1Addr  (w_rs1Addr ),
    .i_rs1Data  (w_rs1Data ),
    .i_inA   (w_rs1Data ),
    .i_inB   (w_imm     ),
    .i_result(w_result  )
  );
`endif

endmodule