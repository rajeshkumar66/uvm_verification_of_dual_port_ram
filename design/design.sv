
module dp_ram(
  input clk,rst_n,wr_en1,wr_en2,
  input [7:0] addr1,addr2,
  input [7:0] data1,data2,
  output reg [7:0] data_out1,data_out2
);
  
  parameter WIDTH=8;
  parameter DEPTH=256;
  reg [WIDTH-1:0] ram [DEPTH-1:0];
  
  always @(posedge clk) begin
    if(!rst_n) begin
      for(integer i=0;i<DEPTH-1;i=i+1)
        ram[i]<=0;
      data_out1<=0;
      data_out2<=0;
    end
    else begin
      if(wr_en1) 
        ram[addr1]<=data1;
      else
        data_out1<=ram[addr1];
    end
  end
  
  always @(posedge clk) begin
    if(!rst_n) begin
      for(integer i=0;i<DEPTH-1;i=i+1)
        ram[i]<=0;
      data_out1<=0;
      data_out2<=0;
    end
    else begin
      if(wr_en2) 
        ram[addr2]<=data2;
      else
        data_out2<=ram[addr2];
    end
  end
  
endmodule
        
        
  
