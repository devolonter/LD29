Strict

Import src.interactable.script

Class IntroScript Extends Script

	Field timer:Float
	
	Field blinkCounter:Int
	
	Field blinkTimer:Float
	
	Field bg:Bool
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		timer = FlxG.Random(4.0, 10.0)
	End Method
		
	Method Update:Void()
		timer -= FlxG.Elapsed
	
		If (timer <= 0 And blinkCounter = 0) Then
			blinkCounter = FlxG.Random(3, 6)
		End If
		
		If (blinkCounter > 0) Then
			blinkTimer -= FlxG.Elapsed
		
			If (blinkTimer < 0) Then
				bg = Not bg
				blinkTimer = FlxG.Random(0.05, 0.1)
				blinkCounter -= 1
			End If
			
			If (bg) Then
				scene.background.Image = Assets.SCENE_PARK_DARK
			Else
				scene.background.Image = Assets.SCENE_TITLE
			End If
		End If
		
		If (timer <= 0 And blinkCounter <= 0) Then
			timer = FlxG.Random(4.0, 10.0)
			blinkCounter = 0
			scene.background.Image = Assets.SCENE_TITLE
		End If
	End Method	
	
	Method Stop:Void()
		Detach()
	End Method

End Class