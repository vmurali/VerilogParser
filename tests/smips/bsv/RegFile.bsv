import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export RegFile::*;

import Library::*;
export Library::*;

import RegFileVerilog::*;

interface RegFileRead_#(numeric type size, type t);
  interface ConditionalOutput_#(Index#(size)) req;
  interface Output#(t) resp;
endinterface

interface RegFileRead#(numeric type size, type t);
  interface ConditionalOutput#(Index#(size)) req;
  interface Output_#(t) resp;
endinterface

module _RegFileRead(Tuple2#(RegFileRead_#(size, t), RegFileRead#(size, t))) provisos(Bits#(t, _sZt));
  Tuple2#(ConditionalOutput_#(Index#(size)), ConditionalOutput#(Index#(size))) req_ <- _ConditionalOutput(True, True);
  Tuple2#(Output_#(t), Output#(t)) resp__ <- _Output(True, True);
  Tuple2#(Output#(t), Output_#(t)) resp_ = tuple2(tpl_2(asIfc(resp__)), tpl_1(asIfc(resp__)));
  return tuple2(
    interface RegFileRead_;
      interface req = tpl_1(asIfc(req_));
      interface resp = tpl_1(asIfc(resp_));
    endinterface,
    interface RegFileRead;
      interface req = tpl_2(asIfc(req_));
      interface resp = tpl_2(asIfc(resp_));
    endinterface);
endmodule

instance Connectable#(RegFileRead#(size, t), RegFileRead_#(size, t)) provisos(Bits#(t, _sZt));
  module mkConnection#(RegFileRead#(size, t) a, RegFileRead_#(size, t) b)();
    mkConnection(asIfc(a.req), asIfc(b.req));
    mkConnection(asIfc(a.resp), asIfc(b.resp));
  endmodule
endinstance

instance Connectable#(RegFileRead_#(size, t), RegFileRead#(size, t)) provisos(Bits#(t, _sZt));
  module mkConnection#(RegFileRead_#(size, t) a, RegFileRead#(size, t) b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

typedef struct {
  Index#(size) index;
  t data;
} RegFileWrite#(numeric type size, type t) deriving (Bits, Eq);

interface RegFile_#(numeric type reads, numeric type writes, numeric type size, type t);
  interface Vector#(reads, RegFileRead#(size, t)) read;
  interface Vector#(writes, ConditionalOutput#(RegFileWrite#(size, t))) write;
endinterface

interface RegFile#(numeric type reads, numeric type writes, numeric type size, type t);
  interface Vector#(reads, RegFileRead_#(size, t)) read;
  interface Vector#(writes, ConditionalOutput_#(RegFileWrite#(size, t))) write;
endinterface

module _RegFile(Tuple2#(RegFile_#(reads, writes, size, t), RegFile#(reads, writes, size, t))) provisos(Bits#(t, _sZt));
  Tuple2#(Vector#(reads, RegFileRead_#(size, t)), Vector#(reads, RegFileRead#(size, t))) read__ <- replicateTupleM(_RegFileRead);
  Tuple2#(Vector#(reads, RegFileRead#(size, t)), Vector#(reads, RegFileRead_#(size, t))) read_ = tuple2(tpl_2(asIfc(read__)), tpl_1(asIfc(read__)));
  Tuple2#(Vector#(writes, ConditionalOutput_#(RegFileWrite#(size, t))), Vector#(writes, ConditionalOutput#(RegFileWrite#(size, t)))) write__ <- replicateTupleM(_ConditionalOutput(True, True));
  Tuple2#(Vector#(writes, ConditionalOutput#(RegFileWrite#(size, t))), Vector#(writes, ConditionalOutput_#(RegFileWrite#(size, t)))) write_ = tuple2(tpl_2(asIfc(write__)), tpl_1(asIfc(write__)));
  return tuple2(
    interface RegFile_;
      interface read = tpl_1(asIfc(read_));
      interface write = tpl_1(asIfc(write_));
    endinterface,
    interface RegFile;
      interface read = tpl_2(asIfc(read_));
      interface write = tpl_2(asIfc(write_));
    endinterface);
endmodule

instance Connectable#(RegFile#(reads, writes, size, t), RegFile_#(reads, writes, size, t)) provisos(Bits#(t, _sZt));
  module mkConnection#(RegFile#(reads, writes, size, t) a, RegFile_#(reads, writes, size, t) b)();
    mkConnection(asIfc(a.read), asIfc(b.read));
    mkConnection(asIfc(a.write), asIfc(b.write));
  endmodule
endinstance

instance Connectable#(RegFile_#(reads, writes, size, t), RegFile#(reads, writes, size, t)) provisos(Bits#(t, _sZt));
  module mkConnection#(RegFile_#(reads, writes, size, t) a, RegFile#(reads, writes, size, t) b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

module mkRegFileFunc#(function t init(Integer i))(RegFile#(reads, writes, size, t)) provisos(Bits#(t, tSz));
  Tuple2#(RegFile_#(reads, writes, size, t), RegFile#(reads, writes, size, t)) mod_ <- _RegFile;

  Reg#(Vector#(size, t)) regFileReg <- mkReg(genWith(init));

  rule a;
    Vector#(size, t) regFile = regFileReg;
    for(Integer i = 0; i < valueOf(reads); i = i + 1)
      (tpl_1(asIfc(mod_))).read[i].resp.write( regFile[(tpl_1(asIfc(mod_))).read[i].req]);
    for(Integer i = 0; i < valueOf(writes); i = i + 1)
      if((tpl_1(asIfc(mod_))).write[i].en)
        regFile[(tpl_1(asIfc(mod_))).write[i].index] = (tpl_1(asIfc(mod_))).write[i].data;
    regFileReg <= regFile;
  endrule

  return tpl_2(asIfc(mod_));
endmodule


module mkRegFile#(t init)(RegFile#(reads, writes, size, t))provisos(Bits#(t, tSz));
  RegFile#(reads, writes, size, t) mod_ <- mkRegFileFunc(constFn(init));
  return mod_;
endmodule

module mkMultiplePorts#(function _m__#(RegFile#(1, 1, size, t)) mkSingle())(RegFile#(reads, writes, size, t)) provisos(Bits#(t, tSz));
  Tuple2#(RegFile_#(reads, writes, size, t), RegFile#(reads, writes, size, t)) mod_ <- _RegFile;

  Vector#(writes, Vector#(reads, RegFile#(1, 1, size, t))) rf <- replicateM(replicateM(mkSingle));
  Reg#(Vector#(size, Index#(writes))) whichReg <- mkReg(replicate(0));

  rule a;
    Vector#(size, Index#(writes)) which = whichReg;
    for(Integer i = 0; i < valueOf(reads); i = i + 1)
    begin
      rf[valueOf(writes) > 1? which[(tpl_1(asIfc(mod_))).read[i].req] : 0][i].read[0].req.write( (tpl_1(asIfc(mod_))).read[i].req);
      (tpl_1(asIfc(mod_))).read[i].resp.write( rf[valueOf(writes) > 1? which[(tpl_1(asIfc(mod_))).read[i].req] : 0][i].read[0].resp);
    end
    for(Integer i = 0; i < valueOf(writes); i = i + 1)
      if((tpl_1(asIfc(mod_))).write[i].en)
      begin
        which[(tpl_1(asIfc(mod_))).write[i].index] = fromInteger(i);
        for(Integer j = 0; j < valueOf(reads); j = j + 1)
          rf[i][j].write[0].write( (tpl_1(asIfc(mod_))).write[i]);
      end
    whichReg <= which;
  endrule

  return tpl_2(asIfc(mod_));
endmodule

module mkRegFileLoadSingle#(Integer mode, String file)(RegFile#(1, 1, size, t)) provisos(Bits#(t, tSz));
  Tuple2#(RegFile_#(1, 1, size, t), RegFile#(1, 1, size, t)) mod_ <- _RegFile;

  RegFileVerilog_#(size, t) rf <- mkRegFileVerilogLoad_(mode, file);

  rule a;
    (tpl_1(asIfc(mod_))).read[0].resp.write( rf.read((tpl_1(asIfc(mod_))).read[0].req));
    if((tpl_1(asIfc(mod_))).write[0].en)
      rf.write((tpl_1(asIfc(mod_))).write[0].index, (tpl_1(asIfc(mod_))).write[0].data);
  endrule

  return tpl_2(asIfc(mod_));
endmodule


module mkRegFileU(RegFile#(reads, writes, size, t))provisos(Bits#(t, tSz));
  RegFile#(reads, writes, size, t) mod_ <- mkMultiplePorts(mkRegFileLoadSingle(0, ""));
  return mod_;
endmodule


module mkRegFileBinary#(String file)(RegFile#(reads, writes, size, t))provisos(Bits#(t, tSz));
  RegFile#(reads, writes, size, t) mod_ <- mkMultiplePorts(mkRegFileLoadSingle(1, file));
  return mod_;
endmodule


module mkRegFileVmh#(String file)(RegFile#(reads, writes, size, t))provisos(Bits#(t, tSz));
  RegFile#(reads, writes, size, t) mod_ <- mkMultiplePorts(mkRegFileLoadSingle(2, file));
  return mod_;
endmodule

