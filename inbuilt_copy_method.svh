//Copy_method
//it acts like a deepcopy in system verilog

`include "uvm_macros.svh"
import uvm_pkg::*;

class temp extends uvm_object;
  bit[3:0] temp_data;
  
  function new(string name = "temp");
    super.new(name);
  endfunction
  
  `uvm_object_utils_begin(temp)
  `uvm_field_int(temp_data,UVM_COPY);
  `uvm_object_utils_end

endclass


class transaction extends uvm_sequence_item;
  rand bit[3:0] data;
  temp t;
 
  function new(string name = "transaction");
    super.new(name);
    t= new("t");
  endfunction
  
  `uvm_object_utils_begin(transaction) 
    //`uvm_field_int(Argument(variable),FLAG);
  `uvm_field_int(data,UVM_DEFAULT)
  `uvm_field_object(t,UVM_DEFAULT)
  `uvm_object_utils_end
  
endclass

module tb();
  transaction tr_a,tr_b;
  
  initial begin
    tr_a = new("tr_a");
    tr_b = new("tr_b");
    tr_a.randomize();
    tr_a.t.temp_data=7;
    tr_a.print(uvm_default_table_printer); 
    //copying tr_a into tr_b
    tr_b.copy(tr_a);
    tr_b.print();
    //try to change value of tem_data in copy
    tr_b.t.temp_data = 8;
    tr_a.print();
    tr_b.print();
   //if both values have different values, we can say that it is a deepcopy
    //hence copy method in uvm is a deep copy
  end
endmodule

output:
---------------------------------------
Name           Type         Size  Value                  //original(tr_a)
---------------------------------------
tr_a           transaction  -     @336 
  data         integral     4     'h9  
  t            temp         -     @340 
    temp_data  integral     4     'h7  
---------------------------------------
---------------------------------------
Name           Type         Size  Value                  //Copy(tr_b)
---------------------------------------
tr_b           transaction  -     @341 
  data         integral     4     'h9  
  t            temp         -     @346 
    temp_data  integral     4     'h7  
---------------------------------------
---------------------------------------
Name           Type         Size  Value                  //after copy and changing the value in copy(tr_b), values in original(tr_a) remains unchanged
---------------------------------------
tr_a           transaction  -     @336 
  data         integral     4     'h9  
  t            temp         -     @340 
    temp_data  integral     4     'h7  
---------------------------------------
---------------------------------------
Name           Type         Size  Value                 //after changing values only copy(tr_b) values changed. i.e same like deep_copy in system verilog
---------------------------------------
tr_b           transaction  -     @341 
  data         integral     4     'he  
  t            temp         -     @346 
    temp_data  integral     4     'hd  
---------------------------------------
