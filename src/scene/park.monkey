Strict

Import flixel

Import src.interactable.gotoscene
Import base

Class Park Extends BaseScene Implements FlxTimerListener

	Field triggerGoToOutdoors:GoToScene
	
	Field isActivated:Bool

	Field timer:FlxTimer
	
	Method New(state:PlayState)
		Super.New(state)
	End Method

	Method Create:Void()
		Super.Create()
		
		triggerGoToOutdoors = New GoToScene(state, state.outdoors)
		triggerGoToOutdoors.Reset(FlxG.Width - triggerGoToOutdoors.width, FlxG.Height - Game.SCREEN_PADDING - triggerGoToOutdoors.height)
		
		background.AddStars([60, 37, 165, 29, 244, 47, 364, 16, 404, 74, 578, 31])
		
		timer = New FlxTimer()
	End Method
	
	Method OnActivate:Void()
		state.AddInteractable(triggerGoToOutdoors)
		background.Image = Assets.SCENE_PARK
		
		If (isActivated) Then
			timer.Start(FlxG.Random(1.0, 3.0), 1, Self)
		Else
			isActivated = True
		End If
		
		Super.OnActivate()
	End Method
	
	Method OnTimerTick:Void(timer:FlxTimer)
		If (Player.Ending = 0) Then
			FlxG.Play(Assets.SOUND_OWL)
		Else
			FlxG.Play(Assets.SOUND_WOLF)
		End If
	End Method
	
End Class