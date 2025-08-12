//to print values with UVM_INFO
//$sformatf is used to print the values

`include "uvm_macros.svh"
import uvm_pkg::*;

module tb();
  int data = 300;
  
 initial begin
   
    uvm_top.set_report_verbosity_level(UVM_HIGH);  //setting verbosity level to UVM_HIGH

//uvm_info(id, message , verbosity)
    `uvm_info("TOP","Welcome to UVM : at FULL Verbosity",UVM_FULL);
   `uvm_info("TOP",$sformatf("value of data = %0d",data),UVM_HIGH);  //vebosity : High
  end
endmodule

output:
UVM_INFO reporting_values.svh(11) @ 0: reporter [TOP] value of data = 300

//verbosity is UVM_HIGH,hence UVM_FULL will not be printed
