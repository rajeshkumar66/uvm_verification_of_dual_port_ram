class dpram_env extends uvm_env;
  
  `uvm_component_utils(dpram_env)
  
  dpram_agent agt;
  dpram_scoreboard scb;
  
  
  function new(string name="dpram_env",uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS","BUILD_PHASE",UVM_HIGH);
    agt=dpram_agent::type_id::create("agt",this);
    scb=dpram_scoreboard::type_id::create("scb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS","CONNECT_PHASE",UVM_HIGH); 
    agt.mon.monitor_port.connect(scb.scoreboard_port);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass

    
  
  
