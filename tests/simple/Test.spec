include Library;
include RegFile;

(* synthesize *)
partition Empty mkTest1;
  Reg#(Bit#(32)) x <- mkReg(24);
  Reg#(Bit#(32)) y <- mkReg(45);

  atomic a;
    $display("%d %d", x, y);
    x <= y;
    y <= x;
  endatomic
endpartition

(* synthesize *)
partition Empty mkTest;
  Reg#(Bit#(5)) x <- mkReg(0);
  RegFile#(1, 1, 32, Bit#(5)) rf <- mkRegFileU;

  atomic a;
    rf.write[0] := RegFileWrite{index: x, data: x + 1};
    $display("write: %d %d", x, x + 1);
    rf.read[0].req := x;
    $display("read: %d %d", x, x, rf.read[0].resp);
    x <= x + 1;
  endatomic
endpartition
