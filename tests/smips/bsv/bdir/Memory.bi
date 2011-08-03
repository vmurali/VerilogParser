signature Memory where {
import �Inout��;
	       
import �List��;
	      
import �ListN��;
	       
import �Monad��;
	       
import �PrimArray��;
		   
import RegFileVerilog;
		     
import �Vector��;
		
import Base;
	   
import �Connectable��;
		     
import HaskellLib;
		 
import Primitive;
		
import Library;
	      
import RegFile;
	      
import Types;
	    
interface (Memory.Memory_ :: *) = {
    Memory.instReqQ :: Library.FifoDeq_ Types.VAddr;
    Memory.instQ :: Library.FifoEnq_ Types.Inst;
    Memory.dataReqQ :: Library.FifoDeq_ Types.Mem;
    Memory.dataQ :: Library.FifoEnq_ Types.Inst
};
 
instance Memory �Prelude��.�PrimMakeUndefined�� Memory.Memory_;
							      
instance Memory �Prelude��.�PrimDeepSeqCond�� Memory.Memory_;
							    
instance Memory �Prelude��.�PrimMakeUninitialized�� Memory.Memory_;
								  
interface (Memory.Memory :: *) = {
    Memory.instReqQ :: Library.FifoDeq Types.VAddr;
    Memory.instQ :: Library.FifoEnq Types.Inst;
    Memory.dataReqQ :: Library.FifoDeq Types.Mem;
    Memory.dataQ :: Library.FifoEnq Types.Inst
};
 
instance Memory �Prelude��.�PrimMakeUndefined�� Memory.Memory;
							     
instance Memory �Prelude��.�PrimDeepSeqCond�� Memory.Memory;
							   
instance Memory �Prelude��.�PrimMakeUninitialized�� Memory.Memory;
								 
Memory._Memory :: (�Prelude��.�IsModule�� _m__ _c__) =>
		  _m__ (�Prelude��.�Tuple2�� Memory.Memory_ Memory.Memory);
									  
instance Memory �Connectable��.�Connectable�� Memory.Memory Memory.Memory_;
									  
instance Memory �Connectable��.�Connectable�� Memory.Memory_ Memory.Memory;
									  
Memory.mkMemory :: (�Prelude��.�IsModule�� _m__ _c__) => _m__ Memory.Memory;
									   
interface (Library.FifoEnq_ :: * -> *) t = {
    Library.notFull :: Primitive.Output �Prelude��.�Bool��;
    Library.enq :: Primitive.ConditionalOutput_ t
};
 
interface (Library.FifoEnq :: * -> *) t = {
    Library.notFull :: Primitive.Output_ �Prelude��.�Bool��;
    Library.enq :: Primitive.ConditionalOutput t
};
 
Library._FifoEnq :: (�Prelude��.�Bits�� t _sZt, �Prelude��.�IsModule�� _m__ _c__) =>
		    _m__ (�Prelude��.�Tuple2�� (Library.FifoEnq_ t) (Library.FifoEnq t));
											
interface (Library.FifoDeq_ :: * -> *) t = {
    Library.notEmpty :: Primitive.Output �Prelude��.�Bool��;
    Library.first :: Primitive.Output t;
    Library.deq :: Primitive.OutputPulse_
};
 
interface (Library.FifoDeq :: * -> *) t = {
    Library.notEmpty :: Primitive.Output_ �Prelude��.�Bool��;
    Library.first :: Primitive.Output_ t;
    Library.deq :: Primitive.OutputPulse
};
 
Library._FifoDeq :: (�Prelude��.�Bits�� t _sZt, �Prelude��.�IsModule�� _m__ _c__) =>
		    _m__ (�Prelude��.�Tuple2�� (Library.FifoDeq_ t) (Library.FifoDeq t));
											
interface (Library.Empty_ :: *) = {
};
 
interface (Library.Empty :: *) = {
};
 
Library._Empty :: (�Prelude��.�IsModule�� _m__ _c__) =>
		  _m__ (�Prelude��.�Tuple2�� Library.Empty_ Library.Empty);
									  
type (Library.Index :: # -> *) n = �Prelude��.�Bit�� (�Prelude��.�TLog�� n);
									   
type (Library.NumElems :: # -> *) n =
  �Prelude��.�Bit�� (�Prelude��.�TLog�� (�Prelude��.�TAdd�� n 1));
								 
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
 
RegFile._RegFileRead :: (�Prelude��.�Bits�� t _sZt, �Prelude��.�IsModule�� _m__ _c__) =>
			_m__ (�Prelude��.�Tuple2�� (RegFile.RegFileRead_ size t) (RegFile.RegFileRead size t));
													      
struct (RegFile.RegFileWrite :: # -> * -> *) size t = {
    RegFile.index :: Library.Index size;
    RegFile.�data� :: t
};
 
interface (RegFile.RegFile_ :: # -> # -> # -> * -> *) reads writes size t = {
    RegFile.read :: �Vector��.�Vector�� reads (RegFile.RegFileRead size t);
    RegFile.write :: �Vector��.�Vector�� writes
		     (Primitive.ConditionalOutput (RegFile.RegFileWrite size t))
};
 
interface (RegFile.RegFile :: # -> # -> # -> * -> *) reads writes size t = {
    RegFile.read :: �Vector��.�Vector�� reads (RegFile.RegFileRead_ size t);
    RegFile.write :: �Vector��.�Vector�� writes
		     (Primitive.ConditionalOutput_ (RegFile.RegFileWrite size t))
};
 
RegFile._RegFile :: (�Prelude��.�Bits�� t _sZt, �Prelude��.�IsModule�� _m__ _c__) =>
		    _m__
		    (�Prelude��.�Tuple2�� (RegFile.RegFile_ reads writes size t) (RegFile.RegFile reads writes size t));
														       
RegFile.mkRegFileFunc :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
			 (�Prelude��.�Integer�� -> t) -> _m__ (RegFile.RegFile reads writes size t);
												   
RegFile.mkRegFile :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
		     t -> _m__ (RegFile.RegFile reads writes size t);
								    
RegFile.mkMultiplePorts :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
			   _m__ (RegFile.RegFile 1 1 size t) -> _m__ (RegFile.RegFile reads writes size t);
													  
RegFile.mkRegFileLoadSingle :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
			       �Prelude��.�Integer�� -> �Prelude��.�String�� -> _m__ (RegFile.RegFile 1 1 size t);
														 
RegFile.mkRegFileU :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
		      _m__ (RegFile.RegFile reads writes size t);
								
RegFile.mkRegFileBinary :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
			   �Prelude��.�String�� -> _m__ (RegFile.RegFile reads writes size t);
											     
RegFile.mkRegFileVmh :: (�Prelude��.�Bits�� t tSz, �Prelude��.�IsModule�� _m__ _c__) =>
			�Prelude��.�String�� -> _m__ (RegFile.RegFile reads writes size t);
											  
type (Types.VAddr :: *) = �Prelude��.�Bit�� 32;
					      
type (Types.Inst :: *) = �Prelude��.�Bit�� 32;
					     
type (Types.Data :: *) = �Prelude��.�Bit�� 32;
					     
type (Types.NumRegs :: #) = 32;
			      
type (Types.RegIndexSz :: #) = �Prelude��.�TLog�� Types.NumRegs;
							       
type (Types.RegIndex :: *) = �Prelude��.�Bit�� Types.RegIndexSz;
							       
type (Types.SData :: *) = �Prelude��.�Int�� 32;
					      
struct (Types.Wb :: *) = {
    Types.index :: Types.RegIndex;
    Types.�data� :: �Prelude��.�Maybe�� Types.Data
};
 
data (Types.Mem :: *) = Types.Load Types.VAddr | Types.Store Types.MemWrite;
									   
struct (Types.PcQ :: *) = {
    Types.pc :: Types.VAddr;
    Types.epoch :: �Prelude��.�Bool��
};
 
type (Types.RegWrite :: *) = RegFile.RegFileWrite Types.NumRegs Types.Data;
									  
type (Types.MemWrite :: *) = RegFile.RegFileWrite (�Prelude��.�TExp�� 32) Types.Data
}
