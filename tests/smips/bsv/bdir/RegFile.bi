signature RegFile where {
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
	      
interface (RegFile.RegFileRead_ :: # -> * -> *) size t = {
    RegFile.req :: Primitive.ConditionalOutput_ (Library.Index size);
    RegFile.resp :: Primitive.Output t
};
 
instance RegFile (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUndefined®¶ (RegFile.RegFileRead_ size t);
									      
instance RegFile (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		 ¶Prelude®¶.¶PrimDeepSeqCond®¶ (RegFile.RegFileRead_ size t);
									    
instance RegFile (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUninitialized®¶ (RegFile.RegFileRead_ size t);
										  
interface (RegFile.RegFileRead :: # -> * -> *) size t = {
    RegFile.req :: Primitive.ConditionalOutput (Library.Index size);
    RegFile.resp :: Primitive.Output_ t
};
 
instance RegFile ¶Prelude®¶.¶PrimMakeUndefined®¶ (RegFile.RegFileRead size t);
									     
instance RegFile ¶Prelude®¶.¶PrimDeepSeqCond®¶ (RegFile.RegFileRead size t);
									   
instance RegFile ¶Prelude®¶.¶PrimMakeUninitialized®¶ (RegFile.RegFileRead size t);
										 
RegFile._RegFileRead :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			_m__ (¶Prelude®¶.¶Tuple2®¶ (RegFile.RegFileRead_ size t) (RegFile.RegFileRead size t));
													      
instance RegFile (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (RegFile.RegFileRead size t) (RegFile.RegFileRead_ size t);
													 
instance RegFile (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (RegFile.RegFileRead_ size t) (RegFile.RegFileRead size t);
													 
struct (RegFile.RegFileWrite :: # -> * -> *) size t = {
    RegFile.index :: Library.Index size;
    RegFile.¡data¡ :: t
};
 
instance RegFile (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUndefined®¶ (RegFile.RegFileWrite size t);
									      
instance RegFile (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		 ¶Prelude®¶.¶PrimDeepSeqCond®¶ (RegFile.RegFileWrite size t);
									    
instance RegFile (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUninitialized®¶ (RegFile.RegFileWrite size t);
										  
instance RegFile (¶Prelude®¶.¶Add®¶ (¶Prelude®¶.¶TLog®¶ size) _v104 _v100,
		  ¶Prelude®¶.¶Bits®¶ t _v104) =>
		 ¶Prelude®¶.¶Bits®¶ (RegFile.RegFileWrite size t) _v100;
								       
instance RegFile (¶Prelude®¶.¶Eq®¶ t) => ¶Prelude®¶.¶Eq®¶ (RegFile.RegFileWrite size t);
										       
interface (RegFile.RegFile_ :: # -> # -> # -> * -> *) reads writes size t = {
    RegFile.read :: ¶Vector®¶.¶Vector®¶ reads (RegFile.RegFileRead size t);
    RegFile.write :: ¶Vector®¶.¶Vector®¶ writes
		     (Primitive.ConditionalOutput (RegFile.RegFileWrite size t))
};
 
instance RegFile (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUndefined®¶ (RegFile.RegFile_ reads writes size t);
										       
instance RegFile (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		 ¶Prelude®¶.¶PrimDeepSeqCond®¶ (RegFile.RegFile_ reads writes size t);
										     
instance RegFile (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUninitialized®¶ (RegFile.RegFile_ reads writes size t);
											   
interface (RegFile.RegFile :: # -> # -> # -> * -> *) reads writes size t = {
    RegFile.read :: ¶Vector®¶.¶Vector®¶ reads (RegFile.RegFileRead_ size t);
    RegFile.write :: ¶Vector®¶.¶Vector®¶ writes
		     (Primitive.ConditionalOutput_ (RegFile.RegFileWrite size t))
};
 
instance RegFile (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUndefined®¶ (RegFile.RegFile reads writes size t);
										      
instance RegFile (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		 ¶Prelude®¶.¶PrimDeepSeqCond®¶ (RegFile.RegFile reads writes size t);
										    
instance RegFile (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUninitialized®¶ (RegFile.RegFile reads writes size t);
											  
RegFile._RegFile :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__
		    (¶Prelude®¶.¶Tuple2®¶ (RegFile.RegFile_ reads writes size t) (RegFile.RegFile reads writes size t));
														       
instance RegFile (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (RegFile.RegFile reads writes size t)
		 (RegFile.RegFile_ reads writes size t);
						       
instance RegFile (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (RegFile.RegFile_ reads writes size t)
		 (RegFile.RegFile reads writes size t);
						      
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
									      
Library.moduloIncr :: Library.Index n -> Library.Index n
}
