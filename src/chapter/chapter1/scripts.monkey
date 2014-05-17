Strict

Import src.interactable.script

Private

Import chapterassets
Import chapter1
Import whistle
Import train

Public

Class ScriptBoyInYard Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Chapter1.Boy.Reset(120, 172 + Game.SCREEN_PADDING)
		Chapter1.Boy.LoadGraphic(ChapterAssets.SPRITE_BOY_YARD)
		
		Game.Chapter.state.playground.RemoveItem(Chapter1.Boy)
		
		Game.Chapter.state.outdoors.AddItem(Chapter1.Boy)
		Game.Chapter.state.outdoors.AddItem(New Whistle(492, 276 + Game.SCREEN_PADDING))
		
		Chapter1.Boy.SetAction(Chapter1.Boy.actions.Get("question.whistle"))
	End Method
	
	Method Stop:Void()
		Detach()
	End Method

End Class

Class ScriptGirlDisapear Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Chapter1.Boy.Alpha = 1
		Interactable(Chapter1.Boy).Disable()
	
		Chapter1.Boy.Reset(100, Game.SCREEN_PADDING + 135)
		Chapter1.Boy.AddWhistle()
		Chapter1.Boy.LoadGraphic(ChapterAssets.SPRITE_BOY)
		
		Chapter1.Boy.train.Reset(220, Game.SCREEN_PADDING + 250)
		
		Game.Chapter.state.outdoors.RemoveItem(Chapter1.Boy)
		Game.Chapter.state.playground.AddItem(Chapter1.Boy)
		
		Chapter1.Girl.Kill()
		
		FlxG.Play(ChapterAssets.SOUND_WHISTLE)
	End Method
	
	Method Stop:Void()
		Detach()
		New ScriptSamaraGirl(Game.Chapter.state.outdoors)
	End Method

End Class

Class ScriptSamaraGirl Extends Script Implements FlxCameraShakeListener

	Field shacked:Bool
	
	Field scream:FlxSound
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Player.Ending = 1
	
		FlxG.Music.Stop()
		
		Game.Creak.Kill()
		Game.Creak = FlxG.Play(Assets.SOUND_CREAK)
		
		scream = FlxG.Play(ChapterAssets.SOUND_GIRL_SCREAM,, True)
	
		Chapter1.Girl.LoadGraphic(ChapterAssets.SPRITE_SAMARA_WALK, True, True, 108, 171)
		Chapter1.Girl.AddAnimation("walk", 0, 9, 15, True)
		Chapter1.Girl.Reset(30, 140 + Game.SCREEN_PADDING)
		
		Chapter1.Girl.Play("walk")
		Chapter1.Girl.velocity.x = 100
		
		Game.Chapter.state.outdoors.AddItem(Chapter1.Girl)
		
		Game.Chapter.state.ClearInteractable()
	End Method
	
	Method Update:Void()
		If ( Not shacked And Chapter1.Girl.x > 300) Then
			FlxG.Shake(0.005, 5, Self)
			shacked = True
		End If
	
		If (Chapter1.Girl.x > 550 And Chapter1.Girl.velocity.x > 0) Then
			Chapter1.Girl.Facing = FlxObject.LEFT
			Chapter1.Girl.velocity.x = -Chapter1.Girl.velocity.x
		End If
	End Method
	
	Method OnCameraShakeComplete:Void(camera:FlxCamera)
		scream.Stop()
		Chapter1.Girl.Kill()
		scene.GameOver()
	End Method

End Class

Class ScriptBrokenTrain Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		scene.AddItem(New BrokenTrain(150, 270 + Game.SCREEN_PADDING))
	End Method
	
	Method Stop:Void()
		Detach()
	End Method

End Class

Class ScriptDeadGirl Extends Script Implements FlxCameraShakeListener

	Field body:FlxSprite
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		FlxG.Music.Stop()
	
		Game.Creak.Kill()
		Game.Creak = FlxG.Play(Assets.SOUND_CREAK)
	
		body = New FlxSprite(396, 240 + Game.SCREEN_PADDING, ChapterAssets.SPRITE_DEAD_BODY)
	
		scene.AddItem(body)
		Game.Chapter.state.ClearInteractable()
		
		FlxG.Shake(0.005, 3, Self)
		
		FlxG.Play(ChapterAssets.SOUND_GIRL_FALL)
	End Method
	
	Method Stop:Void()
		Detach()
		New ScriptAddWhistle(Game.Chapter.state.outdoors)
	End Method
	
	Method OnCameraShakeComplete:Void(camera:FlxCamera)
		body.Kill()
		scene.RemoveItem(body)
		scene.Reset()
	End Method

End Class

Class ScriptAddWhistle Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Local whistle:Whistle = New Whistle(492, 276 + Game.SCREEN_PADDING)
		whistle.Description = "Some kind of a toy. This thing looks strange but it gives a whistling sound... Did I saw a dead body the last time I was here? My head aches."
	
		Game.Chapter.state.outdoors.AddItem(whistle)
		Chapter1.Boy.SetAction(Chapter1.Boy.actions.Get("quest.take.whistle"))
	End Method
	
	Method Stop:Void()
		Detach()
	End Method

End Class

Class ScriptSamaraFall Extends Script Implements FlxCameraShakeListener

	Field shacked:Bool
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Player.Ending = 2
		FlxG.Music.Stop()
	
		Game.Creak.Kill()
		Game.Creak = FlxG.Play(Assets.SOUND_CREAK)
	
		Chapter1.Girl.LoadGraphic(ChapterAssets.SPRITE_SAMARA_FALL, True, True, 180, 106)
		Chapter1.Girl.AddAnimation("fall", 0, 8, 15, True)
		Chapter1.Girl.Reset(350, Game.SCREEN_PADDING)
		
		Chapter1.Girl.Play("fall")
		Chapter1.Girl.velocity.y = 150
		
		Game.Chapter.state.outdoors.AddItem(Chapter1.Girl)
		Game.Chapter.state.ClearInteractable()
		
		FlxG.Play(ChapterAssets.SOUND_GIRL_FALL)
	End Method
	
	Method Update:Void()
		If (Chapter1.Girl.velocity.y > 0 And Chapter1.Girl.y > Game.SCREEN_PADDING + 220) Then
			FlxG.Shake(0.005, 5, Self)
			Chapter1.Girl.velocity.y = 0
			Chapter1.Girl.Frame = 8
			
			Game.Chapter.state.outdoors.AddItem(New FlxSprite(268, Game.SCREEN_PADDING + 12, ChapterAssets.SPRITE_BOY_WINDOW))
			FlxG.Play(ChapterAssets.SOUND_WHISTLE)
		End If
	End Method
	
	Method OnCameraShakeComplete:Void(camera:FlxCamera)
		Chapter1.Girl.Kill()
		scene.GameOver()
	End Method

End Class