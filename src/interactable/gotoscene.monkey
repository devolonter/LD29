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
		
		width = 70
		height = (FlxG.Height - Game.SCREEN_PADDING * 2) / 2
		_enabled = True
	End Method
	
	Method OnInteract:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
		parent.SetSubState(scene)
	End Method
	
	Method OnFocus:Void()
		FlxG.Mouse.Show(Assets.CURSOR_GO)
		_active = True
	End Method
	
	Method OnBlur:Void()
		FlxG.Mouse.Show(Assets.CURSOR_DEFAULT)
		_active = False
	End Method
	
	Method IsActive:Bool()
		Return _active
	End Method
	
	Method Flush:Void()
		_active = False
	End Method
	
	Method Enable:Void()
		_enabled = True
	End Method
	
	Method Disable:Void()
		_enabled = False
	End Method
	
	Method Enabled:Bool()
		Return _enabled = True
	End Method
	
	Private
	
	Field _active:Bool
	
	Field _enabled:Bool

End Class