//
// Generated by Bluespec Compiler, version 2022.01-5-ge3edf4b1 (build e3edf4b1)
//
// On Fri Apr 15 12:45:42 EDT 2022
//
//
// Ports:
// Name                         I/O  size props
// RDY_ma_update_eEpoch           O     1 const
// RDY_ma_update_wEpoch           O     1 const
// RDY_ma_flush                   O     1
// RDY_ma_train_bpu               O     1
// RDY_ma_mispredict              O     1
// RDY_ma_bpu_enable              O     1 const
// to_icache_get                  O    68
// RDY_to_icache_get              O     1
// tx_to_stage1_enq_ena           O     1
// tx_to_stage1_enq_data          O    77
// resetpc                        I    64
// CLK                            I     1 clock
// RST_N                          I     1 reset
// ma_flush_fl                    I    66
// ma_train_bpu_td                I   142
// ma_mispredict_g                I     9
// ma_bpu_enable_e                I     1
// tx_to_stage1_notFull_b         I     1
// tx_to_stage1_enq_rdy_b         I     1
// EN_ma_update_eEpoch            I     1
// EN_ma_update_wEpoch            I     1
// EN_ma_flush                    I     1
// EN_ma_train_bpu                I     1
// EN_ma_mispredict               I     1
// EN_ma_bpu_enable               I     1
// EN_to_icache_get               I     1
//
// Combinational paths from inputs to outputs:
//   (ma_bpu_enable_e, EN_ma_bpu_enable) -> RDY_ma_train_bpu
//   (ma_bpu_enable_e,
//    tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_bpu_enable) -> tx_to_stage1_enq_data
//   (tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_bpu_enable) -> RDY_to_icache_get
//   (tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_bpu_enable) -> tx_to_stage1_enq_ena
//   (tx_to_stage1_notFull_b,
//    tx_to_stage1_enq_rdy_b,
//    EN_ma_bpu_enable) -> to_icache_get
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

module mkstage0(resetpc,
		CLK,
		RST_N,

		EN_ma_update_eEpoch,
		RDY_ma_update_eEpoch,

		EN_ma_update_wEpoch,
		RDY_ma_update_wEpoch,

		ma_flush_fl,
		EN_ma_flush,
		RDY_ma_flush,

		ma_train_bpu_td,
		EN_ma_train_bpu,
		RDY_ma_train_bpu,

		ma_mispredict_g,
		EN_ma_mispredict,
		RDY_ma_mispredict,

		ma_bpu_enable_e,
		EN_ma_bpu_enable,
		RDY_ma_bpu_enable,

		EN_to_icache_get,
		to_icache_get,
		RDY_to_icache_get,

		tx_to_stage1_notFull_b,

		tx_to_stage1_enq_rdy_b,

		tx_to_stage1_enq_ena,

		tx_to_stage1_enq_data);
  parameter [63 : 0] hartid = 64'b0;
  input  [63 : 0] resetpc;
  input  CLK;
  input  RST_N;

  // action method ma_update_eEpoch
  input  EN_ma_update_eEpoch;
  output RDY_ma_update_eEpoch;

  // action method ma_update_wEpoch
  input  EN_ma_update_wEpoch;
  output RDY_ma_update_wEpoch;

  // action method ma_flush
  input  [65 : 0] ma_flush_fl;
  input  EN_ma_flush;
  output RDY_ma_flush;

  // action method ma_train_bpu
  input  [141 : 0] ma_train_bpu_td;
  input  EN_ma_train_bpu;
  output RDY_ma_train_bpu;

  // action method ma_mispredict
  input  [8 : 0] ma_mispredict_g;
  input  EN_ma_mispredict;
  output RDY_ma_mispredict;

  // action method ma_bpu_enable
  input  ma_bpu_enable_e;
  input  EN_ma_bpu_enable;
  output RDY_ma_bpu_enable;

  // actionvalue method to_icache_get
  input  EN_to_icache_get;
  output [67 : 0] to_icache_get;
  output RDY_to_icache_get;

  // action method tx_to_stage1_notFull
  input  tx_to_stage1_notFull_b;

  // action method tx_to_stage1_enq_rdy
  input  tx_to_stage1_enq_rdy_b;

  // value method tx_to_stage1_enq_ena
  output tx_to_stage1_enq_ena;

  // value method tx_to_stage1_enq_data
  output [76 : 0] tx_to_stage1_enq_data;

  // signals for module outputs
  wire [76 : 0] tx_to_stage1_enq_data;
  wire [67 : 0] to_icache_get;
  wire RDY_ma_bpu_enable,
       RDY_ma_flush,
       RDY_ma_mispredict,
       RDY_ma_train_bpu,
       RDY_ma_update_eEpoch,
       RDY_ma_update_wEpoch,
       RDY_to_icache_get,
       tx_to_stage1_enq_ena;

  // inlined wires
  wire [68 : 0] ff_to_cache_rv_port0__write_1,
		ff_to_cache_rv_port1__read,
		ff_to_cache_rv_port1__write_1,
		ff_to_cache_rv_port2__read;
  wire [64 : 0] rg_delayed_redirect_port0__write_1,
		rg_delayed_redirect_port1__read,
		rg_delayed_redirect_port1__write_1,
		rg_delayed_redirect_port2__read;
  wire [63 : 0] rg_pc_port0__write_1,
		rg_pc_port1__read,
		rg_pc_port1__write_1,
		rg_pc_port2__read;
  wire rg_delayed_redirect_EN_port0__write,
       rg_fence_EN_port0__write,
       rg_fence_port1__read,
       rg_fence_port2__read,
       rg_pc_EN_port0__write,
       rg_pc_EN_port1__write,
       rg_sfence_EN_port0__write,
       rg_sfence_port1__read,
       rg_sfence_port2__read,
       tx_tostage1_w_ena_whas;

  // register ff_to_cache_rv
  reg [68 : 0] ff_to_cache_rv;
  wire [68 : 0] ff_to_cache_rv_D_IN;
  wire ff_to_cache_rv_EN;

  // register rg_delayed_redirect
  reg [64 : 0] rg_delayed_redirect;
  wire [64 : 0] rg_delayed_redirect_D_IN;
  wire rg_delayed_redirect_EN;

  // register rg_eEpoch
  reg rg_eEpoch;
  wire rg_eEpoch_D_IN, rg_eEpoch_EN;

  // register rg_fence
  reg rg_fence;
  wire rg_fence_D_IN, rg_fence_EN;

  // register rg_initialize
  reg rg_initialize;
  wire rg_initialize_D_IN, rg_initialize_EN;

  // register rg_pc
  reg [63 : 0] rg_pc;
  wire [63 : 0] rg_pc_D_IN;
  wire rg_pc_EN;

  // register rg_sfence
  reg rg_sfence;
  wire rg_sfence_D_IN, rg_sfence_EN;

  // register rg_wEpoch
  reg rg_wEpoch;
  wire rg_wEpoch_D_IN, rg_wEpoch_EN;

  // ports of submodule bpu
  wire [141 : 0] bpu_ma_train_bpu_td;
  wire [76 : 0] bpu_mav_prediction_response;
  wire [65 : 0] bpu_mav_prediction_response_r;
  wire [8 : 0] bpu_ma_mispredict_g;
  wire bpu_EN_ma_bpu_enable,
       bpu_EN_ma_mispredict,
       bpu_EN_ma_train_bpu,
       bpu_EN_mav_prediction_response,
       bpu_RDY_ma_mispredict,
       bpu_RDY_ma_train_bpu,
       bpu_RDY_mav_prediction_response,
       bpu_ma_bpu_enable_e;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_gen_next_pc,
       CAN_FIRE_RL_rl_initialize,
       CAN_FIRE_ma_bpu_enable,
       CAN_FIRE_ma_flush,
       CAN_FIRE_ma_mispredict,
       CAN_FIRE_ma_train_bpu,
       CAN_FIRE_ma_update_eEpoch,
       CAN_FIRE_ma_update_wEpoch,
       CAN_FIRE_to_icache_get,
       CAN_FIRE_tx_to_stage1_enq_rdy,
       CAN_FIRE_tx_to_stage1_notFull,
       WILL_FIRE_RL_rl_gen_next_pc,
       WILL_FIRE_RL_rl_initialize,
       WILL_FIRE_ma_bpu_enable,
       WILL_FIRE_ma_flush,
       WILL_FIRE_ma_mispredict,
       WILL_FIRE_ma_train_bpu,
       WILL_FIRE_ma_update_eEpoch,
       WILL_FIRE_ma_update_wEpoch,
       WILL_FIRE_to_icache_get,
       WILL_FIRE_tx_to_stage1_enq_rdy,
       WILL_FIRE_tx_to_stage1_notFull;

  // declarations used by system tasks
  // synopsys translate_off
  reg TASK_testplusargs___d35;
  reg TASK_testplusargs___d36;
  reg TASK_testplusargs___d37;
  reg [63 : 0] v__h1817;
  reg TASK_testplusargs___d71;
  reg TASK_testplusargs___d72;
  reg TASK_testplusargs___d73;
  reg [63 : 0] v__h2198;
  reg TASK_testplusargs___d84;
  reg TASK_testplusargs___d85;
  reg TASK_testplusargs___d86;
  reg [63 : 0] v__h2734;
  reg TASK_testplusargs___d93;
  reg TASK_testplusargs___d94;
  reg TASK_testplusargs___d95;
  reg [63 : 0] v__h2917;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d43;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d46;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d48;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d51;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d54;
  reg TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d56;
  reg NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40;
  reg NOT_rg_fence_port0__read__6_8_AND_NOT_rg_sfenc_ETC___d89;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d101;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d103;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d105;
  reg TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d107;
  // synopsys translate_on

  // remaining internal signals
  wire [63 : 0] nextpc__h1387,
		x_address__h2481,
		y_avValue__h1709,
		y_avValue_snd__h1952;
  wire [1 : 0] curr_epoch__h1308;
  wire NOT_rg_sfence_port0__read__3_4_AND_rg_delayed__ETC___d31;

  // action method ma_update_eEpoch
  assign RDY_ma_update_eEpoch = 1'd1 ;
  assign CAN_FIRE_ma_update_eEpoch = 1'd1 ;
  assign WILL_FIRE_ma_update_eEpoch = EN_ma_update_eEpoch ;

  // action method ma_update_wEpoch
  assign RDY_ma_update_wEpoch = 1'd1 ;
  assign CAN_FIRE_ma_update_wEpoch = 1'd1 ;
  assign WILL_FIRE_ma_update_wEpoch = EN_ma_update_wEpoch ;

  // action method ma_flush
  assign RDY_ma_flush = !rg_initialize ;
  assign CAN_FIRE_ma_flush = !rg_initialize ;
  assign WILL_FIRE_ma_flush = EN_ma_flush ;

  // action method ma_train_bpu
  assign RDY_ma_train_bpu = bpu_RDY_ma_train_bpu ;
  assign CAN_FIRE_ma_train_bpu = bpu_RDY_ma_train_bpu ;
  assign WILL_FIRE_ma_train_bpu = EN_ma_train_bpu ;

  // action method ma_mispredict
  assign RDY_ma_mispredict = bpu_RDY_ma_mispredict ;
  assign CAN_FIRE_ma_mispredict = bpu_RDY_ma_mispredict ;
  assign WILL_FIRE_ma_mispredict = EN_ma_mispredict ;

  // action method ma_bpu_enable
  assign RDY_ma_bpu_enable = 1'd1 ;
  assign CAN_FIRE_ma_bpu_enable = 1'd1 ;
  assign WILL_FIRE_ma_bpu_enable = EN_ma_bpu_enable ;

  // actionvalue method to_icache_get
  assign to_icache_get = ff_to_cache_rv_port1__read[67:0] ;
  assign RDY_to_icache_get = ff_to_cache_rv_port1__read[68] ;
  assign CAN_FIRE_to_icache_get = ff_to_cache_rv_port1__read[68] ;
  assign WILL_FIRE_to_icache_get = EN_to_icache_get ;

  // action method tx_to_stage1_notFull
  assign CAN_FIRE_tx_to_stage1_notFull = 1'd1 ;
  assign WILL_FIRE_tx_to_stage1_notFull = 1'd1 ;

  // action method tx_to_stage1_enq_rdy
  assign CAN_FIRE_tx_to_stage1_enq_rdy = 1'd1 ;
  assign WILL_FIRE_tx_to_stage1_enq_rdy = 1'd1 ;

  // value method tx_to_stage1_enq_ena
  assign tx_to_stage1_enq_ena = tx_tostage1_w_ena_whas ;

  // value method tx_to_stage1_enq_data
  assign tx_to_stage1_enq_data =
	     { x_address__h2481,
	       rg_pc[1],
	       bpu_mav_prediction_response[12:1] } ;

  // submodule bpu
  mkbpu #(.hartid(hartid)) bpu(.CLK(CLK),
			       .RST_N(RST_N),
			       .ma_bpu_enable_e(bpu_ma_bpu_enable_e),
			       .ma_mispredict_g(bpu_ma_mispredict_g),
			       .ma_train_bpu_td(bpu_ma_train_bpu_td),
			       .mav_prediction_response_r(bpu_mav_prediction_response_r),
			       .EN_mav_prediction_response(bpu_EN_mav_prediction_response),
			       .EN_ma_train_bpu(bpu_EN_ma_train_bpu),
			       .EN_ma_mispredict(bpu_EN_ma_mispredict),
			       .EN_ma_bpu_enable(bpu_EN_ma_bpu_enable),
			       .mav_prediction_response(bpu_mav_prediction_response),
			       .RDY_mav_prediction_response(bpu_RDY_mav_prediction_response),
			       .RDY_ma_train_bpu(bpu_RDY_ma_train_bpu),
			       .RDY_ma_mispredict(bpu_RDY_ma_mispredict),
			       .RDY_ma_bpu_enable());

  // rule RL_rl_initialize
  assign CAN_FIRE_RL_rl_initialize = rg_initialize ;
  assign WILL_FIRE_RL_rl_initialize = rg_initialize ;

  // rule RL_rl_gen_next_pc
  assign CAN_FIRE_RL_rl_gen_next_pc =
	     !ff_to_cache_rv[68] && bpu_RDY_mav_prediction_response &&
	     tx_to_stage1_enq_rdy_b &&
	     tx_to_stage1_notFull_b &&
	     !rg_initialize ;
  assign WILL_FIRE_RL_rl_gen_next_pc = CAN_FIRE_RL_rl_gen_next_pc ;

  // inlined wires
  assign tx_tostage1_w_ena_whas =
	     WILL_FIRE_RL_rl_gen_next_pc && !rg_fence && !rg_sfence ;
  assign ff_to_cache_rv_port0__write_1 =
	     { 1'd1,
	       x_address__h2481,
	       curr_epoch__h1308,
	       rg_fence,
	       rg_sfence } ;
  assign ff_to_cache_rv_port1__read =
	     CAN_FIRE_RL_rl_gen_next_pc ?
	       ff_to_cache_rv_port0__write_1 :
	       ff_to_cache_rv ;
  assign ff_to_cache_rv_port1__write_1 =
	     { 1'd0,
	       68'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  } ;
  assign ff_to_cache_rv_port2__read =
	     EN_to_icache_get ?
	       ff_to_cache_rv_port1__write_1 :
	       ff_to_cache_rv_port1__read ;
  assign rg_pc_EN_port0__write =
	     WILL_FIRE_RL_rl_gen_next_pc && !rg_fence && !rg_sfence ;
  assign rg_pc_port0__write_1 =
	     rg_sfence ? nextpc__h1387 : y_avValue_snd__h1952 ;
  assign rg_pc_port1__read =
	     rg_pc_EN_port0__write ? rg_pc_port0__write_1 : rg_pc ;
  assign rg_pc_EN_port1__write = rg_initialize || EN_ma_flush ;
  assign rg_pc_port1__write_1 = rg_initialize ? resetpc : ma_flush_fl[65:2] ;
  assign rg_pc_port2__read =
	     rg_pc_EN_port1__write ?
	       rg_pc_port1__write_1 :
	       rg_pc_port1__read ;
  assign rg_fence_EN_port0__write = WILL_FIRE_RL_rl_gen_next_pc && rg_fence ;
  assign rg_fence_port1__read = !rg_fence_EN_port0__write && rg_fence ;
  assign rg_fence_port2__read =
	     EN_ma_flush ? ma_flush_fl[1] : rg_fence_port1__read ;
  assign rg_sfence_EN_port0__write =
	     WILL_FIRE_RL_rl_gen_next_pc && rg_sfence ;
  assign rg_sfence_port1__read = !rg_sfence_EN_port0__write && rg_sfence ;
  assign rg_sfence_port2__read =
	     EN_ma_flush ? ma_flush_fl[0] : rg_sfence_port1__read ;
  assign rg_delayed_redirect_EN_port0__write =
	     WILL_FIRE_RL_rl_gen_next_pc &&
	     NOT_rg_sfence_port0__read__3_4_AND_rg_delayed__ETC___d31 ;
  assign rg_delayed_redirect_port0__write_1 =
	     { !rg_delayed_redirect[64],
	       bpu_mav_prediction_response[76:13] } ;
  assign rg_delayed_redirect_port1__read =
	     rg_delayed_redirect_EN_port0__write ?
	       rg_delayed_redirect_port0__write_1 :
	       rg_delayed_redirect ;
  assign rg_delayed_redirect_port1__write_1 =
	     { 1'd0,
	       64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  } ;
  assign rg_delayed_redirect_port2__read =
	     EN_ma_flush ?
	       rg_delayed_redirect_port1__write_1 :
	       rg_delayed_redirect_port1__read ;

  // register ff_to_cache_rv
  assign ff_to_cache_rv_D_IN = ff_to_cache_rv_port2__read ;
  assign ff_to_cache_rv_EN = 1'b1 ;

  // register rg_delayed_redirect
  assign rg_delayed_redirect_D_IN = rg_delayed_redirect_port2__read ;
  assign rg_delayed_redirect_EN = 1'b1 ;

  // register rg_eEpoch
  assign rg_eEpoch_D_IN = ~rg_eEpoch ;
  assign rg_eEpoch_EN = EN_ma_update_eEpoch ;

  // register rg_fence
  assign rg_fence_D_IN = rg_fence_port2__read ;
  assign rg_fence_EN = 1'b1 ;

  // register rg_initialize
  assign rg_initialize_D_IN = 1'd0 ;
  assign rg_initialize_EN = rg_initialize ;

  // register rg_pc
  assign rg_pc_D_IN = rg_pc_port2__read ;
  assign rg_pc_EN = 1'b1 ;

  // register rg_sfence
  assign rg_sfence_D_IN = rg_sfence_port2__read ;
  assign rg_sfence_EN = 1'b1 ;

  // register rg_wEpoch
  assign rg_wEpoch_D_IN = ~rg_wEpoch ;
  assign rg_wEpoch_EN = EN_ma_update_wEpoch ;

  // submodule bpu
  assign bpu_ma_bpu_enable_e = ma_bpu_enable_e ;
  assign bpu_ma_mispredict_g = ma_mispredict_g ;
  assign bpu_ma_train_bpu_td = ma_train_bpu_td ;
  assign bpu_mav_prediction_response_r = { rg_pc, rg_fence, rg_pc[1] } ;
  assign bpu_EN_mav_prediction_response =
	     WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence ;
  assign bpu_EN_ma_train_bpu = EN_ma_train_bpu ;
  assign bpu_EN_ma_mispredict = EN_ma_mispredict ;
  assign bpu_EN_ma_bpu_enable = EN_ma_bpu_enable ;

  // remaining internal signals
  assign NOT_rg_sfence_port0__read__3_4_AND_rg_delayed__ETC___d31 =
	     !rg_sfence &&
	     (rg_delayed_redirect[64] ||
	      bpu_mav_prediction_response[9] &&
	      !bpu_mav_prediction_response[0] &&
	      bpu_mav_prediction_response[12:11] > 2'd1) ;
  assign curr_epoch__h1308 = { rg_eEpoch, rg_wEpoch } ;
  assign nextpc__h1387 = x_address__h2481 + 64'd4 ;
  assign x_address__h2481 = { rg_pc[63:2], 2'd0 } ;
  assign y_avValue__h1709 =
	     (bpu_mav_prediction_response[12] &&
	      (!bpu_mav_prediction_response[9] ||
	       bpu_mav_prediction_response[0])) ?
	       bpu_mav_prediction_response[76:13] :
	       nextpc__h1387 ;
  assign y_avValue_snd__h1952 =
	     rg_delayed_redirect[64] ?
	       rg_delayed_redirect[63:0] :
	       y_avValue__h1709 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        ff_to_cache_rv <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0,
	      68'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  };
	rg_delayed_redirect <= `BSV_ASSIGNMENT_DELAY
	    { 1'd0,
	      64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */  };
	rg_eEpoch <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_fence <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_initialize <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rg_pc <= `BSV_ASSIGNMENT_DELAY 64'h0000000000001000;
	rg_sfence <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_wEpoch <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (ff_to_cache_rv_EN)
	  ff_to_cache_rv <= `BSV_ASSIGNMENT_DELAY ff_to_cache_rv_D_IN;
	if (rg_delayed_redirect_EN)
	  rg_delayed_redirect <= `BSV_ASSIGNMENT_DELAY
	      rg_delayed_redirect_D_IN;
	if (rg_eEpoch_EN) rg_eEpoch <= `BSV_ASSIGNMENT_DELAY rg_eEpoch_D_IN;
	if (rg_fence_EN) rg_fence <= `BSV_ASSIGNMENT_DELAY rg_fence_D_IN;
	if (rg_initialize_EN)
	  rg_initialize <= `BSV_ASSIGNMENT_DELAY rg_initialize_D_IN;
	if (rg_pc_EN) rg_pc <= `BSV_ASSIGNMENT_DELAY rg_pc_D_IN;
	if (rg_sfence_EN) rg_sfence <= `BSV_ASSIGNMENT_DELAY rg_sfence_D_IN;
	if (rg_wEpoch_EN) rg_wEpoch <= `BSV_ASSIGNMENT_DELAY rg_wEpoch_D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    ff_to_cache_rv = 69'h0AAAAAAAAAAAAAAAAA;
    rg_delayed_redirect = 65'h0AAAAAAAAAAAAAAAA;
    rg_eEpoch = 1'h0;
    rg_fence = 1'h0;
    rg_initialize = 1'h0;
    rg_pc = 64'hAAAAAAAAAAAAAAAA;
    rg_sfence = 1'h0;
    rg_wEpoch = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence)
	begin
	  TASK_testplusargs___d35 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence)
	begin
	  TASK_testplusargs___d36 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence)
	begin
	  TASK_testplusargs___d37 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d43 =
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37) &&
	bpu_mav_prediction_response[10];
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d46 =
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37) &&
	!bpu_mav_prediction_response[10];
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d48 =
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37) &&
	bpu_mav_prediction_response[9];
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d51 =
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37) &&
	!bpu_mav_prediction_response[9];
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d54 =
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37) &&
	bpu_mav_prediction_response[0];
    TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d56 =
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37) &&
	!bpu_mav_prediction_response[0];
    NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40 =
	!rg_sfence &&
	(TASK_testplusargs___d35 ||
	 TASK_testplusargs___d36 && TASK_testplusargs___d37);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence)
	begin
	  v__h1817 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("[%10d", v__h1817, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("[%2d]STAGE0: BPU response:", hartid);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("PredictionResponse { ", "nextpc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("'h%h", bpu_mav_prediction_response[76:13]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write(", ", "btbresponse: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("BTBResponse { ", "prediction: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("'h%h", bpu_mav_prediction_response[12:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write(", ", "btbhit: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d43)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d46)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write(", ", "hi: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d48)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d51)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write(", ", "history: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("'h%h", bpu_mav_prediction_response[8:1], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write(", ", "instr16: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d54)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_sfence &&
	  TASK_testplusargs_5_OR_TASK_testplusargs_6_AND_ETC___d56)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_sfence_port0__read__3_4_AND_TASK_testpl_ETC___d40)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d71 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d72 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  TASK_testplusargs___d73 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc)
	begin
	  v__h2198 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d71 ||
	   TASK_testplusargs___d72 && TASK_testplusargs___d73))
	$write("[%10d", v__h2198, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d71 ||
	   TASK_testplusargs___d72 && TASK_testplusargs___d73))
	$write("[%2d]STAGE0: Sending PC:%h to I$. ",
	       hartid,
	       x_address__h2481);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  (TASK_testplusargs___d71 ||
	   TASK_testplusargs___d72 && TASK_testplusargs___d73))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence && !rg_sfence)
	begin
	  TASK_testplusargs___d84 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence && !rg_sfence)
	begin
	  TASK_testplusargs___d85 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence && !rg_sfence)
	begin
	  TASK_testplusargs___d86 = $test$plusargs("l0");
	  #0;
	end
    NOT_rg_fence_port0__read__6_8_AND_NOT_rg_sfenc_ETC___d89 =
	!rg_fence && !rg_sfence &&
	(TASK_testplusargs___d84 ||
	 TASK_testplusargs___d85 && TASK_testplusargs___d86);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc && !rg_fence && !rg_sfence)
	begin
	  v__h2734 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_fence_port0__read__6_8_AND_NOT_rg_sfenc_ETC___d89)
	$write("[%10d", v__h2734, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_fence_port0__read__6_8_AND_NOT_rg_sfenc_ETC___d89)
	$write("[%2d]STAGE0: Sending PC:%h to Stage1", hartid, rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_gen_next_pc &&
	  NOT_rg_fence_port0__read__6_8_AND_NOT_rg_sfenc_ETC___d89)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  TASK_testplusargs___d93 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  TASK_testplusargs___d94 = $test$plusargs("mstage0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  TASK_testplusargs___d95 = $test$plusargs("l1");
	  #0;
	end
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d101 =
	(TASK_testplusargs___d93 ||
	 TASK_testplusargs___d94 && TASK_testplusargs___d95) &&
	ma_flush_fl[1];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d103 =
	(TASK_testplusargs___d93 ||
	 TASK_testplusargs___d94 && TASK_testplusargs___d95) &&
	!ma_flush_fl[1];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d105 =
	(TASK_testplusargs___d93 ||
	 TASK_testplusargs___d94 && TASK_testplusargs___d95) &&
	ma_flush_fl[0];
    TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d107 =
	(TASK_testplusargs___d93 ||
	 TASK_testplusargs___d94 && TASK_testplusargs___d95) &&
	!ma_flush_fl[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush)
	begin
	  v__h2917 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write("[%10d", v__h2917, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write("[%2d]STAGE0: Recieved Flush:", hartid);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write("Stage0Flush { ", "pc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write("'h%h", ma_flush_fl[65:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write(", ", "fence: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d101)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d103)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write(", ", "sfence: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d105)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  TASK_testplusargs_3_OR_TASK_testplusargs_4_AND_ETC___d107)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_flush &&
	  (TASK_testplusargs___d93 ||
	   TASK_testplusargs___d94 && TASK_testplusargs___d95))
	$write("\n");
  end
  // synopsys translate_on
endmodule  // mkstage0

