Strict

Import flixel

Class ChapterAssets

	Const SPRITE_KEY:String = "chapter0_key"
	Const SPRITE_DOOR:String = "chapter0_door"
	
	Const SOUND_DOOR:String = "chapter0_door"
	
	Function Init:Void()
		FlxAssetsManager.AddImage(SPRITE_KEY, "chapter/0/key.png")
		FlxAssetsManager.AddImage(SPRITE_DOOR, "chapter/0/door.png")
		
		FlxAssetsManager.AddSound(SOUND_DOOR, "chapter/0/door.mp3")
	End Function
	
	Function Load:Void()
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SPRITE_KEY)
		preloader.LoadGraphic(SPRITE_DOOR)
		
		preloader.Destroy()
	End Function

End Class