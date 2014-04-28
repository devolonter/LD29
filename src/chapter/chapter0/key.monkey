Strict

Import src.interactable.takeablesprite

Private

Import chapterassets

Public

Class Key Extends TakeableSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_KEY)
		
		name = "key"
		Description = "Some key"
	End Method

End Class

