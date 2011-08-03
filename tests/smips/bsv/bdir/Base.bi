signature Base where {
import ¶List®¶;
	      
import ¶PrimArray®¶;
		   
import ¶Vector®¶;
		
interface (Base.Wire :: * -> *) t {-# always_ready  #-} = {
    Base.write :: t -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [x] #-};
    Base._read :: t {-# arg_names = [] #-}
};
 
instance Base (¶Prelude®¶.¶PrimMakeUndefined®¶ t) => ¶Prelude®¶.¶PrimMakeUndefined®¶ (Base.Wire t);
												  
instance Base (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) => ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Base.Wire t);
											      
instance Base (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
	      ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Base.Wire t);
							       
Base.mkWire :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__, ¶Prelude®¶.¶Bits®¶ t tSz) => _m__ (Base.Wire t);
												 
interface (Base.Pulse :: *) {-# always_ready  #-} = {
    Base.send :: ¶Prelude®¶.¶Action®¶ {-# arg_names = [] #-};
    Base._read :: ¶Prelude®¶.¶Bool®¶ {-# arg_names = [] #-}
};
 
instance Base ¶Prelude®¶.¶PrimMakeUndefined®¶ Base.Pulse;
							
instance Base ¶Prelude®¶.¶PrimDeepSeqCond®¶ Base.Pulse;
						      
instance Base ¶Prelude®¶.¶PrimMakeUninitialized®¶ Base.Pulse;
							    
Base.mkPulse :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__) => _m__ Base.Pulse;
								     
interface (Base.Reg :: * -> *) t {-# always_ready  #-} = {
    Base._read :: t {-# arg_names = [] #-};
    Base._write :: t -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [d] #-}
};
 
instance Base (¶Prelude®¶.¶PrimMakeUndefined®¶ t) => ¶Prelude®¶.¶PrimMakeUndefined®¶ (Base.Reg t);
												 
instance Base (¶Prelude®¶.¶PrimDeepSeqCond®¶ t) => ¶Prelude®¶.¶PrimDeepSeqCond®¶ (Base.Reg t);
											     
instance Base (¶Prelude®¶.¶PrimMakeUninitialized®¶ t) =>
	      ¶Prelude®¶.¶PrimMakeUninitialized®¶ (Base.Reg t);
							      
Base.mkReg :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__, ¶Prelude®¶.¶Bits®¶ t tSz) =>
	      t -> _m__ (Base.Reg t);
				    
Base.mkRegU :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__, ¶Prelude®¶.¶Bits®¶ t tSz) => _m__ (Base.Reg t);
												
Base.truncate :: ¶Prelude®¶.¶Bit®¶ n -> ¶Prelude®¶.¶Bit®¶ m;
							   
Base.truncateLSB :: ¶Prelude®¶.¶Bit®¶ n -> ¶Prelude®¶.¶Bit®¶ m;
							      
Base.zeroExtend :: ¶Prelude®¶.¶Bit®¶ n -> ¶Prelude®¶.¶Bit®¶ m;
							     
Base.signExtend :: ¶Prelude®¶.¶Bit®¶ n -> ¶Prelude®¶.¶Bit®¶ m;
							     
interface (¶Base©¶.¶_Base.Wire8©¶ :: # -> # -> *) _n0 _n1 {-# always_ready  #-} = {
    Base.write :: ¶Prelude®¶.¶Bit®¶ _n0 -> ¶Prelude®¶.¶ActionValue_®¶ _n1 {-# prefixs = "write",
									      result = "write",
									      ready = "RDY_write",
									      enable = "EN_write",
									      always_ready  #-};
    Base._read :: ¶Prelude®¶.¶Bit®¶ _n0 {-# prefixs = "_read",
					    result = "_read",
					    ready = "RDY__read",
					    enable = "EN__read",
					    always_ready  #-}
};
 
instance Base ¶Prelude®¶.¶PrimMakeUndefined®¶ (¶Base©¶.¶_Base.Wire8©¶ _n0 _n1);
									      
instance Base ¶Prelude®¶.¶PrimDeepSeqCond®¶ (¶Base©¶.¶_Base.Wire8©¶ _n0 _n1);
									    
instance Base ¶Prelude®¶.¶PrimMakeUninitialized®¶ (¶Base©¶.¶_Base.Wire8©¶ _n0 _n1);
										  
interface (¶Base©¶.¶_Base.Pulse26©¶ :: # -> *) _n0 {-# always_ready  #-} = {
    Base.send :: ¶Prelude®¶.¶ActionValue_®¶ _n0 {-# prefixs = "send",
						    result = "send",
						    ready = "RDY_send",
						    enable = "EN_send",
						    always_ready  #-};
    Base._read :: ¶Prelude®¶.¶Bit®¶ 1 {-# prefixs = "_read",
					  result = "_read",
					  ready = "RDY__read",
					  enable = "EN__read",
					  always_ready  #-}
};
 
instance Base ¶Prelude®¶.¶PrimMakeUndefined®¶ (¶Base©¶.¶_Base.Pulse26©¶ _n0);
									    
instance Base ¶Prelude®¶.¶PrimDeepSeqCond®¶ (¶Base©¶.¶_Base.Pulse26©¶ _n0);
									  
instance Base ¶Prelude®¶.¶PrimMakeUninitialized®¶ (¶Base©¶.¶_Base.Pulse26©¶ _n0);
										
interface (¶Base©¶.¶_Base.Reg43©¶ :: # -> # -> *) _n0 _n1 {-# always_ready  #-} = {
    Base._read :: ¶Prelude®¶.¶Bit®¶ _n1 {-# prefixs = "_read",
					    result = "_read",
					    ready = "RDY__read",
					    enable = "EN__read",
					    always_ready  #-};
    Base._write :: ¶Prelude®¶.¶Bit®¶ _n1 -> ¶Prelude®¶.¶ActionValue_®¶ _n0 {-# prefixs = "_write",
									       result = "_write",
									       ready = "RDY__write",
									       enable = "EN__write",
									       always_ready  #-}
};
 
instance Base ¶Prelude®¶.¶PrimMakeUndefined®¶ (¶Base©¶.¶_Base.Reg43©¶ _n0 _n1);
									      
instance Base ¶Prelude®¶.¶PrimDeepSeqCond®¶ (¶Base©¶.¶_Base.Reg43©¶ _n0 _n1);
									    
instance Base ¶Prelude®¶.¶PrimMakeUninitialized®¶ (¶Base©¶.¶_Base.Reg43©¶ _n0 _n1);
										  
interface (¶Base©¶.¶_Base.Reg55©¶ :: # -> # -> *) _n0 _n1 {-# always_ready  #-} = {
    Base._read :: ¶Prelude®¶.¶Bit®¶ _n1 {-# prefixs = "_read",
					    result = "_read",
					    ready = "RDY__read",
					    enable = "EN__read",
					    always_ready  #-};
    Base._write :: ¶Prelude®¶.¶Bit®¶ _n1 -> ¶Prelude®¶.¶ActionValue_®¶ _n0 {-# prefixs = "_write",
									       result = "_write",
									       ready = "RDY__write",
									       enable = "EN__write",
									       always_ready  #-}
};
 
instance Base ¶Prelude®¶.¶PrimMakeUndefined®¶ (¶Base©¶.¶_Base.Reg55©¶ _n0 _n1);
									      
instance Base ¶Prelude®¶.¶PrimDeepSeqCond®¶ (¶Base©¶.¶_Base.Reg55©¶ _n0 _n1);
									    
instance Base ¶Prelude®¶.¶PrimMakeUninitialized®¶ (¶Base©¶.¶_Base.Reg55©¶ _n0 _n1)
}
