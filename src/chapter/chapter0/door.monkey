Strict

Import src.player
Import src.interactable.actionablesprite
Import src.interactable.action.leave

Private

Import chapterassets

Public

Class Door Extends ActionableSprite Implements ActionListener

	Field actions:StringMap<SpriteAction>

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_DOOR)
		
		actions = New StringMap<SpriteAction>()
		actions.Set("default", New SpriteAction("Closed door",[Action(New LeaveAction())]))
		actions.Set("open", New SpriteAction("Closed door",[Action(New OpenAction(Self))]))
		
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
		Game.Chapter.state.AddInteractable(Game.Chapter.state.park.triggerGoToOutdoors)
	End Method

End Class

Private

Class OpenAction Extends Action
	
	Method New(listener:ActionListener)
		Super.New("Open", listener)
	End Method

End Class

