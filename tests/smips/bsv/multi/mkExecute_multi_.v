`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkExecute(
  CLK,
  RST_N,
  pcQ_notEmpty_WRITE,
  pcQ_first_WRITE,
  pcQ_deq_READ,
  instQ_notEmpty_WRITE,
  instQ_first_WRITE,
  instQ_deq_READ,
  dataReqQ_notFull_WRITE,
  dataReqQ_enq_READ,
  dataReqQ_enq_EN_READ,
  regRead_0_req_READ,
  regRead_0_req_EN_READ,
  regRead_0_resp_WRITE,
  regRead_1_req_READ,
  regRead_1_req_EN_READ,
  regRead_1_resp_WRITE,
  wbQ_notFull_WRITE,
  wbQ_enq_READ,
  wbQ_enq_EN_READ,
  wbIndex_WRITE,
  wbIndex_EN_WRITE,
  currEpoch_WRITE,
  branchPc_READ,
  branchPc_EN_READ,
  cop_write_READ,
  cop_write_EN_READ,
  cop_read_WRITE,
  pcQ_notEmpty_WRITE_VALID,
  pcQ_first_WRITE_VALID,
  pcQ_deq_READ_VALID,
  instQ_notEmpty_WRITE_VALID,
  instQ_first_WRITE_VALID,
  instQ_deq_READ_VALID,
  dataReqQ_notFull_WRITE_VALID,
  dataReqQ_enq_READ_VALID,
  dataReqQ_enq_EN_READ_VALID,
  regRead_0_req_READ_VALID,
  regRead_0_req_EN_READ_VALID,
  regRead_0_resp_WRITE_VALID,
  regRead_1_req_READ_VALID,
  regRead_1_req_EN_READ_VALID,
  regRead_1_resp_WRITE_VALID,
  wbQ_notFull_WRITE_VALID,
  wbQ_enq_READ_VALID,
  wbQ_enq_EN_READ_VALID,
  wbIndex_WRITE_VALID,
  wbIndex_EN_WRITE_VALID,
  currEpoch_WRITE_VALID,
  branchPc_READ_VALID,
  branchPc_EN_READ_VALID,
  cop_write_READ_VALID,
  cop_write_EN_READ_VALID,
  cop_read_WRITE_VALID,
  pcQ_notEmpty_WRITE_CONSUMED,
  pcQ_first_WRITE_CONSUMED,
  pcQ_deq_READ_CONSUMED,
  instQ_notEmpty_WRITE_CONSUMED,
  instQ_first_WRITE_CONSUMED,
  instQ_deq_READ_CONSUMED,
  dataReqQ_notFull_WRITE_CONSUMED,
  dataReqQ_enq_READ_CONSUMED,
  dataReqQ_enq_EN_READ_CONSUMED,
  regRead_0_req_READ_CONSUMED,
  regRead_0_req_EN_READ_CONSUMED,
  regRead_0_resp_WRITE_CONSUMED,
  regRead_1_req_READ_CONSUMED,
  regRead_1_req_EN_READ_CONSUMED,
  regRead_1_resp_WRITE_CONSUMED,
  wbQ_notFull_WRITE_CONSUMED,
  wbQ_enq_READ_CONSUMED,
  wbQ_enq_EN_READ_CONSUMED,
  wbIndex_WRITE_CONSUMED,
  wbIndex_EN_WRITE_CONSUMED,
  currEpoch_WRITE_CONSUMED,
  branchPc_READ_CONSUMED,
  branchPc_EN_READ_CONSUMED,
  cop_write_READ_CO