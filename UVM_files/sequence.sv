class dpram_test_sequence extends uvm_sequence;
  
  `uvm_object_utils(dpram_test_sequence);
  
  dpram_sequence_item item;
  
  function new(string name="dpram_test_sequence");
    super.new(name);
    `uvm_info("SEQ_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH);
  endfunction
  
  task body();
    `uvm_info("SEQ_CLASS","INSIDE_BODY",UVM_HIGH);
    item=dpram_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize();
    finish_item(item);
  endtask
  
endclass

    
  
  
