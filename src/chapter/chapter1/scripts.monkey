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

Class ScriptBoyShadow Extends Script Implements FlxCameraShakeListener

	Field shadow:FlxSprite
	
	Field scale:Float
	
	Field fade:Bool
	
	Field bloodSpot:FlxSprite[3]
	
	Field bloodTimer:Float
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Player.Ending = 2
	
		FlxG.Music.Stop()
		
		Game.Creak.Kill()
		Game.Creak = FlxG.Play(Assets.SOUND_CREAK)
	
		Chapter1.Boy.Reset(120, 172 + Game.SCREEN_PADDING)
		Chapter1.Boy.LoadGraphic(ChapterAssets.SPRITE_BOY_YARD)
		
		shadow = New FlxSprite(Chapter1.Boy.x + 10, Chapter1.Boy.y - 20, ChapterAssets.SPRITE_BOY_SHADOW)
		shadow.origin.y = shadow.height
		shadow.scale.Make(0, 0)
		
		Game.Chapter.state.playground.RemoveItem(Chapter1.Boy)
		
		scene.AddItem(shadow)
		scene.AddItem(Chapter1.Boy)
		
		bloodSpot[0] = New FlxSprite(30, Game.SCREEN_PADDING + 20, ChapterAssets.SPRITE_BLOOD_SPOT)
		bloodSpot[1] = New FlxSprite(250, Game.SCREEN_PADDING + 175, ChapterAssets.SPRITE_BLOOD_SPOT)
		bloodSpot[2] = New FlxSprite(450, Game.SCREEN_PADDING + 70, ChapterAssets.SPRITE_BLOOD_SPOT)
		
		Local scale:Float = FlxG.Random(0.3, 0.5)
		bloodSpot[0].scale.Make(scale, scale)
		bloodSpot[0].angle = FlxG.Random(0, 359)
		bloodSpot[0].visible = False
		
		scale = FlxG.Random(0.3, 0.5)
		bloodSpot[1].scale.Make(scale, scale)
		bloodSpot[1].angle = FlxG.Random(0, 359)
		bloodSpot[1].visible = False
		
		scale = FlxG.Random(0.3, 0.5)
		bloodSpot[2].scale.Make(scale, scale)
		bloodSpot[2].angle = FlxG.Random(0, 359)
		bloodSpot[2].visible = False
		
		scene.AddItem(bloodSpot[0])
		scene.AddItem(bloodSpot[1])
		scene.AddItem(bloodSpot[2])
		
		Game.Chapter.state.ClearInteractable()
		
		FlxG.Shake(0.005, 5, Self)
	End Method
	
	Method Update:Void()
		scale += 2.0 / (5.0 / FlxG.Elapsed)		
		shadow.scale.Make(scale, scale)
		
		If (scale > 1.3 And Not fade) Then
			FlxG.Fade(, 2)
			fade = True
			bloodTimer = FlxG.Random(0.2, 0.4)
		End If
		
		If (fade) Then
			bloodTimer -= FlxG.Elapsed
			
			If (bloodTimer <= 0) Then
				bloodTimer = FlxG.Random(0.2, 0.4)
			
				For Local i:Int = 0 Until bloodSpot.Length()
					If ( Not bloodSpot[i].visible) Then
						bloodSpot[i].visible = True
						Exit
					End If
				Next
			End If
		End If
	End Method
	
	Method OnCameraShakeComplete:Void(camera:FlxCamera)
		FlxG.Camera.StopFX()
		scene.GameOver()
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
	
	Field blood:FlxSprite
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		FlxG.Music.Stop()
	
		Game.Creak.Kill()
		Game.Creak = FlxG.Play(Assets.SOUND_CREAK)
	
		body = New FlxSprite(396, 240 + Game.SCREEN_PADDING, ChapterAssets.SPRITE_DEAD_BODY)
		
		blood = New FlxSprite(0, 0, ChapterAssets.SPRITE_BLOOD_GROUND)
		blood.Reset(body.x + (body.width - blood.width) * 0.5, body.y + (body.height - blood.height) * 0.5)
	
		scene.AddItem(blood)
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
		blood.Kill()
		scene.RemoveItem(body)
		scene.RemoveItem(blood)
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
	
	Field blood:FlxSprite
	
	Field scale:Float
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Player.Ending = 3
		FlxG.Music.Stop()
	
		Game.Creak.Kill()
		Game.Creak = FlxG.Play(Assets.SOUND_CREAK)
		
		blood = New FlxSprite(359, 321, ChapterAssets.SPRITE_BLOOD_GROUND)
		blood.visible = False
		blood.scale.Make(0, 0)
		scene.AddItem(blood)
	
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
		If ( Not shacked And Chapter1.Girl.velocity.y > 0 And Chapter1.Girl.y > Game.SCREEN_PADDING + 220) Then
			FlxG.Shake(0.005, 5, Self)
			Chapter1.Girl.velocity.y = 0
			Chapter1.Girl.Frame = 8
			
			Game.Chapter.state.outdoors.AddItem(New FlxSprite(268, Game.SCREEN_PADDING + 12, ChapterAssets.SPRITE_BOY_WINDOW))
			FlxG.Play(ChapterAssets.SOUND_WHISTLE)
			
			shacked = True
			blood.visible = True
		End If
		
		If (shacked) Then
			scale += 1.0 / (5 / FlxG.Elapsed)
			blood.scale.Make(Min(scale, 1.0), Min(scale, 1.0))
		End If
	End Method
	
	Method OnCameraShakeComplete:Void(camera:FlxCamera)
		Chapter1.Girl.Kill()
		blood.Kill()
		scene.RemoveItem(blood)
		scene.GameOver()
	End Method

End Class