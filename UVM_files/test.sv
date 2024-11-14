class dpram_test extends uvm_test;
  
  `uvm_component_utils(dpram_test);
  
  dpram_env env;
  
  dpram_test_sequence test_seq;
  
  function new(string name="dpram_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("TEST_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS","BUILD_PHASE",UVM_HIGH); 
    env=dpram_env::type_id::create("env",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS","CONNECT_PHASE",UVM_HIGH); 
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    repeat(250) begin
    test_seq=dpram_test_sequence::type_id::create("test_seq");
    test_seq.start(env.agt.seqr);
    #10;
    end
    phase.drop_objection(this);
  endtask
  
endclass

    
  
  
