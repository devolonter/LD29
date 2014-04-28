Strict

Import chapter1
Import whistle
Import src.interactable.script

Private

Import chapterassets

Public

Class ScriptBoyInYard Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Chapter1.Boy.Reset(120, 172 + Game.SCREEN_PADDING)
		Chapter1.Boy.LoadGraphic(ChapterAssets.SPRITE_BOY_YARD)
		
		Game.Chapter.state.playground.RemoveItem(Chapter1.Boy)
		
		Game.Chapter.state.outdoors.AddItem(Chapter1.Boy)
		Game.Chapter.state.outdoors.AddItem(New Whistle(492, 276 + Game.SCREEN_PADDING))
		
		Chapter1.Boy.SetAction(Chapter1.Boy.actions.Get("question.whistle"))
	End Method
	
	Method Stop:Void()
		Detach()
	End Method

End Class

Class ScriptGirlDisapear Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Chapter1.Boy.Alpha = 1
		Interactable(Chapter1.Boy).Disable()
	
		Chapter1.Boy.Reset(100, Game.SCREEN_PADDING + 135)
		Chapter1.Boy.AddWhistle()
		Chapter1.Boy.LoadGraphic(ChapterAssets.SPRITE_BOY)
		
		Chapter1.Boy.train.Reset(220, Game.SCREEN_PADDING + 250)
		
		Game.Chapter.state.outdoors.RemoveItem(Chapter1.Boy)
		Game.Chapter.state.playground.AddItem(Chapter1.Boy)
		
		Chapter1.Girl.Kill()
	End Method
	
	Method Stop:Void()
		Detach()
	End Method

End Class

Class ScriptSamaraGirl Extends Script
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method

End Class