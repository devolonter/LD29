Strict

Import flixel
Import src.interactable.takeablesprite

Private

Import chapterassets

Public

Class Train Extends FlxSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_TRAIN)
		Reset(x, y)
	End Method
	
	Method Reset:Void(x:Float, y:Float)
		Super.Reset(x, y)
		
		Local path:FlxPath = New FlxPath()
		path.AddPoint(New FlxPoint(x + width / 2, y), True)
		path.AddPoint(New FlxPoint(x + 60, y), True)
		
		FollowPath(path, 20, FlxObject.PATH_LOOP_FORWARD | PATH_HORIZONTAL_ONLY)
	End Method

End Class

Class BrokenTrain Extends TakeableSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_TRAIN_BROKEN)
		
		name = "train.broken"
		Description = "It's a train. At least it was a train. It must have fallen from a great height"
	End Method

End Class
