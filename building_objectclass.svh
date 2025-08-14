//creating UVM_object

`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_object;
  `uvm_object_utils(transaction)
  
  function new(string name = "transaction");                             //objects will have only one argument,because no parent
    super.new(name);
  endfunction  
endclass

module tb();  
  transaction tx;
  initial begin
    tx = new("tx");  //this is temporory, we have to use create method to use the UVM_Factory overriden
  end
endmodule
