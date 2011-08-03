`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkTest(
  CLK,
  RST_N);

  input  CLK;
  input  RST_N;
  wire [31 : 0] x$IN_WRITE, x$OUT_READ;
  wire  x$IN_EN_WRITE;
  wire [31 : 0] y$IN_WRITE, y$OUT_READ;
  wire  y$IN_EN_WRITE;
  wire  x$IN_EN_WRITE_VALID;
  wire  x$IN_WRITE_VALID;
  wire  x$OUT_READ_VALID;
  wire  y$IN_EN_WRITE_VALID;
  wire  y$IN_WRITE_VALID;
  wire  y$OUT_READ_VALID;
  wire  x$IN_EN_WRITE_CONSUMED;
  wire  x$IN_WRITE_CONSUMED;
  wire  x$OUT_READ_CONSUMED;
  wire  y$IN_EN_WRITE_CONSUMED;
  wire  y$IN_WRITE_CONSUMED;
  wire  y$OUT_READ_CONSUMED;

  assign x$IN_WRITE = y$OUT_READ ;

  assign x$IN_EN_WRITE = 1'd1 ;

  assign y$IN_WRITE = x$OUT_READ ;

  assign y$IN_EN_WRITE = 1'd1 ;

  assign x$IN_EN_WRITE_VALID = 1;

  assign x$IN_WRITE_VALID = 1 && y$OUT_READ_VALID;

  assign y$IN_EN_WRITE_VALID = 1;

  assign y$IN_WRITE_VALID = 1 && x$OUT_READ_VALID;

  assign x$OUT_READ_CONSUMED = 1 && y$IN_WRITE_CONSUMED;

  assign y$OUT_READ_CONSUMED = 1 && x$IN_WRITE_CONSUMED;

  mkReg#(32'd32,  /*init*/ 32'd24) x (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(x$IN_WRITE),
    .IN_EN_WRITE(x$IN_EN_WRITE),
    .OUT_READ(x$OUT_READ),
    .IN_WRITE_VALID(x$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(x$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(x$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(x$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(x$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(x$OUT_READ_CONSUMED));

  mkReg#(32'd32,  /*init*/ 32'd45) y (
    .CLK(CLK),
    .RST_N(RST_N),
    .IN_WRITE(y$IN_WRITE),
    .IN_EN_WRITE(y$IN_EN_WRITE),
    .OUT_READ(y$OUT_READ),
    .IN_WRITE_VALID(y$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(y$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(y$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(y$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(y$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(y$OUT_READ_CONSUMED));

  always@(negedge CLK)
  begin
    #0;
    if(RST_N)
      if(1 && x$OUT_READ_VALID && y$OUT_READ_VALID)
        $display("%d %d", x$OUT_READ, y$OUT_READ);
  end
endmodule
