Strict

Import flixel

Import src.interactable.gotoscene
Import base

Class Park Extends BaseScene

	Field triggerGoToOutdoors:GotToScene
	
	Method New(state:PlayState)
		Super.New(state)
	End Method

	Method Create:Void()
		Super.Create()
		
		triggerGoToOutdoors = New GotToScene(state, state.outdoors)
		triggerGoToOutdoors.Reset(FlxG.Width - triggerGoToOutdoors.width, FlxG.Height - Game.SCREEN_PADDING - triggerGoToOutdoors.height)
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()

		state.AddInteractable(triggerGoToOutdoors)
	End Method
	
End Class