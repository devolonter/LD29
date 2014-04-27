Strict

Import src.chapter
Import src.interactable.actionablesprite


Class Chapter1 Extends Chapter

	Method New(state:PlayState)
		Super.New(state)
	End Method
	
	Method Create:Void()
		Super.Create()
		
		state.park.AddItem(New Item(50, Game.SCREEN_PADDING + 50))
		
		state.SetSubState(state.park)
	End Method

End Class

Class Item Extends ActionableSprite

	Method New(x:Float, y:Float)
		Super.New(x, y)
		
		width = 100
		height = 100
		Color = FlxG.PINK
		
		SetRenderer(New RectSpriteRenderer())
		
		SetAction("Hello",[New Action("Yes", Null)])
	End Method

End Class