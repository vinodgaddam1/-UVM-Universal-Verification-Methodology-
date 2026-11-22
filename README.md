# 🚀 UVM-Universal-Verification-Methodology

# UVM (Universal Verification Methodology) is a standardized SystemVerilog-based verification methodology used to verify digital designs such as processors, memories, communication protocols, and other RTL designs. UVM provides a reusable, modular, and scalable testbench architecture that helps verification engineers develop testbenches efficiently and systematically.
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






















