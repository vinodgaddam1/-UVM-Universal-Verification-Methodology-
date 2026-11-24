**************************************************************************
                              UVM_OBJECTIONS
**************************************************************************


`include "uvm_pkg.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;

class my_phase extends uvm_component;
`uvm_component_utils(my_phase)

function new(string name="my_phase",uvm_component parent = null);
	super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase (phase);
$display("BUILD_PHASE");
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase (phase);
$display("CONNECT_PHASE");
endfunction


function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase (phase);
$display("END_OF_ELABORATION_PHASE");
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection(this);
$display("RUN_PHASE");   
#100;
phase.phase_done.set_drain_time(this,200);
phase.drop_objection(this);
endtask
endclass

module top;
initial begin
run_test("my_phase");
end
endmodule






