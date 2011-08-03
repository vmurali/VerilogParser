signature RegFileVerilog where {
interface (RegFileVerilog.RegFileVerilog_ :: # -> * -> *) size t {-# always_ready  #-} = {
    RegFileVerilog.read :: ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ size) ->
			   t {-# arg_names = [addr] #-};
    RegFileVerilog.write :: ¶Prelude®¶.¶Bit®¶ (¶Prelude®¶.¶TLog®¶ size) ->
			    t -> ¶Prelude®¶.¶Action®¶ {-# arg_names = [addr, ¡data¡] #-}
};
 
instance RegFileVerilog (¶Prelude®¶.¶PrimMakeUndefined®¶ t) =>
			¶Prelude®¶.¶PrimMakeUndefined®¶ (RegFileVerilog.RegFileVerilog_ size t);
											       
instance RegFileVerilog ¶Prelude®¶.¶PrimDeepSeqCond®¶ (RegFileVerilog.RegFileVerilog_ size t);
											     
instance RegFileVerilog ¶Prelude®¶.¶PrimMakeUninitialized®¶ (RegFileVerilog.RegFileVerilog_ size t);
												   
RegFileVerilog.mkRegFileVerilogLoad_ :: (¶Prelude®¶.¶IsModule®¶ _m__ _c__,
					 ¶Prelude®¶.¶Bits®¶ t tSz) =>
					¶Prelude®¶.¶Integer®¶ ->
					¶Prelude®¶.¶String®¶ -> _m__ (RegFileVerilog.RegFileVerilog_ size t);
													    
interface (¶RegFileVerilog©¶.¶_RegFileVerilog.RegFileVerilog_8©¶ :: # -> # -> # -> *)
	    _n0
	    _n1
	    _n2 {-# always_ready  #-} = {
    RegFileVerilog.read :: ¶Prelude®¶.¶Bit®¶ _n1 -> ¶Prelude®¶.¶Bit®¶ _n2 {-# prefixs = "read",
									      result = "read",
									      ready = "RDY_read",
									      enable = "EN_read",
									      always_ready  #-};
    RegFileVerilog.write :: ¶Prelude®¶.¶Bit®¶ _n1 ->
			    ¶Prelude®¶.¶Bit®¶ _n2 -> ¶Prelude®¶.¶ActionValue_®¶ _n0 {-# prefixs = "write",
											result = "write",
											ready = "RDY_write",
											enable = "EN_write",
											always_ready  #-}
};
 
instance RegFileVerilog ¶Prelude®¶.¶PrimMakeUndefined®¶
			(¶RegFileVerilog©¶.¶_RegFileVerilog.RegFileVerilog_8©¶ _n0 _n1 _n2);
											   
instance RegFileVerilog ¶Prelude®¶.¶PrimDeepSeqCond®¶
			(¶RegFileVerilog©¶.¶_RegFileVerilog.RegFileVerilog_8©¶ _n0 _n1 _n2);
											   
instance RegFileVerilog ¶Prelude®¶.¶PrimMakeUninitialized®¶
			(¶RegFileVerilog©¶.¶_RegFileVerilog.RegFileVerilog_8©¶ _n0 _n1 _n2)
}
