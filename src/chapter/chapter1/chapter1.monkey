Strict

Import src.chapter

Class Chapter1 Extends Chapter

	Method New(state:PlayState)
		Super.New(state)
	End Method
	
	Method Create:Void()
		Super.Create()
		
		state.SetSubState(state.park)
	End Method

End Class