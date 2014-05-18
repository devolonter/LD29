Strict

Import flixel

Class Assets

	Const SPRITE_STAR:String = "sprite_star"
	
	Const SCENE_TITLE:String = "scene_title"
	Const SCENE_PARK:String = "scene_park"
	Const SCENE_PARK_DARK:String = "scene_park_dark"
	Const SCENE_OUTDOORS:String = "scene_outdoors"
	Const SCENE_PLAYGROUND:String = "scene_playground"

	Const CURSOR_DEFAULT:String = "default"
	Const CURSOR_GO:String = "go"
	Const CURSOR_VIEW:String = "view"
	
	Const FONT_DIALOG:String = "dialog"
	Const FONT_BUTTON:String = "button"
	
	Const MUSIC_WHISTLE:String = "whistle"
	
	Const SOUND_WIND:String = "wind"
	Const SOUND_SWINGS:String = "swings"
	Const SOUND_OWL:String = "owl"
	Const SOUND_CREAK:String = "creak"
	Const SOUND_STEPS:String = "steps"
	Const SOUND_TAKE:String = "take"
	Const SOUND_WOLF:String = "wolf"
	Const SOUND_TUNE:String = "tune"
	
	Function Init:Void()
		FlxAssetsManager.AddCursor(CURSOR_DEFAULT, "ui/mouse/default.png")
		FlxAssetsManager.AddCursor(CURSOR_GO, "ui/mouse/go.png")
		FlxAssetsManager.AddCursor(CURSOR_VIEW, "ui/mouse/view.png")
		
		Local font:FlxFont = FlxAssetsManager.AddFont(FONT_DIALOG)
		font.SetPath(16, "ui/font/dialog")
		
		font = FlxAssetsManager.AddFont(FONT_BUTTON)
		font.SetPath(16, "ui/font/button")
		
		FlxAssetsManager.AddImage(SCENE_TITLE, "scene/title.png")
		FlxAssetsManager.AddImage(SCENE_PARK, "scene/park.png")
		FlxAssetsManager.AddImage(SCENE_PARK_DARK, "scene/park_dark.png")
		FlxAssetsManager.AddImage(SCENE_OUTDOORS, "scene/outdoors.png")
		FlxAssetsManager.AddImage(SCENE_PLAYGROUND, "scene/playground.png")
		FlxAssetsManager.AddImage(SPRITE_STAR, "scene/detail/star.png")
		
		FlxAssetsManager.AddMusic(MUSIC_WHISTLE, "music/whistle.mp3")
		FlxAssetsManager.AddSound(SOUND_TUNE, "music/tune.mp3")
		
		FlxAssetsManager.AddSound(SOUND_WIND, "fx/wind.mp3")
		FlxAssetsManager.AddSound(SOUND_SWINGS, "fx/swings.mp3")
		FlxAssetsManager.AddSound(SOUND_OWL, "fx/owl.mp3")
		FlxAssetsManager.AddSound(SOUND_CREAK, "fx/creak.mp3")
		FlxAssetsManager.AddSound(SOUND_STEPS, "fx/steps.mp3")
		FlxAssetsManager.AddSound(SOUND_TAKE, "fx/take.mp3")
		FlxAssetsManager.AddSound(SOUND_WOLF, "fx/wolf.mp3")
	End Function
	
	Function Load:Void()
		FlxG.Mouse.Load(CURSOR_DEFAULT)
		FlxG.Mouse.Load(CURSOR_GO)
		FlxG.Mouse.Load(CURSOR_VIEW)
		
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SCENE_TITLE)
		preloader.LoadGraphic(SCENE_PARK)
		preloader.LoadGraphic(SCENE_PARK_DARK)
		preloader.LoadGraphic(SCENE_OUTDOORS)
		preloader.LoadGraphic(SCENE_PLAYGROUND)
		preloader.LoadGraphic(SPRITE_STAR)
		
		preloader.Destroy()
	End Function

End Class