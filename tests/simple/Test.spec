include Library;

(* synthesize *)
partition Empty mkTest;
  Reg#(Bit#(32)) x <- mkReg(24);
  Reg#(Bit#(32)) y <- mkReg(45);

  atomic a;
    $display("%d %d", x, y);
    x <= y;
    y <= x;
  endatomic
endpartition
