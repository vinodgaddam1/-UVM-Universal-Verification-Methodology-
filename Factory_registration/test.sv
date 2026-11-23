class test extends uvm_test;

`uvm_component_utils (test)

reg_sequencer sqr;
reg_seq sq;

function new(string name="test",uvm_component parent =null);
	super.new(name,parent);
endfunction



function void build_phase(uvm_phase phase);
	super.build_phase(phase);
 `uvm_info("TEST", "BUILD PHASE STARTED", UVM_LOW)
sqr = reg_sequencer::type_id::create("sqr",this);
endfunction 


task run_phase(uvm_phase phase);
  `uvm_info("TEST", "RUN PHASE STARTED", UVM_LOW)
	phase.raise_objection(this);
	sq =reg_seq::type_id::create ("sq");

        `uvm_info("TEST", "STARTING SEQUENCE", UVM_LOW)
 `uvm_info("TEST", "SEQUENCE COMPLETED", UVM_LOW)
	phase.drop_objection(this);

endtask
endclass
