//we can customize or modify or change the inbuilt method of print for our convenience 
//can add name, change give size, can specify radix by our own

`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
  `uvm_object_utils(transaction)
  
  rand bit[3:0] data;
  
  function new(string name = "transaction");
    super.new(name);
  endfunction
  
virtual function void do_print(uvm_printer printer);
  super.do_print(printer); //printer.print_field_int("name",source,size,radix) 
  printer.print_field_int("Input DATA",data,$bits(data),UVM_DEC);
endfunction
  
endclass

module tb();
  transaction tr;
  
  initial begin
    tr = new("tr");
    repeat(10)begin
    tr.randomize();
    end
    tr.print(uvm_default_table_printer); 
    //print will be in 3 formats : tree , table(default) , line
  end
endmodule

//this is a inbuilt implementation, it is less efficient. if we want to have our own implementations, do hooks


output:
--------------------------------------
Name          Type         Size  Value
--------------------------------------
tr            transaction  -     @336 
  Input DATA  integral     4     9    
--------------------------------------
