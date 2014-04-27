Strict

Import flixel

Import src.trigger.gotoscene
Import base

Class Park Extends BaseScene

	Field triggerGoToOutdoors:GotToScene

	Method Create:Void()
		Super.Create()
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()
		
		If ( Not triggerGoToOutdoors) Then
			triggerGoToOutdoors = New GotToScene(state, state.outdoors)
			triggerGoToOutdoors.Reset(FlxG.Width - triggerGoToOutdoors.width, FlxG.Height - Game.SCREEN_PADDING - triggerGoToOutdoors.height)
		End If
		
		state.AddInteractable(triggerGoToOutdoors)
		
		background.Color = $FF214478
	End Method
	
End Class