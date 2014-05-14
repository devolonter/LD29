Strict

Import src.button

Class CreditsButton Extends Button Implements FlxButtonOverListener, FlxButtonOutListener
	
	Method New(x:Float, y:Float)
		Super.New(x, y, "credits")
		
		label.SetWidth(90)
		label.Alignment = FlxText.ALIGN_CENTER
		
		width = Self.label.width
		height = Self.label.height
		
		onOver = Self
		onOut = Self
	End Method
	
	Method Update:Void()
		Super.Update()
		
		Select(status)
			Case NORMAL
				label.Color = FlxG.WHITE
				
			Case PRESSED
				label.Alpha = .5
				label.y += 1
			
			Default
				label.Color = $FFada495
				

		End Select
	End Method
	
	Method OnButtonOver:Void(button:FlxButton)
		FlxG.Mouse.Show(Assets.CURSOR_VIEW)
	End Method
	
	Method OnButtonOut:Void(button:FlxButton)
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)		
	End Method

End Class