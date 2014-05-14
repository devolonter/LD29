Strict

Import src.button
Import src.game

Private

Import chapterassets

Public

Class CreditsButton Extends Button Implements FlxButtonOverListener, FlxButtonOutListener, FlxButtonClickListener

	Global Instance:CreditsButton
	
	Method New(x:Float, y:Float)
		Super.New(x, y, "credits")
		
		label.SetWidth(90)
		label.Alignment = FlxText.ALIGN_CENTER
		
		width = Self.label.width
		height = Self.label.height
		
		onOver = Self
		onOut = Self
		onUp = Self
		
		Instance = Self
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
	
	Method OnButtonClick:Void(button:FlxButton)
		If ( Not _Window) _Window = New CreditsWindow()
		_Window.Show()
	End Method

End Class

Class CreditsWindow Extends FlxGroup
	
	Method New()
		Local bg:FlxSprite = New FlxSprite()
		
		bg.width = 350
		bg.height = 300
		bg.Alpha = 0.75
		bg.Color = 0
		
		bg.Reset( (FlxG.Width - bg.width) * 0.5, (FlxG.Height - bg.height) * 0.5)
		bg.SetRenderer(New RectSpriteRenderer())
		
		Local label:FlxText = New FlxText(bg.x + 5, bg.y + 5, bg.width - 10, "CREDITS")
		label.SetFormat(Assets.FONT_DIALOG, 18, $FFada495, FlxText.ALIGN_CENTER)
		
		Local credits:FlxSprite = New FlxSprite(0, 0, ChapterAssets.SPRITE_CREDITS)
		credits.Reset( (FlxG.Width - credits.width) * 0.5, label.y + label.height + 25)
		credits.angularVelocity = 5
		
		Add(bg)
		Add(label)
		Add(credits)
		
		Game.Chapter.state.park.AddItem(Self)
	End Method
	
	Method Update:Void()
		Super.Update()
	
		If (FlxG.Mouse.JustPressed()) Then
			Hide()
		End If
	End Method
	
	Method Show:Void()
		visible = True
		active = True
		Game.Chapter.state.Block()
	End Method
	
	Method Hide:Void()
		visible = False
		active = False
		Game.Chapter.state.Unblock()
	End Method

End Class

Private

Global _Window:CreditsWindow