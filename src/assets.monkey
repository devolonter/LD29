Strict

Import flixel

Class Assets

	Const CURSOR_DEFAULT:String = "default"
	Const CURSOR_GO:String = "go"
	Const CURSOR_VIEW:String = "view"
	
	Function Init:Void()
		FlxAssetsManager.AddCursor(CURSOR_DEFAULT, "ui/mouse/default.png")
		FlxAssetsManager.AddCursor(CURSOR_GO, "ui/mouse/go.png")
		FlxAssetsManager.AddCursor(CURSOR_VIEW, "ui/mouse/view.png")
	End Function
	
	Function Load:Void()
		FlxG.Mouse.Load(CURSOR_DEFAULT)
		FlxG.Mouse.Load(CURSOR_GO)
		FlxG.Mouse.Load(CURSOR_VIEW)
	End Function

End Class