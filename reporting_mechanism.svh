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
