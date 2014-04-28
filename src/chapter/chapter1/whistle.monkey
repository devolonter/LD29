Strict

Import src.interactable.takeablesprite

Private

Import chapterassets

Public

Class Whistle Extends TakeableSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_WHISTLE_IDLE)
		
		name = "whistle"
		Description = "Some kind of a toy. This thing looks strange but it gives a whistling sound..."
	End Method

End Class