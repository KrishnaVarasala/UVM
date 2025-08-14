
`include "uvm_macros.svh"
import uvm_pkg::*;

class comp extends uvm_component;
  `uvm_object_utils(comp)
  
  function new(string name = "transaction", uvm_component parent = null);             //this function new is having 2 arguments, as components having parent. it can be parent class name or UVM_ROOT(null)
    super.new(name,null);
  endfunction  
endclass

module tb();
  comp c;
  initial begin
    c = new("c");  //this is temporory, we have to use create method
  end
endmodule
