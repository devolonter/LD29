Strict

Import flixel

Import src.scene.park
Import src.scene.outdoors
Import src.scene.playground

Class Chapter

	Field state:PlayState
	
	Method New(state:PlayState)
		Self.state = state
	End Method
	
	Method Create:Void()
	End Method
	
	Method Activate:Void()
	End Method
	
	Method Complete:Void()
		For Local b:FlxBasic = EachIn state.park.items
			b.Destroy()
		Next
		
		For Local b:FlxBasic = EachIn state.outdoors.items
			b.Destroy()
		Next
		
		For Local b:FlxBasic = EachIn state.playground.items
			b.Destroy()
		Next
	
		state.park.items.Clear()
		state.outdoors.items.Clear()
		state.playground.items.Clear()
	End Method

End Class