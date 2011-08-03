signature Fifo where {
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
	      
interface (Fifo.Fifo_ :: # -> * -> *) n t = {
    Fifo.enq :: Library.FifoEnq t;
    Fifo.deq :: Library.FifoDeq t
};
 
instance Fifo (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
	      ¶Prelude®¶.¶PrimMakeUndefined®¶ (Fifo.Fifo_ n t);
							      
instance Fifo (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) => ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Fifo.Fifo_ n t);
												 
instance Fifo (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
	      ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Fifo.Fifo_ n t);
								  
interface (Fifo.Fifo :: # -> * -> *) n t = {
    Fifo.enq :: Library.FifoEnq_ t;
    Fifo.deq :: Library.FifoDeq_ t
};
 
instance Fifo (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
	      ¶Prelude®¶.¶PrimMakeUndefined®¶ (Fifo.Fifo n t);
							     
instance Fifo (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) => ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Fifo.Fifo n t);
												
instance Fifo (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
	      ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Fifo.Fifo n t);
								 
Fifo._Fifo :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
	      _m__ (¶Prelude®¶.¶Tuple2®¶ (Fifo.Fifo_ n t) (Fifo.Fifo n t));
									  
instance Fifo (¶Prelude®¶.¶Bits®¶ t _sZt) =>
	      ¶Connectable®¶.¶Connectable®¶ (Fifo.Fifo n t) (Fifo.Fifo_ n t);
									    
instance Fifo (¶Prelude®¶.¶Bits®¶ t _sZt) =>
	      ¶Connectable®¶.¶Connectable®¶ (Fifo.Fifo_ n t) (Fifo.Fifo n t);
									    
Fifo.mkLFifo :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		_m__ (Fifo.Fifo n t);
				    
Fifo.mkFifo :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ (Fifo.Fifo n t);
												   
Fifo.mkBypassFifo :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		     _m__ (Fifo.Fifo n t);
					 
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
			¶Prelude®¶.¶String®¶ -> _m__ (RegFile.RegFile reads writes size t)
}
