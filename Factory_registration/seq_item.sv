class seq_item extends uvm_sequence_item;
rand int addr;
rand int data;
string name;

`uvm_object_utils_begin(seq_item)
`uvm_field_int (addr,UVM_ALL_ON)
`uvm_field_int (data,UVM_ALL_ON)
`uvm_field_string (name,UVM_ALL_ON)

`uvm_object_utils_end


function new(string name="seq_item");
super.new(name);
endfunction

endclass
