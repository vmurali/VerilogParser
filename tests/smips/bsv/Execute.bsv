import Vector::*;
import HaskellLib::*;
import Connectable::*;
import Base::*;
import Primitive::*;
export Execute::*;

import Library::*;
export Library::*;

import Types::*;
export Types::*;

import RegFile::*;
export RegFile::*;

import Cop::*;
export Cop::*;

interface Execute_;
  interface FifoDeq_#(PcQ) pcQ;
  interface FifoDeq_#(Inst) instQ;
  interface FifoEnq_#(Mem) dataReqQ;
  interface Vector#(2, RegFileRead_#(NumRegs, Data)) regRead;
  interface FifoEnq_#(Wb) wbQ;
  interface ConditionalOutput#(RegIndex) wbIndex;
  interface Output#(Bool) currEpoch;
  interface ConditionalOutput_#(VAddr) branchPc;
  interface Cop cop;
endinterface

interface Execute;
  interface FifoDeq#(PcQ) pcQ;
  interface FifoDeq#(Inst) instQ;
  interface FifoEnq#(Mem) dataReqQ;
  interface Vector#(2, RegFileRead#(NumRegs, Data)) regRead;
  interface FifoEnq#(Wb) wbQ;
  interface ConditionalOutput_#(RegIndex) wbIndex;
  interface Output_#(Bool) currEpoch;
  interface ConditionalOutput#(VAddr) branchPc;
  interface Cop_ cop;
endinterface

module _Execute(Tuple2#(Execute_, Execute)) ;
  Tuple2#(FifoDeq_#(PcQ), FifoDeq#(PcQ)) pcQ_ <- _FifoDeq;
  Tuple2#(FifoDeq_#(Inst), FifoDeq#(Inst)) instQ_ <- _FifoDeq;
  Tuple2#(FifoEnq_#(Mem), FifoEnq#(Mem)) dataReqQ_ <- _FifoEnq;
  Tuple2#(Vector#(2, RegFileRead_#(NumRegs, Data)), Vector#(2, RegFileRead#(NumRegs, Data))) regRead_ <- replicateTupleM(_RegFileRead);
  Tuple2#(FifoEnq_#(Wb), FifoEnq#(Wb)) wbQ_ <- _FifoEnq;
  Tuple2#(ConditionalOutput_#(RegIndex), ConditionalOutput#(RegIndex)) wbIndex__ <- _ConditionalOutput(True, True);
  Tuple2#(ConditionalOutput#(RegIndex), ConditionalOutput_#(RegIndex)) wbIndex_ = tuple2(tpl_2(asIfc(wbIndex__)), tpl_1(asIfc(wbIndex__)));
  Tuple2#(Output_#(Bool), Output#(Bool)) currEpoch__ <- _Output(True, True);
  Tuple2#(Output#(Bool), Output_#(Bool)) currEpoch_ = tuple2(tpl_2(asIfc(currEpoch__)), tpl_1(asIfc(currEpoch__)));
  Tuple2#(ConditionalOutput_#(VAddr), ConditionalOutput#(VAddr)) branchPc_ <- _ConditionalOutput(True, True);
  Tuple2#(Cop_, Cop) cop__ <- _Cop;
  Tuple2#(Cop, Cop_) cop_ = tuple2(tpl_2(asIfc(cop__)), tpl_1(asIfc(cop__)));
  return tuple2(
    interface Execute_;
      interface pcQ = tpl_1(asIfc(pcQ_));
      interface instQ = tpl_1(asIfc(instQ_));
      interface dataReqQ = tpl_1(asIfc(dataReqQ_));
      interface regRead = tpl_1(asIfc(regRead_));
      interface wbQ = tpl_1(asIfc(wbQ_));
      interface wbIndex = tpl_1(asIfc(wbIndex_));
      interface currEpoch = tpl_1(asIfc(currEpoch_));
      interface branchPc = tpl_1(asIfc(branchPc_));
      interface cop = tpl_1(asIfc(cop_));
    endinterface,
    interface Execute;
      interface pcQ = tpl_2(asIfc(pcQ_));
      interface instQ = tpl_2(asIfc(instQ_));
      interface dataReqQ = tpl_2(asIfc(dataReqQ_));
      interface regRead = tpl_2(asIfc(regRead_));
      interface wbQ = tpl_2(asIfc(wbQ_));
      interface wbIndex = tpl_2(asIfc(wbIndex_));
      interface currEpoch = tpl_2(asIfc(currEpoch_));
      interface branchPc = tpl_2(asIfc(branchPc_));
      interface cop = tpl_2(asIfc(cop_));
    endinterface);
endmodule

instance Connectable#(Execute, Execute_) ;
  module mkConnection#(Execute a, Execute_ b)();
    mkConnection(asIfc(a.pcQ), asIfc(b.pcQ));
    mkConnection(asIfc(a.instQ), asIfc(b.instQ));
    mkConnection(asIfc(a.dataReqQ), asIfc(b.dataReqQ));
    mkConnection(asIfc(a.regRead), asIfc(b.regRead));
    mkConnection(asIfc(a.wbQ), asIfc(b.wbQ));
    mkConnection(asIfc(a.wbIndex), asIfc(b.wbIndex));
    mkConnection(asIfc(a.currEpoch), asIfc(b.currEpoch));
    mkConnection(asIfc(a.branchPc), asIfc(b.branchPc));
    mkConnection(asIfc(a.cop), asIfc(b.cop));
  endmodule
endinstance

instance Connectable#(Execute_, Execute) ;
  module mkConnection#(Execute_ a, Execute b)();
    mkConnection(asIfc(b), asIfc(a));
  endmodule
endinstance

(* synthesize *)
module mkExecute(Execute) ;
  Tuple2#(Execute_, Execute) mod_ <- _Execute;

  let inst = (tpl_1(asIfc(mod_))).instQ.first;
  let reg1 = inst[25:21];
  let reg2 = inst[20:16];
  match tagged PcQ{epoch:.epoch, pc:.pcPlus4} = (tpl_1(asIfc(mod_))).pcQ.first;

  rule r1;
    (tpl_1(asIfc(mod_))).regRead[0].req.write( reg1);
    (tpl_1(asIfc(mod_))).regRead[1].req.write( reg2);
  endrule

  rule r2;
    if(epoch != (tpl_1(asIfc(mod_))).currEpoch)
    begin
      (tpl_1(asIfc(mod_))).pcQ.deq;
      (tpl_1(asIfc(mod_))).instQ.deq;
    end
    else
    begin
      let stall = (isSrcValid(inst)[0] && (tpl_1(asIfc(mod_))).wbIndex.en && (tpl_1(asIfc(mod_))).wbIndex == reg1 || isSrcValid(inst)[1] && (tpl_1(asIfc(mod_))).wbIndex.en && (tpl_1(asIfc(mod_))).wbIndex == reg2);
      if(!stall)
      begin
        (tpl_1(asIfc(mod_))).pcQ.deq;
        (tpl_1(asIfc(mod_))).instQ.deq;
        let dest = getDest(inst);
        if(isBranch(inst))
        begin
          match {.taken, .branchTarget, .isLinked} = branch(inst, (tpl_1(asIfc(mod_))).regRead[0].resp, (tpl_1(asIfc(mod_))).regRead[1].resp, pcPlus4);
          if(taken)
            (tpl_1(asIfc(mod_))).branchPc.write( branchTarget);
          if(isLinked)
            (tpl_1(asIfc(mod_))).wbQ.enq.write( Wb{index: dest, data: tagged Valid pcPlus4});
        end
        else
        begin
          let res = aluDataAddr(inst, (tpl_1(asIfc(mod_))).regRead[0].resp, (tpl_1(asIfc(mod_))).regRead[1].resp);
          if(isLoad(inst))
          begin
            (tpl_1(asIfc(mod_))).wbQ.enq.write( Wb{index: dest, data: tagged Invalid});
            (tpl_1(asIfc(mod_))).dataReqQ.enq.write( tagged Load aluDataAddr(inst, (tpl_1(asIfc(mod_))).regRead[0].resp, (tpl_1(asIfc(mod_))).regRead[1].resp));
          end
          else if(isStore(inst))
          begin
            (tpl_1(asIfc(mod_))).dataReqQ.enq.write( tagged Store (MemWrite{index: res, data: (tpl_1(asIfc(mod_))).regRead[1].resp}));
          end
          else if(copRead(inst))
          begin
            (tpl_1(asIfc(mod_))).wbQ.enq.write( Wb{index: dest, data: tagged Valid ((tpl_1(asIfc(mod_))).cop.read)});
          end
          else if(copWrite(inst))
          begin
            (tpl_1(asIfc(mod_))).cop.write.write( RegWrite{index: copReg(inst), data: (tpl_1(asIfc(mod_))).regRead[1].resp});
          end
          else
          begin
            (tpl_1(asIfc(mod_))).wbQ.enq.write( Wb{index: dest, data: tagged Valid res});
          end
        end
      end
    end
  endrule

  return tpl_2(asIfc(mod_));
endmodule

function Vector#(2, Bool) isSrcValid(Inst inst);
  Vector#(2, Bool) ret = newVector;
  ret[0] = inst[25:21] != 0;
  ret[1] = inst[20:16] != 0;
  case (inst[31:26])
    'b100011, 'b001001, 'b001010, 'b001011, 'b001100, 'b001101, 'b001110:
      ret[1] = False;
    'b001111, 'b000010, 'b000011:
      ret = replicate(False);
    'b000000:
      case (inst[5:0])
        'b000000, 'b000010, 'b000011:
          ret[0] = False;
        'b001000, 'b001001:
          ret[1] = False;
      endcase
    'b000110, 'b000111, 'b000001:
      ret[1] = False;
    'b010000:
      case (inst[25:21])
        'b00000:
          ret = replicate(False);
        'b00100:
          ret[0] = False;
      endcase
  endcase
  return ret;
endfunction

function RegIndex getDest(Inst inst);
  RegIndex ret = inst[15:11];
  case (inst[31:26])
    'b100011, 'b001001, 'b001010, 'b001011, 'b001100, 'b001101, 'b001110, 'b001111, 'b010000:
      ret = inst[20:16];
    'b000011:
      ret = 31;
  endcase
  return ret;
endfunction

function Bool isRegWrite(Inst inst);
  Bool ret = True;
  case (inst[31:26])
    'b101011, 'b000010, 'b000100, 'b000101, 'b000110, 'b000111, 'b000001:
      ret = False;
    'b000000:
      case (inst[5:0])
        'b001000: ret = False;
      endcase
    'b010000:
      case (inst[25:21])
        'b00100:
          ret = False;
      endcase
  endcase
  return ret;
endfunction

function Bool isLoad(Inst inst)  = inst[31:26] == 'b100011;
function Bool isStore(Inst inst) = inst[31:26] == 'b101011;

function Bool isBranch(Inst inst);
  Bool ret = False;
  case (inst[31:26])
    'b000010, 'b000011, 'b000100, 'b000101, 'b000110, 'b000111, 'b000001:
      ret = True;
    'b000000:
      case (inst[5:0])
        'b001000, 'b001001:
          ret = True;
      endcase
  endcase
  return ret;
endfunction

function Bool copRead(Inst inst)  = inst[31:26] == 'b010000 && inst[25:21] == 'b00000;
function Bool copWrite(Inst inst) = inst[31:26] == 'b010000 && inst[25:21] == 'b00100;

function RegIndex copReg(Inst inst) = inst[15:11];

function Data aluDataAddr(Inst inst, Data src1, Data src2);
  SData ssrc1 = unpack(src1);
  SData ssrc2 = unpack(src2);
  Data  imm = signExtend(inst[15:0]);
  Data zimm = zeroExtend(inst[15:0]);
  SData simm = unpack(imm);
  Int#(5) shamt = unpack(inst[10:6]);
  Int#(5) rshamt = unpack(src1[4:0]);
  Data ret = ?;
  case (inst[31:26])
    'b100011, 'b101011:
      ret = src1 + imm;
    'b001001:
      ret = src1 + imm;
    'b001010:
      ret = (ssrc1 < simm)? 1: 0;
    'b001011:
      ret = (src1 < imm)? 1: 0;
    'b001100:
      ret = src1 & zimm;
    'b001101:
      ret = src1 | zimm;
    'b001110:
      ret = src1 ^ zimm;
    'b001111:
      ret = {inst[15:0], 16'b0};
    'b000000:
      case (inst[5:0])
        'b000000:
          ret = src2 << shamt;
        'b000010:
          ret = src2 >> shamt;
        'b000011:
          ret = pack(ssrc2 >> shamt);
        'b000100:
          ret = src2 << rshamt;
        'b000110:
          ret = src2 >> rshamt;
        'b000111:
          ret = pack(ssrc2 >> rshamt);
        'b100001:
          ret = src1 + src2;
        'b100011:
          ret = src1 - src2;
        'b100100:
          ret = src1 & src2;
        'b100101:
          ret = src1 | src2;
        'b100110:
          ret = src1 ^ src2;
        'b100111:
          ret = ~(src1 | src2);
        'b101010:
          ret = (ssrc1 < ssrc2)? 1: 0;
        'b101011:
          ret = (src1 < src2)? 1: 0;
      endcase
  endcase
  return ret;
endfunction

function Tuple3#(Bool , VAddr , Bool ) branch(Inst inst, Data src1, Data src2, VAddr pcPlus4);
  Data  imm = signExtend(inst[15:0]);
  SData ssrc1 = unpack(src1);
  VAddr branchTarget = pcPlus4 + (imm << 2);
  Tuple3#(Bool, VAddr, Bool) ret = tuple3(?, ?, ?);
  case (inst[31:26])
    'b000000:
      case (inst[5:0])
        'b001000:
          ret = tuple3(True, src1, False);
        'b001001:
          ret = tuple3(True, src1, True);
      endcase
    'b000010:
      ret = tuple3(True, {pcPlus4[31:28], inst[25:0], 2'b0}, False);
    'b000011:
      ret = tuple3(True, {pcPlus4[31:28], inst[25:0], 2'b0}, True);
    'b000100:
      ret = tuple3(src1 == src2, (src1 == src2)? branchTarget: pcPlus4, False);
    'b000101:
      ret = tuple3(src1 != src2, (src1 != src2)? branchTarget: pcPlus4, False);
    'b000110:
      ret = tuple3(src1 == 0 || src1[31] == 1, (src1 == 0 || src1[31] == 1)? branchTarget: pcPlus4, False);
    'b000111:
      ret = tuple3(ssrc1 > 0, (ssrc1 > 0)? branchTarget: pcPlus4, False);
    'b000001:
      case (inst[20:16])
        'b00000:
          ret = tuple3(src1[31] == 1, (src1[31] == 1)? branchTarget: pcPlus4, False);
        'b00001:
          ret = tuple3(src1[31] == 0, (src1[31] == 0)? branchTarget: pcPlus4, False);
      endcase
  endcase
  return ret;
endfunction

