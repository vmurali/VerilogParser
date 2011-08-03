//
// Generated by Bluespec Compiler, version 2011.04.C (build 23804, 2011-04-18)
//
// On Wed Aug  3 12:04:13 EDT 2011
//
// Method conflict info:
// Method: write_write
// Conflict-free: read__read
// Conflicts: write_write
//
// Method: read__read
// Conflict-free: write_write, read__read
//
//
// Ports:
// Name                         I/O  size props
// read_READ                      O    32
// CLK                            I     1 clock
// RST_N                          I     1 reset
// write_WRITE                    I    37
// write_EN_WRITE                 I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkCop(CLK,
	     RST_N,

	     write_WRITE,
	     write_EN_WRITE,

	     read_READ);
  input  CLK;
  input  RST_N;

  // action method write_write
  input  [36 : 0] write_WRITE;
  input  write_EN_WRITE;

  // value method read__read
  output [31 : 0] read_READ;

  // signals for module outputs
  wire [31 : 0] read_READ;

  // ports of submodule finishReg
  wire [31 : 0] finishReg$IN_WRITE, finishReg$OUT_READ;
  wire finishReg$IN_EN_WRITE;

  // ports of submodule mod__read__data_
  wire [31 : 0] mod__read__data_$IN_WRITE, mod__read__data_$OUT_READ;
  wire mod__read__data_$IN_EN_WRITE;

  // ports of submodule mod__write___data_
  wire [36 : 0] mod__write___data_$IN_WRITE, mod__write___data_$OUT_READ;
  wire mod__write___data_$IN_EN_WRITE;

  // ports of submodule mod__write___en_
  wire mod__write___en_$IN_EN_WRITE, mod__write___en_$OUT_READ;

  // ports of submodule statsReg
  wire [31 : 0] statsReg$IN_WRITE, statsReg$OUT_READ;
  wire statsReg$IN_EN_WRITE;

  // value method read__read
  assign read_READ = mod__read__data_$OUT_READ ;

  // submodule finishReg
  mkReg #( /*width*/ 32'd32,  /*init*/ 32'd0) finishReg(.CLK(CLK),
							.RST_N(RST_N),
							.IN_WRITE(finishReg$IN_WRITE),
							.IN_EN_WRITE(finishReg$IN_EN_WRITE),
							.OUT_READ(finishReg$OUT_READ));

  // submodule mod__read__data_
  mkWire #( /*width*/ 32'd32) mod__read__data_(.IN_WRITE(mod__read__data_$IN_WRITE),
					       .IN_EN_WRITE(mod__read__data_$IN_EN_WRITE),
					       .OUT_READ(mod__read__data_$OUT_READ));

  // submodule mod__write___data_
  mkWire #( /*width*/ 32'd37) mod__write___data_(.IN_WRITE(mod__write___data_$IN_WRITE),
						 .IN_EN_WRITE(mod__write___data_$IN_EN_WRITE),
						 .OUT_READ(mod__write___data_$OUT_READ));

  // submodule mod__write___en_
  mkPulse mod__write___en_(.IN_EN_WRITE(mod__write___en_$IN_EN_WRITE),
			   .OUT_READ(mod__write___en_$OUT_READ));

  // submodule statsReg
  mkReg #( /*width*/ 32'd32,  /*init*/ 32'd0) statsReg(.CLK(CLK),
						       .RST_N(RST_N),
						       .IN_WRITE(statsReg$IN_WRITE),
						       .IN_EN_WRITE(statsReg$IN_EN_WRITE),
						       .OUT_READ(statsReg$OUT_READ));

  // submodule finishReg
  assign finishReg$IN_WRITE = mod__write___data_$OUT_READ[31:0] ;
  assign finishReg$IN_EN_WRITE =
	     mod__write___en_$OUT_READ &&
	     mod__write___data_$OUT_READ[36:32] == 5'd21 ;

  // submodule mod__read__data_
  assign mod__read__data_$IN_WRITE = statsReg$OUT_READ ;
  assign mod__read__data_$IN_EN_WRITE = 1'd1 ;

  // submodule mod__write___data_
  assign mod__write___data_$IN_WRITE = write_WRITE ;
  assign mod__write___data_$IN_EN_WRITE = write_EN_WRITE ;

  // submodule mod__write___en_
  assign mod__write___en_$IN_EN_WRITE = write_EN_WRITE ;

  // submodule statsReg
  assign statsReg$IN_WRITE = mod__write___data_$OUT_READ[31:0] ;
  assign statsReg$IN_EN_WRITE =
	     mod__write___en_$OUT_READ &&
	     mod__write___data_$OUT_READ[36:32] != 5'd21 ;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (mod__write___en_$OUT_READ &&
	  mod__write___data_$OUT_READ[36:32] == 5'd21 &&
	  mod__write___data_$OUT_READ[31:0] == 32'd1)
	$display("Passed");
    if (RST_N)
      if (mod__write___en_$OUT_READ &&
	  mod__write___data_$OUT_READ[36:32] == 5'd21 &&
	  mod__write___data_$OUT_READ[31:0] != 32'd1)
	$display("Failed");
    if (RST_N)
      if (finishReg$OUT_READ != 32'd0)
	$finish({ 30'd0, finishReg$OUT_READ[1:0] });
  end
  // synopsys translate_on
endmodule  // mkCop
