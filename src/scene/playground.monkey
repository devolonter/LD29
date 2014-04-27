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
		
		background.Image = Assets.SCENE_PLAYGROUND
		background.AddStars([60, 20, 235, 70, 280, 27, 360, 45, 430, 28, 605, 20])
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()
		
		'state.AddInteractable(triggerGoToOutdoors)
	End Method
	
End Class