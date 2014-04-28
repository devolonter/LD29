Strict

Import flixel
Import interactable
Import action
Import src.assets
Import src.game

Class ActionableSprite Extends FlxSprite Implements Interactable

	Field name:String

	Field action:SpriteAction

	Method New(x:Float = 0, y:Float = 0, simpleGraphic:String = "")
		Super.New(x, y, simpleGraphic)
	End Method
	
	Method SetAction:Void(action:SpriteAction)
		Self.action = action
	End Method

	Method OnInteract:Void()
		Game.Dialog.Push(action.message, action.actions)
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
	End Method
	
	Method OnFocus:Void()
		FlxG.Mouse.Show(Assets.CURSOR_VIEW)
	End Method
	
	Method OnBlur:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
	End Method
	
	Method Kill:Void()
		Game.Chapter.state.RemoveInteractable(Self)
		Super.Kill()
	End Method

End Class

Class SpriteAction

	Method New(message:String, actions:Action[])
		Self.message = message
		Self.actions = actions
	End Method

	Field message:String
	
	Field actions:Action[]

End Class