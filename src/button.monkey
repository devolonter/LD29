Strict

Import flixel
Import assets

Class Button Extends FlxButton
	
	Method New(x:Float, y:Float, label:String)
		Super.New(x, y, label)
		Self.label.SetFormat(Assets.FONT_BUTTON, 22)
		
		width = Self.label.width
		height = Self.label.height
	End Method
	
	Method Label:Void(value:String) Property
		label.Text = value
		width = label.width
		height = label.height
	End Method
	
	Method Update:Void()
		Super.Update()
		
		Select(status)
			Case NORMAL
				label.Color = $FFFFCC00
				
			Case PRESSED
				label.Alpha = .5
				label.y += 1
			
			Default
				label.Color = FlxG.WHITE

		End Select
	End Method
	
	Method Draw:Void()
		label.Draw()
	End Method

End Class