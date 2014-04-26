Strict

Import flixel
Import game

Class DialogBar Extends FlxGroup
	
	Method New()
		Local c:FlxCamera = New FlxCamera(0, 0, FlxG.Width, Game.SCREEN_PADDING)
		Cameras =[c]
	End Method

End Class