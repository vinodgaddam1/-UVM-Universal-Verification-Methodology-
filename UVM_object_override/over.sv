`include "uvm_pkg.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;

class trans_A extends uvm_sequence_item;

    `uvm_object_utils(trans_A)


    function new(string name = "trans_A");
        super.new(name);
    endfunction

    virtual function void display();

        `uvm_info(get_type_name(),
                  "Inside trans_A",
                  UVM_LOW)

    endfunction

endclass


class trans_B extends trans_A;

    `uvm_object_utils(trans_B)


    function new(string name = "trans_B");
        super.new(name);
    endfunction

    function void display();

        `uvm_info(get_type_name(),
                  "Inside trans_B",
                  UVM_LOW)

    endfunction

endclass


class my_test extends uvm_test;

    `uvm_component_utils(my_test)

    trans_A tx_a;


    function new(string name = "my_test",
                 uvm_component parent = null);

        super.new(name, parent);

    endfunction


    function void build_phase(uvm_phase phase);

        uvm_factory factory = uvm_factory::get();

        super.build_phase(phase);

        // Object Type Override

       //trans_A::type_id::set_type_override(trans_B::get_type());
      //set_type_override_by_type(trans_A::get_type(),trans_B::get_type());
      //factory.set_type_override_by_name("trans_A","trans_B");
      factory.set_inst_override_by_type(trans_A::get_type(),trans_B::get_type(),"*"); 
      //factory.set_inst_override_by_name("trasn_A","trans_B","*"); 
      
      
      
      // Factory Creation

        tx_a = trans_A::type_id::create("tx_a");

        // Factory Information

        factory.print();

    endfunction


    function void end_of_elaboration_phase(uvm_phase phase);

        super.end_of_elaboration_phase(phase);

        uvm_top.print_topology();

    endfunction


    task run_phase(uvm_phase phase);

        super.run_phase(phase);


        tx_a.display();

    endtask

endclass


module tb_top;

    initial begin

        run_test("my_test");

    end

endmodule
