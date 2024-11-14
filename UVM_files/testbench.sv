import uvm_pkg::*;

`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

`timescale 1ns/1ps
module tb_top;
  
  logic clk=1,rst_n=0;
  parameter clk_period=10;
  
  always #(clk_period/2) clk=~clk;
  
  dpram_inf inf(.clk(clk),
                .rst_n(rst_n)
               );
  
  dp_ram dut(
    .clk(inf.clk),
    .rst_n(inf.rst_n),
    .wr_en1(inf.wr_en1),
    .wr_en2(inf.wr_en2),
    .addr1(inf.addr1),
    .addr2(inf.addr2),
    .data1(inf.data1),
    .data2(inf.data2),
    .data_out1(inf.data_out1),
    .data_out2(inf.data_out2)
  );
  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    #clk_period rst_n=1;
    #5000 $finish;
  end
  
  initial begin
    run_test("dpram_test");
  end
  
  initial begin
    uvm_config_db # (virtual dpram_inf)::set(null,"*","inf",inf);
  end
  
endmodule


    
  
