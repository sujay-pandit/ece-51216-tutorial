//
// Generated by Bluespec Compiler, version 2022.01-5-ge3edf4b1 (build e3edf4b1)
//
// On Fri Apr 15 12:46:47 EDT 2022
//
//
// Ports:
// Name                         I/O  size props
// RDY_ma_core_req                O     1
// mv_core_resp                   O    65 reg
// RDY_mv_core_resp               O     1 const
// mav_fwd_req                    O    80 reg
// RDY_mav_fwd_req                O     1 reg
// mv_counter_interrupt           O     7
// RDY_mv_counter_interrupt       O     1 const
// RDY_ma_events                  O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// ma_core_req_req                I    80
// ma_mcountinhibit_mcountinhibit_val  I     7
// ma_mhpminterrupten_v           I     7
// ma_events_e                    I    30
// EN_ma_core_req                 I     1
// EN_ma_events                   I     1
// EN_mav_fwd_req                 I     1
//
// Combinational paths from inputs to outputs:
//   (ma_mcountinhibit_mcountinhibit_val,
//    ma_mhpminterrupten_v) -> mv_counter_interrupt
//   EN_mav_fwd_req -> RDY_ma_core_req
//
//
// module : implementing read and write methods for group - 5 csrs and related side band 	         access
//
// Comments on the inlined module `wr_events':
//   wire : whenever an event described in the Events_grp4 occurs, the corresponding bit in             this wire is set for the corresponding counter assigned to be incremented
//
// Comments on the inlined module `wr_mcountinhibit':
//   wire : to hold the current derived value of mcountinhibit
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

module mk_csr_grp5(CLK,
		   RST_N,

		   ma_core_req_req,
		   EN_ma_core_req,
		   RDY_ma_core_req,

		   mv_core_resp,
		   RDY_mv_core_resp,

		   EN_mav_fwd_req,
		   mav_fwd_req,
		   RDY_mav_fwd_req,

		   ma_mcountinhibit_mcountinhibit_val,

		   ma_mhpminterrupten_v,

		   mv_counter_interrupt,
		   RDY_mv_counter_interrupt,

		   ma_events_e,
		   EN_ma_events,
		   RDY_ma_events);
  input  CLK;
  input  RST_N;

  // action method ma_core_req
  input  [79 : 0] ma_core_req_req;
  input  EN_ma_core_req;
  output RDY_ma_core_req;

  // value method mv_core_resp
  output [64 : 0] mv_core_resp;
  output RDY_mv_core_resp;

  // actionvalue method mav_fwd_req
  input  EN_mav_fwd_req;
  output [79 : 0] mav_fwd_req;
  output RDY_mav_fwd_req;

  // action method ma_mcountinhibit
  input  [6 : 0] ma_mcountinhibit_mcountinhibit_val;

  // action method ma_mhpminterrupten
  input  [6 : 0] ma_mhpminterrupten_v;

  // value method mv_counter_interrupt
  output [6 : 0] mv_counter_interrupt;
  output RDY_mv_counter_interrupt;

  // action method ma_events
  input  [29 : 0] ma_events_e;
  input  EN_ma_events;
  output RDY_ma_events;

  // signals for module outputs
  wire [79 : 0] mav_fwd_req;
  wire [64 : 0] mv_core_resp;
  wire [6 : 0] mv_counter_interrupt;
  wire RDY_ma_core_req,
       RDY_ma_events,
       RDY_mav_fwd_req,
       RDY_mv_core_resp,
       RDY_mv_counter_interrupt;

  // inlined wires
  wire [129 : 0] csr_op_arg_wget;
  wire [64 : 0] rg_resp_to_core_1_wget;
  wire rg_resp_to_core_1_whas;

  // register mhpmcounter_0
  reg [63 : 0] mhpmcounter_0;
  wire [63 : 0] mhpmcounter_0_D_IN;
  wire mhpmcounter_0_EN;

  // register mhpmcounter_1
  reg [63 : 0] mhpmcounter_1;
  wire [63 : 0] mhpmcounter_1_D_IN;
  wire mhpmcounter_1_EN;

  // register mhpmcounter_2
  reg [63 : 0] mhpmcounter_2;
  wire [63 : 0] mhpmcounter_2_D_IN;
  wire mhpmcounter_2_EN;

  // register mhpmcounter_3
  reg [63 : 0] mhpmcounter_3;
  wire [63 : 0] mhpmcounter_3_D_IN;
  wire mhpmcounter_3_EN;

  // register mhpmcounter_4
  reg [63 : 0] mhpmcounter_4;
  wire [63 : 0] mhpmcounter_4_D_IN;
  wire mhpmcounter_4_EN;

  // register mhpmcounter_5
  reg [63 : 0] mhpmcounter_5;
  wire [63 : 0] mhpmcounter_5_D_IN;
  wire mhpmcounter_5_EN;

  // register mhpmcounter_6
  reg [63 : 0] mhpmcounter_6;
  wire [63 : 0] mhpmcounter_6_D_IN;
  wire mhpmcounter_6_EN;

  // register mhpmevent_0
  reg [63 : 0] mhpmevent_0;
  wire [63 : 0] mhpmevent_0_D_IN;
  wire mhpmevent_0_EN;

  // register mhpmevent_1
  reg [63 : 0] mhpmevent_1;
  wire [63 : 0] mhpmevent_1_D_IN;
  wire mhpmevent_1_EN;

  // register mhpmevent_2
  reg [63 : 0] mhpmevent_2;
  wire [63 : 0] mhpmevent_2_D_IN;
  wire mhpmevent_2_EN;

  // register mhpmevent_3
  reg [63 : 0] mhpmevent_3;
  wire [63 : 0] mhpmevent_3_D_IN;
  wire mhpmevent_3_EN;

  // register mhpmevent_4
  reg [63 : 0] mhpmevent_4;
  wire [63 : 0] mhpmevent_4_D_IN;
  wire mhpmevent_4_EN;

  // register mhpmevent_5
  reg [63 : 0] mhpmevent_5;
  wire [63 : 0] mhpmevent_5_D_IN;
  wire mhpmevent_5_EN;

  // register mhpmevent_6
  reg [63 : 0] mhpmevent_6;
  wire [63 : 0] mhpmevent_6_D_IN;
  wire mhpmevent_6_EN;

  // register rg_resp_to_core
  // reg : register to hold the response of this group for a csr operation request
  reg [64 : 0] rg_resp_to_core;
  wire [64 : 0] rg_resp_to_core_D_IN;
  wire rg_resp_to_core_EN;

  // ports of submodule ff_fwd_request
  wire [79 : 0] ff_fwd_request_D_IN, ff_fwd_request_D_OUT;
  wire ff_fwd_request_CLR,
       ff_fwd_request_DEQ,
       ff_fwd_request_EMPTY_N,
       ff_fwd_request_ENQ,
       ff_fwd_request_FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_increment_perfmonitors,
       CAN_FIRE_RL_rg_resp_to_core__dreg_update,
       CAN_FIRE_ma_core_req,
       CAN_FIRE_ma_events,
       CAN_FIRE_ma_mcountinhibit,
       CAN_FIRE_ma_mhpminterrupten,
       CAN_FIRE_mav_fwd_req,
       WILL_FIRE_RL_increment_perfmonitors,
       WILL_FIRE_RL_rg_resp_to_core__dreg_update,
       WILL_FIRE_ma_core_req,
       WILL_FIRE_ma_events,
       WILL_FIRE_ma_mcountinhibit,
       WILL_FIRE_ma_mhpminterrupten,
       WILL_FIRE_mav_fwd_req;

  // inputs to muxes for submodule ports
  reg [63 : 0] MUX_mhpmcounter_0_write_1__VAL_1;
  wire [63 : 0] MUX_mhpmcounter_0_write_1__VAL_2,
		MUX_mhpmcounter_1_write_1__VAL_2,
		MUX_mhpmcounter_2_write_1__VAL_2,
		MUX_mhpmcounter_3_write_1__VAL_2,
		MUX_mhpmcounter_4_write_1__VAL_2,
		MUX_mhpmcounter_5_write_1__VAL_2,
		MUX_mhpmcounter_6_write_1__VAL_2;
  wire MUX_mhpmcounter_0_write_1__SEL_1,
       MUX_mhpmcounter_1_write_1__SEL_1,
       MUX_mhpmcounter_2_write_1__SEL_1,
       MUX_mhpmcounter_3_write_1__SEL_1,
       MUX_mhpmcounter_4_write_1__SEL_1,
       MUX_mhpmcounter_5_write_1__SEL_1,
       MUX_mhpmcounter_6_write_1__SEL_1;

  // remaining internal signals
  reg [63 : 0] IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184,
	       IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212;
  wire [63 : 0] x__h8623, x_wget_fst__h4987, x_wget_snd_fst__h5072;
  wire [30 : 0] bs__h3247;
  wire [6 : 0] IF_NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0__ETC__q1;
  wire [1 : 0] x_wget_snd_snd__h5073;
  wire NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0_2_E_ETC___d23,
       mhpmevent_1_3_EQ_0_4_OR_NOT_mhpmcounter_1_5_EQ_ETC___d43,
       mhpmevent_2_8_EQ_0_9_OR_NOT_mhpmcounter_2_0_EQ_ETC___d58,
       mhpmevent_3_3_EQ_0_4_OR_NOT_mhpmcounter_3_5_EQ_ETC___d73,
       mhpmevent_4_8_EQ_0_9_OR_NOT_mhpmcounter_4_0_EQ_ETC___d88,
       mhpmevent_5_3_EQ_0_4_OR_NOT_mhpmcounter_5_5_EQ_ETC___d103,
       mhpmevent_6_08_EQ_0_09_OR_NOT_mhpmcounter_6_10_ETC___d118,
       x__h3244,
       x__h3387,
       x__h3523,
       x__h3659,
       x__h3795,
       x__h3931,
       x__h4066;

  // action method ma_core_req
  assign RDY_ma_core_req = ff_fwd_request_FULL_N ;
  assign CAN_FIRE_ma_core_req = ff_fwd_request_FULL_N ;
  assign WILL_FIRE_ma_core_req = EN_ma_core_req ;

  // value method mv_core_resp
  assign mv_core_resp = rg_resp_to_core ;
  assign RDY_mv_core_resp = 1'd1 ;

  // actionvalue method mav_fwd_req
  assign mav_fwd_req = ff_fwd_request_D_OUT ;
  assign RDY_mav_fwd_req = ff_fwd_request_EMPTY_N ;
  assign CAN_FIRE_mav_fwd_req = ff_fwd_request_EMPTY_N ;
  assign WILL_FIRE_mav_fwd_req = EN_mav_fwd_req ;

  // action method ma_mcountinhibit
  assign CAN_FIRE_ma_mcountinhibit = 1'd1 ;
  assign WILL_FIRE_ma_mcountinhibit = 1'd1 ;

  // action method ma_mhpminterrupten
  assign CAN_FIRE_ma_mhpminterrupten = 1'd1 ;
  assign WILL_FIRE_ma_mhpminterrupten = 1'd1 ;

  // value method mv_counter_interrupt
  assign mv_counter_interrupt =
	     { mhpmevent_6 != 64'd0 && mhpmcounter_6 == 64'd0 &&
	       !ma_mcountinhibit_mcountinhibit_val[6] &&
	       ma_mhpminterrupten_v[6],
	       mhpmevent_5 != 64'd0 && mhpmcounter_5 == 64'd0 &&
	       !ma_mcountinhibit_mcountinhibit_val[5] &&
	       ma_mhpminterrupten_v[5],
	       mhpmevent_4 != 64'd0 && mhpmcounter_4 == 64'd0 &&
	       !ma_mcountinhibit_mcountinhibit_val[4] &&
	       ma_mhpminterrupten_v[4],
	       mhpmevent_3 != 64'd0 && mhpmcounter_3 == 64'd0 &&
	       !ma_mcountinhibit_mcountinhibit_val[3] &&
	       ma_mhpminterrupten_v[3],
	       mhpmevent_2 != 64'd0 && mhpmcounter_2 == 64'd0 &&
	       !ma_mcountinhibit_mcountinhibit_val[2] &&
	       ma_mhpminterrupten_v[2],
	       mhpmevent_1 != 64'd0 && mhpmcounter_1 == 64'd0 &&
	       !ma_mcountinhibit_mcountinhibit_val[1] &&
	       ma_mhpminterrupten_v[1],
	       IF_NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0__ETC__q1[0] } ;
  assign RDY_mv_counter_interrupt = 1'b1 ;

  // action method ma_events
  assign RDY_ma_events = 1'd1 ;
  assign CAN_FIRE_ma_events = 1'd1 ;
  assign WILL_FIRE_ma_events = EN_ma_events ;

  // submodule ff_fwd_request
  // fifo : fifo to forward the core - request to the next group on a miss in the                      current group
  FIFOL1 #(.width(32'd80)) ff_fwd_request(.RST(RST_N),
					  .CLK(CLK),
					  .D_IN(ff_fwd_request_D_IN),
					  .ENQ(ff_fwd_request_ENQ),
					  .DEQ(ff_fwd_request_DEQ),
					  .CLR(ff_fwd_request_CLR),
					  .D_OUT(ff_fwd_request_D_OUT),
					  .FULL_N(ff_fwd_request_FULL_N),
					  .EMPTY_N(ff_fwd_request_EMPTY_N));

  // rule RL_increment_perfmonitors
  //   rule : the rule increments the performance monitoring counters
  assign CAN_FIRE_RL_increment_perfmonitors = EN_ma_events ;
  assign WILL_FIRE_RL_increment_perfmonitors =
	     EN_ma_events && !EN_ma_core_req ;

  // rule RL_rg_resp_to_core__dreg_update
  assign CAN_FIRE_RL_rg_resp_to_core__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_rg_resp_to_core__dreg_update = 1'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_mhpmcounter_0_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0A ;
  assign MUX_mhpmcounter_1_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0B ;
  assign MUX_mhpmcounter_2_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0C ;
  assign MUX_mhpmcounter_3_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0D ;
  assign MUX_mhpmcounter_4_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0E ;
  assign MUX_mhpmcounter_5_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0F ;
  assign MUX_mhpmcounter_6_write_1__SEL_1 =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB10 ;
  always@(ma_core_req_req or x__h8623)
  begin
    case (ma_core_req_req[79:68])
      12'h32A,
      12'h32B,
      12'h32C,
      12'h32D,
      12'h32E,
      12'hB0A,
      12'hB0B,
      12'hB0C,
      12'hB0D,
      12'hB0E,
      12'hB0F,
      12'hB10:
	  MUX_mhpmcounter_0_write_1__VAL_1 = x__h8623;
      default: MUX_mhpmcounter_0_write_1__VAL_1 = x__h8623;
    endcase
  end
  assign MUX_mhpmcounter_0_write_1__VAL_2 =
	     mhpmcounter_0 + { 63'd0, x__h3244 } ;
  assign MUX_mhpmcounter_1_write_1__VAL_2 =
	     mhpmcounter_1 + { 63'd0, x__h3387 } ;
  assign MUX_mhpmcounter_2_write_1__VAL_2 =
	     mhpmcounter_2 + { 63'd0, x__h3523 } ;
  assign MUX_mhpmcounter_3_write_1__VAL_2 =
	     mhpmcounter_3 + { 63'd0, x__h3659 } ;
  assign MUX_mhpmcounter_4_write_1__VAL_2 =
	     mhpmcounter_4 + { 63'd0, x__h3795 } ;
  assign MUX_mhpmcounter_5_write_1__VAL_2 =
	     mhpmcounter_5 + { 63'd0, x__h3931 } ;
  assign MUX_mhpmcounter_6_write_1__VAL_2 =
	     mhpmcounter_6 + { 63'd0, x__h4066 } ;

  // inlined wires
  assign rg_resp_to_core_1_wget =
	     { 1'd1,
	       IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 } ;
  assign rg_resp_to_core_1_whas =
	     EN_ma_core_req &&
	     (ma_core_req_req[79:68] == 12'hB0A ||
	      ma_core_req_req[79:68] == 12'hB0B ||
	      ma_core_req_req[79:68] == 12'hB0C ||
	      ma_core_req_req[79:68] == 12'hB0D ||
	      ma_core_req_req[79:68] == 12'hB0E ||
	      ma_core_req_req[79:68] == 12'hB0F ||
	      ma_core_req_req[79:68] == 12'hB10 ||
	      ma_core_req_req[79:68] == 12'h32A ||
	      ma_core_req_req[79:68] == 12'h32B ||
	      ma_core_req_req[79:68] == 12'h32C ||
	      ma_core_req_req[79:68] == 12'h32D ||
	      ma_core_req_req[79:68] == 12'h32E ||
	      ma_core_req_req[79:68] == 12'h32F ||
	      ma_core_req_req[79:68] == 12'h330 ||
	      ma_core_req_req[79:68] == 12'hC0A ||
	      ma_core_req_req[79:68] == 12'hC0B ||
	      ma_core_req_req[79:68] == 12'hC0C ||
	      ma_core_req_req[79:68] == 12'hC0D ||
	      ma_core_req_req[79:68] == 12'hC0E ||
	      ma_core_req_req[79:68] == 12'hC0F ||
	      ma_core_req_req[79:68] == 12'hC10) ;
  assign csr_op_arg_wget =
	     { ma_core_req_req[67:4],
	       IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212,
	       ma_core_req_req[3:2] } ;

  // register mhpmcounter_0
  assign mhpmcounter_0_D_IN =
	     MUX_mhpmcounter_0_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_0_write_1__VAL_2 ;
  assign mhpmcounter_0_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0A ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     !IF_NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0__ETC__q1[0] ;

  // register mhpmcounter_1
  assign mhpmcounter_1_D_IN =
	     MUX_mhpmcounter_1_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_1_write_1__VAL_2 ;
  assign mhpmcounter_1_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0B ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     mhpmevent_1_3_EQ_0_4_OR_NOT_mhpmcounter_1_5_EQ_ETC___d43 ;

  // register mhpmcounter_2
  assign mhpmcounter_2_D_IN =
	     MUX_mhpmcounter_2_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_2_write_1__VAL_2 ;
  assign mhpmcounter_2_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0C ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     mhpmevent_2_8_EQ_0_9_OR_NOT_mhpmcounter_2_0_EQ_ETC___d58 ;

  // register mhpmcounter_3
  assign mhpmcounter_3_D_IN =
	     MUX_mhpmcounter_3_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_3_write_1__VAL_2 ;
  assign mhpmcounter_3_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0D ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     mhpmevent_3_3_EQ_0_4_OR_NOT_mhpmcounter_3_5_EQ_ETC___d73 ;

  // register mhpmcounter_4
  assign mhpmcounter_4_D_IN =
	     MUX_mhpmcounter_4_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_4_write_1__VAL_2 ;
  assign mhpmcounter_4_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0E ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     mhpmevent_4_8_EQ_0_9_OR_NOT_mhpmcounter_4_0_EQ_ETC___d88 ;

  // register mhpmcounter_5
  assign mhpmcounter_5_D_IN =
	     MUX_mhpmcounter_5_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_5_write_1__VAL_2 ;
  assign mhpmcounter_5_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB0F ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     mhpmevent_5_3_EQ_0_4_OR_NOT_mhpmcounter_5_5_EQ_ETC___d103 ;

  // register mhpmcounter_6
  assign mhpmcounter_6_D_IN =
	     MUX_mhpmcounter_6_write_1__SEL_1 ?
	       MUX_mhpmcounter_0_write_1__VAL_1 :
	       MUX_mhpmcounter_6_write_1__VAL_2 ;
  assign mhpmcounter_6_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'hB10 ||
	     WILL_FIRE_RL_increment_perfmonitors &&
	     mhpmevent_6_08_EQ_0_09_OR_NOT_mhpmcounter_6_10_ETC___d118 ;

  // register mhpmevent_0
  assign mhpmevent_0_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_0_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h32A ;

  // register mhpmevent_1
  assign mhpmevent_1_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_1_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h32B ;

  // register mhpmevent_2
  assign mhpmevent_2_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_2_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h32C ;

  // register mhpmevent_3
  assign mhpmevent_3_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_3_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h32D ;

  // register mhpmevent_4
  assign mhpmevent_4_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_4_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h32E ;

  // register mhpmevent_5
  assign mhpmevent_5_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_5_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h32F ;

  // register mhpmevent_6
  assign mhpmevent_6_D_IN = MUX_mhpmcounter_0_write_1__VAL_1 ;
  assign mhpmevent_6_EN =
	     EN_ma_core_req && ma_core_req_req[79:68] == 12'h330 ;

  // register rg_resp_to_core
  assign rg_resp_to_core_D_IN =
	     rg_resp_to_core_1_whas ? rg_resp_to_core_1_wget : 65'd0 ;
  assign rg_resp_to_core_EN = 1'd1 ;

  // submodule ff_fwd_request
  assign ff_fwd_request_D_IN = ma_core_req_req ;
  assign ff_fwd_request_ENQ =
	     EN_ma_core_req && ma_core_req_req[79:68] != 12'hB0A &&
	     ma_core_req_req[79:68] != 12'hB0B &&
	     ma_core_req_req[79:68] != 12'hB0C &&
	     ma_core_req_req[79:68] != 12'hB0D &&
	     ma_core_req_req[79:68] != 12'hB0E &&
	     ma_core_req_req[79:68] != 12'hB0F &&
	     ma_core_req_req[79:68] != 12'hB10 &&
	     ma_core_req_req[79:68] != 12'h32A &&
	     ma_core_req_req[79:68] != 12'h32B &&
	     ma_core_req_req[79:68] != 12'h32C &&
	     ma_core_req_req[79:68] != 12'h32D &&
	     ma_core_req_req[79:68] != 12'h32E &&
	     ma_core_req_req[79:68] != 12'h32F &&
	     ma_core_req_req[79:68] != 12'h330 &&
	     ma_core_req_req[79:68] != 12'hC0A &&
	     ma_core_req_req[79:68] != 12'hC0B &&
	     ma_core_req_req[79:68] != 12'hC0C &&
	     ma_core_req_req[79:68] != 12'hC0D &&
	     ma_core_req_req[79:68] != 12'hC0E &&
	     ma_core_req_req[79:68] != 12'hC0F &&
	     ma_core_req_req[79:68] != 12'hC10 ;
  assign ff_fwd_request_DEQ = EN_mav_fwd_req ;
  assign ff_fwd_request_CLR = 1'b0 ;

  // remaining internal signals
  module_fn_csr_op instance_fn_csr_op_0(.fn_csr_op_writedata(x_wget_fst__h4987),
					.fn_csr_op_readdata(x_wget_snd_fst__h5072),
					.fn_csr_op_op(x_wget_snd_snd__h5073),
					.fn_csr_op(x__h8623));
  assign IF_NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0__ETC__q1 =
	     NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0_2_E_ETC___d23 ?
	       7'd1 :
	       7'd0 ;
  assign NOT_mhpmevent_0_EQ_0_0_1_AND_mhpmcounter_0_2_E_ETC___d23 =
	     mhpmevent_0 != 64'd0 && mhpmcounter_0 == 64'd0 &&
	     !ma_mcountinhibit_mcountinhibit_val[0] &&
	     ma_mhpminterrupten_v[0] ;
  assign bs__h3247 = { ma_events_e, 1'b0 } ;
  assign mhpmevent_1_3_EQ_0_4_OR_NOT_mhpmcounter_1_5_EQ_ETC___d43 =
	     mhpmevent_1 == 64'd0 || mhpmcounter_1 != 64'd0 ||
	     ma_mcountinhibit_mcountinhibit_val[1] ||
	     !ma_mhpminterrupten_v[1] ;
  assign mhpmevent_2_8_EQ_0_9_OR_NOT_mhpmcounter_2_0_EQ_ETC___d58 =
	     mhpmevent_2 == 64'd0 || mhpmcounter_2 != 64'd0 ||
	     ma_mcountinhibit_mcountinhibit_val[2] ||
	     !ma_mhpminterrupten_v[2] ;
  assign mhpmevent_3_3_EQ_0_4_OR_NOT_mhpmcounter_3_5_EQ_ETC___d73 =
	     mhpmevent_3 == 64'd0 || mhpmcounter_3 != 64'd0 ||
	     ma_mcountinhibit_mcountinhibit_val[3] ||
	     !ma_mhpminterrupten_v[3] ;
  assign mhpmevent_4_8_EQ_0_9_OR_NOT_mhpmcounter_4_0_EQ_ETC___d88 =
	     mhpmevent_4 == 64'd0 || mhpmcounter_4 != 64'd0 ||
	     ma_mcountinhibit_mcountinhibit_val[4] ||
	     !ma_mhpminterrupten_v[4] ;
  assign mhpmevent_5_3_EQ_0_4_OR_NOT_mhpmcounter_5_5_EQ_ETC___d103 =
	     mhpmevent_5 == 64'd0 || mhpmcounter_5 != 64'd0 ||
	     ma_mcountinhibit_mcountinhibit_val[5] ||
	     !ma_mhpminterrupten_v[5] ;
  assign mhpmevent_6_08_EQ_0_09_OR_NOT_mhpmcounter_6_10_ETC___d118 =
	     mhpmevent_6 == 64'd0 || mhpmcounter_6 != 64'd0 ||
	     ma_mcountinhibit_mcountinhibit_val[6] ||
	     !ma_mhpminterrupten_v[6] ;
  assign x__h3244 = bs__h3247[mhpmevent_0[4:0]] ;
  assign x__h3387 = bs__h3247[mhpmevent_1[4:0]] ;
  assign x__h3523 = bs__h3247[mhpmevent_2[4:0]] ;
  assign x__h3659 = bs__h3247[mhpmevent_3[4:0]] ;
  assign x__h3795 = bs__h3247[mhpmevent_4[4:0]] ;
  assign x__h3931 = bs__h3247[mhpmevent_5[4:0]] ;
  assign x__h4066 = bs__h3247[mhpmevent_6[4:0]] ;
  assign x_wget_fst__h4987 = csr_op_arg_wget[129:66] ;
  assign x_wget_snd_fst__h5072 = csr_op_arg_wget[65:2] ;
  assign x_wget_snd_snd__h5073 = csr_op_arg_wget[1:0] ;
  always@(ma_core_req_req or
	  mhpmcounter_6 or
	  mhpmevent_0 or
	  mhpmevent_1 or
	  mhpmevent_2 or
	  mhpmevent_3 or
	  mhpmevent_4 or
	  mhpmevent_5 or
	  mhpmevent_6 or
	  mhpmcounter_0 or
	  mhpmcounter_1 or
	  mhpmcounter_2 or mhpmcounter_3 or mhpmcounter_4 or mhpmcounter_5)
  begin
    case (ma_core_req_req[79:68])
      12'h32A:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_0;
      12'h32B:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_1;
      12'h32C:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_2;
      12'h32D:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_3;
      12'h32E:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_4;
      12'h32F:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_5;
      12'h330:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmevent_6;
      12'hB0A, 12'hC0A:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_0;
      12'hB0B, 12'hC0B:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_1;
      12'hB0C, 12'hC0C:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_2;
      12'hB0D, 12'hC0D:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_3;
      12'hB0E, 12'hC0E:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_4;
      12'hB0F, 12'hC0F:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_5;
      12'hB10:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
	      mhpmcounter_6;
      default: IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d184 =
		   mhpmcounter_6;
    endcase
  end
  always@(ma_core_req_req or
	  mhpmevent_6 or
	  mhpmevent_0 or
	  mhpmevent_1 or
	  mhpmevent_2 or
	  mhpmevent_3 or
	  mhpmevent_4 or
	  mhpmevent_5 or
	  mhpmcounter_0 or
	  mhpmcounter_1 or
	  mhpmcounter_2 or
	  mhpmcounter_3 or mhpmcounter_4 or mhpmcounter_5 or mhpmcounter_6)
  begin
    case (ma_core_req_req[79:68])
      12'h32A:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmevent_0;
      12'h32B:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmevent_1;
      12'h32C:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmevent_2;
      12'h32D:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmevent_3;
      12'h32E:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmevent_4;
      12'h32F:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmevent_5;
      12'hB0A:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_0;
      12'hB0B:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_1;
      12'hB0C:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_2;
      12'hB0D:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_3;
      12'hB0E:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_4;
      12'hB0F:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_5;
      12'hB10:
	  IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
	      mhpmcounter_6;
      default: IF_ma_core_req_req_BITS_79_TO_68_23_EQ_0xB0A_2_ETC___d212 =
		   mhpmevent_6;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        mhpmcounter_0 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmcounter_1 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmcounter_2 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmcounter_3 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmcounter_4 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmcounter_5 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmcounter_6 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_0 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_1 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_2 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_3 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_4 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_5 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	mhpmevent_6 <= `BSV_ASSIGNMENT_DELAY 64'd0;
	rg_resp_to_core <= `BSV_ASSIGNMENT_DELAY 65'd0;
      end
    else
      begin
        if (mhpmcounter_0_EN)
	  mhpmcounter_0 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_0_D_IN;
	if (mhpmcounter_1_EN)
	  mhpmcounter_1 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_1_D_IN;
	if (mhpmcounter_2_EN)
	  mhpmcounter_2 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_2_D_IN;
	if (mhpmcounter_3_EN)
	  mhpmcounter_3 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_3_D_IN;
	if (mhpmcounter_4_EN)
	  mhpmcounter_4 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_4_D_IN;
	if (mhpmcounter_5_EN)
	  mhpmcounter_5 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_5_D_IN;
	if (mhpmcounter_6_EN)
	  mhpmcounter_6 <= `BSV_ASSIGNMENT_DELAY mhpmcounter_6_D_IN;
	if (mhpmevent_0_EN)
	  mhpmevent_0 <= `BSV_ASSIGNMENT_DELAY mhpmevent_0_D_IN;
	if (mhpmevent_1_EN)
	  mhpmevent_1 <= `BSV_ASSIGNMENT_DELAY mhpmevent_1_D_IN;
	if (mhpmevent_2_EN)
	  mhpmevent_2 <= `BSV_ASSIGNMENT_DELAY mhpmevent_2_D_IN;
	if (mhpmevent_3_EN)
	  mhpmevent_3 <= `BSV_ASSIGNMENT_DELAY mhpmevent_3_D_IN;
	if (mhpmevent_4_EN)
	  mhpmevent_4 <= `BSV_ASSIGNMENT_DELAY mhpmevent_4_D_IN;
	if (mhpmevent_5_EN)
	  mhpmevent_5 <= `BSV_ASSIGNMENT_DELAY mhpmevent_5_D_IN;
	if (mhpmevent_6_EN)
	  mhpmevent_6 <= `BSV_ASSIGNMENT_DELAY mhpmevent_6_D_IN;
	if (rg_resp_to_core_EN)
	  rg_resp_to_core <= `BSV_ASSIGNMENT_DELAY rg_resp_to_core_D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    mhpmcounter_0 = 64'hAAAAAAAAAAAAAAAA;
    mhpmcounter_1 = 64'hAAAAAAAAAAAAAAAA;
    mhpmcounter_2 = 64'hAAAAAAAAAAAAAAAA;
    mhpmcounter_3 = 64'hAAAAAAAAAAAAAAAA;
    mhpmcounter_4 = 64'hAAAAAAAAAAAAAAAA;
    mhpmcounter_5 = 64'hAAAAAAAAAAAAAAAA;
    mhpmcounter_6 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_0 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_1 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_2 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_3 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_4 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_5 = 64'hAAAAAAAAAAAAAAAA;
    mhpmevent_6 = 64'hAAAAAAAAAAAAAAAA;
    rg_resp_to_core = 65'h0AAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mk_csr_grp5

