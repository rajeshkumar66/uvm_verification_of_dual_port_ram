interface dpram_inf (input logic clk,rst_n);

  bit wr_en1,wr_en2;
  logic [7:0] addr1,addr2;
  logic [7:0] data1,data2;
  logic [7:0] data_out1,data_out2;
  
endinterface
  
  
  
  
