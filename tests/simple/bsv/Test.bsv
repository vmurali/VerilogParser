import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export Test::*;

import Library::*;
export Library::*;

(* synthesize *)
module mkTest(Empty) ;
  Tuple2#(Empty_, Empty) mod_ <- _Empty;

  Reg#(Bit#(32)) x <- mkReg(24);
  Reg#(Bit#(32)) y <- mkReg(45);

  rule a;
    $display("%d %d", x, y);
    x <= y;
    y <= x;
  endrule

  return tpl_2(asIfc(mod_));
endmodule

