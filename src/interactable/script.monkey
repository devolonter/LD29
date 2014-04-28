Strict

Import flixel
Import src.scene.base

Class Script Extends FlxBasic

	Field scene:BaseScene

	Method New(scene:BaseScene)
		Attach(scene)
	End Method
	
	Method OnAttach:Void()
	End Method
	
	Method OnDetach:Void()
	End Method
	
	Method Run:Void()
	End Method
	
	Method Stop:Void()		
	End Method
	
	Method Attach:Void(scene:BaseScene)
		If (scene.script) Then
			scene.script.OnDetach()
		End If
		
		scene.script = Self
		Self.scene = scene
	End Method

	
	Method Detach:Void()
		If (scene.script = Self) Then
			OnDetach()
			scene.script = Null
		End If
		
		scene = Null
	End Method

End Class