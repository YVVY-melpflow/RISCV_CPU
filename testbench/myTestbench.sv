`timescale 1ns / 1ps

module myTestbench;
  logic clock ;
  logic resetn;

  myCPU iCPU (
    .i_clock (clock ),
    .i_resetn(resetn)
  );

  // 波形出力，ログフォーマット，Sim 時間の設定
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, myTestbench);
  
    $timeformat(-9, 1, " ns", 9);

    #100
    $finish;
  end

  // リセット
  initial begin
    resetn = 1'b1;
    #10
    resetn = 1'b0;
    $display("[%t] ===== RESET ASSERT   =====", $time);
    #20
    resetn = 1'b1;
    $display("[%t] ===== RESET DEASSERT =====", $time);
  end

  // クロック．リセット解除後に動き出す
  initial begin
    clock = 1'b0;
    #50
    clock = 1'b1;
    forever begin
      #5 clock = ~clock;
    end
  end

  // ログ出力
  always @(posedge resetn or posedge clock) begin
    $strobe("[%t] PC = %8x", $time, iCPU.w_PC);  
  end
endmodule