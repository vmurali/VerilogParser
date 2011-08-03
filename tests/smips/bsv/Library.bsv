import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export Library::*;

interface FifoEnq_#(type t);
  interface Output#(Bool) notFull;
  interface ConditionalOutput_#(t) enq;
endinterface

interface FifoEnq#(type t);
  interface Output_#(Bool) notFull;
  interface ConditionalOutput#(t) enq;
endinterface

module _FifoEnq(Tuple2#(FifoEnq_#(t), FifoEnq#(t))) provisos(Bits#(t, _sZt));
  Tuple2#(Output_#(Bool), Output#(Bool)) notFull__ <- _Output(True, True);
  Tuple2#(Output#(Bool), Output_#(Bool)) notFull_ = tuple2(tpl_2(asIfc(notFull__)), tpl_1(asIfc(notFull__)));
  Tuple2#(ConditionalOutput_#(t), ConditionalOutput#(t)) enq_ <- _ConditionalOutput((tpl_1(asIfc(notFull_)))._read, True);
  return tuple2(
    interface FifoEnq_;
      interface notFull = tpl_1(asIfc(notFull_));
      interface enq = tpl_1(asIfc(enq_));
    endinterface,
    interface FifoEnq;
      interface notFull = tpl_2(asIfc(notFull_));
      interface enq = tpl_2(asIfc(enq_));
    endinterface);
endmodule

instance Connectable#(FifoEnq#(t), FifoEnq_#(t)) provisos(Bits#(t, _sZt));
  module mkConnection#(FifoEnq#(t) a, FifoEnq_#(t) b)();
    mkConnection(asIfc(a.notFull), asIfc(b.notFull));
    mkConnection(asIfc(a.enq), asIfc(b.enq));
  endmodule
endinstance

instance Connectable#(FifoEnq_#(t), FifoEnq#(t)) provisos(Bits#(t, _sZt));
  module mkConnection#(FifoEnq_#(t) a, FifoEnq#(t) b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

interface FifoDeq_#(type t);
  interface Output#(Bool) notEmpty;
  interface Output#(t) first;
  interface OutputPulse_ deq;
endinterface

interface FifoDeq#(type t);
  interface Output_#(Bool) notEmpty;
  interface Output_#(t) first;
  interface OutputPulse deq;
endinterface

module _FifoDeq(Tuple2#(FifoDeq_#(t), FifoDeq#(t))) provisos(Bits#(t, _sZt));
  Tuple2#(Output_#(Bool), Output#(Bool)) notEmpty__ <- _Output(True, True);
  Tuple2#(Output#(Bool), Output_#(Bool)) notEmpty_ = tuple2(tpl_2(asIfc(notEmpty__)), tpl_1(asIfc(notEmpty__)));
  Tuple2#(Output_#(t), Output#(t)) first__ <- _Output(True, (tpl_1(asIfc(notEmpty_)))._read);
  Tuple2#(Output#(t), Output_#(t)) first_ = tuple2(tpl_2(asIfc(first__)), tpl_1(asIfc(first__)));
  Tuple2#(OutputPulse_, OutputPulse) deq_ <- _OutputPulse((tpl_1(asIfc(notEmpty_)))._read, True);
  return tuple2(
    interface FifoDeq_;
      interface notEmpty = tpl_1(asIfc(notEmpty_));
      interface first = tpl_1(asIfc(first_));
      interface deq = tpl_1(asIfc(deq_));
    endinterface,
    interface FifoDeq;
      interface notEmpty = tpl_2(asIfc(notEmpty_));
      interface first = tpl_2(asIfc(first_));
      interface deq = tpl_2(asIfc(deq_));
    endinterface);
endmodule

instance Connectable#(FifoDeq#(t), FifoDeq_#(t)) provisos(Bits#(t, _sZt));
  module mkConnection#(FifoDeq#(t) a, FifoDeq_#(t) b)();
    mkConnection(asIfc(a.notEmpty), asIfc(b.notEmpty));
    mkConnection(asIfc(a.first), asIfc(b.first));
    mkConnection(asIfc(a.deq), asIfc(b.deq));
  endmodule
endinstance

instance Connectable#(FifoDeq_#(t), FifoDeq#(t)) provisos(Bits#(t, _sZt));
  module mkConnection#(FifoDeq_#(t) a, FifoDeq#(t) b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

interface Empty_;
endinterface

interface Empty;
endinterface

module _Empty(Tuple2#(Empty_, Empty)) ;
  return tuple2(
    interface Empty_;
    endinterface,
    interface Empty;
    endinterface);
endmodule

instance Connectable#(Empty, Empty_) ;
  module mkConnection#(Empty a, Empty_ b)();
  endmodule
endinstance

instance Connectable#(Empty_, Empty) ;
  module mkConnection#(Empty_ a, Empty b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

typedef Bit#(TLog#(n)) Index#(type n);
typedef Bit#(TLog#(TAdd#(n, 1))) NumElems#(type n);

function Index#(n) moduloPlus(NumElems#(n) incr, Index#(n) orig) = truncate(zeroExtend(orig) + incr <= (fromInteger(valueOf(n) - 1))? zeroExtend(orig) + incr: (incr - (fromInteger(valueOf(n) - 1) - (zeroExtend(orig) - 1))));
function Index#(n) moduloIncr(Index#(n) orig) = moduloPlus(1, orig);


