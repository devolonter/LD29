Strict

Import flixel

Import src.game
Import src.playstate

Class BaseScene Extends FlxSubState

	Field state:PlayState

	Field background:FlxSprite
	
	Field items:FlxGroup

	Method Create:Void()
		background = New FlxSprite(0, Game.SCREEN_PADDING)
		items = New FlxGroup()
		
		background.width = FlxG.Width
		background.height = FlxG.Height - Game.SCREEN_PADDING * 2
		
		background.SetRenderer(New RectSpriteRenderer())
		
		Add(background)
	End Method
	
	Method OnActivate:Void()
		state = PlayState(GetParent())
	End Method
	
	Method OnClose:Bool(system:Bool)
		state.ClearInteractable()
		Return True
	End Method
	
End Class