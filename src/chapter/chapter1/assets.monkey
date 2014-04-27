Strict

Import flixel

Class ChapterAssets

	Const SPRITE_BOY:String = "chapter1_boy"
	Const SPRITE_GIRL:String = "chapter1_girl"
	Const SPRITE_TRAIN:String = "chapter1_train"
	
	Function Init:Void()
		FlxAssetsManager.AddImage(SPRITE_BOY, "chapter/1/boy.png")
		FlxAssetsManager.AddImage(SPRITE_GIRL, "chapter/1/girl.png")
		FlxAssetsManager.AddImage(SPRITE_TRAIN, "chapter/1/train.png")
	End Function
	
	Function Load:Void()
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SPRITE_BOY)
		preloader.LoadGraphic(SPRITE_GIRL)
		preloader.LoadGraphic(SPRITE_TRAIN)
		
		preloader.Destroy()
	End Function

End Class