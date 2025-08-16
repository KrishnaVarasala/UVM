/*uvm_root
    |
    |
uvm_test
    |
    |
uvm_component
*/


`include "uvm_macros.svh"
import uvm_pkg::*;

class comp extends uvm_component;
  `uvm_component_utils(comp)
  
  function new(string name = "comp",uvm_component parent= null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Comp","Inside the build phase of Comp",UVM_NONE)
  endfunction
endclass

class test extends uvm_test;
  `uvm_component_utils(test)
  comp c;
  
  function new(string name = "test",uvm_component parent= null);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Test","Inside the build phase of TEST",UVM_NONE)
    //handle = name::type_id::create("handle",parent(this if parent is present component))
    c= comp::type_id::create("c",this);
  endfunction
endclass

module tb();
  test t;
  initial begin
    //handle = name::type_id::create("handle",null(if parent is not there, then it is from uvm_root i.e is null)
    t = test::type_id::create("t",null);                                   
    run_test();
  end
endmodule

output:

UVM_INFO @ 0: reporter [RNTST] Running test ...
UVM_INFO testbench.sv(37) @ 0: t [Test] Inside the build phase of TEST
UVM_INFO testbench.sv(23) @ 0: t.c [Comp] Inside the build phase of Comp
UVM_INFO /apps/vcsmx/vcs/U-2023.03-SP2//etc/uvm-1.2/src/base/uvm_report_server.svh(904) @ 0: reporter [UVM/REPORT/SERVER] 
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    4
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[Comp]     1
[RNTST]     1
[Test]     1
[UVM/RELNOTES]     1
