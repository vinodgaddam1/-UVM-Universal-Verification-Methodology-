//code with `uvm_object_utils 
`include "uvm_pkg.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;

typedef enum {
RED,GREEN,BLUE
}color_type;

class my_obj extends uvm_object;

rand int o_var;
    string o_name;
rand color_type color;
rand byte data[4];// bit [7:0]data[3:0]
rand bit [7:0]addr;
`uvm_object_utils(my_obj)

function new(string name = "my_obj");
	super.new(name);
endfunction

function void display();
 $display("o_var = %0d", o_var);
        $display("o_name = %0s", o_name);
        $display("color = %0s", color.name());
        $display("addr = %0h", addr);	
	  foreach(data[i])
            $display("data[%0d] = %0d", i, data[i]);
endfunction
endclass


module top;
my_obj obj;
initial begin
	obj=new();
	obj.randomize();
	obj.o_name="Vinod";
	//obj.display();
	obj.print();
end
endmodule

OUTPUT:
# o_var = 136246735
# o_name = Vinod
# color = BLUE
# addr = f9
# data[0] = -89
# data[1] = -66
# data[2] = -125
# data[3] = 33

//code with `uvm_object_utils_begin and `uvm_object_utils_end
typedef enum {
RED,GREEN,BLUE
}color_type;

class my_obj extends uvm_object;

rand int o_var;
    string o_name;
rand color_type color;
rand byte data[4];
`uvm_object_utils_begin(my_obj)
`uvm_field_int(o_var,UVM_ALL_ON)
`uvm_field_string(o_name,UVM_ALL_ON)
`uvm_field_enum(color_type,color,UVM_ALL_ON)
`uvm_field_sarray_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj obj;
initial begin
	obj=new();
	if(!obj.randomize())
	$display("Randomization is failed")
	else
	obj.o_name="Vinod";
	obj.print();
end
endmodule

OUTPUT:
# ---------------------------------------
# Name      Type          Size  Value    
# ---------------------------------------
# my_obj    my_obj        -     @355     
#   o_var   integral      32    'hb2ee751
#   o_name  string        5     Vinod    
#   color   color_type    32    GREEN    
#   data    sa(integral)  4     -        
#     [0]   integral      8     'h7c     
#     [1]   integral      8     'hc5     
#     [2]   integral      8     'hab     
#     [3]   integral      8     'hb9     
# ---------------------------------------



//Print Method 
//code with `uvm_object_utils 
`include "uvm_pkg.sv"
`include "uvm_macros.svh"
import uvm_pkg::*;
typedef enum {
RED,GREEN,BLUE
}color_type;

class my_obj extends uvm_object;

rand int o_var;
    string o_name;
rand color_type color;
rand byte data[4];
rand bit [7:0]addr;
`uvm_object_utils(my_obj)

function new(string name = "my_obj");
	super.new(name);
endfunction

function void display();
 $display("o_var = %0d", o_var);
        $display("o_name = %0s", o_name);
        $display("color = %0s", color.name());
        $display("addr = %0h", addr);	
	  foreach(data[i])
            $display("data[%0d] = %0d", i, data[i]);
endfunction
endclass


module top;
my_obj obj;
initial begin
	obj=new();
	obj.randomize();
	obj.o_name="Vinod";
	obj.display();
end
endmodule
OUTPUT:
# o_var = 136246735
# o_name = Vinod
# color = BLUE
# addr = f9
# data[0] = -89
# data[1] = -66
# data[2] = -125
# data[3] = 33

//code with `uvm_object_utils_begin and `uvm_object_utils_end
typedef enum {
RED,GREEN,BLUE
}color_type;

class my_obj extends uvm_object;

rand int o_var;
    string o_name;
rand color_type color;
rand byte data[4];
`uvm_object_utils_begin(my_obj)
`uvm_field_int(o_var,UVM_ALL_ON)
`uvm_field_string(o_name,UVM_ALL_ON)
`uvm_field_enum(color_type,color,UVM_ALL_ON)
`uvm_field_sarray_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj obj;
initial begin
	obj=new();
	if(!obj.randomize());
	$display("Randomization is failed");
	else
	obj.o_name="Vinod";
	obj.print();
end
endmodule

OUTPUT:
# ---------------------------------------
# Name      Type          Size  Value    
# ---------------------------------------
# my_obj    my_obj        -     @355     
#   o_var   integral      32    'hb2ee751
#   o_name  string        5     Vinod    
#   color   color_type    32    GREEN    
#   data    sa(integral)  4     -        
#     [0]   integral      8     'h7c     
#     [1]   integral      8     'hc5     
#     [2]   integral      8     'hab     
#     [3]   integral      8     'hb9     
# ---------------------------------------



//Print Method 

typedef enum {
RED,GREEN,BLUE
}color_type;

class my_temp extends uvm_object;
rand color_type color;
rand byte data[4];
`uvm_object_utils_begin(my_temp)
`uvm_field_enum(color_type,color,UVM_ALL_ON)
`uvm_field_sarray_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_temp");
	super.new(name);
endfunction
endclass

class my_obj extends uvm_object;
rand int o_var;
    string o_name;
rand my_temp tmp;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(o_var,UVM_ALL_ON)
`uvm_field_string(o_name,UVM_ALL_ON)
`uvm_field_object(tmp,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
tmp = my_temp::type_id::create("tmp");
this.o_name = "VINOD";
endfunction
endclass


class my_test extends uvm_test;
`uvm_component_utils(my_test)
my_obj obj;
function new(string name="my_test",uvm_component parent =null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
obj=my_obj::type_id::create("obj");
assert (obj.randomize());
//obj.print();
//obj.print(uvm_default_line_printer);
//obj.print(uvm_default_line_printer);
  obj.print(uvm_default_tree_printer);

endfunction
endclass


module top;
initial begin
run_test("my_test");
end
endmodule

OUTPUT: TABLE PRINT
# -----------------------------------------
# Name       Type          Size  Value     
# -----------------------------------------
# obj        my_obj        -     @367      
#   o_var    integral      32    'hc14d9a86
#   o_name   string        5     VINOD     
#   tmp      my_temp       -     @368      
#     color  color_type    32    GREEN     
#     data   sa(integral)  4     -         
#       [0]  integral      8     'h58      
#       [1]  integral      8     'he4      
#       [2]  integral      8     'h30      
#       [3]  integral      8     'h37      
# -----------------------------------------


OUTPUT:LINE PRINT
# obj: (my_obj@367) { o_var: 'hc14d9a86  o_name: VINOD  tmp: (my_temp@368) { color: GREEN  data: { [0]: 'h58  [1]: 'he4  [2]: 'h30  [3]: 'h37  } } }


//OUTPUT:TREE PRINT

# obj: (my_obj@367) {
#   o_var: 'hc14d9a86 
#   o_name: VINOD 
#   tmp: (my_temp@368) {
#     color: GREEN 
#     data: {
#       [0]: 'h58 
#       [1]: 'he4 
#       [2]: 'h30 
#       [3]: 'h37 
#     }
#   }
# }



//copy and clone method in UVM
//COPY
class my_obj extends uvm_object;
rand int addr;
rand int data;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(addr,UVM_ALL_ON)
`uvm_field_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj b1,b2;
initial begin
b1=my_obj::type_id::create("b1");
b2=my_obj::type_id::create("b2");
b1.randomize();
b2.copy(b1);
b1.print();
b2.print();
end
endmodule
OUTPUT: COPY
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b1      my_obj    -     @355      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b2      my_obj    -     @356      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------

//CLONE
class my_obj extends uvm_object;
rand int addr;
rand int data;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(addr,UVM_ALL_ON)
`uvm_field_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj b1,b2;
initial begin
b1=my_obj::type_id::create("b1");
b1.randomize();

//clone object
$cast(b2, b1.clone());
b2.print();

$display("ORGINAL OBJECT");
b1.print();

$display("CLONE OBJECT");
b2.print();
end
endmodule


OUTPUT:
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b1      my_obj    -     @356      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------
# ORGINAL OBJECT
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b1      my_obj    -     @355      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------
# CLONE OBJECT
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b1      my_obj    -     @356      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------


//Compare
class my_obj extends uvm_object;
 int data1;
 int data2;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(data1,UVM_ALL_ON)
`uvm_field_int(data2,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj b1,b2;
initial begin
b1=my_obj::type_id::create("b1");
b2=my_obj::type_id::create("b2");
b1.data1 = 100;
b1.data2 = 100;
b2.data1 = 100;
b2.data2 = 100;
if(b1.compare(b2))
$display("compare is pass ");
else
$display("compare is fail ");
end
endmodule

OUTPUT;
# compare is pass 


//pack()
class my_obj extends uvm_object;
rand  int addr;
rand int data;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(addr,UVM_ALL_ON)
`uvm_field_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj b1;
bit packed_data[];
initial begin
b1=my_obj::type_id::create("b1");
b1.pack(packed_data);
if (!b1.randomize())
	$fatel("Randomizeation failed");
b1.print();
foreach (packed_data[i])
	$display("Packed_data[%0d] = %0h",i,packed_data[i]);
end
endmodule

OUTPUT:
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b1      my_obj    -     @355      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------
# Packed_data[0] = 0
# Packed_data[1] = 0
# Packed_data[2] = 0
# Packed_data[3] = 0
# Packed_data[4] = 0
# Packed_data[5] = 0
# Packed_data[6] = 0
# Packed_data[7] = 0
# Packed_data[8] = 0
# Packed_data[9] = 0
# Packed_data[10] = 0
# Packed_data[11] = 0
# Packed_data[12] = 0
# Packed_data[13] = 0
# Packed_data[14] = 0
# Packed_data[15] = 0
# Packed_data[16] = 0
# Packed_data[17] = 0
# Packed_data[18] = 0
# Packed_data[19] = 0
# Packed_data[20] = 0
# Packed_data[21] = 0
# Packed_data[22] = 0
# Packed_data[23] = 0
# Packed_data[24] = 0
# Packed_data[25] = 0
# Packed_data[26] = 0
# Packed_data[27] = 0
# Packed_data[28] = 0
# Packed_data[29] = 0
# Packed_data[30] = 0
# Packed_data[31] = 0
# Packed_data[32] = 0
# Packed_data[33] = 0
# Packed_data[34] = 0
# Packed_data[35] = 0
# Packed_data[36] = 0
# Packed_data[37] = 0
# Packed_data[38] = 0
# Packed_data[39] = 0
# Packed_data[40] = 0
# Packed_data[41] = 0
# Packed_data[42] = 0
# Packed_data[43] = 0
# Packed_data[44] = 0
# Packed_data[45] = 0
# Packed_data[46] = 0
# Packed_data[47] = 0
# Packed_data[48] = 0
# Packed_data[49] = 0
# Packed_data[50] = 0
# Packed_data[51] = 0
# Packed_data[52] = 0
# Packed_data[53] = 0
# Packed_data[54] = 0
# Packed_data[55] = 0
# Packed_data[56] = 0
# Packed_data[57] = 0
# Packed_data[58] = 0
# Packed_data[59] = 0
# Packed_data[60] = 0
# Packed_data[61] = 0
# Packed_data[62] = 0
# Packed_data[63] = 0


//Flag PRINT
typedef enum {
RED,GREEN,BLUE
}color_type;

class my_obj extends uvm_object;

rand int o_var;
    string o_name;
rand color_type color;
rand byte data[4];
`uvm_object_utils_begin(my_obj)
`uvm_field_int(o_var, UVM_NOPRINT)
`uvm_field_string(o_name,UVM_ALL_ON)
`uvm_field_enum(color_type,color,UVM_ALL_ON)
`uvm_field_sarray_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj obj;
initial begin
	obj=new();
	if(!obj.randomize())
	$display("Randomization is failed");
	else
	obj.o_name="Vinod";
	obj.print();
end
endmodule

//OUTPUT:
# -----------------------------------
# Name      Type          Size  Value
# -----------------------------------
# my_obj    my_obj        -     @355 
#   o_name  string        5     Vinod
#   color   color_type    32    GREEN
#   data    sa(integral)  4     -    
#     [0]   integral      8     'h7c 
#     [1]   integral      8     'hc5 
#     [2]   integral      8     'hab 
#     [3]   integral      8     'hb9 
# -----------------------------------


//FLAG  NOCOPY
class my_obj extends uvm_object;
rand int addr;
rand int data;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(addr,UVM_NOCOPY)
`uvm_field_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj b1,b2;
initial begin
b1=my_obj::type_id::create("b1");
b2=my_obj::type_id::create("b2");
b1.randomize();
b2.copy(b1);
b1.print();
b2.print();
end
endmodule

OUPTUT:
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b1      my_obj    -     @355      
#   addr  integral  32    'hdef25da4
#   data  integral  32    'hd60a92de
# ----------------------------------
# ----------------------------------
# Name    Type      Size  Value     
# ----------------------------------
# b2      my_obj    -     @356      
#   addr  integral  32    'h0       
#   data  integral  32    'hd60a92de
# ----------------------------------



//FLAG NOCOMPARE
class my_obj extends uvm_object;
 int data1;
 int data2;
`uvm_object_utils_begin(my_obj)
`uvm_field_int(data1,UVM_NOCOMPARE)
`uvm_field_int(data2,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj b1,b2;
initial begin
b1=my_obj::type_id::create("b1");
b2=my_obj::type_id::create("b2");
b1.data1 = 100;
b1.data2 = 200;
b2.data1 = 100;
b2.data2 = 100;
if(b1.compare(b2))
$display("compare is pass ");
else
$display("compare is fail ");
end
endmodule

OUTPUT;
# compare is fail 

//Base can be specified
//UVM_BIN/UVM_HEX/UVM_DEC/UVM_OCT
typedef enum {
RED,GREEN,BLUE
}color_type;

class my_obj extends uvm_object;

rand int o_var;
    string o_name;
rand color_type color;
rand byte data[4];
`uvm_object_utils_begin(my_obj)
`uvm_field_int(o_var, UVM_ALL_ON | UVM_BIN)
`uvm_field_string(o_name,UVM_ALL_ON)
`uvm_field_enum(color_type,color,UVM_ALL_ON)
`uvm_field_sarray_int(data,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "my_obj");
	super.new(name);
endfunction
endclass


module top;
my_obj obj;
initial begin
	obj=new();
	if(!obj.randomize())
	$display("Randomization is failed");
	else
	obj.o_name="Vinod";
	obj.print();
end
endmodule

OUTPUT:
# ------------------------------------------------------------
# Name      Type          Size  Value                         
# ------------------------------------------------------------
# my_obj    my_obj        -     @355                          
#   o_var   integral      32    'b1011001011101110011101010001
#   o_name  string        5     Vinod                         
#   color   color_type    32    GREEN                         
#   data    sa(integral)  4     -                             
#     [0]   integral      8     'h7c                          
#     [1]   integral      8     'hc5                          
#     [2]   integral      8     'hab                          
#     [3]   integral      8     'hb9                          
# ------------------------------------------------------------
*/



















