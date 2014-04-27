Strict

Import flixel
Import interactable
Import src.assets
Import src.action
Import src.game

Class ActionableSprite Extends FlxSprite Implements Interactable

	Field action:SpriteAction

	Method New(x:Float = 0, y:Float = 0, simpleGraphic:String = "")
		Super.New(x, y, simpleGraphic)
		action = New SpriteAction()
	End Method
	
	Method SetAction:Void(message:String, actions:Action[])
		action.message = message
		action.actions = actions
	End Method

	Method OnInteract:Void()
		Game.Dialog.Push(action.message, action.actions)
	End Method
	
	Method OnFocus:Void()
		FlxG.Mouse.Show(Assets.CURSOR_VIEW)
	End Method
	
	Method OnBlur:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
	End Method

End Class

Private

Class SpriteAction

	Field message:String
	
	Field actions:Action[]

End Class