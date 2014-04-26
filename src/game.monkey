Strict

Import flixel
Import playstate

Class Game Extends FlxGame

	Const SCREEN_PADDING:Int = 80
	
	Method New()
		Super.New(640, 480, GetClass("PlayState"), 1, 60, True)
	End Method

End Class