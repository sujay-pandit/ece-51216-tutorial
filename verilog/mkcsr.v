//
// Generated by Bluespec Compiler, version 2022.01-5-ge3edf4b1 (build e3edf4b1)
//
// On Fri Apr 15 12:46:54 EDT 2022
//
//
// Ports:
// Name                         I/O  size props
// system_instruction             O    65
// RDY_system_instruction         O     1
// mv_resp_to_core                O    65
// RDY_mv_resp_to_core            O     1 const
// mv_csrs_to_decode              O   145
// RDY_mv_csrs_to_decode          O     1 const
// mv_resume_wfi                  O     1
// RDY_mv_resume_wfi              O     1 const
// take_trap                      O    64
// RDY_take_trap                  O     1 const
// RDY_ma_clint_msip              O     1 const
// RDY_ma_clint_mtip              O     1 const
// RDY_ma_clint_mtime             O     1 const
// RDY_ma_incr_minstret           O     1 const
// mv_csr_satp                    O    64
// RDY_mv_csr_satp                O     1 const
// RDY_ma_update_fflags           O     1 const
// RDY_ma_set_meip                O     1 const
// RDY_ma_set_seip                O     1 const
// mv_csr_misa_c                  O     1 reg
// RDY_mv_csr_misa_c              O     1 const
// mv_cacheenable                 O     3 reg
// RDY_mv_cacheenable             O     1 const
// mv_curr_priv                   O     2 reg
// RDY_mv_curr_priv               O     1 const
// mv_csr_mstatus                 O    64
// RDY_mv_csr_mstatus             O     1 const
// mv_pmp_cfg                     O    32 reg
// RDY_mv_pmp_cfg                 O     1 const
// mv_pmp_addr                    O   116 reg
// RDY_mv_pmp_addr                O     1 const
// RDY_ma_events_grp4             O     1 const
// RDY_ma_events_grp5             O     1 const
// RDY_ma_events_grp6             O     1 const
// RDY_ma_events_grp7             O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// system_instruction_csr_address  I    12
// system_instruction_op1         I    64
// system_instruction_funct3      I     3
// system_instruction_lpc         I     2
// take_trap_type_cause           I     6
// take_trap_pc                   I    64
// take_trap_badaddr              I    64
// ma_clint_msip_intrpt           I     1 reg
// ma_clint_mtip_intrpt           I     1 reg
// ma_clint_mtime_c_mtime         I    64 reg
// ma_update_fflags_flags         I     5
// ma_set_meip_ex_i               I     1 reg
// ma_set_seip_ex_i               I     1 reg
// ma_events_grp4_e               I    30
// ma_events_grp5_e               I    30
// ma_events_grp6_e               I    30
// ma_events_grp7_e               I    30
// EN_ma_clint_msip               I     1
// EN_ma_clint_mtip               I     1
// EN_ma_clint_mtime              I     1
// EN_ma_incr_minstret            I     1
// EN_ma_update_fflags            I     1
// EN_ma_set_meip                 I     1
// EN_ma_set_seip                 I     1
// EN_ma_events_grp4              I     1
// EN_ma_events_grp5              I     1
// EN_ma_events_grp6              I     1
// EN_ma_events_grp7              I     1
// EN_system_instruction          I     1
// EN_take_trap                   I     1
//
// Combinational paths from inputs to outputs:
//   (system_instruction_csr_address,
//    system_instruction_funct3,
//    EN_system_instruction) -> system_instruction
//   (take_trap_type_cause, EN_take_trap) -> take_trap
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

module mkcsr(CLK,
	     RST_N,

	     system_instruction_csr_address,
	     system_instruction_op1,
	     system_instruction_funct3,
	     system_instruction_lpc,
	     EN_system_instruction,
	     system_instruction,
	     RDY_system_instruction,

	     mv_resp_to_core,
	     RDY_mv_resp_to_core,

	     mv_csrs_to_decode,
	     RDY_mv_csrs_to_decode,

	     mv_resume_wfi,
	     RDY_mv_resume_wfi,

	     take_trap_type_cause,
	     take_trap_pc,
	     take_trap_badaddr,
	     EN_take_trap,
	     take_trap,
	     RDY_take_trap,

	     ma_clint_msip_intrpt,
	     EN_ma_clint_msip,
	     RDY_ma_clint_msip,

	     ma_clint_mtip_intrpt,
	     EN_ma_clint_mtip,
	     RDY_ma_clint_mtip,

	     ma_clint_mtime_c_mtime,
	     EN_ma_clint_mtime,
	     RDY_ma_clint_mtime,

	     EN_ma_incr_minstret,
	     RDY_ma_incr_minstret,

	     mv_csr_satp,
	     RDY_mv_csr_satp,

	     ma_update_fflags_flags,
	     EN_ma_update_fflags,
	     RDY_ma_update_fflags,

	     ma_set_meip_ex_i,
	     EN_ma_set_meip,
	     RDY_ma_set_meip,

	     ma_set_seip_ex_i,
	     EN_ma_set_seip,
	     RDY_ma_set_seip,

	     mv_csr_misa_c,
	     RDY_mv_csr_misa_c,

	     mv_cacheenable,
	     RDY_mv_cacheenable,

	     mv_curr_priv,
	     RDY_mv_curr_priv,

	     mv_csr_mstatus,
	     RDY_mv_csr_mstatus,

	     mv_pmp_cfg,
	     RDY_mv_pmp_cfg,

	     mv_pmp_addr,
	     RDY_mv_pmp_addr,

	     ma_events_grp4_e,
	     EN_ma_events_grp4,
	     RDY_ma_events_grp4,

	     ma_events_grp5_e,
	     EN_ma_events_grp5,
	     RDY_ma_events_grp5,

	     ma_events_grp6_e,
	     EN_ma_events_grp6,
	     RDY_ma_events_grp6,

	     ma_events_grp7_e,
	     EN_ma_events_grp7,
	     RDY_ma_events_grp7);
  parameter [63 : 0] hartid = 64'b0;
  input  CLK;
  input  RST_N;

  // actionvalue method system_instruction
  input  [11 : 0] system_instruction_csr_address;
  input  [63 : 0] system_instruction_op1;
  input  [2 : 0] system_instruction_funct3;
  input  [1 : 0] system_instruction_lpc;
  input  EN_system_instruction;
  output [64 : 0] system_instruction;
  output RDY_system_instruction;

  // value method mv_resp_to_core
  output [64 : 0] mv_resp_to_core;
  output RDY_mv_resp_to_core;

  // value method mv_csrs_to_decode
  output [144 : 0] mv_csrs_to_decode;
  output RDY_mv_csrs_to_decode;

  // value method mv_resume_wfi
  output mv_resume_wfi;
  output RDY_mv_resume_wfi;

  // actionvalue method take_trap
  input  [5 : 0] take_trap_type_cause;
  input  [63 : 0] take_trap_pc;
  input  [63 : 0] take_trap_badaddr;
  input  EN_take_trap;
  output [63 : 0] take_trap;
  output RDY_take_trap;

  // action method ma_clint_msip
  input  ma_clint_msip_intrpt;
  input  EN_ma_clint_msip;
  output RDY_ma_clint_msip;

  // action method ma_clint_mtip
  input  ma_clint_mtip_intrpt;
  input  EN_ma_clint_mtip;
  output RDY_ma_clint_mtip;

  // action method ma_clint_mtime
  input  [63 : 0] ma_clint_mtime_c_mtime;
  input  EN_ma_clint_mtime;
  output RDY_ma_clint_mtime;

  // action method ma_incr_minstret
  input  EN_ma_incr_minstret;
  output RDY_ma_incr_minstret;

  // value method mv_csr_satp
  output [63 : 0] mv_csr_satp;
  output RDY_mv_csr_satp;

  // action method ma_update_fflags
  input  [4 : 0] ma_update_fflags_flags;
  input  EN_ma_update_fflags;
  output RDY_ma_update_fflags;

  // action method ma_set_meip
  input  ma_set_meip_ex_i;
  input  EN_ma_set_meip;
  output RDY_ma_set_meip;

  // action method ma_set_seip
  input  ma_set_seip_ex_i;
  input  EN_ma_set_seip;
  output RDY_ma_set_seip;

  // value method mv_csr_misa_c
  output mv_csr_misa_c;
  output RDY_mv_csr_misa_c;

  // value method mv_cacheenable
  output [2 : 0] mv_cacheenable;
  output RDY_mv_cacheenable;

  // value method mv_curr_priv
  output [1 : 0] mv_curr_priv;
  output RDY_mv_curr_priv;

  // value method mv_csr_mstatus
  output [63 : 0] mv_csr_mstatus;
  output RDY_mv_csr_mstatus;

  // value method mv_pmp_cfg
  output [31 : 0] mv_pmp_cfg;
  output RDY_mv_pmp_cfg;

  // value method mv_pmp_addr
  output [115 : 0] mv_pmp_addr;
  output RDY_mv_pmp_addr;

  // action method ma_events_grp4
  input  [29 : 0] ma_events_grp4_e;
  input  EN_ma_events_grp4;
  output RDY_ma_events_grp4;

  // action method ma_events_grp5
  input  [29 : 0] ma_events_grp5_e;
  input  EN_ma_events_grp5;
  output RDY_ma_events_grp5;

  // action method ma_events_grp6
  input  [29 : 0] ma_events_grp6_e;
  input  EN_ma_events_grp6;
  output RDY_ma_events_grp6;

  // action method ma_events_grp7
  input  [29 : 0] ma_events_grp7_e;
  input  EN_ma_events_grp7;
  output RDY_ma_events_grp7;

  // signals for module outputs
  wire [144 : 0] mv_csrs_to_decode;
  wire [115 : 0] mv_pmp_addr;
  wire [64 : 0] mv_resp_to_core, system_instruction;
  wire [63 : 0] mv_csr_mstatus, mv_csr_satp, take_trap;
  wire [31 : 0] mv_pmp_cfg;
  wire [2 : 0] mv_cacheenable;
  wire [1 : 0] mv_curr_priv;
  wire RDY_ma_clint_msip,
       RDY_ma_clint_mtime,
       RDY_ma_clint_mtip,
       RDY_ma_events_grp4,
       RDY_ma_events_grp5,
       RDY_ma_events_grp6,
       RDY_ma_events_grp7,
       RDY_ma_incr_minstret,
       RDY_ma_set_meip,
       RDY_ma_set_seip,
       RDY_ma_update_fflags,
       RDY_mv_cacheenable,
       RDY_mv_csr_misa_c,
       RDY_mv_csr_mstatus,
       RDY_mv_csr_satp,
       RDY_mv_csrs_to_decode,
       RDY_mv_curr_priv,
       RDY_mv_pmp_addr,
       RDY_mv_pmp_cfg,
       RDY_mv_resp_to_core,
       RDY_mv_resume_wfi,
       RDY_system_instruction,
       RDY_take_trap,
       mv_csr_misa_c,
       mv_resume_wfi;

  // inlined wires
  wire rg_csr_wait_1_wget, rg_csr_wait_1_whas;

  // register rg_csr_wait
  reg rg_csr_wait;
  wire rg_csr_wait_D_IN, rg_csr_wait_EN;

  // ports of submodule csrfile
  wire [144 : 0] csrfile_mv_csrs_to_decode;
  wire [115 : 0] csrfile_mv_pmp_addr;
  wire [79 : 0] csrfile_ma_core_req_req;
  wire [64 : 0] csrfile_mv_resp_to_core;
  wire [63 : 0] csrfile_ma_clint_mtime_c_mtime,
		csrfile_mav_upd_on_ret,
		csrfile_mav_upd_on_trap,
		csrfile_mav_upd_on_trap_pc,
		csrfile_mav_upd_on_trap_tval,
		csrfile_mv_csr_mstatus,
		csrfile_mv_csr_satp;
  wire [31 : 0] csrfile_mv_pmp_cfg;
  wire [29 : 0] csrfile_ma_events_grp4_e,
		csrfile_ma_events_grp5_e,
		csrfile_ma_events_grp6_e,
		csrfile_ma_events_grp7_e;
  wire [5 : 0] csrfile_mav_upd_on_trap_c;
  wire [4 : 0] csrfile_ma_update_fflags_flags;
  wire [2 : 0] csrfile_mv_cacheenable;
  wire [1 : 0] csrfile_mav_upd_on_ret_prv, csrfile_mv_curr_priv;
  wire csrfile_EN_ma_clint_msip,
       csrfile_EN_ma_clint_mtime,
       csrfile_EN_ma_clint_mtip,
       csrfile_EN_ma_core_req,
       csrfile_EN_ma_events_grp4,
       csrfile_EN_ma_events_grp5,
       csrfile_EN_ma_events_grp6,
       csrfile_EN_ma_events_grp7,
       csrfile_EN_ma_incr_minstret,
       csrfile_EN_ma_set_meip,
       csrfile_EN_ma_set_seip,
       csrfile_EN_ma_update_fflags,
       csrfile_EN_mav_upd_on_ret,
       csrfile_EN_mav_upd_on_trap,
       csrfile_RDY_ma_core_req,
       csrfile_RDY_mav_upd_on_ret,
       csrfile_RDY_mav_upd_on_trap,
       csrfile_RDY_mv_csrs_to_decode,
       csrfile_ma_clint_msip_intrpt,
       csrfile_ma_clint_mtip_intrpt,
       csrfile_ma_set_meip_ex_i,
       csrfile_ma_set_seip_ex_i,
       csrfile_mv_csr_misa_c,
       csrfile_mv_resume_wfi;

  // rule scheduling signals
  wire CAN_FIRE_RL_rg_csr_wait__dreg_update,
       CAN_FIRE_ma_clint_msip,
       CAN_FIRE_ma_clint_mtime,
       CAN_FIRE_ma_clint_mtip,
       CAN_FIRE_ma_events_grp4,
       CAN_FIRE_ma_events_grp5,
       CAN_FIRE_ma_events_grp6,
       CAN_FIRE_ma_events_grp7,
       CAN_FIRE_ma_incr_minstret,
       CAN_FIRE_ma_set_meip,
       CAN_FIRE_ma_set_seip,
       CAN_FIRE_ma_update_fflags,
       CAN_FIRE_system_instruction,
       CAN_FIRE_take_trap,
       WILL_FIRE_RL_rg_csr_wait__dreg_update,
       WILL_FIRE_ma_clint_msip,
       WILL_FIRE_ma_clint_mtime,
       WILL_FIRE_ma_clint_mtip,
       WILL_FIRE_ma_events_grp4,
       WILL_FIRE_ma_events_grp5,
       WILL_FIRE_ma_events_grp6,
       WILL_FIRE_ma_events_grp7,
       WILL_FIRE_ma_incr_minstret,
       WILL_FIRE_ma_set_meip,
       WILL_FIRE_ma_set_seip,
       WILL_FIRE_ma_update_fflags,
       WILL_FIRE_system_instruction,
       WILL_FIRE_take_trap;

  // declarations used by system tasks
  // synopsys translate_off
  reg TASK_testplusargs___d13;
  reg TASK_testplusargs___d14;
  reg TASK_testplusargs___d15;
  reg [63 : 0] v__h789;
  reg system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d18;
  // synopsys translate_on

  // actionvalue method system_instruction
  assign system_instruction =
	     { system_instruction_funct3 == 3'd0 &&
	       (system_instruction_csr_address[11:8] == 4'h0 ||
		system_instruction_csr_address[11:8] == 4'h1 ||
		system_instruction_csr_address[11:8] == 4'h3),
	       csrfile_mav_upd_on_ret } ;
  assign RDY_system_instruction =
	     csrfile_RDY_mav_upd_on_ret && csrfile_RDY_ma_core_req ;
  assign CAN_FIRE_system_instruction =
	     csrfile_RDY_mav_upd_on_ret && csrfile_RDY_ma_core_req ;
  assign WILL_FIRE_system_instruction = EN_system_instruction ;

  // value method mv_resp_to_core
  assign mv_resp_to_core = csrfile_mv_resp_to_core ;
  assign RDY_mv_resp_to_core = 1'd1 ;

  // value method mv_csrs_to_decode
  assign mv_csrs_to_decode = csrfile_mv_csrs_to_decode ;
  assign RDY_mv_csrs_to_decode = csrfile_RDY_mv_csrs_to_decode ;

  // value method mv_resume_wfi
  assign mv_resume_wfi = csrfile_mv_resume_wfi ;
  assign RDY_mv_resume_wfi = 1'd1 ;

  // actionvalue method take_trap
  assign take_trap = csrfile_mav_upd_on_trap ;
  assign RDY_take_trap = csrfile_RDY_mav_upd_on_trap ;
  assign CAN_FIRE_take_trap = csrfile_RDY_mav_upd_on_trap ;
  assign WILL_FIRE_take_trap = EN_take_trap ;

  // action method ma_clint_msip
  assign RDY_ma_clint_msip = 1'd1 ;
  assign CAN_FIRE_ma_clint_msip = 1'd1 ;
  assign WILL_FIRE_ma_clint_msip = EN_ma_clint_msip ;

  // action method ma_clint_mtip
  assign RDY_ma_clint_mtip = 1'd1 ;
  assign CAN_FIRE_ma_clint_mtip = 1'd1 ;
  assign WILL_FIRE_ma_clint_mtip = EN_ma_clint_mtip ;

  // action method ma_clint_mtime
  assign RDY_ma_clint_mtime = 1'd1 ;
  assign CAN_FIRE_ma_clint_mtime = 1'd1 ;
  assign WILL_FIRE_ma_clint_mtime = EN_ma_clint_mtime ;

  // action method ma_incr_minstret
  assign RDY_ma_incr_minstret = 1'd1 ;
  assign CAN_FIRE_ma_incr_minstret = 1'd1 ;
  assign WILL_FIRE_ma_incr_minstret = EN_ma_incr_minstret ;

  // value method mv_csr_satp
  assign mv_csr_satp = csrfile_mv_csr_satp ;
  assign RDY_mv_csr_satp = 1'd1 ;

  // action method ma_update_fflags
  assign RDY_ma_update_fflags = 1'd1 ;
  assign CAN_FIRE_ma_update_fflags = 1'd1 ;
  assign WILL_FIRE_ma_update_fflags = EN_ma_update_fflags ;

  // action method ma_set_meip
  assign RDY_ma_set_meip = 1'd1 ;
  assign CAN_FIRE_ma_set_meip = 1'd1 ;
  assign WILL_FIRE_ma_set_meip = EN_ma_set_meip ;

  // action method ma_set_seip
  assign RDY_ma_set_seip = 1'd1 ;
  assign CAN_FIRE_ma_set_seip = 1'd1 ;
  assign WILL_FIRE_ma_set_seip = EN_ma_set_seip ;

  // value method mv_csr_misa_c
  assign mv_csr_misa_c = csrfile_mv_csr_misa_c ;
  assign RDY_mv_csr_misa_c = 1'd1 ;

  // value method mv_cacheenable
  assign mv_cacheenable = csrfile_mv_cacheenable ;
  assign RDY_mv_cacheenable = 1'd1 ;

  // value method mv_curr_priv
  assign mv_curr_priv = csrfile_mv_curr_priv ;
  assign RDY_mv_curr_priv = 1'd1 ;

  // value method mv_csr_mstatus
  assign mv_csr_mstatus = csrfile_mv_csr_mstatus ;
  assign RDY_mv_csr_mstatus = 1'd1 ;

  // value method mv_pmp_cfg
  assign mv_pmp_cfg = csrfile_mv_pmp_cfg ;
  assign RDY_mv_pmp_cfg = 1'd1 ;

  // value method mv_pmp_addr
  assign mv_pmp_addr = csrfile_mv_pmp_addr ;
  assign RDY_mv_pmp_addr = 1'd1 ;

  // action method ma_events_grp4
  assign RDY_ma_events_grp4 = 1'd1 ;
  assign CAN_FIRE_ma_events_grp4 = 1'd1 ;
  assign WILL_FIRE_ma_events_grp4 = EN_ma_events_grp4 ;

  // action method ma_events_grp5
  assign RDY_ma_events_grp5 = 1'd1 ;
  assign CAN_FIRE_ma_events_grp5 = 1'd1 ;
  assign WILL_FIRE_ma_events_grp5 = EN_ma_events_grp5 ;

  // action method ma_events_grp6
  assign RDY_ma_events_grp6 = 1'd1 ;
  assign CAN_FIRE_ma_events_grp6 = 1'd1 ;
  assign WILL_FIRE_ma_events_grp6 = EN_ma_events_grp6 ;

  // action method ma_events_grp7
  assign RDY_ma_events_grp7 = 1'd1 ;
  assign CAN_FIRE_ma_events_grp7 = 1'd1 ;
  assign WILL_FIRE_ma_events_grp7 = EN_ma_events_grp7 ;

  // submodule csrfile
  mk_csr_daisy csrfile(.CLK(CLK),
		       .RST_N(RST_N),
		       .ma_clint_msip_intrpt(csrfile_ma_clint_msip_intrpt),
		       .ma_clint_mtime_c_mtime(csrfile_ma_clint_mtime_c_mtime),
		       .ma_clint_mtip_intrpt(csrfile_ma_clint_mtip_intrpt),
		       .ma_core_req_req(csrfile_ma_core_req_req),
		       .ma_events_grp4_e(csrfile_ma_events_grp4_e),
		       .ma_events_grp5_e(csrfile_ma_events_grp5_e),
		       .ma_events_grp6_e(csrfile_ma_events_grp6_e),
		       .ma_events_grp7_e(csrfile_ma_events_grp7_e),
		       .ma_set_meip_ex_i(csrfile_ma_set_meip_ex_i),
		       .ma_set_seip_ex_i(csrfile_ma_set_seip_ex_i),
		       .ma_update_fflags_flags(csrfile_ma_update_fflags_flags),
		       .mav_upd_on_ret_prv(csrfile_mav_upd_on_ret_prv),
		       .mav_upd_on_trap_c(csrfile_mav_upd_on_trap_c),
		       .mav_upd_on_trap_pc(csrfile_mav_upd_on_trap_pc),
		       .mav_upd_on_trap_tval(csrfile_mav_upd_on_trap_tval),
		       .EN_ma_core_req(csrfile_EN_ma_core_req),
		       .EN_mav_upd_on_ret(csrfile_EN_mav_upd_on_ret),
		       .EN_mav_upd_on_trap(csrfile_EN_mav_upd_on_trap),
		       .EN_ma_clint_msip(csrfile_EN_ma_clint_msip),
		       .EN_ma_clint_mtip(csrfile_EN_ma_clint_mtip),
		       .EN_ma_set_meip(csrfile_EN_ma_set_meip),
		       .EN_ma_set_seip(csrfile_EN_ma_set_seip),
		       .EN_ma_update_fflags(csrfile_EN_ma_update_fflags),
		       .EN_ma_clint_mtime(csrfile_EN_ma_clint_mtime),
		       .EN_ma_incr_minstret(csrfile_EN_ma_incr_minstret),
		       .EN_ma_events_grp4(csrfile_EN_ma_events_grp4),
		       .EN_ma_events_grp5(csrfile_EN_ma_events_grp5),
		       .EN_ma_events_grp6(csrfile_EN_ma_events_grp6),
		       .EN_ma_events_grp7(csrfile_EN_ma_events_grp7),
		       .RDY_ma_core_req(csrfile_RDY_ma_core_req),
		       .mv_resp_to_core(csrfile_mv_resp_to_core),
		       .RDY_mv_resp_to_core(),
		       .mav_upd_on_ret(csrfile_mav_upd_on_ret),
		       .RDY_mav_upd_on_ret(csrfile_RDY_mav_upd_on_ret),
		       .mav_upd_on_trap(csrfile_mav_upd_on_trap),
		       .RDY_mav_upd_on_trap(csrfile_RDY_mav_upd_on_trap),
		       .RDY_ma_clint_msip(),
		       .RDY_ma_clint_mtip(),
		       .RDY_ma_set_meip(),
		       .RDY_ma_set_seip(),
		       .mv_csr_satp(csrfile_mv_csr_satp),
		       .RDY_mv_csr_satp(),
		       .mv_csr_mstatus(csrfile_mv_csr_mstatus),
		       .RDY_mv_csr_mstatus(),
		       .mv_csrs_to_decode(csrfile_mv_csrs_to_decode),
		       .RDY_mv_csrs_to_decode(csrfile_RDY_mv_csrs_to_decode),
		       .mv_curr_priv(csrfile_mv_curr_priv),
		       .RDY_mv_curr_priv(),
		       .mv_resume_wfi(csrfile_mv_resume_wfi),
		       .RDY_mv_resume_wfi(),
		       .RDY_ma_update_fflags(),
		       .mv_cacheenable(csrfile_mv_cacheenable),
		       .RDY_mv_cacheenable(),
		       .mv_csr_misa_c(csrfile_mv_csr_misa_c),
		       .RDY_mv_csr_misa_c(),
		       .mv_pmp_cfg(csrfile_mv_pmp_cfg),
		       .RDY_mv_pmp_cfg(),
		       .mv_pmp_addr(csrfile_mv_pmp_addr),
		       .RDY_mv_pmp_addr(),
		       .RDY_ma_clint_mtime(),
		       .RDY_ma_incr_minstret(),
		       .mv_mcounteren(),
		       .RDY_mv_mcounteren(),
		       .RDY_ma_events_grp4(),
		       .RDY_ma_events_grp5(),
		       .RDY_ma_events_grp6(),
		       .RDY_ma_events_grp7());

  // rule RL_rg_csr_wait__dreg_update
  assign CAN_FIRE_RL_rg_csr_wait__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_rg_csr_wait__dreg_update = 1'd1 ;

  // inlined wires
  assign rg_csr_wait_1_wget = !rg_csr_wait || !csrfile_mv_resp_to_core[64] ;
  assign rg_csr_wait_1_whas =
	     EN_system_instruction && system_instruction_funct3 != 3'd0 ;

  // register rg_csr_wait
  assign rg_csr_wait_D_IN = rg_csr_wait_1_whas && rg_csr_wait_1_wget ;
  assign rg_csr_wait_EN = 1'd1 ;

  // submodule csrfile
  assign csrfile_ma_clint_msip_intrpt = ma_clint_msip_intrpt ;
  assign csrfile_ma_clint_mtime_c_mtime = ma_clint_mtime_c_mtime ;
  assign csrfile_ma_clint_mtip_intrpt = ma_clint_mtip_intrpt ;
  assign csrfile_ma_core_req_req =
	     { system_instruction_csr_address,
	       system_instruction_op1,
	       system_instruction_funct3[1:0],
	       system_instruction_lpc } ;
  assign csrfile_ma_events_grp4_e = ma_events_grp4_e ;
  assign csrfile_ma_events_grp5_e = ma_events_grp5_e ;
  assign csrfile_ma_events_grp6_e = ma_events_grp6_e ;
  assign csrfile_ma_events_grp7_e = ma_events_grp7_e ;
  assign csrfile_ma_set_meip_ex_i = ma_set_meip_ex_i ;
  assign csrfile_ma_set_seip_ex_i = ma_set_seip_ex_i ;
  assign csrfile_ma_update_fflags_flags = ma_update_fflags_flags ;
  assign csrfile_mav_upd_on_ret_prv = system_instruction_csr_address[9:8] ;
  assign csrfile_mav_upd_on_trap_c = take_trap_type_cause ;
  assign csrfile_mav_upd_on_trap_pc = take_trap_pc ;
  assign csrfile_mav_upd_on_trap_tval = take_trap_badaddr ;
  assign csrfile_EN_ma_core_req =
	     EN_system_instruction && system_instruction_funct3 != 3'd0 &&
	     !rg_csr_wait ;
  assign csrfile_EN_mav_upd_on_ret =
	     EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	     (system_instruction_csr_address[11:8] == 4'h0 ||
	      system_instruction_csr_address[11:8] == 4'h1 ||
	      system_instruction_csr_address[11:8] == 4'h3) ;
  assign csrfile_EN_mav_upd_on_trap = EN_take_trap ;
  assign csrfile_EN_ma_clint_msip = EN_ma_clint_msip ;
  assign csrfile_EN_ma_clint_mtip = EN_ma_clint_mtip ;
  assign csrfile_EN_ma_set_meip = EN_ma_set_meip ;
  assign csrfile_EN_ma_set_seip = EN_ma_set_seip ;
  assign csrfile_EN_ma_update_fflags = EN_ma_update_fflags ;
  assign csrfile_EN_ma_clint_mtime = EN_ma_clint_mtime ;
  assign csrfile_EN_ma_incr_minstret = EN_ma_incr_minstret ;
  assign csrfile_EN_ma_events_grp4 = EN_ma_events_grp4 ;
  assign csrfile_EN_ma_events_grp5 = EN_ma_events_grp5 ;
  assign csrfile_EN_ma_events_grp6 = EN_ma_events_grp6 ;
  assign csrfile_EN_ma_events_grp7 = EN_ma_events_grp7 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_csr_wait <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_csr_wait_EN)
	  rg_csr_wait <= `BSV_ASSIGNMENT_DELAY rg_csr_wait_D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_csr_wait = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h1 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  TASK_testplusargs___d13 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h1 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  TASK_testplusargs___d14 = $test$plusargs("mcsr");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h1 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  TASK_testplusargs___d15 = $test$plusargs("l1");
	  #0;
	end
    system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d18 =
	(system_instruction_csr_address[11:8] == 4'h0 ||
	 system_instruction_csr_address[11:8] == 4'h1 ||
	 system_instruction_csr_address[11:8] == 4'h3) &&
	(TASK_testplusargs___d13 ||
	 TASK_testplusargs___d14 && TASK_testplusargs___d15);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h1 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  v__h789 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d18)
	$write("[%10d", v__h789, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d18)
	$write("[%2d]CSR : RET Function: %h",
	       hartid,
	       system_instruction_csr_address);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d18)
	$write("\n");
  end
  // synopsys translate_on
endmodule  // mkcsr

