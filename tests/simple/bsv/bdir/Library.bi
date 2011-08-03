signature Library where {
import ¶Inout®¶;
	       
import ¶List®¶;
	      
import ¶ListN®¶;
	       
import ¶Monad®¶;
	       
import ¶PrimArray®¶;
		   
import ¶Vector®¶;
		
import Base;
	   
import ¶Connectable®¶;
		     
import HaskellLib;
		 
import Primitive;
		
interface (Library.FifoEnq_ :: * -> *) t = {
    Library.notFull :: Primitive.Output ¶Prelude®¶.¶Bool®¶;
    Library.enq :: Primitive.ConditionalOutput_ t
};
 
instance Library ¶Prelude®¶.¶PrimMakeUndefined®¶ (Library.FifoEnq_ t);
								     
instance Library ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Library.FifoEnq_ t);
								   
instance Library ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Library.FifoEnq_ t);
									 
interface (Library.FifoEnq :: * -> *) t = {
    Library.notFull :: Primitive.Output_ ¶Prelude®¶.¶Bool®¶;
    Library.enq :: Primitive.ConditionalOutput t
};
 
instance Library (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUndefined®¶ (Library.FifoEnq t);
								    
instance Library (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		 ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Library.FifoEnq t);
								  
instance Library (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Library.FifoEnq t);
									
Library._FifoEnq :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__ (¶Prelude®¶.¶Tuple2®¶ (Library.FifoEnq_ t) (Library.FifoEnq t));
											
instance Library (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (Library.FifoEnq t) (Library.FifoEnq_ t);
										       
instance Library (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (Library.FifoEnq_ t) (Library.FifoEnq t);
										       
interface (Library.FifoDeq_ :: * -> *) t = {
    Library.notEmpty :: Primitive.Output ¶Prelude®¶.¶Bool®¶;
    Library.first :: Primitive.Output t;
    Library.deq :: Primitive.OutputPulse_
};
 
instance Library (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUndefined®¶ (Library.FifoDeq_ t);
								     
instance Library (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		 ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Library.FifoDeq_ t);
								   
instance Library (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		 ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Library.FifoDeq_ t);
									 
interface (Library.FifoDeq :: * -> *) t = {
    Library.notEmpty :: Primitive.Output_ ¶Prelude®¶.¶Bool®¶;
    Library.first :: Primitive.Output_ t;
    Library.deq :: Primitive.OutputPulse
};
 
instance Library ¶Prelude®¶.¶PrimMakeUndefined®¶ (Library.FifoDeq t);
								    
instance Library ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Library.FifoDeq t);
								  
instance Library ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Library.FifoDeq t);
									
Library._FifoDeq :: (¶Prelude®¶.¶Bits®¶ t _sZt, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		    _m__ (¶Prelude®¶.¶Tuple2®¶ (Library.FifoDeq_ t) (Library.FifoDeq t));
											
instance Library (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (Library.FifoDeq t) (Library.FifoDeq_ t);
										       
instance Library (¶Prelude®¶.¶Bits®¶ t _sZt) =>
		 ¶Connectable®¶.¶Connectable®¶ (Library.FifoDeq_ t) (Library.FifoDeq t);
										       
interface (Library.Empty_ :: *) = {
};
 
instance Library ¶Prelude®¶.¶PrimMakeUndefined®¶ Library.Empty_;
							       
instance Library ¶Prelude®¶.¶PrimDeepSeqCond®¶ Library.Empty_;
							     
instance Library ¶Prelude®¶.¶PrimMakeUninitialized®¶ Library.Empty_;
								   
interface (Library.Empty :: *) = {
};
 
instance Library ¶Prelude®¶.¶PrimMakeUndefined®¶ Library.Empty;
							      
instance Library ¶Prelude®¶.¶PrimDeepSeqCond®¶ Library.Empty;
							    
instance Library ¶Prelude®¶.¶PrimMakeUninitialized®¶ Library.Empty;
								  
Library._Empty :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		  _m__ (¶Prelude®¶.¶Tuple2®¶ Library.Empty_ Library.Empty);
									  
instance Library ¶Connectable®¶.¶Connectable®¶ Library.Empty Library.Empty_;
									   
instance Library ¶Connectable®¶.¶Connectable®¶ Library.Empty_ Library.Empty;
									   
type (Library.Index :: # -> *) n = ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ n);
									   
type (Library.NumElems :: # -> *) n =
  ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ (¶Prelude®¶.¶TAdd®¶ n 1));
								 
Library.moduloPlus :: Library.NumElems n -> Library.Index n -> Library.Index n;
									      
Library.moduloIncr :: Library.Index n -> Library.Index n
}
