`timescale 1ns / 1ps

module tb_CPU;

  logic clock;
  logic resetn;

  initial begin
    $timeformat(-9, 0, " ns", 10);
    #95 $finish;
  end

  /* clock */
  initial begin
        clock  = 1'b0;
    #30 clock  = 1'b1;
    $display("At time %t, CLOCK ASSERT", $time);
    forever #5 clock = ~clock;
  end

  /* reset */
  initial begin
        resetn = 1'b0;
    $display("At time %t, RESET ASSERT", $time);
    #15 resetn = 1'b1;
    $display("At time %t, RESET DEASSERT", $time);
  end

  /* CPU */
  CPU CPU (
    .i_clock (clock ),
    .i_resetn(resetn)
  );

endmodule // test