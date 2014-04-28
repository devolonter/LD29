Strict

Import flixel

Class Assets

	Const SPRITE_STAR:String = "sprite_star"
	
	Const SCENE_TITLE:String = "scene_title"
	Const SCENE_PLAYGROUND:String = "scene_playground"

	Const CURSOR_DEFAULT:String = "default"
	Const CURSOR_GO:String = "go"
	Const CURSOR_VIEW:String = "view"
	
	Const FONT_DIALOG:String = "dialog"
	Const FONT_BUTTON:String = "button"
	
	Function Init:Void()
		FlxAssetsManager.AddCursor(CURSOR_DEFAULT, "ui/mouse/default.png")
		FlxAssetsManager.AddCursor(CURSOR_GO, "ui/mouse/go.png")
		FlxAssetsManager.AddCursor(CURSOR_VIEW, "ui/mouse/view.png")
		
		Local font:FlxFont = FlxAssetsManager.AddFont(FONT_DIALOG)
		font.SetPath(16, "ui/font/dialog")
		
		font = FlxAssetsManager.AddFont(FONT_BUTTON)
		font.SetPath(16, "ui/font/button")
		
		FlxAssetsManager.AddImage(SCENE_TITLE, "scene/title.png")
		FlxAssetsManager.AddImage(SCENE_PLAYGROUND, "scene/playground.png")
		FlxAssetsManager.AddImage(SPRITE_STAR, "scene/detail/star.png")
	End Function
	
	Function Load:Void()
		FlxG.Mouse.Load(CURSOR_DEFAULT)
		FlxG.Mouse.Load(CURSOR_GO)
		FlxG.Mouse.Load(CURSOR_VIEW)
		
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SCENE_TITLE)
		preloader.LoadGraphic(SCENE_PLAYGROUND)
		preloader.LoadGraphic(SPRITE_STAR)
		
		preloader.Destroy()
	End Function

End Class