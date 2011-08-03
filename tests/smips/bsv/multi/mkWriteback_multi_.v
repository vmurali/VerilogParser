`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkWriteback(
  CLK,
  RST_N,
  wb_notFull_READ,
  wb_enq_WRITE,
  wb_enq_EN_WRITE,
  wbIndex_READ,
  wbIndex_EN_READ,
  dataQ_notEmpty_WRITE,
  dataQ_first_WRITE,
  dataQ_deq_READ,
  regWrite_READ,
  regWrite_EN_READ,
  wb_notFull_READ_VALID,
  wb_enq_WRITE_VALID,
  wb_enq_EN_WRITE_VALID,
  wbIndex_READ_VALID,
  wbIndex_EN_READ_VALID,
  dataQ_notEmpty_WRITE_VALID,
  dataQ_first_WRITE_VALID,
  dataQ_deq_READ_VALID,
  regWrite_READ_VALID,
  regWrite_EN_READ_VALID,
  wb_notFull_READ_CONSUMED,
  wb_enq_WRITE_CONSUMED,
  wb_enq_EN_WRITE_CONSUMED,
  wbIndex_READ_CONSUMED,
  wbIndex_EN_READ_CONSUMED,
  dataQ_notEmpty_WRITE_CONSUMED,
  dataQ_first_WRITE_CONSUMED,
  dataQ_deq_READ_CONSUMED,
  regWrite_READ_CONSUMED,
  regWrite_EN_READ_CONSUMED);

  input  wb_enq_WRITE_VALID;
  input  wb_enq_EN_WRITE_VALID;
  input  dataQ_notEmpty_WRITE_VALID;
  input  dataQ_first_WRITE_VALID;
  input  wb_notFull_READ_CONSUMED;
  input  wbIndex_READ_CONSUMED;
  input  wbIndex_EN_READ_CONSUMED;
  input  dataQ_deq_READ_CONSUMED;
  input  regWrite_READ_CONSUMED;
  input  regWrite_EN_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input [37 : 0] wb_enq_WRITE;
  input  wb_enq_EN_WRITE;
  input  dataQ_notEmpty_WRITE;
  input [31 : 0] dataQ_first_WRITE;
  output  wb_enq_WRITE_CONSUMED;
  output  wb_enq_EN_WRITE_CONSUMED;
  output  dataQ_notEmpty_WRITE_CONSUMED;
  output  dataQ_first_WRITE_CONSUMED;
  output  wb_notFull_READ_VALID;
  output  wbIndex_READ_VALID;
  output  wbIndex_EN_READ_VALID;
  output  dataQ_deq_READ_VALID;
  output  regWrite_READ_VALID;
  output  regWrite_EN_READ_VALID;
  output  wb_notFull_READ;
  output [4 : 0] wbIndex_READ;
  output  wbIndex_EN_READ;
  output  dataQ_deq_READ;
  output [36 : 0] regWrite_READ;
  output  regWrite_EN_READ;
  wire [36 : 0] regWrite_READ;
  wire [4 : 0] wbIndex_READ;
  wire  dataQ_deq_READ, regWrite_EN_READ, wbIndex_EN_READ, wb_notFull_READ;
  wire  mod__dataQ__deq__data_$IN_EN_WRITE, mod__dataQ__deq__data_$OUT_READ;
  wire [31 : 0] mod__dataQ__first___data_$IN_WRITE, mod__dataQ__first___data_$OUT_READ;
  wire  mod__dataQ__first___data_$IN_EN_WRITE;
  wire  mod__dataQ__notEmpty___data_$IN_EN_WRITE, mod__dataQ__notEmpty___data_$IN_WRITE, mod__dataQ__notEmpty___data_$OUT_READ;
  wire [36 : 0] mod__regWrite__data_$IN_WRITE, mod__regWrite__data_$OUT_READ;
  wire  mod__regWrite__data_$IN_EN_WRITE;
  wire  mod__regWrite__en_$IN_EN_WRITE, mod__regWrite__en_$OUT_READ;
  wire [4 : 0] mod__wbIndex__data_$IN_WRITE, mod__wbIndex__data_$OUT_READ;
  wire  mod__wbIndex__data_$IN_EN_WRITE;
  wire  mod__wbIndex__en_$IN_EN_WRITE, mod__wbIndex__en_$OUT_READ;
  wire [37 : 0] mod__wb___enq__data_$IN_WRITE, mod__wb___enq__data_$OUT_READ;
  wire  mod__wb___enq__data_$IN_EN_WRITE;
  wire  mod__wb___enq__en_$IN_EN_WRITE, mod__wb___enq__en_$OUT_READ;
  wire  mod__wb___notFull___data_$IN_EN_WRITE, mod__wb___notFull___data_$IN_WRITE, mod__wb___notFull___data_$OUT_READ;
  wire  wbQ_head$IN_EN_WRITE;
  wire  wbQ_mod__deq___deq__data_$IN_EN_WRITE, wbQ_mod__deq___deq__data_$OUT_READ;
  wire [37 : 0] wbQ_mod__deq___first___data_$IN_WRITE, wbQ_mod__deq___first___data_$OUT_READ;
  wire  wbQ_mod__deq___first___data_$IN_EN_WRITE;
  wire  wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE, wbQ_mod__deq___notEmpty___data_$IN_WRITE, wbQ_mod__deq___notEmpty___data_$OUT_READ;
  wire [37 : 0] wbQ_mod__enq___enq__data_$IN_WRITE, wbQ_mod__enq___enq__data_$OUT_READ;
  wire  wbQ_mod__enq___enq__data_$IN_EN_WRITE;
  wire  wbQ_mod__enq___enq__en_$IN_EN_WRITE, wbQ_mod__enq___enq__en_$OUT_READ;
  wire  wbQ_mod__enq___notFull___data_$IN_EN_WRITE, wbQ_mod__enq___notFull___data_$IN_WRITE, wbQ_mod__enq___notFull___data_$OUT_READ;
  wire  wbQ_numElems$IN_EN_WRITE, wbQ_numElems$IN_WRITE, wbQ_numElems$OUT_READ;
  wire  wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE;
  wire  wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE;
  wire [37 : 0] wbQ_regs_mod__mod__read___resp___data_$IN_WRITE, wbQ_regs_mod__mod__read___resp___data_$OUT_READ;
  wire  wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE;
  wire [37 : 0] wbQ_regs_mod__mod__write___data_$IN_WRITE, wbQ_regs_mod__mod__write___data_$OUT_READ;
  wire  wbQ_regs_mod__mod__write___data_$IN_EN_WRITE;
  wire  wbQ_regs_mod__mod__write___en_$IN_EN_WRITE, wbQ_regs_mod__mod__write___en_$OUT_READ;
  wire  wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE;
  wire  wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE;
  wire [37 : 0] wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE, wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE;
  wire [37 : 0] wbQ_regs_mod__rf_mod__write___data_$IN_WRITE, wbQ_regs_mod__rf_mod__write___data_$OUT_READ;
  wire  wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE;
  wire  wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE, wbQ_regs_mod__rf_mod__write___en_$OUT_READ;
  wire [37 : 0] wbQ_regs_mod__rf_rf$READ_RESP_READ, wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE;
  wire  wbQ_regs_mod__rf_rf$WRITE_EN_WRITE;
  wire  wbQ_regs_mod__whichReg$IN_EN_WRITE;
  wire  wbQ_tail$IN_EN_WRITE;
  wire  WILL_FIRE_RL_c1_1;
  wire [1 : 0] _0_CONCAT_wbQ_mod__enq___enq__en_OUT_READ_MINU_ETC__q1;
  wire  dataQ_deq_READ_VALID;
  wire  dataQ_first_WRITE_VALID;
  wire  dataQ_notEmpty_WRITE_VALID;
  wire  mod__dataQ__deq__data_$IN_EN_WRITE_VALID;
  wire  mod__dataQ__deq__data_$OUT_READ_VALID;
  wire  mod__dataQ__first___data_$IN_EN_WRITE_VALID;
  wire  mod__dataQ__first___data_$IN_WRITE_VALID;
  wire  mod__dataQ__first___data_$OUT_READ_VALID;
  wire  mod__dataQ__notEmpty___data_$IN_EN_WRITE_VALID;
  wire  mod__dataQ__notEmpty___data_$IN_WRITE_VALID;
  wire  mod__dataQ__notEmpty___data_$OUT_READ_VALID;
  wire  mod__regWrite__data_$IN_EN_WRITE_VALID;
  wire  mod__regWrite__data_$IN_WRITE_VALID;
  wire  mod__regWrite__data_$OUT_READ_VALID;
  wire  mod__regWrite__en_$IN_EN_WRITE_VALID;
  wire  mod__regWrite__en_$OUT_READ_VALID;
  wire  mod__wbIndex__data_$IN_EN_WRITE_VALID;
  wire  mod__wbIndex__data_$IN_WRITE_VALID;
  wire  mod__wbIndex__data_$OUT_READ_VALID;
  wire  mod__wbIndex__en_$IN_EN_WRITE_VALID;
  wire  mod__wbIndex__en_$OUT_READ_VALID;
  wire  mod__wb___enq__data_$IN_EN_WRITE_VALID;
  wire  mod__wb___enq__data_$IN_WRITE_VALID;
  wire  mod__wb___enq__data_$OUT_READ_VALID;
  wire  mod__wb___enq__en_$IN_EN_WRITE_VALID;
  wire  mod__wb___enq__en_$OUT_READ_VALID;
  wire  mod__wb___notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__wb___notFull___data_$IN_WRITE_VALID;
  wire  mod__wb___notFull___data_$OUT_READ_VALID;
  wire  regWrite_EN_READ_VALID;
  wire  regWrite_READ_VALID;
  wire  wbIndex_EN_READ_VALID;
  wire  wbIndex_READ_VALID;
  wire  wbQ_head$IN_EN_WRITE_VALID;
  wire  wbQ_mod__deq___deq__data_$IN_EN_WRITE_VALID;
  wire  wbQ_mod__deq___deq__data_$OUT_READ_VALID;
  wire  wbQ_mod__deq___first___data_$IN_EN_WRITE_VALID;
  wire  wbQ_mod__deq___first___data_$IN_WRITE_VALID;
  wire  wbQ_mod__deq___first___data_$OUT_READ_VALID;
  wire  wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE_VALID;
  wire  wbQ_mod__deq___notEmpty___data_$IN_WRITE_VALID;
  wire  wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID;
  wire  wbQ_mod__enq___enq__data_$IN_EN_WRITE_VALID;
  wire  wbQ_mod__enq___enq__data_$IN_WRITE_VALID;
  wire  wbQ_mod__enq___enq__data_$OUT_READ_VALID;
  wire  wbQ_mod__enq___enq__en_$IN_EN_WRITE_VALID;
  wire  wbQ_mod__enq___enq__en_$OUT_READ_VALID;
  wire  wbQ_mod__enq___notFull___data_$IN_EN_WRITE_VALID;
  wire  wbQ_mod__enq___notFull___data_$IN_WRITE_VALID;
  wire  wbQ_mod__enq___notFull___data_$OUT_READ_VALID;
  wire  wbQ_numElems$IN_EN_WRITE_VALID;
  wire  wbQ_numElems$IN_WRITE_VALID;
  wire  wbQ_numElems$OUT_READ_VALID;
  wire  wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__read___resp___data_$IN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__read___resp___data_$OUT_READ_VALID;
  wire  wbQ_regs_mod__mod__write___data_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__write___data_$IN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__write___data_$OUT_READ_VALID;
  wire  wbQ_regs_mod__mod__write___en_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__mod__write___en_$OUT_READ_VALID;
  wire  wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;
  wire  wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__write___data_$IN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__write___data_$OUT_READ_VALID;
  wire  wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID;
  wire  wbQ_regs_mod__rf_mod__write___en_$OUT_READ_VALID;
  wire  wbQ_regs_mod__rf_rf$READ_RESP_READ_VALID;
  wire  wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE_VALID;
  wire  wbQ_regs_mod__rf_rf$WRITE_EN_WRITE_VALID;
  wire  wbQ_regs_mod__whichReg$IN_EN_WRITE_VALID;
  wire  wbQ_tail$IN_EN_WRITE_VALID;
  wire  wb_enq_EN_WRITE_VALID;
  wire  wb_enq_WRITE_VALID;
  wire  wb_notFull_READ_VALID;
  wire  dataQ_deq_READ_CONSUMED;
  wire  dataQ_first_WRITE_CONSUMED;
  wire  dataQ_notEmpty_WRITE_CONSUMED;
  wire  mod__dataQ__deq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataQ__deq__data_$OUT_READ_CONSUMED;
  wire  mod__dataQ__first___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataQ__first___data_$IN_WRITE_CONSUMED;
  wire  mod__dataQ__first___data_$OUT_READ_CONSUMED;
  wire  mod__dataQ__notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataQ__notEmpty___data_$IN_WRITE_CONSUMED;
  wire  mod__dataQ__notEmpty___data_$OUT_READ_CONSUMED;
  wire  mod__regWrite__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regWrite__data_$IN_WRITE_CONSUMED;
  wire  mod__regWrite__data_$OUT_READ_CONSUMED;
  wire  mod__regWrite__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__regWrite__en_$OUT_READ_CONSUMED;
  wire  mod__wbIndex__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__wbIndex__data_$IN_WRITE_CONSUMED;
  wire  mod__wbIndex__data_$OUT_READ_CONSUMED;
  wire  mod__wbIndex__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__wbIndex__en_$OUT_READ_CONSUMED;
  wire  mod__wb___enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__wb___enq__data_$IN_WRITE_CONSUMED;
  wire  mod__wb___enq__data_$OUT_READ_CONSUMED;
  wire  mod__wb___enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__wb___enq__en_$OUT_READ_CONSUMED;
  wire  mod__wb___notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__wb___notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__wb___notFull___data_$OUT_READ_CONSUMED;
  wire  regWrite_EN_READ_CONSUMED;
  wire  regWrite_READ_CONSUMED;
  wire  wbIndex_EN_READ_CONSUMED;
  wire  wbIndex_READ_CONSUMED;
  wire  wbQ_head$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__deq___deq__data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__deq___deq__data_$OUT_READ_CONSUMED;
  wire  wbQ_mod__deq___first___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__deq___first___data_$IN_WRITE_CONSUMED;
  wire  wbQ_mod__deq___first___data_$OUT_READ_CONSUMED;
  wire  wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__deq___notEmpty___data_$IN_WRITE_CONSUMED;
  wire  wbQ_mod__deq___notEmpty___data_$OUT_READ_CONSUMED;
  wire  wbQ_mod__enq___enq__data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__enq___enq__data_$IN_WRITE_CONSUMED;
  wire  wbQ_mod__enq___enq__data_$OUT_READ_CONSUMED;
  wire  wbQ_mod__enq___enq__en_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__enq___enq__en_$OUT_READ_CONSUMED;
  wire  wbQ_mod__enq___notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_mod__enq___notFull___data_$IN_WRITE_CONSUMED;
  wire  wbQ_mod__enq___notFull___data_$OUT_READ_CONSUMED;
  wire  wbQ_numElems$IN_EN_WRITE_CONSUMED;
  wire  wbQ_numElems$IN_WRITE_CONSUMED;
  wire  wbQ_numElems$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__write___data_$IN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__write___data_$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__mod__write___en_$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED;
  wire  wbQ_regs_mod__rf_rf$READ_RESP_READ_CONSUMED;
  wire  wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED;
  wire  wbQ_regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED;
  wire  wbQ_regs_mod__whichReg$IN_EN_WRITE_CONSUMED;
  wire  wbQ_tail$IN_EN_WRITE_CONSUMED;
  wire  wb_enq_EN_WRITE_CONSUMED;
  wire  wb_enq_WRITE_CONSUMED;
  wire  wb_notFull_READ_CONSUMED;

  assign wb_notFull_READ = mod__wb___notFull___data_$OUT_READ ;

  assign wbIndex_READ = mod__wbIndex__data_$OUT_READ ;

  assign wbIndex_EN_READ = mod__wbIndex__en_$OUT_READ ;

  assign dataQ_deq_READ = mod__dataQ__deq__data_$OUT_READ ;

  assign regWrite_READ = mod__regWrite__data_$OUT_READ ;

  assign regWrite_EN_READ = mod__regWrite__en_$OUT_READ ;

  assign WILL_FIRE_RL_c1_1 =
	     !mod__wb___enq__en_$OUT_READ ||
	     wbQ_mod__enq___notFull___data_$OUT_READ ;

  assign mod__dataQ__deq__data_$IN_EN_WRITE =
	     wbQ_mod__deq___notEmpty___data_$OUT_READ &&
	     (wbQ_mod__deq___first___data_$OUT_READ[32] ||
	      mod__dataQ__notEmpty___data_$OUT_READ) &&
	     !wbQ_mod__deq___first___data_$OUT_READ[32] ;

  assign mod__dataQ__first___data_$IN_WRITE = dataQ_first_WRITE ;

  assign mod__dataQ__first___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__dataQ__notEmpty___data_$IN_WRITE = dataQ_notEmpty_WRITE ;

  assign mod__dataQ__notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__regWrite__data_$IN_WRITE =
	     { wbQ_mod__deq___first___data_$OUT_READ[37:33],
	       wbQ_mod__deq___first___data_$OUT_READ[32] ?
		 wbQ_mod__deq___first___data_$OUT_READ[31:0] :
		 mod__dataQ__first___data_$OUT_READ } ;

  assign mod__regWrite__data_$IN_EN_WRITE =
	     wbQ_mod__deq___notEmpty___data_$OUT_READ &&
	     (wbQ_mod__deq___first___data_$OUT_READ[32] ||
	      mod__dataQ__notEmpty___data_$OUT_READ) ;

  assign mod__regWrite__en_$IN_EN_WRITE =
	     wbQ_mod__deq___notEmpty___data_$OUT_READ &&
	     (wbQ_mod__deq___first___data_$OUT_READ[32] ||
	      mod__dataQ__notEmpty___data_$OUT_READ) ;

  assign mod__wbIndex__data_$IN_WRITE =
	     wbQ_mod__deq___first___data_$OUT_READ[37:33] ;

  assign mod__wbIndex__data_$IN_EN_WRITE =
	     wbQ_mod__deq___notEmpty___data_$OUT_READ ;

  assign mod__wbIndex__en_$IN_EN_WRITE =
	     wbQ_mod__deq___notEmpty___data_$OUT_READ ;

  assign mod__wb___enq__data_$IN_WRITE = wb_enq_WRITE ;

  assign mod__wb___enq__data_$IN_EN_WRITE = wb_enq_EN_WRITE ;

  assign mod__wb___enq__en_$IN_EN_WRITE = wb_enq_EN_WRITE ;

  assign mod__wb___notFull___data_$IN_WRITE =
	     wbQ_mod__enq___notFull___data_$OUT_READ ;

  assign mod__wb___notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_head$IN_EN_WRITE = wbQ_mod__enq___enq__en_$OUT_READ ;

  assign wbQ_mod__deq___deq__data_$IN_EN_WRITE =
	     wbQ_mod__deq___notEmpty___data_$OUT_READ &&
	     (wbQ_mod__deq___first___data_$OUT_READ[32] ||
	      mod__dataQ__notEmpty___data_$OUT_READ) ;

  assign wbQ_mod__deq___first___data_$IN_WRITE =
	     wbQ_regs_mod__mod__read___resp___data_$OUT_READ ;

  assign wbQ_mod__deq___first___data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_mod__deq___notEmpty___data_$IN_WRITE = wbQ_numElems$OUT_READ ;

  assign wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_mod__enq___enq__data_$IN_WRITE = mod__wb___enq__data_$OUT_READ ;

  assign wbQ_mod__enq___enq__data_$IN_EN_WRITE =
	     WILL_FIRE_RL_c1_1 && mod__wb___enq__en_$OUT_READ ;

  assign wbQ_mod__enq___enq__en_$IN_EN_WRITE =
	     WILL_FIRE_RL_c1_1 && mod__wb___enq__en_$OUT_READ ;

  assign wbQ_mod__enq___notFull___data_$IN_WRITE =
	     !wbQ_numElems$OUT_READ || wbQ_mod__deq___deq__data_$OUT_READ ;

  assign wbQ_mod__enq___notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_numElems$IN_WRITE =
	     wbQ_numElems$OUT_READ +
	     _0_CONCAT_wbQ_mod__enq___enq__en_OUT_READ_MINU_ETC__q1[0] ;

  assign wbQ_numElems$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__mod__read___resp___data_$IN_WRITE =
	     wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ ;

  assign wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__mod__write___data_$IN_WRITE =
	     wbQ_mod__enq___enq__data_$OUT_READ ;

  assign wbQ_regs_mod__mod__write___data_$IN_EN_WRITE =
	     wbQ_mod__enq___enq__en_$OUT_READ ;

  assign wbQ_regs_mod__mod__write___en_$IN_EN_WRITE =
	     wbQ_mod__enq___enq__en_$OUT_READ ;

  assign wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE =
	     wbQ_regs_mod__rf_rf$READ_RESP_READ ;

  assign wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign wbQ_regs_mod__rf_mod__write___data_$IN_WRITE =
	     wbQ_regs_mod__mod__write___data_$OUT_READ ;

  assign wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE =
	     wbQ_regs_mod__mod__write___en_$OUT_READ ;

  assign wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE =
	     wbQ_regs_mod__mod__write___en_$OUT_READ ;

  assign wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE =
	     wbQ_regs_mod__rf_mod__write___data_$OUT_READ ;

  assign wbQ_regs_mod__rf_rf$WRITE_EN_WRITE =
	     wbQ_regs_mod__rf_mod__write___en_$OUT_READ ;

  assign wbQ_regs_mod__whichReg$IN_EN_WRITE = 1'd1 ;

  assign wbQ_tail$IN_EN_WRITE = wbQ_mod__deq___deq__data_$OUT_READ ;

  assign _0_CONCAT_wbQ_mod__enq___enq__en_OUT_READ_MINU_ETC__q1 =
	     { 1'd0, wbQ_mod__enq___enq__en_$OUT_READ } -
	     { 1'd0, wbQ_mod__deq___deq__data_$OUT_READ } ;

  assign dataQ_deq_READ_VALID = 1 && mod__dataQ__deq__data_$OUT_READ_VALID;

  assign mod__dataQ__deq__data_$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID && mod__dataQ__notEmpty___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID;

  assign mod__dataQ__first___data_$IN_EN_WRITE_VALID = 1;

  assign mod__dataQ__first___data_$IN_WRITE_VALID = 1 && dataQ_first_WRITE_VALID;

  assign mod__dataQ__notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign mod__dataQ__notEmpty___data_$IN_WRITE_VALID = 1 && dataQ_notEmpty_WRITE_VALID;

  assign mod__regWrite__data_$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID && mod__dataQ__notEmpty___data_$OUT_READ_VALID;

  assign mod__regWrite__data_$IN_WRITE_VALID = 1 && wbQ_mod__deq___first___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID && mod__dataQ__first___data_$OUT_READ_VALID;

  assign mod__regWrite__en_$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID && mod__dataQ__notEmpty___data_$OUT_READ_VALID;

  assign mod__wbIndex__data_$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID;

  assign mod__wbIndex__data_$IN_WRITE_VALID = 1 && wbQ_mod__deq___first___data_$OUT_READ_VALID;

  assign mod__wbIndex__en_$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID;

  assign mod__wb___enq__data_$IN_EN_WRITE_VALID = 1 && wb_enq_EN_WRITE_VALID;

  assign mod__wb___enq__data_$IN_WRITE_VALID = 1 && wb_enq_WRITE_VALID;

  assign mod__wb___enq__en_$IN_EN_WRITE_VALID = 1 && wb_enq_EN_WRITE_VALID;

  assign mod__wb___notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__wb___notFull___data_$IN_WRITE_VALID = 1 && wbQ_mod__enq___notFull___data_$OUT_READ_VALID;

  assign regWrite_EN_READ_VALID = 1 && mod__regWrite__en_$OUT_READ_VALID;

  assign regWrite_READ_VALID = 1 && mod__regWrite__data_$OUT_READ_VALID;

  assign wbIndex_EN_READ_VALID = 1 && mod__wbIndex__en_$OUT_READ_VALID;

  assign wbIndex_READ_VALID = 1 && mod__wbIndex__data_$OUT_READ_VALID;

  assign wbQ_head$IN_EN_WRITE_VALID = 1 && wbQ_mod__enq___enq__en_$OUT_READ_VALID;

  assign wbQ_mod__deq___deq__data_$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID && wbQ_mod__deq___first___data_$OUT_READ_VALID && mod__dataQ__notEmpty___data_$OUT_READ_VALID;

  assign wbQ_mod__deq___first___data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_mod__deq___first___data_$IN_WRITE_VALID = 1 && wbQ_regs_mod__mod__read___resp___data_$OUT_READ_VALID;

  assign wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_mod__deq___notEmpty___data_$IN_WRITE_VALID = 1 && wbQ_numElems$OUT_READ_VALID;

  assign wbQ_mod__enq___enq__data_$IN_EN_WRITE_VALID = 1 && mod__wb___enq__en_$OUT_READ_VALID && wbQ_mod__enq___notFull___data_$OUT_READ_VALID;

  assign wbQ_mod__enq___enq__data_$IN_WRITE_VALID = 1 && mod__wb___enq__data_$OUT_READ_VALID;

  assign wbQ_mod__enq___enq__en_$IN_EN_WRITE_VALID = 1 && mod__wb___enq__en_$OUT_READ_VALID && wbQ_mod__enq___notFull___data_$OUT_READ_VALID;

  assign wbQ_mod__enq___notFull___data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_mod__enq___notFull___data_$IN_WRITE_VALID = 1 && wbQ_numElems$OUT_READ_VALID && wbQ_mod__deq___deq__data_$OUT_READ_VALID;

  assign wbQ_numElems$IN_EN_WRITE_VALID = 1;

  assign wbQ_numElems$IN_WRITE_VALID = 1 && wbQ_numElems$OUT_READ_VALID && wbQ_mod__enq___enq__en_$OUT_READ_VALID && wbQ_mod__deq___deq__data_$OUT_READ_VALID;

  assign wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID = 1;

  assign wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_regs_mod__mod__read___resp___data_$IN_WRITE_VALID = 1 && wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;

  assign wbQ_regs_mod__mod__write___data_$IN_EN_WRITE_VALID = 1 && wbQ_mod__enq___enq__en_$OUT_READ_VALID;

  assign wbQ_regs_mod__mod__write___data_$IN_WRITE_VALID = 1 && wbQ_mod__enq___enq__data_$OUT_READ_VALID;

  assign wbQ_regs_mod__mod__write___en_$IN_EN_WRITE_VALID = 1 && wbQ_mod__enq___enq__en_$OUT_READ_VALID;

  assign wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID = 1;

  assign wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID = 1 && wbQ_regs_mod__rf_rf$READ_RESP_READ_VALID;

  assign wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID = 1 && wbQ_regs_mod__mod__write___en_$OUT_READ_VALID;

  assign wbQ_regs_mod__rf_mod__write___data_$IN_WRITE_VALID = 1 && wbQ_regs_mod__mod__write___data_$OUT_READ_VALID;

  assign wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID = 1 && wbQ_regs_mod__mod__write___en_$OUT_READ_VALID;

  assign wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE_VALID = 1 && wbQ_regs_mod__rf_mod__write___data_$OUT_READ_VALID;

  assign wbQ_regs_mod__rf_rf$WRITE_EN_WRITE_VALID = 1 && wbQ_regs_mod__rf_mod__write___en_$OUT_READ_VALID;

  assign wbQ_regs_mod__whichReg$IN_EN_WRITE_VALID = 1;

  assign wbQ_tail$IN_EN_WRITE_VALID = 1 && wbQ_mod__deq___deq__data_$OUT_READ_VALID;

  assign wb_notFull_READ_VALID = 1 && mod__wb___notFull___data_$OUT_READ_VALID;

  assign dataQ_first_WRITE_CONSUMED = 1 && mod__dataQ__first___data_$IN_WRITE_CONSUMED;

  assign dataQ_notEmpty_WRITE_CONSUMED = 1 && mod__dataQ__notEmpty___data_$IN_WRITE_CONSUMED;

  assign mod__dataQ__deq__data_$OUT_READ_CONSUMED = 1 && dataQ_deq_READ_CONSUMED;

  assign mod__dataQ__first___data_$OUT_READ_CONSUMED = 1 && mod__regWrite__data_$IN_WRITE_CONSUMED;

  assign mod__dataQ__notEmpty___data_$OUT_READ_CONSUMED = 1 && wbQ_mod__deq___deq__data_$IN_EN_WRITE_CONSUMED && mod__regWrite__en_$IN_EN_WRITE_CONSUMED && mod__regWrite__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__deq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__regWrite__data_$OUT_READ_CONSUMED = 1 && regWrite_READ_CONSUMED;

  assign mod__regWrite__en_$OUT_READ_CONSUMED = 1 && regWrite_EN_READ_CONSUMED;

  assign mod__wbIndex__data_$OUT_READ_CONSUMED = 1 && wbIndex_READ_CONSUMED;

  assign mod__wbIndex__en_$OUT_READ_CONSUMED = 1 && wbIndex_EN_READ_CONSUMED;

  assign mod__wb___enq__data_$OUT_READ_CONSUMED = 1 && wbQ_mod__enq___enq__data_$IN_WRITE_CONSUMED;

  assign mod__wb___enq__en_$OUT_READ_CONSUMED = 1 && wbQ_mod__enq___enq__en_$IN_EN_WRITE_CONSUMED && wbQ_mod__enq___enq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__wb___notFull___data_$OUT_READ_CONSUMED = 1 && wb_notFull_READ_CONSUMED;

  assign wbQ_mod__deq___deq__data_$OUT_READ_CONSUMED = 1 && wbQ_tail$IN_EN_WRITE_CONSUMED && wbQ_numElems$IN_WRITE_CONSUMED && wbQ_mod__enq___notFull___data_$IN_WRITE_CONSUMED;

  assign wbQ_mod__deq___first___data_$OUT_READ_CONSUMED = 1 && wbQ_mod__deq___deq__data_$IN_EN_WRITE_CONSUMED && mod__wbIndex__data_$IN_WRITE_CONSUMED && mod__regWrite__en_$IN_EN_WRITE_CONSUMED && mod__regWrite__data_$IN_WRITE_CONSUMED && mod__regWrite__data_$IN_WRITE_CONSUMED && mod__regWrite__data_$IN_WRITE_CONSUMED && mod__regWrite__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__deq__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__deq__data_$IN_EN_WRITE_CONSUMED;

  assign wbQ_mod__deq___notEmpty___data_$OUT_READ_CONSUMED = 1 && wbQ_mod__deq___deq__data_$IN_EN_WRITE_CONSUMED && mod__wbIndex__en_$IN_EN_WRITE_CONSUMED && mod__wbIndex__data_$IN_EN_WRITE_CONSUMED && mod__regWrite__en_$IN_EN_WRITE_CONSUMED && mod__regWrite__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__deq__data_$IN_EN_WRITE_CONSUMED;

  assign wbQ_mod__enq___enq__data_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__mod__write___data_$IN_WRITE_CONSUMED;

  assign wbQ_mod__enq___enq__en_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && wbQ_regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && wbQ_numElems$IN_WRITE_CONSUMED && wbQ_head$IN_EN_WRITE_CONSUMED;

  assign wbQ_mod__enq___notFull___data_$OUT_READ_CONSUMED = 1 && wbQ_mod__enq___enq__en_$IN_EN_WRITE_CONSUMED && wbQ_mod__enq___enq__data_$IN_EN_WRITE_CONSUMED && mod__wb___notFull___data_$IN_WRITE_CONSUMED;

  assign wbQ_numElems$OUT_READ_CONSUMED = 1 && wbQ_numElems$IN_WRITE_CONSUMED && wbQ_mod__enq___notFull___data_$IN_WRITE_CONSUMED && wbQ_mod__deq___notEmpty___data_$IN_WRITE_CONSUMED;

  assign wbQ_regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED = 1 && wbQ_mod__deq___first___data_$IN_WRITE_CONSUMED;

  assign wbQ_regs_mod__mod__write___data_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED;

  assign wbQ_regs_mod__mod__write___en_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED && wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED;

  assign wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED;

  assign wbQ_regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED;

  assign wbQ_regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED = 1 && wbQ_regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED;

  assign wbQ_regs_mod__rf_rf$READ_RESP_READ_CONSUMED = 1 && wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED;

  assign wb_enq_EN_WRITE_CONSUMED = 1 && mod__wb___enq__en_$IN_EN_WRITE_CONSUMED && mod__wb___enq__data_$IN_EN_WRITE_CONSUMED;

  assign wb_enq_WRITE_CONSUMED = 1 && mod__wb___enq__data_$IN_WRITE_CONSUMED;

  mkPulse mod__dataQ__deq__data_ (
    .IN_EN_WRITE(mod__dataQ__deq__data_$IN_EN_WRITE),
    .OUT_READ(mod__dataQ__deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__dataQ__deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataQ__deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__dataQ__deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataQ__deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__dataQ__first___data_ (
    .IN_WRITE(mod__dataQ__first___data_$IN_WRITE),
    .IN_EN_WRITE(mod__dataQ__first___data_$IN_EN_WRITE),
    .OUT_READ(mod__dataQ__first___data_$OUT_READ),
    .IN_WRITE_VALID(mod__dataQ__first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__dataQ__first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataQ__first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__dataQ__first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__dataQ__first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataQ__first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__dataQ__notEmpty___data_ (
    .IN_WRITE(mod__dataQ__notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(mod__dataQ__notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(mod__dataQ__notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(mod__dataQ__notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__dataQ__notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataQ__notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__dataQ__notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__dataQ__notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataQ__notEmpty___data_$OUT_READ_CONSUMED));

  mkWire#(32'd37) mod__regWrite__data_ (
    .IN_WRITE(mod__regWrite__data_$IN_WRITE),
    .IN_EN_WRITE(mod__regWrite__data_$IN_EN_WRITE),
    .OUT_READ(mod__regWrite__data_$OUT_READ),
    .IN_WRITE_VALID(mod__regWrite__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__regWrite__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regWrite__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__regWrite__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__regWrite__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regWrite__data_$OUT_READ_CONSUMED));

  mkPulse mod__regWrite__en_ (
    .IN_EN_WRITE(mod__regWrite__en_$IN_EN_WRITE),
    .OUT_READ(mod__regWrite__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__regWrite__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regWrite__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__regWrite__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regWrite__en_$OUT_READ_CONSUMED));

  mkWire#(32'd5) mod__wbIndex__data_ (
    .IN_WRITE(mod__wbIndex__data_$IN_WRITE),
    .IN_EN_WRITE(mod__wbIndex__data_$IN_EN_WRITE),
    .OUT_READ(mod__wbIndex__data_$OUT_READ),
    .IN_WRITE_VALID(mod__wbIndex__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__wbIndex__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__wbIndex__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__wbIndex__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__wbIndex__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__wbIndex__data_$OUT_READ_CONSUMED));

  mkPulse mod__wbIndex__en_ (
    .IN_EN_WRITE(mod__wbIndex__en_$IN_EN_WRITE),
    .OUT_READ(mod__wbIndex__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__wbIndex__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__wbIndex__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__wbIndex__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__wbIndex__en_$OUT_READ_CONSUMED));

  mkWire#(32'd38) mod__wb___enq__data_ (
    .IN_WRITE(mod__wb___enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__wb___enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__wb___enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__wb___enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__wb___enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__wb___enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__wb___enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__wb___enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__wb___enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__wb___enq__en_ (
    .IN_EN_WRITE(mod__wb___enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__wb___enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__wb___enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__wb___enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__wb___enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__wb___enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__wb___notFull___data_ (
    .IN_WRITE(mod__wb___notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__wb___notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__wb___notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__wb___notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__wb___notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__wb___notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__wb___notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__wb___notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__wb___notFull___data_$OUT_READ_CONSUMED));

  mkReg#(32'd1) wbQ_head (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(wbQ_head$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(wbQ_head$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_head$IN_EN_WRITE_CONSUMED));

  mkPulse wbQ_mod__deq___deq__data_ (
    .IN_EN_WRITE(wbQ_mod__deq___deq__data_$IN_EN_WRITE),
    .OUT_READ(wbQ_mod__deq___deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(wbQ_mod__deq___deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_mod__deq___deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_mod__deq___deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_mod__deq___deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd38) wbQ_mod__deq___first___data_ (
    .IN_WRITE(wbQ_mod__deq___first___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_mod__deq___first___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_mod__deq___first___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_mod__deq___first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_mod__deq___first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_mod__deq___first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_mod__deq___first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_mod__deq___first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_mod__deq___first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) wbQ_mod__deq___notEmpty___data_ (
    .IN_WRITE(wbQ_mod__deq___notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_mod__deq___notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_mod__deq___notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_mod__deq___notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_mod__deq___notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_mod__deq___notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_mod__deq___notEmpty___data_$OUT_READ_CONSUMED));

  mkWire#(32'd38) wbQ_mod__enq___enq__data_ (
    .IN_WRITE(wbQ_mod__enq___enq__data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_mod__enq___enq__data_$IN_EN_WRITE),
    .OUT_READ(wbQ_mod__enq___enq__data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_mod__enq___enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_mod__enq___enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_mod__enq___enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_mod__enq___enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_mod__enq___enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_mod__enq___enq__data_$OUT_READ_CONSUMED));

  mkPulse wbQ_mod__enq___enq__en_ (
    .IN_EN_WRITE(wbQ_mod__enq___enq__en_$IN_EN_WRITE),
    .OUT_READ(wbQ_mod__enq___enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(wbQ_mod__enq___enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_mod__enq___enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_mod__enq___enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_mod__enq___enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) wbQ_mod__enq___notFull___data_ (
    .IN_WRITE(wbQ_mod__enq___notFull___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_mod__enq___notFull___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_mod__enq___notFull___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_mod__enq___notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_mod__enq___notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_mod__enq___notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_mod__enq___notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_mod__enq___notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_mod__enq___notFull___data_$OUT_READ_CONSUMED));

  mkReg#(32'd1,  /*init*/ 1'd0) wbQ_numElems (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(wbQ_numElems$IN_WRITE),
    .IN_EN_WRITE(wbQ_numElems$IN_EN_WRITE),
    .OUT_READ(wbQ_numElems$OUT_READ),
    .IN_WRITE_VALID(wbQ_numElems$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_numElems$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_numElems$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_numElems$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_numElems$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_numElems$OUT_READ_CONSUMED));

  mkWire#(32'd1) wbQ_regs_mod__mod__read___req__data_ (
    .IN_EN_WRITE(wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED));

  mkPulse wbQ_regs_mod__mod__read___req__en_ (
    .IN_EN_WRITE(wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd38) wbQ_regs_mod__mod__read___resp___data_ (
    .IN_WRITE(wbQ_regs_mod__mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_regs_mod__mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_regs_mod__mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_regs_mod__mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd38) wbQ_regs_mod__mod__write___data_ (
    .IN_WRITE(wbQ_regs_mod__mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_regs_mod__mod__write___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_regs_mod__mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_regs_mod__mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_regs_mod__mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_regs_mod__mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_regs_mod__mod__write___data_$OUT_READ_CONSUMED));

  mkPulse wbQ_regs_mod__mod__write___en_ (
    .IN_EN_WRITE(wbQ_regs_mod__mod__write___en_$IN_EN_WRITE),
    .OUT_READ(wbQ_regs_mod__mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_regs_mod__mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_regs_mod__mod__write___en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) wbQ_regs_mod__rf_mod__read___req__data_ (
    .IN_EN_WRITE(wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_CONSUMED));

  mkPulse wbQ_regs_mod__rf_mod__read___req__en_ (
    .IN_EN_WRITE(wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd38) wbQ_regs_mod__rf_mod__read___resp___data_ (
    .IN_WRITE(wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd38) wbQ_regs_mod__rf_mod__write___data_ (
    .IN_WRITE(wbQ_regs_mod__rf_mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE),
    .OUT_READ(wbQ_regs_mod__rf_mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(wbQ_regs_mod__rf_mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_regs_mod__rf_mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED));

  mkPulse wbQ_regs_mod__rf_mod__write___en_ (
    .IN_EN_WRITE(wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE),
    .OUT_READ(wbQ_regs_mod__rf_mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(wbQ_regs_mod__rf_mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(wbQ_regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED));

  mkRegFileLoad_#(32'd38,
		    /*n*/ 32'd1,
		    /*size*/ 32'd1,
		    /*file*/ "",
		    /*mode*/ 32'd0) wbQ_regs_mod__rf_rf (
    .CLK(CLK),
    .RST_N(RST_N),
    .WRITE_DATA_WRITE(wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE),
    .WRITE_EN_WRITE(wbQ_regs_mod__rf_rf$WRITE_EN_WRITE),
    .READ_RESP_READ(wbQ_regs_mod__rf_rf$READ_RESP_READ),
    .WRITE_DATA_WRITE_VALID(wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE_VALID),
    .WRITE_EN_WRITE_VALID(wbQ_regs_mod__rf_rf$WRITE_EN_WRITE_VALID),
    .READ_RESP_READ_VALID(wbQ_regs_mod__rf_rf$READ_RESP_READ_VALID),
    .WRITE_DATA_WRITE_CONSUMED(wbQ_regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED),
    .WRITE_EN_WRITE_CONSUMED(wbQ_regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED),
    .READ_RESP_READ_CONSUMED(wbQ_regs_mod__rf_rf$READ_RESP_READ_CONSUMED));

  mkReg#(32'd1) wbQ_regs_mod__whichReg (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(wbQ_regs_mod__whichReg$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(wbQ_regs_mod__whichReg$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_regs_mod__whichReg$IN_EN_WRITE_CONSUMED));

  mkReg#(32'd1) wbQ_tail (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(wbQ_tail$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(wbQ_tail$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(wbQ_tail$IN_EN_WRITE_CONSUMED));
endmodule
