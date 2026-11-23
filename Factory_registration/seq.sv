//UVM_sequence
class reg_seq extends uvm_sequence #(seq_item);

	`uvm_object_utils(reg_seq)

function new(string name= "reg_seq");
	super.new(name);
endfunction



task body();
	seq_item tx;
	repeat (10)begin
	tx =seq_item::type_id::create("tx");
	start_item(tx);
	assert(tx.randomize());
	finish_item(tx);
end
endtask

endclass





























