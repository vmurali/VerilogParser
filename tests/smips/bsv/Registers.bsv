import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export Registers::*;

import Library::*;
export Library::*;

import Types::*;
export Types::*;

import RegFile::*;
export RegFile::*;

interface Registers_;
  interface Vector#(2, RegFileRead#(NumRegs, Data)) read;
  interface ConditionalOutput#(RegWrite) write;
endinterface

interface Registers;
  interface Vector#(2, RegFileRead_#(NumRegs, Data)) read;
  interface ConditionalOutput_#(RegWrite) write;
endinterface

module _Registers(Tuple2#(Registers_, Registers)) ;
  Tuple2#(Vector#(2, RegFileRead_#(NumRegs, Data)), Vector#(2, RegFileRead#(NumRegs, Data))) read__ <- replicateTupleM(_RegFileRead);
  Tuple2#(Vector#(2, RegFileRead#(NumRegs, Data)), Vector#(2, RegFileRead_#(NumRegs, Data))) read_ = tuple2(tpl_2(asIfc(read__)), tpl_1(asIfc(read__)));
  Tuple2#(ConditionalOutput_#(RegWrite), ConditionalOutput#(RegWrite)) write__ <- _ConditionalOutput(True, True);
  Tuple2#(ConditionalOutput#(RegWrite), ConditionalOutput_#(RegWrite)) write_ = tuple2(tpl_2(asIfc(write__)), tpl_1(asIfc(write__)));
  return tuple2(
    interface Registers_;
      interface read = tpl_1(asIfc(read_));
      interface write = tpl_1(asIfc(write_));
    endinterface,
    interface Registers;
      interface read = tpl_2(asIfc(read_));
      interface write = tpl_2(asIfc(write_));
    endinterface);
endmodule

instance Connectable#(Registers, Registers_) ;
  module mkConnection#(Registers a, Registers_ b)();
    mkConnection(asIfc(a.read), asIfc(b.read));
    mkConnection(asIfc(a.write), asIfc(b.write));
  endmodule
endinstance

instance Connectable#(Registers_, Registers) ;
  module mkConnection#(Registers_ a, Registers b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

(* synthesize *)
module mkRegisters(Registers) ;
  Tuple2#(Registers_, Registers) mod_ <- _Registers;

  RegFile#(2, 1, NumRegs, Data) regs <- mkRegFileU;

  rule r1;
    for(Integer i = 0; i < 2; i = i + 1)
    begin
      regs.read[i].req.write( (tpl_1(asIfc(mod_))).read[i].req);

      (tpl_1(asIfc(mod_))).read[i].resp.write( (tpl_1(asIfc(mod_))).read[i].req == 0?
                        0:
                        (tpl_1(asIfc(mod_))).write.en && (tpl_1(asIfc(mod_))).write.index == (tpl_1(asIfc(mod_))).read[i].req?
                          (tpl_1(asIfc(mod_))).write.data:
                          regs.read[i].resp);
    end

    if((tpl_1(asIfc(mod_))).write.en && (tpl_1(asIfc(mod_))).write.index != 0)
      regs.write[0].write( (tpl_1(asIfc(mod_))).write);
  endrule

  return tpl_2(asIfc(mod_));
endmodule

