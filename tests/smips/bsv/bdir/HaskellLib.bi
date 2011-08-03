signature HaskellLib where {
import ¶List®¶;
	      
import ¶Monad®¶;
	       
import ¶PrimArray®¶;
		   
import ¶Vector®¶;
		
HaskellLib.replicateTupleM :: (¶Prelude®¶.¶Monad®¶ m) =>
			      m (a, b) -> m (¶Vector®¶.¶Vector®¶ n a, ¶Vector®¶.¶Vector®¶ n b)
}
