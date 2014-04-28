Strict

Import flixel

Class ChapterAssets

	Const SPRITE_BOY:String = "chapter1_boy"
	Const SPRITE_BOY_YARD:String = "chapter1_boy_yard"
	Const SPRITE_GIRL:String = "chapter1_girl"
	Const SPRITE_TRAIN:String = "chapter1_train"
	Const SPRITE_WHISTLE_IDLE:String = "chapter1_whistle_idle"
	Const SPRITE_WHISTLE_ON:String = "chapter1_whistle_on"
	
	Function Init:Void()
		FlxAssetsManager.AddImage(SPRITE_BOY, "chapter/1/boy.png")
		FlxAssetsManager.AddImage(SPRITE_BOY_YARD, "chapter/1/boy_yard.png")
		FlxAssetsManager.AddImage(SPRITE_GIRL, "chapter/1/girl.png")
		FlxAssetsManager.AddImage(SPRITE_TRAIN, "chapter/1/train.png")
		FlxAssetsManager.AddImage(SPRITE_WHISTLE_IDLE, "chapter/1/whistle_idle.png")
		FlxAssetsManager.AddImage(SPRITE_WHISTLE_ON, "chapter/1/whistle_on.png")
	End Function
	
	Function Load:Void()
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SPRITE_BOY)
		preloader.LoadGraphic(SPRITE_BOY_YARD)
		preloader.LoadGraphic(SPRITE_GIRL)
		preloader.LoadGraphic(SPRITE_TRAIN)
		preloader.LoadGraphic(SPRITE_WHISTLE_IDLE)
		preloader.LoadGraphic(SPRITE_WHISTLE_ON)
		
		preloader.Destroy()
	End Function

End Class