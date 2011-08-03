import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export Fetch::*;

import Library::*;
export Library::*;

import Types::*;
export Types::*;

interface Fetch_;
  interface Output_#(Bool) currEpoch;
  interface FifoEnq_#(PcQ) pcQ;
  interface FifoEnq_#(VAddr) instReqQ;
  interface ConditionalOutput#(VAddr) branchPc;
endinterface

interface Fetch;
  interface Output#(Bool) currEpoch;
  interface FifoEnq#(PcQ) pcQ;
  interface FifoEnq#(VAddr) instReqQ;
  interface ConditionalOutput_#(VAddr) branchPc;
endinterface

module _Fetch(Tuple2#(Fetch_, Fetch)) ;
  Tuple2#(Output_#(Bool), Output#(Bool)) currEpoch_ <- _Output(True, True);
  Tuple2#(FifoEnq_#(PcQ), FifoEnq#(PcQ)) pcQ_ <- _FifoEnq;
  Tuple2#(FifoEnq_#(VAddr), FifoEnq#(VAddr)) instReqQ_ <- _FifoEnq;
  Tuple2#(ConditionalOutput_#(VAddr), ConditionalOutput#(VAddr)) branchPc__ <- _ConditionalOutput(True, True);
  Tuple2#(ConditionalOutput#(VAddr), ConditionalOutput_#(VAddr)) branchPc_ = tuple2(tpl_2(asIfc(branchPc__)), tpl_1(asIfc(branchPc__)));
  return tuple2(
    interface Fetch_;
      interface currEpoch = tpl_1(asIfc(currEpoch_));
      interface pcQ = tpl_1(asIfc(pcQ_));
      interface instReqQ = tpl_1(asIfc(instReqQ_));
      interface branchPc = tpl_1(asIfc(branchPc_));
    endinterface,
    interface Fetch;
      interface currEpoch = tpl_2(asIfc(currEpoch_));
      interface pcQ = tpl_2(asIfc(pcQ_));
      interface instReqQ = tpl_2(asIfc(instReqQ_));
      interface branchPc = tpl_2(asIfc(branchPc_));
    endinterface);
endmodule

instance Connectable#(Fetch, Fetch_) ;
  module mkConnection#(Fetch a, Fetch_ b)();
    mkConnection(asIfc(a.currEpoch), asIfc(b.currEpoch));
    mkConnection(asIfc(a.pcQ), asIfc(b.pcQ));
    mkConnection(asIfc(a.instReqQ), asIfc(b.instReqQ));
    mkConnection(asIfc(a.branchPc), asIfc(b.branchPc));
  endmodule
endinstance

instance Connectable#(Fetch_, Fetch) ;
  module mkConnection#(Fetch_ a, Fetch b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

(* synthesize *)
module mkFetch(Fetch) ;
  Tuple2#(Fetch_, Fetch) mod_ <- _Fetch;

  Reg#(VAddr)   pc <- mkReg('h1000);
  Reg#(Bool) epoch <- mkRegU;

  Pulse      fired <- mkPulse;

  rule r1;
    (tpl_1(asIfc(mod_))).instReqQ.enq.write( pc);
    (tpl_1(asIfc(mod_))).pcQ.enq.write( PcQ{pc: pc+4, epoch: epoch});

    fired.send;
  endrule

  rule r2;
    (tpl_1(asIfc(mod_))).currEpoch.write( epoch);

    if((tpl_1(asIfc(mod_))).branchPc.en)
    begin
      pc <= (tpl_1(asIfc(mod_))).branchPc;
      epoch <= !epoch;
    end
    else if(fired)
    begin
      pc <= pc + 4;
    end
  endrule

  return tpl_2(asIfc(mod_));
endmodule

