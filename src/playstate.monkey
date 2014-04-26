Strict

Import flixel

Import scene.park
Import scene.outdoors
Import scene.playground

Class PlayState Extends FlxState

	Field park:Park
	
	Field outdoors:Outdoors
	
	Field playground:Playground
	
	Method Create:Void()
		park = New Park()
		outdoors = New Outdoors()
		playground = New Playground()
	
		SetSubState(park)
	End Method

End Class