Strict

Import src.interactable.takeablesprite

Private

Import chapterassets

Public

Class Key Extends TakeableSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_KEY)
		
		name = "key"
		Description = "A rusty key. It almost crumbles in my hands"
	End Method
	
	Method OnInteract:Void()
		If (Not FlxG.Music Or Not FlxG.Music.active) Then
			Game.Creak.FadeOut(2)
			FlxG.PlayMusic(Assets.MUSIC_WHISTLE)
		End If
		
		Super.OnInteract()
	End Method

End Class

