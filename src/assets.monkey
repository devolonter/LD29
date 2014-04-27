Strict

Import flixel

Class Assets

	Const SPRITE_STAR:String = "sprite_star"
	
	Const SCENE_PLAYGROUND:String = "scene_playground"

	Const CURSOR_DEFAULT:String = "default"
	Const CURSOR_GO:String = "go"
	Const CURSOR_VIEW:String = "view"
	
	Function Init:Void()
		FlxAssetsManager.AddCursor(CURSOR_DEFAULT, "ui/mouse/default.png")
		FlxAssetsManager.AddCursor(CURSOR_GO, "ui/mouse/go.png")
		FlxAssetsManager.AddCursor(CURSOR_VIEW, "ui/mouse/view.png")
		
		FlxAssetsManager.AddImage(SCENE_PLAYGROUND, "scene/playground.png")
		FlxAssetsManager.AddImage(SPRITE_STAR, "scene/detail/star.png")
	End Function
	
	Function Load:Void()
		FlxG.Mouse.Load(CURSOR_DEFAULT)
		FlxG.Mouse.Load(CURSOR_GO)
		FlxG.Mouse.Load(CURSOR_VIEW)
		
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SCENE_PLAYGROUND)
		preloader.LoadGraphic(SPRITE_STAR)
		
		preloader.Destroy()
	End Function

End Class