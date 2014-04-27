Strict

Import flixel

Private

Import base

Public

Class Outdoors Extends BaseScene

	Method Create:Void()
		Super.Create()	
	End Method
	
	Method OnActivate:Void()
		FlxG.SetBgColor(FlxG.BLUE)
	End Method
	
End Class