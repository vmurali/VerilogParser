`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkDataReqQ(
  CLK,
  RST_N,
  enq_notFull_READ,
  enq_enq_WRITE,
  enq_enq_EN_WRITE,
  deq_notEmpty_READ,
  deq_first_READ,
  deq_deq_WRITE,
  enq_notFull_READ_VALID,
  enq_enq_WRITE_VALID,
  enq_enq_EN_WRITE_VALID,
  deq_notEmpty_READ_VALID,
  deq_first_READ_VALID,
  deq_deq_WRITE_VALID,
  enq_notFull_READ_CONSUMED,
  enq_enq_WRITE_CONSUMED,
  enq_enq_EN_WRITE_CONSUMED,
  deq_notEmpty_READ_CONSUMED,
  deq_first_READ_CONSUMED,
  deq_deq_WRITE_CONSUMED);

  input  enq_enq_WRITE_VALID;
  input  enq_enq_EN_WRITE_VALID;
  input  deq_deq_WRITE_VALID;
  input  enq_notFull_READ_CONSUMED;
  input  deq_notEmpty_READ_CONSUMED;
  input  deq_first_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input [64 : 0] enq_enq_WRITE;
  input  enq_enq_EN_WRITE;
  input  deq_deq_WRITE;
  output  enq_enq_WRITE_CONSUMED;
  output  enq_enq_EN_WRITE_CONSUMED;
  output  deq_deq_WRITE_CONSUMED;
  output  enq_notFull_READ_VALID;
  output  deq_notEmpty_READ_VALID;
  output  deq_first_READ_VALID;
  output  enq_notFull_READ;
  output  deq_notEmpty_READ;
  output [64 : 0] deq_first_READ;
  wire [64 : 0] deq_first_READ;
  wire  deq_notEmpty_READ, enq_notFull_READ;
  wire  mod__head$IN_EN_WRITE;
  wire  mod__mod__deq___deq__data_$IN_EN_WRITE, mod__mod__deq___deq__data_$OUT_READ;
  wire [64 : 0] mod__mod__deq___first___data_$IN_WRITE, mod__mod__deq___first___data_$OUT_READ;
  wire  mod__mod__deq___first___data_$IN_EN_WRITE;
  wire  mod__mod__deq___notEmpty___data_$IN_EN_WRITE, mod__mod__deq___notEmpty___data_$IN_WRITE, mod__mod__deq___notEmpty___data_$OUT_READ;
  wire [64 : 0] mod__mod__enq___enq__data_$IN_WRITE, mod__mod__enq___enq__data_$OUT_READ;
  wire  mod__mod__enq___enq__data_$IN_EN_WRITE;
  wire  mod__mod__enq___enq__en_$IN_EN_WRITE, mod__mod__enq___enq__en_$OUT_READ;
  wire  mod__mod__enq___notFull___data_$IN_EN_WRITE, mod__mod__enq___notFull___data_$IN_WRITE, mod__mod__enq___notFull___data_$OUT_READ;
  wire  mod__numElems$IN_EN_WRITE, mod__numElems$IN_WRITE, mod__numElems$OUT_READ;
  wire  mod__regs_mod__mod__read___req__data_$IN_EN_WRITE;
  wire  mod__regs_mod__mod__read___req__en_$IN_EN_WRITE;
  wire [64 : 0] mod__regs_mod__mod__read___resp___data_$IN_WRITE, mod__regs_mod__mod__read___resp___data_$OUT_READ;
  wire  mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE;
  wire [64 : 0] mod__regs_mod__mod__write___data_$IN_WRITE, mod__regs_mod__mod__write___data_$OUT_READ;
  wire  mod__regs_mod__mod__write___data_$IN_EN_WRITE;
  wire  mod__regs_mod__mod__write___en_$IN_EN_WRITE, mod__regs_mod__mod__write___en_$OUT_READ;
  wire  mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE;
  wire  mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE;
  wire [64 : 0] mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE, mod__regs_mod__rf_mod__read___resp___data_$OUT_READ;
  wire  mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE;
  wire [64 : 0] mod__regs_mod__rf_mod__write___data_$IN_WRITE, mod__regs_mod__rf_mod__write___data_$OUT_READ;
  wire  mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE;
  wire  mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE, mod__regs_mod__rf_mod__write___en_$OUT_READ;
  wire [64 : 0] mod__regs_mod__rf_rf$READ_RESP_READ, mod__regs_mod__rf_rf$WRITE_DATA_WRITE;
  wire  mod__regs_mod__rf_rf$WRITE_EN_WRITE;
  wire  mod__regs_mod__whichReg$IN_EN_WRITE;
  wire  mod__tail$IN_EN_WRITE;
  wire [1 : 0] _0_CONCAT_mod__mod__enq___enq__en_OUT_READ_MIN_ETC__q1;
  wire  deq_deq_WRITE_VALID;
  wire  deq_first_READ_VALID;
  wire  deq_notEmpty_READ_VALID;
  wire  enq_enq_EN_WRITE_VALID;
  wire  enq_enq_WRITE_VALID;
  wire  enq_notFull_READ_VALID;
  wire  mod__head$IN_EN_WRITE_VALID;
  wire  mod__mod__deq___deq__data_$IN_EN_WRITE_VALID;
  wire  mod__mod__deq___deq__data_$OUT_READ_VALID;
  wire  mod__mod__deq___first___data_$IN_EN_WRITE_VALID;
  wire  mod__mod__deq___first___data_$IN_WRITE_VALID;
  wire  mod__mod__deq___first___data_$OUT_READ_VALID;
  wire  mod__mod__deq___notEmpty___data_$IN_EN_WRITE_VALID;
  wire  mod__mod__deq___notEmpty___data_$IN_WRITE_VALID;
  wire  mod__mod__deq___notEmpty___data_$OUT_READ_VALID;
  wire  mod__mod__enq___enq__data_$IN_EN_WRITE_VALID;
  wire  mod__mod__enq___enq__data_$IN_WRITE_VALID;
  wire  mod__mod__enq___enq__data_$OUT_READ_VALID;
  wire  mod__mod__enq___enq__en_$IN_EN_WRITE_VALID;
  wire  mod__mod__enq___enq__en_$OUT_READ_VALID;
  wire  mod__mod__enq___notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__mod__enq___notFull___data_$IN_WRITE_VALID;
  wire  mod__mod__enq___notFull___data_$OUT_READ_VALID;
  wire  mod__numElems$IN_EN_WRITE_VALID;
  wire  mod__numElems$IN_WRITE_VALID;
  wire  mod__numElems$OUT_READ_VALID;
  wire  mod__regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__mod__read___resp___data_$IN_WRITE_VALID;
  wire  mod__regs_mod__mod__read___resp___data_$OUT_READ_VALID;
  wire  mod__regs_mod__mod__write___data_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__mod__write___data_$IN_WRITE_VALID;
  wire  mod__regs_mod__mod__write___data_$OUT_READ_VALID;
  wire  mod__regs_mod__mod__write___en_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__mod__write___en_$OUT_READ_VALID;
  wire  mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;
  wire  mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__write___data_$IN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__write___data_$OUT_READ_VALID;
  wire  mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID;
  wire  mod__regs_mod__rf_mod__write___en_$OUT_READ_VALID;
  wire  mod__regs_mod__rf_rf$READ_RESP_READ_VALID;
  wire  mod__regs_mod__rf_rf$WRITE_DATA_WRITE_VALID;
  wire  mod__regs_mod__rf_rf$WRITE_EN_WRITE_VALID;
  wire  mod__regs_mod__whichReg$IN_EN_WRITE_VALID;
  wire  mod__tail$IN_EN_WRITE_VALID;
  wire  deq_deq_WRITE_CONSUMED;
  wire  deq_first_READ_CONSUMED;
  wire  deq_notEmpty_READ_CONSUMED;
  wire  enq_enq_EN_WRITE_CONSUMED;
  wire  enq_enq_WRITE_CONSUMED;
  wire  enq_notFull_READ_CONSUMED;
  wire  mod__head$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__deq___deq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__deq___deq__data_$OUT_READ_CONSUMED;
  wire  mod__mod__deq___first___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__deq___first___data_$IN_WRITE_CONSUMED;
  wire  mod__mod__deq___first___data_$OUT_READ_CONSUMED;
  wire  mod__mod__deq___notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__deq___notEmpty___data_$IN_WRITE_CONSUMED;
  wire  mod__mod__deq___notEmpty___data_$OUT_READ_CONSUMED;
  wire  mod__mod__enq___enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__enq___enq__data_$IN_WRITE_CONSUMED;
  wire  mod__mod__enq___enq__data_$OUT_READ_CONSUMED;
  wire  mod__mod__enq___enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__enq___enq__en_$OUT_READ_CONSUMED;
  wire  mod__mod__enq___notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mod__enq___notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__mod__enq___notFull___data_$OUT_READ_CONSUMED;
  wire  mod__numElems$IN_EN_WRITE_CONSUMED;
  wire  mod__numElems$IN_WRITE_CONSUMED;
  wire  mod__numElems$OUT_READ_CONSUMED;
  wire  mod__regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  mod__regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__write___data_$IN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__write___data_$OUT_READ_CONSUMED;
  wire  mod__regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__mod__write___en_$OUT_READ_CONSUMED;
  wire  mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED;
  wire  mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED;
  wire  mod__regs_mod__rf_rf$READ_RESP_READ_CONSUMED;
  wire  mod__regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED;
  wire  mod__regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED;
  wire  mod__regs_mod__whichReg$IN_EN_WRITE_CONSUMED;
  wire  mod__tail$IN_EN_WRITE_CONSUMED;

  assign enq_notFull_READ = mod__mod__enq___notFull___data_$OUT_READ ;

  assign deq_notEmpty_READ = mod__mod__deq___notEmpty___data_$OUT_READ ;

  assign deq_first_READ = mod__mod__deq___first___data_$OUT_READ ;

  assign mod__head$IN_EN_WRITE = mod__mod__enq___enq__en_$OUT_READ ;

  assign mod__mod__deq___deq__data_$IN_EN_WRITE = deq_deq_WRITE ;

  assign mod__mod__deq___first___data_$IN_WRITE =
	     mod__regs_mod__mod__read___resp___data_$OUT_READ ;

  assign mod__mod__deq___first___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mod__deq___notEmpty___data_$IN_WRITE = mod__numElems$OUT_READ ;

  assign mod__mod__deq___notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mod__enq___enq__data_$IN_WRITE = enq_enq_WRITE ;

  assign mod__mod__enq___enq__data_$IN_EN_WRITE = enq_enq_EN_WRITE ;

  assign mod__mod__enq___enq__en_$IN_EN_WRITE = enq_enq_EN_WRITE ;

  assign mod__mod__enq___notFull___data_$IN_WRITE =
	     !mod__numElems$OUT_READ || mod__mod__deq___deq__data_$OUT_READ ;

  assign mod__mod__enq___notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__numElems$IN_WRITE =
	     mod__numElems$OUT_READ +
	     _0_CONCAT_mod__mod__enq___enq__en_OUT_READ_MIN_ETC__q1[0] ;

  assign mod__numElems$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__mod__read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__mod__read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__mod__read___resp___data_$IN_WRITE =
	     mod__regs_mod__rf_mod__read___resp___data_$OUT_READ ;

  assign mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__mod__write___data_$IN_WRITE =
	     mod__mod__enq___enq__data_$OUT_READ ;

  assign mod__regs_mod__mod__write___data_$IN_EN_WRITE =
	     mod__mod__enq___enq__en_$OUT_READ ;

  assign mod__regs_mod__mod__write___en_$IN_EN_WRITE =
	     mod__mod__enq___enq__en_$OUT_READ ;

  assign mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE =
	     mod__regs_mod__rf_rf$READ_RESP_READ ;

  assign mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__regs_mod__rf_mod__write___data_$IN_WRITE =
	     mod__regs_mod__mod__write___data_$OUT_READ ;

  assign mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE =
	     mod__regs_mod__mod__write___en_$OUT_READ ;

  assign mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE =
	     mod__regs_mod__mod__write___en_$OUT_READ ;

  assign mod__regs_mod__rf_rf$WRITE_DATA_WRITE =
	     mod__regs_mod__rf_mod__write___data_$OUT_READ ;

  assign mod__regs_mod__rf_rf$WRITE_EN_WRITE =
	     mod__regs_mod__rf_mod__write___en_$OUT_READ ;

  assign mod__regs_mod__whichReg$IN_EN_WRITE = 1'd1 ;

  assign mod__tail$IN_EN_WRITE = mod__mod__deq___deq__data_$OUT_READ ;

  assign _0_CONCAT_mod__mod__enq___enq__en_OUT_READ_MIN_ETC__q1 =
	     { 1'd0, mod__mod__enq___enq__en_$OUT_READ } -
	     { 1'd0, mod__mod__deq___deq__data_$OUT_READ } ;

  assign deq_first_READ_VALID = 1 && mod__mod__deq___first___data_$OUT_READ_VALID;

  assign deq_notEmpty_READ_VALID = 1 && mod__mod__deq___notEmpty___data_$OUT_READ_VALID;

  assign enq_notFull_READ_VALID = 1 && mod__mod__enq___notFull___data_$OUT_READ_VALID;

  assign mod__head$IN_EN_WRITE_VALID = 1 && mod__mod__enq___enq__en_$OUT_READ_VALID;

  assign mod__mod__deq___deq__data_$IN_EN_WRITE_VALID = 1 && deq_deq_WRITE_VALID;

  assign mod__mod__deq___first___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mod__deq___first___data_$IN_WRITE_VALID = 1 && mod__regs_mod__mod__read___resp___data_$OUT_READ_VALID;

  assign mod__mod__deq___notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mod__deq___notEmpty___data_$IN_WRITE_VALID = 1 && mod__numElems$OUT_READ_VALID;

  assign mod__mod__enq___enq__data_$IN_EN_WRITE_VALID = 1 && enq_enq_EN_WRITE_VALID;

  assign mod__mod__enq___enq__data_$IN_WRITE_VALID = 1 && enq_enq_WRITE_VALID;

  assign mod__mod__enq___enq__en_$IN_EN_WRITE_VALID = 1 && enq_enq_EN_WRITE_VALID;

  assign mod__mod__enq___notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mod__enq___notFull___data_$IN_WRITE_VALID = 1 && mod__numElems$OUT_READ_VALID && mod__mod__deq___deq__data_$OUT_READ_VALID;

  assign mod__numElems$IN_EN_WRITE_VALID = 1;

  assign mod__numElems$IN_WRITE_VALID = 1 && mod__numElems$OUT_READ_VALID && mod__mod__enq___enq__en_$OUT_READ_VALID && mod__mod__deq___deq__data_$OUT_READ_VALID;

  assign mod__regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID = 1;

  assign mod__regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID = 1;

  assign mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign mod__regs_mod__mod__read___resp___data_$IN_WRITE_VALID = 1 && mod__regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;

  assign mod__regs_mod__mod__write___data_$IN_EN_WRITE_VALID = 1 && mod__mod__enq___enq__en_$OUT_READ_VALID;

  assign mod__regs_mod__mod__write___data_$IN_WRITE_VALID = 1 && mod__mod__enq___enq__data_$OUT_READ_VALID;

  assign mod__regs_mod__mod__write___en_$IN_EN_WRITE_VALID = 1 && mod__mod__enq___enq__en_$OUT_READ_VALID;

  assign mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID = 1;

  assign mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID = 1;

  assign mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID = 1 && mod__regs_mod__rf_rf$READ_RESP_READ_VALID;

  assign mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID = 1 && mod__regs_mod__mod__write___en_$OUT_READ_VALID;

  assign mod__regs_mod__rf_mod__write___data_$IN_WRITE_VALID = 1 && mod__regs_mod__mod__write___data_$OUT_READ_VALID;

  assign mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID = 1 && mod__regs_mod__mod__write___en_$OUT_READ_VALID;

  assign mod__regs_mod__rf_rf$WRITE_DATA_WRITE_VALID = 1 && mod__regs_mod__rf_mod__write___data_$OUT_READ_VALID;

  assign mod__regs_mod__rf_rf$WRITE_EN_WRITE_VALID = 1 && mod__regs_mod__rf_mod__write___en_$OUT_READ_VALID;

  assign mod__regs_mod__whichReg$IN_EN_WRITE_VALID = 1;

  assign mod__tail$IN_EN_WRITE_VALID = 1 && mod__mod__deq___deq__data_$OUT_READ_VALID;

  assign deq_deq_WRITE_CONSUMED = 1 && mod__mod__deq___deq__data_$IN_EN_WRITE_CONSUMED;

  assign enq_enq_EN_WRITE_CONSUMED = 1 && mod__mod__enq___enq__en_$IN_EN_WRITE_CONSUMED && mod__mod__enq___enq__data_$IN_EN_WRITE_CONSUMED;

  assign enq_enq_WRITE_CONSUMED = 1 && mod__mod__enq___enq__data_$IN_WRITE_CONSUMED;

  assign mod__mod__deq___deq__data_$OUT_READ_CONSUMED = 1 && mod__tail$IN_EN_WRITE_CONSUMED && mod__numElems$IN_WRITE_CONSUMED && mod__mod__enq___notFull___data_$IN_WRITE_CONSUMED;

  assign mod__mod__deq___first___data_$OUT_READ_CONSUMED = 1 && deq_first_READ_CONSUMED;

  assign mod__mod__deq___notEmpty___data_$OUT_READ_CONSUMED = 1 && deq_notEmpty_READ_CONSUMED;

  assign mod__mod__enq___enq__data_$OUT_READ_CONSUMED = 1 && mod__regs_mod__mod__write___data_$IN_WRITE_CONSUMED;

  assign mod__mod__enq___enq__en_$OUT_READ_CONSUMED = 1 && mod__regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && mod__regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && mod__numElems$IN_WRITE_CONSUMED && mod__head$IN_EN_WRITE_CONSUMED;

  assign mod__mod__enq___notFull___data_$OUT_READ_CONSUMED = 1 && enq_notFull_READ_CONSUMED;

  assign mod__numElems$OUT_READ_CONSUMED = 1 && mod__numElems$IN_WRITE_CONSUMED && mod__mod__enq___notFull___data_$IN_WRITE_CONSUMED && mod__mod__deq___notEmpty___data_$IN_WRITE_CONSUMED;

  assign mod__regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED = 1 && mod__mod__deq___first___data_$IN_WRITE_CONSUMED;

  assign mod__regs_mod__mod__write___data_$OUT_READ_CONSUMED = 1 && mod__regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED;

  assign mod__regs_mod__mod__write___en_$OUT_READ_CONSUMED = 1 && mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED && mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED;

  assign mod__regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED = 1 && mod__regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED;

  assign mod__regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED = 1 && mod__regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED;

  assign mod__regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED = 1 && mod__regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED;

  assign mod__regs_mod__rf_rf$READ_RESP_READ_CONSUMED = 1 && mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED;

  mkReg#(32'd1) mod__head (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(mod__head$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(mod__head$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(mod__head$IN_EN_WRITE_CONSUMED));

  mkPulse mod__mod__deq___deq__data_ (
    .IN_EN_WRITE(mod__mod__deq___deq__data_$IN_EN_WRITE),
    .OUT_READ(mod__mod__deq___deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__mod__deq___deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mod__deq___deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__mod__deq___deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mod__deq___deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd65) mod__mod__deq___first___data_ (
    .IN_WRITE(mod__mod__deq___first___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mod__deq___first___data_$IN_EN_WRITE),
    .OUT_READ(mod__mod__deq___first___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mod__deq___first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mod__deq___first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mod__deq___first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mod__deq___first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mod__deq___first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mod__deq___first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__mod__deq___notEmpty___data_ (
    .IN_WRITE(mod__mod__deq___notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mod__deq___notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(mod__mod__deq___notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mod__deq___notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mod__deq___notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mod__deq___notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mod__deq___notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mod__deq___notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mod__deq___notEmpty___data_$OUT_READ_CONSUMED));

  mkWire#(32'd65) mod__mod__enq___enq__data_ (
    .IN_WRITE(mod__mod__enq___enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__mod__enq___enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__mod__enq___enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__mod__enq___enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mod__enq___enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mod__enq___enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mod__enq___enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mod__enq___enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mod__enq___enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__mod__enq___enq__en_ (
    .IN_EN_WRITE(mod__mod__enq___enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__mod__enq___enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__mod__enq___enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mod__enq___enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__mod__enq___enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mod__enq___enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__mod__enq___notFull___data_ (
    .IN_WRITE(mod__mod__enq___notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mod__enq___notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__mod__enq___notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mod__enq___notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mod__enq___notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mod__enq___notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mod__enq___notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mod__enq___notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mod__enq___notFull___data_$OUT_READ_CONSUMED));

  mkReg#(32'd1,  /*init*/ 1'd0) mod__numElems (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(mod__numElems$IN_WRITE),
    .IN_EN_WRITE(mod__numElems$IN_EN_WRITE),
    .OUT_READ(mod__numElems$OUT_READ),
    .IN_WRITE_VALID(mod__numElems$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__numElems$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__numElems$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__numElems$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__numElems$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__numElems$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__regs_mod__mod__read___req__data_ (
    .IN_EN_WRITE(mod__regs_mod__mod__read___req__data_$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(mod__regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED));

  mkPulse mod__regs_mod__mod__read___req__en_ (
    .IN_EN_WRITE(mod__regs_mod__mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(mod__regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd65) mod__regs_mod__mod__read___resp___data_ (
    .IN_WRITE(mod__regs_mod__mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(mod__regs_mod__mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(mod__regs_mod__mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regs_mod__mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd65) mod__regs_mod__mod__write___data_ (
    .IN_WRITE(mod__regs_mod__mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(mod__regs_mod__mod__write___data_$IN_EN_WRITE),
    .OUT_READ(mod__regs_mod__mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(mod__regs_mod__mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__regs_mod__mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regs_mod__mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__regs_mod__mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regs_mod__mod__write___data_$OUT_READ_CONSUMED));

  mkPulse mod__regs_mod__mod__write___en_ (
    .IN_EN_WRITE(mod__regs_mod__mod__write___en_$IN_EN_WRITE),
    .OUT_READ(mod__regs_mod__mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__regs_mod__mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regs_mod__mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regs_mod__mod__write___en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__regs_mod__rf_mod__read___req__data_ (
    .IN_EN_WRITE(mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_CONSUMED));

  mkPulse mod__regs_mod__rf_mod__read___req__en_ (
    .IN_EN_WRITE(mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd65) mod__regs_mod__rf_mod__read___resp___data_ (
    .IN_WRITE(mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(mod__regs_mod__rf_mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd65) mod__regs_mod__rf_mod__write___data_ (
    .IN_WRITE(mod__regs_mod__rf_mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE),
    .OUT_READ(mod__regs_mod__rf_mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(mod__regs_mod__rf_mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regs_mod__rf_mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED));

  mkPulse mod__regs_mod__rf_mod__write___en_ (
    .IN_EN_WRITE(mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE),
    .OUT_READ(mod__regs_mod__rf_mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__regs_mod__rf_mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED));

  mkRegFileLoad_#(32'd65,
		    /*n*/ 32'd1,
		    /*size*/ 32'd1,
		    /*file*/ "",
		    /*mode*/ 32'd0) mod__regs_mod__rf_rf (
    .CLK(CLK),
    .RST_N(RST_N),
    .WRITE_DATA_WRITE(mod__regs_mod__rf_rf$WRITE_DATA_WRITE),
    .WRITE_EN_WRITE(mod__regs_mod__rf_rf$WRITE_EN_WRITE),
    .READ_RESP_READ(mod__regs_mod__rf_rf$READ_RESP_READ),
    .WRITE_DATA_WRITE_VALID(mod__regs_mod__rf_rf$WRITE_DATA_WRITE_VALID),
    .WRITE_EN_WRITE_VALID(mod__regs_mod__rf_rf$WRITE_EN_WRITE_VALID),
    .READ_RESP_READ_VALID(mod__regs_mod__rf_rf$READ_RESP_READ_VALID),
    .WRITE_DATA_WRITE_CONSUMED(mod__regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED),
    .WRITE_EN_WRITE_CONSUMED(mod__regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED),
    .READ_RESP_READ_CONSUMED(mod__regs_mod__rf_rf$READ_RESP_READ_CONSUMED));

  mkReg#(32'd1) mod__regs_mod__whichReg (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(mod__regs_mod__whichReg$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(mod__regs_mod__whichReg$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(mod__regs_mod__whichReg$IN_EN_WRITE_CONSUMED));

  mkReg#(32'd1) mod__tail (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(mod__tail$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(mod__tail$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(mod__tail$IN_EN_WRITE_CONSUMED));
endmodule
