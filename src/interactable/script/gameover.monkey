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
		scene.background.Image = Assets.SCENE_PARK_DARK
		
		Game.Dialog.ToggleFullscreen()
		
		Local message:String
		
		If (Player.Ending = 1) Then
			message = "Ending: ~qInjury~q~n~nYou took away the train from the boy, but he took it back. The girl was in a rage..."
		ElseIf(Player.Ending = 3) Then
			message = "Ending: ~qMischief~q~n~nBill and Mary were brother and sister. One day their parents gave Mary a beautiful train. Bill was very envious, and once he took the gift away. But not only feeling of envy pushed him to this act.~n~nBill was the oldest child. And if he had no sister, all the toys were his, his alone. When Mary tried to return the train, Bill pushed her out of the window, and later lied to parents about what really happened. He was proud and enjoyed the fact that the train was only his, but the sister's death didn't bring him any happiness at all..."
		End If
		
		Game.Dialog.Push(message,[New Action("Start again", Self)])
	End Method
	
	Method Stop:Void()
		Detach()
	End Method
	
	Method OnAction:Void(action:Action)
		Player.Items.Clear()
		Player.Ending = 0
		
		Game.Dialog.ToggleFullscreen()
		
		Game.Chapter.state.Reset()
		
		Game.Chapter = New Chapter1(Game.Chapter.state)
		Game.Chapter.Create()
	End Method

End Class