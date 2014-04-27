Strict

Import flixel

Import dialog

Import scene.park
Import scene.outdoors
Import scene.playground

Class PlayState Extends FlxState

	Field park:Park
	
	Field outdoors:Outdoors
	
	Field playground:Playground
	
	Field dialog:Dialog
	
	Method New()
		persistentUpdate = True
	End Method
	
	Method Create:Void()
		park = New Park()
		outdoors = New Outdoors()
		playground = New Playground()
		
		dialog = New Dialog()
		Add(dialog)
	
		SetSubState(park)
	End Method
	
	Method DoDraw:Void()
		If (GetSubState() = Null) Then
			Draw()
			Return
		End If

		GetSubState().Draw()
		Draw()
	End Method

End Class