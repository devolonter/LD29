Strict

Import flixel

Import src.game
Import src.playstate
Import src.interactable.script
Import src.interactable.script.gameover
Import background

Class BaseScene Extends FlxSubState

	Field state:PlayState

	Field background:Background
	
	Field items:FlxGroup
	
	Field script:Script
	
	Field gameOverTimer:Float
	
	Field resetTimer:Float
	
	Method New(state:PlayState)
		Self.state = state
		items = New FlxGroup()
	End Method

	Method Create:Void()
		background = New Background(0, Game.SCREEN_PADDING)
	
		Add(background)
		Add(items)
	End Method
	
	Method Update:Void()
		Super.Update()
		
		If (gameOverTimer > 0)
			gameOverTimer -= FlxG.Elapsed
			
			If (gameOverTimer <= 0) Then
				New ScriptGameOver(state.park)
				state.SetSubState(state.park)
			End If
			
		ElseIf(resetTimer > 0)
			resetTimer -= FlxG.Elapsed
			
			If (resetTimer <= 0) Then
				state.SetSubState(state.park)
			End If
		End If
	End Method
	
	Method OnActivate:Void()
		background.visible = True
		items.visible = True
	
		For Local b:FlxBasic = EachIn items
			If (b.exists And Interactable(b)) Then
				state.AddInteractable(Interactable(b))
			End If
		Next
		
		If (_PrevChapter <> Game.Chapter) Then
			_PrevChapter = Game.Chapter
			Game.Chapter.Activate()
		End If
		
		If (script) Then
			Add(script)
			script.Run()
		End If
	End Method
	
	Method OnClose:Bool(system:Bool)
		If (script) Then
			Remove(script)
			script.Stop()
		End If
	
		state.ClearInteractable()
		Return True
	End Method
	
	Method AddItem:Void(item:FlxBasic, addAsInteract:Bool = False)
		items.Add(item)
		
		If (Interactable(item)) Then
			state.AddInteractable(Interactable(item))
		End If
	End Method
	
	Method RemoveItem:Void(item:FlxBasic)
		items.Remove(item)
		
		If (Interactable(item)) Then
			state.RemoveInteractable(Interactable(item))
		End If
	End Method
	
	Method GameOver:Void()
		Game.Creak.FadeOut(2)
		FlxG.Music.Play()
		
		gameOverTimer = 3
		
		background.visible = False
		items.visible = False
		
		state.ClearInteractable()
	End Method
	
	Method Reset:Void()
		Game.Creak.FadeOut(2)
		FlxG.Music.Play()
		
		resetTimer = 3
		
		background.visible = False
		items.visible = False
		
		state.ClearInteractable()
	End Method

	Private
	
	Global _PrevChapter:Chapter
	
End Class