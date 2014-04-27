Strict

Import flixel
Import interactable
Import src.assets

Class ActionableSprite Extends FlxSprite Implements Interactable

	Method New(x:Float = 0, y:Float = 0, simpleGraphic:String = "")
		Super.New(x, y, simpleGraphic)
	End Method

	Method OnInteract:Void()
	
	End Method
	
	Method OnFocus:Void()
		FlxG.Mouse.Show(Assets.CURSOR_VIEW)
	End Method
	
	Method OnBlur:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
	End Method

End Class