`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkRegisters(
  CLK,
  RST_N,
  read_0_req_WRITE,
  read_0_req_EN_WRITE,
  read_0_resp_READ,
  read_1_req_WRITE,
  read_1_req_EN_WRITE,
  read_1_resp_READ,
  write_WRITE,
  write_EN_WRITE,
  read_0_req_WRITE_VALID,
  read_0_req_EN_WRITE_VALID,
  read_0_resp_READ_VALID,
  read_1_req_WRITE_VALID,
  read_1_req_EN_WRITE_VALID,
  read_1_resp_READ_VALID,
  write_WRITE_VALID,
  write_EN_WRITE_VALID,
  read_0_req_WRITE_CONSUMED,
  read_0_req_EN_WRITE_CONSUMED,
  read_0_resp_READ_CONSUMED,
  read_1_req_WRITE_CONSUMED,
  read_1_req_EN_WRITE_CONSUMED,
  read_1_resp_READ_CONSUMED,
  write_WRITE_CONSUMED,
  write_EN_WRITE_CONSUMED);

  input  read_0_req_WRITE_VALID;
  input  read_0_req_EN_WRITE_VALID;
  input  read_1_req_WRITE_VALID;
  input  read_1_req_EN_WRITE_VALID;
  input  write_WRITE_VALID;
  input  write_EN_WRITE_VALID;
  input  read_0_resp_READ_CONSUMED;
  input  read_1_resp_READ_CONSUMED;
  input  CLK;
  input  RST_N;
  input [4 : 0] read_0_req_WRITE;
  input  read_0_req_EN_WRITE;
  input [4 : 0] read_1_req_WRITE;
  input  read_1_req_EN_WRITE;
  input [36 : 0] write_WRITE;
  input  write_EN_WRITE;
  output  read_0_req_WRITE_CONSUMED;
  output  read_0_req_EN_WRITE_CONSUMED;
  output  read_1_req_WRITE_CONSUMED;
  output  read_1_req_EN_WRITE_CONSUMED;
  output  write_WRITE_CONSUMED;
  output  write_EN_WRITE_CONSUMED;
  output  read_0_resp_READ_VALID;
  output  read_1_resp_READ_VALID;
  output [31 : 0] read_0_resp_READ;
  output [31 : 0] read_1_resp_READ;
  wire [31 : 0] read_0_resp_READ, read_1_resp_READ;
  wire [4 : 0] mod__read___req__1_data_$IN_WRITE, mod__read___req__1_data_$OUT_READ;
  wire  mod__read___req__1_data_$IN_EN_WRITE;
  wire  mod__read___req__1_en_$IN_EN_WRITE;
  wire [4 : 0] mod__read___req__data_$IN_WRITE, mod__read___req__data_$OUT_READ;
  wire  mod__read___req__data_$IN_EN_WRITE;
  wire  mod__read___req__en_$IN_EN_WRITE;
  wire [31 : 0] mod__read___resp___1_data_$IN_WRITE, mod__read___resp___1_data_$OUT_READ;
  wire  mod__read___resp___1_data_$IN_EN_WRITE;
  wire [31 : 0] mod__read___resp___data_$IN_WRITE, mod__read___resp___data_$OUT_READ;
  wire  mod__read___resp___data_$IN_EN_WRITE;
  wire [36 : 0] mod__write___data_$IN_WRITE, mod__write___data_$OUT_READ;
  wire  mod__write___data_$IN_EN_WRITE;
  wire  mod__write___en_$IN_EN_WRITE, mod__write___en_$OUT_READ;
  wire [4 : 0] regs_mod__mod__read___req__1_data_$IN_WRITE, regs_mod__mod__read___req__1_data_$OUT_READ;
  wire  regs_mod__mod__read___req__1_data_$IN_EN_WRITE;
  wire  regs_mod__mod__read___req__1_en_$IN_EN_WRITE;
  wire [4 : 0] regs_mod__mod__read___req__data_$IN_WRITE, regs_mod__mod__read___req__data_$OUT_READ;
  wire  regs_mod__mod__read___req__data_$IN_EN_WRITE;
  wire  regs_mod__mod__read___req__en_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__mod__read___resp___1_data_$IN_WRITE, regs_mod__mod__read___resp___1_data_$OUT_READ;
  wire  regs_mod__mod__read___resp___1_data_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__mod__read___resp___data_$IN_WRITE, regs_mod__mod__read___resp___data_$OUT_READ;
  wire  regs_mod__mod__read___resp___data_$IN_EN_WRITE;
  wire [36 : 0] regs_mod__mod__write___data_$IN_WRITE, regs_mod__mod__write___data_$OUT_READ;
  wire  regs_mod__mod__write___data_$IN_EN_WRITE;
  wire  regs_mod__mod__write___en_$IN_EN_WRITE, regs_mod__mod__write___en_$OUT_READ;
  wire [4 : 0] regs_mod__rf_mod__1_read___req__data_$IN_WRITE, regs_mod__rf_mod__1_read___req__data_$OUT_READ;
  wire  regs_mod__rf_mod__1_read___req__data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__1_read___req__en_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__rf_mod__1_read___resp___data_$IN_WRITE, regs_mod__rf_mod__1_read___resp___data_$OUT_READ;
  wire  regs_mod__rf_mod__1_read___resp___data_$IN_EN_WRITE;
  wire [36 : 0] regs_mod__rf_mod__1_write___data_$IN_WRITE, regs_mod__rf_mod__1_write___data_$OUT_READ;
  wire  regs_mod__rf_mod__1_write___data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__1_write___en_$IN_EN_WRITE, regs_mod__rf_mod__1_write___en_$OUT_READ;
  wire [4 : 0] regs_mod__rf_mod__read___req__data_$IN_WRITE, regs_mod__rf_mod__read___req__data_$OUT_READ;
  wire  regs_mod__rf_mod__read___req__data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__read___req__en_$IN_EN_WRITE;
  wire [31 : 0] regs_mod__rf_mod__read___resp___data_$IN_WRITE, regs_mod__rf_mod__read___resp___data_$OUT_READ;
  wire  regs_mod__rf_mod__read___resp___data_$IN_EN_WRITE;
  wire [36 : 0] regs_mod__rf_mod__write___data_$IN_WRITE, regs_mod__rf_mod__write___data_$OUT_READ;
  wire  regs_mod__rf_mod__write___data_$IN_EN_WRITE;
  wire  regs_mod__rf_mod__write___en_$IN_EN_WRITE, regs_mod__rf_mod__write___en_$OUT_READ;
  wire [31 : 0] regs_mod__rf_rf$READ_RESP_READ, regs_mod__rf_rf$WRITE_DATA_WRITE;
  wire [4 : 0] regs_mod__rf_rf$READ_REQ_WRITE, regs_mod__rf_rf$WRITE_INDEX_WRITE;
  wire  regs_mod__rf_rf$WRITE_EN_WRITE;
  wire [31 : 0] regs_mod__rf_rf_1$READ_RESP_READ, regs_mod__rf_rf_1$WRITE_DATA_WRITE;
  wire [4 : 0] regs_mod__rf_rf_1$READ_REQ_WRITE, regs_mod__rf_rf_1$WRITE_INDEX_WRITE;
  wire  regs_mod__rf_rf_1$WRITE_EN_WRITE;
  wire  regs_mod__whichReg$IN_EN_WRITE;
  wire [31 : 0] IF_mod__write___en___read__1_AND_mod__write____ETC___d28, IF_mod__write___en___read__1_AND_mod__write____ETC___d35;
  wire  mod__read___req__1_data_$IN_EN_WRITE_VALID;
  wire  mod__read___req__1_data_$IN_WRITE_VALID;
  wire  mod__read___req__1_data_$OUT_READ_VALID;
  wire  mod__read___req__1_en_$IN_EN_WRITE_VALID;
  wire  mod__read___req__data_$IN_EN_WRITE_VALID;
  wire  mod__read___req__data_$IN_WRITE_VALID;
  wire  mod__read___req__data_$OUT_READ_VALID;
  wire  mod__read___req__en_$IN_EN_WRITE_VALID;
  wire  mod__read___resp___1_data_$IN_EN_WRITE_VALID;
  wire  mod__read___resp___1_data_$IN_WRITE_VALID;
  wire  mod__read___resp___1_data_$OUT_READ_VALID;
  wire  mod__read___resp___data_$IN_EN_WRITE_VALID;
  wire  mod__read___resp___data_$IN_WRITE_VALID;
  wire  mod__read___resp___data_$OUT_READ_VALID;
  wire  mod__write___data_$IN_EN_WRITE_VALID;
  wire  mod__write___data_$IN_WRITE_VALID;
  wire  mod__write___data_$OUT_READ_VALID;
  wire  mod__write___en_$IN_EN_WRITE_VALID;
  wire  mod__write___en_$OUT_READ_VALID;
  wire  read_0_req_EN_WRITE_VALID;
  wire  read_0_req_WRITE_VALID;
  wire  read_0_resp_READ_VALID;
  wire  read_1_req_EN_WRITE_VALID;
  wire  read_1_req_WRITE_VALID;
  wire  read_1_resp_READ_VALID;
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
  wire  write_EN_WRITE_VALID;
  wire  write_WRITE_VALID;
  wire  mod__read___req__1_data_$IN_EN_WRITE_CONSUMED;
  wire  mod__read___req__1_data_$IN_WRITE_CONSUMED;
  wire  mod__read___req__1_data_$OUT_READ_CONSUMED;
  wire  mod__read___req__1_en_$IN_EN_WRITE_CONSUMED;
  wire  mod__read___req__data_$IN_EN_WRITE_CONSUMED;
  wire  mod__read___req__data_$IN_WRITE_CONSUMED;
  wire  mod__read___req__data_$OUT_READ_CONSUMED;
  wire  mod__read___req__en_$IN_EN_WRITE_CONSUMED;
  wire  mod__read___resp___1_data_$IN_EN_WRITE_CONSUMED;
  wire  mod__read___resp___1_data_$IN_WRITE_CONSUMED;
  wire  mod__read___resp___1_data_$OUT_READ_CONSUMED;
  wire  mod__read___resp___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__read___resp___data_$IN_WRITE_CONSUMED;
  wire  mod__read___resp___data_$OUT_READ_CONSUMED;
  wire  mod__write___data_$IN_EN_WRITE_CONSUMED;
  wire  mod__write___data_$IN_WRITE_CONSUMED;
  wire  mod__write___data_$OUT_READ_CONSUMED;
  wire  mod__write___en_$IN_EN_WRITE_CONSUMED;
  wire  mod__write___en_$OUT_READ_CONSUMED;
  wire  read_0_req_EN_WRITE_CONSUMED;
  wire  read_0_req_WRITE_CONSUMED;
  wire  read_0_resp_READ_CONSUMED;
  wire  read_1_req_EN_WRITE_CONSUMED;
  wire  read_1_req_WRITE_CONSUMED;
  wire  read_1_resp_READ_CONSUMED;
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
  wire  write_EN_WRITE_CONSUMED;
  wire  write_WRITE_CONSUMED;

  assign read_0_resp_READ = mod__read___resp___data_$OUT_READ ;

  assign read_1_resp_READ = mod__read___resp___1_data_$OUT_READ ;

  assign mod__read___req__1_data_$IN_WRITE = read_1_req_WRITE ;

  assign mod__read___req__1_data_$IN_EN_WRITE = read_1_req_EN_WRITE ;

  assign mod__read___req__1_en_$IN_EN_WRITE = read_1_req_EN_WRITE ;

  assign mod__read___req__data_$IN_WRITE = read_0_req_WRITE ;

  assign mod__read___req__data_$IN_EN_WRITE = read_0_req_EN_WRITE ;

  assign mod__read___req__en_$IN_EN_WRITE = read_0_req_EN_WRITE ;

  assign mod__read___resp___1_data_$IN_WRITE =
	     (mod__read___req__1_data_$OUT_READ == 5'd0) ?
	       32'd0 :
	       IF_mod__write___en___read__1_AND_mod__write____ETC___d35 ;

  assign mod__read___resp___1_data_$IN_EN_WRITE = 1'd1 ;

  assign mod__read___resp___data_$IN_WRITE =
	     (mod__read___req__data_$OUT_READ == 5'd0) ?
	       32'd0 :
	       IF_mod__write___en___read__1_AND_mod__write____ETC___d28 ;

  assign mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign mod__write___data_$IN_WRITE = write_WRITE ;

  assign mod__write___data_$IN_EN_WRITE = write_EN_WRITE ;

  assign mod__write___en_$IN_EN_WRITE = write_EN_WRITE ;

  assign regs_mod__mod__read___req__1_data_$IN_WRITE =
	     mod__read___req__1_data_$OUT_READ ;

  assign regs_mod__mod__read___req__1_data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___req__1_en_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___req__data_$IN_WRITE =
	     mod__read___req__data_$OUT_READ ;

  assign regs_mod__mod__read___req__data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___req__en_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___resp___1_data_$IN_WRITE =
	     regs_mod__rf_mod__1_read___resp___data_$OUT_READ ;

  assign regs_mod__mod__read___resp___1_data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__read___resp___data_$IN_WRITE =
	     regs_mod__rf_mod__read___resp___data_$OUT_READ ;

  assign regs_mod__mod__read___resp___data_$IN_EN_WRITE = 1'd1 ;

  assign regs_mod__mod__write___data_$IN_WRITE = mod__write___data_$OUT_READ ;

  assign regs_mod__mod__write___data_$IN_EN_WRITE =
	     mod__write___en_$OUT_READ &&
	     mod__write___data_$OUT_READ[36:32] != 5'd0 ;

  assign regs_mod__mod__write___en_$IN_EN_WRITE =
	     mod__write___en_$OUT_READ &&
	     mod__write___data_$OUT_READ[36:32] != 5'd0 ;

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
	     regs_mod__rf_mod__write___data_$OUT_READ[36:32] ;

  assign regs_mod__rf_rf$WRITE_EN_WRITE =
	     regs_mod__rf_mod__write___en_$OUT_READ ;

  assign regs_mod__rf_rf_1$READ_REQ_WRITE =
	     regs_mod__rf_mod__1_read___req__data_$OUT_READ ;

  assign regs_mod__rf_rf_1$WRITE_DATA_WRITE =
	     regs_mod__rf_mod__1_write___data_$OUT_READ[31:0] ;

  assign regs_mod__rf_rf_1$WRITE_INDEX_WRITE =
	     regs_mod__rf_mod__1_write___data_$OUT_READ[36:32] ;

  assign regs_mod__rf_rf_1$WRITE_EN_WRITE =
	     regs_mod__rf_mod__1_write___en_$OUT_READ ;

  assign regs_mod__whichReg$IN_EN_WRITE = 1'd1 ;

  assign IF_mod__write___en___read__1_AND_mod__write____ETC___d28 =
	     (mod__write___en_$OUT_READ &&
	      mod__write___data_$OUT_READ[36:32] ==
	      mod__read___req__data_$OUT_READ) ?
	       mod__write___data_$OUT_READ[31:0] :
	       regs_mod__mod__read___resp___data_$OUT_READ ;

  assign IF_mod__write___en___read__1_AND_mod__write____ETC___d35 =
	     (mod__write___en_$OUT_READ &&
	      mod__write___data_$OUT_READ[36:32] ==
	      mod__read___req__1_data_$OUT_READ) ?
	       mod__write___data_$OUT_READ[31:0] :
	       regs_mod__mod__read___resp___1_data_$OUT_READ ;

  assign mod__read___req__1_data_$IN_EN_WRITE_VALID = 1 && read_1_req_EN_WRITE_VALID;

  assign mod__read___req__1_data_$IN_WRITE_VALID = 1 && read_1_req_WRITE_VALID;

  assign mod__read___req__1_en_$IN_EN_WRITE_VALID = 1 && read_1_req_EN_WRITE_VALID;

  assign mod__read___req__data_$IN_EN_WRITE_VALID = 1 && read_0_req_EN_WRITE_VALID;

  assign mod__read___req__data_$IN_WRITE_VALID = 1 && read_0_req_WRITE_VALID;

  assign mod__read___req__en_$IN_EN_WRITE_VALID = 1 && read_0_req_EN_WRITE_VALID;

  assign mod__read___resp___1_data_$IN_EN_WRITE_VALID = 1;

  assign mod__read___resp___1_data_$IN_WRITE_VALID = 1 && mod__read___req__1_data_$OUT_READ_VALID && mod__write___en_$OUT_READ_VALID && mod__write___data_$OUT_READ_VALID && mod__read___req__1_data_$OUT_READ_VALID && regs_mod__mod__read___resp___1_data_$OUT_READ_VALID;

  assign mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign mod__read___resp___data_$IN_WRITE_VALID = 1 && mod__read___req__data_$OUT_READ_VALID && mod__write___en_$OUT_READ_VALID && mod__write___data_$OUT_READ_VALID && mod__read___req__data_$OUT_READ_VALID && regs_mod__mod__read___resp___data_$OUT_READ_VALID;

  assign mod__write___data_$IN_EN_WRITE_VALID = 1 && write_EN_WRITE_VALID;

  assign mod__write___data_$IN_WRITE_VALID = 1 && write_WRITE_VALID;

  assign mod__write___en_$IN_EN_WRITE_VALID = 1 && write_EN_WRITE_VALID;

  assign read_0_resp_READ_VALID = 1 && mod__read___resp___data_$OUT_READ_VALID;

  assign read_1_resp_READ_VALID = 1 && mod__read___resp___1_data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__1_data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___req__1_data_$IN_WRITE_VALID = 1 && mod__read___req__1_data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__1_en_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___req__data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___req__data_$IN_WRITE_VALID = 1 && mod__read___req__data_$OUT_READ_VALID;

  assign regs_mod__mod__read___req__en_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___resp___1_data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___resp___1_data_$IN_WRITE_VALID = 1 && regs_mod__rf_mod__1_read___resp___data_$OUT_READ_VALID;

  assign regs_mod__mod__read___resp___data_$IN_EN_WRITE_VALID = 1;

  assign regs_mod__mod__read___resp___data_$IN_WRITE_VALID = 1 && regs_mod__rf_mod__read___resp___data_$OUT_READ_VALID;

  assign regs_mod__mod__write___data_$IN_EN_WRITE_VALID = 1 && mod__write___en_$OUT_READ_VALID && mod__write___data_$OUT_READ_VALID;

  assign regs_mod__mod__write___data_$IN_WRITE_VALID = 1 && mod__write___data_$OUT_READ_VALID;

  assign regs_mod__mod__write___en_$IN_EN_WRITE_VALID = 1 && mod__write___en_$OUT_READ_VALID && mod__write___data_$OUT_READ_VALID;

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

  assign mod__read___req__1_data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___req__1_data_$IN_WRITE_CONSUMED && mod__read___resp___1_data_$IN_WRITE_CONSUMED && mod__read___resp___1_data_$IN_WRITE_CONSUMED;

  assign mod__read___req__data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__read___req__data_$IN_WRITE_CONSUMED && mod__read___resp___data_$IN_WRITE_CONSUMED && mod__read___resp___data_$IN_WRITE_CONSUMED;

  assign mod__read___resp___1_data_$OUT_READ_CONSUMED = 1 && read_1_resp_READ_CONSUMED;

  assign mod__read___resp___data_$OUT_READ_CONSUMED = 1 && read_0_resp_READ_CONSUMED;

  assign mod__write___data_$OUT_READ_CONSUMED = 1 && regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && mod__read___resp___data_$IN_WRITE_CONSUMED && mod__read___resp___1_data_$IN_WRITE_CONSUMED;

  assign mod__write___en_$OUT_READ_CONSUMED = 1 && regs_mod__mod__write___en_$IN_EN_WRITE_CONSUMED && regs_mod__mod__write___data_$IN_EN_WRITE_CONSUMED && mod__read___resp___data_$IN_WRITE_CONSUMED && mod__read___resp___1_data_$IN_WRITE_CONSUMED;

  assign read_0_req_EN_WRITE_CONSUMED = 1 && mod__read___req__en_$IN_EN_WRITE_CONSUMED && mod__read___req__data_$IN_EN_WRITE_CONSUMED;

  assign read_0_req_WRITE_CONSUMED = 1 && mod__read___req__data_$IN_WRITE_CONSUMED;

  assign read_1_req_EN_WRITE_CONSUMED = 1 && mod__read___req__1_en_$IN_EN_WRITE_CONSUMED && mod__read___req__1_data_$IN_EN_WRITE_CONSUMED;

  assign read_1_req_WRITE_CONSUMED = 1 && mod__read___req__1_data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___req__1_data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_mod__1_read___req__data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___req__data_$OUT_READ_CONSUMED = 1 && regs_mod__rf_mod__read___req__data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___resp___1_data_$OUT_READ_CONSUMED = 1 && mod__read___resp___1_data_$IN_WRITE_CONSUMED;

  assign regs_mod__mod__read___resp___data_$OUT_READ_CONSUMED = 1 && mod__read___resp___data_$IN_WRITE_CONSUMED;

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

  assign write_EN_WRITE_CONSUMED = 1 && mod__write___en_$IN_EN_WRITE_CONSUMED && mod__write___data_$IN_EN_WRITE_CONSUMED;

  assign write_WRITE_CONSUMED = 1 && mod__write___data_$IN_WRITE_CONSUMED;

  mkWire#(32'd5) mod__read___req__1_data_ (
    .IN_WRITE(mod__read___req__1_data_$IN_WRITE),
    .IN_EN_WRITE(mod__read___req__1_data_$IN_EN_WRITE),
    .OUT_READ(mod__read___req__1_data_$OUT_READ),
    .IN_WRITE_VALID(mod__read___req__1_data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__read___req__1_data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__read___req__1_data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__read___req__1_data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__read___req__1_data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__read___req__1_data_$OUT_READ_CONSUMED));

  mkPulse mod__read___req__1_en_ (
    .IN_EN_WRITE(mod__read___req__1_en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(mod__read___req__1_en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(mod__read___req__1_en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd5) mod__read___req__data_ (
    .IN_WRITE(mod__read___req__data_$IN_WRITE),
    .IN_EN_WRITE(mod__read___req__data_$IN_EN_WRITE),
    .OUT_READ(mod__read___req__data_$OUT_READ),
    .IN_WRITE_VALID(mod__read___req__data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__read___req__data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__read___req__data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__read___req__data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__read___req__data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__read___req__data_$OUT_READ_CONSUMED));

  mkPulse mod__read___req__en_ (
    .IN_EN_WRITE(mod__read___req__en_$IN_EN_WRITE),
    .OUT_READ(),
    .IN_EN_WRITE_VALID(mod__read___req__en_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(),
    .IN_EN_WRITE_CONSUMED(mod__read___req__en_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED());

  mkWire#(32'd32) mod__read___resp___1_data_ (
    .IN_WRITE(mod__read___resp___1_data_$IN_WRITE),
    .IN_EN_WRITE(mod__read___resp___1_data_$IN_EN_WRITE),
    .OUT_READ(mod__read___resp___1_data_$OUT_READ),
    .IN_WRITE_VALID(mod__read___resp___1_data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__read___resp___1_data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__read___resp___1_data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__read___resp___1_data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__read___resp___1_data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__read___resp___1_data_$OUT_READ_CONSUMED));

  mkWire#(32'd32) mod__read___resp___data_ (
    .IN_WRITE(mod__read___resp___data_$IN_WRITE),
    .IN_EN_WRITE(mod__read___resp___data_$IN_EN_WRITE),
    .OUT_READ(mod__read___resp___data_$OUT_READ),
    .IN_WRITE_VALID(mod__read___resp___data_$IN_WRITE_VALID),
    .IN_EN_WRITE_VALID(mod__read___resp___data_$IN_EN_WRITE_VALID),
    .OUT_READ_VALID(mod__read___resp___data_$OUT_READ_VALID),
    .IN_WRITE_CONSUMED(mod__read___resp___data_$IN_WRITE_CONSUMED),
    .IN_EN_WRITE_CONSUMED(mod__read___resp___data_$IN_EN_WRITE_CONSUMED),
    .OUT_READ_CONSUMED(mod__read___resp___data_$OUT_READ_CONSUMED));

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

  mkWire#(32'd5) regs_mod__mod__read___req__1_data_ (
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

  mkWire#(32'd5) regs_mod__mod__read___req__data_ (
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

  mkWire#(32'd37) regs_mod__mod__write___data_ (
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

  mkWire#(32'd5) regs_mod__rf_mod__1_read___req__data_ (
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

  mkWire#(32'd37) regs_mod__rf_mod__1_write___data_ (
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

  mkWire#(32'd5) regs_mod__rf_mod__read___req__data_ (
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

  mkWire#(32'd37) regs_mod__rf_mod__write___data_ (
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
		    /*n*/ 32'd5,
		    /*size*/ 32'd32,
		    /*file*/ "",
		    /*mode*/ 32'd0) regs_mod__rf_rf (
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
		    /*n*/ 32'd5,
		    /*size*/ 32'd32,
		    /*file*/ "",
		    /*mode*/ 32'd0) regs_mod__rf_rf_1 (
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
