signature Primitive where {
import ¶Inout®¶;
	       
import ¶List®¶;
	      
import ¶ListN®¶;
	       
import ¶PrimArray®¶;
		   
import ¶Vector®¶;
		
import Base;
	   
import ¶Connectable®¶;
		     
interface (Primitive.Output_ :: * -> *) t {-# always_enabled  #-} = {
    Primitive.write :: t -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [¡WRITE¡],
						     prefixs = "",
						     always_enabled  #-}
};
 
instance Primitive ¶Prelude®¶.¶PrimMakeUndefined®¶ (Primitive.Output_ t);
									
instance Primitive ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Primitive.Output_ t);
								      
instance Primitive ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Primitive.Output_ t);
									    
interface (Primitive.Output :: * -> *) t {-# always_ready  #-} = {
    Primitive._read :: t {-# arg_names = [], result = "READ" #-}
};
 
instance Primitive (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		   ¶Prelude®¶.¶PrimMakeUndefined®¶ (Primitive.Output t);
								       
instance Primitive (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		   ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Primitive.Output t);
								     
instance Primitive (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		   ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Primitive.Output t);
									   
instance Primitive ¶Connectable®¶.¶Connectable®¶ (Primitive.Output_ t) (Primitive.Output t);
											   
instance Primitive ¶Connectable®¶.¶Connectable®¶ (Primitive.Output t) (Primitive.Output_ t);
											   
Primitive._Output :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
		     ¶Prelude®¶.¶Bool®¶ ->
		     ¶Prelude®¶.¶Bool®¶ -> _m__ (¶Prelude®¶.¶Tuple2®¶ (Primitive.Output_ t) (Primitive.Output t));
														 
interface (Primitive.OutputPulse_ :: *) {-# always_ready  #-} = {
    Primitive._read :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [], enable = "WRITE" #-}
};
 
instance Primitive ¶Prelude®¶.¶PrimMakeUndefined®¶ Primitive.OutputPulse_;
									 
instance Primitive ¶Prelude®¶.¶PrimDeepSeqCond®¶ Primitive.OutputPulse_;
								       
instance Primitive ¶Prelude®¶.¶PrimMakeUninitialized®¶ Primitive.OutputPulse_;
									     
type (Primitive.OutputPulse :: *) = Primitive.Output ¶Prelude®¶.¶Bool®¶;
								       
instance Primitive ¶Connectable®¶.¶Connectable®¶ Primitive.OutputPulse_ Primitive.OutputPulse;
											     
instance Primitive ¶Connectable®¶.¶Connectable®¶ Primitive.OutputPulse Primitive.OutputPulse_;
											     
Primitive._OutputPulse :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
			  ¶Prelude®¶.¶Bool®¶ ->
			  ¶Prelude®¶.¶Bool®¶ ->
			  _m__ (¶Prelude®¶.¶Tuple2®¶ Primitive.OutputPulse_ Primitive.OutputPulse);
												  
interface (Primitive.ConditionalOutput_ :: * -> *) t {-# always_ready  #-} = {
    Primitive.write :: t -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [¡WRITE¡],
						     enable = "EN_WRITE",
						     prefixs = "" #-}
};
 
instance Primitive ¶Prelude®¶.¶PrimMakeUndefined®¶ (Primitive.ConditionalOutput_ t);
										   
instance Primitive ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Primitive.ConditionalOutput_ t);
										 
instance Primitive ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Primitive.ConditionalOutput_ t);
										       
interface (Primitive.ConditionalOutput :: * -> *) t {-# always_ready  #-} = {
    Primitive._read :: t {-# arg_names = [], result = "READ" #-};
    Primitive.en :: ¶Prelude®¶.¶Bool®¶ {-# arg_names = [], result = "EN_READ" #-}
};
 
instance Primitive (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
		   ¶Prelude®¶.¶PrimMakeUndefined®¶ (Primitive.ConditionalOutput t);
										  
instance Primitive (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) =>
		   ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Primitive.ConditionalOutput t);
										
instance Primitive (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
		   ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Primitive.ConditionalOutput t);
										      
instance Primitive ¶Connectable®¶.¶Connectable®¶ (Primitive.ConditionalOutput_ t)
		   (Primitive.ConditionalOutput t);
						  
instance Primitive ¶Connectable®¶.¶Connectable®¶ (Primitive.ConditionalOutput t)
		   (Primitive.ConditionalOutput_ t);
						   
Primitive._ConditionalOutput :: (¶Prelude®¶.¶Bits®¶ t tSz, ¶Prelude®¶.¶IsModule®¶ _m__ _c__) =>
				¶Prelude®¶.¶Bool®¶ ->
				¶Prelude®¶.¶Bool®¶ ->
				_m__
				(¶Prelude®¶.¶Tuple2®¶ (Primitive.ConditionalOutput_ t) (Primitive.ConditionalOutput t))
}
