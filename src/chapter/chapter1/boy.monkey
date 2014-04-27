Strict

Import src.interactable.actionablesprite
Import src.interactable.action.leave

Private

Import assets

Public

Class Boy Extends ActionableSprite

	Field actions:StringMap<SpriteAction>

	Method New(x:Float, y:Float)
		Super.New(x, y, ChapterAssets.SPRITE_BOY)
		
		actions = New StringMap<SpriteAction>()
		actions.Set("default", New SpriteAction("Hi! I'm a boy!",[Action(New LeaveAction())]))
		
		SetAction(actions.Get("default"))
	End Method

End Class

