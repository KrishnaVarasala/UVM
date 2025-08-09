`include "uvm_macros.svh"
import uvm_pkg::*;

module tb();
  
  initial begin
//uvm_info(id, message , verbosity)
    `uvm_info("TOP","Welcome to UVM : at HIGH Verbosity",UVM_HIGH);  
    `uvm_info("TOP","Welcome to UVM : at FULL Verbosity",UVM_FULL);
    `uvm_info("TOP","Welcome to UVM : at MEDIUM verbosity",UVM_MEDIUM); //default verbosity level = 200
    `uvm_info("TOP","Welcome to UVM : at LOW Verbosity",UVM_LOW);
    `uvm_info("TOP","Welcome to UVM : at NONE verbosity",UVM_NONE);
   
//uvm_warning(id, message)
    `uvm_warning("TOP","warning");

//uvm_error(id,message)
    `uvm_error("TOP","Error")

//uvm_fatal(id, message)
    `uvm_fatal("TOP","Fatal")
   
$display("Welcome to UVM : SV");
  end
endmodule

output:

UVM_INFO reporting_mechanism.svh(10) @ 0: reporter [TOP] Welcome to UVM : at MEDIUM verbosity
UVM_INFO reporting_mechanism.svh(11) @ 0: reporter [TOP] Welcome to UVM : at LOW Verbosity
UVM_INFO reporting_mechanism.svh(12) @ 0: reporter [TOP] Welcome to UVM : at NONE verbosity
UVM_WARNING reporting_mechanism.svh(14) @ 0: reporter [TOP] warning
UVM_ERROR reporting_mechanism.svh(16) @ 0: reporter [TOP] Error
UVM_FATAL reporting_mechanism.svh(18) @ 0: reporter [TOP] Fatal

--- UVM Report Summary ---

** Report counts by severity
UVM_INFO :    4
UVM_WARNING :    1
UVM_ERROR :    1
UVM_FATAL :    1
** Report counts by id
[TOP]     6
[UVM/RELNOTES]     1

//info statements with verbosity level MEDIUM, LOW, NONE will only be printed as they are the lower or equal than the default verbosity level is 200 (UVM_MEDIUM)
//$display will not be executed, because, whenever fatal occurs it will teriminate the execution
