Strict

Import flixel

Import src.interactable.gotoscene
Import base

Class Park Extends BaseScene

	Field triggerGoToOutdoors:GoToScene
	
	Method New(state:PlayState)
		Super.New(state)
	End Method

	Method Create:Void()
		Super.Create()
		
		triggerGoToOutdoors = New GoToScene(state, state.outdoors)
		triggerGoToOutdoors.Reset(FlxG.Width - triggerGoToOutdoors.width, FlxG.Height - Game.SCREEN_PADDING - triggerGoToOutdoors.height)
		
		background.AddStars([60, 37, 165, 29, 244, 47, 364, 16, 404, 74, 578, 31])
	End Method
	
	Method OnActivate:Void()
		state.AddInteractable(triggerGoToOutdoors)
		
		Super.OnActivate()
	End Method
	
End Class