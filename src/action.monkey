Strict

Import flixel

Class Action Implements FlxButtonClickListener
	
	Field title:String

	Field listener:ActionListener
	
	Method New(title:String, listener:ActionListener)
		Self.title = title
		Self.listener = listener
	End Method
	
	Method OnButtonClick:Void(button:FlxButton)
		listener.OnAction(Self)
	End Method

End Class

Interface ActionListener
	
	Method OnAction:Void(action:Action)

End Interface