//inbuilt methods are there in UVM : print, clone, copy , compare etc..
//this code will illustrate the UVM_Print method

`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
  rand bit[3:0] data;
  function new(string name = "transaction");
    super.new(name);
  endfunction
  
  `uvm_object_utils_begin(transaction) 
    //`uvm_field_int(Argument(variable),FLAG);
  `uvm_field_int(data,UVM_PRINT | UVM_DEC)
  `uvm_object_utils_end
  
endclass

module tb();
  transaction tr;
  
  initial begin
    tr = new("tr");
    repeat(10)begin
    tr.randomize();
    end
    tr.print(uvm_default_table_printer);            //print will be in 3 formats : tree , table(default) , line
  end
endmodule

//this is a inbuilt implementation, it is less efficient. if we want to have our own implementations, do hooks

output:

**table_printer:**

--------------------------------
Name    Type         Size  Value
--------------------------------
tr      transaction  -     @336 
  data  integral     4     9    
--------------------------------

**tree_printer:**

tr: (transaction@336) {
  data: 9 
}

**line_printer:**

tr: (transaction@336) { data: 9  } 





