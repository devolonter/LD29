Strict

Import flixel
Import base

Class Outdoors Extends BaseScene

	Field triggerGoToPark:GoToScene
	Field triggerGoToPlayground:GoToScene
	
	Method New(state:PlayState)
		Super.New(state)
	End Method

	Method Create:Void()
		Super.Create()
		
		triggerGoToPark = New GoToScene(state, state.park)
		triggerGoToPark.Reset(0, FlxG.Height - Game.SCREEN_PADDING - triggerGoToPark.height)
		
		triggerGoToPlayground = New GoToScene(state, state.playground)
		triggerGoToPlayground.Reset(FlxG.Width - triggerGoToPlayground.width, FlxG.Height - Game.SCREEN_PADDING - triggerGoToPark.height)
		
		background.AddStars([18, 45, 421, 23, 584, 44])
	End Method
	
	Method OnActivate:Void()
		state.AddInteractable(triggerGoToPark)
		state.AddInteractable(triggerGoToPlayground)
		background.Image = Assets.SCENE_OUTDOORS
	
		Super.OnActivate()
	End Method
	
End Class