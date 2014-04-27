Strict

Import flixel
Import base

Class Outdoors Extends BaseScene

	Field triggerGoToPark:GotToScene
	Field triggerGoToPlayground:GotToScene

	Method Create:Void()
		Super.Create()	
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()
		
		If ( Not triggerGoToPark) Then
			triggerGoToPark = New GotToScene(state, state.park)
			triggerGoToPark.Reset(0, FlxG.Height - Game.SCREEN_PADDING - triggerGoToPark.height)
		End If
		
		If ( Not triggerGoToPlayground) Then
			triggerGoToPlayground = New GotToScene(state, state.playground)
			triggerGoToPlayground.Reset(FlxG.Width - triggerGoToPlayground.width, FlxG.Height - Game.SCREEN_PADDING - triggerGoToPark.height)
		End If
		
		state.AddInteractable(triggerGoToPark)
		state.AddInteractable(triggerGoToPlayground)
		
		background.Color = $FF314478
	End Method
	
End Class