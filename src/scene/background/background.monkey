Strict

Import flixel

Private

Import star

Public

Class Background Extends FlxGroup

	Field image:FlxSprite

	Method New(x:Float, y:Float)
		image = New FlxSprite(x, y)
		Add(image)
	End Method
	
	Method Image:Void(graphics:String) Property
		image.LoadGraphic(graphics)
	End Method
	
	Method AddStars:Void(stars:Int[])
		Local l:Int = stars.Length()
		
		For Local i:Int = 0 Until l Step 2
			Add(New Star(image.x + stars[i], image.y + stars[i + 1]))
		Next
	End Method

End Class