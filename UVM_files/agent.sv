class dpram_agent extends uvm_agent;
  
  `uvm_component_utils(dpram_agent)
  
  dpram_driver drv;
  dpram_monitor mon;
  dpram_sequencer seqr;
  
  function new(string name="dpram_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS","BUILD_PHASE",UVM_HIGH)
    drv=dpram_driver::type_id::create("drv",this);
    mon=dpram_monitor::type_id::create("mon",this);
    seqr=dpram_sequencer::type_id::create("seqr",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS","CONNECT_PHASE",UVM_HIGH)
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass

    
  
  
