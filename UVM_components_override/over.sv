`include "uvm_pkg.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;
class com_A extends uvm_component;
	`uvm_component_utils(com_A)


	function new(string name="com_A",uvm_component parent =null);
		super.new(name,parent);
	endfunction


virtual function void display();
$display("VINOD");
`uvm_info(get_type_name(),$sformatf("Inside COM_A"),UVM_LOW)
endfunction


endclass

class com_B extends com_A;
	`uvm_component_utils(com_B)


  function new(string name="com_B",uvm_component parent =null);
		super.new(name,parent);
	endfunction

 function void display();
   $display("KUMAR");
`uvm_info(get_type_name(),$sformatf("Inside COM_B"),UVM_LOW)
endfunction

endclass


class my_test extends uvm_test;
`uvm_component_utils(my_test);
com_A com;

	function new(string name="my_test",uvm_component parent =null);
		super.new(name,parent);
	endfunction


	function void build_phase (uvm_phase phase);
        uvm_factory factory =uvm_factory::get();
	super.build_phase(phase);
	//set_inst_override("*", "com_A","com_B");//default case instance
	//set_inst_override_by_type("*",com_A::get_type(),com_B::get_type());// (instance)-->by_type
	//factory.set_inst_override_by_name("com_A","com_B","*");// (instance)-->by_name
	//set_type_override("com_A","com_B");default case type
	//factory.set_type_override_by_name("com_A","com_B"); (type)-->by_name
	//factory.set_type_override_by_type(com_A::get_type(),com_B::get_type());// (type)-->by_type
	
	`uvm_info(get_type_name(),$sformatf("Inside MY_test"),UVM_LOW)
	com =com_A::type_id::create("com",this);
	factory.print();
	endfunction

	function void end_of_elaboration_phase (uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
	endfunction


	task run_phase (uvm_phase phase);
		super.run_phase(phase);
com.display();
	endtask



endclass




module top;
initial begin
  run_test("my_test");
end
endmodule
