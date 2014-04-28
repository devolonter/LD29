Strict

Import flixel
Import game
Import button
Import src.interactable.action

Class Dialog Extends FlxGroup

	Field background:FlxSprite

	Field phrase:FlxText
	
	Field actions:Button[2]
	
	Method New()
		background = New FlxSprite(20, FlxG.Height - Game.SCREEN_PADDING - 50)
		
		background.width = 600
		background.height = 50
		
		background.SetRenderer(New RectSpriteRenderer())
		
		background.Color = FlxG.BLACK
		background.Alpha = 0.5
		
		Add(background)
	
		phrase = New FlxText(background.x + 10, background.y + 3, FlxG.Width - 50, "<< PHRASE >>")
		phrase.SetFormat(Assets.FONT_DIALOG, 16, FlxG.WHITE)
		
		Add(phrase)
		
		Local l:Int = actions.Length()
		
		For Local i:Int = 0 Until l
			actions[i] = New Button(0, FlxG.Height - 50, " ")
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
		
		Local offset:Int = background.x + background.width - 10
		
		For Local i:Int = 0 Until l
			Self.actions[i].visible = True
			Self.actions[i].Label = actions[i].title
			Self.actions[i].onUp = actions[i]
			
			offset -= Self.actions[i].width + 10
			Self.actions[i].x = offset
			Self.actions[i].Update()
		
		Next
		
		visible = True
	End Method
	
	Method Pop:Void()
		visible = False
	End Method

End Class