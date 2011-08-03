`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkMemory(
  CLK,
  RST_N,
  instReqQ_notEmpty_WRITE,
  instReqQ_first_WRITE,
  instReqQ_deq_READ,
  instQ_notFull_WRITE,
  instQ_enq_READ,
  instQ_enq_EN_READ,
  dataReqQ_notEmpty_WRITE,
  dataReqQ_first_WRITE,
  dataReqQ_deq_READ,
  dataQ_notFull_WRITE,
  dataQ_enq_READ,
  dataQ_enq_EN_READ,
  instReqQ_notEmpty_WRITE_VALID,
  instReqQ_first_WRITE_VALID,
  instReqQ_deq_READ_VALID,
  instQ_notFull_WRITE_VALID,
  instQ_enq_READ_VALID,
  instQ_enq_EN_READ_VALID,
  dataReqQ_notEmpty_WRITE_VALID,
  dataReqQ_first_WRITE_VALID,
  dataReqQ_deq_READ_VALID,
  dataQ_notFull_WRITE_VALID,
  dataQ_enq_READ_VALID,
  dataQ_enq_EN_READ_VALID,
  instReqQ_notEmpty_WRITE_CONSUMED,
  instReqQ_first_WRITE_CONSUMED,
  instReqQ_deq_READ_CONSUMED,
  instQ_notFull_WRITE_CONSUMED,
  instQ_enq_READ_CONSUMED,
  instQ_enq_EN_READ_CONSUMED,
  dataReqQ_notEmpty_WRITE_CONSUMED,
  dataReqQ_first_WRITE_CONSUMED,
  dataReqQ_deq_READ_CONSUMED,
  dataQ_notFull_WRITE_CONSUMED,
  dataQ_enq_READ_CONSUMED,
  dataQ_enq_EN_READ_CONSUMED);

  input  instReqQ_notEmpty_WRITE_VALID;
  input  instReqQ_first_WRITE_VALID;
  input  instQ_notFull_WRITE_VALID;
  input  dataReqQ_notEmpty_WRITE_VALID;
  input  dataReqQ_first_WRITE_VALID;
  input  dataQ_notFull_WRITE_VALID;
  input  instReqQ_deq_READ_CONSUMED;
  input  instQ_enq_READ_CONSUMED;
  input  instQ_enq_EN_READ_CONSUMED;
  input  dataReqQ_deq_READ_CONSUMED;
  input  dataQ_enq_READ_CONSUMED;
  input  dataQ_enq_EN_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input  instReqQ_notEmpty_WRITE;
  input [31 : 0] instReqQ_first_WRITE;
  input  instQ_notFull_WRITE;
  input  dataReqQ_notEmpty_WRITE;
  input [64 : 0] dataReqQ_first_WRITE;
  input  dataQ_notFull_WRITE;
  output  instReqQ_notEmpty_WRITE_CONSUMED;
  output  instReqQ_first_WRITE_CONSUMED;
  output  instQ_notFull_WRITE_CONSUMED;
  output  dataReqQ_notEmpty_WRITE_CONSUMED;
  output  dataReqQ_first_WRITE_CONSUMED;
  output  dataQ_notFull_WRITE_CONSUMED;
  output  instReqQ_deq_READ_VALID;
  output  instQ_enq_READ_VALID;
  output  instQ_enq_EN_READ_VALID;
  output  dataReqQ_deq_READ_VALID;
  output  dataQ_enq_READ_VALID;
  output  dataQ_enq_EN_READ_VALID;
  output  instReqQ_deq_READ;
  output [31 : 0] instQ_enq_READ;
  output  instQ_enq_EN_READ;
  output  dataReqQ_deq_READ;
  output [31 : 0] dataQ_enq_READ;
  output  dataQ_enq_EN_READ;
  wire [31 : 0] dataQ_enq_READ, instQ_enq_READ;
  wire  dataQ_enq_EN_READ, dataReqQ_deq_READ, instQ_enq_EN_READ, instReqQ_deq_READ;
  wire [31 : 0] mod__dataQ__enq__data_$IN_WRITE, mod__dataQ__enq__data_$OUT_READ;
  wire  mod__dataQ__enq__data_$IN_EN_WRITE;
  wire  mod__dataQ__enq__en_$IN_EN_WRITE, mod__dataQ__enq__en_$OUT_READ;
  wire  mod__dataQ__notFull___data_$IN_EN_WRITE, mod__dataQ__notFull___data_$IN_WRITE, mod__dataQ__notFull___data_$OUT_READ;
  wire  mod__dataReqQ__deq__data_$IN_EN_WRITE, mod__dataReqQ__deq__data_$OUT_READ;
  wire [64 : 0] mod__dataReqQ__first___data_$IN_WRITE, mod__dataReqQ__first___data_$OUT_READ;
  wire  mod__dataReqQ__first___data_$IN_EN_WRITE;
  wire  mod__dataReqQ__notEmpty___data_$IN_EN_WRITE, mod__dataReqQ__notEmpty___data_$IN_WRITE, mod__dataReqQ__notEmpty___data_$OUT_READ;
  wire [31 : 0] mod__instQ__enq__data_$IN_WRITE, mod__instQ__enq__data_$OUT_READ;
  wire  mod__instQ__enq__data_$IN_EN_WRITE;
  wire  mod__instQ__enq__en_$IN_EN_WRITE, mod__instQ__enq__en_$OUT_READ;
  wire  mod__instQ__notFull___data_$IN_EN_WRITE, mod__instQ__notFull___data_$IN_WRITE, mod__instQ__notFull___data_$OUT_READ;
  wire  mod__instReqQ__deq__data_$IN_EN_WRITE, mod__instReqQ__deq__data_$OUT_READ;
  wire [31 : 0] mod__instReqQ__first___data_$IN_WRITE, mod__instReqQ__first___data_$OUT_READ;
  wire  mod__instReqQ__first___data_$IN_EN_WRITE;
  wire  mod__instReqQ__notEmpty___data_$IN_EN_WRITE, mod__instReqQ__notEmpty___data_$IN_WRITE, mod__instReqQ__notEmpty___data_$OUT_READ;
  wire [19 : 0] regs_mod__mod__read___req__1_data_$IN_WRITE, regs_mod__mod__read___req__1_data_$OUT_READ;
  wire  regs_mod__mod__read___req__1_data_$IN_EN_WRITE;
  wire  regs_mod__mod__read___req__1_en_$IN_EN_WRITE;
  wire [19 : 0] regs_mod__mod__read___req__data_$IN_WRITE, regs_mod__mod__read___req__data_$OUT_READ;
  wire  regs_mod__mod__read___req__data_$IN_EN_WRITE;
  wire  regs_mod__mod__read___req__en_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__mod__read___resp___1_data_$IN_WRITE, regs_mod__mod__read___resp___1_data_$OUT_READ;
  wire  regs_mod__mod__read___resp___1_data_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__mod__read___resp___data_$IN_WRITE, regs_mod__mod__read___resp___data_$OUT_READ;
  wire  regs_mod__mod__read___resp___data_$IN_EN_WRITE;
  wire [51 : 0] regs_mod__mod__write___data_$IN_WRITE, regs_mod__mod__write___data_$OUT_READ;
  wire  regs_mod__mod__write___data_$IN_EN_WRITE;
  wire  regs_mod__mod__write___en_$IN_EN_WRITE, regs_mod__mod__write___en_$OUT_READ;
  wire [19 : 0] regs_mod__rf_mod__1_read___req__data_$IN_WRITE, regs_mod__rf_mod__1_read___req__data_$OUT_READ;
  wire  regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__rf_mod__1_read___resp___data_$IN_WRITE, regs_mod__rf_mod__1_read___resp___data_$OUT_READ;
  wire  regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE;
  wire [51 : 0] regs_mod__rf_mod__1_write___data_$IN_WRITE, regs_mod__rf_mod__1_write___data_$OUT_READ;
  wire  regs_mod__rf_mod__1_write___data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__1_write___en_$IN_EN_WRITE, regs_mod__rf_mod__1_write___en_$OUT_READ;
  wire [19 : 0] regs_mod__rf_mod__read___req__data_$IN_WRITE, regs_mod__rf_mod__read___req__data_$OUT_READ;
  wire  regs_mod__rf_mod__read___req__data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__read___req__en_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__rf_mod__read___resp___data_$IN_WRITE, regs_mod__rf_mod__read___resp___data_$OUT_READ;
  wire  regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE;
  wire [51 : 0] regs_mod__rf_mod__write___data_$IN_WRITE, regs_mod__rf_mod__write___data_$OUT_READ;
  wire  regs_mod__rf_mod__write___data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__write___en_$IN_EN_WRITE, regs_mod__rf_mod__write___en_$OUT_READ;
  wire [31 : 0] regs_mod__rf_rf$READ_RESP_READ, regs_mod__rf_rf$WRITE_DATA_WRITE;
  wire [19 : 0] regs_mod__rf_rf$READ_REQ_WRITE, regs_mod__rf_rf$WRITE_INDEX_WRITE;
  wire  regs_mod__rf_rf$WRITE_EN_WRITE;
  wire [31 : 0] regs_mod__rf_rf_1$READ_RESP_READ, regs_mod__rf_rf_1$WRITE_DATA_WRITE;
  wire [19 : 0] regs_mod__rf_rf_1$READ_REQ_WRITE, regs_mod__rf_rf_1$WRITE_INDEX_WRITE;
  wire  regs_mod__rf_rf_1$WRITE_EN_WRITE;
  wire  regs_mod__whichReg$IN_EN_WRITE;
  wire  WILL_FIRE_RL_r2;
  wire  dataQ_enq_EN_READ_VALID;
  wire  dataQ_enq_READ_VALID;
  wire  dataQ_notFull_WRITE_VALID;
  wire  dataReqQ_deq_READ_VALID;
  wire  dataReqQ_first_WRITE_VALID;
  wire  dataReqQ_notEmpty_WRITE_VALID;
  wire  instQ_enq_EN_READ_VALID;
  wire  instQ_enq_READ_VALID;
  wire  instQ_notFull_WRITE_VALID;
  wire  instReqQ_deq_READ_VALID;
  wire  instReqQ_first_WRITE_VALID;
  wire  instReqQ_notEmpty_WRITE_VALID;
  wire  mod__dataQ__enq__data_$IN_EN_WRITE_VALID;
  wire  mod__dataQ__enq__data_$IN_WRITE_VALID;
  wire  mod__dataQ__enq__data_$OUT_READ_VALID;
  wire  mod__dataQ__enq__en_$IN_EN_WRITE_VALID;
  wire  mod__dataQ__enq__en_$OUT_READ_VALID;
  wire  mod__dataQ__notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__dataQ__notFull___data_$IN_WRITE_VALID;
  wire  mod__dataQ__notFull___data_$OUT_READ_VALID;
  wire  mod__dataReqQ__deq__data_$IN_EN_WRITE_VALID;
  wire  mod__dataReqQ__deq__data_$OUT_READ_VALID;
  wire  mod__dataReqQ__first___data_$IN_EN_WRITE_VALID;
  wire  mod__dataReqQ__first___data_$IN_WRITE_VALID;
  wire  mod__dataReqQ__first___data_$OUT_READ_VALID;
  wire  mod__dataReqQ__notEmpty___data_$IN_EN_WRITE_VALID;
  wire  mod__dataReqQ__notEmpty___data_$IN_WRITE_VALID;
  wire  mod__dataReqQ__notEmpty___data_$OUT_READ_VALID;
  wire  mod__instQ__enq__data_$IN_EN_WRITE_VALID;
  wire  mod__instQ__enq__data_$IN_WRITE_VALID;
  wire  mod__instQ__enq__data_$OUT_READ_VALID;
  wire  mod__instQ__enq__en_$IN_EN_WRITE_VALID;
  wire  mod__instQ__enq__en_$OUT_READ_VALID;
  wire  mod__instQ__notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__instQ__notFull___data_$IN_WRITE_VALID;
  wire  mod__instQ__notFull___data_$OUT_READ_VALID;
  wire  mod__instReqQ__deq__data_$IN_EN_WRITE_VALID;
  wire  mod__instReqQ__deq__data_$OUT_READ_VALID;
  wire  mod__instReqQ__first___data_$IN_EN_WRITE_VALID;
  wire  mod__instReqQ__first___data_$IN_WRITE_VALID;
  wire  mod__instReqQ__first___data_$OUT_READ_VALID;
  wire  mod__instReqQ__notEmpty___data_$IN_EN_WRITE_VALID;
  wire  mod__instReqQ__notEmpty___data_$IN_WRITE_VALID;
  wire  mod__instReqQ__notEmpty___data_$OUT_READ_VALID;
  wire  regs_mod__mod__read___req__1_data_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__read___req__1_data_$IN_WRITE_VALID;
  wire  regs_mod__mod__read___req__1_data_$OUT_READ_VALID;
  wire  regs_mod__mod__read___req__1_en_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__read___req__data_$IN_WRITE_VALID;
  wire  regs_mod__mod__read___req__data_$OUT_READ_VALID;
  wire  regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__read___resp___1_data_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__read___resp___1_data_$IN_WRITE_VALID;
  wire  regs_mod__mod__read___resp___1_data_$OUT_READ_VALID;
  wire  regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__read___resp___data_$IN_WRITE_VALID;
  wire  regs_mod__mod__read___resp___data_$OUT_READ_VALID;
  wire  regs_mod__mod__write___data_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__write___data_$IN_WRITE_VALID;
  wire  regs_mod__mod__write___data_$OUT_READ_VALID;
  wire  regs_mod__mod__write___en_$IN_EN_WRITE_VALID;
  wire  regs_mod__mod__write___en_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_read___req__data_$IN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_read___req__data_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_read___resp___data_$IN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_read___resp___data_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__1_write___data_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_write___data_$IN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_write___data_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__1_write___en_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__1_write___en_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__read___req__data_$IN_WRITE_VALID;
  wire  regs_mod__rf_mod__read___req__data_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID;
  wire  regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__write___data_$IN_WRITE_VALID;
  wire  regs_mod__rf_mod__write___data_$OUT_READ_VALID;
  wire  regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID;
  wire  regs_mod__rf_mod__write___en_$OUT_READ_VALID;
  wire  regs_mod__rf_rf$READ_REQ_WRITE_VALID;
  wire  regs_mod__rf_rf$READ_RESP_READ_VALID;
  wire  regs_mod__rf_rf$WRITE_DATA_WRITE_VALID;
  wire  regs_mod__rf_rf$WRITE_EN_WRITE_VALID;
  wire  regs_mod__rf_rf$WRITE_INDEX_WRITE_VALID;
  wire  regs_mod__rf_rf_1$READ_REQ_WRITE_VALID;
  wire  regs_mod__rf_rf_1$READ_RESP_READ_VALID;
  wire  regs_mod__rf_rf_1$WRITE_DATA_WRITE_VALID;
  wire  regs_mod__rf_rf_1$WRITE_EN_WRITE_VALID;
  wire  regs_mod__rf_rf_1$WRITE_INDEX_WRITE_VALID;
  wire  regs_mod__whichReg$IN_EN_WRITE_VALID;
  wire  dataQ_enq_EN_READ_CONSUMED;
  wire  dataQ_enq_READ_CONSUMED;
  wire  dataQ_notFull_WRITE_CONSUMED;
  wire  dataReqQ_deq_READ_CONSUMED;
  wire  dataReqQ_first_WRITE_CONSUMED;
  wire  dataReqQ_notEmpty_WRITE_CONSUMED;
  wire  instQ_enq_EN_READ_CONSUMED;
  wire  instQ_enq_READ_CONSUMED;
  wire  instQ_notFull_WRITE_CONSUMED;
  wire  instReqQ_deq_READ_CONSUMED;
  wire  instReqQ_first_WRITE_CONSUMED;
  wire  instReqQ_notEmpty_WRITE_CONSUMED;
  wire  mod__dataQ__enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataQ__enq__data_$IN_WRITE_CONSUMED;
  wire  mod__dataQ__enq__data_$OUT_READ_CONSUMED;
  wire  mod__dataQ__enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataQ__enq__en_$OUT_READ_CONSUMED;
  wire  mod__dataQ__notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataQ__notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__dataQ__notFull___data_$OUT_READ_CONSUMED;
  wire  mod__dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataReqQ__deq__data_$OUT_READ_CONSUMED;
  wire  mod__dataReqQ__first___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataReqQ__first___data_$IN_WRITE_CONSUMED;
  wire  mod__dataReqQ__first___data_$OUT_READ_CONSUMED;
  wire  mod__dataReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__dataReqQ__notEmpty___data_$IN_WRITE_CONSUMED;
  wire  mod__dataReqQ__notEmpty___data_$OUT_READ_CONSUMED;
  wire  mod__instQ__enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instQ__enq__data_$IN_WRITE_CONSUMED;
  wire  mod__instQ__enq__data_$OUT_READ_CONSUMED;
  wire  mod__instQ__enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__instQ__enq__en_$OUT_READ_CONSUMED;
  wire  mod__instQ__notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instQ__notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__instQ__notFull___data_$OUT_READ_CONSUMED;
  wire  mod__instReqQ__deq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instReqQ__deq__data_$OUT_READ_CONSUMED;
  wire  mod__instReqQ__first___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instReqQ__first___data_$IN_WRITE_CONSUMED;
  wire  mod__instReqQ__first___data_$OUT_READ_CONSUMED;
  wire  mod__instReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instReqQ__notEmpty___data_$IN_WRITE_CONSUMED;
  wire  mod__instReqQ__notEmpty___data_$OUT_READ_CONSUMED;
  wire  regs_mod__mod__read___req__1_data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___req__1_data_$IN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___req__1_data_$OUT_READ_CONSUMED;
  wire  regs_mod__mod__read___req__1_en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___req__data_$IN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___req__data_$OUT_READ_CONSUMED;
  wire  regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___resp___1_data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___resp___1_data_$IN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___resp___1_data_$OUT_READ_CONSUMED;
  wire  regs_mod__mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__write___data_$IN_WRITE_CONSUMED;
  wire  regs_mod__mod__write___data_$OUT_READ_CONSUMED;
  wire  regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__mod__write___en_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_read___req__data_$IN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_read___req__data_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_read___resp___data_$IN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_read___resp___data_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__1_write___data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_write___data_$IN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_write___data_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__1_write___en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__1_write___en_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__read___req__data_$IN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__read___req__data_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED;
  wire  regs_mod__rf_rf$READ_REQ_WRITE_CONSUMED;
  wire  regs_mod__rf_rf$READ_RESP_READ_CONSUMED;
  wire  regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED;
  wire  regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_rf$WRITE_INDEX_WRITE_CONSUMED;
  wire  regs_mod__rf_rf_1$READ_REQ_WRITE_CONSUMED;
  wire  regs_mod__rf_rf_1$READ_RESP_READ_CONSUMED;
  wire  regs_mod__rf_rf_1$WRITE_DATA_WRITE_CONSUMED;
  wire  regs_mod__rf_rf_1$WRITE_EN_WRITE_CONSUMED;
  wire  regs_mod__rf_rf_1$WRITE_INDEX_WRITE_CONSUMED;
  wire  regs_mod__whichReg$IN_EN_WRITE_CONSUMED;

  assign instReqQ_deq_READ = mod__instReqQ__deq__data_$OUT_READ ;

  assign instQ_enq_READ = mod__instQ__enq__data_$OUT_READ ;

  assign instQ_enq_EN_READ = mod__instQ__enq__en_$OUT_READ ;

  assign dataReqQ_deq_READ = mod__dataReqQ__deq__data_$OUT_READ ;

  assign dataQ_enq_READ = mod__dataQ__enq__data_$OUT_READ ;

  assign dataQ_enq_EN_READ = mod__dataQ__enq__en_$OUT_READ ;

  assign WILL_FIRE_RL_r2 =
	     mod__dataReqQ__notEmpty___data_$OUT_READ &&
	     (mod__dataReqQ__first___data_$OUT_READ[64] ||
	      mod__dataQ__notFull___data_$OUT_READ) ;

  assign mod__dataQ__enq__data_$IN_WRITE =
	     regs_mod__mod__read___resp___1_data_$OUT_READ ;

  assign mod__dataQ__enq__data_$IN_EN_WRITE =
	     WILL_FIRE_RL_r2 && !mod__dataReqQ__first___data_$OUT_READ[64] ;

  assign mod__dataQ__enq__en_$IN_EN_WRITE =
	     WILL_FIRE_RL_r2 && !mod__dataReqQ__first___data_$OUT_READ[64] ;

  assign mod__dataQ__notFull___data_$IN_WRITE = dataQ_notFull_WRITE ;

  assign mod__dataQ__notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__dataReqQ__deq__data_$IN_EN_WRITE = WILL_FIRE_RL_r2 ;

  assign mod__dataReqQ__first___data_$IN_WRITE = dataReqQ_first_WRITE ;

  assign mod__dataReqQ__first___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__dataReqQ__notEmpty___data_$IN_WRITE = dataReqQ_notEmpty_WRITE ;

  assign mod__dataReqQ__notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__instQ__enq__data_$IN_WRITE =
	     regs_mod__mod__read___resp___data_$OUT_READ ;

  assign mod__instQ__enq__data_$IN_EN_WRITE =
	     mod__instReqQ__notEmpty___data_$OUT_READ &&
	     mod__instQ__notFull___data_$OUT_READ ;

  assign mod__instQ__enq__en_$IN_EN_WRITE =
	     mod__instReqQ__notEmpty___data_$OUT_READ &&
	     mod__instQ__notFull___data_$OUT_READ ;

  assign mod__instQ__notFull___data_$IN_WRITE = instQ_notFull_WRITE ;

  assign mod__instQ__notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__instReqQ__deq__data_$IN_EN_WRITE =
	     mod__instReqQ__notEmpty___data_$OUT_READ &&
	     mod__instQ__notFull___data_$OUT_READ ;

  assign mod__instReqQ__first___data_$IN_WRITE = instReqQ_first_WRITE ;

  assign mod__instReqQ__first___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__instReqQ__notEmpty___data_$IN_WRITE = instReqQ_notEmpty_WRITE ;

  assign mod__instReqQ__notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___req__1_data_$IN_WRITE =
	     mod__dataReqQ__first___data_$OUT_READ[21:2] ;

  assign regs_mod__mod__read___req__1_data_$IN_EN_WRITE =
	     WILL_FIRE_RL_r2 && !mod__dataReqQ__first___data_$OUT_READ[64] ;

  assign regs_mod__mod__read___req__1_en_$IN_EN_WRITE =
	     WILL_FIRE_RL_r2 && !mod__dataReqQ__first___data_$OUT_READ[64] ;

  assign regs_mod__mod__read___req__data_$IN_WRITE =
	     mod__instReqQ__first___data_$OUT_READ[21:2] ;

  assign regs_mod__mod__read___req__data_$IN_EN_WRITE =
	     mod__instReqQ__notEmpty___data_$OUT_READ &&
	     mod__instQ__notFull___data_$OUT_READ ;

  assign regs_mod__mod__read___req__en_$IN_EN_WRITE =
	     mod__instReqQ__notEmpty___data_$OUT_READ &&
	     mod__instQ__notFull___data_$OUT_READ ;

  assign regs_mod__mod__read___resp___1_data_$IN_WRITE =
	     regs_mod__rf_mod__1_read___resp___data_$OUT_READ ;

  assign regs_mod__mod__read___resp___1_data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___resp___data_$IN_WRITE =
	     regs_mod__rf_mod__read___resp___data_$OUT_READ ;

  assign regs_mod__mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__write___data_$IN_WRITE =
	     { mod__dataReqQ__first___data_$OUT_READ[53:34],
	       mod__dataReqQ__first___data_$OUT_READ[31:0] } ;

  assign regs_mod__mod__write___data_$IN_EN_WRITE =
	     WILL_FIRE_RL_r2 && mod__dataReqQ__first___data_$OUT_READ[64] ;

  assign regs_mod__mod__write___en_$IN_EN_WRITE =
	     WILL_FIRE_RL_r2 && mod__dataReqQ__first___data_$OUT_READ[64] ;

  assign regs_mod__rf_mod__1_read___req__data_$IN_WRITE =
	     regs_mod__mod__read___req__1_data_$OUT_READ ;

  assign regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__rf_mod__1_read___resp___data_$IN_WRITE =
	     regs_mod__rf_rf_1$READ_RESP_READ ;

  assign regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__rf_mod__1_write___data_$IN_WRITE =
	     regs_mod__mod__write___data_$OUT_READ ;

  assign regs_mod__rf_mod__1_write___data_$IN_EN_WRITE =
	     regs_mod__mod__write___en_$OUT_READ ;

  assign regs_mod__rf_mod__1_write___en_$IN_EN_WRITE =
	     regs_mod__mod__write___en_$OUT_READ ;

  assign regs_mod__rf_mod__read___req__data_$IN_WRITE =
	     regs_mod__mod__read___req__data_$OUT_READ ;

  assign regs_mod__rf_mod__read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__rf_mod__read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__rf_mod__read___resp___data_$IN_WRITE =
	     regs_mod__rf_rf$READ_RESP_READ ;

  assign regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__rf_mod__write___data_$IN_WRITE =
	     regs_mod__mod__write___data_$OUT_READ ;

  assign regs_mod__rf_mod__write___data_$IN_EN_WRITE =
	     regs_mod__mod__write___en_$OUT_READ ;

  assign regs_mod__rf_mod__write___en_$IN_EN_WRITE =
	     regs_mod__mod__write___en_$OUT_READ ;

  assign regs_mod__rf_rf$READ_REQ_WRITE =
	     regs_mod__rf_mod__read___req__data_$OUT_READ ;

  assign regs_mod__rf_rf$WRITE_DATA_WRITE =
	     regs_mod__rf_mod__write___data_$OUT_READ[31:0] ;

  assign regs_mod__rf_rf$WRITE_INDEX_WRITE =
	     regs_mod__rf_mod__write___data_$OUT_READ[51:32] ;

  assign regs_mod__rf_rf$WRITE_EN_WRITE =
	     regs_mod__rf_mod__write___en_$OUT_READ ;

  assign regs_mod__rf_rf_1$READ_REQ_WRITE =
	     regs_mod__rf_mod__1_read___req__data_$OUT_READ ;

  assign regs_mod__rf_rf_1$WRITE_DATA_WRITE =
	     regs_mod__rf_mod__1_write___data_$OUT_READ[31:0] ;

  assign regs_mod__rf_rf_1$WRITE_INDEX_WRITE =
	     regs_mod__rf_mod__1_write___data_$OUT_READ[51:32] ;

  assign regs_mod__rf_rf_1$WRITE_EN_WRITE =
	     regs_mod__rf_mod__1_write___en_$OUT_READ ;

  assign regs_mod__whichReg$IN_EN_WRITE = 1'd1 ;

  assign dataQ_enq_EN_READ_VALID = 1 && mod__dataQ__enq__en_$OUT_READ_VALID;

  assign dataQ_enq_READ_VALID = 1 && mod__dataQ__enq__data_$OUT_READ_VALID;

  assign dataReqQ_deq_READ_VALID = 1 && mod__dataReqQ__deq__data_$OUT_READ_VALID;

  assign instQ_enq_EN_READ_VALID = 1 && mod__instQ__enq__en_$OUT_READ_VALID;

  assign instQ_enq_READ_VALID = 1 && mod__instQ__enq__data_$OUT_READ_VALID;

  assign instReqQ_deq_READ_VALID = 1 && mod__instReqQ__deq__data_$OUT_READ_VALID;

  assign mod__dataQ__enq__data_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign mod__dataQ__enq__data_$IN_WRITE_VALID = 1 && regs_mod__mod__read___resp___1_data_$OUT_READ_VALID;

  assign mod__dataQ__enq__en_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign mod__dataQ__notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__dataQ__notFull___data_$IN_WRITE_VALID = 1 && dataQ_notFull_WRITE_VALID;

  assign mod__dataReqQ__deq__data_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign mod__dataReqQ__first___data_$IN_EN_WRITE_VALID = 1;

  assign mod__dataReqQ__first___data_$IN_WRITE_VALID = 1 && dataReqQ_first_WRITE_VALID;

  assign mod__dataReqQ__notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign mod__dataReqQ__notEmpty___data_$IN_WRITE_VALID = 1 && dataReqQ_notEmpty_WRITE_VALID;

  assign mod__instQ__enq__data_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notEmpty___data_$OUT_READ_VALID && mod__instQ__notFull___data_$OUT_READ_VALID;

  assign mod__instQ__enq__data_$IN_WRITE_VALID = 1 && regs_mod__mod__read___resp___data_$OUT_READ_VALID;

  assign mod__instQ__enq__en_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notEmpty___data_$OUT_READ_VALID && mod__instQ__notFull___data_$OUT_READ_VALID;

  assign mod__instQ__notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__instQ__notFull___data_$IN_WRITE_VALID = 1 && instQ_notFull_WRITE_VALID;

  assign mod__instReqQ__deq__data_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notEmpty___data_$OUT_READ_VALID && mod__instQ__notFull___data_$OUT_READ_VALID;

  assign mod__instReqQ__first___data_$IN_EN_WRITE_VALID = 1;

  assign mod__instReqQ__first___data_$IN_WRITE_VALID = 1 && instReqQ_first_WRITE_VALID;

  assign mod__instReqQ__notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign mod__instReqQ__notEmpty___data_$IN_WRITE_VALID = 1 && instReqQ_notEmpty_WRITE_VALID;

  assign regs_mod__mod__read___req__1_data_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__1_data_$IN_WRITE_VALID = 1 && mod__dataReqQ__first___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__1_en_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notEmpty___data_$OUT_READ_VALID && mod__instQ__notFull___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__data_$IN_WRITE_VALID = 1 && mod__instReqQ__first___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notEmpty___data_$OUT_READ_VALID && mod__instQ__notFull___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___resp___1_data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___resp___1_data_$IN_WRITE_VALID = 1 && regs_mod__rf_mod__1_read___resp___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___resp___data_$IN_WRITE_VALID = 1 && regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;

  assign regs_mod__mod__write___data_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign regs_mod__mod__write___data_$IN_WRITE_VALID = 1 && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID;

  assign regs_mod__mod__write___en_$IN_EN_WRITE_VALID = 1 && mod__dataReqQ__notEmpty___data_$OUT_READ_VALID && mod__dataReqQ__first___data_$OUT_READ_VALID && mod__dataQ__notFull___data_$OUT_READ_VALID;

  assign regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__rf_mod__1_read___req__data_$IN_WRITE_VALID = 1 && regs_mod__mod__read___req__1_data_$OUT_READ_VALID;

  assign regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__rf_mod__1_read___resp___data_$IN_WRITE_VALID = 1 && regs_mod__rf_rf_1$READ_RESP_READ_VALID;

  assign regs_mod__rf_mod__1_write___data_$IN_EN_WRITE_VALID = 1 && regs_mod__mod__write___en_$OUT_READ_VALID;

  assign regs_mod__rf_mod__1_write___data_$IN_WRITE_VALID = 1 && regs_mod__mod__write___data_$OUT_READ_VALID;

  assign regs_mod__rf_mod__1_write___en_$IN_EN_WRITE_VALID = 1 && regs_mod__mod__write___en_$OUT_READ_VALID;

  assign regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__rf_mod__read___req__data_$IN_WRITE_VALID = 1 && regs_mod__mod__read___req__data_$OUT_READ_VALID;

  assign regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID = 1 && regs_mod__rf_rf$READ_RESP_READ_VALID;

  assign regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID = 1 && regs_mod__mod__write___en_$OUT_READ_VALID;

  assign regs_mod__rf_mod__write___data_$IN_WRITE_VALID = 1 && regs_mod__mod__write___data_$OUT_READ_VALID;

  assign regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID = 1 && regs_mod__mod__write___en_$OUT_READ_VALID;

  assign regs_mod__rf_rf$READ_REQ_WRITE_VALID = 1 && regs_mod__rf_mod__read___req__data_$OUT_READ_VALID;

  assign regs_mod__rf_rf$WRITE_DATA_WRITE_VALID = 1 && regs_mod__rf_mod__write___data_$OUT_READ_VALID;

  assign regs_mod__rf_rf$WRITE_EN_WRITE_VALID = 1 && regs_mod__rf_mod__write___en_$OUT_READ_VALID;

  assign regs_mod__rf_rf$WRITE_INDEX_WRITE_VALID = 1 && regs_mod__rf_mod__write___data_$OUT_READ_VALID;

  assign regs_mod__rf_rf_1$READ_REQ_WRITE_VALID = 1 && regs_mod__rf_mod__1_read___req__data_$OUT_READ_VALID;

  assign regs_mod__rf_rf_1$WRITE_DATA_WRITE_VALID = 1 && regs_mod__rf_mod__1_write___data_$OUT_READ_VALID;

  assign regs_mod__rf_rf_1$WRITE_EN_WRITE_VALID = 1 && regs_mod__rf_mod__1_write___en_$OUT_READ_VALID;

  assign regs_mod__rf_rf_1$WRITE_INDEX_WRITE_VALID = 1 && regs_mod__rf_mod__1_write___data_$OUT_READ_VALID;

  assign regs_mod__whichReg$IN_EN_WRITE_VALID = 1;

  assign dataQ_notFull_WRITE_CONSUMED = 1 && mod__dataQ__notFull___data_$IN_WRITE_CONSUMED;

  assign dataReqQ_first_WRITE_CONSUMED = 1 && mod__dataReqQ__first___data_$IN_WRITE_CONSUMED;

  assign dataReqQ_notEmpty_WRITE_CONSUMED = 1 && mod__dataReqQ__notEmpty___data_$IN_WRITE_CONSUMED;

  assign instQ_notFull_WRITE_CONSUMED = 1 && mod__instQ__notFull___data_$IN_WRITE_CONSUMED;

  assign instReqQ_first_WRITE_CONSUMED = 1 && mod__instReqQ__first___data_$IN_WRITE_CONSUMED;

  assign instReqQ_notEmpty_WRITE_CONSUMED = 1 && mod__instReqQ__notEmpty___data_$IN_WRITE_CONSUMED;

  assign mod__dataQ__enq__data_$OUT_READ_CONSUMED = 1 && dataQ_enq_READ_CONSUMED;

  assign mod__dataQ__enq__en_$OUT_READ_CONSUMED = 1 && dataQ_enq_EN_READ_CONSUMED;

  assign mod__dataQ__notFull___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__1_en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__1_data_$IN_EN_WRITE_CONSUMED && mod__dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__dataQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__dataReqQ__deq__data_$OUT_READ_CONSUMED = 1 && dataReqQ_deq_READ_CONSUMED;

  assign mod__dataReqQ__first___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__1_en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__1_data_$IN_WRITE_CONSUMED && regs_mod__mod__read___req__1_data_$IN_EN_WRITE_CONSUMED && mod__dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__dataQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__dataReqQ__notEmpty___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__1_en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__1_data_$IN_EN_WRITE_CONSUMED && mod__dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED && mod__dataQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__dataQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__instQ__enq__data_$OUT_READ_CONSUMED = 1 && instQ_enq_READ_CONSUMED;

  assign mod__instQ__enq__en_$OUT_READ_CONSUMED = 1 && instQ_enq_EN_READ_CONSUMED;

  assign mod__instQ__notFull___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED && mod__instReqQ__deq__data_$IN_EN_WRITE_CONSUMED && mod__instQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__instQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__instReqQ__deq__data_$OUT_READ_CONSUMED = 1 && instReqQ_deq_READ_CONSUMED;

  assign mod__instReqQ__first___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___req__data_$IN_WRITE_CONSUMED;

  assign mod__instReqQ__notEmpty___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED && mod__instReqQ__deq__data_$IN_EN_WRITE_CONSUMED && mod__instQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__instQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign regs_mod__mod__read___req__1_data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_mod__1_read___req__data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___req__data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_mod__read___req__data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___resp___1_data_$OUT_READ_CONSUMED = 1 && mod__dataQ__enq__data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED = 1 && mod__instQ__enq__data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__write___data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED && regs_mod__rf_mod__1_write___data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__write___en_$OUT_READ_CONSUMED = 1 && regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED && regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED && regs_mod__rf_mod__1_write___en_$IN_EN_WRITE_CONSUMED && regs_mod__rf_mod__1_write___data_$IN_EN_WRITE_CONSUMED;

  assign regs_mod__rf_mod__1_read___req__data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_rf_1$READ_REQ_WRITE_CONSUMED;

  assign regs_mod__rf_mod__1_read___resp___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___resp___1_data_$IN_WRITE_CONSUMED;

  assign regs_mod__rf_mod__1_write___data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_rf_1$WRITE_INDEX_WRITE_CONSUMED && regs_mod__rf_rf_1$WRITE_DATA_WRITE_CONSUMED;

  assign regs_mod__rf_mod__1_write___en_$OUT_READ_CONSUMED = 1 && regs_mod__rf_rf_1$WRITE_EN_WRITE_CONSUMED;

  assign regs_mod__rf_mod__read___req__data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_rf$READ_REQ_WRITE_CONSUMED;

  assign regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED;

  assign regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_rf$WRITE_INDEX_WRITE_CONSUMED && regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED;

  assign regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED = 1 && regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED;

  assign regs_mod__rf_rf$READ_RESP_READ_CONSUMED = 1 && regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED;

  assign regs_mod__rf_rf_1$READ_RESP_READ_CONSUMED = 1 && regs_mod__rf_mod__1_read___resp___data_$IN_WRITE_CONSUMED;

  mkWire#(32'd32) mod__dataQ__enq__data_ (
    .IN_WRITE(mod__dataQ__enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__dataQ__enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__dataQ__enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__dataQ__enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__dataQ__enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataQ__enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__dataQ__enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__dataQ__enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataQ__enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__dataQ__enq__en_ (
    .IN_EN_WRITE(mod__dataQ__enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__dataQ__enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__dataQ__enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataQ__enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__dataQ__enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataQ__enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__dataQ__notFull___data_ (
    .IN_WRITE(mod__dataQ__notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__dataQ__notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__dataQ__notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__dataQ__notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__dataQ__notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataQ__notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__dataQ__notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__dataQ__notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataQ__notFull___data_$OUT_READ_CONSUMED));

  mkPulse mod__dataReqQ__deq__data_ (
    .IN_EN_WRITE(mod__dataReqQ__deq__data_$IN_EN_WRITE),
    .OUT_READ(mod__dataReqQ__deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__dataReqQ__deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataReqQ__deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataReqQ__deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd65) mod__dataReqQ__first___data_ (
    .IN_WRITE(mod__dataReqQ__first___data_$IN_WRITE),
    .IN_EN_WRITE(mod__dataReqQ__first___data_$IN_EN_WRITE),
    .OUT_READ(mod__dataReqQ__first___data_$OUT_READ),
    .IN_WRITE_VALID(mod__dataReqQ__first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__dataReqQ__first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataReqQ__first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__dataReqQ__first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__dataReqQ__first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataReqQ__first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__dataReqQ__notEmpty___data_ (
    .IN_WRITE(mod__dataReqQ__notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(mod__dataReqQ__notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(mod__dataReqQ__notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(mod__dataReqQ__notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__dataReqQ__notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__dataReqQ__notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__dataReqQ__notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__dataReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__dataReqQ__notEmpty___data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__instQ__enq__data_ (
    .IN_WRITE(mod__instQ__enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__instQ__enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__instQ__enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__instQ__enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__instQ__enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instQ__enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__instQ__enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__instQ__enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instQ__enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__instQ__enq__en_ (
    .IN_EN_WRITE(mod__instQ__enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__instQ__enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__instQ__enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instQ__enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__instQ__enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instQ__enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__instQ__notFull___data_ (
    .IN_WRITE(mod__instQ__notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__instQ__notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__instQ__notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__instQ__notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__instQ__notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instQ__notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__instQ__notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__instQ__notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instQ__notFull___data_$OUT_READ_CONSUMED));

  mkPulse mod__instReqQ__deq__data_ (
    .IN_EN_WRITE(mod__instReqQ__deq__data_$IN_EN_WRITE),
    .OUT_READ(mod__instReqQ__deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__instReqQ__deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instReqQ__deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__instReqQ__deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instReqQ__deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__instReqQ__first___data_ (
    .IN_WRITE(mod__instReqQ__first___data_$IN_WRITE),
    .IN_EN_WRITE(mod__instReqQ__first___data_$IN_EN_WRITE),
    .OUT_READ(mod__instReqQ__first___data_$OUT_READ),
    .IN_WRITE_VALID(mod__instReqQ__first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__instReqQ__first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instReqQ__first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__instReqQ__first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__instReqQ__first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instReqQ__first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__instReqQ__notEmpty___data_ (
    .IN_WRITE(mod__instReqQ__notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(mod__instReqQ__notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(mod__instReqQ__notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(mod__instReqQ__notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__instReqQ__notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instReqQ__notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__instReqQ__notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__instReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instReqQ__notEmpty___data_$OUT_READ_CONSUMED));

  mkWire#(32'd20) regs_mod__mod__read___req__1_data_ (
    .IN_WRITE(regs_mod__mod__read___req__1_data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__mod__read___req__1_data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__mod__read___req__1_data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__mod__read___req__1_data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__mod__read___req__1_data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__mod__read___req__1_data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__mod__read___req__1_data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__read___req__1_data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__mod__read___req__1_data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__mod__read___req__1_en_ (
    .IN_EN_WRITE(regs_mod__mod__read___req__1_en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(regs_mod__mod__read___req__1_en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__read___req__1_en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd20) regs_mod__mod__read___req__data_ (
    .IN_WRITE(regs_mod__mod__read___req__data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__mod__read___req__data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__mod__read___req__data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__mod__read___req__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__mod__read___req__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__mod__read___req__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__read___req__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__mod__read___req__data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__mod__read___req__en_ (
    .IN_EN_WRITE(regs_mod__mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd32) regs_mod__mod__read___resp___1_data_ (
    .IN_WRITE(regs_mod__mod__read___resp___1_data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__mod__read___resp___1_data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__mod__read___resp___1_data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__mod__read___resp___1_data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__mod__read___resp___1_data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__mod__read___resp___1_data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__mod__read___resp___1_data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__read___resp___1_data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__mod__read___resp___1_data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) regs_mod__mod__read___resp___data_ (
    .IN_WRITE(regs_mod__mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd52) regs_mod__mod__write___data_ (
    .IN_WRITE(regs_mod__mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__mod__write___data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__mod__write___data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__mod__write___en_ (
    .IN_EN_WRITE(regs_mod__mod__write___en_$IN_EN_WRITE),
    .OUT_READ(regs_mod__mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(regs_mod__mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__mod__write___en_$OUT_READ_CONSUMED));

  mkWire#(32'd20) regs_mod__rf_mod__1_read___req__data_ (
    .IN_WRITE(regs_mod__rf_mod__1_read___req__data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__1_read___req__data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__rf_mod__1_read___req__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__1_read___req__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__rf_mod__1_read___req__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__1_read___req__data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__rf_mod__1_read___req__en_ (
    .IN_EN_WRITE(regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd32) regs_mod__rf_mod__1_read___resp___data_ (
    .IN_WRITE(regs_mod__rf_mod__1_read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__1_read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__rf_mod__1_read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__1_read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__rf_mod__1_read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__1_read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd52) regs_mod__rf_mod__1_write___data_ (
    .IN_WRITE(regs_mod__rf_mod__1_write___data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__rf_mod__1_write___data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__1_write___data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__rf_mod__1_write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__1_write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__1_write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__rf_mod__1_write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__1_write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__1_write___data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__rf_mod__1_write___en_ (
    .IN_EN_WRITE(regs_mod__rf_mod__1_write___en_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__1_write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__1_write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__1_write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__1_write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__1_write___en_$OUT_READ_CONSUMED));

  mkWire#(32'd20) regs_mod__rf_mod__read___req__data_ (
    .IN_WRITE(regs_mod__rf_mod__read___req__data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__rf_mod__read___req__data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__read___req__data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__rf_mod__read___req__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__read___req__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__rf_mod__read___req__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__read___req__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__read___req__data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__rf_mod__read___req__en_ (
    .IN_EN_WRITE(regs_mod__rf_mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd32) regs_mod__rf_mod__read___resp___data_ (
    .IN_WRITE(regs_mod__rf_mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__rf_mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__rf_mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__read___resp___data_$OUT_READ_CONSUMED));

  mkWire#(32'd52) regs_mod__rf_mod__write___data_ (
    .IN_WRITE(regs_mod__rf_mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(regs_mod__rf_mod__write___data_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(regs_mod__rf_mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(regs_mod__rf_mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__write___data_$OUT_READ_CONSUMED));

  mkPulse regs_mod__rf_mod__write___en_ (
    .IN_EN_WRITE(regs_mod__rf_mod__write___en_$IN_EN_WRITE),
    .OUT_READ(regs_mod__rf_mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(regs_mod__rf_mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(regs_mod__rf_mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(regs_mod__rf_mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(regs_mod__rf_mod__write___en_$OUT_READ_CONSUMED));

  mkRegFileLoad_#(32'd32,
		    /*n*/ 32'd20,
		    /*size*/ 32'd1048576,
		    /*file*/ "../memory.vmh",
		    /*mode*/ 32'd2) regs_mod__rf_rf (
    .CLK(CLK),
    .RST_N(RST_N),
    .READ_REQ_WRITE(regs_mod__rf_rf$READ_REQ_WRITE),
    .WRITE_DATA_WRITE(regs_mod__rf_rf$WRITE_DATA_WRITE),
    .WRITE_INDEX_WRITE(regs_mod__rf_rf$WRITE_INDEX_WRITE),
    .WRITE_EN_WRITE(regs_mod__rf_rf$WRITE_EN_WRITE),
    .READ_RESP_READ(regs_mod__rf_rf$READ_RESP_READ),
    .READ_REQ_WRITE_VALID(regs_mod__rf_rf$READ_REQ_WRITE_VALID),
    .WRITE_DATA_WRITE_VALID(regs_mod__rf_rf$WRITE_DATA_WRITE_VALID),
    .WRITE_INDEX_WRITE_VALID(regs_mod__rf_rf$WRITE_INDEX_WRITE_VALID),
    .WRITE_EN_WRITE_VALID(regs_mod__rf_rf$WRITE_EN_WRITE_VALID),
    .READ_RESP_READ_VALID(regs_mod__rf_rf$READ_RESP_READ_VALID),
    .READ_REQ_WRITE_CONSUMED(regs_mod__rf_rf$READ_REQ_WRITE_CONSUMED),
    .WRITE_DATA_WRITE_CONSUMED(regs_mod__rf_rf$WRITE_DATA_WRITE_CONSUMED),
    .WRITE_INDEX_WRITE_CONSUMED(regs_mod__rf_rf$WRITE_INDEX_WRITE_CONSUMED),
    .WRITE_EN_WRITE_CONSUMED(regs_mod__rf_rf$WRITE_EN_WRITE_CONSUMED),
    .READ_RESP_READ_CONSUMED(regs_mod__rf_rf$READ_RESP_READ_CONSUMED));

  mkRegFileLoad_#(32'd32,
		    /*n*/ 32'd20,
		    /*size*/ 32'd1048576,
		    /*file*/ "../memory.vmh",
		    /*mode*/ 32'd2) regs_mod__rf_rf_1 (
    .CLK(CLK),
    .RST_N(RST_N),
    .READ_REQ_WRITE(regs_mod__rf_rf_1$READ_REQ_WRITE),
    .WRITE_DATA_WRITE(regs_mod__rf_rf_1$WRITE_DATA_WRITE),
    .WRITE_INDEX_WRITE(regs_mod__rf_rf_1$WRITE_INDEX_WRITE),
    .WRITE_EN_WRITE(regs_mod__rf_rf_1$WRITE_EN_WRITE),
    .READ_RESP_READ(regs_mod__rf_rf_1$READ_RESP_READ),
    .READ_REQ_WRITE_VALID(regs_mod__rf_rf_1$READ_REQ_WRITE_VALID),
    .WRITE_DATA_WRITE_VALID(regs_mod__rf_rf_1$WRITE_DATA_WRITE_VALID),
    .WRITE_INDEX_WRITE_VALID(regs_mod__rf_rf_1$WRITE_INDEX_WRITE_VALID),
    .WRITE_EN_WRITE_VALID(regs_mod__rf_rf_1$WRITE_EN_WRITE_VALID),
    .READ_RESP_READ_VALID(regs_mod__rf_rf_1$READ_RESP_READ_VALID),
    .READ_REQ_WRITE_CONSUMED(regs_mod__rf_rf_1$READ_REQ_WRITE_CONSUMED),
    .WRITE_DATA_WRITE_CONSUMED(regs_mod__rf_rf_1$WRITE_DATA_WRITE_CONSUMED),
    .WRITE_INDEX_WRITE_CONSUMED(regs_mod__rf_rf_1$WRITE_INDEX_WRITE_CONSUMED),
    .WRITE_EN_WRITE_CONSUMED(regs_mod__rf_rf_1$WRITE_EN_WRITE_CONSUMED),
    .READ_RESP_READ_CONSUMED(regs_mod__rf_rf_1$READ_RESP_READ_CONSUMED));

  mkReg#(32'd1) regs_mod__whichReg (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_EN_WRITE(regs_mod__whichReg$IN_EN_WRITE),
    .IN_EN_WRITE_VALID(regs_mod__whichReg$IN_EN_WRITE_VALID),
    .IN_EN_WRITE_CONSUMED(regs_mod__whichReg$IN_EN_WRITE_CONSUMED));
endmodule
