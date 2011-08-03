`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkCore(
  CLK,
  RST_N,
  mem_instReqQ_notEmpty_READ,
  mem_instReqQ_first_READ,
  mem_instReqQ_deq_WRITE,
  mem_instQ_notFull_READ,
  mem_instQ_enq_WRITE,
  mem_instQ_enq_EN_WRITE,
  mem_dataReqQ_notEmpty_READ,
  mem_dataReqQ_first_READ,
  mem_dataReqQ_deq_WRITE,
  mem_dataQ_notFull_READ,
  mem_dataQ_enq_WRITE,
  mem_dataQ_enq_EN_WRITE,
  mem_instReqQ_notEmpty_READ_VALID,
  mem_instReqQ_first_READ_VALID,
  mem_instReqQ_deq_WRITE_VALID,
  mem_instQ_notFull_READ_VALID,
  mem_instQ_enq_WRITE_VALID,
  mem_instQ_enq_EN_WRITE_VALID,
  mem_dataReqQ_notEmpty_READ_VALID,
  mem_dataReqQ_first_READ_VALID,
  mem_dataReqQ_deq_WRITE_VALID,
  mem_dataQ_notFull_READ_VALID,
  mem_dataQ_enq_WRITE_VALID,
  mem_dataQ_enq_EN_WRITE_VALID,
  mem_instReqQ_notEmpty_READ_CONSUMED,
  mem_instReqQ_first_READ_CONSUMED,
  mem_instReqQ_deq_WRITE_CONSUMED,
  mem_instQ_notFull_READ_CONSUMED,
  mem_instQ_enq_WRITE_CONSUMED,
  mem_instQ_enq_EN_WRITE_CONSUMED,
  mem_dataReqQ_notEmpty_READ_CONSUMED,
  mem_dataReqQ_first_READ_CONSUMED,
  mem_dataReqQ_deq_WRITE_CONSUMED,
  mem_dataQ_notFull_READ_CONSUMED,
  mem_dataQ_enq_WRITE_CONSUMED,
  mem_dataQ_enq_EN_WRITE_CONSUMED);

  input  mem_instReqQ_deq_WRITE_VALID;
  input  mem_instQ_enq_WRITE_VALID;
  input  mem_instQ_enq_EN_WRITE_VALID;
  input  mem_dataReqQ_deq_WRITE_VALID;
  input  mem_dataQ_enq_WRITE_VALID;
  input  mem_dataQ_enq_EN_WRITE_VALID;
  input  mem_instReqQ_notEmpty_READ_CONSUMED;
  input  mem_instReqQ_first_READ_CONSUMED;
  input  mem_instQ_notFull_READ_CONSUMED;
  input  mem_dataReqQ_notEmpty_READ_CONSUMED;
  input  mem_dataReqQ_first_READ_CONSUMED;
  input  mem_dataQ_notFull_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input  mem_instReqQ_deq_WRITE;
  input [31 : 0] mem_instQ_enq_WRITE;
  input  mem_instQ_enq_EN_WRITE;
  input  mem_dataReqQ_deq_WRITE;
  input [31 : 0] mem_dataQ_enq_WRITE;
  input  mem_dataQ_enq_EN_WRITE;
  output  mem_instReqQ_deq_WRITE_CONSUMED;
  output  mem_instQ_enq_WRITE_CONSUMED;
  output  mem_instQ_enq_EN_WRITE_CONSUMED;
  output  mem_dataReqQ_deq_WRITE_CONSUMED;
  output  mem_dataQ_enq_WRITE_CONSUMED;
  output  mem_dataQ_enq_EN_WRITE_CONSUMED;
  output  mem_instReqQ_notEmpty_READ_VALID;
  output  mem_instReqQ_first_READ_VALID;
  output  mem_instQ_notFull_READ_VALID;
  output  mem_dataReqQ_notEmpty_READ_VALID;
  output  mem_dataReqQ_first_READ_VALID;
  output  mem_dataQ_notFull_READ_VALID;
  output  mem_instReqQ_notEmpty_READ;
  output [31 : 0] mem_instReqQ_first_READ;
  output  mem_instQ_notFull_READ;
  output  mem_dataReqQ_notEmpty_READ;
  output [64 : 0] mem_dataReqQ_first_READ;
  output  mem_dataQ_notFull_READ;
  wire [64 : 0] mem_dataReqQ_first_READ;
  wire [31 : 0] mem_instReqQ_first_READ;
  wire  mem_dataQ_notFull_READ, mem_dataReqQ_notEmpty_READ, mem_instQ_notFull_READ, mem_instReqQ_notEmpty_READ;
  wire [36 : 0] cop$write_WRITE;
  wire [31 : 0] cop$read_READ;
  wire  cop$write_EN_WRITE;
  wire [31 : 0] dataQ$deq_first_READ, dataQ$enq_enq_WRITE;
  wire  dataQ$deq_deq_WRITE, dataQ$deq_notEmpty_READ, dataQ$enq_enq_EN_WRITE, dataQ$enq_notFull_READ;
  wire [64 : 0] dataReqQ$deq_first_READ, dataReqQ$enq_enq_WRITE;
  wire  dataReqQ$deq_deq_WRITE, dataReqQ$deq_notEmpty_READ, dataReqQ$enq_enq_EN_WRITE, dataReqQ$enq_notFull_READ;
  wire [64 : 0] execute$dataReqQ_enq_READ;
  wire [37 : 0] execute$wbQ_enq_READ;
  wire [36 : 0] execute$cop_write_READ;
  wire [32 : 0] execute$pcQ_first_WRITE;
  wire [31 : 0] execute$branchPc_READ, execute$cop_read_WRITE, execute$instQ_first_WRITE, execute$regRead_0_resp_WRITE, execute$regRead_1_resp_WRITE;
  wire [4 : 0] execute$regRead_0_req_READ, execute$regRead_1_req_READ, execute$wbIndex_WRITE;
  wire  execute$branchPc_EN_READ, execute$cop_write_EN_READ, execute$currEpoch_WRITE, execute$dataReqQ_enq_EN_READ, execute$dataReqQ_notFull_WRITE, execute$instQ_deq_READ, execute$instQ_notEmpty_WRITE, execute$pcQ_deq_READ, execute$pcQ_notEmpty_WRITE, execute$regRead_0_req_EN_READ, execute$regRead_1_req_EN_READ, execute$wbIndex_EN_WRITE, execute$wbQ_enq_EN_READ, execute$wbQ_notFull_WRITE;
  wire [32 : 0] fetch$pcQ_enq_READ;
  wire [31 : 0] fetch$branchPc_WRITE, fetch$instReqQ_enq_READ;
  wire  fetch$branchPc_EN_WRITE, fetch$currEpoch_READ, fetch$instReqQ_enq_EN_READ, fetch$instReqQ_notFull_WRITE, fetch$pcQ_enq_EN_READ, fetch$pcQ_notFull_WRITE;
  wire [31 : 0] instQ$deq_first_READ, instQ$enq_enq_WRITE;
  wire  instQ$deq_deq_WRITE, instQ$deq_notEmpty_READ, instQ$enq_enq_EN_WRITE, instQ$enq_notFull_READ;
  wire [31 : 0] instReqQ$deq_first_READ, instReqQ$enq_enq_WRITE;
  wire  instReqQ$deq_deq_WRITE, instReqQ$deq_notEmpty_READ, instReqQ$enq_enq_EN_WRITE, instReqQ$enq_notFull_READ;
  wire [31 : 0] mod__mem___dataQ__enq__data_$IN_WRITE, mod__mem___dataQ__enq__data_$OUT_READ;
  wire  mod__mem___dataQ__enq__data_$IN_EN_WRITE;
  wire  mod__mem___dataQ__enq__en_$IN_EN_WRITE, mod__mem___dataQ__enq__en_$OUT_READ;
  wire  mod__mem___dataQ__notFull___data_$IN_EN_WRITE, mod__mem___dataQ__notFull___data_$IN_WRITE, mod__mem___dataQ__notFull___data_$OUT_READ;
  wire  mod__mem___dataReqQ__deq__data_$IN_EN_WRITE, mod__mem___dataReqQ__deq__data_$OUT_READ;
  wire [64 : 0] mod__mem___dataReqQ__first___data_$IN_WRITE, mod__mem___dataReqQ__first___data_$OUT_READ;
  wire  mod__mem___dataReqQ__first___data_$IN_EN_WRITE;
  wire  mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE, mod__mem___dataReqQ__notEmpty___data_$IN_WRITE, mod__mem___dataReqQ__notEmpty___data_$OUT_READ;
  wire [31 : 0] mod__mem___instQ__enq__data_$IN_WRITE, mod__mem___instQ__enq__data_$OUT_READ;
  wire  mod__mem___instQ__enq__data_$IN_EN_WRITE;
  wire  mod__mem___instQ__enq__en_$IN_EN_WRITE, mod__mem___instQ__enq__en_$OUT_READ;
  wire  mod__mem___instQ__notFull___data_$IN_EN_WRITE, mod__mem___instQ__notFull___data_$IN_WRITE, mod__mem___instQ__notFull___data_$OUT_READ;
  wire  mod__mem___instReqQ__deq__data_$IN_EN_WRITE, mod__mem___instReqQ__deq__data_$OUT_READ;
  wire [31 : 0] mod__mem___instReqQ__first___data_$IN_WRITE, mod__mem___instReqQ__first___data_$OUT_READ;
  wire  mod__mem___instReqQ__first___data_$IN_EN_WRITE;
  wire  mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE, mod__mem___instReqQ__notEmpty___data_$IN_WRITE, mod__mem___instReqQ__notEmpty___data_$OUT_READ;
  wire [32 : 0] pcQ$deq_first_READ, pcQ$enq_enq_WRITE;
  wire  pcQ$deq_deq_WRITE, pcQ$deq_notEmpty_READ, pcQ$enq_enq_EN_WRITE, pcQ$enq_notFull_READ;
  wire [36 : 0] regs$write_WRITE;
  wire [31 : 0] regs$read_0_resp_READ, regs$read_1_resp_READ;
  wire [4 : 0] regs$read_0_req_WRITE, regs$read_1_req_WRITE;
  wire  regs$read_0_req_EN_WRITE, regs$read_1_req_EN_WRITE, regs$write_EN_WRITE;
  wire [37 : 0] wb$wb_enq_WRITE;
  wire [36 : 0] wb$regWrite_READ;
  wire [31 : 0] wb$dataQ_first_WRITE;
  wire [4 : 0] wb$wbIndex_READ;
  wire  wb$dataQ_deq_READ, wb$dataQ_notEmpty_WRITE, wb$regWrite_EN_READ, wb$wbIndex_EN_READ, wb$wb_enq_EN_WRITE, wb$wb_notFull_READ;
  wire  cop$read_READ_VALID;
  wire  cop$write_EN_WRITE_VALID;
  wire  cop$write_WRITE_VALID;
  wire  dataQ$deq_deq_WRITE_VALID;
  wire  dataQ$deq_first_READ_VALID;
  wire  dataQ$deq_notEmpty_READ_VALID;
  wire  dataQ$enq_enq_EN_WRITE_VALID;
  wire  dataQ$enq_enq_WRITE_VALID;
  wire  dataQ$enq_notFull_READ_VALID;
  wire  dataReqQ$deq_deq_WRITE_VALID;
  wire  dataReqQ$deq_first_READ_VALID;
  wire  dataReqQ$deq_notEmpty_READ_VALID;
  wire  dataReqQ$enq_enq_EN_WRITE_VALID;
  wire  dataReqQ$enq_enq_WRITE_VALID;
  wire  dataReqQ$enq_notFull_READ_VALID;
  wire  execute$branchPc_EN_READ_VALID;
  wire  execute$branchPc_READ_VALID;
  wire  execute$cop_read_WRITE_VALID;
  wire  execute$cop_write_EN_READ_VALID;
  wire  execute$cop_write_READ_VALID;
  wire  execute$currEpoch_WRITE_VALID;
  wire  execute$dataReqQ_enq_EN_READ_VALID;
  wire  execute$dataReqQ_enq_READ_VALID;
  wire  execute$dataReqQ_notFull_WRITE_VALID;
  wire  execute$instQ_deq_READ_VALID;
  wire  execute$instQ_first_WRITE_VALID;
  wire  execute$instQ_notEmpty_WRITE_VALID;
  wire  execute$pcQ_deq_READ_VALID;
  wire  execute$pcQ_first_WRITE_VALID;
  wire  execute$pcQ_notEmpty_WRITE_VALID;
  wire  execute$regRead_0_req_EN_READ_VALID;
  wire  execute$regRead_0_req_READ_VALID;
  wire  execute$regRead_0_resp_WRITE_VALID;
  wire  execute$regRead_1_req_EN_READ_VALID;
  wire  execute$regRead_1_req_READ_VALID;
  wire  execute$regRead_1_resp_WRITE_VALID;
  wire  execute$wbIndex_EN_WRITE_VALID;
  wire  execute$wbIndex_WRITE_VALID;
  wire  execute$wbQ_enq_EN_READ_VALID;
  wire  execute$wbQ_enq_READ_VALID;
  wire  execute$wbQ_notFull_WRITE_VALID;
  wire  fetch$branchPc_EN_WRITE_VALID;
  wire  fetch$branchPc_WRITE_VALID;
  wire  fetch$currEpoch_READ_VALID;
  wire  fetch$instReqQ_enq_EN_READ_VALID;
  wire  fetch$instReqQ_enq_READ_VALID;
  wire  fetch$instReqQ_notFull_WRITE_VALID;
  wire  fetch$pcQ_enq_EN_READ_VALID;
  wire  fetch$pcQ_enq_READ_VALID;
  wire  fetch$pcQ_notFull_WRITE_VALID;
  wire  instQ$deq_deq_WRITE_VALID;
  wire  instQ$deq_first_READ_VALID;
  wire  instQ$deq_notEmpty_READ_VALID;
  wire  instQ$enq_enq_EN_WRITE_VALID;
  wire  instQ$enq_enq_WRITE_VALID;
  wire  instQ$enq_notFull_READ_VALID;
  wire  instReqQ$deq_deq_WRITE_VALID;
  wire  instReqQ$deq_first_READ_VALID;
  wire  instReqQ$deq_notEmpty_READ_VALID;
  wire  instReqQ$enq_enq_EN_WRITE_VALID;
  wire  instReqQ$enq_enq_WRITE_VALID;
  wire  instReqQ$enq_notFull_READ_VALID;
  wire  mem_dataQ_enq_EN_WRITE_VALID;
  wire  mem_dataQ_enq_WRITE_VALID;
  wire  mem_dataQ_notFull_READ_VALID;
  wire  mem_dataReqQ_deq_WRITE_VALID;
  wire  mem_dataReqQ_first_READ_VALID;
  wire  mem_dataReqQ_notEmpty_READ_VALID;
  wire  mem_instQ_enq_EN_WRITE_VALID;
  wire  mem_instQ_enq_WRITE_VALID;
  wire  mem_instQ_notFull_READ_VALID;
  wire  mem_instReqQ_deq_WRITE_VALID;
  wire  mem_instReqQ_first_READ_VALID;
  wire  mem_instReqQ_notEmpty_READ_VALID;
  wire  mod__mem___dataQ__enq__data_$IN_EN_WRITE_VALID;
  wire  mod__mem___dataQ__enq__data_$IN_WRITE_VALID;
  wire  mod__mem___dataQ__enq__data_$OUT_READ_VALID;
  wire  mod__mem___dataQ__enq__en_$IN_EN_WRITE_VALID;
  wire  mod__mem___dataQ__enq__en_$OUT_READ_VALID;
  wire  mod__mem___dataQ__notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__mem___dataQ__notFull___data_$IN_WRITE_VALID;
  wire  mod__mem___dataQ__notFull___data_$OUT_READ_VALID;
  wire  mod__mem___dataReqQ__deq__data_$IN_EN_WRITE_VALID;
  wire  mod__mem___dataReqQ__deq__data_$OUT_READ_VALID;
  wire  mod__mem___dataReqQ__first___data_$IN_EN_WRITE_VALID;
  wire  mod__mem___dataReqQ__first___data_$IN_WRITE_VALID;
  wire  mod__mem___dataReqQ__first___data_$OUT_READ_VALID;
  wire  mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE_VALID;
  wire  mod__mem___dataReqQ__notEmpty___data_$IN_WRITE_VALID;
  wire  mod__mem___dataReqQ__notEmpty___data_$OUT_READ_VALID;
  wire  mod__mem___instQ__enq__data_$IN_EN_WRITE_VALID;
  wire  mod__mem___instQ__enq__data_$IN_WRITE_VALID;
  wire  mod__mem___instQ__enq__data_$OUT_READ_VALID;
  wire  mod__mem___instQ__enq__en_$IN_EN_WRITE_VALID;
  wire  mod__mem___instQ__enq__en_$OUT_READ_VALID;
  wire  mod__mem___instQ__notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__mem___instQ__notFull___data_$IN_WRITE_VALID;
  wire  mod__mem___instQ__notFull___data_$OUT_READ_VALID;
  wire  mod__mem___instReqQ__deq__data_$IN_EN_WRITE_VALID;
  wire  mod__mem___instReqQ__deq__data_$OUT_READ_VALID;
  wire  mod__mem___instReqQ__first___data_$IN_EN_WRITE_VALID;
  wire  mod__mem___instReqQ__first___data_$IN_WRITE_VALID;
  wire  mod__mem___instReqQ__first___data_$OUT_READ_VALID;
  wire  mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE_VALID;
  wire  mod__mem___instReqQ__notEmpty___data_$IN_WRITE_VALID;
  wire  mod__mem___instReqQ__notEmpty___data_$OUT_READ_VALID;
  wire  pcQ$deq_deq_WRITE_VALID;
  wire  pcQ$deq_first_READ_VALID;
  wire  pcQ$deq_notEmpty_READ_VALID;
  wire  pcQ$enq_enq_EN_WRITE_VALID;
  wire  pcQ$enq_enq_WRITE_VALID;
  wire  pcQ$enq_notFull_READ_VALID;
  wire  regs$read_0_req_EN_WRITE_VALID;
  wire  regs$read_0_req_WRITE_VALID;
  wire  regs$read_0_resp_READ_VALID;
  wire  regs$read_1_req_EN_WRITE_VALID;
  wire  regs$read_1_req_WRITE_VALID;
  wire  regs$read_1_resp_READ_VALID;
  wire  regs$write_EN_WRITE_VALID;
  wire  regs$write_WRITE_VALID;
  wire  wb$dataQ_deq_READ_VALID;
  wire  wb$dataQ_first_WRITE_VALID;
  wire  wb$dataQ_notEmpty_WRITE_VALID;
  wire  wb$regWrite_EN_READ_VALID;
  wire  wb$regWrite_READ_VALID;
  wire  wb$wbIndex_EN_READ_VALID;
  wire  wb$wbIndex_READ_VALID;
  wire  wb$wb_enq_EN_WRITE_VALID;
  wire  wb$wb_enq_WRITE_VALID;
  wire  wb$wb_notFull_READ_VALID;
  wire  cop$read_READ_CONSUMED;
  wire  cop$write_EN_WRITE_CONSUMED;
  wire  cop$write_WRITE_CONSUMED;
  wire  dataQ$deq_deq_WRITE_CONSUMED;
  wire  dataQ$deq_first_READ_CONSUMED;
  wire  dataQ$deq_notEmpty_READ_CONSUMED;
  wire  dataQ$enq_enq_EN_WRITE_CONSUMED;
  wire  dataQ$enq_enq_WRITE_CONSUMED;
  wire  dataQ$enq_notFull_READ_CONSUMED;
  wire  dataReqQ$deq_deq_WRITE_CONSUMED;
  wire  dataReqQ$deq_first_READ_CONSUMED;
  wire  dataReqQ$deq_notEmpty_READ_CONSUMED;
  wire  dataReqQ$enq_enq_EN_WRITE_CONSUMED;
  wire  dataReqQ$enq_enq_WRITE_CONSUMED;
  wire  dataReqQ$enq_notFull_READ_CONSUMED;
  wire  execute$branchPc_EN_READ_CONSUMED;
  wire  execute$branchPc_READ_CONSUMED;
  wire  execute$cop_read_WRITE_CONSUMED;
  wire  execute$cop_write_EN_READ_CONSUMED;
  wire  execute$cop_write_READ_CONSUMED;
  wire  execute$currEpoch_WRITE_CONSUMED;
  wire  execute$dataReqQ_enq_EN_READ_CONSUMED;
  wire  execute$dataReqQ_enq_READ_CONSUMED;
  wire  execute$dataReqQ_notFull_WRITE_CONSUMED;
  wire  execute$instQ_deq_READ_CONSUMED;
  wire  execute$instQ_first_WRITE_CONSUMED;
  wire  execute$instQ_notEmpty_WRITE_CONSUMED;
  wire  execute$pcQ_deq_READ_CONSUMED;
  wire  execute$pcQ_first_WRITE_CONSUMED;
  wire  execute$pcQ_notEmpty_WRITE_CONSUMED;
  wire  execute$regRead_0_req_EN_READ_CONSUMED;
  wire  execute$regRead_0_req_READ_CONSUMED;
  wire  execute$regRead_0_resp_WRITE_CONSUMED;
  wire  execute$regRead_1_req_EN_READ_CONSUMED;
  wire  execute$regRead_1_req_READ_CONSUMED;
  wire  execute$regRead_1_resp_WRITE_CONSUMED;
  wire  execute$wbIndex_EN_WRITE_CONSUMED;
  wire  execute$wbIndex_WRITE_CONSUMED;
  wire  execute$wbQ_enq_EN_READ_CONSUMED;
  wire  execute$wbQ_enq_READ_CONSUMED;
  wire  execute$wbQ_notFull_WRITE_CONSUMED;
  wire  fetch$branchPc_EN_WRITE_CONSUMED;
  wire  fetch$branchPc_WRITE_CONSUMED;
  wire  fetch$currEpoch_READ_CONSUMED;
  wire  fetch$instReqQ_enq_EN_READ_CONSUMED;
  wire  fetch$instReqQ_enq_READ_CONSUMED;
  wire  fetch$instReqQ_notFull_WRITE_CONSUMED;
  wire  fetch$pcQ_enq_EN_READ_CONSUMED;
  wire  fetch$pcQ_enq_READ_CONSUMED;
  wire  fetch$pcQ_notFull_WRITE_CONSUMED;
  wire  instQ$deq_deq_WRITE_CONSUMED;
  wire  instQ$deq_first_READ_CONSUMED;
  wire  instQ$deq_notEmpty_READ_CONSUMED;
  wire  instQ$enq_enq_EN_WRITE_CONSUMED;
  wire  instQ$enq_enq_WRITE_CONSUMED;
  wire  instQ$enq_notFull_READ_CONSUMED;
  wire  instReqQ$deq_deq_WRITE_CONSUMED;
  wire  instReqQ$deq_first_READ_CONSUMED;
  wire  instReqQ$deq_notEmpty_READ_CONSUMED;
  wire  instReqQ$enq_enq_EN_WRITE_CONSUMED;
  wire  instReqQ$enq_enq_WRITE_CONSUMED;
  wire  instReqQ$enq_notFull_READ_CONSUMED;
  wire  mem_dataQ_enq_EN_WRITE_CONSUMED;
  wire  mem_dataQ_enq_WRITE_CONSUMED;
  wire  mem_dataQ_notFull_READ_CONSUMED;
  wire  mem_dataReqQ_deq_WRITE_CONSUMED;
  wire  mem_dataReqQ_first_READ_CONSUMED;
  wire  mem_dataReqQ_notEmpty_READ_CONSUMED;
  wire  mem_instQ_enq_EN_WRITE_CONSUMED;
  wire  mem_instQ_enq_WRITE_CONSUMED;
  wire  mem_instQ_notFull_READ_CONSUMED;
  wire  mem_instReqQ_deq_WRITE_CONSUMED;
  wire  mem_instReqQ_first_READ_CONSUMED;
  wire  mem_instReqQ_notEmpty_READ_CONSUMED;
  wire  mod__mem___dataQ__enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___dataQ__enq__data_$IN_WRITE_CONSUMED;
  wire  mod__mem___dataQ__enq__data_$OUT_READ_CONSUMED;
  wire  mod__mem___dataQ__enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___dataQ__enq__en_$OUT_READ_CONSUMED;
  wire  mod__mem___dataQ__notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___dataQ__notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__mem___dataQ__notFull___data_$OUT_READ_CONSUMED;
  wire  mod__mem___dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___dataReqQ__deq__data_$OUT_READ_CONSUMED;
  wire  mod__mem___dataReqQ__first___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___dataReqQ__first___data_$IN_WRITE_CONSUMED;
  wire  mod__mem___dataReqQ__first___data_$OUT_READ_CONSUMED;
  wire  mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___dataReqQ__notEmpty___data_$IN_WRITE_CONSUMED;
  wire  mod__mem___dataReqQ__notEmpty___data_$OUT_READ_CONSUMED;
  wire  mod__mem___instQ__enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___instQ__enq__data_$IN_WRITE_CONSUMED;
  wire  mod__mem___instQ__enq__data_$OUT_READ_CONSUMED;
  wire  mod__mem___instQ__enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___instQ__enq__en_$OUT_READ_CONSUMED;
  wire  mod__mem___instQ__notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___instQ__notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__mem___instQ__notFull___data_$OUT_READ_CONSUMED;
  wire  mod__mem___instReqQ__deq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___instReqQ__deq__data_$OUT_READ_CONSUMED;
  wire  mod__mem___instReqQ__first___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___instReqQ__first___data_$IN_WRITE_CONSUMED;
  wire  mod__mem___instReqQ__first___data_$OUT_READ_CONSUMED;
  wire  mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__mem___instReqQ__notEmpty___data_$IN_WRITE_CONSUMED;
  wire  mod__mem___instReqQ__notEmpty___data_$OUT_READ_CONSUMED;
  wire  pcQ$deq_deq_WRITE_CONSUMED;
  wire  pcQ$deq_first_READ_CONSUMED;
  wire  pcQ$deq_notEmpty_READ_CONSUMED;
  wire  pcQ$enq_enq_EN_WRITE_CONSUMED;
  wire  pcQ$enq_enq_WRITE_CONSUMED;
  wire  pcQ$enq_notFull_READ_CONSUMED;
  wire  regs$read_0_req_EN_WRITE_CONSUMED;
  wire  regs$read_0_req_WRITE_CONSUMED;
  wire  regs$read_0_resp_READ_CONSUMED;
  wire  regs$read_1_req_EN_WRITE_CONSUMED;
  wire  regs$read_1_req_WRITE_CONSUMED;
  wire  regs$read_1_resp_READ_CONSUMED;
  wire  regs$write_EN_WRITE_CONSUMED;
  wire  regs$write_WRITE_CONSUMED;
  wire  wb$dataQ_deq_READ_CONSUMED;
  wire  wb$dataQ_first_WRITE_CONSUMED;
  wire  wb$dataQ_notEmpty_WRITE_CONSUMED;
  wire  wb$regWrite_EN_READ_CONSUMED;
  wire  wb$regWrite_READ_CONSUMED;
  wire  wb$wbIndex_EN_READ_CONSUMED;
  wire  wb$wbIndex_READ_CONSUMED;
  wire  wb$wb_enq_EN_WRITE_CONSUMED;
  wire  wb$wb_enq_WRITE_CONSUMED;
  wire  wb$wb_notFull_READ_CONSUMED;

  assign mem_instReqQ_notEmpty_READ =
	     mod__mem___instReqQ__notEmpty___data_$OUT_READ ;

  assign mem_instReqQ_first_READ =
	     mod__mem___instReqQ__first___data_$OUT_READ ;

  assign mem_instQ_notFull_READ = mod__mem___instQ__notFull___data_$OUT_READ ;

  assign mem_dataReqQ_notEmpty_READ =
	     mod__mem___dataReqQ__notEmpty___data_$OUT_READ ;

  assign mem_dataReqQ_first_READ =
	     mod__mem___dataReqQ__first___data_$OUT_READ ;

  assign mem_dataQ_notFull_READ = mod__mem___dataQ__notFull___data_$OUT_READ ;

  assign cop$write_WRITE = execute$cop_write_READ ;

  assign cop$write_EN_WRITE = execute$cop_write_EN_READ ;

  assign dataQ$enq_enq_WRITE = mod__mem___dataQ__enq__data_$OUT_READ ;

  assign dataQ$enq_enq_EN_WRITE = mod__mem___dataQ__enq__en_$OUT_READ ;

  assign dataQ$deq_deq_WRITE = wb$dataQ_deq_READ ;

  assign dataReqQ$enq_enq_WRITE = execute$dataReqQ_enq_READ ;

  assign dataReqQ$enq_enq_EN_WRITE = execute$dataReqQ_enq_EN_READ ;

  assign dataReqQ$deq_deq_WRITE = mod__mem___dataReqQ__deq__data_$OUT_READ ;

  assign execute$cop_read_WRITE = cop$read_READ ;

  assign execute$currEpoch_WRITE = fetch$currEpoch_READ ;

  assign execute$dataReqQ_notFull_WRITE = dataReqQ$enq_notFull_READ ;

  assign execute$instQ_first_WRITE = instQ$deq_first_READ ;

  assign execute$instQ_notEmpty_WRITE = instQ$deq_notEmpty_READ ;

  assign execute$pcQ_first_WRITE = pcQ$deq_first_READ ;

  assign execute$pcQ_notEmpty_WRITE = pcQ$deq_notEmpty_READ ;

  assign execute$regRead_0_resp_WRITE = regs$read_0_resp_READ ;

  assign execute$regRead_1_resp_WRITE = regs$read_1_resp_READ ;

  assign execute$wbIndex_WRITE = wb$wbIndex_READ ;

  assign execute$wbQ_notFull_WRITE = wb$wb_notFull_READ ;

  assign execute$wbIndex_EN_WRITE = wb$wbIndex_EN_READ ;

  assign fetch$branchPc_WRITE = execute$branchPc_READ ;

  assign fetch$instReqQ_notFull_WRITE = instReqQ$enq_notFull_READ ;

  assign fetch$pcQ_notFull_WRITE = pcQ$enq_notFull_READ ;

  assign fetch$branchPc_EN_WRITE = execute$branchPc_EN_READ ;

  assign instQ$enq_enq_WRITE = mod__mem___instQ__enq__data_$OUT_READ ;

  assign instQ$enq_enq_EN_WRITE = mod__mem___instQ__enq__en_$OUT_READ ;

  assign instQ$deq_deq_WRITE = execute$instQ_deq_READ ;

  assign instReqQ$enq_enq_WRITE = fetch$instReqQ_enq_READ ;

  assign instReqQ$enq_enq_EN_WRITE = fetch$instReqQ_enq_EN_READ ;

  assign instReqQ$deq_deq_WRITE = mod__mem___instReqQ__deq__data_$OUT_READ ;

  assign mod__mem___dataQ__enq__data_$IN_WRITE = mem_dataQ_enq_WRITE ;

  assign mod__mem___dataQ__enq__data_$IN_EN_WRITE = mem_dataQ_enq_EN_WRITE ;

  assign mod__mem___dataQ__enq__en_$IN_EN_WRITE = mem_dataQ_enq_EN_WRITE ;

  assign mod__mem___dataQ__notFull___data_$IN_WRITE = dataQ$enq_notFull_READ ;

  assign mod__mem___dataQ__notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mem___dataReqQ__deq__data_$IN_EN_WRITE =
	     mem_dataReqQ_deq_WRITE ;

  assign mod__mem___dataReqQ__first___data_$IN_WRITE =
	     dataReqQ$deq_first_READ ;

  assign mod__mem___dataReqQ__first___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mem___dataReqQ__notEmpty___data_$IN_WRITE =
	     dataReqQ$deq_notEmpty_READ ;

  assign mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mem___instQ__enq__data_$IN_WRITE = mem_instQ_enq_WRITE ;

  assign mod__mem___instQ__enq__data_$IN_EN_WRITE = mem_instQ_enq_EN_WRITE ;

  assign mod__mem___instQ__enq__en_$IN_EN_WRITE = mem_instQ_enq_EN_WRITE ;

  assign mod__mem___instQ__notFull___data_$IN_WRITE = instQ$enq_notFull_READ ;

  assign mod__mem___instQ__notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mem___instReqQ__deq__data_$IN_EN_WRITE =
	     mem_instReqQ_deq_WRITE ;

  assign mod__mem___instReqQ__first___data_$IN_WRITE =
	     instReqQ$deq_first_READ ;

  assign mod__mem___instReqQ__first___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__mem___instReqQ__notEmpty___data_$IN_WRITE =
	     instReqQ$deq_notEmpty_READ ;

  assign mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE = 1'd1 ;

  assign pcQ$enq_enq_WRITE = fetch$pcQ_enq_READ ;

  assign pcQ$enq_enq_EN_WRITE = fetch$pcQ_enq_EN_READ ;

  assign pcQ$deq_deq_WRITE = execute$pcQ_deq_READ ;

  assign regs$read_0_req_WRITE = execute$regRead_0_req_READ ;

  assign regs$read_1_req_WRITE = execute$regRead_1_req_READ ;

  assign regs$write_WRITE = wb$regWrite_READ ;

  assign regs$read_0_req_EN_WRITE = execute$regRead_0_req_EN_READ ;

  assign regs$read_1_req_EN_WRITE = execute$regRead_1_req_EN_READ ;

  assign regs$write_EN_WRITE = wb$regWrite_EN_READ ;

  assign wb$dataQ_first_WRITE = dataQ$deq_first_READ ;

  assign wb$dataQ_notEmpty_WRITE = dataQ$deq_notEmpty_READ ;

  assign wb$wb_enq_WRITE = execute$wbQ_enq_READ ;

  assign wb$wb_enq_EN_WRITE = execute$wbQ_enq_EN_READ ;

  assign cop$write_EN_WRITE_VALID = 1 && execute$cop_write_EN_READ_VALID;

  assign cop$write_WRITE_VALID = 1 && execute$cop_write_READ_VALID;

  assign dataQ$deq_deq_WRITE_VALID = 1 && wb$dataQ_deq_READ_VALID;

  assign dataQ$enq_enq_EN_WRITE_VALID = 1 && mod__mem___dataQ__enq__en_$OUT_READ_VALID;

  assign dataQ$enq_enq_WRITE_VALID = 1 && mod__mem___dataQ__enq__data_$OUT_READ_VALID;

  assign dataReqQ$deq_deq_WRITE_VALID = 1 && mod__mem___dataReqQ__deq__data_$OUT_READ_VALID;

  assign dataReqQ$enq_enq_EN_WRITE_VALID = 1 && execute$dataReqQ_enq_EN_READ_VALID;

  assign dataReqQ$enq_enq_WRITE_VALID = 1 && execute$dataReqQ_enq_READ_VALID;

  assign execute$cop_read_WRITE_VALID = 1 && cop$read_READ_VALID;

  assign execute$currEpoch_WRITE_VALID = 1 && fetch$currEpoch_READ_VALID;

  assign execute$dataReqQ_notFull_WRITE_VALID = 1 && dataReqQ$enq_notFull_READ_VALID;

  assign execute$instQ_first_WRITE_VALID = 1 && instQ$deq_first_READ_VALID;

  assign execute$instQ_notEmpty_WRITE_VALID = 1 && instQ$deq_notEmpty_READ_VALID;

  assign execute$pcQ_first_WRITE_VALID = 1 && pcQ$deq_first_READ_VALID;

  assign execute$pcQ_notEmpty_WRITE_VALID = 1 && pcQ$deq_notEmpty_READ_VALID;

  assign execute$regRead_0_resp_WRITE_VALID = 1 && regs$read_0_resp_READ_VALID;

  assign execute$regRead_1_resp_WRITE_VALID = 1 && regs$read_1_resp_READ_VALID;

  assign execute$wbIndex_EN_WRITE_VALID = 1 && wb$wbIndex_EN_READ_VALID;

  assign execute$wbIndex_WRITE_VALID = 1 && wb$wbIndex_READ_VALID;

  assign execute$wbQ_notFull_WRITE_VALID = 1 && wb$wb_notFull_READ_VALID;

  assign fetch$branchPc_EN_WRITE_VALID = 1 && execute$branchPc_EN_READ_VALID;

  assign fetch$branchPc_WRITE_VALID = 1 && execute$branchPc_READ_VALID;

  assign fetch$instReqQ_notFull_WRITE_VALID = 1 && instReqQ$enq_notFull_READ_VALID;

  assign fetch$pcQ_notFull_WRITE_VALID = 1 && pcQ$enq_notFull_READ_VALID;

  assign instQ$deq_deq_WRITE_VALID = 1 && execute$instQ_deq_READ_VALID;

  assign instQ$enq_enq_EN_WRITE_VALID = 1 && mod__mem___instQ__enq__en_$OUT_READ_VALID;

  assign instQ$enq_enq_WRITE_VALID = 1 && mod__mem___instQ__enq__data_$OUT_READ_VALID;

  assign instReqQ$deq_deq_WRITE_VALID = 1 && mod__mem___instReqQ__deq__data_$OUT_READ_VALID;

  assign instReqQ$enq_enq_EN_WRITE_VALID = 1 && fetch$instReqQ_enq_EN_READ_VALID;

  assign instReqQ$enq_enq_WRITE_VALID = 1 && fetch$instReqQ_enq_READ_VALID;

  assign mem_dataQ_notFull_READ_VALID = 1 && mod__mem___dataQ__notFull___data_$OUT_READ_VALID;

  assign mem_dataReqQ_first_READ_VALID = 1 && mod__mem___dataReqQ__first___data_$OUT_READ_VALID;

  assign mem_dataReqQ_notEmpty_READ_VALID = 1 && mod__mem___dataReqQ__notEmpty___data_$OUT_READ_VALID;

  assign mem_instQ_notFull_READ_VALID = 1 && mod__mem___instQ__notFull___data_$OUT_READ_VALID;

  assign mem_instReqQ_first_READ_VALID = 1 && mod__mem___instReqQ__first___data_$OUT_READ_VALID;

  assign mem_instReqQ_notEmpty_READ_VALID = 1 && mod__mem___instReqQ__notEmpty___data_$OUT_READ_VALID;

  assign mod__mem___dataQ__enq__data_$IN_EN_WRITE_VALID = 1 && mem_dataQ_enq_EN_WRITE_VALID;

  assign mod__mem___dataQ__enq__data_$IN_WRITE_VALID = 1 && mem_dataQ_enq_WRITE_VALID;

  assign mod__mem___dataQ__enq__en_$IN_EN_WRITE_VALID = 1 && mem_dataQ_enq_EN_WRITE_VALID;

  assign mod__mem___dataQ__notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mem___dataQ__notFull___data_$IN_WRITE_VALID = 1 && dataQ$enq_notFull_READ_VALID;

  assign mod__mem___dataReqQ__deq__data_$IN_EN_WRITE_VALID = 1 && mem_dataReqQ_deq_WRITE_VALID;

  assign mod__mem___dataReqQ__first___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mem___dataReqQ__first___data_$IN_WRITE_VALID = 1 && dataReqQ$deq_first_READ_VALID;

  assign mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mem___dataReqQ__notEmpty___data_$IN_WRITE_VALID = 1 && dataReqQ$deq_notEmpty_READ_VALID;

  assign mod__mem___instQ__enq__data_$IN_EN_WRITE_VALID = 1 && mem_instQ_enq_EN_WRITE_VALID;

  assign mod__mem___instQ__enq__data_$IN_WRITE_VALID = 1 && mem_instQ_enq_WRITE_VALID;

  assign mod__mem___instQ__enq__en_$IN_EN_WRITE_VALID = 1 && mem_instQ_enq_EN_WRITE_VALID;

  assign mod__mem___instQ__notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mem___instQ__notFull___data_$IN_WRITE_VALID = 1 && instQ$enq_notFull_READ_VALID;

  assign mod__mem___instReqQ__deq__data_$IN_EN_WRITE_VALID = 1 && mem_instReqQ_deq_WRITE_VALID;

  assign mod__mem___instReqQ__first___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mem___instReqQ__first___data_$IN_WRITE_VALID = 1 && instReqQ$deq_first_READ_VALID;

  assign mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE_VALID = 1;

  assign mod__mem___instReqQ__notEmpty___data_$IN_WRITE_VALID = 1 && instReqQ$deq_notEmpty_READ_VALID;

  assign pcQ$deq_deq_WRITE_VALID = 1 && execute$pcQ_deq_READ_VALID;

  assign pcQ$enq_enq_EN_WRITE_VALID = 1 && fetch$pcQ_enq_EN_READ_VALID;

  assign pcQ$enq_enq_WRITE_VALID = 1 && fetch$pcQ_enq_READ_VALID;

  assign regs$read_0_req_EN_WRITE_VALID = 1 && execute$regRead_0_req_EN_READ_VALID;

  assign regs$read_0_req_WRITE_VALID = 1 && execute$regRead_0_req_READ_VALID;

  assign regs$read_1_req_EN_WRITE_VALID = 1 && execute$regRead_1_req_EN_READ_VALID;

  assign regs$read_1_req_WRITE_VALID = 1 && execute$regRead_1_req_READ_VALID;

  assign regs$write_EN_WRITE_VALID = 1 && wb$regWrite_EN_READ_VALID;

  assign regs$write_WRITE_VALID = 1 && wb$regWrite_READ_VALID;

  assign wb$dataQ_first_WRITE_VALID = 1 && dataQ$deq_first_READ_VALID;

  assign wb$dataQ_notEmpty_WRITE_VALID = 1 && dataQ$deq_notEmpty_READ_VALID;

  assign wb$wb_enq_EN_WRITE_VALID = 1 && execute$wbQ_enq_EN_READ_VALID;

  assign wb$wb_enq_WRITE_VALID = 1 && execute$wbQ_enq_READ_VALID;

  assign cop$read_READ_CONSUMED = 1 && execute$cop_read_WRITE_CONSUMED;

  assign dataQ$deq_first_READ_CONSUMED = 1 && wb$dataQ_first_WRITE_CONSUMED;

  assign dataQ$deq_notEmpty_READ_CONSUMED = 1 && wb$dataQ_notEmpty_WRITE_CONSUMED;

  assign dataQ$enq_notFull_READ_CONSUMED = 1 && mod__mem___dataQ__notFull___data_$IN_WRITE_CONSUMED;

  assign dataReqQ$deq_first_READ_CONSUMED = 1 && mod__mem___dataReqQ__first___data_$IN_WRITE_CONSUMED;

  assign dataReqQ$deq_notEmpty_READ_CONSUMED = 1 && mod__mem___dataReqQ__notEmpty___data_$IN_WRITE_CONSUMED;

  assign dataReqQ$enq_notFull_READ_CONSUMED = 1 && execute$dataReqQ_notFull_WRITE_CONSUMED;

  assign execute$branchPc_EN_READ_CONSUMED = 1 && fetch$branchPc_EN_WRITE_CONSUMED;

  assign execute$branchPc_READ_CONSUMED = 1 && fetch$branchPc_WRITE_CONSUMED;

  assign execute$cop_write_EN_READ_CONSUMED = 1 && cop$write_EN_WRITE_CONSUMED;

  assign execute$cop_write_READ_CONSUMED = 1 && cop$write_WRITE_CONSUMED;

  assign execute$dataReqQ_enq_EN_READ_CONSUMED = 1 && dataReqQ$enq_enq_EN_WRITE_CONSUMED;

  assign execute$dataReqQ_enq_READ_CONSUMED = 1 && dataReqQ$enq_enq_WRITE_CONSUMED;

  assign execute$instQ_deq_READ_CONSUMED = 1 && instQ$deq_deq_WRITE_CONSUMED;

  assign execute$pcQ_deq_READ_CONSUMED = 1 && pcQ$deq_deq_WRITE_CONSUMED;

  assign execute$regRead_0_req_EN_READ_CONSUMED = 1 && regs$read_0_req_EN_WRITE_CONSUMED;

  assign execute$regRead_0_req_READ_CONSUMED = 1 && regs$read_0_req_WRITE_CONSUMED;

  assign execute$regRead_1_req_EN_READ_CONSUMED = 1 && regs$read_1_req_EN_WRITE_CONSUMED;

  assign execute$regRead_1_req_READ_CONSUMED = 1 && regs$read_1_req_WRITE_CONSUMED;

  assign execute$wbQ_enq_EN_READ_CONSUMED = 1 && wb$wb_enq_EN_WRITE_CONSUMED;

  assign execute$wbQ_enq_READ_CONSUMED = 1 && wb$wb_enq_WRITE_CONSUMED;

  assign fetch$currEpoch_READ_CONSUMED = 1 && execute$currEpoch_WRITE_CONSUMED;

  assign fetch$instReqQ_enq_EN_READ_CONSUMED = 1 && instReqQ$enq_enq_EN_WRITE_CONSUMED;

  assign fetch$instReqQ_enq_READ_CONSUMED = 1 && instReqQ$enq_enq_WRITE_CONSUMED;

  assign fetch$pcQ_enq_EN_READ_CONSUMED = 1 && pcQ$enq_enq_EN_WRITE_CONSUMED;

  assign fetch$pcQ_enq_READ_CONSUMED = 1 && pcQ$enq_enq_WRITE_CONSUMED;

  assign instQ$deq_first_READ_CONSUMED = 1 && execute$instQ_first_WRITE_CONSUMED;

  assign instQ$deq_notEmpty_READ_CONSUMED = 1 && execute$instQ_notEmpty_WRITE_CONSUMED;

  assign instQ$enq_notFull_READ_CONSUMED = 1 && mod__mem___instQ__notFull___data_$IN_WRITE_CONSUMED;

  assign instReqQ$deq_first_READ_CONSUMED = 1 && mod__mem___instReqQ__first___data_$IN_WRITE_CONSUMED;

  assign instReqQ$deq_notEmpty_READ_CONSUMED = 1 && mod__mem___instReqQ__notEmpty___data_$IN_WRITE_CONSUMED;

  assign instReqQ$enq_notFull_READ_CONSUMED = 1 && fetch$instReqQ_notFull_WRITE_CONSUMED;

  assign mem_dataQ_enq_EN_WRITE_CONSUMED = 1 && mod__mem___dataQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__mem___dataQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign mem_dataQ_enq_WRITE_CONSUMED = 1 && mod__mem___dataQ__enq__data_$IN_WRITE_CONSUMED;

  assign mem_dataReqQ_deq_WRITE_CONSUMED = 1 && mod__mem___dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED;

  assign mem_instQ_enq_EN_WRITE_CONSUMED = 1 && mod__mem___instQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__mem___instQ__enq__data_$IN_EN_WRITE_CONSUMED;

  assign mem_instQ_enq_WRITE_CONSUMED = 1 && mod__mem___instQ__enq__data_$IN_WRITE_CONSUMED;

  assign mem_instReqQ_deq_WRITE_CONSUMED = 1 && mod__mem___instReqQ__deq__data_$IN_EN_WRITE_CONSUMED;

  assign mod__mem___dataQ__enq__data_$OUT_READ_CONSUMED = 1 && dataQ$enq_enq_WRITE_CONSUMED;

  assign mod__mem___dataQ__enq__en_$OUT_READ_CONSUMED = 1 && dataQ$enq_enq_EN_WRITE_CONSUMED;

  assign mod__mem___dataQ__notFull___data_$OUT_READ_CONSUMED = 1 && mem_dataQ_notFull_READ_CONSUMED;

  assign mod__mem___dataReqQ__deq__data_$OUT_READ_CONSUMED = 1 && dataReqQ$deq_deq_WRITE_CONSUMED;

  assign mod__mem___dataReqQ__first___data_$OUT_READ_CONSUMED = 1 && mem_dataReqQ_first_READ_CONSUMED;

  assign mod__mem___dataReqQ__notEmpty___data_$OUT_READ_CONSUMED = 1 && mem_dataReqQ_notEmpty_READ_CONSUMED;

  assign mod__mem___instQ__enq__data_$OUT_READ_CONSUMED = 1 && instQ$enq_enq_WRITE_CONSUMED;

  assign mod__mem___instQ__enq__en_$OUT_READ_CONSUMED = 1 && instQ$enq_enq_EN_WRITE_CONSUMED;

  assign mod__mem___instQ__notFull___data_$OUT_READ_CONSUMED = 1 && mem_instQ_notFull_READ_CONSUMED;

  assign mod__mem___instReqQ__deq__data_$OUT_READ_CONSUMED = 1 && instReqQ$deq_deq_WRITE_CONSUMED;

  assign mod__mem___instReqQ__first___data_$OUT_READ_CONSUMED = 1 && mem_instReqQ_first_READ_CONSUMED;

  assign mod__mem___instReqQ__notEmpty___data_$OUT_READ_CONSUMED = 1 && mem_instReqQ_notEmpty_READ_CONSUMED;

  assign pcQ$deq_first_READ_CONSUMED = 1 && execute$pcQ_first_WRITE_CONSUMED;

  assign pcQ$deq_notEmpty_READ_CONSUMED = 1 && execute$pcQ_notEmpty_WRITE_CONSUMED;

  assign pcQ$enq_notFull_READ_CONSUMED = 1 && fetch$pcQ_notFull_WRITE_CONSUMED;

  assign regs$read_0_resp_READ_CONSUMED = 1 && execute$regRead_0_resp_WRITE_CONSUMED;

  assign regs$read_1_resp_READ_CONSUMED = 1 && execute$regRead_1_resp_WRITE_CONSUMED;

  assign wb$dataQ_deq_READ_CONSUMED = 1 && dataQ$deq_deq_WRITE_CONSUMED;

  assign wb$regWrite_EN_READ_CONSUMED = 1 && regs$write_EN_WRITE_CONSUMED;

  assign wb$regWrite_READ_CONSUMED = 1 && regs$write_WRITE_CONSUMED;

  assign wb$wbIndex_EN_READ_CONSUMED = 1 && execute$wbIndex_EN_WRITE_CONSUMED;

  assign wb$wbIndex_READ_CONSUMED = 1 && execute$wbIndex_WRITE_CONSUMED;

  assign wb$wb_notFull_READ_CONSUMED = 1 && execute$wbQ_notFull_WRITE_CONSUMED;

  mkCop cop (
    .CLK(CLK),
    .RST_N(RST_N),
    .write_WRITE(cop$write_WRITE),
    .write_EN_WRITE(cop$write_EN_WRITE),
    .read_READ(cop$read_READ),
    .write_WRITE_VALID(cop$write_WRITE_VALID),
    .write_EN_WRITE_VALID(cop$write_EN_WRITE_VALID),
    .read_READ_VALID(cop$read_READ_VALID),
    .write_WRITE_CONSUMED(cop$write_WRITE_CONSUMED),
    .write_EN_WRITE_CONSUMED(cop$write_EN_WRITE_CONSUMED),
    .read_READ_CONSUMED(cop$read_READ_CONSUMED));

  mkDataQ dataQ (
    .CLK(CLK),
    .RST_N(RST_N),
    .enq_enq_WRITE(dataQ$enq_enq_WRITE),
    .enq_enq_EN_WRITE(dataQ$enq_enq_EN_WRITE),
    .deq_deq_WRITE(dataQ$deq_deq_WRITE),
    .enq_notFull_READ(dataQ$enq_notFull_READ),
    .deq_notEmpty_READ(dataQ$deq_notEmpty_READ),
    .deq_first_READ(dataQ$deq_first_READ),
    .enq_enq_WRITE_VALID(dataQ$enq_enq_WRITE_VALID),
    .enq_enq_EN_WRITE_VALID(dataQ$enq_enq_EN_WRITE_VALID),
    .deq_deq_WRITE_VALID(dataQ$deq_deq_WRITE_VALID),
    .enq_notFull_READ_VALID(dataQ$enq_notFull_READ_VALID),
    .deq_notEmpty_READ_VALID(dataQ$deq_notEmpty_READ_VALID),
    .deq_first_READ_VALID(dataQ$deq_first_READ_VALID),
    .enq_enq_WRITE_CONSUMED(dataQ$enq_enq_WRITE_CONSUMED),
    .enq_enq_EN_WRITE_CONSUMED(dataQ$enq_enq_EN_WRITE_CONSUMED),
    .deq_deq_WRITE_CONSUMED(dataQ$deq_deq_WRITE_CONSUMED),
    .enq_notFull_READ_CONSUMED(dataQ$enq_notFull_READ_CONSUMED),
    .deq_notEmpty_READ_CONSUMED(dataQ$deq_notEmpty_READ_CONSUMED),
    .deq_first_READ_CONSUMED(dataQ$deq_first_READ_CONSUMED));

  mkDataReqQ dataReqQ (
    .CLK(CLK),
    .RST_N(RST_N),
    .enq_enq_WRITE(dataReqQ$enq_enq_WRITE),
    .enq_enq_EN_WRITE(dataReqQ$enq_enq_EN_WRITE),
    .deq_deq_WRITE(dataReqQ$deq_deq_WRITE),
    .enq_notFull_READ(dataReqQ$enq_notFull_READ),
    .deq_notEmpty_READ(dataReqQ$deq_notEmpty_READ),
    .deq_first_READ(dataReqQ$deq_first_READ),
    .enq_enq_WRITE_VALID(dataReqQ$enq_enq_WRITE_VALID),
    .enq_enq_EN_WRITE_VALID(dataReqQ$enq_enq_EN_WRITE_VALID),
    .deq_deq_WRITE_VALID(dataReqQ$deq_deq_WRITE_VALID),
    .enq_notFull_READ_VALID(dataReqQ$enq_notFull_READ_VALID),
    .deq_notEmpty_READ_VALID(dataReqQ$deq_notEmpty_READ_VALID),
    .deq_first_READ_VALID(dataReqQ$deq_first_READ_VALID),
    .enq_enq_WRITE_CONSUMED(dataReqQ$enq_enq_WRITE_CONSUMED),
    .enq_enq_EN_WRITE_CONSUMED(dataReqQ$enq_enq_EN_WRITE_CONSUMED),
    .deq_deq_WRITE_CONSUMED(dataReqQ$deq_deq_WRITE_CONSUMED),
    .enq_notFull_READ_CONSUMED(dataReqQ$enq_notFull_READ_CONSUMED),
    .deq_notEmpty_READ_CONSUMED(dataReqQ$deq_notEmpty_READ_CONSUMED),
    .deq_first_READ_CONSUMED(dataReqQ$deq_first_READ_CONSUMED));

  mkExecute execute (
    .CLK(CLK),
    .RST_N(RST_N),
    .cop_read_WRITE(execute$cop_read_WRITE),
    .currEpoch_WRITE(execute$currEpoch_WRITE),
    .dataReqQ_notFull_WRITE(execute$dataReqQ_notFull_WRITE),
    .instQ_first_WRITE(execute$instQ_first_WRITE),
    .instQ_notEmpty_WRITE(execute$instQ_notEmpty_WRITE),
    .pcQ_first_WRITE(execute$pcQ_first_WRITE),
    .pcQ_notEmpty_WRITE(execute$pcQ_notEmpty_WRITE),
    .regRead_0_resp_WRITE(execute$regRead_0_resp_WRITE),
    .regRead_1_resp_WRITE(execute$regRead_1_resp_WRITE),
    .wbIndex_WRITE(execute$wbIndex_WRITE),
    .wbQ_notFull_WRITE(execute$wbQ_notFull_WRITE),
    .wbIndex_EN_WRITE(execute$wbIndex_EN_WRITE),
    .pcQ_deq_READ(execute$pcQ_deq_READ),
    .instQ_deq_READ(execute$instQ_deq_READ),
    .dataReqQ_enq_READ(execute$dataReqQ_enq_READ),
    .dataReqQ_enq_EN_READ(execute$dataReqQ_enq_EN_READ),
    .regRead_0_req_READ(execute$regRead_0_req_READ),
    .regRead_0_req_EN_READ(execute$regRead_0_req_EN_READ),
    .regRead_1_req_READ(execute$regRead_1_req_READ),
    .regRead_1_req_EN_READ(execute$regRead_1_req_EN_READ),
    .wbQ_enq_READ(execute$wbQ_enq_READ),
    .wbQ_enq_EN_READ(execute$wbQ_enq_EN_READ),
    .branchPc_READ(execute$branchPc_READ),
    .branchPc_EN_READ(execute$branchPc_EN_READ),
    .cop_write_READ(execute$cop_write_READ),
    .cop_write_EN_READ(execute$cop_write_EN_READ),
    .cop_read_WRITE_VALID(execute$cop_read_WRITE_VALID),
    .currEpoch_WRITE_VALID(execute$currEpoch_WRITE_VALID),
    .dataReqQ_notFull_WRITE_VALID(execute$dataReqQ_notFull_WRITE_VALID),
    .instQ_first_WRITE_VALID(execute$instQ_first_WRITE_VALID),
    .instQ_notEmpty_WRITE_VALID(execute$instQ_notEmpty_WRITE_VALID),
    .pcQ_first_WRITE_VALID(execute$pcQ_first_WRITE_VALID),
    .pcQ_notEmpty_WRITE_VALID(execute$pcQ_notEmpty_WRITE_VALID),
    .regRead_0_resp_WRITE_VALID(execute$regRead_0_resp_WRITE_VALID),
    .regRead_1_resp_WRITE_VALID(execute$regRead_1_resp_WRITE_VALID),
    .wbIndex_WRITE_VALID(execute$wbIndex_WRITE_VALID),
    .wbQ_notFull_WRITE_VALID(execute$wbQ_notFull_WRITE_VALID),
    .wbIndex_EN_WRITE_VALID(execute$wbIndex_EN_WRITE_VALID),
    .pcQ_deq_READ_VALID(execute$pcQ_deq_READ_VALID),
    .instQ_deq_READ_VALID(execute$instQ_deq_READ_VALID),
    .dataReqQ_enq_READ_VALID(execute$dataReqQ_enq_READ_VALID),
    .dataReqQ_enq_EN_READ_VALID(execute$dataReqQ_enq_EN_READ_VALID),
    .regRead_0_req_READ_VALID(execute$regRead_0_req_READ_VALID),
    .regRead_0_req_EN_READ_VALID(execute$regRead_0_req_EN_READ_VALID),
    .regRead_1_req_READ_VALID(execute$regRead_1_req_READ_VALID),
    .regRead_1_req_EN_READ_VALID(execute$regRead_1_req_EN_READ_VALID),
    .wbQ_enq_READ_VALID(execute$wbQ_enq_READ_VALID),
    .wbQ_enq_EN_READ_VALID(execute$wbQ_enq_EN_READ_VALID),
    .branchPc_READ_VALID(execute$branchPc_READ_VALID),
    .branchPc_EN_READ_VALID(execute$branchPc_EN_READ_VALID),
    .cop_write_READ_VALID(execute$cop_write_READ_VALID),
    .cop_write_EN_READ_VALID(execute$cop_write_EN_READ_VALID),
    .cop_read_WRITE_CONSUMED(execute$cop_read_WRITE_CONSUMED),
    .currEpoch_WRITE_CONSUMED(execute$currEpoch_WRITE_CONSUMED),
    .dataReqQ_notFull_WRITE_CONSUMED(execute$dataReqQ_notFull_WRITE_CONSUMED),
    .instQ_first_WRITE_CONSUMED(execute$instQ_first_WRITE_CONSUMED),
    .instQ_notEmpty_WRITE_CONSUMED(execute$instQ_notEmpty_WRITE_CONSUMED),
    .pcQ_first_WRITE_CONSUMED(execute$pcQ_first_WRITE_CONSUMED),
    .pcQ_notEmpty_WRITE_CONSUMED(execute$pcQ_notEmpty_WRITE_CONSUMED),
    .regRead_0_resp_WRITE_CONSUMED(execute$regRead_0_resp_WRITE_CONSUMED),
    .regRead_1_resp_WRITE_CONSUMED(execute$regRead_1_resp_WRITE_CONSUMED),
    .wbIndex_WRITE_CONSUMED(execute$wbIndex_WRITE_CONSUMED),
    .wbQ_notFull_WRITE_CONSUMED(execute$wbQ_notFull_WRITE_CONSUMED),
    .wbIndex_EN_WRITE_CONSUMED(execute$wbIndex_EN_WRITE_CONSUMED),
    .pcQ_deq_READ_CONSUMED(execute$pcQ_deq_READ_CONSUMED),
    .instQ_deq_READ_CONSUMED(execute$instQ_deq_READ_CONSUMED),
    .dataReqQ_enq_READ_CONSUMED(execute$dataReqQ_enq_READ_CONSUMED),
    .dataReqQ_enq_EN_READ_CONSUMED(execute$dataReqQ_enq_EN_READ_CONSUMED),
    .regRead_0_req_READ_CONSUMED(execute$regRead_0_req_READ_CONSUMED),
    .regRead_0_req_EN_READ_CONSUMED(execute$regRead_0_req_EN_READ_CONSUMED),
    .regRead_1_req_READ_CONSUMED(execute$regRead_1_req_READ_CONSUMED),
    .regRead_1_req_EN_READ_CONSUMED(execute$regRead_1_req_EN_READ_CONSUMED),
    .wbQ_enq_READ_CONSUMED(execute$wbQ_enq_READ_CONSUMED),
    .wbQ_enq_EN_READ_CONSUMED(execute$wbQ_enq_EN_READ_CONSUMED),
    .branchPc_READ_CONSUMED(execute$branchPc_READ_CONSUMED),
    .branchPc_EN_READ_CONSUMED(execute$branchPc_EN_READ_CONSUMED),
    .cop_write_READ_CONSUMED(execute$cop_write_READ_CONSUMED),
    .cop_write_EN_READ_CONSUMED(execute$cop_write_EN_READ_CONSUMED));

  mkFetch fetch (
    .CLK(CLK),
    .RST_N(RST_N),
    .branchPc_WRITE(fetch$branchPc_WRITE),
    .instReqQ_notFull_WRITE(fetch$instReqQ_notFull_WRITE),
    .pcQ_notFull_WRITE(fetch$pcQ_notFull_WRITE),
    .branchPc_EN_WRITE(fetch$branchPc_EN_WRITE),
    .currEpoch_READ(fetch$currEpoch_READ),
    .pcQ_enq_READ(fetch$pcQ_enq_READ),
    .pcQ_enq_EN_READ(fetch$pcQ_enq_EN_READ),
    .instReqQ_enq_READ(fetch$instReqQ_enq_READ),
    .instReqQ_enq_EN_READ(fetch$instReqQ_enq_EN_READ),
    .branchPc_WRITE_VALID(fetch$branchPc_WRITE_VALID),
    .instReqQ_notFull_WRITE_VALID(fetch$instReqQ_notFull_WRITE_VALID),
    .pcQ_notFull_WRITE_VALID(fetch$pcQ_notFull_WRITE_VALID),
    .branchPc_EN_WRITE_VALID(fetch$branchPc_EN_WRITE_VALID),
    .currEpoch_READ_VALID(fetch$currEpoch_READ_VALID),
    .pcQ_enq_READ_VALID(fetch$pcQ_enq_READ_VALID),
    .pcQ_enq_EN_READ_VALID(fetch$pcQ_enq_EN_READ_VALID),
    .instReqQ_enq_READ_VALID(fetch$instReqQ_enq_READ_VALID),
    .instReqQ_enq_EN_READ_VALID(fetch$instReqQ_enq_EN_READ_VALID),
    .branchPc_WRITE_CONSUMED(fetch$branchPc_WRITE_CONSUMED),
    .instReqQ_notFull_WRITE_CONSUMED(fetch$instReqQ_notFull_WRITE_CONSUMED),
    .pcQ_notFull_WRITE_CONSUMED(fetch$pcQ_notFull_WRITE_CONSUMED),
    .branchPc_EN_WRITE_CONSUMED(fetch$branchPc_EN_WRITE_CONSUMED),
    .currEpoch_READ_CONSUMED(fetch$currEpoch_READ_CONSUMED),
    .pcQ_enq_READ_CONSUMED(fetch$pcQ_enq_READ_CONSUMED),
    .pcQ_enq_EN_READ_CONSUMED(fetch$pcQ_enq_EN_READ_CONSUMED),
    .instReqQ_enq_READ_CONSUMED(fetch$instReqQ_enq_READ_CONSUMED),
    .instReqQ_enq_EN_READ_CONSUMED(fetch$instReqQ_enq_EN_READ_CONSUMED));

  mkInstQ instQ (
    .CLK(CLK),
    .RST_N(RST_N),
    .enq_enq_WRITE(instQ$enq_enq_WRITE),
    .enq_enq_EN_WRITE(instQ$enq_enq_EN_WRITE),
    .deq_deq_WRITE(instQ$deq_deq_WRITE),
    .enq_notFull_READ(instQ$enq_notFull_READ),
    .deq_notEmpty_READ(instQ$deq_notEmpty_READ),
    .deq_first_READ(instQ$deq_first_READ),
    .enq_enq_WRITE_VALID(instQ$enq_enq_WRITE_VALID),
    .enq_enq_EN_WRITE_VALID(instQ$enq_enq_EN_WRITE_VALID),
    .deq_deq_WRITE_VALID(instQ$deq_deq_WRITE_VALID),
    .enq_notFull_READ_VALID(instQ$enq_notFull_READ_VALID),
    .deq_notEmpty_READ_VALID(instQ$deq_notEmpty_READ_VALID),
    .deq_first_READ_VALID(instQ$deq_first_READ_VALID),
    .enq_enq_WRITE_CONSUMED(instQ$enq_enq_WRITE_CONSUMED),
    .enq_enq_EN_WRITE_CONSUMED(instQ$enq_enq_EN_WRITE_CONSUMED),
    .deq_deq_WRITE_CONSUMED(instQ$deq_deq_WRITE_CONSUMED),
    .enq_notFull_READ_CONSUMED(instQ$enq_notFull_READ_CONSUMED),
    .deq_notEmpty_READ_CONSUMED(instQ$deq_notEmpty_READ_CONSUMED),
    .deq_first_READ_CONSUMED(instQ$deq_first_READ_CONSUMED));

  mkInstReqQ instReqQ (
    .CLK(CLK),
    .RST_N(RST_N),
    .enq_enq_WRITE(instReqQ$enq_enq_WRITE),
    .enq_enq_EN_WRITE(instReqQ$enq_enq_EN_WRITE),
    .deq_deq_WRITE(instReqQ$deq_deq_WRITE),
    .enq_notFull_READ(instReqQ$enq_notFull_READ),
    .deq_notEmpty_READ(instReqQ$deq_notEmpty_READ),
    .deq_first_READ(instReqQ$deq_first_READ),
    .enq_enq_WRITE_VALID(instReqQ$enq_enq_WRITE_VALID),
    .enq_enq_EN_WRITE_VALID(instReqQ$enq_enq_EN_WRITE_VALID),
    .deq_deq_WRITE_VALID(instReqQ$deq_deq_WRITE_VALID),
    .enq_notFull_READ_VALID(instReqQ$enq_notFull_READ_VALID),
    .deq_notEmpty_READ_VALID(instReqQ$deq_notEmpty_READ_VALID),
    .deq_first_READ_VALID(instReqQ$deq_first_READ_VALID),
    .enq_enq_WRITE_CONSUMED(instReqQ$enq_enq_WRITE_CONSUMED),
    .enq_enq_EN_WRITE_CONSUMED(instReqQ$enq_enq_EN_WRITE_CONSUMED),
    .deq_deq_WRITE_CONSUMED(instReqQ$deq_deq_WRITE_CONSUMED),
    .enq_notFull_READ_CONSUMED(instReqQ$enq_notFull_READ_CONSUMED),
    .deq_notEmpty_READ_CONSUMED(instReqQ$deq_notEmpty_READ_CONSUMED),
    .deq_first_READ_CONSUMED(instReqQ$deq_first_READ_CONSUMED));

  mkWire#(32'd32) mod__mem___dataQ__enq__data_ (
    .IN_WRITE(mod__mem___dataQ__enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___dataQ__enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___dataQ__enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___dataQ__enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___dataQ__enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___dataQ__enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___dataQ__enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___dataQ__enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___dataQ__enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__mem___dataQ__enq__en_ (
    .IN_EN_WRITE(mod__mem___dataQ__enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__mem___dataQ__enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__mem___dataQ__enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___dataQ__enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__mem___dataQ__enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___dataQ__enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__mem___dataQ__notFull___data_ (
    .IN_WRITE(mod__mem___dataQ__notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___dataQ__notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___dataQ__notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___dataQ__notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___dataQ__notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___dataQ__notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___dataQ__notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___dataQ__notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___dataQ__notFull___data_$OUT_READ_CONSUMED));

  mkPulse mod__mem___dataReqQ__deq__data_ (
    .IN_EN_WRITE(mod__mem___dataReqQ__deq__data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___dataReqQ__deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__mem___dataReqQ__deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___dataReqQ__deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__mem___dataReqQ__deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___dataReqQ__deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd65) mod__mem___dataReqQ__first___data_ (
    .IN_WRITE(mod__mem___dataReqQ__first___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___dataReqQ__first___data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___dataReqQ__first___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___dataReqQ__first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___dataReqQ__first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___dataReqQ__first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___dataReqQ__first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___dataReqQ__first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___dataReqQ__first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__mem___dataReqQ__notEmpty___data_ (
    .IN_WRITE(mod__mem___dataReqQ__notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___dataReqQ__notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___dataReqQ__notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___dataReqQ__notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___dataReqQ__notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___dataReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___dataReqQ__notEmpty___data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__mem___instQ__enq__data_ (
    .IN_WRITE(mod__mem___instQ__enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___instQ__enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___instQ__enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___instQ__enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___instQ__enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___instQ__enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___instQ__enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___instQ__enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___instQ__enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__mem___instQ__enq__en_ (
    .IN_EN_WRITE(mod__mem___instQ__enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__mem___instQ__enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__mem___instQ__enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___instQ__enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__mem___instQ__enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___instQ__enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__mem___instQ__notFull___data_ (
    .IN_WRITE(mod__mem___instQ__notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___instQ__notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___instQ__notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___instQ__notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___instQ__notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___instQ__notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___instQ__notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___instQ__notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___instQ__notFull___data_$OUT_READ_CONSUMED));

  mkPulse mod__mem___instReqQ__deq__data_ (
    .IN_EN_WRITE(mod__mem___instReqQ__deq__data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___instReqQ__deq__data_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__mem___instReqQ__deq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___instReqQ__deq__data_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__mem___instReqQ__deq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___instReqQ__deq__data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__mem___instReqQ__first___data_ (
    .IN_WRITE(mod__mem___instReqQ__first___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___instReqQ__first___data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___instReqQ__first___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___instReqQ__first___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___instReqQ__first___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___instReqQ__first___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___instReqQ__first___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___instReqQ__first___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___instReqQ__first___data_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__mem___instReqQ__notEmpty___data_ (
    .IN_WRITE(mod__mem___instReqQ__notEmpty___data_$IN_WRITE),
    .IN_EN_WRITE(mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE),
    .OUT_READ(mod__mem___instReqQ__notEmpty___data_$OUT_READ),
    .IN_WRITE_VALID(mod__mem___instReqQ__notEmpty___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__mem___instReqQ__notEmpty___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__mem___instReqQ__notEmpty___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__mem___instReqQ__notEmpty___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__mem___instReqQ__notEmpty___data_$OUT_READ_CONSUMED));

  mkPcQ pcQ (
    .CLK(CLK),
    .RST_N(RST_N),
    .enq_enq_WRITE(pcQ$enq_enq_WRITE),
    .enq_enq_EN_WRITE(pcQ$enq_enq_EN_WRITE),
    .deq_deq_WRITE(pcQ$deq_deq_WRITE),
    .enq_notFull_READ(pcQ$enq_notFull_READ),
    .deq_notEmpty_READ(pcQ$deq_notEmpty_READ),
    .deq_first_READ(pcQ$deq_first_READ),
    .enq_enq_WRITE_VALID(pcQ$enq_enq_WRITE_VALID),
    .enq_enq_EN_WRITE_VALID(pcQ$enq_enq_EN_WRITE_VALID),
    .deq_deq_WRITE_VALID(pcQ$deq_deq_WRITE_VALID),
    .enq_notFull_READ_VALID(pcQ$enq_notFull_READ_VALID),
    .deq_notEmpty_READ_VALID(pcQ$deq_notEmpty_READ_VALID),
    .deq_first_READ_VALID(pcQ$deq_first_READ_VALID),
    .enq_enq_WRITE_CONSUMED(pcQ$enq_enq_WRITE_CONSUMED),
    .enq_enq_EN_WRITE_CONSUMED(pcQ$enq_enq_EN_WRITE_CONSUMED),
    .deq_deq_WRITE_CONSUMED(pcQ$deq_deq_WRITE_CONSUMED),
    .enq_notFull_READ_CONSUMED(pcQ$enq_notFull_READ_CONSUMED),
    .deq_notEmpty_READ_CONSUMED(pcQ$deq_notEmpty_READ_CONSUMED),
    .deq_first_READ_CONSUMED(pcQ$deq_first_READ_CONSUMED));

  mkRegisters regs (
    .CLK(CLK),
    .RST_N(RST_N),
    .read_0_req_WRITE(regs$read_0_req_WRITE),
    .read_1_req_WRITE(regs$read_1_req_WRITE),
    .write_WRITE(regs$write_WRITE),
    .read_0_req_EN_WRITE(regs$read_0_req_EN_WRITE),
    .read_1_req_EN_WRITE(regs$read_1_req_EN_WRITE),
    .write_EN_WRITE(regs$write_EN_WRITE),
    .read_0_resp_READ(regs$read_0_resp_READ),
    .read_1_resp_READ(regs$read_1_resp_READ),
    .read_0_req_WRITE_VALID(regs$read_0_req_WRITE_VALID),
    .read_1_req_WRITE_VALID(regs$read_1_req_WRITE_VALID),
    .write_WRITE_VALID(regs$write_WRITE_VALID),
    .read_0_req_EN_WRITE_VALID(regs$read_0_req_EN_WRITE_VALID),
    .read_1_req_EN_WRITE_VALID(regs$read_1_req_EN_WRITE_VALID),
    .write_EN_WRITE_VALID(regs$write_EN_WRITE_VALID),
    .read_0_resp_READ_VALID(regs$read_0_resp_READ_VALID),
    .read_1_resp_READ_VALID(regs$read_1_resp_READ_VALID),
    .read_0_req_WRITE_CONSUMED(regs$read_0_req_WRITE_CONSUMED),
    .read_1_req_WRITE_CONSUMED(regs$read_1_req_WRITE_CONSUMED),
    .write_WRITE_CONSUMED(regs$write_WRITE_CONSUMED),
    .read_0_req_EN_WRITE_CONSUMED(regs$read_0_req_EN_WRITE_CONSUMED),
    .read_1_req_EN_WRITE_CONSUMED(regs$read_1_req_EN_WRITE_CONSUMED),
    .write_EN_WRITE_CONSUMED(regs$write_EN_WRITE_CONSUMED),
    .read_0_resp_READ_CONSUMED(regs$read_0_resp_READ_CONSUMED),
    .read_1_resp_READ_CONSUMED(regs$read_1_resp_READ_CONSUMED));

  mkWriteback wb (
    .CLK(CLK),
    .RST_N(RST_N),
    .dataQ_first_WRITE(wb$dataQ_first_WRITE),
    .dataQ_notEmpty_WRITE(wb$dataQ_notEmpty_WRITE),
    .wb_enq_WRITE(wb$wb_enq_WRITE),
    .wb_enq_EN_WRITE(wb$wb_enq_EN_WRITE),
    .wb_notFull_READ(wb$wb_notFull_READ),
    .wbIndex_READ(wb$wbIndex_READ),
    .wbIndex_EN_READ(wb$wbIndex_EN_READ),
    .dataQ_deq_READ(wb$dataQ_deq_READ),
    .regWrite_READ(wb$regWrite_READ),
    .regWrite_EN_READ(wb$regWrite_EN_READ),
    .dataQ_first_WRITE_VALID(wb$dataQ_first_WRITE_VALID),
    .dataQ_notEmpty_WRITE_VALID(wb$dataQ_notEmpty_WRITE_VALID),
    .wb_enq_WRITE_VALID(wb$wb_enq_WRITE_VALID),
    .wb_enq_EN_WRITE_VALID(wb$wb_enq_EN_WRITE_VALID),
    .wb_notFull_READ_VALID(wb$wb_notFull_READ_VALID),
    .wbIndex_READ_VALID(wb$wbIndex_READ_VALID),
    .wbIndex_EN_READ_VALID(wb$wbIndex_EN_READ_VALID),
    .dataQ_deq_READ_VALID(wb$dataQ_deq_READ_VALID),
    .regWrite_READ_VALID(wb$regWrite_READ_VALID),
    .regWrite_EN_READ_VALID(wb$regWrite_EN_READ_VALID),
    .dataQ_first_WRITE_CONSUMED(wb$dataQ_first_WRITE_CONSUMED),
    .dataQ_notEmpty_WRITE_CONSUMED(wb$dataQ_notEmpty_WRITE_CONSUMED),
    .wb_enq_WRITE_CONSUMED(wb$wb_enq_WRITE_CONSUMED),
    .wb_enq_EN_WRITE_CONSUMED(wb$wb_enq_EN_WRITE_CONSUMED),
    .wb_notFull_READ_CONSUMED(wb$wb_notFull_READ_CONSUMED),
    .wbIndex_READ_CONSUMED(wb$wbIndex_READ_CONSUMED),
    .wbIndex_EN_READ_CONSUMED(wb$wbIndex_EN_READ_CONSUMED),
    .dataQ_deq_READ_CONSUMED(wb$dataQ_deq_READ_CONSUMED),
    .regWrite_READ_CONSUMED(wb$regWrite_READ_CONSUMED),
    .regWrite_EN_READ_CONSUMED(wb$regWrite_EN_READ_CONSUMED));
endmodule
