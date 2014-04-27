Strict

Import flixel

Import playstate
Import assets

Class Game Extends FlxGame

	Const SCREEN_PADDING:Int = 80
	
	Global Chapter:Chapter
	
	Global Dialog:Dialog
	
	Method New()
		Super.New(640, 480, GetClass("PlayState"), 1, 60, False)
	End Method
	
	Method OnContentInit:Void()
		Assets.Init()
	End Method
	
	Method OnCreate:Int()
		Super.OnCreate()
		
		Assets.Load()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
		
		Return 0
	End Method

End Class