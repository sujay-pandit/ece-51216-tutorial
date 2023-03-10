//
// Generated by Bluespec Compiler, version 2022.01-5-ge3edf4b1 (build e3edf4b1)
//
// On Fri Apr 15 12:46:51 EDT 2022
//
//
// Ports:
// Name                         I/O  size props
// fn_csr_op                      O    64
// fn_csr_op_writedata            I    64
// fn_csr_op_readdata             I    64
// fn_csr_op_op                   I     2
//
// Combinational paths from inputs to outputs:
//   (fn_csr_op_writedata, fn_csr_op_readdata, fn_csr_op_op) -> fn_csr_op
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module module_fn_csr_op(fn_csr_op_writedata,
			fn_csr_op_readdata,
			fn_csr_op_op,
			fn_csr_op);
  // value method fn_csr_op
  input  [63 : 0] fn_csr_op_writedata;
  input  [63 : 0] fn_csr_op_readdata;
  input  [1 : 0] fn_csr_op_op;
  output [63 : 0] fn_csr_op;

  // signals for module outputs
  reg [63 : 0] fn_csr_op;

  // remaining internal signals
  wire [63 : 0] x__h48;

  // value method fn_csr_op
  always@(fn_csr_op_op or x__h48 or fn_csr_op_readdata or fn_csr_op_writedata)
  begin
    case (fn_csr_op_op)
      2'd1: fn_csr_op = fn_csr_op_writedata;
      2'd2: fn_csr_op = fn_csr_op_writedata | fn_csr_op_readdata;
      default: fn_csr_op = x__h48 & fn_csr_op_readdata;
    endcase
  end

  // remaining internal signals
  assign x__h48 = ~fn_csr_op_writedata ;
endmodule  // module_fn_csr_op

