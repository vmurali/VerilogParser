`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkCop(
  CLK,
  RST_N,
  write_WRITE,
  write_EN_WRITE,
  read_READ,
  write_WRITE_VALID,
  write_EN_WRITE_VALID,
  read_READ_VALID,
  write_WRITE_CONSUMED,
  write_EN_WRITE_CONSUMED,
  read_READ_CONSUMED);

  input  write_WRITE_VALID;
  input  write_EN_WRITE_VALID;
  input  read_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input [36 : 0] write_WRITE;
  input  write_EN_WRITE;
  output  write_WRITE_CONSUMED;
  output  write_EN_WRITE_CONSUMED;
  output  read_READ_VALID;
  output [31 : 0] read_READ;
  wire [31 : 0] read_READ;
  wire [31 : 0] finishReg$IN_WRITE, finishReg$OUT_READ;
  wire  finishReg$IN_EN_WRITE;
  wire [31 : 0] mod__read__data_$IN_WRITE, mod__read__data_$OUT_READ;
  wire  mod__read__data_$IN_EN_WRITE;
  wire [36 : 0] mod__write___data_$IN_WRITE, mod__write___data_$OUT_READ;
  wire  mod__write___data_$IN_EN_WRITE;
  wire  mod__write___en_$IN_EN_WRITE, mod__write___en_$OUT_READ;
  wire [31 : 0] statsReg$IN_WRITE, statsReg$OUT_READ;
  wire  statsReg$IN_EN_WRITE;
  wire  finishReg$IN_EN_WRITE_VALID;
  wire  finishReg$IN_WRITE_VALID;
  wire  finishReg$OUT_READ_VALID;
  wire  mod__read__data_$IN_EN_WRITE_VALID;
  wire  mod__read__data_$IN_WRITE_VALID;
  wire  mod__read__data_$OUT_READ_VALID;
  wire  mod__write___data_$IN_EN_WRITE_VALID;
  wire  mod__write___data_$IN_WRITE_VALID;
  wire  mod__write___data_$OUT_READ_VALID;
  wire  mod__write___en_$IN_EN_WRITE_VALID;
  wire  mod__write___en_$OUT_READ_VALID;
  wire  read_READ_VALID;
  wire  statsReg$IN_EN_WRITE_VALID;
  wire  statsReg$IN_WRITE_VALID;
  wire  statsReg$OUT_READ_VALID;
  wire  write_EN_WRITE_VALID;
  wire  write_WRITE_VALID;
  wire  finishReg$IN_EN_WRITE_CONSUMED;
  wire  finishReg$IN_WRITE_CONSUMED;
  wire  finishReg$OUT_READ_CONSUMED;
  wire  mod__read__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__read__data_$IN_WRITE_CONSUMED;
  wire  mod__read__data_$OUT_READ_CONSUMED;
  wire  mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__write___data_$IN_WRITE_CONSUMED;
  wire  mod__write___data_$OUT_READ_CONSUMED;
  wire  mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  mod__write___en_$OUT_READ_CONSUMED;
  wire  read_READ_CONSUMED;
  wire  statsReg$IN_EN_WRITE_CONSUMED;
  wire  statsReg$IN_WRITE_CONSUMED;
  wire  statsReg$OUT_READ_CONSUMED;
  wire  write_EN_WRITE_CONSUMED;
  wire  write_WRITE_CONSUMED;

  assign read_READ = mod__read__data_$OUT_READ ;

  assign finishReg$IN_WRITE = mod__write___data_$OUT_READ[31:0] ;

  assign finishReg$IN_EN_WRITE =
	     mod__write___en_$OUT_READ &&
	     mod__write___data_$OUT_READ[36:32] == 5'd21 ;

  assign mod__read__data_$IN_WRITE = statsReg$OUT_READ ;

  assign mod__read__data_$IN_EN_WRITE = 1'd1 ;

  assign mod__write___data_$IN_WRITE = write_WRITE ;

  assign mod__write___data_$IN_EN_WRITE = write_EN_WRITE ;

  assign mod__write___en_$IN_EN_WRITE = write_EN_WRITE ;

  assign statsReg$IN_WRITE = mod__write___data_$OUT_READ[31:0] ;

  assign statsReg$IN_EN_WRITE =
	     mod__write___en_$OUT_READ &&
	     mod__write___data_$OUT_READ[36:32] != 5'd21 ;

  assign finishReg$IN_EN_WRITE_VALID = 1 && mod__write___en_$OUT_READ_VALID && mod__write___data_$OUT_READ_VALID;

  assign finishReg$IN_WRITE_VALID = 1 && mod__write___data_$OUT_READ_VALID;

  assign mod__read__data_$IN_EN_WRITE_VALID = 1;

  assign mod__read__data_$IN_WRITE_VALID = 1 && statsReg$OUT_READ_VALID;

  assign mod__write___data_$IN_EN_WRITE_VALID = 1 && write_EN_WRITE_VALID;

  assign mod__write___data_$IN_WRITE_VALID = 1 && write_WRITE_VALID;

  assign mod__write___en_$IN_EN_WRITE_VALID = 1 && write_EN_WRITE_VALID;

  assign read_READ_VALID = 1 && mod__read__data_$OUT_READ_VALID;

  assign statsReg$IN_EN_WRITE_VALID = 1 && mod__write___en_$OUT_READ_VALID && mod__write___data_$OUT_READ_VALID;

  assign statsReg$IN_WRITE_VALID = 1 && mod__write___data_$OUT_READ_VALID;

  assign mod__read__data_$OUT_READ_CONSUMED = 1 && read_READ_CONSUMED;

  assign mod__write___data_$OUT_READ_CONSUMED = 1 && statsReg$IN_WRITE_CONSUMED && statsReg$IN_EN_WRITE_CONSUMED && finishReg$IN_WRITE_CONSUMED && finishReg$IN_EN_WRITE_CONSUMED;

  assign mod__write___en_$OUT_READ_CONSUMED = 1 && statsReg$IN_EN_WRITE_CONSUMED && finishReg$IN_EN_WRITE_CONSUMED;

  assign statsReg$OUT_READ_CONSUMED = 1 && mod__read__data_$IN_WRITE_CONSUMED;

  assign write_EN_WRITE_CONSUMED = 1 && mod__write___en_$IN_EN_WRITE_CONSUMED && mod__write___data_$IN_EN_WRITE_CONSUMED;

  assign write_WRITE_CONSUMED = 1 && mod__write___data_$IN_WRITE_CONSUMED;

  mkReg#(32'd32,  /*init*/ 32'd0) finishReg (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(finishReg$IN_WRITE),
    .IN_EN_WRITE(finishReg$IN_EN_WRITE),
    .OUT_READ(finishReg$OUT_READ),
    .IN_WRITE_VALID(finishReg$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(finishReg$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(finishReg$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(finishReg$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(finishReg$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(finishReg$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__read__data_ (
    .IN_WRITE(mod__read__data_$IN_WRITE),
    .IN_EN_WRITE(mod__read__data_$IN_EN_WRITE),
    .OUT_READ(mod__read__data_$OUT_READ),
    .IN_WRITE_VALID(mod__read__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__read__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__read__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__read__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__read__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__read__data_$OUT_READ_CONSUMED));

  mkWire#(32'd37) mod__write___data_ (
    .IN_WRITE(mod__write___data_$IN_WRITE),
    .IN_EN_WRITE(mod__write___data_$IN_EN_WRITE),
    .OUT_READ(mod__write___data_$OUT_READ),
    .IN_WRITE_VALID(mod__write___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__write___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__write___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__write___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__write___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__write___data_$OUT_READ_CONSUMED));

  mkPulse mod__write___en_ (
    .IN_EN_WRITE(mod__write___en_$IN_EN_WRITE),
    .OUT_READ(mod__write___en_$OUT_READ),
    .IN_EN_WRITE_VALID(mod__write___en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__write___en_$OUT_READ_VALID),
    .IN_EN_WRITE_CONSUMED(mod__write___en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__write___en_$OUT_READ_CONSUMED));

  mkReg#(32'd32,  /*init*/ 32'd0) statsReg (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(statsReg$IN_WRITE),
    .IN_EN_WRITE(statsReg$IN_EN_WRITE),
    .OUT_READ(statsReg$OUT_READ),
    .IN_WRITE_VALID(statsReg$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(statsReg$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(statsReg$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(statsReg$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(statsReg$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(statsReg$OUT_READ_CONSUMED));

  always@(negedge CLK)
  begin
    #0;
    if(RST_N)
      if(mod__write___en_$OUT_READ &&
	  mod__write___data_$OUT_READ[36:32] == 5'd21 &&
	  mod__write___data_$OUT_READ[31:0] == 32'd1)
        $display("Passed");
    if(RST_N)
      if(mod__write___en_$OUT_READ &&
	  mod__write___data_$OUT_READ[36:32] == 5'd21 &&
	  mod__write___data_$OUT_READ[31:0] != 32'd1)
        $display("Failed");
    if(RST_N)
      if(finishReg$OUT_READ != 32'd0)
        $finish({ 30'd0, finishReg$OUT_READ[1:0] });
  end
endmodule
