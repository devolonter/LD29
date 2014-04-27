Strict

Import flixel
Import base

Class Playground Extends BaseScene

	Field triggerGoToOutdoors:GotToScene

	Method Create:Void()
		Super.Create()
	End Method
	
	Method OnActivate:Void()
		Super.OnActivate()
		
		If ( Not triggerGoToOutdoors) Then
			triggerGoToOutdoors = New GotToScene(state, state.outdoors)
			triggerGoToOutdoors.Reset(0, FlxG.Height - Game.SCREEN_PADDING - triggerGoToOutdoors.height)
		End If
		
		state.AddInteractable(triggerGoToOutdoors)
		
		background.Color = $FF414478
	End Method
	
End Class