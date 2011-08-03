`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkFetch(
  CLK,
  RST_N,
  currEpoch_READ,
  pcQ_notFull_WRITE,
  pcQ_enq_READ,
  pcQ_enq_EN_READ,
  instReqQ_notFull_WRITE,
  instReqQ_enq_READ,
  instReqQ_enq_EN_READ,
  branchPc_WRITE,
  branchPc_EN_WRITE,
  currEpoch_READ_VALID,
  pcQ_notFull_WRITE_VALID,
  pcQ_enq_READ_VALID,
  pcQ_enq_EN_READ_VALID,
  instReqQ_notFull_WRITE_VALID,
  instReqQ_enq_READ_VALID,
  instReqQ_enq_EN_READ_VALID,
  branchPc_WRITE_VALID,
  branchPc_EN_WRITE_VALID,
  currEpoch_READ_CONSUMED,
  pcQ_notFull_WRITE_CONSUMED,
  pcQ_enq_READ_CONSUMED,
  pcQ_enq_EN_READ_CONSUMED,
  instReqQ_notFull_WRITE_CONSUMED,
  instReqQ_enq_READ_CONSUMED,
  instReqQ_enq_EN_READ_CONSUMED,
  branchPc_WRITE_CONSUMED,
  branchPc_EN_WRITE_CONSUMED);

  input  pcQ_notFull_WRITE_VALID;
  input  instReqQ_notFull_WRITE_VALID;
  input  branchPc_WRITE_VALID;
  input  branchPc_EN_WRITE_VALID;
  input  currEpoch_READ_CONSUMED;
  input  pcQ_enq_READ_CONSUMED;
  input  pcQ_enq_EN_READ_CONSUMED;
  input  instReqQ_enq_READ_CONSUMED;
  input  instReqQ_enq_EN_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input  pcQ_notFull_WRITE;
  input  instReqQ_notFull_WRITE;
  input [31 : 0] branchPc_WRITE;
  input  branchPc_EN_WRITE;
  output  pcQ_notFull_WRITE_CONSUMED;
  output  instReqQ_notFull_WRITE_CONSUMED;
  output  branchPc_WRITE_CONSUMED;
  output  branchPc_EN_WRITE_CONSUMED;
  output  currEpoch_READ_VALID;
  output  pcQ_enq_READ_VALID;
  output  pcQ_enq_EN_READ_VALID;
  output  instReqQ_enq_READ_VALID;
  output  instReqQ_enq_EN_READ_VALID;
  output  currEpoch_READ;
  output [32 : 0] pcQ_enq_READ;
  output  pcQ_enq_EN_READ;
  output [31 : 0] instReqQ_enq_READ;
  output  instReqQ_enq_EN_READ;
  wire [32 : 0] pcQ_enq_READ;
  wire [31 : 0] instReqQ_enq_READ;
  wire  currEpoch_READ, instReqQ_enq_EN_READ, pcQ_enq_EN_READ;
  wire  epoch$IN_EN_WRITE, epoch$IN_WRITE, epoch$OUT_READ;
  wire  fired$IN_EN_WRITE, fired$OUT_READ;
  wire [31 : 0] mod__branchPc___data_$IN_WRITE, mod__branchPc___data_$OUT_READ;
  wire  mod__branchPc___data_$IN_EN_WRITE;
  wire  mod__branchPc___en_$IN_EN_WRITE, mod__branchPc___en_$OUT_READ;
  wire  mod__currEpoch__data_$IN_EN_WRITE, mod__currEpoch__data_$IN_WRITE, mod__currEpoch__data_$OUT_READ;
  wire [31 : 0] mod__instReqQ__enq__data_$IN_WRITE, mod__instReqQ__enq__data_$OUT_READ;
  wire  mod__instReqQ__enq__data_$IN_EN_WRITE;
  wire  mod__instReqQ__enq__en_$IN_EN_WRITE, mod__instReqQ__enq__en_$OUT_READ;
  wire  mod__instReqQ__notFull___data_$IN_EN_WRITE, mod__instReqQ__notFull___data_$IN_WRITE, mod__instReqQ__notFull___data_$OUT_READ;
  wire [32 : 0] mod__pcQ__enq__data_$IN_WRITE, mod__pcQ__enq__data_$OUT_READ;
  wire  mod__pcQ__enq__data_$IN_EN_WRITE;
  wire  mod__pcQ__enq__en_$IN_EN_WRITE, mod__pcQ__enq__en_$OUT_READ;
  wire  mod__pcQ__notFull___data_$IN_EN_WRITE, mod__pcQ__notFull___data_$IN_WRITE, mod__pcQ__notFull___data_$OUT_READ;
  wire [31 : 0] pc$IN_WRITE, pc$OUT_READ;
  wire  pc$IN_EN_WRITE;
  wire [31 : 0] x_pc__h656;
  wire  branchPc_EN_WRITE_VALID;
  wire  branchPc_WRITE_VALID;
  wire  currEpoch_READ_VALID;
  wire  epoch$IN_EN_WRITE_VALID;
  wire  epoch$IN_WRITE_VALID;
  wire  epoch$OUT_READ_VALID;
  wire  fired$IN_EN_WRITE_VALID;
  wire  fired$OUT_READ_VALID;
  wire  instReqQ_enq_EN_READ_VALID;
  wire  instReqQ_enq_READ_VALID;
  wire  instReqQ_notFull_WRITE_VALID;
  wire  mod__branchPc___data_$IN_EN_WRITE_VALID;
  wire  mod__branchPc___data_$IN_WRITE_VALID;
  wire  mod__branchPc___data_$OUT_READ_VALID;
  wire  mod__branchPc___en_$IN_EN_WRITE_VALID;
  wire  mod__branchPc___en_$OUT_READ_VALID;
  wire  mod__currEpoch__data_$IN_EN_WRITE_VALID;
  wire  mod__currEpoch__data_$IN_WRITE_VALID;
  wire  mod__currEpoch__data_$OUT_READ_VALID;
  wire  mod__instReqQ__enq__data_$IN_EN_WRITE_VALID;
  wire  mod__instReqQ__enq__data_$IN_WRITE_VALID;
  wire  mod__instReqQ__enq__data_$OUT_READ_VALID;
  wire  mod__instReqQ__enq__en_$IN_EN_WRITE_VALID;
  wire  mod__instReqQ__enq__en_$OUT_READ_VALID;
  wire  mod__instReqQ__notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__instReqQ__notFull___data_$IN_WRITE_VALID;
  wire  mod__instReqQ__notFull___data_$OUT_READ_VALID;
  wire  mod__pcQ__enq__data_$IN_EN_WRITE_VALID;
  wire  mod__pcQ__enq__data_$IN_WRITE_VALID;
  wire  mod__pcQ__enq__data_$OUT_READ_VALID;
  wire  mod__pcQ__enq__en_$IN_EN_WRITE_VALID;
  wire  mod__pcQ__enq__en_$OUT_READ_VALID;
  wire  mod__pcQ__notFull___data_$IN_EN_WRITE_VALID;
  wire  mod__pcQ__notFull___data_$IN_WRITE_VALID;
  wire  mod__pcQ__notFull___data_$OUT_READ_VALID;
  wire  pc$IN_EN_WRITE_VALID;
  wire  pc$IN_WRITE_VALID;
  wire  pc$OUT_READ_VALID;
  wire  pcQ_enq_EN_READ_VALID;
  wire  pcQ_enq_READ_VALID;
  wire  pcQ_notFull_WRITE_VALID;
  wire  branchPc_EN_WRITE_CONSUMED;
  wire  branchPc_WRITE_CONSUMED;
  wire  currEpoch_READ_CONSUMED;
  wire  epoch$IN_EN_WRITE_CONSUMED;
  wire  epoch$IN_WRITE_CONSUMED;
  wire  epoch$OUT_READ_CONSUMED;
  wire  fired$IN_EN_WRITE_CONSUMED;
  wire  fired$OUT_READ_CONSUMED;
  wire  instReqQ_enq_EN_READ_CONSUMED;
  wire  instReqQ_enq_READ_CONSUMED;
  wire  instReqQ_notFull_WRITE_CONSUMED;
  wire  mod__branchPc___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__branchPc___data_$IN_WRITE_CONSUMED;
  wire  mod__branchPc___data_$OUT_READ_CONSUMED;
  wire  mod__branchPc___en_$IN_EN_WRITE_CONSUMED;
  wire  mod__branchPc___en_$OUT_READ_CONSUMED;
  wire  mod__currEpoch__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__currEpoch__data_$IN_WRITE_CONSUMED;
  wire  mod__currEpoch__data_$OUT_READ_CONSUMED;
  wire  mod__instReqQ__enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instReqQ__enq__data_$IN_WRITE_CONSUMED;
  wire  mod__instReqQ__enq__data_$OUT_READ_CONSUMED;
  wire  mod__instReqQ__enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__instReqQ__enq__en_$OUT_READ_CONSUMED;
  wire  mod__instReqQ__notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__instReqQ__notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__instReqQ__notFull___data_$OUT_READ_CONSUMED;
  wire  mod__pcQ__enq__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__pcQ__enq__data_$IN_WRITE_CONSUMED;
  wire  mod__pcQ__enq__data_$OUT_READ_CONSUMED;
  wire  mod__pcQ__enq__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__pcQ__enq__en_$OUT_READ_CONSUMED;
  wire  mod__pcQ__notFull___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__pcQ__notFull___data_$IN_WRITE_CONSUMED;
  wire  mod__pcQ__notFull___data_$OUT_READ_CONSUMED;
  wire  pc$IN_EN_WRITE_CONSUMED;
  wire  pc$IN_WRITE_CONSUMED;
  wire  pc$OUT_READ_CONSUMED;
  wire  pcQ_enq_EN_READ_CONSUMED;
  wire  pcQ_enq_READ_CONSUMED;
  wire  pcQ_notFull_WRITE_CONSUMED;

  assign currEpoch_READ = mod__currEpoch__data_$OUT_READ ;

  assign pcQ_enq_READ = mod__pcQ__enq__data_$OUT_READ ;

  assign pcQ_enq_EN_READ = mod__pcQ__enq__en_$OUT_READ ;

  assign instReqQ_enq_READ = mod__instReqQ__enq__data_$OUT_READ ;

  assign instReqQ_enq_EN_READ = mod__instReqQ__enq__en_$OUT_READ ;

  assign epoch$IN_WRITE = !epoch$OUT_READ ;

  assign epoch$IN_EN_WRITE = mod__branchPc___en_$OUT_READ ;

  assign fired$IN_EN_WRITE =
	     mod__instReqQ__notFull___data_$OUT_READ &&
	     mod__pcQ__notFull___data_$OUT_READ ;

  assign mod__branchPc___data_$IN_WRITE = branchPc_WRITE ;

  assign mod__branchPc___data_$IN_EN_WRITE = branchPc_EN_WRITE ;

  assign mod__branchPc___en_$IN_EN_WRITE = branchPc_EN_WRITE ;

  assign mod__currEpoch__data_$IN_WRITE = epoch$OUT_READ ;

  assign mod__currEpoch__data_$IN_EN_WRITE = 1'd1 ;

  assign mod__instReqQ__enq__data_$IN_WRITE = pc$OUT_READ ;

  assign mod__instReqQ__enq__data_$IN_EN_WRITE =
	     mod__instReqQ__notFull___data_$OUT_READ &&
	     mod__pcQ__notFull___data_$OUT_READ ;

  assign mod__instReqQ__enq__en_$IN_EN_WRITE =
	     mod__instReqQ__notFull___data_$OUT_READ &&
	     mod__pcQ__notFull___data_$OUT_READ ;

  assign mod__instReqQ__notFull___data_$IN_WRITE = instReqQ_notFull_WRITE ;

  assign mod__instReqQ__notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__pcQ__enq__data_$IN_WRITE = { x_pc__h656, epoch$OUT_READ } ;

  assign mod__pcQ__enq__data_$IN_EN_WRITE =
	     mod__instReqQ__notFull___data_$OUT_READ &&
	     mod__pcQ__notFull___data_$OUT_READ ;

  assign mod__pcQ__enq__en_$IN_EN_WRITE =
	     mod__instReqQ__notFull___data_$OUT_READ &&
	     mod__pcQ__notFull___data_$OUT_READ ;

  assign mod__pcQ__notFull___data_$IN_WRITE = pcQ_notFull_WRITE ;

  assign mod__pcQ__notFull___data_$IN_EN_WRITE = 1'd1 ;

  assign pc$IN_WRITE =
	     mod__branchPc___en_$OUT_READ ?
	       mod__branchPc___data_$OUT_READ :
	       x_pc__h656 ;

  assign pc$IN_EN_WRITE = mod__branchPc___en_$OUT_READ || fired$OUT_READ ;

  assign x_pc__h656 = pc$OUT_READ + 32'd4 ;

  assign currEpoch_READ_VALID = 1 && mod__currEpoch__data_$OUT_READ_VALID;

  assign epoch$IN_EN_WRITE_VALID = 1 && mod__branchPc___en_$OUT_READ_VALID;

  assign epoch$IN_WRITE_VALID = 1 && epoch$OUT_READ_VALID;

  assign fired$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notFull___data_$OUT_READ_VALID && mod__pcQ__notFull___data_$OUT_READ_VALID;

  assign instReqQ_enq_EN_READ_VALID = 1 && mod__instReqQ__enq__en_$OUT_READ_VALID;

  assign instReqQ_enq_READ_VALID = 1 && mod__instReqQ__enq__data_$OUT_READ_VALID;

  assign mod__branchPc___data_$IN_EN_WRITE_VALID = 1 && branchPc_EN_WRITE_VALID;

  assign mod__branchPc___data_$IN_WRITE_VALID = 1 && branchPc_WRITE_VALID;

  assign mod__branchPc___en_$IN_EN_WRITE_VALID = 1 && branchPc_EN_WRITE_VALID;

  assign mod__currEpoch__data_$IN_EN_WRITE_VALID = 1;

  assign mod__currEpoch__data_$IN_WRITE_VALID = 1 && epoch$OUT_READ_VALID;

  assign mod__instReqQ__enq__data_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notFull___data_$OUT_READ_VALID && mod__pcQ__notFull___data_$OUT_READ_VALID;

  assign mod__instReqQ__enq__data_$IN_WRITE_VALID = 1 && pc$OUT_READ_VALID;

  assign mod__instReqQ__enq__en_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notFull___data_$OUT_READ_VALID && mod__pcQ__notFull___data_$OUT_READ_VALID;

  assign mod__instReqQ__notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__instReqQ__notFull___data_$IN_WRITE_VALID = 1 && instReqQ_notFull_WRITE_VALID;

  assign mod__pcQ__enq__data_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notFull___data_$OUT_READ_VALID && mod__pcQ__notFull___data_$OUT_READ_VALID;

  assign mod__pcQ__enq__data_$IN_WRITE_VALID = 1 && pc$OUT_READ_VALID && epoch$OUT_READ_VALID;

  assign mod__pcQ__enq__en_$IN_EN_WRITE_VALID = 1 && mod__instReqQ__notFull___data_$OUT_READ_VALID && mod__pcQ__notFull___data_$OUT_READ_VALID;

  assign mod__pcQ__notFull___data_$IN_EN_WRITE_VALID = 1;

  assign mod__pcQ__notFull___data_$IN_WRITE_VALID = 1 && pcQ_notFull_WRITE_VALID;

  assign pc$IN_EN_WRITE_VALID = 1 && mod__branchPc___en_$OUT_READ_VALID && fired$OUT_READ_VALID;

  assign pc$IN_WRITE_VALID = 1 && mod__branchPc___en_$OUT_READ_VALID && mod__branchPc___data_$OUT_READ_VALID && pc$OUT_READ_VALID;

  assign pcQ_enq_EN_READ_VALID = 1 && mod__pcQ__enq__en_$OUT_READ_VALID;

  assign pcQ_enq_READ_VALID = 1 && mod__pcQ__enq__data_$OUT_READ_VALID;

  assign branchPc_EN_WRITE_CONSUMED = 1 && mod__branchPc___en_$IN_EN_WRITE_CONSUMED && mod__branchPc___data_$IN_EN_WRITE_CONSUMED;

  assign branchPc_WRITE_CONSUMED = 1 && mod__branchPc___data_$IN_WRITE_CONSUMED;

  assign epoch$OUT_READ_CONSUMED = 1 && mod__pcQ__enq__data_$IN_WRITE_CONSUMED && mod__currEpoch__data_$IN_WRITE_CONSUMED && epoch$IN_WRITE_CONSUMED;

  assign fired$OUT_READ_CONSUMED = 1 && pc$IN_EN_WRITE_CONSUMED;

  assign instReqQ_notFull_WRITE_CONSUMED = 1 && mod__instReqQ__notFull___data_$IN_WRITE_CONSUMED;

  assign mod__branchPc___data_$OUT_READ_CONSUMED = 1 && pc$IN_WRITE_CONSUMED;

  assign mod__branchPc___en_$OUT_READ_CONSUMED = 1 && pc$IN_WRITE_CONSUMED && pc$IN_EN_WRITE_CONSUMED && epoch$IN_EN_WRITE_CONSUMED;

  assign mod__currEpoch__data_$OUT_READ_CONSUMED = 1 && currEpoch_READ_CONSUMED;

  assign mod__instReqQ__enq__data_$OUT_READ_CONSUMED = 1 && instReqQ_enq_READ_CONSUMED;

  assign mod__instReqQ__enq__en_$OUT_READ_CONSUMED = 1 && instReqQ_enq_EN_READ_CONSUMED;

  assign mod__instReqQ__notFull___data_$OUT_READ_CONSUMED = 1 && mod__pcQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__pcQ__enq__data_$IN_EN_WRITE_CONSUMED && mod__instReqQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__instReqQ__enq__data_$IN_EN_WRITE_CONSUMED && fired$IN_EN_WRITE_CONSUMED;

  assign mod__pcQ__enq__data_$OUT_READ_CONSUMED = 1 && pcQ_enq_READ_CONSUMED;

  assign mod__pcQ__enq__en_$OUT_READ_CONSUMED = 1 && pcQ_enq_EN_READ_CONSUMED;

  assign mod__pcQ__notFull___data_$OUT_READ_CONSUMED = 1 && mod__pcQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__pcQ__enq__data_$IN_EN_WRITE_CONSUMED && mod__instReqQ__enq__en_$IN_EN_WRITE_CONSUMED && mod__instReqQ__enq__data_$IN_EN_WRITE_CONSUMED && fired$IN_EN_WRITE_CONSUMED;

  assign pc$OUT_READ_CONSUMED = 1 && pc$IN_WRITE_CONSUMED && mod__pcQ__enq__data_$IN_WRITE_CONSUMED && mod__instReqQ__enq__data_$IN_WRITE_CONSUMED;

  assign pcQ_notFull_WRITE_CONSUMED = 1 && mod__pcQ__notFull___data_$IN_WRITE_CONSUMED;

  mkRegU#(32'd1) epoch (
    .CLK(CLK),
    .IN_WRITE(epoch$IN_WRITE),
    .IN_EN_WRITE(epoch$IN_EN_WRITE),
    .OUT_READ(epoch$OUT_READ),
    .IN_WRITE_VALID(epoch$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(epoch$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(epoch$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(epoch$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(epoch$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(epoch$OUT_READ_CONSUMED));

  mkPulse fired (
    .IN_EN_WRITE(fired$IN_EN_WRITE),
    .OUT_READ(fired$OUT_READ),
    .IN_EN_WRITE_VALID(fired$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(fired$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(fired$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(fired$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__branchPc___data_ (
    .IN_WRITE(mod__branchPc___data_$IN_WRITE),
    .IN_EN_WRITE(mod__branchPc___data_$IN_EN_WRITE),
    .OUT_READ(mod__branchPc___data_$OUT_READ),
    .IN_WRITE_VALID(mod__branchPc___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__branchPc___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__branchPc___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__branchPc___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__branchPc___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__branchPc___data_$OUT_READ_CONSUMED));

  mkPulse mod__branchPc___en_ (
    .IN_EN_WRITE(mod__branchPc___en_$IN_EN_WRITE),
    .OUT_READ(mod__branchPc___en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__branchPc___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__branchPc___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__branchPc___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__branchPc___en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__currEpoch__data_ (
    .IN_WRITE(mod__currEpoch__data_$IN_WRITE),
    .IN_EN_WRITE(mod__currEpoch__data_$IN_EN_WRITE),
    .OUT_READ(mod__currEpoch__data_$OUT_READ),
    .IN_WRITE_VALID(mod__currEpoch__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__currEpoch__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__currEpoch__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__currEpoch__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__currEpoch__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__currEpoch__data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__instReqQ__enq__data_ (
    .IN_WRITE(mod__instReqQ__enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__instReqQ__enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__instReqQ__enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__instReqQ__enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__instReqQ__enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instReqQ__enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__instReqQ__enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__instReqQ__enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instReqQ__enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__instReqQ__enq__en_ (
    .IN_EN_WRITE(mod__instReqQ__enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__instReqQ__enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__instReqQ__enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instReqQ__enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__instReqQ__enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instReqQ__enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__instReqQ__notFull___data_ (
    .IN_WRITE(mod__instReqQ__notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__instReqQ__notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__instReqQ__notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__instReqQ__notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__instReqQ__notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__instReqQ__notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__instReqQ__notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__instReqQ__notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__instReqQ__notFull___data_$OUT_READ_CONSUMED));

  mkWire#(32'd33) mod__pcQ__enq__data_ (
    .IN_WRITE(mod__pcQ__enq__data_$IN_WRITE),
    .IN_EN_WRITE(mod__pcQ__enq__data_$IN_EN_WRITE),
    .OUT_READ(mod__pcQ__enq__data_$OUT_READ),
    .IN_WRITE_VALID(mod__pcQ__enq__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__pcQ__enq__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__pcQ__enq__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__pcQ__enq__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__pcQ__enq__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__pcQ__enq__data_$OUT_READ_CONSUMED));

  mkPulse mod__pcQ__enq__en_ (
    .IN_EN_WRITE(mod__pcQ__enq__en_$IN_EN_WRITE),
    .OUT_READ(mod__pcQ__enq__en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__pcQ__enq__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__pcQ__enq__en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__pcQ__enq__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__pcQ__enq__en_$OUT_READ_CONSUMED));

  mkWire#(32'd1) mod__pcQ__notFull___data_ (
    .IN_WRITE(mod__pcQ__notFull___data_$IN_WRITE),
    .IN_EN_WRITE(mod__pcQ__notFull___data_$IN_EN_WRITE),
    .OUT_READ(mod__pcQ__notFull___data_$OUT_READ),
    .IN_WRITE_VALID(mod__pcQ__notFull___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__pcQ__notFull___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__pcQ__notFull___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__pcQ__notFull___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__pcQ__notFull___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__pcQ__notFull___data_$OUT_READ_CONSUMED));

  mkReg#(32'd32,  /*init*/ 32'h00001000) pc (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(pc$IN_WRITE),
    .IN_EN_WRITE(pc$IN_EN_WRITE),
    .OUT_READ(pc$OUT_READ),
    .IN_WRITE_VALID(pc$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(pc$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(pc$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(pc$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(pc$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(pc$OUT_READ_CONSUMED));
endmodule
