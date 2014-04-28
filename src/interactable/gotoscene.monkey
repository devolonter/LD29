Strict

Import flixel

Import interactable
Import src.assets
Import src.game

Class GoToScene Extends FlxObject Implements Interactable

	Field parent:PlayState
	
	Field scene:BaseScene
	
	Method New(parent:PlayState, scene:BaseScene)
		Self.parent = parent
		Self.scene = scene
		
		width = 100
		height = (FlxG.Height - Game.SCREEN_PADDING * 2) / 2
	End Method
	
	Method OnInteract:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
		parent.SetSubState(scene)
	End Method
	
	Method OnFocus:Void()
		FlxG.Mouse.Show(Assets.CURSOR_GO)
	End Method
	
	Method OnBlur:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
	End Method

End Class