//customized copy method 
//unlike inbuilt copy method, we can have which varible to get copied and which variable cannot be copied

`include "uvm_macros.svh"
import uvm_pkg::*;

class temp extends uvm_object;
  bit[3:0] temp_data;
  function new(string name = "temp");
    super.new(name);
  endfunction
  `uvm_object_utils_begin(temp)
  `uvm_field_int(temp_data,UVM_DEFAULT);
  `uvm_object_utils_end
endclass

class transaction extends uvm_sequence_item;
 // `uvm_object_utils(transaction)
  rand bit[3:0] data;
  temp t;
  
  function new(string name = "transaction");
    super.new(name);
    t = new("t");
  endfunction
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(data,UVM_DEFAULT);
  `uvm_field_int(t.temp_data,UVM_DEFAULT)
  `uvm_object_utils_end
  
  virtual function void do_copy(uvm_object rhs);
    //mytype rhs_;
    transaction tr;
    super.do_copy(rhs);
    $cast(tr,rhs);
    //field_1=rhs_field_1;
    data = tr.data;
    t.temp_data = tr.t.temp_data;
  endfunction
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

-------------------------------------
Name         Type         Size  Value                    
-------------------------------------
tr_a         transaction  -     @336 
  data       integral     4     'h9  
  temp_data  integral     4     'h7  
-------------------------------------
-------------------------------------
Name         Type         Size  Value
-------------------------------------
tr_b         transaction  -     @341 
  data       integral     4     'h9  
  temp_data  integral     4     'h7  
-------------------------------------
-------------------------------------
Name         Type         Size  Value
-------------------------------------
tr_a         transaction  -     @336 
  data       integral     4     'h9  
  temp_data  integral     4     'h7  
-------------------------------------
-------------------------------------
Name         Type         Size  Value
-------------------------------------
tr_b         transaction  -     @341 
  data       integral     4     'h9  
  temp_data  integral     4     'h8  
-------------------------------------
