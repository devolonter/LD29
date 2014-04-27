Strict

Import flixel
Import base

Class Playground Extends BaseScene

	Field triggerGoToOutdoors:GotToScene
	
	Method New(state:PlayState)
		Super.New(state)
	End Method

	Method Create:Void()
		Super.Create()
		
		triggerGoToOutdoors = New GotToScene(state, state.outdoors)
		triggerGoToOutdoors.Reset(0, FlxG.Height - Game.SCREEN_PADDING - triggerGoToOutdoors.height)
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()
		
		state.AddInteractable(triggerGoToOutdoors)
		background.Color = $FF414478
	End Method
	
End Class