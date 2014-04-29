Strict

Import flixel
Import src.interactable.script
Import src.game
Import src.player


Class ScriptGameOver Extends Script Implements ActionListener
	
	Method New(scene:BaseScene)
		Super.New(scene)
	End Method
	
	Method Run:Void()
		Game.Chapter.state.ClearInteractable()
		Game.Dialog.Push("Thanks for playing!",[New Action("Start again", Self)])
	End Method
	
	Method Stop:Void()
		Detach()
	End Method
	
	Method OnAction:Void(action:Action)
		Player.Items.Clear()
		Game.Chapter.state.Reset()
		
		Game.Chapter = New Chapter1(Game.Chapter.state)
		Game.Chapter.Create()
	End Method

End Class