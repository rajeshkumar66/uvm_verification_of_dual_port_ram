class dpram_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(dpram_scoreboard);

  bit [7:0] mem[0:255];
  
  dpram_sequence_item transactions[$];
  uvm_analysis_imp#(dpram_sequence_item, dpram_scoreboard) scoreboard_port;

  function new(string name="dpram_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "INSIsDE_CONSTRUCTOR", UVM_HIGH);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "BUILD_PHASE", UVM_HIGH); 
    scoreboard_port = new("scoreboard_port", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "CONNECT_PHASE", UVM_HIGH); 
  endfunction

  function void write(dpram_sequence_item item);
    transactions.push_back(item);
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      dpram_sequence_item curr_trans;
      wait(transactions.size != 0);
      curr_trans = transactions.pop_front();
      compare(curr_trans);
    end
  endtask

  task compare(dpram_sequence_item curr_trans);
    if(curr_trans.wr_en1)
      mem[curr_trans.addr1] = curr_trans.data1;

    if(curr_trans.wr_en2)
      mem[curr_trans.addr2] = curr_trans.data2;

    if(!curr_trans.wr_en1) begin
      if(curr_trans.data_out1 == mem[curr_trans.addr1]) 
        `uvm_info("COMPARE", $sformatf("Transaction Passes ACT=%d EXP=%d", curr_trans.data_out1, mem[curr_trans.addr1]), UVM_LOW)
      else
        `uvm_error("COMPARE", $sformatf("Transaction Failed ACT=%d EXP=%d", curr_trans.data_out1, mem[curr_trans.addr1]))
    end

    if(!curr_trans.wr_en2) begin
      if(curr_trans.data_out2 == mem[curr_trans.addr2]) 
        `uvm_info("COMPARE", $sformatf("Transaction Passes ACT=%d EXP=%d", curr_trans.data_out2, mem[curr_trans.addr2]), UVM_LOW)
      else
        `uvm_error("COMPARE", $sformatf("Transaction Failed ACT=%d EXP=%d", curr_trans.data_out2, mem[curr_trans.addr2]))
    end
  endtask

endclass
