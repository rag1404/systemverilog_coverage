// A Simple Sytem verilog Module to explain Coverage concepts.


module cov;
 covergroup cg_test (ref int ab);
 option.per_instance = 0;
 type_option.merge_instances = 1;
 option.get_inst_coverage = 1; 
   coverpoint ab { bins val[] = { [0:3] }; }
 endgroup
 int a, b;
 cg_test cva = new(a);
 cg_test cvb = new(b);
 initial begin
 #2; a = 0; cva.sample();
 #2; b = 1; cvb.sample();
 #2; $display("cva=%.2f cvb=%.2f cva+cvb=%.2f",
              cva.get_inst_coverage(), cvb.get_inst_coverage(),cg_test::get_coverage());
      
 end
  
endmodule
