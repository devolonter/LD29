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
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()
		
		state.AddInteractable(triggerGoToPark)
		state.AddInteractable(triggerGoToPlayground)
	End Method
	
End Class