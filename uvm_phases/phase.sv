***************************************************************************
                              UVM_Phases
***************************************************************************

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
endfunction

function void start_of_simulation_phase(uvm_phase phase);
super.start_of_simulation_phase (phase);
$display("START_OF_SIMULATION_PHASE");
endfunction


task run_phase(uvm_phase phase);
super.run_phase(phase);
$display("RUN_PHASE");
endtask


function void extract_phase(uvm_phase phase);
super.extract_phase (phase);
$display("EXTRACT_PHASE");
endfunction


function void check_phase(uvm_phase phase);
super.check_phase (phase);
$display("CHECK_PHASE");
endfunction


function void report_phase(uvm_phase phase);
super.extract_phase (phase);
$display("REPORT_PHASE");
endfunction



function void final_phase(uvm_phase phase);
super.final_phase (phase);
$display("FINAL_PHASE");
endfunction


endclass

module top;
initial begin
	run_test("my_phase");
end
endmodule


OUTPUT:
# BUILD_PHASE
# CONNECT_PHASE
# END_OF_ELABORATION_PHASE
# START_OF_SIMULATION_PHASE
# RUN_PHASE
# EXTRACT_PHASE
# CHECK_PHASE
# REPORT_PHASE
# FINAL_PHASE


Note:get over at 0ns,you can also check interchange the phase and check the difference there is no change.it will execute same order only.




