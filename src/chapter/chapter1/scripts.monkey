Strict

Import chapter1
Import whistle
Import src.interactable.script

Private

Import chapterassets

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
	End Method
	
	Method Stop:Void()
		Detach()
		New ScriptSamaraGirl(Game.Chapter.state.outdoors)
	End Method

End Class

Class ScriptSamaraGirl Extends Script Implements FlxCameraShakeListener

	Field shacked:Bool
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Game.Chapter.state.ClearInteractable()
	
		Chapter1.Girl.LoadGraphic(ChapterAssets.SPRITE_SAMARA_WALK, True, True, 108, 171)
		Chapter1.Girl.AddAnimation("walk", 0, 9, 15, True)
		Chapter1.Girl.Reset(30, 140 + Game.SCREEN_PADDING)
		
		Chapter1.Girl.Play("walk")
		Chapter1.Girl.velocity.x = 100
		
		Game.Chapter.state.outdoors.AddItem(Chapter1.Girl)
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
		Chapter1.Girl.Kill()
		scene.GameOver()
	End Method

End Class