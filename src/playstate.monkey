Strict

Import flixel

Import basestate
Import dialogbar

Import scene.park
Import scene.outdoors
Import scene.playground

Class PlayState Extends BaseState

	Field park:Park
	
	Field outdoors:Outdoors
	
	Field playground:Playground
	
	Field dialog:DialogBar
	
	Method Create:Void()
		Super.Create()
	
		park = New Park()
		outdoors = New Outdoors()
		playground = New Playground()
		
		dialog = New DialogBar()
	
		SetSubState(park)
	End Method

End Class