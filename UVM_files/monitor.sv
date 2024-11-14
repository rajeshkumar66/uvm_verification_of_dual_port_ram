class dpram_monitor extends uvm_monitor;
  
  `uvm_component_utils(dpram_monitor);
   virtual dpram_inf inf;
  dpram_sequence_item item;
  
  uvm_analysis_port #(dpram_sequence_item) monitor_port;
  
  function new(string name="dpram_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONITOR_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS","BUILD_PHASE",UVM_HIGH);
    
    monitor_port=new("monitor_port",this);
    
    if(!(uvm_config_db # (virtual dpram_inf)::get(this,"*","inf",inf)))
      `uvm_error("MONITOR_CLASS","Failed to get config db INF");
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS","CONNECT_PHASE",UVM_HIGH); 
  endfunction
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS","RUN_PHASE",UVM_HIGH); 
    
    forever begin
      
    item=dpram_sequence_item::type_id::create("item");
    wait(inf.rst_n);
    
    @(posedge inf.clk);
    item.wr_en1=inf.wr_en1;
    item.wr_en2=inf.wr_en2;
    item.data1=inf.data1;
    item.data2=inf.data2;
    item.addr1=inf.addr1;
    item.addr2=inf.addr2;
    
    @(posedge inf.clk);
    item.data_out1=inf.data_out1;
    item.data_out2=inf.data_out2;
 
    monitor_port.write(item);
    end
  endtask
  
endclass

    
  
  
