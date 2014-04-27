Strict

Import flixel
Import src.assets

Class Star Extends FlxSprite
	
	Method New(x:Float, y:Float)
		Super.New(x, y, Assets.SPRITE_STAR)
		
		Local s:Float = FlxG.Random(0.5, 1.0)
		scale.Make(s, s)
	End Method
	
	Method Update:Void()
		Super.Update()
		
		Alpha = Sin(Millisecs() * 3) * 0.25 + 0.75
	End Method
	
	Method Draw:Void()
		Super.Draw()
	End Method

End Class