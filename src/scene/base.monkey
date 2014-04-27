Strict

Import flixel

Import src.game
Import src.playstate

Class BaseScene Extends FlxSubState

	Field state:PlayState

	Field background:FlxSprite
	
	Field items:FlxGroup
	
	Method New(state:PlayState)
		Self.state = state
		items = New FlxGroup()
	End Method

	Method Create:Void()
		background = New FlxSprite(0, Game.SCREEN_PADDING)
		
		background.width = FlxG.Width
		background.height = FlxG.Height - Game.SCREEN_PADDING * 2
		
		background.SetRenderer(New RectSpriteRenderer())
		
		Add(background)
		Add(items)
	End Method
	
	Method OnActivate:Void()
		For Local b:FlxBasic = EachIn items
			If (Interactable(b)) Then
				state.AddInteractable(Interactable(b))
			End If
		Next
	End Method
	
	Method OnClose:Bool(system:Bool)
		state.ClearInteractable()
		Return True
	End Method
	
	Method AddItem:Void(item:FlxBasic, addAsInteract:Bool = False)
		items.Add(item)
		
		If (Interactable(item)) Then
			state.AddInteractable(Interactable(item))
		End If
	End Method
	
End Class