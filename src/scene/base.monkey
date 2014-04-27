Strict

Import flixel
Import src.game

Class BaseScene Extends FlxSubState

	Field background:FlxSprite

	Method Create:Void()
		background = New FlxSprite(0, Game.SCREEN_PADDING)
		
		background.width = FlxG.Width
		background.height = FlxG.Height - Game.SCREEN_PADDING * 2
		
		background.SetRenderer(New RectSpriteRenderer())
		
		Add(background)
	End Method
	
	Method OnClose:Bool(system:Bool)
		Return True
	End Method
	
End Class