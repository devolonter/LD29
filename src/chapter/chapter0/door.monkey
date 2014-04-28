Strict

Import src.player

Import src.interactable.actionablesprite
Import src.interactable.action.leave
Import src.interactable.gotoscene

Import src.chapter.chapter1

Private

Import chapterassets

Public

Class Door Extends ActionableSprite Implements ActionListener

	Field actions:StringMap<SpriteAction>

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_DOOR)
		
		actions = New StringMap<SpriteAction>()
		actions.Set("default", New SpriteAction("Closed door",[Action(New LeaveAction())]))
		actions.Set("open", New SpriteAction("Closed door",[Action(New LeaveAction()), New Action("Open", Self)]))
		
		SetAction(actions.Get("default"))
	End Method
	
	Method OnInteract:Void()
		If (Player.Items.Contains("key")) Then
			SetAction(actions.Get("open"))
		End If
	
		Super.OnInteract()
	End Method
	
	Method OnAction:Void(action:Action)
		Kill()
		Game.Chapter.state.AddInteractable(New StartGame(Game.Chapter.state, Game.Chapter.state.outdoors))
	End Method

End Class

Private

Class StartGame Extends GoToScene

	Method New(parent:PlayState, scene:BaseScene)
		Super.New(parent, scene)
		Self.Reset(FlxG.Width - width, FlxG.Height - Game.SCREEN_PADDING - height)
	End Method
	
	Method OnInteract:Void()		
		Game.Chapter = New Chapter1(parent)
		Game.Chapter.Create()
		
		Super.OnInteract()
	End Method

End Class

