import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export Fifo::*;

import Library::*;
export Library::*;

import RegFile::*;
export RegFile::*;

interface Fifo_#(numeric type n, type t);
  interface FifoEnq#(t) enq;
  interface FifoDeq#(t) deq;
endinterface

interface Fifo#(numeric type n, type t);
  interface FifoEnq_#(t) enq;
  interface FifoDeq_#(t) deq;
endinterface

module _Fifo(Tuple2#(Fifo_#(n, t), Fifo#(n, t))) provisos(Bits#(t, _sZt));
  Tuple2#(FifoEnq_#(t), FifoEnq#(t)) enq__ <- _FifoEnq;
  Tuple2#(FifoEnq#(t), FifoEnq_#(t)) enq_ = tuple2(tpl_2(asIfc(enq__)), tpl_1(asIfc(enq__)));
  Tuple2#(FifoDeq_#(t), FifoDeq#(t)) deq__ <- _FifoDeq;
  Tuple2#(FifoDeq#(t), FifoDeq_#(t)) deq_ = tuple2(tpl_2(asIfc(deq__)), tpl_1(asIfc(deq__)));
  return tuple2(
    interface Fifo_;
      interface enq = tpl_1(asIfc(enq_));
      interface deq = tpl_1(asIfc(deq_));
    endinterface,
    interface Fifo;
      interface enq = tpl_2(asIfc(enq_));
      interface deq = tpl_2(asIfc(deq_));
    endinterface);
endmodule

instance Connectable#(Fifo#(n, t), Fifo_#(n, t)) provisos(Bits#(t, _sZt));
  module mkConnection#(Fifo#(n, t) a, Fifo_#(n, t) b)();
    mkConnection(asIfc(a.enq), asIfc(b.enq));
    mkConnection(asIfc(a.deq), asIfc(b.deq));
  endmodule
endinstance

instance Connectable#(Fifo_#(n, t), Fifo#(n, t)) provisos(Bits#(t, _sZt));
  module mkConnection#(Fifo_#(n, t) a, Fifo#(n, t) b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

module mkLFifo(Fifo#(n, t)) provisos(Bits#(t, tSz));
  Tuple2#(Fifo_#(n, t), Fifo#(n, t)) mod_ <- _Fifo;

  RegFile#(1, 1, n, t) regs <- mkRegFileU;

  Reg#(Index#(n)) head <- mkReg(0);
  Reg#(Index#(n)) tail <- mkReg(0);
  Reg#(NumElems#(n)) numElems <- mkReg(0);

  rule a;
    (tpl_1(asIfc(mod_))).enq.notFull.write( numElems != fromInteger(valueOf(n)) || (tpl_1(asIfc(mod_))).deq.deq);
    (tpl_1(asIfc(mod_))).deq.notEmpty.write( numElems != 0);

    regs.read[0].req.write( tail);
    (tpl_1(asIfc(mod_))).deq.first.write( regs.read[0].resp);

    if((tpl_1(asIfc(mod_))).deq.deq)
      tail <= moduloIncr(tail);

    if((tpl_1(asIfc(mod_))).enq.enq.en)
    begin
      regs.write[0].write( RegFileWrite{index: head, data: (tpl_1(asIfc(mod_))).enq.enq});
      head <= moduloIncr(head);
    end

    Bit#(2) diff = zeroExtend(pack((tpl_1(asIfc(mod_))).enq.enq.en)) - zeroExtend(pack((tpl_1(asIfc(mod_))).deq.deq));
    numElems <= numElems + signExtend(diff);
  endrule

  return tpl_2(asIfc(mod_));
endmodule

module mkFifo(Fifo#(n, t)) provisos(Bits#(t, tSz));
  Tuple2#(Fifo_#(n, t), Fifo#(n, t)) mod_ <- _Fifo;

  RegFile#(1, 1, n, t) regs <- mkRegFileU;

  Reg#(Index#(n)) head <- mkReg(0);
  Reg#(Index#(n)) tail <- mkReg(0);
  Reg#(NumElems#(n)) numElems <- mkReg(0);

  rule a;
    (tpl_1(asIfc(mod_))).enq.notFull.write( numElems != fromInteger(valueOf(n)));
    (tpl_1(asIfc(mod_))).deq.notEmpty.write( numElems != 0);

    regs.read[0].req.write( tail);
    (tpl_1(asIfc(mod_))).deq.first.write( regs.read[0].resp);

    if((tpl_1(asIfc(mod_))).deq.deq)
      tail <= moduloIncr(tail);

    if((tpl_1(asIfc(mod_))).enq.enq.en)
    begin
      regs.write[0].write( RegFileWrite{index: head, data: (tpl_1(asIfc(mod_))).enq.enq});
      head <= moduloIncr(head);
    end

    Bit#(2) diff = zeroExtend(pack((tpl_1(asIfc(mod_))).enq.enq.en)) - zeroExtend(pack((tpl_1(asIfc(mod_))).deq.deq));
    numElems <= numElems + signExtend(diff);
  endrule

  return tpl_2(asIfc(mod_));
endmodule

module mkBypassFifo(Fifo#(n, t)) provisos(Bits#(t, tSz));
  Tuple2#(Fifo_#(n, t), Fifo#(n, t)) mod_ <- _Fifo;

  RegFile#(1, 1, n, t) regs <- mkRegFileU;

  Reg#(Index#(n)) head <- mkReg(0);
  Reg#(Index#(n)) tail <- mkReg(0);
  Reg#(NumElems#(n)) numElems <- mkReg(0);

  rule a;
    (tpl_1(asIfc(mod_))).enq.notFull.write( numElems != fromInteger(valueOf(n)));
    (tpl_1(asIfc(mod_))).deq.notEmpty.write( numElems != 0 || (tpl_1(asIfc(mod_))).enq.enq.en);

    regs.read[0].req.write( tail);
    (tpl_1(asIfc(mod_))).deq.first.write( (numElems != 0)? regs.read[0].resp: (tpl_1(asIfc(mod_))).enq.enq);

    if((tpl_1(asIfc(mod_))).deq.deq)
      tail <= moduloIncr(tail);

    if((tpl_1(asIfc(mod_))).enq.enq.en)
    begin
      regs.write[0].write( RegFileWrite{index: head, data: (tpl_1(asIfc(mod_))).enq.enq});
      head <= moduloIncr(head);
    end

    Bit#(2) diff = zeroExtend(pack((tpl_1(asIfc(mod_))).enq.enq.en)) - zeroExtend(pack((tpl_1(asIfc(mod_))).deq.deq));
    numElems <= numElems + signExtend(diff);
  endrule

  return tpl_2(asIfc(mod_));
endmodule

