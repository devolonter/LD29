Strict

Import flixel
Import game
Import src.interactable.action

Class Dialog Extends FlxGroup

	Field background:FlxSprite

	Field phrase:FlxText
	
	Field actions:FlxButton[2]
	
	Method New()
		background = New FlxSprite(20, FlxG.Height - Game.SCREEN_PADDING - 50)
		
		background.width = 600
		background.height = 50
		
		background.SetRenderer(New RectSpriteRenderer())
		
		background.Color = FlxG.BLACK
		background.Alpha = 0.5
		
		Add(background)
	
		phrase = New FlxText(background.x + 10, background.y + 5, FlxG.Width - 40, "<< PHRASE >>")
		phrase.SetFormat(FlxText.SYSTEM_FONT, 12, FlxG.WHITE)
		
		Add(phrase)
		
		Local l:Int = actions.Length()
		Local title:String
		
		For Local i:Int = 0 Until l
			If (i = 0) Then
				title = "Yes"
			Else
				title = "No"
			End If
		
			actions[i] = New FlxButton(background.x + background.width - i * 100 - 90, FlxG.Height - 50, title)
			actions[i].visible = False
			Add(actions[i])
		Next
		
		visible = False
	End Method
	
	Method Push:Void(message:String, actions:Action[])
		phrase.Text = message
		
		Local l:Int = Self.actions.Length()
		
		For Local i:Int = 0 Until l
			Self.actions[i].visible = False
		Next
		
		l = actions.Length()
		
		For Local i:Int = 0 Until l
			Self.actions[i].visible = True
			Self.actions[i].label.Text = actions[i].title
			Self.actions[i].onUp = actions[i]
		Next
		
		visible = True
	End Method
	
	Method Pop:Void()
		visible = False
	End Method

End Class