# 🚀 UVM-Universal-Verification-Methodology

 UVM (Universal Verification Methodology) is a standardized SystemVerilog-based verification methodology used to verify digital designs such as processors, memories, communication protocols, and other RTL designs. UVM provides a reusable, modular, and scalable testbench architecture that helps verification engineers develop testbenches efficiently and systematically.
# 🎯 Why Do We Use UVM?
1. ♻️ Reusability: Reuse verification components across multiple projects.
2. 🧩 Modularity: Divide the testbench into smaller, independent components.
3. 📈 Scalability: Easily extend the testbench for complex designs.
4. 🎲 Randomization: Generate different test scenarios using constrained-random stimulus.
5. 🤖 Automation: Automate stimulus generation, checking, and reporting.
6. 🐞 Debugging: Use built-in reporting mechanisms to identify errors.


# 🤖 UVM Architecture 
# <img width="959" height="1280" alt="WhatsApp Image 2026-11-22 at 6 29 37 PM" src="https://github.com/user-attachments/assets/b1373f4a-0d52-4ac6-92ef-d1b95596853b" />


# 📚 Important UVM Components
| Component | Description |
|---|---|
| 🧪 `uvm_test` | Top-level test that controls the verification scenario. |
| 🏗️ `uvm_env` | Container that holds agents, scoreboards, and other components. |
| 📦 `uvm_agent` | Groups driver, monitor, and sequencer. |
| 🎛️ `uvm_sequencer` | Controls and provides transactions to the driver. |
| 🚗 `uvm_driver` | Converts transactions into DUT pin-level signals. |
| 👀 `uvm_monitor` | Observes DUT signals and collects transactions. |
| 📊 `uvm_scoreboard` | Compares expected and actual results. |
| 🎲 `uvm_sequence` | Generates stimulus transactions. |
| 📝 `uvm_sequence_item` | Represents an individual transaction. |


# ⏳ UVM Phases
UVM provides predefined phases to control testbench execution.

# <img width="1080" height="1336" alt="WhatsApp Image 2026-11-22 at 6 47 02 PM" src="https://github.com/user-attachments/assets/97fe1cb4-9689-4d7b-8b31-08083493ae9b" />

🔨 Build-time phases:
- build_phase
- connect_phase
- end_of_elaboration_phase
- start_of_simulation_phase
▶️ Run-time phase:
- run_phase
📋 Clean-up phases:
- extract_phase
- check_phase
- report_phase
- final_phase

# 🚀 UVM Factory

What is UVM Factory?
The UVM Factory is a mechanism used to create UVM objects and components dynamically.

Instead of creating a class directly using new(), we use:

"type_id::create()"


| Concept | Meaning |
|---|---|
| Factory | Mechanism for controlled, flexible class creation |
| `new()` | Direct creation |
| `uvm_object_utils` | Registers an object class |
| `uvm_component_utils` | Registers a component class |
| `type_id::create()` | Creates through the Factory |
| Override | Replaces a requested type with another registered type |

# 📚 Factory Registration Macros

What is Factory Registration?
Factory registration means informing the UVM Factory that a particular class is available for Factory-based creation.

UVM provides two types:

1.uvm_object_utils
This macro is used for classes derived from uvm_object.

Examples:
- Sequence item
- Transaction
- Sequence
  
2.uvm_component_utils
This macro is used for classes derived from uvm_component.

Examples:
- Driver
- Monitor
- Agent
- Environment
- Scoreboard
- Test

1.What is type_id?
Whenever you write:

`uvm_object_utils(mem_tx)
UVM provides a Factory proxy type called type_id.We use it to create objects through the Factory.

Example:
class mem_tx extends uvm_sequence_item;

  `uvm_object_utils(mem_tx)

  function new(string name = "mem_tx");
    super.new(name);
  endfunction

endclass


2. What is get_type()?
get_type() returns the Factory proxy for the class.It is useful when registering Factory overrides.


class mem_tx extends uvm_sequence_item;

  `uvm_object_utils(mem_tx)

  function new(string name = "mem_tx");
    super.new(name);
  endfunction

endclass

Now:
mem_tx::get_type()

This returns the Factory wrapper associated with mem_tx.

3. What is get_type_name()?
get_type_name() returns the registered class's type name as a string.

Example:
class mem_tx extends uvm_sequence_item;

  `uvm_object_utils(mem_tx)

  function new(string name = "mem_tx");
    super.new(name);
  endfunction

endclass

Usage:
mem_tx tx;

tx = mem_tx::type_id::create("tx");

$display("TYPE NAME = %s", tx.get_type_name());

Output:
TYPE NAME = mem_tx


# Type Override
This is one of the most important concepts in UVM Factory.

1. What is Type Override?
Type Override means replacing one class with another class throughout Factory-based creation requests for the original class.


| No. | Method | Purpose |
|---|---|---|
| 1 | `type_id::create()` | Creates an object/component through Factory |
| 2 | `get_type()` | Returns the Factory proxy for a class |
| 3 | `get_type_name()` | Returns the class type name |
| 4 | `set_type_override()` | Replaces a class type globally |
| 5 | `set_inst_override()` | Replaces a class at a specific instance |
| 6 | `set_type_override_by_type()` | Sets type override using Factory proxies |
| 7 | `set_inst_override_by_type()` | Sets instance override using Factory proxies |
| 8 | `print()` | Prints Factory configuration |
| 9 | `debug_create_by_type()` | Debugs Factory creation by type |
| 10 | `debug_create_by_name()` | Debugs Factory creation by name |



