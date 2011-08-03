`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkProcessor(
  CLK,
  RST_N);

  input  CLK;
  input  RST_N;
  wire [64 : 0] core$mem_dataReqQ_first_READ;
  wire [31 : 0] core$mem_dataQ_enq_WRITE, core$mem_instQ_enq_WRITE, core$mem_instReqQ_first_READ;
  wire  core$mem_dataQ_enq_EN_WRITE, core$mem_dataQ_notFull_READ, core$mem_dataReqQ_deq_WRITE, core$mem_dataReqQ_notEmpty_READ, core$mem_instQ_enq_EN_WRITE, core$mem_instQ_notFull_READ, core$mem_instReqQ_deq_WRITE, core$mem_instReqQ_notEmpty_READ;
  wire [64 : 0] mem$dataReqQ_first_WRITE;
  wire [31 : 0] mem$dataQ_enq_READ, mem$instQ_enq_READ, mem$instReqQ_first_WRITE;
  wire  mem$dataQ_enq_EN_READ, mem$dataQ_notFull_WRITE, mem$dataReqQ_deq_READ, mem$dataReqQ_notEmpty_WRITE, mem$instQ_enq_EN_READ, mem$instQ_notFull_WRITE, mem$instReqQ_deq_READ, mem$instReqQ_notEmpty_WRITE;
  wire  core$mem_dataQ_enq_EN_WRITE_VALID;
  wire  core$mem_dataQ_enq_WRITE_VALID;
  wire  core$mem_dataQ_notFull_READ_VALID;
  wire  core$mem_dataReqQ_deq_WRITE_VALID;
  wire  core$mem_dataReqQ_first_READ_VALID;
  wire  core$mem_dataReqQ_notEmpty_READ_VALID;
  wire  core$mem_instQ_enq_EN_WRITE_VALID;
  wire  core$mem_instQ_enq_WRITE_VALID;
  wire  core$mem_instQ_notFull_READ_VALID;
  wire  core$mem_instReqQ_deq_WRITE_VALID;
  wire  core$mem_instReqQ_first_READ_VALID;
  wire  core$mem_instReqQ_notEmpty_READ_VALID;
  wire  mem$dataQ_enq_EN_READ_VALID;
  wire  mem$dataQ_enq_READ_VALID;
  wire  mem$dataQ_notFull_WRITE_VALID;
  wire  mem$dataReqQ_deq_READ_VALID;
  wire  mem$dataReqQ_first_WRITE_VALID;
  wire  mem$dataReqQ_notEmpty_WRITE_VALID;
  wire  mem$instQ_enq_EN_READ_VALID;
  wire  mem$instQ_enq_READ_VALID;
  wire  mem$instQ_notFull_WRITE_VALID;
  wire  mem$instReqQ_deq_READ_VALID;
  wire  mem$instReqQ_first_WRITE_VALID;
  wire  mem$instReqQ_notEmpty_WRITE_VALID;
  wire  core$mem_dataQ_enq_EN_WRITE_CONSUMED;
  wire  core$mem_dataQ_enq_WRITE_CONSUMED;
  wire  core$mem_dataQ_notFull_READ_CONSUMED;
  wire  core$mem_dataReqQ_deq_WRITE_CONSUMED;
  wire  core$mem_dataReqQ_first_READ_CONSUMED;
  wire  core$mem_dataReqQ_notEmpty_READ_CONSUMED;
  wire  core$mem_instQ_enq_EN_WRITE_CONSUMED;
  wire  core$mem_instQ_enq_WRITE_CONSUMED;
  wire  core$mem_instQ_notFull_READ_CONSUMED;
  wire  core$mem_instReqQ_deq_WRITE_CONSUMED;
  wire  core$mem_instReqQ_first_READ_CONSUMED;
  wire  core$mem_instReqQ_notEmpty_READ_CONSUMED;
  wire  mem$dataQ_enq_EN_READ_CONSUMED;
  wire  mem$dataQ_enq_READ_CONSUMED;
  wire  mem$dataQ_notFull_WRITE_CONSUMED;
  wire  mem$dataReqQ_deq_READ_CONSUMED;
  wire  mem$dataReqQ_first_WRITE_CONSUMED;
  wire  mem$dataReqQ_notEmpty_WRITE_CONSUMED;
  wire  mem$instQ_enq_EN_READ_CONSUMED;
  wire  mem$instQ_enq_READ_CONSUMED;
  wire  mem$instQ_notFull_WRITE_CONSUMED;
  wire  mem$instReqQ_deq_READ_CONSUMED;
  wire  mem$instReqQ_first_WRITE_CONSUMED;
  wire  mem$instReqQ_notEmpty_WRITE_CONSUMED;

  assign core$mem_dataQ_enq_WRITE = mem$dataQ_enq_READ ;

  assign core$mem_instQ_enq_WRITE = mem$instQ_enq_READ ;

  assign core$mem_instReqQ_deq_WRITE = mem$instReqQ_deq_READ ;

  assign core$mem_instQ_enq_EN_WRITE = mem$instQ_enq_EN_READ ;

  assign core$mem_dataReqQ_deq_WRITE = mem$dataReqQ_deq_READ ;

  assign core$mem_dataQ_enq_EN_WRITE = mem$dataQ_enq_EN_READ ;

  assign mem$dataQ_notFull_WRITE = core$mem_dataQ_notFull_READ ;

  assign mem$dataReqQ_first_WRITE = core$mem_dataReqQ_first_READ ;

  assign mem$dataReqQ_notEmpty_WRITE = core$mem_dataReqQ_notEmpty_READ ;

  assign mem$instQ_notFull_WRITE = core$mem_instQ_notFull_READ ;

  assign mem$instReqQ_first_WRITE = core$mem_instReqQ_first_READ ;

  assign mem$instReqQ_notEmpty_WRITE = core$mem_instReqQ_notEmpty_READ ;

  assign core$mem_dataQ_enq_EN_WRITE_VALID = 1 && mem$dataQ_enq_EN_READ_VALID;

  assign core$mem_dataQ_enq_WRITE_VALID = 1 && mem$dataQ_enq_READ_VALID;

  assign core$mem_dataReqQ_deq_WRITE_VALID = 1 && mem$dataReqQ_deq_READ_VALID;

  assign core$mem_instQ_enq_EN_WRITE_VALID = 1 && mem$instQ_enq_EN_READ_VALID;

  assign core$mem_instQ_enq_WRITE_VALID = 1 && mem$instQ_enq_READ_VALID;

  assign core$mem_instReqQ_deq_WRITE_VALID = 1 && mem$instReqQ_deq_READ_VALID;

  assign mem$dataQ_notFull_WRITE_VALID = 1 && core$mem_dataQ_notFull_READ_VALID;

  assign mem$dataReqQ_first_WRITE_VALID = 1 && core$mem_dataReqQ_first_READ_VALID;

  assign mem$dataReqQ_notEmpty_WRITE_VALID = 1 && core$mem_dataReqQ_notEmpty_READ_VALID;

  assign mem$instQ_notFull_WRITE_VALID = 1 && core$mem_instQ_notFull_READ_VALID;

  assign mem$instReqQ_first_WRITE_VALID = 1 && core$mem_instReqQ_first_READ_VALID;

  assign mem$instReqQ_notEmpty_WRITE_VALID = 1 && core$mem_instReqQ_notEmpty_READ_VALID;

  assign core$mem_dataQ_notFull_READ_CONSUMED = 1 && mem$dataQ_notFull_WRITE_CONSUMED;

  assign core$mem_dataReqQ_first_READ_CONSUMED = 1 && mem$dataReqQ_first_WRITE_CONSUMED;

  assign core$mem_dataReqQ_notEmpty_READ_CONSUMED = 1 && mem$dataReqQ_notEmpty_WRITE_CONSUMED;

  assign core$mem_instQ_notFull_READ_CONSUMED = 1 && mem$instQ_notFull_WRITE_CONSUMED;

  assign core$mem_instReqQ_first_READ_CONSUMED = 1 && mem$instReqQ_first_WRITE_CONSUMED;

  assign core$mem_instReqQ_notEmpty_READ_CONSUMED = 1 && mem$instReqQ_notEmpty_WRITE_CONSUMED;

  assign mem$dataQ_enq_EN_READ_CONSUMED = 1 && core$mem_dataQ_enq_EN_WRITE_CONSUMED;

  assign mem$dataQ_enq_READ_CONSUMED = 1 && core$mem_dataQ_enq_WRITE_CONSUMED;

  assign mem$dataReqQ_deq_READ_CONSUMED = 1 && core$mem_dataReqQ_deq_WRITE_CONSUMED;

  assign mem$instQ_enq_EN_READ_CONSUMED = 1 && core$mem_instQ_enq_EN_WRITE_CONSUMED;

  assign mem$instQ_enq_READ_CONSUMED = 1 && core$mem_instQ_enq_WRITE_CONSUMED;

  assign mem$instReqQ_deq_READ_CONSUMED = 1 && core$mem_instReqQ_deq_WRITE_CONSUMED;

  mkCore core (
    .CLK(CLK),
    .RST_N(RST_N),
    .mem_dataQ_enq_WRITE(core$mem_dataQ_enq_WRITE),
    .mem_instQ_enq_WRITE(core$mem_instQ_enq_WRITE),
    .mem_instReqQ_deq_WRITE(core$mem_instReqQ_deq_WRITE),
    .mem_instQ_enq_EN_WRITE(core$mem_instQ_enq_EN_WRITE),
    .mem_dataReqQ_deq_WRITE(core$mem_dataReqQ_deq_WRITE),
    .mem_dataQ_enq_EN_WRITE(core$mem_dataQ_enq_EN_WRITE),
    .mem_instReqQ_notEmpty_READ(core$mem_instReqQ_notEmpty_READ),
    .mem_instReqQ_first_READ(core$mem_instReqQ_first_READ),
    .mem_instQ_notFull_READ(core$mem_instQ_notFull_READ),
    .mem_dataReqQ_notEmpty_READ(core$mem_dataReqQ_notEmpty_READ),
    .mem_dataReqQ_first_READ(core$mem_dataReqQ_first_READ),
    .mem_dataQ_notFull_READ(core$mem_dataQ_notFull_READ),
    .mem_dataQ_enq_WRITE_VALID(core$mem_dataQ_enq_WRITE_VALID),
    .mem_instQ_enq_WRITE_VALID(core$mem_instQ_enq_WRITE_VALID),
    .mem_instReqQ_deq_WRITE_VALID(core$mem_instReqQ_deq_WRITE_VALID),
    .mem_instQ_enq_EN_WRITE_VALID(core$mem_instQ_enq_EN_WRITE_VALID),
    .mem_dataReqQ_deq_WRITE_VALID(core$mem_dataReqQ_deq_WRITE_VALID),
    .mem_dataQ_enq_EN_WRITE_VALID(core$mem_dataQ_enq_EN_WRITE_VALID),
    .mem_instReqQ_notEmpty_READ_VALID(core$mem_instReqQ_notEmpty_READ_VALID),
    .mem_instReqQ_first_READ_VALID(core$mem_instReqQ_first_READ_VALID),
    .mem_instQ_notFull_READ_VALID(core$mem_instQ_notFull_READ_VALID),
    .mem_dataReqQ_notEmpty_READ_VALID(core$mem_dataReqQ_notEmpty_READ_VALID),
    .mem_dataReqQ_first_READ_VALID(core$mem_dataReqQ_first_READ_VALID),
    .mem_dataQ_notFull_READ_VALID(core$mem_dataQ_notFull_READ_VALID),
    .mem_dataQ_enq_WRITE_CONSUMED(core$mem_dataQ_enq_WRITE_CONSUMED),
    .mem_instQ_enq_WRITE_CONSUMED(core$mem_instQ_enq_WRITE_CONSUMED),
    .mem_instReqQ_deq_WRITE_CONSUMED(core$mem_instReqQ_deq_WRITE_CONSUMED),
    .mem_instQ_enq_EN_WRITE_CONSUMED(core$mem_instQ_enq_EN_WRITE_CONSUMED),
    .mem_dataReqQ_deq_WRITE_CONSUMED(core$mem_dataReqQ_deq_WRITE_CONSUMED),
    .mem_dataQ_enq_EN_WRITE_CONSUMED(core$mem_dataQ_enq_EN_WRITE_CONSUMED),
    .mem_instReqQ_notEmpty_READ_CONSUMED(core$mem_instReqQ_notEmpty_READ_CONSUMED),
    .mem_instReqQ_first_READ_CONSUMED(core$mem_instReqQ_first_READ_CONSUMED),
    .mem_instQ_notFull_READ_CONSUMED(core$mem_instQ_notFull_READ_CONSUMED),
    .mem_dataReqQ_notEmpty_READ_CONSUMED(core$mem_dataReqQ_notEmpty_READ_CONSUMED),
    .mem_dataReqQ_first_READ_CONSUMED(core$mem_dataReqQ_first_READ_CONSUMED),
    .mem_dataQ_notFull_READ_CONSUMED(core$mem_dataQ_notFull_READ_CONSUMED));

  mkMemory mem (
    .CLK(CLK),
    .RST_N(RST_N),
    .dataQ_notFull_WRITE(mem$dataQ_notFull_WRITE),
    .dataReqQ_first_WRITE(mem$dataReqQ_first_WRITE),
    .dataReqQ_notEmpty_WRITE(mem$dataReqQ_notEmpty_WRITE),
    .instQ_notFull_WRITE(mem$instQ_notFull_WRITE),
    .instReqQ_first_WRITE(mem$instReqQ_first_WRITE),
    .instReqQ_notEmpty_WRITE(mem$instReqQ_notEmpty_WRITE),
    .instReqQ_deq_READ(mem$instReqQ_deq_READ),
    .instQ_enq_READ(mem$instQ_enq_READ),
    .instQ_enq_EN_READ(mem$instQ_enq_EN_READ),
    .dataReqQ_deq_READ(mem$dataReqQ_deq_READ),
    .dataQ_enq_READ(mem$dataQ_enq_READ),
    .dataQ_enq_EN_READ(mem$dataQ_enq_EN_READ),
    .dataQ_notFull_WRITE_VALID(mem$dataQ_notFull_WRITE_VALID),
    .dataReqQ_first_WRITE_VALID(mem$dataReqQ_first_WRITE_VALID),
    .dataReqQ_notEmpty_WRITE_VALID(mem$dataReqQ_notEmpty_WRITE_VALID),
    .instQ_notFull_WRITE_VALID(mem$instQ_notFull_WRITE_VALID),
    .instReqQ_first_WRITE_VALID(mem$instReqQ_first_WRITE_VALID),
    .instReqQ_notEmpty_WRITE_VALID(mem$instReqQ_notEmpty_WRITE_VALID),
    .instReqQ_deq_READ_VALID(mem$instReqQ_deq_READ_VALID),
    .instQ_enq_READ_VALID(mem$instQ_enq_READ_VALID),
    .instQ_enq_EN_READ_VALID(mem$instQ_enq_EN_READ_VALID),
    .dataReqQ_deq_READ_VALID(mem$dataReqQ_deq_READ_VALID),
    .dataQ_enq_READ_VALID(mem$dataQ_enq_READ_VALID),
    .dataQ_enq_EN_READ_VALID(mem$dataQ_enq_EN_READ_VALID),
    .dataQ_notFull_WRITE_CONSUMED(mem$dataQ_notFull_WRITE_CONSUMED),
    .dataReqQ_first_WRITE_CONSUMED(mem$dataReqQ_first_WRITE_CONSUMED),
    .dataReqQ_notEmpty_WRITE_CONSUMED(mem$dataReqQ_notEmpty_WRITE_CONSUMED),
    .instQ_notFull_WRITE_CONSUMED(mem$instQ_notFull_WRITE_CONSUMED),
    .instReqQ_first_WRITE_CONSUMED(mem$instReqQ_first_WRITE_CONSUMED),
    .instReqQ_notEmpty_WRITE_CONSUMED(mem$instReqQ_notEmpty_WRITE_CONSUMED),
    .instReqQ_deq_READ_CONSUMED(mem$instReqQ_deq_READ_CONSUMED),
    .instQ_enq_READ_CONSUMED(mem$instQ_enq_READ_CONSUMED),
    .instQ_enq_EN_READ_CONSUMED(mem$instQ_enq_EN_READ_CONSUMED),
    .dataReqQ_deq_READ_CONSUMED(mem$dataReqQ_deq_READ_CONSUMED),
    .dataQ_enq_READ_CONSUMED(mem$dataQ_enq_READ_CONSUMED),
    .dataQ_enq_EN_READ_CONSUMED(mem$dataQ_enq_EN_READ_CONSUMED));
endmodule
