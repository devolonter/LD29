Strict

Import flixel

Class ChapterAssets

	Const SPRITE_BOY:String = "chapter1_boy"
	Const SPRITE_BOY_YARD:String = "chapter1_boy_yard"
	Const SPRITE_BOY_WINDOW:String = "chapter1_boy_window"
	Const SPRITE_BOY_SHADOW:String = "chapter1_boy_shadow"
	Const SPRITE_GIRL:String = "chapter1_girl"
	Const SPRITE_SAMARA_WALK:String = "chapter1_samara_walk"
	Const SPRITE_SAMARA_FALL:String = "chapter1_samara_fall"
	Const SPRITE_TRAIN:String = "chapter1_train"
	Const SPRITE_TRAIN_BROKEN:String = "chapter1_train_broken"
	Const SPRITE_TRAIN_FIXED:String = "chapter1_train_fixed"
	Const SPRITE_TRAIN_SHADOW:String = "chapter1_train_shadow"
	Const SPRITE_WHISTLE_IDLE:String = "chapter1_whistle_idle"
	Const SPRITE_WHISTLE_ON:String = "chapter1_whistle_on"
	Const SPRITE_DEAD_BODY:String = "chapter1_dead_body"
	Const SPRITE_BLOOD_GROUND:String = "chapter1_blood_ground"
	Const SPRITE_BLOOD_SPOT:String = "chapter1_blood_spot"
	Const SPRITE_BLOOD_SCREEN:String = "chapter1_blood_screen"
	
	Const SOUND_BOY:String = "chapter1_boy"
	Const SOUND_GIRL:String = "chapter1_girl"
	
	Const SOUND_WHISTLE:String = "chapter1_whistle"
	Const SOUND_BOY_CRY:String = "chapter1_boy_cry"
	Const SOUND_LAUGHTER:String = "chapter1_laugter"
	Const SOUND_GIRL_SCREAM:String = "chapter1_girl_scream"
	Const SOUND_GIRL_FALL:String = "chapter1_girl_fall"
	Const SOUND_WINDOW:String = "chapter1_window"
	Const SOUND_ROAR:String = "chapter1_roar"
	Const SOUND_TRAIN_FALL:String = "chapter1_train_fall"
	
	Function Init:Void()
		FlxAssetsManager.AddImage(SPRITE_BOY, "chapter/1/boy.png")
		FlxAssetsManager.AddImage(SPRITE_BOY_YARD, "chapter/1/boy_yard.png")
		FlxAssetsManager.AddImage(SPRITE_BOY_WINDOW, "chapter/1/boy_in_window.png")
		FlxAssetsManager.AddImage(SPRITE_BOY_SHADOW, "chapter/1/boy_shadow.png")
		FlxAssetsManager.AddImage(SPRITE_GIRL, "chapter/1/girl.png")
		FlxAssetsManager.AddImage(SPRITE_SAMARA_WALK, "chapter/1/samara_walk.png")
		FlxAssetsManager.AddImage(SPRITE_SAMARA_FALL, "chapter/1/samara_fall.png")
		FlxAssetsManager.AddImage(SPRITE_TRAIN, "chapter/1/train.png")
		FlxAssetsManager.AddImage(SPRITE_TRAIN_BROKEN, "chapter/1/train_broken.png")
		FlxAssetsManager.AddImage(SPRITE_TRAIN_FIXED, "chapter/1/train_fixed.png")
		FlxAssetsManager.AddImage(SPRITE_TRAIN_SHADOW, "chapter/1/train_shadow.png")
		FlxAssetsManager.AddImage(SPRITE_WHISTLE_IDLE, "chapter/1/whistle_idle.png")
		FlxAssetsManager.AddImage(SPRITE_WHISTLE_ON, "chapter/1/whistle_on.png")
		FlxAssetsManager.AddImage(SPRITE_DEAD_BODY, "chapter/1/dead_body.png")
		FlxAssetsManager.AddImage(SPRITE_BLOOD_GROUND, "chapter/1/blood_ground.png")
		FlxAssetsManager.AddImage(SPRITE_BLOOD_SPOT, "chapter/1/blood_spot.png")
		FlxAssetsManager.AddImage(SPRITE_BLOOD_SCREEN, "chapter/1/blood_screen.png")
		
		FlxAssetsManager.AddSound(SOUND_BOY, "chapter/1/boy.mp3")
		FlxAssetsManager.AddSound(SOUND_GIRL, "chapter/1/girl.mp3")
		
		FlxAssetsManager.AddSound(SOUND_WHISTLE, "chapter/1/boy_whistle.mp3")
		FlxAssetsManager.AddSound(SOUND_BOY_CRY, "chapter/1/boy_cry.mp3")
		FlxAssetsManager.AddSound(SOUND_LAUGHTER, "chapter/1/girl_laughter.mp3")
		FlxAssetsManager.AddSound(SOUND_GIRL_SCREAM, "chapter/1/girl_scream.mp3")
		FlxAssetsManager.AddSound(SOUND_GIRL_FALL, "chapter/1/girl_fall.mp3")
		FlxAssetsManager.AddSound(SOUND_WINDOW, "chapter/1/window.mp3")
		FlxAssetsManager.AddSound(SOUND_ROAR, "chapter/1/roar.mp3")
		FlxAssetsManager.AddSound(SOUND_TRAIN_FALL, "chapter/1/train_fall.mp3")
	End Function
	
	Function Load:Void()
		Local preloader:FlxSprite = New FlxSprite()
		
		preloader.LoadGraphic(SPRITE_BOY)
		preloader.LoadGraphic(SPRITE_BOY_YARD)
		preloader.LoadGraphic(SPRITE_BOY_WINDOW)
		preloader.LoadGraphic(SPRITE_BOY_SHADOW)
		preloader.LoadGraphic(SPRITE_GIRL)
		preloader.LoadGraphic(SPRITE_TRAIN)
		preloader.LoadGraphic(SPRITE_TRAIN_BROKEN)
		preloader.LoadGraphic(SPRITE_TRAIN_FIXED)
		preloader.LoadGraphic(SPRITE_TRAIN_SHADOW)
		preloader.LoadGraphic(SPRITE_WHISTLE_IDLE)
		preloader.LoadGraphic(SPRITE_WHISTLE_ON)
		preloader.LoadGraphic(SPRITE_DEAD_BODY)
		preloader.LoadGraphic(SPRITE_BLOOD_GROUND)
		preloader.LoadGraphic(SPRITE_BLOOD_SPOT)
		preloader.LoadGraphic(SPRITE_BLOOD_SCREEN)
		
		preloader.Destroy()
	End Function

End Class