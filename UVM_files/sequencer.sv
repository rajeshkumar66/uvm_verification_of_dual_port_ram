class dpram_sequencer extends uvm_sequencer#(dpram_sequence_item);
  
  `uvm_component_utils(dpram_sequencer);
  
  function new(string name="dpram_sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SEQUENCER_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER_CLASS","BUILD_PHASE",UVM_HIGH); 
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENCER_CLASS","CONNECT_PHASE",UVM_HIGH); 
  endfunction
  
endclass

    
  
  
