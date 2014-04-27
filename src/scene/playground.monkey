Strict

Import flixel

Private

Import base

Public

Class Playground Extends BaseScene

	Method Create:Void()
		Super.Create()
	End Method
	
	Method OnActivate:Void()
		FlxG.SetBgColor(FlxG.WHITE)
	End Method
	
End Class