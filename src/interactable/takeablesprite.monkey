Strict

Import actionablesprite
Import src.interactable.action.take
Import src.interactable.action.leave
Import src.player


Class TakeableSprite Extends ActionableSprite Implements ActionListener
	
	Method New(x:Float = 0, y:Float = 0, simpleGraphic:String = "")
		Super.New(x, y, simpleGraphic)
		
		_action = New SpriteAction()
		_action.actions =[Action(New LeaveAction()), Action(New TakeAction(Self))]
		
		SetAction(_action)
	End Method
	
	Method Description:Void(desc:String) Property
		_action.message = desc
	End Method
	
	Method OnAction:Void(action:Action)
		Player.Items.Insert(name)
		Kill()
	End Method
	
	Private
	
	Field _action:SpriteAction

End Class