`timescale 1ns / 1ps

module tb_CPU;

  logic clock;
  logic resetn;

  initial begin
    $timeformat(-9, 0, " ns", 10);
    #100 $finish;
  end

  /* clock */
  initial begin
        clock  = 1'b0;
    #30 clock  = 1'b1;
    $display("At time %04d ns, ====== CLOCK   ASSERT ======", $time);
    forever #5 clock = ~clock;
  end

  /* reset */
  initial begin
        resetn = 1'b0;
    $display("At time %04d ns, ====== RESET   ASSERT ======", $time);
    #15 resetn = 1'b1;
    $display("At time %04d ns, ====== RESET DEASSERT ======", $time);
  end

  /* CPU */
  logic [31:0] w_imemAddr;
  logic [31:0] w_imemData;

  CPU CPU (
    .i_clock   (clock     ),
    .i_resetn  (resetn    ),
    .i_imemData(w_imemData),
    .o_imemAddr(w_imemAddr)
  );

  InstructionMemory InstructionMemory (
    .i_addr    (w_imemAddr),
    .o_data    (w_imemData)
  );

endmodule // test