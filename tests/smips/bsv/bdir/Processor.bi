signature Processor where {
import ¶Inout®¶;
	       
import ¶List®¶;
	      
import ¶ListN®¶;
	       
import ¶Monad®¶;
	       
import ¶PrimArray®¶;
		   
import RegFileVerilog;
		     
import ¶Vector®¶;
		
import Base;
	   
import ¶Connectable®¶;
		     
import HaskellLib;
		 
import Primitive;
		
import Library;
	      
import RegFile;
	      
import Fifo;
	   
import Types;
	    
import Cop;
	  
import Execute;
	      
import Fetch;
	    
import Memory;
	     
import Registers;
		
import Writeback;
		
interface (Processor.Core_ :: *) = {
    Processor.mem :: Memory.Memory
};
 
instance Processor ¶Prelude®¶.¶PrimMakeUndefined®¶ Processor.Core_;
								  
instance Processor ¶Prelude®¶.¶PrimDeepSeqCond®¶ Processor.Core_;
								
instance Processor ¶Prelude®¶.¶PrimMakeUninitialized®¶ Processor.Core_;
								      
interface (Processor.Core :: *) = {
    Processor.mem :: Memory.Memory_
};
 
instance Processor ¶Prelude®¶.¶PrimMakeUndefined®¶ Processor.Core;
								 
instance Processor ¶Prelude®¶.¶PrimDeepSeqCond®¶ Processor.Core;
							       
instance Processor ¶Prelude®¶.¶PrimMakeUninitialized®¶ Processor.Core;
								     
Processor._Core :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		   _m__ (¶Prelude®¶.¶Tuple2®¶ Processor.Core_ Processor.Core);
									     
instance Processor ¶Connectable®¶.¶Connectable®¶ Processor.Core Processor.Core_;
									       
instance Processor ¶Connectable®¶.¶Connectable®¶ Processor.Core_ Processor.Core;
									       
Processor.mkPcQ :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo 3 Types.PcQ);
										     
Processor.mkInstReqQ :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo 6 Types.VAddr);
											    
Processor.mkInstQ :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo 2 Types.Inst);
											
Processor.mkDataReqQ :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo 1 Types.Mem);
											  
Processor.mkDataQ :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo 4 Types.Data);
											
Processor.mkCore :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Processor.Core;
									     
Processor.mkProcessor :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Library.Empty;
										 
interface (Library.FifoEnq_ :: * -> *) t = {
    Library.notFull :: Primitive.Output ¶Prelude®¶.¶Bool®¶;
    Library.enq :: Primitive.ConditionalOutput_ t
};
 
interface (Library.FifoEnq :: * -> *) t = {
    Library.notFull :: Primitive.Output_ ¶Prelude®¶.¶Bool®¶;
    Library.enq :: Primitive.ConditionalOutput t
};
 
Library._FifoEnq :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__ (¶Prelude®¶.¶Tuple2®¶ (Library.FifoEnq_ t) (Library.FifoEnq t));
											
interface (Library.FifoDeq_ :: * -> *) t = {
    Library.notEmpty :: Primitive.Output ¶Prelude®¶.¶Bool®¶;
    Library.first :: Primitive.Output t;
    Library.deq :: Primitive.OutputPulse_
};
 
interface (Library.FifoDeq :: * -> *) t = {
    Library.notEmpty :: Primitive.Output_ ¶Prelude®¶.¶Bool®¶;
    Library.first :: Primitive.Output_ t;
    Library.deq :: Primitive.OutputPulse
};
 
Library._FifoDeq :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__ (¶Prelude®¶.¶Tuple2®¶ (Library.FifoDeq_ t) (Library.FifoDeq t));
											
interface (Library.Empty_ :: *) = {
};
 
interface (Library.Empty :: *) = {
};
 
Library._Empty :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		  _m__ (¶Prelude®¶.¶Tuple2®¶ Library.Empty_ Library.Empty);
									  
type (Library.Index :: # -> *) n = ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ n);
									   
type (Library.NumElems :: # -> *) n =
  ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ (¶Prelude®¶.¶TAdd®¶ n 1));
								 
Library.moduloPlus :: Library.NumElems n -> Library.Index n -> Library.Index n;
									      
Library.moduloIncr :: Library.Index n -> Library.Index n;
							
interface (RegFile.RegFileRead_ :: # -> * -> *) size t = {
    RegFile.req :: Primitive.ConditionalOutput_ (Library.Index size);
    RegFile.resp :: Primitive.Output t
};
 
interface (RegFile.RegFileRead :: # -> * -> *) size t = {
    RegFile.req :: Primitive.ConditionalOutput (Library.Index size);
    RegFile.resp :: Primitive.Output_ t
};
 
RegFile._RegFileRead :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			_m__ (¶Prelude®¶.¶Tuple2®¶ (RegFile.RegFileRead_ size t) (RegFile.RegFileRead size t));
													      
struct (RegFile.RegFileWrite :: # -> * -> *) size t = {
    RegFile.index :: Library.Index size;
    RegFile.¡data¡ :: t
};
 
interface (RegFile.RegFile_ :: # -> # -> # -> * -> *) reads writes size t = {
    RegFile.read :: ¶Vector®¶.¶Vector®¶ reads (RegFile.RegFileRead size t);
    RegFile.write :: ¶Vector®¶.¶Vector®¶ writes
		     (Primitive.ConditionalOutput (RegFile.RegFileWrite size t))
};
 
interface (RegFile.RegFile :: # -> # -> # -> * -> *) reads writes size t = {
    RegFile.read :: ¶Vector®¶.¶Vector®¶ reads (RegFile.RegFileRead_ size t);
    RegFile.write :: ¶Vector®¶.¶Vector®¶ writes
		     (Primitive.ConditionalOutput_ (RegFile.RegFileWrite size t))
};
 
RegFile._RegFile :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__
		    (¶Prelude®¶.¶Tuple2®¶ (RegFile.RegFile_ reads writes size t) (RegFile.RegFile reads writes size t));
														       
RegFile.mkRegFileFunc :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			 (¶Prelude®¶.¶Integer®¶ -> t) -> _m__ (RegFile.RegFile reads writes size t);
												   
RegFile.mkRegFile :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		     t -> _m__ (RegFile.RegFile reads writes size t);
								    
RegFile.mkMultiplePorts :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			   _m__ (RegFile.RegFile 1 1 size t) -> _m__ (RegFile.RegFile reads writes size t);
													  
RegFile.mkRegFileLoadSingle :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			       ¶Prelude®¶.¶Integer®¶ -> ¶Prelude®¶.¶String®¶ -> _m__ (RegFile.RegFile 1 1 size t);
														 
RegFile.mkRegFileU :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		      _m__ (RegFile.RegFile reads writes size t);
								
RegFile.mkRegFileBinary :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			   ¶Prelude®¶.¶String®¶ -> _m__ (RegFile.RegFile reads writes size t);
											     
RegFile.mkRegFileVmh :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			¶Prelude®¶.¶String®¶ -> _m__ (RegFile.RegFile reads writes size t);
											  
interface (Fifo.Fifo_ :: # -> * -> *) n t = {
    Fifo.enq :: Library.FifoEnq t;
    Fifo.deq :: Library.FifoDeq t
};
 
interface (Fifo.Fifo :: # -> * -> *) n t = {
    Fifo.enq :: Library.FifoEnq_ t;
    Fifo.deq :: Library.FifoDeq_ t
};
 
Fifo._Fifo :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
	      _m__ (¶Prelude®¶.¶Tuple2®¶ (Fifo.Fifo_ n t) (Fifo.Fifo n t));
									  
Fifo.mkLFifo :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		_m__ (Fifo.Fifo n t);
				    
Fifo.mkFifo :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo n t);
												   
Fifo.mkBypassFifo :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		     _m__ (Fifo.Fifo n t);
					 
type (Types.VAddr :: *) = ¶Prelude®¶.¶Bit®¶ 32;
					      
type (Types.Inst :: *) = ¶Prelude®¶.¶Bit®¶ 32;
					     
type (Types.Data :: *) = ¶Prelude®¶.¶Bit®¶ 32;
					     
type (Types.NumRegs :: #) = 32;
			      
type (Types.RegIndexSz :: #) = ¶Prelude®¶.¶TLog®¶ Types.NumRegs;
							       
type (Types.RegIndex :: *) = ¶Prelude®¶.¶Bit®¶ Types.RegIndexSz;
							       
type (Types.SData :: *) = ¶Prelude®¶.¶Int®¶ 32;
					      
struct (Types.Wb :: *) = {
    Types.index :: Types.RegIndex;
    Types.¡data¡ :: ¶Prelude®¶.¶Maybe®¶ Types.Data
};
 
data (Types.Mem :: *) = Types.Load Types.VAddr | Types.Store Types.MemWrite;
									   
struct (Types.PcQ :: *) = {
    Types.pc :: Types.VAddr;
    Types.epoch :: ¶Prelude®¶.¶Bool®¶
};
 
type (Types.RegWrite :: *) = RegFile.RegFileWrite Types.NumRegs Types.Data;
									  
type (Types.MemWrite :: *) = RegFile.RegFileWrite (¶Prelude®¶.¶TExp®¶ 32) Types.Data;
										    
interface (Cop.Cop_ :: *) = {
    Cop.write :: Primitive.ConditionalOutput Types.RegWrite;
    Cop.read :: Primitive.Output_ Types.Data
};
 
interface (Cop.Cop :: *) = {
    Cop.write :: Primitive.ConditionalOutput_ Types.RegWrite;
    Cop.read :: Primitive.Output Types.Data
};
 
Cop._Cop :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (¶Prelude®¶.¶Tuple2®¶ Cop.Cop_ Cop.Cop);
											      
Cop.mkCop :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Cop.Cop;
							       
interface (Execute.Execute_ :: *) = {
    Execute.pcQ :: Library.FifoDeq_ Types.PcQ;
    Execute.instQ :: Library.FifoDeq_ Types.Inst;
    Execute.dataReqQ :: Library.FifoEnq_ Types.Mem;
    Execute.regRead :: ¶Vector®¶.¶Vector®¶ 2 (RegFile.RegFileRead_ Types.NumRegs Types.Data);
    Execute.wbQ :: Library.FifoEnq_ Types.Wb;
    Execute.wbIndex :: Primitive.ConditionalOutput Types.RegIndex;
    Execute.currEpoch :: Primitive.Output ¶Prelude®¶.¶Bool®¶;
    Execute.branchPc :: Primitive.ConditionalOutput_ Types.VAddr;
    Execute.cop :: Cop.Cop
};
 
interface (Execute.Execute :: *) = {
    Execute.pcQ :: Library.FifoDeq Types.PcQ;
    Execute.instQ :: Library.FifoDeq Types.Inst;
    Execute.dataReqQ :: Library.FifoEnq Types.Mem;
    Execute.regRead :: ¶Vector®¶.¶Vector®¶ 2 (RegFile.RegFileRead Types.NumRegs Types.Data);
    Execute.wbQ :: Library.FifoEnq Types.Wb;
    Execute.wbIndex :: Primitive.ConditionalOutput_ Types.RegIndex;
    Execute.currEpoch :: Primitive.Output_ ¶Prelude®¶.¶Bool®¶;
    Execute.branchPc :: Primitive.ConditionalOutput Types.VAddr;
    Execute.cop :: Cop.Cop_
};
 
Execute._Execute :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__ (¶Prelude®¶.¶Tuple2®¶ Execute.Execute_ Execute.Execute);
										
Execute.mkExecute :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Execute.Execute;
									       
Execute.isSrcValid :: Types.Inst -> ¶Vector®¶.¶Vector®¶ 2 ¶Prelude®¶.¶Bool®¶;
									    
Execute.getDest :: Types.Inst -> Types.RegIndex;
					       
Execute.isRegWrite :: Types.Inst -> ¶Prelude®¶.¶Bool®¶;
						      
Execute.isLoad :: Types.Inst -> ¶Prelude®¶.¶Bool®¶;
						  
Execute.isStore :: Types.Inst -> ¶Prelude®¶.¶Bool®¶;
						   
Execute.isBranch :: Types.Inst -> ¶Prelude®¶.¶Bool®¶;
						    
Execute.copRead :: Types.Inst -> ¶Prelude®¶.¶Bool®¶;
						   
Execute.copWrite :: Types.Inst -> ¶Prelude®¶.¶Bool®¶;
						    
Execute.copReg :: Types.Inst -> Types.RegIndex;
					      
Execute.aluDataAddr :: Types.Inst -> Types.Data -> Types.Data -> Types.Data;
									   
Execute.branch :: Types.Inst ->
		  Types.Data ->
		  Types.Data -> Types.VAddr -> ¶Prelude®¶.¶Tuple3®¶ ¶Prelude®¶.¶Bool®¶ Types.VAddr ¶Prelude®¶.¶Bool®¶;
														     
interface (Fetch.Fetch_ :: *) = {
    Fetch.currEpoch :: Primitive.Output_ ¶Prelude®¶.¶Bool®¶;
    Fetch.pcQ :: Library.FifoEnq_ Types.PcQ;
    Fetch.instReqQ :: Library.FifoEnq_ Types.VAddr;
    Fetch.branchPc :: Primitive.ConditionalOutput Types.VAddr
};
 
interface (Fetch.Fetch :: *) = {
    Fetch.currEpoch :: Primitive.Output ¶Prelude®¶.¶Bool®¶;
    Fetch.pcQ :: Library.FifoEnq Types.PcQ;
    Fetch.instReqQ :: Library.FifoEnq Types.VAddr;
    Fetch.branchPc :: Primitive.ConditionalOutput_ Types.VAddr
};
 
Fetch._Fetch :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		_m__ (¶Prelude®¶.¶Tuple2®¶ Fetch.Fetch_ Fetch.Fetch);
								    
Fetch.mkFetch :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Fetch.Fetch;
								       
interface (Memory.Memory_ :: *) = {
    Memory.instReqQ :: Library.FifoDeq_ Types.VAddr;
    Memory.instQ :: Library.FifoEnq_ Types.Inst;
    Memory.dataReqQ :: Library.FifoDeq_ Types.Mem;
    Memory.dataQ :: Library.FifoEnq_ Types.Inst
};
 
interface (Memory.Memory :: *) = {
    Memory.instReqQ :: Library.FifoDeq Types.VAddr;
    Memory.instQ :: Library.FifoEnq Types.Inst;
    Memory.dataReqQ :: Library.FifoDeq Types.Mem;
    Memory.dataQ :: Library.FifoEnq Types.Inst
};
 
Memory._Memory :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		  _m__ (¶Prelude®¶.¶Tuple2®¶ Memory.Memory_ Memory.Memory);
									  
Memory.mkMemory :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Memory.Memory;
									   
interface (Registers.Registers_ :: *) = {
    Registers.read :: ¶Vector®¶.¶Vector®¶ 2 (RegFile.RegFileRead Types.NumRegs Types.Data);
    Registers.write :: Primitive.ConditionalOutput Types.RegWrite
};
 
interface (Registers.Registers :: *) = {
    Registers.read :: ¶Vector®¶.¶Vector®¶ 2 (RegFile.RegFileRead_ Types.NumRegs Types.Data);
    Registers.write :: Primitive.ConditionalOutput_ Types.RegWrite
};
 
Registers._Registers :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			_m__ (¶Prelude®¶.¶Tuple2®¶ Registers.Registers_ Registers.Registers);
											    
Registers.mkRegisters :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Registers.Registers;
										       
interface (Writeback.Writeback_ :: *) = {
    Writeback.wb :: Library.FifoEnq Types.Wb;
    Writeback.wbIndex :: Primitive.ConditionalOutput_ Types.RegIndex;
    Writeback.dataQ :: Library.FifoDeq_ Types.Data;
    Writeback.regWrite :: Primitive.ConditionalOutput_ Types.RegWrite
};
 
interface (Writeback.Writeback :: *) = {
    Writeback.wb :: Library.FifoEnq_ Types.Wb;
    Writeback.wbIndex :: Primitive.ConditionalOutput Types.RegIndex;
    Writeback.dataQ :: Library.FifoDeq Types.Data;
    Writeback.regWrite :: Primitive.ConditionalOutput Types.RegWrite
};
 
Writeback._Writeback :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			_m__ (¶Prelude®¶.¶Tuple2®¶ Writeback.Writeback_ Writeback.Writeback);
											    
Writeback.mkWriteback :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Writeback.Writeback
}
