Strict

Import flixel

Private

Import chapterassets

Public

Class Blood Extends FlxSprite Implements FlxSpriteRenderer
	
	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_BLOOD_SCREEN)
		SetRenderer(Self)
		height = 0
	End Method
	
	Method OnSpriteBind:Void(sprite:FlxSprite)
	End Method
	
	Method OnSpriteUnbind:Void()
	End Method
	
	Method OnSpriteRender:Void(x:Float, y:Float)
		If (Int(height) <= 0) Return
		DrawImageRect(Pixels, x, y, 0, Pixels.Height() -height, width, height)
	End Method

End Class