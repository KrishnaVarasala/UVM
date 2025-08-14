//if we use new() method in UVM it will construct the component, but factory will not able to override
//hence, in UVM create method is used instead of UVM
//all the classed -> create 
//only for tlm_ports -> new

`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
  rand bit[3:0] a;
  rand bit[3:0] b;
  bit [3:0] y;
  
  function new(string name= "transaction");
    super.new(name);
  endfunction
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(a,UVM_DEFAULT)
  `uvm_field_int(a,UVM_DEFAULT)
  `uvm_field_int(y,UVM_DEFAULT)
  `uvm_object_utils_end  
endclass

module tb();
  transaction tr;
  initial begin
    tr = transaction::type_id::create("tr");           //create_method
    tr.randomize();
    tr.print();
  end
endmodule
