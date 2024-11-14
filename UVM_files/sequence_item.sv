class dpram_sequence_item extends uvm_sequence_item;
  
  `uvm_object_utils(dpram_sequence_item)
  
  rand bit wr_en1,wr_en2;
  rand logic [7:0] addr1,addr2;
  rand logic [7:0] data1,data2;
  logic [7:0] data_out1,data_out2;
  
  bit [7:0] last_value;
  
  bit [31:0] prev_addr1, prev_addr2;
  
  constraint addr_repeat {
    // Randomize addr1 with distribution
    addr1 dist {
        last_value := 50,   // Repeat the last value after 50 cycles
        0 :/ 5,             // 0 value has a 5% chance
        [1:255] :/ 45        // Values from 1 to 255 have a 45% chance
    };
    
    // addr2 must not match addr1 during randomization
    addr2 != addr1 dist {
        [0:255] :/ 50       // Random addr2 values with 50% chance
    };
    
    // Prevent repeating the previous values immediately
    addr1 != prev_addr1;
    addr2 != prev_addr2;
}
  
  function new(string name="dpram_sequence_item");
    super.new(name);
    `uvm_info("SEQ_ITEM_CLASS","INSIDE_CONSTRUCTOR",UVM_HIGH);
  endfunction
  
endclass

    
  
  
