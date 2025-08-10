//Now, we will see hoe to change the verbosity level in UVM simulator.
//by default it is 200 (UVM_MEDIUM)

`include "uvm_macros.svh"
import uvm_pkg::*;

module tb();
  
 initial begin
    uvm_top.set_report_verbosity_level(UVM_HIGH);                    //changing the verbosity level to (UVM_HIGH)
    //uvm_info(id, message , verbosity)
    `uvm_info("TOP","Welcome to UVM : at FULL Verbosity",UVM_FULL);
    `uvm_info("TOP","Welcome to UVM : at HIGH Verbosity",UVM_HIGH);  //vebosity : High
    `uvm_info("TOP","Welcome to UVM : at MEDIUM verbosity",UVM_MEDIUM); 
    `uvm_info("TOP","Welcome to UVM : at LOW Verbosity",UVM_LOW);
    `uvm_info("TOP","Welcome to UVM : at NONE verbosity",UVM_NONE);
  end
endmodule

output:
UVM_INFO changing_verbosity.svh(10) @ 0: reporter [TOP] Welcome to UVM : at HIGH Verbosity
UVM_INFO changing_verbosity.svh(11) @ 0: reporter [TOP] Welcome to UVM : at MEDIUM verbosity
UVM_INFO changing_verbosity.svh(12) @ 0: reporter [TOP] Welcome to UVM : at LOW Verbosity
UVM_INFO changing_verbosity.svh(13) @ 0: reporter [TOP] Welcome to UVM : at NONE verbosity

//as the verbosity level is set to UVM_HIGH, UVM_HIGH and lower than UVM_HIGH(i.e UVM_MEDIUM, UVM_LOW, UVM_NONE) will be printed
//UVM_FULL is having the greater vebosity than the UVM_HIGH, hence it will be ignored
