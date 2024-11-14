class dpram_driver extends uvm_driver#(dpram_sequence_item);
  
  `uvm_component_utils(dpram_driver)
  
  virtual dpram_inf inf;
  dpram_sequence_item item;
  
  function new(string name="dpram_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("DRIVER_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS","BUILD_PHASE",UVM_HIGH);
    if(!(uvm_config_db # (virtual dpram_inf)::get(this,"*","inf",inf)))
      `uvm_error("DRIVER_CLASS","Failed to get config db INF");
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS","CONNECT_PHASE",UVM_HIGH); 
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS","RUN_PHASE",UVM_HIGH); 
    forever begin
      item=dpram_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  endtask
  
  task drive(dpram_sequence_item item);
    @(posedge inf.clk);
    inf.wr_en1=item.wr_en1;
    inf.wr_en2=item.wr_en2;
    inf.data1=item.data1;
    inf.data2=item.data2;
    inf.addr1=item.addr1;
    inf.addr2=item.addr2;
  endtask
  
endclass

    
  
  
