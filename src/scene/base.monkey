Strict

Import flixel

Import src.game
Import src.playstate
Import src.interactable.script
Import background

Class BaseScene Extends FlxSubState

	Field state:PlayState

	Field background:Background
	
	Field items:FlxGroup
	
	Field script:Script
	
	Method New(state:PlayState)
		Self.state = state
		items = New FlxGroup()
	End Method

	Method Create:Void()
		background = New Background(0, Game.SCREEN_PADDING)
	
		Add(background)
		Add(items)
	End Method
	
	Method OnActivate:Void()
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
			script.Run()
		End If
	End Method
	
	Method OnClose:Bool(system:Bool)
		If (script) Then
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

	Private
	
	Global _PrevChapter:Chapter
	
End Class