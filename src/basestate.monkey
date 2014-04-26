Strict

Import flixel
Import game

Class BaseState Extends FlxState
	
	Method Create:Void()
		FlxG.Camera.Height = FlxG.Height - Game.SCREEN_PADDING * 2
		FlxG.Camera.Y += (FlxG.Height - FlxG.Camera.Height) / 2
	End Method

End Class