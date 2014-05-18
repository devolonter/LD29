Strict

Import flixel
Import src.interactable.takeablesprite

Private

Import chapterassets

Public

Class Train Extends FlxSprite
	
	Field shadow:FlxSprite
	
	Field dx:Float
	
	Field startX:Float

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_TRAIN)
		shadow = New FlxSprite(x, y, ChapterAssets.SPRITE_TRAIN_SHADOW)
		
		Reset(x, y)
	End Method
	
	Method Reset:Void(x:Float, y:Float)
		Super.Reset(x, y)
		shadow.Reset(x + (width - shadow.width) * 0.5, y + height - shadow.height * 0.5)
		
		Local path:FlxPath = New FlxPath()
		path.AddPoint(New FlxPoint(x + width / 2, y), True)
		path.AddPoint(New FlxPoint(x + 60, y), True)
		
		dx = path.nodes.Get(1).x - path.nodes.Get(0).x
		startX = path.nodes.Get(0).x
		
		FollowPath(path, 20, FlxObject.PATH_LOOP_FORWARD | PATH_HORIZONTAL_ONLY)
	End Method
	
	Method Update:Void()
		Super.Update()
		shadow.x = (x + (width - shadow.width) * 0.5) + 10 * (Abs(startX - x) / dx)
		shadow.scale.x = 1 + 0.1 * (Abs(startX - x) / dx)
	End Method
	
	Method Draw:Void()
		shadow.Draw()
		Super.Draw()
	End Method

End Class

Class BrokenTrain Extends TakeableSprite

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_TRAIN_BROKEN)
		
		name = "train.broken"
		Description = "It's a train. At least it was a train. It must have fallen from a great height"
	End Method

End Class
