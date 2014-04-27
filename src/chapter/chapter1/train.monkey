Strict

Import flixel

Private

Import assets

Public

Class Train Extends FlxSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_TRAIN)
		
		Local path:FlxPath = New FlxPath()
		path.AddPoint(New FlxPoint(x + width / 2, y), True)
		path.AddPoint(New FlxPoint(x + 50, y), True)
		
		FollowPath(path, 20, FlxObject.PATH_LOOP_FORWARD | PATH_HORIZONTAL_ONLY)
	End Method

End Class